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
     * 荣誉会员
     * @return string
     * @throws \think\Exception
     */
    public function common()
    {
        return $this->view->fetch();
    }

    /**
     * 黑砖会员
     */
    public function silver()
    {
        return $this->view->fetch();
    }

    /**
     * 白金会员
     */
    public function golden()
    {
        return $this->view->fetch();
    }

    public function vip_type($vid = null)
    {
        $this->assign('vip_type', $vid);
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
            'total_fee' => $vipData['money']*100,
            'trade_type' => 'JSAPI',
            'openid' => $wechat_user['openid'],
        ];

        $result = $this->wxPay->order->unify($order);

        if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
            $prepayId = $result['prepay_id'];

            $this->orderModel->order_sn     = $out_trade_no;
            $this->orderModel->vid          = $vipData['vid'];
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
        }
        $json = $this->wxPay->jssdk->bridgeConfig($prepayId);
        $conf = $this->app->jssdk->buildConfig(array('translateVoice','chooseWXPay','getBrandWCPayRequest','onMenuShareTimeline', 'onMenuShareAppMessage'), false, false, true);
        $this->assign(['jsorder' => $json,'vipData' => $vipData,'conf' => $conf,'order_sn' => $out_trade_no]);
        return $this->view->fetch();
    }

    /**
     * 兑换码支付
     */
    public function buy_coupon()
    {
        $CouponCode = model('CouponCode');
        $order_sn = input('order_sn');
        $code = input('code');
        $res['code'] = 0;
        $order_info = $this->orderModel->where('order_sn', $order_sn)->find();
        if ($order_info){
            if ($CouponCode->checkCode($code)){
                $order_info->pay_type = 2;
                $order_info->code = $code;
                $order_info->status = 1;
                $order_info->pay_time = time();
                if ($order_info->save()){
                    $vip_thing = 0;
                    $end_time = strtotime("+90days");
                    $vip_count = 5;
                    model('UserVip')->user_add_vip($order_info->user_id, $order_info->vid, $order_info->goods_name, $end_time, $vip_count, $vip_thing);
                    $res['code'] = 1;
                }
            }
        }
        return json($res);
    }


    /**
     * 会员支付回调
     * @return mixed
     */
    public function notify(){
        $response = $this->wxPay->handlePaidNotify(function($message, $fail){
            $out_trade_no = $message['out_trade_no'];
            $order_info = model('Order')->where('order_sn', $out_trade_no)->find();
            $order_info->pay_type = 1;
            if(empty($order_info)){
                return false;
            }
            if($order_info['pay_time']>0){
                return true;
            }
            if($message['return_code'] === 'SUCCESS'){
                // 用户是否支付成功
                if ($message['result_code'] === 'SUCCESS') {
                    $order_info->transaction_id = $message['transaction_id'];
                    $order_info->status         = 1;
                    $order_info->pay_time       = time();
                }
            }else{
                return $fail('通信失败，请稍后再通知我');
            }
            if($order_info->save()){
                $end_time = 0;
                $vip_count = 0;
                $vip_thing = 0;
                if ($order_info->vid == 1){
                    $end_time = strtotime("+90days");
                    $vip_count = 5;
                }elseif($order_info->vid == 2){
                    $vip_thing = 1;
                }
                model('UserVip')->user_add_vip($order_info->user_id, $order_info->vid, $order_info->goods_name, $end_time, $vip_count, $vip_thing);
                return true;
            }else{
                return false;
            }
            return true; // 返回处理完成
        });
        $response->send(); // return $response;
    }

}
