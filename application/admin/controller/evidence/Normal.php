<?php

namespace app\admin\controller\evidence;

use app\common\controller\Backend;

use think\Controller;
use think\Request;

/**
 * 取证单管理
 *
 * @icon fa fa-circle-o
 */
class Normal extends Backend
{
    
    /**
     * Evidence模型对象
     */
    protected $model = null;
    protected $searchFields = 'id,title,options,answer,analysis';


    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Evidence');
        $this->view->assign("statusList", $this->model->getStatusList());

    }

    /**
     * 详情
     */
    public function detail($ids)
    {
        $statusList = $this->model->getStatusList();
        $sexList = $this->model->getSexList();

        $row = $this->model->get(['id' => $ids])->toArray();
        if ($this->request->isAjax())
        {
            $this->success("Ajax请求成功", null, ['id' => $ids]);
        }
        if (!$row){
            $this->error(__('No Results were found'));
        }

        foreach ($row as $k=>&$v){
            if ($k == 'compact'){
                $v = $v == '0' ? '否' : '是';
            }elseif($k == 'sex'){
                $v = $sexList[$v];
            }elseif($k == 'status'){
                $v = $statusList[$v];
            }elseif ($k == 'evidence_time'){
                $v = date( 'Y-m-d H:i:s', $v);
            }
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

    public function getStatusList()
    {
        $statusList = $this->model->getStatusList();
        $searchlist = [];
        foreach ($statusList as $key => $value)
        {
            $searchlist[] = ['id' => $key, 'name' => $value];
        }
        $data = ['searchlist' => $searchlist];
        $this->success('', null, $data);
    }

}
