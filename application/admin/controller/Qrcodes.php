<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use Endroid\QrCode\QrCode;
use think\Response;

/**
 * 二维码生成
 *
 */
class Qrcodes extends Backend
{

    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
    }

    // 
    public function index()
    {
        return $this->view->fetch();
    }

    // 生成二维码
    public function build()
    {
        $text = 'http://www.zhichangbb.com/wechat/index/index?source='.$this->request->get('text');
        $size = $this->request->get('size');
        $padding = $this->request->get('padding');
        $errorcorrection = $this->request->get('errorcorrection');
        $foreground = $this->request->get('foreground', "#fff");
        $background = $this->request->get('background', "#000");
        $logo = $this->request->get('logo');
        $logosize = $this->request->get('logosize');
        $label = $this->request->get('label');
        $labelfontsize = $this->request->get('labelfontsize');
        $labelhalign = $this->request->get('labelhalign');
        $labelvalign = $this->request->get('labelvalign');


        // 前景色
        list($r, $g, $b) = sscanf($foreground, "#%02x%02x%02x");
        $foregroundcolor = ['r' => $r, 'g' => $g, 'b' => $b];

        // 背景色
        list($r, $g, $b) = sscanf($background, "#%02x%02x%02x");
        $backgroundcolor = ['r' => $r, 'g' => $g, 'b' => $b];

        $qrCode = new QrCode();
        $qrCode
                ->setText($text)
                ->setSize($size)
                ->setPadding($padding)
                ->setErrorCorrection($errorcorrection)
                ->setForegroundColor($foregroundcolor)
                ->setBackgroundColor($backgroundcolor)
                ->setLogoSize($logosize)
                ->setLabelFontPath(ROOT_PATH . 'public/assets/fonts/fzltxh.ttf')
                ->setLabel($label)
                ->setLabelFontSize($labelfontsize)
                ->setLabelHalign($labelhalign)
                ->setLabelValign($labelvalign)
                ->setImageType(QrCode::IMAGE_TYPE_PNG);
        if ($logo)
        {
            $qrCode->setLogo(ROOT_PATH . 'public/assets/img/logo.png');
        }
        //也可以直接使用render方法输出结果
        //$qrCode->render();
        //return new Response($qrCode->get(), 200, ['Content-Type' => $qrCode->getContentType()]);

        //原始图像
        $dst = ROOT_PATH . 'public/assets/img/fenxiao.png';

        //得到原始图片信息
        $dst_im = imagecreatefrompng($dst);
        $dst_info = getimagesize($dst);

        //水印图像
        $src = ROOT_PATH . 'public/assets/img/fenxiao/123.png';;
        imagepng($qrCode->getImage(), $src);
        $src_im = imagecreatefrompng($src);
        $src_info = getimagesize($src);

        //合并水印图片
        imagecopymerge($dst_im,$src_im,$dst_info[0]-$src_info[0]-275,$dst_info[1]-$src_info[1]-90,0,0,$src_info[0], $src_info[1], 100);
        imagejpeg($dst_im);
        imagedestroy($dst_im);
        imagedestroy($src_im);
    }

}
