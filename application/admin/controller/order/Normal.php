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

    protected $searchFields = 'id,order_sn,user_id,goods_name,amount';


    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Order');
        $this->assign('statusType', $this->model->statusType);
    }

    public function statusType()
    {
        return json($this->model->statusType);
    }

    public function statusSearch()
    {
        $statusType = $this->model->statusType;
        $searchlist = [];
        foreach ($statusType as $key => $value)
        {
            $searchlist[] = ['id' => $key, 'name' => $value];
        }
        $data = ['searchlist' => $searchlist];
        $this->success('', null, $data);
    }


}
