<?php

namespace app\admin\controller;

use app\common\controller\Backend;

use think\Controller;
use think\Request;

/**
 * 取证单管理
 *
 * @icon fa fa-circle-o
 */
class Evidence extends Backend
{
    
    /**
     * Evidence模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Evidence');

    }
}
