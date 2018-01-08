<?php

namespace app\index\controller;

use app\common\controller\Frontend;

class Index extends Frontend
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
