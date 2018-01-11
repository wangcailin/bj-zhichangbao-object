<?php

namespace app\wechat\controller;

use app\api\controller\Wechat;

class Evidence extends Wechat
{
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Evidence');
    }

    public function index($uid = null)
    {
        $data = $this->model->where('user_id', $uid)->select();
        $this->assign('data', $data);
        return $this->view->fetch();
    }

    public function detail($eid = null)
    {
        $statusList = $this->model->getStatusList();
        if ($data = $this->model->where('id', $eid)->find()){
            foreach ($data as $k=>&$v){
                if ($k == 'evidence_time'){
                    $v = date('Y-m-d', $v);
                }elseif($k == 'status'){
                    $v = $statusList[$v];
                }
            }
        }
        $this->assign('data', $data);
        return $this->view->fetch();
    }

    public function add($uid = null)
    {
        if (model('User')->checkUserVip($uid)){

        }
        return $this->view->fetch();
    }

    public function addCheck()
    {
        $user_id            = input('user_id');
        $company            = input('company');
        $company_address    = input('company_address');
        $contact            = input('contact');
        $contact_phone      = input('contact_phone');
        $job_address        = input('job_address');
        $job_post           = input('job_post');
        $job_time           = input('job_time');
        $compact            = input('compact');
        $rights_type        = input('rights_type');
        $rights_money       = input('rights_money');
        $email              = input('email');
        $description        = input('description');
        $ask                = input('ask');
        $job_name           = input('job_name');
        $job_age            = input('job_age');
        $sex                = input('sex');
        $registered         = input('registered');
        $data = [
            'evidence_sn'      => date('Ymd', time()),
            'user_id'          => $user_id,
            'company'          => $company,
            'company_address'  => $company_address,
            'contact'          => $contact,
            'contact_phone'    => $contact_phone,
            'job_address'      => $job_address,
            'job_post'         => $job_post,
            'job_time'         => $job_time,
            'compact'          => $compact,
            'rights_type'      => $rights_type,
            'rights_money'     => $rights_money,
            'email'            => $email,
            'description'      => $description,
            'ask'              => $ask,
            'job_name'         => $job_name,
            'job_age'          => $job_age,
            'sex'              => $sex,
            'registered'       => $registered
        ];
        if ($this->model->save($data)) {
            return 1;
        }else{
            return 0;
        }
    }


}
