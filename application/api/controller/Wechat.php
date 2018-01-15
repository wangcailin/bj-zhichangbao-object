<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Controller;

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
        if (empty(session('wechat_user')) && empty(session('user_id'))){

            $oauth = $this->app->oauth;
            return $oauth->redirect()->send();
        }
    }

}
