/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : kaizen_school

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 25/12/2020 20:53:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES ('', '', '', 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL);
INSERT INTO `acl_permission` VALUES ('1', '0', '全部数据', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-04-18 17:13:06', '2020-04-27 17:13:06');
INSERT INTO `acl_permission` VALUES ('1126665231353792395', '1273915414602096642', '查看', 2, 'ad.list', '', '', NULL, NULL, 0, '2020-04-23 21:42:53', '2020-06-20 00:37:42');
INSERT INTO `acl_permission` VALUES ('1193268474480156673', '1', '权限管理', 1, NULL, '/acl', 'Layout', 'password', NULL, 0, '2020-04-18 17:13:06', '2020-04-27 13:54:25');
INSERT INTO `acl_permission` VALUES ('1194349439240048642', '1', '讲师管理', 1, NULL, '/teacher', 'Layout', 'eye', NULL, 0, '2020-04-18 22:34:49', '2020-04-27 22:34:49');
INSERT INTO `acl_permission` VALUES ('1195268616021139457', '1193268474480156673', '用户管理', 1, NULL, 'user/list', '/acl/user/list', NULL, NULL, 0, '2020-04-18 17:13:40', '2020-04-26 13:53:12');
INSERT INTO `acl_permission` VALUES ('1195268788138598401', '1193268474480156673', '角色管理', 1, NULL, 'role/list', '/acl/role/list', NULL, NULL, 0, '2020-04-18 17:14:21', '2020-04-27 17:14:21');
INSERT INTO `acl_permission` VALUES ('1195268893830864898', '1193268474480156673', '菜单管理', 1, NULL, 'menu/list', '/acl/menu/list', NULL, NULL, 0, '2020-04-18 17:14:46', '2020-04-27 17:14:46');
INSERT INTO `acl_permission` VALUES ('1195269143060602882', '1195268616021139457', '查看', 2, 'user.list', '', '', NULL, NULL, 0, '2020-04-18 17:15:45', '2020-04-27 21:57:16');
INSERT INTO `acl_permission` VALUES ('1195269295926206466', '1195268616021139457', '添加', 2, 'user.add', 'user/add', '/acl/user/form', NULL, NULL, 0, '2020-04-18 17:16:22', '2020-04-27 17:16:22');
INSERT INTO `acl_permission` VALUES ('1195269473479483394', '1195268616021139457', '修改', 2, 'user.update', 'user/update/:id', '/acl/user/form', NULL, NULL, 0, '2020-04-18 17:17:04', '2020-04-27 17:17:04');
INSERT INTO `acl_permission` VALUES ('1195269547269873666', '1195268616021139457', '删除', 2, 'user.remove', '', '', NULL, NULL, 0, '2020-04-18 17:17:22', '2020-04-27 17:17:22');
INSERT INTO `acl_permission` VALUES ('1195269821262782465', '1195268788138598401', '修改', 2, 'role.update', 'role/update/:id', '/acl/role/form', NULL, NULL, 0, '2020-04-18 17:18:27', '2020-04-27 17:19:53');
INSERT INTO `acl_permission` VALUES ('1195269903542444034', '1195268788138598401', '查看', 2, 'role.list', '', '', NULL, NULL, 0, '2020-04-18 17:18:47', '2020-04-27 17:18:47');
INSERT INTO `acl_permission` VALUES ('1195270037005197313', '1195268788138598401', '添加', 2, 'role.add', 'role/add', '/acl/role/form', NULL, NULL, 0, '2020-04-18 17:19:19', '2020-04-27 11:05:42');
INSERT INTO `acl_permission` VALUES ('1195270442602782721', '1195268788138598401', '删除', 2, 'role.remove', '', '', NULL, NULL, 0, '2020-04-18 17:20:55', '2020-04-27 17:20:55');
INSERT INTO `acl_permission` VALUES ('1195270621548568578', '1195268788138598401', '角色权限', 2, 'role.acl', 'role/distribution/:id', '/acl/role/roleForm', NULL, NULL, 0, '2020-04-18 17:21:38', '2020-04-27 17:21:38');
INSERT INTO `acl_permission` VALUES ('1195270744097742849', '1195268893830864898', '查看', 2, 'permission.list', '', '', NULL, NULL, 0, '2020-04-18 17:22:07', '2020-04-27 17:22:07');
INSERT INTO `acl_permission` VALUES ('1195270810560684034', '1195268893830864898', '添加', 2, 'permission.add', '', '', NULL, NULL, 0, '2020-04-18 17:22:23', '2020-04-27 17:22:23');
INSERT INTO `acl_permission` VALUES ('1195270862100291586', '1195268893830864898', '修改', 2, 'permission.update', '', '', NULL, NULL, 0, '2020-04-18 17:22:35', '2020-04-27 17:22:35');
INSERT INTO `acl_permission` VALUES ('1195270887933009922', '1195268893830864898', '删除', 2, 'permission.remove', '', '', NULL, NULL, 0, '2020-04-18 17:22:41', '2020-04-27 17:22:41');
INSERT INTO `acl_permission` VALUES ('1195349699995734017', '1194349439240048642', '讲师列表', 1, NULL, 'table', '/edu/teacher/list', NULL, NULL, 0, '2020-04-18 22:35:52', '2020-04-27 22:35:52');
INSERT INTO `acl_permission` VALUES ('1195349810561781761', '1194349439240048642', '添加讲师', 1, NULL, 'add', '/edu/teacher/add', NULL, NULL, 0, '2020-04-18 22:36:18', '2020-04-27 22:36:18');
INSERT INTO `acl_permission` VALUES ('1195349876252971010', '1195349810561781761', '添加', 2, 'teacher.add', '', '', NULL, NULL, 0, '2020-04-18 22:36:34', '2020-04-27 22:36:34');
INSERT INTO `acl_permission` VALUES ('1195349979797753857', '1195349699995734017', '查看', 2, 'teacher.list', '', '', NULL, NULL, 0, '2020-04-18 22:36:58', '2020-04-27 22:36:58');
INSERT INTO `acl_permission` VALUES ('1195350117270261762', '1195349699995734017', '修改', 2, 'teacher.update', 'edit/:id', '/edu/teacher/add', NULL, NULL, 0, '2020-04-18 22:37:31', '2020-04-27 22:37:31');
INSERT INTO `acl_permission` VALUES ('1195350188359520258', '1195349699995734017', '删除', 2, 'teacher.remove', '', '', NULL, NULL, 0, '2020-04-18 22:37:48', '2020-04-27 22:37:48');
INSERT INTO `acl_permission` VALUES ('1195350397751758850', '1196350299365969922', '课程分类列表', 1, NULL, 'list', '/edu/subject/list', NULL, NULL, 0, '2020-04-18 22:38:38', '2020-04-27 22:38:38');
INSERT INTO `acl_permission` VALUES ('1195350500512206850', '1196350299365969922', '导入课程分类', 1, NULL, 'add', '/edu/subject/add', NULL, NULL, 0, '2020-04-18 22:39:03', '2020-04-27 22:39:03');
INSERT INTO `acl_permission` VALUES ('1195350612172967938', '1195350397751758850', '查看', 2, 'subject.list', '', '', NULL, NULL, 0, '2020-04-18 22:39:29', '2020-04-27 22:39:29');
INSERT INTO `acl_permission` VALUES ('1195350687590748161', '1195350500512206850', '导入', 2, 'subject.import', '', '', NULL, NULL, 0, '2020-04-18 22:39:47', '2020-04-27 22:39:47');
INSERT INTO `acl_permission` VALUES ('1195350831744782337', '1', '课程管理', 1, NULL, '/course', 'Layout', 'nested', NULL, 0, '2020-04-18 22:40:21', '2020-04-27 22:40:21');
INSERT INTO `acl_permission` VALUES ('1195350919074385921', '1195350831744782337', '课程列表', 1, NULL, 'list', '/edu/course/list', NULL, NULL, 0, '2020-04-18 22:40:42', '2020-04-27 22:40:42');
INSERT INTO `acl_permission` VALUES ('1195351020463296513', '1195350831744782337', '发布课程', 1, NULL, 'info', '/edu/course/info', NULL, NULL, 0, '2020-04-18 22:41:06', '2020-04-27 22:41:06');
INSERT INTO `acl_permission` VALUES ('1195351159672246274', '1195350919074385921', '完成发布', 2, 'course.publish', 'publish/:id', '/edu/course/publish', NULL, NULL, 0, '2020-04-18 22:41:40', '2020-04-27 22:44:01');
INSERT INTO `acl_permission` VALUES ('1195351326706208770', '1195350919074385921', '编辑课程', 2, 'course.update', 'info/:id', '/edu/course/info', NULL, NULL, 0, '2020-04-18 22:42:19', '2020-04-27 22:42:19');
INSERT INTO `acl_permission` VALUES ('1195351566221938690', '1195350919074385921', '编辑课程大纲', 2, 'chapter.update', 'chapter/:id', '/edu/course/chapter', NULL, NULL, 0, '2020-04-18 22:43:17', '2020-04-27 22:43:17');
INSERT INTO `acl_permission` VALUES ('1195351968841568257', '1198351862889254913', '生成统计', 1, NULL, 'create', '/statistics/create', NULL, NULL, 0, '2020-04-18 22:44:53', '2020-04-27 22:44:53');
INSERT INTO `acl_permission` VALUES ('1195352054917074946', '1198351862889254913', '统计图表', 1, NULL, 'showLog', '/statistics/showLog', NULL, NULL, 0, '2020-04-18 22:45:13', '2020-04-27 22:45:13');
INSERT INTO `acl_permission` VALUES ('1195352127734386690', '1195352054917074946', '查看', 2, 'daily.list', '', '', NULL, NULL, 0, '2020-04-18 22:45:30', '2020-04-27 22:45:30');
INSERT INTO `acl_permission` VALUES ('1195352215768633346', '1195351968841568257', '生成', 2, 'daily.add', '', '', NULL, NULL, 0, '2020-04-18 22:45:51', '2020-04-27 22:45:51');
INSERT INTO `acl_permission` VALUES ('1196301740985311234', '1195268616021139457', '分配角色', 2, 'user.assgin', 'user/role/:id', '/acl/user/roleForm', NULL, NULL, 0, '2020-04-18 13:38:56', '2020-04-27 13:38:56');
INSERT INTO `acl_permission` VALUES ('1196350299365969922', '1', '课程分类', 1, NULL, '/subject', 'Layout', 'tree', NULL, 0, '2020-04-18 22:38:15', '2020-04-27 22:38:15');
INSERT INTO `acl_permission` VALUES ('1198351862889254913', '1', '统计分析', 1, NULL, '/statistics', 'Layout', 'form', NULL, 0, '2020-04-18 22:44:27', '2020-04-27 22:44:27');
INSERT INTO `acl_permission` VALUES ('1273915153737359362', '1', '内容管理', 1, NULL, '/cms', 'Layout', 'example', NULL, 0, '2020-06-19 17:46:56', '2020-06-19 17:46:56');
INSERT INTO `acl_permission` VALUES ('1273915367537811457', '1273915153737359362', '推荐位', 1, NULL, 'adType/list', '/cms/adType/list', NULL, NULL, 0, '2020-06-19 17:47:46', '2020-06-20 15:23:35');
INSERT INTO `acl_permission` VALUES ('1273915414602096642', '1273915153737359362', '广告推荐', 1, NULL, 'ad/list', '/cms/ad/list', NULL, NULL, 0, '2020-06-19 17:47:58', '2020-06-20 00:11:16');
INSERT INTO `acl_permission` VALUES ('1274010467345408001', '1273915367537811457', '查看', 2, 'adType.list', '', '', NULL, NULL, 0, '2020-06-20 00:05:40', '2020-06-20 00:05:40');
INSERT INTO `acl_permission` VALUES ('1274015029355651073', '1273915414602096642', '添加', 2, 'ad.create', 'ad/create', '/cms/ad/form', NULL, NULL, 0, '2020-06-20 00:23:48', '2020-06-20 00:27:11');
INSERT INTO `acl_permission` VALUES ('1274016698571202562', '1273915367537811457', '添加', 2, 'adType.create', 'adType/create', '/cms/adType/form', NULL, NULL, 0, '2020-06-20 00:30:26', '2020-06-20 00:31:02');
INSERT INTO `acl_permission` VALUES ('1274018169601695746', '1273915414602096642', '修改', 2, 'ad.edit', 'ad/edit/:id', '/cms/ad/form', NULL, NULL, 0, '2020-06-20 00:36:16', '2020-06-20 00:38:06');
INSERT INTO `acl_permission` VALUES ('1274018281610584066', '1273915367537811457', '修改', 2, 'adType.edit', 'adType/edit/:id', '/cms/adType/form', NULL, NULL, 0, '2020-06-20 00:36:43', '2020-06-20 00:39:34');
INSERT INTO `acl_permission` VALUES ('1274018696133648385', '1273915414602096642', '删除', 2, 'ad.remove', '', '', NULL, NULL, 0, '2020-06-20 00:38:22', '2020-06-20 00:38:22');
INSERT INTO `acl_permission` VALUES ('1274018741155307521', '1273915367537811457', '删除', 2, 'adType.remove', '', '', NULL, NULL, 0, '2020-06-20 00:38:33', '2020-06-20 00:38:47');

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES ('1', '普通管理员', NULL, NULL, 0, '2020-04-18 13:09:32', '2020-04-27 10:27:18');
INSERT INTO `acl_role` VALUES ('1193757683205607426', '课程管理员', NULL, NULL, 0, '2020-04-18 13:09:45', '2020-04-27 10:25:44');
INSERT INTO `acl_role` VALUES ('1274590118316965890', '统计管理员', NULL, NULL, 0, '2020-06-21 14:29:02', '2020-06-21 14:29:02');

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `permission_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES ('1250679961811972097', '1250679675336814594', '1', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961816166402', '1250679675336814594', '1195268474480156673', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961816166403', '1250679675336814594', '1195268616021139457', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961824555009', '1250679675336814594', '1195269143060602882', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961824555010', '1250679675336814594', '1195269295926206466', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961824555011', '1250679675336814594', '1195269473479483394', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961828749313', '1250679675336814594', '1195269547269873666', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961828749314', '1250679675336814594', '1196301740985311234', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961832943618', '1250679675336814594', '1195268788138598401', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961832943619', '1250679675336814594', '1195269821262782465', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961832943620', '1250679675336814594', '1195269903542444034', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961832943621', '1250679675336814594', '1195270037005197313', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961841332225', '1250679675336814594', '1195270442602782721', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1250679961841332226', '1250679675336814594', '1195270621548568578', 0, '2020-04-16 14:58:34', '2020-04-16 14:58:34');
INSERT INTO `acl_role_permission` VALUES ('1264387683761790978', '1193757683205607426', '1', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683770179586', '1193757683205607426', '1195350831744782337', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683770179587', '1193757683205607426', '1195350919074385921', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683770179588', '1193757683205607426', '1195351159672246274', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683770179589', '1193757683205607426', '1195351326706208770', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683778568193', '1193757683205607426', '1195351566221938690', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683778568194', '1193757683205607426', '1195351020463296513', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683778568195', '1193757683205607426', '1196350299365969922', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683778568196', '1193757683205607426', '1195350397751758850', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683778568197', '1193757683205607426', '1195350612172967938', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683778568198', '1193757683205607426', '1195350500512206850', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387683778568199', '1193757683205607426', '1195350687590748161', 0, '2020-05-24 10:48:10', '2020-05-24 10:48:10');
INSERT INTO `acl_role_permission` VALUES ('1264387720738775042', '1', '1', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720738775043', '1', '1197318588435323422', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720747163649', '1', '1134543535788999873', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720747163650', '1', '1121243165876121547', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720747163651', '1', '1128629623962354388', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720747163652', '1', '1138433832472389746', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720755552257', '1', '1231273333333333334', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720755552258', '1', '1126665231353792395', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720755552259', '1', '1198351862889254913', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720755552260', '1', '1195351968841568257', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720759746562', '1', '1195352215768633346', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720759746563', '1', '1195352054917074946', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');
INSERT INTO `acl_role_permission` VALUES ('1264387720759746564', '1', '1195352127734386690', 0, '2020-05-24 10:48:18', '2020-05-24 10:48:18');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '微信openid',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', '', NULL, 0, '2020-04-18 10:39:47', '2020-04-27 10:39:47');
INSERT INTO `acl_user` VALUES ('1264386776508669954', '123123', '96e79218965eb72c92a549dd5a330112', '杨孝义', NULL, NULL, 0, '2020-05-24 10:44:33', '2020-06-21 14:29:19');

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主键id',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------
INSERT INTO `acl_user_role` VALUES ('1250680481045835778', '1250679675336814594', '1250680404441067521', 0, '2020-04-16 15:00:38', '2020-04-16 15:00:38');
INSERT INTO `acl_user_role` VALUES ('1264397945621454850', '1193757683205607426', '1264386776508669954', 0, '2020-05-24 11:28:56', '2020-05-24 11:28:56');

-- ----------------------------
-- Table structure for cms_ad
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad`;
CREATE TABLE `cms_ad`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标题',
  `type_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类型ID',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '背景颜色',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '广告推荐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ad
-- ----------------------------
INSERT INTO `cms_ad` VALUES ('1274229182682906626', 'MindSchool介绍', '1', ' https://edu-zjm.oss-cn-beijing.aliyuncs.com/banner/b1.png', '#FFDC2A', '/course/', 1, '2020-06-20 14:34:46', '2020-06-20 15:40:15');
INSERT INTO `cms_ad` VALUES ('1274244730103918593', '粉笔字', '1', 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/banner/b2.png', '#9BE3F3', '/course/1272142320019542017', 2, '2020-06-20 15:36:33', '2020-06-20 15:40:39');
INSERT INTO `cms_ad` VALUES ('1274244773800177665', '更多', '1', 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/banner/b3.png', '#7D4ECA', '/course/1272141718954807298', 3, '2020-06-20 15:36:43', '2020-06-20 15:40:57');

-- ----------------------------
-- Table structure for cms_ad_type
-- ----------------------------
DROP TABLE IF EXISTS `cms_ad_type`;
CREATE TABLE `cms_ad_type`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '推荐位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ad_type
-- ----------------------------
INSERT INTO `cms_ad_type` VALUES ('1', '首页幻灯片', '2020-06-20 14:06:04', '2020-06-20 14:06:04');
INSERT INTO `cms_ad_type` VALUES ('1274244054850334722', '侧边栏推荐位', '2020-06-20 15:33:52', '2020-06-20 15:33:52');

-- ----------------------------
-- Table structure for cms_banner
-- ----------------------------
DROP TABLE IF EXISTS `cms_banner`;
CREATE TABLE `cms_banner`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'ID',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标题',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`title`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '首页banner表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_banner
-- ----------------------------
INSERT INTO `cms_banner` VALUES ('1194556896025845762', 'index', ' https://edu-zjm.oss-cn-beijing.aliyuncs.com/banner/b1.png', '/', 1, 0, '2020-04-23 18:05:32', '2020-06-15 21:11:41');
INSERT INTO `cms_banner` VALUES ('1194607458461216769', 'python', 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/banner/b2.png', '/course/1252943935559454722', 2, 0, '2020-04-23 21:26:27', '2020-04-26 22:24:37');
INSERT INTO `cms_banner` VALUES ('1253312520618303490', 'front', 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/banner/b3.png', '/course', 3, 0, '2020-04-23 21:19:25', '2020-04-23 21:22:45');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节名称',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1272149133121130498', '1272141718954807298', '第一章：绪论', 1, '2020-06-14 20:49:23', '2020-06-14 20:49:23');
INSERT INTO `edu_chapter` VALUES ('1272150578218242049', '1272141718954807298', '第二章 什么是教育', 1, '2020-06-14 20:55:08', '2020-06-14 20:55:08');
INSERT INTO `edu_chapter` VALUES ('1272151190574043138', '1272141718954807298', '第三章 教育与人的发展', 3, '2020-06-14 20:57:34', '2020-06-14 20:57:34');
INSERT INTO `edu_chapter` VALUES ('1272152058581061634', '1272141718954807298', '第四章：教育与社会发展', 4, '2020-06-14 21:01:01', '2020-06-14 21:01:01');
INSERT INTO `edu_chapter` VALUES ('1272152713307721730', '1272141718954807298', '第五章：教育目的', 5, '2020-06-14 21:03:37', '2020-06-14 21:03:37');
INSERT INTO `edu_chapter` VALUES ('1272153008653832194', '1272141718954807298', '第六章：课程', 6, '2020-06-14 21:04:47', '2020-06-14 21:04:47');
INSERT INTO `edu_chapter` VALUES ('1272153233040707585', '1272141718954807298', '第七章：教学', 7, '2020-06-14 21:05:41', '2020-06-14 21:05:41');
INSERT INTO `edu_chapter` VALUES ('1272153483600039937', '1272141718954807298', '第八章：德育', 8, '2020-06-14 21:06:41', '2020-06-14 21:06:41');
INSERT INTO `edu_chapter` VALUES ('1272153793718489089', '1272141718954807298', '第九章：教师', 9, '2020-06-14 21:07:55', '2020-06-14 21:07:55');
INSERT INTO `edu_chapter` VALUES ('1272173320489504769', '1272141847711551489', '【第一章：绪论】', 1, '2020-06-14 22:25:30', '2020-06-14 22:25:30');
INSERT INTO `edu_chapter` VALUES ('1272173864192937985', '1272141847711551489', '【第二章：发展的过程】', 2, '2020-06-14 22:27:40', '2020-06-14 22:27:40');
INSERT INTO `edu_chapter` VALUES ('1272173909961183234', '1272141847711551489', '【第三章：心理学概述】', 3, '2020-06-14 22:27:51', '2020-06-14 22:27:51');
INSERT INTO `edu_chapter` VALUES ('1272173957834969089', '1272141847711551489', '【第四章：学习的过程】', 4, '2020-06-14 22:28:02', '2020-06-14 22:28:02');
INSERT INTO `edu_chapter` VALUES ('1272173999882866689', '1272141847711551489', '【第五章：自主学习】', 5, '2020-06-14 22:28:12', '2020-06-14 22:28:12');
INSERT INTO `edu_chapter` VALUES ('1272174051183398914', '1272141847711551489', '【第六章：学习动机】', 6, '2020-06-14 22:28:24', '2020-06-14 22:28:24');
INSERT INTO `edu_chapter` VALUES ('1272174106225250306', '1272141847711551489', '【第七章：教学设计】', 7, '2020-06-14 22:28:37', '2020-06-14 22:28:37');
INSERT INTO `edu_chapter` VALUES ('1272174148730327041', '1272141847711551489', '【第八章：中心式教学】', 8, '2020-06-14 22:28:48', '2020-06-14 22:28:48');
INSERT INTO `edu_chapter` VALUES ('1272175127374696450', '1272141847711551489', '【第九章：策略教学】', 9, '2020-06-14 22:32:41', '2020-06-14 22:32:41');
INSERT INTO `edu_chapter` VALUES ('1272177297411117058', '1272142320019542017', '【第一章：粉笔字实录】', 1, '2020-06-14 22:41:18', '2020-06-14 22:41:18');
INSERT INTO `edu_chapter` VALUES ('1272177339987496962', '1272142320019542017', '【第二章：王红军粉笔字教学】', 2, '2020-06-14 22:41:28', '2020-06-14 22:41:28');
INSERT INTO `edu_chapter` VALUES ('1272177388297490434', '1272142320019542017', '【第三章：吉建忠粉笔字教学】', 3, '2020-06-14 22:41:40', '2020-06-14 22:41:40');
INSERT INTO `edu_chapter` VALUES ('1272177428084658178', '1272142320019542017', '【第四章：结构教学】', 4, '2020-06-14 22:41:49', '2020-06-14 22:41:49');
INSERT INTO `edu_chapter` VALUES ('1272178637650628609', '1272142165463633922', '【第一章：绪论】', 0, '2020-06-14 22:46:38', '2020-06-14 22:46:38');
INSERT INTO `edu_chapter` VALUES ('1272178678415069186', '1272142165463633922', '【第二章：中国教育史的起源】', 1, '2020-06-14 22:46:48', '2020-06-14 22:46:48');
INSERT INTO `edu_chapter` VALUES ('1272178723650637826', '1272142165463633922', '【第三章：中国教育史的发展】', 2, '2020-06-14 22:46:58', '2020-06-14 22:46:58');
INSERT INTO `edu_chapter` VALUES ('1272178760933806081', '1272142165463633922', '【第四章：中国教育史的高潮】', 3, '2020-06-14 22:47:07', '2020-06-14 22:47:07');
INSERT INTO `edu_chapter` VALUES ('1272178809558372353', '1272142165463633922', '【第五章：中国教育史的创新】', 4, '2020-06-14 22:47:19', '2020-06-14 22:47:19');
INSERT INTO `edu_chapter` VALUES ('1272178872250634241', '1272142165463633922', '【第六章：总结】', 5, '2020-06-14 22:47:34', '2020-06-14 22:47:34');
INSERT INTO `edu_chapter` VALUES ('1272179692731994114', '1272142237567913986', '【第一章：史前文化教育】', 1, '2020-06-14 22:50:49', '2020-06-14 22:50:49');
INSERT INTO `edu_chapter` VALUES ('1272179723736289281', '1272142237567913986', '【第二章：东方文明教育】', 2, '2020-06-14 22:50:57', '2020-06-14 22:50:57');
INSERT INTO `edu_chapter` VALUES ('1272179758909722626', '1272142237567913986', '【第三章：西方古典教育学家教育】', 3, '2020-06-14 22:51:05', '2020-06-14 22:51:05');
INSERT INTO `edu_chapter` VALUES ('1272179793361735681', '1272142237567913986', '【第四章：西方古典教育】', 4, '2020-06-14 22:51:13', '2020-06-14 22:51:13');
INSERT INTO `edu_chapter` VALUES ('1272179833689968642', '1272142237567913986', '【第五章：文艺复兴与宗教改革】', 5, '2020-06-14 22:51:23', '2020-06-14 22:51:23');
INSERT INTO `edu_chapter` VALUES ('1272179878401249281', '1272142237567913986', '【第六章：近代西方国家教育】', 6, '2020-06-14 22:51:34', '2020-06-14 22:51:34');
INSERT INTO `edu_chapter` VALUES ('1272179925704609794', '1272142237567913986', '【第七章：教育运动的兴起】', 7, '2020-06-14 22:51:45', '2020-06-14 22:51:45');
INSERT INTO `edu_chapter` VALUES ('1272179969455394818', '1272142237567913986', '【第八章：其他形式教育的发展】', 8, '2020-06-14 22:51:55', '2020-06-14 22:51:55');
INSERT INTO `edu_chapter` VALUES ('1272181878459305986', '1272181783382822913', '【第一章：普通话基础】', 1, '2020-06-14 22:59:30', '2020-06-14 22:59:30');
INSERT INTO `edu_chapter` VALUES ('1272181914672926722', '1272181783382822913', '【第二章：初步发音教学】', 2, '2020-06-14 22:59:39', '2020-06-14 22:59:39');
INSERT INTO `edu_chapter` VALUES ('1272181947782762497', '1272181783382822913', '【第三章：优秀作品赏析】', 3, '2020-06-14 22:59:47', '2020-06-14 22:59:47');
INSERT INTO `edu_chapter` VALUES ('1272181992879919105', '1272181783382822913', '【第四章：发音进阶练习】', 4, '2020-06-14 22:59:58', '2020-06-14 22:59:58');
INSERT INTO `edu_chapter` VALUES ('1272182029684936705', '1272181783382822913', '【第五章：代表作品赏析】', 5, '2020-06-14 23:00:07', '2020-06-14 23:00:07');
INSERT INTO `edu_chapter` VALUES ('1272182089009172482', '1272181783382822913', '【第六章：高阶练习】', 6, '2020-06-14 23:00:21', '2020-06-14 23:00:21');
INSERT INTO `edu_chapter` VALUES ('1272182129412902914', '1272181783382822913', '【第七章：其他】', 7, '2020-06-14 23:00:30', '2020-06-14 23:00:30');
INSERT INTO `edu_chapter` VALUES ('1274562258202112001', '1274562224203083778', '1', 0, '2020-06-21 12:38:17', '2020-06-21 12:38:17');

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师ID',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师id',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_comment
-- ----------------------------
INSERT INTO `edu_comment` VALUES ('1273839547066716162', '1272142320019542017', '1189426464967995393', '1252580491287097345', '曾锦明', 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/14/46c4f4e4bcb140a996b46e3d7e71c8f9鍥芥棗鐝_IMG_20181011_094906.jpg', '老师讲的太好了！', 0, '2020-06-19 12:46:29', '2020-06-19 12:46:29');
INSERT INTO `edu_comment` VALUES ('1273938471186173953', '1272142320019542017', '1189426464967995393', '1252580491287097345', '曾锦明', 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/14/46c4f4e4bcb140a996b46e3d7e71c8f9鍥芥棗鐝_IMG_20181011_094906.jpg', '这个课真是太棒啦', 0, '2020-06-19 19:19:35', '2020-06-19 19:19:35');
INSERT INTO `edu_comment` VALUES ('1274591448401985538', '1272142320019542017', '1189426464967995393', '1252580491287097345', '曾锦明', 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/14/46c4f4e4bcb140a996b46e3d7e71c8f9鍥芥棗鐝_IMG_20181011_094906.jpg', '111', 0, '2020-06-21 14:34:17', '2020-06-21 14:34:17');
INSERT INTO `edu_comment` VALUES ('1285760356697804801', '1272141718954807298', '1', '1252580491287097345', '曾锦明', 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/14/46c4f4e4bcb140a996b46e3d7e71c8f9鍥芥棗鐝_IMG_20181011_094906.jpg', '老师讲的太好了', 0, '2020-07-22 10:15:32', '2020-07-22 10:15:32');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程专业父级ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `is_deleted` tinyint(0) NULL DEFAULT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1272141718954807298', '1', '1272141360895463425', '1272141359578451970', '教育学原理', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/04350dd53a134362875084a3b4174efa教育学原理.jpg', 0, 24, 1, 'Normal', NULL, '2020-06-14 20:19:56', '2020-07-22 10:15:15');
INSERT INTO `edu_course` VALUES ('1272141847711551489', '1189389726308478977', '1272141360895463425', '1272141359578451970', '教育心理学', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/ce5586db84fa4acca6e90d2e633d45c0教育心理学.jpg', 0, 1, 1, 'Normal', NULL, '2020-06-14 20:20:26', '2020-06-16 18:26:17');
INSERT INTO `edu_course` VALUES ('1272142165463633922', '1189390295668469762', '1272141360895463425', '1272141359578451970', '中国教育史', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/5f50fa6344584eca823fe24207e8e8ba中国教育史.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:21:42', '2020-06-15 20:23:20');
INSERT INTO `edu_course` VALUES ('1272142237567913986', '1189426437876985857', '1272141360895463425', '1272141359578451970', '外国教育史', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/c049814412cf44319f2c422db6a3ee46外国教育史.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:21:59', '2020-06-15 20:23:48');
INSERT INTO `edu_course` VALUES ('1272142320019542017', '1189426464967995393', '1272141360937406465', '1272141359578451970', '粉笔字', 0.01, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/e48571380720481b976e52bf0acb1e1e粉笔字.jpg', 5, 81, 1, 'Normal', NULL, '2020-06-14 20:22:19', '2020-07-22 10:00:25');
INSERT INTO `edu_course` VALUES ('1272142394007064577', '1192327476087115778', '1272141360937406465', '1272141359578451970', '片段教学', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/0712947c134f4b998a15947a212c6248片段教学.jpg', 0, 2, 1, 'Normal', NULL, '2020-06-14 20:22:37', '2020-07-22 09:56:00');
INSERT INTO `edu_course` VALUES ('1272142476672602114', '1192249914833055746', '1272141360937406465', '1272141359578451970', '教学设计', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/f1da1758f51246e9aee1b0d7d6bda91b教学设计.jpg', 0, 1, 1, 'Normal', NULL, '2020-06-14 20:22:56', '2020-06-17 11:43:04');
INSERT INTO `edu_course` VALUES ('1272142893892603906', '1189389726308478977', '1272141361046458370', '1272141361004515329', '班级管理', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/08f0c9786f7a4fa0b52a8385a12beaed班级管理.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:24:36', '2020-06-15 20:21:21');
INSERT INTO `edu_course` VALUES ('1272142944794677250', '1189426437876985857', '1272141361046458370', '1272141361004515329', '教育策略', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/dca2a4d4698048719c58d85243822e83教育策略.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:24:48', '2020-06-15 20:20:58');
INSERT INTO `edu_course` VALUES ('1272143021995036673', '1192249914833055746', '1272141361046458370', '1272141361004515329', '德育方式', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/3513bcedda6444e98ad2a8602ea34627德育方式.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:25:06', '2020-06-15 20:20:40');
INSERT INTO `edu_course` VALUES ('1272143086562152450', '1189390295668469762', '1272141361117761538', '1272141361080012801', '语文', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/7c8390d3c59a457a8422c3814eaabd11语文.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:25:22', '2020-06-15 20:29:19');
INSERT INTO `edu_course` VALUES ('1272143133739683841', '1189390295668469762', '1272141361117761538', '1272141361080012801', '数学', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/644f7c4274c242469e31a3fcd5c18581数学.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:25:33', '2020-06-15 20:29:33');
INSERT INTO `edu_course` VALUES ('1272143217621569537', '1189390295668469762', '1272141361117761538', '1272141361080012801', '英语', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/5cb8fd4b119246898f78ac05ab8ba7b5英语.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:25:53', '2020-06-15 20:29:05');
INSERT INTO `edu_course` VALUES ('1272143340875386882', '1189389726308478977', '1272141361130344449', '1272141361080012801', '教育政策', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/47c1a2f8b2ab4ee2b0ec06679b8da933教育政策.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:26:22', '2020-06-15 20:20:09');
INSERT INTO `edu_course` VALUES ('1272143416771317761', '1192249914833055746', '1272141361130344449', '1272141361080012801', '教育成果', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/af5f4fbb6a20489c9841d0f9a155d537教育成果.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:26:40', '2020-06-15 20:19:51');
INSERT INTO `edu_course` VALUES ('1272143472605892610', '1189390295668469762', '1272141361130344449', '1272141361080012801', '教育研究', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/837ed933d6b547c0b615051e6da2fbf6教育研究.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:26:54', '2020-06-15 20:19:24');
INSERT INTO `edu_course` VALUES ('1272143709378547714', '1189389726308478977', '1272141361130344449', '1272141361080012801', '知识点汇编', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/97505e3e0eb748aea123ad5bfaeb60ff知识点汇编.jpg', 0, 0, 1, 'Normal', NULL, '2020-06-14 20:27:50', '2020-06-15 20:18:29');
INSERT INTO `edu_course` VALUES ('1272181783382822913', '1189390295668469762', '1272141360937406465', '1272141359578451970', '普通话', 0.00, 0, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/f2cec5367ec54608a01aa955c9669272普通话.jpg', 0, 3, 1, 'Normal', NULL, '2020-06-14 22:59:08', '2020-06-21 14:33:57');

-- ----------------------------
-- Table structure for edu_course_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_collect`;
CREATE TABLE `edu_course_collect`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程讲师ID',
  `member_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程专业ID',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程收藏' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course_collect
-- ----------------------------
INSERT INTO `edu_course_collect` VALUES ('1274591947150868482', '1272141718954807298', '1252580491287097345', 0, '2020-06-21 14:36:16', '2020-06-21 14:36:16');
INSERT INTO `edu_course_collect` VALUES ('1274591970198568961', '1272142320019542017', '1252580491287097345', 0, '2020-06-21 14:36:21', '2020-06-21 14:36:21');

-- ----------------------------
-- Table structure for edu_course_description
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_description`;
CREATE TABLE `edu_course_description`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '课程简介',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程简介' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_course_description
-- ----------------------------
INSERT INTO `edu_course_description` VALUES ('1272141718954807298', '<p>《教育学原理》是高等师范院校教育学、心理学(本科)专业课程计划中专业基础课程,是所有教师教育专业的公共必修课程。本门课程以现代教育理论为理论基础,阐明教育、教学、课程、德育的内涵特点、构成要素,阐明教育在社会和人的发展中的作用,特别是现代教育在现代社会和现代人发展中的作用,分析学制、教育目的的实质与特点等。本门课程是一门理论性较强的基础课程,对学习其他教育课程具有奠基和指导作用,在教师教育各专业课程体系中是核心课程和基础课程。</p>', '2020-06-14 20:19:56', '2020-06-15 20:18:58');
INSERT INTO `edu_course_description` VALUES ('1272141847711551489', '<p>教育心理学是研究在教育情境下人类的学习、教育干预的效果、教学心理，以及学校组织的社会心理学。教育心理学的重点是把心理学的理论或研究所得应用在教育上。教育心理学可应用于设计课程、改良教学方法、推动学习动机以及帮助学生面对成长过程中所遇上的各项困难和挑战。&ldquo;教育心理学&rdquo;和&ldquo;学校心理学&rdquo;这两个名词经常交替使用，但通常从事理论工作及研究的人员较倾向称作教育心理学家，而在学校或学校相关埸所从事实务工作的就被归类为学校心理学家。教育心理学关注学生如何学习与发展，实务工作上特别关注有特殊教育需要的学生（不论是资优儿童或有情绪、行为问题等学童）。通过与其他学科的关系，对理解教育心理学也有一定的帮助。首先，教育心理学是以心理学为基础，两门学科之间的关系就像医学与生物学、或工程学与物理学之间的关系。然后，从教育心理学又可以发展出研究教育问题的众多特殊领域，包括教学设计、教育技术学、课程发展、组织学习（Organizational Learning）、特殊教育和课堂管理。教育心理学从认知科学及学习科学中得到养分，也回馈到这些学科之内。在大学里，教育心理学专业通常设于教育系内，原因可能是在心理学导论教材中常缺少教育心理学的内容。</p>', '2020-06-14 20:20:26', '2020-06-15 20:22:04');
INSERT INTO `edu_course_description` VALUES ('1272142165463633922', '<p>中国教育史是教育科学的重要分支,是初等教育专业的必修的专业基础课程。它运用历史唯物主义的观点研究中国自古至今教育制度和教育思想发生、发展变的过程,总结不同历史阶段教育的鳘验、教训及其特点,作出科学的评价,探索教育发展的客观规律。</p>\n<p>通过本课程的教学使学生了解中国教育发展的基本线素和一般规律,初步认识中国教育发展中的历史经验和教训。树立唯物辨证的教育发展观,扩太教育知识眼界,激励献身教的精为学习育学打下基,为提高教育管理水平增强历史借鉴。</p>\n<p>本课程以马克思主义为理论指导,使学生了解中国教育发展的基本线索和一般规律,初步认识中国教育发展中的历史经验和教训,培养运用辩证唯物主义和历史唯物主义观点和方法考察、分析教育问题的意识和能力。本课程的要求是:使学生了解中国各主要历史阶段社会政治、经济、文化概况与教育发展状况及其相互关系:了解各主要历史阶段文教政策的基本内容及其演变过程;了解各主要历史阶段的教育制度和学校管理的措施;了解著名教育家的主要教育活动并理能和掌握其主要教育思想，掌握中国教育发展更的基础知识,初步养成古为今用、以史鉴今的能力。</p>', '2020-06-14 20:21:42', '2020-06-15 20:23:14');
INSERT INTO `edu_course_description` VALUES ('1272142237567913986', '<p>《外国教育史》分为古代教育、中世du纪教育、近代教育、现代教育四编，共38章。古代教育编共4章，包括原始社会的教育、东方文明古国的教育、古希腊的教育、古罗马的教育。中世纪教育编共3章，对中世纪前期和后期的西欧、拜占廷与阿拉伯的教育予以详细论述。近代教育编和现代教育编以19世纪末20世纪初在欧洲发轫的&ldquo;新教育&rdquo;运动和思潮为分水岭，对主要发达国家和几个具有代表性的发展中国家的教育发展与改革状况予以介绍，其中近代教育编共15章，现代教育编共16章。《外国教育史》编者在编写过程中试图贯彻教育制度与教育思想并重、教育理论与教育实践并举、宏观文化背景之概览与微观教育史实之透视兼用、正规教育与非正规教育兼顾等原则，并在每一章的最后，对该章的基本史实和核心内容进行了高屋建瓴的理论分析和小结，体现了教材的准确性、权威性、前沿性。系统性、全面性和可理解性。</p>', '2020-06-14 20:21:59', '2020-06-15 20:23:42');
INSERT INTO `edu_course_description` VALUES ('1272142320019542017', '<p>粉笔不同于毛笔和其他硬笔，自身是笔杆又是笔头，而且板书是立式书写，手腕、手臂都要悬起，因此执粉笔的方法也不同于其他笔类的执法。通常采用&ldquo;三指法&rdquo;，即拇指、食指、中指三者齐力，把粉笔执牢。其中拇指、中指对应相抵，食指在前控制行笔方向，无名指和小指自然弯曲，起辅助作用。食指距离粉笔头约0.8厘米左右，如果离粉笔头太近，手指部位会靠在黑板上来回摩擦，影响书写；如果离笔头太远，无力控制行笔，写出的笔画会太轻而不清晰，还容易折断粉笔。另外，粉笔的笔身要处在掌心之内，笔身与黑板平面的夹角大约为45度。</p>\n<p>同时，执粉笔也须讲究指实掌虚。&ldquo;指实&rdquo;即手指执笔要紧而有力量，这样写出的字才能刚劲有力；&ldquo;掌虚&rdquo;就是手心不能握拳，而要留有一定的空间，使运笔灵活，这样写出的字则流利而不呆板。</p>', '2020-06-14 20:22:19', '2020-06-17 10:49:11');
INSERT INTO `edu_course_description` VALUES ('1272142394007064577', '', '2020-06-14 20:22:37', '2020-06-15 20:24:08');
INSERT INTO `edu_course_description` VALUES ('1272142476672602114', '', '2020-06-14 20:22:56', '2020-06-15 20:21:38');
INSERT INTO `edu_course_description` VALUES ('1272142893892603906', '', '2020-06-14 20:24:36', '2020-06-15 20:21:17');
INSERT INTO `edu_course_description` VALUES ('1272142944794677250', '', '2020-06-14 20:24:48', '2020-06-15 20:20:53');
INSERT INTO `edu_course_description` VALUES ('1272143021995036673', '', '2020-06-14 20:25:06', '2020-06-15 20:20:36');
INSERT INTO `edu_course_description` VALUES ('1272143086562152450', '', '2020-06-14 20:25:22', '2020-06-15 20:29:15');
INSERT INTO `edu_course_description` VALUES ('1272143133739683841', '', '2020-06-14 20:25:33', '2020-06-15 20:29:29');
INSERT INTO `edu_course_description` VALUES ('1272143217621569537', '', '2020-06-14 20:25:53', '2020-06-15 20:29:01');
INSERT INTO `edu_course_description` VALUES ('1272143340875386882', '', '2020-06-14 20:26:22', '2020-06-15 20:20:05');
INSERT INTO `edu_course_description` VALUES ('1272143416771317761', '', '2020-06-14 20:26:41', '2020-06-15 20:19:47');
INSERT INTO `edu_course_description` VALUES ('1272143472605892610', '', '2020-06-14 20:26:54', '2020-06-15 20:19:20');
INSERT INTO `edu_course_description` VALUES ('1272143709378547714', '', '2020-06-14 20:27:50', '2020-06-15 20:18:24');
INSERT INTO `edu_course_description` VALUES ('1272181783382822913', '<p>普通话（Standard Mandarin/Putonghua）是现代标准汉语的另一个称呼，是以北京语音为标准音，以北方官话为基础方言，以典范的现代白话文著作为语法规范的通用语。汉语不等同于普通话，推广普通话并不是要人为地消灭方言，主要是为了消除方言隔阂，以利社会交际，与人民使用传承方言并不矛盾。</p>\n<p>普通话作为联合国工作语言之一，已成为中外文化交流的重要桥梁和外国人学习汉语的首选语言。截至2015年，中国70%人口具备普通话应用能力，尚有约4亿人只局限于听懂的单向交流。《国家通用语言文字普及攻坚工程实施方案》计划&ldquo;到2020年，在全国范围内基本普及国家通用语言文字&rdquo;，具体为全国普通话普及率平均达到80%以上。</p>', '2020-06-14 22:59:08', '2020-06-21 12:24:49');
INSERT INTO `edu_course_description` VALUES ('1274562224203083778', '<p>去达成</p>', '2020-06-21 12:38:09', '2020-06-21 12:38:09');

-- ----------------------------
-- Table structure for edu_practice
-- ----------------------------
DROP TABLE IF EXISTS `edu_practice`;
CREATE TABLE `edu_practice`  (
  `id` int(0) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `score` int(0) NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程类别ID',
  `title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程科目' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1272141359578451970', '教师基础', '0', 0, '2020-06-14 20:18:30', '2020-06-14 20:18:30');
INSERT INTO `edu_subject` VALUES ('1272141360895463425', '教育原理', '1272141359578451970', 0, '2020-06-14 20:18:30', '2020-06-14 20:18:30');
INSERT INTO `edu_subject` VALUES ('1272141360937406465', '教学技能', '1272141359578451970', 0, '2020-06-14 20:18:30', '2020-06-14 20:18:30');
INSERT INTO `edu_subject` VALUES ('1272141361004515329', '班级管理', '0', 0, '2020-06-14 20:18:30', '2020-06-14 20:18:30');
INSERT INTO `edu_subject` VALUES ('1272141361046458370', '教学经验', '1272141361004515329', 0, '2020-06-14 20:18:30', '2020-06-14 20:18:30');
INSERT INTO `edu_subject` VALUES ('1272141361080012801', '知识学习', '0', 0, '2020-06-14 20:18:30', '2020-06-14 20:18:30');
INSERT INTO `edu_subject` VALUES ('1272141361117761538', '名师教学', '1272141361080012801', 0, '2020-06-14 20:18:30', '2020-06-14 20:18:30');
INSERT INTO `edu_subject` VALUES ('1272141361130344449', '知识拓展', '1272141361080012801', 0, '2020-06-14 20:18:30', '2020-06-14 20:18:30');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(0) UNSIGNED NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师头像',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '讲师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1', '唐迟', '近年主持国家自然科学基金（6项）、江苏省重大科技成果转化项目（5项）、江苏省产学研前瞻性联合研究项目（3项）、省工业科技支撑、省高技术、省自然科学基金等省部级及其企业的主要科研项目40多个，多个项目在企业成功转化，产生了较好的经济、社会和环境效益。积极开展产学研科技合作，并与省内16家企业建立了江苏省研究生工作站，其中6家为江苏省优秀研究生工作站', '高级', 1, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/19/c1c8be30228847de8f020b49c342acc1tangchi.jpg', 0, 0, '2019-10-30 14:18:46', '2020-06-19 13:01:09');
INSERT INTO `edu_teacher` VALUES ('1189389726308478977', '周阳', '高级讲师简介', '高级讲师资历', 2, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/19/2b5c10880ff44b4dbdd753d4929e7ac3zhouyang.jpg', 1, 0, '2019-10-30 11:53:03', '2020-06-19 13:03:23');
INSERT INTO `edu_teacher` VALUES ('1189390295668469762', '韩顺平', '高级讲师简介', '高级讲师', 2, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/19/771cc4debe684e3aa71b010e27be9130hanshunping.jpg', 2, 0, '2019-10-30 11:55:19', '2020-06-19 13:03:16');
INSERT INTO `edu_teacher` VALUES ('1189426437876985857', '汤家凤', '高级讲师简介', '高级讲师', 1, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/19/13db762b22c547dd95374ca0a21b2d37d88ef832f82ef3636e46903f81df9f0e.jpg', 0, 0, '2019-10-30 14:18:56', '2020-06-19 13:00:05');
INSERT INTO `edu_teacher` VALUES ('1189426464967995393', '罗翔', '高级讲师简介', '高级讲师', 1, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/19/15aa7761556b446c96a62057eb0fefd36fc013235d7fde07efd5a9ab45e5141a.jpg', 0, 0, '2019-10-30 14:19:02', '2020-06-19 12:58:51');
INSERT INTO `edu_teacher` VALUES ('1192249914833055746', '敬汉卿', '厉害', '高级讲师', 1, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/19/a165ff5bb9e547e2972042235c4adc30jhq.jpg', 0, 0, '2019-11-07 09:18:25', '2020-06-19 12:57:12');
INSERT INTO `edu_teacher` VALUES ('1192327476087115778', '徐大骚', '厉害', '大学教授', 1, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/19/6da0e0a83dcb4a51a6431f2ccc1559dcd818136cb788736fb86e04c995800a2b.jpg', 0, 0, '2019-11-07 14:26:37', '2020-06-19 12:59:21');
INSERT INTO `edu_teacher` VALUES ('2', '满洲里有象', '大帅逼', '博士', 1, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/04/18/%E9%BB%98%E8%AE%A4%E5%A4%B4%E5%83%8F.jpg', 0, 0, '2020-06-17 11:36:02', '2020-12-25 12:39:55');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `is_free` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT 0 COMMENT '视频时长（秒）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `version` bigint(0) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程视频' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('1272149218018037761', '1272141718954807298', '1272149133121130498', '第一讲：教育学的概念', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 20:49:44', '2020-06-14 20:49:44');
INSERT INTO `edu_video` VALUES ('1272150154698395649', '1272141718954807298', '1272149133121130498', '第二讲：教育学的产生与发展', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 20:53:27', '2020-06-14 20:53:27');
INSERT INTO `edu_video` VALUES ('1272150462946185217', '1272141718954807298', '1272149133121130498', '第三讲：中国教育学百年求索及学习教育学的意义', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 20:54:40', '2020-06-14 20:54:40');
INSERT INTO `edu_video` VALUES ('1272150679997222914', '1272141718954807298', '1272150578218242049', '第四讲：教育的质的规定性', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 20:55:32', '2020-06-14 20:55:32');
INSERT INTO `edu_video` VALUES ('1272150770816487426', '1272141718954807298', '1272150578218242049', '第五讲：教育的构成要素', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 20:55:54', '2020-06-14 20:55:54');
INSERT INTO `edu_video` VALUES ('1272150855369461761', '1272141718954807298', '1272150578218242049', '第六讲：教育的历史发展及教育的概念', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 20:56:14', '2020-06-14 20:56:14');
INSERT INTO `edu_video` VALUES ('1272151344765046786', '1272141718954807298', '1272151190574043138', '第七讲：人的发展概述', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 20:58:11', '2020-06-14 20:58:11');
INSERT INTO `edu_video` VALUES ('1272151604916752386', '1272141718954807298', '1272151190574043138', '第八讲：影响人的发展因素', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 20:59:13', '2020-06-14 20:59:13');
INSERT INTO `edu_video` VALUES ('1272151983637237761', '1272141718954807298', '1272151190574043138', '第九讲：教育对人的发展作用', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:00:43', '2020-06-14 21:00:43');
INSERT INTO `edu_video` VALUES ('1272152180157157378', '1272141718954807298', '1272152058581061634', '第十讲：教育的社会制约性', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:01:30', '2020-06-14 21:01:30');
INSERT INTO `edu_video` VALUES ('1272152261858004993', '1272141718954807298', '1272152058581061634', '第十一讲：教育的社会功能', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:01:49', '2020-06-14 21:01:49');
INSERT INTO `edu_video` VALUES ('1272152462706446338', '1272141718954807298', '1272152058581061634', '第十二讲：教育与我国的社会建设', NULL, NULL, 3, 0, 0, 0, 'Empty', 0, 1, '2020-06-14 21:02:37', '2020-06-14 21:02:37');
INSERT INTO `edu_video` VALUES ('1272152807327240193', '1272141718954807298', '1272152713307721730', '第十三讲：教育目的的概述', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:03:59', '2020-06-14 21:03:59');
INSERT INTO `edu_video` VALUES ('1272152867419033601', '1272141718954807298', '1272152713307721730', '第十四讲：教育目的的理论概述', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:04:14', '2020-06-14 21:04:14');
INSERT INTO `edu_video` VALUES ('1272152934192353282', '1272141718954807298', '1272152713307721730', '第十五讲：我国的教育目的', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:04:30', '2020-06-14 21:04:30');
INSERT INTO `edu_video` VALUES ('1272153067529277441', '1272141718954807298', '1272153008653832194', '第十六讲：课程概述', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:05:01', '2020-06-14 21:05:01');
INSERT INTO `edu_video` VALUES ('1272153114274795521', '1272141718954807298', '1272153008653832194', '第十七讲：课程设计', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:05:13', '2020-06-14 21:05:13');
INSERT INTO `edu_video` VALUES ('1272153168473591809', '1272141718954807298', '1272153008653832194', '第十八讲：课程改革', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:05:25', '2020-06-14 21:05:25');
INSERT INTO `edu_video` VALUES ('1272153282185367553', '1272141718954807298', '1272153233040707585', '第十九讲：教学概述', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:05:53', '2020-06-14 21:05:53');
INSERT INTO `edu_video` VALUES ('1272153331720097794', '1272141718954807298', '1272153233040707585', '第二十讲：教学过程的不同理解', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:06:04', '2020-06-14 21:06:04');
INSERT INTO `edu_video` VALUES ('1272153379363196929', '1272141718954807298', '1272153233040707585', '第二十一讲：教学过程的基本理论', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:06:16', '2020-06-14 21:06:16');
INSERT INTO `edu_video` VALUES ('1272153575321079810', '1272141718954807298', '1272153483600039937', '第二十讲：德育概述', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:07:02', '2020-06-14 21:07:02');
INSERT INTO `edu_video` VALUES ('1272153637606494210', '1272141718954807298', '1272153483600039937', '第二十三讲：品德发展规律', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:07:17', '2020-06-14 21:07:17');
INSERT INTO `edu_video` VALUES ('1272153705248034817', '1272141718954807298', '1272153483600039937', '第二十四讲：德育过程', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:07:33', '2020-06-14 21:07:33');
INSERT INTO `edu_video` VALUES ('1272153882834866177', '1272141718954807298', '1272153793718489089', '第二十五讲：教师劳动的特点、价值与角色扮演', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:08:16', '2020-06-14 21:08:16');
INSERT INTO `edu_video` VALUES ('1272153930649931777', '1272141718954807298', '1272153793718489089', '第二十六讲：教师的素养和专业发展', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 21:08:27', '2020-06-14 21:08:27');
INSERT INTO `edu_video` VALUES ('1272174217290420226', '1272141847711551489', '1272173320489504769', '第一讲：教育心理学绪论', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:29:04', '2020-06-14 22:29:04');
INSERT INTO `edu_video` VALUES ('1272174257455075330', '1272141847711551489', '1272173320489504769', '第二讲：教育心理学的发展', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:29:13', '2020-06-14 22:29:13');
INSERT INTO `edu_video` VALUES ('1272174301906309121', '1272141847711551489', '1272173320489504769', '第三讲：语言教育', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:29:24', '2020-06-14 22:29:24');
INSERT INTO `edu_video` VALUES ('1272174340103835650', '1272141847711551489', '1272173320489504769', '第四讲：教育心理学与教师', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:29:33', '2020-06-14 22:29:33');
INSERT INTO `edu_video` VALUES ('1272175204361146369', '1272141847711551489', '1272173864192937985', '第五讲：学生的认知发展1', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:32:59', '2020-06-14 22:32:59');
INSERT INTO `edu_video` VALUES ('1272175262955573250', '1272141847711551489', '1272173864192937985', '第六讲：学生的认知发展2', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:33:13', '2020-06-14 22:33:13');
INSERT INTO `edu_video` VALUES ('1272175309633982466', '1272141847711551489', '1272173864192937985', '第七讲：脑的发展', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:33:24', '2020-06-14 22:33:24');
INSERT INTO `edu_video` VALUES ('1272175358514401281', '1272141847711551489', '1272173864192937985', '第八讲：学生的社会性发展1', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:33:36', '2020-06-14 22:33:36');
INSERT INTO `edu_video` VALUES ('1272175411513626626', '1272141847711551489', '1272173864192937985', '第九讲：学生的社会性发展2', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:33:49', '2020-06-14 22:33:49');
INSERT INTO `edu_video` VALUES ('1272175494560845825', '1272141847711551489', '1272173864192937985', '第十讲：学生的社会性发展3', NULL, NULL, 6, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:34:08', '2020-06-14 22:34:08');
INSERT INTO `edu_video` VALUES ('1272175548969357313', '1272141847711551489', '1272173864192937985', '第十一讲：生理发展', NULL, NULL, 7, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:34:21', '2020-06-14 22:34:21');
INSERT INTO `edu_video` VALUES ('1272175594548858882', '1272141847711551489', '1272173909961183234', '第十二讲：学习心理概述', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:34:32', '2020-06-14 22:34:32');
INSERT INTO `edu_video` VALUES ('1272175651171962882', '1272141847711551489', '1272173909961183234', '第十三讲：首要学习原理', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:34:46', '2020-06-14 22:34:46');
INSERT INTO `edu_video` VALUES ('1272175704489955330', '1272141847711551489', '1272173909961183234', '第十四讲：行为主义学习论（上）', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:34:58', '2020-06-14 22:34:58');
INSERT INTO `edu_video` VALUES ('1272175750170120194', '1272141847711551489', '1272173909961183234', '第十五讲：行为主义学习论（下）', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:35:09', '2020-06-14 22:35:09');
INSERT INTO `edu_video` VALUES ('1272175794529079298', '1272141847711551489', '1272173909961183234', '第十六讲：认知学习论', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:35:20', '2020-06-14 22:35:20');
INSERT INTO `edu_video` VALUES ('1272175898656870401', '1272141847711551489', '1272173957834969089', '第十七讲：知识的学习', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:35:45', '2020-06-14 22:35:45');
INSERT INTO `edu_video` VALUES ('1272175951408631810', '1272141847711551489', '1272173957834969089', '第十八讲：知识分类学习论与教学论', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:35:57', '2020-06-14 22:35:57');
INSERT INTO `edu_video` VALUES ('1272176006064607234', '1272141847711551489', '1272173957834969089', '第十九讲：智力技能的学习', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:36:10', '2020-06-14 22:36:10');
INSERT INTO `edu_video` VALUES ('1272176048074756097', '1272141847711551489', '1272173957834969089', '第二十讲：动作技能的学习', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:36:20', '2020-06-14 22:36:20');
INSERT INTO `edu_video` VALUES ('1272176100780380162', '1272141847711551489', '1272173957834969089', '第二十一讲：态度的学习', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:36:33', '2020-06-14 22:36:33');
INSERT INTO `edu_video` VALUES ('1272176149870514177', '1272141847711551489', '1272173999882866689', '第二十二讲：自主学习', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:36:45', '2020-06-14 22:36:45');
INSERT INTO `edu_video` VALUES ('1272176193994592257', '1272141847711551489', '1272173999882866689', '第二十三讲：翻转课堂与自主学习', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:36:55', '2020-06-14 22:36:55');
INSERT INTO `edu_video` VALUES ('1272176250303123458', '1272141847711551489', '1272173999882866689', '第二十四讲：不同学习方式的适用条件', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:37:09', '2020-06-14 22:37:09');
INSERT INTO `edu_video` VALUES ('1272176311066005505', '1272141847711551489', '1272173999882866689', '第二十五讲：研究性学习', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:37:23', '2020-06-14 22:37:23');
INSERT INTO `edu_video` VALUES ('1272176359006900226', '1272141847711551489', '1272173999882866689', '第二十六讲：合作学习', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:37:35', '2020-06-14 22:37:35');
INSERT INTO `edu_video` VALUES ('1272176413742567426', '1272141847711551489', '1272173999882866689', '第二十七讲：体验式学习', NULL, NULL, 6, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:37:48', '2020-06-14 22:37:48');
INSERT INTO `edu_video` VALUES ('1272176478833971202', '1272141847711551489', '1272173999882866689', '第二十八讲：创新学习与教学', NULL, NULL, 7, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:38:03', '2020-06-14 22:38:03');
INSERT INTO `edu_video` VALUES ('1272176519204147201', '1272141847711551489', '1272174051183398914', '第二十九讲：学习动机概述', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:38:13', '2020-06-14 22:38:13');
INSERT INTO `edu_video` VALUES ('1272176561382068225', '1272141847711551489', '1272174051183398914', '第三十讲：学习动机激发的内外部条件', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:38:23', '2020-06-14 22:38:23');
INSERT INTO `edu_video` VALUES ('1272176602549161986', '1272141847711551489', '1272174051183398914', '第三十一讲：  学习动机理论及其教学应用', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:38:33', '2020-06-14 22:38:33');
INSERT INTO `edu_video` VALUES ('1272176641887539202', '1272141847711551489', '1272174106225250306', '第三十二讲：教学设计的基本原则', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:38:42', '2020-06-14 22:38:42');
INSERT INTO `edu_video` VALUES ('1272176688045854722', '1272141847711551489', '1272174106225250306', '第三十三讲：基于学习过程的教学设计', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:38:53', '2020-06-14 22:38:53');
INSERT INTO `edu_video` VALUES ('1272176735173054465', '1272141847711551489', '1272174106225250306', '第三十四讲：教学设计的基本环节', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:39:04', '2020-06-14 22:39:04');
INSERT INTO `edu_video` VALUES ('1272176794467930113', '1272141847711551489', '1272174106225250306', '第三十五讲：教学目标的设置', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:39:18', '2020-06-14 22:39:18');
INSERT INTO `edu_video` VALUES ('1272176843528704001', '1272141847711551489', '1272174106225250306', '第三十六讲：教学设计中的任务分析技术', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:39:30', '2020-06-14 22:39:30');
INSERT INTO `edu_video` VALUES ('1272176901976330242', '1272141847711551489', '1272174106225250306', '第三十七讲：教学中的动机设计', NULL, NULL, 6, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:39:44', '2020-06-14 22:39:44');
INSERT INTO `edu_video` VALUES ('1272176960293933057', '1272141847711551489', '1272174148730327041', '第三十八讲：教师中心式教学', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:39:58', '2020-06-14 22:39:58');
INSERT INTO `edu_video` VALUES ('1272177005156208641', '1272141847711551489', '1272174148730327041', '第三十九讲：学生中心式教学', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:40:09', '2020-06-14 22:40:09');
INSERT INTO `edu_video` VALUES ('1272177049590665217', '1272141847711551489', '1272175127374696450', '第四十讲：组织讨论和提问的策略', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:40:19', '2020-06-14 22:40:19');
INSERT INTO `edu_video` VALUES ('1272177096080330754', '1272141847711551489', '1272175127374696450', '第四十一讲：创建课堂环境,课堂管理策略', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:40:30', '2020-06-14 22:40:30');
INSERT INTO `edu_video` VALUES ('1272177468366753794', '1272142320019542017', '1272177297411117058', '第一讲：香港地区粉笔字数学实录', '4c621506833d4a4a9e6414a2b7914210', '1.香港地区老师粉笔字教学实录.mp4', 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:41:59', '2020-06-17 11:27:26');
INSERT INTO `edu_video` VALUES ('1272177508724346882', '1272142320019542017', '1272177297411117058', '第二讲：中小学书法教员铺导课实录', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:42:09', '2020-06-14 22:42:09');
INSERT INTO `edu_video` VALUES ('1272177545617444866', '1272142320019542017', '1272177297411117058', '第三讲：粉笔字专业程3', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:42:17', '2020-06-14 22:42:17');
INSERT INTO `edu_video` VALUES ('1272177588655198210', '1272142320019542017', '1272177339987496962', '第四讲：王红军老师讲写紛笔字第1集', '0cc7663a94a54fe4b62f7422f0a43377', '4.王红军老师讲写粉笔字第1集.mp4', 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:42:28', '2020-06-17 10:50:51');
INSERT INTO `edu_video` VALUES ('1272177627054051330', '1272142320019542017', '1272177339987496962', '第五讲：第2集', 'c318cfd0329d4d35aad3db3245a2698a', '5.第2集.mp4', 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:42:37', '2020-06-17 10:46:28');
INSERT INTO `edu_video` VALUES ('1272177666639892482', '1272142320019542017', '1272177339987496962', '第六讲：第3集', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:42:46', '2020-06-14 22:42:46');
INSERT INTO `edu_video` VALUES ('1272177702274699266', '1272142320019542017', '1272177339987496962', '第七讲：第4集', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:42:55', '2020-06-14 22:42:55');
INSERT INTO `edu_video` VALUES ('1272177738047918082', '1272142320019542017', '1272177339987496962', '第八讲：第5集', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:43:03', '2020-06-14 22:43:03');
INSERT INTO `edu_video` VALUES ('1272177780431360002', '1272142320019542017', '1272177339987496962', '第九讲：第6集', NULL, NULL, 6, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:43:13', '2020-06-14 22:43:13');
INSERT INTO `edu_video` VALUES ('1272177834714042369', '1272142320019542017', '1272177388297490434', '第十讲：吉建忠如何写好粉笔字01正确的坐和笔', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:43:26', '2020-06-14 22:43:26');
INSERT INTO `edu_video` VALUES ('1272177867194732546', '1272142320019542017', '1272177388297490434', '第十一讲：02 横竖的运用', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:43:34', '2020-06-14 22:43:34');
INSERT INTO `edu_video` VALUES ('1272177921221562370', '1272142320019542017', '1272177388297490434', '第十二讲：03点的运用', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:43:47', '2020-06-14 22:43:47');
INSERT INTO `edu_video` VALUES ('1272177973365149698', '1272142320019542017', '1272177388297490434', '第十三讲：04捺的运用', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:43:59', '2020-06-14 22:43:59');
INSERT INTO `edu_video` VALUES ('1272178024070090754', '1272142320019542017', '1272177388297490434', '第十四讲：05折的运用', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:44:12', '2020-06-14 22:44:12');
INSERT INTO `edu_video` VALUES ('1272178076972847106', '1272142320019542017', '1272177388297490434', '第十五讲：06钩的运用', NULL, NULL, 6, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:44:24', '2020-06-14 22:44:24');
INSERT INTO `edu_video` VALUES ('1272178131070980097', '1272142320019542017', '1272177388297490434', '第十六讲：07其它笔画的运用', NULL, NULL, 7, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:44:37', '2020-06-14 22:44:37');
INSERT INTO `edu_video` VALUES ('1272178178693107714', '1272142320019542017', '1272177388297490434', '第十七讲：08重心平衡', NULL, NULL, 8, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:44:48', '2020-06-14 22:44:48');
INSERT INTO `edu_video` VALUES ('1272178228387221505', '1272142320019542017', '1272177388297490434', '第十八讲：09主笔突出', NULL, NULL, 9, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:45:00', '2020-06-14 22:45:00');
INSERT INTO `edu_video` VALUES ('1272178267104841730', '1272142320019542017', '1272177428084658178', '第十九讲：10左右结构', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:45:09', '2020-06-14 22:45:09');
INSERT INTO `edu_video` VALUES ('1272178306187366402', '1272142320019542017', '1272177428084658178', '第二十讲：11上下结构', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:45:19', '2020-06-14 22:45:19');
INSERT INTO `edu_video` VALUES ('1272178375141724162', '1272142320019542017', '1272177428084658178', '第二十一讲：12包围结构标', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:45:35', '2020-06-14 22:45:35');
INSERT INTO `edu_video` VALUES ('1272178423313305601', '1272142320019542017', '1272177428084658178', '第二十二讲：13其它结构', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:45:47', '2020-06-14 22:45:47');
INSERT INTO `edu_video` VALUES ('1272178923932848130', '1272142165463633922', '1272178637650628609', '第一讲：中国故育史第01节', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:47:46', '2020-06-14 22:47:46');
INSERT INTO `edu_video` VALUES ('1272178958552633345', '1272142165463633922', '1272178637650628609', '第二讲：中国教育史第02节', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:47:54', '2020-06-14 22:47:54');
INSERT INTO `edu_video` VALUES ('1272178996259426306', '1272142165463633922', '1272178678415069186', '第三讲：中国教育史第03节', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:48:03', '2020-06-14 22:48:03');
INSERT INTO `edu_video` VALUES ('1272179041008455681', '1272142165463633922', '1272178678415069186', '第四讲：中国教育史第04节', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:48:14', '2020-06-14 22:48:14');
INSERT INTO `edu_video` VALUES ('1272179089658187778', '1272142165463633922', '1272178678415069186', '第五讲：中国教育史第05节', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:48:26', '2020-06-14 22:48:26');
INSERT INTO `edu_video` VALUES ('1272179138429554690', '1272142165463633922', '1272178723650637826', '第六讲：中国教育史第06节', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:48:37', '2020-06-14 22:48:37');
INSERT INTO `edu_video` VALUES ('1272179178074116098', '1272142165463633922', '1272178723650637826', '第七讲：中国教育史第07节', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:48:47', '2020-06-14 22:48:47');
INSERT INTO `edu_video` VALUES ('1272179215114014722', '1272142165463633922', '1272178723650637826', '第八讲：中国教育史第08节', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:48:55', '2020-06-14 22:48:55');
INSERT INTO `edu_video` VALUES ('1272179257564565506', '1272142165463633922', '1272178723650637826', '第九讲：中国教育史第09节', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:49:06', '2020-06-14 22:49:06');
INSERT INTO `edu_video` VALUES ('1272179300757508098', '1272142165463633922', '1272178760933806081', '第十讲：中国教育史第10节', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:49:16', '2020-06-14 22:49:16');
INSERT INTO `edu_video` VALUES ('1272179356130709505', '1272142165463633922', '1272178760933806081', '第十一讲：中国教育史第11节', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:49:29', '2020-06-14 22:49:29');
INSERT INTO `edu_video` VALUES ('1272179397050339329', '1272142165463633922', '1272178760933806081', '第十二讲：中国教育史第12节', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:49:39', '2020-06-14 22:49:39');
INSERT INTO `edu_video` VALUES ('1272179441333800962', '1272142165463633922', '1272178809558372353', '第十三讲：中国教育史第13节', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:49:49', '2020-06-14 22:49:49');
INSERT INTO `edu_video` VALUES ('1272179476364627970', '1272142165463633922', '1272178809558372353', '第十四讲：中国教育史第14节', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:49:58', '2020-06-14 22:49:58');
INSERT INTO `edu_video` VALUES ('1272179509805813761', '1272142165463633922', '1272178872250634241', '第十五讲：中国教育史第15节', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:50:06', '2020-06-14 22:50:06');
INSERT INTO `edu_video` VALUES ('1272179555863465986', '1272142165463633922', '1272178872250634241', '第十六讲：中国教育史第16节', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:50:17', '2020-06-14 22:50:17');
INSERT INTO `edu_video` VALUES ('1272180020747538433', '1272142237567913986', '1272179692731994114', '第一讲：史前社会及史前文化和教育', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:52:08', '2020-06-14 22:52:08');
INSERT INTO `edu_video` VALUES ('1272180054914338817', '1272142237567913986', '1272179692731994114', '第二讲：史前社会及史前文化和教育', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:52:16', '2020-06-14 22:52:16');
INSERT INTO `edu_video` VALUES ('1272180107158589441', '1272142237567913986', '1272179723736289281', '第三讲：东方文明古国的教育', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:52:28', '2020-06-14 22:52:28');
INSERT INTO `edu_video` VALUES ('1272180141124063233', '1272142237567913986', '1272179723736289281', '第四讲：东方文明古国的教育2', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:52:36', '2020-06-14 22:52:36');
INSERT INTO `edu_video` VALUES ('1272180177899720705', '1272142237567913986', '1272179758909722626', '第五讲：古希腊文化教育概述', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:52:45', '2020-06-14 22:52:45');
INSERT INTO `edu_video` VALUES ('1272180214184644609', '1272142237567913986', '1272179758909722626', '第六讲：斯巴达和雅典的教育', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:52:54', '2020-06-14 22:52:54');
INSERT INTO `edu_video` VALUES ('1272180257687965697', '1272142237567913986', '1272179758909722626', '第七讲：苏格拉底的教育思想', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:53:04', '2020-06-14 22:53:04');
INSERT INTO `edu_video` VALUES ('1272180300339843074', '1272142237567913986', '1272179758909722626', '第八讲：柏拉图的教育思想', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:53:14', '2020-06-14 22:53:14');
INSERT INTO `edu_video` VALUES ('1272180355696267265', '1272142237567913986', '1272179758909722626', '第九讲：亚里士多德的教育思想', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:53:27', '2020-06-14 22:53:27');
INSERT INTO `edu_video` VALUES ('1272180398671106049', '1272142237567913986', '1272179793361735681', '第十讲：古罗马社会与文化', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:53:38', '2020-06-14 22:53:38');
INSERT INTO `edu_video` VALUES ('1272180448247779330', '1272142237567913986', '1272179793361735681', '第十一讲：古罗马教育的发展', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:53:49', '2020-06-14 22:53:49');
INSERT INTO `edu_video` VALUES ('1272180491566551042', '1272142237567913986', '1272179793361735681', '第十二讲：古罗马的教育思想', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:54:00', '2020-06-14 22:54:00');
INSERT INTO `edu_video` VALUES ('1272180532171608066', '1272142237567913986', '1272179793361735681', '第十三讲：西欧中世纪文化和教育', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:54:10', '2020-06-14 22:54:10');
INSERT INTO `edu_video` VALUES ('1272180566057390081', '1272142237567913986', '1272179793361735681', '第十四讲：拜占庭的教育', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:54:18', '2020-06-14 22:54:18');
INSERT INTO `edu_video` VALUES ('1272180608235311106', '1272142237567913986', '1272179793361735681', '第十五讲：阿拉伯的教育', NULL, NULL, 6, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:54:28', '2020-06-14 22:54:28');
INSERT INTO `edu_video` VALUES ('1272180661729464322', '1272142237567913986', '1272179833689968642', '第十六讲：文艺复兴时期的教育', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:54:40', '2020-06-14 22:54:40');
INSERT INTO `edu_video` VALUES ('1272180703232102402', '1272142237567913986', '1272179833689968642', '第十七讲：宗教改革时期的教育', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:54:50', '2020-06-14 22:54:50');
INSERT INTO `edu_video` VALUES ('1272180739701575682', '1272142237567913986', '1272179878401249281', '第十八讲：近代英国的教育', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:54:59', '2020-06-14 22:54:59');
INSERT INTO `edu_video` VALUES ('1272180785457238017', '1272142237567913986', '1272179878401249281', '第十九讲：近代法国的教育', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:55:10', '2020-06-14 22:55:10');
INSERT INTO `edu_video` VALUES ('1272180839911886849', '1272142237567913986', '1272179878401249281', '第二十讲：近代德国和儀国的教育', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:55:23', '2020-06-14 22:55:23');
INSERT INTO `edu_video` VALUES ('1272180890969149441', '1272142237567913986', '1272179878401249281', ' 第二十一讲：近代美国的教育', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:55:35', '2020-06-14 22:55:35');
INSERT INTO `edu_video` VALUES ('1272180945931309057', '1272142237567913986', '1272179878401249281', '第二十二讲：近代日本的教育', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:55:48', '2020-06-14 22:55:48');
INSERT INTO `edu_video` VALUES ('1272181016856989698', '1272142237567913986', '1272179925704609794', '第二十三讲：欧洲新教育运动', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:56:05', '2020-06-14 22:56:05');
INSERT INTO `edu_video` VALUES ('1272181062025449474', '1272142237567913986', '1272179925704609794', '第二十四讲：美国进步教育运动', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:56:16', '2020-06-14 22:56:16');
INSERT INTO `edu_video` VALUES ('1272181099035987969', '1272142237567913986', '1272179925704609794', '第二十五讲：欧美教育科学化运动', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:56:25', '2020-06-14 22:56:25');
INSERT INTO `edu_video` VALUES ('1272181135073447937', '1272142237567913986', '1272179969455394818', '第二十六讲：新行为主义教育', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:56:33', '2020-06-14 22:56:33');
INSERT INTO `edu_video` VALUES ('1272181171308040194', '1272142237567913986', '1272179969455394818', '第二十七讲：人本主义教育', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 22:56:42', '2020-06-14 22:56:42');
INSERT INTO `edu_video` VALUES ('1272182168487038977', '1272181783382822913', '1272181878459305986', '第一讲：声母', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:00:40', '2020-06-14 23:00:40');
INSERT INTO `edu_video` VALUES ('1272182201080975362', '1272181783382822913', '1272181878459305986', '第二讲：韵母', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:00:47', '2020-06-14 23:00:47');
INSERT INTO `edu_video` VALUES ('1272182237655306241', '1272181783382822913', '1272181878459305986', '第三讲：轻声词语表', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:00:56', '2020-06-14 23:00:56');
INSERT INTO `edu_video` VALUES ('1272182274711982081', '1272181783382822913', '1272181878459305986', '第四讲：儿化词语表', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:01:05', '2020-06-14 23:01:05');
INSERT INTO `edu_video` VALUES ('1272182310975934466', '1272181783382822913', '1272181914672926722', '第五讲：白杨礼', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:01:14', '2020-06-14 23:01:14');
INSERT INTO `edu_video` VALUES ('1272182356136005633', '1272181783382822913', '1272181914672926722', '第六讲：差别', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:01:24', '2020-06-14 23:01:24');
INSERT INTO `edu_video` VALUES ('1272182414797541377', '1272181783382822913', '1272181914672926722', '第七讲：丑石', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:01:38', '2020-06-14 23:01:38');
INSERT INTO `edu_video` VALUES ('1272182462105096193', '1272181783382822913', '1272181914672926722', '第八讲：达端的故事', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:01:50', '2020-06-14 23:01:50');
INSERT INTO `edu_video` VALUES ('1272182499891580929', '1272181783382822913', '1272181947782762497', '第九讲：第一场雪', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:01:59', '2020-06-14 23:01:59');
INSERT INTO `edu_video` VALUES ('1272182539448061953', '1272181783382822913', '1272181947782762497', '第十讲：读书人是幸福人', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:02:08', '2020-06-14 23:02:08');
INSERT INTO `edu_video` VALUES ('1272182580812288002', '1272181783382822913', '1272181947782762497', '第十一讲：二十美金的价值', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:02:18', '2020-06-14 23:02:18');
INSERT INTO `edu_video` VALUES ('1272182628296003585', '1272181783382822913', '1272181947782762497', '第十二讲：繁星', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:02:29', '2020-06-14 23:02:29');
INSERT INTO `edu_video` VALUES ('1272182667701489666', '1272181783382822913', '1272181992879919105', '第十三讲：风筝畅想曲', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:02:39', '2020-06-14 23:02:39');
INSERT INTO `edu_video` VALUES ('1272182708189106177', '1272181783382822913', '1272181992879919105', '第十四讲：父亲的爱', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:02:48', '2020-06-14 23:02:48');
INSERT INTO `edu_video` VALUES ('1272182756075474946', '1272181783382822913', '1272181992879919105', '第十五讲：国家荣誉感', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:03:00', '2020-06-14 23:03:00');
INSERT INTO `edu_video` VALUES ('1272182801273294849', '1272181783382822913', '1272181992879919105', '第十六讲：海滨仲夏夜', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:03:10', '2020-06-14 23:03:10');
INSERT INTO `edu_video` VALUES ('1272182844315242497', '1272181783382822913', '1272182029684936705', '第十七讲：海洋与生命', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:03:21', '2020-06-14 23:03:21');
INSERT INTO `edu_video` VALUES ('1272182885272621057', '1272181783382822913', '1272182029684936705', '第十八讲：和时间跑', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:03:31', '2020-06-14 23:03:31');
INSERT INTO `edu_video` VALUES ('1272182937026138113', '1272181783382822913', '1272182029684936705', '第十九讲：胡适的白话电报', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:03:43', '2020-06-14 23:03:43');
INSERT INTO `edu_video` VALUES ('1272182990180552705', '1272181783382822913', '1272182029684936705', '第二十讲：火光', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:03:56', '2020-06-14 23:03:56');
INSERT INTO `edu_video` VALUES ('1272183032031318017', '1272181783382822913', '1272182029684936705', '第二十一讲：济南的冬天', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:04:06', '2020-06-14 23:04:06');
INSERT INTO `edu_video` VALUES ('1272183070946070529', '1272181783382822913', '1272182029684936705', '第二十二讲：家乡的桥', NULL, NULL, 6, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:04:15', '2020-06-14 23:04:15');
INSERT INTO `edu_video` VALUES ('1272183121785229314', '1272181783382822913', '1272182089009172482', '第二十三讲：坚守你的高贵', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:04:27', '2020-06-14 23:04:27');
INSERT INTO `edu_video` VALUES ('1272183154303668225', '1272181783382822913', '1272182089009172482', '第二十四讲：金子', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:04:35', '2020-06-14 23:04:35');
INSERT INTO `edu_video` VALUES ('1272183186721443841', '1272181783382822913', '1272182089009172482', '第二十五讲：捐诚', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:04:42', '2020-06-14 23:04:42');
INSERT INTO `edu_video` VALUES ('1272183218627514369', '1272181783382822913', '1272182089009172482', '第二十六讲：可爱的小鸟', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:04:50', '2020-06-14 23:04:50');
INSERT INTO `edu_video` VALUES ('1272183252584599554', '1272181783382822913', '1272182089009172482', '第二十七讲：课不能停', NULL, NULL, 5, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:04:58', '2020-06-14 23:04:58');
INSERT INTO `edu_video` VALUES ('1272183308255596546', '1272181783382822913', '1272182089009172482', '第二十八讲：莲花与校花', NULL, NULL, 6, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:05:11', '2020-06-14 23:05:11');
INSERT INTO `edu_video` VALUES ('1272183353860263937', '1272181783382822913', '1272182129412902914', '第二十九讲：銀', NULL, NULL, 1, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:05:22', '2020-06-14 23:05:22');
INSERT INTO `edu_video` VALUES ('1272183392875679746', '1272181783382822913', '1272182129412902914', '第三十讲：落花生', NULL, NULL, 2, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:05:32', '2020-06-14 23:05:32');
INSERT INTO `edu_video` VALUES ('1272183437607931905', '1272181783382822913', '1272182129412902914', '第三十一讲：麻筐', NULL, NULL, 3, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:05:42', '2020-06-14 23:05:42');
INSERT INTO `edu_video` VALUES ('1272183472462598146', '1272181783382822913', '1272182129412902914', '第三十二讲：迷途笛音', NULL, NULL, 4, 0, 1, 0, 'Empty', 0, 1, '2020-06-14 23:05:51', '2020-06-14 23:05:51');
INSERT INTO `edu_video` VALUES ('1274562286660464642', '1274562224203083778', '1274562258202112001', '1', NULL, NULL, 0, 0, 0, 0, 'Empty', 0, 1, '2020-06-21 12:38:24', '2020-06-21 12:38:43');

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `id` int(0) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `age` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `statistics_daily`;
CREATE TABLE `statistics_daily`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `date_calculated` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计日期',
  `register_num` int(0) NOT NULL DEFAULT 0 COMMENT '注册人数',
  `login_num` int(0) NOT NULL DEFAULT 0 COMMENT '登录人数',
  `video_view_num` int(0) NOT NULL DEFAULT 0 COMMENT '每日播放视频数',
  `course_num` int(0) NOT NULL DEFAULT 0 COMMENT '每日新增课程数',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statistics_day`(`date_calculated`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站统计日数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of statistics_daily
-- ----------------------------
INSERT INTO `statistics_daily` VALUES ('1', '2020-03-10', 40, 156, 180, 168, '2020-03-03 17:56:23', '2020-03-13 17:56:34');
INSERT INTO `statistics_daily` VALUES ('1249612480813064193', '2020-03-09', 50, 170, 167, 178, '2020-04-13 16:16:47', '2020-04-13 16:16:47');
INSERT INTO `statistics_daily` VALUES ('1249638178407866369', '2019-01-19', 6, 133, 108, 174, '2020-04-13 17:58:54', '2020-04-13 17:58:54');
INSERT INTO `statistics_daily` VALUES ('1250317948900614146', '2020-04-15', 0, 109, 111, 132, '2020-04-15 15:00:03', '2020-04-15 15:00:03');
INSERT INTO `statistics_daily` VALUES ('1263017487348387841', '2020-04-13', 0, 185, 153, 132, '2020-05-20 16:03:29', '2020-05-20 16:03:29');
INSERT INTO `statistics_daily` VALUES ('1263020703175790594', '2020-04-14', 0, 181, 169, 197, '2020-05-20 16:16:16', '2020-05-20 16:16:16');
INSERT INTO `statistics_daily` VALUES ('1271834856908713985', '2020-06-13', 0, 154, 117, 157, '2020-06-14 00:00:34', '2020-06-14 00:00:34');
INSERT INTO `statistics_daily` VALUES ('1272197145704837122', '2020-06-14', 0, 196, 152, 151, '2020-06-15 00:00:10', '2020-06-15 00:00:10');
INSERT INTO `statistics_daily` VALUES ('1273076163706671105', '2020-04-16', 1, 183, 136, 144, '2020-06-17 10:13:05', '2020-06-17 10:13:05');
INSERT INTO `statistics_daily` VALUES ('1273076163706671106', '2020-04-16', 1, 117, 131, 147, '2020-06-17 10:13:05', '2020-06-17 10:13:05');
INSERT INTO `statistics_daily` VALUES ('1273097453553373186', '2020-06-18', 0, 145, 148, 125, '2020-06-17 11:37:41', '2020-06-17 11:37:41');
INSERT INTO `statistics_daily` VALUES ('1274009162656800769', '2020-06-19', 0, 193, 106, 158, '2020-06-20 00:00:29', '2020-06-20 00:00:29');
INSERT INTO `statistics_daily` VALUES ('1274589754242912257', '2020-04-09', 0, 138, 196, 144, '2020-06-21 14:27:33', '2020-06-21 14:27:33');
INSERT INTO `statistics_daily` VALUES ('1274590454586822657', '2020-06-21', 0, 197, 100, 107, '2020-06-21 14:30:20', '2020-06-21 14:30:20');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '订单金额（分）',
  `pay_type` tinyint(0) NULL DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(0) NULL DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1280051689914638337', '20200706161119340', '1272142320019542017', '粉笔字', 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/15/e48571380720481b976e52bf0acb1e1e粉笔字.jpg', '罗翔', '1252580491287097345', '曾锦明', '18650341991', 0.01, 1, 1, 0, '2020-07-06 16:11:20', '2020-07-06 16:11:36');

-- ----------------------------
-- Table structure for t_pay_log
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_log`;
CREATE TABLE `t_pay_log`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '支付金额（分）',
  `transaction_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '其他属性',
  `is_deleted` tinyint(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_pay_log
-- ----------------------------
INSERT INTO `t_pay_log` VALUES ('1274591658138140674', '20200621143430790', '2020-06-21 14:35:07', 0.01, '4200000616202006212854202207', 'SUCCESS', 1, '{\"transaction_id\":\"4200000616202006212854202207\",\"nonce_str\":\"eQOQdcx0RZUAW2Ob\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuNXDVRuzZ_kd6bfqbsPRIvA\",\"sign\":\"71C69200CBFFC4B51DA1B50786951E3C\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20200621143430790\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20200621143506\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2020-06-21 14:35:07', '2020-06-21 14:35:07');
INSERT INTO `t_pay_log` VALUES ('1280051584188817410', '20200706160921140', '2020-07-06 16:10:55', 0.01, '4200000619202007063793519571', 'SUCCESS', 1, '{\"transaction_id\":\"4200000619202007063793519571\",\"nonce_str\":\"fHELWhQf3bwOyi8U\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuNXDVRuzZ_kd6bfqbsPRIvA\",\"sign\":\"12943B7F6CD5D511730B29C058BB1473\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20200706160921140\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20200706161053\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2020-07-06 16:10:55', '2020-07-06 16:10:55');
INSERT INTO `t_pay_log` VALUES ('1280051759443615745', '20200706161119340', '2020-07-06 16:11:36', 0.01, '4200000616202007065590725921', 'SUCCESS', 1, '{\"transaction_id\":\"4200000616202007065590725921\",\"nonce_str\":\"oOiKPkjjvDrZFjnP\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuNXDVRuzZ_kd6bfqbsPRIvA\",\"sign\":\"C6DFAB030F1D7471D7D230342E839F04\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20200706161119340\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20200706161134\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2020-07-06 16:11:36', '2020-07-06 16:11:36');

-- ----------------------------
-- Table structure for ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_member`;
CREATE TABLE `ucenter_member`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ucenter_member
-- ----------------------------
INSERT INTO `ucenter_member` VALUES ('1250779827963809793', 'o3_SC51Vs-W9OB8nz2cFj0noLpVw', '', NULL, 'Jm-zZz', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL3VCaNs9dk92ZbRkmXckpJiaehiarXzwOcHM1nlzITt8L1sdRNOYqx3DQmicQ2icIGtyaxIwqDx3O0cQ/132', NULL, 0, 0, '2020-04-16 21:35:24', '2020-04-16 21:35:24');
INSERT INTO `ucenter_member` VALUES ('1252580491287097345', NULL, '18650341991', '96e79218965eb72c92a549dd5a330112', '曾锦明', 2, 20, 'https://edu-zjm.oss-cn-beijing.aliyuncs.com/2020/06/14/46c4f4e4bcb140a996b46e3d7e71c8f9鍥芥棗鐝_IMG_20181011_094906.jpg', '软件工程软技一班', 0, 0, '2020-04-21 20:50:36', '2020-06-21 14:36:47');
INSERT INTO `ucenter_member` VALUES ('1273098458739269634', NULL, '13065115690', '96e79218965eb72c92a549dd5a330112', '杨同学', 2, 0, 'https://guli-file-191125.oss-cn-beijing.aliyuncs.com/avatar/default.jpg', NULL, 0, 0, '2020-06-17 11:41:40', '2020-06-19 21:09:23');

SET FOREIGN_KEY_CHECKS = 1;
