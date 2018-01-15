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
    public function buy()
    {
        $vipData = [];
        $vid = input('vid');
        $uid = input('uid');
        $user = model('User')->where('id', $uid)->find();

        $jssdk = $this->pay->jssdk;
        $jsorder = $jssdk->bridgeConfig('201801112312312');

        $vipList = $this->model->vipData;
        foreach ($vipList as $v){
            if ($v['vid'] == $vid){
                $vipData = $v;
            }
        }

        $result = $this->pay->order->unify([
            'body' => '职场保-'.$vipData['name'].'充值',
            'out_trade_no' => date('Ymd', time()).rand(10000,99999),
            'total_fee' => $vipData['money'],
            'trade_type' => 'JSAPI',
            'openid' => $user['open_id'],
        ]);


        $this->assign('vipData', $vipData);
        $this->assign('jsorder', $jsorder);
        return $this->view->fetch();
    }
}
