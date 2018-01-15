<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;
use EasyWeChat\Factory;

class Vip extends Wechat
{
    protected $model = null;
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('UserVip');
        $this->assign('menu', 'zcb');
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
    public function buy($vid =null, $uid = null)
    {


        $config = [
            // 必要配置
            'app_id'             => 'wxa0afc75ebe2d5871',
            'secret'             => '75cbdd6b7e9b58e90f1c5e8c8de802f9',
            'mch_id'             => '1401831202',
            'key'                => 'BGQv5ebUj5Ug8FLJMyPg8ZvKoRxqYMlf',   // API 密钥
            'cert_path'          => 'wxpay/apiclient_cert.pem', // XXX: 绝对路径！！！！
            'key_path'           => 'wxpay/apiclient_key.pem',      // XXX: 绝对路径！！！！
            'notify_url'         => '/api/wechatbase/pay_callback',     // 你也可以在下单时单独设置来想覆盖它
        ];
        $app = Factory::payment($config);

        $vipData = [];
        $user = model('User')->where('id', $uid)->find();
        $vipList = $this->model->vipData;
        foreach ($vipList as $v){
            if ($v['vid'] == $vid){
                $vipData = $v;
            }
        }

        $order = [
            'body' => '职场保-'.$vipData['name'].'充值',
            'out_trade_no' => date('Ymd', time()).rand(10000,99999),
            'total_fee' => $vipData['money'],
            'trade_type' => 'JSAPI',
            'openid' => $user['open_id'],
        ];

        $result = $app->order->unify($order);

        if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
            $prepayId = $result['prepay_id'];
        }
        $json = $app->jssdk->bridgeConfig($prepayId);
        $conf = $this->app->jssdk->buildConfig(array('translateVoice','chooseWXPay','getBrandWCPayRequest','onMenuShareTimeline', 'onMenuShareAppMessage'), false, false, true);
        $this->assign(['jsorder'=>$json,'vipData' => $vipData,'conf'=>$conf]);
        return $this->view->fetch();
    }


    public function newbuy($vid =null, $uid = null)
    {


        $config = [
            // 必要配置
            'app_id'             => 'wxa0afc75ebe2d5871',
            'mch_id'             => '1401831202',
            'key'                => 'BGQv5ebUj5Ug8FLJMyPg8ZvKoRxqYMlf',   // API 密钥
            'cert_path'          => 'wxpay/apiclient_cert.pem', // XXX: 绝对路径！！！！
            'key_path'           => 'wxpay/apiclient_key.pem',      // XXX: 绝对路径！！！！
            'notify_url'         => '/api/wechatbase/pay_callback',     // 你也可以在下单时单独设置来想覆盖它
        ];
        $app = Factory::payment($config);


        $vipData = [];
        $user = model('User')->where('id', $uid)->find();

        $vipList = $this->model->vipData;
        foreach ($vipList as $v){
            if ($v['vid'] == $vid){
                $vipData = $v;
            }
        }

        $order = [
            'body' => '职场保-'.$vipData['name'].'充值',
            'out_trade_no' => date('Ymd', time()).rand(10000,99999),
            'total_fee' => $vipData['money'],
            'trade_type' => 'JSAPI',
            'openid' => $user['open_id'],
        ];

        $result = $app->order->unify($order);

        if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS'){
            $prepayId = $result['prepay_id'];
        }
        $json = $this->pay->jssdk->bridgeConfig($prepayId);
        $config = $app->jssdk->sdkConfig($prepayId);

        $this->assign(['jsorder'=>$json,'vipData' => $vipData,'config'=>$config]);
        return $this->view->fetch('');
    }

    public function buyCall()
    {

    }
}
