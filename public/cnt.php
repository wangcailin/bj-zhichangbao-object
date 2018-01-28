<?php
/**
 * Created by PhpStorm.
 * User: wangcailin
 * Date: 2018/1/28
 * Time: 下午7:46
 */
$n = file_get_contents('cnt.txt');
$n++;
file_put_contents('cnt.txt', $n);
?>