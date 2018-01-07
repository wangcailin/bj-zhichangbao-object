<?php

namespace app\wechat\controller;

use app\common\controller\Api;

class Zcb extends Api
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
