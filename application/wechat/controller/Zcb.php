<?php

namespace app\wechat\controller;

use app\common\controller\Api;

class Zcb extends Api
{
    public function index()
    {
        return $this->view->fetch();
    }
}
