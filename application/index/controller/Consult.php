<?php

namespace app\index\controller;

use think\Controller;

class Consult extends Controller
{


    public function _initialize()
    {
        parent::_initialize();
    }

    public function index()
    {
        return $this->view->fetch();
    }

    /**
     * 收集证据
     */
    public function evidence()
    {
        return $this->view->fetch();
    }

}
