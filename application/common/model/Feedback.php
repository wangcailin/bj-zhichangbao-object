<?php

namespace app\common\model;

use think\Model;

class Feedback extends Model
{
    // 表名
    protected $name = 'feedback';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'time';

    // 定义时间戳字段名
    protected $createTime = 'time';
    protected $updateTime = false;


    protected function setTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

}
