/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : authority

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-07-03 10:07:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_acl
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl`;
CREATE TABLE `sys_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '权限码',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '权限名称',
  `acl_module_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限所在的权限模块id',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '请求的url, 可以填正则表达式',
  `type` int(11) NOT NULL DEFAULT '3' COMMENT '类型，1：菜单，2：按钮，3：其他',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，0：冻结',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT '权限在当前模块下的顺序，由小到大',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一个更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_acl
-- ----------------------------
INSERT INTO `sys_acl` VALUES ('1', '20171015095130_26', '进入产品管理界面', '1', '/sys/product/product.page', '1', '1', '1', '', 'admin', '2019-07-02 22:28:09', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES ('2', '20171015095322_14', '查询产品列表', '1', '/sys/product/page.json', '2', '1', '2', '', 'admin', '2019-07-02 21:03:38', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES ('3', '20171015095350_69', '产品上架', '1', '/sys/product/online.json', '2', '1', '3', '', 'admin', '2019-07-02 21:03:45', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES ('4', '20171015095420_7', '产品下架', '1', '/sys/product/offline.json', '2', '1', '4', '', 'admin', '2019-07-02 21:03:53', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES ('5', '20171015212626_63', '进入订单页', '2', '/sys/order/order.page', '1', '1', '1', '', 'admin', '2019-07-02 21:04:07', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES ('7', '20171015212907_36', '进入权限管理页', '7', '/sys/aclModule/acl.page', '1', '1', '1', '', 'admin', '2019-07-02 21:04:32', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES ('8', '20171015212938_27', '进入角色管理页', '8', '/sys/role/role.page', '1', '1', '1', '', 'admin', '2019-07-02 21:04:39', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES ('9', '20171015213009_0', '进入用户管理页', '9', '/sys/dept/dept.page', '1', '1', '1', '', 'admin', '2019-07-03 10:00:02', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl` VALUES ('10', '20171016230429_8', '进入权限更新记录页面', '11', '/sys/log/log.page', '1', '1', '1', '', 'admin', '2019-07-02 21:04:55', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_acl_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl_module`;
CREATE TABLE `sys_acl_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限模块id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '权限模块名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级权限模块id',
  `level` varchar(200) NOT NULL DEFAULT '' COMMENT '权限模块层级',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT '权限模块在当前层级下的顺序，由小到大',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，0：冻结',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次操作时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_acl_module
-- ----------------------------
INSERT INTO `sys_acl_module` VALUES ('1', '产品管理', '0', '0', '1', '1', 'product', 'admin', '2019-07-03 09:55:07', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl_module` VALUES ('2', '订单管理', '0', '0', '2', '1', '', 'admin', '2019-07-02 21:05:54', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl_module` VALUES ('3', '公告管理', '0', '0', '3', '1', '', 'admin', '2019-07-02 21:06:03', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl_module` VALUES ('4', '出售中产品管理', '1', '0.1', '1', '1', '', 'admin', '2019-07-02 21:06:44', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl_module` VALUES ('5', '下架产品管理', '1', '0.1', '2', '1', '', 'admin', '2019-07-02 21:06:59', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl_module` VALUES ('6', '权限管理', '0', '0', '4', '1', '', 'admin', '2019-07-02 21:06:14', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl_module` VALUES ('7', '权限管理', '6', '0.6', '1', '1', '权限管理', '谢家龙', '2019-07-03 09:55:54', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl_module` VALUES ('8', '角色管理', '6', '0.6', '2', '1', '角色管理', 'admin', '2019-07-02 21:07:27', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl_module` VALUES ('9', '用户管理', '6', '0.6', '2', '1', '用户管理', 'admin', '2019-07-02 21:07:35', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl_module` VALUES ('10', '运维管理', '0', '0', '5', '1', '', 'admin', '2019-07-02 21:10:03', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_acl_module` VALUES ('11', '权限更新记录管理', '6', '0.6', '4', '1', '权限更新记录管理', 'admin', '2019-07-02 21:07:47', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级部门id',
  `level` varchar(200) NOT NULL DEFAULT '' COMMENT '部门层级',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT '部门在当前层级下的顺序，由小到大',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次操作时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新操作者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '技术部', '0', '0', '1', '', 'admin', '2019-07-02 21:08:28', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_dept` VALUES ('2', '后端开发', '1', '0.1', '1', '', 'admin', '2019-07-02 21:08:32', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_dept` VALUES ('3', '前端开发', '1', '0.1', '2', '', 'admin', '2019-07-02 21:08:42', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_dept` VALUES ('4', 'UI设计', '1', '0.1', '3', '', 'admin', '2019-07-02 21:08:52', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_dept` VALUES ('16', '产品部', '0', '0', '2', '', 'admin', '2019-07-02 21:16:29', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_dept` VALUES ('17', '客服部', '0', '0', '3', '', 'admin', '2019-07-02 21:16:37', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '权限更新的类型，1：部门，2：用户，3：权限模块，4：权限，5：角色，6：角色用户关系，7：角色权限关系',
  `target_id` int(11) NOT NULL COMMENT '基于type后指定的对象id，比如用户、权限、角色等表的主键',
  `old_value` text COMMENT '旧值',
  `new_value` text COMMENT '新值',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新的时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip地址',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '当前是否复原过，0：没有，1：复原过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('122', '5', '4', '{\"id\":4,\"name\":\"权限管理员\",\"type\":1,\"status\":1,\"remark\":\"权限管理员\",\"operator\":\"admin\",\"operateTime\":1562073567000,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '{\"id\":4,\"name\":\"权限管理员\",\"type\":1,\"status\":0,\"remark\":\"权限管理员\",\"operator\":\"admin\",\"operateTime\":1562118644248,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'admin', '2019-07-03 09:50:45', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('123', '7', '4', '[]', '[6]', 'admin', '2019-07-03 09:50:59', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('124', '7', '4', '[6]', '[]', '谢家龙', '2019-07-03 09:52:31', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('125', '5', '4', '{\"id\":4,\"name\":\"权限管理员\",\"type\":1,\"status\":0,\"remark\":\"权限管理员\",\"operator\":\"admin\",\"operateTime\":1562118644000,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '{\"id\":4,\"name\":\"权限管理员\",\"type\":1,\"status\":1,\"remark\":\"权限管理员\",\"operator\":\"admin\",\"operateTime\":1562118777343,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'admin', '2019-07-03 09:52:57', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('126', '4', '9', '{\"id\":9,\"code\":\"20171015213009_0\",\"name\":\"进入用户管理页\",\"aclModuleId\":9,\"url\":\"/sys/dept/dept.page\",\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateTime\":1562072686000,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '{\"id\":9,\"name\":\"进入用户管理页\",\"aclModuleId\":9,\"url\":\"/sys/dept/dept.page\",\"type\":1,\"status\":0,\"seq\":1,\"operator\":\"admin\",\"operateTime\":1562118826878,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'admin', '2019-07-03 09:53:47', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('127', '4', '9', '{\"id\":9,\"code\":\"20171015213009_0\",\"name\":\"进入用户管理页\",\"aclModuleId\":9,\"url\":\"/sys/dept/dept.page\",\"type\":1,\"status\":0,\"seq\":1,\"operator\":\"admin\",\"operateTime\":1562118827000,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '{\"id\":9,\"name\":\"进入用户管理页\",\"aclModuleId\":9,\"url\":\"/sys/dept/dept.page\",\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateTime\":1562118872285,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'admin', '2019-07-03 09:54:32', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('128', '3', '1', '{\"id\":1,\"name\":\"产品管理\",\"parentId\":0,\"level\":\"0\",\"seq\":1,\"status\":1,\"remark\":\"product\",\"operator\":\"admin\",\"operateTime\":1562072745000,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '{\"id\":1,\"name\":\"产品管理\",\"parentId\":0,\"level\":\"0\",\"seq\":1,\"status\":0,\"remark\":\"product\",\"operator\":\"admin\",\"operateTime\":1562118894555,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'admin', '2019-07-03 09:54:55', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('129', '3', '1', '{\"id\":1,\"name\":\"产品管理\",\"parentId\":0,\"level\":\"0\",\"seq\":1,\"status\":0,\"remark\":\"product\",\"operator\":\"admin\",\"operateTime\":1562118895000,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '{\"id\":1,\"name\":\"产品管理\",\"parentId\":0,\"level\":\"0\",\"seq\":1,\"status\":1,\"remark\":\"product\",\"operator\":\"admin\",\"operateTime\":1562118906847,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'admin', '2019-07-03 09:55:07', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('130', '3', '7', '{\"id\":7,\"name\":\"权限管理\",\"parentId\":6,\"level\":\"0.6\",\"seq\":1,\"status\":1,\"remark\":\"权限管理\",\"operator\":\"admin\",\"operateTime\":1562072838000,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '{\"id\":7,\"name\":\"权限管理\",\"parentId\":6,\"level\":\"0.6\",\"seq\":1,\"status\":0,\"remark\":\"权限管理\",\"operator\":\"admin\",\"operateTime\":1562118918657,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'admin', '2019-07-03 09:55:19', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('131', '7', '4', '[]', '[6]', 'admin', '2019-07-03 09:55:34', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('132', '3', '7', '{\"id\":7,\"name\":\"权限管理\",\"parentId\":6,\"level\":\"0.6\",\"seq\":1,\"status\":0,\"remark\":\"权限管理\",\"operator\":\"admin\",\"operateTime\":1562118919000,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '{\"id\":7,\"name\":\"权限管理\",\"parentId\":6,\"level\":\"0.6\",\"seq\":1,\"status\":1,\"remark\":\"权限管理\",\"operator\":\"谢家龙\",\"operateTime\":1562118954475,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '谢家龙', '2019-07-03 09:55:54', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('133', '4', '9', '{\"id\":9,\"code\":\"20171015213009_0\",\"name\":\"进入用户管理页\",\"aclModuleId\":9,\"url\":\"/sys/dept/dept.page\",\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateTime\":1562118872000,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '{\"id\":9,\"name\":\"进入用户管理页\",\"aclModuleId\":9,\"url\":\"/sys/dept/dept.page\",\"type\":1,\"status\":0,\"seq\":1,\"operator\":\"admin\",\"operateTime\":1562119188623,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'admin', '2019-07-03 09:59:49', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('134', '4', '9', '{\"id\":9,\"code\":\"20171015213009_0\",\"name\":\"进入用户管理页\",\"aclModuleId\":9,\"url\":\"/sys/dept/dept.page\",\"type\":1,\"status\":0,\"seq\":1,\"operator\":\"admin\",\"operateTime\":1562119189000,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', '{\"id\":9,\"name\":\"进入用户管理页\",\"aclModuleId\":9,\"url\":\"/sys/dept/dept.page\",\"type\":1,\"status\":1,\"seq\":1,\"operator\":\"admin\",\"operateTime\":1562119202248,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'admin', '2019-07-03 10:00:02', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('135', '7', '4', '[6]', '[]', 'admin', '2019-07-03 10:00:15', '0:0:0:0:0:0:0:1', '1');
INSERT INTO `sys_log` VALUES ('136', '2', '1', '{\"id\":1,\"username\":\"admin\",\"telephone\":\"18612344321\",\"mail\":\"admin@qq.com\",\"password\":\"25D55AD283AA400AF464C76D713C07AD\",\"deptId\":1,\"status\":1,\"remark\":\"admin\",\"operator\":\"system\",\"operateTime\":1507855576000,\"operateIp\":\"127.0.0.1\"}', '{\"id\":1,\"username\":\"admin\",\"telephone\":\"18612344321\",\"mail\":\"admin@qq.com\",\"deptId\":1,\"status\":1,\"operator\":\"admin\",\"operateTime\":1562119553260,\"operateIp\":\"0:0:0:0:0:0:0:1\"}', 'admin', '2019-07-03 10:05:54', '0:0:0:0:0:0:0:1', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(20) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '角色的类型，1：管理员角色，2：其他',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：冻结',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新的时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '产品管理员', '1', '1', '产品管理员', 'admin', '2019-07-02 21:19:13', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role` VALUES ('2', '订单管理员', '1', '1', '订单管理员', 'admin', '2019-07-02 21:19:19', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role` VALUES ('3', '公告管理员', '1', '1', '公告管理员', 'admin', '2019-07-02 21:19:24', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role` VALUES ('4', '权限管理员', '1', '1', '权限管理员', 'admin', '2019-07-03 09:52:57', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role` VALUES ('5', '运维管理员', '1', '1', '运维管理员', 'admin', '2019-07-02 21:19:31', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_role_acl
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_acl`;
CREATE TABLE `sys_role_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `acl_id` int(11) NOT NULL COMMENT '权限id',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新的时间',
  `operate_ip` varchar(200) NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_acl
-- ----------------------------
INSERT INTO `sys_role_acl` VALUES ('34', '4', '7', 'admin', '2019-07-02 22:17:46', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_acl` VALUES ('35', '4', '8', 'admin', '2019-07-02 22:17:46', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_acl` VALUES ('36', '4', '9', 'admin', '2019-07-02 22:17:46', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_role_acl` VALUES ('37', '4', '10', 'admin', '2019-07-02 22:17:46', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新的时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名称',
  `telephone` varchar(13) NOT NULL DEFAULT '' COMMENT '手机号',
  `mail` varchar(20) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '加密后的密码',
  `dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户所在部门的id',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，0：冻结状态，2：删除',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作者',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `operate_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后一次更新者的ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '18612344321', 'admin@qq.com', '25D55AD283AA400AF464C76D713C07AD', '1', '1', '', 'admin', '2019-07-03 10:05:53', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('6', '谢家龙', '18570365046', 'xjl@qq.com', '25D55AD283AA400AF464C76D713C07AD', '1', '1', '', 'admin', '2019-07-02 22:24:17', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('7', '赵勰', '18866668888', 'zx@qq.com', '25D55AD283AA400AF464C76D713C07AD', '1', '1', '', 'admin', '2019-07-02 21:30:50', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('8', '谷鑫旺', '13188886666', 'gxw@qq.com', '25D55AD283AA400AF464C76D713C07AD', '1', '1', '', 'admin', '2019-07-02 21:32:10', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('11', '王博', '18699992222', 'wb@qq.com', '25D55AD283AA400AF464C76D713C07AD', '16', '1', '', 'admin', '2019-07-02 21:40:38', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('13', '小王', '18655552222', 'xw@qq.com', '25D55AD283AA400AF464C76D713C07AD', '17', '1', '', 'admin', '2019-07-02 22:21:22', '0:0:0:0:0:0:0:1');
