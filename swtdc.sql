/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : swtdc

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 21/05/2019 21:48:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pinglun
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` int(11) NULL DEFAULT NULL,
  `plnr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plsj` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES (4, 11, '默认好评', 'ht', '2018-03-16 14:59:04', '22');
INSERT INTO `pinglun` VALUES (9, 16, '很好吃', 'nby', '2018-03-16 21:12:34', '23');
INSERT INTO `pinglun` VALUES (10, 15, '默认好评', 'nby', '2018-03-16 21:12:34', '23');

-- ----------------------------
-- Table structure for shanghu
-- ----------------------------
DROP TABLE IF EXISTS `shanghu`;
CREATE TABLE `shanghu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shanghu
-- ----------------------------
INSERT INTO `shanghu` VALUES (2, 'sh002', '123456', '赣南人家酒楼', '/upload/1519734537992.jpg', '18388588858');
INSERT INTO `shanghu` VALUES (3, 'sh001', '123456', '杨铭宇黄焖鸡米饭', '/upload/1519655505926.jpg', '15585858885');
INSERT INTO `shanghu` VALUES (4, 'sh003', '123456', '汤城小厨', '/upload/1519734415794.jpeg', '19655855854');

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `userId` int(11) NOT NULL DEFAULT 0,
  `userName` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPw` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', 'root123456');

-- ----------------------------
-- Table structure for t_catelog
-- ----------------------------
DROP TABLE IF EXISTS `t_catelog`;
CREATE TABLE `t_catelog`  (
  `catelog_id` int(11) NOT NULL DEFAULT 0,
  `catelog_name` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `catelog_miaoshu` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `catelog_del` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`catelog_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_catelog
-- ----------------------------
INSERT INTO `t_catelog` VALUES (2, '热菜', '热菜', 'no', 0);
INSERT INTO `t_catelog` VALUES (3, '凉菜', '凉菜', 'no', 0);
INSERT INTO `t_catelog` VALUES (4, '汤羹', '汤羹', 'no', 0);
INSERT INTO `t_catelog` VALUES (5, '酒水饮料', '酒水饮料', 'no', 0);

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods`  (
  `goods_id` int(11) NOT NULL DEFAULT 0,
  `goods_name` varchar(1800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_miaoshu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `goods_pic` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_yanse` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_shichangjia` int(11) NULL DEFAULT NULL,
  `goods_tejia` int(11) NULL DEFAULT NULL,
  `goods_isnottejia` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_isnottuijian` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_catelog_id` int(11) NULL DEFAULT NULL,
  `goods_del` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kucun` int(11) NULL DEFAULT NULL,
  `shid` int(11) NULL DEFAULT NULL,
  `goodsCatelogName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES (13, '干锅有机花菜', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: 700; white-space: nowrap; background-color: rgb(250, 250, 250);\">干锅有机花菜</span>', '/upload/1519734672389.jpg', NULL, 15, NULL, 'no', NULL, 2, 'no', 0, 2, NULL);
INSERT INTO `t_goods` VALUES (14, '乡村烧土鸡', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: 700; white-space: nowrap;\">乡村烧土鸡</span>', '/upload/1519735087816.jpg', NULL, 88, NULL, 'no', NULL, 2, 'no', 0, 2, NULL);
INSERT INTO `t_goods` VALUES (15, '凉拌云耳', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: 700; white-space: nowrap; background-color: rgb(250, 250, 250);\">凉拌云耳</span>', '/upload/1519735135736.jpg', NULL, 18, NULL, 'no', NULL, 3, 'no', 0, 2, NULL);
INSERT INTO `t_goods` VALUES (16, '果仁菠菜', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: 700; white-space: nowrap;\">果仁菠菜</span>', '/upload/1519735200430.jpg', NULL, 18, NULL, 'no', NULL, 3, 'no', 0, 2, NULL);
INSERT INTO `t_goods` VALUES (17, '烧鸭焖香菇', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: 700; white-space: nowrap;\">烧鸭焖香菇</span>', '/upload/1519735473070.jpg', NULL, 88, NULL, 'no', NULL, 2, 'no', 0, 4, NULL);
INSERT INTO `t_goods` VALUES (18, '姑妈焖猪手', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: 700; white-space: nowrap; background-color: rgb(250, 250, 250);\">姑妈焖猪手</span>', '/upload/1519735536731.jpg', NULL, 52, NULL, 'no', NULL, 2, 'no', 0, 4, NULL);
INSERT INTO `t_goods` VALUES (19, '山椒木耳', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: 700; white-space: nowrap;\">山椒木耳</span>', '/upload/1519735677893.jpg', NULL, 20, NULL, 'no', NULL, 3, 'no', 0, 4, NULL);
INSERT INTO `t_goods` VALUES (20, '排骨套餐中辣', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: 700; white-space: nowrap;\">排骨套餐中辣</span>', '/upload/1519735795727.jpg', NULL, 18, NULL, 'no', NULL, 2, 'no', 0, 3, NULL);
INSERT INTO `t_goods` VALUES (21, '黄焖鸡米饭套餐', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: 700; white-space: nowrap; background-color: rgb(250, 250, 250);\">大份黄焖鸡米饭套餐原味</span>', '/upload/1519735839552.jpg', NULL, 18, NULL, 'no', NULL, 2, 'no', 0, 3, NULL);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` int(11) NOT NULL DEFAULT 0,
  `order_bianhao` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_date` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_zhuangtai` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_jine` int(11) NULL DEFAULT NULL,
  `order_songhuodizhi` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_fukuangfangshi` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_user_id` int(11) NULL DEFAULT NULL,
  `store` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sjfk` int(11) NULL DEFAULT NULL,
  `shid` int(11) NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (6, '20180316155852', '2018-03-16 15:58:52', '已付款', 27, '北京市朝阳区11号楼', '银行付款', 23, '0', 27, 4, 0);
INSERT INTO `t_order` VALUES (7, '20180316165436', '2018-03-16 16:54:36', '已付款', 42, '北京市朝阳区11号楼', '货到付款', 23, '0', 42, 4, 0);
INSERT INTO `t_order` VALUES (8, '20180316165454', '2018-03-16 16:54:54', '已付款', 24, '北京市朝阳区11号楼', '货到付款', 23, '0', 24, 4, 0);
INSERT INTO `t_order` VALUES (9, '20180316165511', '2018-03-16 16:55:11', '已付款', 24, '北京市朝阳区11号楼', '货到付款', 23, '0', 24, 4, 0);
INSERT INTO `t_order` VALUES (11, '20190521172918', '2019-05-21 17:29:18', '已付款', 18, '教学楼', '货到付款', 17, '0', 18, 2, 0);
INSERT INTO `t_order` VALUES (12, '20190521180231', '2019-05-21 18:02:31', '已取消', 121, '教学楼', '货到付款', 17, '0', 121, 2, 0);
INSERT INTO `t_order` VALUES (13, '20190521200846', '2019-05-21 20:08:46', '已付款', 18, '教学楼', '货到付款', 24, '0', 18, 3, 0);
INSERT INTO `t_order` VALUES (14, '20190521211330', '2019-05-21 21:13:30', '未付款', 18, '教学楼', '货到付款', 24, '0', 18, 2, 0);

-- ----------------------------
-- Table structure for t_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem`  (
  `orderItem_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NULL DEFAULT NULL,
  `goods_id` int(11) NULL DEFAULT NULL,
  `goods_quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`orderItem_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES (11, 6, 9, 1);
INSERT INTO `t_orderitem` VALUES (12, 6, 11, 1);
INSERT INTO `t_orderitem` VALUES (13, 7, 9, 2);
INSERT INTO `t_orderitem` VALUES (14, 7, 10, 1);
INSERT INTO `t_orderitem` VALUES (15, 8, 11, 2);
INSERT INTO `t_orderitem` VALUES (16, 9, 12, 2);
INSERT INTO `t_orderitem` VALUES (19, 11, 16, 1);
INSERT INTO `t_orderitem` VALUES (20, 12, 13, 1);
INSERT INTO `t_orderitem` VALUES (21, 12, 14, 1);
INSERT INTO `t_orderitem` VALUES (22, 12, 15, 1);
INSERT INTO `t_orderitem` VALUES (23, 13, 21, 1);
INSERT INTO `t_orderitem` VALUES (24, 14, 16, 1);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_pw` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_type` int(11) NULL DEFAULT NULL,
  `user_realname` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_address` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_sex` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_tel` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_email` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_qq` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_man` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_age` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_birthday` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_xueli` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_del` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_one1` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_one2` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_one3` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_one4` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_one5` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_one6` int(11) NULL DEFAULT NULL,
  `user_one7` int(11) NULL DEFAULT NULL,
  `user_one8` int(11) NULL DEFAULT NULL,
  `user_one9` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `user_one10` timestamp(0) NOT NULL,
  `user_one11` bigint(20) NULL DEFAULT NULL,
  `user_one12` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (17, 'bnbn', '123456', 0, '张小小', '城市花园101', '男', '15567676767', '1111@qq.com', '11111111', NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-16 23:05:54', '2018-03-16 21:17:41', NULL, NULL);
INSERT INTO `t_user` VALUES (18, 'bibi', '123456', 0, '李明', '城市花园101', '男', '15567676767', '17771@qq.com', '17771', NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-16 23:05:52', '2018-03-16 21:17:41', NULL, NULL);
INSERT INTO `t_user` VALUES (20, 'bpbp', '123456', 0, '张明', '北京市朝阳区', NULL, '15585858887', '4444414141@qq.com', '4444414141', NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-16 23:05:52', '2018-03-16 21:17:41', NULL, NULL);
INSERT INTO `t_user` VALUES (21, 'by', '123456', 0, '刘茂', '北京市朝阳区', NULL, '15585858887', '4444414141@qq.com', '4444414141', NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-16 23:05:51', '2018-03-16 21:17:41', NULL, NULL);
INSERT INTO `t_user` VALUES (22, 'ht', '123456', 0, '刘大', '北京市朝阳区', NULL, '15528288828', ' 111111@qq.com', '17771', NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-16 23:05:51', '2018-03-16 21:17:41', NULL, NULL);
INSERT INTO `t_user` VALUES (23, 'nby', '123456', 0, '张大', '北京市朝阳区', NULL, '15528288828', '1111@qq.com', '11111', NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-16 21:17:41', '2018-03-16 21:17:41', NULL, NULL);
INSERT INTO `t_user` VALUES (24, 'lisi', '123456', 0, '李四', '教学楼', NULL, '13812345678', '1234567@qq.com', '1234567', NULL, NULL, NULL, NULL, 'no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-21 19:03:14', '2019-05-21 19:03:14', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
