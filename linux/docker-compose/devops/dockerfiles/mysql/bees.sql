drop database if exists bees;
create database bees;
use bees;

/*
Navicat MySQL Data Transfer

Source Server         : docker_mysql
Source Server Version : 80015
Source Host           : 47.96.238.21:3306
Source Database       : bees

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-03-11 18:06:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` varchar(64) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '鏍囬',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '浣滆€呯殑username',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `publish_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发表时间',
  `file_uuid` varchar(64) DEFAULT NULL COMMENT '文件的uuid',
  `object_version_number` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('00bd8bb8b1e24e939915e6731326ab40', '数据库增加表空间', '王威', '', null, '863ea6208cff4deb8330638a514eea01', '1', 'zero', '2019-01-24 04:52:35', 'zero', '2019-01-24 04:52:35');
INSERT INTO `article` VALUES ('06d4868bce464082926df6abcd814b44', '服务器从零开始（2D）-Docker+Tomcat+Nginx+MySQL', '吴晨瑞', 'PUBLISHED', '2019-02-26 09:30:27', '874aef6916fa4e0f98a261a7aaeee8ea', '1', 'kerry', '2019-02-26 09:30:27', 'anonymous', '2019-02-26 09:30:27');
INSERT INTO `article` VALUES ('0c3e2f4a9f9c47e1b499432da6f80462', 'Linux服务器增加CA证书用以访问https接口', '林泳洁', '', '2019-01-17 17:06:12', '1bf1f54d1f024e2cbb4351a6e68a1c9e', '1', 'admin', '2019-01-17 17:06:12', 'admin', '2019-01-17 17:06:12');
INSERT INTO `article` VALUES ('455b97de71f44eeda0e359532724b5e8', '三菱服务器重启', '王威', '', null, '8a817dce1c0040088056507c812d4f2b', '1', 'zero', '2019-01-24 04:47:30', 'zero', '2019-01-24 04:47:30');
INSERT INTO `article` VALUES ('4594d583f4a845968009c543d122bf60', 'Spring系列-基础篇（3）-搭建开发环境（基于Tomcat）', '吴晨瑞', 'PUBLISHED', '2019-02-26 09:30:33', '6afb0cda140111e9b1a30242c0a84002', '1', 'kerry', '2019-02-26 09:30:33', '1', '2019-02-26 09:30:33');
INSERT INTO `article` VALUES ('530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', 'Spring系列-基础篇（1）-玩转本地Maven', '吴晨瑞', 'PUBLISHED', '2019-01-12 10:58:08', '8ae4c76d10ad11e9a0aa0242ac1b00028ae4c77510ad11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-12 10:58:08', 'kerry', '2019-01-12 10:58:08');
INSERT INTO `article` VALUES ('53e68c687a114f71b96bccb9854473ac', '修改webcenter授权登录页', '吴晨瑞', '', '2019-01-18 01:05:06', '9a148c85189e4f80933d714221f30b43', '1', 'kerry', '2019-01-18 01:05:06', 'kerry', '2019-01-18 01:05:06');
INSERT INTO `article` VALUES ('55c692ac59d94fdbb06f217bb7275642', 'spring boot开发soap webservice', '郑剑峰', 'PUBLISHED', '2019-02-26 09:31:44', 'e0307e73142011e98e130242c0a85002', '1', 'root', '2019-02-26 09:31:44', '1', '2019-02-26 09:31:44');
INSERT INTO `article` VALUES ('5bc6d99cc971448383028118fe6c8f8c', '三菱WeblogicConsole监控程序使用', '王威', '', null, '86bb94cd85d044dda0b5287b05b29270', '1', 'zero', '2019-01-24 04:33:16', 'zero', '2019-01-24 04:33:16');
INSERT INTO `article` VALUES ('5c568f755c7d4f65bdca30840f565a84', '三菱新统一流程中心接入规范', '王威', '', null, '078ca2802c2546d8b50025392d1e3865', '1', 'zero', '2019-01-24 05:25:20', 'zero', '2019-01-24 05:25:20');
INSERT INTO `article` VALUES ('6014d7abacfd4034bf3e2ded207468ba', '运维课堂 - 服务器硬盘溢出', '吴晨瑞', '', null, '9eb50d49da7740849d70c3cceedc9f48', '1', 'kerry', '2019-01-18 02:04:00', 'kerry', '2019-01-18 02:04:00');
INSERT INTO `article` VALUES ('70b0ab6c15d345b395426cd30bbdfa26', '日志平台（网关层） - 基于Openresty+ELKF+Kafka', '吴晨瑞', 'PUBLISHED', '2019-02-26 09:30:41', '4cc5013b10cc11e9b2590242ac1c0002', '1', 'kerry', '2019-02-26 09:30:41', 'anonymous', '2019-02-26 09:30:41');
INSERT INTO `article` VALUES ('79632780cd9a4cac86a427061b978a4a', 'DevOps - Spring Boot自动部署到WebLogic', '吴晨瑞', 'PUBLISHED', '2019-02-26 09:30:48', 'f70b5807140311e9b1a30242c0a84002', '1', 'kerry', '2019-02-26 09:30:48', '1', '2019-02-26 09:30:48');
INSERT INTO `article` VALUES ('7ddb9cc9d6b24048a098bc805213a6e0', 'Weblogic server运行内存大小配置说明', '吴伟超', '', null, '3fde638f0c1248798f9fd2381d636821', '1', 'leo', '2019-01-21 04:46:05', 'leo', '2019-01-21 04:46:05');
INSERT INTO `article` VALUES ('834470bab65445a0a34e714fe0f28f8d', 'Angular基础技术分享', '徐向明', '', null, 'bd357d4ea7cc41e59289cc4c237c97ab', '1', 'mm', '2019-01-24 09:54:23', 'mm', '2019-01-24 09:54:23');
INSERT INTO `article` VALUES ('919493ab3980403794e7c254a4f35ab4', '2018互联网设计圈大盘点', '高文斌', '', null, '068b112268f346b2a29e06426fbd0bc6', '1', 'steve', '2019-01-23 03:23:05', 'steve', '2019-01-23 03:23:05');
INSERT INTO `article` VALUES ('9e7e3fdc44c349eda7e250f6425a64a0', '如何做好项目的需求分析？', '高文斌', '', null, '4056760c7e23425d91eb41eb9725fa32', '1', 'steve', '2019-01-23 02:35:28', 'steve', '2019-01-23 02:35:28');
INSERT INTO `article` VALUES ('a4cf8c7a5ae342aa9784687a5ef136d7', 'Angular前端部署', '徐向明', '', null, '31ee7d51d73f4df6ae9b84fba581d76e', '1', 'mm', '2019-02-27 06:28:16', 'mm', '2019-02-27 06:28:16');
INSERT INTO `article` VALUES ('a67d7a9127d34978b3696ceb3e68b5d5', '服务器从零开始（1D）-user+sudo+vnc', '吴晨瑞', 'PUBLISHED', '2019-02-26 09:31:06', '6c3bdcba10b211e9a0aa0242ac1b000wwc3bdcc310b211e9a0aa0242ac1b0002', '1', 'kerry', '2019-02-26 09:31:06', 'anonymous', '2019-02-26 09:31:06');
INSERT INTO `article` VALUES ('c1200fd6a7184740a3131ee481101716', '运维课堂 - 数据库归档日志溢出', '吴晨瑞', '', '2019-01-18 02:01:18', '724f1754476b47b7ab55950933b4c24e', '1', 'kerry', '2019-01-18 02:01:18', 'kerry', '2019-01-18 02:01:18');
INSERT INTO `article` VALUES ('d7f35a072c0f47f8bf55cc201f7471ec', 'Bees平台的微服务架构实战记录', '吴晨瑞', 'PUBLISHED', '2019-02-26 09:30:52', '3ce86f3411c411e982220242c0a87002', '1', 'kerry', '2019-02-26 09:30:52', '1', '2019-02-26 09:30:52');
INSERT INTO `article` VALUES ('dbb4ec6650bf46449eeb210ffed035bc', '转载·通用的统一权限管理系统', '高文斌', '', null, '0391cd0eef384e8f9bc55c26b7f419f1', '1', 'steve', '2019-01-24 08:37:25', 'steve', '2019-01-24 08:37:25');
INSERT INTO `article` VALUES ('f1c60ec1f8a94c7ea8b0d6bc43c4b774', '三菱打印平台API说明', '吴晨瑞', '', null, '33df9d740be54c0ba1f1bfff4fddc1a2', '1', 'kerry', '2019-01-23 01:38:22', 'kerry', '2019-01-23 01:38:22');
INSERT INTO `article` VALUES ('ff27e64efc2b4b00a53d6dfa23b74e3d', 'Spring系列-基础篇（2）-IOC和AOP的应用浅谈', '吴晨瑞', 'PUBLISHED', '2019-02-26 09:31:01', '9bafbffc10cb11e9b2590242ac1c0002', '1', 'kerry', '2019-02-26 09:31:01', 'anonymous', '2019-02-26 09:31:01');
INSERT INTO `article` VALUES ('ff6ebd4406f94ed294d8611f2abfa925', 'UI开发框架及规范v1.0', '高文斌', '', null, '669557b4f30740ca8b0f7d14dcb7de0f', '1', 'steve', '2019-01-23 03:25:29', 'steve', '2019-01-23 03:25:29');

-- ----------------------------
-- Table structure for article_comment
-- ----------------------------
DROP TABLE IF EXISTS `article_comment`;
CREATE TABLE `article_comment` (
  `id` varchar(64) NOT NULL,
  `article_id` varchar(64) DEFAULT NULL,
  `content` varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `object_version_number` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(50) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_comment
-- ----------------------------
INSERT INTO `article_comment` VALUES ('1b08eff1c77e43c9b604f4732b4ccf95', '834470bab65445a0a34e714fe0f28f8d', '手动点赞！', '1', 'leo', '2019-02-21 09:08:59', 'leo', '2019-02-21 09:08:59');
INSERT INTO `article_comment` VALUES ('35a93d14fe4f443d9a1db4781aac7f60', 'd7f35a072c0f47f8bf55cc201f7471ec', 'nice', '1', 'steve', '2019-02-22 08:49:02', 'steve', '2019-02-22 08:49:02');
INSERT INTO `article_comment` VALUES ('4b9060f3e6274fe29282f2e4b91998ba', '9e7e3fdc44c349eda7e250f6425a64a0', '写的这么垃圾，居然还有脸给自己刷阅读量。。。没脸没皮！', '1', 'mm', '2019-02-28 03:15:00', 'mm', '2019-02-28 03:15:00');
INSERT INTO `article_comment` VALUES ('4bd39faba7374f0eb301d1475f33e58b', '70b0ab6c15d345b395426cd30bbdfa26', 'nbjnj', '1', 'mm', '2019-02-12 08:13:39', 'mm', '2019-02-12 08:13:39');
INSERT INTO `article_comment` VALUES ('510f3d457b0f4c7681fce012619d5e01', '834470bab65445a0a34e714fe0f28f8d', '内容先不说好不好，主要是人长的太帅！！！内容先不说好不好，主要是人长的太帅！！！内容先不说好不好，主要是人长的太帅！！！内容先不说好不好，主要是人长的太帅！！！内容先不说好不好，主要是人长的太帅！！！内容先不说好不好，主要是人长的太帅！！！内容先不说好不好，主要是人长的太帅！！！内容先不说好不好，主要是人长的太帅！！！内容先不说好不好，主要是人长的太帅！！！内容先不说好不好，主要是人长的太帅！！！', '1', 'kerry', '2019-02-22 08:55:41', 'kerry', '2019-02-22 08:55:41');
INSERT INTO `article_comment` VALUES ('68f008073e1049b0b0e27ba2a591851e', '9e7e3fdc44c349eda7e250f6425a64a0', '转载~', '1', 'steve', '2019-02-22 09:38:52', 'steve', '2019-02-22 09:38:52');
INSERT INTO `article_comment` VALUES ('b5e4094d307040fc85984a48f497232c', '9e7e3fdc44c349eda7e250f6425a64a0', '楼上傻逼！', '1', 'steve', '2019-02-28 03:20:34', 'steve', '2019-02-28 03:20:34');
INSERT INTO `article_comment` VALUES ('d640b3dfc7b64a3f9a1e11a1fe13be6c', '834470bab65445a0a34e714fe0f28f8d', '内容先不说好不好，主要是人长的太帅！！！\n', '1', 'mm', '2019-02-12 08:15:01', 'mm', '2019-02-12 08:15:01');
INSERT INTO `article_comment` VALUES ('e1f2329b93d44ce7ae17e630c5fec141', '834470bab65445a0a34e714fe0f28f8d', '可以可以，很强！', '1', 'leo', '2019-02-21 09:08:46', 'leo', '2019-02-21 09:08:46');

-- ----------------------------
-- Table structure for article_label
-- ----------------------------
DROP TABLE IF EXISTS `article_label`;
CREATE TABLE `article_label` (
  `id` varchar(64) NOT NULL,
  `article_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文章 主键',
  `label_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `label_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '标签名称',
  `object_version_number` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `article_label_n1` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_label
-- ----------------------------
INSERT INTO `article_label` VALUES ('0100081f23be4533909679658a2748d2', '6747cff4bdd044bb883c0f19f676f549', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:25', '1', '2019-01-08 15:26:25');
INSERT INTO `article_label` VALUES ('01480f5bd8044fe0983159da739dc289', '455b97de71f44eeda0e359532724b5e8', 'a26e2ddd10ab11e9a0aa0242ac1b0002a26e2de710ab11e9a0aa0242ac1b0002', 'weblogic', '1', 'zero', '2019-01-24 04:47:30', 'zero', '2019-01-24 04:47:30');
INSERT INTO `article_label` VALUES ('015f1e12df50462b96f62b0451cca513', '06d4868bce464082926df6abcd814b44', 'b760022f10ab11e9a0aa0242ac1b0002b760023910ab11e9a0aa0242ac1b0002', 'tomcat', '1', 'anonymous', '2019-01-05 17:21:15', 'anonymous', '2019-01-05 17:21:15');
INSERT INTO `article_label` VALUES ('041fb490cc4b4bd59dd3fab4849c916e', '63966e153389494491e151eae19782d2', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:22', '1', '2019-01-08 16:02:22');
INSERT INTO `article_label` VALUES ('06a3d5728aac4f26a907e4c3ee477081', '6c1a8695f5e344b58f70d08028e6fb69', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:22', '1', '2019-01-08 15:26:22');
INSERT INTO `article_label` VALUES ('07d4c76f1adc4978a038a984060c7e33', 'e0ff3fc8030d4991ab6d8a2e66475266', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:29', '1', '2019-01-08 15:26:29');
INSERT INTO `article_label` VALUES ('0b318159f87148ab98c355584fcf8d8f', '06d4868bce464082926df6abcd814b44', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', 'anonymous', '2019-01-05 17:21:15', 'anonymous', '2019-01-05 17:21:15');
INSERT INTO `article_label` VALUES ('0bb9e41568964d4b92a20b8e450b0f21', '70b0ab6c15d345b395426cd30bbdfa26', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', 'anonymous', '2019-01-05 17:31:17', 'anonymous', '2019-01-05 17:31:17');
INSERT INTO `article_label` VALUES ('0ed5cdba84704d91aa6a2eefcb9d1602', '55c692ac59d94fdbb06f217bb7275642', '5f4757d2142111e98e130242c0a850025f4757e1142111e98e130242c0a85002', 'springboot', '1', '1', '2019-01-09 15:17:10', '1', '2019-01-09 15:17:10');
INSERT INTO `article_label` VALUES ('0f82b1b07a684ad6ae8e91f76cfa6bd7', '5cecda066fc446d68ecc10efc5e7729e', 'a73bd54c10ab11e9a0aa0242ac1b0002a73bd55510ab11e9a0aa0242ac1b0002', 'oracle', '1', 'kerry', '2019-01-17 15:55:52', 'kerry', '2019-01-17 15:55:52');
INSERT INTO `article_label` VALUES ('13c0173b02254ef48af96ff031e69328', '70b0ab6c15d345b395426cd30bbdfa26', '05b95d0110ac11e9a0aa0242ac1b000205b95d0910ac11e9a0aa0242ac1b0002', 'elk', '1', 'anonymous', '2019-01-05 17:31:17', 'anonymous', '2019-01-05 17:31:17');
INSERT INTO `article_label` VALUES ('144e53e0c1ea49a7abc9cfeb1f8a7b5a', '921a3309562046c1ae4a121d0171167c', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:27', '1', '2019-01-08 15:26:27');
INSERT INTO `article_label` VALUES ('15cb4d7ac0194990be81e3e0978cb563', '1e0456d0cb5a455d94967f9f448a430b', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:28:38', '1', '2019-01-08 15:28:38');
INSERT INTO `article_label` VALUES ('1631ebd0362f48549fe04c1eaa37cb8c', '1e0456d0cb5a455d94967f9f448a430b', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:28:38', '1', '2019-01-08 15:28:38');
INSERT INTO `article_label` VALUES ('163c6baec553439fa29cd0797cce5430', '775559cd23bb464589c8ff93f8826327', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:28:37', '1', '2019-01-08 15:28:37');
INSERT INTO `article_label` VALUES ('16ca9db1813949cbb054475ecf2944c8', 'd1ff69b7867f419dba6bbc0c082ff319', '7dbd9f4b140311e9b1a30242c0a84002', 'idea', '1', 'kerry', '2019-01-25 05:37:38', 'kerry', '2019-01-25 05:37:38');
INSERT INTO `article_label` VALUES ('17535450f1ba45f68c6428b888f0613f', '63966e153389494491e151eae19782d2', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:22', '1', '2019-01-08 16:02:22');
INSERT INTO `article_label` VALUES ('17989acf902848c29d5dd222f70d955b', 'a5cbbd762ab74243b2c8d2fdc2d83df6', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:24', '1', '2019-01-08 15:26:24');
INSERT INTO `article_label` VALUES ('195eaa9968274768879bc35b2cfa35ee', 'eff6fc6331a54968a5f2939fd370f06a', 'bb39188a10ab11e9a0aa0242ac1b0002bb39189a10ab11e9a0aa0242ac1b0002', 'bpm', '1', 'kerry', '2019-01-17 16:17:49', 'kerry', '2019-01-17 16:17:49');
INSERT INTO `article_label` VALUES ('1aa651ff25f4415a800349b48b7db549', '5b2d7701e1104de6a5074e19fec9d500', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:19', '1', '2019-01-08 16:02:19');
INSERT INTO `article_label` VALUES ('1df970b20ebd4519a3231d496c544f04', 'eff6fc6331a54968a5f2939fd370f06a', 'd6885a6010ab11e9a0aa0242ac1b0002d6885a6910ab11e9a0aa0242ac1b0002', 'webcenter', '1', 'kerry', '2019-01-17 16:17:49', 'kerry', '2019-01-17 16:17:49');
INSERT INTO `article_label` VALUES ('1ec0b97c46f04e1c9be0ea80a7799776', '834470bab65445a0a34e714fe0f28f8d', '70cc39c810ab11e9a0aa0242ac1b000270cc39d110ab11e9a0aa0242ac1b0002', 'angular', '1', 'mm', '2019-01-24 09:54:23', 'mm', '2019-01-24 09:54:23');
INSERT INTO `article_label` VALUES ('1f0b664355b84da6bea58c8040110fed', '6c1a8695f5e344b58f70d08028e6fb69', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:22', '1', '2019-01-08 15:26:22');
INSERT INTO `article_label` VALUES ('1f0c89c93ed1456a9dd12c1b182d2072', '63966e153389494491e151eae19782d2', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:22', '1', '2019-01-08 16:02:22');
INSERT INTO `article_label` VALUES ('1f4654a2b91a4eefbdf67edab83ceedd', '491b15e89c8444fe9e693fab96675a18', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:26', '1', '2019-01-08 15:26:26');
INSERT INTO `article_label` VALUES ('21dc3efb991b441098a465972a1fedcd', '775559cd23bb464589c8ff93f8826327', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:28:37', '1', '2019-01-08 15:28:37');
INSERT INTO `article_label` VALUES ('227f811f8f944843b99d7169102b83a6', '5ca4395fcc0241e796fa56b93ceb584d', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', 'steve', '2019-01-18 01:10:49', 'steve', '2019-01-18 01:10:49');
INSERT INTO `article_label` VALUES ('22a608b910af11e9a0aa0242ac1b000222a608cb10af11e9a0aa0242ac1b0002', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', 'kerry', '2019-01-05 05:59:59', 'kerry', '2019-01-05 05:59:59');
INSERT INTO `article_label` VALUES ('26c5dff0330e45deadbd2debdd133971', '4e77a5887d264de98cf9a94e4d986295', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:28', '1', '2019-01-08 15:26:28');
INSERT INTO `article_label` VALUES ('27fd7e0cb8eb4e2e92ca1e6d68bcee9a', '5b2d7701e1104de6a5074e19fec9d500', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:19', '1', '2019-01-08 16:02:19');
INSERT INTO `article_label` VALUES ('28e76324ddfa4bf8ab225c1ad93cec95', '894695bebae24d4e9a2ac67acdc19097', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:16', '1', '2019-01-08 16:02:16');
INSERT INTO `article_label` VALUES ('2b1a9c84d1414b23a85f9938da69ac86', 'fd673a33e1194a8699c512a3df097641', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:17', '1', '2019-01-08 16:02:17');
INSERT INTO `article_label` VALUES ('2d644986026d44ae8e5269ae89879d65', '5cecda066fc446d68ecc10efc5e7729e', '8b2171f2142111e98e130242c0a850028b2171fe142111e98e130242c0a85002', 'webservice', '1', 'kerry', '2019-01-17 15:55:52', 'kerry', '2019-01-17 15:55:52');
INSERT INTO `article_label` VALUES ('2e002d3584d64cceb77c989b61e76cd0', 'd013a6f0a7bd4eeda958574e724b20e7', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:23', '1', '2019-01-08 16:02:23');
INSERT INTO `article_label` VALUES ('2ffb2028f1c44cdca0c12926ea4c8336', '5ca4395fcc0241e796fa56b93ceb584d', '593cfacb10ac11e9a0aa0242ac1b0002593cfad910ac11e9a0aa0242ac1b0002', 'maven', '1', 'steve', '2019-01-18 01:10:49', 'steve', '2019-01-18 01:10:49');
INSERT INTO `article_label` VALUES ('3673eaa0702f421089fe646b8d7c792e', 'a5cbbd762ab74243b2c8d2fdc2d83df6', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:24', '1', '2019-01-08 15:26:24');
INSERT INTO `article_label` VALUES ('368bdb08c3504a0a9d491bce092b9c70', '72e49aa72da747c49d87fe6539ae2306', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:15', '1', '2019-01-08 16:02:15');
INSERT INTO `article_label` VALUES ('36b12f8cd9c24cf8a60331d79bf2e177', 'c37abca95bd44939adf54eef874d6b48', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:30', '1', '2019-01-08 15:26:30');
INSERT INTO `article_label` VALUES ('3786b0e410af11e9a0aa0242ac1b00023786b0ed10af11e9a0aa0242ac1b0002', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '593cfacb10ac11e9a0aa0242ac1b0002593cfad910ac11e9a0aa0242ac1b0002', 'maven', '1', 'kerry', '2019-01-05 06:00:34', 'kerry', '2019-01-05 06:00:34');
INSERT INTO `article_label` VALUES ('384d317380214e3498c51b7f75f105c3', '0c3e2f4a9f9c47e1b499432da6f80462', '6522a11810ac11e9a0aa0242ac1b00026522a12510ac11e9a0aa0242ac1b0002', 'java', '1', 'admin', '2019-01-17 16:25:04', 'admin', '2019-01-17 16:25:04');
INSERT INTO `article_label` VALUES ('39a28b1cc8a64568a9043dd0cdd0b769', '79632780cd9a4cac86a427061b978a4a', '114fada5140611e9b1a30242c0a84002', 'devops', '1', '1', '2019-01-09 12:00:55', '1', '2019-01-09 12:00:55');
INSERT INTO `article_label` VALUES ('3b7363579f6e4508b2c2ae2ff2d2f67b', 'd7f35a072c0f47f8bf55cc201f7471ec', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-06 15:09:23', '1', '2019-01-06 15:09:23');
INSERT INTO `article_label` VALUES ('3be4924b275549e9b08acc9b0ad85b1a', '4594d583f4a845968009c543d122bf60', '7dbd9f4b140311e9b1a30242c0a84002', 'idea', '1', '1', '2019-01-09 11:42:30', '1', '2019-01-09 11:42:30');
INSERT INTO `article_label` VALUES ('3e13677cc9bc498c9a03f2ec3198ede4', 'd9a04c67ed974683ba008b8a0aa3f23c', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:18', '1', '2019-01-08 16:02:18');
INSERT INTO `article_label` VALUES ('3f0ec2b1ba28430f81dbcb38e0124ea1', 'd9a04c67ed974683ba008b8a0aa3f23c', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:17', '1', '2019-01-08 16:02:17');
INSERT INTO `article_label` VALUES ('40ad440de07d40788759d0f87a15403e', '6747cff4bdd044bb883c0f19f676f549', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:25', '1', '2019-01-08 15:26:25');
INSERT INTO `article_label` VALUES ('41d009e386d64c5dbfa5d4551dc8ee4e', '2dfe6b7d4cb04516b9fd21574dc3b875', '33fc261710ac11e9a0aa0242ac1b000233fc262110ac11e9a0aa0242ac1b0002', 'adf', '1', 'kerry', '2019-02-26 18:16:33', 'kerry', '2019-02-26 18:16:33');
INSERT INTO `article_label` VALUES ('425f2cfdc119428cbd138963a0b18172', '53b0e1a87a094f15a186c2b60ebfb0ac', 'b760022f10ab11e9a0aa0242ac1b0002b760023910ab11e9a0aa0242ac1b0002', 'tomcat', '1', 'kerry', '2019-01-17 17:08:07', 'kerry', '2019-01-17 17:08:07');
INSERT INTO `article_label` VALUES ('42895c17c33f4b3a8b1156ee4f39740f', 'd013a6f0a7bd4eeda958574e724b20e7', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:23', '1', '2019-01-08 16:02:23');
INSERT INTO `article_label` VALUES ('4480c1ce06af43d4ad5ee139b9a11a74', '4e77a5887d264de98cf9a94e4d986295', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:28', '1', '2019-01-08 15:26:28');
INSERT INTO `article_label` VALUES ('4496697a454f4f5fa47c0fe4509273f3', '6747cff4bdd044bb883c0f19f676f549', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:25', '1', '2019-01-08 15:26:25');
INSERT INTO `article_label` VALUES ('4565109ea6fa4c2a995bc8b37d2ddcd5', '9661c1bbfbff49f1be1631cd4c566b73', 'e804c46310ab11e9a0aa0242ac1b0002e804c47210ab11e9a0aa0242ac1b0002', 'pl/sql', '1', 'kerry', '2019-03-10 15:32:49', 'kerry', '2019-03-10 15:32:49');
INSERT INTO `article_label` VALUES ('468f6a62eb834d7d93a99f1a41d44883', '741c24b844374c14973b1e28e0c630c5', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:28:38', '1', '2019-01-08 15:28:38');
INSERT INTO `article_label` VALUES ('49d231353e9f43dfbe43f58238c0b212', '53e68c687a114f71b96bccb9854473ac', 'd6885a6010ab11e9a0aa0242ac1b0002d6885a6910ab11e9a0aa0242ac1b0002', 'webcenter', '1', 'kerry', '2019-01-18 01:03:55', 'kerry', '2019-01-18 01:03:55');
INSERT INTO `article_label` VALUES ('4f9089f2ac3e4fad9373e9d867a62e47', 'a4cf8c7a5ae342aa9784687a5ef136d7', '70cc39c810ab11e9a0aa0242ac1b000270cc39d110ab11e9a0aa0242ac1b0002', 'angular', '1', 'mm', '2019-02-27 06:28:16', 'mm', '2019-02-27 06:28:16');
INSERT INTO `article_label` VALUES ('52fb7d04c75743d3abbef3dfda550e46', 'dbb4ec6650bf46449eeb210ffed035bc', '31d336731ecd11e9813b0242ac1d0002', '产品设计', '1', 'steve', '2019-01-24 08:37:25', 'steve', '2019-01-24 08:37:25');
INSERT INTO `article_label` VALUES ('543b0f62da4e4b8db8b4fafa403562af', 'b8e7c13c169d4fcca9909a119ddff237', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:23', '1', '2019-01-08 15:26:23');
INSERT INTO `article_label` VALUES ('54c61752036e45a8a8c4f83412b3dc24', '455b97de71f44eeda0e359532724b5e8', '0fef90a310ac11e9a0aa0242ac1b00020fef90b210ac11e9a0aa0242ac1b0002', 'linux', '1', 'zero', '2019-01-24 04:47:30', 'zero', '2019-01-24 04:47:30');
INSERT INTO `article_label` VALUES ('54cfe97d3cac435c83f151f274bd240f', 'eceebda88eb74593acb9afc7683ddaff', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:31', '1', '2019-01-08 15:26:31');
INSERT INTO `article_label` VALUES ('578680b8491c46c39042cb21d338c469', '894695bebae24d4e9a2ac67acdc19097', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:16', '1', '2019-01-08 16:02:16');
INSERT INTO `article_label` VALUES ('578de355ad784ba7aa9a531cd3f2eddc', '741c24b844374c14973b1e28e0c630c5', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:28:38', '1', '2019-01-08 15:28:38');
INSERT INTO `article_label` VALUES ('5852f4471c85426ea2c382588a28d092', '491b15e89c8444fe9e693fab96675a18', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:26', '1', '2019-01-08 15:26:26');
INSERT INTO `article_label` VALUES ('5919469558b2429aa1cecd5ef103e3ab', 'd9a04c67ed974683ba008b8a0aa3f23c', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:18', '1', '2019-01-08 16:02:18');
INSERT INTO `article_label` VALUES ('5cd8fdf5c3b54bddae06eb30e3949eff', '741c24b844374c14973b1e28e0c630c5', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:28:38', '1', '2019-01-08 15:28:38');
INSERT INTO `article_label` VALUES ('5cf30905de1e404aa6811f8b6e97d644', 'fd673a33e1194a8699c512a3df097641', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:17', '1', '2019-01-08 16:02:17');
INSERT INTO `article_label` VALUES ('5e88d0e926a046c180633fcffe5fbcf0', '3168cfb170d44fafabdf07145b06d807', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:18', '1', '2019-01-08 15:26:18');
INSERT INTO `article_label` VALUES ('5fc6054813654c3e9e9a43d35379dbd3', '72e49aa72da747c49d87fe6539ae2306', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:15', '1', '2019-01-08 16:02:15');
INSERT INTO `article_label` VALUES ('61bf7c5d628a4f4c9018ae31b82981cb', '5ca4395fcc0241e796fa56b93ceb584d', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', 'steve', '2019-01-18 01:10:49', 'steve', '2019-01-18 01:10:49');
INSERT INTO `article_label` VALUES ('62a86c1a03fe422895d1b03086f021bf', 'fd673a33e1194a8699c512a3df097641', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:17', '1', '2019-01-08 16:02:17');
INSERT INTO `article_label` VALUES ('62e64f763b8f44d5adaad2868c0eefe4', '79632780cd9a4cac86a427061b978a4a', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-09 12:00:54', '1', '2019-01-09 12:00:54');
INSERT INTO `article_label` VALUES ('62f0caf5460f467197b77bbf8f3d7c5f', '894695bebae24d4e9a2ac67acdc19097', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:16', '1', '2019-01-08 16:02:16');
INSERT INTO `article_label` VALUES ('6606585e4975479c9114f828440d1da5', '0c3e2f4a9f9c47e1b499432da6f80462', '79b7bdd4140311e9b1a30242c0a84002', 'jdk', '1', 'admin', '2019-01-17 16:25:04', 'admin', '2019-01-17 16:25:04');
INSERT INTO `article_label` VALUES ('66f75d75369a4011bb94648d8e26fc54', '5b2d7701e1104de6a5074e19fec9d500', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:19', '1', '2019-01-08 16:02:19');
INSERT INTO `article_label` VALUES ('683b83aa189f4d609cb1cd0940e734da', 'cfe6f92c49f24ea4b6209033403a6733', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:20', '1', '2019-01-08 16:02:20');
INSERT INTO `article_label` VALUES ('6bee41feb708466494ddc38e84aebc3c', '3168cfb170d44fafabdf07145b06d807', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:18', '1', '2019-01-08 15:26:18');
INSERT INTO `article_label` VALUES ('7098fe2d3f5147dd988d2fb6fbd671f8', 'd44b1b80aa1943a6bc34e1c2de1fb5b7', 'e804c46310ab11e9a0aa0242ac1b0002e804c47210ab11e9a0aa0242ac1b0002', 'pl/sql', '1', 'kerry', '2019-03-10 15:36:19', 'kerry', '2019-03-10 15:36:19');
INSERT INTO `article_label` VALUES ('72e9d46e8a024f4bb867f8a6283af6fe', 'c84e0b05c42148789227766ddb89a1d0', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:21', '1', '2019-01-08 16:02:21');
INSERT INTO `article_label` VALUES ('752fa1dd7857410eb8192309eef4a296', '95a1bbcce50e4a859d4ed036a5296bbf', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', 'steve', '2019-01-18 02:23:29', 'steve', '2019-01-18 02:23:29');
INSERT INTO `article_label` VALUES ('760e15e8a35d4f4583cf4118fed44371', '4e77a5887d264de98cf9a94e4d986295', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:28', '1', '2019-01-08 15:26:28');
INSERT INTO `article_label` VALUES ('780db8b8a6b5465a82363de15fe17eed', '0c3e2f4a9f9c47e1b499432da6f80462', 'a26e2ddd10ab11e9a0aa0242ac1b0002a26e2de710ab11e9a0aa0242ac1b0002', 'weblogic', '1', 'admin', '2019-01-17 16:25:04', 'admin', '2019-01-17 16:25:04');
INSERT INTO `article_label` VALUES ('78b75d921ecd4354b441342c7f0f48d5', '775559cd23bb464589c8ff93f8826327', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:28:37', '1', '2019-01-08 15:28:37');
INSERT INTO `article_label` VALUES ('7a20adc41ecd11e9813b0242ac1d0002', '919493ab3980403794e7c254a4f35ab4', '31d336731ecd11e9813b0242ac1d0002', '产品设计', '1', 'kerry', '2019-01-23 05:12:27', 'kerry', '2019-01-23 05:12:27');
INSERT INTO `article_label` VALUES ('7a598c99b554489a8f1ee77201975d07', '1e0456d0cb5a455d94967f9f448a430b', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:28:38', '1', '2019-01-08 15:28:38');
INSERT INTO `article_label` VALUES ('7ed0161ba29d4798a2bc45d5c88942e1', '5ca4395fcc0241e796fa56b93ceb584d', '8b2171f2142111e98e130242c0a850028b2171fe142111e98e130242c0a85002', 'webservice', '1', 'steve', '2019-01-18 01:10:49', 'steve', '2019-01-18 01:10:49');
INSERT INTO `article_label` VALUES ('7f5abbe253e94890b84298048edb554a', 'c84e0b05c42148789227766ddb89a1d0', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:21', '1', '2019-01-08 16:02:21');
INSERT INTO `article_label` VALUES ('80576044c7194bc28f0ed74ef4b2d556', 'b228c726af554709b0bc0f6dc6c16ca8', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:18', '1', '2019-01-08 16:02:18');
INSERT INTO `article_label` VALUES ('8078b99b4c4b4a27958196488f444d7b', 'd1ff69b7867f419dba6bbc0c082ff319', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', 'kerry', '2019-01-25 05:37:38', 'kerry', '2019-01-25 05:37:38');
INSERT INTO `article_label` VALUES ('8378c61f110f4a8eaf596d0010ede166', 'eceebda88eb74593acb9afc7683ddaff', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:31', '1', '2019-01-08 15:26:31');
INSERT INTO `article_label` VALUES ('849905421ecd11e9813b0242ac1d0002', '9e7e3fdc44c349eda7e250f6425a64a0', '31d336731ecd11e9813b0242ac1d0002', '产品设计', '1', 'kerry', '2019-01-23 05:12:45', 'kerry', '2019-01-23 05:12:45');
INSERT INTO `article_label` VALUES ('874aef6916fa4e0f98a261a7aaeee8ea', 'a67d7a9127d34978b3696ceb3e68b5d5', '0fef90a310ac11e9a0aa0242ac1b00020fef90b210ac11e9a0aa0242ac1b0002', 'linux', '1', 'anonymous', '2019-01-05 17:11:10', 'anonymous', '2019-01-05 17:11:10');
INSERT INTO `article_label` VALUES ('88c51813a6c04bf9967b5e9a9a9fbb28', '921a3309562046c1ae4a121d0171167c', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:27', '1', '2019-01-08 15:26:27');
INSERT INTO `article_label` VALUES ('89d5a22547dc4dcea4969c9aa6f32a19', 'c84e0b05c42148789227766ddb89a1d0', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:21', '1', '2019-01-08 16:02:21');
INSERT INTO `article_label` VALUES ('8b48619c70744d0491133c78fb767f37', 'a5cbbd762ab74243b2c8d2fdc2d83df6', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:24', '1', '2019-01-08 15:26:24');
INSERT INTO `article_label` VALUES ('8c7cb2d11ecd11e9813b0242ac1d0002', 'ff6ebd4406f94ed294d8611f2abfa925', '31d336731ecd11e9813b0242ac1d0002', '产品设计', '1', 'kerry', '2019-01-23 05:12:58', 'kerry', '2019-01-23 05:12:58');
INSERT INTO `article_label` VALUES ('8d0dc4dd1d32487c8cadd69efbea3361', '8363527fca9a42209563bcb7ff51cc10', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:27', '1', '2019-01-08 15:26:27');
INSERT INTO `article_label` VALUES ('8d41138ef16c49e49600f2420088c081', '06d4868bce464082926df6abcd814b44', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', 'anonymous', '2019-01-05 17:21:14', 'anonymous', '2019-01-05 17:21:14');
INSERT INTO `article_label` VALUES ('90a74ef9264a4e3898db1670d979b339', '79632780cd9a4cac86a427061b978a4a', 'a26e2ddd10ab11e9a0aa0242ac1b0002a26e2de710ab11e9a0aa0242ac1b0002', 'weblogic', '1', '1', '2019-01-09 12:00:54', '1', '2019-01-09 12:00:54');
INSERT INTO `article_label` VALUES ('925d96e2230a4dc2a6c074d235a09be0', '9d328bdad788489eb57b74f1d05b49ca', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:22', '1', '2019-01-08 16:02:22');
INSERT INTO `article_label` VALUES ('946683533f21438db53e962f4696f2d5', '9d328bdad788489eb57b74f1d05b49ca', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:22', '1', '2019-01-08 16:02:22');
INSERT INTO `article_label` VALUES ('94a9ad799e1b468f91a9209f03f12b14', '6c1a8695f5e344b58f70d08028e6fb69', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:22', '1', '2019-01-08 15:26:22');
INSERT INTO `article_label` VALUES ('97158b2815a64600bec5e435b4e6f428', '921a3309562046c1ae4a121d0171167c', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:27', '1', '2019-01-08 15:26:27');
INSERT INTO `article_label` VALUES ('99b18e7558004c8189b206c3c705c832', '4594d583f4a845968009c543d122bf60', '6dbf50d8140311e9b1a30242c0a840026dbf50e4140311e9b1a30242c0a84002', '数据源', '1', '1', '2019-01-09 11:42:30', '1', '2019-01-09 11:42:30');
INSERT INTO `article_label` VALUES ('9a0260cbf3514b27859189d6bdbca0a3', 'eceebda88eb74593acb9afc7683ddaff', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:31', '1', '2019-01-08 15:26:31');
INSERT INTO `article_label` VALUES ('9a21aba46c12491d9ed8baf4b195e781', 'c1200fd6a7184740a3131ee481101716', 'a73bd54c10ab11e9a0aa0242ac1b0002a73bd55510ab11e9a0aa0242ac1b0002', 'oracle', '1', 'kerry', '2019-01-18 02:00:11', 'kerry', '2019-01-18 02:00:11');
INSERT INTO `article_label` VALUES ('9ede005592e84c0ab900e98ba56cf9d6', '8363527fca9a42209563bcb7ff51cc10', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:27', '1', '2019-01-08 15:26:27');
INSERT INTO `article_label` VALUES ('9f7379eec2a741eca0f87e8a0b29b458', 'ea3a4d2734c3424f8f8420e8621f2d2c', '09dad24610ac11e9a0aa0242ac1b000209dad25310ac11e9a0aa0242ac1b0002', '消息中间件', '1', 'wenc', '2019-01-21 05:48:18', 'wenc', '2019-01-21 05:48:18');
INSERT INTO `article_label` VALUES ('a76b52059aa74bb29b975e38c23723b6', 'd7f35a072c0f47f8bf55cc201f7471ec', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-06 15:09:23', '1', '2019-01-06 15:09:23');
INSERT INTO `article_label` VALUES ('abdfbe48f338473386f5e3199b0d5df6', 'd7f35a072c0f47f8bf55cc201f7471ec', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-06 15:09:23', '1', '2019-01-06 15:09:23');
INSERT INTO `article_label` VALUES ('ac3a9206d6a54e8b8e458d4b874092b1', '1e0456d0cb5a455d94967f9f448a430b', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:28:38', '1', '2019-01-08 15:28:38');
INSERT INTO `article_label` VALUES ('ad5121251dd94870ad1619db246876ad', 'cfe6f92c49f24ea4b6209033403a6733', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 16:02:20', '1', '2019-01-08 16:02:20');
INSERT INTO `article_label` VALUES ('afb4703083d74622b87326cc8a6b4ae0', '3168cfb170d44fafabdf07145b06d807', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:18', '1', '2019-01-08 15:26:18');
INSERT INTO `article_label` VALUES ('b4af3f5ea5944f3ba7e5284868c86e28', '2dfe6b7d4cb04516b9fd21574dc3b875', 'f0039ed2140511e9b1a30242c0a84002', 'jenkins', '1', 'kerry', '2019-02-26 18:16:33', 'kerry', '2019-02-26 18:16:33');
INSERT INTO `article_label` VALUES ('b4b816d80e94461b9bf38067e7fc8820', '3168cfb170d44fafabdf07145b06d807', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:18', '1', '2019-01-08 15:26:18');
INSERT INTO `article_label` VALUES ('b6316b0d369446539af4df44edbad26e', 'b228c726af554709b0bc0f6dc6c16ca8', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:18', '1', '2019-01-08 16:02:18');
INSERT INTO `article_label` VALUES ('b6557f4401c7497398222e408f936a11', '6014d7abacfd4034bf3e2ded207468ba', '0fef90a310ac11e9a0aa0242ac1b00020fef90b210ac11e9a0aa0242ac1b0002', 'linux', '1', 'kerry', '2019-01-18 02:04:00', 'kerry', '2019-01-18 02:04:00');
INSERT INTO `article_label` VALUES ('b69f5006fa8d4f439c4f2d91bfd594e7', 'd9a04c67ed974683ba008b8a0aa3f23c', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:18', '1', '2019-01-08 16:02:18');
INSERT INTO `article_label` VALUES ('b6a2553c29fe4c2486e9e3ef8421f84a', '95a1bbcce50e4a859d4ed036a5296bbf', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', 'steve', '2019-01-18 02:23:29', 'steve', '2019-01-18 02:23:29');
INSERT INTO `article_label` VALUES ('b7e651abb88b4597ab2c8bf35d5628e2', '6747cff4bdd044bb883c0f19f676f549', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:25', '1', '2019-01-08 15:26:25');
INSERT INTO `article_label` VALUES ('b8eef3768a7b43adb24ff20e8a20679a', 'c84e0b05c42148789227766ddb89a1d0', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:21', '1', '2019-01-08 16:02:21');
INSERT INTO `article_label` VALUES ('ba9ea9e0cfb849d6a6e1c1c7160d6720', '9d328bdad788489eb57b74f1d05b49ca', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:22', '1', '2019-01-08 16:02:22');
INSERT INTO `article_label` VALUES ('bc4c5238b3ff4dc5b702d39b2598c8de', '491b15e89c8444fe9e693fab96675a18', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:26', '1', '2019-01-08 15:26:26');
INSERT INTO `article_label` VALUES ('bfa9c29615354f12b029f72d5f75a574', '0c3e2f4a9f9c47e1b499432da6f80462', 'a73bd54c10ab11e9a0aa0242ac1b0002a73bd55510ab11e9a0aa0242ac1b0002', 'oracle', '1', 'admin', '2019-01-17 16:25:04', 'admin', '2019-01-17 16:25:04');
INSERT INTO `article_label` VALUES ('c17a26f271b048e2974f551a47718140', '8363527fca9a42209563bcb7ff51cc10', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:27', '1', '2019-01-08 15:26:27');
INSERT INTO `article_label` VALUES ('c3bd420d74e346ec9420b271ca4d1dbc', '4594d583f4a845968009c543d122bf60', '79b7bdd4140311e9b1a30242c0a84002', 'jdk', '1', '1', '2019-01-09 11:42:30', '1', '2019-01-09 11:42:30');
INSERT INTO `article_label` VALUES ('c48dd2b5c4244b8ab82d70a71b4a5e13', 'c37abca95bd44939adf54eef874d6b48', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:30', '1', '2019-01-08 15:26:30');
INSERT INTO `article_label` VALUES ('c49478ea9c4a47d9b3053c2537cc2e63', 'c1200fd6a7184740a3131ee481101716', '0fef90a310ac11e9a0aa0242ac1b00020fef90b210ac11e9a0aa0242ac1b0002', 'linux', '1', 'kerry', '2019-01-18 02:00:11', 'kerry', '2019-01-18 02:00:11');
INSERT INTO `article_label` VALUES ('c5cf8f5402d24660869bb7c4ff118084', '72e49aa72da747c49d87fe6539ae2306', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:15', '1', '2019-01-08 16:02:15');
INSERT INTO `article_label` VALUES ('c76fea4b11934111bf382a5af2da38ce', '5b2d7701e1104de6a5074e19fec9d500', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:19', '1', '2019-01-08 16:02:19');
INSERT INTO `article_label` VALUES ('c88467e98c6045da9b2fb18d0ce537f9', '894695bebae24d4e9a2ac67acdc19097', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:16', '1', '2019-01-08 16:02:16');
INSERT INTO `article_label` VALUES ('c9833a37c63144f3bef99894b1654049', 'd013a6f0a7bd4eeda958574e724b20e7', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:23', '1', '2019-01-08 16:02:23');
INSERT INTO `article_label` VALUES ('ca32e0c1286d4809bc96daee32428ea8', 'd7f35a072c0f47f8bf55cc201f7471ec', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-06 15:09:23', '1', '2019-01-06 15:09:23');
INSERT INTO `article_label` VALUES ('cc569e87521e47ea9d8ea67f34922d0a', '55c692ac59d94fdbb06f217bb7275642', '76655872142111e98e130242c0a8500276655881142111e98e130242c0a85002', 'soap', '1', '1', '2019-01-09 15:17:10', '1', '2019-01-09 15:17:10');
INSERT INTO `article_label` VALUES ('cdb648c178f849b296c09d6e56f2b5df', '95a1bbcce50e4a859d4ed036a5296bbf', 'a26e2ddd10ab11e9a0aa0242ac1b0002a26e2de710ab11e9a0aa0242ac1b0002', 'weblogic', '1', 'steve', '2019-01-18 02:23:29', 'steve', '2019-01-18 02:23:29');
INSERT INTO `article_label` VALUES ('cdd9a01526a742adbc52942b53d10109', '95a1bbcce50e4a859d4ed036a5296bbf', 'f0039ed2140511e9b1a30242c0a84002', 'jenkins', '1', 'steve', '2019-01-18 02:23:29', 'steve', '2019-01-18 02:23:29');
INSERT INTO `article_label` VALUES ('cea5103885f3485bbbf8939c602b6b68', '775559cd23bb464589c8ff93f8826327', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:28:37', '1', '2019-01-08 15:28:37');
INSERT INTO `article_label` VALUES ('d16c5c6d944c4fb0b5e97759c99dde82', '06d4868bce464082926df6abcd814b44', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', 'anonymous', '2019-01-05 17:21:14', 'anonymous', '2019-01-05 17:21:14');
INSERT INTO `article_label` VALUES ('d18b34cc11d740c29fdb6e12000c3ac1', 'b8e7c13c169d4fcca9909a119ddff237', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:23', '1', '2019-01-08 15:26:23');
INSERT INTO `article_label` VALUES ('d207d9297fcf413d8e6f4b7d85259df2', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '33fc261710ac11e9a0aa0242ac1b000233fc262110ac11e9a0aa0242ac1b0002', 'adf', '1', 'kerry', '2019-01-23 01:38:22', 'kerry', '2019-01-23 01:38:22');
INSERT INTO `article_label` VALUES ('d42b9768ec3c48e28a7075c54913c643', 'b8e7c13c169d4fcca9909a119ddff237', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:23', '1', '2019-01-08 15:26:23');
INSERT INTO `article_label` VALUES ('d5531d9a7df4471784e94d1b85868221', 'cfe6f92c49f24ea4b6209033403a6733', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:20', '1', '2019-01-08 16:02:20');
INSERT INTO `article_label` VALUES ('d575e182f3ef4a4c8bd7a3ccbd1a6100', 'b228c726af554709b0bc0f6dc6c16ca8', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 16:02:18', '1', '2019-01-08 16:02:18');
INSERT INTO `article_label` VALUES ('d66f7ec5e58f4f0eb29693c3d207d546', '63966e153389494491e151eae19782d2', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:22', '1', '2019-01-08 16:02:22');
INSERT INTO `article_label` VALUES ('d82eadf2ffa84f92be2d1d08d1b06f07', 'c37abca95bd44939adf54eef874d6b48', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:30', '1', '2019-01-08 15:26:30');
INSERT INTO `article_label` VALUES ('d99a43adc9c1406886837c0e59d8a2a0', '8363527fca9a42209563bcb7ff51cc10', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:27', '1', '2019-01-08 15:26:27');
INSERT INTO `article_label` VALUES ('d9adbca09f8b4592a18238670f33923f', 'b8e7c13c169d4fcca9909a119ddff237', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:23', '1', '2019-01-08 15:26:23');
INSERT INTO `article_label` VALUES ('d9bbef55ab054576bb66ee0c2b185d06', '4594d583f4a845968009c543d122bf60', 'b760022f10ab11e9a0aa0242ac1b0002b760023910ab11e9a0aa0242ac1b0002', 'tomcat', '1', '1', '2019-01-09 11:42:30', '1', '2019-01-09 11:42:30');
INSERT INTO `article_label` VALUES ('dc28294613934d7e844798e8876d908e', '6c1a8695f5e344b58f70d08028e6fb69', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:22', '1', '2019-01-08 15:26:22');
INSERT INTO `article_label` VALUES ('dc6092bf5d3f4a2d8e477eec726ca86c', '741c24b844374c14973b1e28e0c630c5', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:28:38', '1', '2019-01-08 15:28:38');
INSERT INTO `article_label` VALUES ('df7f44157a3f41b49e69777c071b35f8', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', 'anonymous', '2019-01-05 17:26:30', 'anonymous', '2019-01-05 17:26:30');
INSERT INTO `article_label` VALUES ('e2eb4f32f9d04505afc168b9a105f5da', '53b0e1a87a094f15a186c2b60ebfb0ac', 'bec6673d10ab11e9a0aa0242ac1b0002bec6674710ab11e9a0aa0242ac1b0002', 'osb', '1', 'kerry', '2019-01-17 17:08:07', 'kerry', '2019-01-17 17:08:07');
INSERT INTO `article_label` VALUES ('e5fa561fc29041eca79d6cb6688978c5', 'eceebda88eb74593acb9afc7683ddaff', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:31', '1', '2019-01-08 15:26:31');
INSERT INTO `article_label` VALUES ('e694ebf99cf84791805bfd93e5581b80', '55c692ac59d94fdbb06f217bb7275642', '8b2171f2142111e98e130242c0a850028b2171fe142111e98e130242c0a85002', 'webservice', '1', '1', '2019-01-09 15:17:10', '1', '2019-01-09 15:17:10');
INSERT INTO `article_label` VALUES ('e70476d646a14b05907eb48f5f5326e6', '65766085d8ae4638a613dad17a73dbec', '70cc39c810ab11e9a0aa0242ac1b000270cc39d110ab11e9a0aa0242ac1b0002', 'angular', '1', 'mm', '2019-02-26 14:14:31', 'mm', '2019-02-26 14:14:31');
INSERT INTO `article_label` VALUES ('e9d0ca9119084a5b9e12a0ae2d57b690', 'b4f01f460f1b4b7b91ac38281585466a', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', 'admin', '2019-01-18 01:44:49', 'admin', '2019-01-18 01:44:49');
INSERT INTO `article_label` VALUES ('ea1dbfb101c94549b93a2cbc6c72138f', '491b15e89c8444fe9e693fab96675a18', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:26', '1', '2019-01-08 15:26:26');
INSERT INTO `article_label` VALUES ('eb48ba630c584c4bac618db7c8f0d984', '9d328bdad788489eb57b74f1d05b49ca', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:22', '1', '2019-01-08 16:02:22');
INSERT INTO `article_label` VALUES ('ec95fa990e2047a5b81b408b90896fdc', 'c37abca95bd44939adf54eef874d6b48', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:30', '1', '2019-01-08 15:26:30');
INSERT INTO `article_label` VALUES ('ef64f8e9feb64cb8830511ca5a3bae40', '5bc6d99cc971448383028118fe6c8f8c', 'a26e2ddd10ab11e9a0aa0242ac1b0002a26e2de710ab11e9a0aa0242ac1b0002', 'weblogic', '1', 'zero', '2019-01-24 04:33:16', 'zero', '2019-01-24 04:33:16');
INSERT INTO `article_label` VALUES ('ef9810c71c0a4f1fb418f5cd51c466d9', 'fd673a33e1194a8699c512a3df097641', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:17', '1', '2019-01-08 16:02:17');
INSERT INTO `article_label` VALUES ('f2a226a03cd94471819a3024c9ece4c7', 'a5cbbd762ab74243b2c8d2fdc2d83df6', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:24', '1', '2019-01-08 15:26:24');
INSERT INTO `article_label` VALUES ('f2c841ef2d224afb9f25f74426eb4392', 'e0ff3fc8030d4991ab6d8a2e66475266', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 15:26:29', '1', '2019-01-08 15:26:29');
INSERT INTO `article_label` VALUES ('f377d6c7835f48729b9bccaa10a6557b', '4e77a5887d264de98cf9a94e4d986295', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:28', '1', '2019-01-08 15:26:28');
INSERT INTO `article_label` VALUES ('f6c045de4dc04005872f5821c9bb6f12', '53b0e1a87a094f15a186c2b60ebfb0ac', 'c10aabe410ab11e9a0aa0242ac1b0002c10aabee10ab11e9a0aa0242ac1b0002', 'soa', '1', 'kerry', '2019-01-17 17:08:07', 'kerry', '2019-01-17 17:08:07');
INSERT INTO `article_label` VALUES ('f6f7543245dd420da5d7f757c0110757', 'eff6fc6331a54968a5f2939fd370f06a', 'a26e2ddd10ab11e9a0aa0242ac1b0002a26e2de710ab11e9a0aa0242ac1b0002', 'weblogic', '1', 'kerry', '2019-01-17 16:17:49', 'kerry', '2019-01-17 16:17:49');
INSERT INTO `article_label` VALUES ('f78668f2962e4614bfcd4bf43548fa81', 'e0ff3fc8030d4991ab6d8a2e66475266', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 15:26:29', '1', '2019-01-08 15:26:29');
INSERT INTO `article_label` VALUES ('f86c7df1653241a8b63e72b4a0d75f17', '7ddb9cc9d6b24048a098bc805213a6e0', 'a26e2ddd10ab11e9a0aa0242ac1b0002a26e2de710ab11e9a0aa0242ac1b0002', 'weblogic', '1', 'leo', '2019-01-21 04:46:05', 'leo', '2019-01-21 04:46:05');
INSERT INTO `article_label` VALUES ('fa975bc03c9c474a83c1be8b52fb589c', 'cfe6f92c49f24ea4b6209033403a6733', 'b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', '1', '2019-01-08 16:02:20', '1', '2019-01-08 16:02:20');
INSERT INTO `article_label` VALUES ('fb73942c7a2d4b0a87da3bb422fe910e', 'e0ff3fc8030d4991ab6d8a2e66475266', '934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', '1', '2019-01-08 15:26:29', '1', '2019-01-08 15:26:29');
INSERT INTO `article_label` VALUES ('fbb4db22529f49609ae5555acef7341f', '79632780cd9a4cac86a427061b978a4a', 'f0039ed2140511e9b1a30242c0a84002', 'jenkins', '1', '1', '2019-01-09 12:00:54', '1', '2019-01-09 12:00:54');
INSERT INTO `article_label` VALUES ('fbf74664f2644f67aff96ab234e71284', '53b0e1a87a094f15a186c2b60ebfb0ac', 'bb39188a10ab11e9a0aa0242ac1b0002bb39189a10ab11e9a0aa0242ac1b0002', 'bpm', '1', 'kerry', '2019-01-17 17:08:07', 'kerry', '2019-01-17 17:08:07');
INSERT INTO `article_label` VALUES ('fdb5443514d147da9c456b813b737a57', 'b228c726af554709b0bc0f6dc6c16ca8', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:18', '1', '2019-01-08 16:02:18');
INSERT INTO `article_label` VALUES ('fe5123d77121476b97052de0dc2863fa', '72e49aa72da747c49d87fe6539ae2306', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:15', '1', '2019-01-08 16:02:15');
INSERT INTO `article_label` VALUES ('fe55237d60a94fafa9d0823613c6a1ba', '9dba6c2c8d4e4feeaddca35f1c770085', '31d336731ecd11e9813b0242ac1d0002', '产品设计', '1', 'steve', '2019-01-24 08:28:48', 'steve', '2019-01-24 08:28:48');
INSERT INTO `article_label` VALUES ('fe6c4627c3414b97a54bb10006656c41', '00bd8bb8b1e24e939915e6731326ab40', 'a73bd54c10ab11e9a0aa0242ac1b0002a73bd55510ab11e9a0aa0242ac1b0002', 'oracle', '1', 'zero', '2019-01-24 04:52:35', 'zero', '2019-01-24 04:52:35');
INSERT INTO `article_label` VALUES ('fecaf1ddeba24ac4bfc608a9c03a3b40', '921a3309562046c1ae4a121d0171167c', '971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', '1', '2019-01-08 15:26:27', '1', '2019-01-08 15:26:27');
INSERT INTO `article_label` VALUES ('ff62bf1025674fcdadac19d3bc181ab9', 'd013a6f0a7bd4eeda958574e724b20e7', 'e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', '1', '2019-01-08 16:02:23', '1', '2019-01-08 16:02:23');

-- ----------------------------
-- Table structure for article_like
-- ----------------------------
DROP TABLE IF EXISTS `article_like`;
CREATE TABLE `article_like` (
  `id` varchar(64) NOT NULL,
  `article_id` varchar(64) DEFAULT NULL,
  `object_version_number` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(50) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `article_like_n1` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_like
-- ----------------------------
INSERT INTO `article_like` VALUES ('0948367866504f8392b02008cc3a67bc', '06d4868bce464082926df6abcd814b44', '1', 'steve', '2019-02-20 05:01:50', 'steve', '2019-02-20 05:01:50');
INSERT INTO `article_like` VALUES ('0d365da2ffd34b2bbaf7ccc13474c58b', 'c1200fd6a7184740a3131ee481101716', '1', 'kerry', '2019-02-07 03:33:56', 'kerry', '2019-02-07 03:33:56');
INSERT INTO `article_like` VALUES ('1cef8a97a4354d51864d2331940d7e21', 'a4cf8c7a5ae342aa9784687a5ef136d7', '1', 'kerry', '2019-03-08 03:55:53', 'kerry', '2019-03-08 03:55:53');
INSERT INTO `article_like` VALUES ('1f9f5e5cb3ea4e1aa81428116e59a5e9', '6014d7abacfd4034bf3e2ded207468ba', '1', 'steve', '2019-02-22 08:53:26', 'steve', '2019-02-22 08:53:26');
INSERT INTO `article_like` VALUES ('27f4e04c20b94529ae537096af4ebcf0', '53e68c687a114f71b96bccb9854473ac', '1', 'steve', '2019-02-22 08:53:18', 'steve', '2019-02-22 08:53:18');
INSERT INTO `article_like` VALUES ('29066899293e44d1904f7a8039727ea4', 'a4cf8c7a5ae342aa9784687a5ef136d7', '1', 'admin', '2019-03-01 00:54:26', 'admin', '2019-03-01 00:54:26');
INSERT INTO `article_like` VALUES ('3f8b7c08f5ce4b2d9aa9e07719d4f940', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'admin', '2019-02-22 08:52:22', 'admin', '2019-02-22 08:52:22');
INSERT INTO `article_like` VALUES ('4fba8d7c22f74067ba96ebdb248f0fe6', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-22 08:53:32', 'steve', '2019-02-22 08:53:32');
INSERT INTO `article_like` VALUES ('5e4253497ac547f4b0f2c66730b73e4f', '834470bab65445a0a34e714fe0f28f8d', '1', 'mm', '2019-02-12 08:14:10', 'mm', '2019-02-12 08:14:10');
INSERT INTO `article_like` VALUES ('63cc74d0ae4046248c24f4bfd1e3d914', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-02-27 06:18:12', 'admin', '2019-02-27 06:18:12');
INSERT INTO `article_like` VALUES ('761f190ef1854abebb4738193da4e69f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 08:54:17', 'steve', '2019-02-22 08:54:17');
INSERT INTO `article_like` VALUES ('887964361dca4b86af6d50fead03228c', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'steve', '2019-02-20 05:01:32', 'steve', '2019-02-20 05:01:32');
INSERT INTO `article_like` VALUES ('8ace1f7933c24e72a9c35bf29f265b3e', 'dbb4ec6650bf46449eeb210ffed035bc', '1', 'admin', '2019-02-22 10:58:35', 'admin', '2019-02-22 10:58:35');
INSERT INTO `article_like` VALUES ('90bd37c7156546f88865e2c0486cf368', 'c1200fd6a7184740a3131ee481101716', '1', 'steve', '2019-02-22 08:53:22', 'steve', '2019-02-22 08:53:22');
INSERT INTO `article_like` VALUES ('95d6d1fcb41d40f3a27fb7a2c995ca5c', '79632780cd9a4cac86a427061b978a4a', '1', 'steve', '2019-02-22 08:51:34', 'steve', '2019-02-22 08:51:34');
INSERT INTO `article_like` VALUES ('c3233dc5ca7e41e0b94632c7a32b14ac', '834470bab65445a0a34e714fe0f28f8d', '1', 'leo', '2019-02-21 09:09:05', 'leo', '2019-02-21 09:09:05');
INSERT INTO `article_like` VALUES ('c6d3502a5a1b41ea8e7f42179b3ac174', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'admin', '2019-02-22 08:52:41', 'admin', '2019-02-22 08:52:41');
INSERT INTO `article_like` VALUES ('dd5fd256852a4ab8a14dacb8e3d35f0b', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'admin', '2019-02-22 08:52:31', 'admin', '2019-02-22 08:52:31');
INSERT INTO `article_like` VALUES ('ea5b28d58ed9456ca6d707418c00bf2d', '834470bab65445a0a34e714fe0f28f8d', '1', 'admin', '2019-02-18 06:20:53', 'admin', '2019-02-18 06:20:53');
INSERT INTO `article_like` VALUES ('f6bcb862e78b40b983cf548f77ee1ad8', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'mm', '2019-02-12 00:37:25', 'mm', '2019-02-12 00:37:25');
INSERT INTO `article_like` VALUES ('fb4ef21d30ba4ea4abd002af779f690f', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-02-12 08:13:00', 'mm', '2019-02-12 08:13:00');

-- ----------------------------
-- Table structure for article_view
-- ----------------------------
DROP TABLE IF EXISTS `article_view`;
CREATE TABLE `article_view` (
  `id` varchar(64) NOT NULL,
  `article_id` varchar(64) DEFAULT NULL,
  `object_version_number` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `article_view_n1` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_view
-- ----------------------------
INSERT INTO `article_view` VALUES ('003c96d4244248cc913771652f12f738', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-17 10:36:05', 'kerry', '2019-01-17 10:36:05');
INSERT INTO `article_view` VALUES ('004a6dd2eeea4f73bcb5387f6a168299', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:30', 'steve', '2019-03-04 02:37:30');
INSERT INTO `article_view` VALUES ('00eafa1c29c84a0b821180e6b462b4dc', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:23', 'steve', '2019-03-04 02:37:23');
INSERT INTO `article_view` VALUES ('00ff599e035e49e4bbc6ee7e84e92ce8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:20:14', 'steve', '2019-02-20 02:20:14');
INSERT INTO `article_view` VALUES ('016db0abbdad42989453a44e503aa838', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:35', 'steve', '2019-02-20 02:13:35');
INSERT INTO `article_view` VALUES ('01873c527db745c5a77564ec35ab43d1', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:09', 'steve', '2019-02-20 02:14:09');
INSERT INTO `article_view` VALUES ('01e7bd2af18e4d37b6ffafb09507cb7c', '65766085d8ae4638a613dad17a73dbec', '1', 'mm', '2019-02-26 14:14:49', 'mm', '2019-02-26 14:14:49');
INSERT INTO `article_view` VALUES ('02076d8576fc411e8243f8c944db3ff4', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-23 16:14:28', 'kerry', '2019-01-23 16:14:28');
INSERT INTO `article_view` VALUES ('02200a7ca1dd410b9d417f8d0c9ece00', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'zero', '2019-01-21 04:43:08', 'zero', '2019-01-21 04:43:08');
INSERT INTO `article_view` VALUES ('0282868b82154e698633e1e60ebac09e', '834470bab65445a0a34e714fe0f28f8d', '1', 'mm', '2019-01-24 09:56:30', 'mm', '2019-01-24 09:56:30');
INSERT INTO `article_view` VALUES ('0288409cca914c5389f14ac46620109a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:19', 'steve', '2019-02-22 09:17:19');
INSERT INTO `article_view` VALUES ('028a62ea0f6e46768c7f0ec451757ed1', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'kerry', '2019-01-08 05:34:11', 'kerry', '2019-01-08 05:34:11');
INSERT INTO `article_view` VALUES ('02a58fdc57244009a1275636ab260dc8', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'mm', '2019-01-24 02:16:09', 'mm', '2019-01-24 02:16:09');
INSERT INTO `article_view` VALUES ('02c04adc7b0349dbb744c28d9b2395f3', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-08 13:27:44', '1', '2019-01-08 13:27:44');
INSERT INTO `article_view` VALUES ('03b936b8703745d2b3805981087e971b', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'kerry', '2019-01-22 01:10:32', 'kerry', '2019-01-22 01:10:32');
INSERT INTO `article_view` VALUES ('03d6f1f9a679426c8574d772c62e0627', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-20 02:20:18', 'steve', '2019-02-20 02:20:18');
INSERT INTO `article_view` VALUES ('03e80e22f357472daa345d479442a49b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:21', 'steve', '2019-02-22 09:17:21');
INSERT INTO `article_view` VALUES ('03ecab33fdec4eb08a11262594d0f591', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'Trevor-TW', '2019-02-20 08:46:20', 'Trevor-TW', '2019-02-20 08:46:20');
INSERT INTO `article_view` VALUES ('047c2375f3b847f7b20e550058770af3', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:49:38', 'wenc', '2019-01-21 05:49:38');
INSERT INTO `article_view` VALUES ('04d8bd94c1f54d90a0c0dbe442f0a0de', 'dbb4ec6650bf46449eeb210ffed035bc', '1', 'admin', '2019-03-01 00:56:37', 'admin', '2019-03-01 00:56:37');
INSERT INTO `article_view` VALUES ('04d8bd9cdcd24a98b653408e2387586b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:17', 'steve', '2019-02-22 09:17:17');
INSERT INTO `article_view` VALUES ('050a52e2792c476baadd775144a9ffaa', '5bc6d99cc971448383028118fe6c8f8c', '1', 'kerry', '2019-01-24 05:09:00', 'kerry', '2019-01-24 05:09:00');
INSERT INTO `article_view` VALUES ('057aa6373aec49308e8ed59171c2f900', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('057ee7545ac842e8a91719ee6d6ee225', '834470bab65445a0a34e714fe0f28f8d', '1', 'leo', '2019-02-21 09:08:26', 'leo', '2019-02-21 09:08:26');
INSERT INTO `article_view` VALUES ('057f22e06bd841a5b72539ae42a12e0b', '6014d7abacfd4034bf3e2ded207468ba', '1', 'kerry', '2019-01-21 14:16:45', 'kerry', '2019-01-21 14:16:45');
INSERT INTO `article_view` VALUES ('05c5c5ebb2714fb280403a09910adaf4', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'root', '2019-01-09 16:02:26', 'root', '2019-01-09 16:02:26');
INSERT INTO `article_view` VALUES ('05f83c046bfe42e0af4cc267c09a70ed', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:40', 'steve', '2019-02-20 02:13:40');
INSERT INTO `article_view` VALUES ('0682847157eb45e093fdc2dc80d9c6d4', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-02-07 17:08:34', 'kerry', '2019-02-07 17:08:34');
INSERT INTO `article_view` VALUES ('069b315c791e4102b6c0ea2e30a43add', '06d4868bce464082926df6abcd814b44', '1', 'devinShi', '2019-01-10 05:24:34', 'devinShi', '2019-01-10 05:24:34');
INSERT INTO `article_view` VALUES ('071111fee1af49678854529273f2b284', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 09:23:10', 'steve', '2019-02-22 09:23:10');
INSERT INTO `article_view` VALUES ('0711c6ee78f343319c83c888d2b02a6e', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-01-12 09:26:28', 'mm', '2019-01-12 09:26:28');
INSERT INTO `article_view` VALUES ('0752d6d449df4ab48e548b0da0e4a941', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:29', 'steve', '2019-02-22 09:17:29');
INSERT INTO `article_view` VALUES ('075c8ab96271489abb0be9c508db161b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('076658f93acb409da6878cb4c3ffb6b7', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'root', '2019-01-09 15:26:35', 'root', '2019-01-09 15:26:35');
INSERT INTO `article_view` VALUES ('07a99d53b91441558410bd6fdada5fb5', '4594d583f4a845968009c543d122bf60', '1', 'admin', '2019-01-25 00:51:46', 'admin', '2019-01-25 00:51:46');
INSERT INTO `article_view` VALUES ('07e0a05de5fd4d179c2a811ff443310e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:07', 'steve', '2019-02-22 09:17:07');
INSERT INTO `article_view` VALUES ('07e80170708c4b32afd0bba3040a10fe', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:51', 'steve', '2019-02-20 02:13:51');
INSERT INTO `article_view` VALUES ('07ff548f22534854b8464beb6a5f9016', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'zero', '2019-01-10 01:33:49', 'zero', '2019-01-10 01:33:49');
INSERT INTO `article_view` VALUES ('0820b3a868de4bee9666fe5cb2598f7d', '5bc6d99cc971448383028118fe6c8f8c', '1', 'zero', '2019-01-24 04:37:53', 'zero', '2019-01-24 04:37:53');
INSERT INTO `article_view` VALUES ('08690f95e88a48aeacfcb561d673de85', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-01-23 02:26:17', 'mm', '2019-01-23 02:26:17');
INSERT INTO `article_view` VALUES ('086c34cd5ca54fa78a4139c6a72a4acf', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-02-27 11:16:00', 'kerry', '2019-02-27 11:16:00');
INSERT INTO `article_view` VALUES ('092dcf7009874bd79c61285c0ad335e2', '55c692ac59d94fdbb06f217bb7275642', '1', 'kerry', '2019-02-20 04:51:56', 'kerry', '2019-02-20 04:51:56');
INSERT INTO `article_view` VALUES ('093f5fd29f8b4c58b252d052d780c280', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:56:55', 'steve', '2019-02-22 08:56:55');
INSERT INTO `article_view` VALUES ('09495b5a7a4440c2bf8ac9f80233d7ba', '5c568f755c7d4f65bdca30840f565a84', '1', 'kerry', '2019-01-24 05:58:05', 'kerry', '2019-01-24 05:58:05');
INSERT INTO `article_view` VALUES ('09555b1a2ebd4a7ea662a8fe535a9447', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:21', 'steve', '2019-03-04 02:37:21');
INSERT INTO `article_view` VALUES ('098610481a19491cb334d49087333d7d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:56', 'steve', '2019-02-20 02:13:56');
INSERT INTO `article_view` VALUES ('099009513a8e4988adafa28b8efb5eeb', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'leo', '2019-01-21 04:46:19', 'leo', '2019-01-21 04:46:19');
INSERT INTO `article_view` VALUES ('09972f3902c443c58613eacb1903832c', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-22 15:54:13', 'kerry', '2019-01-22 15:54:13');
INSERT INTO `article_view` VALUES ('0a579ab5af2a448b99d233dec8ab0979', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:50', 'steve', '2019-02-20 02:13:50');
INSERT INTO `article_view` VALUES ('0a59e36ca127429e8d6925a0b4a1a0f6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:07', 'steve', '2019-02-20 02:14:07');
INSERT INTO `article_view` VALUES ('0a8370654f614635b89a222348bfe830', '00bd8bb8b1e24e939915e6731326ab40', '1', 'zero', '2019-01-24 04:52:41', 'zero', '2019-01-24 04:52:41');
INSERT INTO `article_view` VALUES ('0aea8c664bc4413ab093b0b2eef5d3dc', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'mm', '2019-02-28 03:14:11', 'mm', '2019-02-28 03:14:11');
INSERT INTO `article_view` VALUES ('0be2a9b368554effa0a45f5adeda112d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('0c1689352fc24d81a243e13c71d6c9e2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:19', 'steve', '2019-02-22 09:17:19');
INSERT INTO `article_view` VALUES ('0c442ff821ee41c2bf52689473ce6657', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:00', 'steve', '2019-02-20 02:14:00');
INSERT INTO `article_view` VALUES ('0c5eca620af84483ae42198c5a91778b', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-09 12:01:06', 'kerry', '2019-01-09 12:01:06');
INSERT INTO `article_view` VALUES ('0c8522521ec54574aa4484db22441422', 'c1200fd6a7184740a3131ee481101716', '1', 'wenc', '2019-01-21 05:49:23', 'wenc', '2019-01-21 05:49:23');
INSERT INTO `article_view` VALUES ('0cd1014dd7d849308d216c3b83e2497e', '4594d583f4a845968009c543d122bf60', '1', 'kerry', '2019-01-09 14:32:03', 'kerry', '2019-01-09 14:32:03');
INSERT INTO `article_view` VALUES ('0d04c0eb3d314cf0913be96d0c83e062', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:56', 'steve', '2019-02-20 02:13:56');
INSERT INTO `article_view` VALUES ('0d09baa321f0464897c57a457e6d0c20', '5bc6d99cc971448383028118fe6c8f8c', '1', 'mm', '2019-02-22 09:02:32', 'mm', '2019-02-22 09:02:32');
INSERT INTO `article_view` VALUES ('0d212bfdb3814c428f7ed549ada10571', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'zero', '2019-01-24 04:01:47', 'zero', '2019-01-24 04:01:47');
INSERT INTO `article_view` VALUES ('0d2ea27c9cb24fb1bf916148dc640eb8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:21', 'steve', '2019-02-22 09:17:21');
INSERT INTO `article_view` VALUES ('0d6ad61d7fb343aca5a389fad2403ca2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('0d88cb37172f48d8a3e25a99e50b5cf7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:01:43', 'steve', '2019-02-22 09:01:43');
INSERT INTO `article_view` VALUES ('0e405831154441ef8537975ab10722ae', '919493ab3980403794e7c254a4f35ab4', '1', 'mm', '2019-02-20 03:04:49', 'mm', '2019-02-20 03:04:49');
INSERT INTO `article_view` VALUES ('0ea50d4ac1934a74bf4cbab7e8df83ae', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:23', 'steve', '2019-03-04 02:37:23');
INSERT INTO `article_view` VALUES ('0eb24a27af304b55816d509a8c21d0c4', '4594d583f4a845968009c543d122bf60', '1', '527510587@qq.com', '2019-01-21 05:28:05', '527510587@qq.com', '2019-01-21 05:28:05');
INSERT INTO `article_view` VALUES ('0f08e041da8f40cfbcb9edbfee5cd44f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:28', 'steve', '2019-03-04 02:37:28');
INSERT INTO `article_view` VALUES ('0f13549f83e64b01951ea307c78b230b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:43', 'steve', '2019-02-20 02:13:43');
INSERT INTO `article_view` VALUES ('0f85a6b6b9364a3988823754f4abee5c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:24', 'steve', '2019-03-04 02:37:24');
INSERT INTO `article_view` VALUES ('0fcb2c962d9c489d86537eea12c71541', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'mm', '2019-01-24 09:51:22', 'mm', '2019-01-24 09:51:22');
INSERT INTO `article_view` VALUES ('0fcb2cf951b94cb9a5dcc840566a3ff8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('1015ecd227804038b55eddb6f4816ae0', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'zero', '2019-01-21 05:21:56', 'zero', '2019-01-21 05:21:56');
INSERT INTO `article_view` VALUES ('101a5998e13f493a8a2cc38e2704879e', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:49:52', 'wenc', '2019-01-21 05:49:52');
INSERT INTO `article_view` VALUES ('108e2679c8d14832afc46074fa789093', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:26', 'steve', '2019-02-20 02:13:26');
INSERT INTO `article_view` VALUES ('109ac55c4c1a487bbb8cd7554c74696a', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'zero', '2019-02-18 15:48:16', 'zero', '2019-02-18 15:48:16');
INSERT INTO `article_view` VALUES ('10f431adc80b4adb81a2e07a950fa1b5', '834470bab65445a0a34e714fe0f28f8d', '1', 'admin', '2019-01-25 00:49:18', 'admin', '2019-01-25 00:49:18');
INSERT INTO `article_view` VALUES ('110bbac07244453fbcdd8f3aa744d766', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:15', 'steve', '2019-02-22 09:17:15');
INSERT INTO `article_view` VALUES ('118c44fa12fc4401bdd755b58832d6aa', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'root', '2019-01-17 17:47:49', 'root', '2019-01-17 17:47:49');
INSERT INTO `article_view` VALUES ('118ef0476a5b4585bd01f4fa41062a37', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 09:14:35', 'kerry', '2019-01-09 09:14:35');
INSERT INTO `article_view` VALUES ('119879027aaa42ad8b6d2e2926e4b7e2', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-09 10:41:32', 'kerry', '2019-01-09 10:41:32');
INSERT INTO `article_view` VALUES ('11bf163cd361495190a37ae94ebc41db', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'Kerry', '2019-01-07 16:25:34', 'Kerry', '2019-01-07 16:25:34');
INSERT INTO `article_view` VALUES ('11ffde3227014b9faabe9943f9f123e6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:42', 'steve', '2019-02-20 02:13:42');
INSERT INTO `article_view` VALUES ('12125fddb74046b2b6123067c95c46d5', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'leo', '2019-01-17 16:12:51', 'leo', '2019-01-17 16:12:51');
INSERT INTO `article_view` VALUES ('12503efe70704e2089ff287f256e640b', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-21 12:44:16', 'kerry', '2019-01-21 12:44:16');
INSERT INTO `article_view` VALUES ('125124edcd0c4226bb851e6e836c9b56', '834470bab65445a0a34e714fe0f28f8d', '1', 'kerry', '2019-02-22 08:55:17', 'kerry', '2019-02-22 08:55:17');
INSERT INTO `article_view` VALUES ('12705f0aa4e04bb68a5ab4bbb4e433a4', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 19:52:02', 'kerry', '2019-02-07 19:52:02');
INSERT INTO `article_view` VALUES ('1271be8cc4b84d9fa99014be8fe685ff', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-22 15:45:21', 'kerry', '2019-01-22 15:45:21');
INSERT INTO `article_view` VALUES ('12ccbc9ba5f34bc39ba253cd307a93ca', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:34', 'steve', '2019-02-22 09:17:34');
INSERT INTO `article_view` VALUES ('12d299bf506441e48afaef1d7350be92', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-01-23 05:07:37', 'kerry', '2019-01-23 05:07:37');
INSERT INTO `article_view` VALUES ('133845b6a5d24e509d9e246a82fa1e2c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:46', 'steve', '2019-02-20 02:13:46');
INSERT INTO `article_view` VALUES ('1350ff9141df4dc7927c968a6a1e116f', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:49:45', 'wenc', '2019-01-21 05:49:45');
INSERT INTO `article_view` VALUES ('139682c4a175456e8cacb99de80375fc', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'root', '2019-01-30 15:01:58', 'root', '2019-01-30 15:01:58');
INSERT INTO `article_view` VALUES ('1433729c148648c0974bf9114e3d29d1', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:07', 'steve', '2019-02-20 02:14:07');
INSERT INTO `article_view` VALUES ('1435e42323654eae91e4a4e41aa7aec7', '55c692ac59d94fdbb06f217bb7275642', '1', 'kerry', '2019-01-09 15:23:31', 'kerry', '2019-01-09 15:23:31');
INSERT INTO `article_view` VALUES ('146df08a60434d0298bc3510f7bf64f3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:17', 'steve', '2019-03-04 02:37:17');
INSERT INTO `article_view` VALUES ('1490b38e6a134b5086c87de2e3c3381a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:33', 'steve', '2019-02-20 02:13:33');
INSERT INTO `article_view` VALUES ('14a40730835e4861b88f5a561adc30f6', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-08 04:59:58', 'kerry', '2019-01-08 04:59:58');
INSERT INTO `article_view` VALUES ('15195bdc34d54c2582c80000de0f3cb9', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:40', 'steve', '2019-02-20 02:13:40');
INSERT INTO `article_view` VALUES ('151ede9f062c405fbd0db40a4dcd91b1', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-01 10:46:07', 'kerry', '2019-03-01 10:46:07');
INSERT INTO `article_view` VALUES ('1537021435734753b72eb93628ce922b', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-06 16:06:32', '1', '2019-01-06 16:06:32');
INSERT INTO `article_view` VALUES ('15ab373da6c440d9bbdaf8c676daa781', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-02-12 00:37:49', 'mm', '2019-02-12 00:37:49');
INSERT INTO `article_view` VALUES ('15af7382f3aa40929091089af1b9f229', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:00', 'steve', '2019-02-20 02:14:00');
INSERT INTO `article_view` VALUES ('15b2d60874204bab9a0b3001932fa79c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:19:03', 'steve', '2019-02-22 09:19:03');
INSERT INTO `article_view` VALUES ('15c219b7ae954d1b843b04d6e680a8dd', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:15', 'steve', '2019-02-22 09:17:15');
INSERT INTO `article_view` VALUES ('15c7f8ad48674e239056180dbbab91b4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('160e47eb4b6c4bb0ac1f16be44e12d26', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-06 16:21:29', '1', '2019-01-06 16:21:29');
INSERT INTO `article_view` VALUES ('1611bbcfdc034e6394ea46a9cc15056e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:31', 'steve', '2019-03-04 02:37:31');
INSERT INTO `article_view` VALUES ('166353f66b05439486bc9dad354baa31', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:50', 'steve', '2019-02-20 02:13:50');
INSERT INTO `article_view` VALUES ('167b5c73ed0f4030b14277f9ef230d8b', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-08 01:24:30', '1', '2019-01-08 01:24:30');
INSERT INTO `article_view` VALUES ('1683699b001c4750a236e460695e1c87', '6014d7abacfd4034bf3e2ded207468ba', '1', 'kerry', '2019-01-24 15:03:08', 'kerry', '2019-01-24 15:03:08');
INSERT INTO `article_view` VALUES ('169899bb09e34cc3875c9c3ee618b806', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:30', 'steve', '2019-02-20 02:13:30');
INSERT INTO `article_view` VALUES ('1712a3cd40e24941b456975a2d98a549', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:51', 'steve', '2019-02-20 02:13:51');
INSERT INTO `article_view` VALUES ('171d9777299948508952147794f9e77c', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'zero', '2019-01-10 01:33:46', 'zero', '2019-01-10 01:33:46');
INSERT INTO `article_view` VALUES ('1777f30113ae4274bbffbf6662dd96b0', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-24 05:55:53', 'kerry', '2019-01-24 05:55:53');
INSERT INTO `article_view` VALUES ('179e6db9431b428abe4c95096267343a', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 08:25:47', 'kerry', '2019-01-09 08:25:47');
INSERT INTO `article_view` VALUES ('17b23ba90a0c44f7b69639ac35cdbf3b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:51', 'steve', '2019-02-22 09:17:51');
INSERT INTO `article_view` VALUES ('17f6987017f5419d950d401b52e31d4c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'wenc', '2019-01-21 07:31:29', 'wenc', '2019-01-21 07:31:29');
INSERT INTO `article_view` VALUES ('184556eaa1064327a45a5f04a7698b39', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:45', 'steve', '2019-02-20 02:13:45');
INSERT INTO `article_view` VALUES ('18b36565f0cc4f0d85f9a9569400390f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('1958f6ec9e2149c08ff21009560d4522', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-07 07:34:25', '1', '2019-01-07 07:34:25');
INSERT INTO `article_view` VALUES ('195ae857088c4f50b9d33b20047f709c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:04', 'steve', '2019-02-20 02:14:04');
INSERT INTO `article_view` VALUES ('1999df756059472fa2d3a60752aaaa4d', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-10 06:25:56', 'steve', '2019-01-10 06:25:56');
INSERT INTO `article_view` VALUES ('19a41733737f41c692f14d90883eeaa3', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'Kerry', '2019-01-07 16:26:48', 'Kerry', '2019-01-07 16:26:48');
INSERT INTO `article_view` VALUES ('19ee0b9f641d496884132e92d9689cba', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-24 14:49:08', 'kerry', '2019-01-24 14:49:08');
INSERT INTO `article_view` VALUES ('1a1db584ef2146fd8a6d3645722b694d', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:26', 'steve', '2019-02-20 02:13:26');
INSERT INTO `article_view` VALUES ('1a42419d2f21433eb757d14d285e8cbf', '919493ab3980403794e7c254a4f35ab4', '1', 'kerry', '2019-01-23 05:08:09', 'kerry', '2019-01-23 05:08:09');
INSERT INTO `article_view` VALUES ('1a6bd0da7e6347edb64cd25cd091d91b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:20', 'steve', '2019-03-04 02:37:20');
INSERT INTO `article_view` VALUES ('1ab63e59726641719898e5eb286809f2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:18', 'steve', '2019-03-04 02:37:18');
INSERT INTO `article_view` VALUES ('1b062a22eaa7415794d9247d3a10f6fa', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'kerry', '2019-01-21 06:03:49', 'kerry', '2019-01-21 06:03:49');
INSERT INTO `article_view` VALUES ('1b15d1a9845b4785a4e396e180cd354f', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', '1', '2019-01-07 06:15:29', '1', '2019-01-07 06:15:29');
INSERT INTO `article_view` VALUES ('1b256f2ab2b64b50a0fe377f5ad0c449', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:05', 'steve', '2019-02-20 02:14:05');
INSERT INTO `article_view` VALUES ('1b7fcdaab30549a29ed15654cae8032b', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-08 05:34:59', 'kerry', '2019-01-08 05:34:59');
INSERT INTO `article_view` VALUES ('1b84dc2c9b4d4781a7a1e9bda57dd426', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-24 03:30:43', 'steve', '2019-01-24 03:30:43');
INSERT INTO `article_view` VALUES ('1b8d635f8be346e1b5cee2c6a1ce7fa0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:05', 'steve', '2019-02-20 02:14:05');
INSERT INTO `article_view` VALUES ('1bbcb51282104853b26a84187e637b92', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:23', 'steve', '2019-02-22 09:17:23');
INSERT INTO `article_view` VALUES ('1c3af1425d234c7888347bcb3b4600a5', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-07 02:56:14', '1', '2019-01-07 02:56:14');
INSERT INTO `article_view` VALUES ('1c6b7f95fb694d38a0550ecd8d15c4f2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:41', 'steve', '2019-02-20 02:13:41');
INSERT INTO `article_view` VALUES ('1c8479d32d414eddb6350027dbf3a9b9', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:49:26', 'wenc', '2019-01-21 05:49:26');
INSERT INTO `article_view` VALUES ('1cd19af9137a4deb94a55207d5e21be2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:35', 'steve', '2019-03-04 02:37:35');
INSERT INTO `article_view` VALUES ('1d07f8fb65b54d8d9f0a4af46c5cdd4c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:13', 'steve', '2019-02-20 02:14:13');
INSERT INTO `article_view` VALUES ('1d3818e500b94998a21e33973f12f982', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 08:50:03', 'steve', '2019-02-22 08:50:03');
INSERT INTO `article_view` VALUES ('1d43920de7bb4347943fffe841099b55', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:22', 'steve', '2019-03-04 02:37:22');
INSERT INTO `article_view` VALUES ('1d64e7a7920f432bba9689c1b8c965cd', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-01-17 16:25:20', 'admin', '2019-01-17 16:25:20');
INSERT INTO `article_view` VALUES ('1d7034c34b22459ba3b7e065f0d690d2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:55', 'steve', '2019-02-20 02:13:55');
INSERT INTO `article_view` VALUES ('1db8306ace4f44cb91e074ce38f182b4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:16', 'steve', '2019-02-20 02:14:16');
INSERT INTO `article_view` VALUES ('1dbf7b0d800d4ffdb61f80e254cce47e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:18', 'steve', '2019-02-22 09:17:18');
INSERT INTO `article_view` VALUES ('1dd4613c31774cc19288720686448267', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'mm', '2019-03-01 08:39:11', 'mm', '2019-03-01 08:39:11');
INSERT INTO `article_view` VALUES ('1e1e7ce3e88f424fab9096d7ca9de57b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:32', 'steve', '2019-02-22 09:17:32');
INSERT INTO `article_view` VALUES ('1e36c5b43f33480eb87bb8e1490aff63', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:30', 'steve', '2019-02-20 02:13:30');
INSERT INTO `article_view` VALUES ('1e4b8e35e0934a9381d7339d7bf5197c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:57', 'steve', '2019-02-20 02:13:57');
INSERT INTO `article_view` VALUES ('1e8d757787a84fc5ab2c239d936c4145', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:40', 'try', '2019-02-27 06:17:40');
INSERT INTO `article_view` VALUES ('1ebc8e61e2124088810d5adca24d1232', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:16', 'steve', '2019-02-20 02:14:16');
INSERT INTO `article_view` VALUES ('1f4f19bbdf7b4699b7c248d9b97275dc', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-08 01:28:10', 'kerry', '2019-01-08 01:28:10');
INSERT INTO `article_view` VALUES ('1f622167d6054fb388a903d96d714e87', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:11', 'steve', '2019-02-20 02:14:11');
INSERT INTO `article_view` VALUES ('1f995a984bb649239974e95b51d5a964', '55c692ac59d94fdbb06f217bb7275642', '1', 'kerry', '2019-01-09 15:19:06', 'kerry', '2019-01-09 15:19:06');
INSERT INTO `article_view` VALUES ('1fe407e8c4864871885f76c9177f5e6a', '4594d583f4a845968009c543d122bf60', '1', 'kerry', '2019-01-09 15:39:12', 'kerry', '2019-01-09 15:39:12');
INSERT INTO `article_view` VALUES ('1fea09dfda4e46baa821957bdd602881', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:27', 'steve', '2019-02-22 09:17:27');
INSERT INTO `article_view` VALUES ('1ffe0e0458144dcd8397842ac98751a5', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:29', 'steve', '2019-02-22 09:17:29');
INSERT INTO `article_view` VALUES ('202b3c228b8b4ea2aa2a7f43af07f76b', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 16:07:17', 'kerry', '2019-02-07 16:07:17');
INSERT INTO `article_view` VALUES ('21018754490345819e6f9aa2b3a5100d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:05', 'steve', '2019-02-20 02:14:05');
INSERT INTO `article_view` VALUES ('21046552c9064844a0a9a17a53f79558', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:19:03', 'steve', '2019-02-22 09:19:03');
INSERT INTO `article_view` VALUES ('21167ca7d3a24d0782096a3b5bf722f0', '5bc6d99cc971448383028118fe6c8f8c', '1', 'Trevor-TW', '2019-02-22 02:25:51', 'Trevor-TW', '2019-02-22 02:25:51');
INSERT INTO `article_view` VALUES ('21b593035f5247a3bc56521cd230394e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:10', 'steve', '2019-02-20 02:14:10');
INSERT INTO `article_view` VALUES ('21d164b60e1742298dc46d4f916b363d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-09 16:35:59', 'kerry', '2019-03-09 16:35:59');
INSERT INTO `article_view` VALUES ('22412e3a589d4da19adc095870c450fb', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:47', 'steve', '2019-02-20 02:13:47');
INSERT INTO `article_view` VALUES ('2247e3c3fe01424687faeb035e7cd07e', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-08 01:23:03', 'kerry', '2019-01-08 01:23:03');
INSERT INTO `article_view` VALUES ('22a04595e8c243c8bde0905d1a03f446', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-09 12:59:00', 'steve', '2019-01-09 12:59:00');
INSERT INTO `article_view` VALUES ('22a0d36b0b79405b89f2b20f9c358408', '4594d583f4a845968009c543d122bf60', '1', '527510587@qq.com', '2019-01-21 05:28:00', '527510587@qq.com', '2019-01-21 05:28:00');
INSERT INTO `article_view` VALUES ('22ee37fc30a84025ae659bb50ae505ad', '6747cff4bdd044bb883c0f19f676f549', '1', 'kerry', '2019-01-09 10:15:49', 'kerry', '2019-01-09 10:15:49');
INSERT INTO `article_view` VALUES ('23067768547b494f978a1af5f4b103e7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:39', 'steve', '2019-02-20 02:13:39');
INSERT INTO `article_view` VALUES ('230cf832ef784a958cc30a781ceb849e', '455b97de71f44eeda0e359532724b5e8', '1', 'zero', '2019-01-24 04:52:48', 'zero', '2019-01-24 04:52:48');
INSERT INTO `article_view` VALUES ('2346143adc7a476780d4bb37c61d9d41', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:35', 'steve', '2019-02-20 02:13:35');
INSERT INTO `article_view` VALUES ('2348067cba064f4892985360211387f4', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-08 01:24:05', 'kerry', '2019-01-08 01:24:05');
INSERT INTO `article_view` VALUES ('2379975a3d6040bda542238fa1f456a0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('23933547091d4aa194f30a3226cd8258', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:57', 'steve', '2019-02-20 02:13:57');
INSERT INTO `article_view` VALUES ('23e97d75f1d74b64b7341274a392fd08', '5bc6d99cc971448383028118fe6c8f8c', '1', 'zero', '2019-01-24 06:02:09', 'zero', '2019-01-24 06:02:09');
INSERT INTO `article_view` VALUES ('2411591686f844d984e8d9faf6fd229e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:59', 'steve', '2019-02-20 02:13:59');
INSERT INTO `article_view` VALUES ('247b5ca904a0422494b67484b56a6683', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:38', 'steve', '2019-02-20 02:13:38');
INSERT INTO `article_view` VALUES ('24cdad200b7148168f9feda086a0eec5', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-18 01:05:17', 'steve', '2019-01-18 01:05:17');
INSERT INTO `article_view` VALUES ('24cdbfe789434ec8ba05cd1990575e53', 'c1200fd6a7184740a3131ee481101716', '1', 'kerry', '2019-01-22 10:08:51', 'kerry', '2019-01-22 10:08:51');
INSERT INTO `article_view` VALUES ('2523282ffeed4c8a954dcadc51421885', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:55', 'steve', '2019-02-20 02:13:55');
INSERT INTO `article_view` VALUES ('2536b82bf3f54d118283d1315cc35e6f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 08:48:20', 'steve', '2019-02-22 08:48:20');
INSERT INTO `article_view` VALUES ('256711147fe94353b83c23d1a948a198', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-22 03:18:13', 'kerry', '2019-01-22 03:18:13');
INSERT INTO `article_view` VALUES ('258d3297fb03475f9f330fd1c41d6c77', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:18', 'steve', '2019-02-22 09:17:18');
INSERT INTO `article_view` VALUES ('25e241674fc844edb64c903e525d8d4d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:59', 'steve', '2019-02-20 02:13:59');
INSERT INTO `article_view` VALUES ('25fd916eaa3d43caa0f29adf6346dee3', 'a4cf8c7a5ae342aa9784687a5ef136d7', '1', 'mm', '2019-02-27 06:28:20', 'mm', '2019-02-27 06:28:20');
INSERT INTO `article_view` VALUES ('264b24962f764a3caba922021154dc87', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:46', 'try', '2019-02-27 06:17:46');
INSERT INTO `article_view` VALUES ('2694fe44500c41b5a41383c1b718b710', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:05', 'steve', '2019-02-20 02:14:05');
INSERT INTO `article_view` VALUES ('2729da7ff7c04a40b2afd44a6ba1d0b6', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:56:54', 'steve', '2019-02-22 08:56:54');
INSERT INTO `article_view` VALUES ('27837a0034334c37947313bb95d17771', 'b4f01f460f1b4b7b91ac38281585466a', '1', 'admin', '2019-01-18 01:45:03', 'admin', '2019-01-18 01:45:03');
INSERT INTO `article_view` VALUES ('27b0b99a52594e80811a4fd950c85db4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'Trevor-TW', '2019-02-26 03:19:18', 'Trevor-TW', '2019-02-26 03:19:18');
INSERT INTO `article_view` VALUES ('2814d515ae234fa98d89d24f83cd1f13', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', '1', '2019-01-07 06:55:01', '1', '2019-01-07 06:55:01');
INSERT INTO `article_view` VALUES ('2844d979241f4119a628acd57e2e7905', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'root', '2019-01-30 15:01:00', 'root', '2019-01-30 15:01:00');
INSERT INTO `article_view` VALUES ('2865d8c886e9474aa3e4c32eb54e66f5', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-23 01:09:27', 'kerry', '2019-01-23 01:09:27');
INSERT INTO `article_view` VALUES ('2878f33fa1f64bcfa8f6e9a3d5cbea52', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:34', 'steve', '2019-03-04 02:37:34');
INSERT INTO `article_view` VALUES ('290cf06ec8c1459eac3c3357aa35440a', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-09 10:15:13', 'kerry', '2019-01-09 10:15:13');
INSERT INTO `article_view` VALUES ('29140d179c9e4137983f6756de07c1d8', '213300f956494f7d8e05e516fa699416', '1', 'steve', '2019-01-18 02:24:21', 'steve', '2019-01-18 02:24:21');
INSERT INTO `article_view` VALUES ('296a42ade0354916934b74235fdc015b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:24', 'steve', '2019-03-04 02:37:24');
INSERT INTO `article_view` VALUES ('29ed2544098343f38f62b6056d7d013e', 'c1200fd6a7184740a3131ee481101716', '1', 'zero', '2019-01-21 04:42:01', 'zero', '2019-01-21 04:42:01');
INSERT INTO `article_view` VALUES ('29fa0869a40d412a8397fcd01e4af98d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:20', 'steve', '2019-03-04 02:37:20');
INSERT INTO `article_view` VALUES ('2a40ebf2e06d4d2f93fb6a60755a8ed7', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-08 16:02:40', 'kerry', '2019-01-08 16:02:40');
INSERT INTO `article_view` VALUES ('2a53d7eeea3145b5813455a6a409e0c5', '53e68c687a114f71b96bccb9854473ac', '1', 'zero', '2019-01-21 04:45:10', 'zero', '2019-01-21 04:45:10');
INSERT INTO `article_view` VALUES ('2a6ca08156f443bf8cb077e5bafb820e', '5bc6d99cc971448383028118fe6c8f8c', '1', 'kerry', '2019-02-22 09:31:45', 'kerry', '2019-02-22 09:31:45');
INSERT INTO `article_view` VALUES ('2a800c57ed414e078c708f71d9f9e460', '06d4868bce464082926df6abcd814b44', '1', 'steve', '2019-01-09 13:03:26', 'steve', '2019-01-09 13:03:26');
INSERT INTO `article_view` VALUES ('2ad3ad22235b4436bddbb34373c5f370', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:01', 'steve', '2019-02-20 02:14:01');
INSERT INTO `article_view` VALUES ('2ae6a13b489d4d66accadf321e36d5f6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:32', 'steve', '2019-02-22 09:17:32');
INSERT INTO `article_view` VALUES ('2af3a9eca69d4fafb7fba757ee368f36', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', '1', '2019-01-07 00:42:46', '1', '2019-01-07 00:42:46');
INSERT INTO `article_view` VALUES ('2b2ef423301a44b7b6ea6ced763c8f70', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:12', 'steve', '2019-02-22 09:17:12');
INSERT INTO `article_view` VALUES ('2bb3739330a44708b66cc6cb73b74a9c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-08 16:05:24', 'kerry', '2019-01-08 16:05:24');
INSERT INTO `article_view` VALUES ('2be18891f15841b588b34fbecf3ac64f', '5c568f755c7d4f65bdca30840f565a84', '1', 'kerry', '2019-01-24 05:48:52', 'kerry', '2019-01-24 05:48:52');
INSERT INTO `article_view` VALUES ('2be1bf9241084e91b965f15d556f4832', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:32', 'steve', '2019-02-20 02:13:32');
INSERT INTO `article_view` VALUES ('2c1e45cd458648eb9272ed9d427bc128', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-09 09:10:26', 'kerry', '2019-01-09 09:10:26');
INSERT INTO `article_view` VALUES ('2c24fc1271a14247898046c43e35a2d7', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-22 00:53:17', 'kerry', '2019-01-22 00:53:17');
INSERT INTO `article_view` VALUES ('2c6da57d11484b558ba60974729159aa', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-24 14:49:06', 'kerry', '2019-01-24 14:49:06');
INSERT INTO `article_view` VALUES ('2c98a6570d404207822fe7b8c6c21875', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-03-06 00:37:29', 'kerry', '2019-03-06 00:37:29');
INSERT INTO `article_view` VALUES ('2d0218a65f194c04879cbba317f24dc1', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-23 02:49:59', 'steve', '2019-01-23 02:49:59');
INSERT INTO `article_view` VALUES ('2d2e43e9475f45f7a752f2947bd80075', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:05', 'steve', '2019-02-20 02:14:05');
INSERT INTO `article_view` VALUES ('2d2ff265df6c4e51aa6b5c4677b0c5ad', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:37', 'steve', '2019-02-20 02:13:37');
INSERT INTO `article_view` VALUES ('2d61616336ed45cfbd71164a2ad36e23', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:49', 'steve', '2019-02-20 02:13:49');
INSERT INTO `article_view` VALUES ('2d8f959ca5824273bbfc3ceed82a3b6b', '5ca4395fcc0241e796fa56b93ceb584d', '1', 'steve', '2019-01-18 01:11:14', 'steve', '2019-01-18 01:11:14');
INSERT INTO `article_view` VALUES ('2d93e84a7ccc4d83b2655f2932a0d7d5', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-28 03:55:39', 'steve', '2019-02-28 03:55:39');
INSERT INTO `article_view` VALUES ('2e0e6bccc98d4796b10831436368d865', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-17 09:48:36', 'kerry', '2019-01-17 09:48:36');
INSERT INTO `article_view` VALUES ('2e70c5bf20514706be75d9595aa1b495', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-02-12 08:14:16', 'mm', '2019-02-12 08:14:16');
INSERT INTO `article_view` VALUES ('2e7619243dd446a7b3cc0e7c393466ca', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-02-09 12:19:12', 'kerry', '2019-02-09 12:19:12');
INSERT INTO `article_view` VALUES ('2ea1c360bb054c7ab5b11d1ab631829f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:37', 'steve', '2019-02-20 02:13:37');
INSERT INTO `article_view` VALUES ('2ee200017601401d874bb403f2a2429f', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-02-04 08:44:25', 'kerry', '2019-02-04 08:44:25');
INSERT INTO `article_view` VALUES ('2ee2b51c55f942d0b729ee55b20f633b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:47', 'steve', '2019-02-20 02:13:47');
INSERT INTO `article_view` VALUES ('30115753ee0c4f0da7b7c0fddd787645', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-08 05:00:02', 'kerry', '2019-01-08 05:00:02');
INSERT INTO `article_view` VALUES ('30551672a896486d80bd4b048350ed03', '834470bab65445a0a34e714fe0f28f8d', '1', 'mm', '2019-01-24 09:54:37', 'mm', '2019-01-24 09:54:37');
INSERT INTO `article_view` VALUES ('30d2c1b91d1949afa6487b91b26d03e4', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 17:16:50', 'kerry', '2019-02-07 17:16:50');
INSERT INTO `article_view` VALUES ('3106419cdfea477189f59ed9dc2f35b0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:00', 'steve', '2019-02-20 02:14:00');
INSERT INTO `article_view` VALUES ('31348cef78b646a9b08a0e2a41540f5e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:28', 'steve', '2019-02-22 09:17:28');
INSERT INTO `article_view` VALUES ('315c62fd3a334d95ab7262bbdfcd6b90', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'leo', '2019-01-17 16:11:02', 'leo', '2019-01-17 16:11:02');
INSERT INTO `article_view` VALUES ('317d9fd4e4fb4932a2f4ce479b90691c', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-02-07 12:04:24', 'kerry', '2019-02-07 12:04:24');
INSERT INTO `article_view` VALUES ('3191d377338f433685d4ad0220d90781', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:15', 'steve', '2019-02-20 02:14:15');
INSERT INTO `article_view` VALUES ('32162e51dc764d00973ade9efb55b39a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:05', 'steve', '2019-02-20 02:14:05');
INSERT INTO `article_view` VALUES ('322bec8ecbd4443aab9451784319618a', 'ef5e112d7ddc4f2ebf79aa5269119491', '1', 'kerry', '2019-01-23 04:55:26', 'kerry', '2019-01-23 04:55:26');
INSERT INTO `article_view` VALUES ('323b06cb04aa494984e6423064a74c0e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:48', 'steve', '2019-02-22 09:17:48');
INSERT INTO `article_view` VALUES ('3244c4813e1f46019a6e05f2dc7c4f3f', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-17 09:31:25', 'kerry', '2019-01-17 09:31:25');
INSERT INTO `article_view` VALUES ('3293c021e3174d3f9f6de8958831e498', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'zero', '2019-01-10 01:33:53', 'zero', '2019-01-10 01:33:53');
INSERT INTO `article_view` VALUES ('32b961af1ad54554b401ac0bd56fc31b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:21', 'steve', '2019-02-22 09:17:21');
INSERT INTO `article_view` VALUES ('3332e8d00989434e82a8fd53d1164635', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-03-02 02:12:26', 'kerry', '2019-03-02 02:12:26');
INSERT INTO `article_view` VALUES ('335b1fa4bccb4bfa8f8b2e901911d276', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-21 12:27:51', 'kerry', '2019-01-21 12:27:51');
INSERT INTO `article_view` VALUES ('33825a1f6a3342ca967c7b7231e1a0bd', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-09 14:34:56', '1', '2019-01-09 14:34:56');
INSERT INTO `article_view` VALUES ('33c636ab4c314efd945627f8a226ec8a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:36', 'steve', '2019-02-20 02:13:36');
INSERT INTO `article_view` VALUES ('33ec4d16e55a4e43a726cb90b25ffbba', '79632780cd9a4cac86a427061b978a4a', '1', 'root', '2019-01-09 16:02:46', 'root', '2019-01-09 16:02:46');
INSERT INTO `article_view` VALUES ('33f92bba66b94886a7ae67c3cbe0e970', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:47', 'try', '2019-02-27 06:17:47');
INSERT INTO `article_view` VALUES ('343e4503ef404c9c8dab20d242271442', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('344c6187fc354396bffeec80498c6586', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:49', 'steve', '2019-02-20 02:13:49');
INSERT INTO `article_view` VALUES ('3468f37688134b92807516de569742cc', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-07 02:48:26', '1', '2019-01-07 02:48:26');
INSERT INTO `article_view` VALUES ('34b40f3a051e4b43a5b6ad1a2f208a4f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:45', 'steve', '2019-02-20 02:13:45');
INSERT INTO `article_view` VALUES ('351f42dd8f19469e96d03b1449297b76', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:30', 'steve', '2019-03-04 02:37:30');
INSERT INTO `article_view` VALUES ('3522ab7bc15b4793bf973f91e4cfcf96', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'admin', '2019-02-22 08:51:54', 'admin', '2019-02-22 08:51:54');
INSERT INTO `article_view` VALUES ('35860cd420ee487f99ea3860d5dc5a32', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-17 09:29:47', 'kerry', '2019-01-17 09:29:47');
INSERT INTO `article_view` VALUES ('363515a535b44598b703fc72a18c2959', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:33', 'steve', '2019-03-04 02:37:33');
INSERT INTO `article_view` VALUES ('36c2b1f88be24cfdb015bed3832ed3bb', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:56:55', 'steve', '2019-02-22 08:56:55');
INSERT INTO `article_view` VALUES ('373c90adff804c388baa15fbba735d31', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-22 15:14:16', 'kerry', '2019-01-22 15:14:16');
INSERT INTO `article_view` VALUES ('37686f6b94fc4237a1bc9951d1d30e2d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:42', 'steve', '2019-02-20 02:13:42');
INSERT INTO `article_view` VALUES ('377f777da6874587ab1008e7b1282f72', '00bd8bb8b1e24e939915e6731326ab40', '1', 'zero', '2019-01-24 04:53:31', 'zero', '2019-01-24 04:53:31');
INSERT INTO `article_view` VALUES ('379c2738661d4276a1a9915a273ae0d0', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'zero', '2019-02-26 04:25:09', 'zero', '2019-02-26 04:25:09');
INSERT INTO `article_view` VALUES ('380ad81a6eca40748c97f563d2f7e0be', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 17:03:42', 'kerry', '2019-02-07 17:03:42');
INSERT INTO `article_view` VALUES ('381a2b293beb431b9ed9987cb612d14e', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'kerry', '2019-01-23 05:04:46', 'kerry', '2019-01-23 05:04:46');
INSERT INTO `article_view` VALUES ('381e54e77f354ecaa233fd376e27de31', '834470bab65445a0a34e714fe0f28f8d', '1', 'admin', '2019-02-18 05:10:32', 'admin', '2019-02-18 05:10:32');
INSERT INTO `article_view` VALUES ('382ed49c925c4763b89bd7e6fd433f1a', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 08:26:20', 'kerry', '2019-01-09 08:26:20');
INSERT INTO `article_view` VALUES ('386cb855a5834b568c52a36942824861', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:19', 'steve', '2019-02-22 09:17:19');
INSERT INTO `article_view` VALUES ('38ad7fe234ca42708cea226817b3fd71', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-24 00:19:24', 'steve', '2019-01-24 00:19:24');
INSERT INTO `article_view` VALUES ('38d86570c2634ad8bec33dc17d5b4c3e', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-08 01:25:15', '1', '2019-01-08 01:25:15');
INSERT INTO `article_view` VALUES ('38f3eb4a722246409dc50cf2f0e03531', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', '1', '2019-01-07 06:50:25', '1', '2019-01-07 06:50:25');
INSERT INTO `article_view` VALUES ('392f8f7e75824b47859ecba3d6c0e8d1', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-23 05:44:45', 'kerry', '2019-01-23 05:44:45');
INSERT INTO `article_view` VALUES ('3a3103df59f344d0a1db5ce4b89e1df8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:13', 'steve', '2019-02-20 02:14:13');
INSERT INTO `article_view` VALUES ('3aa4712b6a1341aa871a96ebbf23d5c1', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:27', 'steve', '2019-02-22 09:17:27');
INSERT INTO `article_view` VALUES ('3aa55632a03f4249bb55a16b008097b7', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:45', 'try', '2019-02-27 06:17:45');
INSERT INTO `article_view` VALUES ('3aa7d3d62b134662b3efba9251295e64', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-01-17 16:25:31', 'admin', '2019-01-17 16:25:31');
INSERT INTO `article_view` VALUES ('3af4b2b478a04b5396637005eb185093', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:00', 'steve', '2019-02-20 02:14:00');
INSERT INTO `article_view` VALUES ('3b28d8bd4aa949bab0158fc23ab19c48', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:25', 'steve', '2019-03-04 02:37:25');
INSERT INTO `article_view` VALUES ('3b316e42dc5249baa88c2deffb10f765', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-15 15:18:31', 'kerry', '2019-01-15 15:18:31');
INSERT INTO `article_view` VALUES ('3b55a15839ee4cefb79393195bf72e06', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-08 01:23:58', 'kerry', '2019-01-08 01:23:58');
INSERT INTO `article_view` VALUES ('3b5e372159da4316a5f8287f17c8bff5', '455b97de71f44eeda0e359532724b5e8', '1', 'steve', '2019-01-24 08:37:48', 'steve', '2019-01-24 08:37:48');
INSERT INTO `article_view` VALUES ('3b752fed72f142dc94da942758058117', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-22 15:36:04', 'kerry', '2019-01-22 15:36:04');
INSERT INTO `article_view` VALUES ('3b7636ca296b4077b924cdf261514f92', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-09 09:12:12', 'kerry', '2019-01-09 09:12:12');
INSERT INTO `article_view` VALUES ('3b852b248226497e81da3a74f950820d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:34', 'steve', '2019-02-22 09:17:34');
INSERT INTO `article_view` VALUES ('3b975cf2faa146d7bbf2d076400eb1be', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:23', 'steve', '2019-03-04 02:37:23');
INSERT INTO `article_view` VALUES ('3bca0a2856af468d9214674fc4f72131', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'Trevor-TW', '2019-02-22 02:25:21', 'Trevor-TW', '2019-02-22 02:25:21');
INSERT INTO `article_view` VALUES ('3c9ac086fbf24c6cb50bf97caa9a33fa', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:21', 'steve', '2019-02-22 09:17:21');
INSERT INTO `article_view` VALUES ('3d0fea0a4fb74c65a260964ac31544b3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-01-24 08:37:34', 'steve', '2019-01-24 08:37:34');
INSERT INTO `article_view` VALUES ('3d783d8643b449ae9ca73e38c9042827', '5ca4395fcc0241e796fa56b93ceb584d', '1', 'kerry', '2019-01-18 01:49:48', 'kerry', '2019-01-18 01:49:48');
INSERT INTO `article_view` VALUES ('3d9c2b1305634e25aa393437fb017b2b', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 18:43:50', 'kerry', '2019-02-07 18:43:50');
INSERT INTO `article_view` VALUES ('3daabca11dc94ff688580929b4eec5d0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:42', 'steve', '2019-02-20 02:13:42');
INSERT INTO `article_view` VALUES ('3db946f5d6d245ce8f5669693244edba', '834470bab65445a0a34e714fe0f28f8d', '1', 'admin', '2019-02-18 05:10:38', 'admin', '2019-02-18 05:10:38');
INSERT INTO `article_view` VALUES ('3e21cc31710742edb1582346b6234787', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:18', 'steve', '2019-02-22 09:17:18');
INSERT INTO `article_view` VALUES ('3ee8a22049db46c1b0dcbc3a67480a54', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-01-23 02:37:37', 'steve', '2019-01-23 02:37:37');
INSERT INTO `article_view` VALUES ('3ef54e6ff726413488851529e477486c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:29', 'steve', '2019-02-22 09:17:29');
INSERT INTO `article_view` VALUES ('3efc7835bc8940f7b472a92e6fc9a6a0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 08:56:19', 'steve', '2019-02-22 08:56:19');
INSERT INTO `article_view` VALUES ('3fae80f1e0f84efbb9613cdec1cec9cc', '00bd8bb8b1e24e939915e6731326ab40', '1', 'zero', '2019-02-26 04:26:02', 'zero', '2019-02-26 04:26:02');
INSERT INTO `article_view` VALUES ('3fc5162857ed405f807b17b7608f8bb0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:29', 'steve', '2019-02-22 09:17:29');
INSERT INTO `article_view` VALUES ('40195a2b6d804d4d82be601189a5e737', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:37', 'steve', '2019-02-20 02:13:37');
INSERT INTO `article_view` VALUES ('403fe9f1914c4a02b65d38f1d0708670', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'kerry', '2019-01-17 17:06:24', 'kerry', '2019-01-17 17:06:24');
INSERT INTO `article_view` VALUES ('405d43058bae4cff8b0591d3682781f8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:33', 'steve', '2019-02-22 09:17:33');
INSERT INTO `article_view` VALUES ('40af62de07dd4349b7f559df222afc9f', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'admin', '2019-01-23 00:58:41', 'admin', '2019-01-23 00:58:41');
INSERT INTO `article_view` VALUES ('40b5c2ae0c724e59bcef540535ba7e96', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:35', 'steve', '2019-02-22 09:17:35');
INSERT INTO `article_view` VALUES ('40fa0901cce54b5186f13a147563f08b', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-08 05:35:13', 'kerry', '2019-01-08 05:35:13');
INSERT INTO `article_view` VALUES ('4115a687fe164703bbd3fb5fba8e0355', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:13', 'steve', '2019-02-20 02:14:13');
INSERT INTO `article_view` VALUES ('4129aaf040264cefad4f1e3c8cfc7a09', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'zero', '2019-01-29 09:18:29', 'zero', '2019-01-29 09:18:29');
INSERT INTO `article_view` VALUES ('4140346084b44970a7a88d57c4554126', '4594d583f4a845968009c543d122bf60', '1', 'kerry', '2019-02-07 12:04:50', 'kerry', '2019-02-07 12:04:50');
INSERT INTO `article_view` VALUES ('41925b598d534a778848ffa2248e9716', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:27', 'steve', '2019-02-22 09:17:27');
INSERT INTO `article_view` VALUES ('419a4b11d9874d19ac8bffcc61576c6f', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-17 10:49:59', 'kerry', '2019-01-17 10:49:59');
INSERT INTO `article_view` VALUES ('41b65200fcde44bfbd359ffd1581eee2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('41ed87f8df3949fc867ffa6995885330', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:39', 'steve', '2019-02-20 02:13:39');
INSERT INTO `article_view` VALUES ('424dc85ed651442ea7f8805368f4ad25', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-18 01:48:22', 'steve', '2019-01-18 01:48:22');
INSERT INTO `article_view` VALUES ('425b66392b5f49b6a10e9422eb9d95d4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:31', 'steve', '2019-02-22 09:17:31');
INSERT INTO `article_view` VALUES ('42e4d1d28be443d1be575ae8c1d41d0f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:11', 'steve', '2019-02-20 02:14:11');
INSERT INTO `article_view` VALUES ('42e507d5209243fa8e64576a0d0b2429', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-02-12 05:52:47', 'kerry', '2019-02-12 05:52:47');
INSERT INTO `article_view` VALUES ('42f000924f9442dcbbb4dbf430b8f19c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-09 14:57:48', '1', '2019-01-09 14:57:48');
INSERT INTO `article_view` VALUES ('4307f13085aa4660b9c27651917a92f2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:06', 'steve', '2019-02-22 09:17:06');
INSERT INTO `article_view` VALUES ('43743a205dc74ddd94342035db5ab9b0', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-08 05:02:45', 'kerry', '2019-01-08 05:02:45');
INSERT INTO `article_view` VALUES ('437c1c63261146e987154e7f702aafbd', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-02-20 06:35:38', 'kerry', '2019-02-20 06:35:38');
INSERT INTO `article_view` VALUES ('4387b9e4b3e8420d91fb173756807394', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-04 00:58:34', 'kerry', '2019-03-04 00:58:34');
INSERT INTO `article_view` VALUES ('4387c272d0e240668e5d3c833ec7e111', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-08 15:25:48', 'kerry', '2019-01-08 15:25:48');
INSERT INTO `article_view` VALUES ('43cbadb3120a4a99ab67c52bd39d26b6', '6014d7abacfd4034bf3e2ded207468ba', '1', 'wenc', '2019-01-21 05:49:18', 'wenc', '2019-01-21 05:49:18');
INSERT INTO `article_view` VALUES ('44064ed6c0504d239875cb4b1452e18b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:15', 'steve', '2019-02-22 09:17:15');
INSERT INTO `article_view` VALUES ('445af9185e9d406ba27d0047795b11ed', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:21', 'steve', '2019-03-04 02:37:21');
INSERT INTO `article_view` VALUES ('445f1629877a45b3b6f9d80891020989', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:08', 'steve', '2019-02-22 09:17:08');
INSERT INTO `article_view` VALUES ('4487a50681b7462c86335dbca199d2a8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:31', 'steve', '2019-02-22 09:17:31');
INSERT INTO `article_view` VALUES ('44be3cadbae64b898bf6b24da5efed84', '79632780cd9a4cac86a427061b978a4a', '1', 'Trevor-TW', '2019-02-22 08:35:50', 'Trevor-TW', '2019-02-22 08:35:50');
INSERT INTO `article_view` VALUES ('44df626fc77a45adb2bc7175616b9e5d', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-22 03:19:01', 'kerry', '2019-01-22 03:19:01');
INSERT INTO `article_view` VALUES ('45d7d1d72fdc4ba4a36d4dc738691699', '5c568f755c7d4f65bdca30840f565a84', '1', 'kerry', '2019-02-25 01:15:02', 'kerry', '2019-02-25 01:15:02');
INSERT INTO `article_view` VALUES ('45daf9e736e84dcebae64265cc5dead2', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-17 09:40:51', 'kerry', '2019-01-17 09:40:51');
INSERT INTO `article_view` VALUES ('45ff5e3e67304f8aa8d8e0dbc0f12039', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'kerry', '2019-01-07 16:36:22', 'kerry', '2019-01-07 16:36:22');
INSERT INTO `article_view` VALUES ('460636ee31b44f31af34de885e2bc697', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:43', 'steve', '2019-02-20 02:13:43');
INSERT INTO `article_view` VALUES ('4656abda6d164e62a74812d4706e6566', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'admin', '2019-03-01 00:56:53', 'admin', '2019-03-01 00:56:53');
INSERT INTO `article_view` VALUES ('467f98fc439a427fb46c270a50889942', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:33', 'steve', '2019-02-20 02:13:33');
INSERT INTO `article_view` VALUES ('46ae5f3b9f4e4e4c94c63e67ec6cedad', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 09:57:30', 'kerry', '2019-01-09 09:57:30');
INSERT INTO `article_view` VALUES ('46b7882d684d43ee93194b718fab56a7', '65766085d8ae4638a613dad17a73dbec', '1', 'kerry', '2019-02-27 06:11:26', 'kerry', '2019-02-27 06:11:26');
INSERT INTO `article_view` VALUES ('470504892e7d438bbc76e1d969571bfe', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:49:20', 'wenc', '2019-01-21 05:49:20');
INSERT INTO `article_view` VALUES ('473c8be7f673459cb2bbb83e64a2ba9d', 'c1200fd6a7184740a3131ee481101716', '1', 'kerry', '2019-02-26 05:33:50', 'kerry', '2019-02-26 05:33:50');
INSERT INTO `article_view` VALUES ('477499fb3d33487d8adc5f829867b04d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:14', 'steve', '2019-02-20 02:13:14');
INSERT INTO `article_view` VALUES ('4847772781144460842eca1714265d46', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:49', 'steve', '2019-02-22 09:17:49');
INSERT INTO `article_view` VALUES ('48656e95f4264c918a05e4d19e5f2b59', '6014d7abacfd4034bf3e2ded207468ba', '1', 'kerry', '2019-01-22 00:49:16', 'kerry', '2019-01-22 00:49:16');
INSERT INTO `article_view` VALUES ('48810e99a37440e0901596ff44e9fda2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:05', 'steve', '2019-02-20 02:14:05');
INSERT INTO `article_view` VALUES ('4887578b4495401f82151d9bdd1bba3e', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 08:24:02', 'kerry', '2019-01-09 08:24:02');
INSERT INTO `article_view` VALUES ('48ac6254622e4bd7acc2c10d8d4f5398', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-06 00:36:14', 'kerry', '2019-03-06 00:36:14');
INSERT INTO `article_view` VALUES ('48c1c8dc6d1b4780a7f3f00a7a91782c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:19:02', 'steve', '2019-02-22 09:19:02');
INSERT INTO `article_view` VALUES ('48ede8c13e4c4fd1a05e0b3ae44f8070', '455b97de71f44eeda0e359532724b5e8', '1', 'steve', '2019-01-24 07:11:23', 'steve', '2019-01-24 07:11:23');
INSERT INTO `article_view` VALUES ('49bebc2bdabd40c38823888699b03ce2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:10', 'steve', '2019-02-20 02:13:10');
INSERT INTO `article_view` VALUES ('49c7a01100754c3fa6ef23b126854b0c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-30 03:33:09', 'kerry', '2019-01-30 03:33:09');
INSERT INTO `article_view` VALUES ('49ed6f0ec9d34c57866cd733c3f54c6b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:28', 'steve', '2019-02-22 09:17:28');
INSERT INTO `article_view` VALUES ('4af54ef6ceae4748a23b4a3161f24c61', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:37', 'steve', '2019-02-20 02:13:37');
INSERT INTO `article_view` VALUES ('4b06d1a809ab474cb463083847dfaac6', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-02-04 08:22:46', 'kerry', '2019-02-04 08:22:46');
INSERT INTO `article_view` VALUES ('4b9285ae503344ffa6fdaaf239328882', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:40', 'steve', '2019-02-20 02:13:40');
INSERT INTO `article_view` VALUES ('4ba101a7f529498781c6640cd3637960', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:15', 'steve', '2019-02-22 09:17:15');
INSERT INTO `article_view` VALUES ('4bf87b0db8c642448b3e4fb89d02f0a4', 'dbb4ec6650bf46449eeb210ffed035bc', '1', 'kerry', '2019-01-24 09:36:31', 'kerry', '2019-01-24 09:36:31');
INSERT INTO `article_view` VALUES ('4c10082da08a408fbd98904cb89db7db', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:32', 'steve', '2019-02-22 09:17:32');
INSERT INTO `article_view` VALUES ('4c4c95652acf44e680d9eb6ccea3d7dd', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 08:48:19', 'steve', '2019-02-22 08:48:19');
INSERT INTO `article_view` VALUES ('4c9f428ebb864779b69d1b8674c9d3d1', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:28', 'steve', '2019-02-22 09:17:28');
INSERT INTO `article_view` VALUES ('4cad0f8af6db460682ee1778ded43240', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-18 01:50:17', 'kerry', '2019-01-18 01:50:17');
INSERT INTO `article_view` VALUES ('4cbf2b5395d647b890b3a7073236ae31', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-25 01:01:08', 'kerry', '2019-01-25 01:01:08');
INSERT INTO `article_view` VALUES ('4d02fafc145b402d897f73bf13fe60e7', '5c568f755c7d4f65bdca30840f565a84', '1', 'kerry', '2019-02-25 01:14:54', 'kerry', '2019-02-25 01:14:54');
INSERT INTO `article_view` VALUES ('4d13092628d44ca197c921775736eb47', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-02 05:13:17', 'kerry', '2019-02-02 05:13:17');
INSERT INTO `article_view` VALUES ('4d1befcfd744441aac1c0001c82b8d61', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'kerry', '2019-01-17 09:31:35', 'kerry', '2019-01-17 09:31:35');
INSERT INTO `article_view` VALUES ('4d2743e8b7bf4a678a2d9e781e716180', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-08 01:25:38', 'kerry', '2019-01-08 01:25:38');
INSERT INTO `article_view` VALUES ('4d48a7a83d544dea9d675b6dd0779fe4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'admin', '2019-02-20 07:52:21', 'admin', '2019-02-20 07:52:21');
INSERT INTO `article_view` VALUES ('4d752cb57ce04fa389f5dad6f13e4e47', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-07 12:34:23', 'kerry', '2019-01-07 12:34:23');
INSERT INTO `article_view` VALUES ('4d8a3c560ff04a93b81c1e275f496217', '53e68c687a114f71b96bccb9854473ac', '1', 'zero', '2019-01-21 05:20:52', 'zero', '2019-01-21 05:20:52');
INSERT INTO `article_view` VALUES ('4dc2f0646604440e8e039af08399cd5f', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'zero', '2019-02-11 09:12:44', 'zero', '2019-02-11 09:12:44');
INSERT INTO `article_view` VALUES ('4dd439399cef4f14a5e98b50cca9b895', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-30 10:09:04', 'kerry', '2019-01-30 10:09:04');
INSERT INTO `article_view` VALUES ('4e4499f191384cda84f71e4af0792a80', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:48', 'try', '2019-02-27 06:17:48');
INSERT INTO `article_view` VALUES ('4e73eb351b15437c8f7890f2a2ec50cd', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:44', 'steve', '2019-02-20 02:13:44');
INSERT INTO `article_view` VALUES ('4eb49a9d851d40c89ab0d93b633ffa24', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-02-22 08:51:56', 'kerry', '2019-02-22 08:51:56');
INSERT INTO `article_view` VALUES ('4ec0b3cddbfc452cb565c2597fcd3dcc', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'root', '2019-01-09 14:56:25', 'root', '2019-01-09 14:56:25');
INSERT INTO `article_view` VALUES ('4f01c2b979624b2b9c14359110da1fcf', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:27', 'steve', '2019-03-04 02:37:27');
INSERT INTO `article_view` VALUES ('4f4ce8a4500b44c3bb8c9a123a252e8c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 08:50:04', 'steve', '2019-02-22 08:50:04');
INSERT INTO `article_view` VALUES ('4f59231a18f14d668c83ea77f8957a42', '0c3e2f4a9f9c47e1b499432da6f80462', '1', '527510587@qq.com', '2019-01-21 05:27:50', '527510587@qq.com', '2019-01-21 05:27:50');
INSERT INTO `article_view` VALUES ('4f5a6cf37da94ec0a2d55ea0f5148c7e', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-23 05:45:02', 'kerry', '2019-01-23 05:45:02');
INSERT INTO `article_view` VALUES ('4f73d169c7c44af381016583a893fef4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('4fb3fa0a5c524009b5267091a8e1b0a3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:12', 'steve', '2019-02-20 02:14:12');
INSERT INTO `article_view` VALUES ('50186722cb264910bb88add2e66d630a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:43', 'steve', '2019-02-20 02:13:43');
INSERT INTO `article_view` VALUES ('501dce3ae727449c9fca4a4484adf18d', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:56:46', 'steve', '2019-02-22 08:56:46');
INSERT INTO `article_view` VALUES ('507cc4e6416844bbbd074c7bcc6112a6', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-02-07 16:23:37', 'kerry', '2019-02-07 16:23:37');
INSERT INTO `article_view` VALUES ('50929d3a9c4942c5816bc01c4ae6512e', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'kerry', '2019-01-22 15:47:27', 'kerry', '2019-01-22 15:47:27');
INSERT INTO `article_view` VALUES ('5094172fd73246adafdeb63359755415', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:48', 'steve', '2019-02-20 02:13:48');
INSERT INTO `article_view` VALUES ('50c7521306044dd7836ac87fab194a57', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-23 13:11:16', 'kerry', '2019-01-23 13:11:16');
INSERT INTO `article_view` VALUES ('516eddec7e5c476490442f98e40d3664', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:27', 'steve', '2019-03-04 02:37:27');
INSERT INTO `article_view` VALUES ('518bad65d899412aa0d9add47f1c1dd7', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-23 13:00:13', 'kerry', '2019-01-23 13:00:13');
INSERT INTO `article_view` VALUES ('51a1ed0ff4dc4846bcfd938a18b5ed11', '06d4868bce464082926df6abcd814b44', '1', 'mm', '2019-02-22 09:02:54', 'mm', '2019-02-22 09:02:54');
INSERT INTO `article_view` VALUES ('51b3d28addbc484c92ef87bf35d924c6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-04 00:58:22', 'kerry', '2019-03-04 00:58:22');
INSERT INTO `article_view` VALUES ('51c66063a6b2411290438017da0782d7', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'steve', '2019-01-09 12:57:17', 'steve', '2019-01-09 12:57:17');
INSERT INTO `article_view` VALUES ('51f7f522006941ae9048aaaeee1c9d41', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'zero', '2019-01-24 04:10:28', 'zero', '2019-01-24 04:10:28');
INSERT INTO `article_view` VALUES ('527c13d138a44563976bbe26ee1e1b23', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:15', 'steve', '2019-02-22 09:17:15');
INSERT INTO `article_view` VALUES ('52a53a86eb5a472abfeec3f0817c70c9', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:32', 'steve', '2019-03-04 02:37:32');
INSERT INTO `article_view` VALUES ('52bd1f0634d049528dc72add588be791', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:17', 'steve', '2019-02-22 09:17:17');
INSERT INTO `article_view` VALUES ('52c3838b9f0a42f08d2c0f2c425e7a10', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-03-01 08:38:42', 'kerry', '2019-03-01 08:38:42');
INSERT INTO `article_view` VALUES ('5307e3326323444c8d51e10ac5c1e8a6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:18', 'steve', '2019-02-22 09:17:18');
INSERT INTO `article_view` VALUES ('53139127fcdc4a498343ff1263f689c7', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-07 14:26:16', '1', '2019-01-07 14:26:16');
INSERT INTO `article_view` VALUES ('53179a7c7ac44b17a19008bfdba95008', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:16', 'steve', '2019-02-20 02:14:16');
INSERT INTO `article_view` VALUES ('53260018e0ab424c81211de9a5e84f0c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-01-23 02:26:20', 'mm', '2019-01-23 02:26:20');
INSERT INTO `article_view` VALUES ('5348e967a377459180db58b2352e2917', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'kerry', '2019-01-23 05:05:29', 'kerry', '2019-01-23 05:05:29');
INSERT INTO `article_view` VALUES ('536b0d17d9594de59dc0ff435ddaf5a9', '06d4868bce464082926df6abcd814b44', '1', 'steve', '2019-01-24 03:08:09', 'steve', '2019-01-24 03:08:09');
INSERT INTO `article_view` VALUES ('537a79457c0048998e7dba19cf7af7aa', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:33', 'steve', '2019-02-20 02:13:33');
INSERT INTO `article_view` VALUES ('53c1b87c28e3449c87888a8f00dd0709', 'a4cf8c7a5ae342aa9784687a5ef136d7', '1', 'admin', '2019-03-01 00:56:33', 'admin', '2019-03-01 00:56:33');
INSERT INTO `article_view` VALUES ('53ca38a89d6142519855931166d0afea', '4594d583f4a845968009c543d122bf60', '1', 'kerry', '2019-01-09 11:42:40', 'kerry', '2019-01-09 11:42:40');
INSERT INTO `article_view` VALUES ('5422a45c8101402380099113126ef39c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-17 10:55:46', 'kerry', '2019-01-17 10:55:46');
INSERT INTO `article_view` VALUES ('54244e682e97464f950ad3dfa74c58ed', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-24 00:21:16', 'steve', '2019-01-24 00:21:16');
INSERT INTO `article_view` VALUES ('544f472986154d208ae30fccdb34c9d8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 08:48:10', 'steve', '2019-02-22 08:48:10');
INSERT INTO `article_view` VALUES ('5459321be3274348a8e7de5ac039e8f3', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-09 14:38:02', 'kerry', '2019-01-09 14:38:02');
INSERT INTO `article_view` VALUES ('545edfd361464be7be79122e49118005', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 19:51:54', 'kerry', '2019-02-07 19:51:54');
INSERT INTO `article_view` VALUES ('546d0ab068ad4a94a661f3b2a94d4d20', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:50:05', 'wenc', '2019-01-21 05:50:05');
INSERT INTO `article_view` VALUES ('54f8151f641441359ab7a8ff2cf298f7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:12', 'steve', '2019-02-20 02:14:12');
INSERT INTO `article_view` VALUES ('550e992a76f940ec80674ee8c5cf5c84', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-28 08:32:28', 'kerry', '2019-01-28 08:32:28');
INSERT INTO `article_view` VALUES ('55145b16562141f4843cd6727bbcd3ac', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:19', 'steve', '2019-03-04 02:37:19');
INSERT INTO `article_view` VALUES ('55dee77490a244d4b00019254c37f415', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:12', 'steve', '2019-02-22 09:17:12');
INSERT INTO `article_view` VALUES ('56452da5cbb147b6aa7748cfa906f212', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-23 13:03:03', 'kerry', '2019-01-23 13:03:03');
INSERT INTO `article_view` VALUES ('568977f5724346eb8358eb39eda1d955', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:44', 'steve', '2019-02-20 02:13:44');
INSERT INTO `article_view` VALUES ('56e1405f352e40a5bfcf66b8f8765437', '834470bab65445a0a34e714fe0f28f8d', '1', 'Trevor-TW', '2019-02-26 03:19:29', 'Trevor-TW', '2019-02-26 03:19:29');
INSERT INTO `article_view` VALUES ('57126308bcaf4e18a15891b82ed73d4b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:26', 'steve', '2019-03-04 02:37:26');
INSERT INTO `article_view` VALUES ('57243c3ace594b43b8378b49fd43af34', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-09 10:14:32', 'kerry', '2019-01-09 10:14:32');
INSERT INTO `article_view` VALUES ('572c09bcf3bc49bdaad842b3b644d1a3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:14', 'steve', '2019-02-22 09:17:14');
INSERT INTO `article_view` VALUES ('57b40ea0a3064ae6b97c40dddc203cee', '5bc6d99cc971448383028118fe6c8f8c', '1', 'zero', '2019-01-24 04:54:22', 'zero', '2019-01-24 04:54:22');
INSERT INTO `article_view` VALUES ('57c8e81e2c944af9b5faa97175086a73', '455b97de71f44eeda0e359532724b5e8', '1', 'zero', '2019-01-24 04:47:37', 'zero', '2019-01-24 04:47:37');
INSERT INTO `article_view` VALUES ('580aca175acb4adaa15b473075503ade', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-01-12 10:50:32', 'mm', '2019-01-12 10:50:32');
INSERT INTO `article_view` VALUES ('5867c8cab38646998114f97baa6b962c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-04 00:58:05', 'kerry', '2019-03-04 00:58:05');
INSERT INTO `article_view` VALUES ('58abe55c6ac24fb8b00e7a32505e8c43', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-02-07 18:53:41', 'kerry', '2019-02-07 18:53:41');
INSERT INTO `article_view` VALUES ('5925a216a4d34ebc9c432de2178404e3', '65766085d8ae4638a613dad17a73dbec', '1', 'mm', '2019-02-27 06:14:10', 'mm', '2019-02-27 06:14:10');
INSERT INTO `article_view` VALUES ('59814297471640f090d744f891715f4c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'mm', '2019-02-28 03:14:23', 'mm', '2019-02-28 03:14:23');
INSERT INTO `article_view` VALUES ('598f29fc4ccf464b9c3ce706ac909d18', '3168cfb170d44fafabdf07145b06d807', '1', 'kerry', '2019-01-08 15:52:34', 'kerry', '2019-01-08 15:52:34');
INSERT INTO `article_view` VALUES ('59c3cfd2a8f9476b9b1acb46fda9c9c9', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-01-23 00:59:51', 'admin', '2019-01-23 00:59:51');
INSERT INTO `article_view` VALUES ('59d5310fd0fd451b9d777b640fb9413f', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-07 03:04:15', '1', '2019-01-07 03:04:15');
INSERT INTO `article_view` VALUES ('5a2b17901e504241851122bf48a30c1d', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 16:23:08', 'kerry', '2019-02-07 16:23:08');
INSERT INTO `article_view` VALUES ('5a3d0fedc1e24fad8bb1eab51401c851', '455b97de71f44eeda0e359532724b5e8', '1', 'zero', '2019-01-24 04:52:53', 'zero', '2019-01-24 04:52:53');
INSERT INTO `article_view` VALUES ('5af9aaccd1d542bc912a5a7e973b308c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 08:48:15', 'steve', '2019-02-22 08:48:15');
INSERT INTO `article_view` VALUES ('5b044c9dea5343f196e471b939388752', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:28', 'steve', '2019-02-22 09:17:28');
INSERT INTO `article_view` VALUES ('5b0bd247bed94c13b4fb07465853264d', '834470bab65445a0a34e714fe0f28f8d', '1', 'zero', '2019-01-29 02:44:34', 'zero', '2019-01-29 02:44:34');
INSERT INTO `article_view` VALUES ('5b9b89a4ad504ce695deb7ada408838b', '79632780cd9a4cac86a427061b978a4a', '1', 'steve', '2019-01-09 13:06:04', 'steve', '2019-01-09 13:06:04');
INSERT INTO `article_view` VALUES ('5bd35efed93144d3b4a005111b51cb4b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:48', 'steve', '2019-02-20 02:13:48');
INSERT INTO `article_view` VALUES ('5bfb27df4bff47b89863d6c1866e23e7', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'Trevor-TW', '2019-02-20 08:43:44', 'Trevor-TW', '2019-02-20 08:43:44');
INSERT INTO `article_view` VALUES ('5c3899d1fcdb40099f8a3e1f96b690fe', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:19', 'steve', '2019-02-22 09:17:19');
INSERT INTO `article_view` VALUES ('5ccff2cbe4f94db0babf0465cea96ed6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:34', 'steve', '2019-02-20 02:13:34');
INSERT INTO `article_view` VALUES ('5cdbb6443f594d2fa7c7246110347ad8', '06d4868bce464082926df6abcd814b44', '1', 'steve', '2019-02-22 09:27:04', 'steve', '2019-02-22 09:27:04');
INSERT INTO `article_view` VALUES ('5cde0502c183422f9a0a4491cb634cc9', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-02-02 08:47:34', 'kerry', '2019-02-02 08:47:34');
INSERT INTO `article_view` VALUES ('5d8970155ed84f9289046c6138bc3233', '6c1a8695f5e344b58f70d08028e6fb69', '1', 'kerry', '2019-01-09 10:15:36', 'kerry', '2019-01-09 10:15:36');
INSERT INTO `article_view` VALUES ('5d90532c51d94e028abf161411d3f5e8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:15', 'steve', '2019-02-20 02:14:15');
INSERT INTO `article_view` VALUES ('5d9e33451e294dfa847e994789ea6786', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'zero', '2019-01-24 06:03:05', 'zero', '2019-01-24 06:03:05');
INSERT INTO `article_view` VALUES ('5da5ebf7b8ea4973a9afd91d8f96173c', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-23 05:38:10', 'kerry', '2019-01-23 05:38:10');
INSERT INTO `article_view` VALUES ('5dcf19d300dd42ab855d4a4f8431cc2c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-10 04:31:13', 'kerry', '2019-01-10 04:31:13');
INSERT INTO `article_view` VALUES ('5e103929cb2a42479b236c6e16614f16', '5bc6d99cc971448383028118fe6c8f8c', '1', 'steve', '2019-01-24 07:11:50', 'steve', '2019-01-24 07:11:50');
INSERT INTO `article_view` VALUES ('5e364620c71b4b5382a17ee9bc4835b5', '53e68c687a114f71b96bccb9854473ac', '1', 'leo', '2019-01-21 04:47:41', 'leo', '2019-01-21 04:47:41');
INSERT INTO `article_view` VALUES ('5f15580d687a4fa59e20d6a54db5f8a8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:27', 'steve', '2019-03-04 02:37:27');
INSERT INTO `article_view` VALUES ('5f5c44b69e2e4220b0d7387ec66b2b2e', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-02-08 14:12:37', 'kerry', '2019-02-08 14:12:37');
INSERT INTO `article_view` VALUES ('5f91efacd824422ea44bdef434ad5f23', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:47', 'steve', '2019-02-20 02:13:47');
INSERT INTO `article_view` VALUES ('5fa3c465b6c449e9afbcf7ad12c3f5f9', '5ca4395fcc0241e796fa56b93ceb584d', '1', 'steve', '2019-01-18 01:11:35', 'steve', '2019-01-18 01:11:35');
INSERT INTO `article_view` VALUES ('5fbc8653d3fc461c8ff6b1d0f12ea6e3', '65766085d8ae4638a613dad17a73dbec', '1', 'mm', '2019-02-27 06:13:51', 'mm', '2019-02-27 06:13:51');
INSERT INTO `article_view` VALUES ('5fe2ffadc3a743ca8a50a4921d4f4b5b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:44', 'steve', '2019-02-20 02:13:44');
INSERT INTO `article_view` VALUES ('601a182440784c15b09bd28e8420349d', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-09 05:47:40', '1', '2019-01-09 05:47:40');
INSERT INTO `article_view` VALUES ('6027ea15a1d6476e9fc7110370ba69a0', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-07 14:26:34', '1', '2019-01-07 14:26:34');
INSERT INTO `article_view` VALUES ('6066652605384c15a791b9bb7aee25d9', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:37:45', 'steve', '2019-02-22 09:37:45');
INSERT INTO `article_view` VALUES ('60a7d7f8d30940af9462cafce018f876', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:36', 'steve', '2019-02-20 02:13:36');
INSERT INTO `article_view` VALUES ('60af875cb5134f9590f549e41549de60', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:32', 'steve', '2019-03-04 02:37:32');
INSERT INTO `article_view` VALUES ('618b81d32a304e86a7fdf7829c9feb05', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-09 13:03:00', 'steve', '2019-01-09 13:03:00');
INSERT INTO `article_view` VALUES ('61a5a41d13734c819813793e816fed92', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'wlj', '2019-01-21 05:18:04', 'wlj', '2019-01-21 05:18:04');
INSERT INTO `article_view` VALUES ('61c43ada18454e1fa26d675087e8492a', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-02-07 16:23:23', 'kerry', '2019-02-07 16:23:23');
INSERT INTO `article_view` VALUES ('6200d052421a4da087ee3e42cb6323d0', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-31 09:40:06', 'kerry', '2019-01-31 09:40:06');
INSERT INTO `article_view` VALUES ('6201ca9d8288467498bc95163fdfaccf', '00bd8bb8b1e24e939915e6731326ab40', '1', 'kerry', '2019-01-25 03:51:38', 'kerry', '2019-01-25 03:51:38');
INSERT INTO `article_view` VALUES ('6283922f51b04693881db4f7ef750124', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 09:11:00', 'kerry', '2019-01-09 09:11:00');
INSERT INTO `article_view` VALUES ('62922daa9af7483b82b79cd3cd37d1e3', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', '1', '2019-01-06 16:21:46', '1', '2019-01-06 16:21:46');
INSERT INTO `article_view` VALUES ('629c5531c2114267b59b36507a0d9e73', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:30', 'steve', '2019-02-22 09:17:30');
INSERT INTO `article_view` VALUES ('62c5e7cf62bd472bb90b481c8931fa93', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:10', 'steve', '2019-02-20 02:14:10');
INSERT INTO `article_view` VALUES ('6357b80db273471a91e8a54901d4693b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:29', 'steve', '2019-03-04 02:37:29');
INSERT INTO `article_view` VALUES ('6390d9f31c194dacbe2f283fe9f6d1c5', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:49:15', 'wenc', '2019-01-21 05:49:15');
INSERT INTO `article_view` VALUES ('640321836e7b4b708ba682154fe393c1', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:59', 'steve', '2019-02-20 02:13:59');
INSERT INTO `article_view` VALUES ('641865f8559b4f4095875410afb4e672', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-23 13:08:33', 'kerry', '2019-01-23 13:08:33');
INSERT INTO `article_view` VALUES ('642e1b4245754493942c654b10bc1779', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'kerry', '2019-01-23 08:45:48', 'kerry', '2019-01-23 08:45:48');
INSERT INTO `article_view` VALUES ('6433615bc72d4423b618b8578247589e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:28', 'steve', '2019-03-04 02:37:28');
INSERT INTO `article_view` VALUES ('644461ba3fa54766afa2f396970b9428', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'root', '2019-01-09 15:06:04', 'root', '2019-01-09 15:06:04');
INSERT INTO `article_view` VALUES ('64ae908e06c54ff6b12c89bdba79428b', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-25 00:49:10', 'kerry', '2019-01-25 00:49:10');
INSERT INTO `article_view` VALUES ('64aece10407a4880918dab46ef828c95', 'a4cf8c7a5ae342aa9784687a5ef136d7', '1', 'kerry', '2019-03-02 03:44:40', 'kerry', '2019-03-02 03:44:40');
INSERT INTO `article_view` VALUES ('64d94a1dd543410c9fed88f5c0950571', '919493ab3980403794e7c254a4f35ab4', '1', 'steve', '2019-01-24 00:18:35', 'steve', '2019-01-24 00:18:35');
INSERT INTO `article_view` VALUES ('64fc2dd5c7ab4caf880421af1da20f39', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-08 04:49:57', 'kerry', '2019-01-08 04:49:57');
INSERT INTO `article_view` VALUES ('6513b145ad6b476f90c9923f82d830a9', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'kerry', '2019-01-15 15:20:50', 'kerry', '2019-01-15 15:20:50');
INSERT INTO `article_view` VALUES ('65265197615746e8b1c7085b0cb527ab', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:39', 'steve', '2019-02-20 02:13:39');
INSERT INTO `article_view` VALUES ('654646aee8b14aa995d180884ec34160', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-20 03:49:15', 'steve', '2019-02-20 03:49:15');
INSERT INTO `article_view` VALUES ('656cdf207a95415f9678a89667c89823', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:01', 'steve', '2019-02-20 02:14:01');
INSERT INTO `article_view` VALUES ('6571e2a5806c47dba357d0f683e38626', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-18 02:05:33', 'kerry', '2019-01-18 02:05:33');
INSERT INTO `article_view` VALUES ('657ed7bdb1114e3ea448d3e931e58453', '65766085d8ae4638a613dad17a73dbec', '1', 'mm', '2019-02-27 06:14:52', 'mm', '2019-02-27 06:14:52');
INSERT INTO `article_view` VALUES ('65d2a29680e94eeb8c738ea8a9dbfae4', '00bd8bb8b1e24e939915e6731326ab40', '1', 'mm', '2019-01-24 09:48:05', 'mm', '2019-01-24 09:48:05');
INSERT INTO `article_view` VALUES ('66141d2a333345228218cdd1fd31eae5', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-22 10:17:58', 'kerry', '2019-01-22 10:17:58');
INSERT INTO `article_view` VALUES ('6622d44d69dc41a9874face4bc4f791f', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-20 02:20:15', 'steve', '2019-02-20 02:20:15');
INSERT INTO `article_view` VALUES ('6653b399db2a4366935feaa9f976c0b2', '6014d7abacfd4034bf3e2ded207468ba', '1', 'kerry', '2019-01-22 00:50:05', 'kerry', '2019-01-22 00:50:05');
INSERT INTO `article_view` VALUES ('6659b25f6b5b4227a6a5ab34a05b06c7', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-01-24 02:15:02', 'mm', '2019-01-24 02:15:02');
INSERT INTO `article_view` VALUES ('667561eb66b6466fa77d211dba1d190b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:19:03', 'steve', '2019-02-22 09:19:03');
INSERT INTO `article_view` VALUES ('6684595faba94f31b8cac734559edc07', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-07 03:02:51', '1', '2019-01-07 03:02:51');
INSERT INTO `article_view` VALUES ('66c75c0b3b144a79922d017390ee087c', '5c568f755c7d4f65bdca30840f565a84', '1', 'zero', '2019-01-24 05:49:44', 'zero', '2019-01-24 05:49:44');
INSERT INTO `article_view` VALUES ('66cfe1964e424f5892961a2771652911', '4594d583f4a845968009c543d122bf60', '1', '527510587@qq.com', '2019-01-21 05:28:03', '527510587@qq.com', '2019-01-21 05:28:03');
INSERT INTO `article_view` VALUES ('66f378699a8941889f7704f360f41126', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:23', 'steve', '2019-02-22 09:17:23');
INSERT INTO `article_view` VALUES ('6758497c205747dea57370f86ab420d1', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'zero', '2019-01-17 08:18:10', 'zero', '2019-01-17 08:18:10');
INSERT INTO `article_view` VALUES ('6759cd9a6f4e4944b2c1617523066b8e', 'c1200fd6a7184740a3131ee481101716', '1', 'kerry', '2019-01-22 01:09:40', 'kerry', '2019-01-22 01:09:40');
INSERT INTO `article_view` VALUES ('675c15892eca41bf9dc33065d5255f21', '06d4868bce464082926df6abcd814b44', '1', '1', '2019-01-07 14:46:47', '1', '2019-01-07 14:46:47');
INSERT INTO `article_view` VALUES ('6768b108ec35497baf7429d56e2db8d1', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:20', 'steve', '2019-03-04 02:37:20');
INSERT INTO `article_view` VALUES ('677627a7628c42a4b6e97b8ada508518', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-13 14:41:12', 'kerry', '2019-01-13 14:41:12');
INSERT INTO `article_view` VALUES ('67790ba1c78d4f229304922e3a71a3e4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:56', 'steve', '2019-02-20 02:13:56');
INSERT INTO `article_view` VALUES ('680a86b076a74caa8ea00eab71849709', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:54', 'steve', '2019-02-20 02:13:54');
INSERT INTO `article_view` VALUES ('68c31438260b43c3854fe4c8f9786f03', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-17 10:35:55', 'kerry', '2019-01-17 10:35:55');
INSERT INTO `article_view` VALUES ('68daf3db97e34d519160cb03b8e71787', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:27', 'steve', '2019-03-04 02:37:27');
INSERT INTO `article_view` VALUES ('69950e975138451ab73f19cdce0fec5d', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:24', 'steve', '2019-02-20 02:13:24');
INSERT INTO `article_view` VALUES ('6a4f5f655b4f4421af1f0429bd0ba64d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:12', 'steve', '2019-02-20 02:14:12');
INSERT INTO `article_view` VALUES ('6ad165d3b5a3417d901e18d31c4986d0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:34', 'steve', '2019-02-20 02:13:34');
INSERT INTO `article_view` VALUES ('6ae1b3cbbb4e41ae85d24ac475a4ce15', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:36', 'steve', '2019-03-04 02:37:36');
INSERT INTO `article_view` VALUES ('6b16f17a25fd45f1b88aa68cc5ac532f', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-30 10:16:20', 'kerry', '2019-01-30 10:16:20');
INSERT INTO `article_view` VALUES ('6b1f622cfd61422e8fb8fd11504e6b55', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-02-08 13:56:00', 'kerry', '2019-02-08 13:56:00');
INSERT INTO `article_view` VALUES ('6b2b2c1135e3450c9bb6f0a9a8ef7af0', '79632780cd9a4cac86a427061b978a4a', '1', 'wenc', '2019-01-21 05:49:35', 'wenc', '2019-01-21 05:49:35');
INSERT INTO `article_view` VALUES ('6b6237e31d0c444aa5a4a919579b9b05', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:45', 'steve', '2019-02-20 02:13:45');
INSERT INTO `article_view` VALUES ('6b831496a6f34c0da293c77372de4896', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:14', 'steve', '2019-02-22 09:17:14');
INSERT INTO `article_view` VALUES ('6b97ea7edabe440589717b9e144f24cd', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-09 16:36:08', 'kerry', '2019-03-09 16:36:08');
INSERT INTO `article_view` VALUES ('6baa414a0ee64809ad0cf513747c56e6', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-23 05:35:29', 'kerry', '2019-01-23 05:35:29');
INSERT INTO `article_view` VALUES ('6bb4d7f2defa41bdbe86178ad4e5756f', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-07 07:03:05', '1', '2019-01-07 07:03:05');
INSERT INTO `article_view` VALUES ('6bb65d051ab24d2a8b004e339d8031e5', 'a4cf8c7a5ae342aa9784687a5ef136d7', '1', 'kerry', '2019-02-27 06:29:02', 'kerry', '2019-02-27 06:29:02');
INSERT INTO `article_view` VALUES ('6c1277f4597e4385835f93fcdab11153', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:48', 'steve', '2019-02-20 02:13:48');
INSERT INTO `article_view` VALUES ('6c571e0648ca430e8e67567d206d5a47', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:13', 'steve', '2019-02-22 09:17:13');
INSERT INTO `article_view` VALUES ('6c8c3d14c02e4570a7170290f03a116d', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-02-08 14:27:43', 'kerry', '2019-02-08 14:27:43');
INSERT INTO `article_view` VALUES ('6cc53126a8f84fc5a81ee3dbe3f66346', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:31', 'steve', '2019-02-22 09:17:31');
INSERT INTO `article_view` VALUES ('6cc892635b014b3a986003fe4ca5a581', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-20 05:00:41', 'steve', '2019-02-20 05:00:41');
INSERT INTO `article_view` VALUES ('6d0759207c864ed2b6471f5d3da57e36', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:31', 'steve', '2019-03-04 02:37:31');
INSERT INTO `article_view` VALUES ('6d40536e757f4612a176aa4b5a429d8b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:36', 'steve', '2019-03-04 02:37:36');
INSERT INTO `article_view` VALUES ('6d50633891c241d0a8c93f87f3aa1e96', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-02-22 08:51:06', 'kerry', '2019-02-22 08:51:06');
INSERT INTO `article_view` VALUES ('6d515a7f66934bbdae63d37753dfc759', '5c568f755c7d4f65bdca30840f565a84', '1', 'kerry', '2019-02-22 11:26:17', 'kerry', '2019-02-22 11:26:17');
INSERT INTO `article_view` VALUES ('6d8d3076437d417d850785a9fc422115', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', '1', '2019-01-07 06:54:22', '1', '2019-01-07 06:54:22');
INSERT INTO `article_view` VALUES ('6db51587347b40db82b357b1b7f3b450', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-09 10:20:28', 'kerry', '2019-01-09 10:20:28');
INSERT INTO `article_view` VALUES ('6dc5486888084e87a4e0556feb0e158c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:25', 'steve', '2019-03-04 02:37:25');
INSERT INTO `article_view` VALUES ('6e6f96684df84785ab67fad58b25df13', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:21', 'steve', '2019-03-04 02:37:21');
INSERT INTO `article_view` VALUES ('6eb4ec04871e469d9801945a2979c950', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:22', 'steve', '2019-02-22 09:17:22');
INSERT INTO `article_view` VALUES ('6ebc48ea370c4b8e9a264b3867875371', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-09 09:28:19', 'kerry', '2019-01-09 09:28:19');
INSERT INTO `article_view` VALUES ('6ec6b377b6c74510a125b2d3f50d9bc3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-02-20 03:01:39', 'kerry', '2019-02-20 03:01:39');
INSERT INTO `article_view` VALUES ('6f16b704df18483382618aec51e65eae', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-02-27 06:19:42', 'admin', '2019-02-27 06:19:42');
INSERT INTO `article_view` VALUES ('6f190f6f1b1247988aaaa460a2c15fa5', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-02-22 08:52:20', 'kerry', '2019-02-22 08:52:20');
INSERT INTO `article_view` VALUES ('6f920860212a4492929a3c0200690d7c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:08', 'steve', '2019-02-20 02:14:08');
INSERT INTO `article_view` VALUES ('6ffda569bd564a9395cc6c80b36b7501', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-23 13:04:10', 'kerry', '2019-01-23 13:04:10');
INSERT INTO `article_view` VALUES ('70667424968547a1b3dc704e972a9ec6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:35', 'steve', '2019-03-04 02:37:35');
INSERT INTO `article_view` VALUES ('70894d3e630e4d05b9b4235df5192556', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-01-24 00:18:27', 'steve', '2019-01-24 00:18:27');
INSERT INTO `article_view` VALUES ('70d7e8362d284fe9b8b837d35b40da69', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 09:01:43', 'steve', '2019-02-22 09:01:43');
INSERT INTO `article_view` VALUES ('70f9d2450f1645d28bd7b0dea3e8a95d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-02-28 03:22:22', 'kerry', '2019-02-28 03:22:22');
INSERT INTO `article_view` VALUES ('710b9f25dc46452ba5eaf9775758d05b', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'zero', '2019-01-10 01:33:33', 'zero', '2019-01-10 01:33:33');
INSERT INTO `article_view` VALUES ('712c9b95877e4109a59995f1e389ea91', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:35', 'steve', '2019-02-20 02:13:35');
INSERT INTO `article_view` VALUES ('714711484fc24f4c9662cf9eaa0f107f', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:44', 'try', '2019-02-27 06:17:44');
INSERT INTO `article_view` VALUES ('717cee4298dd4f0dabf43f31564372f4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:48', 'steve', '2019-02-20 02:13:48');
INSERT INTO `article_view` VALUES ('7187cbe0fdc841fbb8397218ef017f6e', '72e49aa72da747c49d87fe6539ae2306', '1', 'kerry', '2019-01-09 00:56:41', 'kerry', '2019-01-09 00:56:41');
INSERT INTO `article_view` VALUES ('71b30b304c4f45c79eca0c92526edaa3', 'dbb4ec6650bf46449eeb210ffed035bc', '1', 'steve', '2019-01-24 08:37:57', 'steve', '2019-01-24 08:37:57');
INSERT INTO `article_view` VALUES ('71ca3ef8ef6342cdada05e947040cdf4', '06d4868bce464082926df6abcd814b44', '1', 'zero', '2019-02-18 15:48:27', 'zero', '2019-02-18 15:48:27');
INSERT INTO `article_view` VALUES ('723a4990bb774b1a9bc9a074cf7d4134', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-21 12:44:05', 'kerry', '2019-01-21 12:44:05');
INSERT INTO `article_view` VALUES ('727a4a2a969c4a9696d4d8bd86ba1170', '5ca4395fcc0241e796fa56b93ceb584d', '1', 'steve', '2019-01-18 01:11:43', 'steve', '2019-01-18 01:11:43');
INSERT INTO `article_view` VALUES ('72841943514c49bd9fbdca5822e52de7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:01', 'steve', '2019-02-20 02:14:01');
INSERT INTO `article_view` VALUES ('72a392f0559e40699b9fba90aefa3de0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('72b5f3e2d3d549228bbc23e1782a9ad0', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-08 04:59:33', 'kerry', '2019-01-08 04:59:33');
INSERT INTO `article_view` VALUES ('72d902d870e04f0b873d4ff4bd487364', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:57', 'steve', '2019-02-20 02:13:57');
INSERT INTO `article_view` VALUES ('7352956b10b7425d8b37c74337c80d07', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:20', 'steve', '2019-02-20 02:13:20');
INSERT INTO `article_view` VALUES ('73681c25bd164b718204a4b7b802bdce', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:19:02', 'steve', '2019-02-22 09:19:02');
INSERT INTO `article_view` VALUES ('7381a8095eb04766a98cecfb3c9cff93', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-07 14:26:09', '1', '2019-01-07 14:26:09');
INSERT INTO `article_view` VALUES ('73919c7a66b54eaeb84f21f18087a3ba', '834470bab65445a0a34e714fe0f28f8d', '1', 'mm', '2019-02-12 08:14:22', 'mm', '2019-02-12 08:14:22');
INSERT INTO `article_view` VALUES ('73cc6b6706014dd2b5f9269a301d94d0', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:56:55', 'steve', '2019-02-22 08:56:55');
INSERT INTO `article_view` VALUES ('73ea1d0e614d44a5b81c621bae83c982', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:49', 'steve', '2019-02-22 09:17:49');
INSERT INTO `article_view` VALUES ('7415954e954444819fdfbd7e86360980', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'steve', '2019-02-22 08:51:36', 'steve', '2019-02-22 08:51:36');
INSERT INTO `article_view` VALUES ('741c7186f9c14ce3a12d63da6a991084', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:57', 'try', '2019-02-27 06:17:57');
INSERT INTO `article_view` VALUES ('74373d6a7ebe4c5caea795dd1c3f47aa', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-09 10:11:29', 'kerry', '2019-01-09 10:11:29');
INSERT INTO `article_view` VALUES ('74c2067c81a848cfba492b3137500bd9', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'Trevor-TW', '2019-02-20 08:44:00', 'Trevor-TW', '2019-02-20 08:44:00');
INSERT INTO `article_view` VALUES ('74d93769b8de4895b42b27a785564768', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-02-07 18:07:29', 'kerry', '2019-02-07 18:07:29');
INSERT INTO `article_view` VALUES ('7576dc13e38442e49a6123066b02b7c2', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'root', '2019-01-09 14:55:21', 'root', '2019-01-09 14:55:21');
INSERT INTO `article_view` VALUES ('75d7077235214cf880d34c7f43bf6c83', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'Trevor-TW', '2019-02-20 08:43:39', 'Trevor-TW', '2019-02-20 08:43:39');
INSERT INTO `article_view` VALUES ('75ed3f1dc71f448b9c08d6bcb257bdfe', '55c692ac59d94fdbb06f217bb7275642', '1', 'kerry', '2019-02-07 16:39:48', 'kerry', '2019-02-07 16:39:48');
INSERT INTO `article_view` VALUES ('7608c24f62954e96828f5b8f00d67d99', 'a4cf8c7a5ae342aa9784687a5ef136d7', '1', 'mm', '2019-02-27 06:32:44', 'mm', '2019-02-27 06:32:44');
INSERT INTO `article_view` VALUES ('7686752a2ea449da864bc341839436de', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-15 15:20:40', 'kerry', '2019-01-15 15:20:40');
INSERT INTO `article_view` VALUES ('76b1d0247aad454b89c18c0f2b70bf49', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:22', 'steve', '2019-02-20 02:13:22');
INSERT INTO `article_view` VALUES ('76dd929ee2db45dab0a0fdb2e78f4af7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:15', 'steve', '2019-02-22 09:17:15');
INSERT INTO `article_view` VALUES ('76f90e27b2e445969b0b68a4feae7321', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:31', 'steve', '2019-02-20 02:13:31');
INSERT INTO `article_view` VALUES ('773f8a8bb3c64bb2b5f26e04888b7c57', '5bc6d99cc971448383028118fe6c8f8c', '1', 'zero', '2019-01-24 04:53:03', 'zero', '2019-01-24 04:53:03');
INSERT INTO `article_view` VALUES ('7794ea00a4654a9c8365bfa949e58232', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:50', 'steve', '2019-02-20 02:13:50');
INSERT INTO `article_view` VALUES ('77c46d9424224a0a889c35d78f62367d', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-20 03:49:21', 'steve', '2019-02-20 03:49:21');
INSERT INTO `article_view` VALUES ('77e1223c3b4748a8803db1dde1c8ec6f', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-08 01:25:33', 'kerry', '2019-01-08 01:25:33');
INSERT INTO `article_view` VALUES ('77f8ef20f95e4cbfaf01283c86979705', '53b0e1a87a094f15a186c2b60ebfb0ac', '1', 'kerry', '2019-01-17 17:08:11', 'kerry', '2019-01-17 17:08:11');
INSERT INTO `article_view` VALUES ('7800fe541b2c486795bfb16d91d41f06', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-22 08:13:28', 'kerry', '2019-01-22 08:13:28');
INSERT INTO `article_view` VALUES ('784e4930b0124b698be306e5e5b8066e', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-03-01 00:57:02', 'admin', '2019-03-01 00:57:02');
INSERT INTO `article_view` VALUES ('78cea91dd04a420ebae7f041a68a1e9b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:12', 'steve', '2019-02-20 02:13:12');
INSERT INTO `article_view` VALUES ('78d25da09a0349c6842007b21ae0ce24', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 07:40:41', 'kerry', '2019-02-07 07:40:41');
INSERT INTO `article_view` VALUES ('78dfe2ea91094f71a133ffdb97aaa4aa', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:33', 'steve', '2019-03-04 02:37:33');
INSERT INTO `article_view` VALUES ('790bda6acc4d4f02a6e094b349ae5ea2', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-18 01:04:14', 'kerry', '2019-01-18 01:04:14');
INSERT INTO `article_view` VALUES ('792ddbb705c04db685c90497e6392d3a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:53', 'steve', '2019-02-20 02:13:53');
INSERT INTO `article_view` VALUES ('79696747c2774015ac374b02770f3cf1', '5bc6d99cc971448383028118fe6c8f8c', '1', 'steve', '2019-01-24 07:12:31', 'steve', '2019-01-24 07:12:31');
INSERT INTO `article_view` VALUES ('7974b544a99f43f995e3af5a4061e7f2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:32', 'steve', '2019-02-22 09:17:32');
INSERT INTO `article_view` VALUES ('7976e48c888d4b8d963f711dd1546998', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'root', '2019-01-30 14:59:28', 'root', '2019-01-30 14:59:28');
INSERT INTO `article_view` VALUES ('7982b8d852364786aed725e5508b0a00', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:18', 'steve', '2019-02-22 09:17:18');
INSERT INTO `article_view` VALUES ('7a19adf2e13d4359a4d7a745fdfc547f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('7a40524c9bb74569807ebd028cf4e8c5', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'leo', '2019-02-20 01:47:57', 'leo', '2019-02-20 01:47:57');
INSERT INTO `article_view` VALUES ('7a5eba5b0d4c4c65b19d2d37187e36e2', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-02-07 17:08:41', 'kerry', '2019-02-07 17:08:41');
INSERT INTO `article_view` VALUES ('7ac6068004c4442da4a0d90873e5c9e2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:28', 'steve', '2019-03-04 02:37:28');
INSERT INTO `article_view` VALUES ('7af79367663240e197a75bfc31405f81', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-07 02:50:54', '1', '2019-01-07 02:50:54');
INSERT INTO `article_view` VALUES ('7b0c0bd724314647b2610630430a5dad', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'mm', '2019-02-20 03:04:36', 'mm', '2019-02-20 03:04:36');
INSERT INTO `article_view` VALUES ('7b119922f6dc4e73bc94ce834adaf5f4', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-22 03:17:28', 'kerry', '2019-01-22 03:17:28');
INSERT INTO `article_view` VALUES ('7b4e4683dc484169891b2618534bab14', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-24 05:56:25', 'kerry', '2019-01-24 05:56:25');
INSERT INTO `article_view` VALUES ('7b76c0c71356469eb7e3e67380a5bc04', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:28', 'steve', '2019-02-22 09:17:28');
INSERT INTO `article_view` VALUES ('7c0fc85320ce4dbaba34c57fd5802565', '5cecda066fc446d68ecc10efc5e7729e', '1', 'kerry', '2019-01-17 15:59:21', 'kerry', '2019-01-17 15:59:21');
INSERT INTO `article_view` VALUES ('7c68261e35984e19815c9283b4a52aa8', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-23 05:03:59', 'kerry', '2019-01-23 05:03:59');
INSERT INTO `article_view` VALUES ('7c84954c76a649d8a2ac2454c5331f21', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:30', 'steve', '2019-03-04 02:37:30');
INSERT INTO `article_view` VALUES ('7d0a865b4c29441993d918da35ada98c', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'zero', '2019-01-24 04:53:11', 'zero', '2019-01-24 04:53:11');
INSERT INTO `article_view` VALUES ('7d6375e2bc124f3aa9b5b3ec24b25af5', '63966e153389494491e151eae19782d2', '1', 'kerry', '2019-01-09 00:57:09', 'kerry', '2019-01-09 00:57:09');
INSERT INTO `article_view` VALUES ('7d7abd6093a5460e9c0ea740ba50fa66', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-23 13:39:16', 'kerry', '2019-01-23 13:39:16');
INSERT INTO `article_view` VALUES ('7dd9668ab0e04b949c0f21084d484618', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:49', 'steve', '2019-02-20 02:13:49');
INSERT INTO `article_view` VALUES ('7e744c234bf245eeb9e27e7faa25aec7', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-22 09:51:33', 'kerry', '2019-01-22 09:51:33');
INSERT INTO `article_view` VALUES ('7ea49b1a7587451bbf9a70c521b493ee', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:38', 'steve', '2019-02-20 02:13:38');
INSERT INTO `article_view` VALUES ('7fa6217c82fc4d698e20b524a5beb75f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:15', 'steve', '2019-02-20 02:14:15');
INSERT INTO `article_view` VALUES ('7fb07a61c1114494b55843682ae10394', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-30 10:03:44', 'kerry', '2019-01-30 10:03:44');
INSERT INTO `article_view` VALUES ('807bee7f81bd43ff8bc81e57a3b9b4de', '55c692ac59d94fdbb06f217bb7275642', '1', 'root', '2019-01-17 02:39:29', 'root', '2019-01-17 02:39:29');
INSERT INTO `article_view` VALUES ('80976f67e62b48a9a0540827315a206c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'wenbin.gao@definesys.com', '2019-01-09 13:05:34', 'wenbin.gao@definesys.com', '2019-01-09 13:05:34');
INSERT INTO `article_view` VALUES ('80deacb3ab0840138443a7689e16599c', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:49:32', 'wenc', '2019-01-21 05:49:32');
INSERT INTO `article_view` VALUES ('80eec65afbf64f8891c27d750d65adc8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:14', 'steve', '2019-02-22 09:17:14');
INSERT INTO `article_view` VALUES ('8112c4f822a2424dbd2e9b0076e7d5e3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:25', 'steve', '2019-03-04 02:37:25');
INSERT INTO `article_view` VALUES ('81655c6d36ed43649b9c28f57ff53648', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:15', 'steve', '2019-02-20 02:13:15');
INSERT INTO `article_view` VALUES ('8196e540afbc43f796f385fb9006c610', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-17 10:49:50', 'kerry', '2019-01-17 10:49:50');
INSERT INTO `article_view` VALUES ('81fdfb7434e94fa587a910bce528e18a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'mm', '2019-02-20 03:04:31', 'mm', '2019-02-20 03:04:31');
INSERT INTO `article_view` VALUES ('822c3d8ae38f4efb9884def8584612fb', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'mm', '2019-02-22 09:00:27', 'mm', '2019-02-22 09:00:27');
INSERT INTO `article_view` VALUES ('829c677147bd4cfeaf08289755f67c3e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:52', 'steve', '2019-02-20 02:13:52');
INSERT INTO `article_view` VALUES ('82a49c013c4d4c339c521b9a6d96cdae', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-04 00:58:34', 'kerry', '2019-03-04 00:58:34');
INSERT INTO `article_view` VALUES ('82bd7422a42b44a3b4fb1ad661447bc3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:41', 'steve', '2019-02-20 02:13:41');
INSERT INTO `article_view` VALUES ('8353a60f03904bf697658dcdbdcaf8bb', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-02-20 03:01:20', 'kerry', '2019-02-20 03:01:20');
INSERT INTO `article_view` VALUES ('83581e36c2254763b0555570540c1c76', '834470bab65445a0a34e714fe0f28f8d', '1', 'mm', '2019-02-27 06:21:48', 'mm', '2019-02-27 06:21:48');
INSERT INTO `article_view` VALUES ('83c2e97511754da8982b5c1c5561e06b', '4594d583f4a845968009c543d122bf60', '1', 'kerry', '2019-01-17 10:58:21', 'kerry', '2019-01-17 10:58:21');
INSERT INTO `article_view` VALUES ('83eb121bc3d541bfa11d062be38299c9', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 11:21:31', 'kerry', '2019-01-09 11:21:31');
INSERT INTO `article_view` VALUES ('83f3c7537447494798498913a8a3765a', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-08 04:56:21', 'kerry', '2019-01-08 04:56:21');
INSERT INTO `article_view` VALUES ('841ebecc61da4759b4b57967205b9663', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:35', 'steve', '2019-03-04 02:37:35');
INSERT INTO `article_view` VALUES ('8421e27a64c240e890eeea9ae5a6d6d1', '455b97de71f44eeda0e359532724b5e8', '1', 'zero', '2019-01-24 04:53:19', 'zero', '2019-01-24 04:53:19');
INSERT INTO `article_view` VALUES ('84e317d65cd64aebba21b2a390d2afc9', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-22 01:03:49', 'kerry', '2019-01-22 01:03:49');
INSERT INTO `article_view` VALUES ('855fdfa109cc4f2eab0fad594f3cb61b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:14', 'steve', '2019-02-22 09:17:14');
INSERT INTO `article_view` VALUES ('857e959c3ae84b489d4ee92638c76e54', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:21', 'steve', '2019-03-04 02:37:21');
INSERT INTO `article_view` VALUES ('85979fc0cecf4862b1dddb5b7aa877e5', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-24 05:56:09', 'kerry', '2019-01-24 05:56:09');
INSERT INTO `article_view` VALUES ('85a2e8209ab54831ba54610e64c73d9a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:30', 'steve', '2019-02-22 09:17:30');
INSERT INTO `article_view` VALUES ('85bfd30c4ef047cb8f2eddcb8598e600', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:45', 'steve', '2019-02-20 02:13:45');
INSERT INTO `article_view` VALUES ('85ce72c53aaa4357b86c13d6196d07e9', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:32', 'steve', '2019-02-20 02:13:32');
INSERT INTO `article_view` VALUES ('85f72de1fcea489882611bf9bc8ead35', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:39', 'steve', '2019-02-20 02:13:39');
INSERT INTO `article_view` VALUES ('8644b0bd62ef48d5ac2f40489299b8c0', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'kerry', '2019-01-23 05:45:42', 'kerry', '2019-01-23 05:45:42');
INSERT INTO `article_view` VALUES ('865e27b2eb8b4167b1152b89881fd4da', '06d4868bce464082926df6abcd814b44', '1', 'devinShi', '2019-01-10 05:25:31', 'devinShi', '2019-01-10 05:25:31');
INSERT INTO `article_view` VALUES ('8774170e16dd4532807f293a82968320', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-09 16:45:55', 'kerry', '2019-03-09 16:45:55');
INSERT INTO `article_view` VALUES ('87a9f0c03c5d41dfb7f1d5a03a65d04a', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 09:23:10', 'steve', '2019-02-22 09:23:10');
INSERT INTO `article_view` VALUES ('87aec7b37fbe4d00b835f7f275e43b9f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:24', 'steve', '2019-03-04 02:37:24');
INSERT INTO `article_view` VALUES ('87c56ea1e5f646a3a8aaf04746ccca6b', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 17:16:06', 'kerry', '2019-02-07 17:16:06');
INSERT INTO `article_view` VALUES ('87e25f12797b4c91847db1dd7ff62372', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:07', 'steve', '2019-02-22 09:17:07');
INSERT INTO `article_view` VALUES ('8819ede4c38f47049b0d6a1e99dfd743', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-09 16:42:53', 'kerry', '2019-03-09 16:42:53');
INSERT INTO `article_view` VALUES ('8841f5652bd04c4c96abe6d10ccc873d', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-22 15:54:46', 'kerry', '2019-01-22 15:54:46');
INSERT INTO `article_view` VALUES ('8847e6caab26468c8f4c7cd6e99b8000', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-02-07 12:04:01', 'kerry', '2019-02-07 12:04:01');
INSERT INTO `article_view` VALUES ('8853bffddaa74b3fafdc36b1e0d1f01f', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'root', '2019-01-30 15:00:32', 'root', '2019-01-30 15:00:32');
INSERT INTO `article_view` VALUES ('88a449dd02344e21a423f8593aa2185b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:09', 'steve', '2019-02-20 02:14:09');
INSERT INTO `article_view` VALUES ('88c1efca39a14dbab90623c927bb5821', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:16', 'steve', '2019-02-20 02:14:16');
INSERT INTO `article_view` VALUES ('88e3a5c19354427194b8be3f8a7d4995', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'devinShi', '2019-01-24 03:11:13', 'devinShi', '2019-01-24 03:11:13');
INSERT INTO `article_view` VALUES ('88e6006d0537452ea35a972450db6a38', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:51', 'steve', '2019-02-22 09:17:51');
INSERT INTO `article_view` VALUES ('8944d0f904e44a45ae9cbf2ff1541e26', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-15 15:19:00', 'kerry', '2019-01-15 15:19:00');
INSERT INTO `article_view` VALUES ('89950af10b0d49e4a57144ba3635fbfd', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:15', 'steve', '2019-02-20 02:14:15');
INSERT INTO `article_view` VALUES ('89a177430e5644cbb5ec32e8a29c4511', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'kerry', '2019-02-07 05:41:58', 'kerry', '2019-02-07 05:41:58');
INSERT INTO `article_view` VALUES ('89d2cc95a4aa40a7a64fe40ff3a80d05', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:50', 'steve', '2019-02-20 02:13:50');
INSERT INTO `article_view` VALUES ('89d9181a84da4f769e351f22394c840b', '95a1bbcce50e4a859d4ed036a5296bbf', '1', 'steve', '2019-01-18 02:24:29', 'steve', '2019-01-18 02:24:29');
INSERT INTO `article_view` VALUES ('8a35b45329ef4e16b594fcd83b43198d', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-08 01:23:46', 'kerry', '2019-01-08 01:23:46');
INSERT INTO `article_view` VALUES ('8a7505b030b3400089633a297cd5d928', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-03-02 02:05:53', 'kerry', '2019-03-02 02:05:53');
INSERT INTO `article_view` VALUES ('8a7cb54ce62541a3a9bd2196a4cedc4d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:27', 'steve', '2019-03-04 02:37:27');
INSERT INTO `article_view` VALUES ('8a8d821cb3e545738b499731d64e4e66', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-24 08:25:43', 'kerry', '2019-01-24 08:25:43');
INSERT INTO `article_view` VALUES ('8a95292345bf4ddd99ff64bc76362c27', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'kerry', '2019-01-22 01:08:49', 'kerry', '2019-01-22 01:08:49');
INSERT INTO `article_view` VALUES ('8af237fd2e0f4f00bbbb01bb4166294a', '8363527fca9a42209563bcb7ff51cc10', '1', 'kerry', '2019-01-09 00:57:19', 'kerry', '2019-01-09 00:57:19');
INSERT INTO `article_view` VALUES ('8b23c04b35a74637b0c9380c33b94f47', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:57', 'steve', '2019-02-20 02:13:57');
INSERT INTO `article_view` VALUES ('8b2527dc6a63416e9a8ec3ca9ca2590f', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-20 03:49:11', 'steve', '2019-02-20 03:49:11');
INSERT INTO `article_view` VALUES ('8b479b2f187b4e2cb4156123d6b1f8ee', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:36', 'steve', '2019-03-04 02:37:36');
INSERT INTO `article_view` VALUES ('8c7805dc9d634a999ff409261a3afe5c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-08 04:56:06', 'kerry', '2019-01-08 04:56:06');
INSERT INTO `article_view` VALUES ('8cc2001276d743a89277f4074f1859d0', '5bc6d99cc971448383028118fe6c8f8c', '1', 'zero', '2019-02-26 04:24:38', 'zero', '2019-02-26 04:24:38');
INSERT INTO `article_view` VALUES ('8d029b8954784b8e8ade7bc0dfa67caf', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:34', 'steve', '2019-02-20 02:13:34');
INSERT INTO `article_view` VALUES ('8d642fa87a754fdca360832138db53f9', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-24 05:56:29', 'kerry', '2019-01-24 05:56:29');
INSERT INTO `article_view` VALUES ('8d6876c4c0114e80b00be807f0cd99f0', '5cecda066fc446d68ecc10efc5e7729e', '1', 'kerry', '2019-01-17 15:59:00', 'kerry', '2019-01-17 15:59:00');
INSERT INTO `article_view` VALUES ('8d84ec1427b34925b004d35767b0148d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:20', 'steve', '2019-03-04 02:37:20');
INSERT INTO `article_view` VALUES ('8e7de3755ebd4753ba4305c493332234', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-22 15:42:44', 'kerry', '2019-01-22 15:42:44');
INSERT INTO `article_view` VALUES ('8e869d5796fc4bf69f09c2bba8f44ef4', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-09 08:24:08', 'kerry', '2019-01-09 08:24:08');
INSERT INTO `article_view` VALUES ('8f08594381c845268773d4c32b5d07e2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'Trevor-TW', '2019-02-20 08:43:55', 'Trevor-TW', '2019-02-20 08:43:55');
INSERT INTO `article_view` VALUES ('8f4d7844e68c41548cfdc43ffa16dbf5', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:22', 'steve', '2019-02-22 09:17:22');
INSERT INTO `article_view` VALUES ('8f5994711f764e87863749605b79c12e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'mm', '2019-02-20 03:04:16', 'mm', '2019-02-20 03:04:16');
INSERT INTO `article_view` VALUES ('8f5eb04d5ba14d4f8d29a13c56d14059', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('8f8fec87c1cd428989d3d53cb4944544', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:16', 'steve', '2019-02-20 02:13:16');
INSERT INTO `article_view` VALUES ('8fe39a81d07c4613a6ec58414828e878', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'zero', '2019-01-21 05:23:03', 'zero', '2019-01-21 05:23:03');
INSERT INTO `article_view` VALUES ('904763ba073a4ffd970cb5ac2511830e', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-21 13:50:24', 'kerry', '2019-01-21 13:50:24');
INSERT INTO `article_view` VALUES ('904c0d36f6034419acaab70874b68e28', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:30', 'steve', '2019-02-22 09:17:30');
INSERT INTO `article_view` VALUES ('90b0e7ae4fd64fccbaf505d9e2a9c5ef', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:47', 'steve', '2019-02-20 02:13:47');
INSERT INTO `article_view` VALUES ('90c98f5a80cd4858a40007c3d9fc8af7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:36', 'steve', '2019-02-20 02:13:36');
INSERT INTO `article_view` VALUES ('90edd82d81b44bd0abe0d1d16c76657a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('90fa91003ca54194bfc524d76a975e08', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-22 15:40:00', 'kerry', '2019-01-22 15:40:00');
INSERT INTO `article_view` VALUES ('9132be7a40c741c1b645421b83e9d725', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:33', 'steve', '2019-03-04 02:37:33');
INSERT INTO `article_view` VALUES ('9139690db78f4930b3f268ab9044583a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:32', 'steve', '2019-03-04 02:37:32');
INSERT INTO `article_view` VALUES ('913b29a16dfa458e90179360acf0f32c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('9160471733e2479e9221b3ebb2cfda5a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:18:58', 'steve', '2019-02-22 09:18:58');
INSERT INTO `article_view` VALUES ('91977ffc75a14da5922c0d92dab9e93a', 'd9a04c67ed974683ba008b8a0aa3f23c', '1', 'kerry', '2019-01-09 00:57:33', 'kerry', '2019-01-09 00:57:33');
INSERT INTO `article_view` VALUES ('91d5bcffb3864606a60ad3121fee6651', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 11:12:49', 'kerry', '2019-01-09 11:12:49');
INSERT INTO `article_view` VALUES ('91e691e2628d4afb9c16b53285a3cd17', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'kerry', '2019-02-07 03:38:12', 'kerry', '2019-02-07 03:38:12');
INSERT INTO `article_view` VALUES ('91e9938c34e845d3a5db8ec16159e945', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', '1', '2019-01-07 06:42:07', '1', '2019-01-07 06:42:07');
INSERT INTO `article_view` VALUES ('91fba4bd08d54280a01f93de9a7b0f9a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:09', 'steve', '2019-02-20 02:14:09');
INSERT INTO `article_view` VALUES ('9203b22f1f584756bd8d0393586c0706', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-08 05:35:02', 'kerry', '2019-01-08 05:35:02');
INSERT INTO `article_view` VALUES ('9224e019451244b38fa13f742d1ae0dc', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:35', 'steve', '2019-02-22 09:17:35');
INSERT INTO `article_view` VALUES ('9231cbbbd37e416ea096c489c865d0b7', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-06 16:21:35', '1', '2019-01-06 16:21:35');
INSERT INTO `article_view` VALUES ('923a4116edde463d9d5e348a832f417d', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-23 01:38:29', 'kerry', '2019-01-23 01:38:29');
INSERT INTO `article_view` VALUES ('92fe2a06a8ef491cb0911648589b3750', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:53', 'steve', '2019-02-22 09:17:53');
INSERT INTO `article_view` VALUES ('933b77d011bf41a8a86437affe1b442c', '55c692ac59d94fdbb06f217bb7275642', '1', 'steve', '2019-01-10 06:25:24', 'steve', '2019-01-10 06:25:24');
INSERT INTO `article_view` VALUES ('935c48f0a99f4181a84966063de1ca28', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:46', 'steve', '2019-02-20 02:13:46');
INSERT INTO `article_view` VALUES ('93897d58f95c47cdad74e8b3cff20a17', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:50', 'try', '2019-02-27 06:17:50');
INSERT INTO `article_view` VALUES ('9390f1002eea40f7ba5a9c1db63152d6', '6014d7abacfd4034bf3e2ded207468ba', '1', 'zero', '2019-01-21 05:21:33', 'zero', '2019-01-21 05:21:33');
INSERT INTO `article_view` VALUES ('9406ac2aaa9f472dbd76486561ebc00a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:36', 'steve', '2019-02-20 02:13:36');
INSERT INTO `article_view` VALUES ('9495ad49e02f4e6e9d1e8f4dd7067c1d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:38', 'steve', '2019-02-20 02:13:38');
INSERT INTO `article_view` VALUES ('949ca13fab924e19bb7b9e8af8a2b4b3', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-08 15:24:43', '1', '2019-01-08 15:24:43');
INSERT INTO `article_view` VALUES ('951edea7487943e79a6cd4b9e80f1b88', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:19', 'steve', '2019-03-04 02:37:19');
INSERT INTO `article_view` VALUES ('952249e725924d7fa39c1163a62e9142', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'mm', '2019-02-19 02:36:19', 'mm', '2019-02-19 02:36:19');
INSERT INTO `article_view` VALUES ('957d4eb607f5490db57cb982434bffd5', '06d4868bce464082926df6abcd814b44', '1', 'zero', '2019-02-12 08:42:25', 'zero', '2019-02-12 08:42:25');
INSERT INTO `article_view` VALUES ('957e0568902e4b0c9626f19bba9c29e3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:51', 'steve', '2019-02-20 02:13:51');
INSERT INTO `article_view` VALUES ('95a7d000ed70460589ebc2f6baa5fc94', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'root', '2019-01-09 14:53:13', 'root', '2019-01-09 14:53:13');
INSERT INTO `article_view` VALUES ('95c41ef667c1425bb521bc2f033fc36d', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:25', 'steve', '2019-02-20 02:13:25');
INSERT INTO `article_view` VALUES ('9609bbe90cce4f81adff36a470e47328', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-07 07:35:02', '1', '2019-01-07 07:35:02');
INSERT INTO `article_view` VALUES ('963f02aac8de45b49ef3d158bd73fa1a', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-23 01:55:52', 'steve', '2019-01-23 01:55:52');
INSERT INTO `article_view` VALUES ('965e79f38046469b8d5b50891f221e43', '919493ab3980403794e7c254a4f35ab4', '1', 'mm', '2019-01-24 06:26:25', 'mm', '2019-01-24 06:26:25');
INSERT INTO `article_view` VALUES ('968a66f16f7c4dabb6f4ca86e8b66515', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:41', 'steve', '2019-02-20 02:13:41');
INSERT INTO `article_view` VALUES ('9693c76330d149098c1523a44537ecc4', '5c568f755c7d4f65bdca30840f565a84', '1', 'admin', '2019-01-25 01:54:47', 'admin', '2019-01-25 01:54:47');
INSERT INTO `article_view` VALUES ('96a8f4ca29b74f969e64f1c088ad7ba2', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-17 10:38:46', 'kerry', '2019-01-17 10:38:46');
INSERT INTO `article_view` VALUES ('97313159fec94df999086991ca420050', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:12', 'steve', '2019-02-22 09:17:12');
INSERT INTO `article_view` VALUES ('9732d7f225fe4cdd8e1bdaf71ad3c58b', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-01-17 16:25:26', 'admin', '2019-01-17 16:25:26');
INSERT INTO `article_view` VALUES ('9735239f135544d2a7b078c011d0cb87', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-12 08:23:54', 'kerry', '2019-01-12 08:23:54');
INSERT INTO `article_view` VALUES ('97cee81476264e4184f9a8b0b7019fca', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:37', 'steve', '2019-03-04 02:37:37');
INSERT INTO `article_view` VALUES ('986a557411b74f7185e8a3853379454d', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', '1', '2019-01-08 14:35:18', '1', '2019-01-08 14:35:18');
INSERT INTO `article_view` VALUES ('98a827e4d93c45a0ab0633d20f7426a8', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-08 01:26:52', 'kerry', '2019-01-08 01:26:52');
INSERT INTO `article_view` VALUES ('98bdb1e127484deaac0a0473f89f8c16', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-01-23 03:20:33', 'steve', '2019-01-23 03:20:33');
INSERT INTO `article_view` VALUES ('98eb87fb548643bcbe38d99138831115', '06d4868bce464082926df6abcd814b44', '1', '1', '2019-01-07 06:52:41', '1', '2019-01-07 06:52:41');
INSERT INTO `article_view` VALUES ('9938011a54234413ab7949a940560323', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:14', 'steve', '2019-02-22 09:17:14');
INSERT INTO `article_view` VALUES ('996585bb69dd4f1a98ad896bf299e633', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'kerry', '2019-02-20 06:34:05', 'kerry', '2019-02-20 06:34:05');
INSERT INTO `article_view` VALUES ('999472e5afa641c4b159b8224f4debc0', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-22 05:34:14', 'kerry', '2019-01-22 05:34:14');
INSERT INTO `article_view` VALUES ('999b6d3b3f374dfb91f8870b46e3f082', '6014d7abacfd4034bf3e2ded207468ba', '1', 'kerry', '2019-01-22 10:37:23', 'kerry', '2019-01-22 10:37:23');
INSERT INTO `article_view` VALUES ('99f4adc2c0554fdabcb16a12026c4e27', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:32', 'steve', '2019-03-04 02:37:32');
INSERT INTO `article_view` VALUES ('9a89645926b948a48819f31bd39ad077', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-09 10:14:56', 'kerry', '2019-01-09 10:14:56');
INSERT INTO `article_view` VALUES ('9af079d75ed64992975d37694a00d535', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-08 05:02:16', 'kerry', '2019-01-08 05:02:16');
INSERT INTO `article_view` VALUES ('9af992d92f3f49b7becf83406d4612ee', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-09 15:19:27', 'kerry', '2019-01-09 15:19:27');
INSERT INTO `article_view` VALUES ('9b07ea8760134730ad3e5bf8cfae4cb3', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'kerry', '2019-01-17 09:31:42', 'kerry', '2019-01-17 09:31:42');
INSERT INTO `article_view` VALUES ('9b28e8db158b480cabe3a4cbc9af71d8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:34', 'steve', '2019-03-04 02:37:34');
INSERT INTO `article_view` VALUES ('9b6e1388794740439d1bfbc7d6cc61f0', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-24 02:44:34', 'kerry', '2019-01-24 02:44:34');
INSERT INTO `article_view` VALUES ('9bc3790d28cc421ca773d1a41748c65c', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'Kerry', '2019-01-07 16:25:18', 'Kerry', '2019-01-07 16:25:18');
INSERT INTO `article_view` VALUES ('9c22616e070240bda22dfe7685aea8bd', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'Trevor-TW', '2019-02-20 08:46:09', 'Trevor-TW', '2019-02-20 08:46:09');
INSERT INTO `article_view` VALUES ('9c474d7a3f9a47a993d48488b6c99b2e', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'Trevor-TW', '2019-02-20 08:43:46', 'Trevor-TW', '2019-02-20 08:43:46');
INSERT INTO `article_view` VALUES ('9c69be68aef74610a057d4e04f20203c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:26', 'steve', '2019-03-04 02:37:26');
INSERT INTO `article_view` VALUES ('9ce87835bbca4d148c807fe2e177f9dd', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:34', 'steve', '2019-02-22 09:17:34');
INSERT INTO `article_view` VALUES ('9cf78bbc094945149bed68e71f533ba4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:11', 'steve', '2019-02-20 02:14:11');
INSERT INTO `article_view` VALUES ('9d1794f5bda54388b90dc626579a3fb0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:15', 'steve', '2019-02-20 02:14:15');
INSERT INTO `article_view` VALUES ('9d289e6cc7774252a735136971f5492d', '4594d583f4a845968009c543d122bf60', '1', 'zero', '2019-01-10 01:34:01', 'zero', '2019-01-10 01:34:01');
INSERT INTO `article_view` VALUES ('9d321b2f89fe46568b17692acf98630b', '00bd8bb8b1e24e939915e6731326ab40', '1', 'zero', '2019-01-24 04:53:00', 'zero', '2019-01-24 04:53:00');
INSERT INTO `article_view` VALUES ('9d5849c516504560a183be7171abc924', 'dbb4ec6650bf46449eeb210ffed035bc', '1', 'kerry', '2019-01-25 05:40:09', 'kerry', '2019-01-25 05:40:09');
INSERT INTO `article_view` VALUES ('9d9932ebb707431c97b97242ecd31217', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-09 16:43:00', 'kerry', '2019-03-09 16:43:00');
INSERT INTO `article_view` VALUES ('9daa2c5d8e994f77ac2049534f15716b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:34', 'steve', '2019-02-20 02:13:34');
INSERT INTO `article_view` VALUES ('9de001dc61274f2cb28a9937d15180b3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:32', 'steve', '2019-03-04 02:37:32');
INSERT INTO `article_view` VALUES ('9e48a077456a4981a554595fb5dc3229', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-28 03:55:28', 'steve', '2019-02-28 03:55:28');
INSERT INTO `article_view` VALUES ('9e6729a4f8854f64adcce31101a6ca91', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:26', 'steve', '2019-03-04 02:37:26');
INSERT INTO `article_view` VALUES ('9e9532596ee242a19810cc949fa49f60', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'zero', '2019-01-24 04:53:49', 'zero', '2019-01-24 04:53:49');
INSERT INTO `article_view` VALUES ('9ea22aa8b04f4d9cabb43f4aebf08a79', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:28', 'steve', '2019-02-22 09:17:28');
INSERT INTO `article_view` VALUES ('9ea94f30f2464a45ad4e46e059ba40b3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:01', 'steve', '2019-02-20 02:14:01');
INSERT INTO `article_view` VALUES ('9f29d7f9ebf2417884536ba685f70e29', '06d4868bce464082926df6abcd814b44', '1', 'zero', '2019-02-19 07:48:49', 'zero', '2019-02-19 07:48:49');
INSERT INTO `article_view` VALUES ('9f858cd1470b4a379d52d7d3d87d8531', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:23', 'steve', '2019-02-20 02:13:23');
INSERT INTO `article_view` VALUES ('9fab8c2776054fbdafd310394c3634ef', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:37', 'steve', '2019-02-20 02:13:37');
INSERT INTO `article_view` VALUES ('9fee7068986f4e5284de723c91aa2f0c', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 19:50:23', 'kerry', '2019-02-07 19:50:23');
INSERT INTO `article_view` VALUES ('a05588e289284af08b9622404cc3ceb9', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 17:16:44', 'kerry', '2019-02-07 17:16:44');
INSERT INTO `article_view` VALUES ('a0ac2933e9b14a00a286f5adae4973ad', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'try', '2019-02-27 06:19:31', 'try', '2019-02-27 06:19:31');
INSERT INTO `article_view` VALUES ('a0b06123f757408089da5e47adfd796f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:38', 'steve', '2019-02-20 02:13:38');
INSERT INTO `article_view` VALUES ('a0cd4965151e4f80a338987a476ee6fe', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'Trevor-TW', '2019-02-20 08:43:57', 'Trevor-TW', '2019-02-20 08:43:57');
INSERT INTO `article_view` VALUES ('a0ce281c1aae48608a08eff0f3c75acc', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'Trevor-TW', '2019-02-20 08:43:56', 'Trevor-TW', '2019-02-20 08:43:56');
INSERT INTO `article_view` VALUES ('a15a2be8342e42fb96299fbf3f82b3d9', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:55', 'steve', '2019-02-20 02:13:55');
INSERT INTO `article_view` VALUES ('a1aee219cd75462f8f73591e1334677b', 'd013a6f0a7bd4eeda958574e724b20e7', '1', 'kerry', '2019-01-09 00:57:03', 'kerry', '2019-01-09 00:57:03');
INSERT INTO `article_view` VALUES ('a1af036f7da94e74963d94a31b1cde23', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'kerry', '2019-01-11 03:57:32', 'kerry', '2019-01-11 03:57:32');
INSERT INTO `article_view` VALUES ('a1f50a170086429ea030fc0c25869bd6', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'steve', '2019-01-23 03:25:51', 'steve', '2019-01-23 03:25:51');
INSERT INTO `article_view` VALUES ('a2057f02175f4cca862b87fc051e09a6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:35', 'steve', '2019-03-04 02:37:35');
INSERT INTO `article_view` VALUES ('a299085449ee4974aaaeb8183403afa8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:51', 'steve', '2019-02-20 02:13:51');
INSERT INTO `article_view` VALUES ('a30e6cf8ea7b406794585afd7009fc0d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:21', 'steve', '2019-02-22 09:17:21');
INSERT INTO `article_view` VALUES ('a33a24cd663d4ca4a3b2f8265410eef8', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-09 09:23:49', 'kerry', '2019-01-09 09:23:49');
INSERT INTO `article_view` VALUES ('a33c081b6f394cd8a9fb2df6ff361922', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-25 05:36:24', 'kerry', '2019-01-25 05:36:24');
INSERT INTO `article_view` VALUES ('a3409a4650c14f2aa6f8345426705bf5', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:50', 'steve', '2019-02-20 02:13:50');
INSERT INTO `article_view` VALUES ('a34cd250fa664f92ab5b8fb7ba7d3bcf', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'kerry', '2019-02-07 03:34:38', 'kerry', '2019-02-07 03:34:38');
INSERT INTO `article_view` VALUES ('a39a8752333945e8ba61b2c5207d3a5d', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-10 08:56:56', 'kerry', '2019-01-10 08:56:56');
INSERT INTO `article_view` VALUES ('a3ba8ed445d344d683865320e02c52e3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:52', 'steve', '2019-02-20 02:13:52');
INSERT INTO `article_view` VALUES ('a3bffc89306849f2bd93c29b039d9096', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:35', 'steve', '2019-02-20 02:13:35');
INSERT INTO `article_view` VALUES ('a3f17acda2884db89ea85c758827e282', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:22', 'steve', '2019-02-22 09:17:22');
INSERT INTO `article_view` VALUES ('a3fbac05588142dd84053f721a41268c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:22', 'steve', '2019-02-22 09:17:22');
INSERT INTO `article_view` VALUES ('a46b5cf77c4948c69bab976403f7737f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:19', 'steve', '2019-02-22 09:17:19');
INSERT INTO `article_view` VALUES ('a47d62957b3c48b889b096b58b437df8', '55c692ac59d94fdbb06f217bb7275642', '1', 'kerry', '2019-01-09 15:28:20', 'kerry', '2019-01-09 15:28:20');
INSERT INTO `article_view` VALUES ('a49f998d3397402485d80a8ee02a4677', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:14', 'steve', '2019-02-22 09:17:14');
INSERT INTO `article_view` VALUES ('a4b977102b9c45cd8e0d36b0ea0eccda', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:40', 'steve', '2019-02-20 02:13:40');
INSERT INTO `article_view` VALUES ('a4db5f140e33406abe57e357f2beb81f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:19', 'steve', '2019-03-04 02:37:19');
INSERT INTO `article_view` VALUES ('a50fa45708df4f57b82b587658b12b76', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:34', 'steve', '2019-02-22 09:17:34');
INSERT INTO `article_view` VALUES ('a52d4dad908348a4a4f7b08e41f61c6c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:11', 'steve', '2019-02-22 09:17:11');
INSERT INTO `article_view` VALUES ('a53356a703c64599bd299020def0e3d9', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-11 03:53:23', 'kerry', '2019-01-11 03:53:23');
INSERT INTO `article_view` VALUES ('a55c53eafd934ad39d57163a505a138c', 'c1200fd6a7184740a3131ee481101716', '1', 'leo', '2019-01-21 04:48:08', 'leo', '2019-01-21 04:48:08');
INSERT INTO `article_view` VALUES ('a618039614c74a028d61ca9cebc83540', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 07:40:17', 'kerry', '2019-02-07 07:40:17');
INSERT INTO `article_view` VALUES ('a63e789763884afa9c2bfff3515353f5', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-02-13 07:03:12', 'kerry', '2019-02-13 07:03:12');
INSERT INTO `article_view` VALUES ('a70acd49ae14499196296471b87c47e5', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-17 10:49:42', 'kerry', '2019-01-17 10:49:42');
INSERT INTO `article_view` VALUES ('a72b025f047b41018eefe27a833aa1db', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:34', 'steve', '2019-02-20 02:13:34');
INSERT INTO `article_view` VALUES ('a73ed7bf4d02430b89759c846515d286', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:33', 'steve', '2019-02-22 09:17:33');
INSERT INTO `article_view` VALUES ('a7c3c99d72a043d5ad08a0e1d4b11f65', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:05', 'steve', '2019-02-20 02:14:05');
INSERT INTO `article_view` VALUES ('a808b4e1bdad4d0cae314aee98be179a', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-07 00:42:09', '1', '2019-01-07 00:42:09');
INSERT INTO `article_view` VALUES ('a80ef4cc5c0b4113aa62347003819f70', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'mm', '2019-02-20 03:05:00', 'mm', '2019-02-20 03:05:00');
INSERT INTO `article_view` VALUES ('a83144d1d61344c483ab9a76f9490b86', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:34', 'steve', '2019-02-20 02:13:34');
INSERT INTO `article_view` VALUES ('a8d57088c897400099bae8ab9af78f59', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 08:48:20', 'steve', '2019-02-22 08:48:20');
INSERT INTO `article_view` VALUES ('a8fae2217c054e11b302ce5d9e11d81b', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-07 14:27:12', '1', '2019-01-07 14:27:12');
INSERT INTO `article_view` VALUES ('a94927be262948ef9e35586d58b553ab', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-07 16:09:48', 'kerry', '2019-01-07 16:09:48');
INSERT INTO `article_view` VALUES ('a9b00f575c1a42b9a6fbfcb5059ee1c8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:48', 'steve', '2019-02-20 02:13:48');
INSERT INTO `article_view` VALUES ('a9d9e88c80164b24a07295e125aac70a', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-01-23 02:26:11', 'mm', '2019-01-23 02:26:11');
INSERT INTO `article_view` VALUES ('aade1412ed0c4249aff188b2f43d2f1a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:24', 'steve', '2019-03-04 02:37:24');
INSERT INTO `article_view` VALUES ('aaf6c4d6c31f4c3791e4d3f68ac33604', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-17 10:16:52', 'kerry', '2019-01-17 10:16:52');
INSERT INTO `article_view` VALUES ('ab694127eb5d4924b148e4c08f89cc1d', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-15 15:19:22', 'kerry', '2019-01-15 15:19:22');
INSERT INTO `article_view` VALUES ('ab9e5201daaa492ababedf61f2f755ab', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:57', 'steve', '2019-02-20 02:13:57');
INSERT INTO `article_view` VALUES ('ac562d3353224170b6b82d57b6f19be8', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'mm', '2019-02-12 08:13:24', 'mm', '2019-02-12 08:13:24');
INSERT INTO `article_view` VALUES ('adbd1c03c05d4c0d82bce9c17448e94d', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-22 03:16:46', 'kerry', '2019-01-22 03:16:46');
INSERT INTO `article_view` VALUES ('adc7f3d938884e0bb95cff28db93acb6', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'mm', '2019-02-27 06:20:47', 'mm', '2019-02-27 06:20:47');
INSERT INTO `article_view` VALUES ('adcf96994a364eb8b5f7442afe170195', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:38', 'steve', '2019-02-20 02:13:38');
INSERT INTO `article_view` VALUES ('ae7b0a84a70b4f069af6978bcd2d8db0', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'kerry', '2019-01-18 00:49:50', 'kerry', '2019-01-18 00:49:51');
INSERT INTO `article_view` VALUES ('aec8b299f7c8400d8a95bfd5e7c4d6d1', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'wenbin.gao@definesys.com', '2019-01-09 13:06:48', 'wenbin.gao@definesys.com', '2019-01-09 13:06:48');
INSERT INTO `article_view` VALUES ('af19bbbbd77b427f8eb310efa00b952f', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 12:05:03', 'kerry', '2019-02-07 12:05:03');
INSERT INTO `article_view` VALUES ('af6494cabc204816b1e04e429dc883ce', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:11', 'steve', '2019-02-22 09:17:11');
INSERT INTO `article_view` VALUES ('afea953f059744b0930bded3342123c5', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'kerry', '2019-01-10 08:57:28', 'kerry', '2019-01-10 08:57:28');
INSERT INTO `article_view` VALUES ('b09f9dbb3df24fcca826c9400bedb31e', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-18 10:30:34', 'kerry', '2019-01-18 10:30:34');
INSERT INTO `article_view` VALUES ('b0ea75d410494ebe91b4bb9978f58f52', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'zero', '2019-01-29 02:45:49', 'zero', '2019-01-29 02:45:49');
INSERT INTO `article_view` VALUES ('b0f49956d2294b6589f1f6d289ec7789', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:50', 'steve', '2019-02-22 09:17:50');
INSERT INTO `article_view` VALUES ('b11d0cf895514e8c93657b773fd93575', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'leo', '2019-02-21 09:09:52', 'leo', '2019-02-21 09:09:52');
INSERT INTO `article_view` VALUES ('b1826136e51b42168d36484fd6ef091e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:51', 'steve', '2019-02-22 09:17:51');
INSERT INTO `article_view` VALUES ('b230b0a725294e238af9f8fb39b4310d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-01-24 00:18:22', 'steve', '2019-01-24 00:18:22');
INSERT INTO `article_view` VALUES ('b23118ac58764f9982c3b235cef0bc4b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('b25b94fe3bb44777a60fc71d1043c542', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-12 00:33:45', 'kerry', '2019-02-12 00:33:45');
INSERT INTO `article_view` VALUES ('b27c9241e59f4f8f83fa7e44e7c172b5', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:20', 'steve', '2019-02-22 09:17:20');
INSERT INTO `article_view` VALUES ('b27cf3c90dcd4370a6c20e4f04c87be1', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:22', 'steve', '2019-02-22 09:17:22');
INSERT INTO `article_view` VALUES ('b2ad961c92474826a8c9f1811eb8ae73', '79632780cd9a4cac86a427061b978a4a', '1', 'Trevor-TW', '2019-02-20 07:38:07', 'Trevor-TW', '2019-02-20 07:38:07');
INSERT INTO `article_view` VALUES ('b2dded5c6e184fd69f12dd37725971e1', 'c1200fd6a7184740a3131ee481101716', '1', 'kerry', '2019-01-23 13:34:22', 'kerry', '2019-01-23 13:34:22');
INSERT INTO `article_view` VALUES ('b2eef9d8107f439c9197877ae16eb459', '5bc6d99cc971448383028118fe6c8f8c', '1', 'zero', '2019-01-24 06:02:04', 'zero', '2019-01-24 06:02:04');
INSERT INTO `article_view` VALUES ('b2f4e672cfab4e409ed6412cdb9975a5', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:59', 'steve', '2019-02-20 02:13:59');
INSERT INTO `article_view` VALUES ('b38ab6e3d23e4e25b83abe8a7e60067e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:48', 'steve', '2019-02-20 02:13:48');
INSERT INTO `article_view` VALUES ('b3e4b7a783dc4c459a9f5386bf79a7da', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-22 01:09:51', 'kerry', '2019-01-22 01:09:51');
INSERT INTO `article_view` VALUES ('b3e8bf68a128494e92410f154262566e', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-08 14:40:03', '1', '2019-01-08 14:40:03');
INSERT INTO `article_view` VALUES ('b3ecca7f43114a259d7142663750f839', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 15:02:21', 'kerry', '2019-01-09 15:02:21');
INSERT INTO `article_view` VALUES ('b44a83a64f85471e8b24464892d8684f', '06d4868bce464082926df6abcd814b44', '1', 'steve', '2019-03-04 00:22:52', 'steve', '2019-03-04 00:22:52');
INSERT INTO `article_view` VALUES ('b45a7dcfdfea41b0b2420ad7180bb973', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:57', 'steve', '2019-02-20 02:13:57');
INSERT INTO `article_view` VALUES ('b45b89aba8af4558b46fd5b6703de577', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('b469005771a24b258c0097ab92a1dbfb', 'adeb462297424e59b2678cd4946cb09a', '1', 'kerry', '2019-01-18 01:48:48', 'kerry', '2019-01-18 01:48:48');
INSERT INTO `article_view` VALUES ('b482ae8aaa1e43008dc2b069dd72dfa4', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'kerry', '2019-02-07 03:35:05', 'kerry', '2019-02-07 03:35:05');
INSERT INTO `article_view` VALUES ('b4f2b01093ea4a99a3e5f466b7b31390', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-02-20 06:24:55', 'kerry', '2019-02-20 06:24:55');
INSERT INTO `article_view` VALUES ('b4f715830498460191dc0e0c9efe8d41', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'kerry', '2019-01-30 03:34:04', 'kerry', '2019-01-30 03:34:04');
INSERT INTO `article_view` VALUES ('b517adc923274a0585624b9a1f9fd98c', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-21 14:01:24', 'kerry', '2019-01-21 14:01:24');
INSERT INTO `article_view` VALUES ('b54eb68b9fff4f02a7d8b37be5e14c41', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-25 03:48:07', 'kerry', '2019-01-25 03:48:07');
INSERT INTO `article_view` VALUES ('b5974aa68a534480beb7968299a43526', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-02-27 06:20:44', 'admin', '2019-02-27 06:20:44');
INSERT INTO `article_view` VALUES ('b59dee75e6cd4c908375e8f1e15f131b', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:27', 'steve', '2019-02-20 02:13:27');
INSERT INTO `article_view` VALUES ('b5a49aca0b974f588de287f8bb430141', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:32', 'steve', '2019-03-04 02:37:32');
INSERT INTO `article_view` VALUES ('b5bde14cd3c24f41b4087bf19e3e404d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:13', 'steve', '2019-02-22 09:17:13');
INSERT INTO `article_view` VALUES ('b5f3def109da47539321fd48178edd23', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-03-05 05:28:01', 'admin', '2019-03-05 05:28:01');
INSERT INTO `article_view` VALUES ('b638f63d1cc843eb95cea450b5d83adb', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-30 10:16:34', 'kerry', '2019-01-30 10:16:34');
INSERT INTO `article_view` VALUES ('b69f834ca8ce4cebad229d41f3c7a176', 'd1ff69b7867f419dba6bbc0c082ff319', '1', 'kerry', '2019-01-27 07:36:37', 'kerry', '2019-01-27 07:36:37');
INSERT INTO `article_view` VALUES ('b6a607d797be482c92175e9356875ad8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:09', 'steve', '2019-02-20 02:14:09');
INSERT INTO `article_view` VALUES ('b6ad50905fb341f9b8a1911753bcab64', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-22 01:01:03', 'kerry', '2019-01-22 01:01:03');
INSERT INTO `article_view` VALUES ('b70d239f349b4db3b8fd36d0ba30ce98', '834470bab65445a0a34e714fe0f28f8d', '1', 'admin', '2019-02-27 06:21:30', 'admin', '2019-02-27 06:21:30');
INSERT INTO `article_view` VALUES ('b7b00195bf4f444cbdeb9700718b049f', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'kerry', '2019-02-20 04:51:37', 'kerry', '2019-02-20 04:51:37');
INSERT INTO `article_view` VALUES ('b7b41e2d2f694c86a9177de85f22b01e', '79632780cd9a4cac86a427061b978a4a', '1', 'zero', '2019-01-10 01:33:57', 'zero', '2019-01-10 01:33:57');
INSERT INTO `article_view` VALUES ('b7b41f9cb6fc449db107530702ed960d', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-20 03:51:01', 'steve', '2019-02-20 03:51:01');
INSERT INTO `article_view` VALUES ('b7cd84e429ab4e1a8c319f222c0bff4c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:49', 'steve', '2019-02-22 09:17:49');
INSERT INTO `article_view` VALUES ('b7d0f11e99e24daeb43a2659f5a42548', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:08', 'steve', '2019-02-20 02:14:08');
INSERT INTO `article_view` VALUES ('b7dbd41f2a9b456f9887b4551f26b530', '70b0ab6c15d345b395426cd30bbdfa26', '1', '1', '2019-01-07 06:29:15', '1', '2019-01-07 06:29:15');
INSERT INTO `article_view` VALUES ('b81e557fe6b64bc5813780be28cccaf2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('b841117e1b404065846a41c5028aa40a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:13', 'steve', '2019-02-22 09:17:13');
INSERT INTO `article_view` VALUES ('b8a0c09b12c847d4bd132c987837702b', '834470bab65445a0a34e714fe0f28f8d', '1', 'admin', '2019-01-25 00:54:29', 'admin', '2019-01-25 00:54:29');
INSERT INTO `article_view` VALUES ('b8de4f41276646f6a9946903fe605981', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:39', 'steve', '2019-02-20 02:13:39');
INSERT INTO `article_view` VALUES ('b8de6a29a80b42aab781596c352c6a31', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:46', 'steve', '2019-02-20 02:13:46');
INSERT INTO `article_view` VALUES ('b8f5a564901246d7ada2928660dae7a4', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-28 18:35:07', 'kerry', '2019-02-28 18:35:07');
INSERT INTO `article_view` VALUES ('b8fee4ddc3ef42408d5f1a32ca5fd120', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-01-24 06:28:18', 'mm', '2019-01-24 06:28:18');
INSERT INTO `article_view` VALUES ('b903026533ce4ed885b705eb24eaa89c', '55c692ac59d94fdbb06f217bb7275642', '1', 'root', '2019-01-09 15:58:39', 'root', '2019-01-09 15:58:39');
INSERT INTO `article_view` VALUES ('b969f0874b8246b18bf67010f0dd45c1', 'e0ff3fc8030d4991ab6d8a2e66475266', '1', 'kerry', '2019-01-08 15:31:54', 'kerry', '2019-01-08 15:31:54');
INSERT INTO `article_view` VALUES ('b9ed7d72e57a46d8adc769637f57988b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:11', 'steve', '2019-02-20 02:14:11');
INSERT INTO `article_view` VALUES ('ba2b4c9bba9a466b96f38422e5551d52', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-30 03:33:21', 'kerry', '2019-01-30 03:33:21');
INSERT INTO `article_view` VALUES ('ba320181f34848599c75f832a910e461', '55c692ac59d94fdbb06f217bb7275642', '1', 'kerry', '2019-01-17 09:32:02', 'kerry', '2019-01-17 09:32:02');
INSERT INTO `article_view` VALUES ('ba5f415872774ddb8a7eb1f8a38840d6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:25', 'steve', '2019-03-04 02:37:25');
INSERT INTO `article_view` VALUES ('baf3985e38ca43fdbbf5863adbc1a8b2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:33', 'steve', '2019-02-22 09:17:33');
INSERT INTO `article_view` VALUES ('bb35b43558094b5fb176d072139bac02', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-09 14:31:40', '1', '2019-01-09 14:31:40');
INSERT INTO `article_view` VALUES ('bb94b8573943451583a34dd4fc2641ff', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:56:40', 'steve', '2019-02-22 08:56:40');
INSERT INTO `article_view` VALUES ('bbeb667e14704dfb961fc09011c8b7bb', '55c692ac59d94fdbb06f217bb7275642', '1', 'kerry', '2019-01-09 15:34:29', 'kerry', '2019-01-09 15:34:29');
INSERT INTO `article_view` VALUES ('bbf179ad906e45868a8145e1c401dffb', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:34', 'steve', '2019-02-22 09:17:34');
INSERT INTO `article_view` VALUES ('bc3f6b1745c042e2aaced232ddd15cca', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:09', 'steve', '2019-02-20 02:14:09');
INSERT INTO `article_view` VALUES ('bc3fd50c91664d9f8db0014adc423353', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:47', 'steve', '2019-02-20 02:13:47');
INSERT INTO `article_view` VALUES ('bc41411518ae4cd58eb5b5b999a59569', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:11', 'steve', '2019-02-20 02:14:11');
INSERT INTO `article_view` VALUES ('bc86f61d3ce74232ae4cbe8e87dc1940', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'Trevor-TW', '2019-02-20 08:43:43', 'Trevor-TW', '2019-02-20 08:43:43');
INSERT INTO `article_view` VALUES ('bc9c309ea1d44c54b42d6b3394948ccd', '6014d7abacfd4034bf3e2ded207468ba', '1', 'zero', '2019-01-21 04:41:56', 'zero', '2019-01-21 04:41:56');
INSERT INTO `article_view` VALUES ('bce707928d7a46d59f8d298d7cef836d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:31', 'steve', '2019-03-04 02:37:31');
INSERT INTO `article_view` VALUES ('bd3201ae359746c2ac2e8cf5a5a155b6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:46', 'steve', '2019-02-20 02:13:46');
INSERT INTO `article_view` VALUES ('bd51f4badc9c48ddaa1fe0cb96c8080c', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'kerry', '2019-02-07 03:38:16', 'kerry', '2019-02-07 03:38:16');
INSERT INTO `article_view` VALUES ('bd6367a5c3774f54b882518a9c86b602', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-24 09:49:58', 'kerry', '2019-01-24 09:49:58');
INSERT INTO `article_view` VALUES ('bd70587be8f442ed8a67bb6e4908d78b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:48', 'steve', '2019-02-22 09:17:48');
INSERT INTO `article_view` VALUES ('bd917fdc02ce49f8ba04cab4ee77cb7a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:29', 'steve', '2019-02-22 09:17:29');
INSERT INTO `article_view` VALUES ('be5d13f981e14ba6b5d158b469946b9b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:19', 'steve', '2019-03-04 02:37:19');
INSERT INTO `article_view` VALUES ('be9402a193d24d0dbc425347acb9d54e', 'eff6fc6331a54968a5f2939fd370f06a', '1', 'kerry', '2019-01-17 16:17:53', 'kerry', '2019-01-17 16:17:53');
INSERT INTO `article_view` VALUES ('bea40c15bc604c1ba67da70937d2b361', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:13', 'steve', '2019-02-22 09:17:13');
INSERT INTO `article_view` VALUES ('beaf28b715e145e3a48f4226c58a2633', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:12', 'steve', '2019-02-20 02:14:12');
INSERT INTO `article_view` VALUES ('bed14aae818c4a75b04400a8cbd55a11', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-03-06 13:01:23', 'kerry', '2019-03-06 13:01:23');
INSERT INTO `article_view` VALUES ('bf1822b69de044c88632529ad5dd9f7e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:50', 'steve', '2019-02-22 09:17:50');
INSERT INTO `article_view` VALUES ('bf1850021f70497f9623b0253fb726d3', '834470bab65445a0a34e714fe0f28f8d', '1', 'mm', '2019-02-22 09:00:39', 'mm', '2019-02-22 09:00:39');
INSERT INTO `article_view` VALUES ('bf2ddb04c02d4eb1bb2c3b83dd27fc31', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-08 01:25:29', '1', '2019-01-08 01:25:29');
INSERT INTO `article_view` VALUES ('bf5d0a741d064a59b7edc3a1902f8d8e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:56', 'steve', '2019-02-20 02:13:56');
INSERT INTO `article_view` VALUES ('bf7d13a278ed46578bdb23a5a40008b8', '919493ab3980403794e7c254a4f35ab4', '1', 'kerry', '2019-01-24 08:26:40', 'kerry', '2019-01-24 08:26:40');
INSERT INTO `article_view` VALUES ('bf88bf423b3d42d1b8c657fd089db8bc', '55c692ac59d94fdbb06f217bb7275642', '1', '527510587@qq.com', '2019-01-21 05:26:54', '527510587@qq.com', '2019-01-21 05:26:54');
INSERT INTO `article_view` VALUES ('bfacac68897946f5b5bddc162977fa2c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('bfe3010f6a0d46759f02a7ea352f6993', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-22 15:35:10', 'kerry', '2019-01-22 15:35:10');
INSERT INTO `article_view` VALUES ('bfeb0f9b150b4839bd9106975372faca', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-21 13:29:26', 'kerry', '2019-01-21 13:29:26');
INSERT INTO `article_view` VALUES ('c08567f8933d490c8a30218924ea0bb0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:08', 'steve', '2019-02-20 02:14:08');
INSERT INTO `article_view` VALUES ('c11883fad78949b28ea38932be6d3de0', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-30 10:12:12', 'kerry', '2019-01-30 10:12:12');
INSERT INTO `article_view` VALUES ('c13af488135f4f769375e08e957b0765', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'Trevor-TW', '2019-02-20 08:43:41', 'Trevor-TW', '2019-02-20 08:43:41');
INSERT INTO `article_view` VALUES ('c141a5a7581c4e55b72bdfd24918fd5a', '455b97de71f44eeda0e359532724b5e8', '1', 'kerry', '2019-01-24 05:09:27', 'kerry', '2019-01-24 05:09:27');
INSERT INTO `article_view` VALUES ('c165f19bffd1457896b5c51e3163167b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:22', 'steve', '2019-03-04 02:37:22');
INSERT INTO `article_view` VALUES ('c185e89c557f47048e338612040e765d', 'a4cf8c7a5ae342aa9784687a5ef136d7', '1', 'kerry', '2019-03-02 03:44:34', 'kerry', '2019-03-02 03:44:34');
INSERT INTO `article_view` VALUES ('c227a9ba48434722a6719d82f7b89fcd', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:21', 'steve', '2019-02-20 02:13:21');
INSERT INTO `article_view` VALUES ('c239d201a9b84d64b3994eca8df26c3e', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'kerry', '2019-02-20 04:51:30', 'kerry', '2019-02-20 04:51:30');
INSERT INTO `article_view` VALUES ('c2605a9b054a4af489f04454f4073d65', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-02-27 06:18:04', 'admin', '2019-02-27 06:18:04');
INSERT INTO `article_view` VALUES ('c27df36c6900444e9690510ddcfda850', '5bc6d99cc971448383028118fe6c8f8c', '1', 'zero', '2019-01-24 04:38:00', 'zero', '2019-01-24 04:38:00');
INSERT INTO `article_view` VALUES ('c2911e07a0aa410c95ca7cba85c2a6be', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-02-22 08:52:10', 'kerry', '2019-02-22 08:52:10');
INSERT INTO `article_view` VALUES ('c2aa008947684cb8bb4bd548ff6c562c', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-09 09:08:42', 'kerry', '2019-01-09 09:08:42');
INSERT INTO `article_view` VALUES ('c2b09405e78a431ab8352a17985865e7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:19', 'steve', '2019-02-22 09:17:19');
INSERT INTO `article_view` VALUES ('c30113b4308b4be79fc70a25472dbbe8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:33', 'steve', '2019-03-04 02:37:33');
INSERT INTO `article_view` VALUES ('c38b9c6f1d6248ea9d580d0d8609025f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:45', 'steve', '2019-02-20 02:13:45');
INSERT INTO `article_view` VALUES ('c3a1b70aa2de4082a2b3172783fedd11', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:08', 'steve', '2019-02-20 02:14:08');
INSERT INTO `article_view` VALUES ('c3eb719a67d649ee824f3c99ad04a01b', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-16 02:44:55', 'kerry', '2019-01-16 02:44:55');
INSERT INTO `article_view` VALUES ('c4230656784943ea89916bad5bd9d425', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'e001', '2019-01-17 09:07:26', 'e001', '2019-01-17 09:07:26');
INSERT INTO `article_view` VALUES ('c46a7557d50e4790aea487b8ef064060', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:51:45', 'steve', '2019-02-22 08:51:45');
INSERT INTO `article_view` VALUES ('c4ca96c92f6b4a1993259e40082ad8c2', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-22 01:09:44', 'kerry', '2019-01-22 01:09:44');
INSERT INTO `article_view` VALUES ('c5273accbb6240cb9a2d178ffe0ffcf4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:37', 'steve', '2019-03-04 02:37:37');
INSERT INTO `article_view` VALUES ('c577e93265c4415fa202abe418e0173c', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'kerry', '2019-02-07 03:34:53', 'kerry', '2019-02-07 03:34:53');
INSERT INTO `article_view` VALUES ('c595bfc1978b45b7b468e14c7cc72e6e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:22', 'steve', '2019-03-04 02:37:22');
INSERT INTO `article_view` VALUES ('c5b89dc6c1254d5d88e52be114ce1bf2', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', '1', '2019-01-08 14:34:50', '1', '2019-01-08 14:34:50');
INSERT INTO `article_view` VALUES ('c67a0a328b834dd589c3cf08d189d349', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:22', 'steve', '2019-02-20 02:13:22');
INSERT INTO `article_view` VALUES ('c6e6f4cb45e94d8689ce4a49d205edf1', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-02-20 03:04:43', 'kerry', '2019-02-20 03:04:43');
INSERT INTO `article_view` VALUES ('c745761b681f4395b256e1afab04e01c', '834470bab65445a0a34e714fe0f28f8d', '1', 'admin', '2019-01-25 00:52:02', 'admin', '2019-01-25 00:52:02');
INSERT INTO `article_view` VALUES ('c78e3f7b51fb42b8aa01ad64947c1431', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-01-24 09:49:29', 'mm', '2019-01-24 09:49:29');
INSERT INTO `article_view` VALUES ('c7b37205a29843ac9b5fa35b82e984c2', 'c1200fd6a7184740a3131ee481101716', '1', 'kerry', '2019-01-22 00:49:12', 'kerry', '2019-01-22 00:49:12');
INSERT INTO `article_view` VALUES ('c88fead2b1754dfc9774930f96a98741', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:56:55', 'steve', '2019-02-22 08:56:55');
INSERT INTO `article_view` VALUES ('c8cfb3291ef64c5bad046721c54c1767', '834470bab65445a0a34e714fe0f28f8d', '1', 'kerry', '2019-01-25 00:48:55', 'kerry', '2019-01-25 00:48:55');
INSERT INTO `article_view` VALUES ('c8e176149a234917bd78632e69616f28', '55c692ac59d94fdbb06f217bb7275642', '1', 'zero', '2019-01-10 01:33:55', 'zero', '2019-01-10 01:33:55');
INSERT INTO `article_view` VALUES ('c9680734a414454bb553bcb696524dae', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-02-07 16:23:47', 'kerry', '2019-02-07 16:23:47');
INSERT INTO `article_view` VALUES ('c994ba2cd04e4b84b659679d0fab20c9', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:35', 'steve', '2019-02-22 09:17:35');
INSERT INTO `article_view` VALUES ('c99f6b7ac00c4d82ade6413b85ba59b3', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-08 05:09:30', 'kerry', '2019-01-08 05:09:30');
INSERT INTO `article_view` VALUES ('c9a7da770f0745c1b7f6a484aba1c7e7', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-02-02 08:46:41', 'kerry', '2019-02-02 08:46:41');
INSERT INTO `article_view` VALUES ('ca58a43710494b5aa1a4c46510bca8f1', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-09 15:39:37', 'kerry', '2019-01-09 15:39:37');
INSERT INTO `article_view` VALUES ('caa599d3803b40949c33ebdb3bfdad85', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:42', 'steve', '2019-02-20 02:13:42');
INSERT INTO `article_view` VALUES ('cae1a0a85c7b4446a0a7ce32ca4adfa9', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-09 14:33:12', 'kerry', '2019-01-09 14:33:12');
INSERT INTO `article_view` VALUES ('cb2d32d06ed4458897ebc16ac0d34909', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:02', 'steve', '2019-02-20 02:14:02');
INSERT INTO `article_view` VALUES ('cb416de4ad524eb28059f21482430e8d', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-03-04 00:58:00', 'kerry', '2019-03-04 00:58:00');
INSERT INTO `article_view` VALUES ('cb7e4e703c4c4a918b4de21c8d3236eb', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'kerry', '2019-01-22 01:11:03', 'kerry', '2019-01-22 01:11:03');
INSERT INTO `article_view` VALUES ('cb9e55a35d9249eea34360ed245e2f3b', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'kerry', '2019-02-07 12:03:50', 'kerry', '2019-02-07 12:03:50');
INSERT INTO `article_view` VALUES ('cba28ad9e37a4d33b08b0b2feb30ec3d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-06 00:36:22', 'kerry', '2019-03-06 00:36:22');
INSERT INTO `article_view` VALUES ('cc4a010f59c64818b31916263e172883', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:32', 'steve', '2019-02-20 02:13:32');
INSERT INTO `article_view` VALUES ('cc7195c68e0a4411acc490a7e7ffd6a6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:34', 'steve', '2019-02-20 02:13:34');
INSERT INTO `article_view` VALUES ('cc99ac33e9f5428caef9fd627a577115', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:04', 'steve', '2019-02-20 02:14:04');
INSERT INTO `article_view` VALUES ('ccbcca61c6c34ded8006e6cd70fbbc50', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:47', 'steve', '2019-02-20 02:13:47');
INSERT INTO `article_view` VALUES ('ccd95b1100ed423cb12013fab440c509', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:25', 'steve', '2019-02-20 02:13:25');
INSERT INTO `article_view` VALUES ('ccf04ae43cc04315bf1b0d000345631c', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'leo', '2019-02-02 05:15:27', 'leo', '2019-02-02 05:15:27');
INSERT INTO `article_view` VALUES ('cd53160a18a14dd6b921ff883d1e7c68', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-21 13:54:40', 'kerry', '2019-01-21 13:54:40');
INSERT INTO `article_view` VALUES ('cd74f30b7979455aa89fa8df3ba594a7', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'Trevor-TW', '2019-02-20 08:43:45', 'Trevor-TW', '2019-02-20 08:43:45');
INSERT INTO `article_view` VALUES ('cd916e752f174a61b5e27bc3f4f532ea', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-09 16:46:53', 'kerry', '2019-03-09 16:46:53');
INSERT INTO `article_view` VALUES ('cdbf7ce168b74b75934a70e6fa260af4', '919493ab3980403794e7c254a4f35ab4', '1', 'kerry', '2019-01-23 05:05:02', 'kerry', '2019-01-23 05:05:02');
INSERT INTO `article_view` VALUES ('cdcab36a485641e5b80f9010e2286ffb', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-17 10:27:13', 'kerry', '2019-01-17 10:27:13');
INSERT INTO `article_view` VALUES ('cddca29215754fb0948c247f3388350e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:43', 'steve', '2019-02-20 02:13:43');
INSERT INTO `article_view` VALUES ('ce068eef65c5487eba722b589cf04186', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'zero', '2019-01-10 01:33:51', 'zero', '2019-01-10 01:33:51');
INSERT INTO `article_view` VALUES ('ce28bcbc279b4e019fa327831b93d93c', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'steve', '2019-01-18 01:02:30', 'steve', '2019-01-18 01:02:30');
INSERT INTO `article_view` VALUES ('ce4bbd6c5594458a84946b54ea430008', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-25 03:48:56', 'kerry', '2019-01-25 03:48:56');
INSERT INTO `article_view` VALUES ('ce6ac63e30e1414caa99416563ab4db3', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-03-02 03:45:09', 'kerry', '2019-03-02 03:45:09');
INSERT INTO `article_view` VALUES ('cea3881c595c44908f8e882da91487e2', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-08 05:00:23', 'kerry', '2019-01-08 05:00:23');
INSERT INTO `article_view` VALUES ('ceade4bf944c4d33acdc60d11d135194', 'dbb4ec6650bf46449eeb210ffed035bc', '1', 'kerry', '2019-02-20 06:28:51', 'kerry', '2019-02-20 06:28:51');
INSERT INTO `article_view` VALUES ('ceb09e8c65404fce935ec799b8c81a48', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'leo', '2019-01-21 04:46:30', 'leo', '2019-01-21 04:46:30');
INSERT INTO `article_view` VALUES ('ceb53945ed22410391b03a98ef7a2644', '00bd8bb8b1e24e939915e6731326ab40', '1', 'zero', '2019-01-24 04:53:26', 'zero', '2019-01-24 04:53:26');
INSERT INTO `article_view` VALUES ('cec2afa1ca5d468cb96ccd16ce7e0cd7', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:18:09', 'try', '2019-02-27 06:18:09');
INSERT INTO `article_view` VALUES ('cecab1f949604139abbd5396a33731e0', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', '1', '2019-01-08 14:26:48', '1', '2019-01-08 14:26:48');
INSERT INTO `article_view` VALUES ('cfc4664feac849fb8c6f966ab6cfad33', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:44', 'steve', '2019-02-20 02:13:44');
INSERT INTO `article_view` VALUES ('d010261f4d024b32b0ee5dcb07b41bd7', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 19:22:22', 'kerry', '2019-02-07 19:22:22');
INSERT INTO `article_view` VALUES ('d015ad030c0846099b557424f1092ad7', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'kerry', '2019-01-18 10:32:43', 'kerry', '2019-01-18 10:32:43');
INSERT INTO `article_view` VALUES ('d026f186cec74e129a73f5d3121cadf5', '4594d583f4a845968009c543d122bf60', '1', 'zero', '2019-01-21 04:45:49', 'zero', '2019-01-21 04:45:49');
INSERT INTO `article_view` VALUES ('d02c2f519b9d44e59c5f046c93336a77', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-17 10:48:51', 'kerry', '2019-01-17 10:48:51');
INSERT INTO `article_view` VALUES ('d0332b1ab5c24573b46728ec59a7464d', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:52', 'try', '2019-02-27 06:17:52');
INSERT INTO `article_view` VALUES ('d056f0215c304209bf0317101f76712f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:33', 'steve', '2019-02-20 02:13:33');
INSERT INTO `article_view` VALUES ('d05a9c04cb9947749d365778c2f30507', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:01', 'steve', '2019-02-20 02:14:01');
INSERT INTO `article_view` VALUES ('d09f433bec574ff6aed91f707607df3a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:51', 'steve', '2019-02-20 02:13:51');
INSERT INTO `article_view` VALUES ('d0a3355a7c3b435a9f9630e9632929f5', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:20', 'steve', '2019-02-22 09:17:20');
INSERT INTO `article_view` VALUES ('d0f50fdf3b8440f787fd9c3dbda682b2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:44', 'steve', '2019-02-20 02:13:44');
INSERT INTO `article_view` VALUES ('d11279280c694a1589882b5d1ff29158', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('d144515d15f443a0a6beb2d605969dc5', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:27', 'steve', '2019-02-22 09:17:27');
INSERT INTO `article_view` VALUES ('d16c9e59946d4b75806167241820bcc3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-02-22 08:51:01', 'kerry', '2019-02-22 08:51:01');
INSERT INTO `article_view` VALUES ('d18d9605427243db96c4f9e2ca357d5c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'devinShi', '2019-01-10 05:24:50', 'devinShi', '2019-01-10 05:24:50');
INSERT INTO `article_view` VALUES ('d1cc7f6d9d714fbe96befacce1142582', '9dba6c2c8d4e4feeaddca35f1c770085', '1', 'steve', '2019-01-24 08:29:17', 'steve', '2019-01-24 08:29:17');
INSERT INTO `article_view` VALUES ('d1f6ac9fc87a4430880cfbe81f0a09b9', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-21 13:08:04', 'kerry', '2019-01-21 13:08:04');
INSERT INTO `article_view` VALUES ('d1fe83f43a1044309857b4a537117bb8', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:16', 'steve', '2019-02-22 09:17:16');
INSERT INTO `article_view` VALUES ('d25e6d25587e4fecafd7f2ed17e27636', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:50', 'steve', '2019-02-22 09:17:50');
INSERT INTO `article_view` VALUES ('d2a80264c70043ed8b2f7a651b17873f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:34', 'steve', '2019-03-04 02:37:34');
INSERT INTO `article_view` VALUES ('d2e861f522384b45a77e00c80b34588c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:56:55', 'steve', '2019-02-22 08:56:55');
INSERT INTO `article_view` VALUES ('d3121b6cb75e4be3a97a97bea85f653b', '5ca4395fcc0241e796fa56b93ceb584d', '1', 'kerry', '2019-01-18 01:49:28', 'kerry', '2019-01-18 01:49:28');
INSERT INTO `article_view` VALUES ('d337ae52b10f4afd9260c15d280d8849', '5c568f755c7d4f65bdca30840f565a84', '1', 'kerry', '2019-02-25 01:15:36', 'kerry', '2019-02-25 01:15:36');
INSERT INTO `article_view` VALUES ('d340035820274dab964fec52d32c7ee0', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-04 01:31:50', 'kerry', '2019-03-04 01:31:50');
INSERT INTO `article_view` VALUES ('d3990db3a436490cb408938296365d74', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-22 15:45:01', 'kerry', '2019-01-22 15:45:01');
INSERT INTO `article_view` VALUES ('d3a09a99a7e04a729b48a05b14a56a58', '5bc6d99cc971448383028118fe6c8f8c', '1', 'zero', '2019-01-24 06:01:59', 'zero', '2019-01-24 06:01:59');
INSERT INTO `article_view` VALUES ('d3b01504996c4a28a6088a53817a22df', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:30', 'steve', '2019-02-22 09:17:30');
INSERT INTO `article_view` VALUES ('d3fdd988e270419ba4ee1f6ff89d42de', '4594d583f4a845968009c543d122bf60', '1', 'kerry', '2019-01-16 09:54:43', 'kerry', '2019-01-16 09:54:43');
INSERT INTO `article_view` VALUES ('d4968250a9064ab4aa8478c72d24aaee', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:05', 'steve', '2019-02-20 02:14:05');
INSERT INTO `article_view` VALUES ('d4ac79c7e03242479fe6d1f39d1eed1a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:10', 'steve', '2019-02-20 02:14:10');
INSERT INTO `article_view` VALUES ('d4b6372a57f74071a2849d34ead267a3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:10', 'steve', '2019-02-20 02:14:10');
INSERT INTO `article_view` VALUES ('d4e349f1a7874262826c36a76fe71355', '455b97de71f44eeda0e359532724b5e8', '1', 'zero', '2019-01-24 06:04:36', 'zero', '2019-01-24 06:04:36');
INSERT INTO `article_view` VALUES ('d4ffe54759354a1aa64e67ac837c1b97', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:23', 'steve', '2019-02-22 09:17:23');
INSERT INTO `article_view` VALUES ('d532a0ceef654964a12ab425a6e370d8', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-09 15:06:19', 'kerry', '2019-01-09 15:06:19');
INSERT INTO `article_view` VALUES ('d55e0390dee649b68b353632de1becb6', '53e68c687a114f71b96bccb9854473ac', '1', 'kerry', '2019-01-22 15:40:23', 'kerry', '2019-01-22 15:40:23');
INSERT INTO `article_view` VALUES ('d580c51845e145c680b54856c61c35f1', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:49', 'try', '2019-02-27 06:17:49');
INSERT INTO `article_view` VALUES ('d5dd25cdb72e462a845e3ce534d1a113', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:58', 'steve', '2019-02-20 02:13:58');
INSERT INTO `article_view` VALUES ('d5f180babeed400983e3b3c8ea68af2e', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'steve', '2019-01-20 03:50:22', 'steve', '2019-01-20 03:50:22');
INSERT INTO `article_view` VALUES ('d617f9a1e7b34bdeab082aebd7601440', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'kerry', '2019-01-09 15:40:12', 'kerry', '2019-01-09 15:40:12');
INSERT INTO `article_view` VALUES ('d65295e6d12e42e9aef58f70b8963502', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-22 03:17:48', 'kerry', '2019-01-22 03:17:48');
INSERT INTO `article_view` VALUES ('d6ce2360f5ff4de1ae6d1b1e7bde5473', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:20', 'steve', '2019-02-22 09:17:20');
INSERT INTO `article_view` VALUES ('d6da71091d2847b98e982fdb5f215b39', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:26', 'steve', '2019-02-20 02:13:26');
INSERT INTO `article_view` VALUES ('d6f41a6b9d4743ab9b18e55ea1417abf', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-25 05:39:17', 'kerry', '2019-01-25 05:39:17');
INSERT INTO `article_view` VALUES ('d734651580484996a9381fdfa30b389b', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'mm', '2019-01-21 05:03:51', 'mm', '2019-01-21 05:03:51');
INSERT INTO `article_view` VALUES ('d738ffb17e4445a9a6c0f56b2e78134e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:38', 'steve', '2019-02-20 02:13:38');
INSERT INTO `article_view` VALUES ('d7768bef9c1e4fe98f3268ea004f0440', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-24 05:56:19', 'kerry', '2019-01-24 05:56:19');
INSERT INTO `article_view` VALUES ('d78e65dc3f01492ab2178cd24c839a00', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:15', 'steve', '2019-02-22 09:17:15');
INSERT INTO `article_view` VALUES ('d79ed25645da4d398bff801afcf942b8', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-09 11:13:33', 'kerry', '2019-01-09 11:13:33');
INSERT INTO `article_view` VALUES ('d80e372b5bcf42918d726ed48da5f7ca', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-21 13:49:29', 'kerry', '2019-01-21 13:49:29');
INSERT INTO `article_view` VALUES ('d89af201132e40fc90563ae8c4c65b23', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('d8a86a8d2d5d40a6936ab505c0a07678', '55c692ac59d94fdbb06f217bb7275642', '1', 'root', '2019-01-09 15:26:52', 'root', '2019-01-09 15:26:52');
INSERT INTO `article_view` VALUES ('d8bc6890556a4ee690bef3273848b281', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:15', 'steve', '2019-02-20 02:14:15');
INSERT INTO `article_view` VALUES ('d8bcec6981ef402db1914312537fb80f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:12', 'steve', '2019-02-20 02:14:12');
INSERT INTO `article_view` VALUES ('d8d304329d644e03b45069e816d4174d', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'leo', '2019-01-17 16:17:59', 'leo', '2019-01-17 16:17:59');
INSERT INTO `article_view` VALUES ('d8d807fb4b7349ba916a97211d939b5a', '5ca4395fcc0241e796fa56b93ceb584d', '1', 'steve', '2019-01-18 01:11:02', 'steve', '2019-01-18 01:11:02');
INSERT INTO `article_view` VALUES ('d91633d068bf45d099a6c93a8ee00aa6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:20', 'steve', '2019-02-22 09:17:20');
INSERT INTO `article_view` VALUES ('d95d8eda81324fcd88f475a994b741de', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'admin', '2019-02-20 07:52:39', 'admin', '2019-02-20 07:52:39');
INSERT INTO `article_view` VALUES ('d96bc44f154f4683a522146e9b71ab1b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:20', 'steve', '2019-02-22 09:17:20');
INSERT INTO `article_view` VALUES ('d982f38fc40440d09100d905912bc730', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:19:02', 'steve', '2019-02-22 09:19:02');
INSERT INTO `article_view` VALUES ('d9bf6fa0a75f40b880d6fd71d6accc52', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-23 13:03:21', 'kerry', '2019-01-23 13:03:21');
INSERT INTO `article_view` VALUES ('da1cc54e9cab48469d39d178c8b2e5e7', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'steve', '2019-01-09 13:05:35', 'steve', '2019-01-09 13:05:35');
INSERT INTO `article_view` VALUES ('da46e1fadf844d5e83cb3042cdd5d13d', '5bc6d99cc971448383028118fe6c8f8c', '1', 'zero', '2019-01-24 06:01:48', 'zero', '2019-01-24 06:01:48');
INSERT INTO `article_view` VALUES ('da915f896f4540348fb74ba21e827fef', '455b97de71f44eeda0e359532724b5e8', '1', 'zero', '2019-01-24 04:53:07', 'zero', '2019-01-24 04:53:07');
INSERT INTO `article_view` VALUES ('dacc1b01423c4078ab445cb445ff7faa', 'a67d7a9127d34978b3696ceb3e68b5d5', '1', 'steve', '2019-01-10 06:24:58', 'steve', '2019-01-10 06:24:58');
INSERT INTO `article_view` VALUES ('dadb4b59003149eab3770323098a8d81', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-28 05:08:26', 'kerry', '2019-01-28 05:08:26');
INSERT INTO `article_view` VALUES ('dae4d33633304f33848aad8e5346d575', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:26', 'steve', '2019-02-22 09:17:26');
INSERT INTO `article_view` VALUES ('db65fa620e0b4ff1ad1ff9207eec1418', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-01-09 12:56:28', 'steve', '2019-01-09 12:56:28');
INSERT INTO `article_view` VALUES ('db691295e3a1450ca5c3ffd1903c7531', 'c1200fd6a7184740a3131ee481101716', '1', 'zero', '2019-01-21 05:21:13', 'zero', '2019-01-21 05:21:13');
INSERT INTO `article_view` VALUES ('dc4b77b7bcdd436f8be690425cd7e1be', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-04 00:57:53', 'kerry', '2019-03-04 00:57:53');
INSERT INTO `article_view` VALUES ('dc58447f89844514aa0c013c19d4c5ff', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:16', 'steve', '2019-02-22 09:17:16');
INSERT INTO `article_view` VALUES ('dd2b8af262f1458284442ea0343ce1ac', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:13', 'steve', '2019-02-22 09:17:13');
INSERT INTO `article_view` VALUES ('dd803087f85d4611b7eae593c03feb16', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 09:32:26', 'kerry', '2019-01-09 09:32:26');
INSERT INTO `article_view` VALUES ('dda6b4fd5e734b51825bfaf792021388', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:37', 'steve', '2019-02-20 02:13:37');
INSERT INTO `article_view` VALUES ('de0e26f8e14d447c8274977faba97994', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-22 10:19:17', 'kerry', '2019-01-22 10:19:17');
INSERT INTO `article_view` VALUES ('de1b17faf6af48f2bb0edafac3b7d6c9', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:04', 'steve', '2019-02-20 02:14:04');
INSERT INTO `article_view` VALUES ('de46a860c3504098b896beca4e959bc6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:38', 'steve', '2019-02-20 02:13:38');
INSERT INTO `article_view` VALUES ('de5b185e194047f19dea6876a3962f04', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:29', 'steve', '2019-03-04 02:37:29');
INSERT INTO `article_view` VALUES ('dedf26b3b96d4265a9a7e2787967c1d6', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-23 16:18:54', 'kerry', '2019-01-23 16:18:54');
INSERT INTO `article_view` VALUES ('dee4fdd4ad004848b2e54290e1bfbcee', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-25 05:38:32', 'kerry', '2019-01-25 05:38:32');
INSERT INTO `article_view` VALUES ('df253b9fffa54e6783524001fc545ee5', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-22 03:02:22', 'kerry', '2019-01-22 03:02:22');
INSERT INTO `article_view` VALUES ('df42d515a69c4d4680c3b2ededb6a4b2', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'kerry', '2019-01-08 01:24:25', 'kerry', '2019-01-08 01:24:25');
INSERT INTO `article_view` VALUES ('dfc2374080644e0483ded021c33fc7d1', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:56', 'steve', '2019-02-20 02:13:56');
INSERT INTO `article_view` VALUES ('dff0f3bf643f468c973c590b9c290e2d', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-07 15:47:43', 'kerry', '2019-01-07 15:47:43');
INSERT INTO `article_view` VALUES ('dff4c212bea64fd2af375f07332fc285', 'dbb4ec6650bf46449eeb210ffed035bc', '1', 'admin', '2019-01-25 01:54:52', 'admin', '2019-01-25 01:54:52');
INSERT INTO `article_view` VALUES ('e037f2ccf7314fb18183cb256fdd304f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:26', 'steve', '2019-03-04 02:37:26');
INSERT INTO `article_view` VALUES ('e0483f04ed0a4f7da2933961859bdbba', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:10', 'steve', '2019-02-20 02:14:10');
INSERT INTO `article_view` VALUES ('e08c740a5f724218889006a5f427f59a', '6014d7abacfd4034bf3e2ded207468ba', '1', 'kerry', '2019-01-23 13:34:46', 'kerry', '2019-01-23 13:34:46');
INSERT INTO `article_view` VALUES ('e1411559601a4533ab442264241f3d6f', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:13', 'steve', '2019-02-22 09:17:13');
INSERT INTO `article_view` VALUES ('e1857a1049044dde9ac1fcb7defe686b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:36', 'steve', '2019-02-22 09:17:36');
INSERT INTO `article_view` VALUES ('e18db3e097a44d6f9ff62d0c3f41d58e', '455b97de71f44eeda0e359532724b5e8', '1', 'Trevor-TW', '2019-02-20 08:41:59', 'Trevor-TW', '2019-02-20 08:41:59');
INSERT INTO `article_view` VALUES ('e1c49d39594446fb82fe9797b671349c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:59', 'steve', '2019-02-20 02:13:59');
INSERT INTO `article_view` VALUES ('e1daa62abeaf4f7e82b30bedd4a11652', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:07', 'steve', '2019-02-20 02:14:07');
INSERT INTO `article_view` VALUES ('e20fe306e8e642dba68d6bd03edafde4', 'adeb462297424e59b2678cd4946cb09a', '1', 'steve', '2019-01-18 01:32:12', 'steve', '2019-01-18 01:32:12');
INSERT INTO `article_view` VALUES ('e24bb2240f67478b9fb24f76bc402d20', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-03-01 10:46:31', 'kerry', '2019-03-01 10:46:31');
INSERT INTO `article_view` VALUES ('e2cc365c20144db4a374faf51621ad76', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'kerry', '2019-03-02 03:44:54', 'kerry', '2019-03-02 03:44:54');
INSERT INTO `article_view` VALUES ('e2e501ab7c934f92a2a6a63dede52ca6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:28', 'steve', '2019-03-04 02:37:28');
INSERT INTO `article_view` VALUES ('e310985d6f6246f6984a930a7949db32', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:22', 'steve', '2019-02-22 09:17:22');
INSERT INTO `article_view` VALUES ('e34545d8b78d4f35b915380393bac613', '06d4868bce464082926df6abcd814b44', '1', 'zero', '2019-02-14 08:45:31', 'zero', '2019-02-14 08:45:31');
INSERT INTO `article_view` VALUES ('e36a1f9584214f9eac3b3572f7fbb080', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:16', 'steve', '2019-02-20 02:14:16');
INSERT INTO `article_view` VALUES ('e3779ab4304644c6b5a8546d0f7dc8ca', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:33', 'steve', '2019-02-20 02:13:33');
INSERT INTO `article_view` VALUES ('e390943544bd49e0814ebe3710c4ef6e', '65766085d8ae4638a613dad17a73dbec', '1', 'kerry', '2019-02-26 23:33:41', 'kerry', '2019-02-26 23:33:41');
INSERT INTO `article_view` VALUES ('e39ec39321714e9391be4c09c809668e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:04', 'steve', '2019-02-20 02:14:04');
INSERT INTO `article_view` VALUES ('e3d6582a77484999a90bb6888fe3e8e7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:35', 'steve', '2019-02-20 02:13:35');
INSERT INTO `article_view` VALUES ('e4bc9fab0a3d46f88365fe1039148e43', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:49:42', 'wenc', '2019-01-21 05:49:42');
INSERT INTO `article_view` VALUES ('e4e8559c7c394626a0af3bd73529def7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:18', 'steve', '2019-02-22 09:17:18');
INSERT INTO `article_view` VALUES ('e537ef55512a4e33b8ef853c8f7151f7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:16', 'steve', '2019-02-20 02:14:16');
INSERT INTO `article_view` VALUES ('e53e183656ad44ce90fd3b0aaaafae4c', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:48:40', 'wenc', '2019-01-21 05:48:40');
INSERT INTO `article_view` VALUES ('e595b138625d4e1eb385702c4c8dc641', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:11', 'steve', '2019-02-20 02:14:11');
INSERT INTO `article_view` VALUES ('e5e48c832c09426995bdfff41c30c464', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:00', 'steve', '2019-02-20 02:14:00');
INSERT INTO `article_view` VALUES ('e60ffd88f86c407281511de9f50d47fb', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-21 14:05:08', 'kerry', '2019-01-21 14:05:08');
INSERT INTO `article_view` VALUES ('e62b9d6ea66040999b0f6cab8c852b82', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:52', 'steve', '2019-02-20 02:13:52');
INSERT INTO `article_view` VALUES ('e66db3333b5a46dfb09bd02b8409c297', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-28 05:07:57', 'kerry', '2019-01-28 05:07:57');
INSERT INTO `article_view` VALUES ('e6ff1cd6cb504a338788d97945157d3c', '5c568f755c7d4f65bdca30840f565a84', '1', 'zero', '2019-01-24 06:04:53', 'zero', '2019-01-24 06:04:53');
INSERT INTO `article_view` VALUES ('e71bb8719336401cb5ed86197f0c82f9', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:50', 'steve', '2019-02-20 02:13:50');
INSERT INTO `article_view` VALUES ('e744719eb9ed4aff993096b442c83645', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:43', 'steve', '2019-02-20 02:13:43');
INSERT INTO `article_view` VALUES ('e7a19a2cd4cb4f0680f6eeca6dba5ca0', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-20 02:20:13', 'steve', '2019-02-20 02:20:13');
INSERT INTO `article_view` VALUES ('e7d7c4300c224a27b38e35ef5998727d', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:48:37', 'steve', '2019-02-22 08:48:37');
INSERT INTO `article_view` VALUES ('e81a26042563483ca4ce9a1a848e4e3c', '919493ab3980403794e7c254a4f35ab4', '1', 'steve', '2019-01-23 03:23:15', 'steve', '2019-01-23 03:23:15');
INSERT INTO `article_view` VALUES ('e8351346735d487db91a82bf5ad0f43e', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:56:55', 'steve', '2019-02-22 08:56:55');
INSERT INTO `article_view` VALUES ('e86a32995bba447987562e02550b84e6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:33', 'steve', '2019-02-22 09:17:33');
INSERT INTO `article_view` VALUES ('e86c979991b54b9c9007268d50e12e61', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'mm', '2019-03-01 11:10:38', 'mm', '2019-03-01 11:10:38');
INSERT INTO `article_view` VALUES ('e90682b249d54af887611e3ad75c1435', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:39', 'steve', '2019-02-20 02:13:39');
INSERT INTO `article_view` VALUES ('e94ada05da2348319cbbd5686ec97b21', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:57', 'steve', '2019-02-20 02:13:57');
INSERT INTO `article_view` VALUES ('e96f1dacf6934363987a84a1aae4aafb', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:43', 'steve', '2019-02-20 02:13:43');
INSERT INTO `article_view` VALUES ('e984222029384aa0be14114ae46dbfb4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:08', 'steve', '2019-02-20 02:14:08');
INSERT INTO `article_view` VALUES ('e990d84876c54749a6c562770b86e537', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:30', 'steve', '2019-02-22 09:17:30');
INSERT INTO `article_view` VALUES ('ea44b581ad5c4f7c87d6437c6a632c36', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:31', 'steve', '2019-02-22 09:17:31');
INSERT INTO `article_view` VALUES ('ea487f6bad1d4b4c9bcc5aafb22d9d76', '530ba65410ae11e9a0aa0242ac1b0002530ba65d10ae11e9a0aa0242ac1b0002', '1', 'kerry', '2019-01-23 00:57:34', 'kerry', '2019-01-23 00:57:34');
INSERT INTO `article_view` VALUES ('eab6cca8a15043f98e1b1cff09968b3c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 09:28:15', 'kerry', '2019-01-09 09:28:15');
INSERT INTO `article_view` VALUES ('eb99c009b43e49499afb33619f74c89d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:16', 'steve', '2019-02-22 09:17:16');
INSERT INTO `article_view` VALUES ('ebe7e0079de6433fb8ebb37534a99f34', '2c6a2e023fa6432483c595de3a370a9d', '1', 'kerry', '2019-01-23 04:54:48', 'kerry', '2019-01-23 04:54:48');
INSERT INTO `article_view` VALUES ('ebf838310eec495f96570279a501ce5d', '00bd8bb8b1e24e939915e6731326ab40', '1', 'zero', '2019-01-24 04:52:56', 'zero', '2019-01-24 04:52:56');
INSERT INTO `article_view` VALUES ('ec15ed4ef30a43b9a414d031ff6ea487', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:40', 'steve', '2019-02-20 02:13:40');
INSERT INTO `article_view` VALUES ('ec340cd8dee8485a8c80d2590c58020b', '55c692ac59d94fdbb06f217bb7275642', '1', 'kerry', '2019-01-23 13:35:05', 'kerry', '2019-01-23 13:35:05');
INSERT INTO `article_view` VALUES ('ec55374cb9a44923b4b1746608861e79', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 16:23:02', 'kerry', '2019-02-07 16:23:02');
INSERT INTO `article_view` VALUES ('ec670bcc73f340308780e0c7e6360bd8', '06d4868bce464082926df6abcd814b44', '1', '1', '2019-01-07 15:33:18', '1', '2019-01-07 15:33:18');
INSERT INTO `article_view` VALUES ('ec91fdf1aa3f4ff8b3d1001391d496fd', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:31', 'steve', '2019-02-22 09:17:31');
INSERT INTO `article_view` VALUES ('ecb30392ee204a75ac0e29508b56eb91', '79632780cd9a4cac86a427061b978a4a', '1', 'kerry', '2019-01-16 09:52:19', 'kerry', '2019-01-16 09:52:19');
INSERT INTO `article_view` VALUES ('ecc95c3daeb64811a0462b2dcc36d604', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'Trevor-TW', '2019-02-20 08:46:16', 'Trevor-TW', '2019-02-20 08:46:16');
INSERT INTO `article_view` VALUES ('ed2a397fff1a4d5c986a168e1e7b1732', 'ea3a4d2734c3424f8f8420e8621f2d2c', '1', 'wenc', '2019-01-21 05:48:33', 'wenc', '2019-01-21 05:48:33');
INSERT INTO `article_view` VALUES ('ed391a311ece4c9c99593fda0f7a8dce', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 15:05:42', 'kerry', '2019-01-09 15:05:42');
INSERT INTO `article_view` VALUES ('ed4ef251e287452cb2c16994f177d8cb', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-07 12:34:39', 'kerry', '2019-01-07 12:34:39');
INSERT INTO `article_view` VALUES ('ed750af0c52a461c97716421c3a72601', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:08', 'steve', '2019-02-20 02:14:08');
INSERT INTO `article_view` VALUES ('ed967a0edcda48238d5201fcb8eb7f9a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:01', 'steve', '2019-02-20 02:14:01');
INSERT INTO `article_view` VALUES ('edb542e4aec54750be044fd6ee94e3bf', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'kerry', '2019-01-22 01:09:42', 'kerry', '2019-01-22 01:09:42');
INSERT INTO `article_view` VALUES ('ede5b0a017cb4efeafe0789f7955a53b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:29', 'steve', '2019-02-22 09:17:29');
INSERT INTO `article_view` VALUES ('edf2d1e163be4ea1b120f42911efc235', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-02-22 08:56:55', 'steve', '2019-02-22 08:56:55');
INSERT INTO `article_view` VALUES ('ee17332c27ab4e68acb359fccfb691ed', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:15', 'steve', '2019-02-20 02:14:15');
INSERT INTO `article_view` VALUES ('ee42e93f6b0642bcb4125aea608676d6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:59', 'steve', '2019-02-20 02:13:59');
INSERT INTO `article_view` VALUES ('eee6a8b5caa845f4b4c9d294283e294e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:53', 'steve', '2019-02-22 09:17:53');
INSERT INTO `article_view` VALUES ('eeeeb0c5233e4c4ab572fe476d5bf0b4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:20:13', 'steve', '2019-02-20 02:20:13');
INSERT INTO `article_view` VALUES ('ef46b3eb51824b9d8b221a5b0a138c78', '834470bab65445a0a34e714fe0f28f8d', '1', 'kerry', '2019-01-25 00:53:49', 'kerry', '2019-01-25 00:53:49');
INSERT INTO `article_view` VALUES ('f00734c33f0840d399332427f0f07dae', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-02-01 09:00:14', 'kerry', '2019-02-01 09:00:14');
INSERT INTO `article_view` VALUES ('f00acf77f49a486eb4177539ae3a21dd', 'd1ff69b7867f419dba6bbc0c082ff319', '1', 'kerry', '2019-01-25 05:37:47', 'kerry', '2019-01-25 05:37:47');
INSERT INTO `article_view` VALUES ('f0292f5ded73484cba8ca177b107c25a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:36', 'steve', '2019-02-22 09:17:36');
INSERT INTO `article_view` VALUES ('f03c7bbf34ac418887f191dea0e25617', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('f09dbb8d85b44c9b8edf7ac824a39143', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:07', 'steve', '2019-02-20 02:14:07');
INSERT INTO `article_view` VALUES ('f1029249d9a04262a403982a87b01ac4', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'zero', '2019-01-22 04:19:13', 'zero', '2019-01-22 04:19:13');
INSERT INTO `article_view` VALUES ('f13fb9a2118a4db48cedb8bff777d175', '5c568f755c7d4f65bdca30840f565a84', '1', 'admin', '2019-03-07 01:54:16', 'admin', '2019-03-07 01:54:16');
INSERT INTO `article_view` VALUES ('f1459ad177b143d3810aa7f8949bc3dd', '55c692ac59d94fdbb06f217bb7275642', '1', 'kerry', '2019-01-09 15:37:52', 'kerry', '2019-01-09 15:37:52');
INSERT INTO `article_view` VALUES ('f2204e1cdda443ac9c69e6b8f8ecbe5b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:15', 'steve', '2019-02-20 02:13:15');
INSERT INTO `article_view` VALUES ('f295254004dc4571b4cb0931195c12a3', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-12 04:01:03', 'kerry', '2019-01-12 04:01:03');
INSERT INTO `article_view` VALUES ('f2c0dc0f71914428bc990ea15363b9ed', '6014d7abacfd4034bf3e2ded207468ba', '1', 'kerry', '2019-01-18 02:04:05', 'kerry', '2019-01-18 02:04:05');
INSERT INTO `article_view` VALUES ('f30560dab117407495d5039b68f481da', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:04', 'steve', '2019-02-20 02:14:04');
INSERT INTO `article_view` VALUES ('f311b32505c747779a894d1fb227886a', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:35', 'steve', '2019-02-20 02:13:35');
INSERT INTO `article_view` VALUES ('f31cdab942094e61a5f423497d22e38d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-28 03:20:12', 'steve', '2019-02-28 03:20:12');
INSERT INTO `article_view` VALUES ('f31ee771457c48c3a692042419701524', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:14', 'steve', '2019-02-22 09:17:14');
INSERT INTO `article_view` VALUES ('f329695cde06420994b487cf7f23b59f', '5bc6d99cc971448383028118fe6c8f8c', '1', 'zero', '2019-01-29 02:45:10', 'zero', '2019-01-29 02:45:10');
INSERT INTO `article_view` VALUES ('f35fee11b0e4443b97f8f63fc756903d', '55c692ac59d94fdbb06f217bb7275642', '1', '527510587@qq.com', '2019-01-21 05:28:14', '527510587@qq.com', '2019-01-21 05:28:14');
INSERT INTO `article_view` VALUES ('f3907d506a7b4e4d83cb08af5377be49', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:41', 'steve', '2019-02-20 02:13:41');
INSERT INTO `article_view` VALUES ('f3b602176c834b9e9f4808e154e85a6c', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:46', 'steve', '2019-02-20 02:13:46');
INSERT INTO `article_view` VALUES ('f41bc7bb35474334b79a6a444284098b', 'c1200fd6a7184740a3131ee481101716', '1', 'kerry', '2019-01-18 05:39:42', 'kerry', '2019-01-18 05:39:42');
INSERT INTO `article_view` VALUES ('f4305d96fef24dcebac88191b2564308', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:45', 'steve', '2019-02-20 02:13:45');
INSERT INTO `article_view` VALUES ('f4ec93f1a90041528f96a16ff5521c20', 'ff27e64efc2b4b00a53d6dfa23b74e3d', '1', 'kerry', '2019-02-07 05:41:49', 'kerry', '2019-02-07 05:41:49');
INSERT INTO `article_view` VALUES ('f5317f84bcbc4cdb8fe54984a288d102', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-01-23 00:42:46', 'kerry', '2019-01-23 00:42:46');
INSERT INTO `article_view` VALUES ('f547c5a978534a138ecb338d4539ec08', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:49', 'steve', '2019-02-20 02:13:49');
INSERT INTO `article_view` VALUES ('f54d61c3084d4d0fb32e66205df8cc99', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:19:01', 'steve', '2019-02-22 09:19:01');
INSERT INTO `article_view` VALUES ('f568fd44ee9c4d7096f7a6b412454450', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-24 05:10:32', 'kerry', '2019-01-24 05:10:32');
INSERT INTO `article_view` VALUES ('f5bf430451214cc8baf98929363fbb0b', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:14', 'steve', '2019-02-20 02:14:14');
INSERT INTO `article_view` VALUES ('f5e9034fdb53486282fa836168461b5e', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:06', 'steve', '2019-02-20 02:14:06');
INSERT INTO `article_view` VALUES ('f5ef7c82739140c1b7937acb212980a3', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:37', 'steve', '2019-02-20 02:13:37');
INSERT INTO `article_view` VALUES ('f619c365b27e4e0e93abf146c7c74b77', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:13', 'steve', '2019-02-22 09:17:13');
INSERT INTO `article_view` VALUES ('f631cbb8133f40ee8a4c80eff49dd077', '5c568f755c7d4f65bdca30840f565a84', '1', 'zero', '2019-01-24 05:57:14', 'zero', '2019-01-24 05:57:14');
INSERT INTO `article_view` VALUES ('f63671b4d9e44ad79ba23cda967beff9', '455b97de71f44eeda0e359532724b5e8', '1', 'try', '2019-02-27 06:17:50', 'try', '2019-02-27 06:17:50');
INSERT INTO `article_view` VALUES ('f65586c257be4e55a2624fa473858c06', '06d4868bce464082926df6abcd814b44', '1', 'kerry', '2019-01-23 12:56:24', 'kerry', '2019-01-23 12:56:24');
INSERT INTO `article_view` VALUES ('f69dac13cb264b169f74a92430181343', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:54', 'steve', '2019-02-20 02:13:54');
INSERT INTO `article_view` VALUES ('f6be7a55f6ad44dcbbb3d1869dfc9c41', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:51', 'steve', '2019-02-20 02:13:51');
INSERT INTO `article_view` VALUES ('f6f0ae3535784c7db65622c179877f88', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:34', 'steve', '2019-03-04 02:37:34');
INSERT INTO `article_view` VALUES ('f775b5eee667429c8011ab965b5091e1', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:43', 'steve', '2019-02-20 02:13:43');
INSERT INTO `article_view` VALUES ('f7a2fef6cad349058d68a1dce7d607c4', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-01-17 16:25:28', 'admin', '2019-01-17 16:25:28');
INSERT INTO `article_view` VALUES ('f7b8b84bc14a4254855abc1fd4d6792d', '0c3e2f4a9f9c47e1b499432da6f80462', '1', 'admin', '2019-03-05 05:28:06', 'admin', '2019-03-05 05:28:06');
INSERT INTO `article_view` VALUES ('f9598506725747948b1cc9b7ca1e459c', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-07 08:22:03', 'kerry', '2019-01-07 08:22:03');
INSERT INTO `article_view` VALUES ('f981d03e2a684cc6bd1405a364b74fb7', '7ddb9cc9d6b24048a098bc805213a6e0', '1', 'steve', '2019-02-20 02:13:32', 'steve', '2019-02-20 02:13:32');
INSERT INTO `article_view` VALUES ('fa74b88f971e4098bc531fa149d8e0e2', '5c568f755c7d4f65bdca30840f565a84', '1', 'zero', '2019-01-24 05:25:34', 'zero', '2019-01-24 05:25:34');
INSERT INTO `article_view` VALUES ('fa75c1ca1a57465a9a93672ec7fe6f33', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:34', 'steve', '2019-03-04 02:37:34');
INSERT INTO `article_view` VALUES ('fa85c0a680fb4b2693fb8709351b0f99', '70b0ab6c15d345b395426cd30bbdfa26', '1', 'kerry', '2019-02-07 17:02:28', 'kerry', '2019-02-07 17:02:28');
INSERT INTO `article_view` VALUES ('faaa1e9745764b1da7ccb5e78f24264e', '55c692ac59d94fdbb06f217bb7275642', '1', 'zero', '2019-01-17 08:18:03', 'zero', '2019-01-17 08:18:03');
INSERT INTO `article_view` VALUES ('fb0ba6d3c36c475c92038a77dd647076', '79632780cd9a4cac86a427061b978a4a', '1', 'Trevor-TW', '2019-02-20 07:38:01', 'Trevor-TW', '2019-02-20 07:38:01');
INSERT INTO `article_view` VALUES ('fb134e3fa5694bf793e2debb2a58ac79', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:14:07', 'steve', '2019-02-20 02:14:07');
INSERT INTO `article_view` VALUES ('fb3d4c534a234df1ac45a467879bb139', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-09 10:14:48', 'kerry', '2019-01-09 10:14:48');
INSERT INTO `article_view` VALUES ('fba0ca701dd3454b8013ccfcb95b84e5', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'steve', '2019-03-04 02:37:46', 'steve', '2019-03-04 02:37:46');
INSERT INTO `article_view` VALUES ('fbea8dbb54d441aa8e250c9b7215c5a7', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:42', 'steve', '2019-02-20 02:13:42');
INSERT INTO `article_view` VALUES ('fc87cf1bf6e8409988c7a06b04dd1abf', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:22', 'steve', '2019-03-04 02:37:22');
INSERT INTO `article_view` VALUES ('fcc5242da42641ae9254570bc53547e4', 'ff6ebd4406f94ed294d8611f2abfa925', '1', 'Trevor-TW', '2019-02-20 08:46:09', 'Trevor-TW', '2019-02-20 08:46:09');
INSERT INTO `article_view` VALUES ('fcf12210a0894c3ca67591af726fd0f8', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-15 15:18:41', 'kerry', '2019-01-15 15:18:41');
INSERT INTO `article_view` VALUES ('fd20e44cf5fb4feb9b428684dfd55dd6', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:29', 'steve', '2019-03-04 02:37:29');
INSERT INTO `article_view` VALUES ('fd84ba7bb8cd406f94e8ae066c1c2346', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:57', 'steve', '2019-02-20 02:13:57');
INSERT INTO `article_view` VALUES ('fd95940bad1947ab9724beed095e96d1', '5bc6d99cc971448383028118fe6c8f8c', '1', 'root', '2019-03-01 11:09:30', 'root', '2019-03-01 11:09:30');
INSERT INTO `article_view` VALUES ('fdb01fa18e2d4efcbebfc346213b2ae6', 'dbb4ec6650bf46449eeb210ffed035bc', '1', 'kerry', '2019-01-25 00:48:09', 'kerry', '2019-01-25 00:48:09');
INSERT INTO `article_view` VALUES ('fdf2d3478c0448979574ff8324dd0bc4', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-03-04 02:37:23', 'steve', '2019-03-04 02:37:23');
INSERT INTO `article_view` VALUES ('fe1b3dd438074cc98a67320ca8504062', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-12 08:21:53', 'kerry', '2019-01-12 08:21:53');
INSERT INTO `article_view` VALUES ('fe687b8fe30b4348a33fbf2ed3cb4b64', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:41', 'steve', '2019-02-20 02:13:41');
INSERT INTO `article_view` VALUES ('fe6ccc9bd12c4abf951e3b55b5e55752', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:48', 'steve', '2019-02-22 09:17:48');
INSERT INTO `article_view` VALUES ('fe960158b49648aeb4a91764cd6674e8', 'f1c60ec1f8a94c7ea8b0d6bc43c4b774', '1', 'kerry', '2019-01-23 01:57:30', 'kerry', '2019-01-23 01:57:30');
INSERT INTO `article_view` VALUES ('feb1e1b8b7ea40f2b0bf26a23486c980', 'd7f35a072c0f47f8bf55cc201f7471ec', '1', 'kerry', '2019-01-25 00:59:11', 'kerry', '2019-01-25 00:59:11');
INSERT INTO `article_view` VALUES ('fed91f7dc3154cfeafc7ed0200248669', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:35', 'steve', '2019-02-20 02:13:35');
INSERT INTO `article_view` VALUES ('fee63de36b8b4f0c88137c16a1f5910d', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-22 09:17:03', 'steve', '2019-02-22 09:17:03');
INSERT INTO `article_view` VALUES ('ff0900af22174c72805ecfed178521f2', '9e7e3fdc44c349eda7e250f6425a64a0', '1', 'steve', '2019-02-20 02:13:56', 'steve', '2019-02-20 02:13:56');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `id` varchar(64) NOT NULL,
  `label_name` varchar(50) DEFAULT NULL,
  `object_version_number` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(50) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('05b95d0110ac11e9a0aa0242ac1b000205b95d0910ac11e9a0aa0242ac1b0002', 'elk', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('09dad24610ac11e9a0aa0242ac1b000209dad25310ac11e9a0aa0242ac1b0002', '消息中间件', '1', 'kerry', '2019-01-05 05:37:49', 'kerry', '2019-01-05 05:37:49');
INSERT INTO `label` VALUES ('0fef90a310ac11e9a0aa0242ac1b00020fef90b210ac11e9a0aa0242ac1b0002', 'linux', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('114fada5140611e9b1a30242c0a84002', 'devops', '1', 'kerry', '2019-01-09 11:59:50', 'kerry', '2019-01-09 11:59:50');
INSERT INTO `label` VALUES ('2047677210ac11e9a0aa0242ac1b00022047677c10ac11e9a0aa0242ac1b0002', '微信小程序', '1', 'kerry', '2019-01-05 05:38:27', 'kerry', '2019-01-05 05:38:27');
INSERT INTO `label` VALUES ('2c32c2b310ac11e9a0aa0242ac1b00022c32c2be10ac11e9a0aa0242ac1b0002', 'android', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('31d336731ecd11e9813b0242ac1d0002', '产品设计', '1', 'kerry', '2019-01-23 05:10:26', 'kerry', '2019-01-23 05:10:26');
INSERT INTO `label` VALUES ('33fc261710ac11e9a0aa0242ac1b000233fc262110ac11e9a0aa0242ac1b0002', 'adf', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('3b07ad5c10ac11e9a0aa0242ac1b00023b07ad6b10ac11e9a0aa0242ac1b0002', 'ios', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('593cfacb10ac11e9a0aa0242ac1b0002593cfad910ac11e9a0aa0242ac1b0002', 'maven', '1', 'kerry', '2019-01-05 05:40:02', 'kerry', '2019-01-05 05:40:02');
INSERT INTO `label` VALUES ('5f4757d2142111e98e130242c0a850025f4757e1142111e98e130242c0a85002', 'springboot', '1', 'kerry', '2019-01-09 15:15:17', 'kerry', '2019-01-09 15:15:17');
INSERT INTO `label` VALUES ('6522a11810ac11e9a0aa0242ac1b00026522a12510ac11e9a0aa0242ac1b0002', 'java', '1', 'kerry', '2019-01-05 05:40:22', 'kerry', '2019-01-05 05:40:22');
INSERT INTO `label` VALUES ('6dbf50d8140311e9b1a30242c0a840026dbf50e4140311e9b1a30242c0a84002', '数据源', '1', 'kerry', '2019-01-09 11:40:57', 'kerry', '2019-01-09 11:40:57');
INSERT INTO `label` VALUES ('70cc39c810ab11e9a0aa0242ac1b000270cc39d110ab11e9a0aa0242ac1b0002', 'angular', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('76655872142111e98e130242c0a8500276655881142111e98e130242c0a85002', 'soap', '1', 'kerry', '2019-01-09 15:15:56', 'kerry', '2019-01-09 15:15:56');
INSERT INTO `label` VALUES ('79b7bdd4140311e9b1a30242c0a84002', 'jdk', '1', 'kerry', '2019-01-09 11:41:17', 'kerry', '2019-01-09 11:41:17');
INSERT INTO `label` VALUES ('7dbd9f4b140311e9b1a30242c0a84002', 'idea', '1', 'kerry', '2019-01-09 11:41:23', 'kerry', '2019-01-09 11:41:23');
INSERT INTO `label` VALUES ('8b2171f2142111e98e130242c0a850028b2171fe142111e98e130242c0a85002', 'webservice', '1', 'kerry', '2019-01-09 15:16:31', 'kerry', '2019-01-09 15:16:31');
INSERT INTO `label` VALUES ('934195c010ab11e9a0aa0242ac1b0002934195cb10ab11e9a0aa0242ac1b0002', 'docker', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('971b735d10ab11e9a0aa0242ac1b0002971b736a10ab11e9a0aa0242ac1b0002', 'spring', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('a26e2ddd10ab11e9a0aa0242ac1b0002a26e2de710ab11e9a0aa0242ac1b0002', 'weblogic', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('a73bd54c10ab11e9a0aa0242ac1b0002a73bd55510ab11e9a0aa0242ac1b0002', 'oracle', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('b3c6bdc610ab11e9a0aa0242ac1b0002b3c6bdcf10ab11e9a0aa0242ac1b0002', 'nginx', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('b760022f10ab11e9a0aa0242ac1b0002b760023910ab11e9a0aa0242ac1b0002', 'tomcat', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('bb39188a10ab11e9a0aa0242ac1b0002bb39189a10ab11e9a0aa0242ac1b0002', 'bpm', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('bec6673d10ab11e9a0aa0242ac1b0002bec6674710ab11e9a0aa0242ac1b0002', 'osb', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('c10aabe410ab11e9a0aa0242ac1b0002c10aabee10ab11e9a0aa0242ac1b0002', 'soa', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('d6885a6010ab11e9a0aa0242ac1b0002d6885a6910ab11e9a0aa0242ac1b0002', 'webcenter', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('dcd222181a7911e9b8a70242ac120002', 'odi', '1', 'kerry', '2019-01-17 17:03:50', 'kerry', '2019-01-17 17:03:50');
INSERT INTO `label` VALUES ('e40909c810ab11e9a0aa0242ac1b0002e40909d610ab11e9a0aa0242ac1b0002', 'mysql', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('e804c46310ab11e9a0aa0242ac1b0002e804c47210ab11e9a0aa0242ac1b0002', 'pl/sql', '1', 'kerry', '2019-01-05 05:42:20', 'kerry', '2019-01-05 05:42:20');
INSERT INTO `label` VALUES ('f0039ed2140511e9b1a30242c0a84002', 'jenkins', '1', 'kerry', '2019-01-09 11:58:54', 'kerry', '2019-01-09 11:58:54');

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` varchar(64) NOT NULL,
  `sys_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sys_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `object_version_number` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(50) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('6c3bdcba10b211e9a0aa0242ac1b00026c3bdcc310b211e9a0aa0242ac1b0002', 'article_file_url', 'http://kerrysmec.cn/file/article/', '文章库中，文章md文件访问链接', '1', 'kerry', '2019-01-24 02:38:57', 'kerry', '2019-01-24 02:38:57');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(64) NOT NULL,
  `project_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目外键',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `role_code` varchar(50) DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `signature` varchar(10000) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `object_version_number` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_update_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('06c9bf591d3b11e9abe50242ac160002', null, 'wenc', 'wenc', '许浩池', null, null, '995062975@qq.com', null, '0', '1', 'kerry', '2019-02-28 11:09:37', 'kerry', '2019-02-28 11:09:37');
INSERT INTO `user` VALUES ('254943bf141e11e9b1a30242c0a84002', null, 'root', 'root', '郑剑峰', null, null, 'jianfeng.zheng@definesys.com', null, '5', '1', 'kerry', '2019-02-28 11:09:38', 'kerry', '2019-02-28 11:09:38');
INSERT INTO `user` VALUES ('4689f446147911e98e130242c0a85002', null, 'mm', 'mm', '徐向明', null, null, 'xiangming.xu@definesys.com', null, '14', '1', 'kerry', '2019-02-28 11:09:38', 'kerry', '2019-02-28 11:09:38');
INSERT INTO `user` VALUES ('4a1907f0125311e9b3020242c0a8c002', null, 'kerry', 'kerry', '吴晨瑞', null, '18649756605', 'kerry.wu@definesys.com', '', '71', '37', 'kerry', '2019-03-04 01:13:20', 'kerry', '2019-03-04 01:13:20');
INSERT INTO `user` VALUES ('65b2ee5f13fd11e99fa60242c0a8300265b2ee6e13fd11e99fa60242c0a83002', null, 'devinShi', 'devinShi', '石雨田', null, null, 'yutian.shi@definesys.com', null, '0', '1', 'kerry', '2019-02-28 11:09:38', 'kerry', '2019-02-28 11:09:38');
INSERT INTO `user` VALUES ('7286514c141e11e9b1a30242c0a84002', null, 'zero', 'zero', '王威', null, null, 'wei.wang@definesys.com', null, '20', '1', 'kerry', '2019-02-28 11:09:38', 'kerry', '2019-02-28 11:09:38');
INSERT INTO `user` VALUES ('7663f9b8244411e988830242c0a83004', null, 'erick', 'erick', '刘鑫', null, null, 'erick.liu@definesys.com', null, '0', '1', 'kerry', '2019-02-28 11:09:38', 'kerry', '2019-02-28 11:09:38');
INSERT INTO `user` VALUES ('7bcc2fe3147911e98e130242c0a85002', null, 'try', 'try', '莫洪武', null, null, 'hongwu.mo@definesys.com', null, '0', '1', 'kerry', '2019-02-28 11:09:38', 'kerry', '2019-02-28 11:09:38');
INSERT INTO `user` VALUES ('b5238e0e140611e9b1a30242c0a84002b5238e1c140611e9b1a30242c0a84002', null, 'leo', 'qwer1234', '吴伟超', null, null, 'weichao.wu@definesys.com', null, '6', '1', 'kerry', '2019-02-28 11:09:38', 'kerry', '2019-02-28 11:09:38');
INSERT INTO `user` VALUES ('d4006b551d3b11e9abe50242ac160002', null, 'wlj', 'welcome1', '吴良军', null, null, '527510587@qq.com', null, '0', '1', 'kerry', '2019-02-28 11:09:38', 'kerry', '2019-02-28 11:09:38');
INSERT INTO `user` VALUES ('e05a6e1713fd11e99fa60242c0a83002e05a6e2513fd11e99fa60242c0a83002', null, 'steve', 'minimalist', '高文斌', null, null, 'wenbin.gao@definesys.com', '啊!光芒万丈的缪斯女神，你登上了无比辉煌的幻想的天堂！', '23', '12', 'kerry', '2019-03-04 00:21:48', 'steve', '2019-03-04 00:21:49');
INSERT INTO `user` VALUES ('f8dc10f8140611e9b1a30242c0a84002f8dc1107140611e9b1a30242c0a84002', null, 'admin', 'qq9629', '林泳洁', null, null, 'yongjie.lin@definesys.com', null, '6', '1', 'kerry', '2019-02-28 11:09:39', 'kerry', '2019-02-28 11:09:39');
INSERT INTO `user` VALUES ('fe8e37f534e111e9a5c20242c0a81002', null, 'Trevor-TW', 'welcome1', '唐炜', null, null, 'wei.tang@definesys.com', null, '0', '1', 'kerry', '2019-02-28 11:09:39', 'kerry', '2019-02-28 11:09:39');

-- ----------------------------
-- View structure for article_query_v
-- ----------------------------
DROP VIEW IF EXISTS `article_query_v`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `article_query_v` AS select `a`.`id` AS `id`,`a`.`title` AS `title`,`a`.`file_uuid` AS `file_uuid`,`a`.`author` AS `author`,`a`.`created_by` AS `created_by`,`a`.`creation_date` AS `creation_date`,(select count(1) from `article_view` `v` where (`v`.`article_id` = `a`.`id`)) AS `article_views`,(select count(1) from `article_like` `k` where (`k`.`article_id` = `a`.`id`)) AS `article_likes`,ifnull((select group_concat(`l`.`label_name` separator ',') from `article_label` `l` where (`l`.`article_id` = `a`.`id`)),'') AS `labels`,concat(ifnull((select group_concat(`l`.`label_name` separator ',') from `article_label` `l` where (`l`.`article_id` = `a`.`id`)),''),`a`.`title`,`a`.`author`) AS `search_content`,(select group_concat(concat(',',`k`.`created_by`,',') separator ',') from `article_like` `k` where (`k`.`article_id` = `a`.`id`)) AS `like_users` from `article` `a` ;
