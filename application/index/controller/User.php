<?php

namespace app\index\controller;

use app\common\controller\Frontend;

class User extends Frontend
{


    public function _initialize()
    {
        parent::_initialize();
        $this->assign('menu', 'user');

    }

    public function index()
    {
        return $this->view->fetch();
    }

}
