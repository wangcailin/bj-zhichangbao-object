<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;

class Vip extends Wechat
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

    public function common()
    {
        return $this->view->fetch();
    }

    public function bronze()
    {
        return $this->view->fetch();
    }

    public function silver()
    {
        return $this->view->fetch();
    }

    public function golden()
    {
        return $this->view->fetch();
    }
}
