<?php

namespace app\common\model;

use think\Model;

class User extends Model
{
    // 表名
    protected $name = 'user';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [];

    protected $vipType = [0 => '注册会员', 1 => '普通会员', 2 => 'VIP', 3 => 'SVIP'];


    /**
     * 读取VIP列表
     * @return array
     */
    public function getVipList()
    {
        return $this->vipType;
    }

    /**
     * 微信手机用户合并
     * @param $mobile
     * @return array|bool|false|\PDOStatement|string|Model
     */
    public function checkMobile($mobile)
    {
        if($data = $res = $this->where('mobile', $mobile)->find()){
            if ($data->open_id == ''){
                $res->delete();
            }
            return $data;
        }
        return false;
    }

    public function getUserInfo($uid){
        return $this->with('info')->where('user.id', $uid)->find();
    }

    protected function setVipTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    protected function setCreateTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    protected function setUpdateTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    public function info()
    {
        return $this->hasOne('UserInfo', 'user_id', 'id')->setEagerlyType(0);
    }

}
