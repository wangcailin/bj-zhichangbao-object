<?php

namespace app\admin\model;

use think\Model;

class EvidenceLawyer extends Model
{
    // 表名
    protected $name = 'evidence_lawyer';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [];

    //protected $expressList = [0 => '保密', 1 => '男', 2 => '女'];

    /**
     * 获取快递公司接口
     */
    public function getExpressList()
    {
        $host = "http://jisukdcx.market.alicloudapi.com";
        $path = "/express/type";
        $method = "GET";
        $appcode = "c29ae9824ed14857a8db638315a87b79";
        $headers = array();
        array_push($headers, "Authorization:APPCODE " . $appcode);
        $querys = "";
        $bodys = "";
        $url = $host . $path;

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl, CURLOPT_FAILONERROR, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HEADER, false);
        if (1 == strpos("$".$host, "https://"))
        {
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        }

        $result = curl_exec($curl);
        $jsonarr = json_decode($result, true);

        if($jsonarr['status'] != 0)
        {
            echo $jsonarr['msg'];
            exit();
        }
        $data =[];
        foreach ($jsonarr['result'] as $k=>$v){
            $data[$v['type']] = $v['name'];
        }
        return $data;

    }

    protected function setLawyerTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    protected function setExpressTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


    public function evidence()
    {
        return $this->belongsTo('Evidence', 'evidence_id', 'id')->setEagerlyType(0);
    }
}
