<?php

namespace app\wechat\controller;

use app\common\controller\Api;

class Active01 extends Api
{
    public function _initialize()
    {
        parent::_initialize();
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
}
