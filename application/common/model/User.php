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

    /**
     * 微信手机用户合并
     * @param $mobile
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

    /**
     * 获取用户详细信息
     * @param $uid  用户ID
     */
    public function getUserInfo($uid)
    {
        return $this->with('info')->where('user.id', $uid)->find();
    }

    public function checkUserVip($uid)
    {
        $res = $this->where('id', $uid)->find();
        if ($res) {
            if ($res['vip'] != '0'){
                if ($res['vip_time'] >= time()){
                    return true;
                }
            }
            return false;
        }
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


    public function vip()
    {
        return $this->hasOne('UserVip', 'user_id', 'id');
    }
    public function info()
    {
        return $this->hasOne('UserInfo', 'user_id', 'id');
    }

}
