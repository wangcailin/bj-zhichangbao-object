<?php

namespace app\index\controller;

use app\common\controller\Frontend;


class Consult extends Frontend
{


    public function _initialize()
    {
        parent::_initialize();
        $this->assign('menu', 'consult');

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
