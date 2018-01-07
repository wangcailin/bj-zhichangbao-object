<?php

namespace app\wechat\controller;

use app\common\controller\Api;

class User extends Api
{
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('User');
        $this->assign('menu', 'user');
    }

    public function index()
    {
        return $this->view->fetch();
    }

    public function getAjaxUserInfo()
    {
        $uid = input('uid');
        $data = $this->model->where('id', $uid)->find();
        if ($data) {
            $data['code'] = 1;
            if ($data['vip'] != '0' && time() > $data['vip_time']){
                $data['guarantee'] = 1;
            }
        }
        return json($data);
    }

    public function user_edit()
    {
        return $this->view->fetch();
    }
}
