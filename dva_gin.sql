/*
 Navicat Premium Data Transfer

 Source Server         : Hina
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : dva_gin

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 16/08/2021 21:15:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `v0` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `v1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `v2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `v3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `v4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `v5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_casbin_rule`(`ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES (12, 'p', '2', '/admin/permission/dept/', 'GET', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES (13, 'p', '2', '/admin/permission/menus/', 'GET', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES (11, 'p', '2', '/admin/permission/post/', 'GET', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES (14, 'p', '2', '/admin/permission/role/', 'GET', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES (15, 'p', '2', '/admin/permission/user/', 'GET', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES (10, 'p', '2', '/admin/system/config/', 'GET', NULL, NULL, NULL);
INSERT INTO `casbin_rule` VALUES (9, 'p', '2', '/admin/system/dict/type', 'GET', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_config_settings
-- ----------------------------
DROP TABLE IF EXISTS `sys_config_settings`;
CREATE TABLE `sys_config_settings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '\'创建时间\'',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '\'修改时间\'',
  `deleted_at` datetime NULL DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `config_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `config_key` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `config_value` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `config_type` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_config_settings_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config_settings
-- ----------------------------
INSERT INTO `sys_config_settings` VALUES (1, '2021-02-27 07:14:49', '2021-02-27 07:14:49', NULL, '1', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y');
INSERT INTO `sys_config_settings` VALUES (2, '2021-02-27 07:15:14', '2021-02-27 07:15:14', NULL, '1', '初始化密码 123456', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y');
INSERT INTO `sys_config_settings` VALUES (3, '2021-02-27 07:15:36', '2021-02-27 07:15:36', NULL, '1', '深色主题theme-dark，浅色主题theme-light', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y');
INSERT INTO `sys_config_settings` VALUES (4, '2021-08-11 21:19:10', '2021-08-11 21:47:35', '2021-08-11 21:47:40', '0', 'test111', 'test111', 'test111', 'test111', 'N');
INSERT INTO `sys_config_settings` VALUES (5, '2021-08-11 21:40:16', '2021-08-11 21:40:16', '2021-08-11 21:47:40', '1', 't1', 't1', 't1', 't1', 'Y');

-- ----------------------------
-- Table structure for sys_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_depts`;
CREATE TABLE `sys_depts`  (
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `dept_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '\'部门id\'',
  `dept_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'部门名称\'',
  `order_num` tinyint NULL DEFAULT NULL COMMENT '\'显示排序\'',
  `parent_id` tinyint NULL DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint NULL DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `leader` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领导',
  PRIMARY KEY (`dept_id`) USING BTREE,
  UNIQUE INDEX `dept_id`(`dept_id`) USING BTREE,
  INDEX `idx_sys_depts_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_depts
-- ----------------------------
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:26:21', '2021-02-27 07:26:21', NULL, 1, 'XX创新科技', 1, 0, 1, '15888888888', 'cxkj@qq.com', '老王');
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:25:09', '2021-02-27 07:25:09', NULL, 2, '北京总公司', 1, 1, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:26:14', '2021-02-27 07:26:14', NULL, 3, '上海分公司', 2, 1, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:26:02', '2021-02-27 07:26:02', NULL, 4, '杭州分公司', 4, 1, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:28:16', '2021-02-27 07:28:16', NULL, 5, '深圳分公司', 3, 1, 0, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:26:38', '2021-02-27 07:26:38', NULL, 6, '研发部门', 1, 2, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:26:48', '2021-02-27 07:26:48', NULL, 7, '市场部门', 2, 2, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:26:57', '2021-02-27 07:26:57', NULL, 8, '测试部门', 3, 2, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:27:06', '2021-02-27 07:27:06', NULL, 9, '财务部门', 4, 2, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:27:15', '2021-02-27 07:27:15', NULL, 10, '运维部门', 5, 2, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:27:25', '2021-02-27 07:27:25', NULL, 11, '市场部门', 1, 3, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:27:34', '2021-02-27 07:27:34', NULL, 12, '财务部门', 2, 3, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:28:20', '2021-02-27 07:28:20', NULL, 13, '市场部门', 1, 5, 0, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:28:23', '2021-02-27 07:28:23', NULL, 14, '财务部门', 2, 5, 0, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:28:03', '2021-02-27 07:28:03', NULL, 15, '市场部门', 1, 4, 1, NULL, NULL, NULL);
INSERT INTO `sys_depts` VALUES ('2021-02-27 07:28:11', '2021-02-27 07:28:11', NULL, 16, '财务部门', 2, 4, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '\'创建时间\'',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '\'修改时间\'',
  `deleted_at` datetime NULL DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dict_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dict_type` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_dict_data_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, '2021-02-27 06:22:24', '2021-02-27 06:22:24', NULL, '1', '用户性别列表', '用户性别', 'sys_user_sex');
INSERT INTO `sys_dict_data` VALUES (2, '2021-02-27 06:24:38', '2021-02-27 06:24:38', NULL, '1', '菜单状态列表', '菜单状态', 'sys_show_hide');
INSERT INTO `sys_dict_data` VALUES (3, '2021-02-27 06:24:55', '2021-02-27 06:24:55', NULL, '1', '系统开关列表', '系统开关', 'sys_normal_disable');
INSERT INTO `sys_dict_data` VALUES (4, '2021-02-27 06:25:17', '2021-02-27 06:25:17', NULL, '1', '任务状态列表', '任务状态', 'sys_job_status');
INSERT INTO `sys_dict_data` VALUES (5, '2021-02-27 06:25:35', '2021-02-27 06:25:35', NULL, '1', '任务分组列表', '任务分组', 'sys_job_group');
INSERT INTO `sys_dict_data` VALUES (6, '2021-02-27 06:26:01', '2021-02-27 06:26:01', NULL, '1', '系统是否列表', '系统是否', 'sys_yes_no');
INSERT INTO `sys_dict_data` VALUES (7, '2021-02-27 06:26:18', '2021-02-27 06:26:18', NULL, '1', '通知类型列表', '通知类型', 'sys_notice_type');
INSERT INTO `sys_dict_data` VALUES (8, '2021-02-27 06:26:42', '2021-02-27 06:26:42', NULL, '1', '通知状态列表', '通知状态', 'sys_notice_status');
INSERT INTO `sys_dict_data` VALUES (9, '2021-02-27 06:26:58', '2021-02-27 06:26:58', NULL, '1', '操作类型列表', '操作类型', 'sys_oper_type');
INSERT INTO `sys_dict_data` VALUES (10, '2021-02-27 06:27:16', '2021-02-27 06:27:16', NULL, '1', '登录状态列表', '系统状态', 'sys_common_status');
INSERT INTO `sys_dict_data` VALUES (11, '2021-02-27 07:59:30', '2021-02-27 07:59:30', NULL, '1', '菜单类型', '菜单类型', 'sys_menu_type');
INSERT INTO `sys_dict_data` VALUES (12, '2021-02-27 07:59:48', '2021-02-27 07:59:48', NULL, '1', '接口请求方式', '接口请求方式', 'sys_interface_method');
INSERT INTO `sys_dict_data` VALUES (13, '2021-03-07 14:27:51', '2021-03-07 15:06:34', NULL, '1', '消息通知类型', '消息类型', 'sys_message_push_type');
INSERT INTO `sys_dict_data` VALUES (14, '2021-03-07 15:06:01', '2021-03-07 15:06:39', NULL, '1', '消息通知状态', '消息状态', 'sys_message_push_status');
INSERT INTO `sys_dict_data` VALUES (15, '2021-08-11 17:14:36', '2021-08-11 17:14:45', '2021-08-11 17:14:58', '0', 'test1', 'test1', 'test1');

-- ----------------------------
-- Table structure for sys_dict_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_details`;
CREATE TABLE `sys_dict_details`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '\'创建时间\'',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '\'修改时间\'',
  `deleted_at` datetime NULL DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dict_label` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dict_value` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_default` tinyint(1) NULL DEFAULT NULL,
  `dict_data_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '关联字典数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_dict_details_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_details
-- ----------------------------
INSERT INTO `sys_dict_details` VALUES (1, '2021-02-27 06:28:44', '2021-02-27 07:10:42', NULL, '1', '性别男', '男', '0', '1', 0, 1);
INSERT INTO `sys_dict_details` VALUES (2, '2021-02-27 06:29:04', '2021-02-27 06:29:34', NULL, '1', '性别女', '女', '1', '2', 0, 1);
INSERT INTO `sys_dict_details` VALUES (3, '2021-02-27 06:29:18', '2021-02-27 06:29:52', NULL, '1', '性别未知', '未知', '2', '3', 1, 1);
INSERT INTO `sys_dict_details` VALUES (4, '2021-02-27 06:31:39', '2021-02-27 07:10:28', NULL, '1', '显示菜单', '显示', '1', '1', 1, 2);
INSERT INTO `sys_dict_details` VALUES (5, '2021-02-27 06:33:07', '2021-02-27 07:10:31', NULL, '1', '隐藏菜单', '隐藏', '0', '2', 0, 2);
INSERT INTO `sys_dict_details` VALUES (6, '2021-02-27 07:00:47', '2021-02-27 07:00:47', NULL, '1', '正常状态', '正常', '1', '1', 1, 3);
INSERT INTO `sys_dict_details` VALUES (7, '2021-02-27 07:01:03', '2021-02-27 07:01:03', NULL, '1', '停用状态', '停用', '0', '2', 0, 3);
INSERT INTO `sys_dict_details` VALUES (8, '2021-02-27 07:01:44', '2021-02-27 07:02:03', NULL, '1', '正常状态', '正常', '1', '1', 1, 4);
INSERT INTO `sys_dict_details` VALUES (9, '2021-02-27 07:01:59', '2021-02-27 07:01:59', NULL, '1', '停用状态', '暂停', '0', '2', 0, 4);
INSERT INTO `sys_dict_details` VALUES (10, '2021-02-27 07:02:51', '2021-02-27 07:02:51', NULL, '1', '默认分组', '默认', 'DEFAULT', '1', 1, 5);
INSERT INTO `sys_dict_details` VALUES (11, '2021-02-27 07:03:14', '2021-02-27 07:03:14', NULL, '1', '系统分组', '系统', 'SYSTEM', '2', 0, 5);
INSERT INTO `sys_dict_details` VALUES (12, '2021-02-27 07:03:43', '2021-02-27 07:03:43', NULL, '1', '系统默认是', '是', 'Y', '1', 1, 6);
INSERT INTO `sys_dict_details` VALUES (13, '2021-02-27 07:04:01', '2021-02-27 07:04:01', NULL, '1', '系统默认否', '否', 'N', '2', 0, 6);
INSERT INTO `sys_dict_details` VALUES (14, '2021-02-27 07:04:25', '2021-02-27 07:04:25', NULL, '1', '通知', '通知', '1', '1', 1, 7);
INSERT INTO `sys_dict_details` VALUES (15, '2021-02-27 07:04:48', '2021-02-27 07:04:48', NULL, '1', '公告', '公告', '2', '2', 0, 7);
INSERT INTO `sys_dict_details` VALUES (16, '2021-02-27 07:05:14', '2021-02-27 07:05:20', NULL, '1', '正常状态', '正常', '1', '1', 1, 8);
INSERT INTO `sys_dict_details` VALUES (17, '2021-02-27 07:05:37', '2021-02-27 07:05:37', NULL, '1', '关闭状态', '关闭', '0', '2', 0, 8);
INSERT INTO `sys_dict_details` VALUES (18, '2021-02-27 07:06:11', '2021-02-27 07:06:46', NULL, '1', '新增操作', '新增', '1', '1', 0, 9);
INSERT INTO `sys_dict_details` VALUES (19, '2021-02-27 07:06:25', '2021-02-27 07:06:25', NULL, '1', '修改操作', '修改', '2', '2', 0, 9);
INSERT INTO `sys_dict_details` VALUES (20, '2021-02-27 07:06:43', '2021-02-27 07:06:43', NULL, '1', '删除操作', '删除', '3', '3', 0, 9);
INSERT INTO `sys_dict_details` VALUES (21, '2021-02-27 07:07:01', '2021-02-27 07:07:01', NULL, '1', '授权操作', '授权', '4', '4', 0, 9);
INSERT INTO `sys_dict_details` VALUES (22, '2021-02-27 07:07:39', '2021-02-27 07:07:39', NULL, '1', '导出操作', '导出', '5', '5', 0, 9);
INSERT INTO `sys_dict_details` VALUES (23, '2021-02-27 07:08:09', '2021-02-27 07:08:09', NULL, '1', '导入操作', '导入', '6', '6', 0, 9);
INSERT INTO `sys_dict_details` VALUES (24, '2021-02-27 07:08:33', '2021-02-27 07:08:33', NULL, '1', '强退操作', '强退', '7', '7', 0, 9);
INSERT INTO `sys_dict_details` VALUES (25, '2021-02-27 07:08:48', '2021-02-27 07:08:48', NULL, '1', '生成操作', '生成', '8', '8', 0, 9);
INSERT INTO `sys_dict_details` VALUES (26, '2021-02-27 07:09:04', '2021-02-27 07:09:13', NULL, '1', '清空操作', '清空', '9', '9', 0, 9);
INSERT INTO `sys_dict_details` VALUES (27, '2021-02-27 07:09:37', '2021-02-27 07:09:37', NULL, '1', '正常状态', '正常', '1', '1', 0, 10);
INSERT INTO `sys_dict_details` VALUES (28, '2021-02-27 07:10:03', '2021-02-27 07:10:17', NULL, '1', '停用状态', '停用', '0', '2', 0, 10);
INSERT INTO `sys_dict_details` VALUES (29, '2021-02-27 08:00:07', '2021-02-27 08:00:07', NULL, '1', '目录', '目录', '0', '1', 1, 11);
INSERT INTO `sys_dict_details` VALUES (30, '2021-02-27 08:00:22', '2021-02-27 08:00:28', NULL, '1', '菜单', '菜单', '1', '2', 0, 11);
INSERT INTO `sys_dict_details` VALUES (31, '2021-02-27 08:00:46', '2021-02-27 08:00:46', NULL, '1', '按钮', '按钮', '2', '3', 0, 11);
INSERT INTO `sys_dict_details` VALUES (32, '2021-02-27 08:02:23', '2021-02-27 08:02:23', NULL, '1', NULL, 'GET', 'GET', '1', 1, 12);
INSERT INTO `sys_dict_details` VALUES (33, '2021-02-27 08:02:38', '2021-02-27 08:02:38', NULL, '1', NULL, 'POST', 'POST', '2', 0, 12);
INSERT INTO `sys_dict_details` VALUES (34, '2021-02-27 08:02:57', '2021-02-27 08:02:57', NULL, '1', NULL, 'PUT', 'PUT', '3', 0, 12);
INSERT INTO `sys_dict_details` VALUES (35, '2021-02-27 08:03:20', '2021-02-27 08:03:20', NULL, '1', NULL, 'PATCH', 'PATCH', '4', 0, 12);
INSERT INTO `sys_dict_details` VALUES (36, '2021-02-27 08:03:32', '2021-02-27 08:03:32', NULL, '1', NULL, 'DELETE', 'DELETE', '5', 0, 12);
INSERT INTO `sys_dict_details` VALUES (37, '2021-02-27 08:03:41', '2021-02-27 08:03:41', NULL, '0', NULL, 'HEAD', 'HEAD', '6', 0, 12);
INSERT INTO `sys_dict_details` VALUES (38, '2021-02-27 08:03:51', '2021-02-27 08:03:51', NULL, '0', NULL, 'OPTIONS', 'OPTIONS', '7', 0, 12);
INSERT INTO `sys_dict_details` VALUES (39, '2021-02-27 08:04:00', '2021-02-27 08:04:00', NULL, '0', NULL, 'TRACE', 'TRACE', '8', 0, 12);
INSERT INTO `sys_dict_details` VALUES (40, '2021-03-07 14:29:11', '2021-03-07 14:29:11', NULL, '1', '消息通知', '消息通知', '1', '1', 1, 13);
INSERT INTO `sys_dict_details` VALUES (41, '2021-03-07 14:29:27', '2021-03-07 14:29:40', NULL, '1', '文件下发', '文件下发', '2', '2', 0, 13);
INSERT INTO `sys_dict_details` VALUES (42, '2021-03-07 15:07:23', '2021-03-07 15:07:23', NULL, '1', '消息发送状态：待发送', '待发送', '1', '1', 1, 14);
INSERT INTO `sys_dict_details` VALUES (43, '2021-03-07 15:07:32', '2021-03-07 15:07:32', NULL, '1', '消息发送状态：已发送', '已发送', '2', '2', 0, 14);
INSERT INTO `sys_dict_details` VALUES (44, '2021-08-11 19:46:02', '2021-08-11 19:46:29', '2021-08-11 19:46:48', '1', '222222', '22', '22', '5', 0, 1);

-- ----------------------------
-- Table structure for sys_login_infos
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_infos`;
CREATE TABLE `sys_login_infos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '\'创建时间\'',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '\'修改时间\'',
  `deleted_at` datetime NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `browser` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ipaddr` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_location` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `os` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `userName` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_login_infos_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_infos
-- ----------------------------
INSERT INTO `sys_login_infos` VALUES (1, '2021-08-05 19:27:27', '2021-08-05 19:27:27', NULL, 2638810865209344, 'Chrome 92.0.4515', '127.0.0.1', '广东省深圳市龙岗区 电信ADSL', '登录成功', 'Windows 10', 1, 'admin');
INSERT INTO `sys_login_infos` VALUES (2, '2021-08-05 20:02:30', '2021-08-05 20:02:30', NULL, 2638810865209345, 'Chrome 92.0.4515', '127.0.0.1', '\r\n上海市 电信', '登录成功', 'Windows 10', 1, 'hina');
INSERT INTO `sys_login_infos` VALUES (15, '2021-08-13 21:51:40', '2021-08-13 21:51:40', NULL, 2638810865209344, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '验证码错误', 'Windows 10', 0, 'admin');
INSERT INTO `sys_login_infos` VALUES (16, '2021-08-13 21:51:48', '2021-08-13 21:51:48', NULL, 2638810865209344, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '用户名或密码错误', 'Windows 10', 0, 'admin');
INSERT INTO `sys_login_infos` VALUES (17, '2021-08-13 21:53:11', '2021-08-13 21:53:11', NULL, 2638810865209344, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '登录成功', 'Windows 10', 1, 'admin');
INSERT INTO `sys_login_infos` VALUES (18, '2021-08-13 22:11:38', '2021-08-13 22:11:38', NULL, 2638810865209344, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '登录成功', 'Windows 10', 1, 'admin');
INSERT INTO `sys_login_infos` VALUES (19, '2021-08-14 09:01:29', '2021-08-14 09:01:29', NULL, 2638810865209344, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '登录成功', 'Windows 10', 1, 'admin');
INSERT INTO `sys_login_infos` VALUES (20, '2021-08-14 10:41:39', '2021-08-14 10:41:39', NULL, 2638810865209344, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '登录成功', 'Windows 10', 1, 'admin');
INSERT INTO `sys_login_infos` VALUES (21, '2021-08-14 16:34:03', '2021-08-14 16:34:03', NULL, 10276095412670464, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '登录成功', 'Windows 10', 1, 'rui');
INSERT INTO `sys_login_infos` VALUES (22, '2021-08-14 16:35:10', '2021-08-14 16:35:10', NULL, 2638810865209344, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '登录成功', 'Windows 10', 1, 'admin');
INSERT INTO `sys_login_infos` VALUES (23, '2021-08-14 16:39:34', '2021-08-14 16:39:34', NULL, 2638810865209344, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '登录成功', 'Windows 10', 1, 'admin');
INSERT INTO `sys_login_infos` VALUES (24, '2021-08-14 16:41:16', '2021-08-14 16:41:16', NULL, 10277948745584640, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '登录成功', 'Windows 10', 1, 'rui');
INSERT INTO `sys_login_infos` VALUES (25, '2021-08-15 21:59:04', '2021-08-15 21:59:04', NULL, 2638810865209344, 'Chrome/92.0.4515.131', '127.0.0.1', '\r\r 本机地址', '登录成功', 'Windows 10', 1, 'admin');

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `parent_id` tinyint NULL DEFAULT NULL COMMENT '上级菜单',
  `menu_type` tinyint NULL DEFAULT NULL COMMENT '菜单类型',
  `icon` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `order_num` tinyint NULL DEFAULT NULL COMMENT '\'显示排序\'',
  `is_frame` tinyint(1) NULL DEFAULT NULL COMMENT '\'是否外链\'',
  `web_path` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'前端路由地址\'',
  `component_path` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'前端组件路径\'',
  `interface_path` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'后端接口路径\'',
  `interface_method` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'接口请求方式\'',
  `perms` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'权限标识\'',
  `status` tinyint NULL DEFAULT NULL COMMENT '\'菜单状态\'',
  `visible` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_menus_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES (1, '2021-02-27 07:41:29', '2021-02-27 07:50:00', NULL, 0, 0, 'system', '系统管理', 1, 1, '/system', '', NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (2, '2021-02-27 07:51:15', '2021-02-27 07:51:15', NULL, 0, 0, 'peoples', '权限管理', 2, 1, '/permission', '', NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (3, '2021-02-27 07:54:39', '2021-03-16 14:50:56', NULL, 1, 1, 'dict', '字典管理', 1, 1, 'dict', 'vadmin/system/dict/index', '/admin/system/dict/type', 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (4, '2021-02-27 08:06:51', '2021-03-26 00:48:34', NULL, 1, 1, 'edit', '参数管理', 2, 1, 'config', 'vadmin/system/config/index', '/admin/system/config/', 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (5, '2021-02-27 08:25:37', '2021-03-26 00:49:20', NULL, 2, 1, 'post', '岗位管理', 1, 1, 'post', 'vadmin/permission/post/index', '/admin/permission/post/', 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (6, '2021-02-27 08:26:48', '2021-03-26 00:49:26', NULL, 2, 1, 'tree', '部门管理', 2, 1, 'dept', 'vadmin/permission/dept/index', '/admin/permission/dept/', 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (7, '2021-02-27 08:28:20', '2021-03-26 00:49:32', NULL, 2, 1, 'tree-table', '菜单管理', 3, 1, 'menu', 'vadmin/permission/menu/index', '/admin/permission/menus/', 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (8, '2021-02-27 08:29:30', '2021-03-26 00:49:37', NULL, 2, 1, 'peoples', '角色管理', 4, 1, 'role', 'vadmin/permission/role/index', '/admin/permission/role/', 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (9, '2021-02-27 08:30:14', '2021-03-26 00:49:43', NULL, 2, 1, 'user', '用户管理', 5, 1, 'user', 'vadmin/permission/user/index', '/admin/permission/user/', 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (11, '2021-02-27 16:17:37', '2021-03-26 00:48:40', NULL, 1, 1, 'job', '文件管理', 3, 1, 'savefile', 'vadmin/system/savefile/index', '/admin/system/savefile/', 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (13, '2021-03-03 14:18:53', '2021-03-03 14:41:08', NULL, 9, 2, NULL, '用户新增', 1, 1, NULL, NULL, '/admin/permission/user/', 'POST', 'permission:user:post', 1, '1');
INSERT INTO `sys_menus` VALUES (14, '2021-03-03 14:43:34', '2021-03-03 14:43:34', NULL, 9, 2, NULL, '用户修改', 2, 1, NULL, NULL, '/admin/permission/user/:id/', 'PUT', 'permission:user:{id}:put', 1, '1');
INSERT INTO `sys_menus` VALUES (15, '2021-03-03 14:44:58', '2021-03-03 14:44:58', NULL, 9, 2, NULL, '用户删除', 3, 1, '', NULL, '/admin/permission/user/:id/', 'DELETE', 'permission:user:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (16, '2021-03-03 14:45:51', '2021-03-03 14:45:51', NULL, 9, 2, NULL, '用户导出', 4, 1, NULL, NULL, '/admin/permission/user/export/', 'GET', 'permission:user:export:get', 1, '1');
INSERT INTO `sys_menus` VALUES (17, '2021-03-03 14:51:14', '2021-03-03 14:51:14', NULL, 9, 2, NULL, '用户导入', 5, 1, NULL, NULL, '/admin/permission/user/import/', 'POST', 'permission:user:import:post', 1, '1');
INSERT INTO `sys_menus` VALUES (18, '2021-03-03 14:51:51', '2021-03-03 14:51:51', NULL, 9, 2, NULL, '重置密码', 6, 1, NULL, NULL, '/admin/permission/user/profile/updatePwd/', 'PUT', 'permission:user:resetpwd:put', 1, '1');
INSERT INTO `sys_menus` VALUES (19, '2021-03-03 14:53:48', '2021-03-03 14:53:48', NULL, 8, 2, NULL, '角色新增', 1, 1, NULL, NULL, '/admin/permission/role/', 'POST', 'permission:role:post', 1, '1');
INSERT INTO `sys_menus` VALUES (20, '2021-03-03 14:54:29', '2021-03-03 14:54:29', NULL, 8, 2, NULL, '角色修改', 2, 1, NULL, NULL, '/admin/permission/role/:id/', 'PUT', 'permission:role:{id}:put', 1, '1');
INSERT INTO `sys_menus` VALUES (21, '2021-03-03 14:58:01', '2021-03-03 14:58:01', NULL, 8, 2, NULL, '删除角色', 3, 1, NULL, NULL, '/admin/permission/role/:id/', 'DELETE', 'permission:role:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (22, '2021-03-03 14:58:29', '2021-03-03 14:58:29', NULL, 8, 2, NULL, '角色导出', 4, 1, NULL, NULL, '/admin/permission/role/export/', 'GET', 'permission:role:export:get', 1, '1');
INSERT INTO `sys_menus` VALUES (23, '2021-03-03 15:00:41', '2021-03-03 15:00:41', NULL, 7, 2, NULL, '菜单新增', 1, 1, NULL, NULL, '/admin/permission/menus/', 'POST', 'permission:menus:post', 1, '1');
INSERT INTO `sys_menus` VALUES (24, '2021-03-03 15:01:03', '2021-03-03 15:01:03', NULL, 7, 2, NULL, '菜单修改', 2, 1, NULL, NULL, '/admin/permission/menus/:id/', 'PUT', 'permission:menus:{id}:put', 1, '1');
INSERT INTO `sys_menus` VALUES (25, '2021-03-03 15:02:56', '2021-03-03 15:02:56', NULL, 7, 2, NULL, '菜单删除', 3, 1, NULL, NULL, '/admin/permission/menus/:id/', 'DELETE', 'permission:menus:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (26, '2021-03-03 15:04:35', '2021-03-03 15:04:35', NULL, 6, 2, NULL, '部门新增', 1, 1, NULL, NULL, '/admin/permission/dept/', 'POST', 'permission:dept:post', 1, '1');
INSERT INTO `sys_menus` VALUES (27, '2021-03-03 15:04:57', '2021-03-03 15:04:57', NULL, 6, 2, NULL, '部门修改', 2, 1, NULL, NULL, '/admin/permission/dept/:id/', 'PUT', 'permission:dept:{id}:put', 1, '1');
INSERT INTO `sys_menus` VALUES (28, '2021-03-03 15:05:40', '2021-03-03 15:05:40', NULL, 6, 2, NULL, '部门删除', 3, 1, NULL, NULL, '/admin/permission/dept/:id/', 'DELETE', 'permission:dept:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (29, '2021-03-03 15:06:50', '2021-03-03 15:06:50', NULL, 5, 2, NULL, '岗位新增', 1, 1, NULL, NULL, '/admin/permission/post/', 'POST', 'permission:post:post', 1, '1');
INSERT INTO `sys_menus` VALUES (30, '2021-03-03 15:07:36', '2021-03-03 15:07:36', NULL, 5, 2, NULL, '岗位修改', 2, 1, NULL, NULL, '/admin/permission/post/:id/', 'PUT', 'permission:post:{id}:put', 1, '1');
INSERT INTO `sys_menus` VALUES (31, '2021-03-03 15:08:10', '2021-03-03 15:08:10', NULL, 5, 2, NULL, '岗位删除', 3, 1, NULL, NULL, '/admin/permission/post/:id/', 'DELETE', 'permission:post:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (32, '2021-03-03 15:09:02', '2021-03-03 15:09:02', NULL, 5, 2, NULL, '岗位导出', 4, 1, NULL, NULL, '/admin/permission/post/export/', 'GET', 'permission:post:export:get', 1, '1');
INSERT INTO `sys_menus` VALUES (33, '2021-03-03 15:11:38', '2021-03-03 15:11:38', NULL, 3, 2, NULL, '字典新增', 1, 1, NULL, NULL, '/admin/system/dict/type/', 'POST', 'system:dict:type:post', 1, '1');
INSERT INTO `sys_menus` VALUES (34, '2021-03-03 15:12:47', '2021-03-03 15:12:47', NULL, 3, 2, NULL, '字典修改', 2, 1, NULL, NULL, '/admin/system/dict/type/:id/', 'PUT', 'system:dict:type:{id}:put', 1, '1');
INSERT INTO `sys_menus` VALUES (35, '2021-03-03 15:13:40', '2021-03-03 15:13:40', NULL, 3, 2, NULL, '字典删除', 3, 1, NULL, NULL, '/admin/system/dict/type/:id/', 'DELETE', 'system:dict:type:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (36, '2021-03-03 15:15:13', '2021-03-03 15:15:13', NULL, 3, 2, NULL, '字典导出', 4, 1, NULL, NULL, '/admin/system/dict/type/export/', 'GET', 'system:dict:type:export:get', 1, '1');
INSERT INTO `sys_menus` VALUES (37, '2021-03-03 15:16:21', '2021-03-03 15:16:55', NULL, 3, 2, NULL, '清理缓存', 5, 1, NULL, NULL, '/admin/system/dict/type/clearCache/', 'DELETE', 'system:dict:type:clearcache:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (38, '2021-03-03 15:17:54', '2021-03-03 15:17:54', NULL, 4, 2, NULL, '参数新增', 1, 1, NULL, NULL, '/admin/system/config/', 'POST', 'system:config:post', 1, '1');
INSERT INTO `sys_menus` VALUES (39, '2021-03-03 15:18:37', '2021-03-03 15:18:37', NULL, 4, 2, NULL, '参数修改', 2, 1, NULL, NULL, '/admin/system/config/:id/', 'PUT', 'system:config:{id}:put', 1, '1');
INSERT INTO `sys_menus` VALUES (40, '2021-03-03 15:19:06', '2021-03-03 15:19:06', NULL, 4, 2, NULL, '参数删除', 3, 1, NULL, NULL, '/admin/system/config/:id/', 'DELETE', 'system:config:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (41, '2021-03-03 15:19:50', '2021-03-03 15:19:50', NULL, 4, 2, NULL, '参数导出', 4, 1, NULL, NULL, '/admin/system/config/export/', 'GET', 'system:config:export:get', 1, '1');
INSERT INTO `sys_menus` VALUES (42, '2021-03-03 15:21:20', '2021-03-03 15:21:20', NULL, 4, 2, NULL, '清理缓存', 5, 1, NULL, NULL, '/admin/system/config/clearCache/', 'DELETE', 'system:config:clearcache:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (43, '2021-03-03 15:22:48', '2021-03-03 15:22:48', NULL, 11, 2, NULL, '文件上传', 1, 1, NULL, NULL, '/admin/system/savefile/', 'POST', 'system:savefile:post', 1, '1');
INSERT INTO `sys_menus` VALUES (44, '2021-03-03 15:23:58', '2021-03-03 15:23:58', NULL, 11, 2, NULL, '文件删除', 2, 1, NULL, NULL, '/admin/system/savefile/:id/', 'DELETE', 'system:savefile:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (45, '2021-03-03 15:25:15', '2021-03-03 15:25:15', NULL, 11, 2, NULL, '清理废弃文件', 3, 1, NULL, NULL, '/admin/system/clearsavefile/', 'POST', 'system:clearsavefile:post', 1, '1');
INSERT INTO `sys_menus` VALUES (46, '2021-03-03 15:27:20', '2021-03-03 15:28:30', NULL, 11, 2, NULL, '文件下载', 4, 1, NULL, NULL, NULL, 'GET', 'system:clearsavefile:download:post', 1, '1');
INSERT INTO `sys_menus` VALUES (47, '2021-03-07 14:32:07', '2021-03-26 00:48:50', NULL, 1, 1, 'message', '通知公告', 4, 1, 'message', 'vadmin/system/message/index', NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (48, '2021-03-07 14:35:07', '2021-03-07 14:35:07', NULL, 47, 2, NULL, '发布公告', 1, 1, NULL, NULL, '/admin/system/message/', 'POST', 'system:message:post', 1, '1');
INSERT INTO `sys_menus` VALUES (49, '2021-03-07 14:36:48', '2021-03-08 13:04:32', NULL, 47, 2, NULL, '修改公告', 2, 1, NULL, NULL, '/admin/system/message/:id/', 'PUT', 'system:message:{id}:put', 1, '1');
INSERT INTO `sys_menus` VALUES (50, '2021-03-07 14:37:52', '2021-03-08 13:04:58', NULL, 47, 2, NULL, '删除公告', 3, 1, NULL, NULL, '/admin/permission/menu/:id/', 'DELETE', 'permission:menu:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (51, '2021-03-07 14:42:37', '2021-03-07 14:42:37', NULL, 47, 2, NULL, '公告导出', 4, 1, NULL, NULL, '/admin/system/message/export/', 'GET', 'system:message:export:get', 1, '1');
INSERT INTO `sys_menus` VALUES (52, '2021-03-09 17:18:15', '2021-03-09 17:19:14', NULL, 3, 2, NULL, '字典查询', 0, 1, NULL, NULL, '/admin/system/dict/type/', 'GET', 'system:dict:type:get', 1, '1');
INSERT INTO `sys_menus` VALUES (53, '2021-03-09 17:19:34', '2021-03-09 17:19:47', NULL, 4, 2, NULL, '参数查询', 0, 1, NULL, NULL, '/admin/system/config/', 'GET', 'system:config:get', 1, '1');
INSERT INTO `sys_menus` VALUES (54, '2021-03-09 17:20:03', '2021-03-09 17:20:15', NULL, 11, 2, NULL, '文件查询', 0, 1, NULL, NULL, '/admin/system/savefile/', 'GET', 'system:savefile:get', 1, '1');
INSERT INTO `sys_menus` VALUES (55, '2021-03-09 17:20:36', '2021-03-09 17:20:45', NULL, 47, 2, NULL, '公告查询', 0, 1, NULL, NULL, '/admin/system/message/', 'GET', 'system:message:get', 1, '1');
INSERT INTO `sys_menus` VALUES (56, '2021-03-09 17:21:06', '2021-03-09 17:21:06', NULL, 5, 2, NULL, '岗位查询', 0, 1, NULL, NULL, '/admin/permission/post/', 'GET', 'permission:post:get', 1, '1');
INSERT INTO `sys_menus` VALUES (57, '2021-03-09 17:21:29', '2021-03-09 17:21:29', NULL, 6, 2, NULL, '部门查询', 0, 1, NULL, NULL, '/admin/permission/dept/', 'GET', 'permission:dept:get', 1, '1');
INSERT INTO `sys_menus` VALUES (58, '2021-03-09 17:21:47', '2021-03-09 17:21:56', NULL, 7, 2, NULL, '菜单查询', 0, 1, NULL, NULL, '/admin/permission/menus/', 'GET', 'permission:menus:get', 1, '1');
INSERT INTO `sys_menus` VALUES (59, '2021-03-09 17:22:20', '2021-03-09 17:22:20', NULL, 8, 2, NULL, '角色查询', 0, 1, '', NULL, '/admin/permission/role/', 'GET', 'permission:role:get', 1, '1');
INSERT INTO `sys_menus` VALUES (60, '2021-03-09 17:22:39', '2021-03-09 17:22:39', NULL, 9, 2, NULL, '用户查询', 0, 1, NULL, NULL, '/admin/permission/user/', 'GET', 'permission:user:get', 1, '1');
INSERT INTO `sys_menus` VALUES (61, '2021-03-16 13:34:04', '2021-03-21 11:34:18', NULL, 1, 0, 'log', '日志管理', 5, 1, 'log', 'ParentView', NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (62, '2021-03-16 13:36:00', '2021-03-16 15:09:30', NULL, 61, 1, 'logininfor', '登录日志', 1, 1, 'logininfor', 'vadmin/monitor/logininfor/index', NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (63, '2021-03-16 14:28:10', '2021-03-16 15:09:38', NULL, 61, 1, 'log', '操作日志', 2, 1, 'operlog', 'vadmin/monitor/operlog/index', '/admin/system/operation_log/', 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (64, '2021-03-16 14:31:01', '2021-03-16 14:31:28', NULL, 62, 2, NULL, '登录日志查询', 1, 1, NULL, NULL, '/admin/system/logininfor/', 'GET', 'admin:system:logininfor:get', 1, '1');
INSERT INTO `sys_menus` VALUES (65, '2021-03-16 14:31:44', '2021-03-16 14:31:44', NULL, 63, 2, NULL, '操作日志查询', 1, 1, NULL, NULL, '/admin/system/operation_log/', 'GET', 'admin:system:operlog:get', 1, '1');
INSERT INTO `sys_menus` VALUES (66, '2021-03-16 14:33:05', '2021-03-26 00:47:51', NULL, 0, 0, 'monitor', '系统监控', 3, 1, '/monitor', NULL, NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (70, '2021-03-16 14:45:52', '2021-03-26 00:49:56', NULL, 66, 1, 'job', '定时任务', 2, 1, 'celery', 'vadmin/monitor/celery/index', NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (71, '2021-03-16 14:59:54', '2021-03-16 15:04:12', NULL, 70, 2, NULL, '任务查询', 1, 1, NULL, NULL, '/admin/monitor/celery/', 'GET', 'admin:monitor:celery:get', 1, '1');
INSERT INTO `sys_menus` VALUES (72, '2021-03-16 15:00:22', '2021-03-16 15:04:07', NULL, 70, 2, NULL, '任务新增', 2, 1, NULL, NULL, '/admin/monitor/celery/', 'POST', 'admin:monitor:celery:post', 1, '1');
INSERT INTO `sys_menus` VALUES (73, '2021-03-16 15:00:46', '2021-03-16 15:04:00', NULL, 70, 2, NULL, '任务修改', 3, 1, NULL, NULL, '/admin/monitor/celery/:id/', 'PUT', 'admin:monitor:celery:{id}:put', 1, '1');
INSERT INTO `sys_menus` VALUES (74, '2021-03-16 15:01:20', '2021-03-16 15:03:55', NULL, 70, 2, NULL, '任务删除', 4, 1, NULL, NULL, '/admin/monitor/celery/:id/', 'DELETE', 'admin:monitor:celery:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (75, '2021-03-16 15:03:36', '2021-03-16 15:07:04', NULL, 70, 2, NULL, '任务单次执行', 6, 1, NULL, NULL, '/admin/monitor/celery/run/', 'PUT', 'admin:monitor:celery:run:put', 1, '1');
INSERT INTO `sys_menus` VALUES (76, '2021-03-16 15:07:45', '2021-03-16 15:08:10', NULL, 70, 2, NULL, '任务导出', 5, 1, NULL, NULL, '/admin/monitor/celery/export/', 'GET', 'admin:monitor:celery:export:get', 1, '1');
INSERT INTO `sys_menus` VALUES (77, '2021-03-16 15:08:46', '2021-03-16 15:09:10', NULL, 62, 2, NULL, '登录日志导出', 2, 1, NULL, NULL, '/admin/system/logininfor/export/', 'GET', 'admin:system:logininfor:export:get', 1, '1');
INSERT INTO `sys_menus` VALUES (78, '2021-03-16 15:10:00', '2021-03-16 15:10:00', NULL, 63, 2, NULL, '操作日志导出', 2, 1, NULL, NULL, '/admin/system/operlog/export/', 'GET', 'admin:system:operlog:export:get', 1, '1');
INSERT INTO `sys_menus` VALUES (79, '2021-03-16 15:11:06', '2021-03-26 00:27:18', NULL, 61, 1, 'job', '定时日志', 3, 1, 'celerylog', 'vadmin/monitor/celery/celerylog/index', NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (80, '2021-03-16 15:12:20', '2021-03-16 15:16:29', NULL, 79, 2, NULL, '定时日志查询', 1, 1, NULL, NULL, '/admin/monitor/celerylog/', 'GET', 'admin:monitor:celerylog:get', 1, '1');
INSERT INTO `sys_menus` VALUES (81, '2021-03-16 15:12:51', '2021-03-16 15:16:34', NULL, 79, 2, NULL, '定时日志导出', 2, 1, NULL, NULL, '/admin/monitor/celerylog/export/', 'GET', 'admin:monitor:celerylog:export:get', 1, '1');
INSERT INTO `sys_menus` VALUES (82, '2021-03-16 15:15:21', '2021-03-26 00:47:38', NULL, 0, 0, 'tool', '系统工具', 4, 1, '/tool', NULL, NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (83, '2021-03-16 15:16:10', '2021-03-26 00:50:12', NULL, 82, 1, 'build', '表单构建', 1, 1, 'build', 'vadmin/tool/build/index', NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (84, '2021-03-16 15:17:24', '2021-03-16 15:19:24', NULL, 82, 1, 'swagger', '系统接口', 2, 1, 'swagger', 'vadmin/tool/swagger/index', '/admin/docs/', 'GET', 'admin:docs:get', 1, '1');
INSERT INTO `sys_menus` VALUES (85, '2021-03-21 11:37:06', '2021-03-21 11:37:06', NULL, 63, 2, NULL, '操作日志批量删除', 3, 1, NULL, NULL, '/admin/system/operation_log/:id/', 'DELETE', 'admin:system:operation_log:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (86, '2021-03-21 11:39:08', '2021-03-21 11:39:08', NULL, 63, 2, NULL, '操作日志清空', 4, 1, NULL, NULL, '/admin/system/operation_log/clean/', 'DELETE', 'admin:system:operation_log:clean:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (87, '2021-03-21 23:32:44', '2021-03-21 23:32:44', NULL, 62, 2, NULL, '登录日志批量删除', 3, 1, NULL, NULL, '/admin/system/logininfor/:id/', 'DELETE', 'admin:system:logininfor:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (88, '2021-03-21 23:33:31', '2021-03-21 23:33:31', NULL, 62, 2, NULL, '登录日志清空', 4, 1, NULL, NULL, '/admin/system/logininfor/clean/', 'DELETE', 'admin:system:logininfor:clean:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (90, '2021-03-26 00:43:14', '2021-03-26 00:44:01', NULL, 79, 2, NULL, '定时日志批量删除', 3, 1, NULL, NULL, '/admin/system/celery_log/id/', 'DELETE', 'admin:system:celery_log:{id}:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (91, '2021-03-26 00:44:36', '2021-03-26 00:44:36', NULL, 79, 2, NULL, '定时日志清空', 4, 1, NULL, NULL, '/admin/system/celery_log/clean/', 'DELETE', 'admin:system:celery_log:clean:delete', 1, '1');
INSERT INTO `sys_menus` VALUES (92, '2021-04-27 23:44:55', '2021-04-27 23:49:59', NULL, 66, 1, 'server', '服务监控', 3, 1, '/monitor/server', 'vadmin/monitor/server/index', NULL, 'GET', NULL, 1, '1');
INSERT INTO `sys_menus` VALUES (93, '2021-04-27 23:49:29', '2021-04-27 23:57:47', NULL, 92, 2, NULL, '服务监控查询', 1, 1, NULL, NULL, '/admin/monitor/server/', 'GET', 'admin:monitor:server:get', 1, '1');
INSERT INTO `sys_menus` VALUES (94, '2021-04-27 23:58:13', '2021-04-27 23:58:45', NULL, 92, 2, NULL, '修改服务器信息', 2, 1, NULL, NULL, '/admin/monitor/server/:id/', 'PUT', 'admin:monitor:server:{id}:put', 1, '1');
INSERT INTO `sys_menus` VALUES (95, '2021-04-27 23:59:08', '2021-04-27 23:59:30', NULL, 92, 2, NULL, '修改监控信息', 3, 1, NULL, NULL, '/admin/monitor/monitor/enabled/', 'GET', 'admin:monitor:monitor:enabled:get', 1, '1');
INSERT INTO `sys_menus` VALUES (96, '2021-04-27 23:59:49', '2021-04-28 00:01:15', NULL, 92, 2, NULL, '清空监控记录', 4, 1, NULL, NULL, '/admin/monitor/monitor/clean/', 'GET', 'admin:monitor:monitor:clean:get', 1, '1');
INSERT INTO `sys_menus` VALUES (97, '2021-05-02 18:58:06', '2021-05-02 19:12:07', NULL, 0, 0, 'dashboard', '首页', 0, 1, '/index', 'Layout/index', NULL, 'GET', NULL, 1, '1');

-- ----------------------------
-- Table structure for sys_messages
-- ----------------------------
DROP TABLE IF EXISTS `sys_messages`;
CREATE TABLE `sys_messages`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '\'创建时间\'',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '\'修改时间\'',
  `deleted_at` datetime NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message_type` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `to_path` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_reviewed` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_messages_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_messages
-- ----------------------------
INSERT INTO `sys_messages` VALUES (1, '2021-03-23 00:01:15', '2021-03-23 00:01:15', NULL, '通知', '<p>发布通知</p>', '1', '2', NULL, 1);
INSERT INTO `sys_messages` VALUES (2, '2021-03-28 09:20:23', '2021-03-28 09:20:23', NULL, '分慰问费', '<p>9999</p>', '1', '2', NULL, 1);
INSERT INTO `sys_messages` VALUES (3, '2021-03-28 09:20:23', '2021-03-28 09:20:23', NULL, '333', '<p>6666</p>', '1', '1', NULL, 1);
INSERT INTO `sys_messages` VALUES (4, '2021-08-12 22:17:42', '2021-08-12 22:17:42', '2021-08-12 22:36:27', 'test', '<p>only test</p>', '1', '2', '/index', 1);
INSERT INTO `sys_messages` VALUES (5, '2021-08-12 22:36:02', '2021-08-12 22:36:20', '2021-08-12 22:36:27', '222', '<p>22222</p>', '1', '2', '222', 1);

-- ----------------------------
-- Table structure for sys_operation_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_logs`;
CREATE TABLE `sys_operation_logs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '\'创建时间\'',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '\'修改时间\'',
  `deleted_at` datetime NULL DEFAULT NULL,
  `creator_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_modular` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_path` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_body` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `request_method` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_msg` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_ip` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_browser` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_location` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `request_os` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `response_code` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `json_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_operation_logs_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_operation_logs
-- ----------------------------
INSERT INTO `sys_operation_logs` VALUES (8, '2021-08-14 10:58:26', '2021-08-14 10:58:26', NULL, 'admin', '岗位管理', '/admin/permission/post/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (9, '2021-08-14 10:58:58', '2021-08-14 10:58:58', NULL, 'admin', '', '/admin/system/operation_log/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (10, '2021-08-14 12:12:42', '2021-08-14 12:12:42', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (11, '2021-08-14 12:12:43', '2021-08-14 12:12:43', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (12, '2021-08-14 14:21:29', '2021-08-14 14:21:29', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (13, '2021-08-14 14:21:30', '2021-08-14 14:21:30', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (14, '2021-08-14 14:22:54', '2021-08-14 14:22:54', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (15, '2021-08-14 14:22:55', '2021-08-14 14:22:55', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (16, '2021-08-14 14:23:32', '2021-08-14 14:23:32', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (17, '2021-08-14 14:23:32', '2021-08-14 14:23:32', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (18, '2021-08-14 14:23:33', '2021-08-14 14:23:33', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (19, '2021-08-14 14:23:34', '2021-08-14 14:23:34', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (20, '2021-08-14 14:35:51', '2021-08-14 14:35:51', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (21, '2021-08-14 14:35:51', '2021-08-14 14:35:51', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (22, '2021-08-14 14:35:55', '2021-08-14 14:35:55', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (23, '2021-08-14 14:35:56', '2021-08-14 14:35:56', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (24, '2021-08-14 14:51:34', '2021-08-14 14:51:34', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (25, '2021-08-14 14:51:35', '2021-08-14 14:51:35', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (26, '2021-08-14 14:53:45', '2021-08-14 14:53:45', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (27, '2021-08-14 14:53:46', '2021-08-14 14:53:46', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (28, '2021-08-14 14:53:47', '2021-08-14 14:53:47', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (29, '2021-08-14 14:53:48', '2021-08-14 14:53:48', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (30, '2021-08-14 14:53:48', '2021-08-14 14:53:48', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (31, '2021-08-14 14:53:49', '2021-08-14 14:53:49', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (32, '2021-08-14 14:55:11', '2021-08-14 14:55:11', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (33, '2021-08-14 14:55:12', '2021-08-14 14:55:12', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (34, '2021-08-14 14:59:31', '2021-08-14 14:59:31', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (35, '2021-08-14 14:59:32', '2021-08-14 14:59:32', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (36, '2021-08-14 15:00:02', '2021-08-14 15:00:02', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (37, '2021-08-14 15:00:03', '2021-08-14 15:00:03', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (38, '2021-08-14 15:00:27', '2021-08-14 15:00:27', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (39, '2021-08-14 15:00:28', '2021-08-14 15:00:28', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (40, '2021-08-14 15:00:30', '2021-08-14 15:00:30', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (41, '2021-08-14 15:00:31', '2021-08-14 15:00:31', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (42, '2021-08-14 15:02:05', '2021-08-14 15:02:05', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (43, '2021-08-14 15:02:06', '2021-08-14 15:02:06', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (44, '2021-08-14 15:02:09', '2021-08-14 15:02:09', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (45, '2021-08-14 15:02:10', '2021-08-14 15:02:10', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (46, '2021-08-14 15:06:12', '2021-08-14 15:06:12', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (47, '2021-08-14 15:06:13', '2021-08-14 15:06:13', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (48, '2021-08-14 15:06:15', '2021-08-14 15:06:15', NULL, 'admin', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (49, '2021-08-14 15:06:16', '2021-08-14 15:06:16', NULL, 'admin', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (50, '2021-08-14 16:29:51', '2021-08-14 16:29:51', NULL, 'admin', '角色管理', '/admin/permission/role/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (51, '2021-08-14 16:29:55', '2021-08-14 16:29:55', NULL, 'admin', '菜单管理', '/admin/permission/menus/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (52, '2021-08-14 16:30:48', '2021-08-14 16:30:48', NULL, 'admin', '角色管理', '/admin/permission/role/', '', 'POST', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (53, '2021-08-14 16:30:48', '2021-08-14 16:30:48', NULL, 'admin', '角色管理', '/admin/permission/role/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (54, '2021-08-14 16:31:00', '2021-08-14 16:31:00', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (55, '2021-08-14 16:31:00', '2021-08-14 16:31:00', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (56, '2021-08-14 16:31:01', '2021-08-14 16:31:01', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (57, '2021-08-14 16:31:01', '2021-08-14 16:31:01', NULL, 'admin', '用户管理', '/admin/permission/user/details/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (58, '2021-08-14 16:31:53', '2021-08-14 16:31:53', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (59, '2021-08-14 16:31:53', '2021-08-14 16:31:53', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (60, '2021-08-14 16:32:51', '2021-08-14 16:32:51', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (61, '2021-08-14 16:32:51', '2021-08-14 16:32:51', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (62, '2021-08-14 16:32:53', '2021-08-14 16:32:53', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (63, '2021-08-14 16:32:53', '2021-08-14 16:32:53', NULL, 'admin', '用户管理', '/admin/permission/user/details/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (64, '2021-08-14 16:33:32', '2021-08-14 16:33:32', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'POST', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (65, '2021-08-14 16:33:32', '2021-08-14 16:33:32', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (66, '2021-08-14 16:34:03', '2021-08-14 16:34:03', NULL, 'rui', '登录模块', '/base/login/', '', 'POST', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\",\"data\":{\"user\":{\"id\":10,\"create_datetime\":\"2021-08-14 16:33:32\",\"update_datetime\":\"2021-08-14 16:33:32\",\"uid\":10276095412670464,\"username\":\"rui\",\"name\":\"test\",\"email\":\"11@qq.com\",\"mobile\":\"18867778777\",\"gender\":\"0\",\"avatar\":\"/media/avatar/default.jpg\",\"is_active\":true,\"roleId\":6,\"deptId\":1,\"post\":null,\"messages\":null},\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxMDI3NjA5NTQxMjY3MDQ2NCwidXNlcm5hbWUiOiJydWkiLCJleHAiOjE2NjA0NjYwNDMsImlzcyI6IkhpbmEifQ.4MlBP4PbijvWKgLkdm9FAaC4zXVHy6td637_0UwHdMw\"}}', 1);
INSERT INTO `sys_operation_logs` VALUES (67, '2021-08-14 16:34:12', '2021-08-14 16:34:12', NULL, 'rui', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (68, '2021-08-14 16:34:12', '2021-08-14 16:34:12', NULL, 'rui', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (69, '2021-08-14 16:34:17', '2021-08-14 16:34:17', NULL, 'rui', '角色管理', '/admin/permission/role/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (70, '2021-08-14 16:34:18', '2021-08-14 16:34:18', NULL, 'rui', '菜单管理', '/admin/permission/menus/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (71, '2021-08-14 16:34:23', '2021-08-14 16:34:23', NULL, 'rui', '部门管理', '/admin/permission/dept/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (72, '2021-08-14 16:34:26', '2021-08-14 16:34:26', NULL, 'rui', '岗位管理', '/admin/permission/post/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (73, '2021-08-14 16:35:10', '2021-08-14 16:35:10', NULL, 'admin', '登录模块', '/base/login/', '', 'POST', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\",\"data\":{\"user\":{\"id\":1,\"create_datetime\":\"2021-07-24 14:45:42\",\"update_datetime\":\"2021-08-09 14:54:38\",\"uid\":2638810865209344,\"username\":\"admin\",\"name\":\"超级管理员\",\"email\":\"11@qq.com\",\"mobile\":\"16666666669\",\"gender\":\"0\",\"avatar\":\"/media/avatar/2638810865209344.jpg\",\"is_active\":true,\"roleId\":1,\"deptId\":1,\"post\":null,\"messages\":null},\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyNjM4ODEwODY1MjA5MzQ0LCJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNjYwNDY2MTEwLCJpc3MiOiJIaW5hIn0.Z_jBrnjdmg1Qtghv_YZB9rL4QzxaBD7D-HC7Oq2zz5g\"}}', 1);
INSERT INTO `sys_operation_logs` VALUES (74, '2021-08-14 16:35:19', '2021-08-14 16:35:19', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (75, '2021-08-14 16:35:19', '2021-08-14 16:35:19', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (76, '2021-08-14 16:35:26', '2021-08-14 16:35:26', NULL, 'admin', '用户管理', '/admin/permission/user/:id/', '', 'DELETE', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"删除成功\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (77, '2021-08-14 16:35:26', '2021-08-14 16:35:26', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (78, '2021-08-14 16:35:28', '2021-08-14 16:35:28', NULL, 'admin', '角色管理', '/admin/permission/role/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (79, '2021-08-14 16:35:32', '2021-08-14 16:35:32', NULL, 'admin', '角色管理', '/admin/permission/role/:id/', '', 'DELETE', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"删除成功\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (80, '2021-08-14 16:35:32', '2021-08-14 16:35:32', NULL, 'admin', '角色管理', '/admin/permission/role/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (81, '2021-08-14 16:39:34', '2021-08-14 16:39:34', NULL, 'admin', '登录模块', '/base/login/', '', 'POST', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\",\"data\":{\"user\":{\"id\":1,\"create_datetime\":\"2021-07-24 14:45:42\",\"update_datetime\":\"2021-08-09 14:54:38\",\"uid\":2638810865209344,\"username\":\"admin\",\"name\":\"超级管理员\",\"email\":\"11@qq.com\",\"mobile\":\"16666666669\",\"gender\":\"0\",\"avatar\":\"/media/avatar/2638810865209344.jpg\",\"is_active\":true,\"roleId\":1,\"deptId\":1,\"post\":null,\"messages\":null},\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyNjM4ODEwODY1MjA5MzQ0LCJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNjYwNDY2Mzc0LCJpc3MiOiJIaW5hIn0.R0RqgDmiVHkl2M5v72qyMDY8evs8F7jSGeWGwcVYbMA\"}}', 1);
INSERT INTO `sys_operation_logs` VALUES (82, '2021-08-14 16:39:40', '2021-08-14 16:39:40', NULL, 'admin', '角色管理', '/admin/permission/role/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (83, '2021-08-14 16:39:42', '2021-08-14 16:39:42', NULL, 'admin', '菜单管理', '/admin/permission/menus/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (84, '2021-08-14 16:40:24', '2021-08-14 16:40:24', NULL, 'admin', '角色管理', '/admin/permission/role/', '', 'POST', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (85, '2021-08-14 16:40:24', '2021-08-14 16:40:24', NULL, 'admin', '角色管理', '/admin/permission/role/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (86, '2021-08-14 16:40:26', '2021-08-14 16:40:26', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (87, '2021-08-14 16:40:26', '2021-08-14 16:40:26', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (88, '2021-08-14 16:40:28', '2021-08-14 16:40:28', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (89, '2021-08-14 16:40:28', '2021-08-14 16:40:28', NULL, 'admin', '用户管理', '/admin/permission/user/details/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (90, '2021-08-14 16:40:53', '2021-08-14 16:40:53', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'POST', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (91, '2021-08-14 16:40:53', '2021-08-14 16:40:53', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (92, '2021-08-14 16:40:58', '2021-08-14 16:40:58', NULL, 'admin', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (93, '2021-08-14 16:40:58', '2021-08-14 16:40:58', NULL, 'admin', '用户管理', '/admin/permission/user/details/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (94, '2021-08-14 16:41:00', '2021-08-14 16:41:00', NULL, 'admin', '用户管理', '/admin/permission/user/:id/', '', 'PUT', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (95, '2021-08-14 16:41:00', '2021-08-14 16:41:00', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (96, '2021-08-14 16:41:16', '2021-08-14 16:41:16', NULL, 'rui', '登录模块', '/base/login/', '', 'POST', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\",\"data\":{\"user\":{\"id\":11,\"create_datetime\":\"2021-08-14 16:40:53\",\"update_datetime\":\"2021-08-14 16:40:53\",\"uid\":10277948745584640,\"username\":\"rui\",\"name\":\"test\",\"email\":\"22@qq.com\",\"mobile\":\"13366666666\",\"gender\":\"0\",\"avatar\":\"/media/avatar/default.jpg\",\"is_active\":true,\"roleId\":7,\"deptId\":2,\"post\":null,\"messages\":null},\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxMDI3Nzk0ODc0NTU4NDY0MCwidXNlcm5hbWUiOiJydWkiLCJleHAiOjE2NjA0NjY0NzYsImlzcyI6IkhpbmEifQ.4KNcD5zvJsrff6DwTmWCLoQEf2r-AVjDNUTHzn7JWmU\"}}', 1);
INSERT INTO `sys_operation_logs` VALUES (97, '2021-08-14 16:42:33', '2021-08-14 16:42:33', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (98, '2021-08-14 16:44:47', '2021-08-14 16:44:47', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (99, '2021-08-14 16:50:04', '2021-08-14 16:50:04', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (100, '2021-08-14 16:54:52', '2021-08-14 16:54:52', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (101, '2021-08-14 17:03:10', '2021-08-14 17:03:10', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (102, '2021-08-14 17:04:01', '2021-08-14 17:04:01', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (103, '2021-08-14 17:08:47', '2021-08-14 17:08:47', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (104, '2021-08-14 17:10:24', '2021-08-14 17:10:24', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (105, '2021-08-14 17:15:36', '2021-08-14 17:15:36', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (106, '2021-08-14 17:20:36', '2021-08-14 17:20:36', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (107, '2021-08-14 17:21:00', '2021-08-14 17:21:00', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (108, '2021-08-14 18:20:24', '2021-08-14 18:20:24', NULL, 'rui', '字典管理', '/admin/system/dict/type/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (109, '2021-08-14 18:22:24', '2021-08-14 18:22:24', NULL, 'rui', '参数管理', '/admin/system/config/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (110, '2021-08-14 18:22:38', '2021-08-14 18:22:38', NULL, 'rui', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (111, '2021-08-14 18:22:38', '2021-08-14 18:22:38', NULL, 'rui', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (112, '2021-08-14 18:22:50', '2021-08-14 18:22:50', NULL, 'rui', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (113, '2021-08-14 18:22:50', '2021-08-14 18:22:50', NULL, 'rui', '部门管理', '/admin/permission/dept/treeselect/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1001', '{\"code\":1001,\"msg\":\"权限不足\"}', 0);
INSERT INTO `sys_operation_logs` VALUES (114, '2021-08-14 18:26:11', '2021-08-14 18:26:11', NULL, 'rui', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (115, '2021-08-14 18:26:18', '2021-08-14 18:26:18', NULL, 'rui', '角色管理', '/admin/permission/role/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (116, '2021-08-14 18:26:21', '2021-08-14 18:26:21', NULL, 'rui', '菜单管理', '/admin/permission/menus/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (117, '2021-08-14 18:26:26', '2021-08-14 18:26:26', NULL, 'rui', '部门管理', '/admin/permission/dept/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (118, '2021-08-14 18:26:29', '2021-08-14 18:26:29', NULL, 'rui', '岗位管理', '/admin/permission/post/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (119, '2021-08-14 18:26:33', '2021-08-14 18:26:33', NULL, 'rui', '参数管理', '/admin/system/config/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (120, '2021-08-14 18:29:25', '2021-08-14 18:29:25', NULL, 'rui', '系统监控', '/admin/monitor/monitor/rate/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (121, '2021-08-14 18:29:26', '2021-08-14 18:29:26', NULL, 'rui', '系统监控', '/admin/monitor/monitor/info/:id/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (122, '2021-08-15 21:59:04', '2021-08-15 21:59:04', NULL, 'admin', '登录模块', '/base/login/', '', 'POST', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\",\"data\":{\"user\":{\"id\":1,\"create_datetime\":\"2021-07-24 14:45:42\",\"update_datetime\":\"2021-08-09 14:54:38\",\"uid\":2638810865209344,\"username\":\"admin\",\"name\":\"超级管理员\",\"email\":\"11@qq.com\",\"mobile\":\"16666666669\",\"gender\":\"0\",\"avatar\":\"/media/avatar/2638810865209344.jpg\",\"is_active\":true,\"roleId\":1,\"deptId\":1,\"post\":null,\"messages\":null},\"token\":\"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyNjM4ODEwODY1MjA5MzQ0LCJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNjYwNTcxOTQ0LCJpc3MiOiJIaW5hIn0.UNonOAY3wax-l-osZq0ye1c6l-qPlUmcOPnWhKBB6tk\"}}', 1);
INSERT INTO `sys_operation_logs` VALUES (123, '2021-08-15 21:59:28', '2021-08-15 21:59:28', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (124, '2021-08-15 21:59:30', '2021-08-15 21:59:30', NULL, 'admin', '角色管理', '/admin/permission/role/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (125, '2021-08-15 21:59:36', '2021-08-15 21:59:36', NULL, 'admin', '角色管理', '/admin/permission/role/:id/', '', 'DELETE', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"删除成功\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (126, '2021-08-15 21:59:36', '2021-08-15 21:59:36', NULL, 'admin', '角色管理', '/admin/permission/role/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (127, '2021-08-15 21:59:40', '2021-08-15 21:59:40', NULL, 'admin', '用户管理', '/admin/permission/user/:id/', '', 'DELETE', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"删除成功\"}', 1);
INSERT INTO `sys_operation_logs` VALUES (128, '2021-08-15 21:59:40', '2021-08-15 21:59:40', NULL, 'admin', '用户管理', '/admin/permission/user/', '', 'GET', '', '127.0.0.1', 'Chrome/92.0.4515.131', '\r\r 本机地址', 'Windows 10', '1000', '{\"code\":1000,\"msg\":\"success\"}', 1);

-- ----------------------------
-- Table structure for sys_posts
-- ----------------------------
DROP TABLE IF EXISTS `sys_posts`;
CREATE TABLE `sys_posts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `post_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'岗位名称\'',
  `post_code` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'岗位编码\'',
  `post_sort` tinyint NULL DEFAULT NULL COMMENT '\'岗位顺序\'',
  `status` tinyint NULL DEFAULT NULL COMMENT '\'岗位状态\'',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_posts_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_posts
-- ----------------------------
INSERT INTO `sys_posts` VALUES (1, '2021-02-27 07:16:11', '2021-02-27 07:16:11', NULL, '董事长', 'ceo', 1, 1);
INSERT INTO `sys_posts` VALUES (2, '2021-02-27 07:16:28', '2021-02-27 07:16:28', NULL, '项目经理', 'ce', 2, 1);
INSERT INTO `sys_posts` VALUES (3, '2021-02-27 07:16:40', '2021-02-27 07:16:40', NULL, '人力资源', 'hr', 3, 1);
INSERT INTO `sys_posts` VALUES (4, '2021-02-27 07:16:51', '2021-02-27 07:16:51', NULL, '普通员工', 'user', 4, 1);
INSERT INTO `sys_posts` VALUES (5, '2021-08-09 11:18:20', '0001-01-01 00:00:00', '2021-08-09 11:33:12', '2222', '22222', 12, 1);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `sys_dept_dept_id` int NOT NULL COMMENT '\'部门id\'',
  `sys_role_role_id` int NOT NULL COMMENT '\'角色id\'',
  PRIMARY KEY (`sys_dept_dept_id`, `sys_role_role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (1, 1);
INSERT INTO `sys_role_dept` VALUES (2, 1);
INSERT INTO `sys_role_dept` VALUES (3, 1);
INSERT INTO `sys_role_dept` VALUES (4, 1);
INSERT INTO `sys_role_dept` VALUES (5, 1);
INSERT INTO `sys_role_dept` VALUES (6, 1);
INSERT INTO `sys_role_dept` VALUES (7, 1);
INSERT INTO `sys_role_dept` VALUES (8, 1);
INSERT INTO `sys_role_dept` VALUES (9, 1);
INSERT INTO `sys_role_dept` VALUES (10, 1);
INSERT INTO `sys_role_dept` VALUES (11, 1);
INSERT INTO `sys_role_dept` VALUES (12, 1);
INSERT INTO `sys_role_dept` VALUES (13, 1);
INSERT INTO `sys_role_dept` VALUES (14, 1);
INSERT INTO `sys_role_dept` VALUES (15, 1);
INSERT INTO `sys_role_dept` VALUES (16, 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `sys_menu_id` bigint UNSIGNED NOT NULL,
  `sys_role_role_id` int NOT NULL COMMENT '\'角色id\'',
  PRIMARY KEY (`sys_menu_id`, `sys_role_role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 2);
INSERT INTO `sys_role_menu` VALUES (5, 1);
INSERT INTO `sys_role_menu` VALUES (5, 2);
INSERT INTO `sys_role_menu` VALUES (6, 1);
INSERT INTO `sys_role_menu` VALUES (6, 2);
INSERT INTO `sys_role_menu` VALUES (7, 1);
INSERT INTO `sys_role_menu` VALUES (7, 2);
INSERT INTO `sys_role_menu` VALUES (8, 1);
INSERT INTO `sys_role_menu` VALUES (8, 2);
INSERT INTO `sys_role_menu` VALUES (9, 1);
INSERT INTO `sys_role_menu` VALUES (9, 2);
INSERT INTO `sys_role_menu` VALUES (10, 1);
INSERT INTO `sys_role_menu` VALUES (10, 2);
INSERT INTO `sys_role_menu` VALUES (11, 1);
INSERT INTO `sys_role_menu` VALUES (13, 1);
INSERT INTO `sys_role_menu` VALUES (14, 1);
INSERT INTO `sys_role_menu` VALUES (15, 1);
INSERT INTO `sys_role_menu` VALUES (16, 1);
INSERT INTO `sys_role_menu` VALUES (17, 1);
INSERT INTO `sys_role_menu` VALUES (18, 1);
INSERT INTO `sys_role_menu` VALUES (19, 1);
INSERT INTO `sys_role_menu` VALUES (20, 1);
INSERT INTO `sys_role_menu` VALUES (21, 1);
INSERT INTO `sys_role_menu` VALUES (22, 1);
INSERT INTO `sys_role_menu` VALUES (23, 1);
INSERT INTO `sys_role_menu` VALUES (24, 1);
INSERT INTO `sys_role_menu` VALUES (25, 1);
INSERT INTO `sys_role_menu` VALUES (26, 1);
INSERT INTO `sys_role_menu` VALUES (27, 1);
INSERT INTO `sys_role_menu` VALUES (28, 1);
INSERT INTO `sys_role_menu` VALUES (29, 1);
INSERT INTO `sys_role_menu` VALUES (30, 1);
INSERT INTO `sys_role_menu` VALUES (31, 1);
INSERT INTO `sys_role_menu` VALUES (32, 1);
INSERT INTO `sys_role_menu` VALUES (33, 1);
INSERT INTO `sys_role_menu` VALUES (34, 1);
INSERT INTO `sys_role_menu` VALUES (35, 1);
INSERT INTO `sys_role_menu` VALUES (36, 1);
INSERT INTO `sys_role_menu` VALUES (37, 1);
INSERT INTO `sys_role_menu` VALUES (38, 1);
INSERT INTO `sys_role_menu` VALUES (39, 1);
INSERT INTO `sys_role_menu` VALUES (40, 1);
INSERT INTO `sys_role_menu` VALUES (41, 1);
INSERT INTO `sys_role_menu` VALUES (42, 1);
INSERT INTO `sys_role_menu` VALUES (43, 1);
INSERT INTO `sys_role_menu` VALUES (44, 1);
INSERT INTO `sys_role_menu` VALUES (45, 1);
INSERT INTO `sys_role_menu` VALUES (46, 1);
INSERT INTO `sys_role_menu` VALUES (47, 1);
INSERT INTO `sys_role_menu` VALUES (48, 1);
INSERT INTO `sys_role_menu` VALUES (49, 1);
INSERT INTO `sys_role_menu` VALUES (50, 1);
INSERT INTO `sys_role_menu` VALUES (51, 1);
INSERT INTO `sys_role_menu` VALUES (52, 1);
INSERT INTO `sys_role_menu` VALUES (53, 1);
INSERT INTO `sys_role_menu` VALUES (54, 1);
INSERT INTO `sys_role_menu` VALUES (55, 1);
INSERT INTO `sys_role_menu` VALUES (56, 1);
INSERT INTO `sys_role_menu` VALUES (57, 1);
INSERT INTO `sys_role_menu` VALUES (58, 1);
INSERT INTO `sys_role_menu` VALUES (59, 1);
INSERT INTO `sys_role_menu` VALUES (60, 1);
INSERT INTO `sys_role_menu` VALUES (61, 1);
INSERT INTO `sys_role_menu` VALUES (62, 1);
INSERT INTO `sys_role_menu` VALUES (63, 1);
INSERT INTO `sys_role_menu` VALUES (64, 1);
INSERT INTO `sys_role_menu` VALUES (65, 1);
INSERT INTO `sys_role_menu` VALUES (66, 1);
INSERT INTO `sys_role_menu` VALUES (70, 1);
INSERT INTO `sys_role_menu` VALUES (71, 1);
INSERT INTO `sys_role_menu` VALUES (72, 1);
INSERT INTO `sys_role_menu` VALUES (73, 1);
INSERT INTO `sys_role_menu` VALUES (74, 1);
INSERT INTO `sys_role_menu` VALUES (75, 1);
INSERT INTO `sys_role_menu` VALUES (76, 1);
INSERT INTO `sys_role_menu` VALUES (77, 1);
INSERT INTO `sys_role_menu` VALUES (78, 1);
INSERT INTO `sys_role_menu` VALUES (79, 1);
INSERT INTO `sys_role_menu` VALUES (80, 1);
INSERT INTO `sys_role_menu` VALUES (81, 1);
INSERT INTO `sys_role_menu` VALUES (82, 1);
INSERT INTO `sys_role_menu` VALUES (83, 1);
INSERT INTO `sys_role_menu` VALUES (84, 1);
INSERT INTO `sys_role_menu` VALUES (85, 1);
INSERT INTO `sys_role_menu` VALUES (86, 1);
INSERT INTO `sys_role_menu` VALUES (87, 1);
INSERT INTO `sys_role_menu` VALUES (88, 1);
INSERT INTO `sys_role_menu` VALUES (90, 1);
INSERT INTO `sys_role_menu` VALUES (91, 1);
INSERT INTO `sys_role_menu` VALUES (92, 1);
INSERT INTO `sys_role_menu` VALUES (97, 1);
INSERT INTO `sys_role_menu` VALUES (97, 2);

-- ----------------------------
-- Table structure for sys_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles`;
CREATE TABLE `sys_roles`  (
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `role_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '\'角色id\'',
  `role_name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'角色名\'',
  `role_key` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'权限字符\'',
  `role_sort` tinyint NULL DEFAULT NULL COMMENT '\'角色顺序\'',
  `status` smallint NULL DEFAULT NULL COMMENT '\'角色状态\'',
  `admin` tinyint(1) NULL DEFAULT 0 COMMENT '\'是否为admin\'',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `idx_sys_roles_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roles
-- ----------------------------
INSERT INTO `sys_roles` VALUES ('2021-02-27 08:48:23', '2021-08-10 14:11:05', NULL, 1, '超级管理员', 'admin', 1, 1, 1);
INSERT INTO `sys_roles` VALUES ('2021-02-27 08:48:23', '2021-08-10 14:11:05', NULL, 2, '普通用户', 'common', 2, 1, 0);

-- ----------------------------
-- Table structure for sys_save_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_save_files`;
CREATE TABLE `sys_save_files`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '\'创建时间\'',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '\'修改时间\'',
  `deleted_at` datetime NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `oss_url` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_save_files_deleted_at`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 227 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_save_files
-- ----------------------------
INSERT INTO `sys_save_files` VALUES (2, '2021-03-25 15:43:51', '2021-03-25 15:43:51', '2021-08-14 11:51:54', 0, 'blob', 'image/jpeg', '90898', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-25/96e69961-eff9-42d4-ab85-a1454566ccef');
INSERT INTO `sys_save_files` VALUES (3, '2021-03-25 16:36:07', '2021-03-25 16:36:07', '2021-08-14 11:51:54', 1, '导出参数管理数据58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-25/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E7%AE%A1%E7%90%86%E6%95%B0%E6%8D%AE58e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (4, '2021-03-27 13:43:01', '2021-03-27 13:43:01', '2021-08-14 11:51:54', 0, '20191120095924852.png', 'image/png', '82290', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-27/8ba5786e-e859-448f-a0f0-ea566609e195.png');
INSERT INTO `sys_save_files` VALUES (5, '2021-03-27 13:43:59', '2021-03-27 13:43:59', '2021-08-14 11:51:54', 0, 'blob', 'image/jpeg', '188815', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-27/4be96884-61e3-406f-86c6-8fba12ce28d7');
INSERT INTO `sys_save_files` VALUES (6, '2021-03-27 14:01:00', '2021-03-27 14:01:00', '2021-08-14 11:51:54', 0, 'blob', 'image/jpeg', '34530', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-27/01110537-dfe6-4f53-a418-44a96d0a3735');
INSERT INTO `sys_save_files` VALUES (7, '2021-03-27 15:30:52', '2021-03-27 15:30:52', '2021-08-14 11:51:54', 0, 'blob', 'image/jpeg', '34774', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-27/96d948fb-eef1-407a-964e-cbe0d8a1e9cb');
INSERT INTO `sys_save_files` VALUES (8, '2021-03-27 19:57:19', '2021-03-27 19:57:19', '2021-08-14 11:51:54', 1, '导出参数管理数据58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-27/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E7%AE%A1%E7%90%86%E6%95%B0%E6%8D%AE58e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (9, '2021-03-27 21:42:18', '2021-03-27 21:42:18', '2021-08-14 11:51:54', 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-27/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (10, '2021-03-27 21:41:48', '2021-03-27 21:41:48', '2021-08-14 11:51:54', 1, '导入用户数据模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-27/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E6%95%B0%E6%8D%AE%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (11, '2021-03-27 21:43:22', '2021-03-27 21:43:22', '2021-08-14 11:51:54', 0, '1.xls', 'application/vnd.ms-excel', '18944', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-27/54d81ef8-95c7-45ea-b6cb-1a88f07ddca6.xls');
INSERT INTO `sys_save_files` VALUES (12, '2021-03-27 21:44:40', '2021-03-27 21:44:40', NULL, 0, '1.xls', 'application/vnd.ms-excel', '18944', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-27/934d5c0d-885c-4c46-98f2-5b8319355707.xls');
INSERT INTO `sys_save_files` VALUES (13, '2021-03-27 21:45:17', '2021-03-27 21:45:17', NULL, 0, '1.xls', 'application/vnd.ms-excel', '18944', '本地存储', NULL, NULL, 'http://127.0.0.1:8082/media/system/2021-03-27/7dfabc00-e183-4184-81f5-b9770308f925.xls');
INSERT INTO `sys_save_files` VALUES (18, '2021-03-29 09:36:51', '2021-03-29 09:36:51', NULL, 0, 'gh_7a53c118fcbf_258.jpg', 'image/jpeg', '45842', '本地存储', '用户上传', NULL, 'http://127.0.0.1:8082/media/system/2021-03-29/233ca5bd-4268-4756-80e2-89e0a9a73a94.jpg');
INSERT INTO `sys_save_files` VALUES (19, '2021-03-29 09:58:04', '2021-03-29 09:58:04', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-03-29/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (20, '2021-03-29 09:59:41', '2021-03-29 09:59:41', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-03-29/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (21, '2021-03-29 10:04:27', '2021-03-29 10:04:27', NULL, 0, 'blob', 'image/jpeg', '18365', '本地存储', '用户上传', NULL, 'http://127.0.0.1:8082/media/system/2021-03-29/8272c194-1909-46e1-b765-5d1426a527d5');
INSERT INTO `sys_save_files` VALUES (22, '2021-03-29 20:52:58', '2021-03-29 20:52:58', NULL, 1, '导入用户数据模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-03-29/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E6%95%B0%E6%8D%AE%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (23, '2021-03-31 14:43:18', '2021-03-31 14:43:18', NULL, 1, '导出字典[sys_show_hide]详情数据d8b964e8bbca588db27573ffc73cccb9.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-03-31/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%5Bsys_show_hide%5D%E8%AF%A6%E6%83%85%E6%95%B0%E6%8D%AEd8b964e8bbca588db27573ffc73cccb9.xls');
INSERT INTO `sys_save_files` VALUES (24, '2021-04-01 09:25:26', '2021-04-01 09:25:26', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-01/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (25, '2021-04-02 13:19:00', '2021-04-02 13:19:00', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-02/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (26, '2021-04-02 13:20:02', '2021-04-02 13:20:02', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '42496', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-02/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (27, '2021-04-03 13:30:50', '2021-04-03 13:30:50', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-03/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (28, '2021-04-06 10:52:09', '2021-04-06 10:52:09', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-06/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (29, '2021-04-06 15:24:09', '2021-04-06 15:24:09', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '54784', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-06/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (30, '2021-04-08 16:56:54', '2021-04-08 16:56:54', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-08/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (31, '2021-04-11 16:11:17', '2021-04-11 16:11:17', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-11/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (32, '2021-04-12 11:19:45', '2021-04-12 11:19:45', NULL, 1, '导入用户数据模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-12/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E6%95%B0%E6%8D%AE%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (33, '2021-04-13 21:07:19', '2021-04-13 21:07:19', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-13/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (34, '2021-04-15 22:06:52', '2021-04-15 22:06:52', NULL, 1, '导入用户数据模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-15/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E6%95%B0%E6%8D%AE%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (35, '2021-04-18 19:37:41', '2021-04-18 19:37:41', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-18/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (36, '2021-04-18 22:01:50', '2021-04-18 22:01:50', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-18/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (37, '2021-04-18 22:02:04', '2021-04-18 22:02:04', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-18/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (38, '2021-04-22 03:24:39', '2021-04-22 03:24:39', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-22/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (39, '2021-04-22 13:48:40', '2021-04-22 13:48:40', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-22/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (40, '2021-04-23 11:57:33', '2021-04-23 11:57:33', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-23/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (41, '2021-04-23 11:58:19', '2021-04-23 11:58:19', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-23/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (42, '2021-04-23 12:03:24', '2021-04-23 12:03:24', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-23/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (43, '2021-04-23 18:59:42', '2021-04-23 18:59:42', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-23/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (44, '2021-04-25 11:23:52', '2021-04-25 11:23:52', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-25/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (45, '2021-04-25 14:36:47', '2021-04-25 14:36:47', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-25/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (46, '2021-04-26 17:27:20', '2021-04-26 17:27:20', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-26/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (47, '2021-04-27 09:09:23', '2021-04-27 09:09:23', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-27/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (48, '2021-04-27 20:57:15', '2021-04-27 20:57:15', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-04-27/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (49, '2021-05-05 13:47:22', '2021-05-05 13:47:22', NULL, 1, '导出操作日志2681a1adae1706a375d783765c7f9a63.xls', 'application/vnd.ms-excel', '1050112', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-05/%E5%AF%BC%E5%87%BA%E6%93%8D%E4%BD%9C%E6%97%A5%E5%BF%972681a1adae1706a375d783765c7f9a63.xls');
INSERT INTO `sys_save_files` VALUES (50, '2021-05-06 20:31:37', '2021-05-06 20:31:37', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-06/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (51, '2021-05-06 15:35:19', '2021-05-06 15:35:19', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-06/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (52, '2021-05-07 16:43:07', '2021-05-07 16:43:07', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-07/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (53, '2021-05-07 21:21:11', '2021-05-07 21:21:11', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-07/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (54, '2021-05-08 09:51:03', '2021-05-08 09:51:03', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-08/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (55, '2021-05-08 10:40:29', '2021-05-08 10:40:29', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-08/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (56, '2021-05-08 19:45:55', '2021-05-08 19:45:55', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-08/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (57, '2021-05-08 15:23:16', '2021-05-08 15:23:16', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-08/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (58, '2021-05-08 23:16:38', '2021-05-08 23:16:38', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-08/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (59, '2021-05-10 22:17:48', '2021-05-10 22:17:48', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-10/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (60, '2021-05-11 11:11:03', '2021-05-11 11:11:03', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-11/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (61, '2021-05-11 19:49:21', '2021-05-11 19:49:21', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-11/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (62, '2021-05-11 15:01:30', '2021-05-11 15:01:30', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-11/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (63, '2021-05-11 17:37:22', '2021-05-11 17:37:22', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '290304', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-11/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (64, '2021-05-12 15:06:23', '2021-05-12 15:06:23', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-12/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (65, '2021-05-12 18:44:19', '2021-05-12 18:44:19', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '310784', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-12/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (66, '2021-05-13 19:26:25', '2021-05-13 19:26:25', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-13/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (67, '2021-05-14 10:31:16', '2021-05-14 10:31:16', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-14/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (68, '2021-05-14 11:39:38', '2021-05-14 11:39:38', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-14/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (69, '2021-05-14 11:40:41', '2021-05-14 11:40:41', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '331776', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-14/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (70, '2021-05-14 11:40:54', '2021-05-14 11:40:54', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-14/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (71, '2021-05-16 11:58:50', '2021-05-16 11:58:50', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-16/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (72, '2021-05-16 11:45:33', '2021-05-16 11:45:33', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '348160', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-16/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (73, '2021-05-18 09:23:06', '2021-05-18 09:23:06', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-18/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (74, '2021-05-19 09:23:44', '2021-05-19 09:23:44', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-19/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (75, '2021-05-19 19:10:42', '2021-05-19 19:10:42', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-19/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (76, '2021-05-20 14:08:14', '2021-05-20 14:08:14', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-20/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (77, '2021-05-20 17:01:57', '2021-05-20 17:01:57', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-20/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (78, '2021-05-20 19:27:31', '2021-05-20 19:27:31', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-20/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (79, '2021-05-20 23:43:47', '2021-05-20 23:43:47', NULL, 1, '导出字典[sys_user_sex]详情数据d8b964e8bbca588db27573ffc73cccb9.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-20/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%5Bsys_user_sex%5D%E8%AF%A6%E6%83%85%E6%95%B0%E6%8D%AEd8b964e8bbca588db27573ffc73cccb9.xls');
INSERT INTO `sys_save_files` VALUES (80, '2021-05-22 10:34:47', '2021-05-22 10:34:47', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-22/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (81, '2021-05-22 10:55:19', '2021-05-22 10:55:19', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-22/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (82, '2021-05-26 10:42:48', '2021-05-26 10:42:48', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-26/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (83, '2021-05-26 21:32:28', '2021-05-26 21:32:28', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-26/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (84, '2021-05-27 12:27:06', '2021-05-27 12:27:06', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-27/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (85, '2021-05-27 13:46:09', '2021-05-27 13:46:09', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-27/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (86, '2021-05-28 15:48:48', '2021-05-28 15:48:48', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-28/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (87, '2021-05-28 17:12:43', '2021-05-28 17:12:43', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-28/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (88, '2021-05-28 19:26:32', '2021-05-28 19:26:32', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-28/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (89, '2021-05-29 11:39:16', '2021-05-29 11:39:16', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-29/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (90, '2021-05-30 21:40:58', '2021-05-30 21:40:58', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-30/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (91, '2021-05-31 16:09:50', '2021-05-31 16:09:50', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-05-31/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (92, '2021-06-02 21:27:55', '2021-06-02 21:27:55', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-02/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (93, '2021-06-02 21:28:03', '2021-06-02 21:28:03', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-02/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (94, '2021-06-03 14:44:12', '2021-06-03 14:44:12', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-03/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (95, '2021-06-03 16:39:19', '2021-06-03 16:39:19', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-03/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (96, '2021-06-04 14:46:02', '2021-06-04 14:46:02', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '550400', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-04/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (97, '2021-06-04 23:25:14', '2021-06-04 23:25:14', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-04/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (98, '2021-06-04 23:54:41', '2021-06-04 23:54:41', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-04/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (99, '2021-06-04 23:57:04', '2021-06-04 23:57:04', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-04/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (100, '2021-06-05 14:45:51', '2021-06-05 14:45:51', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-05/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (101, '2021-06-07 01:02:00', '2021-06-07 01:02:00', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-07/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (102, '2021-06-07 10:15:24', '2021-06-07 10:15:24', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-07/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (103, '2021-06-07 16:09:30', '2021-06-07 16:09:30', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-07/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (104, '2021-06-07 18:40:06', '2021-06-07 18:40:06', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-07/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (105, '2021-06-08 10:45:43', '2021-06-08 10:45:43', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-08/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (106, '2021-06-08 10:45:53', '2021-06-08 10:45:53', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-08/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (107, '2021-06-10 21:23:51', '2021-06-10 21:23:51', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '628736', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-10/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (108, '2021-06-15 16:20:07', '2021-06-15 16:20:07', NULL, 1, '导出字典[sys_normal_disable]详情数据d8b964e8bbca588db27573ffc73cccb9.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-15/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%5Bsys_normal_disable%5D%E8%AF%A6%E6%83%85%E6%95%B0%E6%8D%AEd8b964e8bbca588db27573ffc73cccb9.xls');
INSERT INTO `sys_save_files` VALUES (109, '2021-06-16 10:41:15', '2021-06-16 10:41:15', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '682496', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-16/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (110, '2021-06-16 13:41:48', '2021-06-16 13:41:48', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-16/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (111, '2021-06-17 13:20:49', '2021-06-17 13:20:49', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-17/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (112, '2021-06-17 14:56:46', '2021-06-17 14:56:46', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-17/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (113, '2021-06-19 00:55:03', '2021-06-19 00:55:03', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-19/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (114, '2021-06-19 23:11:45', '2021-06-19 23:11:45', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '732160', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-19/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (115, '2021-06-20 22:31:17', '2021-06-20 22:31:17', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-20/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (116, '2021-06-21 14:08:57', '2021-06-21 14:08:57', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-21/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (117, '2021-06-21 16:40:40', '2021-06-21 16:40:40', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-21/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (118, '2021-06-22 10:34:52', '2021-06-22 10:34:52', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-22/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (119, '2021-06-22 16:57:02', '2021-06-22 16:57:02', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-22/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (120, '2021-06-22 20:34:31', '2021-06-22 20:34:31', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-22/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (121, '2021-06-23 09:58:16', '2021-06-23 09:58:16', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '764928', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-23/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (122, '2021-06-23 11:13:09', '2021-06-23 11:13:09', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-23/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (123, '2021-06-23 17:21:16', '2021-06-23 17:21:16', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-23/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (124, '2021-06-24 14:17:10', '2021-06-24 14:17:10', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-24/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (125, '2021-06-25 14:10:01', '2021-06-25 14:10:01', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-25/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (126, '2021-06-25 18:41:41', '2021-06-25 18:41:41', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-25/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (127, '2021-06-25 23:05:51', '2021-06-25 23:05:51', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-25/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (128, '2021-06-25 22:52:06', '2021-06-25 22:52:06', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-25/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (129, '2021-06-25 23:04:28', '2021-06-25 23:04:28', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-25/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (130, '2021-06-26 14:20:11', '2021-06-26 14:20:11', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-26/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (131, '2021-06-28 09:55:55', '2021-06-28 09:55:55', NULL, 1, '导出96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-28/%E5%AF%BC%E5%87%BA96e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (132, '2021-06-29 19:31:28', '2021-06-29 19:31:28', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-29/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (133, '2021-06-29 16:04:50', '2021-06-29 16:04:50', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-29/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (134, '2021-06-30 10:02:39', '2021-06-30 10:02:39', NULL, 1, '导出字典[sys_user_sex]详情数据d8b964e8bbca588db27573ffc73cccb9.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-30/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%5Bsys_user_sex%5D%E8%AF%A6%E6%83%85%E6%95%B0%E6%8D%AEd8b964e8bbca588db27573ffc73cccb9.xls');
INSERT INTO `sys_save_files` VALUES (135, '2021-06-30 16:05:30', '2021-06-30 16:05:30', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-06-30/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (136, '2021-07-02 13:43:51', '2021-07-02 13:43:51', NULL, 1, '导出字典[sys_user_sex]详情数据d8b964e8bbca588db27573ffc73cccb9.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-02/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%5Bsys_user_sex%5D%E8%AF%A6%E6%83%85%E6%95%B0%E6%8D%AEd8b964e8bbca588db27573ffc73cccb9.xls');
INSERT INTO `sys_save_files` VALUES (137, '2021-07-06 17:06:09', '2021-07-06 17:06:09', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-06/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (138, '2021-07-07 10:52:53', '2021-07-07 10:52:53', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-07/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (139, '2021-07-08 10:22:42', '2021-07-08 10:22:42', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-08/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (140, '2021-07-08 15:57:14', '2021-07-08 15:57:14', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-08/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (141, '2021-07-08 16:35:12', '2021-07-08 16:35:12', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '958976', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-08/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (142, '2021-07-09 15:37:42', '2021-07-09 15:37:42', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-09/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (143, '2021-07-10 16:48:00', '2021-07-10 16:48:00', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-10/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (144, '2021-07-10 18:08:48', '2021-07-10 18:08:48', NULL, 1, '导出96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-10/%E5%AF%BC%E5%87%BA96e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (146, '2021-07-11 09:08:05', '2021-07-11 09:08:05', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-11/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (147, '2021-07-11 22:38:58', '2021-07-11 22:38:58', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-11/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (148, '2021-07-12 11:38:01', '2021-07-12 11:38:01', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-12/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (151, '2021-07-12 18:01:23', '2021-07-12 18:01:23', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '30208', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-12/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (153, '2021-07-13 13:22:59', '2021-07-13 13:22:59', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-13/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (154, '2021-07-13 13:23:32', '2021-07-13 13:23:32', NULL, 0, 'grafana-prometheus.jpg', 'image/jpeg', '10559', '本地存储', '用户上传', NULL, 'http://127.0.0.1:8082/media/system/2021-07-13/d9b44b96-1b11-458f-a2ec-77a894e2b1e3.jpg');
INSERT INTO `sys_save_files` VALUES (155, '2021-07-13 18:15:22', '2021-07-13 18:15:22', NULL, 0, '2528d59833ba067b96810ca94c1e5837_t.gif', 'image/gif', '5081', '本地存储', '用户上传', NULL, 'http://127.0.0.1:8082/media/system/2021-07-13/28632138-9e66-4bc3-9f36-2a9db1d9fd7f.gif');
INSERT INTO `sys_save_files` VALUES (156, '2021-07-14 11:35:59', '2021-07-14 11:35:59', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-14/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (157, '2021-07-14 11:36:22', '2021-07-14 11:36:22', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-14/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (158, '2021-07-14 14:25:07', '2021-07-14 14:25:07', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-14/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (159, '2021-07-15 23:18:41', '2021-07-15 23:18:41', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-15/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (160, '2021-07-16 17:55:15', '2021-07-16 17:55:15', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-16/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (161, '2021-07-16 19:57:18', '2021-07-16 19:57:18', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-16/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (162, '2021-07-16 19:56:59', '2021-07-16 19:56:59', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-16/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (163, '2021-07-17 09:32:01', '2021-07-17 09:32:01', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-17/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (164, '2021-07-19 10:13:47', '2021-07-19 10:13:47', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-19/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (165, '2021-07-19 17:47:35', '2021-07-19 17:47:35', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-19/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (166, '2021-07-20 16:19:39', '2021-07-20 16:19:39', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-20/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (167, '2021-07-20 23:09:35', '2021-07-20 23:09:35', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-20/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (168, '2021-07-21 09:53:57', '2021-07-21 09:53:57', NULL, 1, '导出96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-21/%E5%AF%BC%E5%87%BA96e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (169, '2021-07-21 13:35:52', '2021-07-21 13:35:52', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-21/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (170, '2021-07-21 16:28:07', '2021-07-21 16:28:07', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-21/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (171, '2021-07-21 19:27:31', '2021-07-21 19:27:31', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-21/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (172, '2021-07-22 13:52:20', '2021-07-22 13:52:20', NULL, 1, '导出celery定时日志fc36e692cbb090b512c11b9ac124d6b3.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-22/%E5%AF%BC%E5%87%BAcelery%E5%AE%9A%E6%97%B6%E6%97%A5%E5%BF%97fc36e692cbb090b512c11b9ac124d6b3.xls');
INSERT INTO `sys_save_files` VALUES (173, '2021-07-22 14:54:47', '2021-07-22 14:54:47', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '1165312', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-22/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (174, '2021-07-22 15:47:41', '2021-07-22 15:47:41', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-22/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (175, '2021-07-22 15:49:52', '2021-07-22 15:49:52', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-22/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (176, '2021-07-22 22:00:00', '2021-07-22 22:00:00', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-22/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (177, '2021-07-23 11:13:32', '2021-07-23 11:13:32', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-23/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (178, '2021-07-27 00:14:15', '2021-07-27 00:14:15', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-27/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (179, '2021-07-27 10:06:53', '2021-07-27 10:06:53', NULL, 1, '导出字典[sys_user_sex]详情数据d8b964e8bbca588db27573ffc73cccb9.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-27/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%5Bsys_user_sex%5D%E8%AF%A6%E6%83%85%E6%95%B0%E6%8D%AEd8b964e8bbca588db27573ffc73cccb9.xls');
INSERT INTO `sys_save_files` VALUES (180, '2021-07-27 16:39:54', '2021-07-27 16:39:54', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '1194496', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-27/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (181, '2021-07-27 22:50:53', '2021-07-27 22:50:53', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '30208', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-27/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (182, '2021-07-28 17:07:41', '2021-07-28 17:07:41', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-28/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (183, '2021-07-29 11:12:38', '2021-07-29 11:12:38', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-29/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (184, '2021-07-29 18:26:27', '2021-07-29 18:26:27', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-29/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (185, '2021-07-29 14:29:30', '2021-07-29 14:29:30', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-29/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (186, '2021-07-29 16:04:05', '2021-07-29 16:04:05', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-29/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (187, '2021-07-29 18:11:59', '2021-07-29 18:11:59', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-29/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (188, '2021-07-30 10:38:50', '2021-07-30 10:38:50', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-30/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (189, '2021-07-30 14:58:30', '2021-07-30 14:58:30', NULL, 1, '导出字典[sys_oper_type]详情数据d8b964e8bbca588db27573ffc73cccb9.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-30/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%5Bsys_oper_type%5D%E8%AF%A6%E6%83%85%E6%95%B0%E6%8D%AEd8b964e8bbca588db27573ffc73cccb9.xls');
INSERT INTO `sys_save_files` VALUES (190, '2021-07-30 18:42:13', '2021-07-30 18:42:13', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '30208', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-30/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (191, '2021-07-31 09:04:09', '2021-07-31 09:04:09', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-31/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (192, '2021-07-31 17:29:39', '2021-07-31 17:29:39', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-07-31/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (193, '2021-08-01 21:48:45', '2021-08-01 21:48:45', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '1276928', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-01/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (194, '2021-08-03 18:41:12', '2021-08-03 18:41:12', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-03/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (195, '2021-08-03 15:01:05', '2021-08-03 15:01:05', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-03/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (196, '2021-08-03 15:01:12', '2021-08-03 15:01:12', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-03/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (197, '2021-08-03 15:12:34', '2021-08-03 15:12:34', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-03/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (198, '2021-08-04 10:07:41', '2021-08-04 10:07:41', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-04/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (199, '2021-08-04 14:28:26', '2021-08-04 14:28:26', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-04/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (200, '2021-08-04 14:28:56', '2021-08-04 14:28:56', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-04/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (201, '2021-08-04 22:34:33', '2021-08-04 22:34:33', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-04/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (202, '2021-08-05 19:10:19', '2021-08-05 19:10:19', NULL, 1, '导出字典[sys_user_sex]详情数据d8b964e8bbca588db27573ffc73cccb9.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-05/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%5Bsys_user_sex%5D%E8%AF%A6%E6%83%85%E6%95%B0%E6%8D%AEd8b964e8bbca588db27573ffc73cccb9.xls');
INSERT INTO `sys_save_files` VALUES (203, '2021-08-05 19:10:58', '2021-08-05 19:10:58', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-05/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (204, '2021-08-05 23:23:31', '2021-08-05 23:23:31', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-05/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (205, '2021-08-06 02:21:08', '2021-08-06 02:21:08', NULL, 1, '导出96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-06/%E5%AF%BC%E5%87%BA96e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (206, '2021-08-06 02:21:12', '2021-08-06 02:21:12', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-06/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (207, '2021-08-06 08:59:58', '2021-08-06 08:59:58', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-06/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (208, '2021-08-06 14:52:22', '2021-08-06 14:52:22', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '1359360', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-06/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (209, '2021-08-07 08:17:00', '2021-08-07 08:17:00', NULL, 1, '导出角色管理0d69613ffd1c58a16dc1422906b76e7d.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-07/%E5%AF%BC%E5%87%BA%E8%A7%92%E8%89%B2%E7%AE%A1%E7%90%860d69613ffd1c58a16dc1422906b76e7d.xls');
INSERT INTO `sys_save_files` VALUES (210, '2021-08-07 12:17:12', '2021-08-07 12:17:12', NULL, 1, '导入用户管理模板5272fcf7550c2f0322760e8dffa1be20.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-07/%E5%AF%BC%E5%85%A5%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%86%E6%A8%A1%E6%9D%BF5272fcf7550c2f0322760e8dffa1be20.xls');
INSERT INTO `sys_save_files` VALUES (211, '2021-08-07 21:00:23', '2021-08-07 21:00:23', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-07/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (212, '2021-08-08 08:49:54', '2021-08-08 08:49:54', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-08/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (213, '2021-08-08 16:03:25', '2021-08-08 16:03:25', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '1384448', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-08/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (214, '2021-08-08 23:27:03', '2021-08-08 23:27:03', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-08/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (215, '2021-08-09 18:39:04', '2021-08-09 18:39:04', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-09/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (216, '2021-08-09 22:28:16', '2021-08-09 22:28:16', NULL, 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-09/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (217, '2021-08-10 18:15:18', '2021-08-10 18:15:18', NULL, 1, '导出岗位管理604cbd904cc44c4b92507989b4b40e41.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-10/%E5%AF%BC%E5%87%BA%E5%B2%97%E4%BD%8D%E7%AE%A1%E7%90%86604cbd904cc44c4b92507989b4b40e41.xls');
INSERT INTO `sys_save_files` VALUES (218, '2021-08-10 22:52:54', '2021-08-10 22:52:54', NULL, 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-10/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (219, '2021-08-10 20:28:54', '2021-08-10 20:28:54', NULL, 1, '导出通知公告c40ae926daaddcc6d4a00b52bf1091f5.xls', 'application/vnd.ms-excel', '30208', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-10/%E5%AF%BC%E5%87%BA%E9%80%9A%E7%9F%A5%E5%85%AC%E5%91%8Ac40ae926daaddcc6d4a00b52bf1091f5.xls');
INSERT INTO `sys_save_files` VALUES (220, '2021-08-10 20:29:48', '2021-08-10 20:29:48', NULL, 1, '导出登录日志6cb23a22812d82a946e2546d0ae02e51.xls', 'application/vnd.ms-excel', '1417216', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-10/%E5%AF%BC%E5%87%BA%E7%99%BB%E5%BD%95%E6%97%A5%E5%BF%976cb23a22812d82a946e2546d0ae02e51.xls');
INSERT INTO `sys_save_files` VALUES (221, '2021-08-11 16:50:01', '2021-08-11 16:50:01', '2021-08-12 20:18:42', 1, '导出字典管理58e59e634682325268551b124f37a8db.xls', 'application/vnd.ms-excel', '9728', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-11/%E5%AF%BC%E5%87%BA%E5%AD%97%E5%85%B8%E7%AE%A1%E7%90%8658e59e634682325268551b124f37a8db.xls');
INSERT INTO `sys_save_files` VALUES (222, '2021-08-11 18:08:11', '2021-08-11 18:08:11', '2021-08-12 20:18:42', 1, '导出用户管理96e88fcd1b20f00d9a2972e439446643.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-11/%E5%AF%BC%E5%87%BA%E7%94%A8%E6%88%B7%E7%AE%A1%E7%90%8696e88fcd1b20f00d9a2972e439446643.xls');
INSERT INTO `sys_save_files` VALUES (223, '2021-08-11 21:06:22', '2021-08-11 21:06:22', '2021-08-12 20:18:42', 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-11/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (224, '2021-08-12 14:24:44', '2021-08-12 14:24:44', NULL, 1, '导出参数设置1d27c66f3bd7bcf4974687054fae146e.xls', 'application/vnd.ms-excel', '5632', '本地存储', '导出', NULL, 'http://127.0.0.1:8082/media/system/2021-08-12/%E5%AF%BC%E5%87%BA%E5%8F%82%E6%95%B0%E8%AE%BE%E7%BD%AE1d27c66f3bd7bcf4974687054fae146e.xls');
INSERT INTO `sys_save_files` VALUES (225, '2021-08-12 20:08:10', '2021-08-12 20:08:10', NULL, 1, 'p.jpg', 'jpg', '195768', '本地存储', '用户上传', '', 'http://127.0.0.1:8082/media/system/p.jpg');
INSERT INTO `sys_save_files` VALUES (226, '2021-08-12 20:28:51', '2021-08-12 20:28:51', NULL, 1, '微信图片_20210715083528.jpg', 'jpg', '89303', '本地存储', '用户上传', '', '127.0.0.18082/media/system/微信图片_20210715083528.jpg');

-- ----------------------------
-- Table structure for sys_user_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_message`;
CREATE TABLE `sys_user_message`  (
  `sys_message_id` bigint UNSIGNED NOT NULL,
  `sys_user_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`sys_message_id`, `sys_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_message
-- ----------------------------
INSERT INTO `sys_user_message` VALUES (1, 1);
INSERT INTO `sys_user_message` VALUES (2, 1);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `sys_post_id` bigint UNSIGNED NOT NULL,
  `sys_user_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`sys_post_id`, `sys_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (1, 7);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (2, 8);
INSERT INTO `sys_user_post` VALUES (3, 10);
INSERT INTO `sys_user_post` VALUES (3, 11);
INSERT INTO `sys_user_post` VALUES (4, 9);

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL COMMENT '\'用户uid\'',
  `username` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'用户登录名\'',
  `name` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'用户登录名\'',
  `password` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\'用户登录密码\'',
  `avatar` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'media/avatar/default.jpg' COMMENT '\'用户头像\'',
  `role_id` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '\'关联角色\'',
  `dept_id` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '归属部门',
  `is_active` tinyint(1) NULL DEFAULT NULL,
  `mobile` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `gender` varchar(191) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_users_deleted_at`(`deleted_at`) USING BTREE,
  INDEX `idx_sys_users_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
INSERT INTO `sys_users` VALUES (1, '2021-07-24 14:45:42', '2021-08-09 14:54:38', NULL, 2638810865209344, 'admin', '超级管理员', '313233343536d41d8cd98f00b204e9800998ecf8427e', '/media/avatar/2638810865209344.jpg', 1, 1, 1, '16666666669', '11@qq.com', '0');
INSERT INTO `sys_users` VALUES (2, '2021-07-24 14:45:42', '2021-08-01 11:11:12', NULL, 2638810865209345, 'hina', '普通用户', '313233343536d41d8cd98f00b204e9800998ecf8427e', '/media/avatar/default.jpg', 2, 1, 1, '19999999999', '2@qq.com', '1');

SET FOREIGN_KEY_CHECKS = 1;
