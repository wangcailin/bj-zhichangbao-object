<?php

namespace app\common\model;

use think\Model;

class Order extends Model
{
    // 表名
    protected $name = 'order';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [];

    public $statusType = [0 => '未支付', 1 => '已支付', 2 => '取消支付', 3 => '支付失败', 4 => '申请退款', 5 => '退款成功', 6 => '退款失败'];
    public $payType = [0 => '无', 1 => '微信支付', 2 => '兑换券'];

    protected function setAddTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    protected function setPayTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
