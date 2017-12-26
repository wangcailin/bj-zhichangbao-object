<?php

namespace app\admin\model;

use think\Model;

class Goods extends Model
{
    // 表名
    protected $name = 'goods';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'limit_time_text',
        'add_time_text'
    ];
    

    



    public function getLimitTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['limit_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getAddTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['add_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setLimitTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    protected function setAddTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
