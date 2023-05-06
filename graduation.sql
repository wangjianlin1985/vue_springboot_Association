/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : graduation

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 24/06/2020 16:01:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `team_id` bigint(0) DEFAULT NULL COMMENT '举办活动的社团id',
  `teamname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '社团名称',
  `activity_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动名称',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动地点',
  `money` int(0) DEFAULT NULL COMMENT '活动经费',
  `description` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动介绍',
  `summary` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动简介',
  `photos` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '活动图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (1, 1, '经济学院自强社', '成员招新', '2020-04-19 14:42:21', '华中科技大学中心操场', 200, '', '社团是一件衬衣，我就是其中一粒纽扣，扣紧纽扣，我便与社团融为一体，社团部就是这样一粒负责与社团进行沟通交流的纽扣，而这粒纽扣恰是一群爱逗爱闹的纽扣因子，快来加入我们吧!我们等你们!', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=801248963,898694810&fm=26&gp=0.jpg');
INSERT INTO `activity` VALUES (2, 1, '经济学院自强社', '自强杯演讲比赛', '2020-04-19 14:42:35', '大学生活动中心501', 1000, '在当代大学生生活条件变好、不用为生活花销发愁的背景下，为了响应学校“勤学好学自强自信”的号召，经济学院自强社决定举办以“自强奋斗”为主题的演讲比赛，同学们可以讲述自己的自强奋斗经历、拼搏精神，社员都可以通过联系社团管理者进行报名，比赛将角逐出3名获胜者，将获得由赞助商提供的大奖，比赛截止时间2020.4.20，请大家踊跃参加。', '自强演讲比赛活动报名', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=801248963,898694810&fm=26&gp=0.jpg');
INSERT INTO `activity` VALUES (3, 2, '青稞健身健美协会', '招新活动', '2020-04-19 14:42:45', '大学生活动中心502', 1001, '健美社团旨在聚集一群热爱健身，追求美丽体型的大学生，社团将定期举办讲座并举行健身实践活动，可以帮助有健身健美需求的大学生来进行有计划、科学的健身。社团多名成员都有多年健身经历，在健身方面卓有研究。招新活动将于2020年4.20日进行路演，招新活动4.30结束，请感兴趣的同学今早参与。', '健美社团招新活动', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586178625340&di=18ed900d27e62ec4a8d95f64a24b46fe&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fa8efce70565b3725a3469da406209920f7b0428316dfe-OAP1nM_fw658');
INSERT INTO `activity` VALUES (4, 3, '“华科之心”青年志愿者协会', '赴云南支教活动', '2020-04-19 14:43:12', '大学生活动中心503', 1002, '在西部，除少数地区外，教育资源配置严重不均衡，不但设施简陋，而且师资严重不足，这是制约西部教育发展的关键因素。师资不足，教育不兴，西部发展就缺少根基。学校计划在今年暑假组织一批赴云南大理的支教团队，现在招募队员30名。要求：品学兼优的大一至大四学生，在校期间无不良记录，热心助人即可。报名截止时间：4.30', '云南支教活动报名', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586266173995&di=0625d6bc4e9dc33dfc79a87affac02eb&imgtype=0&src=http%3A%2F%2Fsh.yuloo.com%2Fd%2Ffile%2Fit%2Fpmjc%2F2012-08-15%2F286c59a60639f5c02973134665d866b5.jpg');
INSERT INTO `activity` VALUES (5, 4, '华科电子竞技社团', '电竞比赛', '2020-04-19 14:43:33', '大学生活动中心501', 1000, '英雄联盟比赛将于4月20号举行，本次大赛邀请了武汉多个高校的电竞高级玩家，将进行一场史无前例的比赛，届时全武汉社会部分电竞玩家将作为评委参与此次竞赛，我们将筛选出3名获奖选手，送上神秘大奖，报名截止日期4.20日', '电竞比赛活动报名', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586266204330&di=f2b2d1b309aa50472573e361ee2b0157&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fbaike%2Fpic%2Fitem%2Fa50f4bfbfbedab64db5277b0fa36afc379311e99.jpg');
INSERT INTO `activity` VALUES (6, 5, '大学生书画协会', '书画赏析', '2020-04-19 14:43:34', '大学生活动中心504', 1000, '书画协会已经成立10周年，现将联合外联社举办10周年书画展览赏析活动，届时将展出本社成员优秀的书画作品。大会邀请了学校中文系的多名老师做评委工作，将选出优秀作品展出。本次活动将于4.20晚举行，由于场地有限，请参加活动者提前关注微信公众号领取入场门票，具体时间另行通过。', '大学生书画赏析展览', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586266498674&di=e846d659c5f2ba91b96130542dbf160d&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F44%2F18%2F18300542957368141862188316573_s.jpg');
INSERT INTO `activity` VALUES (7, 6, '大学生摄影协会', '摄影教学', '2020-04-19 14:43:40', '大学生活动中心503', 2000, '摄影协会致力于将摄影技巧推广大众，为那些热爱摄影但是学习无门并且学习太昂贵的学生提供教学。摄影协会现有5名社长副社长都再全国的摄影大赛获得过奖项，拥有丰富的摄影经验。4月10号将举行讲座，届时将邀请社长和外校的诸多摄影爱好者和大家进行交流。请于获得活动当日在现场领取活动入场券，欢迎所有摄影爱好者进场交流。', '摄影摄像集中教学', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905980810,2245448420&fm=26&gp=0.jpg');
INSERT INTO `activity` VALUES (8, 1, '经济学院自强社', '金融小课堂', '2020-05-01 18:21:41', '东九楼C302', 200, '1、开放式基金 ( open-end funds ) 指基金规模不是固定不变的，而是可以随时根据市场供求情况发行新份额或被投资人赎回的投资基金。\n\n2、封闭式基金 ( close-end funds ) 指基金规模在发行前已确定，在发行完毕后及规定的期限内，基金规模固定不变的投资基金。', '为同学们科普金融常识', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1588338199954&di=7b7033dcc24b30252ea5e0de8b892e07&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180523%2F38a39bb67d2443268075b5f6d4445549.jpg');

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `apply_from_id` bigint(0) DEFAULT NULL COMMENT '申请人id',
  `apply_username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '申请人姓名',
  `apply_to_id` bigint(0) DEFAULT NULL COMMENT '申请的社团id',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '申请理由',
  `create_time` datetime(0) DEFAULT NULL COMMENT '申请时间',
  `contact_way` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系方式',
  `is_pass` tinyint(0) DEFAULT 0 COMMENT '是否通过申请（0：等待处理 1：拒绝 2：通过）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES (1, 15, '任函硕', 1, '测试申请', '2020-04-14 16:26:37', 'qq:111236542', 0);
INSERT INTO `apply` VALUES (2, 15, '任函硕', 1, '测试申请', '2020-04-14 16:26:37', NULL, 1);
INSERT INTO `apply` VALUES (4, 12, '李昊阳', 4, '喜爱电竞，梦想成为电竞社的一员', '2020-04-21 01:28:00', 'QQ：11154124141', 0);
INSERT INTO `apply` VALUES (5, 12, '李昊阳', 5, '喜爱画画', '2020-04-21 01:28:32', '手机号：110212157411', 0);
INSERT INTO `apply` VALUES (6, 13, '贾珂', 5, '有极高的绘画天分！', '2020-04-21 01:33:03', '手机：1542123845', 2);
INSERT INTO `apply` VALUES (7, 14, '张泽楠', 6, '喜爱摄影，渴望成为社团协会的一员。', '2020-04-21 16:15:38', '无', 2);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `team_id` bigint(0) DEFAULT NULL COMMENT '社团id',
  `student_id` bigint(0) DEFAULT NULL COMMENT '留言的用户id',
  `student_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '留言的用户姓名',
  `avatar` int(0) DEFAULT NULL COMMENT '用户头像',
  `is_manager` tinyint(1) DEFAULT 0 COMMENT '是否是管理员',
  `content` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '留言内容',
  `support_count` int(0) DEFAULT NULL COMMENT '获得的赞的数量',
  `reply_count` int(0) DEFAULT NULL COMMENT '获得的回复的数量',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 1, 1, '张三', 1, 1, '这是一个非常优秀的社团，期待你的加入！', 4, 2, '2020-05-06 00:21:36');
INSERT INTO `comments` VALUES (2, 2, 10, '王含笑', 1, 0, '这个社团值得加入！', 0, 0, '2020-05-06 00:58:31');
INSERT INTO `comments` VALUES (3, 1, 10, '王含笑', 1, 0, '经济学院的学生可以加入试试哦！', 0, 2, '2020-05-07 16:55:27');
INSERT INTO `comments` VALUES (4, 1, 17, '张艺萌', 1, 0, '还不错', 0, 0, '2020-05-07 16:11:55');
INSERT INTO `comments` VALUES (5, 1, 17, '张艺萌', 1, 0, '还行', 1, 1, '2020-05-07 16:11:57');
INSERT INTO `comments` VALUES (6, 1, 17, '张艺萌', 1, 0, '测试', 0, 0, '2020-05-07 17:24:33');

-- ----------------------------
-- Table structure for create_team
-- ----------------------------
DROP TABLE IF EXISTS `create_team`;
CREATE TABLE `create_team`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `apply_from_id` bigint(0) NOT NULL COMMENT '申请人id',
  `apply_to_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '申请创建的社团名称',
  `team_type` tinyint(1) DEFAULT NULL COMMENT '社团类别',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '申请理由',
  `create_time` datetime(0) DEFAULT NULL COMMENT '申请时间',
  `contact_way` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系方式',
  `is_pass` tinyint(1) DEFAULT 0 COMMENT '是否通过该请求  0未处理  1拒绝 2通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of create_team
-- ----------------------------
INSERT INTO `create_team` VALUES (1, 21, '德绘建筑结构协会', 5, '锻炼自我、发展提高建筑结构实践能力', '2020-04-23 00:20:04', 'QQ:1110241254', 2);
INSERT INTO `create_team` VALUES (2, 13, 'cosplay联盟', 2, '为cos爱好者提供一个集中营', '2020-04-28 00:43:54', '手机：12541567123', 0);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `student_id` bigint(0) DEFAULT NULL COMMENT '回复的人的id',
  `student_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '回复的用户姓名',
  `avatar` int(0) DEFAULT NULL COMMENT '用户头像',
  `is_manager` tinyint(1) DEFAULT NULL COMMENT '是否是管理员',
  `content` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '回复的内容',
  `to_which` bigint(0) DEFAULT NULL COMMENT '针对的评论id',
  `support_count` int(0) DEFAULT NULL COMMENT '赞的数量',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '回复时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (1, 2, '张云夏', 3, 1, '同楼上', 1, 1, '2020-05-05 23:23:58');
INSERT INTO `reply` VALUES (2, 11, '张亚成', 1, 0, '赞同楼主', 1, 0, '2020-05-06 00:15:35');
INSERT INTO `reply` VALUES (3, 12, '李昊阳', 1, 0, '感谢分享', 3, 0, '2020-05-06 00:58:38');
INSERT INTO `reply` VALUES (4, 17, '张艺萌', 1, NULL, '感谢分享~！', 3, 0, '2020-05-07 16:52:22');
INSERT INTO `reply` VALUES (5, 15, '任函硕', 1, NULL, '感谢~', 5, 0, '2020-05-07 16:58:05');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `s_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `avatar` tinyint(0) DEFAULT 1 COMMENT '头像',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人简介',
  `is_manager` tinyint(1) DEFAULT 0 COMMENT '是否管理员(0不是  1是社长  2系统管理)',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(1) DEFAULT 0 COMMENT '性别（0男，1女）',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`, `s_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'U201610000', '张三', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 1, '12345678910', '1234567891@qq.com', 0, '2020-04-13 21:07:24');
INSERT INTO `student` VALUES (2, 'U201610001', '张云夏', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 3, '一个阳光女孩', 1, '12345678910', '1234567891@qq.com', 1, '2020-04-29 14:49:52');
INSERT INTO `student` VALUES (3, 'U201610002', '李超妍', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '积极向上', 1, '12345678910', '1234567891@qq.com', 2, '2020-04-29 14:50:11');
INSERT INTO `student` VALUES (4, 'U201610003', '蔡文秀', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '', 1, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:50:17');
INSERT INTO `student` VALUES (5, 'U201610004', '孙荣智', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '', 1, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:50:19');
INSERT INTO `student` VALUES (6, 'U201610005', '王沭椒', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '', 1, '12345678910', '1234567891@qq.com', 1, '2020-04-29 14:50:34');
INSERT INTO `student` VALUES (7, 'U201610006', '袭靓颖', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '', 1, '12345678910', '1234567891@qq.com', 1, '2020-04-29 14:50:39');
INSERT INTO `student` VALUES (8, 'U201610007', '李雪晴', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '', 1, '12345678910', '1234567891@qq.com', 1, '2020-04-29 14:50:41');
INSERT INTO `student` VALUES (9, 'U201610008', '蔡浩', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 1, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:45:36');
INSERT INTO `student` VALUES (10, 'U201610009', '王含笑', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光女孩', 0, '12345678910', '1234567891@qq.com', 1, '2020-05-05 23:50:02');
INSERT INTO `student` VALUES (11, 'U201610010', '张亚成', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 0, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:52:31');
INSERT INTO `student` VALUES (12, 'U201610011', '李昊阳', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 0, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:52:31');
INSERT INTO `student` VALUES (13, 'U201610012', '贾珂', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 0, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:51:39');
INSERT INTO `student` VALUES (14, 'U201610013', '张泽楠', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 0, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:51:40');
INSERT INTO `student` VALUES (15, 'U201610014', '任函硕', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 0, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:51:42');
INSERT INTO `student` VALUES (16, 'U201610015', '李雨坤', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 0, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:51:43');
INSERT INTO `student` VALUES (17, 'U201610016', '张艺萌', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '', 0, '12345678910', '1234567891@qq.com', 1, '2020-04-29 14:51:51');
INSERT INTO `student` VALUES (18, 'U201610017', '陈艺硕', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '', 0, '12345678910', '1234567891@qq.com', 1, '2020-04-29 14:51:55');
INSERT INTO `student` VALUES (19, 'U201610018', '张亚龙', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 0, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:51:57');
INSERT INTO `student` VALUES (20, 'U201610019', '陈泊钧', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 0, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:51:59');
INSERT INTO `student` VALUES (21, 'U201610020', '王嘉浩', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 1, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:52:16');
INSERT INTO `student` VALUES (22, 'U201610021', '张宇栋', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 0, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:52:02');
INSERT INTO `student` VALUES (23, 'U201610022', '李佳彤', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 0, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:51:00');
INSERT INTO `student` VALUES (24, 'admin', '管理员', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, '一个阳光男孩', 2, '12345678910', '1234567891@qq.com', 0, '2020-04-29 14:50:57');

-- ----------------------------
-- Table structure for student_login_log
-- ----------------------------
DROP TABLE IF EXISTS `student_login_log`;
CREATE TABLE `student_login_log`  (
  `id` bigint(0) NOT NULL COMMENT 'ID',
  `student_id` bigint(0) NOT NULL COMMENT '学生ID',
  `user_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '登录TOKEN',
  `create_time` datetime(0) NOT NULL COMMENT '登录时间',
  `oper_type` tinyint(1) NOT NULL COMMENT '操作类型：0-登录，1-登出',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录UserAgentInfo',
  `os_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'unknown' COMMENT '操作系统',
  `browser_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'unknown' COMMENT '浏览器信息'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_login_log
-- ----------------------------
INSERT INTO `student_login_log` VALUES (1249670018069745666, 1, '0', '2020-04-13 20:05:25', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249670075611402241, 1, '0', '2020-04-13 20:05:38', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249670143013867522, 1, '0', '2020-04-13 20:05:55', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249674278366879745, 1, '0', '2020-04-13 20:22:20', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249674311652876289, 1, '0', '2020-04-13 20:22:28', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249674444863971329, 1, '0', '2020-04-13 20:23:00', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249674737160822785, 1, '0', '2020-04-13 20:24:10', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249674883965657090, 1, '0', '2020-04-13 20:24:45', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249680536893403137, 1, '0', '2020-04-13 20:47:13', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249680661720084481, 1, '0', '2020-04-13 20:47:42', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249683625742446594, 14, '0', '2020-04-13 20:59:29', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249683885445361665, 14, '0', '2020-04-13 21:00:31', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1249686053103607810, 15, '0', '2020-04-13 21:09:08', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250065817723330561, 1, '0', '2020-04-14 22:18:11', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250404886437195778, 1, '0', '2020-04-15 20:45:31', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250415600170201090, 11, '0', '2020-04-15 21:28:05', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250795154848169988, 11, '0', '2020-04-16 22:36:18', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250795154848169986, 11, '0', '2020-04-16 22:36:18', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250795154848169987, 11, '0', '2020-04-16 22:36:18', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250795154848169990, 11, '0', '2020-04-16 22:36:18', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250795154848169985, 11, '0', '2020-04-16 22:36:18', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250795154848169989, 11, '0', '2020-04-16 22:36:18', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250795156874018818, 11, '0', '2020-04-16 22:36:19', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250796610611396609, 10, '0', '2020-04-16 22:42:05', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1250801599975018497, 1, '0', '2020-04-16 23:01:55', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1251057825149366273, 15, '0', '2020-04-17 16:00:04', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1251064281751916545, 1, '0', '2020-04-17 16:25:43', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252138707729883137, 11, '0', '2020-04-20 15:35:06', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252138922490830849, 11, '0', '2020-04-20 15:35:57', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252139232051437569, 11, '0', '2020-04-20 15:37:11', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252139749997649922, 11, '0', '2020-04-20 15:39:15', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252140120778248195, 11, '0', '2020-04-20 15:40:43', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252140120778248194, 11, '0', '2020-04-20 15:40:43', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252140122346917889, 11, '0', '2020-04-20 15:40:43', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252145813690298370, 11, '0', '2020-04-20 16:03:20', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252282762124095490, 11, '0', '2020-04-21 01:07:32', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252283370486919169, 1, '0', '2020-04-21 01:09:56', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252283406071394305, 1, '0', '2020-04-21 01:10:05', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252283513072283650, 1, '0', '2020-04-21 01:10:30', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252283564557365249, 1, '0', '2020-04-21 01:10:43', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252283684241829890, 1, '0', '2020-04-21 01:11:11', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252284078904864769, 1, '0', '2020-04-21 01:12:45', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252284121363804162, 1, '0', '2020-04-21 01:12:56', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252284471277809665, 1, '0', '2020-04-21 01:14:19', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252287619199430657, 1, '0', '2020-04-21 01:26:49', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252287766792794114, 1, '0', '2020-04-21 01:27:25', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252287789836300290, 12, '0', '2020-04-21 01:27:30', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252288099510153218, 12, '0', '2020-04-21 01:28:44', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252288122171977729, 4, '0', '2020-04-21 01:28:49', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252288999532388354, 4, '0', '2020-04-21 01:32:19', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252289034668072961, 13, '0', '2020-04-21 01:32:27', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252289201874001922, 13, '0', '2020-04-21 01:33:07', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252289226263879682, 5, '0', '2020-04-21 01:33:13', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252511097047523330, 12, '0', '2020-04-21 16:14:51', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252511165632782338, 12, '0', '2020-04-21 16:15:07', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252511189171216385, 14, '0', '2020-04-21 16:15:13', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252511342548525058, 14, '0', '2020-04-21 16:15:49', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252511402720010241, 6, '0', '2020-04-21 16:16:04', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252619083032072194, 6, '0', '2020-04-21 23:23:57', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252619122580164610, 14, '0', '2020-04-21 23:24:06', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252872801786884098, 14, '0', '2020-04-22 16:12:08', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252889999116955649, 21, '0', '2020-04-22 17:20:28', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252892907560595458, 21, '0', '2020-04-22 17:32:01', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252892975768367105, 21, '0', '2020-04-22 17:32:18', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252998637378613250, 21, '0', '2020-04-23 00:32:09', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1252998670270345217, 24, '0', '2020-04-23 00:32:17', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1253218920106639362, 24, '0', '2020-04-23 15:07:29', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1253218934933504001, 1, '0', '2020-04-23 15:07:32', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1253219166786240514, 1, '0', '2020-04-23 15:08:28', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1253219192665096194, 24, '0', '2020-04-23 15:08:34', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1253219500803833857, 24, '0', '2020-04-23 15:09:47', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1253219523734093825, 24, '0', '2020-04-23 15:09:53', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1253352819868581889, 24, '0', '2020-04-23 23:59:33', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1253352858720419841, 24, '0', '2020-04-23 23:59:42', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1254655244265070593, 24, '0', '2020-04-27 14:14:55', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1254655259251318785, 1, '0', '2020-04-27 14:14:59', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1254655388851118082, 1, '0', '2020-04-27 14:15:30', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1254655413001920514, 24, '0', '2020-04-27 14:15:35', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1254813103732830209, 24, '0', '2020-04-28 00:42:12', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1254813128743464961, 13, '0', '2020-04-28 00:42:18', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1254813549134360578, 13, '0', '2020-04-28 00:43:58', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1254813580797161474, 24, '0', '2020-04-28 00:44:06', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1254826631537655809, 24, '0', '2020-04-28 01:35:57', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1254826647257907201, 1, '0', '2020-04-28 01:36:01', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1255177256020602882, 1, '0', '2020-04-29 00:49:13', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1255387077462261761, 1, '2b809fc56300499f4b0a34bbcf623f8c', '2020-04-29 14:42:58', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1255387099796930562, 1, '0', '2020-04-29 14:43:03', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1255389561522089985, 1, 'f71c34e33b82b42f71327290fe2768ef', '2020-04-29 14:52:50', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1255389564395188225, 1, 'd62a9ceed27e8621fa774e06c18be5cf', '2020-04-29 14:52:51', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1255389802153504770, 1, '0', '2020-04-29 14:53:48', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1255389825159262209, 24, 'f4ae7d7e7d9b43fe3d568e5971c617ea', '2020-04-29 14:53:53', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1255903925639389185, 24, '0', '2020-05-01 00:56:44', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1255903942483714049, 1, '1a1f28936b433597c9454121a9d7a5cd', '2020-05-01 00:56:48', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256139694962397185, 1, '0', '2020-05-01 16:33:36', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256139805905932289, 16, '7bc2d75845f0408ee6183a4c8446caea', '2020-05-01 16:34:02', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256140277916127233, 16, '0', '2020-05-01 16:35:55', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256140297851654145, 13, '5ee8fbbc62f5bf66aced808af3b51133', '2020-05-01 16:36:00', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256140566542962689, 13, '0', '2020-05-01 16:37:04', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256140586365243393, 1, '5cd6ce9d7f2ea2964eb69a65301d2a49', '2020-05-01 16:37:08', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256140881879126017, 1, '0', '2020-05-01 16:38:19', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256140904184434690, 24, '5985a76f059de6487c9497ca3e8000a3', '2020-05-01 16:38:24', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256141022233120769, 24, '0', '2020-05-01 16:38:52', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256141034090418177, 1, '650a9d8a128e134253fc1cb12cae4d9f', '2020-05-01 16:38:55', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256141136045559809, 1, '0', '2020-05-01 16:39:19', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256141173794295809, 24, '10a7e57d9cf990f792e44ac78ce580f5', '2020-05-01 16:39:28', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256164747015913474, 24, '0', '2020-05-01 18:13:09', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1256164765189832706, 1, '78828595284f946c6d4f4aa0613d8851', '2020-05-01 18:13:13', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1257578531773231105, 1, '0', '2020-05-05 15:51:02', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1257578557912133634, 24, '1429bf3799f9d2f1e0230b0d8b6b3a0d', '2020-05-05 15:51:08', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258307088103309313, 24, '0', '2020-05-07 16:06:03', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258307128628674561, 17, '543901a0a1065fb116f429f2d5dbabaa', '2020-05-07 16:06:12', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258319588345544706, 17, '0', '2020-05-07 16:55:43', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258319631307800578, 15, '42c128fdc7a2d2f5c21ef52595774a71', '2020-05-07 16:55:53', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258320252870098946, 15, '0', '2020-05-07 16:58:21', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258320277394194434, 24, '9ae07b79d565b6aa6be35882abd241a8', '2020-05-07 16:58:27', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258330433624506369, 24, '0', '2020-05-07 17:38:49', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258330449487364098, 1, '50e6fad29a12c0b1790a6db49581c8d7', '2020-05-07 17:38:52', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258330632375795714, 1, '0', '2020-05-07 17:39:36', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258331579156037633, 13, 'c6437e9c817ad2bc33c2d99403342aba', '2020-05-07 17:43:22', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258331754062708738, 13, '0', '2020-05-07 17:44:03', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258331871243173890, 13, '9c16d8e35a344566e43aa2746d023c8d', '2020-05-07 17:44:31', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258332446403887106, 13, '0', '2020-05-07 17:46:49', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258332465383112706, 1, '926e99b1b9fa006ed776e7a284a0c7e4', '2020-05-07 17:46:53', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258332650456776706, 1, '0', '2020-05-07 17:47:37', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258332683029741569, 24, '3c64bec8ec6dc8e482ae83036ee2e4c6', '2020-05-07 17:47:45', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258333540299341826, 24, '0', '2020-05-07 17:51:09', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258333559853187074, 16, '315379b271bfec8731b9b76d6e549505', '2020-05-07 17:51:14', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258333815839948801, 16, '0', '2020-05-07 17:52:15', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1258333829114920962, 1, '9e9a71dce0cd0c23a2d68b444ab7193e', '2020-05-07 17:52:18', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260118702678929410, 1, '0', '2020-05-12 16:04:45', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260118735637770241, 19, 'f39603108242165d633fb5ec981f9076', '2020-05-12 16:04:53', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260138829323497474, 19, '0', '2020-05-12 17:24:44', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260138844259414017, 1, '4d79e08a3711b1f902291c5d6e6dd068', '2020-05-12 17:24:47', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260568107307626498, 1, '0', '2020-05-13 21:50:32', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260586916693274626, 1, '6b8ffb3ed3205a96be2f92003351d189', '2020-05-13 23:05:16', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260622334197362690, 1, '0', '2020-05-14 01:26:00', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260622357270228994, 13, '81d0126c67ec9c7ec45db707eeab67ef', '2020-05-14 01:26:06', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260793685944168449, 13, '0', '2020-05-14 12:46:54', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260793697847603201, 1, 'ba2ac9448a988d4ead37bd96fa663770', '2020-05-14 12:46:57', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260794335415365633, 1, '0', '2020-05-14 12:49:29', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260794356827287553, 24, '1a79b3b6d74788c7d511211a3fcaa64c', '2020-05-14 12:49:34', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260795160296550402, 24, '0', '2020-05-14 12:52:45', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260795173235978242, 1, '5a872d75a18c092ad8158a70173f1199', '2020-05-14 12:52:48', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260795565248212993, 1, '0', '2020-05-14 12:54:22', -1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');
INSERT INTO `student_login_log` VALUES (1260795588354633730, 24, 'e44bf900990e2291959741bf32b18f8d', '2020-05-14 12:54:27', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', 'Windows 10 or Windows Server 2016', 'Chrome');

-- ----------------------------
-- Table structure for team
-- ----------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '社团id',
  `teamname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `theme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '宗旨',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简介',
  `persons` int(0) DEFAULT 1 COMMENT '人数',
  `team_manager_id` bigint(0) DEFAULT NULL COMMENT '社长id',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `type` tinyint(1) DEFAULT NULL COMMENT '类别（1思想理论  2文艺体育  3就业创业  4公益服务 5学术科研  6网络信息）',
  `level` tinyint(1) DEFAULT 0 COMMENT '等级（1->5 每增加10人升星，10人2星）',
  `theme_img` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '社团主题图',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'QQ群或微信群',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team
-- ----------------------------
INSERT INTO `team` VALUES (1, '经济学院自强社', '传递社会关爱，锻造自强之才', '经济学院自强社是响应学校号召、与校自强社同时成立的。经院自强分社在校自强分社和经济学院院总支的共同领导下，本着贯彻自强精神的宗旨积极地为同学服务。社团任务：凝聚精神、奉献爱心、提高素质。通过自强社组织的系列活动，在经济学院广大学生中培养爱国、爱校、爱院的精神，形成科学的世界观、人生观、价值观，养成自立、自强、自信和勤俭节约的品格；培养学生的爱心和责任感，并鼓励学生以公益性活动的形式，积极参加爱心活动，投身实践、增长才干；关注经济困难学生的素质拓展，为学生素质提高提供机会。', 2, 1, '2020-04-21 16:14:00', 4, 1, 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=801248963,898694810&fm=26&gp=0.jpg', '手机号：15874564441');
INSERT INTO `team` VALUES (2, '青稞健身健美协会', '为在校大学生提供体育健身，提高专业技能，传播裁判知识，为大学生提供一个适应社会需求完善自我的平台。', '青稞健身健美协会是一个由一群热爱健身，热爱生活，热爱运动的华中科技大学的学生们组成的；是以培养学生的身体素质，为广大健身健美爱好者提供一个健身强体的平台，帮助同学在大学生活之余体验健身的乐趣，增进健康，促进交流，陶冶情操，共同进步。我们社团是一个为在校大学生提供体育健身性质的社团，一个为我校体育事业奉献自己力量的社团，一个旨在提高专业技能，传播裁判知识的专业学生社团，一个为大学生提供一个适应社会需求完善自我的平台，是一个融健身性.娱乐性.技能性为一体的非盈利性社团组织。\r\n     自成立以来，社团成员们的生活质量，身体素质都在稳步提高，结交了许许多多的朋友，这就是我们最简单的目的。', 1, 2, '2020-04-09 00:42:54', 2, 1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586178625340&di=18ed900d27e62ec4a8d95f64a24b46fe&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fa8efce70565b3725a3469da406209920f7b0428316dfe-OAP1nM_fw658', NULL);
INSERT INTO `team` VALUES (3, '“华科之心”青年志愿者协会', '爱心献社会,真情暖人心。', '立足于服务社会，发扬雷锋精神，“海洋之心”青年志愿者协会以有“海洋之心”的地方就有爱心为口号，以“自愿参加、量力而行、讲求实效、持之以恒”为行动必须遵循的基本原则来开展志愿者活动。每年我们都会组织参与许多有意义的志愿者活动，奉献爱心，分享快乐。\r\n\r\n   “雄关漫道真如铁，而今迈步从头越”，无论何时何地，“华科之心“的每个志愿者都会无私的献出自己的一份热情和爱心，我们继续努力，愿我们的汗水，带给大家真心的微笑。我们有共同而简单的梦想，做一个开开心心的志愿者——奉献爱心，分享快乐。', 1, 3, '2020-04-09 00:42:56', 4, 1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586266173995&di=0625d6bc4e9dc33dfc79a87affac02eb&imgtype=0&src=http%3A%2F%2Fsh.yuloo.com%2Fd%2Ffile%2Fit%2Fpmjc%2F2012-08-15%2F286c59a60639f5c02973134665d866b5.jpg', NULL);
INSERT INTO `team` VALUES (4, '华科电子竞技社团', '互助互爱、团队合作、创新求变、积极发展、勤奋锻炼、坚持不懈。', '发扬奥林匹克体育精神，借电子竞技锻炼社员的反应能力、思维能力、手脑协调能力、同时提高社员的团队意识、协作能力及人际交流能力，并通过比赛培养社员坚韧乐观的精神，丰富课余生活。', 1, 4, '2020-04-09 00:42:57', 6, 1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586266204330&di=f2b2d1b309aa50472573e361ee2b0157&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fbaike%2Fpic%2Fitem%2Fa50f4bfbfbedab64db5277b0fa36afc379311e99.jpg', NULL);
INSERT INTO `team` VALUES (5, '大学生书画协会', '弘扬中华书画艺术，繁荣校园传统文化', '大学生书画协会，由一群书画爱好者成立，初建于1984年，如今已经走过34载春秋岁月，是本校历史最悠久的社团。本协会的成立旨在传扬中华民族优秀的书法篆刻绘画剪纸等传统技艺，给有书法绘画等兴趣爱好的人提供渠道，相聚一堂办出有意义有内涵有深度的活动，丰富学校的人文气息，使安中医学子爱上书画等高雅的传统艺术，建设文艺校园。\r\n大学生书画协会，由一群书画爱好者成立，初建于1984年，如今已经走过34载春秋岁月，是本校历史最悠久的社团。本协会的成立旨在传扬中华民族优秀的书法篆刻绘画剪纸等传统技艺，给有书法绘画等兴趣爱好的人提供渠道，相聚一堂办出有意义有内涵有深度的活动，丰富学校的人文气息，使安中医学子爱上书画等高雅的传统艺术，建设文艺校园。\r\n大学生书画协会，由一群书画爱好者成立，初建于1984年，如今已经走过34载春秋岁月，是本校历史最悠久的社团。本协会的成立旨在传扬中华民族优秀的书法篆刻绘画剪纸等传统技艺，给有书法绘画等兴趣爱好的人提供渠道，相聚一堂办出有意义有内涵有深度的活动，丰富学校的人文气息，使安中医学子爱上书画等高雅的传统艺术，建设文艺校园。', 2, 5, '2020-04-21 16:14:04', 2, 1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586266498674&di=e846d659c5f2ba91b96130542dbf160d&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F44%2F18%2F18300542957368141862188316573_s.jpg', NULL);
INSERT INTO `team` VALUES (6, '大学生摄影协会', '我执，我爱，我摄影', '大学生摄影协会成立于1996年6月，是全校学生摄影爱好者的群众性组织。本协会有五个部门:办公室，宣传部，会员部，联络部，摄影部，模特部，每个部门之间相互协作，为协会的发展提供保障。大学生摄影协会以服务大学生为本，开办摄影知识讲座，户外采风等一系列活动，增长大家对摄影的了解，同时提供平台促进大学生互相交流与学习，提高摄影技巧和艺术水平，丰富校园文化。', 2, 6, '2020-04-09 00:43:00', 2, 1, 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905980810,2245448420&fm=26&gp=0.jpg', NULL);
INSERT INTO `team` VALUES (7, '大学生舞蹈协会', '为舞而生，以舞为乐，弘扬舞蹈文化', '大学舞蹈协会于2004年成立，在校团委的具体指导下开展工作，是我校最大舞蹈爱好者聚集的学生团体。校外积极参加各类文艺比赛，加强与其他学校之间的联系，曾获武汉大学生艺术节表演奖，参加中科大交流舞会，新华学院大学生舞蹈交流赛等。丰富学生课余生活的同时，也进一步向外展现我校学生的风采。', 1, 7, '2020-04-09 00:43:01', 2, 1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586184533098&di=66acb87365d7288157e7184f6ad11f00&imgtype=0&src=http%3A%2F%2Fimg.jk51.com%2Fimg_jk51%2F339507984.jpeg', NULL);
INSERT INTO `team` VALUES (8, '大学生足球协会', '脚下生风，我亦成风', '大学生足球协会，于2005年成立，在学校团委的具体指导下开展工作，是将我校足球爱好者齐聚在一起的学生团体，现有会员400余人。', 1, 8, '2020-04-09 00:43:02', 2, 1, 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1656171847,3749606226&fm=26&gp=0.jpg', NULL);
INSERT INTO `team` VALUES (9, '大学生创新创业协会', '创新创业，共建未来！', '协会是以为学生创业提供帮助为宗旨的公益性学生团体，是本校创业实践性质规模最大，实力最强的学生团体；协会为广大同学提供创新创业的大舞台，让同学们理论与实践相结合，提高并展示自己能力，锻炼并实现自己的创业梦想。创业协会下设办公室、传媒部、策划部、创新创业部四个职能部门并连续多年荣获“优秀社团”称号。', 1, 9, '2020-04-09 00:43:34', 3, 1, 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586184589776&di=baee1471db8d5566545576b270470393&imgtype=0&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D2209409554%2C3638620755%26fm%3D214%26gp%3D0.jpg', NULL);
INSERT INTO `team` VALUES (10, '德绘建筑结构协会', NULL, NULL, 1, 21, '2020-04-28 00:41:16', 5, 1, NULL, 'QQ:1110241254');

-- ----------------------------
-- Table structure for team_member
-- ----------------------------
DROP TABLE IF EXISTS `team_member`;
CREATE TABLE `team_member`  (
  `student_id` bigint(0) DEFAULT NULL COMMENT '学生id',
  `is_manager` tinyint(1) DEFAULT 0 COMMENT '是否是管理员：0不是 1是',
  `student_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学生姓名',
  `team_id` bigint(0) DEFAULT NULL COMMENT '社团id',
  `team_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '社团名称',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of team_member
-- ----------------------------
INSERT INTO `team_member` VALUES (1, 1, '张三', 1, '经济学院自强社', '2020-04-16 23:12:13');
INSERT INTO `team_member` VALUES (2, 1, '张云夏', 2, '青稞健身健美协会', '2020-05-01 00:11:08');
INSERT INTO `team_member` VALUES (3, 1, '李超妍', 3, '“华科之心”青年志愿者协会', '2020-05-01 00:11:11');
INSERT INTO `team_member` VALUES (4, 1, '蔡文秀', 4, '华科电子竞技社团', '2020-05-01 00:11:15');
INSERT INTO `team_member` VALUES (5, 1, '孙荣智', 5, '大学生书画协会', '2020-05-01 00:11:19');
INSERT INTO `team_member` VALUES (6, 1, '王沭椒', 6, '大学生摄影协会', '2020-05-01 00:11:23');
INSERT INTO `team_member` VALUES (7, 1, '袭靓颖', 7, '大学生舞蹈协会', '2020-05-01 00:11:27');
INSERT INTO `team_member` VALUES (8, 1, '李雪晴', 8, '大学生足球协会', '2020-05-01 00:11:31');
INSERT INTO `team_member` VALUES (9, 1, '蔡浩', 9, '大学生创新创业协会', '2020-05-01 00:11:36');
INSERT INTO `team_member` VALUES (15, 0, '任函硕', 1, '经济学院自强社', '2020-04-29 14:51:26');
INSERT INTO `team_member` VALUES (13, 0, '贾珂', 5, '大学生书画协会', '2020-04-29 14:51:31');
INSERT INTO `team_member` VALUES (14, 0, '张泽楠', 6, '大学生摄影协会', '2020-04-29 14:54:48');

SET FOREIGN_KEY_CHECKS = 1;
