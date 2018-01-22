<?php

namespace app\admin\controller\counpon;

use app\common\controller\Backend;

use think\Controller;
use think\Request;

/**
 * 卡券规则管理
 *
 * @icon fa fa-circle-o
 */
class Access extends Backend
{
    
    /**
     * CouponAccess模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('CouponAccess');

    }

    /**
     * 发放卡券
     * @param $ids
     */
    public function send($ids)
    {
        $access = $this->model->where('id', $ids)->find()->toArray();
        $data = [];
        for ($i=0;$i<$access['count'];$i++){
            $temp['cid'] = $access['id'];
            $temp['code'] = 'ZCB'.rand(1000,9999).strtoupper(get_random_str('2'));
            $data[] = $temp;
        }
        if (model('CouponCode')->saveAll($data)){
            $this->success('生成卡券码成功！');
        }
        $this->error('生成卡券码失败！');
    }
}
