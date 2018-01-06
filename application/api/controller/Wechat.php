<?php

namespace app\api\controller;

use app\common\controller\Api;
use Hooklife\ThinkphpWechat\Wechat as WeChatAPP;
/**
 * 微信
 *
 * @icon fa fa-user
 */
class Wechat extends Api
{
    public function test()
    {
        print_r(WeChatAPP::user()->lists());
    }
}
