<?php

namespace app\admin\controller;

use app\common\controller\Backend;

/**
 * 控制台
 *
 * @icon fa fa-dashboard
 * @remark 用于展示当前系统中的统计数据、统计报表及重要实时数据
 */
class Dashboard extends Backend
{

    /**
     * 查看
     */
    public function index()
    {
        $seventtime = \fast\Date::unixtime('day', -7);
        $paylist = $createlist = [];
        for ($i = 0; $i < 7; $i++)
        {
            $day = date("Y-m-d", $seventtime + ($i * 86400));
            $createlist[$day] = mt_rand(20, 200);
            $paylist[$day] = mt_rand(1, mt_rand(1, $createlist[$day]));
        }
        $hooks = config('addons.hooks');
        $uploadmode = isset($hooks['upload_config_init']) && $hooks['upload_config_init'] ? implode(',', $hooks['upload_config_init']) : 'local';


        $totaluser = model('User')->count();
        $totalorder = model('Order')->count();
        $totalorderamount = model('Order')->sum('amount');

        $todayusersignup = model('User')->where('create_time', '>', strtotime(date('Y-m-d')))->count();
        $todayuserlogin = model('User')->where('update_time', '>', strtotime(date('Y-m-d')))->count();

        $todayorder = model('Order')->where('add_time', '>', strtotime(date('Y-m-d')))->count();
        $unsettleorder = model('Order')->where('add_time', '>', strtotime(date('Y-m-d')))->whereXor('status', '<>', '1')->count();

        $totalviews = file_get_contents('cnt.txt');

        $this->view->assign([
            'totaluser'        => $totaluser,
            'totalviews'       => $totalviews,
            'totalorder'       => $totalorder,
            'totalorderamount' => $totalorderamount,
            'todayuserlogin'   => $todayuserlogin,
            'todayusersignup'  => $todayusersignup,
            'todayorder'       => $todayorder,
            'unsettleorder'    => $unsettleorder,
            'sevendnu'         => '80%',
            'sevendau'         => '32%',
            'paylist'          => $paylist,
            'createlist'       => $createlist,
            'uploadmode'       => $uploadmode
        ]);

        return $this->view->fetch();
    }

}
