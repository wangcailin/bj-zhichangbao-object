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
    }

    public function index()
    {
        $data = $this->model->where('id', session('user_id'))->find();
        $this->assign('data', $data);
        return $this->view->fetch();
    }

    public function user_edit()
    {
        return $this->view->fetch();
    }
}
