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
    protected $append = [];

    protected $statusType = [
        0 => '进行中',
        1 => '成功',
        2 => '失败',
        3 => '仲裁成功',
        4 => '仲裁失败',
        5 => '代发律师函进行中',
        6 => '仲裁进行中',
        7 => '律师函成功',
        8 => '律师函失败'
    ];

    protected $sexType = [0 => '保密', 1 => '男', 2 => '女'];


    public function getStatusList()
    {
        return $this->statusType;
    }

    public function getSexList()
    {
        return $this->sexType;
    }

    protected function setJobTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    protected function setEvidenceTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
