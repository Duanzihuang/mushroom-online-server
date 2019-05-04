/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库连接
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mushroom_online

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-04-30 09:57:24
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
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_carousel
-- ----------------------------
INSERT INTO `t_carousel` VALUES ('1', 'images/carousel/banner_01.jpg', null, '2019-04-02 11:58:18', null, null, '1');
INSERT INTO `t_carousel` VALUES ('2', 'images/carousel/banner_02.jpg', null, '2019-04-02 11:59:20', null, null, '1');
INSERT INTO `t_carousel` VALUES ('3', 'images/carousel/banner_03.jpg', null, '2019-04-02 11:59:47', null, null, '1');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `good` tinyint(4) DEFAULT '0' COMMENT '0 不点赞  1 点赞',
  `comment_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效  1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '3', '0', '7', '4', '老师讲解的不错，孩子很喜欢！', '0', '2019-04-09 12:35:13', '1');
INSERT INTO `t_comment` VALUES ('2', '3', '0', '8', '4', '看过才知道自己哪里不行，贵在坚持，感谢老师！', '0', '2019-04-09 12:37:02', '1');
INSERT INTO `t_comment` VALUES ('3', '3', '0', '9', '3', '666666', '0', '2019-04-09 12:37:23', '1');

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
  `audience` varchar(50) DEFAULT NULL,
  `introduction` varchar(200) DEFAULT NULL,
  `level` int(11) DEFAULT '1' COMMENT '1 初级 2 中级 3高级',
  `class_hour` int(11) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `study_count` int(11) DEFAULT NULL,
  `is_recommend` tinyint(4) DEFAULT '0' COMMENT '0 不推荐  1推荐',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1 有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '逻辑思维训练', '提升思考的能力', 'images/course/course1.png', '', null, null, '1', '15', null, null, null, '0', '2019-04-04 21:33:45', null, null, '1');
INSERT INTO `t_course` VALUES ('2', 'Scratch编程启蒙', 'MIT研发的编程工具', 'images/course/course2.png', null, null, null, '2', '10', null, null, null, '0', '2019-04-04 21:37:35', null, null, '1');
INSERT INTO `t_course` VALUES ('3', '创意手绘班', '轻松入门手绘', 'images/course/course3.png', 'images/course/course3_cover_image.png', null, '本课程面向零基础的绘画爱好者，适合6~12岁儿童学习，只要您的孩子对画画感兴趣就可以迅速上手，提升孩子审美~', '3', '12', '259.00', '4', '1524', '0', '2019-04-04 21:38:09', null, null, '1');
INSERT INTO `t_course` VALUES ('4', '少儿编程入门全集', '从小学习编程是时代趋势', 'images/course/course4.png', null, null, null, '1', '12', null, null, null, '0', '2019-04-04 21:38:43', null, null, '1');
INSERT INTO `t_course` VALUES ('5', '一分钟童趣简笔画', '简单又好看的简笔画', 'images/course/course5.png', null, null, null, '3', '10', null, null, null, '0', '2019-04-04 21:39:21', null, null, '1');
INSERT INTO `t_course` VALUES ('6', '经典儿童故事', '提升语言表达能力', 'images/course/course6.png', null, null, null, '2', '10', null, null, null, '0', '2019-04-04 21:39:55', null, null, '1');
INSERT INTO `t_course` VALUES ('7', '创意图形绘制', '锻炼思维逻辑能力', 'images/course/course7.png', null, null, null, '1', '15', null, null, null, '0', '2019-04-04 21:40:31', null, null, '1');
INSERT INTO `t_course` VALUES ('8', '爱编程的艺术家', '艺术和代码的碰撞', 'images/course/course8.png', null, null, null, '3', '12', null, null, null, '0', '2019-04-04 21:41:03', null, null, '1');
INSERT INTO `t_course` VALUES ('9', '零基础入门水彩', '奇妙水彩之旅', 'images/course/course9.png', null, null, null, '1', '10', null, null, null, '0', '2019-04-04 21:41:33', null, null, '1');
INSERT INTO `t_course` VALUES ('10', 'POP插画教程', '好玩有趣的字体', 'images/course/course10.png', null, null, null, '1', '15', null, null, null, '0', '2019-04-04 21:42:01', null, null, '1');
INSERT INTO `t_course` VALUES ('11', '玩转神奇魔方', '成就最强大脑', 'images/course/course11.png', null, null, null, '2', '12', null, null, null, '0', '2019-04-04 21:42:32', null, null, '1');
INSERT INTO `t_course` VALUES ('12', '从零开始学漫画', '丰富孩子内心生活', 'images/course/course12.png', null, null, null, '1', '10', null, null, null, '0', '2019-04-04 21:42:55', null, null, '1');
INSERT INTO `t_course` VALUES ('13', '创意手绘', null, 'images/recommend/recommend1.png', null, '适合3~6岁人群', null, '1', null, null, null, null, '1', '2019-04-09 21:23:18', null, null, '1');
INSERT INTO `t_course` VALUES ('14', '简笔画教程', null, 'images/recommend/recommend2.png', null, '适合6~12岁人群', null, '1', null, null, null, null, '1', '2019-04-09 21:23:12', null, null, '1');
INSERT INTO `t_course` VALUES ('15', '编程入门', null, 'images/recommend/recommend3.png', null, '适合15~20岁人群\n', null, '1', null, null, null, null, '1', '2019-04-09 21:23:15', null, null, '1');
INSERT INTO `t_course` VALUES ('16', '创意图形绘制', null, 'images/recommend/recommend4.png', null, '适合12~15岁人群', null, '1', null, null, null, null, '1', '2019-04-09 21:24:34', null, null, '1');
INSERT INTO `t_course` VALUES ('17', '速写班', null, null, null, '适合12~15岁人群', null, '1', null, null, null, null, '2', '2019-04-09 21:25:10', null, null, '1');

-- ----------------------------
-- Table structure for `t_follow`
-- ----------------------------
DROP TABLE IF EXISTS `t_follow`;
CREATE TABLE `t_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效  1 有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_follow
-- ----------------------------
INSERT INTO `t_follow` VALUES ('1', '6', '1', '1');
INSERT INTO `t_follow` VALUES ('2', '6', '2', '1');
INSERT INTO `t_follow` VALUES ('3', '6', '3', '1');

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
INSERT INTO `t_lecturer` VALUES ('1', '张老师', 'images/lecturer/lecturer1.jpg', '多年教育与开发经验，专注少儿编程课程开发，侧重培养学生专注力和分析解决问题的能力，语言风趣，授课思路清晰，通俗易懂。', '2546', '3', '2019-04-09 12:40:08', null, null, '1');
INSERT INTO `t_lecturer` VALUES ('2', '王老师', 'images/lecturer/lecturer1.jpg', '多年教育与开发经验，专注少儿编程课程开发，侧重培养学生专注力和分析解决问题的能力，语言风趣，授课思路清晰，通俗易懂。', '1818', '4', '2019-04-20 11:28:44', null, null, '1');
INSERT INTO `t_lecturer` VALUES ('3', '李老师', 'images/lecturer/lecturer1.jpg', '多年教育与开发经验，专注少儿编程课程开发，侧重培养学生专注力和分析解决问题的能力，语言风趣，授课思路清晰，通俗易懂。', '2000', '5', '2019-04-20 11:30:07', null, null, '1');

-- ----------------------------
-- Table structure for `t_study`
-- ----------------------------
DROP TABLE IF EXISTS `t_study`;
CREATE TABLE `t_study` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `study_hour` tinyint(4) DEFAULT NULL,
  `study_progress` float(5,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_study
-- ----------------------------
INSERT INTO `t_study` VALUES ('1', '6', '1', '5', '33.00', '1');
INSERT INTO `t_study` VALUES ('2', '6', '2', '3', '30.00', '1');
INSERT INTO `t_study` VALUES ('3', '6', '3', '6', '50.00', '1');
INSERT INTO `t_study` VALUES ('4', '6', '4', '8', '67.00', '1');
INSERT INTO `t_study` VALUES ('5', '6', '5', '1', '10.00', '1');

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
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效  1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', null, null, null, null, '1', null, 'opMsQ0V3DHWIAv-PHa8S_1UG7x9I', 'xNMJEHm/9G5KuD1dt1AmzQ==', null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('5', null, '14786920926', null, null, '1', null, null, null, null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('6', '酷小鱼', '17704051019', null, 'images/my/avatar1.png', '1', null, null, null, null, '2019-04-14 20:06:58', null, null, '1');
INSERT INTO `t_user` VALUES ('7', '李妈妈', '15871239087', null, 'images/my/avatar2.png', '1', null, null, null, null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('8', '巴啦啦', '17704051012', null, 'images/my/avatar3.png', '1', null, null, null, null, null, null, null, '1');
INSERT INTO `t_user` VALUES ('9', '小兔牙', '17704051010', null, 'images/my/avatar4.png', '1', null, null, null, null, '2019-04-14 20:20:58', null, null, '1');

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
  `is_study` tinyint(4) DEFAULT '0' COMMENT '0 未学习 1 已学习',
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
INSERT INTO `t_video` VALUES ('1', '绘画课程使用画具购买建议', null, null, '600', '0', '3', '0', null, '2019-04-09 12:50:31', null, null, '1');
INSERT INTO `t_video` VALUES ('2', '掌握线条绘制的方法', null, null, '400', '0', '3', '0', null, '2019-04-09 12:58:33', null, null, '1');
INSERT INTO `t_video` VALUES ('3', '认识常见的绘画造型', null, null, '500', '0', '3', '0', null, '2019-04-09 12:58:36', null, null, '1');
INSERT INTO `t_video` VALUES ('4', 'Q版人物结构绘制（上）', null, null, '320', '0', '3', '0', null, '2019-04-09 14:35:11', null, null, '1');
INSERT INTO `t_video` VALUES ('5', 'Q版人物结构绘制（下）', null, null, '520', '0', '3', '0', null, '2019-04-09 14:35:47', null, null, '1');
INSERT INTO `t_video` VALUES ('6', '颜色上色技巧（上）', null, null, '300', '0', '3', '0', null, '2019-04-09 14:38:18', null, null, '1');
INSERT INTO `t_video` VALUES ('7', '颜色上色技巧（下）', null, null, '300', '0', '3', '0', null, '2019-04-09 14:38:20', null, null, '1');
INSERT INTO `t_video` VALUES ('8', '酷丁鱼卡通形象设计（上）', null, null, '520', '0', '3', '0', null, '2019-04-09 14:38:15', null, null, '1');
INSERT INTO `t_video` VALUES ('9', '酷丁鱼卡通形象设计（下）', null, null, '380', '0', '3', '0', null, '2019-04-09 14:39:23', null, null, '1');
INSERT INTO `t_video` VALUES ('10', '可爱的玩偶制作教程', 'images/hot_video/hot1.png', null, '380', '0', '4', '1', '152', '2019-04-09 14:46:11', null, null, '1');
INSERT INTO `t_video` VALUES ('11', '编程几何的艺术魅力', 'images/hot_video/hot2.png', null, '520', '0', '5', '1', '623', '2019-04-09 14:46:51', null, null, '1');
INSERT INTO `t_video` VALUES ('12', '如何提升孩子空间想象力', 'images/hot_video/hot3.png', null, '320', '0', '6', '1', '451', '2019-04-09 14:48:15', null, null, '1');
INSERT INTO `t_video` VALUES ('13', '人工智能运算技术入门', 'images/hot_video/hot4.png', null, '300', '0', '7', '1', '232', '2019-04-09 14:48:54', null, null, '1');
