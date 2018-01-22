<?php

namespace app\common\model;

use think\Model;

class UserVip extends Model
{
    // 表名
    protected $name = 'user_vip';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = 'vip_time';
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [];

    public $vipList = [0 => '普通会员', 1 => '荣誉会员', 2 => '白金会员', 3 => '黑砖会员'];
    public $vipData = [
        ['vid' => 1, 'name' => '荣誉会员', 'money' => 9.9],
        ['vid' => 2, 'name' => '白金会员', 'money' => 499],
        ['vid' => 3, 'name' => '黑砖会员', 'money' => '-'],
    ];

    public function user()
    {
        return $this->belongsTo('User', 'id', 'user_id');
    }

    /**
     * 添加会员
     * @param null $uid             用户ID
     * @param null $vid             会员ID
     * @param null $vip_name        会员名称
     * @param null $vip_time_end    到期时间
     * @param null $vip_count       使用次数
     * @param null $vip_thing       使用件数
     * @return bool|false|int
     */
    public function user_add_vip($uid = null, $vid = null, $vip_name = null, $vip_time_end = 0, $vip_count = 0, $vip_thing = 0)
    {
        if ($uid && $vid){
            $data = [
                'user_id'   => $uid,
                'vid'       => $vid,
                'vip_name'  => $vip_name,
                'vip_time'  => time(),
                'vip_time_end'  => $vip_time_end,
                'vip_count'  => $vip_count,
                'vip_count_user'  => 0,
                'vip_thing'       => $vip_thing,
                'vip_thing_user'    => 0,
            ];
            @file_put_contents('notify.txt',json_encode($this->save($data)));
            //return $this->save($data);
        }
        return false;
    }

    public function checkUserVip($uid)
    {
        $res = $this->where('user_id', $uid)->find();
        if ($res) {
            if ($res['vip_time_end']){
                if ($res['vip_time_end'] >= time()){
                    return true;
                }
            }
            if ($res['vip_thing']){
                if ($res['vip_thing'] > $res['vip_thing_user']){
                    return true;
                }
            }
            return false;
        }
        return false;
    }
}
