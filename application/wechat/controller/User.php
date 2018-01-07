<?php

namespace app\wechat\controller;

use app\common\controller\Api;

class User extends Api
{
    public function index()
    {
        return $this->view->fetch();
    }

    public function user_edit()
    {
        return $this->view->fetch();
    }
}
