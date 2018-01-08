<?php

namespace app\index\controller;


use app\common\controller\Frontend;

class About extends Frontend
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
