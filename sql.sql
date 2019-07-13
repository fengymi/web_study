-- MySQL dump 10.13  Distrib 5.7.3-m13, for Win64 (x86_64)
--
-- Host: localhost    Database: design
-- ------------------------------------------------------
-- Server version	5.7.3-m13-log

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
-- Table structure for table `count_num`
--

DROP TABLE IF EXISTS `count_num`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `count_num` (
  `count_id` int(11) NOT NULL AUTO_INCREMENT,
  `visitor_num` int(11) DEFAULT '0' COMMENT '游客数',
  `user_num` int(11) DEFAULT '0' COMMENT '在线用户数',
  `connection_num` int(11) DEFAULT '0' COMMENT '连接用户数',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`count_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count_num`
--

LOCK TABLES `count_num` WRITE;
/*!40000 ALTER TABLE `count_num` DISABLE KEYS */;
/*!40000 ALTER TABLE `count_num` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL COMMENT '课程名称',
  `c_user_id` int(11) DEFAULT NULL COMMENT '发布人id',
  `course_author` varchar(255) DEFAULT NULL COMMENT '主讲人',
  `course_language` int(11) DEFAULT NULL COMMENT '语言',
  `img_url` varchar(255) DEFAULT NULL COMMENT '标题图片url',
  `img_id` int(11) DEFAULT NULL COMMENT '图片id',
  `course_desc` varchar(1000) DEFAULT NULL COMMENT '课程介绍',
  PRIMARY KEY (`course_id`),
  KEY `course_language` (`course_language`),
  KEY `img_id` (`img_id`),
  KEY `c_user_id` (`c_user_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`course_language`) REFERENCES `language` (`l_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`img_id`) REFERENCES `file` (`file_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `course_ibfk_4` FOREIGN KEY (`c_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `curriculum_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL COMMENT '课程id',
  `curriculum_num` int(11) DEFAULT NULL COMMENT '某节课编号',
  `name` varchar(255) DEFAULT NULL COMMENT '某节课名称',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频链接',
  `video_id` int(11) DEFAULT NULL COMMENT '视频资源id',
  `resource_url` varchar(255) DEFAULT NULL COMMENT '资源文件',
  `resource_id` int(11) DEFAULT NULL COMMENT '资源id',
  `desc` varchar(1000) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`curriculum_id`),
  KEY `c_id` (`c_id`),
  KEY `video_id` (`video_id`),
  KEY `curriculum_ibfk_3` (`resource_id`),
  CONSTRAINT `curriculum_ibfk_3` FOREIGN KEY (`resource_id`) REFERENCES `file` (`file_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `curriculum_ibfk_4` FOREIGN KEY (`c_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `curriculum_ibfk_5` FOREIGN KEY (`video_id`) REFERENCES `file` (`file_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `group` varchar(255) DEFAULT NULL COMMENT '文件组',
  `remote_name` varchar(255) DEFAULT NULL COMMENT '服务器上的文件名',
  `ext` varchar(20) DEFAULT NULL COMMENT '文件扩展名',
  `length` bigint(20) DEFAULT NULL COMMENT '文件大小(B)',
  `author_id` int(11) DEFAULT NULL COMMENT '上传者id',
  `status` char(1) DEFAULT '1' COMMENT '状态: 1正常,2异常',
  `verity_id` int(11) DEFAULT NULL COMMENT '审核者id',
  `upload_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文件上传时间',
  PRIMARY KEY (`file_id`),
  KEY `author_id` (`author_id`),
  KEY `verity_id` (`verity_id`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `sys_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `file_ibfk_2` FOREIGN KEY (`verity_id`) REFERENCES `sys_user` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '语言名称',
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='课程语言类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Java'),(2,'C'),(3,'Android'),(4,'Sql'),(5,'python'),(6,'C++'),(7,'JavaScript'),(8,'CSS'),(9,'HTML'),(10,'其它');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine` (
  `machine_id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL COMMENT '主机',
  `protocol` varchar(30) DEFAULT 'SSH' COMMENT '协议 SSH,VNC,RDP,TELNET',
  `port` int(11) DEFAULT '22',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `system` char(1) DEFAULT '1' COMMENT '系统类型 1:linux,2:windows,3:mac',
  `m_status` char(1) DEFAULT '1' COMMENT '虚拟机是否可用:1可用,0禁用',
  PRIMARY KEY (`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='虚拟机';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
INSERT INTO `machine` VALUES (1,'192.168.182.130','RDP',3389,'公司win7','2','1'),(2,'115.159.55.209','SSH',22,'tencent','1','1'),(4,'192.168.68.150','RDP',3389,'笔记本win7-01','2','1'),(5,'192.168.68.146','SSH',22,'笔记本-01','1','1'),(6,'192.168.182.129','RDP',3389,'公司xp','2','1'),(7,'192.168.68.153','RDP',3389,'笔记本xp','2','1');
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_user`
--

DROP TABLE IF EXISTS `machine_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_user` (
  `mu_id` int(11) NOT NULL AUTO_INCREMENT,
  `machine_id` int(11) DEFAULT NULL COMMENT '虚拟机id',
  `username` varchar(32) DEFAULT NULL COMMENT '账号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `status` char(1) NOT NULL DEFAULT '1' COMMENT '使用状态 1可用:0使用中:2异常',
  PRIMARY KEY (`mu_id`),
  KEY `machine_id` (`machine_id`) USING BTREE,
  CONSTRAINT `machine_user_ibfk_1` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`machine_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟机对应的用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_user`
--

LOCK TABLES `machine_user` WRITE;
/*!40000 ALTER TABLE `machine_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_server`
--

DROP TABLE IF EXISTS `proxy_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy_server` (
  `server_id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT '' COMMENT '主机地址',
  `port` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `s_status` char(1) DEFAULT '1' COMMENT '状态:禁用0,1正常',
  PRIMARY KEY (`server_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='guacd服务器';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_server`
--

LOCK TABLES `proxy_server` WRITE;
/*!40000 ALTER TABLE `proxy_server` DISABLE KEYS */;
INSERT INTO `proxy_server` VALUES (10,'192.168.68.156',4822,'笔记本proxy-guacd','1');
/*!40000 ALTER TABLE `proxy_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `type` char(1) DEFAULT NULL COMMENT '菜单类型: 1:按钮,0链接',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='系统菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'主页','<i class=\"fa fa-home\"></i>','0'),(2,'系统管理','<i class=\"fa fa-cog\"></i>','1'),(3,'服务器','<i class=\"fa fa-server\"></i>','1'),(4,'菜单管理','<i class=\"fa fa-bars\"></i>','0'),(5,'用户管理','<i class=\"fa fa-user-secret\"></i>','1'),(8,'连接虚拟机','<i class=\"fa fa-tasks\"></i>','0'),(9,'文件上传','<i class=\"fa fa-files-o\"></i>','0'),(10,'课程管理','<i class=\"fa fa-book\"></i>','1');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `permission_name` varchar(128) NOT NULL COMMENT '资源名称',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `p_available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  `icon` varchar(255) DEFAULT 'fa-genderless' COMMENT '图标',
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`permission_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `sys_permission_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (1,'主页','admin/index','1','fa-genderless',1),(2,'代理服务器','system/server/list','1','fa-genderless',3),(3,'远程虚拟机','system/machine/list','1','fa-genderless',3),(4,'虚拟机登录账号','system/machine_user/list','1','fa-genderless',3),(5,'系统用户','system/user/list','1','fa-genderless',2),(6,'普通用户','system/user/list_common','1','fa-genderless',5),(7,'角色管理','system/role/list','1','fa-genderless',2),(8,'权限管理','system/permission/list','1','fa-genderless',2),(12,'菜单管理','system/menu/list','1','fa-genderless',4),(13,'连接虚拟机','user/machine/list','1','fa-genderless',8),(14,'文件管理','file/manager/list','1','fa-genderless',2),(15,'文件上传','file/upload','1','fa-genderless',9),(16,'发布课程','course_manager/publish','1','fa-genderless',10),(17,'我的课程','course_manager/list','1','fa-genderless',10),(18,'系统课程管理','system_course/list','1','fa-genderless',2),(19,'系统图标','system/icon','1','fa-genderless',2);
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(128) NOT NULL,
  `available` char(1) NOT NULL DEFAULT '1' COMMENT '是否可用,1：可用，0禁用',
  `is_sys` char(1) NOT NULL DEFAULT '0' COMMENT '用户类型,1系统用户,0普通用户',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (2,'系统管理员','1','1'),(3,'普通用户','1','0'),(4,'测试员','1','0'),(5,'开发人员','1','1'),(6,'教师','1','1');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_permission` (
  `rp_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`rp_id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='角色-权限关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
INSERT INTO `sys_role_permission` VALUES (61,5,1),(62,5,2),(63,5,3),(64,5,4),(65,5,5),(66,5,6),(67,5,7),(68,5,8),(69,5,12),(80,2,5),(81,2,6),(82,2,7),(83,2,8),(85,4,1),(86,5,13),(88,2,13),(90,4,13),(91,5,14),(92,5,15),(94,5,16),(95,5,17),(96,6,16),(97,6,17),(98,5,18),(101,3,13),(102,3,13),(103,5,19),(104,6,1),(105,6,15);
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nickname` varchar(255) NOT NULL COMMENT '账号',
  `username` varchar(64) NOT NULL COMMENT '姓名',
  `password` varchar(64) NOT NULL DEFAULT '123456' COMMENT '密码',
  `locked` char(1) DEFAULT '0' COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'关羽','fengymi','2023B158FF07BD8B505C3BC0109F0545','0'),(2,'普通用户测试','test','7CF1272EF21618A19D8DA93A21650560','1'),(3,'张三','zhangSan','9002B236DB2219C1B14AE82559AEAF63','0'),(5,'李四','lisi','7CF1272EF21618A19D8DA93A21650560','0'),(6,'王五','wangWu','7CF1272EF21618A19D8DA93A21650560','0'),(10,'123456','123456','7CF1272EF21618A19D8DA93A21650560','0'),(11,'张老师','zhang','7CF1272EF21618A19D8DA93A21650560','0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `ur_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`ur_id`),
  KEY `sys_user_role_ibfk_1` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='用户-角色关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (2,1,2),(24,3,3),(26,5,4),(29,2,4),(32,6,3),(33,1,5),(34,6,2),(38,10,3),(39,11,6);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-13  9:15:14
