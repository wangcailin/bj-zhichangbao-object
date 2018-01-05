<?php

namespace app\admin\model;

use think\Model;
use aliyun\Express;

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
    protected $append = [];

    /**
     * 获取快递公司接口
     */
    public function getExpressList()
    {
        $express = new Express();
        return $express->getExpressList();
    }

    protected function setLawyerTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    protected function setExpressTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


    public function evidence()
    {
        return $this->belongsTo('Evidence', 'evidence_id', 'id')->setEagerlyType(0);
    }
}
