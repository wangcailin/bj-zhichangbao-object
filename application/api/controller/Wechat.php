<?php

namespace app\api\controller;

use app\common\controller\Api;
use wechat\js\JSSDK;
use think\Config;
use think\Request;

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

    public function checktoken(){
        $request = Request::instance();
        $get = $request->param();
        $timestamp = $get['timestamp'];//timestamp其实就是一个时间戳
        $nonce     = $get['nonce'];//nonce是一个随机参数
        $token     = "zcb357951";//这个token填写你在微信公众平台上写的那个值
        $signature = $get['signature'];//这个signature其实就是在微信公众平台已经加密好的字符串
        $echostr   = $get['echostr'];
        $array = [];
        $array = array($token,$timestamp,$nonce);
        sort($array);
        $tmpstr = sha1(implode('',$array));
        if($tmpstr == $signature){
            echo $echostr;
        }else{
            return false;
        }

    }
}
