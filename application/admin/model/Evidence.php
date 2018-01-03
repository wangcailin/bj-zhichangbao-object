<?php

namespace app\admin\model;

use think\Model;

class Evidence extends Model
{
    // 表名
    protected $name = 'evidence';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'job_time_text'
    ];
    

    



    public function getJobTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['job_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setJobTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
