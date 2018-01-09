<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;

class Evidence extends Wechat
{
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Evidence');
    }

    public function index($uid = null)
    {
        $data = $this->model->where('user_id', $uid)->select();
        $this->assign('data', $data);
        return $this->view->fetch();
    }

    public function detail($eid = null)
    {
        $statusList = $this->model->getStatusList();
        if ($data = $this->model->where('id', $eid)->find()){
            foreach ($data as $k=>&$v){
                if ($k == 'evidence_time'){
                    $v = date('Y-m-d', $v);
                }elseif($k == 'status'){
                    $v = $statusList[$v];
                }
            }
        }
        $this->assign('data', $data);
        return $this->view->fetch();
    }


}
