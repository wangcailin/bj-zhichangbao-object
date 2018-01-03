<?php

namespace app\admin\model;

use think\Model;

class EvidenceLawyer extends Model
{
    // 表名
    protected $name = 'evidence_lawyer';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'lawyer_time_text',
        'express_time_text'
    ];
    

    



    public function getLawyerTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['lawyer_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getExpressTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['express_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setLawyerTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    protected function setExpressTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
