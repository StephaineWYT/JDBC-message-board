/*
 Navicat Premium Data Transfer

 Source Server         : Stephanie
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 127.0.0.1:3306
 Source Schema         : messageform

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 04/04/2019 13:36:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mform
-- ----------------------------
DROP TABLE IF EXISTS `mform`;
CREATE TABLE `mform`  (
  `mid` int(20) NOT NULL AUTO_INCREMENT,
  `mwriter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mcontent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mtime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mtopic` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mform
-- ----------------------------
INSERT INTO `mform` VALUES (12, 'Stephanie', 'there is a bunch of things I have to do, so I trust myself I will be fine!!', '2019-04-03 20:00:39', 'the to-do things');
INSERT INTO `mform` VALUES (13, 'WYT', 'I am in a big family which I call they good girls!', '2019-04-03 21:00:26', 'Me and my dorm');
INSERT INTO `mform` VALUES (15, 'you guess', '		\"may I stand the true when I get all of the shit out my place\"\r\n		', '2019-04-03 21:43:53', 'about the lesson');
INSERT INTO `mform` VALUES (16, 'follow my git', 'I keep on working, code is challengeable but interesting!', '2019-04-04 00:12:24', 'code');
INSERT INTO `mform` VALUES (17, 'the big wen', 'finally I gotta ya!	', '2019-04-04 00:16:29', 'haha');

SET FOREIGN_KEY_CHECKS = 1;
