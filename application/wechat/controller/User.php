<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;
use \app\common\model\User as UserModel;
use \app\common\model\UserInfo as UserInfoModel;
use \app\common\model\UserVip as UserVipModel;

class User extends Wechat
{
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new UserModel();
        $this->assign('menu', 'user');
    }

    public function index()
    {
        return $this->view->fetch();
    }

    /**
     * 微信用户是否存在
     */
    public function checkUserInfo($data)
    {
        if ($res = $this->model->where('open_id', $data['openid'])->find()){
            session('user_id', $res->id);
            $user              = $this->model->get($res['id']);
            $user->avatar      = $data['headimgurl'];
            $user->update_time = time();
            $user->save();
        }else{
            $data = [
                'username'      => 'Wx_'.get_random_str('10'),
                'nickname'      => $data['nickname'],
                'avatar'        => $data['headimgurl'],
                'sex'           => $data['sex'],
                'open_id'       => $data['openid'],
                'create_time'   => time(),
                'update_time'   => time(),
            ];
            $this->model->save($data);
            $res = $this->model->where('open_id', $data['open_id'])->find();
            session('user_id', $res->id);
        }
        header("Location:".session('url'));
    }

    public function getAjaxUserInfo()
    {
        $uid = session('user_id');
        $data = $this->model->with('vip')->where('id', $uid)->find()->toArray();
        if ($data) {
            if (empty($data['vip'])){
                $data['vip']['vip_name'] = '普通会员';
                $data['vip']['vid'] = '0';
            }
            $data['code'] = 1;
        }
        return json($data);
    }

    /**
     * 查看权益期
     */
    public function getGuarantee($uid = null)
    {
        $data = $this->model->where('id', $uid)->find();
        if ($data['vip'] != '0' && time() < $data['vip_time']){
            $data['guarantee'] = 1;
        }
        $this->assign('data', $data);
        return $this->view->fetch('guarantee');
    }

    public function user_edit($uid = null)
    {
        if ($res = $this->model->get($uid, 'info')){
            $this->assign('user' ,$res);
            $this->assign('userinfo' ,$res->info);
        }
        return $this->view->fetch();
    }

    public function userEditCheck()
    {
        $code       = 0;
        $uid        = input('uid');
        $mobile     = input('mobile') ? input('mobile') : '';
        $company    = input('company') ? input('company') : '';
        $card       = input('card') ? input('card') : '';
        $realname   = input('realname') ? input('realname') : '';
        $user       = $this->model->get($uid, 'info');

        if ($mobile){
            if ($res = $this->model->checkMobile($mobile)){
                $user->vip = $res->vip;
                $user->vip_time = $res->vip_time;
                $user->create_time = $res->create_time;
            }
            $user->mobile = $mobile;
            if ($user->save()) $code = 1;
        }
        if ($card || $company || $realname){
            $user->info->card = $card;
            $user->info->company = $company;
            $user->info->realname = $realname;
            if ($user->info->save()) $code = 1;
        }
        return $code;
    }

    public function feedback()
    {
        if ($this->request->isAjax()){
            $user_id = input('user_id');
            $content = input('content');
            $data = [
                'user_id'   => $user_id,
                'content'   => $content
            ];
            if (model('Feedback')->save($data)){
                return 1;
            }else{
                return 0;
            }
        }
        return $this->view->fetch();
    }

    public function common()
    {
        return $this->view->fetch();
    }
    public function honorVIP()
    {
        if ($this->request->isAjax()){
            $uid = session('user_id');
            $UserVipModel = new UserVipModel();
            if ($UserVipModel->checkUserVip($uid)){
                $data = $UserVipModel->where('user_id', $uid)->find()->toArray();
                $data['vip_time_now'] = ceil((time()-$data['vip_time'])/3600/24) ;
                $data['vip_time'] = date('Y-m-d', $data['vip_time']);
                $data['vip_time_start'] = date('Y-m-d', strtotime('+1 month', strtotime($data['vip_time'])));
                $data['vip_time_end'] = date('Y-m-d', $data['vip_time_end']);
                $data['code'] = 1;
                return json($data);
            }
        }
        return $this->view->fetch();
    }
    public function backBrickVIP()
    {
        return $this->view->fetch();
    }
    public function platinumVIP()
    {
        return $this->view->fetch();
    }

    /**
     * 查看用户是否VIP
     * @return \think\response\Json
     */
    public function checkVip()
    {
        $user_id = session('user_id');
        if (!$user_id){
            header('Location: http://www.zhichangbb.com/wechat/user/index');
            die;
        }
        if (model('UserVip')->checkUserVip($user_id)){
            return json('1');
        }
        return json('0');
    }

}
