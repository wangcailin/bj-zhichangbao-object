<?php

namespace app\api\controller;

use think\Loader;
use app\common\controller\Api;
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

        if(empty(session('user_open_id')) && empty(session('user_id'))){
            $this->wechatLogin();
        }
    }

    public function wechatLogin()
    {
        $appid = "wxa0afc75ebe2d5871";
        $redirect_uri = 'http://test.zhichangbb.com/api/wechat/getCode';
        $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$appid.'&redirect_uri='.$redirect_uri.'&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect';
        header("Location:".$url);
    }

    public function index()

    {
        $echoStr=$_GET["echostr"];
        if($this->checkSignature()){
            echo $echoStr;
            exit;
        }
    }
    private function checkSignature()
    {

        $signature=$_GET["signature"];
        $timestamp=$_GET["timestamp"];
        $nonce=$_GET["nonce"];
        $token= 'zcb357951';
        $tmpArr= array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );
        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }


    //jssdk分享功能封装
    public function wechatShare()
    {
        Loader::import('wechat\js\JSSDK', EXTEND_PATH);

        $jssdkObj = new JSSDK("wxa0afc75ebe2d5871", "75cbdd6b7e9b58e90f1c5e8c8de802f9");
        $signPackage = $jssdkObj->getSignPackage();
        $this->assign('signPackage', $signPackage);
    }


    public function getCode(){
        $appid = 'wxa0afc75ebe2d5871';
        $secret = '75cbdd6b7e9b58e90f1c5e8c8de802f9';
        $code = $_GET['code'];
        $url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$appid."&secret=".$secret."&code=".$code."&grant_type=authorization_code";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$url );
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1 );
        $res = curl_exec($ch);
        curl_close($ch);
        $arr = json_decode($res , true);
        session('user_open_id', $arr["openid"]);
        $this -> getUserInfo($arr["access_token"],$arr["openid"]);
    }
    public function getUserInfo($accessToken , $openid){
        $url = "https://api.weixin.qq.com/sns/userinfo?access_token=$accessToken&openid=$openid&lang=zh_CN";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$url );
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1 );
        $res = curl_exec($ch);
        curl_close($ch);
        $arr = json_decode($res , true);
        $this->checkUserInfo($openid, $arr);
    }

    /**
     * 微信用户是否存在
     * @param $openid  微信用户ID
     * @param $data    微信用户数据
     */
    protected function checkUserInfo($openid, $data)
    {
        $userModel = model('User');
        if ($res = $userModel->where('open_id', $openid)->find()){
            session('user_id', $res->id);
            $user              = $userModel::get($res['id']);
            $user->avatar      = $data['headimgurl'];
            $user->update_time = time();
            $user->save();
        }else{
            $data = [
                'username'      => 'Wx_'.get_random_str('10'),
                'nickname'      => $data['nickname'],
                'avatar'        => $data['headimgurl'],
                'sex'           => $data['sex'],
                'vip'           => 0,
                'open_id'       => $openid,
                'create_time'   => time(),
                'update_time'   => time(),
            ];
            $res = model('User')->save($data);
            session('user_id', $res->id);
            session('user_open_id', $openid);
        }
    }
}
