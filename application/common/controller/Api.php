<?php

namespace app\common\controller;

use think\Controller;
use EasyWeChat\Factory;

class Api extends Controller
{

    public $config = [];
    public $app = [];

    public function _initialize()
    {
        $this->config = [
            'app_id' => 'wxa0afc75ebe2d5871',
            'secret' => '75cbdd6b7e9b58e90f1c5e8c8de802f9',
            'token'  => 'zcb357951',
            'aes_key'=> 'G2odRwCOQlfYjRCc39vennq713NndnfSrGQXBts5ZGM',

            'response_type' => 'array',

            'log' => [
                'level' => 'debug',
                'file' => __DIR__.'/wechat.log',
            ],
            'oauth' => [
                'scopes'   => ['snsapi_userinfo'],
                'callback' => '/api/wechatcallback/oauth_callback',
            ],
        ];
        $this->app = Factory::officialAccount($this->config);
    }

}
