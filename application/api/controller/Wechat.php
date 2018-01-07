<?php

namespace app\api\controller;

use app\common\controller\Api;
use wechat\js\JSSDK;
use think\Config;
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
        $this->wechatShare();

    }

    //jssdk分享功能封装
    public function wechatShare()
    {
        $jssdkObj = new JSSDK("wxa0afc75ebe2d5871", "75cbdd6b7e9b58e90f1c5e8c8de802f9");
        $signPackage = $jssdkObj->getSignPackage();
        $this->signPackage = $signPackage;
    }
}
