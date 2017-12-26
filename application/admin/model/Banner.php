<?php

namespace app\admin\model;

use think\Model;

class Banner extends Model
{
    // 表名
    protected $name = 'banner';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'valid_time_text'
    ];
    

    



    public function getValidTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['valid_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setValidTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
