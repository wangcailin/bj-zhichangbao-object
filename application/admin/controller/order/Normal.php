<?php

namespace app\admin\controller\order;

use app\common\controller\Backend;

use think\Controller;
use think\Request;

/**
 * 订单管理
 *
 * @icon fa fa-circle-o
 */
class Normal extends Backend
{
    
    /**
     * Order模型对象
     */
    protected $model = null;

    protected $searchFields = 'id,order_sn,user_id,goods_id,amount';


    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Order');
    }

    public function getStatusType()
    {
        $statusType = $this->model->getStatusType();
        $searchlist = [];
        foreach ($statusType as $key => $value)
        {
            $searchlist[] = ['id' => $key, 'name' => $value];
        }
        $data = ['searchlist' => $searchlist];
        $this->success('', null, $data);
    }


}
