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

    public $vipList = [0 => '注册会员', 1 => '大众会员', 2 => '铜牌会员', 3 => '银牌会员', 4 => '金牌会员'];
    public $vipData = [
        ['vid' => 1, 'name' => '大众会员', 'money' => '9.9'],
        ['vid' => 2, 'name' => '铜牌会员', 'money' => '199'],
        ['vid' => 3, 'name' => '银牌会员', 'money' => '499'],
        ['vid' => 4, 'name' => '金牌会员', 'money' => '-'],
    ];

    public function user()
    {
        return $this->belongsTo('User', 'id', 'user_id');
    }
}
