<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use Hooklife\ThinkphpWechat\Wechat as WeChatAPP;

use think\Controller;
use think\Request;

/**
 * 微信
 *
 * @icon fa fa-user
 */
class Wechat extends Backend
{
    public function setToken()
    {

        var_dump((array) WeChatAPP::base()->getValidIps());
    }

}
