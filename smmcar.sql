/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80022
Source Host           : localhost:3306
Source Database       : smmcar

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2021-04-14 17:19:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `adminName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员账号',
  `adminPassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');
INSERT INTO `admin` VALUES ('2', '11', '11');
INSERT INTO `admin` VALUES ('3', '33', '33');
INSERT INTO `admin` VALUES ('5', '002', '002');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `car_id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `car_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车牌号',
  `car_brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车辆品牌',
  `car_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车辆状态，有已停车和未停车',
  `user_id` int NOT NULL COMMENT '用户id',
  `carport` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '停车位',
  `car_imge` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '车辆照片',
  PRIMARY KEY (`car_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户车辆表';

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('1', '6666666', '玛莎拉蒂', '未停车', '1', null, 'pages\\static\\images\\001.jpg');
INSERT INTO `car` VALUES ('2', '2501314', '兰博基尼', '未停车', '2', null, 'pages\\static\\images\\002.jpg');
INSERT INTO `car` VALUES ('3', '11111111', '保时捷', '未停车', '3', null, 'pages\\static\\images\\003.jpg');
INSERT INTO `car` VALUES ('4', '22222222', '法拉利', '未停车', '4', null, 'pages\\static\\images\\004.jpg');
INSERT INTO `car` VALUES ('5', '33333333', '路虎', '未停车', '5', null, 'pages\\static\\images\\005.jpg');
INSERT INTO `car` VALUES ('6', '44444444', '劳斯莱斯', '未停车', '6', null, 'pages\\static\\images\\006.jpg');
INSERT INTO `car` VALUES ('7', '55555555', '林肯', '未停车', '7', null, 'pages\\static\\images\\007.jpeg');
INSERT INTO `car` VALUES ('8', '77777777', '奔驰', '未停车', '8', null, 'pages\\static\\images\\008.jpeg');
INSERT INTO `car` VALUES ('9', '88888888', '宝马', '未停车', '9', null, 'pages\\static\\images\\009.jpg');
INSERT INTO `car` VALUES ('10', '99999999', '捷豹', '未停车', '10', null, 'pages\\static\\images\\010.jpg');
INSERT INTO `car` VALUES ('11', '10101010', '奥迪', '未停车', '11', null, 'pages\\static\\images\\011.jpg');
INSERT INTO `car` VALUES ('12', '20201218', '大众', '未停车', '12', null, 'pages\\static\\images\\012.jpg');
INSERT INTO `car` VALUES ('13', '20201220', '丰田', '已停车', '13', 'C01', 'pages\\static\\images\\013.jpeg');
INSERT INTO `car` VALUES ('14', '20201221', '比亚迪', '未停车', '14', null, 'pages\\static\\images\\014.jpg');
INSERT INTO `car` VALUES ('15', '20201222', '宾利', '未停车', '15', null, 'pages\\static\\images\\015.jpeg');
INSERT INTO `car` VALUES ('16', '20201223', '跑车', '未停车', '16', null, 'pages\\static\\images\\016.jpg');
INSERT INTO `car` VALUES ('17', '20201224', '拖拉机', '未停车', '17', null, 'pages\\static\\images\\017.jpg');
INSERT INTO `car` VALUES ('18', '20201225', '小电驴', '未停车', '18', null, 'pages\\static\\images\\018.jpg');

-- ----------------------------
-- Table structure for car_fare
-- ----------------------------
DROP TABLE IF EXISTS `car_fare`;
CREATE TABLE `car_fare` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `price` decimal(50,0) NOT NULL COMMENT '车位收费标准',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='收费标准';

-- ----------------------------
-- Records of car_fare
-- ----------------------------
INSERT INTO `car_fare` VALUES ('1', '3');

-- ----------------------------
-- Table structure for car_port
-- ----------------------------
DROP TABLE IF EXISTS `car_port`;
CREATE TABLE `car_port` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '区域',
  `carport` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车位号',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态 已停车 未停车',
  `car_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '车牌号',
  `in_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '入场时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='车位表';

-- ----------------------------
-- Records of car_port
-- ----------------------------
INSERT INTO `car_port` VALUES ('1', 'A', 'A01', '未停车', null, null);
INSERT INTO `car_port` VALUES ('2', 'B', 'B01', '未停车', null, null);
INSERT INTO `car_port` VALUES ('3', 'C', 'C01', '已停车', '20201220', '2021-02-13 09:19:52');
INSERT INTO `car_port` VALUES ('4', 'A', 'A03', '未停车', null, null);
INSERT INTO `car_port` VALUES ('5', 'A', 'A04', '未停车', null, null);
INSERT INTO `car_port` VALUES ('6', 'A', 'A05', '未停车', null, null);
INSERT INTO `car_port` VALUES ('7', 'B', 'B02', '未停车', null, null);
INSERT INTO `car_port` VALUES ('8', 'B', 'B03', '未停车', null, null);
INSERT INTO `car_port` VALUES ('9', 'B', 'B04', '未停车', null, null);
INSERT INTO `car_port` VALUES ('10', 'B', 'B05', '未停车', null, null);
INSERT INTO `car_port` VALUES ('11', 'C', 'C02', '未停车', null, null);
INSERT INTO `car_port` VALUES ('12', 'C', 'C03', '未停车', null, null);
INSERT INTO `car_port` VALUES ('13', 'A', 'A06', '未停车', null, null);
INSERT INTO `car_port` VALUES ('14', 'C', 'C07', '未停车', null, null);
INSERT INTO `car_port` VALUES ('15', 'B', 'B06', '未停车', null, null);
INSERT INTO `car_port` VALUES ('16', 'C', 'C04', '未停车', null, null);

-- ----------------------------
-- Table structure for parking_record
-- ----------------------------
DROP TABLE IF EXISTS `parking_record`;
CREATE TABLE `parking_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int NOT NULL COMMENT '用户id',
  `car_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车牌号',
  `in_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '入场时间',
  `out_date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '出场时间',
  `price` decimal(50,0) NOT NULL COMMENT '收费标准',
  `park_time` int NOT NULL COMMENT '停车时间',
  `total_fare` decimal(50,0) NOT NULL COMMENT '收费总额',
  `carport` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车位号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='停车记录表';

-- ----------------------------
-- Records of parking_record
-- ----------------------------
INSERT INTO `parking_record` VALUES ('1', '13', '20201220', '2021-01-11 13:04:14', '2021-01-11 14:58:43', '3', '1', '3', 'A01');
INSERT INTO `parking_record` VALUES ('2', '13', '20201220', '2021-01-11 15:01:10', '2021-01-14 16:29:14', '3', '73', '219', 'B01');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `userPassword` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机号',
  `balance` decimal(50,0) DEFAULT '0' COMMENT '余额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123', '123', '14785687123', '100');
INSERT INTO `user` VALUES ('2', '张山', '123', '14478540230', '10');
INSERT INTO `user` VALUES ('3', '王哥', '111', '18845620123', '30');
INSERT INTO `user` VALUES ('4', '777', '123', '14777777777', '0');
INSERT INTO `user` VALUES ('5', '佩佩', '123', '14756892356', '30');
INSERT INTO `user` VALUES ('6', '二流子', '123', '13865474215', '0');
INSERT INTO `user` VALUES ('7', '王麻子', '123', '18745621234', '10');
INSERT INTO `user` VALUES ('8', '小凳子', '123', '18425631452', '0');
INSERT INTO `user` VALUES ('9', '小李子', '963', '18612396875', '0');
INSERT INTO `user` VALUES ('10', '王老五', '96', '17725947856', '10');
INSERT INTO `user` VALUES ('11', '741', '741', '14702341457', '10');
INSERT INTO `user` VALUES ('12', '唐三', '333', '13333333332', '130');
INSERT INTO `user` VALUES ('13', '11', '11', '14611112312', '45');
INSERT INTO `user` VALUES ('14', '114', '11', '14789665412', '0');
INSERT INTO `user` VALUES ('15', '159', '159', '15978974112', '0');
INSERT INTO `user` VALUES ('16', '857', '857', '14789635214', '0');
INSERT INTO `user` VALUES ('17', '147', '147', '14789635214', '0');
INSERT INTO `user` VALUES ('18', '456', '456', '14789635214', '0');
INSERT INTO `user` VALUES ('19', '258', '258', '14789635214', '0');
INSERT INTO `user` VALUES ('20', '425', '425', '14511112313', '0');
INSERT INTO `user` VALUES ('21', '111', '111', '14789635214', '0');
INSERT INTO `user` VALUES ('22', '112', '111', '14789635214', '0');
INSERT INTO `user` VALUES ('23', '113', '111', '14789635214', '0');
INSERT INTO `user` VALUES ('24', '唐昊', '1111', '14511112312', '0');
INSERT INTO `user` VALUES ('25', '00', '00', '14511112313', '0');
INSERT INTO `user` VALUES ('26', '002', '002', '14511112313', '0');
INSERT INTO `user` VALUES ('27', '004', '004', '14511112312', '0');
INSERT INTO `user` VALUES ('28', '003', '003', '14789635214', '0');
INSERT INTO `user` VALUES ('29', '001', '001', '14511112312', '0');
