<?php

namespace app\api\controller;
use think\Controller;
use EasyWeChat\Factory;

/**
 * 微信
 *
 * @icon fa fa-user
 */
class Wechat1 extends Controller
{
    public function server()
    {
        $config = [
            'app_id' => 'wxa0afc75ebe2d5871',
            'secret' => '75cbdd6b7e9b58e90f1c5e8c8de802f9',
            'token'  => 'zcb357951',
            'aes_key'=> 'G2odRwCOQlfYjRCc39vennq713NndnfSrGQXBts5ZGM',

            'response_type' => 'array',

            'log' => [
                'level' => 'debug',
                'file' => __DIR__.'/wechat.log',
            ],
        ];

        $app = Factory::officialAccount($config);

        $response = $app->server->serve();

        $response->send(); // Laravel 里请使用：return $response;
    }
}
