<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\wechat\controller\User;

/**
 * 微信
 *
 * @icon fa fa-user
 */
class WechatBase extends Api
{
    /**
     * 登录回调
     */
    public function oauth_callback()
    {
        $oauth = $this->app->oauth;

        // 获取 OAuth 授权结果用户信息
        $user = $oauth->user();

        $data = $user->toArray();
        session('wechat_user', $data['original']);
        $userModel = new User();
        $userModel->checkUserInfo($data['original']);
    }

    /**
     * 服务端验证
     */
    public function server()
    {
        $response = $this->app->server->serve();
        $response->send();
    }
}
