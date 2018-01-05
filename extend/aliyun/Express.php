<?php
namespace aliyun;

class Express
{

    protected $appcode = 'c29ae9824ed14857a8db638315a87b79';

    /**
     * 获取快递公司列表
     * @return array
     */
    public function getExpressList()
    {
        $host = "http://jisukdcx.market.alicloudapi.com";
        $path = "/express/type";
        $method = "GET";
        $headers = array();
        array_push($headers, "Authorization:APPCODE " . $this->appcode);
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

    /**
     * 快递查询接口
     * @param $code     快递号
     * @param $express  快递公司
     */
    public function getExpressCode($code, $express)
    {
        $host = "http://jisukdcx.market.alicloudapi.com";
        $path = "/express/query";
        $method = "GET";
        $headers = array();
        array_push($headers, "Authorization:APPCODE " . $this->appcode);
        $querys = "number=".$code."&type=".$express;
        $bodys = "";
        $url = $host . $path . "?" . $querys;

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
        $jsonarr = json_decode($result,true);
        $result = $jsonarr['result'];
        if($result['issign'] == 1) echo '已签收'.'<br />';
        else echo '未签收'.'<br />';
        foreach($result['list'] as $val)
        {
            echo $val['time'].' '.$val['status'].'<br />';
        }
    }

}