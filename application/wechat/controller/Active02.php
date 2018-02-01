<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;
use \app\common\model\UserVip;
use EasyWeChat\Factory;

class Active02 extends Wechat
{
    protected $userVipModel = null;
    protected $orderModel = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->userVipModel = model('UserVip');
        $this->orderModel = model('Order');
    }

    public function index()
    {
        return $this->view->fetch();
    }

    /**
     * 发送卡券码
     */
    public function alisms()
    {
        $mobile = input('mobile');
        session('mobile',$mobile);
        $data['cid'] = 2;
        $data['code'] = 'ZCB'.rand(1000,9999).strtoupper(get_random_str('2'));
        $data['user_id'] = session('user_id');
        model('CouponCode')->save($data);

        $alisms = new \addons\alisms\library\Alisms();
        $ret = $alisms->mobile($mobile)
            ->template('SMS_123674082')
            ->sign('职场保')
            ->param(['code'=>$data['code']])
            ->send();
        if ($ret) {
            return json('1');
        }
        return json('0');
    }

    public function add_user_vip()
    {
        $res['status'] = 0;
        $code = input('code');
        $source = session('source');
        $user_id = session('user_id');
        $UserVip = new UserVip();
        if ($UserVip->checkUserVip($user_id)){
            $res['msg'] = '会员已存在,不能兑换,兑换失败!';
            return json($res);
        }

        $CouponCode = model('CouponCode');
        if (!$CouponCode->checkCode($code)){
            $res['msg'] = '兑换码无效,请重新输入!';
            return json($res);
        }

        $this->orderModel->vid          = 1;
        $this->orderModel->pay_type     = 2;
        $this->orderModel->pay_time     = time();
        $this->orderModel->code         = $code;
        $this->orderModel->user_id      = $user_id;
        $this->orderModel->goods_name   = '荣誉会员';
        $this->orderModel->amount       = 9.9;
        $this->orderModel->status       = 1;
        $this->orderModel->add_time     = time();
        $this->orderModel->source       = $source;
        $this->orderModel->save();
        if (!$this->orderModel->id){
            $res['msg'] = '生成订单失败,请稍后再试!';
            return json($res);
        }

        $vip_thing = 0;
        $end_time = strtotime("+30days");
        $vip_count = 5;
        model('UserVip')->user_add_vip($order_info->user_id, $order_info->vid, $order_info->goods_name, $end_time, $vip_count, $vip_thing);
        $res['status'] = 1;
        return json($res);
    }

}
