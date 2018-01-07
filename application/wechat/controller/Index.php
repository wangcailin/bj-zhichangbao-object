<?php

namespace app\wechat\controller;

use app\common\controller\Api;

class Index extends Api
{
    public function index()
    {
        return $this->view->fetch();
    }
}
