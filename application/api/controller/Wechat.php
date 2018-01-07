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
    public function _initialize()
    {
        parent::_initialize();
        $oauth = WeChatAPP::oauth();
        $oauth->user();
//        $user  = $oauth->getUser();
//        if (!$user->id) {
//            //未登录，引导用户到微信服务器授权
//            $oauth->redirect()->send();
//        }else{
//            //已登录状态，重定向到joomla首页
//            $targetUrl = '';
//            header('location:'. $targetUrl); // 跳转到业务页面
//        }

    }
}
