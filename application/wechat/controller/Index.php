<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;

class Index extends Wechat
{
    public function index()
    {
        return $this->view->fetch();
    }
}
