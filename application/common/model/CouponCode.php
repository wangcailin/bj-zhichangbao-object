<?php

namespace app\common\model;

use think\Model;

class CouponCode extends Model
{
    // 表名
    protected $name = 'coupon_code';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [];

    public function checkCode($code = null){
        return $this->where('code', $code)->find();
    }
}
