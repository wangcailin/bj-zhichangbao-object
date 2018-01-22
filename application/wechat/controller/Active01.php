<?php

namespace app\wechat\controller;

use app\common\controller\Api;
use EasyWeChat\Factory;

class Active01 extends Api
{
    private $wxPay = null;
    private $orderModel = null;
    public function _initialize()
    {
        parent::_initialize();
        $this->orderModel = model('Order');
        $payConfig = [
            // 必要配置
            'app_id'             => 'wxa0afc75ebe2d5871',
            'secret'             => '75cbdd6b7e9b58e90f1c5e8c8de802f9',
            'mch_id'             => '1401831202',
            'key'                => 'BGQv5ebUj5Ug8FLJMyPg8ZvKoRxqYMlf',
            'cert_path'          => 'wxpay/apiclient_cert.pem',
            'key_path'           => 'wxpay/apiclient_key.pem',
            'notify_url'         => 'http://www.zhichangbb.com/wechat/Active01/notify',
        ];
        $this->wxPay = Factory::payment($payConfig);
    }

    /**
     * 扫码关注
     * @return string
     */
    public function qrcode()
    {
        return $this->view->fetch();
    }

    /**
     * 领取红包
     */
    public function redPacket()
    {
        return $this->view->fetch();
    }

    /**
     * 输入手机号领取
     * @return string
     */
    public function zcbfree()
    {
        return $this->view->fetch();
    }
    public function zcbfreeCheck()
    {
        $data = [];
        $userModel = model('User');
        $mobile = input('mobile');
        if ($res = $userModel->where('mobile', $mobile)->find()){
            if ($res->vip == '0'){
                $res::get($res->id);
                $res->vip = 1;
                $res->vip_time = strtotime('+3month');
                $res->save();
                $data['code'] = 1;
            }else{
                $data['code'] = 0;
            }
        }else{
            $data = [
                'username'      => 'Wx_'.get_random_str('10'),
                'mobile'        => $mobile,
                'vip'           => 1,
                'vip_time'      => strtotime('+3month'),
                'create_time'   => time(),
                'update_time'   => time()
            ];
            $userModel->save($data);
            $data['code'] = 1;
        }
        return json($data);
    }

    /**
     * 冲一年会员送一年视频会员
     */
    public function vip_video()
    {
        $user_id = session('user_id');
        $wechat_user = session('wechat_user');

        $out_trade_no = date('Ymd', time()).rand(10000,99999);
        $order = [
            'body' => '职场保-包年会员-充值',
            'out_trade_no' => $out_trade_no,
            'total_fee' => 1,
            'trade_type' => 'JSAPI',
            'openid' => $wechat_user['openid'],
        ];

        $result = $this->wxPay->order->unify($order);

        if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
            $prepayId = $result['prepay_id'];

            $this->orderModel->order_sn     = $out_trade_no;
            $this->orderModel->vid          = 1;
            $this->orderModel->prepay_id    = $prepayId;
            $this->orderModel->user_id      = $user_id;
            $this->orderModel->goods_name   = '包年荣誉会员';
            $this->orderModel->amount       = 39.6;
            $this->orderModel->status       = 0;
            $this->orderModel->add_time     = time();
            $this->orderModel->save();
            if (!$this->orderModel->id){
                $this->error('生成订单失败!', '/wechat/vip/index');
            }
        }
        $json = $this->wxPay->jssdk->bridgeConfig($prepayId);
        $conf = $this->app->jssdk->buildConfig(array('translateVoice','chooseWXPay','getBrandWCPayRequest','onMenuShareTimeline', 'onMenuShareAppMessage'), false, false, true);
        $this->assign(['jsorder' => $json,'conf' => $conf,'order_sn' => $out_trade_no]);
        return $this->view->fetch();
    }

    /**
     * 活动支付回调
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
                $vip_thing = 0;
                $end_time = strtotime("+365days");
                $vip_count = 5;
                $data = [
                    'user_id'   => $order_info->user_id,
                    'vid'       => $order_info->vid,
                    'vip_name'  => $order_info->goods_name,
                    'vip_time'  => time(),
                    'vip_time_end'  => $end_time,
                    'vip_count'  => $vip_count,
                    'vip_count_user'  => 0,
                    'vip_thing'       => $vip_thing,
                    'vip_thing_user'    => 0,
                ];
                model('UserVip')->save($data);
                return true;
            }else{
                return false;
            }
            return true; // 返回处理完成
        });
        $response->send(); // return $response;
    }

}
