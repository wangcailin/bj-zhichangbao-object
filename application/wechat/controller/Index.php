<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;

class Index extends Wechat
{
    public function _initialize()
    {
        parent::_initialize();
        $this->assign('menu', 'index');
    }

    public function index()
    {
        return $this->view->fetch();
    }
}
