<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;

class Zcb extends Wechat
{
    public function _initialize()
    {
        parent::_initialize();
        $this->assign('menu', 'zcb');
    }

    public function index()
    {
        return $this->view->fetch();
    }
}
