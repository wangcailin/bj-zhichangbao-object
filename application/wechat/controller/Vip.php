<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;
use EasyWeChat\Factory;

class Vip extends Wechat
{
    protected $model = null;
    protected $orderModel = null;
    protected $payConfig = null;
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
            'key'                => 'BGQv5ebUj5Ug8FLJMyPg8ZvKoRxqYMlf',   // API 密钥
            'cert_path'          => 'wxpay/apiclient_cert.pem', // XXX: 绝对路径！！！！
            'key_path'           => 'wxpay/apiclient_key.pem',      // XXX: 绝对路径！！！！
            'notify_url'         => 'http://www.zhichangbb.com//api/wechatbase/pay_callback',     // 你也可以在下单时单独设置来想覆盖它
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
        $order = [
            'body' => '职场保-'.$vipData['name'].'充值',
            'out_trade_no' => date('Ymd', time()).rand(10000,99999),
            'total_fee' => 1,
            'trade_type' => 'JSAPI',
            'openid' => $wechat_user['openid'],
        ];



        $result = $this->wxPay->order->unify($order);

        if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
            $prepayId = $result['prepay_id'];

            $this->orderModel->order_sn     = $prepayId;
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
    public function pay_callback()
    {
        $response = $this->wxPay->handleNotify(function($notify, $successful){
            var_dump($notify, $successful);die;
            // 使用通知里的 "微信支付订单号" 或者 "商户订单号" 去自己的数据库找到订单
            $order = ($notify->out_trade_no);
            if (!$order) { // 如果订单不存在
                return 'Order not exist.'; // 告诉微信，我已经处理完了，订单没找到，别再通知我了
            }
            // 如果订单存在
            // 检查订单是否已经更新过支付状态
            if ($order->paid_at) { // 假设订单字段“支付时间”不为空代表已经支付
                return true; // 已经支付成功了就不再更新了
            }
            // 用户是否支付成功
            if ($successful) {
                // 不是已经支付状态则修改为已经支付状态
                $order->paid_at = time(); // 更新支付时间为当前时间
                $order->status = 'paid';
            } else { // 用户支付失败
                $order->status = 'paid_fail';
            }
            $order->save(); // 保存订单
            return true; // 返回处理完成
        });
        return $response;
    }
}
