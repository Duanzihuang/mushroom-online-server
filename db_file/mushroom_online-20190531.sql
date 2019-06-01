# Host: localhost  (Version: 5.5.53)
# Date: 2019-05-31 00:07:21
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "t_appkey"
#

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

#
# Data for table "t_appkey"
#

/*!40000 ALTER TABLE `t_appkey` DISABLE KEYS */;
INSERT INTO `t_appkey` VALUES (1,'9c5e951051dc11e9a59e8fa81c3ea1a3',NULL,'13812345678',NULL,NULL,NULL,NULL,1),(2,'79541b50522a11e98bce831b227fad88',NULL,'13812346666',NULL,NULL,NULL,NULL,1),(3,'f2199e20522a11e9b07c29c8211fe7a3',NULL,'13812347777',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `t_appkey` ENABLE KEYS */;

#
# Structure for table "t_carousel"
#

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

#
# Data for table "t_carousel"
#

/*!40000 ALTER TABLE `t_carousel` DISABLE KEYS */;
INSERT INTO `t_carousel` VALUES (1,'images/carousel/banner_01.png',NULL,3,'2019-04-02 11:58:18',NULL,NULL,1),(2,'images/carousel/banner_02.png',NULL,4,'2019-04-02 11:59:20',NULL,NULL,1),(3,'images/carousel/banner_03.png',NULL,5,'2019-04-02 11:59:47',NULL,NULL,1);
/*!40000 ALTER TABLE `t_carousel` ENABLE KEYS */;

#
# Structure for table "t_comment"
#

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "t_comment"
#

/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;
INSERT INTO `t_comment` VALUES (1,3,0,7,4,'老师讲解的不错，孩子很喜欢！',2,'2019-04-09 12:35:13',1),(2,3,0,8,4,'看过才知道自己哪里不行，贵在坚持，感谢老师！',2,'2019-04-09 12:37:02',1),(3,3,0,9,3,'666666',1,'2019-04-09 12:37:23',1),(4,3,NULL,6,3,'这个课程还行哦',1,'2019-05-13 17:38:11',1);
/*!40000 ALTER TABLE `t_comment` ENABLE KEYS */;

#
# Structure for table "t_course"
#

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

#
# Data for table "t_course"
#

/*!40000 ALTER TABLE `t_course` DISABLE KEYS */;
INSERT INTO `t_course` VALUES (1,'逻辑思维训练','提升思考的能力','images/course/course1.png','images/course/course3_cover_image.png','http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f',NULL,'逻辑思维训练，提高您孩子的逻辑思维',1,15,180.00,3,686,0,NULL,'2019-04-04 21:33:45',NULL,NULL,1),(2,'Scratch编程启蒙','MIT研发的编程工具','images/course/course2.png','images/course/course3_cover_image.png','http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',NULL,'Scratch编程启蒙，这个课程很好',2,10,200.00,5,1123,0,NULL,'2019-04-04 21:37:35',NULL,NULL,1),(3,'创意手绘班','轻松入门手绘','images/course/course3.png','images/course/course3_cover_image.png','http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f',NULL,'本课程面向零基础的绘画爱好者，适合6~12岁儿童学习，只要您的孩子对画画感兴趣就可以迅速上手，提升孩子审美~',3,3840,259.00,4,1524,0,NULL,'2019-04-04 21:38:09',NULL,NULL,1),(4,'少儿编程入门全集','从小学习编程是时代趋势','images/course/course4.png','images/course/course3_cover_image.png','https://media.w3.org/2010/05/sintel/trailer.mp4',NULL,'少儿编程入门全集，从小学习编程是时代趋势',1,12,320.00,3,580,0,NULL,'2019-04-04 21:38:43',NULL,NULL,1),(5,'一分钟童趣简笔画','简单又好看的简笔画','images/course/course5.png','images/course/course3_cover_image.png','http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f',NULL,'一分钟童趣简笔画，简单又好看的简笔画',3,10,598.00,4,1208,0,NULL,'2019-04-04 21:39:21',NULL,NULL,1),(6,'经典儿童故事','提升语言表达能力','images/course/course6.png','images/course/course3_cover_image.png','http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',NULL,'经典儿童故事，提升语言表达能力',2,10,118.00,5,289,0,NULL,'2019-04-04 21:39:55',NULL,NULL,1),(7,'创意图形绘制','锻炼思维逻辑能力','images/course/course7.png','images/course/course3_cover_image.png','http://vjs.zencdn.net/v/oceans.mp4',NULL,'创意图形绘制，锻炼思维逻辑能力',1,15,128.00,2,688,0,NULL,'2019-04-04 21:40:31',NULL,NULL,1),(8,'爱编程的艺术家','艺术和代码的碰撞','images/course/course8.png','images/course/course3_cover_image.png','https://media.w3.org/2010/05/sintel/trailer.mp4',NULL,'爱编程的艺术家，艺术和代码的碰撞',3,12,388.00,4,285,0,NULL,'2019-04-04 21:41:03',NULL,NULL,1),(9,'零基础入门水彩','奇妙水彩之旅','images/course/course9.png','images/course/course3_cover_image.png','http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f',NULL,'零基础入门水彩，奇妙水彩之旅',1,10,466.00,5,268,0,NULL,'2019-04-04 21:41:33',NULL,NULL,1),(10,'POP插画教程','好玩有趣的字体','images/course/course10.png','images/course/course3_cover_image.png','http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',NULL,'POP插画教程，好玩有趣的字体',1,15,198.00,3,186,0,NULL,'2019-04-04 21:42:01',NULL,NULL,1),(11,'玩转神奇魔方','成就最强大脑','images/course/course11.png','images/course/course3_cover_image.png','http://vjs.zencdn.net/v/oceans.mp4',NULL,'玩转神奇魔方，成就最强大脑',2,12,318.00,4,300,0,NULL,'2019-04-04 21:42:32',NULL,NULL,1),(12,'从零开始学漫画','丰富孩子内心生活','images/course/course12.png','images/course/course3_cover_image.png','https://media.w3.org/2010/05/sintel/trailer.mp4',NULL,'从零开始学漫画，丰富孩子内心生活',1,10,300.00,5,200,0,NULL,'2019-04-04 21:42:55',NULL,NULL,1),(13,'创意手绘',NULL,'images/recommend/recommend1.png',NULL,'','适合3~6岁人群',NULL,1,NULL,NULL,NULL,NULL,1,3,'2019-04-09 21:23:18',NULL,NULL,1),(14,'简笔画教程',NULL,'images/recommend/recommend2.png',NULL,'','适合6~12岁人群',NULL,1,NULL,NULL,NULL,NULL,1,4,'2019-04-09 21:23:12',NULL,NULL,1),(15,'编程入门',NULL,'images/recommend/recommend3.png',NULL,'','适合15~20岁人群\n',NULL,1,NULL,NULL,NULL,NULL,1,5,'2019-04-09 21:23:15',NULL,NULL,1),(16,'创意图形绘制',NULL,'images/recommend/recommend4.png',NULL,'','适合12~15岁人群',NULL,1,NULL,NULL,NULL,NULL,1,6,'2019-04-09 21:24:34',NULL,NULL,1);
/*!40000 ALTER TABLE `t_course` ENABLE KEYS */;

#
# Structure for table "t_follow"
#

DROP TABLE IF EXISTS `t_follow`;
CREATE TABLE `t_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `is_follow` tinyint(4) DEFAULT '0' COMMENT '0 未关注  1 已关注',
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效  1 有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "t_follow"
#

/*!40000 ALTER TABLE `t_follow` DISABLE KEYS */;
INSERT INTO `t_follow` VALUES (1,6,1,0,1),(2,6,2,0,1),(3,6,3,0,1);
/*!40000 ALTER TABLE `t_follow` ENABLE KEYS */;

#
# Structure for table "t_lecturer"
#

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

#
# Data for table "t_lecturer"
#

/*!40000 ALTER TABLE `t_lecturer` DISABLE KEYS */;
INSERT INTO `t_lecturer` VALUES (1,'张老师','images/lecturer/lecturer1.png','多年教育与开发经验，专注少儿编程课程开发，侧重培养学生专注力和分析解决问题的能力，语言风趣，授课思路清晰，通俗易懂。',2546,3,'2019-04-09 12:40:08',NULL,NULL,1),(2,'王老师','images/lecturer/lecturer1.png','多年教育与开发经验，专注少儿编程课程开发，侧重培养学生专注力和分析解决问题的能力，语言风趣，授课思路清晰，通俗易懂。',1818,4,'2019-04-20 11:28:44',NULL,NULL,1),(3,'李老师','images/lecturer/lecturer1.png','多年教育与开发经验，专注少儿编程课程开发，侧重培养学生专注力和分析解决问题的能力，语言风趣，授课思路清晰，通俗易懂。',2000,5,'2019-04-20 11:30:07',NULL,NULL,1);
/*!40000 ALTER TABLE `t_lecturer` ENABLE KEYS */;

#
# Structure for table "t_order"
#

DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "t_order"
#

/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
INSERT INTO `t_order` VALUES (6,4,6,259.00,1,1,'2019-05-07 10:00:15',NULL,NULL,1),(7,4,1,259.00,1,1,'2019-05-06 10:00:18',NULL,NULL,1),(8,3,6,259.00,1,1,'2019-05-07 10:27:20','2019-05-07 11:52:46',NULL,1),(9,3,1,259.00,1,1,'2019-05-07 11:44:24','2019-05-07 11:44:24',NULL,1),(10,5,1,100.00,1,1,'2019-05-10 12:43:17','2019-05-10 12:46:29',NULL,1);
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;

#
# Structure for table "t_study_progress"
#

DROP TABLE IF EXISTS `t_study_progress`;
CREATE TABLE `t_study_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `study_hour` tinyint(4) DEFAULT '0' COMMENT '已学习小节数',
  `total_hour` tinyint(4) DEFAULT '0' COMMENT '课程的总节数',
  `study_progress` float(5,2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "t_study_progress"
#

/*!40000 ALTER TABLE `t_study_progress` DISABLE KEYS */;
INSERT INTO `t_study_progress` VALUES (1,6,1,3,10,30.00,1),(2,6,2,1,8,13.00,1),(3,6,3,4,9,47.00,1),(4,6,4,2,8,50.00,1),(5,6,5,4,5,80.00,1);
/*!40000 ALTER TABLE `t_study_progress` ENABLE KEYS */;

#
# Structure for table "t_study_video"
#

DROP TABLE IF EXISTS `t_study_video`;
CREATE TABLE `t_study_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `is_study` tinyint(4) DEFAULT '0' COMMENT '0：未学习  1：已学习',
  `status` tinyint(4) DEFAULT '1' COMMENT '0 无效 1 有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "t_study_video"
#

/*!40000 ALTER TABLE `t_study_video` DISABLE KEYS */;
INSERT INTO `t_study_video` VALUES (1,6,1,1,1),(2,6,2,1,1),(3,6,3,1,1),(4,6,4,1,1);
/*!40000 ALTER TABLE `t_study_video` ENABLE KEYS */;

#
# Structure for table "t_user"
#

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "t_user"
#

/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'黄Sir',NULL,NULL,'https://wx.qlogo.cn/mmopen/vi_32/bd4Y76AsHvkpMA1Vu558WOqE9o8y2zgUvDibM557S30o7Ks6lrelianjDibDY3ysSTryf1eaaVEoRDAneBv1puq2g/132',1,NULL,'opMsQ0V3DHWIAv-PHa8S_1UG7x9I','QB9wqfrv02SOf/1czIhqRg==',NULL,NULL,NULL,NULL,0,1),(5,NULL,'',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1),(6,'酷小鱼','17704051019',NULL,'images/my/avatar1.png',1,NULL,NULL,NULL,NULL,'2019-04-14 20:06:58',NULL,NULL,1,1),(7,'李妈妈','15871239087',NULL,'images/my/avatar2.png',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(8,'巴啦啦','17704051012',NULL,'images/my/avatar3.png',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),(9,'小兔牙','17704051010',NULL,'images/my/avatar4.png',1,NULL,NULL,NULL,NULL,'2019-04-14 20:20:58',NULL,NULL,1,1);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

#
# Structure for table "t_video"
#

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

#
# Data for table "t_video"
#

/*!40000 ALTER TABLE `t_video` DISABLE KEYS */;
INSERT INTO `t_video` VALUES (1,'绘画课程使用画具购买建议',NULL,'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f',600,3,0,NULL,'2019-04-09 12:50:31',NULL,NULL,1),(2,'掌握线条绘制的方法',NULL,'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',400,3,0,NULL,'2019-04-09 12:58:33',NULL,NULL,1),(3,'认识常见的绘画造型',NULL,'http://vjs.zencdn.net/v/oceans.mp4',500,3,0,NULL,'2019-04-09 12:58:36',NULL,NULL,1),(4,'Q版人物结构绘制（上）',NULL,'https://media.w3.org/2010/05/sintel/trailer.mp4',320,3,0,NULL,'2019-04-09 14:35:11',NULL,NULL,1),(5,'Q版人物结构绘制（下）',NULL,'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f',520,3,0,NULL,'2019-04-09 14:35:47',NULL,NULL,1),(6,'颜色上色技巧（上）',NULL,'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f',300,3,0,NULL,'2019-04-09 14:38:18',NULL,NULL,1),(7,'颜色上色技巧（下）',NULL,'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f',300,3,0,NULL,'2019-04-09 14:38:20',NULL,NULL,1),(8,'酷丁鱼卡通形象设计（上）',NULL,'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f',520,3,0,NULL,'2019-04-09 14:38:15',NULL,NULL,1),(9,'酷丁鱼卡通形象设计（下）',NULL,'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400&bizid=1023&hy=SH&fileparam=302c020101042530230204136f',380,3,0,NULL,'2019-04-09 14:39:23',NULL,NULL,1),(10,'可爱的玩偶制作教程','images/hot_video/hot1.png',NULL,380,4,1,152,'2019-04-09 14:46:11',NULL,NULL,1),(11,'编程几何的艺术魅力','images/hot_video/hot2.png',NULL,520,5,1,623,'2019-04-09 14:46:51',NULL,NULL,1),(12,'如何提升孩子空间想象力','images/hot_video/hot3.png',NULL,320,6,1,451,'2019-04-09 14:48:15',NULL,NULL,1),(13,'人工智能运算技术入门','images/hot_video/hot4.png',NULL,300,7,1,232,'2019-04-09 14:48:54',NULL,NULL,1);
/*!40000 ALTER TABLE `t_video` ENABLE KEYS */;
