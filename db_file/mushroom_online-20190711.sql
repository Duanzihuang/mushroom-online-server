/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库连接
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mushroom_online

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-07-11 21:19:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_appkey`
-- ----------------------------
DROP TABLE IF EXISTS `t_appkey`;
CREATE TABLE `t_appkey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appkey` varchar(40) DEFAULT NULL,
  `appsecret` varchar(40) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_appkey
-- ----------------------------
INSERT INTO `t_appkey` VALUES ('1', '9c5e951051dc11e9a59e8fa81c3ea1a3', null, '13812345678', null, null, null, null, '1');
INSERT INTO `t_appkey` VALUES ('2', '79541b50522a11e98bce831b227fad88', null, '13812346666', null, null, null, null, '1');
INSERT INTO `t_appkey` VALUES ('3', 'f2199e20522a11e9b07c29c8211fe7a3', null, '13812347777', null, null, null, null, '1');

-- ----------------------------
-- Table structure for `t_carousel`
-- ----------------------------
DROP TABLE IF EXISTS `t_carousel`;
CREATE TABLE `t_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(200) DEFAULT NULL,
  `link_url` varchar(200) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_carousel
-- ----------------------------
INSERT INTO `t_carousel` VALUES ('1', 'images/carousel/banner_01.png', null, '3', '2019-04-02 11:58:18', null, null, '1');
INSERT INTO `t_carousel` VALUES ('2', 'images/carousel/banner_02.png', null, '4', '2019-04-02 11:59:20', null, null, '1');
INSERT INTO `t_carousel` VALUES ('3', 'images/carousel/banner_03.png', null, '5', '2019-04-02 11:59:47', null, null, '1');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `is_like` tinyint(4) DEFAULT '1' COMMENT '1 不点赞  2 点赞',
  `comment_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效  1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '3', '0', '7', '4', '老师讲解的不错，孩子很喜欢！', '2', '2019-04-09 12:35:13', '1');
INSERT INTO `t_comment` VALUES ('2', '3', '0', '8', '4', '看过才知道自己哪里不行，贵在坚持，感谢老师！', '1', '2019-04-09 12:37:02', '1');
INSERT INTO `t_comment` VALUES ('3', '3', '0', '9', '3', '666666', '1', '2019-04-09 12:37:23', '1');
INSERT INTO `t_comment` VALUES ('4', '3', null, '6', '3', '这个课程还行哦', '1', '2019-05-13 17:38:11', '1');
INSERT INTO `t_comment` VALUES ('5', '4', null, '15', '5', '这个课程好啊', '1', '2019-06-03 23:51:21', '1');
INSERT INTO `t_comment` VALUES ('6', '4', null, '11', '5', '这个课程很好呀', '1', '2019-06-03 23:55:17', '1');
INSERT INTO `t_comment` VALUES ('7', '4', null, '11', '4', '还过得去吧', '1', '2019-06-03 23:58:49', '1');
INSERT INTO `t_comment` VALUES ('8', '4', null, '6', '5', '这个课程真是不错呀', '1', '2019-07-10 11:16:30', '1');

-- ----------------------------
-- Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `subtitle` varchar(50) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `cover_image_url` varchar(200) DEFAULT NULL,
  `course_video_url` varchar(500) DEFAULT '' COMMENT '课程简介视频',
  `audience` varchar(50) DEFAULT NULL,
  `introduction` varchar(200) DEFAULT NULL,
  `level` int(11) DEFAULT '1' COMMENT '1 初级 2 中级 3高级',
  `course_duration` int(11) DEFAULT NULL COMMENT '课程总时长 单位：秒',
  `price` float(8,2) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `study_count` int(11) DEFAULT NULL,
  `is_recommend` tinyint(4) DEFAULT '0' COMMENT '0 不推荐  1推荐',
  `relation_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1 有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '逻辑思维训练', '提升思考的能力', 'images/course/course1.png', 'images/course/course3_cover_image.png', 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f', null, '逻辑思维训练，提高您孩子的逻辑思维', '1', '15', '180.00', '3', '686', '0', null, '2019-04-04 21:33:45', null, null, '1');
INSERT INTO `t_course` VALUES ('2', 'Scratch编程启蒙', 'MIT研发的编程工具', 'images/course/course2.png', 'images/course/course3_cover_image.png', 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4', null, 'Scratch编程启蒙，这个课程很好', '2', '10', '200.00', '5', '1123', '0', null, '2019-04-04 21:37:35', null, null, '1');
INSERT INTO `t_course` VALUES ('3', '创意手绘班', '轻松入门手绘', 'images/course/course3.png', 'images/course/course3_cover_image.png', 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f', null, '本课程面向零基础的绘画爱好者，适合6~12岁儿童学习，只要您的孩子对画画感兴趣就可以迅速上手，提升孩子审美~', '3', '3840', '259.00', '4', '1524', '0', null, '2019-04-04 21:38:09', null, null, '1');
INSERT INTO `t_course` VALUES ('4', '少儿编程入门全集', '从小学习编程是时代趋势', 'images/course/course4.png', 'images/course/course3_cover_image.png', 'https://media.w3.org/2010/05/sintel/trailer.mp4', null, '少儿编程入门全集，从小学习编程是时代趋势', '1', '380', '320.00', '3', '580', '0', null, '2019-04-04 21:38:43', null, null, '1');
INSERT INTO `t_course` VALUES ('5', '一分钟童趣简笔画', '简单又好看的简笔画', 'images/course/course5.png', 'images/course/course3_cover_image.png', 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f', null, '一分钟童趣简笔画，简单又好看的简笔画', '3', '840', '598.00', '4', '1208', '0', null, '2019-04-04 21:39:21', null, null, '1');
INSERT INTO `t_course` VALUES ('6', '经典儿童故事', '提升语言表达能力', 'images/course/course6.png', 'images/course/course3_cover_image.png', 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4', null, '经典儿童故事，提升语言表达能力', '2', '10', '118.00', '5', '289', '0', null, '2019-04-04 21:39:55', null, null, '1');
INSERT INTO `t_course` VALUES ('7', '创意图形绘制', '锻炼思维逻辑能力', 'images/course/course7.png', 'images/course/course3_cover_image.png', 'http://vjs.zencdn.net/v/oceans.mp4', null, '创意图形绘制，锻炼思维逻辑能力', '1', '15', '128.00', '2', '688', '0', null, '2019-04-04 21:40:31', null, null, '1');
INSERT INTO `t_course` VALUES ('8', '爱编程的艺术家', '艺术和代码的碰撞', 'images/course/course8.png', 'images/course/course3_cover_image.png', 'https://media.w3.org/2010/05/sintel/trailer.mp4', null, '爱编程的艺术家，艺术和代码的碰撞', '3', '12', '388.00', '4', '285', '0', null, '2019-04-04 21:41:03', null, null, '1');
INSERT INTO `t_course` VALUES ('9', '零基础入门水彩', '奇妙水彩之旅', 'images/course/course9.png', 'images/course/course3_cover_image.png', 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f', null, '零基础入门水彩，奇妙水彩之旅', '1', '10', '466.00', '5', '268', '0', null, '2019-04-04 21:41:33', null, null, '1');
INSERT INTO `t_course` VALUES ('10', 'POP插画教程', '好玩有趣的字体', 'images/course/course10.png', 'images/course/course3_cover_image.png', 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4', null, 'POP插画教程，好玩有趣的字体', '1', '15', '198.00', '3', '186', '0', null, '2019-04-04 21:42:01', null, null, '1');
INSERT INTO `t_course` VALUES ('11', '玩转神奇魔方', '成就最强大脑', 'images/course/course11.png', 'images/course/course3_cover_image.png', 'http://vjs.zencdn.net/v/oceans.mp4', null, '玩转神奇魔方，成就最强大脑', '2', '12', '318.00', '4', '300', '0', null, '2019-04-04 21:42:32', null, null, '1');
INSERT INTO `t_course` VALUES ('12', '从零开始学漫画', '丰富孩子内心生活', 'images/course/course12.png', 'images/course/course3_cover_image.png', 'https://media.w3.org/2010/05/sintel/trailer.mp4', null, '从零开始学漫画，丰富孩子内心生活', '1', '10', '300.00', '5', '200', '0', null, '2019-04-04 21:42:55', null, null, '1');
INSERT INTO `t_course` VALUES ('13', '创意手绘', null, 'images/recommend/recommend1.png', null, '', '适合3~6岁人群', null, '1', null, null, null, null, '1', '3', '2019-04-09 21:23:18', null, null, '1');
INSERT INTO `t_course` VALUES ('14', '简笔画教程', null, 'images/recommend/recommend2.png', null, '', '适合6~12岁人群', null, '1', null, null, null, null, '1', '4', '2019-04-09 21:23:12', null, null, '1');
INSERT INTO `t_course` VALUES ('15', '编程入门', null, 'images/recommend/recommend3.png', null, '', '适合15~20岁人群\n', null, '1', null, null, null, null, '1', '5', '2019-04-09 21:23:15', null, null, '1');
INSERT INTO `t_course` VALUES ('16', '创意图形绘制', null, 'images/recommend/recommend4.png', null, '', '适合12~15岁人群', null, '1', null, null, null, null, '1', '6', '2019-04-09 21:24:34', null, null, '1');

-- ----------------------------
-- Table structure for `t_follow`
-- ----------------------------
DROP TABLE IF EXISTS `t_follow`;
CREATE TABLE `t_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `is_follow` tinyint(4) DEFAULT '0' COMMENT '0 未关注  1 已关注',
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效  1 有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_follow
-- ----------------------------
INSERT INTO `t_follow` VALUES ('1', '6', '1', '1', '1');
INSERT INTO `t_follow` VALUES ('2', '6', '2', '0', '1');
INSERT INTO `t_follow` VALUES ('3', '6', '3', '0', '1');
INSERT INTO `t_follow` VALUES ('4', '15', '1', '1', '1');
INSERT INTO `t_follow` VALUES ('5', '15', '2', '1', '1');

-- ----------------------------
-- Table structure for `t_lecturer`
-- ----------------------------
DROP TABLE IF EXISTS `t_lecturer`;
CREATE TABLE `t_lecturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `introduction` varchar(1000) DEFAULT NULL,
  `follow_count` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lecturer
-- ----------------------------
INSERT INTO `t_lecturer` VALUES ('1', '张老师', 'images/lecturer/lecturer1.png', '多年教育与开发经验，专注少儿编程课程开发，侧重培养学生专注力和分析解决问题的能力，语言风趣，授课思路清晰，通俗易懂。', '2546', '3', '2019-04-09 12:40:08', null, null, '1');
INSERT INTO `t_lecturer` VALUES ('2', '王老师', 'images/lecturer/lecturer1.png', '多年教育与开发经验，专注少儿编程课程开发，侧重培养学生专注力和分析解决问题的能力，语言风趣，授课思路清晰，通俗易懂。', '1818', '4', '2019-04-20 11:28:44', null, null, '1');
INSERT INTO `t_lecturer` VALUES ('3', '李老师', 'images/lecturer/lecturer1.png', '多年教育与开发经验，专注少儿编程课程开发，侧重培养学生专注力和分析解决问题的能力，语言风趣，授课思路清晰，通俗易懂。', '2000', '5', '2019-04-20 11:30:07', null, null, '1');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `pay_type` tinyint(4) DEFAULT '1' COMMENT '1 微信支付',
  `pay_status` tinyint(4) DEFAULT '0' COMMENT '0 未支付  1 已支付',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效  1 有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('7', null, '4', '1', '259.00', '1', '1', '2019-05-06 10:00:18', null, null, '1');
INSERT INTO `t_order` VALUES ('8', null, '3', '6', '259.00', '1', '1', '2019-05-07 10:27:20', '2019-07-10 11:13:01', null, '1');
INSERT INTO `t_order` VALUES ('6', null, '4', '6', '259.00', '1', '0', '2019-05-07 10:00:15', '2019-07-10 11:16:00', null, '1');
INSERT INTO `t_order` VALUES ('9', null, '3', '1', '259.00', '1', '1', '2019-05-07 11:44:24', '2019-05-07 11:44:24', null, '1');
INSERT INTO `t_order` VALUES ('10', 'HMDD201905310012', '5', '1', '100.00', '1', '1', '2019-05-10 12:43:17', '2019-05-10 12:46:29', null, '1');
INSERT INTO `t_order` VALUES ('11', 'HMDD20190602000000000012', '3', '11', '300.00', '1', '1', '2019-06-02 00:02:48', null, null, '1');
INSERT INTO `t_order` VALUES ('12', 'HMDD20190603000000000012', '4', '15', '320.00', '1', '1', '2019-06-03 21:02:53', '2019-06-03 21:02:54', null, '1');
INSERT INTO `t_order` VALUES ('13', 'HMDD20190603000000000013', '3', '15', '259.00', '1', '1', '2019-06-03 21:05:38', '2019-06-03 21:05:38', null, '1');
INSERT INTO `t_order` VALUES ('14', 'HMDD20190603000000000014', '5', '15', '598.00', '1', '1', '2019-06-03 21:30:07', '2019-06-03 21:30:07', null, '1');
INSERT INTO `t_order` VALUES ('15', 'HMDD20190603000000000015', '4', '11', '320.00', '1', '0', '2019-06-03 23:55:00', '2019-06-03 23:55:00', null, '1');
INSERT INTO `t_order` VALUES ('16', 'HMDD20190604000000000016', '5', '11', '598.00', '1', '1', '2019-06-04 00:17:02', '2019-06-04 00:17:02', null, '1');

-- ----------------------------
-- Table structure for `t_study_progress`
-- ----------------------------
DROP TABLE IF EXISTS `t_study_progress`;
CREATE TABLE `t_study_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `study_hour` tinyint(4) DEFAULT '0' COMMENT '已学习小节数',
  `total_hour` tinyint(4) DEFAULT '0' COMMENT '课程的总节数',
  `study_progress` float(5,2) DEFAULT '0.00',
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_study_progress
-- ----------------------------
INSERT INTO `t_study_progress` VALUES ('1', '6', '1', '3', '10', '30.00', '1');
INSERT INTO `t_study_progress` VALUES ('2', '6', '2', '1', '8', '13.00', '1');
INSERT INTO `t_study_progress` VALUES ('3', '6', '3', '4', '9', '47.00', '1');
INSERT INTO `t_study_progress` VALUES ('4', '6', '4', '5', '8', '100.00', '1');
INSERT INTO `t_study_progress` VALUES ('5', '6', '5', '4', '5', '80.00', '1');
INSERT INTO `t_study_progress` VALUES ('6', '15', '4', '5', '1', '100.00', '1');
INSERT INTO `t_study_progress` VALUES ('7', '15', '3', '5', '1', '63.00', '1');
INSERT INTO `t_study_progress` VALUES ('8', '15', '5', '6', '1', '38.00', '1');
INSERT INTO `t_study_progress` VALUES ('9', '11', '4', '1', '1', '100.00', '1');
INSERT INTO `t_study_progress` VALUES ('10', '11', '5', '2', '1', '38.00', '1');
INSERT INTO `t_study_progress` VALUES ('11', '11', '3', '5', '1', '39.00', '1');

-- ----------------------------
-- Table structure for `t_study_video`
-- ----------------------------
DROP TABLE IF EXISTS `t_study_video`;
CREATE TABLE `t_study_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `is_study` tinyint(4) DEFAULT '0' COMMENT '0：未学习  1：已学习',
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1 有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_study_video
-- ----------------------------
INSERT INTO `t_study_video` VALUES ('1', '6', '3', '1', '1', '1');
INSERT INTO `t_study_video` VALUES ('2', '6', '3', '2', '1', '1');
INSERT INTO `t_study_video` VALUES ('3', '6', '3', '3', '1', '1');
INSERT INTO `t_study_video` VALUES ('4', '6', '3', '4', '1', '1');
INSERT INTO `t_study_video` VALUES ('5', '15', '4', '10', '1', '1');
INSERT INTO `t_study_video` VALUES ('6', '15', '3', '1', '1', '1');
INSERT INTO `t_study_video` VALUES ('7', '15', '3', '2', '1', '1');
INSERT INTO `t_study_video` VALUES ('8', '15', '3', '3', '1', '1');
INSERT INTO `t_study_video` VALUES ('9', '15', '3', '5', '1', '1');
INSERT INTO `t_study_video` VALUES ('10', '15', '5', '12', '1', '1');
INSERT INTO `t_study_video` VALUES ('11', '11', '4', '10', '1', '1');
INSERT INTO `t_study_video` VALUES ('12', '11', '5', '12', '1', '1');
INSERT INTO `t_study_video` VALUES ('13', '11', '3', '1', '1', '1');
INSERT INTO `t_study_video` VALUES ('14', '11', '3', '2', '1', '1');
INSERT INTO `t_study_video` VALUES ('15', '11', '3', '3', '1', '1');
INSERT INTO `t_study_video` VALUES ('16', '6', '4', '10', '1', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT '1' COMMENT '1 男性 2 女性 3未知',
  `address` varchar(250) DEFAULT NULL,
  `wx_open_id` varchar(60) DEFAULT NULL,
  `wx_session_key` varchar(60) DEFAULT NULL,
  `wx_union_id` varchar(60) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `login_type` tinyint(4) DEFAULT '0' COMMENT '登录类型 0 微信登录  1 手机号登录',
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效  1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '黄Sir', null, null, 'https://wx.qlogo.cn/mmopen/vi_32/bd4Y76AsHvkpMA1Vu558WOqE9o8y2zgUvDibM557S30o7Ks6lrelianjDibDY3ysSTryf1eaaVEoRDAneBv1puq2g/132', '1', null, 'opMsQ0V3DHWIAv-PHa8S_1UG7x9I', 'QB9wqfrv02SOf/1czIhqRg==', null, null, null, null, '0', '1');
INSERT INTO `t_user` VALUES ('5', null, '', null, null, '1', null, null, null, null, null, null, null, '0', '1');
INSERT INTO `t_user` VALUES ('6', '酷小鱼', '17704051019', null, 'images/my/avatar1.png', '1', null, null, null, null, '2019-04-14 20:06:58', null, null, '1', '1');
INSERT INTO `t_user` VALUES ('7', '李妈妈', '15871239087', null, 'images/my/avatar2.png', '1', null, null, null, null, null, null, null, '1', '1');
INSERT INTO `t_user` VALUES ('8', '巴啦啦', '17704051012', null, 'images/my/avatar3.png', '1', null, null, null, null, null, null, null, '1', '1');
INSERT INTO `t_user` VALUES ('9', '小兔牙', '17704051010', null, 'images/my/avatar4.png', '1', null, null, null, null, '2019-04-14 20:20:58', null, null, '1', '1');
INSERT INTO `t_user` VALUES ('11', '黄Sir', null, null, 'https://wx.qlogo.cn/mmopen/vi_32/LoMtiagRs23ew0o5Xc1T5iakeBEWHpMZRFlRmfP3wUKw60GZgFTXfic2xXErZRWW0ajowzpFwj6iaqF3FqhPVv1Y6A/132', '1', null, 'oYu_G5Wvb7tHsn-FbYgS17QLweFM', '2uNBweaxms4Q5U46Nsz7fA==', null, null, null, null, '0', '1');
INSERT INTO `t_user` VALUES ('12', null, '13812345678', null, null, '1', null, null, null, null, '2019-07-11 12:28:38', null, null, '0', '1');

-- ----------------------------
-- Table structure for `t_video`
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `cover_photo_url` varchar(200) DEFAULT NULL,
  `video_url` varchar(200) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL COMMENT '秒数',
  `course_id` int(11) DEFAULT NULL COMMENT '归属的课程id',
  `is_hot` tinyint(4) DEFAULT '0' COMMENT '0 不热门 1 热门',
  `view_count` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_video
-- ----------------------------
INSERT INTO `t_video` VALUES ('1', '绘画课程使用画具购买建议', null, 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f', '600', '3', '0', null, '2019-04-09 12:50:31', null, null, '1');
INSERT INTO `t_video` VALUES ('2', '掌握线条绘制的方法', null, 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4', '400', '3', '0', null, '2019-04-09 12:58:33', null, null, '1');
INSERT INTO `t_video` VALUES ('3', '认识常见的绘画造型', null, 'http://vjs.zencdn.net/v/oceans.mp4', '500', '3', '0', null, '2019-04-09 12:58:36', null, null, '1');
INSERT INTO `t_video` VALUES ('4', 'Q版人物结构绘制（上）', null, 'https://media.w3.org/2010/05/sintel/trailer.mp4', '320', '3', '0', null, '2019-04-09 14:35:11', null, null, '1');
INSERT INTO `t_video` VALUES ('5', 'Q版人物结构绘制（下）', null, 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f', '520', '3', '0', null, '2019-04-09 14:35:47', null, null, '1');
INSERT INTO `t_video` VALUES ('6', '颜色上色技巧（上）', null, 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f', '300', '3', '0', null, '2019-04-09 14:38:18', null, null, '1');
INSERT INTO `t_video` VALUES ('7', '颜色上色技巧（下）', null, 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f', '300', '3', '0', null, '2019-04-09 14:38:20', null, null, '1');
INSERT INTO `t_video` VALUES ('8', '酷丁鱼卡通形象设计（上）', null, 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f', '520', '3', '0', null, '2019-04-09 14:38:15', null, null, '1');
INSERT INTO `t_video` VALUES ('9', '酷丁鱼卡通形象设计（下）', null, 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f', '380', '3', '0', null, '2019-04-09 14:39:23', null, null, '1');
INSERT INTO `t_video` VALUES ('10', '可爱的玩偶制作教程', 'images/hot_video/hot1.png', 'http://vjs.zencdn.net/v/oceans.mp4', '380', '4', '1', '152', '2019-04-09 14:46:11', null, null, '1');
INSERT INTO `t_video` VALUES ('11', '编程几何的艺术魅力', 'images/hot_video/hot2.png', 'https://media.w3.org/2010/05/sintel/trailer.mp4', '520', '5', '1', '623', '2019-04-09 14:46:51', null, null, '1');
INSERT INTO `t_video` VALUES ('12', '如何提升孩子空间想象力', 'images/hot_video/hot3.png', 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4', '320', '5', '1', '451', '2019-04-09 14:48:15', null, null, '1');
INSERT INTO `t_video` VALUES ('13', '人工智能运算技术入门', 'images/hot_video/hot4.png', null, '300', '7', '1', '232', '2019-04-09 14:48:54', null, null, '1');
