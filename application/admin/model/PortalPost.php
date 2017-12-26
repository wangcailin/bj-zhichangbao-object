<?php

namespace app\admin\model;

use think\Model;

class PortalPost extends Model
{
    // 表名
    protected $name = 'portal_post';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'create_time_text',
        'published_time_text'
    ];
    

    



    public function getCreateTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['create_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getPublishedTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['published_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setCreateTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    protected function setPublishedTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
