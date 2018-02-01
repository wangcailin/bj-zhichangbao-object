<?php

namespace app\common\controller;

use think\Controller;
use EasyWeChat\Factory;

class Api extends Controller
{

    public $config = [];
    public $app = [];
    public $pay= [];

    public function _initialize()
    {
        if (!session('source')){
            input('source') ? session('source', input('source')) : session('source', '无');
        }elseif(input('source')){
            session('source', input('source'));
        }

        if (!session('url')){
            $request = request();
            session('url', $request->url());
        }

        $this->config = [
            'app_id' => 'wxa0afc75ebe2d5871',
            'secret' => '75cbdd6b7e9b58e90f1c5e8c8de802f9',
            'token'  => 'zhichangbao20180112',
            'aes_key'=> 'g9pA8Q58l8Idre2PfL8qIVsr1dazdNXfzEZPe7MIGip',

            'response_type' => 'array',

            'log' => [
                'level' => 'debug',
                'file' => __DIR__.'/wechat.log',
            ],
            'oauth' => [
                'scopes'   => ['snsapi_userinfo'],
                'callback' => '/api/wechatbase/oauth_callback/source/'.session('source'),
            ]
        ];
        $this->app = Factory::officialAccount($this->config);
    }

}
