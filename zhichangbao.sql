-- MySQL dump 10.13  Distrib 5.6.38, for osx10.13 (x86_64)
--
-- Host: localhost    Database: zhichangbao
-- ------------------------------------------------------
-- Server version	5.6.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `zcb_admin`
--

DROP TABLE IF EXISTS `zcb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_admin`
--

LOCK TABLES `zcb_admin` WRITE;
/*!40000 ALTER TABLE `zcb_admin` DISABLE KEYS */;
INSERT INTO `zcb_admin` VALUES (1,'admin','Admin','075eaec83636846f51c152f29b98a2fd','s4f3','/assets/img/avatar.png','admin@fastadmin.net',0,1502029281,1492186163,1502029281,'d3992c3b-5ecc-4ecb-9dc2-8997780fcadc','normal'),(2,'admin2','admin2','9a28ce07ce875fbd14172a9ca5357d3c','2dHDmj','/assets/img/avatar.png','admin2@fastadmin.net',0,1505450906,1492186163,1505450906,'df45fdd5-26f4-45ca-83b3-47e4491a315a','normal'),(3,'admin3','admin3','1c11f945dfcd808a130a8c2a8753fe62','WOKJEn','/assets/img/avatar.png','admin3@fastadmin.net',0,1501980868,1492186201,1501982377,'','normal'),(4,'admin22','admin22','1c1a0aa0c3c56a8c1a908aab94519648','Aybcn5','/assets/img/avatar.png','admin22@fastadmin.net',0,0,1492186240,1492186240,'','normal'),(5,'admin32','admin32','ade94d5d7a7033afa7d84ac3066d0a02','FvYK0u','/assets/img/avatar.png','admin32@fastadmin.net',0,0,1492186263,1492186263,'','normal');
/*!40000 ALTER TABLE `zcb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_admin_log`
--

DROP TABLE IF EXISTS `zcb_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1317 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_admin_log`
--

LOCK TABLES `zcb_admin_log` WRITE;
/*!40000 ALTER TABLE `zcb_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_attachment`
--

DROP TABLE IF EXISTS `zcb_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_attachment`
--

LOCK TABLES `zcb_attachment` WRITE;
/*!40000 ALTER TABLE `zcb_attachment` DISABLE KEYS */;
INSERT INTO `zcb_attachment` VALUES (1,'/assets/img/qrcode.png','150','150','png',0,21859,'image/png','',1499681848,1499681848,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6');
/*!40000 ALTER TABLE `zcb_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_auth_group`
--

DROP TABLE IF EXISTS `zcb_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_auth_group`
--

LOCK TABLES `zcb_auth_group` WRITE;
/*!40000 ALTER TABLE `zcb_auth_group` DISABLE KEYS */;
INSERT INTO `zcb_auth_group` VALUES (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal');
/*!40000 ALTER TABLE `zcb_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_auth_group_access`
--

DROP TABLE IF EXISTS `zcb_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_auth_group_access`
--

LOCK TABLES `zcb_auth_group_access` WRITE;
/*!40000 ALTER TABLE `zcb_auth_group_access` DISABLE KEYS */;
INSERT INTO `zcb_auth_group_access` VALUES (1,1),(2,2),(3,3),(4,5),(5,5);
/*!40000 ALTER TABLE `zcb_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_auth_rule`
--

DROP TABLE IF EXISTS `zcb_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_auth_rule`
--

LOCK TABLES `zcb_auth_rule` WRITE;
/*!40000 ALTER TABLE `zcb_auth_rule` DISABLE KEYS */;
INSERT INTO `zcb_auth_rule` VALUES (1,'file',0,'dashboard','Dashboard','fa fa-dashboard','','Dashboard tips',1,1497429920,1497429920,143,'normal'),(2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(3,'file',0,'category','Category','fa fa-list','','Category tips',1,1497429920,1497429920,119,'normal'),(4,'file',0,'addon','Addon','fa fa-rocket','','Addon tips',1,1502035509,1502035509,0,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),(9,'file',5,'auth/admin','Admin','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(35,'file',3,'category/index','View','fa fa-circle-o','','Category tips',0,1497429920,1497429920,142,'normal'),(36,'file',3,'category/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,141,'normal'),(37,'file',3,'category/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,140,'normal'),(38,'file',3,'category/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,139,'normal'),(39,'file',3,'category/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,138,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','Addon tips',0,1502035509,1502035509,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(59,'file',4,'addon/local','Local install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(61,'file',4,'addon/install','Install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(62,'file',4,'addon/uninstall','Uninstall','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal');
/*!40000 ALTER TABLE `zcb_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_config`
--

DROP TABLE IF EXISTS `zcb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_config`
--

LOCK TABLES `zcb_config` WRITE;
/*!40000 ALTER TABLE `zcb_config` DISABLE KEYS */;
INSERT INTO `zcb_config` VALUES (1,'name','basic','Site name','请填写站点名称','string','FastAdmin','','required',''),(2,'beian','basic','Beian','粤ICP备15054802号-4','string','','','',''),(3,'cdnurl','basic','Cdn url','如果静态资源使用第三方云储存请配置该值','string','','','',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','',''),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required',''),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"Please select\",\"SMTP\",\"Mail\"]','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码）','string','password','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"None\",\"TLS\",\"SSL\"]','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','','');
/*!40000 ALTER TABLE `zcb_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-25 16:16:06
-- MySQL dump 10.13  Distrib 5.6.38, for osx10.13 (x86_64)
--
-- Host: localhost    Database: zhichangbao
-- ------------------------------------------------------
-- Server version	5.6.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `zcb_admin`
--

DROP TABLE IF EXISTS `zcb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_admin`
--

LOCK TABLES `zcb_admin` WRITE;
/*!40000 ALTER TABLE `zcb_admin` DISABLE KEYS */;
INSERT INTO `zcb_admin` VALUES (1,'admin','Admin','075eaec83636846f51c152f29b98a2fd','s4f3','/assets/img/avatar.png','admin@fastadmin.net',0,1514189931,1492186163,1514189931,'74d644c6-ebe8-46d4-9dc3-60bb17d8e233','normal'),(2,'admin2','admin2','9a28ce07ce875fbd14172a9ca5357d3c','2dHDmj','/assets/img/avatar.png','admin2@fastadmin.net',0,1505450906,1492186163,1505450906,'df45fdd5-26f4-45ca-83b3-47e4491a315a','normal'),(3,'admin3','admin3','1c11f945dfcd808a130a8c2a8753fe62','WOKJEn','/assets/img/avatar.png','admin3@fastadmin.net',0,1501980868,1492186201,1501982377,'','normal'),(4,'admin22','admin22','1c1a0aa0c3c56a8c1a908aab94519648','Aybcn5','/assets/img/avatar.png','admin22@fastadmin.net',0,0,1492186240,1492186240,'','normal'),(5,'admin32','admin32','ade94d5d7a7033afa7d84ac3066d0a02','FvYK0u','/assets/img/avatar.png','admin32@fastadmin.net',0,0,1492186263,1492186263,'','normal');
/*!40000 ALTER TABLE `zcb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_admin_log`
--

DROP TABLE IF EXISTS `zcb_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1324 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_admin_log`
--

LOCK TABLES `zcb_admin_log` WRITE;
/*!40000 ALTER TABLE `zcb_admin_log` DISABLE KEYS */;
INSERT INTO `zcb_admin_log` VALUES (1317,1,'admin','/admin/index/login.html','登录','{\"__token__\":\"82c2e7b20c2b5a5161a63e61059f044d\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514189931),(1318,1,'admin','/admin/auth/rule/del/ids/3','权限管理 规则管理 删除','{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514190212),(1319,1,'admin','/admin/addon/install','插件管理 安装','{\"name\":\"ueditor\",\"force\":\"0\",\"uid\":\"694\",\"token\":\"c2b5b521-449a-480c-bdc5-c31ac9ea2d48\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514252647),(1320,1,'admin','/admin/addon/install','插件管理 安装','{\"name\":\"ueditor\",\"force\":\"0\",\"uid\":\"694\",\"token\":\"c2b5b521-449a-480c-bdc5-c31ac9ea2d48\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514252687),(1321,1,'admin','/admin/auth/rule/edit/ids/121?dialog=1','权限管理 规则管理 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"feedback\",\"title\":\"\\u95ee\\u9898\\u53cd\\u9988\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"121\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514253576),(1322,1,'admin','/admin/auth/rule/edit/ids/75?dialog=1','权限管理 规则管理 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"portal\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"75\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514253596),(1323,1,'admin','/admin/auth/rule/edit/ids/103?dialog=1','权限管理 规则管理 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"law\",\"title\":\"\\u6cd5\\u6761\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"103\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514253617);
/*!40000 ALTER TABLE `zcb_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_attachment`
--

DROP TABLE IF EXISTS `zcb_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_attachment`
--

LOCK TABLES `zcb_attachment` WRITE;
/*!40000 ALTER TABLE `zcb_attachment` DISABLE KEYS */;
INSERT INTO `zcb_attachment` VALUES (1,'/assets/img/qrcode.png','150','150','png',0,21859,'image/png','',1499681848,1499681848,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6');
/*!40000 ALTER TABLE `zcb_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_auth_group`
--

DROP TABLE IF EXISTS `zcb_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_auth_group`
--

LOCK TABLES `zcb_auth_group` WRITE;
/*!40000 ALTER TABLE `zcb_auth_group` DISABLE KEYS */;
INSERT INTO `zcb_auth_group` VALUES (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal');
/*!40000 ALTER TABLE `zcb_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_auth_group_access`
--

DROP TABLE IF EXISTS `zcb_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_auth_group_access`
--

LOCK TABLES `zcb_auth_group_access` WRITE;
/*!40000 ALTER TABLE `zcb_auth_group_access` DISABLE KEYS */;
INSERT INTO `zcb_auth_group_access` VALUES (1,1),(2,2),(3,3),(4,5),(5,5);
/*!40000 ALTER TABLE `zcb_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_auth_rule`
--

DROP TABLE IF EXISTS `zcb_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_auth_rule`
--

LOCK TABLES `zcb_auth_rule` WRITE;
/*!40000 ALTER TABLE `zcb_auth_rule` DISABLE KEYS */;
INSERT INTO `zcb_auth_rule` VALUES (1,'file',0,'dashboard','Dashboard','fa fa-dashboard','','Dashboard tips',1,1497429920,1497429920,143,'normal'),(2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(4,'file',0,'addon','Addon','fa fa-rocket','','Addon tips',1,1502035509,1502035509,0,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),(9,'file',5,'auth/admin','Admin','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','Addon tips',0,1502035509,1502035509,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(59,'file',4,'addon/local','Local install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(61,'file',4,'addon/install','Install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(62,'file',4,'addon/uninstall','Uninstall','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(66,'file',0,'banner','banner管理','fa fa-circle-o','','',1,1514191027,1514191027,0,'normal'),(67,'file',66,'banner/index','查看','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(68,'file',66,'banner/recyclebin','回收站','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(69,'file',66,'banner/add','添加','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(70,'file',66,'banner/edit','编辑','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(71,'file',66,'banner/del','删除','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(72,'file',66,'banner/destroy','真实删除','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(73,'file',66,'banner/restore','还原','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(74,'file',66,'banner/multi','批量更新','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(75,'file',0,'portal','内容管理','fa fa-list','','',1,1514252885,1514253596,0,'normal'),(76,'file',75,'portal/tag','标签管理','fa fa-circle-o','','',1,1514252885,1514252885,0,'normal'),(77,'file',76,'portal/tag/index','查看','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(78,'file',76,'portal/tag/recyclebin','回收站','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(79,'file',76,'portal/tag/add','添加','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(80,'file',76,'portal/tag/edit','编辑','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(81,'file',76,'portal/tag/del','删除','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(82,'file',76,'portal/tag/destroy','真实删除','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(83,'file',76,'portal/tag/restore','还原','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(84,'file',76,'portal/tag/multi','批量更新','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(85,'file',0,'user','会员管理','fa fa-user','','',1,1514252953,1514252953,0,'normal'),(86,'file',85,'user/index','查看','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(87,'file',85,'user/recyclebin','回收站','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(88,'file',85,'user/add','添加','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(89,'file',85,'user/edit','编辑','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(90,'file',85,'user/del','删除','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(91,'file',85,'user/destroy','真实删除','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(92,'file',85,'user/restore','还原','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(93,'file',85,'user/multi','批量更新','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(94,'file',75,'portal/post','文章管理','fa fa-circle-o','','',1,1514252991,1514252991,0,'normal'),(95,'file',94,'portal/post/index','查看','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(96,'file',94,'portal/post/recyclebin','回收站','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(97,'file',94,'portal/post/add','添加','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(98,'file',94,'portal/post/edit','编辑','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(99,'file',94,'portal/post/del','删除','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(100,'file',94,'portal/post/destroy','真实删除','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(101,'file',94,'portal/post/restore','还原','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(102,'file',94,'portal/post/multi','批量更新','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(103,'file',0,'law','法条管理','fa fa-circle-o','','',1,1514253065,1514253617,0,'normal'),(104,'file',103,'law/index','查看','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(105,'file',103,'law/recyclebin','回收站','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(106,'file',103,'law/add','添加','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(107,'file',103,'law/edit','编辑','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(108,'file',103,'law/del','删除','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(109,'file',103,'law/destroy','真实删除','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(110,'file',103,'law/restore','还原','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(111,'file',103,'law/multi','批量更新','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(112,'file',0,'order','订单管理','fa fa-circle-o','','',1,1514253096,1514253096,0,'normal'),(113,'file',112,'order/index','查看','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(114,'file',112,'order/recyclebin','回收站','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(115,'file',112,'order/add','添加','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(116,'file',112,'order/edit','编辑','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(117,'file',112,'order/del','删除','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(118,'file',112,'order/destroy','真实删除','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(119,'file',112,'order/restore','还原','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(120,'file',112,'order/multi','批量更新','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(121,'file',0,'feedback','问题反馈','fa fa-circle-o','','',1,1514253113,1514253576,0,'normal'),(122,'file',121,'feedback/index','查看','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(123,'file',121,'feedback/recyclebin','回收站','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(124,'file',121,'feedback/add','添加','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(125,'file',121,'feedback/edit','编辑','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(126,'file',121,'feedback/del','删除','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(127,'file',121,'feedback/destroy','真实删除','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(128,'file',121,'feedback/restore','还原','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(129,'file',121,'feedback/multi','批量更新','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(130,'file',0,'safeguard','维权列表管理','fa fa-circle-o','','',1,1514253199,1514253199,0,'normal'),(131,'file',130,'safeguard/index','查看','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(132,'file',130,'safeguard/recyclebin','回收站','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(133,'file',130,'safeguard/add','添加','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(134,'file',130,'safeguard/edit','编辑','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(135,'file',130,'safeguard/del','删除','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(136,'file',130,'safeguard/destroy','真实删除','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(137,'file',130,'safeguard/restore','还原','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(138,'file',130,'safeguard/multi','批量更新','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal');
/*!40000 ALTER TABLE `zcb_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_banner`
--

DROP TABLE IF EXISTS `zcb_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `image` varchar(100) NOT NULL COMMENT '图片',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `valid_time` int(10) DEFAULT NULL COMMENT '过期时间',
  `status` varchar(50) NOT NULL COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='banner表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_banner`
--

LOCK TABLES `zcb_banner` WRITE;
/*!40000 ALTER TABLE `zcb_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_config`
--

DROP TABLE IF EXISTS `zcb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_config`
--

LOCK TABLES `zcb_config` WRITE;
/*!40000 ALTER TABLE `zcb_config` DISABLE KEYS */;
INSERT INTO `zcb_config` VALUES (1,'name','basic','Site name','请填写站点名称','string','FastAdmin','','required',''),(2,'beian','basic','Beian','粤ICP备15054802号-4','string','','','',''),(3,'cdnurl','basic','Cdn url','如果静态资源使用第三方云储存请配置该值','string','','','',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','',''),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required',''),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"Please select\",\"SMTP\",\"Mail\"]','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码）','string','password','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"None\",\"TLS\",\"SSL\"]','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','','');
/*!40000 ALTER TABLE `zcb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_favorites`
--

DROP TABLE IF EXISTS `zcb_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_favorites` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `law_id` int(10) NOT NULL COMMENT '法条ID',
  `time` int(10) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_favorites`
--

LOCK TABLES `zcb_favorites` WRITE;
/*!40000 ALTER TABLE `zcb_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_feedback`
--

DROP TABLE IF EXISTS `zcb_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `content` text NOT NULL COMMENT '反馈内容',
  `images` varchar(255) DEFAULT NULL COMMENT '反馈图片',
  `time` int(10) NOT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_feedback`
--

LOCK TABLES `zcb_feedback` WRITE;
/*!40000 ALTER TABLE `zcb_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_goods`
--

DROP TABLE IF EXISTS `zcb_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '服务名称',
  `price` decimal(10,2) NOT NULL COMMENT '服务金额',
  `limit_time` int(10) NOT NULL COMMENT '期限',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  `status` varchar(50) NOT NULL COMMENT '状态: normal正常,hidden隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_goods`
--

LOCK TABLES `zcb_goods` WRITE;
/*!40000 ALTER TABLE `zcb_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_law`
--

DROP TABLE IF EXISTS `zcb_law`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_law` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='法条表\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_law`
--

LOCK TABLES `zcb_law` WRITE;
/*!40000 ALTER TABLE `zcb_law` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_law` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_law_content`
--

DROP TABLE IF EXISTS `zcb_law_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_law_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_law_content`
--

LOCK TABLES `zcb_law_content` WRITE;
/*!40000 ALTER TABLE `zcb_law_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_law_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_order`
--

DROP TABLE IF EXISTS `zcb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) NOT NULL COMMENT '订单号',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `goods_id` int(10) NOT NULL COMMENT '商品ID',
  `status` tinyint(1) NOT NULL COMMENT '状态: 0未支付,1已支付',
  `add_time` int(10) NOT NULL COMMENT '订单创建时间',
  `pay_time` int(10) DEFAULT NULL COMMENT '订单支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_order`
--

LOCK TABLES `zcb_order` WRITE;
/*!40000 ALTER TABLE `zcb_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_portal_post`
--

DROP TABLE IF EXISTS `zcb_portal_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_portal_post` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `keywords` varchar(150) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `content` text COMMENT '文章内容',
  `images` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `like` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `published_time` int(10) DEFAULT NULL COMMENT '发布时间',
  `is_reply` tinyint(1) DEFAULT NULL COMMENT '回复: 0否,1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_portal_post`
--

LOCK TABLES `zcb_portal_post` WRITE;
/*!40000 ALTER TABLE `zcb_portal_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_portal_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_portal_tag`
--

DROP TABLE IF EXISTS `zcb_portal_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_portal_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `post_count` int(10) DEFAULT NULL COMMENT '标签文章数',
  `status` varchar(50) DEFAULT NULL COMMENT '状态: normal正常,hidden隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_portal_tag`
--

LOCK TABLES `zcb_portal_tag` WRITE;
/*!40000 ALTER TABLE `zcb_portal_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_portal_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_portal_tag_post`
--

DROP TABLE IF EXISTS `zcb_portal_tag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_portal_tag_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) DEFAULT NULL COMMENT '标签ID',
  `post_id` int(10) DEFAULT NULL COMMENT '文章ID',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态: 0未审核,1发布',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_portal_tag_post`
--

LOCK TABLES `zcb_portal_tag_post` WRITE;
/*!40000 ALTER TABLE `zcb_portal_tag_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_portal_tag_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_safeguard`
--

DROP TABLE IF EXISTS `zcb_safeguard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_safeguard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `company` varchar(100) NOT NULL COMMENT '公司名称',
  `company_address` varchar(255) NOT NULL COMMENT '公司地址',
  `contact` varchar(50) NOT NULL COMMENT '联系人',
  `contact_phone` varchar(50) NOT NULL COMMENT '联系方式',
  `job_post` varchar(50) NOT NULL COMMENT '工作职位',
  `job_address` varchar(255) NOT NULL COMMENT '工作地址',
  `job_time` int(10) NOT NULL COMMENT '入职时间',
  `compact` tinyint(1) NOT NULL COMMENT '合同: 0否,1是',
  `rights_type` tinyint(1) NOT NULL COMMENT '维权类型',
  `rights_money` decimal(10,2) NOT NULL COMMENT '维权金额',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `description` text NOT NULL COMMENT '情况描述',
  `ask` text COMMENT '期望解决办法',
  `job_name` varchar(50) DEFAULT NULL COMMENT '职工名称',
  `job_age` varchar(50) DEFAULT NULL COMMENT '工龄',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别: 0无,1男,2女',
  `registered` tinyint(1) DEFAULT NULL COMMENT '户口性质: 0农村,1城镇',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态: 0进行中,1成功,2失败,3仲裁成功,4仲裁失败,5代发律师函进行中,6仲裁进行中,7律师函成功,8律师函失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维权列表表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_safeguard`
--

LOCK TABLES `zcb_safeguard` WRITE;
/*!40000 ALTER TABLE `zcb_safeguard` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_safeguard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_user`
--

DROP TABLE IF EXISTS `zcb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `userpass` varchar(50) NOT NULL COMMENT '密码',
  `nickname` varchar(50) NOT NULL COMMENT '用户昵称',
  `avatar` varchar(50) NOT NULL COMMENT '用户头像',
  `mobile` int(11) NOT NULL COMMENT '手机号',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员: 0否,1是',
  `vip_time` int(10) DEFAULT NULL COMMENT '会员到期时间',
  `company` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `card` varchar(50) DEFAULT NULL COMMENT '身份证',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `create_time` int(10) NOT NULL COMMENT '注册时间',
  `update_time` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `status` varchar(50) NOT NULL COMMENT '状态: normal正常,hidden隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_user`
--

LOCK TABLES `zcb_user` WRITE;
/*!40000 ALTER TABLE `zcb_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-26 10:00:46
-- MySQL dump 10.13  Distrib 5.6.38, for osx10.13 (x86_64)
--
-- Host: localhost    Database: zhichangbao
-- ------------------------------------------------------
-- Server version	5.6.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `zcb_admin`
--

DROP TABLE IF EXISTS `zcb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_admin`
--

LOCK TABLES `zcb_admin` WRITE;
/*!40000 ALTER TABLE `zcb_admin` DISABLE KEYS */;
INSERT INTO `zcb_admin` VALUES (1,'admin','Admin','075eaec83636846f51c152f29b98a2fd','s4f3','/assets/img/avatar.png','admin@fastadmin.net',0,1514189931,1492186163,1514189931,'74d644c6-ebe8-46d4-9dc3-60bb17d8e233','normal'),(2,'admin2','admin2','9a28ce07ce875fbd14172a9ca5357d3c','2dHDmj','/assets/img/avatar.png','admin2@fastadmin.net',0,1505450906,1492186163,1505450906,'df45fdd5-26f4-45ca-83b3-47e4491a315a','normal'),(3,'admin3','admin3','1c11f945dfcd808a130a8c2a8753fe62','WOKJEn','/assets/img/avatar.png','admin3@fastadmin.net',0,1501980868,1492186201,1501982377,'','normal'),(4,'admin22','admin22','1c1a0aa0c3c56a8c1a908aab94519648','Aybcn5','/assets/img/avatar.png','admin22@fastadmin.net',0,0,1492186240,1492186240,'','normal'),(5,'admin32','admin32','ade94d5d7a7033afa7d84ac3066d0a02','FvYK0u','/assets/img/avatar.png','admin32@fastadmin.net',0,0,1492186263,1492186263,'','normal');
/*!40000 ALTER TABLE `zcb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_admin_log`
--

DROP TABLE IF EXISTS `zcb_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1335 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_admin_log`
--

LOCK TABLES `zcb_admin_log` WRITE;
/*!40000 ALTER TABLE `zcb_admin_log` DISABLE KEYS */;
INSERT INTO `zcb_admin_log` VALUES (1317,1,'admin','/admin/index/login.html','登录','{\"__token__\":\"82c2e7b20c2b5a5161a63e61059f044d\",\"username\":\"admin\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514189931),(1318,1,'admin','/admin/auth/rule/del/ids/3','权限管理 规则管理 删除','{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514190212),(1319,1,'admin','/admin/addon/install','插件管理 安装','{\"name\":\"ueditor\",\"force\":\"0\",\"uid\":\"694\",\"token\":\"c2b5b521-449a-480c-bdc5-c31ac9ea2d48\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514252647),(1320,1,'admin','/admin/addon/install','插件管理 安装','{\"name\":\"ueditor\",\"force\":\"0\",\"uid\":\"694\",\"token\":\"c2b5b521-449a-480c-bdc5-c31ac9ea2d48\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514252687),(1321,1,'admin','/admin/auth/rule/edit/ids/121?dialog=1','权限管理 规则管理 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"feedback\",\"title\":\"\\u95ee\\u9898\\u53cd\\u9988\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"121\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514253576),(1322,1,'admin','/admin/auth/rule/edit/ids/75?dialog=1','权限管理 规则管理 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"portal\",\"title\":\"\\u5185\\u5bb9\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"75\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514253596),(1323,1,'admin','/admin/auth/rule/edit/ids/103?dialog=1','权限管理 规则管理 编辑','{\"dialog\":\"1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"law\",\"title\":\"\\u6cd5\\u6761\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"103\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514253617),(1324,1,'admin','/admin/addon/install','插件管理 安装','{\"name\":\"ueditor\",\"force\":\"0\",\"uid\":\"694\",\"token\":\"c2b5b521-449a-480c-bdc5-c31ac9ea2d48\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514260456),(1325,1,'admin','/admin/user/add/ids/0?dialog=1','会员管理 添加','{\"dialog\":\"1\",\"row\":{\"username\":\"wangcailin\",\"userpass\":\"adf\",\"nickname\":\"NameTwo\",\"avatar\":\"\\/assets\\/img\\/qrcode.png\",\"mobile\":\"15227077282\",\"vip\":\"0\",\"vip_time\":\"2017-12-26 12:01:49\",\"company\":\"adfadfad\",\"card\":\"fasdf\",\"realname\":\"adfadsf\",\"create_time\":\"2017-12-26 12:01:49\",\"update_time\":\"2017-12-26 12:01:49\",\"status\":\"normal\"},\"ids\":\"0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514260962),(1326,1,'admin','/admin/user/add/ids/0?dialog=1','会员管理 添加','{\"dialog\":\"1\",\"row\":{\"username\":\"wangcailin\",\"userpass\":\"adf\",\"nickname\":\"NameTwo\",\"avatar\":\"\\/assets\\/img\\/qrcode.png\",\"mobile\":\"15227077282\",\"vip\":\"0\",\"vip_time\":\"2017-12-26 12:01:49\",\"company\":\"adfadfad\",\"card\":\"fasdf\",\"realname\":\"adfadsf\",\"create_time\":\"2017-12-26 12:01:49\",\"update_time\":\"2017-12-26 12:01:49\",\"status\":\"normal\"},\"ids\":\"0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514260982),(1327,1,'admin','/admin/user/add/ids/0?dialog=1','会员管理 添加','{\"dialog\":\"1\",\"row\":{\"username\":\"wangcailin\",\"userpass\":\"adf\",\"nickname\":\"NameTwo\",\"avatar\":\"\\/assets\\/img\\/qrcode.png\",\"mobile\":\"15227077282\",\"vip\":\"0\",\"vip_time\":\"2017-12-26 12:01:49\",\"company\":\"adfadfad\",\"card\":\"fasdf\",\"realname\":\"adfadsf\",\"create_time\":\"2017-12-26 12:01:49\",\"update_time\":\"2017-12-26 12:01:49\",\"status\":\"normal\"},\"ids\":\"0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514260989),(1328,1,'admin','/admin/user/add/ids/0?dialog=1','会员管理 添加','{\"dialog\":\"1\",\"row\":{\"username\":\"wangcailin\",\"userpass\":\"adf\",\"nickname\":\"NameTwo\",\"avatar\":\"\\/assets\\/img\\/qrcode.png\",\"mobile\":\"15227077282\",\"vip\":\"0\",\"vip_time\":\"2017-12-26 12:01:49\",\"company\":\"adfadfad\",\"card\":\"fasdf\",\"realname\":\"adfadsf\",\"create_time\":\"2017-12-26 12:01:49\",\"update_time\":\"2017-12-26 12:01:49\",\"status\":\"normal\"},\"ids\":\"0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514261015),(1329,1,'admin','/admin/user/add/ids/0?dialog=1','会员管理 添加','{\"dialog\":\"1\",\"row\":{\"username\":\"wangcailin\",\"userpass\":\"adf\",\"nickname\":\"NameTwo\",\"avatar\":\"\\/assets\\/img\\/qrcode.png\",\"mobile\":\"15227077282\",\"vip\":\"0\",\"vip_time\":\"2017-12-26 12:01:49\",\"company\":\"adfadfad\",\"card\":\"fasdf\",\"realname\":\"adfadsf\",\"create_time\":\"2017-12-26 12:01:49\",\"update_time\":\"2017-12-26 12:01:49\",\"status\":\"normal\"},\"ids\":\"0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514261067),(1330,1,'admin','/admin/user/add/ids/0?dialog=1','会员管理 添加','{\"dialog\":\"1\",\"row\":{\"username\":\"wangcailin\",\"userpass\":\"adf\",\"nickname\":\"NameTwo\",\"avatar\":\"\\/assets\\/img\\/qrcode.png\",\"mobile\":\"15227077282\",\"vip\":\"0\",\"vip_time\":\"2017-12-26 12:01:49\",\"company\":\"adfadfad\",\"card\":\"fasdf\",\"realname\":\"adfadsf\",\"create_time\":\"2017-12-26 12:01:49\",\"update_time\":\"2017-12-26 12:01:49\",\"status\":\"normal\"},\"ids\":\"0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514261091),(1331,1,'admin','/admin/user/add/ids/0?dialog=1','会员管理 添加','{\"dialog\":\"1\",\"row\":{\"username\":\"wangcailin\",\"userpass\":\"adf\",\"nickname\":\"NameTwo\",\"avatar\":\"\\/assets\\/img\\/qrcode.png\",\"mobile\":\"15227077282\",\"vip\":\"0\",\"vip_time\":\"2017-12-26 12:01:49\",\"company\":\"adfadfad\",\"card\":\"fasdf\",\"realname\":\"adfadsf\",\"create_time\":\"2017-12-26 12:01:49\",\"update_time\":\"2017-12-26 12:01:49\",\"status\":\"normal\"},\"ids\":\"0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514261164),(1332,1,'admin','/admin/banner/add/ids/0?dialog=1','banner管理 添加','{\"dialog\":\"1\",\"row\":{\"title\":\"banner1\",\"image\":\"\\/assets\\/img\\/qrcode.png\",\"url\":\"http:\\/\\/www.baidu.com\",\"valid_time\":\"2017-12-26 13:16:04\",\"status\":\"normal\"},\"ids\":\"0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514265393),(1333,1,'admin','/admin/banner/edit/ids/1?dialog=1','banner管理 编辑','{\"dialog\":\"1\",\"row\":{\"title\":\"banner1\",\"image\":\"\\/assets\\/img\\/qrcode.png\",\"url\":\"http:\\/\\/www.baidu.com\",\"valid_time\":\"2017-12-26 13:16:04\",\"status\":\"hidden\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514265400),(1334,1,'admin','/admin/portal/tag/add/ids/0?dialog=1','内容管理 标签管理 添加','{\"dialog\":\"1\",\"row\":{\"title\":\"#\\u6807\\u7b7e\\u7ba1\\u7406#\",\"status\":\"normal\"},\"ids\":\"0\"}','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:57.0) Gecko/20100101 Firefox/57.0',1514265419);
/*!40000 ALTER TABLE `zcb_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_attachment`
--

DROP TABLE IF EXISTS `zcb_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_attachment`
--

LOCK TABLES `zcb_attachment` WRITE;
/*!40000 ALTER TABLE `zcb_attachment` DISABLE KEYS */;
INSERT INTO `zcb_attachment` VALUES (1,'/assets/img/qrcode.png','150','150','png',0,21859,'image/png','',1499681848,1499681848,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6');
/*!40000 ALTER TABLE `zcb_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_auth_group`
--

DROP TABLE IF EXISTS `zcb_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_auth_group`
--

LOCK TABLES `zcb_auth_group` WRITE;
/*!40000 ALTER TABLE `zcb_auth_group` DISABLE KEYS */;
INSERT INTO `zcb_auth_group` VALUES (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal');
/*!40000 ALTER TABLE `zcb_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_auth_group_access`
--

DROP TABLE IF EXISTS `zcb_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_auth_group_access`
--

LOCK TABLES `zcb_auth_group_access` WRITE;
/*!40000 ALTER TABLE `zcb_auth_group_access` DISABLE KEYS */;
INSERT INTO `zcb_auth_group_access` VALUES (1,1),(2,2),(3,3),(4,5),(5,5);
/*!40000 ALTER TABLE `zcb_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_auth_rule`
--

DROP TABLE IF EXISTS `zcb_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_auth_rule`
--

LOCK TABLES `zcb_auth_rule` WRITE;
/*!40000 ALTER TABLE `zcb_auth_rule` DISABLE KEYS */;
INSERT INTO `zcb_auth_rule` VALUES (1,'file',0,'dashboard','Dashboard','fa fa-dashboard','','Dashboard tips',1,1497429920,1497429920,143,'normal'),(2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(4,'file',0,'addon','Addon','fa fa-rocket','','Addon tips',1,1502035509,1502035509,0,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),(9,'file',5,'auth/admin','Admin','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','Addon tips',0,1502035509,1502035509,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(59,'file',4,'addon/local','Local install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(61,'file',4,'addon/install','Install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(62,'file',4,'addon/uninstall','Uninstall','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(66,'file',0,'banner','banner管理','fa fa-circle-o','','',1,1514191027,1514191027,0,'normal'),(67,'file',66,'banner/index','查看','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(68,'file',66,'banner/recyclebin','回收站','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(69,'file',66,'banner/add','添加','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(70,'file',66,'banner/edit','编辑','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(71,'file',66,'banner/del','删除','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(72,'file',66,'banner/destroy','真实删除','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(73,'file',66,'banner/restore','还原','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(74,'file',66,'banner/multi','批量更新','fa fa-circle-o','','',0,1514191027,1514191027,0,'normal'),(75,'file',0,'portal','内容管理','fa fa-list','','',1,1514252885,1514253596,0,'normal'),(76,'file',75,'portal/tag','标签管理','fa fa-circle-o','','',1,1514252885,1514252885,0,'normal'),(77,'file',76,'portal/tag/index','查看','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(78,'file',76,'portal/tag/recyclebin','回收站','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(79,'file',76,'portal/tag/add','添加','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(80,'file',76,'portal/tag/edit','编辑','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(81,'file',76,'portal/tag/del','删除','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(82,'file',76,'portal/tag/destroy','真实删除','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(83,'file',76,'portal/tag/restore','还原','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(84,'file',76,'portal/tag/multi','批量更新','fa fa-circle-o','','',0,1514252885,1514252885,0,'normal'),(85,'file',0,'user','会员管理','fa fa-user','','',1,1514252953,1514252953,0,'normal'),(86,'file',85,'user/index','查看','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(87,'file',85,'user/recyclebin','回收站','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(88,'file',85,'user/add','添加','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(89,'file',85,'user/edit','编辑','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(90,'file',85,'user/del','删除','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(91,'file',85,'user/destroy','真实删除','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(92,'file',85,'user/restore','还原','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(93,'file',85,'user/multi','批量更新','fa fa-circle-o','','',0,1514252953,1514252953,0,'normal'),(94,'file',75,'portal/post','文章管理','fa fa-circle-o','','',1,1514252991,1514252991,0,'normal'),(95,'file',94,'portal/post/index','查看','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(96,'file',94,'portal/post/recyclebin','回收站','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(97,'file',94,'portal/post/add','添加','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(98,'file',94,'portal/post/edit','编辑','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(99,'file',94,'portal/post/del','删除','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(100,'file',94,'portal/post/destroy','真实删除','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(101,'file',94,'portal/post/restore','还原','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(102,'file',94,'portal/post/multi','批量更新','fa fa-circle-o','','',0,1514252991,1514252991,0,'normal'),(103,'file',0,'law','法条管理','fa fa-circle-o','','',1,1514253065,1514253617,0,'normal'),(104,'file',103,'law/index','查看','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(105,'file',103,'law/recyclebin','回收站','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(106,'file',103,'law/add','添加','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(107,'file',103,'law/edit','编辑','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(108,'file',103,'law/del','删除','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(109,'file',103,'law/destroy','真实删除','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(110,'file',103,'law/restore','还原','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(111,'file',103,'law/multi','批量更新','fa fa-circle-o','','',0,1514253065,1514253065,0,'normal'),(112,'file',0,'order','订单管理','fa fa-circle-o','','',1,1514253096,1514253096,0,'normal'),(113,'file',112,'order/index','查看','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(114,'file',112,'order/recyclebin','回收站','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(115,'file',112,'order/add','添加','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(116,'file',112,'order/edit','编辑','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(117,'file',112,'order/del','删除','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(118,'file',112,'order/destroy','真实删除','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(119,'file',112,'order/restore','还原','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(120,'file',112,'order/multi','批量更新','fa fa-circle-o','','',0,1514253096,1514253096,0,'normal'),(121,'file',0,'feedback','问题反馈','fa fa-circle-o','','',1,1514253113,1514253576,0,'normal'),(122,'file',121,'feedback/index','查看','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(123,'file',121,'feedback/recyclebin','回收站','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(124,'file',121,'feedback/add','添加','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(125,'file',121,'feedback/edit','编辑','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(126,'file',121,'feedback/del','删除','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(127,'file',121,'feedback/destroy','真实删除','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(128,'file',121,'feedback/restore','还原','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(129,'file',121,'feedback/multi','批量更新','fa fa-circle-o','','',0,1514253113,1514253305,0,'normal'),(130,'file',0,'safeguard','维权列表管理','fa fa-circle-o','','',1,1514253199,1514253199,0,'normal'),(131,'file',130,'safeguard/index','查看','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(132,'file',130,'safeguard/recyclebin','回收站','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(133,'file',130,'safeguard/add','添加','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(134,'file',130,'safeguard/edit','编辑','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(135,'file',130,'safeguard/del','删除','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(136,'file',130,'safeguard/destroy','真实删除','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(137,'file',130,'safeguard/restore','还原','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(138,'file',130,'safeguard/multi','批量更新','fa fa-circle-o','','',0,1514253199,1514253199,0,'normal'),(139,'file',0,'goods','服务商品管理','fa fa-circle-o','','',1,1514267299,1514267299,0,'normal'),(140,'file',139,'goods/index','查看','fa fa-circle-o','','',0,1514267299,1514267299,0,'normal'),(141,'file',139,'goods/recyclebin','回收站','fa fa-circle-o','','',0,1514267299,1514267299,0,'normal'),(142,'file',139,'goods/add','添加','fa fa-circle-o','','',0,1514267299,1514267299,0,'normal'),(143,'file',139,'goods/edit','编辑','fa fa-circle-o','','',0,1514267299,1514267299,0,'normal'),(144,'file',139,'goods/del','删除','fa fa-circle-o','','',0,1514267299,1514267299,0,'normal'),(145,'file',139,'goods/destroy','真实删除','fa fa-circle-o','','',0,1514267299,1514267299,0,'normal'),(146,'file',139,'goods/restore','还原','fa fa-circle-o','','',0,1514267299,1514267299,0,'normal'),(147,'file',139,'goods/multi','批量更新','fa fa-circle-o','','',0,1514267299,1514267299,0,'normal');
/*!40000 ALTER TABLE `zcb_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_banner`
--

DROP TABLE IF EXISTS `zcb_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `image` varchar(100) NOT NULL COMMENT '图片',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `valid_time` int(10) DEFAULT NULL COMMENT '过期时间',
  `status` varchar(50) NOT NULL COMMENT '是否开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='banner表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_banner`
--

LOCK TABLES `zcb_banner` WRITE;
/*!40000 ALTER TABLE `zcb_banner` DISABLE KEYS */;
INSERT INTO `zcb_banner` VALUES (1,'banner1','/assets/img/qrcode.png','http://www.baidu.com',1514265364,'hidden');
/*!40000 ALTER TABLE `zcb_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_config`
--

DROP TABLE IF EXISTS `zcb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_config`
--

LOCK TABLES `zcb_config` WRITE;
/*!40000 ALTER TABLE `zcb_config` DISABLE KEYS */;
INSERT INTO `zcb_config` VALUES (1,'name','basic','Site name','请填写站点名称','string','FastAdmin','','required',''),(2,'beian','basic','Beian','粤ICP备15054802号-4','string','','','',''),(3,'cdnurl','basic','Cdn url','如果静态资源使用第三方云储存请配置该值','string','','','',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','',''),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required',''),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"Please select\",\"SMTP\",\"Mail\"]','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码）','string','password','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"None\",\"TLS\",\"SSL\"]','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','','');
/*!40000 ALTER TABLE `zcb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_favorites`
--

DROP TABLE IF EXISTS `zcb_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_favorites` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `law_id` int(10) NOT NULL COMMENT '法条ID',
  `time` int(10) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_favorites`
--

LOCK TABLES `zcb_favorites` WRITE;
/*!40000 ALTER TABLE `zcb_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_feedback`
--

DROP TABLE IF EXISTS `zcb_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `content` text NOT NULL COMMENT '反馈内容',
  `images` varchar(255) DEFAULT NULL COMMENT '反馈图片',
  `time` int(10) NOT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题反馈表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_feedback`
--

LOCK TABLES `zcb_feedback` WRITE;
/*!40000 ALTER TABLE `zcb_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_goods`
--

DROP TABLE IF EXISTS `zcb_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '服务名称',
  `price` decimal(10,2) NOT NULL COMMENT '服务金额',
  `limit_time` varchar(10) NOT NULL COMMENT '期限(天)',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  `status` varchar(50) NOT NULL COMMENT '状态: normal正常,hidden隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_goods`
--

LOCK TABLES `zcb_goods` WRITE;
/*!40000 ALTER TABLE `zcb_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_law`
--

DROP TABLE IF EXISTS `zcb_law`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_law` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='法条表\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_law`
--

LOCK TABLES `zcb_law` WRITE;
/*!40000 ALTER TABLE `zcb_law` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_law` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_law_content`
--

DROP TABLE IF EXISTS `zcb_law_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_law_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_law_content`
--

LOCK TABLES `zcb_law_content` WRITE;
/*!40000 ALTER TABLE `zcb_law_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_law_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_order`
--

DROP TABLE IF EXISTS `zcb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) NOT NULL COMMENT '订单号',
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `goods_id` int(10) NOT NULL COMMENT '商品ID',
  `status` tinyint(1) NOT NULL COMMENT '状态: 0未支付,1已支付',
  `add_time` int(10) NOT NULL COMMENT '订单创建时间',
  `pay_time` int(10) DEFAULT NULL COMMENT '订单支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_order`
--

LOCK TABLES `zcb_order` WRITE;
/*!40000 ALTER TABLE `zcb_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_portal_post`
--

DROP TABLE IF EXISTS `zcb_portal_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_portal_post` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `keywords` varchar(150) DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `content` text COMMENT '文章内容',
  `images` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `like` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `published_time` int(10) DEFAULT NULL COMMENT '发布时间',
  `is_reply` tinyint(1) DEFAULT NULL COMMENT '回复: 0否,1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_portal_post`
--

LOCK TABLES `zcb_portal_post` WRITE;
/*!40000 ALTER TABLE `zcb_portal_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_portal_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_portal_tag`
--

DROP TABLE IF EXISTS `zcb_portal_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_portal_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `post_count` int(10) DEFAULT NULL COMMENT '标签文章数',
  `status` varchar(50) DEFAULT NULL COMMENT '状态: normal正常,hidden隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_portal_tag`
--

LOCK TABLES `zcb_portal_tag` WRITE;
/*!40000 ALTER TABLE `zcb_portal_tag` DISABLE KEYS */;
INSERT INTO `zcb_portal_tag` VALUES (1,'#标签管理#',NULL,'normal');
/*!40000 ALTER TABLE `zcb_portal_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_portal_tag_post`
--

DROP TABLE IF EXISTS `zcb_portal_tag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_portal_tag_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) DEFAULT NULL COMMENT '标签ID',
  `post_id` int(10) DEFAULT NULL COMMENT '文章ID',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态: 0未审核,1发布',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_portal_tag_post`
--

LOCK TABLES `zcb_portal_tag_post` WRITE;
/*!40000 ALTER TABLE `zcb_portal_tag_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_portal_tag_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_safeguard`
--

DROP TABLE IF EXISTS `zcb_safeguard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_safeguard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '用户ID',
  `company` varchar(100) NOT NULL COMMENT '公司名称',
  `company_address` varchar(255) NOT NULL COMMENT '公司地址',
  `contact` varchar(50) NOT NULL COMMENT '联系人',
  `contact_phone` varchar(50) NOT NULL COMMENT '联系方式',
  `job_post` varchar(50) NOT NULL COMMENT '工作职位',
  `job_address` varchar(255) NOT NULL COMMENT '工作地址',
  `job_time` int(10) NOT NULL COMMENT '入职时间',
  `compact` tinyint(1) NOT NULL COMMENT '合同: 0否,1是',
  `rights_type` tinyint(1) NOT NULL COMMENT '维权类型',
  `rights_money` decimal(10,2) NOT NULL COMMENT '维权金额',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `description` text NOT NULL COMMENT '情况描述',
  `ask` text COMMENT '期望解决办法',
  `job_name` varchar(50) DEFAULT NULL COMMENT '职工名称',
  `job_age` varchar(50) DEFAULT NULL COMMENT '工龄',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别: 0无,1男,2女',
  `registered` tinyint(1) DEFAULT NULL COMMENT '户口性质: 0农村,1城镇',
  `status` tinyint(1) unsigned DEFAULT '0' COMMENT '状态: 0进行中,1成功,2失败,3仲裁成功,4仲裁失败,5代发律师函进行中,6仲裁进行中,7律师函成功,8律师函失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='维权列表表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_safeguard`
--

LOCK TABLES `zcb_safeguard` WRITE;
/*!40000 ALTER TABLE `zcb_safeguard` DISABLE KEYS */;
/*!40000 ALTER TABLE `zcb_safeguard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zcb_user`
--

DROP TABLE IF EXISTS `zcb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zcb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `userpass` varchar(50) NOT NULL COMMENT '密码',
  `nickname` varchar(50) NOT NULL COMMENT '用户昵称',
  `avatar` varchar(50) NOT NULL COMMENT '用户头像',
  `mobile` varchar(50) NOT NULL COMMENT '手机号',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '会员: 0否,1是',
  `vip_time` int(10) DEFAULT NULL COMMENT '会员到期时间',
  `company` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `card` varchar(50) DEFAULT NULL COMMENT '身份证',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `create_time` int(10) NOT NULL COMMENT '注册时间',
  `update_time` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `status` varchar(50) NOT NULL COMMENT '状态: normal正常,hidden隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zcb_user`
--

LOCK TABLES `zcb_user` WRITE;
/*!40000 ALTER TABLE `zcb_user` DISABLE KEYS */;
INSERT INTO `zcb_user` VALUES (1,'wangcailin','adf','NameTwo','/assets/img/qrcode.png','15227077282',0,NULL,'adfadfad','fasdf','adfadsf',1514260909,1514260909,'normal');
/*!40000 ALTER TABLE `zcb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-26 13:55:32
