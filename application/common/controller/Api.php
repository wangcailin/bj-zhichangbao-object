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
                'callback' => '/api/wechatbase/oauth_callback',
            ],
            'payment' => [
                'mch_id'             => '1401831202',
                'key'                => 'BGQv5ebUj5Ug8FLJMyPg8ZvKoRxqYMlf',
                'cert_path'          => '/wxpay/apiclient_cert.pem',
                'key_path'           => '/wxpay/apiclient_key.pem',
                'notify_url'         => '/api/wechatbase/pay_callback',       // 你也可以在下单时单独设置来想覆盖它
                // 'device_info'     => '013467007045764',
                // 'sub_app_id'      => '',
                // 'sub_merchant_id' => '',
                // ...
            ],
        ];
        $this->app = Factory::officialAccount($this->config);
        $this->pay = Factory::payment($this->config);
    }

}
