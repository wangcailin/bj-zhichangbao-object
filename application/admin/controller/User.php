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
        $this->view->assign("vipList", model('UserVip')->vipList);

    }

    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('pkey_name')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->with('vip')
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 详情
     */
    public function detail($ids)
    {
        $vipList = model('UserVip')->vipList;
        $row = $this->model->with('vip,info')->where('id', $ids)->find()->toArray();
        if (!$row){
            $this->error(__('No Results were found'));
        }
        if ($row['vip']){
            $row = array_merge($row,$row['vip']);
            unset($row['vip']);
        }
        if ($row['info']){
            $row = array_merge($row,$row['info']);
            unset($row['info']);
        }
        foreach ($row as $k=>&$v){
            switch ($k){
                case 'avatar':
                    $v = '<img class="img-sm img-center" src="'.$v.'">';
                    break;
                case 'create_time':
                    $v = date('Y-m-d H:i:s', $v);
                    break;
                case 'update_time':
                    $v = date('Y-m-d H:i:s', $v);
                    break;
                case 'vid':
                    $v = $vipList[$v];
                    break;
                case 'sex':
                    if ($v == 0){
                        $v = '保密';
                    }elseif ($v == 1){
                        $v = '男';
                    }elseif ($v == 2){
                        $v = '女';
                    }
                    break;
                case 'status':
                    if ($v == '1'){
                        $v = '正常';
                    }elseif ($v == '0'){
                        $v = '禁用';
                    }
                    break;
                default:
                    break;
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
        $list = model('UserVip')->vipList;
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
