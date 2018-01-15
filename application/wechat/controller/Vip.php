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
        $vipList = $this->model->vipData;
        foreach ($vipList as $v){
            if ($v['vid'] == $vid){
                $vipData = $v;
            }
        }

        $jssdk = $this->pay->jssdk;
        $json = $jssdk->bridgeConfig($prepayId); // 返回 json 字符串，如果想返回数组，传第二个参数 false

        $this->assign('vipData', $vipData);
        return $this->view->fetch();
    }

    public function buyOrder()
    {
        $id = input('vid');//传入订单ID
        $order_find = ExampleOrder::find($id); //找到该订单
        $mch_id = xxxxxxx;//你的MCH_ID
        $options = $this->options();
        $app = new Application($options);
        $payment = $app->payment;
        $out_trade_no = $mch_id.date("YmdHis"); //拼一下订单号
        $attributes = [
            'trade_type'       => 'APP', // JSAPI，NATIVE，APP...
            'body'             => '购买CSDN产品',
            'detail'           => $order_find->info, //我这里是通过订单找到商品详情，你也可以自定义
            'out_trade_no'     => $out_trade_no,
            'total_fee'        => $order_find->money*100, //因为是以分为单位，所以订单里面的金额乘以100
            // 'notify_url'       => 'http://xxx.com/order-notify', // 支付结果通知网址，如果不设置则会使用配置里的默认地址
            // 'openid'           => '当前用户的 openid', // trade_type=JSAPI，此参数必传，用户在商户appid下的唯一标识，
            // ...
        ];
        $order = new Order($attributes);
        $result = $payment->prepare($order);
        if ($result->return_code == 'SUCCESS' && $result->result_code == 'SUCCESS'){
            $order_find->out_trade_no = $out_trade_no; //在这里更新订单的支付ID
            $order_find->save();
            // return response()->json(['result'=>$result]);
            $prepayId = $result->prepay_id;
            $config = $payment->configForAppPayment($prepayId);
            return response()->json($config);
        }

    }
}
