<?php

namespace app\admin\controller;

use app\common\controller\Backend;

use think\Controller;
use think\Request;

/**
 * 会员管理
 *
 * @icon fa fa-user
 */
class User extends Backend
{
    
    /**
     * User模型对象
     */
    protected $model = null;
    protected $searchFields = 'id,username,nickname,mobile,open_id';


    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('User');
        $this->view->assign("vipList", $this->model->getVipList());

    }

    /**
     * 详情
     */
    public function detail($ids)
    {
        $vipList = $this->model->getVipList();
        $row = $this->model->get(['id' => $ids])->toArray();
        if (!$row){
            $this->error(__('No Results were found'));
        }

        foreach ($row as $k=>&$v){
            if ($k == 'avatar'){
                $v = '<img class="img-sm img-center" src="'.$v.'">';
            }elseif($k == 'vip'){
                $v = $vipList[$v];
            }elseif($k == 'status'){
                if ($v == 'normal'){
                    $v = '正常';
                }elseif ($v == 'hidden'){
                    $v = '隐藏';
                }
            }
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

    /**
     * 搜索获取VIP类型
     */
    public function getVipListAjax()
    {
        $list = $this->model->getVipList();
        $searchlist = [];
        foreach ($list as $key => $value)
        {
            $searchlist[] = ['id' => $key, 'name' => $value];
        }
        $data = ['searchlist' => $searchlist];
        $this->success('', null, $data);
    }

    public function getStatusListAjax()
    {
        $list = [
            'normal' => '正常',
            'hidden' => '隐藏',
        ];
        $searchlist = [];
        foreach ($list as $key => $value)
        {
            $searchlist[] = ['id' => $key, 'name' => $value];
        }
        $data = ['searchlist' => $searchlist];
        $this->success('', null, $data);
    }
}
