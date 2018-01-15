<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;
use EasyWeChat\Factory;

class Vip extends Wechat
{
    protected $model = null;
    protected $orderModel = null;
    protected $wxPay = null;
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('UserVip');
        $this->orderModel = model('Order');
        $this->assign('menu', 'zcb');

        $payConfig = [
            // 必要配置
            'app_id'             => 'wxa0afc75ebe2d5871',
            'secret'             => '75cbdd6b7e9b58e90f1c5e8c8de802f9',
            'mch_id'             => '1401831202',
            'key'                => 'BGQv5ebUj5Ug8FLJMyPg8ZvKoRxqYMlf',
            'cert_path'          => 'wxpay/apiclient_cert.pem',
            'key_path'           => 'wxpay/apiclient_key.pem',
            'notify_url'         => 'http://www.zhichangbb.com/wechat/vip/notify',
        ];
        $this->wxPay = Factory::payment($payConfig);

    }

    public function index()
    {
        return $this->view->fetch();
    }

    /**
     * 大众会员
     * @return string
     * @throws \think\Exception
     */
    public function common()
    {
        return $this->view->fetch();
    }

    /**
     * 铜牌会员
     */
    public function bronze()
    {
        return $this->view->fetch();
    }

    /**
     * 银牌会员
     */
    public function silver()
    {
        return $this->view->fetch();
    }

    /**
     * 金牌会员
     */
    public function golden()
    {
        return $this->view->fetch();
    }

    /**
     * 会员支付
     */
    public function buy()
    {
        $user_id = session('user_id');
        $vid     = input('vid');
        $wechat_user = session('wechat_user');
        if ($user_id != input('uid')){
            return $this->app->oauth->redirect()->send();
        }

        $vipData = [];
        $vipList = $this->model->vipData;
        foreach ($vipList as $v){
            if ($v['vid'] == $vid){
                $vipData = $v;
            }
        }
        $out_trade_no = date('Ymd', time()).rand(10000,99999);
        $order = [
            'body' => '职场保-'.$vipData['name'].'充值',
            'out_trade_no' => $out_trade_no,
            'total_fee' => 1,
            'trade_type' => 'JSAPI',
            'openid' => $wechat_user['openid'],
        ];



        $result = $this->wxPay->order->unify($order);

        if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
            $prepayId = $result['prepay_id'];

            $this->orderModel->order_sn     = $out_trade_no;
            $this->orderModel->prepay_id    = $prepayId;
            $this->orderModel->user_id      = $user_id;
            $this->orderModel->goods_name   = $vipData['name'];
            $this->orderModel->amount       = $vipData['money'];
            $this->orderModel->status       = 0;
            $this->orderModel->add_time     = time();
            $this->orderModel->save();
            if (!$this->orderModel->id){
                $this->error('生成订单失败!', '/wechat/vip/index');
            }
            session('order_id', $this->orderModel->id);
        }
        $json = $this->wxPay->jssdk->bridgeConfig($prepayId);
        $conf = $this->app->jssdk->buildConfig(array('translateVoice','chooseWXPay','getBrandWCPayRequest','onMenuShareTimeline', 'onMenuShareAppMessage'), false, false, true);
        $this->assign(['jsorder' => $json,'vipData' => $vipData,'conf' => $conf]);
        return $this->view->fetch();
    }


    /**
     * 会员支付回调
     * @return mixed
     */
    public function notify(){
        $response = $this->wxPay->handlePaidNotify(function($message, $fail){

            @file_put_contents('fail.txt', json_encode($fail));
            @file_put_contents('notify.txt',json_encode($message));

            $out_trade_no = $message['out_trade_no'];
            $order_info = $this->orderModel->where('order_sn', $out_trade_no)->find();

            if(empty($order_info)){
                return false;
            }
            if($order_info['pay_time']>0){
                return true;
            }

            ///////////// <- 建议在这里调用微信的【订单查询】接口查一下该笔订单的情况，确认是已经支付 /////////////

            if($message['return_code'] === 'SUCCESS'){

                // 用户是否支付成功
                if ($message['result_code'] === 'SUCCESS') {
                    $order_info->transaction_id = $message['transaction_id'];
                    $order_info->status         = 1;
                    $order_info->pay_time       = time();

                    // 用户支付失败
                } elseif ($message['result_code'] === 'FAIL') {
                    $order_info->status = 3;
                }

            }else{
                return $fail('通信失败，请稍后再通知我');
            }
            if($order_info->save()){
                return true;
            }else{
                return false;
            }
            return true; // 返回处理完成
        });

        $response->send(); // return $response;
    }

}
