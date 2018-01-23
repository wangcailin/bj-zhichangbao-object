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

    /**
     * 查看
     */
    public function index()
    {
        $this->relationSearch = true;
        $this->searchFields = "user.nickname,id";
        if ($this->request->isAjax())
        {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->with("user")
                ->where($where)
                ->order($sort, $order)
                ->count();
            $list = $this->model
                ->with("user")
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    public function statusType()
    {
        return json($this->model->statusType);
    }
    public function payType()
    {
        return json($this->model->payType);
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
    public function paySearch()
    {
        $payType = $this->model->payType;
        $searchlist = [];
        foreach ($payType as $key => $value)
        {
            $searchlist[] = ['id' => $key, 'name' => $value];
        }
        $data = ['searchlist' => $searchlist];
        $this->success('', null, $data);
    }

    /**
     * 详情
     */
    public function detail($ids)
    {
        $payType = $this->model->payType;
        $statusType = $this->model->statusType;
        $row = $this->model->get(['id' => $ids])->toArray();
        if (!$row){
            $this->error(__('No Results were found'));
        }

        foreach ($row as $k=>&$v){
            if ($k == 'pay_type'){
                $v = $payType[$v];
            }elseif($k == 'pay_time' || $k == 'add_time'){
                $v = $v ? date('Y-m-d H:i:s', $v) : '无';
            }elseif($k == 'status'){
                $v = $statusType[$v];
            }
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }


}
