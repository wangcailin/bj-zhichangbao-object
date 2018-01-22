<?php

namespace app\admin\controller\counpon;

use app\common\controller\Backend;

use think\Controller;
use think\Request;

/**
 * 卡券列管理
 *
 * @icon fa fa-circle-o
 */
class Code extends Backend
{
    
    /**
     * CouponCode模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('CouponCode');

    }
}
