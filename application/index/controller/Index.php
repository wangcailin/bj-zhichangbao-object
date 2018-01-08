<?php

namespace app\index\controller;

use think\Controller;

class Index extends Controller
{


    public function _initialize()
    {
        parent::_initialize();
    }

    public function index()
    {
        return $this->view->fetch();
    }

}
