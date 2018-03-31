/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : ykg

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-03-30 19:30:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yk_account_log
-- ----------------------------
DROP TABLE IF EXISTS `yk_account_log`;
CREATE TABLE `yk_account_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `type` tinyint(4) NOT NULL COMMENT '1 绑定 2 解绑',
  `account` varchar(150) NOT NULL COMMENT '账户',
  `field` varchar(50) NOT NULL COMMENT '字段',
  `time` int(11) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账户操作日志';

-- ----------------------------
-- Records of yk_account_log
-- ----------------------------

-- ----------------------------
-- Table structure for yk_administrator
-- ----------------------------
DROP TABLE IF EXISTS `yk_administrator`;
CREATE TABLE `yk_administrator` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `administrator` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码（MD5加密）',
  `cher` varchar(6) NOT NULL DEFAULT '' COMMENT '6位随机字符串',
  `num` varchar(8) DEFAULT '' COMMENT '登入次数',
  `last_time` varchar(10) DEFAULT '' COMMENT '上次登入时间',
  `login_time` varchar(10) DEFAULT '' COMMENT '登入时间',
  `login_ip` varchar(20) DEFAULT '' COMMENT '登入ip',
  `rid` int(8) DEFAULT NULL COMMENT '角色判断。关联管理员角色表ID',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '判断是否可以删除，1为否，0为是',
  `edit_time` varchar(10) DEFAULT '' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of yk_administrator
-- ----------------------------
INSERT INTO `yk_administrator` VALUES ('1', 'admin', 'b0746c10d434c9c0f2e178bf62cc1dbe', '4m4t6t', '514', '1522377617', '1522377617', '127.0.0.1', '1', '1', '');

-- ----------------------------
-- Table structure for yk_administrator_rank
-- ----------------------------
DROP TABLE IF EXISTS `yk_administrator_rank`;
CREATE TABLE `yk_administrator_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adname` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员角色名',
  `rank` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员权限',
  `is_del` tinyint(1) NOT NULL COMMENT '判断是否可以删除。0为否，1为是',
  `addtime` varchar(10) DEFAULT '' COMMENT '添加时间',
  `edit_time` varchar(10) DEFAULT '' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台角色表';

-- ----------------------------
-- Records of yk_administrator_rank
-- ----------------------------
INSERT INTO `yk_administrator_rank` VALUES ('1', '超级管理员', '0', '0', '1479206818', '1479206818');

-- ----------------------------
-- Table structure for yk_adv
-- ----------------------------
DROP TABLE IF EXISTS `yk_adv`;
CREATE TABLE `yk_adv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(300) NOT NULL COMMENT '广告图片',
  `url` varchar(300) NOT NULL COMMENT '点击链接',
  `score` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `time` int(11) NOT NULL COMMENT '添加时间',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型 1书籍 2外链 3 webview',
  `position` int(11) NOT NULL DEFAULT '2' COMMENT '位置 1 左上角 2 页面',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1 正常 2 禁用',
  `equipment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '设备 1 所有 2 安卓 3 ios',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of yk_adv
-- ----------------------------
INSERT INTO `yk_adv` VALUES ('1', 'http://www.baidu.com/img/bd_logo1.png', 'http://www.baidu.com', '0', '0', '2', '1', '1', '1');

-- ----------------------------
-- Table structure for yk_author
-- ----------------------------
DROP TABLE IF EXISTS `yk_author`;
CREATE TABLE `yk_author` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3153 DEFAULT CHARSET=utf8 COMMENT='作者表';

-- ----------------------------
-- Records of yk_author
-- ----------------------------
INSERT INTO `yk_author` VALUES ('1', '老婆最爱我');
INSERT INTO `yk_author` VALUES ('2', '心凉自然静');
INSERT INTO `yk_author` VALUES ('3', '宋  涛');
INSERT INTO `yk_author` VALUES ('4', '17我写书');
INSERT INTO `yk_author` VALUES ('5', '不朽沧桑');
INSERT INTO `yk_author` VALUES ('6', '西关客');
INSERT INTO `yk_author` VALUES ('7', '楼台接绿柳');
INSERT INTO `yk_author` VALUES ('8', '武林拐歪侠');
INSERT INTO `yk_author` VALUES ('9', '六叶青玄');
INSERT INTO `yk_author` VALUES ('10', '杨学会（笔名：暗地妖娆）');
INSERT INTO `yk_author` VALUES ('11', '周婷婷');
INSERT INTO `yk_author` VALUES ('12', '李飚');
INSERT INTO `yk_author` VALUES ('13', '金萍');
INSERT INTO `yk_author` VALUES ('14', '周  治');
INSERT INTO `yk_author` VALUES ('15', '清月冰蓝');
INSERT INTO `yk_author` VALUES ('16', '树上的男爵');
INSERT INTO `yk_author` VALUES ('17', '韦省民');
INSERT INTO `yk_author` VALUES ('18', '破万卷');
INSERT INTO `yk_author` VALUES ('19', '神奇的柚子');
INSERT INTO `yk_author` VALUES ('20', '萧适');
INSERT INTO `yk_author` VALUES ('21', '毒刺骨');
INSERT INTO `yk_author` VALUES ('22', '大叶');
INSERT INTO `yk_author` VALUES ('23', '我自我自在');
INSERT INTO `yk_author` VALUES ('24', '木林森444');
INSERT INTO `yk_author` VALUES ('25', '温东篱');
INSERT INTO `yk_author` VALUES ('26', '东一方');
INSERT INTO `yk_author` VALUES ('27', '默沫0');
INSERT INTO `yk_author` VALUES ('28', '纯银耳坠');
INSERT INTO `yk_author` VALUES ('29', '鱼籽');
INSERT INTO `yk_author` VALUES ('30', '爱吃汉堡包');
INSERT INTO `yk_author` VALUES ('31', '鱼歌');
INSERT INTO `yk_author` VALUES ('32', '失落叶');
INSERT INTO `yk_author` VALUES ('33', '陈博');
INSERT INTO `yk_author` VALUES ('34', '常桦');
INSERT INTO `yk_author` VALUES ('35', '常福');
INSERT INTO `yk_author` VALUES ('36', '王咏星');
INSERT INTO `yk_author` VALUES ('37', '易强');
INSERT INTO `yk_author` VALUES ('38', '赵丽荣');
INSERT INTO `yk_author` VALUES ('39', '弘缘');
INSERT INTO `yk_author` VALUES ('40', '许骥');
INSERT INTO `yk_author` VALUES ('41', '阿卡狄亚');
INSERT INTO `yk_author` VALUES ('42', '问道,孙亚兰');
INSERT INTO `yk_author` VALUES ('43', '狮子东');
INSERT INTO `yk_author` VALUES ('44', '花木帅');
INSERT INTO `yk_author` VALUES ('45', '步千帆');
INSERT INTO `yk_author` VALUES ('46', '八宝');
INSERT INTO `yk_author` VALUES ('47', '黑暗崛起');
INSERT INTO `yk_author` VALUES ('48', '竹香书屋');
INSERT INTO `yk_author` VALUES ('49', '中下马笃');
INSERT INTO `yk_author` VALUES ('50', '如墨似血');
INSERT INTO `yk_author` VALUES ('51', '醉时眠');
INSERT INTO `yk_author` VALUES ('52', '栀子不太乖');
INSERT INTO `yk_author` VALUES ('53', '都点检');
INSERT INTO `yk_author` VALUES ('54', '坐愁');
INSERT INTO `yk_author` VALUES ('55', '九戈龙');
INSERT INTO `yk_author` VALUES ('56', 'hunter.wuya');
INSERT INTO `yk_author` VALUES ('57', '书中臭虫');
INSERT INTO `yk_author` VALUES ('58', '幻觉傲笔');
INSERT INTO `yk_author` VALUES ('59', '枫桦正茂');
INSERT INTO `yk_author` VALUES ('60', '盾牌');
INSERT INTO `yk_author` VALUES ('61', '那一抹温柔');
INSERT INTO `yk_author` VALUES ('62', '罗静');
INSERT INTO `yk_author` VALUES ('63', '天上天下无双刀');
INSERT INTO `yk_author` VALUES ('64', '正信01');
INSERT INTO `yk_author` VALUES ('65', '亦何在');
INSERT INTO `yk_author` VALUES ('66', '痞子的诺基亚');
INSERT INTO `yk_author` VALUES ('67', '淡天然');
INSERT INTO `yk_author` VALUES ('68', '神月偷天');
INSERT INTO `yk_author` VALUES ('69', '楚尘');
INSERT INTO `yk_author` VALUES ('70', '何老师');
INSERT INTO `yk_author` VALUES ('71', '黄石');
INSERT INTO `yk_author` VALUES ('72', '从周');
INSERT INTO `yk_author` VALUES ('73', '诗谕');
INSERT INTO `yk_author` VALUES ('74', '影月晨星');
INSERT INTO `yk_author` VALUES ('75', '那相');
INSERT INTO `yk_author` VALUES ('76', '浪人Li');
INSERT INTO `yk_author` VALUES ('77', '二十七画生');
INSERT INTO `yk_author` VALUES ('78', '暴走前的沉默');
INSERT INTO `yk_author` VALUES ('79', '江满空');
INSERT INTO `yk_author` VALUES ('80', '腹黑小帝');
INSERT INTO `yk_author` VALUES ('81', '疯子李');
INSERT INTO `yk_author` VALUES ('82', '清蒸萝卜');
INSERT INTO `yk_author` VALUES ('83', '三流人');
INSERT INTO `yk_author` VALUES ('84', '紫风怀乱');
INSERT INTO `yk_author` VALUES ('85', '却胜');
INSERT INTO `yk_author` VALUES ('86', '皇小祥');
INSERT INTO `yk_author` VALUES ('87', '穿越二代');
INSERT INTO `yk_author` VALUES ('88', '向右看');
INSERT INTO `yk_author` VALUES ('89', '月思行');
INSERT INTO `yk_author` VALUES ('90', '摩越');
INSERT INTO `yk_author` VALUES ('91', '风在云上走');
INSERT INTO `yk_author` VALUES ('92', '余空');
INSERT INTO `yk_author` VALUES ('93', '封爵');
INSERT INTO `yk_author` VALUES ('94', '梦弈天');
INSERT INTO `yk_author` VALUES ('95', '无极阴阳');
INSERT INTO `yk_author` VALUES ('96', '梁浩淼');
INSERT INTO `yk_author` VALUES ('97', '徒然');
INSERT INTO `yk_author` VALUES ('98', '马拉多了累');
INSERT INTO `yk_author` VALUES ('99', 'Ｄ伯爵');
INSERT INTO `yk_author` VALUES ('100', '马骑天');
INSERT INTO `yk_author` VALUES ('101', '大扮菜');
INSERT INTO `yk_author` VALUES ('102', '弱水三千');
INSERT INTO `yk_author` VALUES ('103', '文子轩翼');
INSERT INTO `yk_author` VALUES ('104', '九菇凉');
INSERT INTO `yk_author` VALUES ('105', '鲜卑皇族拓跋羽');
INSERT INTO `yk_author` VALUES ('106', '暮晓天aholic');
INSERT INTO `yk_author` VALUES ('107', '繁华二当家');
INSERT INTO `yk_author` VALUES ('108', '冰茗雁行');
INSERT INTO `yk_author` VALUES ('109', '伊达我流');
INSERT INTO `yk_author` VALUES ('110', '我是小农民');
INSERT INTO `yk_author` VALUES ('111', '大山瑶人');
INSERT INTO `yk_author` VALUES ('112', '独舞俊');
INSERT INTO `yk_author` VALUES ('113', '书生三少');
INSERT INTO `yk_author` VALUES ('114', '春江钓客');
INSERT INTO `yk_author` VALUES ('115', '狂妄之龙');
INSERT INTO `yk_author` VALUES ('116', '诺岩');
INSERT INTO `yk_author` VALUES ('117', '路边呆子');
INSERT INTO `yk_author` VALUES ('118', '一个老兵');
INSERT INTO `yk_author` VALUES ('119', '大石浪');
INSERT INTO `yk_author` VALUES ('120', '天边的海鸥');
INSERT INTO `yk_author` VALUES ('121', '破名');
INSERT INTO `yk_author` VALUES ('122', '千重草');
INSERT INTO `yk_author` VALUES ('123', '一月十叁');
INSERT INTO `yk_author` VALUES ('124', '偷偷是盗');
INSERT INTO `yk_author` VALUES ('125', '吾之源');
INSERT INTO `yk_author` VALUES ('126', '清风求败');
INSERT INTO `yk_author` VALUES ('127', '妞妞的爹地');
INSERT INTO `yk_author` VALUES ('128', '扑街肥猫');
INSERT INTO `yk_author` VALUES ('129', '神李三思');
INSERT INTO `yk_author` VALUES ('130', '毁道人');
INSERT INTO `yk_author` VALUES ('131', '窝囊废');
INSERT INTO `yk_author` VALUES ('132', '月微眠');
INSERT INTO `yk_author` VALUES ('133', '贾海');
INSERT INTO `yk_author` VALUES ('134', '怒惊破天');
INSERT INTO `yk_author` VALUES ('135', '势神');
INSERT INTO `yk_author` VALUES ('136', '超级跟班');
INSERT INTO `yk_author` VALUES ('137', '素');
INSERT INTO `yk_author` VALUES ('138', '千亦');
INSERT INTO `yk_author` VALUES ('139', '八度妖');
INSERT INTO `yk_author` VALUES ('140', '破长风');
INSERT INTO `yk_author` VALUES ('141', '笨鸟会飞');
INSERT INTO `yk_author` VALUES ('142', '古召');
INSERT INTO `yk_author` VALUES ('143', '小铃铛');
INSERT INTO `yk_author` VALUES ('144', '明十三');
INSERT INTO `yk_author` VALUES ('145', '会飞的团子');
INSERT INTO `yk_author` VALUES ('146', '伍一书');
INSERT INTO `yk_author` VALUES ('147', '李清兆');
INSERT INTO `yk_author` VALUES ('148', '拉风的树');
INSERT INTO `yk_author` VALUES ('149', '萧莫愁');
INSERT INTO `yk_author` VALUES ('150', '王六郎');
INSERT INTO `yk_author` VALUES ('151', '轩辕唐唐');
INSERT INTO `yk_author` VALUES ('152', '秋丫丫');
INSERT INTO `yk_author` VALUES ('153', '夏陌桐');
INSERT INTO `yk_author` VALUES ('154', '木樨香');
INSERT INTO `yk_author` VALUES ('155', '疯子有个QI');
INSERT INTO `yk_author` VALUES ('156', 'Baby魅舞');
INSERT INTO `yk_author` VALUES ('157', '咱家小四');
INSERT INTO `yk_author` VALUES ('158', '凤兮瑶');
INSERT INTO `yk_author` VALUES ('159', '宇文花青');
INSERT INTO `yk_author` VALUES ('160', '绯若烟');
INSERT INTO `yk_author` VALUES ('161', '拾禾');
INSERT INTO `yk_author` VALUES ('162', '梦游');
INSERT INTO `yk_author` VALUES ('163', '何语安');
INSERT INTO `yk_author` VALUES ('164', '凉薄铯');
INSERT INTO `yk_author` VALUES ('165', '小杰');
INSERT INTO `yk_author` VALUES ('166', '木羊少爷');
INSERT INTO `yk_author` VALUES ('167', '白裙高跟');
INSERT INTO `yk_author` VALUES ('168', '新落');
INSERT INTO `yk_author` VALUES ('169', '梦中的童话');
INSERT INTO `yk_author` VALUES ('170', '眉心');
INSERT INTO `yk_author` VALUES ('171', '素白');
INSERT INTO `yk_author` VALUES ('172', '铭玥');
INSERT INTO `yk_author` VALUES ('173', '墨雨桑');
INSERT INTO `yk_author` VALUES ('174', '花花猫');
INSERT INTO `yk_author` VALUES ('175', '安之向暖');
INSERT INTO `yk_author` VALUES ('176', '不言成蹊');
INSERT INTO `yk_author` VALUES ('177', '羽殇离歌');
INSERT INTO `yk_author` VALUES ('178', '白秋练');
INSERT INTO `yk_author` VALUES ('179', '慕宜');
INSERT INTO `yk_author` VALUES ('180', '敢问你是谁家小姐');
INSERT INTO `yk_author` VALUES ('181', '菻川');
INSERT INTO `yk_author` VALUES ('182', '猫耳素溢');
INSERT INTO `yk_author` VALUES ('183', '萧洒洒');
INSERT INTO `yk_author` VALUES ('184', '不老妖精');
INSERT INTO `yk_author` VALUES ('185', '沁小琦');
INSERT INTO `yk_author` VALUES ('186', '萌语');
INSERT INTO `yk_author` VALUES ('187', '叶玖月');
INSERT INTO `yk_author` VALUES ('188', '南川南');
INSERT INTO `yk_author` VALUES ('189', '君语然');
INSERT INTO `yk_author` VALUES ('190', '习暖风');
INSERT INTO `yk_author` VALUES ('191', '天晚寒');
INSERT INTO `yk_author` VALUES ('192', '倾城雪');
INSERT INTO `yk_author` VALUES ('193', '最暖情话');
INSERT INTO `yk_author` VALUES ('194', '雪的星星');
INSERT INTO `yk_author` VALUES ('195', '白云黑土');
INSERT INTO `yk_author` VALUES ('196', '九菜花');
INSERT INTO `yk_author` VALUES ('197', '紫晴雨露');
INSERT INTO `yk_author` VALUES ('198', '陌陌初寻');
INSERT INTO `yk_author` VALUES ('199', '二货女王');
INSERT INTO `yk_author` VALUES ('200', '午夜尖叫');
INSERT INTO `yk_author` VALUES ('201', '郑景川');
INSERT INTO `yk_author` VALUES ('202', '云深无迹');
INSERT INTO `yk_author` VALUES ('203', '白羽落');
INSERT INTO `yk_author` VALUES ('204', '蓝莓小妖baby');
INSERT INTO `yk_author` VALUES ('205', '李雨霞');
INSERT INTO `yk_author` VALUES ('206', '我本无意倾城');
INSERT INTO `yk_author` VALUES ('207', '秋香姐');
INSERT INTO `yk_author` VALUES ('208', '红了容颜');
INSERT INTO `yk_author` VALUES ('209', '西瓜冰');
INSERT INTO `yk_author` VALUES ('210', '梦儿妃');
INSERT INTO `yk_author` VALUES ('211', '如娇似妻');
INSERT INTO `yk_author` VALUES ('212', '青远恒');
INSERT INTO `yk_author` VALUES ('213', '青争');
INSERT INTO `yk_author` VALUES ('214', '逍遥的逍遥的尾巴');
INSERT INTO `yk_author` VALUES ('215', '秀崽');
INSERT INTO `yk_author` VALUES ('216', '灼千晓');
INSERT INTO `yk_author` VALUES ('217', '忧伤晓子');
INSERT INTO `yk_author` VALUES ('218', '左一唯');
INSERT INTO `yk_author` VALUES ('219', '夏苡悦');
INSERT INTO `yk_author` VALUES ('220', '棱夕');
INSERT INTO `yk_author` VALUES ('221', '绯色凉烟');
INSERT INTO `yk_author` VALUES ('222', '快到碗里');
INSERT INTO `yk_author` VALUES ('223', '笨笨的白菜');
INSERT INTO `yk_author` VALUES ('224', '寻语珀');
INSERT INTO `yk_author` VALUES ('225', '夜曛');
INSERT INTO `yk_author` VALUES ('226', '胤修');
INSERT INTO `yk_author` VALUES ('227', '时潇');
INSERT INTO `yk_author` VALUES ('228', '古风白裳');
INSERT INTO `yk_author` VALUES ('229', '陈泰先');
INSERT INTO `yk_author` VALUES ('230', '郜元宝解读');
INSERT INTO `yk_author` VALUES ('231', '惠宁，徐明娟');
INSERT INTO `yk_author` VALUES ('232', '孙绍武');
INSERT INTO `yk_author` VALUES ('233', '王姝');
INSERT INTO `yk_author` VALUES ('234', '熊力樊著');
INSERT INTO `yk_author` VALUES ('235', '《图说天下·国家地理》委会');
INSERT INTO `yk_author` VALUES ('236', '吴韫丽,刘丽丹,译');
INSERT INTO `yk_author` VALUES ('237', '李金桂');
INSERT INTO `yk_author` VALUES ('238', '曹顺庆著');
INSERT INTO `yk_author` VALUES ('239', '韩震');
INSERT INTO `yk_author` VALUES ('240', '安家正');
INSERT INTO `yk_author` VALUES ('241', '吕叔春');
INSERT INTO `yk_author` VALUES ('242', '竭宝峰');
INSERT INTO `yk_author` VALUES ('243', '野谷道人　');
INSERT INTO `yk_author` VALUES ('244', '薛舒');
INSERT INTO `yk_author` VALUES ('245', '人海中');
INSERT INTO `yk_author` VALUES ('246', '林之满 萧枫　');
INSERT INTO `yk_author` VALUES ('247', '石磊');
INSERT INTO `yk_author` VALUES ('248', '刘战英');
INSERT INTO `yk_author` VALUES ('249', '苗长青');
INSERT INTO `yk_author` VALUES ('250', '王蒙');
INSERT INTO `yk_author` VALUES ('251', '王安忆');
INSERT INTO `yk_author` VALUES ('252', '于茂田');
INSERT INTO `yk_author` VALUES ('253', '朱凌云,楼晓英,');
INSERT INTO `yk_author` VALUES ('254', '张福华著');
INSERT INTO `yk_author` VALUES ('255', '张卡夫');
INSERT INTO `yk_author` VALUES ('256', '曾祥伍');
INSERT INTO `yk_author` VALUES ('257', '邢庆杰');
INSERT INTO `yk_author` VALUES ('258', '〔俄〕陀思妥耶夫斯基,,陈晓丹,编译');
INSERT INTO `yk_author` VALUES ('259', '周琼李子明等编');
INSERT INTO `yk_author` VALUES ('260', '[西汉]司马迁等著');
INSERT INTO `yk_author` VALUES ('261', '李楠');
INSERT INTO `yk_author` VALUES ('262', '（战国）吕不韦');
INSERT INTO `yk_author` VALUES ('263', '《黄陵文典》编纂委员会');
INSERT INTO `yk_author` VALUES ('264', '(苏)路卜洵');
INSERT INTO `yk_author` VALUES ('265', '【唐】张为');
INSERT INTO `yk_author` VALUES ('266', '张呈忠');
INSERT INTO `yk_author` VALUES ('267', '（清）王国维');
INSERT INTO `yk_author` VALUES ('268', '张继焦');
INSERT INTO `yk_author` VALUES ('269', '(美)杜维明');
INSERT INTO `yk_author` VALUES ('270', '李新纯');
INSERT INTO `yk_author` VALUES ('271', '泉林');
INSERT INTO `yk_author` VALUES ('272', '韩华仁');
INSERT INTO `yk_author` VALUES ('273', '范玉敏');
INSERT INTO `yk_author` VALUES ('274', '任振焦');
INSERT INTO `yk_author` VALUES ('275', '方州');
INSERT INTO `yk_author` VALUES ('276', '江四喜');
INSERT INTO `yk_author` VALUES ('277', '影响力中央研究院教材专家组编著');
INSERT INTO `yk_author` VALUES ('278', '李琴');
INSERT INTO `yk_author` VALUES ('279', '张志刚');
INSERT INTO `yk_author` VALUES ('280', '崔志勇');
INSERT INTO `yk_author` VALUES ('281', '王子鱼');
INSERT INTO `yk_author` VALUES ('282', '李辉');
INSERT INTO `yk_author` VALUES ('283', '赵小鹏');
INSERT INTO `yk_author` VALUES ('284', '赵萍');
INSERT INTO `yk_author` VALUES ('285', '仲远明 王茵萍');
INSERT INTO `yk_author` VALUES ('286', '卓雅');
INSERT INTO `yk_author` VALUES ('287', '徐慧霞');
INSERT INTO `yk_author` VALUES ('288', '陈达萌');
INSERT INTO `yk_author` VALUES ('289', '安子');
INSERT INTO `yk_author` VALUES ('290', '陈彬，刘彬');
INSERT INTO `yk_author` VALUES ('291', '陈保才');
INSERT INTO `yk_author` VALUES ('292', '夏兰');
INSERT INTO `yk_author` VALUES ('293', '余悦');
INSERT INTO `yk_author` VALUES ('294', '苏芸');
INSERT INTO `yk_author` VALUES ('295', '董淑亮');
INSERT INTO `yk_author` VALUES ('296', '李剑亮');
INSERT INTO `yk_author` VALUES ('297', '姜舒文');
INSERT INTO `yk_author` VALUES ('298', '刘细发');
INSERT INTO `yk_author` VALUES ('299', '苏建宇');
INSERT INTO `yk_author` VALUES ('300', '于海燕，李建良，俞华');
INSERT INTO `yk_author` VALUES ('301', '(美)法舍(Fasser, Y. )，(美)乔泰勒(Stiteler, S. )');
INSERT INTO `yk_author` VALUES ('302', '清心');
INSERT INTO `yk_author` VALUES ('303', '陈全根');
INSERT INTO `yk_author` VALUES ('304', '萧枫');
INSERT INTO `yk_author` VALUES ('305', '付艾琳编');
INSERT INTO `yk_author` VALUES ('306', '方士华');
INSERT INTO `yk_author` VALUES ('307', '约翰·狄克森·卡尔');
INSERT INTO `yk_author` VALUES ('308', '曾建华');
INSERT INTO `yk_author` VALUES ('309', '刘小莉');
INSERT INTO `yk_author` VALUES ('310', '曹素英');
INSERT INTO `yk_author` VALUES ('311', '徐江善等著');
INSERT INTO `yk_author` VALUES ('312', '纳兰泽芸');
INSERT INTO `yk_author` VALUES ('313', '吕晓滨');
INSERT INTO `yk_author` VALUES ('314', '陈良琪');
INSERT INTO `yk_author` VALUES ('315', '彦博编著');
INSERT INTO `yk_author` VALUES ('316', '赵凯欣');
INSERT INTO `yk_author` VALUES ('317', '施晗');
INSERT INTO `yk_author` VALUES ('318', '源知人');
INSERT INTO `yk_author` VALUES ('319', '刘俊');
INSERT INTO `yk_author` VALUES ('320', '李元秀');
INSERT INTO `yk_author` VALUES ('321', '耿煜');
INSERT INTO `yk_author` VALUES ('322', '曼珠沙华');
INSERT INTO `yk_author` VALUES ('323', '谢志强');
INSERT INTO `yk_author` VALUES ('324', '何阿珺');
INSERT INTO `yk_author` VALUES ('325', '马昌仪');
INSERT INTO `yk_author` VALUES ('326', '盛文林');
INSERT INTO `yk_author` VALUES ('327', '唐晓东,吴效耘');
INSERT INTO `yk_author` VALUES ('328', '牧逸马');
INSERT INTO `yk_author` VALUES ('329', '郭勇编著');
INSERT INTO `yk_author` VALUES ('330', '蔡捷');
INSERT INTO `yk_author` VALUES ('331', '易思荣');
INSERT INTO `yk_author` VALUES ('332', '牙洞');
INSERT INTO `yk_author` VALUES ('333', '享安乐');
INSERT INTO `yk_author` VALUES ('334', '养牛人');
INSERT INTO `yk_author` VALUES ('335', '小菜豆腐汤');
INSERT INTO `yk_author` VALUES ('336', '天鸢未眠');
INSERT INTO `yk_author` VALUES ('337', '张子楚');
INSERT INTO `yk_author` VALUES ('338', '百颜');
INSERT INTO `yk_author` VALUES ('339', '袁小乔');
INSERT INTO `yk_author` VALUES ('340', '混吃混喝');
INSERT INTO `yk_author` VALUES ('341', '恋上企鹅');
INSERT INTO `yk_author` VALUES ('342', '(英)阿瑟·柯南道尔著');
INSERT INTO `yk_author` VALUES ('343', '郑丽英编著');
INSERT INTO `yk_author` VALUES ('344', '蓝辞');
INSERT INTO `yk_author` VALUES ('345', '小橘子');
INSERT INTO `yk_author` VALUES ('346', '五郎八卦棍');
INSERT INTO `yk_author` VALUES ('347', '黄斌');
INSERT INTO `yk_author` VALUES ('348', '鱼爷六岁');
INSERT INTO `yk_author` VALUES ('349', '卢宏学');
INSERT INTO `yk_author` VALUES ('350', '田伟');
INSERT INTO `yk_author` VALUES ('351', '周锡冰');
INSERT INTO `yk_author` VALUES ('352', '忆江');
INSERT INTO `yk_author` VALUES ('353', 'Sky威天下');
INSERT INTO `yk_author` VALUES ('354', '宫紫澄');
INSERT INTO `yk_author` VALUES ('355', '浅藤');
INSERT INTO `yk_author` VALUES ('356', '耀五');
INSERT INTO `yk_author` VALUES ('357', '元曲');
INSERT INTO `yk_author` VALUES ('358', '慕华');
INSERT INTO `yk_author` VALUES ('359', '烟枪');
INSERT INTO `yk_author` VALUES ('360', '夜凌郗');
INSERT INTO `yk_author` VALUES ('361', '烟雨江南');
INSERT INTO `yk_author` VALUES ('362', '风青阳');
INSERT INTO `yk_author` VALUES ('363', '善良的蜜蜂');
INSERT INTO `yk_author` VALUES ('364', '梦入洪荒');
INSERT INTO `yk_author` VALUES ('365', '老施');
INSERT INTO `yk_author` VALUES ('366', '冯志远');
INSERT INTO `yk_author` VALUES ('367', '化蝶飞沧舟');
INSERT INTO `yk_author` VALUES ('368', '野叶子');
INSERT INTO `yk_author` VALUES ('369', '肥茄子');
INSERT INTO `yk_author` VALUES ('370', '坐墙等红杏');
INSERT INTO `yk_author` VALUES ('371', '歪爽');
INSERT INTO `yk_author` VALUES ('372', '咫尺间');
INSERT INTO `yk_author` VALUES ('373', '罗森');
INSERT INTO `yk_author` VALUES ('374', '平凡魔术师');
INSERT INTO `yk_author` VALUES ('375', '暮夜寒枫');
INSERT INTO `yk_author` VALUES ('376', '这波不亏');
INSERT INTO `yk_author` VALUES ('377', '我是游戏爱好者');
INSERT INTO `yk_author` VALUES ('378', '凋零暮色');
INSERT INTO `yk_author` VALUES ('379', '黑大白');
INSERT INTO `yk_author` VALUES ('380', '贩卖青春的小嗜');
INSERT INTO `yk_author` VALUES ('381', '风雪凋零雨');
INSERT INTO `yk_author` VALUES ('382', '观海听涛');
INSERT INTO `yk_author` VALUES ('383', '镜梦长笙');
INSERT INTO `yk_author` VALUES ('384', '把酒当歌');
INSERT INTO `yk_author` VALUES ('385', '眺望余生');
INSERT INTO `yk_author` VALUES ('386', '鲁班尺');
INSERT INTO `yk_author` VALUES ('387', '温柔痞');
INSERT INTO `yk_author` VALUES ('388', '小登科');
INSERT INTO `yk_author` VALUES ('389', '星星辰');
INSERT INTO `yk_author` VALUES ('390', '爱辣吃不辣');
INSERT INTO `yk_author` VALUES ('391', '樱花散尽酒独酌');
INSERT INTO `yk_author` VALUES ('392', '戎殇');
INSERT INTO `yk_author` VALUES ('393', '鱼丸');
INSERT INTO `yk_author` VALUES ('394', '双喜壹哥');
INSERT INTO `yk_author` VALUES ('395', '喜国');
INSERT INTO `yk_author` VALUES ('396', '吝啬鬼');
INSERT INTO `yk_author` VALUES ('397', '枫落忆痕');
INSERT INTO `yk_author` VALUES ('398', '紫云天');
INSERT INTO `yk_author` VALUES ('399', '风圣大鹏');
INSERT INTO `yk_author` VALUES ('400', '干鱼');
INSERT INTO `yk_author` VALUES ('401', '谎言满世界');
INSERT INTO `yk_author` VALUES ('402', '帝绝心');
INSERT INTO `yk_author` VALUES ('403', '焚峰');
INSERT INTO `yk_author` VALUES ('404', '许元');
INSERT INTO `yk_author` VALUES ('405', '郁真羽');
INSERT INTO `yk_author` VALUES ('406', '西来');
INSERT INTO `yk_author` VALUES ('407', '东空');
INSERT INTO `yk_author` VALUES ('408', '×珩木×');
INSERT INTO `yk_author` VALUES ('409', '雅风共赏');
INSERT INTO `yk_author` VALUES ('410', '醉枕美人膝');
INSERT INTO `yk_author` VALUES ('411', '康俊');
INSERT INTO `yk_author` VALUES ('412', '无言123');
INSERT INTO `yk_author` VALUES ('413', '康小宝');
INSERT INTO `yk_author` VALUES ('414', '九斤一两');
INSERT INTO `yk_author` VALUES ('415', '失落灵魂');
INSERT INTO `yk_author` VALUES ('416', '冬天去看雪');
INSERT INTO `yk_author` VALUES ('417', '云天空');
INSERT INTO `yk_author` VALUES ('418', '无限生机');
INSERT INTO `yk_author` VALUES ('419', '尹道長');
INSERT INTO `yk_author` VALUES ('420', '缘分0');
INSERT INTO `yk_author` VALUES ('421', '瑞恩');
INSERT INTO `yk_author` VALUES ('422', '混混宝儿');
INSERT INTO `yk_author` VALUES ('423', '见血封侯');
INSERT INTO `yk_author` VALUES ('424', '神秘青年');
INSERT INTO `yk_author` VALUES ('425', '东尘子');
INSERT INTO `yk_author` VALUES ('426', '陶氏小宝');
INSERT INTO `yk_author` VALUES ('427', '者文');
INSERT INTO `yk_author` VALUES ('428', '天道勤酬');
INSERT INTO `yk_author` VALUES ('429', '三色道人');
INSERT INTO `yk_author` VALUES ('430', '无限地图炮');
INSERT INTO `yk_author` VALUES ('431', '光影者');
INSERT INTO `yk_author` VALUES ('432', '宴懒飞');
INSERT INTO `yk_author` VALUES ('433', '解凡生');
INSERT INTO `yk_author` VALUES ('434', '老猫不老');
INSERT INTO `yk_author` VALUES ('435', '李济洲');
INSERT INTO `yk_author` VALUES ('436', '三耳杯');
INSERT INTO `yk_author` VALUES ('437', '江画');
INSERT INTO `yk_author` VALUES ('438', '叶随风');
INSERT INTO `yk_author` VALUES ('439', '月明故里');
INSERT INTO `yk_author` VALUES ('440', '天龙飞舞');
INSERT INTO `yk_author` VALUES ('441', '大清探花');
INSERT INTO `yk_author` VALUES ('442', '易水丹心');
INSERT INTO `yk_author` VALUES ('443', '汪衍振');
INSERT INTO `yk_author` VALUES ('444', '道舞天伦');
INSERT INTO `yk_author` VALUES ('445', '熟馒头');
INSERT INTO `yk_author` VALUES ('446', '王紫衣');
INSERT INTO `yk_author` VALUES ('447', '弃人');
INSERT INTO `yk_author` VALUES ('448', '月云影');
INSERT INTO `yk_author` VALUES ('449', '茫点');
INSERT INTO `yk_author` VALUES ('450', '高冷的疯子');
INSERT INTO `yk_author` VALUES ('451', '四根木');
INSERT INTO `yk_author` VALUES ('452', '狸花');
INSERT INTO `yk_author` VALUES ('453', '袁之钰x');
INSERT INTO `yk_author` VALUES ('454', '衰鸟');
INSERT INTO `yk_author` VALUES ('455', '天策慕容子陵');
INSERT INTO `yk_author` VALUES ('456', '风向');
INSERT INTO `yk_author` VALUES ('457', '顺风翼');
INSERT INTO `yk_author` VALUES ('458', '之玄共生');
INSERT INTO `yk_author` VALUES ('459', '饭在哪里');
INSERT INTO `yk_author` VALUES ('460', '飘移部落');
INSERT INTO `yk_author` VALUES ('461', '楠木说');
INSERT INTO `yk_author` VALUES ('462', '断魂笛');
INSERT INTO `yk_author` VALUES ('463', '逍遥无涯');
INSERT INTO `yk_author` VALUES ('464', '飘零剑客');
INSERT INTO `yk_author` VALUES ('465', '简单or幸福');
INSERT INTO `yk_author` VALUES ('466', '火炎焱');
INSERT INTO `yk_author` VALUES ('467', '纹嘉');
INSERT INTO `yk_author` VALUES ('468', '胡啸龙');
INSERT INTO `yk_author` VALUES ('469', '十二胖');
INSERT INTO `yk_author` VALUES ('470', '寞萧寂曲');
INSERT INTO `yk_author` VALUES ('471', '凝眸七弦伤');
INSERT INTO `yk_author` VALUES ('472', '花开似与泪别');
INSERT INTO `yk_author` VALUES ('473', '禹晗');
INSERT INTO `yk_author` VALUES ('474', '且听一言');
INSERT INTO `yk_author` VALUES ('475', '三侑');
INSERT INTO `yk_author` VALUES ('476', '盼玉人');
INSERT INTO `yk_author` VALUES ('477', '王王今');
INSERT INTO `yk_author` VALUES ('478', '花洛依');
INSERT INTO `yk_author` VALUES ('479', '安隍');
INSERT INTO `yk_author` VALUES ('480', '饮晴');
INSERT INTO `yk_author` VALUES ('481', '糖玖玖');
INSERT INTO `yk_author` VALUES ('482', '唯爱古风');
INSERT INTO `yk_author` VALUES ('483', '沙米王子');
INSERT INTO `yk_author` VALUES ('484', '爱吃橙子');
INSERT INTO `yk_author` VALUES ('485', '流鱼儿');
INSERT INTO `yk_author` VALUES ('486', '十月心');
INSERT INTO `yk_author` VALUES ('487', '红绋无衣');
INSERT INTO `yk_author` VALUES ('488', '69');
INSERT INTO `yk_author` VALUES ('489', '陈竹');
INSERT INTO `yk_author` VALUES ('490', '慕白书');
INSERT INTO `yk_author` VALUES ('491', '书槿颜');
INSERT INTO `yk_author` VALUES ('492', '幺娘子');
INSERT INTO `yk_author` VALUES ('493', '岁月and流声');
INSERT INTO `yk_author` VALUES ('494', '荼蘼玉叶');
INSERT INTO `yk_author` VALUES ('495', '赤子琉璃');
INSERT INTO `yk_author` VALUES ('496', '吾御');
INSERT INTO `yk_author` VALUES ('497', '爱吃肉的小丸子');
INSERT INTO `yk_author` VALUES ('498', '月洛梵晨');
INSERT INTO `yk_author` VALUES ('499', '瑾山');
INSERT INTO `yk_author` VALUES ('500', '泪落心无痕');
INSERT INTO `yk_author` VALUES ('501', '艺术为佳');
INSERT INTO `yk_author` VALUES ('502', '孤音冷');
INSERT INTO `yk_author` VALUES ('503', '木轻烟');
INSERT INTO `yk_author` VALUES ('504', '墨上心头');
INSERT INTO `yk_author` VALUES ('505', '慕莀');
INSERT INTO `yk_author` VALUES ('506', '迷梦银蝶');
INSERT INTO `yk_author` VALUES ('507', '琼酸枝');
INSERT INTO `yk_author` VALUES ('508', '艺叶草蓝天');
INSERT INTO `yk_author` VALUES ('509', '栾风');
INSERT INTO `yk_author` VALUES ('510', '清涟湖畔');
INSERT INTO `yk_author` VALUES ('511', '和风微雨');
INSERT INTO `yk_author` VALUES ('512', '心可儿');
INSERT INTO `yk_author` VALUES ('513', '兵长的悲伤');
INSERT INTO `yk_author` VALUES ('514', '墨子心');
INSERT INTO `yk_author` VALUES ('515', '牧三月');
INSERT INTO `yk_author` VALUES ('516', '翔翔于飞');
INSERT INTO `yk_author` VALUES ('517', '胖丫丫');
INSERT INTO `yk_author` VALUES ('518', '巫三');
INSERT INTO `yk_author` VALUES ('519', '淡水鱼丸');
INSERT INTO `yk_author` VALUES ('520', '阿荧');
INSERT INTO `yk_author` VALUES ('521', '重九千');
INSERT INTO `yk_author` VALUES ('522', '上官真瑶');
INSERT INTO `yk_author` VALUES ('523', '柴门公子');
INSERT INTO `yk_author` VALUES ('524', '冷姜茶');
INSERT INTO `yk_author` VALUES ('525', '年爱笑');
INSERT INTO `yk_author` VALUES ('526', '夏桃三月');
INSERT INTO `yk_author` VALUES ('527', '司空秋');
INSERT INTO `yk_author` VALUES ('528', '荡荡妹');
INSERT INTO `yk_author` VALUES ('529', '悬崖上的百合');
INSERT INTO `yk_author` VALUES ('530', '二污木');
INSERT INTO `yk_author` VALUES ('531', '贝娜娜');
INSERT INTO `yk_author` VALUES ('532', '萌伢子');
INSERT INTO `yk_author` VALUES ('533', '禾玺');
INSERT INTO `yk_author` VALUES ('534', '清末羽');
INSERT INTO `yk_author` VALUES ('535', '娴雅玫瑰');
INSERT INTO `yk_author` VALUES ('536', 'L彬');
INSERT INTO `yk_author` VALUES ('537', '陌呦');
INSERT INTO `yk_author` VALUES ('538', '风逝花殇');
INSERT INTO `yk_author` VALUES ('539', '霖兮');
INSERT INTO `yk_author` VALUES ('540', '易芫');
INSERT INTO `yk_author` VALUES ('541', '雨璇儿');
INSERT INTO `yk_author` VALUES ('542', '许时七');
INSERT INTO `yk_author` VALUES ('543', '南边阿籽');
INSERT INTO `yk_author` VALUES ('544', '四大剑人');
INSERT INTO `yk_author` VALUES ('545', '邻家琪');
INSERT INTO `yk_author` VALUES ('546', '陌子然');
INSERT INTO `yk_author` VALUES ('547', '花开梦海');
INSERT INTO `yk_author` VALUES ('548', '焉知冷暖');
INSERT INTO `yk_author` VALUES ('549', '欧尼果');
INSERT INTO `yk_author` VALUES ('550', '浅川鸣水');
INSERT INTO `yk_author` VALUES ('551', '澜芯');
INSERT INTO `yk_author` VALUES ('552', '寞紫');
INSERT INTO `yk_author` VALUES ('553', '雨落红颜');
INSERT INTO `yk_author` VALUES ('554', '陈小莫');
INSERT INTO `yk_author` VALUES ('555', '袁村平');
INSERT INTO `yk_author` VALUES ('556', '小湖著');
INSERT INTO `yk_author` VALUES ('557', '杨冬儿');
INSERT INTO `yk_author` VALUES ('558', '娄义华');
INSERT INTO `yk_author` VALUES ('559', '苍暮爱');
INSERT INTO `yk_author` VALUES ('560', '杨发兴');
INSERT INTO `yk_author` VALUES ('561', '李建才，范海燕');
INSERT INTO `yk_author` VALUES ('562', '【唐】杨筠松');
INSERT INTO `yk_author` VALUES ('563', '安健');
INSERT INTO `yk_author` VALUES ('564', '胡慧君');
INSERT INTO `yk_author` VALUES ('565', '大袖遮天');
INSERT INTO `yk_author` VALUES ('566', '《青少年成长必读经典书系》编委会');
INSERT INTO `yk_author` VALUES ('567', '疏狂老鬼');
INSERT INTO `yk_author` VALUES ('568', '罗蔼轩');
INSERT INTO `yk_author` VALUES ('569', '镜中影');
INSERT INTO `yk_author` VALUES ('570', '李怡,郑家建');
INSERT INTO `yk_author` VALUES ('571', '任宪宝');
INSERT INTO `yk_author` VALUES ('572', '巴金');
INSERT INTO `yk_author` VALUES ('573', '许开祯');
INSERT INTO `yk_author` VALUES ('574', '冰心');
INSERT INTO `yk_author` VALUES ('575', '古龙');
INSERT INTO `yk_author` VALUES ('576', '桐华');
INSERT INTO `yk_author` VALUES ('577', '玲珑');
INSERT INTO `yk_author` VALUES ('578', '瞬间倾城');
INSERT INTO `yk_author` VALUES ('579', '蛋蛋1113');
INSERT INTO `yk_author` VALUES ('580', '乐小米');
INSERT INTO `yk_author` VALUES ('581', '西泽保彦');
INSERT INTO `yk_author` VALUES ('582', '王晓平');
INSERT INTO `yk_author` VALUES ('583', '曾国藩');
INSERT INTO `yk_author` VALUES ('584', '名教中人');
INSERT INTO `yk_author` VALUES ('585', '酌元亭主人');
INSERT INTO `yk_author` VALUES ('586', '华业');
INSERT INTO `yk_author` VALUES ('587', '(明)洪应明');
INSERT INTO `yk_author` VALUES ('588', '赵曙光');
INSERT INTO `yk_author` VALUES ('589', '（战国）屈原');
INSERT INTO `yk_author` VALUES ('590', '蔺红英');
INSERT INTO `yk_author` VALUES ('591', '陈章旺');
INSERT INTO `yk_author` VALUES ('592', '龚贤');
INSERT INTO `yk_author` VALUES ('593', '祝影');
INSERT INTO `yk_author` VALUES ('594', '徐谦');
INSERT INTO `yk_author` VALUES ('595', '夏鹏');
INSERT INTO `yk_author` VALUES ('596', '刘文清');
INSERT INTO `yk_author` VALUES ('597', '金庚石');
INSERT INTO `yk_author` VALUES ('598', '邢春如　　谈家水　');
INSERT INTO `yk_author` VALUES ('599', '李问渠');
INSERT INTO `yk_author` VALUES ('600', '严锴');
INSERT INTO `yk_author` VALUES ('601', '杨晓光，赵春媛主编');
INSERT INTO `yk_author` VALUES ('602', '陶涛');
INSERT INTO `yk_author` VALUES ('603', '张明主编');
INSERT INTO `yk_author` VALUES ('604', '左岸');
INSERT INTO `yk_author` VALUES ('605', '龙柒');
INSERT INTO `yk_author` VALUES ('606', '袁苹，齐国源主编');
INSERT INTO `yk_author` VALUES ('607', '朱西杰，牛阳');
INSERT INTO `yk_author` VALUES ('608', '张兴旺');
INSERT INTO `yk_author` VALUES ('609', '李丹等主编');
INSERT INTO `yk_author` VALUES ('610', '胡云生');
INSERT INTO `yk_author` VALUES ('611', '麦冬编著');
INSERT INTO `yk_author` VALUES ('612', '吴茂江');
INSERT INTO `yk_author` VALUES ('613', '黄峻菠');
INSERT INTO `yk_author` VALUES ('614', '刘丹');
INSERT INTO `yk_author` VALUES ('615', '全国人大常委会办公厅');
INSERT INTO `yk_author` VALUES ('616', '罗屹峰，王燕华');
INSERT INTO `yk_author` VALUES ('617', '赵文锴');
INSERT INTO `yk_author` VALUES ('618', '雪子');
INSERT INTO `yk_author` VALUES ('619', '墨香满楼');
INSERT INTO `yk_author` VALUES ('620', '李殿奎');
INSERT INTO `yk_author` VALUES ('621', '丛书编委会编撰');
INSERT INTO `yk_author` VALUES ('622', '张恩台');
INSERT INTO `yk_author` VALUES ('623', '姜正成');
INSERT INTO `yk_author` VALUES ('624', '曾谦');
INSERT INTO `yk_author` VALUES ('625', '王朝柱，张森林');
INSERT INTO `yk_author` VALUES ('626', '夏燕月');
INSERT INTO `yk_author` VALUES ('627', '(南非)普斯特');
INSERT INTO `yk_author` VALUES ('628', '丁海波');
INSERT INTO `yk_author` VALUES ('629', '李璞');
INSERT INTO `yk_author` VALUES ('630', '王艳琴');
INSERT INTO `yk_author` VALUES ('631', '王佳');
INSERT INTO `yk_author` VALUES ('632', '许文贤编著');
INSERT INTO `yk_author` VALUES ('633', '冯化平编译');
INSERT INTO `yk_author` VALUES ('634', '李现梅');
INSERT INTO `yk_author` VALUES ('635', '墨人');
INSERT INTO `yk_author` VALUES ('636', '王英涵');
INSERT INTO `yk_author` VALUES ('637', '(德)沃尔夫冈·麦克尔[等]著');
INSERT INTO `yk_author` VALUES ('638', '《我眼中的“百校兴学”》编委会');
INSERT INTO `yk_author` VALUES ('639', '田久林');
INSERT INTO `yk_author` VALUES ('640', '《稷山县志》纂委员会');
INSERT INTO `yk_author` VALUES ('641', '姬亚平');
INSERT INTO `yk_author` VALUES ('642', '蔡景仙');
INSERT INTO `yk_author` VALUES ('643', '艾绍润, 高海深');
INSERT INTO `yk_author` VALUES ('644', '饶宁华主编');
INSERT INTO `yk_author` VALUES ('645', '郭绍林');
INSERT INTO `yk_author` VALUES ('646', '熊召政著');
INSERT INTO `yk_author` VALUES ('647', '李硕儒');
INSERT INTO `yk_author` VALUES ('648', '张海君');
INSERT INTO `yk_author` VALUES ('649', '肖学周');
INSERT INTO `yk_author` VALUES ('650', '克拉克');
INSERT INTO `yk_author` VALUES ('651', '河南省启智基础教育图书出版策划有限公司');
INSERT INTO `yk_author` VALUES ('652', '韩起来，荆惠萍');
INSERT INTO `yk_author` VALUES ('653', '朱子熹');
INSERT INTO `yk_author` VALUES ('654', '霜玉露');
INSERT INTO `yk_author` VALUES ('655', '旭日二号');
INSERT INTO `yk_author` VALUES ('656', '无名指的幸福');
INSERT INTO `yk_author` VALUES ('657', '我与凌风');
INSERT INTO `yk_author` VALUES ('658', '点绛唇1');
INSERT INTO `yk_author` VALUES ('659', '樱白花雨');
INSERT INTO `yk_author` VALUES ('660', '幽蓝姬');
INSERT INTO `yk_author` VALUES ('661', '余伯流');
INSERT INTO `yk_author` VALUES ('662', '李国文');
INSERT INTO `yk_author` VALUES ('663', '穿越的土豆');
INSERT INTO `yk_author` VALUES ('664', '欧阳流浪');
INSERT INTO `yk_author` VALUES ('665', '小山茉莉');
INSERT INTO `yk_author` VALUES ('666', '伊秋枫');
INSERT INTO `yk_author` VALUES ('667', '鱼板面');
INSERT INTO `yk_author` VALUES ('668', '天涯一线');
INSERT INTO `yk_author` VALUES ('669', '黄老邪的玉箫');
INSERT INTO `yk_author` VALUES ('670', '枫吟紫辰');
INSERT INTO `yk_author` VALUES ('671', '金子来');
INSERT INTO `yk_author` VALUES ('672', '蔡平亮等编');
INSERT INTO `yk_author` VALUES ('673', '叶小文著');
INSERT INTO `yk_author` VALUES ('674', '胡华');
INSERT INTO `yk_author` VALUES ('675', '醉风琴');
INSERT INTO `yk_author` VALUES ('676', '皇甫天梦');
INSERT INTO `yk_author` VALUES ('677', '朝暮夕阳');
INSERT INTO `yk_author` VALUES ('678', '琳错错');
INSERT INTO `yk_author` VALUES ('679', '七妖格格');
INSERT INTO `yk_author` VALUES ('680', '潇梦哲');
INSERT INTO `yk_author` VALUES ('681', '叶碧煌战神');
INSERT INTO `yk_author` VALUES ('682', '笔仙在梦游');
INSERT INTO `yk_author` VALUES ('683', '天机变');
INSERT INTO `yk_author` VALUES ('684', '悲伤月');
INSERT INTO `yk_author` VALUES ('685', '大锅菜');
INSERT INTO `yk_author` VALUES ('686', '天暮雪');
INSERT INTO `yk_author` VALUES ('687', '蜗牛也飙车');
INSERT INTO `yk_author` VALUES ('688', '他乡的灯火');
INSERT INTO `yk_author` VALUES ('689', '弼老耶');
INSERT INTO `yk_author` VALUES ('690', '刘家二少');
INSERT INTO `yk_author` VALUES ('691', '轩逸扬');
INSERT INTO `yk_author` VALUES ('692', '绝唱风云');
INSERT INTO `yk_author` VALUES ('693', '王永恒');
INSERT INTO `yk_author` VALUES ('694', '狂剑柔情');
INSERT INTO `yk_author` VALUES ('695', '汐上花开');
INSERT INTO `yk_author` VALUES ('696', '不存在先生');
INSERT INTO `yk_author` VALUES ('697', 'H安好');
INSERT INTO `yk_author` VALUES ('698', '鲜奶蛋糕');
INSERT INTO `yk_author` VALUES ('699', '孽笑');
INSERT INTO `yk_author` VALUES ('700', '夜中步行者');
INSERT INTO `yk_author` VALUES ('701', '海贼十三幺');
INSERT INTO `yk_author` VALUES ('702', '一叶style');
INSERT INTO `yk_author` VALUES ('703', '君然公子');
INSERT INTO `yk_author` VALUES ('704', '依旧信仰');
INSERT INTO `yk_author` VALUES ('705', '誓不跑步');
INSERT INTO `yk_author` VALUES ('706', '一叶瓜洲');
INSERT INTO `yk_author` VALUES ('707', '欧阳苍尘');
INSERT INTO `yk_author` VALUES ('708', '农村户口');
INSERT INTO `yk_author` VALUES ('709', '恋空流年');
INSERT INTO `yk_author` VALUES ('710', '溜冰的猪');
INSERT INTO `yk_author` VALUES ('711', '尢夕');
INSERT INTO `yk_author` VALUES ('712', '杯酒千寻');
INSERT INTO `yk_author` VALUES ('713', '烟泠月');
INSERT INTO `yk_author` VALUES ('714', '金九');
INSERT INTO `yk_author` VALUES ('715', '野山珍');
INSERT INTO `yk_author` VALUES ('716', '识丁先生');
INSERT INTO `yk_author` VALUES ('717', '洪书言');
INSERT INTO `yk_author` VALUES ('718', '索拉卡');
INSERT INTO `yk_author` VALUES ('719', '苏门三杰');
INSERT INTO `yk_author` VALUES ('720', '云开天光彻');
INSERT INTO `yk_author` VALUES ('721', '当个诗人去流浪');
INSERT INTO `yk_author` VALUES ('722', '五马千');
INSERT INTO `yk_author` VALUES ('723', '坤堄');
INSERT INTO `yk_author` VALUES ('724', '唐烁');
INSERT INTO `yk_author` VALUES ('725', '折戟vs沉沙');
INSERT INTO `yk_author` VALUES ('726', '汪洋大海');
INSERT INTO `yk_author` VALUES ('727', '刘派小海');
INSERT INTO `yk_author` VALUES ('728', '蓝色星宇');
INSERT INTO `yk_author` VALUES ('729', '糖豆豆飞');
INSERT INTO `yk_author` VALUES ('730', '圣风之夜');
INSERT INTO `yk_author` VALUES ('731', '散步到太阳');
INSERT INTO `yk_author` VALUES ('732', '锐兴');
INSERT INTO `yk_author` VALUES ('733', '千色麒麟');
INSERT INTO `yk_author` VALUES ('734', '月夜水星');
INSERT INTO `yk_author` VALUES ('735', '魔巢居士');
INSERT INTO `yk_author` VALUES ('736', '冷月孤香');
INSERT INTO `yk_author` VALUES ('737', '伍色惡靈龍');
INSERT INTO `yk_author` VALUES ('738', '圣天洛');
INSERT INTO `yk_author` VALUES ('739', '非天羽');
INSERT INTO `yk_author` VALUES ('740', '高轩');
INSERT INTO `yk_author` VALUES ('741', '银色公爵');
INSERT INTO `yk_author` VALUES ('742', '凉拌茄子');
INSERT INTO `yk_author` VALUES ('743', '漫天飞刀飘');
INSERT INTO `yk_author` VALUES ('744', '嘉陵希渡');
INSERT INTO `yk_author` VALUES ('745', '破网鱼儿');
INSERT INTO `yk_author` VALUES ('746', '关隘');
INSERT INTO `yk_author` VALUES ('747', '左手旁的你');
INSERT INTO `yk_author` VALUES ('748', '清倌人');
INSERT INTO `yk_author` VALUES ('749', '还真');
INSERT INTO `yk_author` VALUES ('750', '风之天舞');
INSERT INTO `yk_author` VALUES ('751', '镜荣');
INSERT INTO `yk_author` VALUES ('752', '宝络');
INSERT INTO `yk_author` VALUES ('753', '初夏笙歌');
INSERT INTO `yk_author` VALUES ('754', '九州小妖');
INSERT INTO `yk_author` VALUES ('755', '虹云风暴');
INSERT INTO `yk_author` VALUES ('756', '老牤牛');
INSERT INTO `yk_author` VALUES ('757', '你居然');
INSERT INTO `yk_author` VALUES ('758', '一朵菊花分外红');
INSERT INTO `yk_author` VALUES ('759', '子凌小千');
INSERT INTO `yk_author` VALUES ('760', '末然');
INSERT INTO `yk_author` VALUES ('761', '导弹起飞');
INSERT INTO `yk_author` VALUES ('762', '华夏小虾');
INSERT INTO `yk_author` VALUES ('763', '半醉游子');
INSERT INTO `yk_author` VALUES ('764', '无境界');
INSERT INTO `yk_author` VALUES ('765', '惊艳的小胖');
INSERT INTO `yk_author` VALUES ('766', '菠萝哥哥');
INSERT INTO `yk_author` VALUES ('767', '我自漫步');
INSERT INTO `yk_author` VALUES ('768', '璃莫丝占');
INSERT INTO `yk_author` VALUES ('769', '张大牛');
INSERT INTO `yk_author` VALUES ('770', 'dood');
INSERT INTO `yk_author` VALUES ('771', '北域狂生');
INSERT INTO `yk_author` VALUES ('772', '哈犀');
INSERT INTO `yk_author` VALUES ('773', '李赵赵');
INSERT INTO `yk_author` VALUES ('774', '天空泪');
INSERT INTO `yk_author` VALUES ('775', '北方的狼');
INSERT INTO `yk_author` VALUES ('776', '我是九零后大大');
INSERT INTO `yk_author` VALUES ('777', '默逸羽');
INSERT INTO `yk_author` VALUES ('778', '大街上的野孩子');
INSERT INTO `yk_author` VALUES ('779', '落满天');
INSERT INTO `yk_author` VALUES ('780', '不知、不觉');
INSERT INTO `yk_author` VALUES ('781', '蓝雕雕');
INSERT INTO `yk_author` VALUES ('782', '难言语');
INSERT INTO `yk_author` VALUES ('783', '潇湘鱼人');
INSERT INTO `yk_author` VALUES ('784', '宋体五号');
INSERT INTO `yk_author` VALUES ('785', '佚明诗人');
INSERT INTO `yk_author` VALUES ('786', '紫叶晨明');
INSERT INTO `yk_author` VALUES ('787', '九薏');
INSERT INTO `yk_author` VALUES ('788', '盲鸟');
INSERT INTO `yk_author` VALUES ('789', '迷途的羊');
INSERT INTO `yk_author` VALUES ('790', '书慕薰');
INSERT INTO `yk_author` VALUES ('791', '西狸');
INSERT INTO `yk_author` VALUES ('792', '望秋叹');
INSERT INTO `yk_author` VALUES ('793', '花了孑');
INSERT INTO `yk_author` VALUES ('794', '墨染丹青');
INSERT INTO `yk_author` VALUES ('795', '星都');
INSERT INTO `yk_author` VALUES ('796', '本生');
INSERT INTO `yk_author` VALUES ('797', '珞璎');
INSERT INTO `yk_author` VALUES ('798', '千路');
INSERT INTO `yk_author` VALUES ('799', '拗九');
INSERT INTO `yk_author` VALUES ('800', '尹陌桑');
INSERT INTO `yk_author` VALUES ('801', '栩生');
INSERT INTO `yk_author` VALUES ('802', '姞雪心');
INSERT INTO `yk_author` VALUES ('803', '灰色北极熊');
INSERT INTO `yk_author` VALUES ('804', '思丁');
INSERT INTO `yk_author` VALUES ('805', '单眼皮儿W');
INSERT INTO `yk_author` VALUES ('806', '木尼黑');
INSERT INTO `yk_author` VALUES ('807', '东未女');
INSERT INTO `yk_author` VALUES ('808', '红绳牵着猫');
INSERT INTO `yk_author` VALUES ('809', '任恩硕');
INSERT INTO `yk_author` VALUES ('810', '轩辕驴蛋');
INSERT INTO `yk_author` VALUES ('811', '弗文几');
INSERT INTO `yk_author` VALUES ('812', '明月君心');
INSERT INTO `yk_author` VALUES ('813', '君为梁上燕');
INSERT INTO `yk_author` VALUES ('814', '忆文1');
INSERT INTO `yk_author` VALUES ('815', '安静的放着空气呼吸');
INSERT INTO `yk_author` VALUES ('816', '濯楚招招');
INSERT INTO `yk_author` VALUES ('817', '唐律');
INSERT INTO `yk_author` VALUES ('818', '北山杉');
INSERT INTO `yk_author` VALUES ('819', '冰梨蜜糖');
INSERT INTO `yk_author` VALUES ('820', '千斛明珠');
INSERT INTO `yk_author` VALUES ('821', '卿若湮');
INSERT INTO `yk_author` VALUES ('822', '陈恩雅');
INSERT INTO `yk_author` VALUES ('823', '小狐狸成精');
INSERT INTO `yk_author` VALUES ('824', '牧之歌');
INSERT INTO `yk_author` VALUES ('825', '寂容');
INSERT INTO `yk_author` VALUES ('826', '舞浅');
INSERT INTO `yk_author` VALUES ('827', '菱角米');
INSERT INTO `yk_author` VALUES ('828', '柳烟湄');
INSERT INTO `yk_author` VALUES ('829', 'Wallace糖糖');
INSERT INTO `yk_author` VALUES ('830', '烟鹦火');
INSERT INTO `yk_author` VALUES ('831', '粉妖');
INSERT INTO `yk_author` VALUES ('832', 'bb');
INSERT INTO `yk_author` VALUES ('833', '清扬宛兮');
INSERT INTO `yk_author` VALUES ('834', '小飞扬');
INSERT INTO `yk_author` VALUES ('835', '想念秋日');
INSERT INTO `yk_author` VALUES ('836', '君梦生');
INSERT INTO `yk_author` VALUES ('837', '棠栀扣');
INSERT INTO `yk_author` VALUES ('838', '青青夏草');
INSERT INTO `yk_author` VALUES ('839', '姒雪红月');
INSERT INTO `yk_author` VALUES ('840', '华愿雅梦');
INSERT INTO `yk_author` VALUES ('841', '清水四月');
INSERT INTO `yk_author` VALUES ('842', '夜映慕海');
INSERT INTO `yk_author` VALUES ('843', '邮箱里的皮娃娃');
INSERT INTO `yk_author` VALUES ('844', '荷塘妖');
INSERT INTO `yk_author` VALUES ('845', '决不妥协');
INSERT INTO `yk_author` VALUES ('846', '颜叶寒');
INSERT INTO `yk_author` VALUES ('847', '李冰珀');
INSERT INTO `yk_author` VALUES ('848', '梦恋之');
INSERT INTO `yk_author` VALUES ('849', '三步书');
INSERT INTO `yk_author` VALUES ('850', '谁抢了我燕山这个名字');
INSERT INTO `yk_author` VALUES ('851', '五月孤城');
INSERT INTO `yk_author` VALUES ('852', '金酉');
INSERT INTO `yk_author` VALUES ('853', '兰亭集');
INSERT INTO `yk_author` VALUES ('854', '郑默隅');
INSERT INTO `yk_author` VALUES ('855', '名门榜眼');
INSERT INTO `yk_author` VALUES ('856', '希言菲语');
INSERT INTO `yk_author` VALUES ('857', '记城');
INSERT INTO `yk_author` VALUES ('858', '颖凰冰阳');
INSERT INTO `yk_author` VALUES ('859', '轩萱风雪');
INSERT INTO `yk_author` VALUES ('860', '哈欠兄');
INSERT INTO `yk_author` VALUES ('861', '箫溪');
INSERT INTO `yk_author` VALUES ('862', '桐倚');
INSERT INTO `yk_author` VALUES ('863', '肥企鹅');
INSERT INTO `yk_author` VALUES ('864', '洋菓子物语');
INSERT INTO `yk_author` VALUES ('865', '陈莲香');
INSERT INTO `yk_author` VALUES ('866', '黄桃红');
INSERT INTO `yk_author` VALUES ('867', '何春燕');
INSERT INTO `yk_author` VALUES ('868', '夏悠然');
INSERT INTO `yk_author` VALUES ('869', '包冬冬');
INSERT INTO `yk_author` VALUES ('870', '钟敬文，张岱军');
INSERT INTO `yk_author` VALUES ('871', '(美)佛罗伦斯·希恩');
INSERT INTO `yk_author` VALUES ('872', '韩乃寅');
INSERT INTO `yk_author` VALUES ('873', '【汉】桓谭');
INSERT INTO `yk_author` VALUES ('874', '玛雅主编');
INSERT INTO `yk_author` VALUES ('875', '冯亚光');
INSERT INTO `yk_author` VALUES ('876', '徐卫民');
INSERT INTO `yk_author` VALUES ('877', '郑宏峰');
INSERT INTO `yk_author` VALUES ('878', '周广宇');
INSERT INTO `yk_author` VALUES ('879', '谢知伲');
INSERT INTO `yk_author` VALUES ('880', '陕西省妇女联合会,陕西省家庭教育研究会');
INSERT INTO `yk_author` VALUES ('881', '金跃军');
INSERT INTO `yk_author` VALUES ('882', '伊家河');
INSERT INTO `yk_author` VALUES ('883', '吴万夫');
INSERT INTO `yk_author` VALUES ('884', '李彩红');
INSERT INTO `yk_author` VALUES ('885', '绛琉璃');
INSERT INTO `yk_author` VALUES ('886', '多多 著');
INSERT INTO `yk_author` VALUES ('887', '梁柱');
INSERT INTO `yk_author` VALUES ('888', '(明)陈继儒');
INSERT INTO `yk_author` VALUES ('889', '温亚军');
INSERT INTO `yk_author` VALUES ('890', '董竞一');
INSERT INTO `yk_author` VALUES ('891', '(法)凡尔纳');
INSERT INTO `yk_author` VALUES ('892', '(清)曹雪芹');
INSERT INTO `yk_author` VALUES ('893', '【民国】蔡东藩');
INSERT INTO `yk_author` VALUES ('894', '冯志远、张立华');
INSERT INTO `yk_author` VALUES ('895', '(清)冯梦龙,(清)凌蒙初');
INSERT INTO `yk_author` VALUES ('896', '佚名');
INSERT INTO `yk_author` VALUES ('897', '【明】张应俞');
INSERT INTO `yk_author` VALUES ('898', '凌濛初');
INSERT INTO `yk_author` VALUES ('899', '古敏');
INSERT INTO `yk_author` VALUES ('900', '易发久著');
INSERT INTO `yk_author` VALUES ('901', '丁振宇杨芮茹');
INSERT INTO `yk_author` VALUES ('902', '榼藤子');
INSERT INTO `yk_author` VALUES ('903', '尤洁');
INSERT INTO `yk_author` VALUES ('904', '张庭政');
INSERT INTO `yk_author` VALUES ('905', '李忠祥');
INSERT INTO `yk_author` VALUES ('906', '周三多著');
INSERT INTO `yk_author` VALUES ('907', '白小波编著');
INSERT INTO `yk_author` VALUES ('908', '纪康保主编');
INSERT INTO `yk_author` VALUES ('909', '刘华');
INSERT INTO `yk_author` VALUES ('910', '李宏');
INSERT INTO `yk_author` VALUES ('911', '（加）吉娜·马莱');
INSERT INTO `yk_author` VALUES ('912', '白建乐,孟建华');
INSERT INTO `yk_author` VALUES ('913', '(美)克拉(Guella,F. )著');
INSERT INTO `yk_author` VALUES ('914', '《学做家常菜》编委会');
INSERT INTO `yk_author` VALUES ('915', '徐帮学');
INSERT INTO `yk_author` VALUES ('916', '刘青主编');
INSERT INTO `yk_author` VALUES ('917', '《民间幽默笑话集编委会');
INSERT INTO `yk_author` VALUES ('918', '席海燕');
INSERT INTO `yk_author` VALUES ('919', '橡树国际健康机构');
INSERT INTO `yk_author` VALUES ('920', '汗青编');
INSERT INTO `yk_author` VALUES ('921', '孙明一');
INSERT INTO `yk_author` VALUES ('922', '贾伟');
INSERT INTO `yk_author` VALUES ('923', '曹博');
INSERT INTO `yk_author` VALUES ('924', '侯书议');
INSERT INTO `yk_author` VALUES ('925', '任高潮');
INSERT INTO `yk_author` VALUES ('926', '刘东伟');
INSERT INTO `yk_author` VALUES ('927', '田晓娜');
INSERT INTO `yk_author` VALUES ('928', '国务院国资委编');
INSERT INTO `yk_author` VALUES ('929', '何水明');
INSERT INTO `yk_author` VALUES ('930', '付艾琳等编');
INSERT INTO `yk_author` VALUES ('931', '马兆峰');
INSERT INTO `yk_author` VALUES ('932', '叶舒宪');
INSERT INTO `yk_author` VALUES ('933', '冯先知');
INSERT INTO `yk_author` VALUES ('934', '周兴华 周晓宁');
INSERT INTO `yk_author` VALUES ('935', '苏基朗');
INSERT INTO `yk_author` VALUES ('936', '王书林');
INSERT INTO `yk_author` VALUES ('937', '潘强恩');
INSERT INTO `yk_author` VALUES ('938', '杨梓邑');
INSERT INTO `yk_author` VALUES ('939', '基辛格');
INSERT INTO `yk_author` VALUES ('940', '蒙俊');
INSERT INTO `yk_author` VALUES ('941', '方诚');
INSERT INTO `yk_author` VALUES ('942', '黄学英');
INSERT INTO `yk_author` VALUES ('943', '宋天天');
INSERT INTO `yk_author` VALUES ('944', '葛冰');
INSERT INTO `yk_author` VALUES ('945', '微型小说选刊杂志社');
INSERT INTO `yk_author` VALUES ('946', '肖峰');
INSERT INTO `yk_author` VALUES ('947', '(德)莱辛');
INSERT INTO `yk_author` VALUES ('948', '梅子');
INSERT INTO `yk_author` VALUES ('949', '李昭光主编');
INSERT INTO `yk_author` VALUES ('950', '神龙工作室');
INSERT INTO `yk_author` VALUES ('951', '书亦编');
INSERT INTO `yk_author` VALUES ('952', '白云');
INSERT INTO `yk_author` VALUES ('953', '郑西卫');
INSERT INTO `yk_author` VALUES ('954', '宗孝祖著');
INSERT INTO `yk_author` VALUES ('955', '孙承庭');
INSERT INTO `yk_author` VALUES ('956', '高鑫');
INSERT INTO `yk_author` VALUES ('957', '于跃编著');
INSERT INTO `yk_author` VALUES ('958', '李思佳,吴丹');
INSERT INTO `yk_author` VALUES ('959', '火仲舫');
INSERT INTO `yk_author` VALUES ('960', '编者：李景堂');
INSERT INTO `yk_author` VALUES ('961', '革文军');
INSERT INTO `yk_author` VALUES ('962', '杨智友');
INSERT INTO `yk_author` VALUES ('963', '肖丽');
INSERT INTO `yk_author` VALUES ('964', '李津');
INSERT INTO `yk_author` VALUES ('965', '张存远，肖飞');
INSERT INTO `yk_author` VALUES ('966', '栗静云');
INSERT INTO `yk_author` VALUES ('967', '牛月');
INSERT INTO `yk_author` VALUES ('968', '徐旭初,钱文荣');
INSERT INTO `yk_author` VALUES ('969', '王永军');
INSERT INTO `yk_author` VALUES ('970', '萧枫、竭宝峰、李慧');
INSERT INTO `yk_author` VALUES ('971', '洳河');
INSERT INTO `yk_author` VALUES ('972', '刘吾福');
INSERT INTO `yk_author` VALUES ('973', '孙启军');
INSERT INTO `yk_author` VALUES ('974', '刘殿学');
INSERT INTO `yk_author` VALUES ('975', '秋无名');
INSERT INTO `yk_author` VALUES ('976', '娣尔');
INSERT INTO `yk_author` VALUES ('977', '唯一的迷蝶');
INSERT INTO `yk_author` VALUES ('978', '刘干才，李奎');
INSERT INTO `yk_author` VALUES ('979', '吴义勤');
INSERT INTO `yk_author` VALUES ('980', '王跃文');
INSERT INTO `yk_author` VALUES ('981', '范军');
INSERT INTO `yk_author` VALUES ('982', '杨义堂');
INSERT INTO `yk_author` VALUES ('983', '赵闯');
INSERT INTO `yk_author` VALUES ('984', '秦贝臻');
INSERT INTO `yk_author` VALUES ('985', '小池');
INSERT INTO `yk_author` VALUES ('986', '诗酒啸傲');
INSERT INTO `yk_author` VALUES ('987', '艳绮罗生');
INSERT INTO `yk_author` VALUES ('988', '无怨无缘');
INSERT INTO `yk_author` VALUES ('989', '寒夜寂寥');
INSERT INTO `yk_author` VALUES ('990', '徒写');
INSERT INTO `yk_author` VALUES ('991', '草监');
INSERT INTO `yk_author` VALUES ('992', '云自无心水自闲');
INSERT INTO `yk_author` VALUES ('993', '菜三疯');
INSERT INTO `yk_author` VALUES ('994', '刘礼恺');
INSERT INTO `yk_author` VALUES ('995', '皇藏');
INSERT INTO `yk_author` VALUES ('996', '守辰');
INSERT INTO `yk_author` VALUES ('997', '舒巴坦钠');
INSERT INTO `yk_author` VALUES ('998', '风见涨');
INSERT INTO `yk_author` VALUES ('999', 'ck迎风');
INSERT INTO `yk_author` VALUES ('1000', '千年沉沦');
INSERT INTO `yk_author` VALUES ('1001', '楚江风雪');
INSERT INTO `yk_author` VALUES ('1002', '堕落忝子');
INSERT INTO `yk_author` VALUES ('1003', '独孤诚');
INSERT INTO `yk_author` VALUES ('1004', '沧海看雪');
INSERT INTO `yk_author` VALUES ('1005', '邪星');
INSERT INTO `yk_author` VALUES ('1006', '江南细雨');
INSERT INTO `yk_author` VALUES ('1007', '吃香蕉的狼');
INSERT INTO `yk_author` VALUES ('1008', '怒剑战天');
INSERT INTO `yk_author` VALUES ('1009', '女神守护者');
INSERT INTO `yk_author` VALUES ('1010', '冰火泉神');
INSERT INTO `yk_author` VALUES ('1011', '玉龙冠穹');
INSERT INTO `yk_author` VALUES ('1012', '佛怒子');
INSERT INTO `yk_author` VALUES ('1013', '丁门');
INSERT INTO `yk_author` VALUES ('1014', '宅雪');
INSERT INTO `yk_author` VALUES ('1015', '永无巅峰');
INSERT INTO `yk_author` VALUES ('1016', '天沣');
INSERT INTO `yk_author` VALUES ('1017', '十三尺');
INSERT INTO `yk_author` VALUES ('1018', '天星石');
INSERT INTO `yk_author` VALUES ('1019', '江东邪少');
INSERT INTO `yk_author` VALUES ('1020', '禾曰');
INSERT INTO `yk_author` VALUES ('1021', '辛无忌');
INSERT INTO `yk_author` VALUES ('1022', '三室一厅');
INSERT INTO `yk_author` VALUES ('1023', '掌生缘灭');
INSERT INTO `yk_author` VALUES ('1024', '龙之孤心');
INSERT INTO `yk_author` VALUES ('1025', '冷水澡');
INSERT INTO `yk_author` VALUES ('1026', '老妖精');
INSERT INTO `yk_author` VALUES ('1027', '阿穆达尔');
INSERT INTO `yk_author` VALUES ('1028', '那个什么');
INSERT INTO `yk_author` VALUES ('1029', '太阳蛋');
INSERT INTO `yk_author` VALUES ('1030', '那一片淡蓝');
INSERT INTO `yk_author` VALUES ('1031', '任泽');
INSERT INTO `yk_author` VALUES ('1032', '西班牙砖头');
INSERT INTO `yk_author` VALUES ('1033', '顺阳');
INSERT INTO `yk_author` VALUES ('1034', '一点红');
INSERT INTO `yk_author` VALUES ('1035', '御风龙神');
INSERT INTO `yk_author` VALUES ('1036', '口水小猪猪');
INSERT INTO `yk_author` VALUES ('1037', '鸢尾鸟');
INSERT INTO `yk_author` VALUES ('1038', '欧阳允');
INSERT INTO `yk_author` VALUES ('1039', '疯子要耍流氓');
INSERT INTO `yk_author` VALUES ('1040', '积雨');
INSERT INTO `yk_author` VALUES ('1041', '凤伊阙');
INSERT INTO `yk_author` VALUES ('1042', '烟柳落花');
INSERT INTO `yk_author` VALUES ('1043', '九霄');
INSERT INTO `yk_author` VALUES ('1044', '小庸');
INSERT INTO `yk_author` VALUES ('1045', '小楼昨夜轻风');
INSERT INTO `yk_author` VALUES ('1046', '红烧螃蟹');
INSERT INTO `yk_author` VALUES ('1047', '三师弟');
INSERT INTO `yk_author` VALUES ('1048', '沈家玉门');
INSERT INTO `yk_author` VALUES ('1049', '子非鱼83');
INSERT INTO `yk_author` VALUES ('1050', '雁来忆君');
INSERT INTO `yk_author` VALUES ('1051', '公子令伊');
INSERT INTO `yk_author` VALUES ('1052', '闪电刀客');
INSERT INTO `yk_author` VALUES ('1053', '雪域风流');
INSERT INTO `yk_author` VALUES ('1054', '战舞飞扬');
INSERT INTO `yk_author` VALUES ('1055', '酗酒');
INSERT INTO `yk_author` VALUES ('1056', '奥丁之锤');
INSERT INTO `yk_author` VALUES ('1057', '星丛');
INSERT INTO `yk_author` VALUES ('1058', '不吃秋葵的龙猫');
INSERT INTO `yk_author` VALUES ('1059', '一起单身');
INSERT INTO `yk_author` VALUES ('1060', '星星的叶子');
INSERT INTO `yk_author` VALUES ('1061', '东南匪');
INSERT INTO `yk_author` VALUES ('1062', '深渊提督');
INSERT INTO `yk_author` VALUES ('1063', '痕玖');
INSERT INTO `yk_author` VALUES ('1064', '无存在感的人');
INSERT INTO `yk_author` VALUES ('1065', '柳酆都');
INSERT INTO `yk_author` VALUES ('1066', '无妄虫灾');
INSERT INTO `yk_author` VALUES ('1067', '核桃笋干');
INSERT INTO `yk_author` VALUES ('1068', '忧子痴');
INSERT INTO `yk_author` VALUES ('1069', '梦火');
INSERT INTO `yk_author` VALUES ('1070', '读者喜欢我就开心');
INSERT INTO `yk_author` VALUES ('1071', '竹斑熊');
INSERT INTO `yk_author` VALUES ('1072', '金子息');
INSERT INTO `yk_author` VALUES ('1073', '娜样的露珠');
INSERT INTO `yk_author` VALUES ('1074', '王册册');
INSERT INTO `yk_author` VALUES ('1075', '绝恨长歌');
INSERT INTO `yk_author` VALUES ('1076', '鬼家三少');
INSERT INTO `yk_author` VALUES ('1077', '温情良意');
INSERT INTO `yk_author` VALUES ('1078', '月雾冥');
INSERT INTO `yk_author` VALUES ('1079', '大青菜');
INSERT INTO `yk_author` VALUES ('1080', '莫解');
INSERT INTO `yk_author` VALUES ('1081', '水色胭脂');
INSERT INTO `yk_author` VALUES ('1082', '竹月醉墨');
INSERT INTO `yk_author` VALUES ('1083', '深深深城');
INSERT INTO `yk_author` VALUES ('1084', '非我不真');
INSERT INTO `yk_author` VALUES ('1085', '桃桃凶猛');
INSERT INTO `yk_author` VALUES ('1086', 'C罗的小弟');
INSERT INTO `yk_author` VALUES ('1087', '沐倾尘');
INSERT INTO `yk_author` VALUES ('1088', '冰冰蓝');
INSERT INTO `yk_author` VALUES ('1089', '龙敏婕');
INSERT INTO `yk_author` VALUES ('1090', '七王爷');
INSERT INTO `yk_author` VALUES ('1091', '殷夏');
INSERT INTO `yk_author` VALUES ('1092', '晴天绯雪');
INSERT INTO `yk_author` VALUES ('1093', '满城飞絮');
INSERT INTO `yk_author` VALUES ('1094', '菜牙子');
INSERT INTO `yk_author` VALUES ('1095', '夜殊言言');
INSERT INTO `yk_author` VALUES ('1096', '夜盗十七梦');
INSERT INTO `yk_author` VALUES ('1097', '陈于落雁');
INSERT INTO `yk_author` VALUES ('1098', '今日云云地');
INSERT INTO `yk_author` VALUES ('1099', '炫金柠檬');
INSERT INTO `yk_author` VALUES ('1100', '卿卿小师妹');
INSERT INTO `yk_author` VALUES ('1101', '燕子沐西风');
INSERT INTO `yk_author` VALUES ('1102', '南苑本次');
INSERT INTO `yk_author` VALUES ('1103', '我叫莫言');
INSERT INTO `yk_author` VALUES ('1104', '沫之离');
INSERT INTO `yk_author` VALUES ('1105', '墨轻愁');
INSERT INTO `yk_author` VALUES ('1106', '阙无忧');
INSERT INTO `yk_author` VALUES ('1107', '冰筱');
INSERT INTO `yk_author` VALUES ('1108', '甘小德');
INSERT INTO `yk_author` VALUES ('1109', '猫小猫');
INSERT INTO `yk_author` VALUES ('1110', '谷深幽兰');
INSERT INTO `yk_author` VALUES ('1111', '润小熙');
INSERT INTO `yk_author` VALUES ('1112', '玫沐果儿');
INSERT INTO `yk_author` VALUES ('1113', '晴雪');
INSERT INTO `yk_author` VALUES ('1114', '樱魂果');
INSERT INTO `yk_author` VALUES ('1115', '唏嘘的晴空');
INSERT INTO `yk_author` VALUES ('1116', '花开未央');
INSERT INTO `yk_author` VALUES ('1117', '清夭夭');
INSERT INTO `yk_author` VALUES ('1118', '夜听烟');
INSERT INTO `yk_author` VALUES ('1119', '穆怀');
INSERT INTO `yk_author` VALUES ('1120', '苹果清清');
INSERT INTO `yk_author` VALUES ('1121', '么么爱');
INSERT INTO `yk_author` VALUES ('1122', '钟离雅婧');
INSERT INTO `yk_author` VALUES ('1123', '苏小成');
INSERT INTO `yk_author` VALUES ('1124', '宓天若');
INSERT INTO `yk_author` VALUES ('1125', '紫瞳殇');
INSERT INTO `yk_author` VALUES ('1126', '樱花赞放');
INSERT INTO `yk_author` VALUES ('1127', '舞卿妩');
INSERT INTO `yk_author` VALUES ('1128', '露花容');
INSERT INTO `yk_author` VALUES ('1129', '黎安达');
INSERT INTO `yk_author` VALUES ('1130', '默翎');
INSERT INTO `yk_author` VALUES ('1131', '七七的话');
INSERT INTO `yk_author` VALUES ('1132', '度寒离');
INSERT INTO `yk_author` VALUES ('1133', '李不如');
INSERT INTO `yk_author` VALUES ('1134', '海妖出没');
INSERT INTO `yk_author` VALUES ('1135', '唐家小宝');
INSERT INTO `yk_author` VALUES ('1136', '血染的古碑');
INSERT INTO `yk_author` VALUES ('1137', '女儿红酒');
INSERT INTO `yk_author` VALUES ('1138', '太极九圣');
INSERT INTO `yk_author` VALUES ('1139', '失然');
INSERT INTO `yk_author` VALUES ('1140', '靳逸');
INSERT INTO `yk_author` VALUES ('1141', '吃土豆的小土豆');
INSERT INTO `yk_author` VALUES ('1142', '于小简');
INSERT INTO `yk_author` VALUES ('1143', '驮驮');
INSERT INTO `yk_author` VALUES ('1144', '苏弄影');
INSERT INTO `yk_author` VALUES ('1145', '晗雪而来');
INSERT INTO `yk_author` VALUES ('1146', '浅水之夏');
INSERT INTO `yk_author` VALUES ('1147', '玉子蝴蝶');
INSERT INTO `yk_author` VALUES ('1148', '墨染成书');
INSERT INTO `yk_author` VALUES ('1149', '唯木偶');
INSERT INTO `yk_author` VALUES ('1150', '华侬');
INSERT INTO `yk_author` VALUES ('1151', '陆桥臣');
INSERT INTO `yk_author` VALUES ('1152', '梵玉');
INSERT INTO `yk_author` VALUES ('1153', '樱子S');
INSERT INTO `yk_author` VALUES ('1154', '令川狸');
INSERT INTO `yk_author` VALUES ('1155', '姜忠喆');
INSERT INTO `yk_author` VALUES ('1156', '韩大勇编著');
INSERT INTO `yk_author` VALUES ('1157', '张业松著');
INSERT INTO `yk_author` VALUES ('1158', '张天龙');
INSERT INTO `yk_author` VALUES ('1159', '张占斌,张国华');
INSERT INTO `yk_author` VALUES ('1160', '娄晶等');
INSERT INTO `yk_author` VALUES ('1161', '本书编委会');
INSERT INTO `yk_author` VALUES ('1162', '舒天、孙思忠');
INSERT INTO `yk_author` VALUES ('1163', '刘云岳');
INSERT INTO `yk_author` VALUES ('1164', '李浩白');
INSERT INTO `yk_author` VALUES ('1165', '邓友梅');
INSERT INTO `yk_author` VALUES ('1166', '刘书林著.');
INSERT INTO `yk_author` VALUES ('1167', '厉周吉');
INSERT INTO `yk_author` VALUES ('1168', '陈书凯');
INSERT INTO `yk_author` VALUES ('1169', '张程睿');
INSERT INTO `yk_author` VALUES ('1170', '刘宇');
INSERT INTO `yk_author` VALUES ('1171', '林木西曹艳秋');
INSERT INTO `yk_author` VALUES ('1172', '山本禾太郎');
INSERT INTO `yk_author` VALUES ('1173', '孙守仁');
INSERT INTO `yk_author` VALUES ('1174', '小鑫');
INSERT INTO `yk_author` VALUES ('1175', '李剑桥');
INSERT INTO `yk_author` VALUES ('1176', '芳草');
INSERT INTO `yk_author` VALUES ('1177', '张宗刚');
INSERT INTO `yk_author` VALUES ('1178', '【明】冯梦龙');
INSERT INTO `yk_author` VALUES ('1179', '（明）施耐庵');
INSERT INTO `yk_author` VALUES ('1180', '(唐)李白');
INSERT INTO `yk_author` VALUES ('1181', '【清】苏庵主人');
INSERT INTO `yk_author` VALUES ('1182', '（奥）弗洛伊德');
INSERT INTO `yk_author` VALUES ('1183', '（美）卡耐基');
INSERT INTO `yk_author` VALUES ('1184', '钱孝先');
INSERT INTO `yk_author` VALUES ('1185', '张尚国');
INSERT INTO `yk_author` VALUES ('1186', '程慧');
INSERT INTO `yk_author` VALUES ('1187', '马福存');
INSERT INTO `yk_author` VALUES ('1188', '王磊');
INSERT INTO `yk_author` VALUES ('1189', '孟庆春');
INSERT INTO `yk_author` VALUES ('1190', '向飞');
INSERT INTO `yk_author` VALUES ('1191', '于少阳');
INSERT INTO `yk_author` VALUES ('1192', '邢柏');
INSERT INTO `yk_author` VALUES ('1193', '静涛');
INSERT INTO `yk_author` VALUES ('1194', '李美丽');
INSERT INTO `yk_author` VALUES ('1195', '高英');
INSERT INTO `yk_author` VALUES ('1196', '陈一心');
INSERT INTO `yk_author` VALUES ('1197', '于欢');
INSERT INTO `yk_author` VALUES ('1198', '宋爱莉');
INSERT INTO `yk_author` VALUES ('1199', '张恒,张健');
INSERT INTO `yk_author` VALUES ('1200', '金霞');
INSERT INTO `yk_author` VALUES ('1201', '艾密尔·鲁特维克');
INSERT INTO `yk_author` VALUES ('1202', '朱艳丽');
INSERT INTO `yk_author` VALUES ('1203', '晓青，张伟其');
INSERT INTO `yk_author` VALUES ('1204', '仇若涵');
INSERT INTO `yk_author` VALUES ('1205', '李少聪');
INSERT INTO `yk_author` VALUES ('1206', '白山');
INSERT INTO `yk_author` VALUES ('1207', '容三惠');
INSERT INTO `yk_author` VALUES ('1208', '玉朵朵');
INSERT INTO `yk_author` VALUES ('1209', '瞿凯明');
INSERT INTO `yk_author` VALUES ('1210', '：于江；分册：郭爱川');
INSERT INTO `yk_author` VALUES ('1211', '甘露');
INSERT INTO `yk_author` VALUES ('1212', '赵晓霞著');
INSERT INTO `yk_author` VALUES ('1213', '王建');
INSERT INTO `yk_author` VALUES ('1214', '成绛卿');
INSERT INTO `yk_author` VALUES ('1215', '秦赟');
INSERT INTO `yk_author` VALUES ('1216', '刘小沙');
INSERT INTO `yk_author` VALUES ('1217', '许国良');
INSERT INTO `yk_author` VALUES ('1218', '曹金洪');
INSERT INTO `yk_author` VALUES ('1219', '邓贤');
INSERT INTO `yk_author` VALUES ('1220', '段雪莲');
INSERT INTO `yk_author` VALUES ('1221', '熊良钟');
INSERT INTO `yk_author` VALUES ('1222', '芮弢');
INSERT INTO `yk_author` VALUES ('1223', '曹必宏');
INSERT INTO `yk_author` VALUES ('1224', '沈志洪王海琦');
INSERT INTO `yk_author` VALUES ('1225', '谭家德，丁维钢著');
INSERT INTO `yk_author` VALUES ('1226', '李卫平');
INSERT INTO `yk_author` VALUES ('1227', '王青焕');
INSERT INTO `yk_author` VALUES ('1228', '盛安之');
INSERT INTO `yk_author` VALUES ('1229', '刘欣欣');
INSERT INTO `yk_author` VALUES ('1230', '陈芳');
INSERT INTO `yk_author` VALUES ('1231', '柯蓝');
INSERT INTO `yk_author` VALUES ('1232', '徐文');
INSERT INTO `yk_author` VALUES ('1233', '李源快');
INSERT INTO `yk_author` VALUES ('1234', '张志军');
INSERT INTO `yk_author` VALUES ('1235', '王迅');
INSERT INTO `yk_author` VALUES ('1236', '叶素贞');
INSERT INTO `yk_author` VALUES ('1237', '马靖昊');
INSERT INTO `yk_author` VALUES ('1238', '林贤治');
INSERT INTO `yk_author` VALUES ('1239', '—');
INSERT INTO `yk_author` VALUES ('1240', '马敬福');
INSERT INTO `yk_author` VALUES ('1241', '李昊');
INSERT INTO `yk_author` VALUES ('1242', '晨光, 倪宁, 编著');
INSERT INTO `yk_author` VALUES ('1243', '张晓枫');
INSERT INTO `yk_author` VALUES ('1244', '李家四爷');
INSERT INTO `yk_author` VALUES ('1245', '张永生');
INSERT INTO `yk_author` VALUES ('1246', '王志霞');
INSERT INTO `yk_author` VALUES ('1247', '紫逝水');
INSERT INTO `yk_author` VALUES ('1248', '静静的树');
INSERT INTO `yk_author` VALUES ('1249', '安奇趣记');
INSERT INTO `yk_author` VALUES ('1250', '（清）无垢道人');
INSERT INTO `yk_author` VALUES ('1251', '连翘');
INSERT INTO `yk_author` VALUES ('1252', '鱼小慧');
INSERT INTO `yk_author` VALUES ('1253', '李晓波');
INSERT INTO `yk_author` VALUES ('1254', '唐糖');
INSERT INTO `yk_author` VALUES ('1255', 'sr宝贝');
INSERT INTO `yk_author` VALUES ('1256', '我不想懂');
INSERT INTO `yk_author` VALUES ('1257', '半江');
INSERT INTO `yk_author` VALUES ('1258', '水流云在');
INSERT INTO `yk_author` VALUES ('1259', '虾米XL');
INSERT INTO `yk_author` VALUES ('1260', '王十四');
INSERT INTO `yk_author` VALUES ('1261', '千年');
INSERT INTO `yk_author` VALUES ('1262', '忆水');
INSERT INTO `yk_author` VALUES ('1263', '夜姗澜');
INSERT INTO `yk_author` VALUES ('1264', '马银春');
INSERT INTO `yk_author` VALUES ('1265', '墨小沙');
INSERT INTO `yk_author` VALUES ('1266', '严亚珍');
INSERT INTO `yk_author` VALUES ('1267', '暗香流動');
INSERT INTO `yk_author` VALUES ('1268', '上海汇都大酒店编');
INSERT INTO `yk_author` VALUES ('1269', '带玉');
INSERT INTO `yk_author` VALUES ('1270', '陨落星辰');
INSERT INTO `yk_author` VALUES ('1271', '王小蛮');
INSERT INTO `yk_author` VALUES ('1272', '新闻工作者');
INSERT INTO `yk_author` VALUES ('1273', '花刺1913');
INSERT INTO `yk_author` VALUES ('1274', '纯情犀利哥');
INSERT INTO `yk_author` VALUES ('1275', '盘古');
INSERT INTO `yk_author` VALUES ('1276', '兵痞');
INSERT INTO `yk_author` VALUES ('1277', '江水涛涛');
INSERT INTO `yk_author` VALUES ('1278', '归鹤');
INSERT INTO `yk_author` VALUES ('1279', '南方雨');
INSERT INTO `yk_author` VALUES ('1280', '倬闻慕古');
INSERT INTO `yk_author` VALUES ('1281', '北瞑太子');
INSERT INTO `yk_author` VALUES ('1282', '白沫');
INSERT INTO `yk_author` VALUES ('1283', '裸奔公鸡');
INSERT INTO `yk_author` VALUES ('1284', '甲子先生');
INSERT INTO `yk_author` VALUES ('1285', '褚屠夫');
INSERT INTO `yk_author` VALUES ('1286', '五枫');
INSERT INTO `yk_author` VALUES ('1287', '罪魂');
INSERT INTO `yk_author` VALUES ('1288', '小船不用桨');
INSERT INTO `yk_author` VALUES ('1289', '浮空岛');
INSERT INTO `yk_author` VALUES ('1290', '和风夜叶');
INSERT INTO `yk_author` VALUES ('1291', '寒烟笑');
INSERT INTO `yk_author` VALUES ('1292', '禾小谷');
INSERT INTO `yk_author` VALUES ('1293', '洪古八荒');
INSERT INTO `yk_author` VALUES ('1294', '面朝阳光');
INSERT INTO `yk_author` VALUES ('1295', '补罪');
INSERT INTO `yk_author` VALUES ('1296', '依耐');
INSERT INTO `yk_author` VALUES ('1297', '目视晴空');
INSERT INTO `yk_author` VALUES ('1298', '文劭');
INSERT INTO `yk_author` VALUES ('1299', '朱大公子');
INSERT INTO `yk_author` VALUES ('1300', '天佑烦人');
INSERT INTO `yk_author` VALUES ('1301', '南烟客');
INSERT INTO `yk_author` VALUES ('1302', '嗯哼邪少');
INSERT INTO `yk_author` VALUES ('1303', '江疤儿');
INSERT INTO `yk_author` VALUES ('1304', '思沉君');
INSERT INTO `yk_author` VALUES ('1305', '小乔流水');
INSERT INTO `yk_author` VALUES ('1306', '夜来风语');
INSERT INTO `yk_author` VALUES ('1307', '一枕梦黄粱');
INSERT INTO `yk_author` VALUES ('1308', '道破天机');
INSERT INTO `yk_author` VALUES ('1309', '崩缺的月');
INSERT INTO `yk_author` VALUES ('1310', '倔强的大笨熊');
INSERT INTO `yk_author` VALUES ('1311', '未多年');
INSERT INTO `yk_author` VALUES ('1312', '笔下春秋');
INSERT INTO `yk_author` VALUES ('1313', '中国农民');
INSERT INTO `yk_author` VALUES ('1314', '墨三瓶');
INSERT INTO `yk_author` VALUES ('1315', '嗜血部落');
INSERT INTO `yk_author` VALUES ('1316', '长春雪淞');
INSERT INTO `yk_author` VALUES ('1317', '浩然歪气');
INSERT INTO `yk_author` VALUES ('1318', '不够真实');
INSERT INTO `yk_author` VALUES ('1319', '秋沐');
INSERT INTO `yk_author` VALUES ('1320', '永恒之井');
INSERT INTO `yk_author` VALUES ('1321', '传说是大神');
INSERT INTO `yk_author` VALUES ('1322', '骚客龙');
INSERT INTO `yk_author` VALUES ('1323', '陆河');
INSERT INTO `yk_author` VALUES ('1324', '小汼牛');
INSERT INTO `yk_author` VALUES ('1325', '紫色幽静');
INSERT INTO `yk_author` VALUES ('1326', '南宫俊熙');
INSERT INTO `yk_author` VALUES ('1327', '灼忆重现');
INSERT INTO `yk_author` VALUES ('1328', '颜小渊');
INSERT INTO `yk_author` VALUES ('1329', '我是一棵蒜');
INSERT INTO `yk_author` VALUES ('1330', '禾西风');
INSERT INTO `yk_author` VALUES ('1331', '竹花落');
INSERT INTO `yk_author` VALUES ('1332', '花椒');
INSERT INTO `yk_author` VALUES ('1333', '小小流浪狗');
INSERT INTO `yk_author` VALUES ('1334', '雨寒宝贝');
INSERT INTO `yk_author` VALUES ('1335', '彼岸般若');
INSERT INTO `yk_author` VALUES ('1336', '午夜独觅奈何桥');
INSERT INTO `yk_author` VALUES ('1337', '曹操3177');
INSERT INTO `yk_author` VALUES ('1338', '张羽');
INSERT INTO `yk_author` VALUES ('1339', '逗姐');
INSERT INTO `yk_author` VALUES ('1340', '初挽挽');
INSERT INTO `yk_author` VALUES ('1341', '小生阿宅');
INSERT INTO `yk_author` VALUES ('1342', '凉月染柒');
INSERT INTO `yk_author` VALUES ('1343', '苏潇湘');
INSERT INTO `yk_author` VALUES ('1344', '弹剑踏雪歌');
INSERT INTO `yk_author` VALUES ('1345', '黄达苍');
INSERT INTO `yk_author` VALUES ('1346', '南师红树');
INSERT INTO `yk_author` VALUES ('1347', '逆火蜘蛛');
INSERT INTO `yk_author` VALUES ('1348', '尘扬华夏');
INSERT INTO `yk_author` VALUES ('1349', '生命不能承受之菜');
INSERT INTO `yk_author` VALUES ('1350', '碧海苍云');
INSERT INTO `yk_author` VALUES ('1351', '林语风吟');
INSERT INTO `yk_author` VALUES ('1352', '口耐的夭夭');
INSERT INTO `yk_author` VALUES ('1353', '默筱影');
INSERT INTO `yk_author` VALUES ('1354', '伍仁月饼');
INSERT INTO `yk_author` VALUES ('1355', '仙域灵药');
INSERT INTO `yk_author` VALUES ('1356', '赵建康');
INSERT INTO `yk_author` VALUES ('1357', '羽人无面');
INSERT INTO `yk_author` VALUES ('1358', '关嘲');
INSERT INTO `yk_author` VALUES ('1359', '小蛊君');
INSERT INTO `yk_author` VALUES ('1360', '心中的云');
INSERT INTO `yk_author` VALUES ('1361', '颜赤');
INSERT INTO `yk_author` VALUES ('1362', '凰女');
INSERT INTO `yk_author` VALUES ('1363', '墨舞成风');
INSERT INTO `yk_author` VALUES ('1364', '紫龙之王');
INSERT INTO `yk_author` VALUES ('1365', '老二家的虱子');
INSERT INTO `yk_author` VALUES ('1366', '枫峦');
INSERT INTO `yk_author` VALUES ('1367', '米小北');
INSERT INTO `yk_author` VALUES ('1368', '笑洛书');
INSERT INTO `yk_author` VALUES ('1369', '鸿飞秋月');
INSERT INTO `yk_author` VALUES ('1370', '陆离ying');
INSERT INTO `yk_author` VALUES ('1371', '鲁金鑫');
INSERT INTO `yk_author` VALUES ('1372', '赵周桥');
INSERT INTO `yk_author` VALUES ('1373', '霍尔古勒');
INSERT INTO `yk_author` VALUES ('1374', '激水中流');
INSERT INTO `yk_author` VALUES ('1375', '神沫泠');
INSERT INTO `yk_author` VALUES ('1376', '蓝色褶皱');
INSERT INTO `yk_author` VALUES ('1377', '落花归梦');
INSERT INTO `yk_author` VALUES ('1378', '孜依');
INSERT INTO `yk_author` VALUES ('1379', '叶轻愁');
INSERT INTO `yk_author` VALUES ('1380', '上官媛音');
INSERT INTO `yk_author` VALUES ('1381', '十个书签');
INSERT INTO `yk_author` VALUES ('1382', '何珈蓝');
INSERT INTO `yk_author` VALUES ('1383', '隅等时');
INSERT INTO `yk_author` VALUES ('1384', '绿兮子');
INSERT INTO `yk_author` VALUES ('1385', '颜夕影月');
INSERT INTO `yk_author` VALUES ('1386', '美咲');
INSERT INTO `yk_author` VALUES ('1387', '曾诸');
INSERT INTO `yk_author` VALUES ('1388', '商玖玖');
INSERT INTO `yk_author` VALUES ('1389', '包二小姐');
INSERT INTO `yk_author` VALUES ('1390', '流心海棠');
INSERT INTO `yk_author` VALUES ('1391', '薄野扶苏');
INSERT INTO `yk_author` VALUES ('1392', '岳布裙');
INSERT INTO `yk_author` VALUES ('1393', '上邪鱼骨');
INSERT INTO `yk_author` VALUES ('1394', '君彤');
INSERT INTO `yk_author` VALUES ('1395', '夕句');
INSERT INTO `yk_author` VALUES ('1396', '茶染流年');
INSERT INTO `yk_author` VALUES ('1397', '余雨霏霏');
INSERT INTO `yk_author` VALUES ('1398', '绝色夭夭');
INSERT INTO `yk_author` VALUES ('1399', '秋小通');
INSERT INTO `yk_author` VALUES ('1400', '晓月木兰');
INSERT INTO `yk_author` VALUES ('1401', '幽韵笛');
INSERT INTO `yk_author` VALUES ('1402', '後天');
INSERT INTO `yk_author` VALUES ('1403', '曹家阿瞒');
INSERT INTO `yk_author` VALUES ('1404', '桃夭mf');
INSERT INTO `yk_author` VALUES ('1405', '栎堇心');
INSERT INTO `yk_author` VALUES ('1406', '匡小妖');
INSERT INTO `yk_author` VALUES ('1407', '许微泫');
INSERT INTO `yk_author` VALUES ('1408', '悠悠紫荷');
INSERT INTO `yk_author` VALUES ('1409', '如意结');
INSERT INTO `yk_author` VALUES ('1410', '拾花阶前');
INSERT INTO `yk_author` VALUES ('1411', '青城漫雪');
INSERT INTO `yk_author` VALUES ('1412', '喵喵十三妖');
INSERT INTO `yk_author` VALUES ('1413', '晓品');
INSERT INTO `yk_author` VALUES ('1414', '淡然心定');
INSERT INTO `yk_author` VALUES ('1415', '月夜桥下闻水声');
INSERT INTO `yk_author` VALUES ('1416', '镜空司');
INSERT INTO `yk_author` VALUES ('1417', '七月笙');
INSERT INTO `yk_author` VALUES ('1418', '春青');
INSERT INTO `yk_author` VALUES ('1419', '杨志刚');
INSERT INTO `yk_author` VALUES ('1420', '倾城宁');
INSERT INTO `yk_author` VALUES ('1421', '吴语嫣');
INSERT INTO `yk_author` VALUES ('1422', '橡木船');
INSERT INTO `yk_author` VALUES ('1423', '甄斯文');
INSERT INTO `yk_author` VALUES ('1424', '王莫1995');
INSERT INTO `yk_author` VALUES ('1425', '诺言');
INSERT INTO `yk_author` VALUES ('1426', '满城烟火');
INSERT INTO `yk_author` VALUES ('1427', '刺猬阿姨');
INSERT INTO `yk_author` VALUES ('1428', '三叶草');
INSERT INTO `yk_author` VALUES ('1429', '大火得瑟');
INSERT INTO `yk_author` VALUES ('1430', '烟月笼沙');
INSERT INTO `yk_author` VALUES ('1431', '漂流喵');
INSERT INTO `yk_author` VALUES ('1432', '南珠');
INSERT INTO `yk_author` VALUES ('1433', '菜芽儿');
INSERT INTO `yk_author` VALUES ('1434', '昨忆');
INSERT INTO `yk_author` VALUES ('1435', '南城笙烟');
INSERT INTO `yk_author` VALUES ('1436', '爱的狂想曲');
INSERT INTO `yk_author` VALUES ('1437', '真米粒');
INSERT INTO `yk_author` VALUES ('1438', '钒卿');
INSERT INTO `yk_author` VALUES ('1439', '岚汐徵冥');
INSERT INTO `yk_author` VALUES ('1440', '浪子阿三');
INSERT INTO `yk_author` VALUES ('1441', '尺寒');
INSERT INTO `yk_author` VALUES ('1442', '吟绝尘');
INSERT INTO `yk_author` VALUES ('1443', '叶狼');
INSERT INTO `yk_author` VALUES ('1444', '波光迷离');
INSERT INTO `yk_author` VALUES ('1445', '樱桃.');
INSERT INTO `yk_author` VALUES ('1446', '烛花摇影');
INSERT INTO `yk_author` VALUES ('1447', '月舞烟霞');
INSERT INTO `yk_author` VALUES ('1448', '朱笔点绛唇');
INSERT INTO `yk_author` VALUES ('1449', '马逸云');
INSERT INTO `yk_author` VALUES ('1450', '准拟佳期');
INSERT INTO `yk_author` VALUES ('1451', '刘德环');
INSERT INTO `yk_author` VALUES ('1452', '郑一群编著');
INSERT INTO `yk_author` VALUES ('1453', '张坤');
INSERT INTO `yk_author` VALUES ('1454', '杜甫');
INSERT INTO `yk_author` VALUES ('1455', '郝立军编著');
INSERT INTO `yk_author` VALUES ('1456', '朱昱');
INSERT INTO `yk_author` VALUES ('1457', '姚常晓');
INSERT INTO `yk_author` VALUES ('1458', '【汉】陆贾');
INSERT INTO `yk_author` VALUES ('1459', '丁海红');
INSERT INTO `yk_author` VALUES ('1460', '张桂荣');
INSERT INTO `yk_author` VALUES ('1461', '羽西');
INSERT INTO `yk_author` VALUES ('1462', '冯文远');
INSERT INTO `yk_author` VALUES ('1463', '李富华');
INSERT INTO `yk_author` VALUES ('1464', '杏花白');
INSERT INTO `yk_author` VALUES ('1465', '滕征辉');
INSERT INTO `yk_author` VALUES ('1466', '安吉勇');
INSERT INTO `yk_author` VALUES ('1467', '穆迦');
INSERT INTO `yk_author` VALUES ('1468', '罗瑜权');
INSERT INTO `yk_author` VALUES ('1469', '周梅森');
INSERT INTO `yk_author` VALUES ('1470', '微笑着流泪的鱼');
INSERT INTO `yk_author` VALUES ('1471', '关仁山');
INSERT INTO `yk_author` VALUES ('1472', '鲍尔吉？原野');
INSERT INTO `yk_author` VALUES ('1473', '黄雯');
INSERT INTO `yk_author` VALUES ('1474', '（日）夏目漱石');
INSERT INTO `yk_author` VALUES ('1475', '（日）新渡户稻造');
INSERT INTO `yk_author` VALUES ('1476', '【春秋】孔子、【战国】孟轲');
INSERT INTO `yk_author` VALUES ('1477', '(美)希区柯克著');
INSERT INTO `yk_author` VALUES ('1478', '【清】刘璋');
INSERT INTO `yk_author` VALUES ('1479', '陈亮');
INSERT INTO `yk_author` VALUES ('1480', '陈小立');
INSERT INTO `yk_author` VALUES ('1481', '杜康');
INSERT INTO `yk_author` VALUES ('1482', '元秀');
INSERT INTO `yk_author` VALUES ('1483', '大萌子');
INSERT INTO `yk_author` VALUES ('1484', '孙郡锴');
INSERT INTO `yk_author` VALUES ('1485', '求医问药杂志编辑部');
INSERT INTO `yk_author` VALUES ('1486', '林正顺');
INSERT INTO `yk_author` VALUES ('1487', '文博');
INSERT INTO `yk_author` VALUES ('1488', '戴卫');
INSERT INTO `yk_author` VALUES ('1489', '方海');
INSERT INTO `yk_author` VALUES ('1490', '顾嘉');
INSERT INTO `yk_author` VALUES ('1491', '李慕南,姜忠喆');
INSERT INTO `yk_author` VALUES ('1492', '叶舟');
INSERT INTO `yk_author` VALUES ('1493', '李少林');
INSERT INTO `yk_author` VALUES ('1494', '马银春编著');
INSERT INTO `yk_author` VALUES ('1495', '崔林');
INSERT INTO `yk_author` VALUES ('1496', '罗玉荣');
INSERT INTO `yk_author` VALUES ('1497', '孟庆轩，陈国珍');
INSERT INTO `yk_author` VALUES ('1498', '刘艳');
INSERT INTO `yk_author` VALUES ('1499', '张敏');
INSERT INTO `yk_author` VALUES ('1500', '朱武红');
INSERT INTO `yk_author` VALUES ('1501', '柳明');
INSERT INTO `yk_author` VALUES ('1502', '汪耀明选解');
INSERT INTO `yk_author` VALUES ('1503', '方士娟');
INSERT INTO `yk_author` VALUES ('1504', '重庆后勤工程学院著');
INSERT INTO `yk_author` VALUES ('1505', '华春');
INSERT INTO `yk_author` VALUES ('1506', '高小贤，谢丽华');
INSERT INTO `yk_author` VALUES ('1507', '于永玉 吴亚玲');
INSERT INTO `yk_author` VALUES ('1508', '唐晓辉');
INSERT INTO `yk_author` VALUES ('1509', '李兵');
INSERT INTO `yk_author` VALUES ('1510', '汪佩伟');
INSERT INTO `yk_author` VALUES ('1511', '纸上魔方编著');
INSERT INTO `yk_author` VALUES ('1512', '葛伟');
INSERT INTO `yk_author` VALUES ('1513', '刘力');
INSERT INTO `yk_author` VALUES ('1514', '薛引娥');
INSERT INTO `yk_author` VALUES ('1515', '若木');
INSERT INTO `yk_author` VALUES ('1516', '蔡琳杉');
INSERT INTO `yk_author` VALUES ('1517', '罗鲜英主编');
INSERT INTO `yk_author` VALUES ('1518', '李平');
INSERT INTO `yk_author` VALUES ('1519', '李大伟');
INSERT INTO `yk_author` VALUES ('1520', '宗欣');
INSERT INTO `yk_author` VALUES ('1521', '贾振明');
INSERT INTO `yk_author` VALUES ('1522', '光玉');
INSERT INTO `yk_author` VALUES ('1523', '郭漫');
INSERT INTO `yk_author` VALUES ('1524', '王连河');
INSERT INTO `yk_author` VALUES ('1525', '重汐');
INSERT INTO `yk_author` VALUES ('1526', '魏辉霞编著');
INSERT INTO `yk_author` VALUES ('1527', '飞奔的红领巾');
INSERT INTO `yk_author` VALUES ('1528', '罗学蓬');
INSERT INTO `yk_author` VALUES ('1529', '木子宛静');
INSERT INTO `yk_author` VALUES ('1530', '竭宝峰刘心莲邢春如李穆南');
INSERT INTO `yk_author` VALUES ('1531', '郭醇，王鸿鹏');
INSERT INTO `yk_author` VALUES ('1532', '玫瑰喵');
INSERT INTO `yk_author` VALUES ('1533', '枯叶妖娆');
INSERT INTO `yk_author` VALUES ('1534', '孤雨随风');
INSERT INTO `yk_author` VALUES ('1535', '骁骑校');
INSERT INTO `yk_author` VALUES ('1536', '朱明侠');
INSERT INTO `yk_author` VALUES ('1537', '张芷言');
INSERT INTO `yk_author` VALUES ('1538', '余秋雨');
INSERT INTO `yk_author` VALUES ('1539', '婷婷仙后');
INSERT INTO `yk_author` VALUES ('1540', '微风中摇曳');
INSERT INTO `yk_author` VALUES ('1541', '一般不发言');
INSERT INTO `yk_author` VALUES ('1542', '左手');
INSERT INTO `yk_author` VALUES ('1543', '过路人与稻草人');
INSERT INTO `yk_author` VALUES ('1544', '反王');
INSERT INTO `yk_author` VALUES ('1545', '苏锦儿');
INSERT INTO `yk_author` VALUES ('1546', '金波');
INSERT INTO `yk_author` VALUES ('1547', '彭绪洛');
INSERT INTO `yk_author` VALUES ('1548', '杨武能');
INSERT INTO `yk_author` VALUES ('1549', '常小琥');
INSERT INTO `yk_author` VALUES ('1550', '新创客工作室');
INSERT INTO `yk_author` VALUES ('1551', '林海鸥');
INSERT INTO `yk_author` VALUES ('1552', '金朵儿');
INSERT INTO `yk_author` VALUES ('1553', '伍美珍');
INSERT INTO `yk_author` VALUES ('1554', '王晨百');
INSERT INTO `yk_author` VALUES ('1555', '佛座听风');
INSERT INTO `yk_author` VALUES ('1556', '宁静的阿奇');
INSERT INTO `yk_author` VALUES ('1557', '我到河北省来');
INSERT INTO `yk_author` VALUES ('1558', '天下风语');
INSERT INTO `yk_author` VALUES ('1559', '倔强D牛虻');
INSERT INTO `yk_author` VALUES ('1560', '叶星尊');
INSERT INTO `yk_author` VALUES ('1561', '流浪的猪');
INSERT INTO `yk_author` VALUES ('1562', '冷月无殇');
INSERT INTO `yk_author` VALUES ('1563', '烟叶神');
INSERT INTO `yk_author` VALUES ('1564', '有缘人');
INSERT INTO `yk_author` VALUES ('1565', '花生爱毛豆');
INSERT INTO `yk_author` VALUES ('1566', '酱油王子');
INSERT INTO `yk_author` VALUES ('1567', '墨绿青苔');
INSERT INTO `yk_author` VALUES ('1568', '南山树下');
INSERT INTO `yk_author` VALUES ('1569', '陈年墨水');
INSERT INTO `yk_author` VALUES ('1570', '刀枪剑戟');
INSERT INTO `yk_author` VALUES ('1571', '无名墨刃');
INSERT INTO `yk_author` VALUES ('1572', '天马洪波');
INSERT INTO `yk_author` VALUES ('1573', '佛之战国');
INSERT INTO `yk_author` VALUES ('1574', '冷凯');
INSERT INTO `yk_author` VALUES ('1575', '问风听海');
INSERT INTO `yk_author` VALUES ('1576', '俏如来');
INSERT INTO `yk_author` VALUES ('1577', '未变');
INSERT INTO `yk_author` VALUES ('1578', '远午');
INSERT INTO `yk_author` VALUES ('1579', '狂圣');
INSERT INTO `yk_author` VALUES ('1580', '伪大叔');
INSERT INTO `yk_author` VALUES ('1581', '莫问天涯');
INSERT INTO `yk_author` VALUES ('1582', '九步云端');
INSERT INTO `yk_author` VALUES ('1583', '南渡');
INSERT INTO `yk_author` VALUES ('1584', '番茄二代');
INSERT INTO `yk_author` VALUES ('1585', '五家村');
INSERT INTO `yk_author` VALUES ('1586', '书海扬帆');
INSERT INTO `yk_author` VALUES ('1587', '君临九霄');
INSERT INTO `yk_author` VALUES ('1588', '小迷糊');
INSERT INTO `yk_author` VALUES ('1589', '乡下小道');
INSERT INTO `yk_author` VALUES ('1590', '龙之将皇');
INSERT INTO `yk_author` VALUES ('1591', '夜月疾风');
INSERT INTO `yk_author` VALUES ('1592', '跳动的血管');
INSERT INTO `yk_author` VALUES ('1593', '红心大盗');
INSERT INTO `yk_author` VALUES ('1594', '墨墨无文');
INSERT INTO `yk_author` VALUES ('1595', '雨寒星');
INSERT INTO `yk_author` VALUES ('1596', '古云LF');
INSERT INTO `yk_author` VALUES ('1597', '篓中鱼');
INSERT INTO `yk_author` VALUES ('1598', '清岩叟');
INSERT INTO `yk_author` VALUES ('1599', '色蛮');
INSERT INTO `yk_author` VALUES ('1600', '仙门之人');
INSERT INTO `yk_author` VALUES ('1601', '快乐的米虫');
INSERT INTO `yk_author` VALUES ('1602', '魔界子轩');
INSERT INTO `yk_author` VALUES ('1603', '碗豆尖');
INSERT INTO `yk_author` VALUES ('1604', '楚天一阁');
INSERT INTO `yk_author` VALUES ('1605', '万事如粪土');
INSERT INTO `yk_author` VALUES ('1606', '绝对爱你');
INSERT INTO `yk_author` VALUES ('1607', '剑亦有道');
INSERT INTO `yk_author` VALUES ('1608', '夜雨微歇');
INSERT INTO `yk_author` VALUES ('1609', '哝情');
INSERT INTO `yk_author` VALUES ('1610', '冷眼望天');
INSERT INTO `yk_author` VALUES ('1611', '和晨');
INSERT INTO `yk_author` VALUES ('1612', '西冥长惑');
INSERT INTO `yk_author` VALUES ('1613', '晴梦');
INSERT INTO `yk_author` VALUES ('1614', '徐离桓瑾');
INSERT INTO `yk_author` VALUES ('1615', '太子姑娘');
INSERT INTO `yk_author` VALUES ('1616', '三纸无驴');
INSERT INTO `yk_author` VALUES ('1617', '温暖的冬天');
INSERT INTO `yk_author` VALUES ('1618', '百家无姓');
INSERT INTO `yk_author` VALUES ('1619', '唐笑雨');
INSERT INTO `yk_author` VALUES ('1620', '星落羽');
INSERT INTO `yk_author` VALUES ('1621', '卧龙青枫');
INSERT INTO `yk_author` VALUES ('1622', '疯子医生');
INSERT INTO `yk_author` VALUES ('1623', '索姆拉');
INSERT INTO `yk_author` VALUES ('1624', '喃喃的歌声');
INSERT INTO `yk_author` VALUES ('1625', '善之初');
INSERT INTO `yk_author` VALUES ('1626', '忆流星');
INSERT INTO `yk_author` VALUES ('1627', '豢天氏');
INSERT INTO `yk_author` VALUES ('1628', '这个夏天有点热');
INSERT INTO `yk_author` VALUES ('1629', '幻琴');
INSERT INTO `yk_author` VALUES ('1630', '呆萌阿双');
INSERT INTO `yk_author` VALUES ('1631', '郁闷的清泉');
INSERT INTO `yk_author` VALUES ('1632', '疯狂的蚂蚁');
INSERT INTO `yk_author` VALUES ('1633', '秋舞弄殇');
INSERT INTO `yk_author` VALUES ('1634', '羽月镰刀');
INSERT INTO `yk_author` VALUES ('1635', '弥诺');
INSERT INTO `yk_author` VALUES ('1636', '失墨雁');
INSERT INTO `yk_author` VALUES ('1637', '逃兵有梦');
INSERT INTO `yk_author` VALUES ('1638', '黑单纯');
INSERT INTO `yk_author` VALUES ('1639', '枫叶恋秋落');
INSERT INTO `yk_author` VALUES ('1640', '朽木成文');
INSERT INTO `yk_author` VALUES ('1641', '云上');
INSERT INTO `yk_author` VALUES ('1642', '巅峰麻雀');
INSERT INTO `yk_author` VALUES ('1643', '安小希');
INSERT INTO `yk_author` VALUES ('1644', '潇风羽');
INSERT INTO `yk_author` VALUES ('1645', '群临天下');
INSERT INTO `yk_author` VALUES ('1646', '月夜撕心');
INSERT INTO `yk_author` VALUES ('1647', '仁爱还是人二');
INSERT INTO `yk_author` VALUES ('1648', '释言');
INSERT INTO `yk_author` VALUES ('1649', '小飞鼠');
INSERT INTO `yk_author` VALUES ('1650', '三橘');
INSERT INTO `yk_author` VALUES ('1651', '烟兮');
INSERT INTO `yk_author` VALUES ('1652', '江山雪音');
INSERT INTO `yk_author` VALUES ('1653', '月花馨雪');
INSERT INTO `yk_author` VALUES ('1654', '汪神');
INSERT INTO `yk_author` VALUES ('1655', '凤汐');
INSERT INTO `yk_author` VALUES ('1656', '西兮luna');
INSERT INTO `yk_author` VALUES ('1657', '永久');
INSERT INTO `yk_author` VALUES ('1658', '言星');
INSERT INTO `yk_author` VALUES ('1659', '扶汐');
INSERT INTO `yk_author` VALUES ('1660', '天际驱驰');
INSERT INTO `yk_author` VALUES ('1661', '箐竹');
INSERT INTO `yk_author` VALUES ('1662', '假寐的小草');
INSERT INTO `yk_author` VALUES ('1663', '落宸无邪');
INSERT INTO `yk_author` VALUES ('1664', '北方有石');
INSERT INTO `yk_author` VALUES ('1665', '拥青');
INSERT INTO `yk_author` VALUES ('1666', '聪心');
INSERT INTO `yk_author` VALUES ('1667', '臣不知');
INSERT INTO `yk_author` VALUES ('1668', '张湘子');
INSERT INTO `yk_author` VALUES ('1669', '七月w');
INSERT INTO `yk_author` VALUES ('1670', '糊涂攻');
INSERT INTO `yk_author` VALUES ('1671', '秦酒荟');
INSERT INTO `yk_author` VALUES ('1672', '江南听雨');
INSERT INTO `yk_author` VALUES ('1673', '沐浅琉璃');
INSERT INTO `yk_author` VALUES ('1674', '端木诺晴');
INSERT INTO `yk_author` VALUES ('1675', '雨后的云');
INSERT INTO `yk_author` VALUES ('1676', '叶臻');
INSERT INTO `yk_author` VALUES ('1677', '凌尘');
INSERT INTO `yk_author` VALUES ('1678', '观以目');
INSERT INTO `yk_author` VALUES ('1679', '苍耳');
INSERT INTO `yk_author` VALUES ('1680', '九重落墨');
INSERT INTO `yk_author` VALUES ('1681', '易唲');
INSERT INTO `yk_author` VALUES ('1682', '秦青词');
INSERT INTO `yk_author` VALUES ('1683', '那年花開');
INSERT INTO `yk_author` VALUES ('1684', '优昙钵华');
INSERT INTO `yk_author` VALUES ('1685', '鱼佬');
INSERT INTO `yk_author` VALUES ('1686', '伍艾卿');
INSERT INTO `yk_author` VALUES ('1687', '清秋新月');
INSERT INTO `yk_author` VALUES ('1688', '白雨燕');
INSERT INTO `yk_author` VALUES ('1689', '艾江');
INSERT INTO `yk_author` VALUES ('1690', '夜靖');
INSERT INTO `yk_author` VALUES ('1691', '千年枫雅');
INSERT INTO `yk_author` VALUES ('1692', '沈苏小');
INSERT INTO `yk_author` VALUES ('1693', '木阳');
INSERT INTO `yk_author` VALUES ('1694', '不止不知');
INSERT INTO `yk_author` VALUES ('1695', '雷婷儿');
INSERT INTO `yk_author` VALUES ('1696', '秤子木');
INSERT INTO `yk_author` VALUES ('1697', '牛肉丸子521');
INSERT INTO `yk_author` VALUES ('1698', '冷嫣然');
INSERT INTO `yk_author` VALUES ('1699', '雪梨冰糖');
INSERT INTO `yk_author` VALUES ('1700', '初五');
INSERT INTO `yk_author` VALUES ('1701', '花檐瞧雨');
INSERT INTO `yk_author` VALUES ('1702', '默夕');
INSERT INTO `yk_author` VALUES ('1703', '丝顾');
INSERT INTO `yk_author` VALUES ('1704', '狼家小妖');
INSERT INTO `yk_author` VALUES ('1705', '海绵暴暴');
INSERT INTO `yk_author` VALUES ('1706', '指尖的殇');
INSERT INTO `yk_author` VALUES ('1707', '小叶风桥');
INSERT INTO `yk_author` VALUES ('1708', 'l蓝逸影');
INSERT INTO `yk_author` VALUES ('1709', '澺澜潸');
INSERT INTO `yk_author` VALUES ('1710', '蓝诗诗');
INSERT INTO `yk_author` VALUES ('1711', '苏未');
INSERT INTO `yk_author` VALUES ('1712', '以花倾城');
INSERT INTO `yk_author` VALUES ('1713', '咕咪');
INSERT INTO `yk_author` VALUES ('1714', '沫失莫忘');
INSERT INTO `yk_author` VALUES ('1715', '墨世繁华');
INSERT INTO `yk_author` VALUES ('1716', '卜老十');
INSERT INTO `yk_author` VALUES ('1717', '安亦雪');
INSERT INTO `yk_author` VALUES ('1718', '无心轮回');
INSERT INTO `yk_author` VALUES ('1719', '千岁千岁');
INSERT INTO `yk_author` VALUES ('1720', '索彦');
INSERT INTO `yk_author` VALUES ('1721', '谢正斌');
INSERT INTO `yk_author` VALUES ('1722', '李昊编著');
INSERT INTO `yk_author` VALUES ('1723', '新农村建设青年文库编写组');
INSERT INTO `yk_author` VALUES ('1724', '代斌');
INSERT INTO `yk_author` VALUES ('1725', '宋钊');
INSERT INTO `yk_author` VALUES ('1726', '孙颢');
INSERT INTO `yk_author` VALUES ('1727', '铁嘴');
INSERT INTO `yk_author` VALUES ('1728', '马一');
INSERT INTO `yk_author` VALUES ('1729', '何马');
INSERT INTO `yk_author` VALUES ('1730', '任宪宝编著');
INSERT INTO `yk_author` VALUES ('1731', '(西汉)司马迁');
INSERT INTO `yk_author` VALUES ('1732', '徐少杰');
INSERT INTO `yk_author` VALUES ('1733', '何珈钰琪');
INSERT INTO `yk_author` VALUES ('1734', '邱海龙');
INSERT INTO `yk_author` VALUES ('1735', '宋璐璐');
INSERT INTO `yk_author` VALUES ('1736', '皮皮熊');
INSERT INTO `yk_author` VALUES ('1737', '彼得·舒伯茨');
INSERT INTO `yk_author` VALUES ('1738', '陈玉洁编著');
INSERT INTO `yk_author` VALUES ('1739', '郭万新');
INSERT INTO `yk_author` VALUES ('1740', '(俄罗斯)屠格涅夫');
INSERT INTO `yk_author` VALUES ('1741', '诸圣邻');
INSERT INTO `yk_author` VALUES ('1742', '李树清');
INSERT INTO `yk_author` VALUES ('1743', '勒布朗');
INSERT INTO `yk_author` VALUES ('1744', '(魏)王肃注,张广明');
INSERT INTO `yk_author` VALUES ('1745', '袁堂欣，谢志强');
INSERT INTO `yk_author` VALUES ('1746', '【宋】欧阳修');
INSERT INTO `yk_author` VALUES ('1747', '（宋）刘过');
INSERT INTO `yk_author` VALUES ('1748', '王晖');
INSERT INTO `yk_author` VALUES ('1749', '读书堂');
INSERT INTO `yk_author` VALUES ('1750', '苏易');
INSERT INTO `yk_author` VALUES ('1751', '傅雷');
INSERT INTO `yk_author` VALUES ('1752', '黄蔚');
INSERT INTO `yk_author` VALUES ('1753', '修平');
INSERT INTO `yk_author` VALUES ('1754', '李琮');
INSERT INTO `yk_author` VALUES ('1755', '吕晓斌');
INSERT INTO `yk_author` VALUES ('1756', '叶萱');
INSERT INTO `yk_author` VALUES ('1757', '赵玥编著');
INSERT INTO `yk_author` VALUES ('1758', '熊经浴');
INSERT INTO `yk_author` VALUES ('1759', '文婕');
INSERT INTO `yk_author` VALUES ('1760', '徐捷');
INSERT INTO `yk_author` VALUES ('1761', '：王象礼；策划：政协太原市尖草坪区委员会');
INSERT INTO `yk_author` VALUES ('1762', '罗永艾');
INSERT INTO `yk_author` VALUES ('1763', '黄福祥编著');
INSERT INTO `yk_author` VALUES ('1764', '冯志远、蔡莹');
INSERT INTO `yk_author` VALUES ('1765', '石晓娜');
INSERT INTO `yk_author` VALUES ('1766', '程超泽');
INSERT INTO `yk_author` VALUES ('1767', '林杰');
INSERT INTO `yk_author` VALUES ('1768', '长歌');
INSERT INTO `yk_author` VALUES ('1769', '王志刚');
INSERT INTO `yk_author` VALUES ('1770', '廖瑶瑶,李猛');
INSERT INTO `yk_author` VALUES ('1771', '王广群顾令阳');
INSERT INTO `yk_author` VALUES ('1772', '林自勇');
INSERT INTO `yk_author` VALUES ('1773', '阿尔伯特·哈伯德 著；宋天天 译');
INSERT INTO `yk_author` VALUES ('1774', '海波');
INSERT INTO `yk_author` VALUES ('1775', '编委会');
INSERT INTO `yk_author` VALUES ('1776', '韩雪');
INSERT INTO `yk_author` VALUES ('1777', '张艳玲编译');
INSERT INTO `yk_author` VALUES ('1778', '成晓军');
INSERT INTO `yk_author` VALUES ('1779', '黄志坚\n欧阳高波');
INSERT INTO `yk_author` VALUES ('1780', '笔锋');
INSERT INTO `yk_author` VALUES ('1781', '贺维芳');
INSERT INTO `yk_author` VALUES ('1782', '张亚新');
INSERT INTO `yk_author` VALUES ('1783', '柳书琴');
INSERT INTO `yk_author` VALUES ('1784', '弗兰德');
INSERT INTO `yk_author` VALUES ('1785', '李沐阳');
INSERT INTO `yk_author` VALUES ('1786', '俞祖华，俞梦晨');
INSERT INTO `yk_author` VALUES ('1787', '十四十四');
INSERT INTO `yk_author` VALUES ('1788', '姬流氓');
INSERT INTO `yk_author` VALUES ('1789', '怜蛾不点灯');
INSERT INTO `yk_author` VALUES ('1790', '金诚');
INSERT INTO `yk_author` VALUES ('1791', '刘利生');
INSERT INTO `yk_author` VALUES ('1792', '(美)朱为众');
INSERT INTO `yk_author` VALUES ('1793', '暮日流年');
INSERT INTO `yk_author` VALUES ('1794', '轻眠浅梦');
INSERT INTO `yk_author` VALUES ('1795', '冰帝');
INSERT INTO `yk_author` VALUES ('1796', '叼猫的鱼');
INSERT INTO `yk_author` VALUES ('1797', '五杀筱哥');
INSERT INTO `yk_author` VALUES ('1798', '百年幽篁');
INSERT INTO `yk_author` VALUES ('1799', '墨玉泉');
INSERT INTO `yk_author` VALUES ('1800', '太史寒');
INSERT INTO `yk_author` VALUES ('1801', '求无欲');
INSERT INTO `yk_author` VALUES ('1802', '随缘·珍重');
INSERT INTO `yk_author` VALUES ('1803', '荒原独狼');
INSERT INTO `yk_author` VALUES ('1804', '过街鼠');
INSERT INTO `yk_author` VALUES ('1805', '公羊无双');
INSERT INTO `yk_author` VALUES ('1806', '冬虫儿');
INSERT INTO `yk_author` VALUES ('1807', '娶猫的老鼠');
INSERT INTO `yk_author` VALUES ('1808', '顾漫');
INSERT INTO `yk_author` VALUES ('1809', '（加）孔谧');
INSERT INTO `yk_author` VALUES ('1810', '左小词');
INSERT INTO `yk_author` VALUES ('1811', '袁和平');
INSERT INTO `yk_author` VALUES ('1812', '胡元斌');
INSERT INTO `yk_author` VALUES ('1813', '冯化平');
INSERT INTO `yk_author` VALUES ('1814', '美V.M.希利尔（Virgil,Mores,Hillyer）丁敏翔,编译');
INSERT INTO `yk_author` VALUES ('1815', '凌乱的小道');
INSERT INTO `yk_author` VALUES ('1816', '梦系神羽');
INSERT INTO `yk_author` VALUES ('1817', '谜言');
INSERT INTO `yk_author` VALUES ('1818', '绵羊雅');
INSERT INTO `yk_author` VALUES ('1819', '心净');
INSERT INTO `yk_author` VALUES ('1820', '朦胧的殇');
INSERT INTO `yk_author` VALUES ('1821', '丹奏');
INSERT INTO `yk_author` VALUES ('1822', '青楼黑客');
INSERT INTO `yk_author` VALUES ('1823', '我是小飞侠');
INSERT INTO `yk_author` VALUES ('1824', '你确定要走');
INSERT INTO `yk_author` VALUES ('1825', '潮吧先生');
INSERT INTO `yk_author` VALUES ('1826', '仲浦');
INSERT INTO `yk_author` VALUES ('1827', '优雅的窝瓜');
INSERT INTO `yk_author` VALUES ('1828', 'Hemingways');
INSERT INTO `yk_author` VALUES ('1829', '唐果');
INSERT INTO `yk_author` VALUES ('1830', '将军猫');
INSERT INTO `yk_author` VALUES ('1831', '萧忆情');
INSERT INTO `yk_author` VALUES ('1832', '紫色辰光');
INSERT INTO `yk_author` VALUES ('1833', '一剑平秋');
INSERT INTO `yk_author` VALUES ('1834', '腹黑的蚂蚁');
INSERT INTO `yk_author` VALUES ('1835', '风御九秋');
INSERT INTO `yk_author` VALUES ('1836', '帅气外露');
INSERT INTO `yk_author` VALUES ('1837', '寒江清影');
INSERT INTO `yk_author` VALUES ('1838', '光光在此');
INSERT INTO `yk_author` VALUES ('1839', '北辰墨璃');
INSERT INTO `yk_author` VALUES ('1840', '仲磊哥');
INSERT INTO `yk_author` VALUES ('1841', '逝者如是说');
INSERT INTO `yk_author` VALUES ('1842', '悲剑人');
INSERT INTO `yk_author` VALUES ('1843', '我太坏');
INSERT INTO `yk_author` VALUES ('1844', '糖醋汉堡');
INSERT INTO `yk_author` VALUES ('1845', '劲舞天下');
INSERT INTO `yk_author` VALUES ('1846', '无心弄月');
INSERT INTO `yk_author` VALUES ('1847', '觉明果子');
INSERT INTO `yk_author` VALUES ('1848', '星辰子轩');
INSERT INTO `yk_author` VALUES ('1849', '悲伤的老牛');
INSERT INTO `yk_author` VALUES ('1850', '无奈选择');
INSERT INTO `yk_author` VALUES ('1851', '凌虚御剑');
INSERT INTO `yk_author` VALUES ('1852', '白云孤鸿');
INSERT INTO `yk_author` VALUES ('1853', '叶梵云海晨');
INSERT INTO `yk_author` VALUES ('1854', '花落忆相惜');
INSERT INTO `yk_author` VALUES ('1855', '逆天小君王');
INSERT INTO `yk_author` VALUES ('1856', '狂鲨');
INSERT INTO `yk_author` VALUES ('1857', 'xiao少爷');
INSERT INTO `yk_author` VALUES ('1858', '写文');
INSERT INTO `yk_author` VALUES ('1859', '枫玄');
INSERT INTO `yk_author` VALUES ('1860', '丢袋');
INSERT INTO `yk_author` VALUES ('1861', '调音师');
INSERT INTO `yk_author` VALUES ('1862', '拂晓晨星');
INSERT INTO `yk_author` VALUES ('1863', '呆贼');
INSERT INTO `yk_author` VALUES ('1864', '阎罗界');
INSERT INTO `yk_author` VALUES ('1865', '东方小傅');
INSERT INTO `yk_author` VALUES ('1866', '擦肩的小孩');
INSERT INTO `yk_author` VALUES ('1867', '完美小号');
INSERT INTO `yk_author` VALUES ('1868', '听月');
INSERT INTO `yk_author` VALUES ('1869', '浴火龙');
INSERT INTO `yk_author` VALUES ('1870', '九世梦');
INSERT INTO `yk_author` VALUES ('1871', '雪花茶');
INSERT INTO `yk_author` VALUES ('1872', '汉卿');
INSERT INTO `yk_author` VALUES ('1873', '血影残梦');
INSERT INTO `yk_author` VALUES ('1874', '青衫客');
INSERT INTO `yk_author` VALUES ('1875', '忧郁的桃夭');
INSERT INTO `yk_author` VALUES ('1876', '舒风');
INSERT INTO `yk_author` VALUES ('1877', '少闫');
INSERT INTO `yk_author` VALUES ('1878', '淡然一笑');
INSERT INTO `yk_author` VALUES ('1879', '李宜临');
INSERT INTO `yk_author` VALUES ('1880', '七里无双');
INSERT INTO `yk_author` VALUES ('1881', '漌月');
INSERT INTO `yk_author` VALUES ('1882', '渊源在途');
INSERT INTO `yk_author` VALUES ('1883', '瑾华');
INSERT INTO `yk_author` VALUES ('1884', '影子焱');
INSERT INTO `yk_author` VALUES ('1885', '能量猪');
INSERT INTO `yk_author` VALUES ('1886', '绷子床');
INSERT INTO `yk_author` VALUES ('1887', '区区一只毛玉');
INSERT INTO `yk_author` VALUES ('1888', '菜太');
INSERT INTO `yk_author` VALUES ('1889', '伤林');
INSERT INTO `yk_author` VALUES ('1890', '禁01');
INSERT INTO `yk_author` VALUES ('1891', '小鸡游泳');
INSERT INTO `yk_author` VALUES ('1892', '浑南老郑');
INSERT INTO `yk_author` VALUES ('1893', '仰望天空的麦兜');
INSERT INTO `yk_author` VALUES ('1894', '叶嘉');
INSERT INTO `yk_author` VALUES ('1895', '君子易');
INSERT INTO `yk_author` VALUES ('1896', '云飘梦遗');
INSERT INTO `yk_author` VALUES ('1897', '玄火天狼星');
INSERT INTO `yk_author` VALUES ('1898', '小贰歌');
INSERT INTO `yk_author` VALUES ('1899', '知道了');
INSERT INTO `yk_author` VALUES ('1900', '光明左使MSA');
INSERT INTO `yk_author` VALUES ('1901', '慕小牧');
INSERT INTO `yk_author` VALUES ('1902', '叱咤冰铠甲');
INSERT INTO `yk_author` VALUES ('1903', 'LoMo笔');
INSERT INTO `yk_author` VALUES ('1904', '好吃的蘑菇酱');
INSERT INTO `yk_author` VALUES ('1905', '苕皮神探');
INSERT INTO `yk_author` VALUES ('1906', '追夢翼');
INSERT INTO `yk_author` VALUES ('1907', '鸀色狂人');
INSERT INTO `yk_author` VALUES ('1908', '绯色耳朵');
INSERT INTO `yk_author` VALUES ('1909', '凉浮');
INSERT INTO `yk_author` VALUES ('1910', '秋叶落悔');
INSERT INTO `yk_author` VALUES ('1911', '朴夏早安');
INSERT INTO `yk_author` VALUES ('1912', '木木君');
INSERT INTO `yk_author` VALUES ('1913', '专用灭害灵');
INSERT INTO `yk_author` VALUES ('1914', '浅思沫');
INSERT INTO `yk_author` VALUES ('1915', '黑色大丽菊');
INSERT INTO `yk_author` VALUES ('1916', '卡卡零');
INSERT INTO `yk_author` VALUES ('1917', '爱豆传说');
INSERT INTO `yk_author` VALUES ('1918', '糖醋饺子');
INSERT INTO `yk_author` VALUES ('1919', '小小言泪');
INSERT INTO `yk_author` VALUES ('1920', '误浮生');
INSERT INTO `yk_author` VALUES ('1921', '沐颜君');
INSERT INTO `yk_author` VALUES ('1922', '飞鸟卿渔');
INSERT INTO `yk_author` VALUES ('1923', '桃子青青');
INSERT INTO `yk_author` VALUES ('1924', '清悠竹风');
INSERT INTO `yk_author` VALUES ('1925', '我是宝马我怕谁');
INSERT INTO `yk_author` VALUES ('1926', '魏家女郎');
INSERT INTO `yk_author` VALUES ('1927', '静若雨');
INSERT INTO `yk_author` VALUES ('1928', '古小炎');
INSERT INTO `yk_author` VALUES ('1929', '黛墨');
INSERT INTO `yk_author` VALUES ('1930', '树上妖妖');
INSERT INTO `yk_author` VALUES ('1931', '宅女一号');
INSERT INTO `yk_author` VALUES ('1932', '雪灵之');
INSERT INTO `yk_author` VALUES ('1933', '芷伊');
INSERT INTO `yk_author` VALUES ('1934', '螺螺冰');
INSERT INTO `yk_author` VALUES ('1935', 'NO7');
INSERT INTO `yk_author` VALUES ('1936', '流沐夕月');
INSERT INTO `yk_author` VALUES ('1937', '深井冰');
INSERT INTO `yk_author` VALUES ('1938', '秋玄');
INSERT INTO `yk_author` VALUES ('1939', '坚强很美丽');
INSERT INTO `yk_author` VALUES ('1940', '红叶舒');
INSERT INTO `yk_author` VALUES ('1941', '爱吃栗子');
INSERT INTO `yk_author` VALUES ('1942', '洛英');
INSERT INTO `yk_author` VALUES ('1943', '没爱了呵呵');
INSERT INTO `yk_author` VALUES ('1944', '司之风骨');
INSERT INTO `yk_author` VALUES ('1945', '苒小汐');
INSERT INTO `yk_author` VALUES ('1946', '子桑君');
INSERT INTO `yk_author` VALUES ('1947', '萌面土豆');
INSERT INTO `yk_author` VALUES ('1948', '露露');
INSERT INTO `yk_author` VALUES ('1949', '宫寒');
INSERT INTO `yk_author` VALUES ('1950', '叶晓甜');
INSERT INTO `yk_author` VALUES ('1951', '小蛮子z');
INSERT INTO `yk_author` VALUES ('1952', '泷柏');
INSERT INTO `yk_author` VALUES ('1953', '浅月如风');
INSERT INTO `yk_author` VALUES ('1954', '唐窈');
INSERT INTO `yk_author` VALUES ('1955', '周小满');
INSERT INTO `yk_author` VALUES ('1956', '沫沫微安');
INSERT INTO `yk_author` VALUES ('1957', '暗夜之雪baby');
INSERT INTO `yk_author` VALUES ('1958', '马小九');
INSERT INTO `yk_author` VALUES ('1959', '典型天蝎女');
INSERT INTO `yk_author` VALUES ('1960', '逸雪冰飞');
INSERT INTO `yk_author` VALUES ('1961', '轩辕黛橼橼');
INSERT INTO `yk_author` VALUES ('1962', '君笙璃');
INSERT INTO `yk_author` VALUES ('1963', '风紫墨');
INSERT INTO `yk_author` VALUES ('1964', '太行一歌');
INSERT INTO `yk_author` VALUES ('1965', '移动春秋');
INSERT INTO `yk_author` VALUES ('1966', '瘦成一道闪电');
INSERT INTO `yk_author` VALUES ('1967', '梦梦小君');
INSERT INTO `yk_author` VALUES ('1968', '飞羽琉殇');
INSERT INTO `yk_author` VALUES ('1969', '八爪喵喵');
INSERT INTO `yk_author` VALUES ('1970', '风十四');
INSERT INTO `yk_author` VALUES ('1971', '暮海惊云');
INSERT INTO `yk_author` VALUES ('1972', '安陵久久');
INSERT INTO `yk_author` VALUES ('1973', '葛格grace');
INSERT INTO `yk_author` VALUES ('1974', 'KcielJ');
INSERT INTO `yk_author` VALUES ('1975', '夏祭流年');
INSERT INTO `yk_author` VALUES ('1976', '闻人伞');
INSERT INTO `yk_author` VALUES ('1977', '小几');
INSERT INTO `yk_author` VALUES ('1978', '葳蕤生光');
INSERT INTO `yk_author` VALUES ('1979', '半暖夏凉');
INSERT INTO `yk_author` VALUES ('1980', '管成学,赵骥民');
INSERT INTO `yk_author` VALUES ('1981', '韩婷');
INSERT INTO `yk_author` VALUES ('1982', '(比)莫里斯·梅特林克(Maurice Maeterlinck)著');
INSERT INTO `yk_author` VALUES ('1983', '南煜林');
INSERT INTO `yk_author` VALUES ('1984', '明祖平');
INSERT INTO `yk_author` VALUES ('1985', '孔海立著');
INSERT INTO `yk_author` VALUES ('1986', '陈清华');
INSERT INTO `yk_author` VALUES ('1987', '聂小丹');
INSERT INTO `yk_author` VALUES ('1988', '秦榆');
INSERT INTO `yk_author` VALUES ('1989', '乔林著');
INSERT INTO `yk_author` VALUES ('1990', '梅吉');
INSERT INTO `yk_author` VALUES ('1991', '芥末');
INSERT INTO `yk_author` VALUES ('1992', '宁航一');
INSERT INTO `yk_author` VALUES ('1993', '逍遥红尘');
INSERT INTO `yk_author` VALUES ('1994', '天下霸唱');
INSERT INTO `yk_author` VALUES ('1995', '苏连营');
INSERT INTO `yk_author` VALUES ('1996', '茅盾');
INSERT INTO `yk_author` VALUES ('1997', '于丹');
INSERT INTO `yk_author` VALUES ('1998', '刘长江');
INSERT INTO `yk_author` VALUES ('1999', '〔唐〕王维孟浩然');
INSERT INTO `yk_author` VALUES ('2000', '【明】佚名');
INSERT INTO `yk_author` VALUES ('2001', '【春秋】左丘明');
INSERT INTO `yk_author` VALUES ('2002', '刘惠玲');
INSERT INTO `yk_author` VALUES ('2003', '郅溥浩，丁淑红');
INSERT INTO `yk_author` VALUES ('2004', '(英) 刘易斯');
INSERT INTO `yk_author` VALUES ('2005', '(印) 泰戈尔');
INSERT INTO `yk_author` VALUES ('2006', '(英) 柯南·道尔');
INSERT INTO `yk_author` VALUES ('2007', '天祺编著');
INSERT INTO `yk_author` VALUES ('2008', '闫燕著');
INSERT INTO `yk_author` VALUES ('2009', '陶玮玲');
INSERT INTO `yk_author` VALUES ('2010', '陆明');
INSERT INTO `yk_author` VALUES ('2011', '(美)本杰明·富兰克林(Benjamin Franklin)');
INSERT INTO `yk_author` VALUES ('2012', '黄若著');
INSERT INTO `yk_author` VALUES ('2013', '李友鹏');
INSERT INTO `yk_author` VALUES ('2014', '龙柒编著');
INSERT INTO `yk_author` VALUES ('2015', '张展');
INSERT INTO `yk_author` VALUES ('2016', '邹当荣');
INSERT INTO `yk_author` VALUES ('2017', '刘国辉');
INSERT INTO `yk_author` VALUES ('2018', '梁庆伟');
INSERT INTO `yk_author` VALUES ('2019', '黄晓红');
INSERT INTO `yk_author` VALUES ('2020', '卢维');
INSERT INTO `yk_author` VALUES ('2021', '刘超');
INSERT INTO `yk_author` VALUES ('2022', '窦岩');
INSERT INTO `yk_author` VALUES ('2023', '张兵');
INSERT INTO `yk_author` VALUES ('2024', '王宏奎著');
INSERT INTO `yk_author` VALUES ('2025', '冯睿');
INSERT INTO `yk_author` VALUES ('2026', '洪烛');
INSERT INTO `yk_author` VALUES ('2027', '杨岗，罗维亮著');
INSERT INTO `yk_author` VALUES ('2028', '郭边宇,王文利');
INSERT INTO `yk_author` VALUES ('2029', '朱炳元');
INSERT INTO `yk_author` VALUES ('2030', '孙喜庆，姜世忠');
INSERT INTO `yk_author` VALUES ('2031', '雷海锋');
INSERT INTO `yk_author` VALUES ('2032', '长治市文明办编');
INSERT INTO `yk_author` VALUES ('2033', '冯翠霞等主编');
INSERT INTO `yk_author` VALUES ('2034', '彭岚嘉');
INSERT INTO `yk_author` VALUES ('2035', '郭艳红编著');
INSERT INTO `yk_author` VALUES ('2036', '周云庵著');
INSERT INTO `yk_author` VALUES ('2037', '李魁彩');
INSERT INTO `yk_author` VALUES ('2038', '尹丽华');
INSERT INTO `yk_author` VALUES ('2039', '刘庆忠');
INSERT INTO `yk_author` VALUES ('2040', '(美)欧亚伦，山奇');
INSERT INTO `yk_author` VALUES ('2041', '康佳');
INSERT INTO `yk_author` VALUES ('2042', '王琳');
INSERT INTO `yk_author` VALUES ('2043', '清扬');
INSERT INTO `yk_author` VALUES ('2044', '石赟');
INSERT INTO `yk_author` VALUES ('2045', '石娟');
INSERT INTO `yk_author` VALUES ('2046', '杨红梅,黄志坚');
INSERT INTO `yk_author` VALUES ('2047', '李兴新');
INSERT INTO `yk_author` VALUES ('2048', '杜刚');
INSERT INTO `yk_author` VALUES ('2049', '刘畅');
INSERT INTO `yk_author` VALUES ('2050', '曹振峰');
INSERT INTO `yk_author` VALUES ('2051', '国家新课程教学策略研究组');
INSERT INTO `yk_author` VALUES ('2052', '生肖集邮研究会 编著 周治华 主编');
INSERT INTO `yk_author` VALUES ('2053', '独孤小杜');
INSERT INTO `yk_author` VALUES ('2054', '威猛的小老鼠');
INSERT INTO `yk_author` VALUES ('2055', '三三五五');
INSERT INTO `yk_author` VALUES ('2056', '画虎客');
INSERT INTO `yk_author` VALUES ('2057', '我自向天笑');
INSERT INTO `yk_author` VALUES ('2058', '东门龙飞');
INSERT INTO `yk_author` VALUES ('2059', '胭脂');
INSERT INTO `yk_author` VALUES ('2060', '北国长风');
INSERT INTO `yk_author` VALUES ('2061', '轩疯狂');
INSERT INTO `yk_author` VALUES ('2062', '絮风凋灵');
INSERT INTO `yk_author` VALUES ('2063', '方士华李天云');
INSERT INTO `yk_author` VALUES ('2064', '华业编著');
INSERT INTO `yk_author` VALUES ('2065', '李传红  李博平');
INSERT INTO `yk_author` VALUES ('2066', '王炳根选编');
INSERT INTO `yk_author` VALUES ('2067', '韩乐等主编');
INSERT INTO `yk_author` VALUES ('2068', '素盘');
INSERT INTO `yk_author` VALUES ('2069', '糊吹');
INSERT INTO `yk_author` VALUES ('2070', '禹少少');
INSERT INTO `yk_author` VALUES ('2071', '晗心');
INSERT INTO `yk_author` VALUES ('2072', '娇蛮郡主');
INSERT INTO `yk_author` VALUES ('2073', '纳兰清雪');
INSERT INTO `yk_author` VALUES ('2074', '卓公子');
INSERT INTO `yk_author` VALUES ('2075', '薪愁龙儿');
INSERT INTO `yk_author` VALUES ('2076', '黑夜de白羊');
INSERT INTO `yk_author` VALUES ('2077', '凌乱紫零落');
INSERT INTO `yk_author` VALUES ('2078', '东方黄龙');
INSERT INTO `yk_author` VALUES ('2079', '西西唯');
INSERT INTO `yk_author` VALUES ('2080', '魔鬼之泪');
INSERT INTO `yk_author` VALUES ('2081', '栀墨1');
INSERT INTO `yk_author` VALUES ('2082', '大小南南');
INSERT INTO `yk_author` VALUES ('2083', '桑小小');
INSERT INTO `yk_author` VALUES ('2084', '赤念');
INSERT INTO `yk_author` VALUES ('2085', '东方邵康');
INSERT INTO `yk_author` VALUES ('2086', '独孤酒溅');
INSERT INTO `yk_author` VALUES ('2087', '我行我素');
INSERT INTO `yk_author` VALUES ('2088', '晋王');
INSERT INTO `yk_author` VALUES ('2089', '乱世妖娆');
INSERT INTO `yk_author` VALUES ('2090', '非优');
INSERT INTO `yk_author` VALUES ('2091', '龙龟');
INSERT INTO `yk_author` VALUES ('2092', '耀阳祖师');
INSERT INTO `yk_author` VALUES ('2093', '织泪');
INSERT INTO `yk_author` VALUES ('2094', '乘风赏月');
INSERT INTO `yk_author` VALUES ('2095', '一小小丹');
INSERT INTO `yk_author` VALUES ('2096', '陋石');
INSERT INTO `yk_author` VALUES ('2097', '身经病');
INSERT INTO `yk_author` VALUES ('2098', '汾阳侯');
INSERT INTO `yk_author` VALUES ('2099', '祈美');
INSERT INTO `yk_author` VALUES ('2100', '渔樵二代');
INSERT INTO `yk_author` VALUES ('2101', '风雪覆神州');
INSERT INTO `yk_author` VALUES ('2102', '良木水中');
INSERT INTO `yk_author` VALUES ('2103', '迷茫的阿四');
INSERT INTO `yk_author` VALUES ('2104', '夏娜长歌');
INSERT INTO `yk_author` VALUES ('2105', '愤怒的南瓜');
INSERT INTO `yk_author` VALUES ('2106', '花儿落知花开');
INSERT INTO `yk_author` VALUES ('2107', '乐乐笑笑');
INSERT INTO `yk_author` VALUES ('2108', '丹腾鞠晋');
INSERT INTO `yk_author` VALUES ('2109', '焚邪');
INSERT INTO `yk_author` VALUES ('2110', '雪夜轮回');
INSERT INTO `yk_author` VALUES ('2111', '疾驰的骆驼');
INSERT INTO `yk_author` VALUES ('2112', '木易晨龙');
INSERT INTO `yk_author` VALUES ('2113', '贺加贝贝');
INSERT INTO `yk_author` VALUES ('2114', '刀巴蛇');
INSERT INTO `yk_author` VALUES ('2115', '大漠西风');
INSERT INTO `yk_author` VALUES ('2116', '遨游飞翔');
INSERT INTO `yk_author` VALUES ('2117', '水无鱼');
INSERT INTO `yk_author` VALUES ('2118', '我是加菲猫');
INSERT INTO `yk_author` VALUES ('2119', '绿豆凡');
INSERT INTO `yk_author` VALUES ('2120', '青衣神棍');
INSERT INTO `yk_author` VALUES ('2121', '周小庄');
INSERT INTO `yk_author` VALUES ('2122', '小承承');
INSERT INTO `yk_author` VALUES ('2123', '陶陶猫');
INSERT INTO `yk_author` VALUES ('2124', '陆长松');
INSERT INTO `yk_author` VALUES ('2125', '狂仙尊');
INSERT INTO `yk_author` VALUES ('2126', '红酒一杯');
INSERT INTO `yk_author` VALUES ('2127', '提子i');
INSERT INTO `yk_author` VALUES ('2128', '鹿尔鸣');
INSERT INTO `yk_author` VALUES ('2129', '鸟人飞月');
INSERT INTO `yk_author` VALUES ('2130', '无业有鸣');
INSERT INTO `yk_author` VALUES ('2131', '田恒');
INSERT INTO `yk_author` VALUES ('2132', '七涂骰子');
INSERT INTO `yk_author` VALUES ('2133', '神煌羽');
INSERT INTO `yk_author` VALUES ('2134', '再逍遥');
INSERT INTO `yk_author` VALUES ('2135', '慕悟');
INSERT INTO `yk_author` VALUES ('2136', '宁堂主');
INSERT INTO `yk_author` VALUES ('2137', '战狼之吻');
INSERT INTO `yk_author` VALUES ('2138', '刀盾手');
INSERT INTO `yk_author` VALUES ('2139', '记事本');
INSERT INTO `yk_author` VALUES ('2140', '断水');
INSERT INTO `yk_author` VALUES ('2141', '晴空无限');
INSERT INTO `yk_author` VALUES ('2142', '被风吹落的优雅');
INSERT INTO `yk_author` VALUES ('2143', '安日');
INSERT INTO `yk_author` VALUES ('2144', '雪月缘');
INSERT INTO `yk_author` VALUES ('2145', '七输');
INSERT INTO `yk_author` VALUES ('2146', '无禁');
INSERT INTO `yk_author` VALUES ('2147', '夏日雨桐');
INSERT INTO `yk_author` VALUES ('2148', '偷猫的腥');
INSERT INTO `yk_author` VALUES ('2149', '叮咚笑');
INSERT INTO `yk_author` VALUES ('2150', '如真如幻');
INSERT INTO `yk_author` VALUES ('2151', '灵松');
INSERT INTO `yk_author` VALUES ('2152', '吕氏春秋');
INSERT INTO `yk_author` VALUES ('2153', '白色的黑色');
INSERT INTO `yk_author` VALUES ('2154', '帅子5');
INSERT INTO `yk_author` VALUES ('2155', '离落莫离');
INSERT INTO `yk_author` VALUES ('2156', '斑点墨');
INSERT INTO `yk_author` VALUES ('2157', '岩下');
INSERT INTO `yk_author` VALUES ('2158', '夏华');
INSERT INTO `yk_author` VALUES ('2159', '长短三点');
INSERT INTO `yk_author` VALUES ('2160', '北云飞鹤');
INSERT INTO `yk_author` VALUES ('2161', '大梦依稀');
INSERT INTO `yk_author` VALUES ('2162', '蒋家第一军');
INSERT INTO `yk_author` VALUES ('2163', '二月残阳');
INSERT INTO `yk_author` VALUES ('2164', '兔子专吃窝边草');
INSERT INTO `yk_author` VALUES ('2165', '非主流神棍');
INSERT INTO `yk_author` VALUES ('2166', '丁老湿');
INSERT INTO `yk_author` VALUES ('2167', '风风雨');
INSERT INTO `yk_author` VALUES ('2168', '活的红烧鱼');
INSERT INTO `yk_author` VALUES ('2169', '暗黑贵公子');
INSERT INTO `yk_author` VALUES ('2170', '羽天空');
INSERT INTO `yk_author` VALUES ('2171', '天仓乱');
INSERT INTO `yk_author` VALUES ('2172', '冰情B1n9');
INSERT INTO `yk_author` VALUES ('2173', '三尐爷的烟');
INSERT INTO `yk_author` VALUES ('2174', '悲月影');
INSERT INTO `yk_author` VALUES ('2175', '草尖上的小云雀');
INSERT INTO `yk_author` VALUES ('2176', '焚书煮酒');
INSERT INTO `yk_author` VALUES ('2177', '风伤情');
INSERT INTO `yk_author` VALUES ('2178', '空酒杯');
INSERT INTO `yk_author` VALUES ('2179', '单调色的猫');
INSERT INTO `yk_author` VALUES ('2180', '高明宇');
INSERT INTO `yk_author` VALUES ('2181', '亦云仙踪');
INSERT INTO `yk_author` VALUES ('2182', '魔道阴阳');
INSERT INTO `yk_author` VALUES ('2183', '司徒小小林');
INSERT INTO `yk_author` VALUES ('2184', '魔幻豆豆');
INSERT INTO `yk_author` VALUES ('2185', '山有水');
INSERT INTO `yk_author` VALUES ('2186', '枫叶澜');
INSERT INTO `yk_author` VALUES ('2187', '夏繁天');
INSERT INTO `yk_author` VALUES ('2188', '书生问路');
INSERT INTO `yk_author` VALUES ('2189', '云小染');
INSERT INTO `yk_author` VALUES ('2190', '巫安然');
INSERT INTO `yk_author` VALUES ('2191', '英雄唯战');
INSERT INTO `yk_author` VALUES ('2192', '东方皇天');
INSERT INTO `yk_author` VALUES ('2193', '苏以厚');
INSERT INTO `yk_author` VALUES ('2194', '贻我彤管');
INSERT INTO `yk_author` VALUES ('2195', '无伦');
INSERT INTO `yk_author` VALUES ('2196', '南柯一墨');
INSERT INTO `yk_author` VALUES ('2197', '吕懵');
INSERT INTO `yk_author` VALUES ('2198', '更生如月');
INSERT INTO `yk_author` VALUES ('2199', '浅颜尘');
INSERT INTO `yk_author` VALUES ('2200', '雏爱');
INSERT INTO `yk_author` VALUES ('2201', '杨咪');
INSERT INTO `yk_author` VALUES ('2202', '穿跟鞋长跑');
INSERT INTO `yk_author` VALUES ('2203', 'aggie');
INSERT INTO `yk_author` VALUES ('2204', '李秋晔');
INSERT INTO `yk_author` VALUES ('2205', '天冷正好眠');
INSERT INTO `yk_author` VALUES ('2206', '云轻');
INSERT INTO `yk_author` VALUES ('2207', '时寒星');
INSERT INTO `yk_author` VALUES ('2208', '不泣不离');
INSERT INTO `yk_author` VALUES ('2209', '绵水');
INSERT INTO `yk_author` VALUES ('2210', '南龟');
INSERT INTO `yk_author` VALUES ('2211', '黛苒');
INSERT INTO `yk_author` VALUES ('2212', '妖莲');
INSERT INTO `yk_author` VALUES ('2213', '南槐');
INSERT INTO `yk_author` VALUES ('2214', '公子冷墨');
INSERT INTO `yk_author` VALUES ('2215', '水蜜筱桃');
INSERT INTO `yk_author` VALUES ('2216', '依依很倾城');
INSERT INTO `yk_author` VALUES ('2217', '大风乱天下');
INSERT INTO `yk_author` VALUES ('2218', '沐流火');
INSERT INTO `yk_author` VALUES ('2219', '碎片璃落');
INSERT INTO `yk_author` VALUES ('2220', '小笑酥');
INSERT INTO `yk_author` VALUES ('2221', '寄月冷色');
INSERT INTO `yk_author` VALUES ('2222', '愤斗的瓜子');
INSERT INTO `yk_author` VALUES ('2223', '闲子');
INSERT INTO `yk_author` VALUES ('2224', '飞鸟甄绿');
INSERT INTO `yk_author` VALUES ('2225', '葫芦糖糖儿');
INSERT INTO `yk_author` VALUES ('2226', '月如眉love');
INSERT INTO `yk_author` VALUES ('2227', '云皎皎');
INSERT INTO `yk_author` VALUES ('2228', '息Aldof');
INSERT INTO `yk_author` VALUES ('2229', '暮晚娃娃');
INSERT INTO `yk_author` VALUES ('2230', '木木言午');
INSERT INTO `yk_author` VALUES ('2231', '良七');
INSERT INTO `yk_author` VALUES ('2232', '卿书');
INSERT INTO `yk_author` VALUES ('2233', '筱艺');
INSERT INTO `yk_author` VALUES ('2234', '浅酌吟唱');
INSERT INTO `yk_author` VALUES ('2235', '飞刀叶');
INSERT INTO `yk_author` VALUES ('2236', '俯看沧桑');
INSERT INTO `yk_author` VALUES ('2237', '孙绯言');
INSERT INTO `yk_author` VALUES ('2238', '洛鬼鬼');
INSERT INTO `yk_author` VALUES ('2239', '青菊');
INSERT INTO `yk_author` VALUES ('2240', '维她柠檬茶');
INSERT INTO `yk_author` VALUES ('2241', '谷心');
INSERT INTO `yk_author` VALUES ('2242', '东兔凡');
INSERT INTO `yk_author` VALUES ('2243', '纪四');
INSERT INTO `yk_author` VALUES ('2244', '芥子居');
INSERT INTO `yk_author` VALUES ('2245', '潘潘2');
INSERT INTO `yk_author` VALUES ('2246', '闺梦出阁');
INSERT INTO `yk_author` VALUES ('2247', '章朔');
INSERT INTO `yk_author` VALUES ('2248', '冰言言');
INSERT INTO `yk_author` VALUES ('2249', '雾海城');
INSERT INTO `yk_author` VALUES ('2250', '姽婳怜翩');
INSERT INTO `yk_author` VALUES ('2251', '花月知飞狐');
INSERT INTO `yk_author` VALUES ('2252', '隔壁转角');
INSERT INTO `yk_author` VALUES ('2253', '佾弦');
INSERT INTO `yk_author` VALUES ('2254', '夏柳伟');
INSERT INTO `yk_author` VALUES ('2255', '陈吉秀（笔名：徐慧丽）');
INSERT INTO `yk_author` VALUES ('2256', '余壹');
INSERT INTO `yk_author` VALUES ('2257', '史冬梅');
INSERT INTO `yk_author` VALUES ('2258', '王大有');
INSERT INTO `yk_author` VALUES ('2259', '穆丽英');
INSERT INTO `yk_author` VALUES ('2260', '石红许');
INSERT INTO `yk_author` VALUES ('2261', '禅香雪');
INSERT INTO `yk_author` VALUES ('2262', '庞洪成');
INSERT INTO `yk_author` VALUES ('2263', '万俊华');
INSERT INTO `yk_author` VALUES ('2264', '郭鑫');
INSERT INTO `yk_author` VALUES ('2265', '王楠');
INSERT INTO `yk_author` VALUES ('2266', '吕敏');
INSERT INTO `yk_author` VALUES ('2267', '宋国涛');
INSERT INTO `yk_author` VALUES ('2268', '易丹');
INSERT INTO `yk_author` VALUES ('2269', '（西汉）司马迁原著；孙侃编写');
INSERT INTO `yk_author` VALUES ('2270', '冯华');
INSERT INTO `yk_author` VALUES ('2271', '梁换林');
INSERT INTO `yk_author` VALUES ('2272', '安昌河');
INSERT INTO `yk_author` VALUES ('2273', '安意如');
INSERT INTO `yk_author` VALUES ('2274', '唐梓严');
INSERT INTO `yk_author` VALUES ('2275', '包利民');
INSERT INTO `yk_author` VALUES ('2276', '赵本夫');
INSERT INTO `yk_author` VALUES ('2277', '黑洁明');
INSERT INTO `yk_author` VALUES ('2278', '鲁迅');
INSERT INTO `yk_author` VALUES ('2279', '苏家老四');
INSERT INTO `yk_author` VALUES ('2280', '无谓悲伤');
INSERT INTO `yk_author` VALUES ('2281', '白落梅');
INSERT INTO `yk_author` VALUES ('2282', '（宋）黄公度');
INSERT INTO `yk_author` VALUES ('2283', '〔晋〕陶渊明');
INSERT INTO `yk_author` VALUES ('2284', '【唐】秦观');
INSERT INTO `yk_author` VALUES ('2285', '【战国】尹文');
INSERT INTO `yk_author` VALUES ('2286', '(宋)周邦彦');
INSERT INTO `yk_author` VALUES ('2287', '【清】佚名');
INSERT INTO `yk_author` VALUES ('2288', '段晓蕾鲁礼容');
INSERT INTO `yk_author` VALUES ('2289', '〔英〕狄更斯,刘婷编译');
INSERT INTO `yk_author` VALUES ('2290', '冠诚');
INSERT INTO `yk_author` VALUES ('2291', '杨东苟');
INSERT INTO `yk_author` VALUES ('2292', '邹斌');
INSERT INTO `yk_author` VALUES ('2293', '肖定丽');
INSERT INTO `yk_author` VALUES ('2294', '东安尼·罗宾');
INSERT INTO `yk_author` VALUES ('2295', '孟涵');
INSERT INTO `yk_author` VALUES ('2296', '刘玉林，董从华著');
INSERT INTO `yk_author` VALUES ('2297', '胡彧');
INSERT INTO `yk_author` VALUES ('2298', '才永发');
INSERT INTO `yk_author` VALUES ('2299', '郑晶心，吴大奇');
INSERT INTO `yk_author` VALUES ('2300', '宫和雍');
INSERT INTO `yk_author` VALUES ('2301', '李津编著');
INSERT INTO `yk_author` VALUES ('2302', '牛阳，周波');
INSERT INTO `yk_author` VALUES ('2303', '严锴编');
INSERT INTO `yk_author` VALUES ('2304', '刘静娴');
INSERT INTO `yk_author` VALUES ('2305', '高邑编著');
INSERT INTO `yk_author` VALUES ('2306', '玛雅');
INSERT INTO `yk_author` VALUES ('2307', '杨西文');
INSERT INTO `yk_author` VALUES ('2308', '赵兴军编');
INSERT INTO `yk_author` VALUES ('2309', '卢山冰');
INSERT INTO `yk_author` VALUES ('2310', '吴良海');
INSERT INTO `yk_author` VALUES ('2311', '于雷');
INSERT INTO `yk_author` VALUES ('2312', '赵文竹');
INSERT INTO `yk_author` VALUES ('2313', '强安荣主编');
INSERT INTO `yk_author` VALUES ('2314', '胡世浩');
INSERT INTO `yk_author` VALUES ('2315', '孙敏强');
INSERT INTO `yk_author` VALUES ('2316', '沈玉成');
INSERT INTO `yk_author` VALUES ('2317', '董关鹏');
INSERT INTO `yk_author` VALUES ('2318', '靳明全');
INSERT INTO `yk_author` VALUES ('2319', '阿龙');
INSERT INTO `yk_author` VALUES ('2320', '李佳');
INSERT INTO `yk_author` VALUES ('2321', '陈洁，张丽萍');
INSERT INTO `yk_author` VALUES ('2322', '江俊博');
INSERT INTO `yk_author` VALUES ('2323', '王小兔,晏妮');
INSERT INTO `yk_author` VALUES ('2324', '周南');
INSERT INTO `yk_author` VALUES ('2325', '李彦芳');
INSERT INTO `yk_author` VALUES ('2326', '周宝良');
INSERT INTO `yk_author` VALUES ('2327', '林继中注评');
INSERT INTO `yk_author` VALUES ('2328', '〔法〕凡尔纳,陈胜河编译');
INSERT INTO `yk_author` VALUES ('2329', '宋璐璐曹金洪');
INSERT INTO `yk_author` VALUES ('2330', '那年那个66');
INSERT INTO `yk_author` VALUES ('2331', '悦豪');
INSERT INTO `yk_author` VALUES ('2332', '黄毛小鬼');
INSERT INTO `yk_author` VALUES ('2333', '轩辕泪');
INSERT INTO `yk_author` VALUES ('2334', '逗乐先生');
INSERT INTO `yk_author` VALUES ('2335', '权狼');
INSERT INTO `yk_author` VALUES ('2336', '（明）吴承恩');
INSERT INTO `yk_author` VALUES ('2337', '只写游戏');
INSERT INTO `yk_author` VALUES ('2338', '午夜不眠');
INSERT INTO `yk_author` VALUES ('2339', '胸口碎大石');
INSERT INTO `yk_author` VALUES ('2340', '九方楼兰');
INSERT INTO `yk_author` VALUES ('2341', '鱼头炖豆腐');
INSERT INTO `yk_author` VALUES ('2342', '民间幽默笑话集编委会');
INSERT INTO `yk_author` VALUES ('2343', '秦喜杰,陈洪');
INSERT INTO `yk_author` VALUES ('2344', '佟彤');
INSERT INTO `yk_author` VALUES ('2345', '池衡水榭');
INSERT INTO `yk_author` VALUES ('2346', '薄锦雪霁');
INSERT INTO `yk_author` VALUES ('2347', '辅国大将军');
INSERT INTO `yk_author` VALUES ('2348', '高瑞沣');
INSERT INTO `yk_author` VALUES ('2349', '灵蛛');
INSERT INTO `yk_author` VALUES ('2350', '赵一');
INSERT INTO `yk_author` VALUES ('2351', '耿兴永');
INSERT INTO `yk_author` VALUES ('2352', '池雨秋');
INSERT INTO `yk_author` VALUES ('2353', '霍忠义');
INSERT INTO `yk_author` VALUES ('2354', '乔飞');
INSERT INTO `yk_author` VALUES ('2355', '程维');
INSERT INTO `yk_author` VALUES ('2356', '张国龙');
INSERT INTO `yk_author` VALUES ('2357', '刘莹');
INSERT INTO `yk_author` VALUES ('2358', '彩神');
INSERT INTO `yk_author` VALUES ('2359', '是非公子');
INSERT INTO `yk_author` VALUES ('2360', '饭碗');
INSERT INTO `yk_author` VALUES ('2361', '罗夏的面具');
INSERT INTO `yk_author` VALUES ('2362', '毒步');
INSERT INTO `yk_author` VALUES ('2363', '唯尨舞');
INSERT INTO `yk_author` VALUES ('2364', '焚古殇');
INSERT INTO `yk_author` VALUES ('2365', '叶清歌');
INSERT INTO `yk_author` VALUES ('2366', '云留影');
INSERT INTO `yk_author` VALUES ('2367', '贺兰山下');
INSERT INTO `yk_author` VALUES ('2368', '白手魔神');
INSERT INTO `yk_author` VALUES ('2369', '红霜不知情');
INSERT INTO `yk_author` VALUES ('2370', '雾飞樱');
INSERT INTO `yk_author` VALUES ('2371', '绝世好魔王');
INSERT INTO `yk_author` VALUES ('2372', '鸠跱周成');
INSERT INTO `yk_author` VALUES ('2373', '咖啡馆的杀手');
INSERT INTO `yk_author` VALUES ('2374', '东风已至');
INSERT INTO `yk_author` VALUES ('2375', '蓝海涛涛');
INSERT INTO `yk_author` VALUES ('2376', '果将');
INSERT INTO `yk_author` VALUES ('2377', '九戮');
INSERT INTO `yk_author` VALUES ('2378', '冬天的稻草人');
INSERT INTO `yk_author` VALUES ('2379', '君若语');
INSERT INTO `yk_author` VALUES ('2380', '南粤孤狼');
INSERT INTO `yk_author` VALUES ('2381', '一直都很二');
INSERT INTO `yk_author` VALUES ('2382', '月言');
INSERT INTO `yk_author` VALUES ('2383', '狼籍');
INSERT INTO `yk_author` VALUES ('2384', '醉橘子');
INSERT INTO `yk_author` VALUES ('2385', '一大三金x');
INSERT INTO `yk_author` VALUES ('2386', '神一样的蛋蛋');
INSERT INTO `yk_author` VALUES ('2387', '匿名顶蘀');
INSERT INTO `yk_author` VALUES ('2388', '风翔宇');
INSERT INTO `yk_author` VALUES ('2389', '那峰');
INSERT INTO `yk_author` VALUES ('2390', '怎么了东东');
INSERT INTO `yk_author` VALUES ('2391', '蝶醉青岚');
INSERT INTO `yk_author` VALUES ('2392', '往事一杯酒');
INSERT INTO `yk_author` VALUES ('2393', '柳少校');
INSERT INTO `yk_author` VALUES ('2394', '背着担架看戏');
INSERT INTO `yk_author` VALUES ('2395', '烟枪大叔');
INSERT INTO `yk_author` VALUES ('2396', '碧强哥');
INSERT INTO `yk_author` VALUES ('2397', '乡村美男子');
INSERT INTO `yk_author` VALUES ('2398', '上帝的小丑');
INSERT INTO `yk_author` VALUES ('2399', '郑军');
INSERT INTO `yk_author` VALUES ('2400', '雪天余');
INSERT INTO `yk_author` VALUES ('2401', '火前刘明');
INSERT INTO `yk_author` VALUES ('2402', '小孩不要跑');
INSERT INTO `yk_author` VALUES ('2403', '风雨同悲');
INSERT INTO `yk_author` VALUES ('2404', '月色花前酒');
INSERT INTO `yk_author` VALUES ('2405', '扶摇的蓬');
INSERT INTO `yk_author` VALUES ('2406', '小鱼8023');
INSERT INTO `yk_author` VALUES ('2407', '幸福紫菜');
INSERT INTO `yk_author` VALUES ('2408', '十武');
INSERT INTO `yk_author` VALUES ('2409', '流氓狂少');
INSERT INTO `yk_author` VALUES ('2410', '小三亦疯狂');
INSERT INTO `yk_author` VALUES ('2411', '暗漠');
INSERT INTO `yk_author` VALUES ('2412', '几度轮回');
INSERT INTO `yk_author` VALUES ('2413', '金刚指');
INSERT INTO `yk_author` VALUES ('2414', '张景轩');
INSERT INTO `yk_author` VALUES ('2415', '丹道子');
INSERT INTO `yk_author` VALUES ('2416', '指尖倾城');
INSERT INTO `yk_author` VALUES ('2417', '小小龙芽儿');
INSERT INTO `yk_author` VALUES ('2418', '铁皮共和国');
INSERT INTO `yk_author` VALUES ('2419', '蓝小楼');
INSERT INTO `yk_author` VALUES ('2420', '此间爱画画');
INSERT INTO `yk_author` VALUES ('2421', '夜筠溪');
INSERT INTO `yk_author` VALUES ('2422', '澹然大师');
INSERT INTO `yk_author` VALUES ('2423', '龙腾克拉');
INSERT INTO `yk_author` VALUES ('2424', '乱世家人');
INSERT INTO `yk_author` VALUES ('2425', '龙恩');
INSERT INTO `yk_author` VALUES ('2426', '诸葛京');
INSERT INTO `yk_author` VALUES ('2427', 'satan忘川');
INSERT INTO `yk_author` VALUES ('2428', '邪恶猫眼');
INSERT INTO `yk_author` VALUES ('2429', '九五公子');
INSERT INTO `yk_author` VALUES ('2430', '希露达小姐');
INSERT INTO `yk_author` VALUES ('2431', '逝去的流光');
INSERT INTO `yk_author` VALUES ('2432', '韭菜大婶');
INSERT INTO `yk_author` VALUES ('2433', '夏夜的紫沫');
INSERT INTO `yk_author` VALUES ('2434', '水落窍');
INSERT INTO `yk_author` VALUES ('2435', '黄四多');
INSERT INTO `yk_author` VALUES ('2436', '迷茫星空');
INSERT INTO `yk_author` VALUES ('2437', '宋玉');
INSERT INTO `yk_author` VALUES ('2438', '七殇君');
INSERT INTO `yk_author` VALUES ('2439', '稀帅');
INSERT INTO `yk_author` VALUES ('2440', '三千大人');
INSERT INTO `yk_author` VALUES ('2441', '葬心');
INSERT INTO `yk_author` VALUES ('2442', '展翅');
INSERT INTO `yk_author` VALUES ('2443', '挣扎的生存');
INSERT INTO `yk_author` VALUES ('2444', '平西王府0');
INSERT INTO `yk_author` VALUES ('2445', '一叶飘尘');
INSERT INTO `yk_author` VALUES ('2446', '柴门临水采红菱');
INSERT INTO `yk_author` VALUES ('2447', '千山暮暄');
INSERT INTO `yk_author` VALUES ('2448', '野草要睡');
INSERT INTO `yk_author` VALUES ('2449', '憨憨杜');
INSERT INTO `yk_author` VALUES ('2450', '马辰');
INSERT INTO `yk_author` VALUES ('2451', '不吃樱桃');
INSERT INTO `yk_author` VALUES ('2452', '我来子不语');
INSERT INTO `yk_author` VALUES ('2453', '暗战');
INSERT INTO `yk_author` VALUES ('2454', '琼花落');
INSERT INTO `yk_author` VALUES ('2455', '爱德华会玩');
INSERT INTO `yk_author` VALUES ('2456', '七夜晴');
INSERT INTO `yk_author` VALUES ('2457', '钸钸');
INSERT INTO `yk_author` VALUES ('2458', '小蘖');
INSERT INTO `yk_author` VALUES ('2459', '七叶家');
INSERT INTO `yk_author` VALUES ('2460', '东梧');
INSERT INTO `yk_author` VALUES ('2461', '海心鱼');
INSERT INTO `yk_author` VALUES ('2462', '童言勿盗');
INSERT INTO `yk_author` VALUES ('2463', '半颗豆芽');
INSERT INTO `yk_author` VALUES ('2464', '瑶念一');
INSERT INTO `yk_author` VALUES ('2465', '晓渡');
INSERT INTO `yk_author` VALUES ('2466', '月玲珑');
INSERT INTO `yk_author` VALUES ('2467', '渣爷');
INSERT INTO `yk_author` VALUES ('2468', '桃墨曦');
INSERT INTO `yk_author` VALUES ('2469', '佳炎');
INSERT INTO `yk_author` VALUES ('2470', '九霄碧落');
INSERT INTO `yk_author` VALUES ('2471', '淡墨痕');
INSERT INTO `yk_author` VALUES ('2472', '静夜杜枫舞');
INSERT INTO `yk_author` VALUES ('2473', '恩蓝飞飞');
INSERT INTO `yk_author` VALUES ('2474', '慕昭颜');
INSERT INTO `yk_author` VALUES ('2475', '五月端');
INSERT INTO `yk_author` VALUES ('2476', '风狂老鼠');
INSERT INTO `yk_author` VALUES ('2477', '小虞児');
INSERT INTO `yk_author` VALUES ('2478', '姑苏妍冰');
INSERT INTO `yk_author` VALUES ('2479', '锦之墨');
INSERT INTO `yk_author` VALUES ('2480', '笑笑尘埃');
INSERT INTO `yk_author` VALUES ('2481', '恶魔花生');
INSERT INTO `yk_author` VALUES ('2482', '隐月弦音');
INSERT INTO `yk_author` VALUES ('2483', '于蹊');
INSERT INTO `yk_author` VALUES ('2484', '满座衣冠胜雪');
INSERT INTO `yk_author` VALUES ('2485', '夏末之徙');
INSERT INTO `yk_author` VALUES ('2486', '妖娆的夜猫有点懒');
INSERT INTO `yk_author` VALUES ('2487', '丹三');
INSERT INTO `yk_author` VALUES ('2488', '云水悠');
INSERT INTO `yk_author` VALUES ('2489', '蒲媞紫');
INSERT INTO `yk_author` VALUES ('2490', '塔圣');
INSERT INTO `yk_author` VALUES ('2491', '梧桐晓');
INSERT INTO `yk_author` VALUES ('2492', '橙阳');
INSERT INTO `yk_author` VALUES ('2493', '彤管800');
INSERT INTO `yk_author` VALUES ('2494', 'Jo');
INSERT INTO `yk_author` VALUES ('2495', '艾天雪');
INSERT INTO `yk_author` VALUES ('2496', '糖果');
INSERT INTO `yk_author` VALUES ('2497', '三生六世');
INSERT INTO `yk_author` VALUES ('2498', '墨韵兰香');
INSERT INTO `yk_author` VALUES ('2499', '艾莎');
INSERT INTO `yk_author` VALUES ('2500', '依然潇然梦');
INSERT INTO `yk_author` VALUES ('2501', '知语');
INSERT INTO `yk_author` VALUES ('2502', '周佩鑫');
INSERT INTO `yk_author` VALUES ('2503', '新叶w');
INSERT INTO `yk_author` VALUES ('2504', '山刺槐');
INSERT INTO `yk_author` VALUES ('2505', '青莲月');
INSERT INTO `yk_author` VALUES ('2506', '勿哀');
INSERT INTO `yk_author` VALUES ('2507', '梁子俊');
INSERT INTO `yk_author` VALUES ('2508', '浅蓝天');
INSERT INTO `yk_author` VALUES ('2509', '半月流觞');
INSERT INTO `yk_author` VALUES ('2510', '放逐天际');
INSERT INTO `yk_author` VALUES ('2511', '小山童鞋');
INSERT INTO `yk_author` VALUES ('2512', '小懒妞儿');
INSERT INTO `yk_author` VALUES ('2513', '落寂雪');
INSERT INTO `yk_author` VALUES ('2514', '杰小文');
INSERT INTO `yk_author` VALUES ('2515', '没藏好尾巴的小白');
INSERT INTO `yk_author` VALUES ('2516', '苍牙覆雪');
INSERT INTO `yk_author` VALUES ('2517', '儒家二师公');
INSERT INTO `yk_author` VALUES ('2518', '思维儿');
INSERT INTO `yk_author` VALUES ('2519', '冉大猫');
INSERT INTO `yk_author` VALUES ('2520', '郑永安');
INSERT INTO `yk_author` VALUES ('2521', '戈丹，千舒');
INSERT INTO `yk_author` VALUES ('2522', '杨家祺，刘庆忠');
INSERT INTO `yk_author` VALUES ('2523', '杨鹏');
INSERT INTO `yk_author` VALUES ('2524', '赵瑜');
INSERT INTO `yk_author` VALUES ('2525', '石教英');
INSERT INTO `yk_author` VALUES ('2526', '林夕著');
INSERT INTO `yk_author` VALUES ('2527', '王莲凤');
INSERT INTO `yk_author` VALUES ('2528', '朱儒楚');
INSERT INTO `yk_author` VALUES ('2529', '刘振鹏');
INSERT INTO `yk_author` VALUES ('2530', '彭懿');
INSERT INTO `yk_author` VALUES ('2531', '王晋康著');
INSERT INTO `yk_author` VALUES ('2532', '高三保');
INSERT INTO `yk_author` VALUES ('2533', '万小遥');
INSERT INTO `yk_author` VALUES ('2534', '苔丝公');
INSERT INTO `yk_author` VALUES ('2535', '朱春红');
INSERT INTO `yk_author` VALUES ('2536', '金庚石 主编');
INSERT INTO `yk_author` VALUES ('2537', '关汉卿');
INSERT INTO `yk_author` VALUES ('2538', '（宋）杨万里');
INSERT INTO `yk_author` VALUES ('2539', '【明】罗贯中，冯梦龙');
INSERT INTO `yk_author` VALUES ('2540', '【唐】李翰');
INSERT INTO `yk_author` VALUES ('2541', '(英)莎士比亚');
INSERT INTO `yk_author` VALUES ('2542', '桑希臣主编');
INSERT INTO `yk_author` VALUES ('2543', '【清】黄小配');
INSERT INTO `yk_author` VALUES ('2544', '孙燕君');
INSERT INTO `yk_author` VALUES ('2545', '罗鲜英');
INSERT INTO `yk_author` VALUES ('2546', '风飞沙');
INSERT INTO `yk_author` VALUES ('2547', '刘子仲');
INSERT INTO `yk_author` VALUES ('2548', '李振东');
INSERT INTO `yk_author` VALUES ('2549', '张野');
INSERT INTO `yk_author` VALUES ('2550', '杨洋');
INSERT INTO `yk_author` VALUES ('2551', '谢开慧');
INSERT INTO `yk_author` VALUES ('2552', '林健安');
INSERT INTO `yk_author` VALUES ('2553', '谢普');
INSERT INTO `yk_author` VALUES ('2554', '君子心');
INSERT INTO `yk_author` VALUES ('2555', '(英) 特罗洛普');
INSERT INTO `yk_author` VALUES ('2556', '冯亦文');
INSERT INTO `yk_author` VALUES ('2557', '侯国新');
INSERT INTO `yk_author` VALUES ('2558', '方英，储冬爱');
INSERT INTO `yk_author` VALUES ('2559', '王涛');
INSERT INTO `yk_author` VALUES ('2560', '孙颢编著');
INSERT INTO `yk_author` VALUES ('2561', '谢娜');
INSERT INTO `yk_author` VALUES ('2562', '孙郡鍇编著');
INSERT INTO `yk_author` VALUES ('2563', '马飞编');
INSERT INTO `yk_author` VALUES ('2564', '郭华');
INSERT INTO `yk_author` VALUES ('2565', '(法)卢梭金济伟编');
INSERT INTO `yk_author` VALUES ('2566', '史振亚');
INSERT INTO `yk_author` VALUES ('2567', '张德荣');
INSERT INTO `yk_author` VALUES ('2568', '杨林');
INSERT INTO `yk_author` VALUES ('2569', '中石');
INSERT INTO `yk_author` VALUES ('2570', '钱军');
INSERT INTO `yk_author` VALUES ('2571', '李,勇');
INSERT INTO `yk_author` VALUES ('2572', '〔美〕布尔凡奇,牛玲香编译');
INSERT INTO `yk_author` VALUES ('2573', '王少农');
INSERT INTO `yk_author` VALUES ('2574', '彭莉');
INSERT INTO `yk_author` VALUES ('2575', '陈忠槐');
INSERT INTO `yk_author` VALUES ('2576', '韩泰伦');
INSERT INTO `yk_author` VALUES ('2577', '乌日克');
INSERT INTO `yk_author` VALUES ('2578', '史东梅改编');
INSERT INTO `yk_author` VALUES ('2579', '舒乡');
INSERT INTO `yk_author` VALUES ('2580', '陈德军');
INSERT INTO `yk_author` VALUES ('2581', '赵华伦，汪清秀');
INSERT INTO `yk_author` VALUES ('2582', '闫锋');
INSERT INTO `yk_author` VALUES ('2583', '孟波');
INSERT INTO `yk_author` VALUES ('2584', '张心远');
INSERT INTO `yk_author` VALUES ('2585', '幸平, 黄伟东, 蔺军山');
INSERT INTO `yk_author` VALUES ('2586', '桑吉扎西');
INSERT INTO `yk_author` VALUES ('2587', '风吹鬼');
INSERT INTO `yk_author` VALUES ('2588', '禹枫');
INSERT INTO `yk_author` VALUES ('2589', '美女请自重');
INSERT INTO `yk_author` VALUES ('2590', '果沙尔');
INSERT INTO `yk_author` VALUES ('2591', '我在大渡河畔');
INSERT INTO `yk_author` VALUES ('2592', '夜雨寄北');
INSERT INTO `yk_author` VALUES ('2593', '陈忠实');
INSERT INTO `yk_author` VALUES ('2594', '温岭闲人');
INSERT INTO `yk_author` VALUES ('2595', '掠痕');
INSERT INTO `yk_author` VALUES ('2596', '郑一群');
INSERT INTO `yk_author` VALUES ('2597', '阙建华，王云峰');
INSERT INTO `yk_author` VALUES ('2598', '贾仁山');
INSERT INTO `yk_author` VALUES ('2599', '胡不为');
INSERT INTO `yk_author` VALUES ('2600', '失落梵蒂冈');
INSERT INTO `yk_author` VALUES ('2601', '我媳妇儿叫二毛');
INSERT INTO `yk_author` VALUES ('2602', '玄神');
INSERT INTO `yk_author` VALUES ('2603', '苏明璞');
INSERT INTO `yk_author` VALUES ('2604', '我是木槿');
INSERT INTO `yk_author` VALUES ('2605', '琳琅满屋');
INSERT INTO `yk_author` VALUES ('2606', '金水达莲');
INSERT INTO `yk_author` VALUES ('2607', '没有灵魂的人');
INSERT INTO `yk_author` VALUES ('2608', '青衣神');
INSERT INTO `yk_author` VALUES ('2609', '珞轩');
INSERT INTO `yk_author` VALUES ('2610', '安真');
INSERT INTO `yk_author` VALUES ('2611', '东门吹牛');
INSERT INTO `yk_author` VALUES ('2612', '幽幽南山');
INSERT INTO `yk_author` VALUES ('2613', '黑区君君');
INSERT INTO `yk_author` VALUES ('2614', '旋舞天涯');
INSERT INTO `yk_author` VALUES ('2615', '武大少');
INSERT INTO `yk_author` VALUES ('2616', '燧羽');
INSERT INTO `yk_author` VALUES ('2617', '一品果树');
INSERT INTO `yk_author` VALUES ('2618', '飞翔的雨水');
INSERT INTO `yk_author` VALUES ('2619', '长依');
INSERT INTO `yk_author` VALUES ('2620', '寂寞的少爷');
INSERT INTO `yk_author` VALUES ('2621', '醉yi逍遥');
INSERT INTO `yk_author` VALUES ('2622', '悲笛云天');
INSERT INTO `yk_author` VALUES ('2623', '忘情至尊');
INSERT INTO `yk_author` VALUES ('2624', '夜无风');
INSERT INTO `yk_author` VALUES ('2625', '不锈');
INSERT INTO `yk_author` VALUES ('2626', '番薯和西瓜');
INSERT INTO `yk_author` VALUES ('2627', '扮猫吃大猪');
INSERT INTO `yk_author` VALUES ('2628', '红尘逍遥小豆丁');
INSERT INTO `yk_author` VALUES ('2629', '单向辰');
INSERT INTO `yk_author` VALUES ('2630', '叶万青');
INSERT INTO `yk_author` VALUES ('2631', '血融');
INSERT INTO `yk_author` VALUES ('2632', '无敌邪君');
INSERT INTO `yk_author` VALUES ('2633', '一生有悔');
INSERT INTO `yk_author` VALUES ('2634', '天蓦然');
INSERT INTO `yk_author` VALUES ('2635', '走天下的熊');
INSERT INTO `yk_author` VALUES ('2636', '爱吃唐僧肉的猪八戒');
INSERT INTO `yk_author` VALUES ('2637', '冰城妖玉');
INSERT INTO `yk_author` VALUES ('2638', '潇洒刘');
INSERT INTO `yk_author` VALUES ('2639', '柳三随');
INSERT INTO `yk_author` VALUES ('2640', '逆凌天');
INSERT INTO `yk_author` VALUES ('2641', '三界财神');
INSERT INTO `yk_author` VALUES ('2642', '灵火凤凰');
INSERT INTO `yk_author` VALUES ('2643', '码字狂神');
INSERT INTO `yk_author` VALUES ('2644', '回力标');
INSERT INTO `yk_author` VALUES ('2645', '沙华2016');
INSERT INTO `yk_author` VALUES ('2646', '冠绝天下');
INSERT INTO `yk_author` VALUES ('2647', '元帝');
INSERT INTO `yk_author` VALUES ('2648', '烨虢');
INSERT INTO `yk_author` VALUES ('2649', '持刀的剑客');
INSERT INTO `yk_author` VALUES ('2650', '摘星亭');
INSERT INTO `yk_author` VALUES ('2651', '柒星');
INSERT INTO `yk_author` VALUES ('2652', '阿拉斯加');
INSERT INTO `yk_author` VALUES ('2653', '流辻');
INSERT INTO `yk_author` VALUES ('2654', '夜影');
INSERT INTO `yk_author` VALUES ('2655', '卯土');
INSERT INTO `yk_author` VALUES ('2656', '幕后执笔人');
INSERT INTO `yk_author` VALUES ('2657', '宫小宸');
INSERT INTO `yk_author` VALUES ('2658', '浪漫眼镜');
INSERT INTO `yk_author` VALUES ('2659', '难得睡懒觉');
INSERT INTO `yk_author` VALUES ('2660', '做梦无罪');
INSERT INTO `yk_author` VALUES ('2661', '白衣不再');
INSERT INTO `yk_author` VALUES ('2662', '月里风');
INSERT INTO `yk_author` VALUES ('2663', '轻樱有罪');
INSERT INTO `yk_author` VALUES ('2664', '轻风物语');
INSERT INTO `yk_author` VALUES ('2665', '思语');
INSERT INTO `yk_author` VALUES ('2666', '沈风眠');
INSERT INTO `yk_author` VALUES ('2667', '一叶梦凡');
INSERT INTO `yk_author` VALUES ('2668', '呓语说书人');
INSERT INTO `yk_author` VALUES ('2669', '凡人250');
INSERT INTO `yk_author` VALUES ('2670', '三门ser');
INSERT INTO `yk_author` VALUES ('2671', '留方千古');
INSERT INTO `yk_author` VALUES ('2672', '熊不醉');
INSERT INTO `yk_author` VALUES ('2673', '最爱羊杂汤');
INSERT INTO `yk_author` VALUES ('2674', '古烟云');
INSERT INTO `yk_author` VALUES ('2675', '风待雨落');
INSERT INTO `yk_author` VALUES ('2676', '玲记');
INSERT INTO `yk_author` VALUES ('2677', '大门牙小白兔');
INSERT INTO `yk_author` VALUES ('2678', '酒花过溪桥');
INSERT INTO `yk_author` VALUES ('2679', '疯子蓝');
INSERT INTO `yk_author` VALUES ('2680', '怀川十三');
INSERT INTO `yk_author` VALUES ('2681', '景龙池');
INSERT INTO `yk_author` VALUES ('2682', '拱极');
INSERT INTO `yk_author` VALUES ('2683', '墨骚');
INSERT INTO `yk_author` VALUES ('2684', '晴月勾弦');
INSERT INTO `yk_author` VALUES ('2685', '千壹方珂');
INSERT INTO `yk_author` VALUES ('2686', '半月寒');
INSERT INTO `yk_author` VALUES ('2687', '青衫醉酒');
INSERT INTO `yk_author` VALUES ('2688', '失墨影');
INSERT INTO `yk_author` VALUES ('2689', '一毫米的光');
INSERT INTO `yk_author` VALUES ('2690', '独爱金秋');
INSERT INTO `yk_author` VALUES ('2691', '海陈');
INSERT INTO `yk_author` VALUES ('2692', '泥寒');
INSERT INTO `yk_author` VALUES ('2693', '黑色无为');
INSERT INTO `yk_author` VALUES ('2694', '庄羽夜');
INSERT INTO `yk_author` VALUES ('2695', '无霜');
INSERT INTO `yk_author` VALUES ('2696', '龙凤翔');
INSERT INTO `yk_author` VALUES ('2697', '修之名');
INSERT INTO `yk_author` VALUES ('2698', '箫亦');
INSERT INTO `yk_author` VALUES ('2699', '张浩古');
INSERT INTO `yk_author` VALUES ('2700', '蓦物');
INSERT INTO `yk_author` VALUES ('2701', '蜀徒');
INSERT INTO `yk_author` VALUES ('2702', '我是大佬黑');
INSERT INTO `yk_author` VALUES ('2703', 'HOU');
INSERT INTO `yk_author` VALUES ('2704', '过留声');
INSERT INTO `yk_author` VALUES ('2705', '凶唱');
INSERT INTO `yk_author` VALUES ('2706', '祝龙腾');
INSERT INTO `yk_author` VALUES ('2707', '拽拽拽拽');
INSERT INTO `yk_author` VALUES ('2708', '毛不羁');
INSERT INTO `yk_author` VALUES ('2709', '此奇葩非彼奇葩');
INSERT INTO `yk_author` VALUES ('2710', '疯绳榜');
INSERT INTO `yk_author` VALUES ('2711', '牧马江南');
INSERT INTO `yk_author` VALUES ('2712', '海韵');
INSERT INTO `yk_author` VALUES ('2713', '景纯');
INSERT INTO `yk_author` VALUES ('2714', '青木婉歌');
INSERT INTO `yk_author` VALUES ('2715', '季处');
INSERT INTO `yk_author` VALUES ('2716', '禹仂');
INSERT INTO `yk_author` VALUES ('2717', '不在做梦');
INSERT INTO `yk_author` VALUES ('2718', '红色沃土');
INSERT INTO `yk_author` VALUES ('2719', '小呵');
INSERT INTO `yk_author` VALUES ('2720', '竹梓雅');
INSERT INTO `yk_author` VALUES ('2721', '九稚');
INSERT INTO `yk_author` VALUES ('2722', '小耗纸');
INSERT INTO `yk_author` VALUES ('2723', '公子小邪');
INSERT INTO `yk_author` VALUES ('2724', '落凉忆');
INSERT INTO `yk_author` VALUES ('2725', '墨子白');
INSERT INTO `yk_author` VALUES ('2726', '祭小尹');
INSERT INTO `yk_author` VALUES ('2727', '飘絮');
INSERT INTO `yk_author` VALUES ('2728', '木偶的心动');
INSERT INTO `yk_author` VALUES ('2729', '薄荷微依');
INSERT INTO `yk_author` VALUES ('2730', '我是俗人');
INSERT INTO `yk_author` VALUES ('2731', '季诗若');
INSERT INTO `yk_author` VALUES ('2732', '夜溪翎');
INSERT INTO `yk_author` VALUES ('2733', '荼蘼');
INSERT INTO `yk_author` VALUES ('2734', '西子月');
INSERT INTO `yk_author` VALUES ('2735', '古月依雪');
INSERT INTO `yk_author` VALUES ('2736', '仙仙小玲子');
INSERT INTO `yk_author` VALUES ('2737', '鲍鹏山');
INSERT INTO `yk_author` VALUES ('2738', '紫樨');
INSERT INTO `yk_author` VALUES ('2739', '小左1');
INSERT INTO `yk_author` VALUES ('2740', '严芳');
INSERT INTO `yk_author` VALUES ('2741', '邢墨鸢');
INSERT INTO `yk_author` VALUES ('2742', '南宫若锦');
INSERT INTO `yk_author` VALUES ('2743', '八熊');
INSERT INTO `yk_author` VALUES ('2744', '景丢丢');
INSERT INTO `yk_author` VALUES ('2745', '洛梦寻');
INSERT INTO `yk_author` VALUES ('2746', '冬至');
INSERT INTO `yk_author` VALUES ('2747', '若存');
INSERT INTO `yk_author` VALUES ('2748', '夜之魅色');
INSERT INTO `yk_author` VALUES ('2749', '玉米爱橙子');
INSERT INTO `yk_author` VALUES ('2750', '水袖人家');
INSERT INTO `yk_author` VALUES ('2751', '猪小小');
INSERT INTO `yk_author` VALUES ('2752', '焦糖吗啡');
INSERT INTO `yk_author` VALUES ('2753', '翩然云若');
INSERT INTO `yk_author` VALUES ('2754', 'YYL曼曼');
INSERT INTO `yk_author` VALUES ('2755', '川九');
INSERT INTO `yk_author` VALUES ('2756', '默菲');
INSERT INTO `yk_author` VALUES ('2757', '文宁');
INSERT INTO `yk_author` VALUES ('2758', '灿烂如初');
INSERT INTO `yk_author` VALUES ('2759', '三叶花');
INSERT INTO `yk_author` VALUES ('2760', '蓝颜岚');
INSERT INTO `yk_author` VALUES ('2761', '倾寻');
INSERT INTO `yk_author` VALUES ('2762', '月流光');
INSERT INTO `yk_author` VALUES ('2763', '懒虫MM');
INSERT INTO `yk_author` VALUES ('2764', '烟花蝶舞');
INSERT INTO `yk_author` VALUES ('2765', '希夏');
INSERT INTO `yk_author` VALUES ('2766', '日辰告白');
INSERT INTO `yk_author` VALUES ('2767', '原罪');
INSERT INTO `yk_author` VALUES ('2768', '星愿心晨');
INSERT INTO `yk_author` VALUES ('2769', '木凌袖');
INSERT INTO `yk_author` VALUES ('2770', '魔笛童子');
INSERT INTO `yk_author` VALUES ('2771', '诸葛灵霞');
INSERT INTO `yk_author` VALUES ('2772', '沧海浮生泪');
INSERT INTO `yk_author` VALUES ('2773', '邢春如');
INSERT INTO `yk_author` VALUES ('2774', '杨春光');
INSERT INTO `yk_author` VALUES ('2775', '王红旗');
INSERT INTO `yk_author` VALUES ('2776', '文军');
INSERT INTO `yk_author` VALUES ('2777', '电子科技大学党委宣传部编著');
INSERT INTO `yk_author` VALUES ('2778', '星座国际影视文化传媒(北京)有限公司原著');
INSERT INTO `yk_author` VALUES ('2779', '周攀堂');
INSERT INTO `yk_author` VALUES ('2780', '沈忱,崔文');
INSERT INTO `yk_author` VALUES ('2781', '老A');
INSERT INTO `yk_author` VALUES ('2782', '赵轶');
INSERT INTO `yk_author` VALUES ('2783', '贾平凹');
INSERT INTO `yk_author` VALUES ('2784', '大刺猬');
INSERT INTO `yk_author` VALUES ('2785', '叶永烈');
INSERT INTO `yk_author` VALUES ('2786', '唐七公子');
INSERT INTO `yk_author` VALUES ('2787', '紫瞳');
INSERT INTO `yk_author` VALUES ('2788', '移然');
INSERT INTO `yk_author` VALUES ('2789', '范·达因');
INSERT INTO `yk_author` VALUES ('2790', '【清】吴趼人、蓝鼎元');
INSERT INTO `yk_author` VALUES ('2791', '成杰');
INSERT INTO `yk_author` VALUES ('2792', '程露');
INSERT INTO `yk_author` VALUES ('2793', '【明】华阳散人');
INSERT INTO `yk_author` VALUES ('2794', '普希金');
INSERT INTO `yk_author` VALUES ('2795', '宗孝祖');
INSERT INTO `yk_author` VALUES ('2796', '永放');
INSERT INTO `yk_author` VALUES ('2797', '猎夫');
INSERT INTO `yk_author` VALUES ('2798', '隋晓明');
INSERT INTO `yk_author` VALUES ('2799', '严行方');
INSERT INTO `yk_author` VALUES ('2800', '任雪峰');
INSERT INTO `yk_author` VALUES ('2801', '吴学刚编著');
INSERT INTO `yk_author` VALUES ('2802', '王超');
INSERT INTO `yk_author` VALUES ('2803', '吕叔春编著');
INSERT INTO `yk_author` VALUES ('2804', '《健康生活图书》编委会');
INSERT INTO `yk_author` VALUES ('2805', '唐大晅,曹征,秦建国编著');
INSERT INTO `yk_author` VALUES ('2806', '陈长红');
INSERT INTO `yk_author` VALUES ('2807', '周丽霞');
INSERT INTO `yk_author` VALUES ('2808', '张剑扬');
INSERT INTO `yk_author` VALUES ('2809', '陈复平');
INSERT INTO `yk_author` VALUES ('2810', '陈鸿雁');
INSERT INTO `yk_author` VALUES ('2811', '释然');
INSERT INTO `yk_author` VALUES ('2812', '七七');
INSERT INTO `yk_author` VALUES ('2813', '王岩');
INSERT INTO `yk_author` VALUES ('2814', '《中外科幻故事丛书》编委会编');
INSERT INTO `yk_author` VALUES ('2815', '付艾琳');
INSERT INTO `yk_author` VALUES ('2816', '龙柒著');
INSERT INTO `yk_author` VALUES ('2817', '张民权著');
INSERT INTO `yk_author` VALUES ('2818', '张广明');
INSERT INTO `yk_author` VALUES ('2819', '陈晓丹');
INSERT INTO `yk_author` VALUES ('2820', '王俊');
INSERT INTO `yk_author` VALUES ('2821', '郑宏峰，张红');
INSERT INTO `yk_author` VALUES ('2822', '(以)史扶邻');
INSERT INTO `yk_author` VALUES ('2823', '周力，朱达秋');
INSERT INTO `yk_author` VALUES ('2824', '施造新');
INSERT INTO `yk_author` VALUES ('2825', '姜艳生；刘锦春');
INSERT INTO `yk_author` VALUES ('2826', '汪新,王相坤');
INSERT INTO `yk_author` VALUES ('2827', '周桂发，施宣圆，傅德华主编');
INSERT INTO `yk_author` VALUES ('2828', '宵主安，冯建中');
INSERT INTO `yk_author` VALUES ('2829', '宁登敖等编');
INSERT INTO `yk_author` VALUES ('2830', '韦苇编译');
INSERT INTO `yk_author` VALUES ('2831', '张凤娟,武振瑛');
INSERT INTO `yk_author` VALUES ('2832', '李香慧');
INSERT INTO `yk_author` VALUES ('2833', '南京梦幻卡通有限责任公司');
INSERT INTO `yk_author` VALUES ('2834', '妈妈晒');
INSERT INTO `yk_author` VALUES ('2835', '贾宇');
INSERT INTO `yk_author` VALUES ('2836', '泪依');
INSERT INTO `yk_author` VALUES ('2837', '梨沫晨');
INSERT INTO `yk_author` VALUES ('2838', '宅男书生');
INSERT INTO `yk_author` VALUES ('2839', '杨子之爱');
INSERT INTO `yk_author` VALUES ('2840', '精豆');
INSERT INTO `yk_author` VALUES ('2841', '水草浮萍');
INSERT INTO `yk_author` VALUES ('2842', '主笔');
INSERT INTO `yk_author` VALUES ('2843', '呆小鱼');
INSERT INTO `yk_author` VALUES ('2844', '24k纯帥');
INSERT INTO `yk_author` VALUES ('2845', '凋零的雪');
INSERT INTO `yk_author` VALUES ('2846', '张先生会飞');
INSERT INTO `yk_author` VALUES ('2847', '苏素沂');
INSERT INTO `yk_author` VALUES ('2848', '不爱之恩');
INSERT INTO `yk_author` VALUES ('2849', '林轻尘');
INSERT INTO `yk_author` VALUES ('2850', '姚建康');
INSERT INTO `yk_author` VALUES ('2851', '清风');
INSERT INTO `yk_author` VALUES ('2852', '夏翦浅');
INSERT INTO `yk_author` VALUES ('2853', '周家小少');
INSERT INTO `yk_author` VALUES ('2854', '疯般神韵');
INSERT INTO `yk_author` VALUES ('2855', '响尾');
INSERT INTO `yk_author` VALUES ('2856', '水果鱼');
INSERT INTO `yk_author` VALUES ('2857', '《新农村建设青年文库》编编写组');
INSERT INTO `yk_author` VALUES ('2858', '李丹');
INSERT INTO `yk_author` VALUES ('2859', '张大可,主编');
INSERT INTO `yk_author` VALUES ('2860', '林可行');
INSERT INTO `yk_author` VALUES ('2861', '张春婵');
INSERT INTO `yk_author` VALUES ('2862', '马同斌');
INSERT INTO `yk_author` VALUES ('2863', '明珠万斛');
INSERT INTO `yk_author` VALUES ('2864', '小小马甲1号');
INSERT INTO `yk_author` VALUES ('2865', '卑贱书生');
INSERT INTO `yk_author` VALUES ('2866', '仙山血玲珑');
INSERT INTO `yk_author` VALUES ('2867', '冷冰寒');
INSERT INTO `yk_author` VALUES ('2868', '梁家三少');
INSERT INTO `yk_author` VALUES ('2869', '心星逍遥');
INSERT INTO `yk_author` VALUES ('2870', '石皮破');
INSERT INTO `yk_author` VALUES ('2871', '孤石痕泪');
INSERT INTO `yk_author` VALUES ('2872', '我需要好运');
INSERT INTO `yk_author` VALUES ('2873', '眼红DE');
INSERT INTO `yk_author` VALUES ('2874', '刀影孤途');
INSERT INTO `yk_author` VALUES ('2875', '一万个黄金圣斗士');
INSERT INTO `yk_author` VALUES ('2876', '水印月');
INSERT INTO `yk_author` VALUES ('2877', '寒渺');
INSERT INTO `yk_author` VALUES ('2878', '涂草');
INSERT INTO `yk_author` VALUES ('2879', '新月之舞');
INSERT INTO `yk_author` VALUES ('2880', '风月秋凌');
INSERT INTO `yk_author` VALUES ('2881', '希望你幸福');
INSERT INTO `yk_author` VALUES ('2882', '抛书人');
INSERT INTO `yk_author` VALUES ('2883', '木黑之恋');
INSERT INTO `yk_author` VALUES ('2884', '君问天');
INSERT INTO `yk_author` VALUES ('2885', '子非鱼');
INSERT INTO `yk_author` VALUES ('2886', '西派三伯');
INSERT INTO `yk_author` VALUES ('2887', '吟少');
INSERT INTO `yk_author` VALUES ('2888', '姜严');
INSERT INTO `yk_author` VALUES ('2889', '剑舞中原');
INSERT INTO `yk_author` VALUES ('2890', '醉惊锋');
INSERT INTO `yk_author` VALUES ('2891', '煅燃');
INSERT INTO `yk_author` VALUES ('2892', '火之吾人');
INSERT INTO `yk_author` VALUES ('2893', '任枕');
INSERT INTO `yk_author` VALUES ('2894', '小猪的奇迹');
INSERT INTO `yk_author` VALUES ('2895', '叶如锋');
INSERT INTO `yk_author` VALUES ('2896', '紫木万军');
INSERT INTO `yk_author` VALUES ('2897', '壹肚子坏水');
INSERT INTO `yk_author` VALUES ('2898', '幽冥殿小鬼');
INSERT INTO `yk_author` VALUES ('2899', '红发青春');
INSERT INTO `yk_author` VALUES ('2900', '我是石子');
INSERT INTO `yk_author` VALUES ('2901', '神秘的所长');
INSERT INTO `yk_author` VALUES ('2902', '吉他阿飞');
INSERT INTO `yk_author` VALUES ('2903', '均白');
INSERT INTO `yk_author` VALUES ('2904', '其时明月在');
INSERT INTO `yk_author` VALUES ('2905', '唯爱小花');
INSERT INTO `yk_author` VALUES ('2906', '长夜醉画烛');
INSERT INTO `yk_author` VALUES ('2907', '鹏北举');
INSERT INTO `yk_author` VALUES ('2908', '江南七寅');
INSERT INTO `yk_author` VALUES ('2909', '濑筱七');
INSERT INTO `yk_author` VALUES ('2910', '苍茏');
INSERT INTO `yk_author` VALUES ('2911', '风雪夜煮酒');
INSERT INTO `yk_author` VALUES ('2912', '草船少尉');
INSERT INTO `yk_author` VALUES ('2913', '梦里成仙');
INSERT INTO `yk_author` VALUES ('2914', '华盟');
INSERT INTO `yk_author` VALUES ('2915', '无常客');
INSERT INTO `yk_author` VALUES ('2916', '淡淡的幸福');
INSERT INTO `yk_author` VALUES ('2917', '东方冥');
INSERT INTO `yk_author` VALUES ('2918', '失控肆');
INSERT INTO `yk_author` VALUES ('2919', '白胖儿');
INSERT INTO `yk_author` VALUES ('2920', '右墨');
INSERT INTO `yk_author` VALUES ('2921', '飞奔的炸酱面');
INSERT INTO `yk_author` VALUES ('2922', '阿四老哥');
INSERT INTO `yk_author` VALUES ('2923', '边王');
INSERT INTO `yk_author` VALUES ('2924', '柴疏雪浅');
INSERT INTO `yk_author` VALUES ('2925', '冥越天狱');
INSERT INTO `yk_author` VALUES ('2926', '愿争天下');
INSERT INTO `yk_author` VALUES ('2927', '响马书生');
INSERT INTO `yk_author` VALUES ('2928', '荆洚晓');
INSERT INTO `yk_author` VALUES ('2929', '雨田廷');
INSERT INTO `yk_author` VALUES ('2930', '东风夜吹');
INSERT INTO `yk_author` VALUES ('2931', '鸥诺');
INSERT INTO `yk_author` VALUES ('2932', '子妄');
INSERT INTO `yk_author` VALUES ('2933', '唱歌的指尖');
INSERT INTO `yk_author` VALUES ('2934', '琳琅橙');
INSERT INTO `yk_author` VALUES ('2935', '翩跹公子');
INSERT INTO `yk_author` VALUES ('2936', '孔子归来');
INSERT INTO `yk_author` VALUES ('2937', '霞鳞');
INSERT INTO `yk_author` VALUES ('2938', '圭早');
INSERT INTO `yk_author` VALUES ('2939', '信飞鸟Nask');
INSERT INTO `yk_author` VALUES ('2940', '乱舞街区');
INSERT INTO `yk_author` VALUES ('2941', '鹤风情语');
INSERT INTO `yk_author` VALUES ('2942', '云鹤梅子');
INSERT INTO `yk_author` VALUES ('2943', '屡败屡战');
INSERT INTO `yk_author` VALUES ('2944', '听尘');
INSERT INTO `yk_author` VALUES ('2945', '鹿妖九九');
INSERT INTO `yk_author` VALUES ('2946', '风都天涯');
INSERT INTO `yk_author` VALUES ('2947', '商陆');
INSERT INTO `yk_author` VALUES ('2948', '无爱ぁ冷雨夜');
INSERT INTO `yk_author` VALUES ('2949', '魂殇之夜');
INSERT INTO `yk_author` VALUES ('2950', '浪战天涯');
INSERT INTO `yk_author` VALUES ('2951', '找花的懒狮子');
INSERT INTO `yk_author` VALUES ('2952', '梦千羽');
INSERT INTO `yk_author` VALUES ('2953', '铁无涯');
INSERT INTO `yk_author` VALUES ('2954', '不信天');
INSERT INTO `yk_author` VALUES ('2955', '萌人');
INSERT INTO `yk_author` VALUES ('2956', '虎平阳');
INSERT INTO `yk_author` VALUES ('2957', '贻笑');
INSERT INTO `yk_author` VALUES ('2958', '凡塔');
INSERT INTO `yk_author` VALUES ('2959', '领航箱包');
INSERT INTO `yk_author` VALUES ('2960', '抽烟的神父');
INSERT INTO `yk_author` VALUES ('2961', '莫强求');
INSERT INTO `yk_author` VALUES ('2962', '七重纱');
INSERT INTO `yk_author` VALUES ('2963', '五月残龙');
INSERT INTO `yk_author` VALUES ('2964', '真水無香');
INSERT INTO `yk_author` VALUES ('2965', '紫汐');
INSERT INTO `yk_author` VALUES ('2966', '梦中轻叹');
INSERT INTO `yk_author` VALUES ('2967', '西瓜糖糖');
INSERT INTO `yk_author` VALUES ('2968', '梧桐引凤来');
INSERT INTO `yk_author` VALUES ('2969', '千芊结');
INSERT INTO `yk_author` VALUES ('2970', '几世轻狂');
INSERT INTO `yk_author` VALUES ('2971', '陌影疏涵');
INSERT INTO `yk_author` VALUES ('2972', '苏九妃');
INSERT INTO `yk_author` VALUES ('2973', '灭绝师太');
INSERT INTO `yk_author` VALUES ('2974', '赵家小姐');
INSERT INTO `yk_author` VALUES ('2975', '八面妖狐');
INSERT INTO `yk_author` VALUES ('2976', '一帘媚阳');
INSERT INTO `yk_author` VALUES ('2977', '风炎葬惑');
INSERT INTO `yk_author` VALUES ('2978', '天上掉钱');
INSERT INTO `yk_author` VALUES ('2979', '流泪的云朵');
INSERT INTO `yk_author` VALUES ('2980', '唇齿微凉');
INSERT INTO `yk_author` VALUES ('2981', '水榭汀香');
INSERT INTO `yk_author` VALUES ('2982', '重三青阑');
INSERT INTO `yk_author` VALUES ('2983', '2013枫桥夜雪');
INSERT INTO `yk_author` VALUES ('2984', '冷素弦');
INSERT INTO `yk_author` VALUES ('2985', '祸国殃民');
INSERT INTO `yk_author` VALUES ('2986', '盗版月野兔');
INSERT INTO `yk_author` VALUES ('2987', '筱柔');
INSERT INTO `yk_author` VALUES ('2988', '煜舞');
INSERT INTO `yk_author` VALUES ('2989', '清歌流离');
INSERT INTO `yk_author` VALUES ('2990', '小玉凡飞');
INSERT INTO `yk_author` VALUES ('2991', '火火君');
INSERT INTO `yk_author` VALUES ('2992', '林静');
INSERT INTO `yk_author` VALUES ('2993', '半开莲生');
INSERT INTO `yk_author` VALUES ('2994', '恋清波');
INSERT INTO `yk_author` VALUES ('2995', '月盈');
INSERT INTO `yk_author` VALUES ('2996', '良辰千语');
INSERT INTO `yk_author` VALUES ('2997', '李落一');
INSERT INTO `yk_author` VALUES ('2998', '盼盼');
INSERT INTO `yk_author` VALUES ('2999', '果子姑娘');
INSERT INTO `yk_author` VALUES ('3000', '谜若桃夭');
INSERT INTO `yk_author` VALUES ('3001', '指尖眉梢');
INSERT INTO `yk_author` VALUES ('3002', '四月花');
INSERT INTO `yk_author` VALUES ('3003', '紫染轻歌');
INSERT INTO `yk_author` VALUES ('3004', '幽幽紫凰');
INSERT INTO `yk_author` VALUES ('3005', '紫心草莓');
INSERT INTO `yk_author` VALUES ('3006', '宁闫墨');
INSERT INTO `yk_author` VALUES ('3007', '溶月');
INSERT INTO `yk_author` VALUES ('3008', '岭南君');
INSERT INTO `yk_author` VALUES ('3009', '雪花盐');
INSERT INTO `yk_author` VALUES ('3010', '兰七染');
INSERT INTO `yk_author` VALUES ('3011', '鱼儿忧忧');
INSERT INTO `yk_author` VALUES ('3012', '杯中筹');
INSERT INTO `yk_author` VALUES ('3013', '辛城若');
INSERT INTO `yk_author` VALUES ('3014', '我是一株花');
INSERT INTO `yk_author` VALUES ('3015', '空屿');
INSERT INTO `yk_author` VALUES ('3016', '江临枫');
INSERT INTO `yk_author` VALUES ('3017', '夜魅凝痕');
INSERT INTO `yk_author` VALUES ('3018', '夏七夜');
INSERT INTO `yk_author` VALUES ('3019', '正华');
INSERT INTO `yk_author` VALUES ('3020', '微痕');
INSERT INTO `yk_author` VALUES ('3021', '驿马迫西行');
INSERT INTO `yk_author` VALUES ('3022', '唯漫');
INSERT INTO `yk_author` VALUES ('3023', '矢玥');
INSERT INTO `yk_author` VALUES ('3024', '荷岫');
INSERT INTO `yk_author` VALUES ('3025', '忽而半夏');
INSERT INTO `yk_author` VALUES ('3026', '暖流锦');
INSERT INTO `yk_author` VALUES ('3027', '蟹子');
INSERT INTO `yk_author` VALUES ('3028', '赵德江著');
INSERT INTO `yk_author` VALUES ('3029', '伏漫戈');
INSERT INTO `yk_author` VALUES ('3030', '萧枫,李慧编译');
INSERT INTO `yk_author` VALUES ('3031', '綦方中');
INSERT INTO `yk_author` VALUES ('3032', '李秀霞编著');
INSERT INTO `yk_author` VALUES ('3033', '松松，冯媛编绘');
INSERT INTO `yk_author` VALUES ('3034', '沈从文著');
INSERT INTO `yk_author` VALUES ('3035', '(清)袁枚');
INSERT INTO `yk_author` VALUES ('3036', '邢春如主编');
INSERT INTO `yk_author` VALUES ('3037', '冰洁');
INSERT INTO `yk_author` VALUES ('3038', '郑晓江著');
INSERT INTO `yk_author` VALUES ('3039', '赵红瑾');
INSERT INTO `yk_author` VALUES ('3040', '余永红');
INSERT INTO `yk_author` VALUES ('3041', '叶飞霞');
INSERT INTO `yk_author` VALUES ('3042', '高剑峰；苏晓峰');
INSERT INTO `yk_author` VALUES ('3043', '(英)亚瑟·柯南·道尔');
INSERT INTO `yk_author` VALUES ('3044', '【秦】吕不韦');
INSERT INTO `yk_author` VALUES ('3045', '【清】俞万春');
INSERT INTO `yk_author` VALUES ('3046', '【明】抱瓮老人');
INSERT INTO `yk_author` VALUES ('3047', '【战国】申不害');
INSERT INTO `yk_author` VALUES ('3048', '杨华堂');
INSERT INTO `yk_author` VALUES ('3049', '简墨');
INSERT INTO `yk_author` VALUES ('3050', '冷时峻');
INSERT INTO `yk_author` VALUES ('3051', '李渔');
INSERT INTO `yk_author` VALUES ('3052', '王峰');
INSERT INTO `yk_author` VALUES ('3053', '冯志远　');
INSERT INTO `yk_author` VALUES ('3054', '赖新元');
INSERT INTO `yk_author` VALUES ('3055', '苏伟');
INSERT INTO `yk_author` VALUES ('3056', '(美)希尔原');
INSERT INTO `yk_author` VALUES ('3057', '张怡超');
INSERT INTO `yk_author` VALUES ('3058', '东方智');
INSERT INTO `yk_author` VALUES ('3059', '陈飞龙');
INSERT INTO `yk_author` VALUES ('3060', '张湖德,马烈光');
INSERT INTO `yk_author` VALUES ('3061', '杨卓');
INSERT INTO `yk_author` VALUES ('3062', '杨嘉利');
INSERT INTO `yk_author` VALUES ('3063', '宋涛');
INSERT INTO `yk_author` VALUES ('3064', '郑毅');
INSERT INTO `yk_author` VALUES ('3065', '(美)罗素著');
INSERT INTO `yk_author` VALUES ('3066', '高红权');
INSERT INTO `yk_author` VALUES ('3067', '李绍雪');
INSERT INTO `yk_author` VALUES ('3068', '金城致');
INSERT INTO `yk_author` VALUES ('3069', '王露');
INSERT INTO `yk_author` VALUES ('3070', '赵汀阳');
INSERT INTO `yk_author` VALUES ('3071', '李通');
INSERT INTO `yk_author` VALUES ('3072', '张笑恒');
INSERT INTO `yk_author` VALUES ('3073', '王正伟');
INSERT INTO `yk_author` VALUES ('3074', '跃青');
INSERT INTO `yk_author` VALUES ('3075', '熊逸');
INSERT INTO `yk_author` VALUES ('3076', '古原');
INSERT INTO `yk_author` VALUES ('3077', '田中芳树著[日] 王玉真译');
INSERT INTO `yk_author` VALUES ('3078', '周红英');
INSERT INTO `yk_author` VALUES ('3079', '中共运城市委宣传部编');
INSERT INTO `yk_author` VALUES ('3080', '张兴斌，左新波');
INSERT INTO `yk_author` VALUES ('3081', '方则正');
INSERT INTO `yk_author` VALUES ('3082', '郭伟伟');
INSERT INTO `yk_author` VALUES ('3083', '赵宗琳著');
INSERT INTO `yk_author` VALUES ('3084', '吴文质，王清秀，张爽');
INSERT INTO `yk_author` VALUES ('3085', '郑清英');
INSERT INTO `yk_author` VALUES ('3086', '孔维民');
INSERT INTO `yk_author` VALUES ('3087', '张徐');
INSERT INTO `yk_author` VALUES ('3088', '冯跃跃');
INSERT INTO `yk_author` VALUES ('3089', '郑丽英');
INSERT INTO `yk_author` VALUES ('3090', '《幸福生活百分百》委会');
INSERT INTO `yk_author` VALUES ('3091', '孟陶宁等');
INSERT INTO `yk_author` VALUES ('3092', '秋实');
INSERT INTO `yk_author` VALUES ('3093', '道门老九01');
INSERT INTO `yk_author` VALUES ('3094', '邓天');
INSERT INTO `yk_author` VALUES ('3095', '孤皇寡帝');
INSERT INTO `yk_author` VALUES ('3096', '狂奔的蜗牛');
INSERT INTO `yk_author` VALUES ('3097', '名字不给力');
INSERT INTO `yk_author` VALUES ('3098', '看破尘缘');
INSERT INTO `yk_author` VALUES ('3099', '十月香');
INSERT INTO `yk_author` VALUES ('3100', '不醉灯');
INSERT INTO `yk_author` VALUES ('3101', '明晓溪');
INSERT INTO `yk_author` VALUES ('3102', '西西');
INSERT INTO `yk_author` VALUES ('3103', '把戏');
INSERT INTO `yk_author` VALUES ('3104', '一哥');
INSERT INTO `yk_author` VALUES ('3105', '烂漫爱你哦');
INSERT INTO `yk_author` VALUES ('3106', '里里薰');
INSERT INTO `yk_author` VALUES ('3107', '极恶之咒');
INSERT INTO `yk_author` VALUES ('3108', '九尾鲤');
INSERT INTO `yk_author` VALUES ('3109', '霜六');
INSERT INTO `yk_author` VALUES ('3110', '韩四爷');
INSERT INTO `yk_author` VALUES ('3111', '一浆');
INSERT INTO `yk_author` VALUES ('3112', '炽热星尘');
INSERT INTO `yk_author` VALUES ('3113', '吹牛笔');
INSERT INTO `yk_author` VALUES ('3114', '东皇戏时');
INSERT INTO `yk_author` VALUES ('3115', '司舞舞');
INSERT INTO `yk_author` VALUES ('3116', '不是蚊子');
INSERT INTO `yk_author` VALUES ('3117', '冰糖白开水');
INSERT INTO `yk_author` VALUES ('3118', '江南活水');
INSERT INTO `yk_author` VALUES ('3119', '暗夜幽殇');
INSERT INTO `yk_author` VALUES ('3120', '贤亮');
INSERT INTO `yk_author` VALUES ('3121', '云泪天雨');
INSERT INTO `yk_author` VALUES ('3122', '冷云邪神');
INSERT INTO `yk_author` VALUES ('3123', '山间老寺');
INSERT INTO `yk_author` VALUES ('3124', '温煦依依');
INSERT INTO `yk_author` VALUES ('3125', '繁华落尽');
INSERT INTO `yk_author` VALUES ('3126', '小娇大媚');
INSERT INTO `yk_author` VALUES ('3127', '我是木木');
INSERT INTO `yk_author` VALUES ('3128', '吴有音');
INSERT INTO `yk_author` VALUES ('3129', '青衫落拓');
INSERT INTO `yk_author` VALUES ('3130', '刘慈欣');
INSERT INTO `yk_author` VALUES ('3131', '只是小虾米');
INSERT INTO `yk_author` VALUES ('3132', '伪戒');
INSERT INTO `yk_author` VALUES ('3133', '渔火');
INSERT INTO `yk_author` VALUES ('3134', '五味酒');
INSERT INTO `yk_author` VALUES ('3135', '弧度');
INSERT INTO `yk_author` VALUES ('3136', '南瓜没有头');
INSERT INTO `yk_author` VALUES ('3137', '大篷车');
INSERT INTO `yk_author` VALUES ('3138', '恒公子');
INSERT INTO `yk_author` VALUES ('3139', '弹剑吟诗啸');
INSERT INTO `yk_author` VALUES ('3140', '小财迷');
INSERT INTO `yk_author` VALUES ('3141', '白落欢');
INSERT INTO `yk_author` VALUES ('3142', '纳兰海映');
INSERT INTO `yk_author` VALUES ('3143', '幺蛾子大人');
INSERT INTO `yk_author` VALUES ('3144', '阿彩');
INSERT INTO `yk_author` VALUES ('3145', '姽婳晴雨');
INSERT INTO `yk_author` VALUES ('3146', '月下微尘');
INSERT INTO `yk_author` VALUES ('3147', '花开彼岸');
INSERT INTO `yk_author` VALUES ('3148', '怡香');
INSERT INTO `yk_author` VALUES ('3149', '晴空蓝兮');
INSERT INTO `yk_author` VALUES ('3150', '李宗吾');
INSERT INTO `yk_author` VALUES ('3151', '匪我思存');
INSERT INTO `yk_author` VALUES ('3152', '张艺兴');

-- ----------------------------
-- Table structure for yk_book
-- ----------------------------
DROP TABLE IF EXISTS `yk_book`;
CREATE TABLE `yk_book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '书籍名称',
  `img` varchar(300) NOT NULL COMMENT '书籍图片',
  `type` varchar(50) NOT NULL DEFAULT '0' COMMENT '书籍类型',
  `menu` varchar(50) NOT NULL DEFAULT '0' COMMENT '所属分类',
  `remarks` varchar(500) NOT NULL COMMENT '书籍说明',
  `is_end` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否完结 1否 2 是',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间s',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1上架 2下架',
  `is_hot` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否热门推荐 1否 2是',
  `is_main` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否主打 1否 2是',
  `group` int(11) NOT NULL DEFAULT '37' COMMENT '所属分组',
  `author` int(30) NOT NULL DEFAULT '0' COMMENT '作者',
  `word_number` varchar(10) NOT NULL DEFAULT '0' COMMENT '字数',
  `fans` varchar(10) NOT NULL DEFAULT '0' COMMENT '人气',
  `source` int(11) NOT NULL DEFAULT '0' COMMENT '来源 0本站',
  `book_info_url` varchar(300) DEFAULT NULL COMMENT '数据详情数据地址',
  `score` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_home` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否首页显示 0 否 -1 精选 1 男 2 女 3 出版',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='书籍表';

-- ----------------------------
-- Records of yk_book
-- ----------------------------
INSERT INTO `yk_book` VALUES ('1', '权倾天下', 'https://cdn.ikanshu.cn/211/images/60430495.jpg', '27', '6', '\"我有一手高明的医术，结识达官贵人，皇帝的病只有我能治；我有一颗仁慈的心，博爱广大人民群众，皇帝的女人我也要爱；我有一腔浩然正气，征服官场和武林，皇帝的江山我也敢夺。穿越到架空的大清王朝，看莫小飞权倾天下！\"', '2', '1520321550', '1', '2', '1', '37', '1045', '45.14 万字', '1937', '0', '60430495', '0', '0');
INSERT INTO `yk_book` VALUES ('2', '入殓师', 'https://cdn.ikanshu.cn/211/images/80001592.jpg', '0', '9', '茅山弟子现迹都市，斩妖除魔第一人！', '2', '1520321550', '1', '2', '1', '37', '3093', '189.40 万字', '686', '0', '80001592', '0', '0');
INSERT INTO `yk_book` VALUES ('3', '七兽诀', 'https://cdn.ikanshu.cn/211/images/213860.jpg', '28', '2', '杀手出身的甄浩洋偶遇下爱上了组织要击杀的目标人物之女露露，露露的父亲最终没能逃过厄运，但由于两人之间的关系被组织得知，导致不得不背叛，可后果是严重的，两人纷纷离开人世，复活后的甄浩洋脑中仍然保留着记忆，他忘不了女友在死前被人侮辱的画面，忘不了女友即便是死也还在为了自己而落泪。', '2', '1520321551', '1', '2', '1', '37', '3094', '71.76 万字', '841', '0', '213860', '0', '0');
INSERT INTO `yk_book` VALUES ('4', '聚灵珠', 'https://cdn.ikanshu.cn/211/images/335094.jpg', '28', '2', '山村少年偶得神珠，从此踏上武道之路。魅惑魔女、圣洁仙子、妖娆精灵等，各色美女围绕身边。强大的魔界至尊、高贵的仙界帝王、诡异的妖界之主，一个个强大的存在也因他出现。为了生存，为了保护自己的女人，他周旋于这些强者之间，一步步踏上强者巅峰！', '2', '1520321551', '1', '2', '1', '37', '43', '263.91 万字', '1078', '0', '335094', '0', '0');
INSERT INTO `yk_book` VALUES ('5', '哥就是传奇', 'https://cdn.ikanshu.cn/211/images/222556.jpg', '27', '3', '布凡，一个同我们一样的平凡人。他本可以和他的初恋柳清雅相爱一生，白头偕老的。虽然没有名车、豪宅，但他们却能享受生活。他们的高中同学余希为了得到柳清雅，曾科为了超越布凡，共同设计了一场针对布凡的袭击。布凡在袭击中受了重伤，奄奄一息。就在这危急关头，主人翁前不久一次偶然机会认识的杨先生拯救了他。在昏迷了一周后，主人公布凡终于苏醒了。苏醒后的布凡一方面感谢杨先生的救命之恩，一方面急着想回家。可是，杨先生的一席话却让归心似箭的布凡忘记了回家，忘记了家人，忘记了柳清雅。他决定留在杨先生的身边……杨先生到底对布凡说了什么？杨先生的真实身份又是什么？柳清雅会回到布凡的身边吗？布凡将还会遇到怎样的女人呢？让我们一起跟随主人公布凡揭开这些谜底吧。去见证主人公在一次次斗争中逐步走入辉煌，成为所谓的商业巨子，政坛巨头，军界巨擘吧！……', '2', '1520321551', '1', '2', '1', '37', '3095', '150.29 万字', '3395', '0', '222556', '0', '0');
INSERT INTO `yk_book` VALUES ('6', '流氓法师', 'https://cdn.ikanshu.cn/211/images/80001638.jpg', '0', '5', '一个倒霉的网虫，被一个更倒霉的老头坑蒙拐骗，学习了最没用的空间魔法，最终成了最倒霉的魔法师，且看逸龙如何纵横花丛、笑傲异域……', '1', '1520321552', '1', '2', '1', '37', '3096', '229.79 万字', '806', '0', '80001638', '0', '0');
INSERT INTO `yk_book` VALUES ('7', '万能小道士', 'https://cdn.ikanshu.cn/211/images/351489.jpg', '0', '3', '三清山小道士林道，成年之日下山来到南昌，凭借所练心法和超强的学习技能，闯都市、游校园、混社会、踩敌人、建帝国，笑傲苍生', '2', '1520321552', '1', '2', '1', '37', '3097', '159.39 万字', '2585', '0', '351489', '0', '0');
INSERT INTO `yk_book` VALUES ('8', '大罗神戒', 'https://cdn.ikanshu.cn/211/images/60353002.jpg', '28', '2', '武道强者周云穿越大千世界，从随身的玉坠当中得到《地狱元胎经》，依靠玉坠吸收诸天万气，前世今生让他明白生命的可贵，为了追寻永恒不死的生命，周云斩灭上古强者，横扫大千世界，于万敌之中杀出一条血路踏上传说中的永恒界……神道等级：神变境，神海境，神丹境，神罡境，神王境，神皇境，神尊境，神玄境，半神境，神灵境。', '2', '1520321552', '1', '2', '1', '37', '3098', '84.80 万字', '2744', '0', '60353002', '0', '0');
INSERT INTO `yk_book` VALUES ('9', '暗夜王者', 'https://cdn.ikanshu.cn/211/images/60597935.jpg', '0', '7', '一场血雨拉开了末世的序幕！\r\n暗红色的天空之下，阳光成了永远的回忆，空气中充斥着血腥与暴戾的气息！\r\n为了生存，强者疯狂掠夺，弱者苟延残喘！\r\n秩序崩坏，一切都没有下限，\r\n为了乞求一块过期的面包，昔日清纯的妹子主动撩起了她的短裙……\r\n在黑暗的末日，主角携重生记忆而来，\r\n披着冷血的外衣，坚守在人类最后的战场……', '1', '1520321553', '1', '2', '1', '37', '3099', '127.88 万字', '96', '0', '60597935', '0', '0');
INSERT INTO `yk_book` VALUES ('10', '血族：我的公爵大人', 'https://cdn.ikanshu.cn/211/images/80001488.jpg', '0', '9', '我是个普通的高中生，我觉得我一辈子也就是一个普通的高中生了。但是，“它们”出现了。鬼神，妖魔，另一个世界，向我张开了双臂。当同学们在为男友女友焦头烂额时，我已经成为了吸血鬼的新娘。他告诉我，我们，是血族。', '2', '1520321553', '1', '2', '1', '37', '3100', '107.57 万字', '169', '0', '80001488', '0', '0');
INSERT INTO `yk_book` VALUES ('11', '圣龙图腾', 'https://cdn.ikanshu.cn/211/images/60920493.jpg', '0', '2', '龙，其形有九似。 　　头似驼，角似鹿，眼似兔，耳似牛，项似蛇，腹似蜃，鳞似鲤，爪似鹰，掌似虎。 　　先民氏族，以圣龙为图腾，延续火种，传承生命。 　　诸天万界，龙腾四海。 　　吾辈岂是池中物，一朝崛起，气吞山河亿万里。 　　……', '1', '1520321605', '1', '1', '1', '37', '362', '58.68 万字', '166', '0', '60920493', '0', '0');
INSERT INTO `yk_book` VALUES ('12', '烈火如歌', 'https://cdn.ikanshu.cn/211/images/60719062.jpg', '0', '18', '在最显眼处高高悬挂一张纯金打造的大榜，金光灿灿，吸引着每个进入的客人住足仰望。这就是品花楼的绝色名花排行榜。从上往下依次是品花楼当月最受欢迎十大名花的坐次。这会儿还不到迎客的时候，只有身着红色衣裳的如歌，在金榜下，仰着脑袋，边看边赞叹！精彩！绝妙！如歌猜测究竟是个怎样的天才想出的这个好主意。', '1', '1520321605', '1', '1', '1', '37', '3101', '10.99 万字', '1505', '0', '60719062', '0', '0');
INSERT INTO `yk_book` VALUES ('13', '不灭武尊', 'https://cdn.ikanshu.cn/211/images/240816.jpg', '0', '2', '一门被视为垃圾的功法，一个被同门视作废人的修炼狂人，在得到一枚阴阳玉佩之后，一切彻底改变。十倍修炼速度，令古飞一再突破武道极限。在这个武道已经没落，真正的武道奥义已经失传的腾龙大陆，且看古飞如何以武逆天，脚踏道术神通，拳打妖魔鬼怪，怀抱红颜绝色，成就不灭武尊！', '1', '1520321605', '1', '1', '1', '37', '2868', '1160.43 万字', '272780', '0', '240816', '0', '0');
INSERT INTO `yk_book` VALUES ('14', '军神大人很暴躁', 'https://cdn.ikanshu.cn/211/images/80002472.jpg', '0', '14', '白飞羽莫名其妙的被结婚，对方不但手段狠辣，脾气暴躁，还特别大男子主义。他先入为主的认为这场婚姻是白飞羽的阴谋，施展折磨报复恐吓威胁的各种手段。飞羽无奈扶额，老公大人，每天表演小儿科游戏真的好么？', '1', '1520321605', '1', '2', '1', '37', '3102', '39.50 万字', '710', '0', '80002472', '0', '2');
INSERT INTO `yk_book` VALUES ('15', '混沌剑神', 'https://cdn.ikanshu.cn/211/images/277067.jpg', '0', '2', '傲视群雄，俯瞰众生，成就一代完美逍遥剑神！剑尘，他是江湖公认的第一高手，一手快剑出神入化，所向披靡！却意外重生异世，于是他修圣力、练剑意，领悟全新绝技杀敌千里之外，且看他如何搅动乾坤，登顶异界！', '1', '1520321606', '1', '1', '1', '37', '2869', '672.93 万字', '475772', '0', '277067', '0', '0');
INSERT INTO `yk_book` VALUES ('16', '网游之暴走风神', 'https://cdn.ikanshu.cn/211/images/60806815.jpg', '0', '8', '天灵这款来历神秘的网络游戏的出现悄然改变了这个世界的格局。\r\n离家出走落难的楚天歌一无所知情况下参与了这个游戏，在里面鸿运羡人的借助九天风神诀混的顺风顺水。\r\n不过更没想到他有一天会因为这个游戏里的强大力量在现实里同样无人敢欺，受到众人仰慕，更是爆发惊人的异性吸引力', '1', '1520321653', '1', '2', '1', '37', '3103', '104.84 万字', '37', '0', '60806815', '0', '0');
INSERT INTO `yk_book` VALUES ('17', '一哥', 'https://cdn.ikanshu.cn/211/images/80002617.jpg', '0', '3', '我叫李军，被相恋数年的女友给无情抛弃。那天晩上，他当着我的面跟一个有钱人跑了。从此之后，我发誓我要混出头！', '1', '1520321653', '1', '2', '1', '37', '3104', '122.67 万字', '30', '0', '80002617', '0', '0');
INSERT INTO `yk_book` VALUES ('18', '九阴天师', 'https://cdn.ikanshu.cn/211/images/60798123.jpg', '0', '9', '张小小练就了一身捉鬼本领，本想捉个大鬼级别的来玩玩，但是却在古墓找到了公主幼齿，在诡山找到了冰山御姐。\n\n各种女鬼相继扑来，他们都想吃张小小。但是张小小深感无奈，家里美鬼堆成山，整天被她们吸血，他感觉都快被掏空了！鬼媳妇也吃醋了！\n\n恐怖！\n\n为了维护男人的尊严，看他如何调教萌鬼吧！', '1', '1520321654', '1', '2', '1', '37', '3105', '20.02 万字', '2', '0', '60798123', '0', '0');
INSERT INTO `yk_book` VALUES ('19', '北土美后', 'https://cdn.ikanshu.cn/211/images/60809415.jpg', '0', '11', '在历史中勾画，在希冀中挥洒，还尘埃女子一个梦中的繁华！\r\n她在宫外无忧地长大，正要面对世间的美好，却因为一道圣旨改变了初衷，经历了风起雨落叶抖花斜，当满目的荒沙成为一世的牵挂，当一身的霞光闪耀在汉都，可曾知晓她在北土与邪肆的他有过多少纠缠？\r\n（本属虚构，只为凝眸）', '1', '1520321654', '1', '2', '1', '37', '3106', '53.46 万字', '6', '0', '60809415', '0', '0');
INSERT INTO `yk_book` VALUES ('20', '超级地图', 'https://cdn.ikanshu.cn/211/images/60810868.jpg', '0', '3', '林宇同学本来普普通通，在负担不起高昂的补课费时面临退学的危险，意外之时，自己的宠物地图鱼变身了，它掌握着使用地图的能力。无良教师，城市恶霸，无耻家族全都被我踩在脚下！从此林宇人生走向了巅峰。', '1', '1520321654', '1', '2', '1', '37', '3107', '33.84 万字', '5', '0', '60810868', '0', '0');
INSERT INTO `yk_book` VALUES ('21', '风雨神剑录', 'https://cdn.ikanshu.cn/211/images/60810957.jpg', '0', '11', '九尾鲤的力作《风雨神剑录》\r\n她，武林公主，父母皆是当世大侠，为国为民，受世人敬仰…\r\n他，流浪孤儿，无父无母，浪迹江湖，乞讨为生…\r\n当刁蛮任性的武林公主遇上乖张邪肆的流浪孤儿，当天之骄女遇上落魄子弟，当珍珠遇上瓦砾会上演什么样的故事？是在家国爱恨中纠结，还是形同陌路亦或是殊途同归……', '1', '1520321655', '1', '2', '1', '37', '3108', '33.24 万字', '9', '0', '60810957', '0', '0');
INSERT INTO `yk_book` VALUES ('22', '驭灵传奇', 'https://cdn.ikanshu.cn/211/images/60810866.jpg', '0', '2', '一个心态正常的人穿越都能成为神\r\n但是一个懒人穿越注定还是懒\r\n除了动脑以外，杨云什么都不想做\r\n当然，如果不动脑也可以活着的话他甚至都不想动脑\r\n……\r\n在这个女人和杀戮并存的世界\r\n且看杨云如何依靠智慧和运气艰难地活下去吧', '1', '1520321655', '1', '2', '1', '37', '3109', '32.78 万字', '1', '0', '60810866', '0', '0');
INSERT INTO `yk_book` VALUES ('23', '庭月照落花', 'https://cdn.ikanshu.cn/211/images/60811487.jpg', '0', '12', '何为爱？何为情？多情只有春庭月，犹为离人照落花。这世间本来就有这么多的得不到和舍不得，找寻千年只为找到自己曾经以为的，可以再续的前缘。如果你也有解不开的，逃不掉的，忘不了的人，亦或是你被爱伤了身，伤了心，来这间药铺，你或许得不到良药医治，但是可以听几个故事，听完以后你会发现，原来，爱，微不足道，也硕大无朋。授权级别：签约作品作品类别：玄幻仙侠本周点击：0本月点击：0本周红包：0本月红包：0本周盖章：0本月盖章：0本周鲜花：0本月鲜花：0标签：人妖之恋前世今生', '1', '1520321655', '1', '2', '1', '37', '3110', '46.04 万字', '5', '0', '60811487', '0', '0');
INSERT INTO `yk_book` VALUES ('26', '乡村小神农', 'https://cdn.ikanshu.cn/211/images/80002343.jpg', '0', '3', '小农民获得神农传承，人生从此彪悍！\r身怀绝世医术，专治各种不服，眼带逆天透视，玩转香艳都市。\r妩媚村花要嫁给他，俏艳女老师爱上他，双胞胎美女对他不依不挠，还有那大都市中的傲娇总裁，绝美的校花……\r各色美女纷至沓来，贫困小山村也彻底变了样。', '1', '1520584268', '1', '2', '1', '37', '3113', '305.02 万字', '19075', '0', '80002343', '0', '-1');
INSERT INTO `yk_book` VALUES ('27', '火爆王妃不好惹', 'https://cdn.ikanshu.cn/211/images/80001425.jpg', '28,30', '2,18,25,5,8,11', '现代警花穿越异世，绑了朝廷都忌惮的头号江湖大人物，还对其进行百般羞辱，她发誓，如果不是庸医误诊她魂归西天了，她是绝对不敢惹上这么一个大魔头的！\r可明明说要将她碎尸万段的某大魔头，却对她穷追不舍\r楼兮瑾无语问苍天：有受虐狂谤我、欺我、辱我、笑我、轻我、贱我,非礼我，调戏我，我当如何处置乎? \r老天答：推倒攻之\r楼兮瑾：滚你芭蕉的推倒，他又不是受！！在后面偷听着的某大魔头挑眉：是不是兽，要身体力行才会知晓的。', '1', '1520584269', '1', '1', '1', '36', '3114', '149.51 万字', '2446', '0', '80001425', '0', '0');
INSERT INTO `yk_book` VALUES ('28', '丑妃祸国不殃民', 'https://cdn.ikanshu.cn/211/images/60733661.jpg', '0', '11', '前世，她瞎了狗眼，错把渣男贱女当亲人，害得云林两家满门抄斩。\r\n再世为人，她要逆天改命，祸乱天下！\r\n得神剑，收神兽，修仙诀，炼天下奇毒！\r\n灭渣男，虐贱女，害我全家者，我让你生不如死。重活一世，她哪怕貌若无盐，也要嚣张一生！\r\n他是传言中最冷清冷血的煜王，传说，见过他真面目的人都已经死了。\r\n可谁告诉她，这夜夜潜入她的闺房化身为狼的臭男人是谁？\r\n“煜王，你就不怕我毒死你全家？”\r\n“那太好了，娘子，咱们可以双修做雌雄双煞！”', '1', '1521108435', '1', '2', '2', '37', '1394', '156.29 万字', '3583', '0', '60733661', '0', '-1');
INSERT INTO `yk_book` VALUES ('29', '错入豪门：老公别碰我', 'https://cdn.ikanshu.cn/211/images/357332.jpg', '0', '14', '他的残忍，情人的挑衅，最终将她折磨的遍体鳞伤就在要放弃的时候，他却温柔对待。以为他爱上自己的时候，他却挽着别的女人高调结婚，甩给她一张离婚协议书！', '1', '1521108435', '1', '1', '2', '37', '977', '199.98 万字', '302388', '0', '357332', '0', '1');
INSERT INTO `yk_book` VALUES ('30', '美女董事长老婆', 'https://cdn.ikanshu.cn/211/images/50013314.jpg?v=1', '0', '3', '他曾经是国际秘密组织的首领之一，回国后成为一个吊儿郎当玩世不恭的计程车司机。一次仗义出手相救，不想却是飞来的艳遇，一夜激情，美女董事长老婆找上门来，还有随之而来的麻烦与阴谋……', '1', '1521108435', '1', '2', '2', '37', '3117', '351.58 万字', '192812', '0', '50013314', '0', '-1');
INSERT INTO `yk_book` VALUES ('31', '九星霸体诀', 'https://cdn.ikanshu.cn/211/images/60552190.jpg', '0', '2', '是丹帝重生？是融合灵魂？被盗走灵根、灵血、灵骨的三无少年——龙尘，凭借着记忆中的炼丹神术，修行神秘功法九星霸体诀，拨开重重迷雾，解开惊天之局。手掌天地乾坤，脚踏日月星辰，勾搭各色美女，镇压恶鬼邪神。江湖传闻：龙尘一到，地吼天啸。龙尘一出，鬼泣神哭。', '1', '1521108436', '1', '2', '2', '37', '374', '766.16 万字', '134561', '0', '60552190', '0', '-1');
INSERT INTO `yk_book` VALUES ('32', '仕途天骄', 'https://cdn.ikanshu.cn/211/images/50022651.jpg', '0', '3', '他才华横溢，武艺超群，却被上司打压，只能做一个普通科员。为红颜他冲冠一怒，教训色狼上司，被记大过，出门散心却意外救下被刺杀的省委书记……通天“官桥”纷至沓来，各色美女环绕身旁，看不凡小科员如何凭借一身正气、满腔热血，一步步登上仕途巅峰！', '1', '1521108436', '1', '2', '2', '37', '3118', '375.49 万字', '111958', '0', '50022651', '0', '-1');
INSERT INTO `yk_book` VALUES ('33', '修罗武神', 'https://cdn.ikanshu.cn/211/images/60003253.jpg?v=1', '0', '2', '论潜力，不算天才，可玄功武技，皆可无师自通。论魅力，千金小姐算什么，妖女圣女，都爱我欲罢不能。论实力，任凭你有万千至宝，但定不敌我界灵大军。我是谁？天下众生视我为修罗，却不知，我以修罗成武神。', '1', '1521167012', '1', '1', '2', '37', '363', '815.96 万字', '396315', '0', '60003253', '0', '-1');
INSERT INTO `yk_book` VALUES ('34', '一纸契约：总裁独宠傲娇妻', 'https://cdn.ikanshu.cn/211/images/80002824.jpg', '0', '13', '相恋多年的男友，原来是渣男。 和别人滚完床单，转身又下跪求苏茉帮他升职。 误入总裁房间，被吃干抹净，威胁签下一纸契约，没想到总裁叶明远却另有目的。 “协议到期了，我们的关系到此为止！”“这是新的协议，立刻给我签了！”', '1', '1521167013', '1', '1', '2', '37', '3138', '135.77 万字', '4720', '0', '80002824', '0', '-1');
INSERT INTO `yk_book` VALUES ('35', '疯狂农民工', 'https://cdn.ikanshu.cn/211/images/60647320.jpg', '0', '3', '夏建,被人戏称下贱。先是和村里的小寡妇闹绯闻，后因高中女同学和社会青年打群架而被学校开除，从此他流的是汗，  燃烧的是情。磨练算得了什么，阴谋，权势，黑道，统统玩转。请看他一个小小村官是如何脚扫险恶，手控官场，一路红颜的.', '1', '1521167013', '1', '1', '2', '37', '3139', '415.31 万字', '17590', '0', '60647320', '0', '-1');
INSERT INTO `yk_book` VALUES ('36', '总裁老公追上门', 'https://cdn.ikanshu.cn/211/images/80001414.jpg', '0', '14', '六年前，她毫不犹豫的带球跑，六年后，孩子的爸找上门。“要娶我们的妈妈，必须过我们这一关。”两个可爱到爆的孩子挡在她的面前。作为苏熙的儿子，苏梓宸苏梓轩誓死捍卫自家妈妈找到幸福的权利。而作为两个儿子的妈，苏熙只能叹气，儿子智商太高太聪明，终身幸福都要遭人管，不失为这世上最甜蜜的折磨！孩子他爸傅越泽，恨得咬牙切齿，两个小叛徒！等他抱得美人归，看他们给他等着！', '1', '1521167014', '1', '2', '1', '37', '3115', '166.51 万字', '150755', '0', '80001414', '0', '-1');
INSERT INTO `yk_book` VALUES ('37', '大小姐的近身神医', 'https://cdn.ikanshu.cn/211/images/60349695.jpg?v=1', '0', '3', '神秘少年林东自幼得名师真传，擅长透视炼丹之术，凭借非凡医术，纵横都市。英雄救美，惩治恶棍，教训宵小，调戏美女，桃花运挡都挡不住啊！', '1', '1521167014', '1', '1', '2', '37', '2070', '392.95 万字', '73363', '0', '60349695', '0', '1');
INSERT INTO `yk_book` VALUES ('38', '正道潜龙', 'https://cdn.ikanshu.cn/211/images/60880120.jpg', '0', '3', '', '1', '1521167014', '1', '1', '2', '37', '3132', '82.69 万字', '701', '0', '60880120', '0', '1');
INSERT INTO `yk_book` VALUES ('39', '武逆', 'https://cdn.ikanshu.cn/211/images/359087.jpg', '0', '2', '天武大陆，强者为尊。风家大少风浩，身怀虚武之躯，却被认为是修炼废柴，受尽屈辱！机缘巧合之下，风浩获得了一枚神秘古戒，得以逆转人生！他以异晶锻体，以麒麟为臂，以朱雀为翼，以玄武为身，以青龙为腿，以白虎为首，成就无上肉身。待得掌控虚武之时，碎灭乾坤，怒斩八方！', '1', '1521167015', '1', '1', '2', '37', '3131', '689.53 万字', '487326', '0', '359087', '0', '1');
INSERT INTO `yk_book` VALUES ('40', '女神的贴身司机', 'https://cdn.ikanshu.cn/211/images/80001569.jpg', '0', '3', '为了给女神解毒，江小鱼毅然奉献自己最珍贵的事物，没想到……', '1', '1521167015', '1', '2', '1', '37', '3133', '177.91 万字', '8313', '0', '80001569', '0', '1');
INSERT INTO `yk_book` VALUES ('41', '吞天记', 'https://cdn.ikanshu.cn/211/images/60560865.jpg', '0', '2', '炎黄古域，浩瀚无边，无尽岁月中诞生诸多太古仙妖，撕裂天地，超脱三界五行。更有万物神灵，天生神体，穿梭虚空，逆乱阴阳，无所不能。当今乃仙道盛世，万法通天，众生修道，妖孽横行！东吴太子吴煜，于绝境中得东方绝世战仙之衣钵，自此横空出世，逆天崛起。亿万世人心中，他是普渡众生的帝仙！漫天仙佛眼中，他是吞噬天地的妖魔！', '1', '1521167016', '1', '2', '1', '37', '362', '583.21 万字', '36975', '0', '60560865', '0', '1');
INSERT INTO `yk_book` VALUES ('42', '官道', 'https://cdn.ikanshu.cn/211/images/50005157.jpg', '0', '3', '向天亮出身农家，警官大学毕业，赶上了国家统一分配政策的末班车，可一心想当警察的他，名额却被别人顶替，阴差阳错的被分配到了市建设局。机关里面机关多，不好混呐。好在向天亮干一行爱一行，既来之则安之，那就干着试试呗。你有三十六计？咱就一计，将计就计，你有七十二招？咱就一绝招，左耳跳，有好事，咱接着，右耳跳，要坏事，咱躲着。', '1', '1521167016', '1', '2', '1', '37', '2594', '658.57 万字', '183472', '0', '50005157', '0', '1');
INSERT INTO `yk_book` VALUES ('43', '明贼', 'https://cdn.ikanshu.cn/211/images/60455957.jpg', '0', '6', '\"崇祯十一年，满清叩关，流贼复燃，汉家山河即将瓦解。一个马贼横空出世，平四方，启民智，兴工商，拓海外，拯救华夏危难，崛起中华民族。我们无法改变历史，但我们可以书写历史。\"', '1', '1521167016', '1', '2', '1', '37', '3134', '290.21 万字', '3998', '0', '60455957', '0', '1');
INSERT INTO `yk_book` VALUES ('44', '网游之纵横天下', 'https://cdn.ikanshu.cn/211/images/123325.jpg?v=1', '0', '8', '我本是一个不起眼的玩家，只因偶然救了一个美女，我的生活发生了天翻地覆的变化。游戏中，现实中，高手就是我，从此纵横天下！', '1', '1521167016', '1', '2', '1', '37', '32', '464.12 万字', '574642', '0', '123325', '0', '1');
INSERT INTO `yk_book` VALUES ('45', '都市圣手神医', 'https://cdn.ikanshu.cn/211/images/80002822.jpg', '0', '3', '林天本是公司里一个小员工，因陷害而被开除，就连老天都不给脸色，让他倒霉。 但无意中，林天激活祖上留下的玉佩，拥有无上医术。 能起死人肉白骨，更能杀人于无形。 他可拳打黑暗王者； 脚踢系统附身的草根； 打得过深山走出的妖孽少年； 干的过身负逆天功法的天才； 秒的了重生都市的至尊仙帝。 迷住最美的校花，调教最辣的女警，戏弄最冷的总裁，还有萌萌哒的小萝莉…… 他横扫一切，却是最强的神医！', '1', '1521167017', '1', '1', '1', '37', '3136', '105.94 万字', '750', '0', '80002822', '0', '1');
INSERT INTO `yk_book` VALUES ('46', '不死战神', 'https://cdn.ikanshu.cn/211/images/80000489.jpg', '0', '2', '叶家弟子叶尘偶有奇遇，获得十二枚上古图腾。每一枚图腾激活之后，都可以开启一项神秘能力，并且习得一本上古武学。从此以后，叶尘将不再是一名碌碌无为的外门弟子，而是一跃崛起，名扬天下，成为妖孽一般的存在。斩上古妖兽、夺无上重宝。入惊险秘境，战绝世强者。一段精彩纷呈的强者之路，尽在不死战神！', '1', '1521167017', '1', '1', '1', '37', '1834', '589.19 万字', '20598', '0', '80000489', '0', '1');
INSERT INTO `yk_book` VALUES ('47', '神级透视', 'https://cdn.ikanshu.cn/211/images/80002838.jpg', '0', '3', '都市青年叶一凡，被拜金女绿帽，却意外获得神奇透视功能。从此走上不同道路，不仅能够透视，双眼还能看到病气，治病救人，还能强身健体？竟然还能出现神奇功法，还能看见美女嘿嘿嘿！ 走上都市修炼之路。从此，叶一凡只有一句名言：“别在我眼前装逼，你会被打脸的。”', '1', '1521167018', '1', '1', '1', '37', '2591', '83.38 万字', '1392', '0', '80002838', '0', '1');
INSERT INTO `yk_book` VALUES ('48', '大明闲人', 'https://cdn.ikanshu.cn/211/images/60580722.jpg', '0', '6', '一个现代小职员穿越到大明后该怎么生活？当官？不好吧，一个两个的都是大脑袋啊，当官还不被玩死？造反？难度太高啊；经商？商人没地位啊；想活的潇洒、活的自由，那就，当个闲人吧。一个有势力的闲人！', '1', '1521167018', '1', '1', '1', '37', '3137', '249.41 万字', '1348', '0', '60580722', '0', '1');
INSERT INTO `yk_book` VALUES ('49', '绝世邪神', 'https://cdn.ikanshu.cn/211/images/80000437.jpg', '0', '2', '重生异世，放荡不羁的叶楚面对众多绝世天才，倾世红颜。他如何踏破苍穹，撼动诸天，世人仰望！', '1', '1521167018', '1', '1', '1', '37', '1274', '1207.07 万字', '140346', '0', '80000437', '0', '1');
INSERT INTO `yk_book` VALUES ('50', '绝世武神', 'https://cdn.ikanshu.cn/211/images/80002419.jpg', '0', '2', '现代小子步青云穿越到儒道为主的天道的世界，以《三字经》和《百家姓》双文开智，成文种武种，儒武双修；凝智慧之书，重演唐诗宋词，小说传纪。', '1', '1521167019', '1', '1', '1', '37', '3135', '271.45 万字', '568', '0', '80002419', '0', '1');
INSERT INTO `yk_book` VALUES ('51', '重生之凤祸江山', 'https://cdn.ikanshu.cn/211/images/80001076.jpg', '0', '11', '她是惊才绝艳的民女，他是冠绝天下的太子，她救了他，他与她立下白首之约，然而她千里入宫寻他，等待她的却是惨绝人寰的凌辱与死亡。一夕成骨，她怎能瞑目？附身重生，立地成魔，誓屠尽仇人，令他痛悔一生。然而深宫风云变幻，杀戮重重，在不断被揭开的谜团和真相之后，却是更多的阴谋与阻碍，无尽黑暗中可有她和他的未来？', '1', '1521167019', '1', '1', '2', '37', '2090', '173.91 万字', '4308', '0', '80001076', '0', '2');
INSERT INTO `yk_book` VALUES ('52', '独家专宠：青梅萌妻休想逃', 'https://cdn.ikanshu.cn/211/images/80001032.jpg', '0', '14', '她是小他十岁的青梅未婚妻，他从小疼她入骨，宠她如命，以至于把她宠的无法无天，胆敢背着他和别的男人约会。李佳人心虚的不停往后退，“致远，我今天真的没有和学长去约会，我们就是单纯的去压马路！”宁致远嘴角勾着邪笑，“哦，是吗？就只是压马路？”她连连点头，看着他修长的手指不紧不慢的解开他上衣的纽扣，白皙结实的胸膛暴露在她眼前，她下意识的咽了咽口水：“对对对！你别生气，不然我也陪你去压一回马路，那风景挺好的。”她话音才落，脑袋一阵眩晕，就被某人压于身下，他薄软的唇磨蹭着她的耳垂，在她耳边响起的声音低沉又好听，还夹杂着一丝暧昧。“不必了，比起压马路，我还是觉的压着你比较好……”', '1', '1521167019', '1', '1', '2', '37', '3140', '141.76 万字', '9728', '0', '80001032', '0', '2');
INSERT INTO `yk_book` VALUES ('53', '一纸契约，惹上冷情总裁', 'https://cdn.ikanshu.cn/211/images/80008762.jpg', '0', '13', '如果生父突然的离去，她被继母继姐给狼狈的赶出了家门，算人生一大悲哀！交往多年的男朋友和自己的闺蜜睡在一起，算不算她人生的二大悲哀！砸了车窗，招上一个不该惹的人，那么算不算她人生的三大悲哀！当三大悲哀齐聚，她沦为还债的东西。三年后，她强势归来，成为V.N财阀集团亚太地区总监。一相逢，商英齐聚的宴会上。她，美男簇拥。他，名媛环绕。众人鼓动，不顾她意愿的拉着她，翩翩起舞在只有他们两人的舞池中央。他鹰眸尖锐，扣着她的腰，在她耳边问道。“你是苏娆？”顺从靠在他的肩头，她淡定的轻笑，一脸故意：“是德川苏氏集团的曾经的大小姐吗？宋先生，真的很抱歉，你看错了，我叫温妮.简。”再相逢，酒店相遇。他步步紧逼，于是她被人狠狠摁在女厕所的墙上。“一千万，做我半年的晴人！”她优雅一笑，嘲讽尽显，“宋总，你追女人，就是用这样的老梗吗？轻佻的勾起他的下巴，处变不惊“两千万，你给我滚得远远地！”他说，苏娆，你是我这辈子唯一拿得起，却放不下的女人。他说，温妮，只要你一句话，我可以和你到白头。恨过，怨过，报复过，蓦然回首，那人却在灯火阑珊处。', '1', '1521167020', '1', '1', '2', '37', '3141', '113.82 万字', '1876', '0', '80008762', '0', '2');
INSERT INTO `yk_book` VALUES ('54', '一吻成瘾', 'https://cdn.ikanshu.cn/211/images/358089.jpg', '0', '14', '那一夜，她大胆热辣，缠绵过后，本以为两人不会再有交集，却在回国后再次重逢，而他的未婚妻，竟是自己同父异母的姐姐！', '1', '1521167020', '1', '2', '1', '37', '3142', '184.54 万字', '418212', '0', '358089', '0', '2');
INSERT INTO `yk_book` VALUES ('55', '嫡女风采', 'https://cdn.ikanshu.cn/211/images/80001754.jpg', '0', '11', '前世，她苦心孤诣辅助夫君，为他散尽家财，卑躬屈膝，机关算尽，甚至舍生忘死。待他功成名就，封侯拜相，她却成了弃子。十年夫妻，换来的是一场精心设计的阴谋，她被冠上杀子之罪，等待午门斩首。重生一世，她决心摒弃良知，剔除善心，化作一只为仇恨而活的厉鬼，只为了将仇人一一推入地狱。然而当一个人，在看清了她黑暗腐朽的内心，却依然肯将世上独一无二的温柔给予她，甚至毫无原则地守护她，这颗充满仇恨的毒草，是否能再开出爱的花？', '1', '1521167020', '1', '2', '1', '37', '3143', '139.63 万字', '13495', '0', '80001754', '0', '2');
INSERT INTO `yk_book` VALUES ('56', '帝凰之神医弃妃', 'https://cdn.ikanshu.cn/211/images/80000447.jpg', '0', '11', '她是无父无母任人欺凌的孤女，他是一人之下、万人之上的铁血王爷。她满身是伤，狼狈不堪；他遗世独立，风华无双。她卑微伏跪，他傲视天下。如此天差地别的两人，却阴差阳错地相遇…… 一件锦衣，遮她一身污秽，换她一世情深。21世纪天才女军医将身心托付，为这铁血王爷风华天下、舔刃饮血、倾尽一切，只求此生结发为夫妻，恩爱两不疑，却不想生死关头，他却挥剑斩断她的生路……', '1', '1521167021', '1', '2', '1', '37', '3144', '530.00 万字', '42126', '0', '80000447', '0', '2');
INSERT INTO `yk_book` VALUES ('57', '农园似锦', 'https://cdn.ikanshu.cn/211/images/60683478.jpg', '0', '11', '穿成渔村小萝莉，爹爹老实愚孝，娘亲病弱无力，兄姐弟弟年幼。爹重伤濒死时，一家人被狠心的爷奶大伯赶出来，饥寒交迫，家徒四壁……\r\n不怕！她有催生植物的五彩神石在手，前世卤味技能在握。看她八岁小萝莉，如何挑战古人味蕾，改良高产作物，成为名扬天下的育种小能手！', '1', '1521167021', '1', '2', '1', '37', '3145', '169.92 万字', '14410', '0', '60683478', '0', '2');
INSERT INTO `yk_book` VALUES ('58', '宠妾作死日常', 'https://cdn.ikanshu.cn/211/images/60676640.jpg', '0', '11', '人只有死过一次，才知道自己到底错过了什么，特别是在争斗不休的后院！完颜婉兮选秀前也是家人捧在手心里的宝，选秀后，一朝踏入皇家，她谨记母亲的教诲，敬重福晋，凡事谨小慎微，不出头，可谁曾想到她最终就败在了这份敬重和本分上。重回进府之初，名份已定，毫无选择的她再不想重蹈覆辙，既然敬重和本分得不到应有的待遇，那就索性做个恶人，快意恩仇。', '1', '1521167022', '1', '1', '1', '37', '3146', '201.90 万字', '1640', '0', '60676640', '0', '2');
INSERT INTO `yk_book` VALUES ('59', '隐婚是门技术活', 'https://cdn.ikanshu.cn/211/images/60560260.jpg', '0', '13', '她是高能新女性，怀才遭嫉，命犯小人。他是建筑设计高材生，新官上任，意气风发。一些过结，一场相亲，一次相求，她与他剪不断理还乱。他步步设计，引她步步沦陷。她说爱情不能当饭吃，结婚敢么？他说你肯嫁，我即刻就娶！他许她风光嫁，她要的却是一场隐婚。白天，她与他水火不容；晚上，他要她如胶似漆。加密的婚姻，他宠护，她恋慕，冷暖他知她晓。然，隐婚虽好，隐患不少！', '1', '1521167022', '1', '1', '1', '37', '3147', '246.21 万字', '4152', '0', '60560260', '0', '2');
INSERT INTO `yk_book` VALUES ('60', '凤凰错：替嫁弃妃', 'https://cdn.ikanshu.cn/211/images/80000454.jpg', '0', '11', '试问女子的容颜能有多值钱？她是先帝亲点的皇后，却在颜容半毁时被一纸圣旨从后变妃。一旨双嫁，绝色的妹妹代她入宫为后，而她远嫁给那少年封王，权倾朝野，冷酷残暴的雪亲王……新婚夜，他说她的容颜只配呆在马厩里，虽有王妃之名却只能任人奚落…他中毒命在旦夕，她不顾一切救他，只为让自己活有尊严……以妻子这名，行幕僚之实她伴在他身边，可在滚滚黄河之上他却冷眼看她跌入那万劫不复之地……', '1', '1521167022', '1', '1', '1', '37', '3144', '178.08 万字', '36216', '0', '80000454', '0', '2');
INSERT INTO `yk_book` VALUES ('61', '盛世宠妃', 'https://cdn.ikanshu.cn/211/images/80001173.jpg', '0', '11', '一朝穿越，却身中春药，误惹妖孽太子，庶妹夺夫，遭遇退婚，她落得一身轻松，可太子却步步紧逼，让她无处可逃……', '1', '1521167023', '1', '1', '1', '37', '2730', '107.78 万字', '5364', '0', '80001173', '0', '2');
INSERT INTO `yk_book` VALUES ('62', '好孕天降：落跑妈咪爹地追', 'https://cdn.ikanshu.cn/211/images/80002451.jpg', '0', '13', '一夜激情，为了心中所爱她终于疯狂一次设计了她和自己的抵死缠绵，五年不归，她落跑出国却不知自己肚子里已经有了多了两个孩子，低调回国，她以为自己隐秘的行为其实早就落在了男人的眼里，重重误会，她以为自己得到了爱情却又眼睁睁看着它的离去，这才知道自己错的离谱。重整行囊，她决定离开这个让她的心支离破碎的地方，却没想到——他坐在她面前笑得一脸温和，却让她不寒而栗：“怎么不跑了？偷了我的种还想再离开我？”她立刻看着早就倒戈的两个宝宝，气急败坏地决定再也不管他们独自一人离开，却被男人抱住在耳畔轻声说：“白晓，嫁给我，做我一辈子的公主好不好。”她羞红了脸，却还装腔作势张牙舞爪：“谁要嫁给你！”回应她的是一个缠绵又激情的吻。', '1', '1521167023', '1', '1', '1', '37', '3148', '161.65 万字', '1887', '0', '80002451', '0', '2');
INSERT INTO `yk_book` VALUES ('63', '长相思', 'https://cdn.ikanshu.cn/211/images/60589207.jpg', '0', '18', '桐华历时三年潜心写就，迄今最精彩、最动人言情力作。以山海经神话为背景，将虐心/浪漫/争斗/命运写到极致，百万读者翘首以盼。爱而不得，忘却不能……写不尽儿女情长，说不完地老天荒，恢宏的画卷，动人的故事，浩大的恩怨，纠结的爱恨。', '1', '1521167023', '1', '1', '2', '37', '576', '24.21 万字', '92196', '0', '60589207', '0', '3');
INSERT INTO `yk_book` VALUES ('64', '未央·沉浮', 'https://cdn.ikanshu.cn/211/images/60527186.jpg', '0', '18', '本书是一部以汉初为背景的长篇小说，故事从吕后掖庭特赦萧清漪并任命她去代国做家人子开始，而代王刘恒却用信任与聪慧的她结盟，相约携手共建帝王霸业。从此淡然的她一步步踏入权利巅峰，最后终于成为历经四朝，两握虎符西汉最荣耀的女人的传奇故事。', '1', '1521167024', '1', '1', '2', '37', '578', '31.76 万字', '1445', '0', '60527186', '0', '3');
INSERT INTO `yk_book` VALUES ('65', '政法书记', 'https://cdn.ikanshu.cn/211/images/60560012.jpg', '0', '18', '本作品描述了一个基层政法书记，在执法过程中遇到的惊人事件，以及事件背后的人性诡谲，政法书记也随时随地经受着利益的诱惑与良心的拷问。作品对人性的描写细致入微，故事情节紧扣人心，并表现出了基层政法书记为维护法律尊严做出的努力与牺牲，是一部不可多得的反腐力作。', '1', '1521167024', '1', '2', '1', '37', '573', '25.92 万字', '1612', '0', '60560012', '0', '3');
INSERT INTO `yk_book` VALUES ('66', '纯情与肉欲', 'https://cdn.ikanshu.cn/211/images/60504043.jpg', '0', '22', '', '1', '1521167024', '1', '2', '1', '37', '1202', '7.06 万字', '10825', '0', '60504043', '0', '3');
INSERT INTO `yk_book` VALUES ('67', '良辰讵可待', 'https://cdn.ikanshu.cn/211/images/320855.jpg', '0', '18', '她携有情郎择日待嫁，他成为传媒大亨衣锦荣归。原以分离已是定局，然而再次相逢，记忆翻涌无力可挡。', '1', '1521167025', '1', '2', '1', '37', '3149', '16.84 万字', '60947', '0', '320855', '0', '3');
INSERT INTO `yk_book` VALUES ('68', '厚黑学', 'https://cdn.ikanshu.cn/211/images/60550566.jpg', '0', '18', '以“台北图书馆”镇官精品《厚黑学》完整手稿为底本整理出版。从字里行间真正感悟李宗吾原版《厚黑学。的精髓，台湾著名历史学家许倬云先生亲自为本书作序，此次出版还收录了林语堂、柏杨、南怀瑾为本书所写的序言。', '1', '1521167025', '1', '2', '1', '37', '3150', '18.23 万字', '88568', '0', '60550566', '0', '3');
INSERT INTO `yk_book` VALUES ('69', '人民的名义', 'https://cdn.ikanshu.cn/211/images/60733638.jpg', '0', '18', '一位国家部委的项目处长被人举报受贿千万，当最高人民检察院反贪总局侦查处处长侯亮平前来搜查时，看到的却是一位长相憨厚、衣着朴素的“老农民”在简陋破败的旧房里吃炸酱面。当这位腐败分子的面具被最终撕开的同时，与之案件牵连甚紧的H省京州市副市长丁义珍，却在一位神秘人物的暗中相助下，以反侦察手段逃脱法网，流亡海外。案件线索最终定位于由京州光明湖项目引发的一家H省国企大风服装厂的股权争夺，牵连其中的各派政治势力却盘根错节，扑朔迷离。H省检察院反贪局长陈海在调查行动中遭遇离奇的车祸。', '1', '1521167025', '1', '2', '1', '37', '1469', '26.23 万字', '20088', '0', '60733638', '0', '3');
INSERT INTO `yk_book` VALUES ('70', '寂寞空庭春欲晚', 'https://cdn.ikanshu.cn/211/images/60562118.jpg', '0', '18', '热播剧同名原著，匪我思存经典力作，谱写清宫荡气回肠的帝王情殇。一曲箫簧合奏，引出一段悱恻虐心的旷世情缘。讲述康熙与浣衣女卫琳琅、才子纳兰容若之间的爱恨纠葛、剜心虐恋。天意拨弄，一错再错，一路行来，风雪多明媚少，终是梨花如雪空寂寞。', '1', '1521167026', '1', '2', '1', '37', '3151', '17.20 万字', '45562', '0', '60562118', '0', '3');
INSERT INTO `yk_book` VALUES ('71', '心理学与读心术', 'https://cdn.ikanshu.cn/211/images/60494959.jpg', '0', '23', '美国FBI超强阅人术，让你第一时间看透对方。潜伏心术大揭秘，识人眼光最犀利。趣味测谎术，与读者进行一场真心话大冒险，瞬间识别对方语言信息密码。神奇情报术，直击心理防线，教你如何让自己的内心变强大。', '1', '1521167026', '1', '1', '1', '37', '878', '14.12 万字', '47655', '0', '60494959', '0', '3');
INSERT INTO `yk_book` VALUES ('72', '而立24', 'https://cdn.ikanshu.cn/211/images/60563441.jpg', '0', '20', '本书为名人传记。《而立·24》讲述了张艺兴的责任、梦想、努力和坚定。他的24年，和所有人一样经历了充满春之朝气，夏之溽热，秋之丰盛，冬之变革的四季。书中采用24节气作为全书主线，以一年中的24个季节节点，对应张艺兴人生中的24个关键时刻。并用大篇幅的文字，来讨论成长、挫折、希望、理想、讨论对人生的思考、对爱的困惑，对未来的迷茫。春耕，夏种，秋收，冬藏。气随阳变，人与境转。这是我们所熟悉，但又不太熟悉的张艺兴，他代表从极大丰盛的物质世界，从变换的多元化精神世界，从多重选择多重诱惑的网络世界，成长起来的新一代的年轻人。', '1', '1521167027', '1', '1', '1', '37', '3152', '4.20 万字', '14548', '0', '60563441', '0', '3');
INSERT INTO `yk_book` VALUES ('73', '那片星空，那片海', 'https://cdn.ikanshu.cn/211/images/60589031.jpg', '0', '18', '著名畅销书作家桐华的最新长篇都市情感小说。因为爷爷的病逝，沈螺回到了自小生活的海岛，她打算将爷爷留给她的老宅改造成一家客栈，离开城市的喧嚣，从此在这里生活下去。然而一个不速之客却突然出现在了沈螺的院子里，虽然这个名叫吴居蓝的男人来历不明，沈螺还是收留了他。不知不觉中，沈螺爱上了这个身上有着无数谜团的男人，他到底带着什么样的秘密来到沈螺身边，又会和沈螺发展出怎样的故事，拭目以待。', '1', '1521167027', '1', '1', '1', '37', '576', '21.91 万字', '14423', '0', '60589031', '0', '3');
INSERT INTO `yk_book` VALUES ('74', '乡村教师', 'https://cdn.ikanshu.cn/211/images/203318.jpg', '0', '18', '一个愚昧落后乡村里身患绝症的教师，用自己最后的生命之火带领着这个乡村的未来走出黑暗的愚昧，为这个乡村的孩子打开了知识的大门……他死后，意象不到的事情发生了，他的学生能使地球文明得到延续吗？', '1', '1521167027', '1', '1', '1', '37', '3130', '2.17 万字', '55140', '0', '203318', '0', '3');

-- ----------------------------
-- Table structure for yk_bookshelf
-- ----------------------------
DROP TABLE IF EXISTS `yk_bookshelf`;
CREATE TABLE `yk_bookshelf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `book_id` int(11) NOT NULL COMMENT '书籍id/章节id',
  `time` int(11) NOT NULL COMMENT '添加时间',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型 1书架 2标签',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='书架表';

-- ----------------------------
-- Records of yk_bookshelf
-- ----------------------------

-- ----------------------------
-- Table structure for yk_book_chapter
-- ----------------------------
DROP TABLE IF EXISTS `yk_book_chapter`;
CREATE TABLE `yk_book_chapter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL COMMENT '章节',
  `name` varchar(255) NOT NULL COMMENT '章节名称',
  `content` mediumtext COMMENT '内容',
  `time` int(11) NOT NULL COMMENT '添加时间',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '章节类型 1免费 2vip',
  `num` int(11) DEFAULT '1' COMMENT '章节',
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1039 DEFAULT CHARSET=utf8 COMMENT='书籍章节表';

-- ----------------------------
-- Records of yk_book_chapter
-- ----------------------------
INSERT INTO `yk_book_chapter` VALUES ('1', '1', '第1章', '', '　　莫小飞穿越了，要说上一世还有什么遗憾，那便是在全国妙手神医的竞赛中屈居亚军。\r\n　　莫小飞的医术很高，中西医融会贯通无所不精，就算是妇科、产科也有很深的造诣。\r\n　　年纪轻轻便获得国内各项荣誉，就连国外一些超高难度的手术也会邀请他一同会诊，人送美誉——杏林第一人！\r\n　　如此妙手回春的高手，怎么会输掉了比赛，“人生若只是初见，何事秋风悲画扇，等闲变却故人心，却道故人心易变”，原来皆因一个情字所扰。\r\n　　一举夺魁之人是莫小飞的同门师妹，两人青梅竹马长大，早已互私订终生，本以为比赛之后师妹便会嫁给自己永生私守，岂知事后师妹违背的承诺，跟一名富商出了国。\r\n　　酩酊大醉之后，莫小飞来到了这个未知的时代，除了寸步不离的药箱子，莫小飞一无所有。\r\n　　“弃我去者，昨日之日不可留，乱我心者，今日之日多烦忧。”\r\n　　莫小飞拖着十八岁的身体在下山途中想了很多，过去的事情就像流水般的一去不回，既然上天给自己一次新的生活，自己一定要珍惜，好好享受吧。\r\n　　穿越的感觉没太多特别，犹如从淤泥里拔出的身子彻彻底底洗了一次澡，离开了喧嚣，离开了疲惫，没有恩怨情仇，此刻是崭新的开篇。\r\n　　往往想象是美幻的，现实却是如此残酷。\r\n　　没有穿越者比莫小飞还倒霉，头一日从一座高山顶上走下，靠一条小溪之水填饱肚子，第二日总算是下山了，不过四处荒无人烟，莫小飞一度有些绝望，莫非这个世界只有自己一个智慧生物。\r\n　　想想别人穿越多么的华丽，要么重生至官宦之家，要么碰上贵人相助，莫小飞呢，他眼下只想确定这个世界还有活人。\r\n　　夕阳西下，莫小飞的肚子已经饥饿难忍，嘴唇干枯得浮现几道微小裂痕，莫小飞想回头上山，因为山上有一条小溪可以保证他多活几日，人都有活着的欲望。\r\n　　就在莫小飞犹豫之时，一道城墙的模糊影像出现在眼前，莫小飞揉了揉眼睛，瞪大看去，是城墙，千真万确的城墙！\r\n　　莫小飞笑了，抚着腑下所夹的药箱，莫小飞振奋着精神，“好兄弟，看来我并不孤独，金戈铁马、江山如画的古代世界，我莫小飞来了。”\r\n　　在一定程度上，莫小飞是有优势的，现代人的头脑和知识，随便一个想法便可一鸣惊人，从此鹤立鸡群、平步青云，拯救苍生于水火。\r\n　　如果能用黑来形容莫小飞的与众不同，那便是那掉进煤炭之中也能被人一眼认出来的超级黑！\r\n　　再不济，莫小飞也可以凭借一流的现代医术站住脚，富贾一方，拥美入怀，留芳一世。\r\n　　大睡正酣，靠在城墙边上的莫小飞笑容满面。\r\n　　“喂喂，醒了醒了，可以进城了。”\r\n　　莫小飞挨了重重两脚，用力睁开了眼睛，一名衙役头顶红缨盖帽，腰配刀具站在自己面前，红衣黑袖，衣服正中央位置写着一个“衙”字。\r\n　　是官差，莫小飞可以肯定，自己打不过他，也不敢打他，两脚算是白挨了。\r\n　　算了，斯文人怎么能和这些野蛮人计较呢。\r\n　　扶着厚厚的城墙站了起来，莫小飞“以德报怨”道，“谢过差大哥。”\r\n　　入乡随俗，人生地不熟莫小飞还得低调再低调，心里再有不满也不能表露出来。\r\n　　衙役的眼神很不屑，上下打量了一番，一副训斥的语气，“进城以后别瞎晃，要到钱填饱肚子便离开，晚上要宵禁，发现乞丐流落街头一律关进大狱里。”\r\n　　也许是因为莫小飞面生得很，所以衙役多提醒了一句。\r\n　　莫小飞怎么也没想到，自己不就是脏一些、臭一些，这气质和乞丐很像吗，没有再解释什么，莫小飞已经意识到了危机，要是天黑之前自己找不到落脚的地方，晚上还得睡城墙边来。\r\n　　此时几道身影擦肩而过，莫小飞被撞到了扇形城门的右侧，定眼一看，四个衣衫破烂的叫花子一捅而入。\r\n　　自嘲的摇了摇头，看着自己破旧的皮鞋，脏乱的衣衫，摸着三天未刮的硬硬胡须，头发有多乱蓬蓬莫小飞可以想象出来，不怪这位差大哥，任谁也会把自己当成讨饭之人。\r\n　　整个县城并不大，也就是一个井字形，从南到北最多两刻时间，街面上挺热闹，有杂耍的、有卖糖葫芦的、有追逐的小孩、有妙龄的女子、有提着鸟笼的公子哥……\r\n　　在县城里逛悠着，很快莫小飞发现了这个朝代的特点，男人都留着长辫子，穿着长袍马褂，看上去锦衣配玉的人都盖了一顶瓜皮帽，女人除了花盆似的高底鞋，便是看不出腰身的旗袍，还有小披肩搭在上身。\r\n　　街边的建筑以砖瓦为主，梁柱粗大，屋顶则是举折起翘，出翘形如鸟翼伸展，十分柔和优美。\r\n　　“夺朱非正红，异种也称王。”\r\n　　莫非这里是满州统治的大清王朝！\r\n　　但愿是一个太平盛世，没有那么多的内忧外患，否则，自己如何能将新的人生道路上潇洒走一回。\r\n　　肚子又开始咕咕作响，莫小飞的思绪回到了眼前，当前第一要务便是解决温饱问题。\r\n　　昨夜便想好办法了，一时半会儿没有人会找自己看病，不如找间茶馆，进去之后与老者儒士、青年俊才论论诗词歌赋，谈谈天下大势，很快便会有人欣赏自己，或是为自己解决伙食问题，或是为自己引荐工作。\r\n　　“县城里最大的茶馆就是这家了。”莫小飞比较再三，最后来到了一间茶馆门口喃喃自道。\r\n　　振奋起精神，露出和蔼亲切的笑容，迈着矫健的步伐，莫小飞踏上了四步阶梯，犹如迈出了新的人生。\r\n　　“站住，干嘛的。”一名肩披汗巾的店小二端端站在门口，别的人都没问，偏偏拦下了莫小飞。\r\n　　莫小飞目光如炬的看着店小二，表情有些动怒，看着店小二那种歧视的眼神，尖酸的嘴脸，莫小飞真想扇他一记耳光，自己虽然衣着破旧，但眉目之间的气宇轩昂你没发现吗，自己的身世举世无双何奇离谱，你一个茶馆倒茶跑堂的，也敢对自己这般大呼小叫。\r\n　　莫小飞忍了下来，此时并非自己鲁莽的时候，装出一副古代知识份子的样子，拱手答道，“茶馆大门开着，进去自然是品茗鉴曲、畅谈风雅和政事，不是如此，你认为如何。”\r\n　　店小二冷笑一声，嘲笑的指着莫小飞，道，“你以为你是谁呀，你这样的人我见多了，要么是讨饭要钱的，要么是进去借用茅房的，再不滚蛋，休怪老子不客气了。”\r\n　　说着说着，店小二抡起了衣袖，一副要打人的样子。\r\n　　“你！”\r\n　　莫小飞心里盘算了这么久，本想从这间茶馆踏出自己起航高飞的第一步，谁料一个店小二便如此势利将自己驱挡门外，各种贬低。\r\n　　秀才遇上兵有理说不清，自己虽然脏了些，可好歹也是名牌，名牌你们这些土鳖懂吗。\r\n　　“看那乞丐的衣着好奇怪，还背了个箱子，定是偷来的。”\r\n　　“是啊，居然没留辫子，也不知道干了什么坏事儿，被人给剪了吧。”\r\n　　捂着空荡荡的肚子，莫小飞一筹莫展的走在街头，好像每一步都是那样的沉重，回头率极高，莫小飞的奇装异服引来了很多人的指指点点。\r\n　　莫小飞有些面对现实了，自己堂堂妙手圣医，在这些人眼中怎如垃圾一般。\r\n　　“故天将降大任于是人也，必先苦其心志，劳其筋骨，饿其体肤，空乏其身……”\r\n　　想到孟子的话，莫小飞暗骂起来，自己再不吃东西就将和这个新世界永别了，大任来了也轮不上自己，这是什么垃圾理论。\r\n　　皱眉侧眼，望向前方不远处的两个石狮子，莫小飞很快发现这地方的不同，刚才路过还以为是什么大户人家，现在看来并非那样。\r\n　　红漆漆的大扇门敞开，两名衙役笔直的站在门口，目光炯炯观注着每一个路过之人，一副对联印入眼前。\r\n　　衙堂内威武肃静，方圆中一派祥和！\r\n　　县衙二字就在大红门的正上方中央位置，莫小飞有种找到组织的感觉，县委县政府到了！\r\n　　突然之间，胸口堵了很久的气长舒出来，快步上前，他需要找到县里的一把手把酒长谈，论政言制。\r\n　　莫小飞上前问道，“请问你们领导在吗？”\r\n　　一句本为平常的话，但讲出来莫小飞自己都觉得别扭，有种恰不适时、疑不适处的感觉。\r\n　　左右两名衙役互看一眼，其中一个看向莫小飞，“你是何人？”\r\n　　莫小飞愣了愣，意识到自己的话实在不妥，马上改口道，“哦，我乃山野中人，师傅为不出世的高人，不才学艺有成，奉师傅之命下山扶佐知县大人，为民谋福祉。”\r\n　　学着古代人的样，莫小飞拱了拱手，不撒谎忽悠两名衙役，怎么能见到知县大人，怎么能能展示自己的才华和能力。\r\n　　衙役一阵狂笑后，脸黑了下来，“哪里来的乞丐，要饭也不找对地方，这里是县衙，别说见知县大人，这道门你也休想进去！”\r\n　　门难进、脸难看、事难办，官场的丑陋在这小小县衙门口体现得淋漓尽致，莫小飞只后悔自己没有银两疏通贿赂。\r\n　　“我不是乞丐！”\r\n　　莫小飞不屈不挠的讲出了内心的呐喊，没有银两进不了门，尊严得维护。\r\n　　此时附近突然多出很多人，他们都在张望之后向一处地方小跑而去，还有人大声喊着，“包子铺的杜西施派包子了，快去排队吧！”\r\n　　“真是活观音在世啊，每月都会接济穷人，快走快走，晚了就没有了。”\r\n　　莫小飞哪里还顾得上和衙役辩解，一溜烟便加入了小跑抢食的队伍，一时间仅有的力量集中在腿部，见缝插针，推挤钻拉，莫小飞使出浑身劫数跑在了前头，以第二名的身份排在了一间包子铺前，香饽饽的肉包味道扑鼻而来，莫小飞神气的看了看后排的长龙，但很快便双眸黯然。\r\n　　前方一人和后方的十数人，竟然全部是乞丐！\r\n', '1520564813', '1', '1');
INSERT INTO `yk_book_chapter` VALUES ('2', '1', '第2章', '', '　　收拾起自己的悲伤，放下内心的傲然，也许在刚才的奔跑途中，莫小飞已经放下了面子，微微低下头，静静等着。\r\n　　“别挤别挤，后边儿来的人都排好队，今日的包子足够派发。”\r\n　　一个女子从包子铺里走了出来，轻轻拂开包子铺布制的招牌，站在一张木桌前，而木桌之上，摆放着数层蒸笼。\r\n　　莺鸣般美妙的声音令莫小飞情不自禁的凝神看去，这个女人便是杜西施吗。\r\n　　佳人着红色宽衣，广袖飘飘，青丝垂肩，面若桃花又似瑞雪出晴，目如明珠又似春水荡漾，袅娜纤腰不禁风，略施粉黛貌倾城，怎一个美字了得。\r\n　　杜西施一举一动仿若玉臂轻挥花落尽，令所有人屏住呼吸双眼迷离，此间竟有如此绝世的佳人。\r\n　　杜西施的眼神滑过整列人群，莫小飞在那相互对望的刹那，居然心跳加速面红耳赤，自问在电视上阅女无数，但从未见过这般绝色的女人。\r\n　　爱江山更爱美人，莫小飞此刻深深领悟了这七个字的含义，冲冠一怒为红颜绝不是历史上胡乱杜撰的。\r\n　　真是乌云盘绕遮玉体，九天仙女下瑶塌，莫小飞深深陶醉在杜西施的倩影当中。\r\n　　饥不可耐，莫小飞前头的乞丐领到包子的瞬间，便已经将包子塞进了嘴里，吃相十分生猛，杜西施见此人的饿状，又派发了一个。\r\n　　“谢谢活菩萨，谢谢活菩萨。”这名乞丐不停的点头感谢着。\r\n　　总算轮到莫小飞了，摩拳擦掌已久，对于过去种种吃包子吐皮的不良行为，彻底鄙视了一番。\r\n　　包子在莫小飞心中已经不是普通的食物，而是救命的稻草，此时的莫小飞绝对可以视黄金如粪土，填饱肚子再谋黄金。\r\n　　伸出黑丫丫的双手，莫小飞瞪大了眼睛，这是自己的手吗，莫小飞不想让美女看不起自己，心里有些退缩，手抖了抖，微微低着头，最终还是选择继续往前伸去。\r\n　　一双白皙纤细的玉手递过热腾腾的包子，莫小飞的心彻底融化了，滴水之恩当涌泉相报，只要自己有出头之人，一饭之恩必定投桃之报。\r\n　　“请问，我可以借杯水喝吗。”\r\n　　饿了这么久，要是马上狼吞虎咽吃下包子会被哽住的，穷也要有饮食规律，现在的状态，喝口水再吃会比较科学。\r\n　　杜西施并没有不耐烦，很快端来一碗水，细心讲道，“慢些喝，别咽着。”\r\n　　莫小飞抬起头来，看着杜西施细润如脂的脸，楚楚动人的微笑，明亮如洁的眼眸，心中顿时暖意流动。\r\n　　一碗水缓缓下肚，莫小飞用脏得发黑的衣袖抹了抹嘴角，将碗递给了杜西施，两人如此近的距离，莫小飞真希望这不是两人最后一次邂逅。\r\n　　拿着包子依依不舍的离开，三步一回头的看着杜西施为其他人派发包子，两人距离越来越远，莫小飞心里充满着凉意。\r\n　　“啊……，我的肚子……，好疼！”\r\n　　第一个领到包子吞下的乞丐突然间倒地，用力捧着肚子翻滚在地，脸面渐渐苍白，表情极为痛苦。\r\n　　莫小飞看了看手里的包子，暗道不好，莫非这包子里有剧毒！\r\n　　再看向杜西施时，她已面如死灰，花容失色捂住香唇，瞪大眼珠吃惊不已。\r\n　　莫小飞扔掉包子快步走过去，扶起这名乞丐，捧着他的脸，检查眼睛和嘴巴，之后严肃讲出一句结论性的话，“这人是中毒所致！”\r\n　　“妈的，谁都看得出来是中毒，你在这里装什么装！”\r\n　　“吃了包子铺的东西居然死人了，这是什么包子铺，黑店，草菅人命！”\r\n　　“蛇蝎心肠啊！砸了她的店，报官！”\r\n　　数十人冲上前去抛倒木桌，打砸店铺，白热的包子洒落四地，包子铺也随之一片狼藉。\r\n　　杜西施被人推倒在地，秀发散乱着，怜冤楚楚的受着众人指指点点。\r\n　　虽然杜西施赠与的毒包子自己没吃，但这份情谊莫小飞领下了，莫小飞不是愚民，这事情拍拍脑袋便能猜到，绝不是杜西施干的。\r\n　　若是杜西施真想杀人，也犯不着用这么蠢的办法吧，明目张胆光天化日，还把毒物送到别人手里，这不是在找死吗，显然这事情另有内情。\r\n　　眼见一个大巴掌就要扇到杜西施脸上，莫小飞立马上前拉住了那人的手臂，“你干什么！你有什么资格打人，还有你们，住手！你们全都住手！”\r\n　　大喝之下，大部分人还真停了手，四周安静下来。\r\n　　莫小飞知道这些人不讲什么道理，说什么他们也听不进去，要让心里的女神暂时安全，必须将这些人唬住。\r\n　　“你们还讲不讲王法，你们都是官差吗？这事情别说有蹊跷，就算真和杜西施有关，也得由官府来定夺，你们有什么资格砸店，有什么资格动手打人！私自使用暴力和刑法，取代官府的权力，我看你们都想进大牢了！”\r\n　　莫小飞这么一讲，还真把整个场面控制下来，这些人不过升斗小民，听到官府二字便双腿发软，不过想到包子有毒，差点儿都成了牺牲品，大家还是没有离开，将这里围成一个大圆圈，等着衙役前来。\r\n　　莫小飞扶起地上的杜西施，此时他不再感觉自己的手黑溜溜丢人，而是有力强劲。\r\n　　而杜西施也心生好感，四周最安全的地方便是莫小飞身边，于是不经意的将有些颤抖的柔美身子轻盈靠向莫小飞。\r\n　　微微弯腰，杜西施仔细打量着莫小飞，忧心如焚，呼吸急促的说道，“挽月谢过这位公子，事属突然，挽月确定不曾做过，也不知道毒从何来，福薄命薄，希望公子可以救救小女子。”\r\n　　挽月，杜挽月，好名字，优美如画。\r\n　　看着杜挽月眼眶晶莹水亮，几滴泪珠似要漫出，几束乱发拂过脸前，莫小飞心中怜惜无比，不知道哪里来的自信，双手将杜挽月右手抚在当中，莫小飞坚毅说道，“放心，我会保护你的。”\r\n　　如果说飞黄腾达是莫小飞的远期目标，那么帮助杜挽月洗刷冤屈便是此生的近期目标。\r\n　　不得不说，县衙的办事效率还是很高的，一刻的时间便来了五名衙役，其中一人的衣着明显和四人不同，而且满脸横肉，绝对是小孩子止哭的利器！\r\n　　此人上来便自报身份，“我是乌县巡检司巡检朱来福，这里毒死了人，杜挽月，都是你干的吧。”\r\n　　县城本就不大，但凡有些小名气的人便是路人皆知，所以朱来福知道杜挽月并不奇怪。\r\n　　看了看地上的尸体，朱来福已经不用再思考什么，直接下了判定，这倒是令莫小飞有些意外，典型的是非不分，若是认了命，这便是一桩冤案。\r\n　　莫小飞知道，清朝年间官分九品，而这巡检司的巡检大人，便是从九品最末的官员，但怎么说也是正二八经的编制内干部。\r\n　　巡检司相当于现代的公安局治安巡警队，而朱来福正是队长，这权力放在古代，更是大的可怕，很多小案子根本无需经过县衙正审，直接便由朱巡检给判了。\r\n　　杜挽月满含冤屈，道，“巡检大人，此事并非小女子所为，至于包子里为何有毒，小女子着实不知，还望大人明察，为小女子做主。”\r\n　　本是一年春来到，杜挽月照旧在年年此时行善举，谁知道会飞来如此横祸。\r\n　　朱来福一副铁面无私的样子，“此事事关重大，人命案我如何做主，杜挽月，跟我们走一趟县衙吧，一切凭知县大人发落，上铐带走！”\r\n　　莫小飞感觉到杜挽月的手用上了力道，她无助的拉着自己的手腕，仿佛放开了自己，她便成了孤魂野鬼一般。\r\n　　是时候挺身而出了，莫小飞强大的身躯挡在了杜挽月面前，“巡检大人，我看上铐就不必了吧，杜挽月乃弱小女子，如何能经受这般的折腾，况且她现在只是有嫌疑，并没有真正认定是凶手，她跟你们回县衙，是协助你们调查案子，并不是犯人。”\r\n　　朱来福皱了皱眉头，他的话在这街面上也是一言九鼎的，不管是不是凶手罪犯，他说上铐便没有人能大摇大摆走着去县衙，今天突然碰上了一个刺头。\r\n　　不过这个面生的家伙还是言之有理的，朱来福看了看莫小飞，道，“你是何人，与杜挽月什么关系。”\r\n　　莫小飞答道，“我是杜挽月……的远房表哥，在下莫小飞，此番到乌县是想和表妹叙叙旧，岂知发生此等祸事，我自然要为表妹申冤叫屈，还请巡检大人明鉴，彻查此事，还我表妹的清白。”\r\n　　人群中不知道什么时候钻出一人疑惑说道，“表哥也排队到表妹包子铺领包子，太逗了吧。”\r\n　　莫小飞的眼神像刀子一般看了过去，这个该杀的混蛋。\r\n　　见朱来福也起了疑心，莫小飞立马圆谎，“巡检大人，事情是这样的，我虽然作客表妹家，但路遇山贼身上的银两被抢光了，饿了两三天才到乌县，听闻这里有不花钱的包子，自然排队领取，方才刚认清包子铺的老板竟是表妹，惭愧惭愧。”\r\n　　朱来福好像并不在意莫小飞是谁，听莫小飞讲了一通失去耐心，吼道，“表哥怎么了，表哥一句话就不用上铐了吗，你是她表哥又不是我表哥！”\r\n　　“巡检大人，且慢！”\r\n　　朱来福有些不耐烦，凶恶讲道，“你还有什么要说的，是不是想一块儿被带走！”\r\n　　莫小飞指了指地上已经一动不动的乞丐，缓缓说道，“这人并没有死，待我先行救治。”\r\n', '1520564813', '1', '2');
INSERT INTO `yk_book_chapter` VALUES ('3', '1', '第3章', '', '', '1520564813', '1', '3');
INSERT INTO `yk_book_chapter` VALUES ('4', '1', '第4章', '', '', '1520564813', '1', '4');
INSERT INTO `yk_book_chapter` VALUES ('5', '1', '第5章', '', '', '1520564813', '1', '5');
INSERT INTO `yk_book_chapter` VALUES ('6', '1', '第6章', '', '', '1520564813', '1', '6');
INSERT INTO `yk_book_chapter` VALUES ('7', '1', '第7章', '', '', '1520564813', '1', '7');
INSERT INTO `yk_book_chapter` VALUES ('8', '1', '第8章', '', '', '1520564813', '1', '8');
INSERT INTO `yk_book_chapter` VALUES ('9', '1', '第9章', '', '', '1520564813', '1', '9');
INSERT INTO `yk_book_chapter` VALUES ('10', '1', '第10章', '', '', '1520564813', '1', '10');
INSERT INTO `yk_book_chapter` VALUES ('11', '1', '第11章', '', '', '1520564813', '1', '11');
INSERT INTO `yk_book_chapter` VALUES ('12', '1', '第12章', '', '', '1520564813', '1', '12');
INSERT INTO `yk_book_chapter` VALUES ('13', '1', '第13章', '', '', '1520564813', '1', '13');
INSERT INTO `yk_book_chapter` VALUES ('14', '1', '第14章', '', '', '1520564813', '1', '14');
INSERT INTO `yk_book_chapter` VALUES ('15', '1', '第15章', '', '', '1520564813', '1', '15');
INSERT INTO `yk_book_chapter` VALUES ('16', '1', '第16章', '', '', '1520564813', '1', '16');
INSERT INTO `yk_book_chapter` VALUES ('17', '1', '第17章', '', '', '1520564813', '1', '17');
INSERT INTO `yk_book_chapter` VALUES ('18', '1', '第18章', '', '', '1520564813', '1', '18');
INSERT INTO `yk_book_chapter` VALUES ('19', '1', '第19章', '', '', '1520564813', '1', '19');
INSERT INTO `yk_book_chapter` VALUES ('20', '1', '第20章', '', '', '1520564813', '1', '20');
INSERT INTO `yk_book_chapter` VALUES ('21', '1', '第21章', '', '', '1520564813', '1', '21');
INSERT INTO `yk_book_chapter` VALUES ('22', '1', '第22章', '', '', '1520564813', '1', '22');
INSERT INTO `yk_book_chapter` VALUES ('23', '1', '第23章', '', '', '1520564813', '1', '23');
INSERT INTO `yk_book_chapter` VALUES ('24', '1', '第24章', '', '', '1520564813', '1', '24');
INSERT INTO `yk_book_chapter` VALUES ('25', '1', '第25章', '', '', '1520564813', '1', '25');
INSERT INTO `yk_book_chapter` VALUES ('26', '1', '第26章', '', '', '1520564813', '1', '26');
INSERT INTO `yk_book_chapter` VALUES ('27', '1', '第27章', '', '', '1520564813', '1', '27');
INSERT INTO `yk_book_chapter` VALUES ('28', '1', '第28章', '', '', '1520564813', '1', '28');
INSERT INTO `yk_book_chapter` VALUES ('29', '1', '第29章', '', '　　这里果然只有乞丐可以居住，莫小飞还是很佩服这些乞丐的，人都是逼出来的，莫小飞感叹这句话的道理。\r\n　　乞丐窝约有十亩地，地上长满了杂草，垃圾随处可见，莫小飞走进这里，便闻到一股股恶心反胃的臭气。\r\n　　一张破草席或是几件破烂衣服平整摊开在地，这便是他们的床！\r\n　　为了遮阳挡雨，床上头自然有东西当作顶蓬，基本是系了很多木棍，上头搭着茅草和碎布料。\r\n　　惨，只能用惨字来形容，这些乞丐能在如此的环境下生存，实为不易，莫小飞有意识的拂袖于鼻前挡住臭味。\r\n　　此时乞丐窝的人特别多，都去王家酒楼参加了讨粥活动，所以吃过饭大家都回到窝里休息，莫小飞和廖大勇早被乞丐们当成了异类，各种眼神扫视着他们。\r\n　　“这位爷，脚挪一挪行不，您踩到我的碗了。”\r\n　　一名乞丐站在莫小飞面前，指了指莫小飞的左脚。\r\n　　莫小飞尴尬一笑，抬起脚来，一只摔坏仅有半边儿的瓷碗已经陷入草泥一半儿的面积。\r\n　　乞丐当即弯下腰来，轻轻拧住破碗的边沿，使劲儿将其扯出，用衣物蹭了蹭碗内将泥土刮出，又用手指擦遍了碗内所有的角落，最后嘴巴用力吐气，扬起的灰尘有的进了嘴里，有的进了眼里。\r\n　　“呸呸，呸。”\r\n　　乞丐一脸不满的表情，瞪了瞪莫小飞。\r\n　　莫小飞还是挺过意不去的，人家进食神物，竟被自己作践于脚下，连忙说道，“这位兄弟，确实对不住，都怪我眼睛不好使，我赔你个新碗如何。”\r\n　　乞丐拿着破碗便走开了，嘴里还振振有词，“吃惯了脏东西，换新碗不是想让我拉肚子吗。”\r\n　　廖大勇见莫小飞有些不习惯这里的环境，好心说道，“莫兄弟，要不你到外等候，我去把伍里河叫出来，你身子骨金贵，别受这罪。”\r\n　　既然答应来给乞丐看病，莫小飞自然不能太过矫情，于是放下衣袖，忍住心中那股别样的滋味，说道，“廖大哥，我第一次到乌县可是你把我从城墙边上给踹醒的，若不是我有些机缘，只怕这窝里也将是我的栖身之所，何来的金贵，别小看任何一个人，包括这里的乞丐，三十年河西三十年河东，风水可是轮流转的，走吧。”\r\n　　随便问了个乞丐，廖大勇很快问到了伍里河住的杂蓬，两人径直走去。\r\n　　和廖大勇形容的一般，伍里河的气质在乞丐群中独里挑一，一眼便可知晓他与众不同，举手投足有种傲气，眼神并不散乱，目光流光四射，且当中深沉含蓄，莫小飞可以认定，此人绝非乞丐，不知道他混进乞丐队伍当中有何目的。\r\n　　此时伍里河正在给几名乞丐讲着什么，话声同样传入了莫小飞的耳中。\r\n　　“你们明日一早上方老爷那里，他十日前说存粮有限没给咱们，让咱们十日后再去，想必明日新粮便可送到，不管上回是骗咱们也好，拖延时间也罢，你们得厚上脸面去讨，这样咱们也能有米自行下锅，方便数日。”\r\n　　“你带五个人去城北的面馆儿，他们整后之后明日便会重新开业，早些去一定能吃上，吃了就离开，别影响老板做生意。”\r\n　　接到“命令”的乞丐很快走开了，此时伍里河继续着他的分配，“让你把孩子照看好，人呢！”，伍里河正言厉色，盯着眼前一名乞丐。\r\n　　这名乞丐明显思维慢了半拍，摊开两只手掌上下旋转，扭着头目光再找寻着什么，一下子拍了拍手，“哦，伍哥，那孩子我交给其他人，现在应该是抱到河边洗澡去了吧，大热天的，小孩子可能有多动的毛病，就没停过动作，衣服全湿透了。”\r\n　　伍里河点了点头，“马上去看看，别粗心大意的，对了，小孩子不能像咱们大人一样吃脏东西，你明日的任务是讨钱，抚心阁那些姑娘们心肠还算不错，抱着孩子去，定能讨到口干净的饭菜。”\r\n　　莫小飞和廖大勇就站在一旁，其实伍里河也站注意到两人，分派完了任务，伍里河看了看身着锦衣便服的莫小飞，道，“差爷，你怎么又来了，这位爷不知道有何贵干。”\r\n　　伍里河可不会看走眼，两人站在一起谁是主谁是仆一眼便能分辨出来。\r\n　　廖大勇介举道，“伍兄弟，这位是我……”\r\n　　莫小飞用手碰了碰廖大勇，笑道，“伍兄你好，我是廖大哥的朋友，叫我莫小飞就行了。我廖大哥仁厚忠义，说你身体有恙，非拉着我来瞧瞧，不才小飞我对医术略懂一二，所以来看看能不能帮上什么。”\r\n　　“莫兄弟，你也太谦虚了，就我看呀，这世上就没你治不好的病，哈哈。”\r\n　　廖大勇可不是故意把莫小飞抬这么高，荆无声的事儿他多少知道一些，能化解奇毒之人，这世上还有能难全他的病吗。\r\n　　莫小飞白了一眼廖大勇，怎么能把话讲这么死，莫小飞自问可以解决除个别绝症外的所有疾病，不能立马治好也可以拖上几年的时间，但这大清朝中没有医疗设备，凭自己纯手工医治，部分病症自己也是束手无策啊。\r\n　　伍里河倒没往心里去，廖大勇能再次到来，还带了一位懂医术的人来帮助自己，心里已经很感激了，能不能救治不重要，有这份心已经是难能可贵。\r\n　　伍里河拜谢道，“差爷如此仁义，真是折煞伍某人，何德何能，怎堪受如此礼遇，伍某一个以乞讨为生之人，哪里受得起，要不还是免了吧，我怕脏了这些爷的手。”\r\n　　莫小飞对此人越来越有兴趣，刚才犹如韩信点兵一般的安排自如，此时又如此的谦逊，此人机智与品行都属上等，若是能深入了解一番，倒可考虑将他纳为己用。\r\n　　苏艺这个技术人才已经稳入囊中，只要再寻得一位管理人才，自己的私业便可以开门营业了。\r\n　　莫小飞很想知晓伍里河的过去，治好他的病便是两人沟通的桥梁，莫小飞说道，“伍兄不过推辞，既然我跟着廖大哥来到这里，便不会因为你的身份而对你另眼相看。”\r\n　　莫小飞双手负在身边，微微抬头直看蓝蓝的天空，“为医者,必当先具佛心，先医己心，而后医人，如果伍兄还要和小飞客气，那便是不尊重小飞，请伸出手来。”\r\n　　伍里河心里很畅快，能结识如此直爽之人真是有幸，没有再多言拒绝，坐在一个平整的大非天生头上，伍里河伸出了手，“烦劳莫兄弟一试。”\r\n　　莫小飞不再迟缓，很快搭上手去，一边把脉一边问着伍里河的各种症状。\r\n　　总结着伍里河所描述，莫小飞确认着，“感腹内有气，腹部胀痛，有流水响动声，想呕吐，平日排泄不通畅……”\r\n　　见伍里河一一确认点头，莫小飞已经有了结论。\r\n　　伍里河问道，“莫兄弟，我这是什么病，严重吗？”\r\n　　莫小飞收起手来，“伍兄，不是什么严重的病，不过不马上医治，不迅速调整，对你身体还是会产生一定影响的，你这病叫作肠梗阻。”\r\n　　伍里河显然没有听过这种病名，“肠更组？”\r\n　　莫小飞用古代人通俗的话讲解起来，“哦，其实就是肠内有瘴气，令食物在体内肠道的通行力减小，从而引来肠道和整个身体的一些病症变化。”\r\n　　最简单的治疗是通过土办法，找一些配好的药草服下便可，但储如木糖醇之类的药剂显然不好弄，所以只能用别的物品代表。\r\n　　莫小飞说道，“有油吗？”\r\n　　伍里河摇了摇头，“油？油灯里的油？”\r\n　　煤油？\r\n　　莫小飞反问道，“那种油可以吃吗？”\r\n　　“不能吃吧。嗯，难道可以吃吗？”伍里河也被绕了进去，不知道莫小飞是何意思。\r\n　　莫小飞吐了口长气，心里有种不成气的感觉，“伍兄，自然是不能吃的，我所指的油，是食用油，作为炒菜的调配所用，加工后的猪油、牛油、香油等等。”\r\n　　伍里河疑惑问道，“你的意思是这些油可以治我的病？”\r\n　　“是的，把你的肠子洗一洗、滑一滑，就这么简单。”\r\n　　捡起附近一个有缺口的碗，莫小飞继续说道，“倒上大半碗，缓缓服下，一日两次，数日后必有好转。还有，这几日少吃东西，少饮水，减轻食物对你腹部的冲击。”\r\n　　伍里河不懂这些，所以莫小飞作为大夫的角度，说什么他也得听，不过此时却是一副很为难的样子，良久才锤着手心言道，“可是莫兄弟，我上哪里去找油呢？”\r\n　　莫小飞反应过来，这里有盏油灯已经算乞丐窝中最为奢侈之物了，确实不能强求太多，算了，送佛送到西吧。\r\n　　莫小飞说道，“廖大哥，明日你送些油来给伍兄。”\r\n　　“好的莫兄弟，嘿嘿，伍兄弟，我没说错吧，我这兄弟厉害吧。”\r\n　　廖大勇挺高兴的，不仅伍里河的病已经找到了医治之法，还证明莫小飞的医术确实高超，他心里甚为喜悦。\r\n　　就在此时，一阵呱呱的婴儿啼哭声响起，宏亮有力，由远而近。\r\n　　一乞丐手捧着婴儿匆匆走上前来，“伍哥伍哥，孩子身子洗干净了，可闹得厉害，是不是身体不适。”\r\n', '1520564813', '1', '29');
INSERT INTO `yk_book_chapter` VALUES ('30', '1', '第30章', '', '　　这名乞丐很快看到了莫小飞，一副感激之色流露出来，“大夫，是您啊大夫！”\r\n　　原来这名乞丐正是在杜挽月包子铺上领取包子中毒之人，见到莫小飞心里很贴切，乞丐的命不值钱，死了也没有人会在意。\r\n　　不过自己的命只有自己珍惜，乞丐见到恩人内心万分感激，手里抱着婴儿仍然准备双膝触地。\r\n　　莫小飞赶紧上前扶了一把，“莫行此大礼，不过是举手之劳罢了，别把孩子给摔着。”\r\n　　伍里河见两人认识，莫小飞还救过李然之命，气氛此时更加融洽，四人相互介绍着，莫小飞也没有反驳李然对他大夫的称呼。\r\n　　伍里河告诉莫小飞，李然是这窝乞丐中手脚最为麻利之人，而且脑瓜子特别灵醒，鬼点子多。\r\n　　莫小飞很认同伍里河的观点，李然能不机灵吗，抢包子排到第一名，自己当时也是饿鬼附身，使出浑身的劲儿你追我赶的，最后才拿到第二名。\r\n　　莫小飞问道，“李然，你那些毒都吐出来了吧。”\r\n　　李然点了点头，“嗯，那天吐得我胃都发酸了，总算是把肚里的东西全吐出来了，一个没剩，对了莫大夫，看看这婴儿，哭得这么厉害，难不成患了什么病，我们刚把他带到河边洗了澡，穿好衣物他突然哭起来，我们急得不得了。”\r\n　　乞丐都有善心，莫小飞如何能见状不理，立马接过婴儿观察起来，不得不说这个婴儿十分乖巧可爱，圆圆有脸蛋白皙透红，整个身子肤色白嫩光滑，双眼有神，通过莫小飞的初步判断，结合古代封建思想和现代基因学原则来分析，这小子的父母绝对是英俊美貌，身份不凡。\r\n　　但不知出何原因，会将亲生骨肉遗弃，虽然这世道没太多的人情，但这帮乞丐说实在的，挺好。\r\n　　翻了翻婴儿的眼皮，摸了摸婴儿的手脚骨头，听着婴儿强有力的哭声，莫小飞笑道，“伍兄、李然，这小子无病无痛的，只是饿了，快快找些吃的来。”\r\n　　此言一出，几名乞丐互相对望，李然很快说道，“莫大夫，我们这里只有吃的没有奶，而且……而且东西都是脏乎乎的，不敢喂给孩子。”\r\n　　这孩子是昨晚宵禁后，李然走出城门在门口发现的，心好于是将其抱走，晚上喝了些水，但这不是办法呀，他吃什么呀。\r\n　　莫小飞之所以上世选择学医，便是他有一颗向善之心，大人可以饿上几顿，孩子可不行，婴儿更是不能缺少营养的输入，莫小飞说道，“廖大哥，县城里请哺乳的妇女给这孩子喂奶，一日四次，银子我出。”\r\n　　廖大勇点了点头，他心里有些过意不去，明明是好意拉着莫小飞给伍里河看病来着，结果又引来这事情。\r\n　　“行，我一会儿就去办。”\r\n　　李然跪倒在地，虽然与这婴儿只有一夜之缘，但不知为什么，心里把这婴儿看作自己的孩子，想到孩子肚子的饥饿，李然心里很痛心。\r\n　　莫小飞帮了孩子，李然再次感激，“莫大夫，您的大恩大德李然无以为报，以后若是您有什么事儿，李然愿舍身挡在前头！”\r\n　　莫小飞和廖大勇离开了，莫小飞回了县狱，廖大勇还得忙活油和奶妈的事儿，不过忙活一阵心里是开心的，能有莫小飞这种好人当自己的上司，廖大勇佩服之极，愿誓死追随。\r\n　　…………\r\n　　乌县有一位老爷和王有财的富财相当，谁更富有真不好定论，他便是方墨方老爷。\r\n　　方墨在乌县一直从事粮油盐生意，后来因为盐的利润较大，也不是百姓们饮食中必备之物，所以朝廷将盐生意收回，由官家来做。\r\n　　虽然生意被削去一大截，不过方墨的积累还是很丰厚的，整个乌县的大米供应几乎被其垄断。\r\n　　想涨就涨，想跌就跌，所以王有财听到伍里河提到乞丐窝之事以后，会有想法把那里买下种粮食，这样也可以不再看方墨的脸色。\r\n　　同样是县里的两大巨商，表面祥和，暗地里却各自有着算盘。\r\n　　方墨的粮食种在另一个小县城周边，他知道张怀安这人不好对付，于是选择了便宜的地方种粮，每月拉几大车到乌县，只是多付些运送费用，不需要给张怀安上缴什么银子。\r\n　　可是这一日却令方墨坐立不安，一早来报，从邻县送往乌县的粮食中途被山贼所劫，足够乌县半月供应的粮食就这么没了。\r\n　　亏银子不用说，这半个月还没有粮食可卖，可把方墨急成了蚂蚁，水也没喝一口，收到消息立马动身去了县衙。\r\n　　张怀安听闻之后，心中甚喜，过去便让方墨在城外包百亩田来耕作，可以执意不肯，这下出大事儿了吧，从县城外运粮进城里，绝对碰不上山贼。\r\n　　张怀安摸了摸他的大耳垂，说道，“方老爷，我前些年一直在劝你，在乌县种田划算，不仅减少你的麻烦，还可以少花银子，随时有粮可供。现在好了，粮食没了，乌县百姓这半月得省着吃了，我给你说啊，你这样做生意，害得乌县百姓无粮可吃，我身为知县是有权力处罚你的，罚你的银子知道吗。”\r\n　　方墨不敢反驳，张怀安这话明显是在威胁自己，若是自己有所不满，他定会以罪论处。\r\n　　语气再重还不是为了银子，方墨说道，“是啊，这次自己吃了大亏方知大人所言是为方某着想，所以方某此番特意前来拜访，希望知县大人能帮我两个忙，大人，事后方某必有重酬。”\r\n　　张怀安笑了笑，他这么聪明之人，怎么会立马答应。\r\n　　“方老爷，谁也不想碰上的事儿你给遇上了，作为乌县的知县，我是深感同情啊，县民有难，我自然尽力而助，但我这知县权力有限，你且讲来听听，我看看是否能帮上忙。”\r\n　　方墨了解张怀安的德行，这人就这样，一切以银子说话，方墨不到万不得已，真不会来求助张怀安，要说山贼狠，那么张怀安便更黑。\r\n　　方墨说道，“大人，我恳求大人临时征召义兵，和衙役一起去抓那些山贼，如果能找回我的粮食，我只要五成，剩下五成给弟兄们分掉，山贼窝里一切东西，可以任凭大人处置。”\r\n　　方墨很精明，他可不愿意此时就掏银子，若能从山贼窝里搜回自己的东西，分一半给县衙又何妨。\r\n　　张怀安认真想了想这提议，看似自己获利颇厚，实则劳民伤财，临时征召义兵不需要银子吗，山贼在附近横行了这么多年，自己犯得着去招惹吗，捅了马蜂窝又不能一举擒灭，跑几个亡命之徒，以后自己夜里怎么睡得安稳。\r\n　　不过这事情想来是一桩好事儿，剿灭山贼是早晚必行之事，此时图谋还算时机不错。\r\n　　张怀安说道，“嗯，你的提议我会慎重考虑，临时征召一批义兵，需要请示府衙，还需要省府、州府的钱银支持，我会尽快把文书上报的，你说有两件事情，还有一桩是何事。”\r\n　　方墨知道张怀安上头没什么强硬后台撑腰，所以他需要政绩。\r\n　　不过第二件事情方墨知道，没这么好过关了。\r\n　　“大人，城外乞丐窝附近有百姓耕种，我想把那一整片地给包下，连同乞丐窝，邻县租的田地确实有些不便，还是在乌县发展，我想大人定会支持吧。”\r\n　　主薄顾风此时推开了房门，见张怀安和方墨正在谈事儿，正欲退出，张怀安把他叫了进来。\r\n　　“顾主薄，来得正好，县里的银粮你在主管，方老爷正好有事儿商量，你也来听听，方老爷，顾主薄在行，你和他聊聊，我在旁听听。”\r\n　　张怀安对这事儿还真拿不定主意，因为方墨真把城外的田地都包下种粮，以后他可把粮食耕种和供应都捏在手里，这是好是坏张怀安一时还没分析出来，所以想听听顾风有什么想法。\r\n　　顾风听了之后，很快讲出他的想法，“大人，依我看，不妥。”\r\n　　方墨紧紧盯着顾风，因为顾风的意思很重要，眼下他却说不妥！\r\n　　张怀安笑了笑，刁难一番才有更多的利益，顾风真是很懂我意，一脸不解的问道，“哦，顾主薄，有何不妥，说来听听。”\r\n　　顾风说道，“乌县的土地就乞丐窝那一大片适合耕种，若是方老爷拿去，他以后可就掌握着县里的粮食命脉，我觉得吧，一家独大这样很不合理，方老爷还是继续在邻县耕种吧。”\r\n　　这也算是理由吗，方墨赶紧辩解起来，“顾主薄此言差异，就算我把乌县的粮食耕种和供应都掌握在手，可这价格我绝不会胡来，定会在朝廷限制的范围内浮动。再说说城外那片地，几户百姓耕种着，县衙能有什么税银收入，还有那乞丐窝，完全属于浪费，我也是为县里做好事儿。”\r\n　　“呵呵，也许方老爷还不知道，王有财王老爷也看上了那片地，他也准备做粮食供应买卖，有了竞争，县里的百姓也能得到好处，大人，您说是吧。”\r\n　　顾风看向张怀安，他今日一早便与王有财交谈了这事儿，还没来得及向张怀安禀报。\r\n　　张怀安拍了拍手，“好好，王胖子也有这兴趣，你们两家竞争，确实对县里的百姓来讲是桩美事儿，方老爷，我也不打算指定，要不这样，城外的那片地我让你和王有财竞价，谁出的银子多，县里就租给谁吧。”\r\n　　张怀安很满意自己最后的定论，这可是生财的好机会啊。\r\n', '1520564813', '1', '30');
INSERT INTO `yk_book_chapter` VALUES ('31', '1', '第31章', '', '　　每月县衙都会定期召开会议，总结上月的大事儿，商议下月的安排。\r\n　　莫小飞进了议事堂中，不客气的坐在了原来属于朱来福的椅子上，正对面是坐着顾风。\r\n　　顾风瞅了莫小飞一眼，也没说什么，如今莫小飞是……', '1520564813', '2', '31');
INSERT INTO `yk_book_chapter` VALUES ('32', '1', '第32章', '', '　　朱来福听了张怀安所讲，笑得嘴都合不拢，莫小飞深知朱来福只是个普通货色，绝不堪重用，而顾风却不同，处事不惊，分赃这事儿他听了之后面部没有任何的动容。\r\n　　张怀安不是什么英明的领导，就莫小飞来看，张……', '1520564813', '2', '32');
INSERT INTO `yk_book_chapter` VALUES ('33', '1', '第33章', '', '', '1520564813', '2', '33');
INSERT INTO `yk_book_chapter` VALUES ('34', '1', '第34章', '', '', '1520564813', '2', '34');
INSERT INTO `yk_book_chapter` VALUES ('35', '1', '第35章', '', '', '1520564813', '2', '35');
INSERT INTO `yk_book_chapter` VALUES ('36', '1', '第36章', '', '', '1520564813', '2', '36');
INSERT INTO `yk_book_chapter` VALUES ('37', '1', '第37章', '', '', '1520564813', '2', '37');
INSERT INTO `yk_book_chapter` VALUES ('38', '1', '第38章', '', '', '1520564813', '2', '38');
INSERT INTO `yk_book_chapter` VALUES ('39', '1', '第39章', '', '', '1520564813', '2', '39');
INSERT INTO `yk_book_chapter` VALUES ('40', '1', '第40章', '', '　　“青青啊，还在想昨日的事儿呀，听说午县丞都被关进了县狱，你再想什么也没用了，今日按说是想让你休息休息，不过有名官爷指名点你去陪，所以我只能再辛苦辛苦你。”\r\n　　吴姐也是情非得已，挺为难的，若不是官差点人，她直接便拒绝了，她靠手下这些姑娘们赚银子，除了赎身的条件不让步，平日里的生活也是关心备至。\r\n　　苏青青知道吴姐的难处，不过今日她确实没这心情接客，精神低迷，紧锁眉头，说道，“吴姐，能不能找别人替替，我这样子去了，只会讨客人不高兴。”\r\n　　吴姐也清楚这状况，去了怕官爷不高兴，但不去官爷也会不高兴，劝道，“青青，要不我给你半个时辰准备准备，我先应付着。”\r\n　　莫小飞知道苏青青可能有所不便，于是跟着吴姐到了门外，此时推开房门，“吴姐，要不就在这房里吧，嗯，挺香的，环境明亮优雅。”\r\n　　不是别人，苏青青看到是莫小飞之后，放下心来，“吴姐，你出去吧，这位官爷我来伺候。”\r\n　　吴姐皱眉看了看二人，关门离开。\r\n　　“你怎么来了，姐姐我可不伺候你，要找乐子找别人去。”\r\n　　苏青青明显有些尴尬，干上这行就得开门接客，不管客人是谁，可莫小飞是她好友的心仪相好，就算是敬酒喝曲苏青青也办不到。\r\n　　莫小飞自然是来查案的，不过当事人竟然是老熟人，不调戏一番怎么能未免气氛太沉闷，于是说道，“苏姐姐，你不伺候我，我可是会告诉吴姐的，你最好和小芳她们一样，在我怀里撒撒娇，任我的手测测你胸部和腰间的尺寸，说不定我还有打赏哦。”\r\n　　色眯眯的盯着苏青青的红唇、白颈，最后目光停留在她的双峰之上。\r\n　　苏青青有意识的捂住胸口，“小飞，我可是挽月的好姐妹，你可别胡来，我相信你不是这样的人。”\r\n　　莫小飞面色很猥琐，坐下之后将脚放在另一张凳子上，“进来前我确实没想过，但进来之后我发现吧，这抚心阁确实令人心神迷醉，尤其是还有熟人在这里做事，想着苏姐姐可以在我身边卖弄风情，我心里好一阵激动，于是指名点姓要你来陪我。来吧，愣着干嘛，先给我揉揉腿，呵呵，不该揉的地方你也能揉。”\r\n　　苏青青气得面红耳赤，顿时觉得心里堵了什么东西，做这行的规矩确实是不分客人是谁，可是莫小飞是自己好妹妹的心上之人，自己这么做未免有种强烈的罪恶感。\r\n　　苏青青想了想，轻轻走近之后，踢开了莫小飞搭在凳上的脚，“无耻！莫小飞，没想到你是这样的人，我绝不会为你做这些低贱的事情！”\r\n　　苏青青转身便欲离开，莫小飞忍住脚部疼痛，一把抓了过去，只听一声清细的撕裂声，苏青青的右肩和手臂全部显露出来。\r\n　　白皙、嫩滑，莫小飞加快了心跳速度，连忙摆手道，“苏姐姐，我不是故意的。”\r\n　　苏青青有些羞恼起来，用左手尽量去捂住右臂，“你！你这个恶棍流氓！你若要轻薄于我，我死也不从！”\r\n　　完全是误会，莫小飞不知道怎么解释，见苏青青气急想离开房间，干脆一把将她搂入杯里，此时可没功夫感受苏青青身体的香味和柔软。\r\n　　尽管苏青青开始大吼大叫起来，身体用力扭动着，可哪里能挣脱。\r\n　　莫小飞把苏青青抱到床边，一把将她按在床上，一只手捂住她的眼睛，看着她恐惧绝望的眼眸，道，“苏青青，开个玩笑而已，别这么小气，我不会把你怎么样的。”\r\n　　苏青青的双腿仍然在摆动，阴差阳错之下不小心触碰到莫小飞下体的硬物。\r\n　　能不硬吗，苏青青的样貌也不差，抱着她的身体对于青春骚动期的莫小飞来讲，那也是有一种诱惑的。\r\n　　床上躺住的苏青青双峰更加的突显，呼吸急促令双峰的起伏更加剧烈，莫小飞不是什么圣人，七情六欲和常人无样，他也怕把持不住，连忙凶道，“苏姐姐，我立刻把手放开，但你不许嚷嚷，否则别怪我撕开你你的衣物，真给你开开苞！”\r\n　　莫小飞缓缓挪开了手掌，吐了口气，等待莫小飞的是苏青青的飞腿，苏青青在抚心阁里不是没遇上过粗暴的客人，但莫小飞这么对她，她心中有种说不出的羞愧。\r\n　　内心深处苏青青产生了异样的变化，自己的身子也有过被别人紧抱的时候，但从未像刚才那般，心里仿佛有堆火正在燃烧。\r\n　　苏青青吼道，“莫小飞！你是个混蛋！”\r\n　　莫小飞捂了捂肚子，“我说苏姐姐，你的腿再往下一点，可是会折了我的命根啊，不开玩笑了，我刚才只是逗逗你的，我其实是来打听关于午县丞的事儿，谁让你这么小气，让你给我揉揉腿你便想离开。”\r\n　　莫小飞说完之后，退到了桌边坐下，以示自己没有别的歹意。\r\n　　苏青青平复着心情，见莫小飞恢复了正常的神色，方才说道，“那你刚才为何撕破我的衣衫，这是禽兽所为！”\r\n　　“谁想撕你衣物了，我见你要走，想把你拉回来坐下。”\r\n　　“是吗，那你怎么把我拉到了床上……”\r\n　　“我……”\r\n　　莫小飞愣了愣，道，“拉不住你，所以我才将你抱住，见你样子欲拒还迎的，我才抱你上床看看你是不是自己想做那事情……”\r\n　　“谁欲拒还迎了！”\r\n　　两人把刚才的事情嘴里重复了一遍，才缓缓入座，倒上茶之后，莫小飞说道，“苏姐姐，听说昨夜是你一直陪着午县丞，可有此事。”\r\n　　莫小飞心里想到一个办法，但必须在足够的条件下，还得让苏青青配合，方可解除午良家的危机。\r\n　　苏青青点了点头，“嗯，要不是姓午的酒后胡言，我怎么会照顾他到夜间，早知道他是个鬼穷，我早老便把他扔出抚心阁了。”\r\n　　苏青青的话半点儿不假，之所以照顾酒后晕迷的午良家，完全是为了自己赎身之事，岂知人算不如天算，他酒醒之后什么也不记得了，而且还说没银子。\r\n　　莫小飞继续问道，“那你送他离开时，可有人看到？”\r\n　　这个很重要，若是无人知晓，那苏青青便是唯一的知情者。\r\n　　“应该无人看到，你也知道县城内到了晚上得宵禁，子时三刻附近，我送午县丞离开的，街面上早没人影了，而抚心阁中过夜的客人都紧闭房门，所以我猜想并没人看到，怎么了？”\r\n　　苏青青可以肯定时辰，因为子时到了便得收取留宿之人额外费用，每晚到了子时，抚心阁中便会有一阵讨价还价之声，特别是吴姐的声音，别听白天温文尔雅，夜里谈价可是憋足了劲儿总要争执一番。\r\n　　子时三刻！\r\n　　莫小飞想到廖大勇在一路上对案件的描述，喃喃自道，“根据张屠夫老婆所讲，张屠夫是丑时被杀，午县丞是子时三刻离开抚心阁，时间上正好是行凶的点，不过午县丞离开没有人看到，也就是说……”\r\n　　自己的计划总算是可以付诸实施了，莫小飞有些激动的握住苏青青的手，“苏姐姐，有件事情你可一定要帮忙，关乎人命，若是你同意了，我再让你踢一脚以解心头之恨。”\r\n　　苏青青用力缩回手来，莫小飞手里的热度好像一直在都在，脸颊开始升温，苏青青低下头去，说道，“不用踢了，都是误会，现在不疼了吧，有什么说吧，能帮的我一定帮。”\r\n　　这个忙很简单，莫小飞已经想好了，要救午良家就得有他不在场的证据和证人，证据是没有了，不过证人可以有。\r\n　　抚心阁里所有人都是证人，眼前的苏青青更是最有说服力的证人！\r\n　　“苏姐姐，午县丞入狱肯定是遭人陷害，眼下只有你可以帮他，我需要你站出来为他作证，说他昨夜直到寅时三刻才离开，这样便他便能安然出狱、官复原职。”\r\n　　莫小飞把他的办法讲了出来，不出意外应该可以天衣无缝，只要苏青青答应，自己回县狱和午良家一合计，这事情便可以敲定。\r\n　　看着苏青青，莫小飞想着，这么简单的问题不复杂吧，怎么还在思索着，有这么难答复吗。\r\n　　其实莫小飞并不知道，这年头官府在每个人心中已经高大的像一座随时可以将自己压扁的巨物，可以称为肃然起敬，也可以称为谈虎色变。\r\n　　说谎没什么，但在官府里给别人作伪证，苏青青真没这个胆子。\r\n　　看着苏青青已经沉默多时，莫小飞轻轻摇了摇她的手腕，“想什么呢，有困难吗？指不定午县丞出来之后，还真把房子卖了为你赎身呢。”\r\n　　苏青青看着莫小飞，道，“小飞，为什么要帮姓午的，我不指望他来赎我，我和他也没什么瓜葛，而且，我怎么帮他呀，他明明子午三刻离开的。。”\r\n　　“午良家没有不在场的证据，要是你不帮他，他这次难逃一劫啊，午良家是个好人，你一点儿不同情他，不想伸张正义？”\r\n　　“他是不是好人，这和我有什么关系……”\r\n', '1520564813', '2', '40');
INSERT INTO `yk_book_chapter` VALUES ('41', '1', '第41章', '', '　　莫小飞此时才恍然大悟，自己是这个世上为数不多的热心人，谁会没事儿像自己一般多管闲事儿啊。\r\n　　午良家是不是好人，午良家是不是该死，这些和苏青青都没有半分关系。\r\n　　莫小飞双手合在胸前，说道，“……', '1520564813', '2', '41');
INSERT INTO `yk_book_chapter` VALUES ('42', '1', '第42章', '', '', '1520564813', '2', '42');
INSERT INTO `yk_book_chapter` VALUES ('43', '1', '第43章', '', '', '1520564813', '2', '43');
INSERT INTO `yk_book_chapter` VALUES ('44', '1', '第44章', '', '', '1520564813', '2', '44');
INSERT INTO `yk_book_chapter` VALUES ('45', '1', '第45章', '', '', '1520564813', '2', '45');
INSERT INTO `yk_book_chapter` VALUES ('46', '1', '第46章', '', '', '1520564813', '2', '46');
INSERT INTO `yk_book_chapter` VALUES ('47', '1', '第47章', '', '', '1520564813', '2', '47');
INSERT INTO `yk_book_chapter` VALUES ('48', '1', '第48章', '', '', '1520564813', '2', '48');
INSERT INTO `yk_book_chapter` VALUES ('49', '1', '第49章', '', '', '1520564813', '2', '49');
INSERT INTO `yk_book_chapter` VALUES ('50', '1', '第50章', '', '', '1520564813', '2', '50');
INSERT INTO `yk_book_chapter` VALUES ('51', '1', '第51章', '', '', '1520564813', '2', '51');
INSERT INTO `yk_book_chapter` VALUES ('52', '1', '第52章', '', '', '1520564813', '2', '52');
INSERT INTO `yk_book_chapter` VALUES ('53', '1', '第53章', '', '', '1520564813', '2', '53');
INSERT INTO `yk_book_chapter` VALUES ('54', '1', '第54章', '', '', '1520564813', '2', '54');
INSERT INTO `yk_book_chapter` VALUES ('55', '1', '第55章', '', '', '1520564813', '2', '55');
INSERT INTO `yk_book_chapter` VALUES ('56', '1', '第56章', '', '', '1520564813', '2', '56');
INSERT INTO `yk_book_chapter` VALUES ('57', '1', '第57章', '', '', '1520564813', '2', '57');
INSERT INTO `yk_book_chapter` VALUES ('58', '1', '第58章', '', '', '1520564813', '2', '58');
INSERT INTO `yk_book_chapter` VALUES ('59', '1', '第59章', '', '', '1520564813', '2', '59');
INSERT INTO `yk_book_chapter` VALUES ('60', '1', '第60章', '', '', '1520564813', '2', '60');
INSERT INTO `yk_book_chapter` VALUES ('61', '1', '第61章', '', '', '1520564813', '2', '61');
INSERT INTO `yk_book_chapter` VALUES ('62', '1', '第62章', '', '', '1520564813', '2', '62');
INSERT INTO `yk_book_chapter` VALUES ('63', '1', '第63章', '', '', '1520564813', '2', '63');
INSERT INTO `yk_book_chapter` VALUES ('64', '1', '第64章', '', '', '1520564813', '2', '64');
INSERT INTO `yk_book_chapter` VALUES ('65', '1', '第65章', '', '', '1520564813', '2', '65');
INSERT INTO `yk_book_chapter` VALUES ('66', '1', '第66章', '', '', '1520564813', '2', '66');
INSERT INTO `yk_book_chapter` VALUES ('67', '1', '第67章', '', '', '1520564813', '2', '67');
INSERT INTO `yk_book_chapter` VALUES ('68', '1', '第68章', '', '', '1520564813', '2', '68');
INSERT INTO `yk_book_chapter` VALUES ('69', '1', '第69章', '', '', '1520564813', '2', '69');
INSERT INTO `yk_book_chapter` VALUES ('70', '1', '第70章', '', '', '1520564813', '2', '70');
INSERT INTO `yk_book_chapter` VALUES ('71', '1', '第71章', '', '', '1520564813', '2', '71');
INSERT INTO `yk_book_chapter` VALUES ('72', '1', '第72章', '', '', '1520564813', '2', '72');
INSERT INTO `yk_book_chapter` VALUES ('73', '1', '第73章', '', '', '1520564813', '2', '73');
INSERT INTO `yk_book_chapter` VALUES ('74', '1', '第74章', '', '', '1520564813', '2', '74');
INSERT INTO `yk_book_chapter` VALUES ('75', '1', '第75章', '', '', '1520564813', '2', '75');
INSERT INTO `yk_book_chapter` VALUES ('76', '1', '第76章', '', '', '1520564813', '2', '76');
INSERT INTO `yk_book_chapter` VALUES ('77', '1', '第77章', '', '', '1520564813', '2', '77');
INSERT INTO `yk_book_chapter` VALUES ('78', '1', '第78章', '', '', '1520564813', '2', '78');
INSERT INTO `yk_book_chapter` VALUES ('79', '1', '第79章', '', '', '1520564813', '2', '79');
INSERT INTO `yk_book_chapter` VALUES ('80', '1', '第80章', '', '', '1520564813', '2', '80');
INSERT INTO `yk_book_chapter` VALUES ('81', '1', '第81章', '', '', '1520564813', '2', '81');
INSERT INTO `yk_book_chapter` VALUES ('82', '1', '第82章', '', '', '1520564813', '2', '82');
INSERT INTO `yk_book_chapter` VALUES ('83', '1', '第83章', '', '', '1520564813', '2', '83');
INSERT INTO `yk_book_chapter` VALUES ('84', '1', '第84章', '', '', '1520564813', '2', '84');
INSERT INTO `yk_book_chapter` VALUES ('85', '1', '第85章', '', '', '1520564813', '2', '85');
INSERT INTO `yk_book_chapter` VALUES ('86', '1', '第86章', '', '', '1520564813', '2', '86');
INSERT INTO `yk_book_chapter` VALUES ('87', '1', '第87章', '', '', '1520564813', '2', '87');
INSERT INTO `yk_book_chapter` VALUES ('88', '1', '第88章', '', '', '1520564813', '2', '88');
INSERT INTO `yk_book_chapter` VALUES ('89', '1', '第89章', '', '', '1520564813', '2', '89');
INSERT INTO `yk_book_chapter` VALUES ('90', '1', '第90章', '', '', '1520564813', '2', '90');
INSERT INTO `yk_book_chapter` VALUES ('91', '1', '第91章', '', '', '1520564813', '2', '91');
INSERT INTO `yk_book_chapter` VALUES ('92', '1', '第92章', '', '', '1520564813', '2', '92');
INSERT INTO `yk_book_chapter` VALUES ('93', '1', '第93章', '', '', '1520564813', '2', '93');
INSERT INTO `yk_book_chapter` VALUES ('94', '1', '第94章', '', '', '1520564813', '2', '94');
INSERT INTO `yk_book_chapter` VALUES ('95', '1', '第95章', '', '', '1520564813', '2', '95');
INSERT INTO `yk_book_chapter` VALUES ('96', '1', '第96章', '', '', '1520564813', '2', '96');
INSERT INTO `yk_book_chapter` VALUES ('97', '1', '第97章', '', '', '1520564813', '2', '97');
INSERT INTO `yk_book_chapter` VALUES ('98', '1', '第98章', '', '', '1520564813', '2', '98');
INSERT INTO `yk_book_chapter` VALUES ('99', '1', '第99章', '', '', '1520564813', '2', '99');
INSERT INTO `yk_book_chapter` VALUES ('100', '1', '第100章', '', '', '1520564813', '2', '100');
INSERT INTO `yk_book_chapter` VALUES ('101', '1', '第101章', '', '', '1520564813', '2', '101');
INSERT INTO `yk_book_chapter` VALUES ('102', '1', '第102章', '', '', '1520564813', '2', '102');
INSERT INTO `yk_book_chapter` VALUES ('103', '1', '第103章', '', '', '1520564813', '2', '103');
INSERT INTO `yk_book_chapter` VALUES ('104', '1', '第104章', '', '', '1520564813', '2', '104');
INSERT INTO `yk_book_chapter` VALUES ('105', '1', '第105章', '', '', '1520564813', '2', '105');
INSERT INTO `yk_book_chapter` VALUES ('106', '1', '第106章', '', '', '1520564813', '2', '106');
INSERT INTO `yk_book_chapter` VALUES ('107', '1', '第107章', '', '', '1520564813', '2', '107');
INSERT INTO `yk_book_chapter` VALUES ('108', '1', '第108章', '', '', '1520564813', '2', '108');
INSERT INTO `yk_book_chapter` VALUES ('109', '1', '第109章', '', '', '1520564813', '2', '109');
INSERT INTO `yk_book_chapter` VALUES ('110', '1', '第110章', '', '', '1520564813', '2', '110');
INSERT INTO `yk_book_chapter` VALUES ('111', '1', '第111章', '', '', '1520564813', '2', '111');
INSERT INTO `yk_book_chapter` VALUES ('112', '1', '第112章', '', '', '1520564813', '2', '112');
INSERT INTO `yk_book_chapter` VALUES ('113', '1', '第113章', '', '', '1520564813', '2', '113');
INSERT INTO `yk_book_chapter` VALUES ('114', '1', '第114章', '', '', '1520564813', '2', '114');
INSERT INTO `yk_book_chapter` VALUES ('115', '1', '第115章', '', '', '1520564813', '2', '115');
INSERT INTO `yk_book_chapter` VALUES ('116', '1', '第116章', '', '', '1520564813', '2', '116');
INSERT INTO `yk_book_chapter` VALUES ('117', '1', '第117章', '', '', '1520564813', '2', '117');
INSERT INTO `yk_book_chapter` VALUES ('118', '1', '第118章', '', '', '1520564813', '2', '118');
INSERT INTO `yk_book_chapter` VALUES ('119', '1', '第119章', '', '', '1520564813', '2', '119');
INSERT INTO `yk_book_chapter` VALUES ('120', '1', '第120章', '', '', '1520564813', '2', '120');
INSERT INTO `yk_book_chapter` VALUES ('121', '1', '第121章', '', '', '1520564813', '2', '121');
INSERT INTO `yk_book_chapter` VALUES ('122', '1', '第122章', '', '', '1520564813', '2', '122');
INSERT INTO `yk_book_chapter` VALUES ('123', '1', '第123章', '', '', '1520564813', '2', '123');
INSERT INTO `yk_book_chapter` VALUES ('124', '1', '第124章', '', '', '1520564813', '2', '124');
INSERT INTO `yk_book_chapter` VALUES ('125', '1', '第125章', '', '', '1520564813', '2', '125');
INSERT INTO `yk_book_chapter` VALUES ('126', '1', '第126章', '', '', '1520564813', '2', '126');
INSERT INTO `yk_book_chapter` VALUES ('127', '1', '第127章', '', '', '1520564813', '2', '127');
INSERT INTO `yk_book_chapter` VALUES ('128', '1', '第128章', '', '', '1520564813', '2', '128');
INSERT INTO `yk_book_chapter` VALUES ('129', '1', '第129章', '', '', '1520564813', '2', '129');
INSERT INTO `yk_book_chapter` VALUES ('130', '1', '第130章', '', '', '1520564813', '2', '130');
INSERT INTO `yk_book_chapter` VALUES ('131', '1', '第131章', '', '', '1520564813', '2', '131');
INSERT INTO `yk_book_chapter` VALUES ('132', '1', '第132章', '', '', '1520564813', '2', '132');
INSERT INTO `yk_book_chapter` VALUES ('133', '1', '第133章', '', '', '1520564813', '2', '133');
INSERT INTO `yk_book_chapter` VALUES ('134', '1', '第134章', '', '', '1520564813', '2', '134');
INSERT INTO `yk_book_chapter` VALUES ('135', '1', '第135章', '', '', '1520564813', '2', '135');
INSERT INTO `yk_book_chapter` VALUES ('136', '1', '第136章', '', '', '1520564813', '2', '136');
INSERT INTO `yk_book_chapter` VALUES ('137', '1', '第137章', '', '', '1520564813', '2', '137');
INSERT INTO `yk_book_chapter` VALUES ('138', '1', '第138章', '', '', '1520564813', '2', '138');
INSERT INTO `yk_book_chapter` VALUES ('139', '1', '第139章', '', '', '1520564813', '2', '139');
INSERT INTO `yk_book_chapter` VALUES ('140', '1', '第140章', '', '', '1520564813', '2', '140');
INSERT INTO `yk_book_chapter` VALUES ('141', '1', '第141章', '', '', '1520564813', '2', '141');
INSERT INTO `yk_book_chapter` VALUES ('142', '1', '第142章', '', '', '1520564813', '2', '142');
INSERT INTO `yk_book_chapter` VALUES ('143', '1', '第143章', '', '', '1520564813', '2', '143');
INSERT INTO `yk_book_chapter` VALUES ('144', '1', '第144章', '', '', '1520564813', '2', '144');
INSERT INTO `yk_book_chapter` VALUES ('145', '1', '第145章', '', '', '1520564813', '2', '145');
INSERT INTO `yk_book_chapter` VALUES ('146', '2', '第1章', '话', '', '1520582752', '1', '1');
INSERT INTO `yk_book_chapter` VALUES ('147', '2', '第2章', '话', '', '1520582752', '1', '2');
INSERT INTO `yk_book_chapter` VALUES ('148', '2', '第3章', '话', '', '1520582752', '1', '3');
INSERT INTO `yk_book_chapter` VALUES ('149', '2', '第4章', '话', '', '1520582752', '1', '4');
INSERT INTO `yk_book_chapter` VALUES ('150', '2', '第5章', '话', '', '1520582752', '1', '5');
INSERT INTO `yk_book_chapter` VALUES ('151', '2', '第6章', '话', '', '1520582752', '1', '6');
INSERT INTO `yk_book_chapter` VALUES ('152', '2', '第7章', '话', '', '1520582752', '1', '7');
INSERT INTO `yk_book_chapter` VALUES ('153', '2', '第8章', '话', '', '1520582752', '1', '8');
INSERT INTO `yk_book_chapter` VALUES ('154', '2', '第9章', '话', '', '1520582752', '1', '9');
INSERT INTO `yk_book_chapter` VALUES ('155', '2', '第10章', '话', '', '1520582752', '1', '10');
INSERT INTO `yk_book_chapter` VALUES ('156', '2', '第11章', '话', '', '1520582752', '2', '11');
INSERT INTO `yk_book_chapter` VALUES ('157', '2', '第12章', '话', '', '1520582752', '2', '12');
INSERT INTO `yk_book_chapter` VALUES ('158', '2', '第13章', '话', '', '1520582752', '2', '13');
INSERT INTO `yk_book_chapter` VALUES ('159', '2', '第14章', '话', '', '1520582752', '2', '14');
INSERT INTO `yk_book_chapter` VALUES ('160', '2', '第15章', '话', '', '1520582752', '2', '15');
INSERT INTO `yk_book_chapter` VALUES ('161', '2', '第16章', '话', '', '1520582752', '2', '16');
INSERT INTO `yk_book_chapter` VALUES ('162', '2', '第17章', '话', '', '1520582752', '2', '17');
INSERT INTO `yk_book_chapter` VALUES ('163', '2', '第18章', '话', '', '1520582752', '2', '18');
INSERT INTO `yk_book_chapter` VALUES ('164', '2', '第19章', '话', '', '1520582752', '2', '19');
INSERT INTO `yk_book_chapter` VALUES ('165', '2', '第20章', '话', '', '1520582752', '2', '20');
INSERT INTO `yk_book_chapter` VALUES ('166', '2', '第21章', '话', '', '1520582752', '2', '21');
INSERT INTO `yk_book_chapter` VALUES ('167', '2', '第22章', '话', '', '1520582752', '2', '22');
INSERT INTO `yk_book_chapter` VALUES ('168', '2', '第23章', '话', '', '1520582752', '2', '23');
INSERT INTO `yk_book_chapter` VALUES ('169', '2', '第24章', '话', '', '1520582752', '2', '24');
INSERT INTO `yk_book_chapter` VALUES ('170', '2', '第25章', '话', '', '1520582752', '2', '25');
INSERT INTO `yk_book_chapter` VALUES ('171', '2', '第26章', '话', '', '1520582752', '2', '26');
INSERT INTO `yk_book_chapter` VALUES ('172', '2', '第27章', '话', '', '1520582752', '2', '27');
INSERT INTO `yk_book_chapter` VALUES ('173', '2', '第28章', '话', '', '1520582752', '2', '28');
INSERT INTO `yk_book_chapter` VALUES ('174', '2', '第29章', '话', '', '1520582752', '2', '29');
INSERT INTO `yk_book_chapter` VALUES ('175', '2', '第30章', '话', '', '1520582752', '2', '30');
INSERT INTO `yk_book_chapter` VALUES ('176', '2', '第31章', '话', '', '1520582752', '2', '31');
INSERT INTO `yk_book_chapter` VALUES ('177', '2', '第32章', '话', '', '1520582752', '2', '32');
INSERT INTO `yk_book_chapter` VALUES ('178', '2', '第33章', '话', '', '1520582752', '2', '33');
INSERT INTO `yk_book_chapter` VALUES ('179', '2', '第34章', '话', '', '1520582752', '2', '34');
INSERT INTO `yk_book_chapter` VALUES ('180', '2', '第35章', '话', '', '1520582752', '2', '35');
INSERT INTO `yk_book_chapter` VALUES ('181', '2', '第36章', '话', '', '1520582752', '2', '36');
INSERT INTO `yk_book_chapter` VALUES ('182', '2', '第37章', '话', '', '1520582752', '2', '37');
INSERT INTO `yk_book_chapter` VALUES ('183', '2', '第38章', '话', '', '1520582752', '2', '38');
INSERT INTO `yk_book_chapter` VALUES ('184', '2', '第39章', '话', '', '1520582752', '2', '39');
INSERT INTO `yk_book_chapter` VALUES ('185', '2', '第40章', '话', '', '1520582752', '2', '40');
INSERT INTO `yk_book_chapter` VALUES ('186', '2', '第41章', '话', '', '1520582752', '2', '41');
INSERT INTO `yk_book_chapter` VALUES ('187', '2', '第42章', '话', '', '1520582752', '2', '42');
INSERT INTO `yk_book_chapter` VALUES ('188', '2', '第43章', '话', '', '1520582752', '2', '43');
INSERT INTO `yk_book_chapter` VALUES ('189', '2', '第44章', '话', '', '1520582752', '2', '44');
INSERT INTO `yk_book_chapter` VALUES ('190', '2', '第45章', '话', '', '1520582752', '2', '45');
INSERT INTO `yk_book_chapter` VALUES ('191', '2', '第46章', '话', '', '1520582752', '2', '46');
INSERT INTO `yk_book_chapter` VALUES ('192', '2', '第47章', '话', '', '1520582752', '2', '47');
INSERT INTO `yk_book_chapter` VALUES ('193', '2', '第48章', '话', '', '1520582752', '2', '48');
INSERT INTO `yk_book_chapter` VALUES ('194', '2', '第49章', '话', '', '1520582752', '2', '49');
INSERT INTO `yk_book_chapter` VALUES ('195', '2', '第50章', '话', '', '1520582752', '2', '50');
INSERT INTO `yk_book_chapter` VALUES ('196', '2', '第51章', '话', '', '1520582752', '2', '51');
INSERT INTO `yk_book_chapter` VALUES ('197', '2', '第52章', '话', '', '1520582752', '2', '52');
INSERT INTO `yk_book_chapter` VALUES ('198', '2', '第53章', '话', '', '1520582752', '2', '53');
INSERT INTO `yk_book_chapter` VALUES ('199', '2', '第54章', '话', '', '1520582752', '2', '54');
INSERT INTO `yk_book_chapter` VALUES ('200', '2', '第55章', '话', '', '1520582752', '2', '55');
INSERT INTO `yk_book_chapter` VALUES ('201', '2', '第56章', '话', '', '1520582752', '2', '56');
INSERT INTO `yk_book_chapter` VALUES ('202', '2', '第57章', '话', '', '1520582752', '2', '57');
INSERT INTO `yk_book_chapter` VALUES ('203', '2', '第58章', '话', '', '1520582752', '2', '58');
INSERT INTO `yk_book_chapter` VALUES ('204', '2', '第59章', '话', '', '1520582752', '2', '59');
INSERT INTO `yk_book_chapter` VALUES ('205', '2', '第60章', '话', '', '1520582752', '2', '60');
INSERT INTO `yk_book_chapter` VALUES ('206', '2', '第61章', '话', '', '1520582752', '2', '61');
INSERT INTO `yk_book_chapter` VALUES ('207', '2', '第62章', '话', '', '1520582752', '2', '62');
INSERT INTO `yk_book_chapter` VALUES ('208', '2', '第63章', '话', '', '1520582752', '2', '63');
INSERT INTO `yk_book_chapter` VALUES ('209', '2', '第64章', '话', '', '1520582752', '2', '64');
INSERT INTO `yk_book_chapter` VALUES ('210', '2', '第65章', '话', '', '1520582752', '2', '65');
INSERT INTO `yk_book_chapter` VALUES ('211', '2', '第66章', '话', '', '1520582752', '2', '66');
INSERT INTO `yk_book_chapter` VALUES ('212', '2', '第67章', '话', '', '1520582752', '2', '67');
INSERT INTO `yk_book_chapter` VALUES ('213', '2', '第68章', '话', '', '1520582752', '2', '68');
INSERT INTO `yk_book_chapter` VALUES ('214', '2', '第69章', '话', '', '1520582752', '2', '69');
INSERT INTO `yk_book_chapter` VALUES ('215', '2', '第70章', '话', '', '1520582752', '2', '70');
INSERT INTO `yk_book_chapter` VALUES ('216', '2', '第71章', '话', '', '1520582752', '2', '71');
INSERT INTO `yk_book_chapter` VALUES ('217', '2', '第72章', '话', '', '1520582752', '2', '72');
INSERT INTO `yk_book_chapter` VALUES ('218', '2', '第73章', '话', '', '1520582752', '2', '73');
INSERT INTO `yk_book_chapter` VALUES ('219', '2', '第74章', '话', '', '1520582752', '2', '74');
INSERT INTO `yk_book_chapter` VALUES ('220', '2', '第75章', '话', '', '1520582752', '2', '75');
INSERT INTO `yk_book_chapter` VALUES ('221', '2', '第76章', '话', '', '1520582752', '2', '76');
INSERT INTO `yk_book_chapter` VALUES ('222', '2', '第77章', '话', '', '1520582752', '2', '77');
INSERT INTO `yk_book_chapter` VALUES ('223', '2', '第78章', '话', '', '1520582752', '2', '78');
INSERT INTO `yk_book_chapter` VALUES ('224', '2', '第79章', '话', '', '1520582752', '2', '79');
INSERT INTO `yk_book_chapter` VALUES ('225', '2', '第80章', '话', '', '1520582752', '2', '80');
INSERT INTO `yk_book_chapter` VALUES ('226', '2', '第81章', '话', '', '1520582752', '2', '81');
INSERT INTO `yk_book_chapter` VALUES ('227', '2', '第82章', '话', '', '1520582752', '2', '82');
INSERT INTO `yk_book_chapter` VALUES ('228', '2', '第83章', '话', '', '1520582752', '2', '83');
INSERT INTO `yk_book_chapter` VALUES ('229', '2', '第84章', '话', '', '1520582752', '2', '84');
INSERT INTO `yk_book_chapter` VALUES ('230', '2', '第85章', '话', '', '1520582752', '2', '85');
INSERT INTO `yk_book_chapter` VALUES ('231', '2', '第86章', '话', '', '1520582752', '2', '86');
INSERT INTO `yk_book_chapter` VALUES ('232', '2', '第87章', '话', '', '1520582752', '2', '87');
INSERT INTO `yk_book_chapter` VALUES ('233', '2', '第88章', '话', '', '1520582752', '2', '88');
INSERT INTO `yk_book_chapter` VALUES ('234', '2', '第89章', '话', '', '1520582752', '2', '89');
INSERT INTO `yk_book_chapter` VALUES ('235', '2', '第90章', '话', '', '1520582752', '2', '90');
INSERT INTO `yk_book_chapter` VALUES ('236', '2', '第91章', '话', '', '1520582752', '2', '91');
INSERT INTO `yk_book_chapter` VALUES ('237', '2', '第92章', '话', '', '1520582752', '2', '92');
INSERT INTO `yk_book_chapter` VALUES ('238', '2', '第93章', '话', '', '1520582752', '2', '93');
INSERT INTO `yk_book_chapter` VALUES ('239', '2', '第94章', '话', '', '1520582752', '2', '94');
INSERT INTO `yk_book_chapter` VALUES ('240', '2', '第95章', '话', '', '1520582752', '2', '95');
INSERT INTO `yk_book_chapter` VALUES ('241', '2', '第96章', '话', '', '1520582752', '2', '96');
INSERT INTO `yk_book_chapter` VALUES ('242', '2', '第97章', '话', '', '1520582752', '2', '97');
INSERT INTO `yk_book_chapter` VALUES ('243', '2', '第98章', '话', '', '1520582752', '2', '98');
INSERT INTO `yk_book_chapter` VALUES ('244', '2', '第99章', '话', '', '1520582752', '2', '99');
INSERT INTO `yk_book_chapter` VALUES ('245', '2', '第100章', '话', '', '1520582752', '2', '100');
INSERT INTO `yk_book_chapter` VALUES ('246', '2', '第101章', '话', '', '1520582752', '2', '101');
INSERT INTO `yk_book_chapter` VALUES ('247', '2', '第102章', '话', '', '1520582752', '2', '102');
INSERT INTO `yk_book_chapter` VALUES ('248', '2', '第103章', '话', '', '1520582752', '2', '103');
INSERT INTO `yk_book_chapter` VALUES ('249', '2', '第104章', '话', '', '1520582752', '2', '104');
INSERT INTO `yk_book_chapter` VALUES ('250', '2', '第105章', '话', '', '1520582752', '2', '105');
INSERT INTO `yk_book_chapter` VALUES ('251', '2', '第106章', '话', '', '1520582752', '2', '106');
INSERT INTO `yk_book_chapter` VALUES ('252', '2', '第107章', '话', '', '1520582752', '2', '107');
INSERT INTO `yk_book_chapter` VALUES ('253', '2', '第108章', '话', '', '1520582752', '2', '108');
INSERT INTO `yk_book_chapter` VALUES ('254', '2', '第109章', '话', '', '1520582752', '2', '109');
INSERT INTO `yk_book_chapter` VALUES ('255', '2', '第110章', '零话', '', '1520582752', '2', '110');
INSERT INTO `yk_book_chapter` VALUES ('256', '2', '第111章', '话', '', '1520582752', '2', '111');
INSERT INTO `yk_book_chapter` VALUES ('257', '2', '第112章', '话', '', '1520582752', '2', '112');
INSERT INTO `yk_book_chapter` VALUES ('258', '2', '第113章', '话', '', '1520582752', '2', '113');
INSERT INTO `yk_book_chapter` VALUES ('259', '2', '第114章', '话', '', '1520582752', '2', '114');
INSERT INTO `yk_book_chapter` VALUES ('260', '2', '第115章', '话', '', '1520582752', '2', '115');
INSERT INTO `yk_book_chapter` VALUES ('261', '2', '第116章', '话', '', '1520582752', '2', '116');
INSERT INTO `yk_book_chapter` VALUES ('262', '2', '第117章', '话', '', '1520582752', '2', '117');
INSERT INTO `yk_book_chapter` VALUES ('263', '2', '第118章', '话', '', '1520582752', '2', '118');
INSERT INTO `yk_book_chapter` VALUES ('264', '2', '第119章', '话', '', '1520582752', '2', '119');
INSERT INTO `yk_book_chapter` VALUES ('265', '2', '第120章', '零话', '', '1520582752', '2', '120');
INSERT INTO `yk_book_chapter` VALUES ('266', '2', '第121章', '话', '', '1520582752', '2', '121');
INSERT INTO `yk_book_chapter` VALUES ('267', '2', '第122章', '话', '', '1520582752', '2', '122');
INSERT INTO `yk_book_chapter` VALUES ('268', '2', '第123章', '话', '', '1520582752', '2', '123');
INSERT INTO `yk_book_chapter` VALUES ('269', '2', '第124章', '话', '', '1520582752', '2', '124');
INSERT INTO `yk_book_chapter` VALUES ('270', '2', '第125章', '话', '', '1520582752', '2', '125');
INSERT INTO `yk_book_chapter` VALUES ('271', '2', '第126章', '话', '', '1520582752', '2', '126');
INSERT INTO `yk_book_chapter` VALUES ('272', '2', '第127章', '话', '', '1520582752', '2', '127');
INSERT INTO `yk_book_chapter` VALUES ('273', '2', '第128章', '话', '', '1520582752', '2', '128');
INSERT INTO `yk_book_chapter` VALUES ('274', '2', '第129章', '话', '', '1520582752', '2', '129');
INSERT INTO `yk_book_chapter` VALUES ('275', '2', '第130章', '零话', '', '1520582752', '2', '130');
INSERT INTO `yk_book_chapter` VALUES ('276', '2', '第131章', '话', '', '1520582752', '2', '131');
INSERT INTO `yk_book_chapter` VALUES ('277', '2', '第132章', '话', '', '1520582752', '2', '132');
INSERT INTO `yk_book_chapter` VALUES ('278', '2', '第133章', '话', '', '1520582752', '2', '133');
INSERT INTO `yk_book_chapter` VALUES ('279', '2', '第134章', '话', '', '1520582752', '2', '134');
INSERT INTO `yk_book_chapter` VALUES ('280', '2', '第135章', '话', '', '1520582752', '2', '135');
INSERT INTO `yk_book_chapter` VALUES ('281', '2', '第136章', '话', '', '1520582752', '2', '136');
INSERT INTO `yk_book_chapter` VALUES ('282', '2', '第137章', '话', '', '1520582752', '2', '137');
INSERT INTO `yk_book_chapter` VALUES ('283', '2', '第138章', '话', '', '1520582752', '2', '138');
INSERT INTO `yk_book_chapter` VALUES ('284', '2', '第139章', '话', '', '1520582752', '2', '139');
INSERT INTO `yk_book_chapter` VALUES ('285', '2', '第140章', '零话', '', '1520582752', '2', '140');
INSERT INTO `yk_book_chapter` VALUES ('286', '2', '第141章', '话', '', '1520582752', '2', '141');
INSERT INTO `yk_book_chapter` VALUES ('287', '2', '第142章', '话', '', '1520582752', '2', '142');
INSERT INTO `yk_book_chapter` VALUES ('288', '2', '第143章', '话', '', '1520582752', '2', '143');
INSERT INTO `yk_book_chapter` VALUES ('289', '2', '第144章', '话', '', '1520582752', '2', '144');
INSERT INTO `yk_book_chapter` VALUES ('290', '2', '第145章', '话', '', '1520582752', '2', '145');
INSERT INTO `yk_book_chapter` VALUES ('291', '2', '第146章', '话', '', '1520582752', '2', '146');
INSERT INTO `yk_book_chapter` VALUES ('292', '2', '第147章', '话', '', '1520582752', '2', '147');
INSERT INTO `yk_book_chapter` VALUES ('293', '2', '第148章', '话', '', '1520582752', '2', '148');
INSERT INTO `yk_book_chapter` VALUES ('294', '2', '第149章', '话', '', '1520582752', '2', '149');
INSERT INTO `yk_book_chapter` VALUES ('295', '2', '第150章', '零话', '', '1520582752', '2', '150');
INSERT INTO `yk_book_chapter` VALUES ('296', '2', '第151章', '话', '', '1520582752', '2', '151');
INSERT INTO `yk_book_chapter` VALUES ('297', '2', '第152章', '话', '', '1520582752', '2', '152');
INSERT INTO `yk_book_chapter` VALUES ('298', '2', '第153章', '话', '', '1520582752', '2', '153');
INSERT INTO `yk_book_chapter` VALUES ('299', '2', '第154章', '话', '', '1520582752', '2', '154');
INSERT INTO `yk_book_chapter` VALUES ('300', '2', '第155章', '话', '', '1520582752', '2', '155');
INSERT INTO `yk_book_chapter` VALUES ('301', '2', '第156章', '话', '', '1520582752', '2', '156');
INSERT INTO `yk_book_chapter` VALUES ('302', '2', '第157章', '话', '', '1520582752', '2', '157');
INSERT INTO `yk_book_chapter` VALUES ('303', '2', '第158章', '话', '', '1520582752', '2', '158');
INSERT INTO `yk_book_chapter` VALUES ('304', '2', '第159章', '话', '', '1520582752', '2', '159');
INSERT INTO `yk_book_chapter` VALUES ('305', '2', '第160章', '零话', '', '1520582752', '2', '160');
INSERT INTO `yk_book_chapter` VALUES ('306', '2', '第161章', '话', '', '1520582752', '2', '161');
INSERT INTO `yk_book_chapter` VALUES ('307', '2', '第162章', '话', '', '1520582752', '2', '162');
INSERT INTO `yk_book_chapter` VALUES ('308', '2', '第163章', '话', '', '1520582752', '2', '163');
INSERT INTO `yk_book_chapter` VALUES ('309', '2', '第164章', '话', '', '1520582752', '2', '164');
INSERT INTO `yk_book_chapter` VALUES ('310', '2', '第165章', '话', '', '1520582752', '2', '165');
INSERT INTO `yk_book_chapter` VALUES ('311', '2', '第166章', '话', '', '1520582752', '2', '166');
INSERT INTO `yk_book_chapter` VALUES ('312', '2', '第167章', '话', '', '1520582752', '2', '167');
INSERT INTO `yk_book_chapter` VALUES ('313', '2', '第168章', '话', '', '1520582752', '2', '168');
INSERT INTO `yk_book_chapter` VALUES ('314', '2', '第169章', '话', '', '1520582752', '2', '169');
INSERT INTO `yk_book_chapter` VALUES ('315', '2', '第170章', '零话', '', '1520582752', '2', '170');
INSERT INTO `yk_book_chapter` VALUES ('316', '2', '第171章', '话', '', '1520582752', '2', '171');
INSERT INTO `yk_book_chapter` VALUES ('317', '2', '第172章', '话', '', '1520582752', '2', '172');
INSERT INTO `yk_book_chapter` VALUES ('318', '2', '第173章', '话', '', '1520582752', '2', '173');
INSERT INTO `yk_book_chapter` VALUES ('319', '2', '第174章', '话', '', '1520582752', '2', '174');
INSERT INTO `yk_book_chapter` VALUES ('320', '2', '第175章', '话', '', '1520582752', '2', '175');
INSERT INTO `yk_book_chapter` VALUES ('321', '2', '第176章', '话', '', '1520582752', '2', '176');
INSERT INTO `yk_book_chapter` VALUES ('322', '2', '第177章', '话', '', '1520582752', '2', '177');
INSERT INTO `yk_book_chapter` VALUES ('323', '2', '第178章', '话', '', '1520582752', '2', '178');
INSERT INTO `yk_book_chapter` VALUES ('324', '2', '第179章', '话', '', '1520582752', '2', '179');
INSERT INTO `yk_book_chapter` VALUES ('325', '2', '第180章', '零话', '', '1520582752', '2', '180');
INSERT INTO `yk_book_chapter` VALUES ('326', '2', '第181章', '话', '', '1520582752', '2', '181');
INSERT INTO `yk_book_chapter` VALUES ('327', '2', '第182章', '话', '', '1520582752', '2', '182');
INSERT INTO `yk_book_chapter` VALUES ('328', '2', '第183章', '话', '', '1520582752', '2', '183');
INSERT INTO `yk_book_chapter` VALUES ('329', '2', '第184章', '话', '', '1520582752', '2', '184');
INSERT INTO `yk_book_chapter` VALUES ('330', '2', '第185章', '话', '', '1520582752', '2', '185');
INSERT INTO `yk_book_chapter` VALUES ('331', '2', '第186章', '话', '', '1520582752', '2', '186');
INSERT INTO `yk_book_chapter` VALUES ('332', '2', '第187章', '话', '', '1520582752', '2', '187');
INSERT INTO `yk_book_chapter` VALUES ('333', '2', '第188章', '话', '', '1520582752', '2', '188');
INSERT INTO `yk_book_chapter` VALUES ('334', '2', '第189章', '话', '', '1520582752', '2', '189');
INSERT INTO `yk_book_chapter` VALUES ('335', '2', '第190章', '零话', '', '1520582752', '2', '190');
INSERT INTO `yk_book_chapter` VALUES ('336', '2', '第191章', '话', '', '1520582752', '2', '191');
INSERT INTO `yk_book_chapter` VALUES ('337', '2', '第192章', '话', '', '1520582752', '2', '192');
INSERT INTO `yk_book_chapter` VALUES ('338', '2', '第193章', '话', '', '1520582752', '2', '193');
INSERT INTO `yk_book_chapter` VALUES ('339', '2', '第194章', '话', '', '1520582752', '2', '194');
INSERT INTO `yk_book_chapter` VALUES ('340', '2', '第195章', '话', '', '1520582752', '2', '195');
INSERT INTO `yk_book_chapter` VALUES ('341', '2', '第196章', '话', '', '1520582752', '2', '196');
INSERT INTO `yk_book_chapter` VALUES ('342', '2', '第197章', '话', '', '1520582752', '2', '197');
INSERT INTO `yk_book_chapter` VALUES ('343', '2', '第198章', '话', '', '1520582752', '2', '198');
INSERT INTO `yk_book_chapter` VALUES ('344', '2', '第199章', '话', '', '1520582752', '2', '199');
INSERT INTO `yk_book_chapter` VALUES ('345', '2', '第200章', '零零话', '', '1520582752', '2', '200');
INSERT INTO `yk_book_chapter` VALUES ('346', '2', '第201章', '零一话', '', '1520582752', '2', '201');
INSERT INTO `yk_book_chapter` VALUES ('347', '2', '第202章', '零二话', '', '1520582752', '2', '202');
INSERT INTO `yk_book_chapter` VALUES ('348', '2', '第203章', '零三话', '', '1520582752', '2', '203');
INSERT INTO `yk_book_chapter` VALUES ('349', '2', '第204章', '零四话', '', '1520582752', '2', '204');
INSERT INTO `yk_book_chapter` VALUES ('350', '2', '第205章', '零五话', '', '1520582752', '2', '205');
INSERT INTO `yk_book_chapter` VALUES ('351', '2', '第206章', '零六话', '', '1520582752', '2', '206');
INSERT INTO `yk_book_chapter` VALUES ('352', '2', '第207章', '零七话', '', '1520582752', '2', '207');
INSERT INTO `yk_book_chapter` VALUES ('353', '2', '第208章', '零八话', '', '1520582752', '2', '208');
INSERT INTO `yk_book_chapter` VALUES ('354', '2', '第209章', '零九话', '', '1520582752', '2', '209');
INSERT INTO `yk_book_chapter` VALUES ('355', '2', '第210章', '零话', '', '1520582752', '2', '210');
INSERT INTO `yk_book_chapter` VALUES ('356', '2', '第211章', '话', '', '1520582752', '2', '211');
INSERT INTO `yk_book_chapter` VALUES ('357', '2', '第212章', '话', '', '1520582752', '2', '212');
INSERT INTO `yk_book_chapter` VALUES ('358', '2', '第213章', '话', '', '1520582752', '2', '213');
INSERT INTO `yk_book_chapter` VALUES ('359', '2', '第214章', '话', '', '1520582752', '2', '214');
INSERT INTO `yk_book_chapter` VALUES ('360', '2', '第215章', '话', '', '1520582752', '2', '215');
INSERT INTO `yk_book_chapter` VALUES ('361', '2', '第216章', '话', '', '1520582752', '2', '216');
INSERT INTO `yk_book_chapter` VALUES ('362', '2', '第217章', '话', '', '1520582752', '2', '217');
INSERT INTO `yk_book_chapter` VALUES ('363', '2', '第218章', '话', '', '1520582752', '2', '218');
INSERT INTO `yk_book_chapter` VALUES ('364', '2', '第219章', '话', '', '1520582752', '2', '219');
INSERT INTO `yk_book_chapter` VALUES ('365', '2', '第220章', '零话', '', '1520582752', '2', '220');
INSERT INTO `yk_book_chapter` VALUES ('366', '2', '第221章', '话', '', '1520582752', '2', '221');
INSERT INTO `yk_book_chapter` VALUES ('367', '2', '第222章', '话', '', '1520582752', '2', '222');
INSERT INTO `yk_book_chapter` VALUES ('368', '2', '第223章', '话', '', '1520582752', '2', '223');
INSERT INTO `yk_book_chapter` VALUES ('369', '2', '第224章', '话', '', '1520582752', '2', '224');
INSERT INTO `yk_book_chapter` VALUES ('370', '2', '第225章', '话', '', '1520582752', '2', '225');
INSERT INTO `yk_book_chapter` VALUES ('371', '2', '第226章', '话', '', '1520582752', '2', '226');
INSERT INTO `yk_book_chapter` VALUES ('372', '2', '第227章', '话', '', '1520582752', '2', '227');
INSERT INTO `yk_book_chapter` VALUES ('373', '2', '第228章', '话', '', '1520582752', '2', '228');
INSERT INTO `yk_book_chapter` VALUES ('374', '2', '第229章', '零话', '', '1520582752', '2', '229');
INSERT INTO `yk_book_chapter` VALUES ('375', '2', '第230章', '话', '', '1520582752', '2', '230');
INSERT INTO `yk_book_chapter` VALUES ('376', '2', '第231章', '话', '', '1520582752', '2', '231');
INSERT INTO `yk_book_chapter` VALUES ('377', '2', '第232章', '话', '', '1520582752', '2', '232');
INSERT INTO `yk_book_chapter` VALUES ('378', '2', '第233章', '话', '', '1520582752', '2', '233');
INSERT INTO `yk_book_chapter` VALUES ('379', '2', '第234章', '话', '', '1520582752', '2', '234');
INSERT INTO `yk_book_chapter` VALUES ('380', '2', '第235章', '话', '', '1520582752', '2', '235');
INSERT INTO `yk_book_chapter` VALUES ('381', '2', '第236章', '话', '', '1520582752', '2', '236');
INSERT INTO `yk_book_chapter` VALUES ('382', '2', '第237章', '话', '', '1520582752', '2', '237');
INSERT INTO `yk_book_chapter` VALUES ('383', '2', '第238章', '话', '', '1520582752', '2', '238');
INSERT INTO `yk_book_chapter` VALUES ('384', '2', '第239章', '零话', '', '1520582752', '2', '239');
INSERT INTO `yk_book_chapter` VALUES ('385', '2', '第240章', '话', '', '1520582752', '2', '240');
INSERT INTO `yk_book_chapter` VALUES ('386', '2', '第241章', '话', '', '1520582752', '2', '241');
INSERT INTO `yk_book_chapter` VALUES ('387', '2', '第242章', '话', '', '1520582752', '2', '242');
INSERT INTO `yk_book_chapter` VALUES ('388', '2', '第243章', '话', '', '1520582752', '2', '243');
INSERT INTO `yk_book_chapter` VALUES ('389', '2', '第244章', '话', '', '1520582752', '2', '244');
INSERT INTO `yk_book_chapter` VALUES ('390', '2', '第245章', '话', '', '1520582752', '2', '245');
INSERT INTO `yk_book_chapter` VALUES ('391', '2', '第246章', '话', '', '1520582752', '2', '246');
INSERT INTO `yk_book_chapter` VALUES ('392', '2', '第247章', '话', '', '1520582752', '2', '247');
INSERT INTO `yk_book_chapter` VALUES ('393', '2', '第248章', '话', '', '1520582752', '2', '248');
INSERT INTO `yk_book_chapter` VALUES ('394', '2', '第249章', '零话', '', '1520582752', '2', '249');
INSERT INTO `yk_book_chapter` VALUES ('395', '2', '第250章', '话', '', '1520582752', '2', '250');
INSERT INTO `yk_book_chapter` VALUES ('396', '2', '第251章', '话', '', '1520582752', '2', '251');
INSERT INTO `yk_book_chapter` VALUES ('397', '2', '第252章', '话', '', '1520582752', '2', '252');
INSERT INTO `yk_book_chapter` VALUES ('398', '2', '第253章', '话', '', '1520582752', '2', '253');
INSERT INTO `yk_book_chapter` VALUES ('399', '2', '第254章', '话', '', '1520582752', '2', '254');
INSERT INTO `yk_book_chapter` VALUES ('400', '2', '第255章', '话', '', '1520582752', '2', '255');
INSERT INTO `yk_book_chapter` VALUES ('401', '2', '第256章', '话', '', '1520582752', '2', '256');
INSERT INTO `yk_book_chapter` VALUES ('402', '2', '第257章', '话', '', '1520582752', '2', '257');
INSERT INTO `yk_book_chapter` VALUES ('403', '2', '第258章', '话', '', '1520582752', '2', '258');
INSERT INTO `yk_book_chapter` VALUES ('404', '2', '第259章', '零话', '', '1520582752', '2', '259');
INSERT INTO `yk_book_chapter` VALUES ('405', '2', '第260章', '话', '', '1520582752', '2', '260');
INSERT INTO `yk_book_chapter` VALUES ('406', '2', '第261章', '话', '', '1520582752', '2', '261');
INSERT INTO `yk_book_chapter` VALUES ('407', '2', '第262章', '话', '', '1520582752', '2', '262');
INSERT INTO `yk_book_chapter` VALUES ('408', '2', '第263章', '话', '', '1520582752', '2', '263');
INSERT INTO `yk_book_chapter` VALUES ('409', '2', '第264章', '话', '', '1520582752', '2', '264');
INSERT INTO `yk_book_chapter` VALUES ('410', '2', '第265章', '话', '', '1520582752', '2', '265');
INSERT INTO `yk_book_chapter` VALUES ('411', '2', '第266章', '话', '', '1520582752', '2', '266');
INSERT INTO `yk_book_chapter` VALUES ('412', '2', '第267章', '话', '', '1520582752', '2', '267');
INSERT INTO `yk_book_chapter` VALUES ('413', '2', '第268章', '话', '', '1520582752', '2', '268');
INSERT INTO `yk_book_chapter` VALUES ('414', '2', '第269章', '零话', '', '1520582752', '2', '269');
INSERT INTO `yk_book_chapter` VALUES ('415', '2', '第270章', '话', '', '1520582752', '2', '270');
INSERT INTO `yk_book_chapter` VALUES ('416', '2', '第271章', '话', '', '1520582752', '2', '271');
INSERT INTO `yk_book_chapter` VALUES ('417', '2', '第272章', '话', '', '1520582752', '2', '272');
INSERT INTO `yk_book_chapter` VALUES ('418', '2', '第273章', '话', '', '1520582752', '2', '273');
INSERT INTO `yk_book_chapter` VALUES ('419', '2', '第274章', '话', '', '1520582752', '2', '274');
INSERT INTO `yk_book_chapter` VALUES ('420', '2', '第275章', '话', '', '1520582752', '2', '275');
INSERT INTO `yk_book_chapter` VALUES ('421', '2', '第276章', '话', '', '1520582752', '2', '276');
INSERT INTO `yk_book_chapter` VALUES ('422', '2', '第277章', '话', '', '1520582752', '2', '277');
INSERT INTO `yk_book_chapter` VALUES ('423', '2', '第278章', '话', '', '1520582752', '2', '278');
INSERT INTO `yk_book_chapter` VALUES ('424', '2', '第279章', '零话', '', '1520582752', '2', '279');
INSERT INTO `yk_book_chapter` VALUES ('425', '2', '第280章', '话', '', '1520582752', '2', '280');
INSERT INTO `yk_book_chapter` VALUES ('426', '2', '第281章', '话', '', '1520582752', '2', '281');
INSERT INTO `yk_book_chapter` VALUES ('427', '2', '第282章', '话', '', '1520582752', '2', '282');
INSERT INTO `yk_book_chapter` VALUES ('428', '2', '第283章', '话', '', '1520582752', '2', '283');
INSERT INTO `yk_book_chapter` VALUES ('429', '2', '第284章', '话', '', '1520582752', '2', '284');
INSERT INTO `yk_book_chapter` VALUES ('430', '2', '第285章', '话', '', '1520582752', '2', '285');
INSERT INTO `yk_book_chapter` VALUES ('431', '2', '第286章', '话', '', '1520582752', '2', '286');
INSERT INTO `yk_book_chapter` VALUES ('432', '2', '第287章', '话', '', '1520582752', '2', '287');
INSERT INTO `yk_book_chapter` VALUES ('433', '2', '第288章', '话', '', '1520582752', '2', '288');
INSERT INTO `yk_book_chapter` VALUES ('434', '2', '第289章', '零话', '', '1520582752', '2', '289');
INSERT INTO `yk_book_chapter` VALUES ('435', '2', '第290章', '话', '', '1520582752', '2', '290');
INSERT INTO `yk_book_chapter` VALUES ('436', '2', '第291章', '话', '', '1520582752', '2', '291');
INSERT INTO `yk_book_chapter` VALUES ('437', '2', '第292章', '话', '', '1520582752', '2', '292');
INSERT INTO `yk_book_chapter` VALUES ('438', '2', '第293章', '话', '', '1520582752', '2', '293');
INSERT INTO `yk_book_chapter` VALUES ('439', '2', '第294章', '话', '', '1520582752', '2', '294');
INSERT INTO `yk_book_chapter` VALUES ('440', '2', '第296章', '话', '', '1520582752', '2', '295');
INSERT INTO `yk_book_chapter` VALUES ('441', '2', '第297章', '话', '', '1520582752', '2', '296');
INSERT INTO `yk_book_chapter` VALUES ('442', '2', '第298章', '话', '', '1520582752', '2', '297');
INSERT INTO `yk_book_chapter` VALUES ('443', '2', '第299章', '零零话', '', '1520582752', '2', '298');
INSERT INTO `yk_book_chapter` VALUES ('444', '2', '第300章', '零一话', '', '1520582752', '2', '299');
INSERT INTO `yk_book_chapter` VALUES ('445', '2', '第301章', '零二话', '', '1520582752', '2', '300');
INSERT INTO `yk_book_chapter` VALUES ('446', '2', '第302章', '零三话', '', '1520582752', '2', '301');
INSERT INTO `yk_book_chapter` VALUES ('447', '2', '第303章', '零四话', '', '1520582752', '2', '302');
INSERT INTO `yk_book_chapter` VALUES ('448', '2', '第304章', '零五话', '', '1520582752', '2', '303');
INSERT INTO `yk_book_chapter` VALUES ('449', '2', '第305章', '零六话', '', '1520582752', '2', '304');
INSERT INTO `yk_book_chapter` VALUES ('450', '2', '第306章', '零七话', '', '1520582752', '2', '305');
INSERT INTO `yk_book_chapter` VALUES ('451', '2', '第307章', '零八话', '', '1520582752', '2', '306');
INSERT INTO `yk_book_chapter` VALUES ('452', '2', '第308章', '零九话', '', '1520582752', '2', '307');
INSERT INTO `yk_book_chapter` VALUES ('453', '2', '第309章', '零话', '', '1520582752', '2', '308');
INSERT INTO `yk_book_chapter` VALUES ('454', '2', '第310章', '话', '', '1520582752', '2', '309');
INSERT INTO `yk_book_chapter` VALUES ('455', '2', '第311章', '话', '', '1520582752', '2', '310');
INSERT INTO `yk_book_chapter` VALUES ('456', '2', '第312章', '话', '', '1520582752', '2', '311');
INSERT INTO `yk_book_chapter` VALUES ('457', '2', '第313章', '话', '', '1520582752', '2', '312');
INSERT INTO `yk_book_chapter` VALUES ('458', '2', '第314章', '话', '', '1520582752', '2', '313');
INSERT INTO `yk_book_chapter` VALUES ('459', '2', '第315章', '话', '', '1520582752', '2', '314');
INSERT INTO `yk_book_chapter` VALUES ('460', '2', '第316章', '话', '', '1520582752', '2', '315');
INSERT INTO `yk_book_chapter` VALUES ('461', '2', '第317章', '话', '', '1520582752', '2', '316');
INSERT INTO `yk_book_chapter` VALUES ('462', '2', '第318章', '话', '', '1520582752', '2', '317');
INSERT INTO `yk_book_chapter` VALUES ('463', '2', '第319章', '零话', '', '1520582752', '2', '318');
INSERT INTO `yk_book_chapter` VALUES ('464', '2', '第320章', '话', '', '1520582752', '2', '319');
INSERT INTO `yk_book_chapter` VALUES ('465', '2', '第321章', '话', '', '1520582752', '2', '320');
INSERT INTO `yk_book_chapter` VALUES ('466', '2', '第322章', '话', '', '1520582752', '2', '321');
INSERT INTO `yk_book_chapter` VALUES ('467', '2', '第323章', '话', '', '1520582752', '2', '322');
INSERT INTO `yk_book_chapter` VALUES ('468', '2', '第324章', '话', '', '1520582752', '2', '323');
INSERT INTO `yk_book_chapter` VALUES ('469', '2', '第325章', '话', '', '1520582752', '2', '324');
INSERT INTO `yk_book_chapter` VALUES ('470', '2', '第326章', '话', '', '1520582752', '2', '325');
INSERT INTO `yk_book_chapter` VALUES ('471', '2', '第327章', '话', '', '1520582752', '2', '326');
INSERT INTO `yk_book_chapter` VALUES ('472', '2', '第328章', '话', '', '1520582752', '2', '327');
INSERT INTO `yk_book_chapter` VALUES ('473', '2', '第329章', '零话', '', '1520582752', '2', '328');
INSERT INTO `yk_book_chapter` VALUES ('474', '2', '第330章', '话', '', '1520582752', '2', '329');
INSERT INTO `yk_book_chapter` VALUES ('475', '2', '第331章', '话', '', '1520582752', '2', '330');
INSERT INTO `yk_book_chapter` VALUES ('476', '2', '第332章', '话', '', '1520582752', '2', '331');
INSERT INTO `yk_book_chapter` VALUES ('477', '2', '第333章', '话', '', '1520582752', '2', '332');
INSERT INTO `yk_book_chapter` VALUES ('478', '2', '第334章', '话', '', '1520582752', '2', '333');
INSERT INTO `yk_book_chapter` VALUES ('479', '2', '第335章', '话', '', '1520582752', '2', '334');
INSERT INTO `yk_book_chapter` VALUES ('480', '2', '第336章', '话', '', '1520582752', '2', '335');
INSERT INTO `yk_book_chapter` VALUES ('481', '2', '第337章', '话', '', '1520582752', '2', '336');
INSERT INTO `yk_book_chapter` VALUES ('482', '2', '第338章', '话', '', '1520582752', '2', '337');
INSERT INTO `yk_book_chapter` VALUES ('483', '2', '第339章', '零话', '', '1520582752', '2', '338');
INSERT INTO `yk_book_chapter` VALUES ('484', '2', '第340章', '话', '', '1520582752', '2', '339');
INSERT INTO `yk_book_chapter` VALUES ('485', '2', '第341章', '话', '', '1520582752', '2', '340');
INSERT INTO `yk_book_chapter` VALUES ('486', '2', '第342章', '话', '', '1520582752', '2', '341');
INSERT INTO `yk_book_chapter` VALUES ('487', '2', '第343章', '话', '', '1520582752', '2', '342');
INSERT INTO `yk_book_chapter` VALUES ('488', '2', '第344章', '话', '', '1520582752', '2', '343');
INSERT INTO `yk_book_chapter` VALUES ('489', '2', '第345章', '话', '', '1520582752', '2', '344');
INSERT INTO `yk_book_chapter` VALUES ('490', '2', '第346章', '话', '', '1520582752', '2', '345');
INSERT INTO `yk_book_chapter` VALUES ('491', '2', '第347章', '话', '', '1520582752', '2', '346');
INSERT INTO `yk_book_chapter` VALUES ('492', '2', '第348章', '话', '', '1520582752', '2', '347');
INSERT INTO `yk_book_chapter` VALUES ('493', '2', '第349章', '零话', '', '1520582752', '2', '348');
INSERT INTO `yk_book_chapter` VALUES ('494', '2', '第350章', '话', '', '1520582752', '2', '349');
INSERT INTO `yk_book_chapter` VALUES ('495', '2', '第351章', '话', '', '1520582752', '2', '350');
INSERT INTO `yk_book_chapter` VALUES ('496', '2', '第352章', '话', '', '1520582752', '2', '351');
INSERT INTO `yk_book_chapter` VALUES ('497', '2', '第353章', '话', '', '1520582752', '2', '352');
INSERT INTO `yk_book_chapter` VALUES ('498', '2', '第354章', '话', '', '1520582752', '2', '353');
INSERT INTO `yk_book_chapter` VALUES ('499', '2', '第355章', '话', '', '1520582752', '2', '354');
INSERT INTO `yk_book_chapter` VALUES ('500', '2', '第356章', '话', '', '1520582752', '2', '355');
INSERT INTO `yk_book_chapter` VALUES ('501', '2', '第357章', '话', '', '1520582752', '2', '356');
INSERT INTO `yk_book_chapter` VALUES ('502', '2', '第358章', '话', '', '1520582752', '2', '357');
INSERT INTO `yk_book_chapter` VALUES ('503', '2', '第359章', '零话', '', '1520582752', '2', '358');
INSERT INTO `yk_book_chapter` VALUES ('504', '2', '第360章', '话', '', '1520582752', '2', '359');
INSERT INTO `yk_book_chapter` VALUES ('505', '2', '第361章', '话', '', '1520582752', '2', '360');
INSERT INTO `yk_book_chapter` VALUES ('506', '2', '第362章', '话', '', '1520582752', '2', '361');
INSERT INTO `yk_book_chapter` VALUES ('507', '2', '第363章', '话', '', '1520582752', '2', '362');
INSERT INTO `yk_book_chapter` VALUES ('508', '2', '第364章', '话', '', '1520582752', '2', '363');
INSERT INTO `yk_book_chapter` VALUES ('509', '2', '第365章', '话', '', '1520582752', '2', '364');
INSERT INTO `yk_book_chapter` VALUES ('510', '2', '第366章', '话', '', '1520582752', '2', '365');
INSERT INTO `yk_book_chapter` VALUES ('511', '2', '第367章', '话', '', '1520582752', '2', '366');
INSERT INTO `yk_book_chapter` VALUES ('512', '2', '第368章', '话', '', '1520582752', '2', '367');
INSERT INTO `yk_book_chapter` VALUES ('513', '2', '第369章', '零话', '', '1520582752', '2', '368');
INSERT INTO `yk_book_chapter` VALUES ('514', '2', '第370章', '话', '', '1520582752', '2', '369');
INSERT INTO `yk_book_chapter` VALUES ('515', '2', '第371章', '话', '', '1520582752', '2', '370');
INSERT INTO `yk_book_chapter` VALUES ('516', '2', '第372章', '话', '', '1520582752', '2', '371');
INSERT INTO `yk_book_chapter` VALUES ('517', '2', '第373章', '话', '', '1520582752', '2', '372');
INSERT INTO `yk_book_chapter` VALUES ('518', '2', '第374章', '话', '', '1520582752', '2', '373');
INSERT INTO `yk_book_chapter` VALUES ('519', '2', '第375章', '话', '', '1520582752', '2', '374');
INSERT INTO `yk_book_chapter` VALUES ('520', '2', '第376章', '话', '', '1520582752', '2', '375');
INSERT INTO `yk_book_chapter` VALUES ('521', '2', '第377章', '话', '', '1520582752', '2', '376');
INSERT INTO `yk_book_chapter` VALUES ('522', '2', '第378章', '话', '', '1520582752', '2', '377');
INSERT INTO `yk_book_chapter` VALUES ('523', '2', '第379章', '零话', '', '1520582752', '2', '378');
INSERT INTO `yk_book_chapter` VALUES ('524', '2', '第380章', '话', '', '1520582752', '2', '379');
INSERT INTO `yk_book_chapter` VALUES ('525', '2', '第381章', '话', '', '1520582752', '2', '380');
INSERT INTO `yk_book_chapter` VALUES ('526', '2', '第382章', '话', '', '1520582752', '2', '381');
INSERT INTO `yk_book_chapter` VALUES ('527', '2', '第383章', '话', '', '1520582752', '2', '382');
INSERT INTO `yk_book_chapter` VALUES ('528', '2', '第384章', '话', '', '1520582752', '2', '383');
INSERT INTO `yk_book_chapter` VALUES ('529', '2', '第385章', '话', '', '1520582752', '2', '384');
INSERT INTO `yk_book_chapter` VALUES ('530', '2', '第386章', '话', '', '1520582752', '2', '385');
INSERT INTO `yk_book_chapter` VALUES ('531', '2', '第387章', '话', '', '1520582752', '2', '386');
INSERT INTO `yk_book_chapter` VALUES ('532', '2', '第388章', '话', '', '1520582752', '2', '387');
INSERT INTO `yk_book_chapter` VALUES ('533', '2', '第389章', '零话', '', '1520582752', '2', '388');
INSERT INTO `yk_book_chapter` VALUES ('534', '2', '第390章', '话', '', '1520582752', '2', '389');
INSERT INTO `yk_book_chapter` VALUES ('535', '2', '第391章', '话', '', '1520582752', '2', '390');
INSERT INTO `yk_book_chapter` VALUES ('536', '2', '第392章', '话', '', '1520582752', '2', '391');
INSERT INTO `yk_book_chapter` VALUES ('537', '2', '第393章', '话', '', '1520582752', '2', '392');
INSERT INTO `yk_book_chapter` VALUES ('538', '2', '第394章', '话', '', '1520582752', '2', '393');
INSERT INTO `yk_book_chapter` VALUES ('539', '2', '第395章', '话', '', '1520582752', '2', '394');
INSERT INTO `yk_book_chapter` VALUES ('540', '2', '第396章', '话', '', '1520582752', '2', '395');
INSERT INTO `yk_book_chapter` VALUES ('541', '2', '第397章', '话', '', '1520582752', '2', '396');
INSERT INTO `yk_book_chapter` VALUES ('542', '2', '第398章', '话', '', '1520582752', '2', '397');
INSERT INTO `yk_book_chapter` VALUES ('543', '2', '第399章', '零零话', '', '1520582752', '2', '398');
INSERT INTO `yk_book_chapter` VALUES ('544', '2', '第400章', '零一话', '', '1520582752', '2', '399');
INSERT INTO `yk_book_chapter` VALUES ('545', '2', '第401章', '零二话', '', '1520582752', '2', '400');
INSERT INTO `yk_book_chapter` VALUES ('546', '2', '第402章', '零三话', '', '1520582752', '2', '401');
INSERT INTO `yk_book_chapter` VALUES ('547', '2', '第403章', '零四话', '', '1520582752', '2', '402');
INSERT INTO `yk_book_chapter` VALUES ('548', '2', '第404章', '零五话', '', '1520582752', '2', '403');
INSERT INTO `yk_book_chapter` VALUES ('549', '2', '第405章', '零六话', '', '1520582752', '2', '404');
INSERT INTO `yk_book_chapter` VALUES ('550', '2', '第406章', '零七话', '', '1520582752', '2', '405');
INSERT INTO `yk_book_chapter` VALUES ('551', '2', '第407章', '零八话', '', '1520582752', '2', '406');
INSERT INTO `yk_book_chapter` VALUES ('552', '2', '第408章', '零九话', '', '1520582752', '2', '407');
INSERT INTO `yk_book_chapter` VALUES ('553', '2', '第409章', '零话', '', '1520582752', '2', '408');
INSERT INTO `yk_book_chapter` VALUES ('554', '2', '第410章', '话', '', '1520582752', '2', '409');
INSERT INTO `yk_book_chapter` VALUES ('555', '2', '第411章', '话', '', '1520582752', '2', '410');
INSERT INTO `yk_book_chapter` VALUES ('556', '2', '第412章', '话', '', '1520582752', '2', '411');
INSERT INTO `yk_book_chapter` VALUES ('557', '2', '第413章', '话', '', '1520582752', '2', '412');
INSERT INTO `yk_book_chapter` VALUES ('558', '2', '第414章', '话', '', '1520582752', '2', '413');
INSERT INTO `yk_book_chapter` VALUES ('559', '2', '第415章', '话', '', '1520582752', '2', '414');
INSERT INTO `yk_book_chapter` VALUES ('560', '2', '第416章', '话', '', '1520582752', '2', '415');
INSERT INTO `yk_book_chapter` VALUES ('561', '2', '第417章', '话', '', '1520582752', '2', '416');
INSERT INTO `yk_book_chapter` VALUES ('562', '2', '第418章', '话', '', '1520582752', '2', '417');
INSERT INTO `yk_book_chapter` VALUES ('563', '2', '第419章', '零话', '', '1520582752', '2', '418');
INSERT INTO `yk_book_chapter` VALUES ('564', '2', '第420章', '话', '', '1520582752', '2', '419');
INSERT INTO `yk_book_chapter` VALUES ('565', '2', '第421章', '话', '', '1520582752', '2', '420');
INSERT INTO `yk_book_chapter` VALUES ('566', '2', '第422章', '话', '', '1520582752', '2', '421');
INSERT INTO `yk_book_chapter` VALUES ('567', '27', '第一章', '中毒没救了', '　　“阿瑾，我们再也不吵架了好不好？”宇文烨抱着她，声音里带着嘶哑的道。\r\n　　“那看你的表现咯。”楼兮瑾嘴角勾着一抹笑，宇文烨立即道：“我一定好好表现！”\r\n　　楼兮瑾笑了起来，看到衣服散落在地上，……', '1521034018', '1', '1');
INSERT INTO `yk_book_chapter` VALUES ('568', '27', '第二章', '做一件大事', '　　回忆到此处，楼兮瑾的思绪被一个人给撞断：“没长眼睛呐！”那撞了她的人，嚣张的骂道，换做是平常的她，早就一把抓过他的衣领，先教育一顿再说，但是现在她一点兴趣也没有。\r\n　　想想为了保护娘亲，为了让这具柔弱的身体变得强大，这些年她付出了多少倍的努力。\r\n　　千机府与普通的衙门不一样，这是先帝当年亲手建立的，规模极广，里面的学员性别不限，断案能力更是万里挑一的，而且不畏生死，忠心耿耿。他们拥有特殊权利——先斩后奏。\r\n　　就是县衙的官爷遇到他们，也得礼让三分。千机府的存在，让大臣们都不敢轻易贪赃纳贿，凡是落到千机府手上，剥皮抽筋十八大酷刑，保准让你后悔来这世上走一遭。\r\n　　如今她好不容易混到千机巡队长的地位，可还没当满两年她就要……楼兮瑾真想对着老天爷大吼一声“天妒英才啊——”。\r\n　　然而感叹自己悲惨命运的同时，楼兮瑾脑中忽然闪过一个名字。一想到这个人楼兮瑾就恨得牙痒痒。自打她来到浊晏城后，大大小小的案子哪个她不能解决的，唯独这个姬无夜。每一次，当她赶到犯案现场时，对方总会留给她两个字：“废物。”\r\n　　她生平最恨别人骂她废物。\r\n　　忽然间将手中的纸条撕碎，楼兮瑾眉目凌厉，既然要死了，那么就做一桩大事吧！也不负来这里一遭。整理了一下衣服，她回去张罗了一下，将自己住的房子给当掉了，娘亲给留给她的首饰，也全部都当光光了。\r\n　　处理好一切之后，她便去信馆，找人写了一封信给千机府右副将军，随即去了流民巷。在浊晏城里，流民巷是最荒凉的一个巷子，里面住的大多数是流民以及乞丐，但是其中有一个人，算是奇人了。\r\n　　这还是办案多年，她发现的呢。那有一个老乞丐，叫万事通，顾名思义便知道了是什么意思。一进巷子口，一阵阴风吹过，好不荒凉。\r\n　　万事通在一个角落里坐着，面前的碗没有几个铜钱。楼兮瑾慢慢的走到他的面前，将三块碎银子，丢在了他的碗里。\r\n　　对面的乞丐微微一愣，随即抬头，便看见了楼兮瑾，嘴角勾着笑意，她英眉长得既有女人的温婉，却又有男人的英气。眼睛是标准的桃花眼，鼻子细致而又小巧，大小适中的唇，此刻微微的翘起来。\r\n　　“官……”\r\n　　“我要查一个人，信息属实，给你十两银子，你看如何？”蹲在万事通面前，楼兮瑾笑着道，她的嗓音带着几分性感，让男人浮想翩翩。\r\n　　“谁？”万事通收集着整个浊晏城的情报，只有你想不到，没有他收集不到的。男人脏兮兮的脸上带着几分兴奋，想到有十两银子，他就兴奋得不得了。\r\n　　“风轻楼楼主——姬无夜，最近有什么行动？”楼兮瑾也懒得跟他绕弯子了，直截了当的说着。\r\n　　“姬无夜三日之后，从雁州到浊晏城的百花楼里见一个苗疆商人。官爷，不瞒你说，据消息透露……这风轻楼好似又有什么大动作。不过途中有一酒楼，从雁州到浊晏城，路途遥远，他们一定会在那酒楼歇脚，官爷，想要做什么，那里最合适！”万事通小声的说完，便瞧着楼兮瑾的表情。\r\n　　楼兮瑾表情没什么变化，只是从怀里摸出十两碎银，丢到了他的碗里，起身便离去了。苗疆盛产蛊毒，如果蛊毒加入醉梦生里，又不知道害多少无辜百姓！\r\n　　姬无夜，我一定要将你绳之以法！！在心中想着，楼兮瑾的脸臭臭的。\r\n', '1521034018', '1', '2');
INSERT INTO `yk_book_chapter` VALUES ('569', '27', '第三章', '风轻楼楼主', '　　三日后，浊晏城郊外的小道上，一辆华丽的车辇慢慢的行驶着。午后的太阳很是刺眼，又热辣辣的，即便如此，那护在马车周围的四个人，却是丝毫感受也没有一样，顶着烈日，护着车辇。\r\n　　车辇慢慢的来到了一家酒楼前，然后便停了下来。四个护卫一般的人，其中一人上前，将帘子掀开，低声道：“爷，旁边有一酒楼，需要进去歇息吗？”\r\n　　“嗯，看午时是赶不到浊晏城了，大伙儿就先在这里吃了午膳，我们再继续赶路。”车里的男人声音冷冷的，不带一丝温度，像是夹杂着冰屑一般，然而声音又格外的清冽动听。\r\n　　说完，男人便从马车里出来了，一身乳白色衣袍，身上的暗金繁花纹随着他的动作，漾出水波一般的光华来。\r\n　　男人高冠束发，一支雕刻着繁复纹路的镶金玉簪固定着发髻，有少许的头发从脖颈溜出来，垂落在胸前，风一吹，便青丝曼舞，显得他整个人也飘逸了起来。而他漂亮的额头全部露出来，又平添几分王者之气。\r\n　　男人长眉飞扬，凤眸清冷，眼眸线条更是流畅，刀削斧刻般的鼻子，特别有立体感，薄唇微粉，还带着水色，一张立体感极其好的脸，皮肤白皙而又干净，整个人俊得出尘脱俗，如同仙人一般。\r\n　　然而那全身冷冽的气质，却让人不敢靠近半分，原本出来准备吆喝的小二哥被他那样随意的瞥了一眼，就吓得不敢做声了。这人天生像是王者一般，一双冷冰冰的眼睛，跟会说话一样。\r\n　　下了马车，男人习惯性的转了一下左边拇指上的扳指，便慢慢的进入了酒楼，看到酒楼简陋的环境，不自觉的皱了一下眉头。没有单独的包间，这就意味着，他要跟这些莽夫和吵闹的人一起享用午膳了。\r\n　　“哼，有的地方吃喝就不错了，尼玛还一脸嫌弃！”趴在屋顶上，拿着自制注射器的楼兮瑾小声的鄙夷着，烈日真是要晒死她了，为了等这个头号要犯，她已经在这里晒了三天，终于给她等来了。\r\n　　心中略带兴奋，她跟着姬无夜的移动，也手脚并用的爬着。将瓦片揭开一个缝隙再盖上，她不住的调整着位置。\r\n　　姬无夜的到来，放佛如同寒冬的凛冽寒风也到来了一样，让人打了个寒颤之后，连话也不敢说了。坐在一个靠窗的地方，他面容冷冷的，薄唇微抿，一看就是个不好打交道的人。\r\n　　小二赶紧拿来菜谱，断是不敢多言一句，到这里来歇脚的客人，往往是进出浊晏城的，浊晏城鱼龙混杂，遇到这些性格怪异的，小二们也很识相的。\r\n　　姬无夜随便的点了几个菜，便扭头看向了外面，身边的护卫，一个给他倒茶，一个给他扇扇子，好不高高在上，让旁边诸多人羡慕不已。\r\n　　他的护卫给他倒了茶，一旁的几个男人在他到来的时候，就盯着姬无夜，看他捧起茶就要喝下去的时候，其中一个大汉忽然大声的闹了起来。\r\n　　“喂，老板，菜怎么还没上啊？！不要看到人家是贵公子，就先给人家上菜啊！”果然，那人的话刚说完，姬无夜这边四个侍卫以及他，全部看过去了。就在此时，拿着注射器趴在屋顶的楼兮瑾，将注射器一按，一滴水珠，就准确无误的滴落在姬无夜的茶杯里了。\r\n', '1521034018', '1', '3');
INSERT INTO `yk_book_chapter` VALUES ('570', '27', '第四章', '给你打针咯', '', '1521034018', '1', '4');
INSERT INTO `yk_book_chapter` VALUES ('571', '27', '第五章', '审问犯人', '', '1521034018', '1', '5');
INSERT INTO `yk_book_chapter` VALUES ('572', '27', '第六章', '暴力女', '', '1521034018', '1', '6');
INSERT INTO `yk_book_chapter` VALUES ('573', '27', '第七章', '挖下你的眼珠子', '', '1521034018', '1', '7');
INSERT INTO `yk_book_chapter` VALUES ('574', '27', '第八章', '立即去死', '', '1521034018', '1', '8');
INSERT INTO `yk_book_chapter` VALUES ('575', '27', '第九章', '手段更狠', '', '1521034018', '1', '9');
INSERT INTO `yk_book_chapter` VALUES ('576', '27', '第十章', '我不敢', '', '1521034018', '1', '10');
INSERT INTO `yk_book_chapter` VALUES ('577', '27', '第十一章', '我很讲理', '', '1521034018', '2', '11');
INSERT INTO `yk_book_chapter` VALUES ('578', '27', '第十二章', '继续逼问', '', '1521034018', '2', '12');
INSERT INTO `yk_book_chapter` VALUES ('579', '27', '第十三章', '束手无策', '', '1521034018', '2', '13');
INSERT INTO `yk_book_chapter` VALUES ('580', '27', '第十四章', '厚颜无耻', '', '1521034018', '2', '14');
INSERT INTO `yk_book_chapter` VALUES ('581', '27', '第十五章', '我要淡定', '', '1521034018', '2', '15');
INSERT INTO `yk_book_chapter` VALUES ('582', '27', '第十六章', '隐隐不对', '', '1521034018', '2', '16');
INSERT INTO `yk_book_chapter` VALUES ('583', '27', '第十七章', '我被坑了', '', '1521034018', '2', '17');
INSERT INTO `yk_book_chapter` VALUES ('584', '27', '第十八章', '我要完了', '', '1521034018', '2', '18');
INSERT INTO `yk_book_chapter` VALUES ('585', '27', '第十九章', '走为上计', '', '1521034018', '2', '19');
INSERT INTO `yk_book_chapter` VALUES ('586', '27', '第二十章', '大哥找到了', '', '1521034018', '2', '20');
INSERT INTO `yk_book_chapter` VALUES ('587', '27', '第二十一章', '入赘青楼', '', '1521034018', '2', '21');
INSERT INTO `yk_book_chapter` VALUES ('588', '27', '第二十二章', '你坏我好事', '', '1521034018', '2', '22');
INSERT INTO `yk_book_chapter` VALUES ('589', '27', '第二十三章', '我被鬼上身', '', '1521034018', '2', '23');
INSERT INTO `yk_book_chapter` VALUES ('590', '27', '第二十四章', '女人要三从四德', '', '1521034018', '2', '24');
INSERT INTO `yk_book_chapter` VALUES ('591', '27', '第二十五章', '我有梦游症', '', '1521034018', '2', '25');
INSERT INTO `yk_book_chapter` VALUES ('592', '27', '第二十六章', '她的过去', '', '1521034018', '2', '26');
INSERT INTO `yk_book_chapter` VALUES ('593', '27', '第二十七章', '我有个要求', '', '1521034018', '2', '27');
INSERT INTO `yk_book_chapter` VALUES ('594', '27', '第二十八章', '她不是舞姬', '', '1521034018', '2', '28');
INSERT INTO `yk_book_chapter` VALUES ('595', '27', '第二十九章', '故意捉弄', '', '1521034018', '2', '29');
INSERT INTO `yk_book_chapter` VALUES ('596', '27', '第三十章', '谁要你同情了', '', '1521034018', '2', '30');
INSERT INTO `yk_book_chapter` VALUES ('597', '27', '第三十一章', '不识字的女人', '', '1521034018', '2', '31');
INSERT INTO `yk_book_chapter` VALUES ('598', '27', '第三十二章', '不懂浪漫的女人', '', '1521034018', '2', '32');
INSERT INTO `yk_book_chapter` VALUES ('599', '27', '第三十三章', '认真开玩笑', '', '1521034018', '2', '33');
INSERT INTO `yk_book_chapter` VALUES ('600', '27', '第三十四章', '我很老实', '', '1521034018', '2', '34');
INSERT INTO `yk_book_chapter` VALUES ('601', '27', '第三十五章', '看着他们交易', '', '1521034018', '2', '35');
INSERT INTO `yk_book_chapter` VALUES ('602', '27', '第三十六章', '', '', '1521034018', '2', '36');
INSERT INTO `yk_book_chapter` VALUES ('603', '27', '第三十七章', '求救信件', '', '1521034018', '2', '37');
INSERT INTO `yk_book_chapter` VALUES ('604', '27', '第三十八章', '被逼逃命', '', '1521034018', '2', '38');
INSERT INTO `yk_book_chapter` VALUES ('605', '27', '第三十九章', '捉拿姬无夜', '', '1521034018', '2', '39');
INSERT INTO `yk_book_chapter` VALUES ('606', '27', '第四十章', '我们谈谈', '', '1521034018', '2', '40');
INSERT INTO `yk_book_chapter` VALUES ('607', '27', '第四十一章', '我什么都没做', '', '1521034018', '2', '41');
INSERT INTO `yk_book_chapter` VALUES ('608', '27', '第四十二章', '真相揭幕', '', '1521034018', '2', '42');
INSERT INTO `yk_book_chapter` VALUES ('609', '27', '第四十三章', '回到浊晏城', '', '1521034018', '2', '43');
INSERT INTO `yk_book_chapter` VALUES ('610', '27', '第四十四章', '接案子', '', '1521034018', '2', '44');
INSERT INTO `yk_book_chapter` VALUES ('611', '27', '第四十五章', '蛊毒药方', '', '1521034018', '2', '45');
INSERT INTO `yk_book_chapter` VALUES ('612', '27', '第四十六章', '开始办案', '', '1521034018', '2', '46');
INSERT INTO `yk_book_chapter` VALUES ('613', '27', '第四十七章', '紫衣美男', '', '1521034018', '2', '47');
INSERT INTO `yk_book_chapter` VALUES ('614', '27', '第四十八章', '梅少翎', '', '1521034018', '2', '48');
INSERT INTO `yk_book_chapter` VALUES ('615', '27', '第四十九章', '中原人真凶残', '', '1521034018', '2', '49');
INSERT INTO `yk_book_chapter` VALUES ('616', '27', '第五十章', '狼犬的厉害', '', '1521034018', '2', '50');
INSERT INTO `yk_book_chapter` VALUES ('617', '27', '第五十一章', '抓到罪犯', '', '1521034018', '2', '51');
INSERT INTO `yk_book_chapter` VALUES ('618', '27', '第五十二章', '救了他的客人', '', '1521034018', '2', '52');
INSERT INTO `yk_book_chapter` VALUES ('619', '27', '第五十三章', '我好冤啊', '', '1521034018', '2', '53');
INSERT INTO `yk_book_chapter` VALUES ('620', '27', '第五十四章', '大哥不高兴了', '', '1521034018', '2', '54');
INSERT INTO `yk_book_chapter` VALUES ('621', '27', '第五十五章', '你个死傲娇', '', '1521034018', '2', '55');
INSERT INTO `yk_book_chapter` VALUES ('622', '27', '第五十六章', '高贵的胸肌', '', '1521034018', '2', '56');
INSERT INTO `yk_book_chapter` VALUES ('623', '27', '第五十七章', '这厮发情了', '', '1521034018', '2', '57');
INSERT INTO `yk_book_chapter` VALUES ('624', '27', '第五十八章', '给点福利你们大哥', '', '1521034018', '2', '58');
INSERT INTO `yk_book_chapter` VALUES ('625', '27', '第五十九章', '大哥缺女人吗', '', '1521034018', '2', '59');
INSERT INTO `yk_book_chapter` VALUES ('626', '27', '第六十章', '你是变态吗', '', '1521034018', '2', '60');
INSERT INTO `yk_book_chapter` VALUES ('627', '27', '第六十一章', '忽然到来的妹妹', '', '1521034018', '2', '61');
INSERT INTO `yk_book_chapter` VALUES ('628', '27', '第六十二章', '案件不是儿戏', '', '1521034018', '2', '62');
INSERT INTO `yk_book_chapter` VALUES ('629', '27', '第六十三章', '不哭下次继续', '', '1521034018', '2', '63');
INSERT INTO `yk_book_chapter` VALUES ('630', '27', '第六十四章', '一个大胆的决定', '', '1521034018', '2', '64');
INSERT INTO `yk_book_chapter` VALUES ('631', '27', '第六十五章', '半夜挖坟', '', '1521034018', '2', '65');
INSERT INTO `yk_book_chapter` VALUES ('632', '27', '第六十六章', '换取彼此想要的', '', '1521034018', '2', '66');
INSERT INTO `yk_book_chapter` VALUES ('633', '27', '第六十七章', '别动我的狗', '', '1521034018', '2', '67');
INSERT INTO `yk_book_chapter` VALUES ('634', '27', '第六十八章', '母狗叫直直', '', '1521034018', '2', '68');
INSERT INTO `yk_book_chapter` VALUES ('635', '27', '第六十九章', '我被打针了', '', '1521034018', '2', '69');
INSERT INTO `yk_book_chapter` VALUES ('636', '27', '第七十章', '彻底被撤职', '', '1521034018', '2', '70');
INSERT INTO `yk_book_chapter` VALUES ('637', '27', '第七十一章', '道别是永远再见', '', '1521034018', '2', '71');
INSERT INTO `yk_book_chapter` VALUES ('638', '27', '第七十二章', '你克妻', '', '1521034018', '2', '72');
INSERT INTO `yk_book_chapter` VALUES ('639', '27', '第七十三章', '她是来勾引你的', '', '1521034018', '2', '73');
INSERT INTO `yk_book_chapter` VALUES ('640', '27', '第七十四章', '楚冰绡被欺负了', '', '1521034018', '2', '74');
INSERT INTO `yk_book_chapter` VALUES ('641', '27', '第七十五章', '我可以玩阴招', '', '1521034018', '2', '75');
INSERT INTO `yk_book_chapter` VALUES ('642', '27', '第七十六章', '时来运转', '', '1521034018', '2', '76');
INSERT INTO `yk_book_chapter` VALUES ('643', '27', '第七十七章', '新的案件', '', '1521034018', '2', '77');
INSERT INTO `yk_book_chapter` VALUES ('644', '27', '第七十八章', '进入徐府', '', '1521034018', '2', '78');
INSERT INTO `yk_book_chapter` VALUES ('645', '27', '第七十九章', '心中的疑问', '', '1521034018', '2', '79');
INSERT INTO `yk_book_chapter` VALUES ('646', '27', '第八十章', '错综复杂', '', '1521034018', '2', '80');
INSERT INTO `yk_book_chapter` VALUES ('647', '27', '第八十一章', '中了飞镖', '', '1521034018', '2', '81');
INSERT INTO `yk_book_chapter` VALUES ('648', '27', '第八十二章', '公报私仇', '', '1521034018', '2', '82');
INSERT INTO `yk_book_chapter` VALUES ('649', '27', '第八十三章', '无耻的人', '', '1521034018', '2', '83');
INSERT INTO `yk_book_chapter` VALUES ('650', '27', '第八十四章', '秘密剿匪', '', '1521034018', '2', '84');
INSERT INTO `yk_book_chapter` VALUES ('651', '27', '第八十五章', '僵持的局面', '', '1521034018', '2', '85');
INSERT INTO `yk_book_chapter` VALUES ('652', '27', '第八十六章', '局面白热化', '', '1521034018', '2', '86');
INSERT INTO `yk_book_chapter` VALUES ('653', '27', '第八十七章', '什么事儿', '', '1521034018', '2', '87');
INSERT INTO `yk_book_chapter` VALUES ('654', '27', '第八十八章', '并未结束', '', '1521034018', '2', '88');
INSERT INTO `yk_book_chapter` VALUES ('655', '27', '第八十九章', '穆沙的心愿', '', '1521034018', '2', '89');
INSERT INTO `yk_book_chapter` VALUES ('656', '27', '第九十章', '徐鹤的计谋', '', '1521034018', '2', '90');
INSERT INTO `yk_book_chapter` VALUES ('657', '27', '第九十一章', '办案狂魔', '', '1521034018', '2', '91');
INSERT INTO `yk_book_chapter` VALUES ('658', '27', '第九十二章', '身体不舒服', '', '1521034018', '2', '92');
INSERT INTO `yk_book_chapter` VALUES ('659', '27', '第九十三章', '为你一掷千金', '', '1521034018', '2', '93');
INSERT INTO `yk_book_chapter` VALUES ('660', '27', '第九十四章', '盗乌鸡汤的贼', '', '1521034018', '2', '94');
INSERT INTO `yk_book_chapter` VALUES ('661', '27', '第九十五章', '不识好歹的女人', '', '1521034018', '2', '95');
INSERT INTO `yk_book_chapter` VALUES ('662', '27', '第九十六章', '小弟们带了补品', '', '1521034018', '2', '96');
INSERT INTO `yk_book_chapter` VALUES ('663', '27', '第九十七章', '害怕男人的受害者', '', '1521034018', '2', '97');
INSERT INTO `yk_book_chapter` VALUES ('664', '27', '第九十八章', '穆和女扮男装助查案', '', '1521034018', '2', '98');
INSERT INTO `yk_book_chapter` VALUES ('665', '27', '第九十九章', '捣乱专业户', '', '1521034018', '2', '99');
INSERT INTO `yk_book_chapter` VALUES ('666', '27', '第一百章', '凶手潜伏在身边', '', '1521034018', '2', '100');
INSERT INTO `yk_book_chapter` VALUES ('667', '27', '第一百零一章', '身处险境', '', '1521034018', '2', '101');
INSERT INTO `yk_book_chapter` VALUES ('668', '27', '第一百零二章', '理亏不说话', '', '1521034018', '2', '102');
INSERT INTO `yk_book_chapter` VALUES ('669', '27', '第一百零三章', '爱美之心人皆有之', '', '1521034018', '2', '103');
INSERT INTO `yk_book_chapter` VALUES ('670', '27', '第一百零四章', '大哥专治各种不服', '', '1521034018', '2', '104');
INSERT INTO `yk_book_chapter` VALUES ('671', '27', '第一百零五章', '燕北朝美男天团', '', '1521034018', '2', '105');
INSERT INTO `yk_book_chapter` VALUES ('672', '27', '第一百零六章', '这女人他想打死她！', '', '1521034018', '2', '106');
INSERT INTO `yk_book_chapter` VALUES ('673', '27', '第一百零七章', '当众被公主抱', '', '1521034018', '2', '107');
INSERT INTO `yk_book_chapter` VALUES ('674', '27', '第一百零八章', '只是想教训她', '', '1521034018', '2', '108');
INSERT INTO `yk_book_chapter` VALUES ('675', '27', '第一百零九章', '嫂子是什么鬼', '', '1521034018', '2', '109');
INSERT INTO `yk_book_chapter` VALUES ('676', '27', '第一百一十章', '出发去苗疆', '', '1521034018', '2', '110');
INSERT INTO `yk_book_chapter` VALUES ('677', '27', '第一百一十一章', '梅少翎那么浪是有缘由的', '', '1521034018', '2', '111');
INSERT INTO `yk_book_chapter` VALUES ('678', '27', '第一百一十二章', '不是冤家不聚头', '', '1521034018', '2', '112');
INSERT INTO `yk_book_chapter` VALUES ('679', '27', '第一百一十三章', '被蛇围攻', '', '1521034018', '2', '113');
INSERT INTO `yk_book_chapter` VALUES ('680', '27', '第一百一十四章', '猜不透他的心思', '', '1521034018', '2', '114');
INSERT INTO `yk_book_chapter` VALUES ('681', '27', '第一百一十五章', '喜欢招蜂引蝶的梅少翎', '', '1521034018', '2', '115');
INSERT INTO `yk_book_chapter` VALUES ('682', '27', '第一百一十六章', '水中突如其来的危险', '', '1521034018', '2', '116');
INSERT INTO `yk_book_chapter` VALUES ('683', '27', '第一百一十七章', '我救了你们', '', '1521034018', '2', '117');
INSERT INTO `yk_book_chapter` VALUES ('684', '27', '第一百一十八章', '大哥暂时缺乏安全感', '', '1521034018', '2', '118');
INSERT INTO `yk_book_chapter` VALUES ('685', '27', '第一百一十九章', '我好像在哪里见过他', '', '1521034018', '2', '119');
INSERT INTO `yk_book_chapter` VALUES ('686', '27', '第一百二十章', '不相信任何人', '', '1521034018', '2', '120');
INSERT INTO `yk_book_chapter` VALUES ('687', '27', '第一百二十一章', '她偷走了重要的秘密', '', '1521034018', '2', '121');
INSERT INTO `yk_book_chapter` VALUES ('688', '27', '第一百二十二章', '偷鸡不成蚀把米', '', '1521034018', '2', '122');
INSERT INTO `yk_book_chapter` VALUES ('689', '27', '第一百二十三章', '她急了要吞纸', '', '1521034018', '2', '123');
INSERT INTO `yk_book_chapter` VALUES ('690', '27', '第一百二十四章', '暴躁的女人', '', '1521034018', '2', '124');
INSERT INTO `yk_book_chapter` VALUES ('691', '27', '第一百二十五章', '少年已惊艳时光', '', '1521034018', '2', '125');
INSERT INTO `yk_book_chapter` VALUES ('692', '27', '第一百二十六章', '她仍需努力', '', '1521034018', '2', '126');
INSERT INTO `yk_book_chapter` VALUES ('693', '27', '第一百二十七章', '案件有诸多疑点', '', '1521034018', '2', '127');
INSERT INTO `yk_book_chapter` VALUES ('694', '27', '第一百二十八章', '想当替死鬼的嫌犯', '', '1521034018', '2', '128');
INSERT INTO `yk_book_chapter` VALUES ('695', '27', '第一百二十九章', '红豆寄相思', '', '1521034018', '2', '129');
INSERT INTO `yk_book_chapter` VALUES ('696', '27', '第一百三十章', '掉落的红豆', '', '1521034018', '2', '130');
INSERT INTO `yk_book_chapter` VALUES ('697', '27', '第一百三十一章', '案件终结', '', '1521034018', '2', '131');
INSERT INTO `yk_book_chapter` VALUES ('698', '27', '第一百三十二章', '帮小舞赎身', '', '1521034018', '2', '132');
INSERT INTO `yk_book_chapter` VALUES ('699', '27', '第一百三十三章', '队长你太奸诈我不信你', '', '1521034018', '2', '133');
INSERT INTO `yk_book_chapter` VALUES ('700', '27', '第一百三十四章', '卧底养成计划', '', '1521034018', '2', '134');
INSERT INTO `yk_book_chapter` VALUES ('701', '27', '第一百三十五章', '帮虞舞你要付出代价', '', '1521034018', '2', '135');
INSERT INTO `yk_book_chapter` VALUES ('702', '27', '第一百三十六章', '不要谋杀亲夫', '', '1521034018', '2', '136');
INSERT INTO `yk_book_chapter` VALUES ('703', '27', '第一百三十七章', '无需虚以委蛇我不喜欢', '', '1521034018', '2', '137');
INSERT INTO `yk_book_chapter` VALUES ('704', '27', '第一百三十八章', '凑不要脸的别叫我阿瑾', '', '1521034018', '2', '138');
INSERT INTO `yk_book_chapter` VALUES ('705', '27', '第一百三十九章', '被吐了一身的大哥要崩溃', '', '1521034018', '2', '139');
INSERT INTO `yk_book_chapter` VALUES ('706', '27', '第一百四十章', '亲你一下不哭好不好', '', '1521034018', '2', '140');
INSERT INTO `yk_book_chapter` VALUES ('707', '27', '第一百四十一章', '都有夫妻之实就别害羞了', '', '1521034018', '2', '141');
INSERT INTO `yk_book_chapter` VALUES ('708', '27', '第一百四十二章', '出师未捷身先死', '', '1521034018', '2', '142');
INSERT INTO `yk_book_chapter` VALUES ('709', '27', '第一百四十三章', '倒霉透顶的未来卧底', '', '1521034018', '2', '143');
INSERT INTO `yk_book_chapter` VALUES ('710', '27', '第一百四十四章', '绝情冷血的人注孤生', '', '1521034018', '2', '144');
INSERT INTO `yk_book_chapter` VALUES ('711', '27', '第一百四十五章', '命运相同的人会相互吸引', '', '1521034018', '2', '145');
INSERT INTO `yk_book_chapter` VALUES ('712', '27', '第一百四十六章', '她是吃醋了吗', '', '1521034018', '2', '146');
INSERT INTO `yk_book_chapter` VALUES ('713', '27', '第一百四十七章', '冰绡的临时改变', '', '1521034018', '2', '147');
INSERT INTO `yk_book_chapter` VALUES ('714', '27', '第一百四十八章', '', '', '1521034018', '2', '148');
INSERT INTO `yk_book_chapter` VALUES ('715', '27', '第一百四十九章', '惊现蛊毒', '', '1521034018', '2', '149');
INSERT INTO `yk_book_chapter` VALUES ('716', '27', '第一百五十章', '大哥，出大事了', '', '1521034018', '2', '150');
INSERT INTO `yk_book_chapter` VALUES ('717', '27', '第一百五十一章', '谁杀了徐鹤', '', '1521034018', '2', '151');
INSERT INTO `yk_book_chapter` VALUES ('718', '27', '第一百五十二章', '充满毒辣的眼瞳', '', '1521034018', '2', '152');
INSERT INTO `yk_book_chapter` VALUES ('719', '27', '第一百五十三章', '老有人跟风轻楼作对', '', '1521034018', '2', '153');
INSERT INTO `yk_book_chapter` VALUES ('720', '27', '第一百五十四章', '谁都横不过她', '', '1521034018', '2', '154');
INSERT INTO `yk_book_chapter` VALUES ('721', '27', '第一百五十五章', '姬无夜的无耻他们都见识过', '', '1521034018', '2', '155');
INSERT INTO `yk_book_chapter` VALUES ('722', '27', '第一百五十六章', '做人留一线，日后好相见', '', '1521034018', '2', '156');
INSERT INTO `yk_book_chapter` VALUES ('723', '27', '第一百五十七章', '别问贱贱的问题', '', '1521034018', '2', '157');
INSERT INTO `yk_book_chapter` VALUES ('724', '27', '第一百五十八章', '又有人要灭她楼兮瑾', '', '1521034018', '2', '158');
INSERT INTO `yk_book_chapter` VALUES ('725', '27', '第一百五十九章', '姬无夜的猜测', '', '1521034018', '2', '159');
INSERT INTO `yk_book_chapter` VALUES ('726', '27', '第一百六十章', '为了案子她决定妥协', '', '1521034018', '2', '160');
INSERT INTO `yk_book_chapter` VALUES ('727', '27', '第一百六十一章', '爱说说不说滚', '', '1521034018', '2', '161');
INSERT INTO `yk_book_chapter` VALUES ('728', '27', '第一百六十二章', '到嘴的肥肉舍不得吃', '', '1521034018', '2', '162');
INSERT INTO `yk_book_chapter` VALUES ('729', '27', '第一百六十三章', '红豆珠钗送佳人', '', '1521034018', '2', '163');
INSERT INTO `yk_book_chapter` VALUES ('730', '27', '第一百六十四章', '神秘的白衣男人', '', '1521034018', '2', '164');
INSERT INTO `yk_book_chapter` VALUES ('731', '27', '第一百六十五章', '目前事情一团糟', '', '1521034018', '2', '165');
INSERT INTO `yk_book_chapter` VALUES ('732', '27', '第一百六十六章', '首次官匪合作', '', '1521034018', '2', '166');
INSERT INTO `yk_book_chapter` VALUES ('733', '27', '第一百六十七章', '再乱动就吻你了', '', '1521034018', '2', '167');
INSERT INTO `yk_book_chapter` VALUES ('734', '27', '第一百六十八章', '搓你一层皮下来', '', '1521034018', '2', '168');
INSERT INTO `yk_book_chapter` VALUES ('735', '27', '第一百六十九章', '明天有好戏看', '', '1521034018', '2', '169');
INSERT INTO `yk_book_chapter` VALUES ('736', '27', '第一百七十章', '找茬的乌赛', '', '1521034018', '2', '170');
INSERT INTO `yk_book_chapter` VALUES ('737', '27', '第一百七十一章', '炸毛的楼兮瑾', '', '1521034018', '2', '171');
INSERT INTO `yk_book_chapter` VALUES ('738', '27', '第一百七十二章', '终于与穆沙见面', '', '1521034018', '2', '172');
INSERT INTO `yk_book_chapter` VALUES ('739', '27', '第一百七十三章', '兄弟决裂', '', '1521034018', '2', '173');
INSERT INTO `yk_book_chapter` VALUES ('740', '27', '第一百七十四章', '再错一次', '', '1521034018', '2', '174');
INSERT INTO `yk_book_chapter` VALUES ('741', '27', '第一百七十五章', '突如其来的变故', '', '1521034018', '2', '175');
INSERT INTO `yk_book_chapter` VALUES ('742', '27', '第一百七十六章', '老娘要被猪拱了', '', '1521034018', '2', '176');
INSERT INTO `yk_book_chapter` VALUES ('743', '27', '第一百七十七章', '自救', '', '1521034018', '2', '177');
INSERT INTO `yk_book_chapter` VALUES ('744', '27', '第一百七十八章', '就喜欢她的气势凌人', '', '1521034018', '2', '178');
INSERT INTO `yk_book_chapter` VALUES ('745', '27', '第一百七十九章', '得罪夜楼主没好下场的', '', '1521034018', '2', '179');
INSERT INTO `yk_book_chapter` VALUES ('746', '27', '第一百八十章', '患难见真情', '', '1521034018', '2', '180');
INSERT INTO `yk_book_chapter` VALUES ('747', '27', '第一百八十一章', '我可以后悔吗', '', '1521034018', '2', '181');
INSERT INTO `yk_book_chapter` VALUES ('748', '27', '第一百八十二章', '', '', '1521034018', '2', '182');
INSERT INTO `yk_book_chapter` VALUES ('749', '27', '第一百八十三章', '他的心，除了伤还有什么', '', '1521034018', '2', '183');
INSERT INTO `yk_book_chapter` VALUES ('750', '27', '第一百八十四章', '你何其残忍', '', '1521034018', '2', '184');
INSERT INTO `yk_book_chapter` VALUES ('751', '27', '第一百八十五章', '发现了不得了的事情', '', '1521034018', '2', '185');
INSERT INTO `yk_book_chapter` VALUES ('752', '27', '第一百八十六章', '宫殿一般的地下室', '', '1521034018', '2', '186');
INSERT INTO `yk_book_chapter` VALUES ('753', '27', '第一百八十七章', '他们最寒酸', '', '1521034018', '2', '187');
INSERT INTO `yk_book_chapter` VALUES ('754', '27', '第一百八十八章', '皇上宣进宫', '', '1521034018', '2', '188');
INSERT INTO `yk_book_chapter` VALUES ('755', '27', '第一百八十九章', '她升官了！', '', '1521034018', '2', '189');
INSERT INTO `yk_book_chapter` VALUES ('756', '27', '第一百九十章', '虚伪的家人', '', '1521034018', '2', '190');
INSERT INTO `yk_book_chapter` VALUES ('757', '27', '第一百九十一章', '嚣张猖狂最适合她', '', '1521034018', '2', '191');
INSERT INTO `yk_book_chapter` VALUES ('758', '27', '第一百九十二章', '我要抱皇帝大腿', '', '1521034018', '2', '192');
INSERT INTO `yk_book_chapter` VALUES ('759', '27', '第一百九十三章', '傲娇丑王爷', '', '1521034018', '2', '193');
INSERT INTO `yk_book_chapter` VALUES ('760', '27', '第一百九十四章', '想我了吗', '', '1521034018', '2', '194');
INSERT INTO `yk_book_chapter` VALUES ('761', '27', '第一百九十五章', '他们都对衣服很有意见', '', '1521034018', '2', '195');
INSERT INTO `yk_book_chapter` VALUES ('762', '27', '第一百九十六章', '连糖葫芦都抢', '', '1521034018', '2', '196');
INSERT INTO `yk_book_chapter` VALUES ('763', '27', '第一百九十七章', '夜楼主又要犯事儿了', '', '1521034018', '2', '197');
INSERT INTO `yk_book_chapter` VALUES ('764', '27', '第一百九十八章', '我们之间有什么关系？', '', '1521034018', '2', '198');
INSERT INTO `yk_book_chapter` VALUES ('765', '27', '第一百九十九章', '我不喜欢跟人分享一个男人', '', '1521034018', '2', '199');
INSERT INTO `yk_book_chapter` VALUES ('766', '27', '第二百章', '临时后悔的冰绡', '', '1521034018', '2', '200');
INSERT INTO `yk_book_chapter` VALUES ('767', '27', '第二百零一章', '新的征程，新的生活', '', '1521034018', '2', '201');
INSERT INTO `yk_book_chapter` VALUES ('768', '27', '第二百零二章', '成事不足败事有余', '', '1521034018', '2', '202');
INSERT INTO `yk_book_chapter` VALUES ('769', '27', '第二百零三章', '师父太冷徒弟心里苦', '', '1521034018', '2', '203');
INSERT INTO `yk_book_chapter` VALUES ('770', '27', '第二百零四章', '你的徒弟生气了', '', '1521034018', '2', '204');
INSERT INTO `yk_book_chapter` VALUES ('771', '27', '第二百零五章', '账本里什么都没有', '', '1521034018', '2', '205');
INSERT INTO `yk_book_chapter` VALUES ('772', '27', '第二百零六章', '放在眼皮底下好调教', '', '1521034018', '2', '206');
INSERT INTO `yk_book_chapter` VALUES ('773', '27', '第二百零七章', '别碰我的东西', '', '1521034018', '2', '207');
INSERT INTO `yk_book_chapter` VALUES ('774', '27', '第二百零八章', '为什么劫我', '', '1521034018', '2', '208');
INSERT INTO `yk_book_chapter` VALUES ('775', '27', '第二百零九章', '夜楼主心灵手巧', '', '1521034018', '2', '209');
INSERT INTO `yk_book_chapter` VALUES ('776', '27', '第二百一十章', '太子殿下出事了', '', '1521034018', '2', '210');
INSERT INTO `yk_book_chapter` VALUES ('777', '27', '第二百一十一章', '可笑的办案作风', '', '1521034018', '2', '211');
INSERT INTO `yk_book_chapter` VALUES ('778', '27', '第二百一十二章', '强势的查案态度', '', '1521034018', '2', '212');
INSERT INTO `yk_book_chapter` VALUES ('779', '27', '第二百一十三章', '霸道的烨王', '', '1521034018', '2', '213');
INSERT INTO `yk_book_chapter` VALUES ('780', '27', '第二百一十四章', '本王可以当你的靠山', '', '1521034018', '2', '214');
INSERT INTO `yk_book_chapter` VALUES ('781', '27', '第二百一十五章', '裙子被树枝撕破了', '', '1521034018', '2', '215');
INSERT INTO `yk_book_chapter` VALUES ('782', '27', '第二百一十六章', '', '', '1521034018', '2', '216');
INSERT INTO `yk_book_chapter` VALUES ('783', '27', '第二百一十七章', '我不想看到你们作秀', '', '1521034018', '2', '217');
INSERT INTO `yk_book_chapter` VALUES ('784', '27', '第二百一十八章', '一家子为她操劳婚事', '', '1521034018', '2', '218');
INSERT INTO `yk_book_chapter` VALUES ('785', '27', '第二百一十九章', '染上风寒', '', '1521034018', '2', '219');
INSERT INTO `yk_book_chapter` VALUES ('786', '27', '第二百二十章', '宇文烨的悉心照料', '', '1521034018', '2', '220');
INSERT INTO `yk_book_chapter` VALUES ('787', '27', '第二百二十一章', '本王与楼大人乃君子之交', '', '1521034018', '2', '221');
INSERT INTO `yk_book_chapter` VALUES ('788', '27', '第二百二十二章', '计划落空', '', '1521034018', '2', '222');
INSERT INTO `yk_book_chapter` VALUES ('789', '27', '第二百二十三章', '你这手指恐怕是不想要了', '', '1521034018', '2', '223');
INSERT INTO `yk_book_chapter` VALUES ('790', '27', '第二百二十四章', '为她感到心疼', '', '1521034018', '2', '224');
INSERT INTO `yk_book_chapter` VALUES ('791', '27', '第二百二十五章', '卓风月皇后的转世投胎', '', '1521034018', '2', '225');
INSERT INTO `yk_book_chapter` VALUES ('792', '27', '第二百二十六章', '臣一紧张就词穷', '', '1521034018', '2', '226');
INSERT INTO `yk_book_chapter` VALUES ('793', '27', '第二百二十七章', '没教养的四王爷宇文澈', '', '1521034018', '2', '227');
INSERT INTO `yk_book_chapter` VALUES ('794', '27', '第二百二十八章', '皇后的推波助澜', '', '1521034018', '2', '228');
INSERT INTO `yk_book_chapter` VALUES ('795', '27', '第二百二十九章', '皇上为臣的婚事操心', '', '1521034018', '2', '229');
INSERT INTO `yk_book_chapter` VALUES ('796', '27', '第二百三十章', '当众出丑的楼风柔', '', '1521034018', '2', '230');
INSERT INTO `yk_book_chapter` VALUES ('797', '27', '第二百三十一章', '趁机道明离开楼府', '', '1521034018', '2', '231');
INSERT INTO `yk_book_chapter` VALUES ('798', '27', '第二百三十二章', '气急败坏的楼怀德', '', '1521034018', '2', '232');
INSERT INTO `yk_book_chapter` VALUES ('799', '27', '第二百三十三章', '入睡时要想着我不要想别人', '', '1521034018', '2', '233');
INSERT INTO `yk_book_chapter` VALUES ('800', '27', '第二百三十四章', '我们队长耿直莫跟她计较', '', '1521034018', '2', '234');
INSERT INTO `yk_book_chapter` VALUES ('801', '27', '第二百三十五章', '为虞舞做一点小事', '', '1521034018', '2', '235');
INSERT INTO `yk_book_chapter` VALUES ('802', '27', '第二百三十六章', '货物里绝对有问题', '', '1521034018', '2', '236');
INSERT INTO `yk_book_chapter` VALUES ('803', '27', '第二百三十七章', '戚清幽的歹毒心思', '', '1521034018', '2', '237');
INSERT INTO `yk_book_chapter` VALUES ('804', '27', '第二百三十八章', '臣要跟烨王决斗', '', '1521034018', '2', '238');
INSERT INTO `yk_book_chapter` VALUES ('805', '27', '第二百三十九章', '姬无夜发怒', '', '1521034018', '2', '239');
INSERT INTO `yk_book_chapter` VALUES ('806', '27', '第二百四十章', '一直都在粗鲁的楼兮瑾', '', '1521034018', '2', '240');
INSERT INTO `yk_book_chapter` VALUES ('807', '27', '第二百四十一章', '这样算间接接吻么', '', '1521034018', '2', '241');
INSERT INTO `yk_book_chapter` VALUES ('808', '27', '第二百四十二章', '别怕有师傅在', '', '1521034018', '2', '242');
INSERT INTO `yk_book_chapter` VALUES ('809', '27', '第二百四十三章', '徒弟受伤了！', '', '1521034018', '2', '243');
INSERT INTO `yk_book_chapter` VALUES ('810', '27', '第二百四十四章', '阳城牡丹花会', '', '1521034018', '2', '244');
INSERT INTO `yk_book_chapter` VALUES ('811', '27', '第二百四十五章', '楼大人脸皮太厚', '', '1521034018', '2', '245');
INSERT INTO `yk_book_chapter` VALUES ('812', '27', '第二百四十六章', '被基佬盯上的梅少翎', '', '1521034018', '2', '246');
INSERT INTO `yk_book_chapter` VALUES ('813', '27', '第二百四十七章', '危险的美人', '', '1521034018', '2', '247');
INSERT INTO `yk_book_chapter` VALUES ('814', '27', '第二百四十八章', '一刹那的怦然心动', '', '1521034018', '2', '248');
INSERT INTO `yk_book_chapter` VALUES ('815', '27', '第二百四十九章', '他要《奇毒论》', '', '1521034018', '2', '249');
INSERT INTO `yk_book_chapter` VALUES ('816', '27', '第二百五十章', '我要发现大秘密了！', '', '1521034018', '2', '250');
INSERT INTO `yk_book_chapter` VALUES ('817', '27', '第二百五十一章', '突如其来的吻', '', '1521034018', '2', '251');
INSERT INTO `yk_book_chapter` VALUES ('818', '27', '第二百五十二章', '为她换一批新丫头', '', '1521034018', '2', '252');
INSERT INTO `yk_book_chapter` VALUES ('819', '27', '第二百五十三章', '四面埋伏', '', '1521034018', '2', '253');
INSERT INTO `yk_book_chapter` VALUES ('820', '27', '第二百五十四章', '开出心动的花', '', '1521034018', '2', '254');
INSERT INTO `yk_book_chapter` VALUES ('821', '27', '第二百五十五章', '别有用心的话语', '', '1521034018', '2', '255');
INSERT INTO `yk_book_chapter` VALUES ('822', '27', '第二百五十六章', '楼慧雪的挑刺', '', '1521034018', '2', '256');
INSERT INTO `yk_book_chapter` VALUES ('823', '27', '第二百五十七章', '气死人的烨王爷', '', '1521034018', '2', '257');
INSERT INTO `yk_book_chapter` VALUES ('824', '27', '第二百五十八章', '你跟梅少翎做了什么', '', '1521034018', '2', '258');
INSERT INTO `yk_book_chapter` VALUES ('825', '27', '第二百五十九章', '梅少翎的吃惊', '', '1521034018', '2', '259');
INSERT INTO `yk_book_chapter` VALUES ('826', '27', '第二百六十章', '敌对的两人', '', '1521034018', '2', '260');
INSERT INTO `yk_book_chapter` VALUES ('827', '27', '第二百六十一章', '长公主殿下别作死', '', '1521034018', '2', '261');
INSERT INTO `yk_book_chapter` VALUES ('828', '27', '第二百六十二章', '突如其来的皇上', '', '1521034018', '2', '262');
INSERT INTO `yk_book_chapter` VALUES ('829', '27', '第二百六十三章', '给件衣服你们再下跪', '', '1521034018', '2', '263');
INSERT INTO `yk_book_chapter` VALUES ('830', '27', '第二百六十四章', '梅少翎的提醒', '', '1521034018', '2', '264');
INSERT INTO `yk_book_chapter` VALUES ('831', '27', '第二百六十五章', '展示麻醉针的威力', '', '1521034018', '2', '265');
INSERT INTO `yk_book_chapter` VALUES ('832', '27', '第二百六十六章', '把皇上扎晕了', '', '1521034018', '2', '266');
INSERT INTO `yk_book_chapter` VALUES ('833', '27', '第二百六十七章', '他的人，不许别人伤害', '', '1521034018', '2', '267');
INSERT INTO `yk_book_chapter` VALUES ('834', '27', '第二百六十八章', '长老今晚回来', '', '1521034018', '2', '268');
INSERT INTO `yk_book_chapter` VALUES ('835', '27', '第二百六十九章', '揶揄', '', '1521034018', '2', '269');
INSERT INTO `yk_book_chapter` VALUES ('836', '27', '第二百七十章', '这屋子里有猫腻', '', '1521034018', '2', '270');
INSERT INTO `yk_book_chapter` VALUES ('837', '27', '第二百七十一章', '他要的赏赐太过珍贵', '', '1521034018', '2', '271');
INSERT INTO `yk_book_chapter` VALUES ('838', '27', '第二百七十二章', '你的条件真多', '', '1521034018', '2', '272');
INSERT INTO `yk_book_chapter` VALUES ('839', '27', '第二百七十三章', '英明神武的队长回来了', '', '1521034018', '2', '273');
INSERT INTO `yk_book_chapter` VALUES ('840', '27', '第二百七十四章', '抓到一个可疑人', '', '1521034018', '2', '274');
INSERT INTO `yk_book_chapter` VALUES ('841', '27', '第二百七十五章', '倒霉的楼风柔', '', '1521034018', '2', '275');
INSERT INTO `yk_book_chapter` VALUES ('842', '27', '第二百七十六章', '重色轻妹', '', '1521034018', '2', '276');
INSERT INTO `yk_book_chapter` VALUES ('843', '27', '第二百七十七章', '把自己给他', '', '1521034018', '2', '277');
INSERT INTO `yk_book_chapter` VALUES ('844', '27', '第二百七十八章', '不害臊的女人', '', '1521034018', '2', '278');
INSERT INTO `yk_book_chapter` VALUES ('845', '27', '第二百七十九章', '睡前给你扎一针', '', '1521034018', '2', '279');
INSERT INTO `yk_book_chapter` VALUES ('846', '27', '第二百八十章', '主动没好事', '', '1521034018', '2', '280');
INSERT INTO `yk_book_chapter` VALUES ('847', '27', '第二百八十一章', '月梨的目的', '', '1521034018', '2', '281');
INSERT INTO `yk_book_chapter` VALUES ('848', '27', '第二百八十二章', '细节决定成败', '', '1521034018', '2', '282');
INSERT INTO `yk_book_chapter` VALUES ('849', '27', '第二百八十三章', '扇子装饰品', '', '1521034018', '2', '283');
INSERT INTO `yk_book_chapter` VALUES ('850', '27', '第二百八十四章', '他的不安', '', '1521034018', '2', '284');
INSERT INTO `yk_book_chapter` VALUES ('851', '27', '第二百八十五章', '卧底身份被发现', '', '1521034018', '2', '285');
INSERT INTO `yk_book_chapter` VALUES ('852', '27', '第二百八十六章', '冰绡的担忧', '', '1521034018', '2', '286');
INSERT INTO `yk_book_chapter` VALUES ('853', '27', '第二百八十七章', '高冷男神调戏人了', '', '1521034018', '2', '287');
INSERT INTO `yk_book_chapter` VALUES ('854', '27', '第二百八十八章', '逃跑又被抓回去', '', '1521034018', '2', '288');
INSERT INTO `yk_book_chapter` VALUES ('855', '27', '第二百八十九章', '齐寒的愤怒', '', '1521034018', '2', '289');
INSERT INTO `yk_book_chapter` VALUES ('856', '27', '第二百九十章', '她用了最极端的方法报复他', '', '1521034018', '2', '290');
INSERT INTO `yk_book_chapter` VALUES ('857', '27', '第二百九十一章', '你只有两条路', '', '1521034018', '2', '291');
INSERT INTO `yk_book_chapter` VALUES ('858', '27', '第二百九十二章', '自己犯错就得承担', '', '1521034018', '2', '292');
INSERT INTO `yk_book_chapter` VALUES ('859', '27', '第二百九十三章', '拼死逃亡', '', '1521034018', '2', '293');
INSERT INTO `yk_book_chapter` VALUES ('860', '27', '第二百九十四章', '楼兮瑾人丑武功弱', '', '1521034018', '2', '294');
INSERT INTO `yk_book_chapter` VALUES ('861', '27', '第二百九十五章', '那是血海深仇', '', '1521034018', '2', '295');
INSERT INTO `yk_book_chapter` VALUES ('862', '27', '第二百九十六章', '阿暖到底是谁', '', '1521034018', '2', '296');
INSERT INTO `yk_book_chapter` VALUES ('863', '27', '第二百九十七章', '我发现了！', '', '1521034018', '2', '297');
INSERT INTO `yk_book_chapter` VALUES ('864', '27', '第二百九十八章', '又惹上习字了', '', '1521034018', '2', '298');
INSERT INTO `yk_book_chapter` VALUES ('865', '27', '第二百九十九章', '暗潮涌动的始端', '', '1521034018', '2', '299');
INSERT INTO `yk_book_chapter` VALUES ('866', '27', '第三百章', '虞舞失踪了', '', '1521034018', '2', '300');
INSERT INTO `yk_book_chapter` VALUES ('867', '27', '第三百零一章', '她来了', '', '1521034018', '2', '301');
INSERT INTO `yk_book_chapter` VALUES ('868', '27', '第三百零二章', '怒火攻心', '', '1521034018', '2', '302');
INSERT INTO `yk_book_chapter` VALUES ('869', '27', '第三百零三章', '舍弃望月楼', '', '1521034018', '2', '303');
INSERT INTO `yk_book_chapter` VALUES ('870', '27', '第三百零四章', '阿瑾又生气了', '', '1521034018', '2', '304');
INSERT INTO `yk_book_chapter` VALUES ('871', '27', '第三百零五章', '楼兮瑾的不对劲', '', '1521034018', '2', '305');
INSERT INTO `yk_book_chapter` VALUES ('872', '27', '第三百零六章', '斩断情丝何错之有', '', '1521034018', '2', '306');
INSERT INTO `yk_book_chapter` VALUES ('873', '27', '第三百零七章', '借刀杀人', '', '1521034018', '2', '307');
INSERT INTO `yk_book_chapter` VALUES ('874', '27', '第三百零八章', '小云叛了', '', '1521034018', '2', '308');
INSERT INTO `yk_book_chapter` VALUES ('875', '27', '第三百零九章', '宇文烨拒绝了婚事', '', '1521034018', '2', '309');
INSERT INTO `yk_book_chapter` VALUES ('876', '27', '第三百一十章', '不许背着我跟女人厮混', '', '1521034018', '2', '310');
INSERT INTO `yk_book_chapter` VALUES ('877', '27', '第三百一十一章', '', '', '1521034018', '2', '311');
INSERT INTO `yk_book_chapter` VALUES ('878', '27', '第三百一十二章', '生日宴会大排场', '', '1521034018', '2', '312');
INSERT INTO `yk_book_chapter` VALUES ('879', '27', '第三百一十三章', '皇上也来宴会现场', '', '1521034018', '2', '313');
INSERT INTO `yk_book_chapter` VALUES ('880', '27', '第三百一十四章', '佳人一舞名动四方', '', '1521034018', '2', '314');
INSERT INTO `yk_book_chapter` VALUES ('881', '27', '第三百一十五章', '自作孽不可活', '', '1521034018', '2', '315');
INSERT INTO `yk_book_chapter` VALUES ('882', '27', '第三百一十六章', '赚大发了', '', '1521034018', '2', '316');
INSERT INTO `yk_book_chapter` VALUES ('883', '27', '第三百一十七章', '我们发财了！', '', '1521034018', '2', '317');
INSERT INTO `yk_book_chapter` VALUES ('884', '27', '第三百一十八章', '皇上的目的', '', '1521034018', '2', '318');
INSERT INTO `yk_book_chapter` VALUES ('885', '27', '第三百一十九章', '你就装吧！', '', '1521034018', '2', '319');
INSERT INTO `yk_book_chapter` VALUES ('886', '27', '第三百二十章', '十面埋伏', '', '1521034018', '2', '320');
INSERT INTO `yk_book_chapter` VALUES ('887', '27', '第三百二十一章', '皇上我没站稳', '', '1521034018', '2', '321');
INSERT INTO `yk_book_chapter` VALUES ('888', '27', '第三百二十二章', '吃太多衣服要炸开', '', '1521034018', '2', '322');
INSERT INTO `yk_book_chapter` VALUES ('889', '27', '第三百二十三章', '惊艳的开场', '', '1521034018', '2', '323');
INSERT INTO `yk_book_chapter` VALUES ('890', '27', '第三百二十四章', '奇特的舞', '', '1521034018', '2', '324');
INSERT INTO `yk_book_chapter` VALUES ('891', '27', '第三百二十五章', '当众把皇帝给调戏了', '', '1521034018', '2', '325');
INSERT INTO `yk_book_chapter` VALUES ('892', '27', '第三百二十六章', '我知道是你', '', '1521034018', '2', '326');
INSERT INTO `yk_book_chapter` VALUES ('893', '27', '第三百二十七章', '小宇宙又爆发', '', '1521034018', '2', '327');
INSERT INTO `yk_book_chapter` VALUES ('894', '27', '第三百二十八章', '吵架', '', '1521034018', '2', '328');
INSERT INTO `yk_book_chapter` VALUES ('895', '27', '第三百二十九章', '喊着别的女人的名字', '', '1521034018', '2', '329');
INSERT INTO `yk_book_chapter` VALUES ('896', '27', '第三百三十章', '那是个误会', '', '1521034018', '2', '330');
INSERT INTO `yk_book_chapter` VALUES ('897', '27', '第三百三十一章', '我们没有那么熟', '', '1521034018', '2', '331');
INSERT INTO `yk_book_chapter` VALUES ('898', '27', '第三百三十二章', '冷战', '', '1521034018', '2', '332');
INSERT INTO `yk_book_chapter` VALUES ('899', '27', '第三百三十三章', '螳螂捕蝉黄雀在后', '', '1521034018', '2', '333');
INSERT INTO `yk_book_chapter` VALUES ('900', '27', '第三百三十四章', '不舍的你难过', '', '1521034018', '2', '334');
INSERT INTO `yk_book_chapter` VALUES ('901', '27', '第三百三十五章', '虞舞的发泄', '', '1521034018', '2', '335');
INSERT INTO `yk_book_chapter` VALUES ('902', '27', '第三百三十六章', '他有些后悔了', '', '1521034018', '2', '336');
INSERT INTO `yk_book_chapter` VALUES ('903', '27', '第三百三十七章', '认真的习字', '', '1521034018', '2', '337');
INSERT INTO `yk_book_chapter` VALUES ('904', '27', '第三百三十八章', '找茬的成妃', '', '1521034018', '2', '338');
INSERT INTO `yk_book_chapter` VALUES ('905', '27', '第三百三十九章', '泡温泉', '', '1521034018', '2', '339');
INSERT INTO `yk_book_chapter` VALUES ('906', '27', '第三百四十章', '恼怒的皇上', '', '1521034018', '2', '340');
INSERT INTO `yk_book_chapter` VALUES ('907', '27', '第三百四十一章', '城府深沉的皇后', '', '1521034018', '2', '341');
INSERT INTO `yk_book_chapter` VALUES ('908', '27', '第三百四十二章', '野营去', '', '1521034018', '2', '342');
INSERT INTO `yk_book_chapter` VALUES ('909', '27', '第三百四十三章', '女子偶尔弱一下', '', '1521034018', '2', '343');
INSERT INTO `yk_book_chapter` VALUES ('910', '27', '第三百四十四章', '拒绝', '', '1521034018', '2', '344');
INSERT INTO `yk_book_chapter` VALUES ('911', '27', '第三百四十五章', '宇文澈的小心思', '', '1521034018', '2', '345');
INSERT INTO `yk_book_chapter` VALUES ('912', '27', '第三百四十六章', '话里有话', '', '1521034018', '2', '346');
INSERT INTO `yk_book_chapter` VALUES ('913', '27', '第三百四十七章', '宇文安中毒', '', '1521034018', '2', '347');
INSERT INTO `yk_book_chapter` VALUES ('914', '27', '第三百四十八章', '胖揍人渣', '', '1521034018', '2', '348');
INSERT INTO `yk_book_chapter` VALUES ('915', '27', '第三百四十九章', '风轻楼救场', '', '1521034018', '2', '349');
INSERT INTO `yk_book_chapter` VALUES ('916', '27', '第三百五十章', '强势的姬无夜', '', '1521034018', '2', '350');
INSERT INTO `yk_book_chapter` VALUES ('917', '27', '第三百五十一章', '后宫风云（一）', '', '1521034018', '2', '351');
INSERT INTO `yk_book_chapter` VALUES ('918', '27', '第三百五十二章', '后宫风云（二）', '', '1521034018', '2', '352');
INSERT INTO `yk_book_chapter` VALUES ('919', '27', '第三百五十三章', '成为阶下囚', '', '1521034018', '2', '353');
INSERT INTO `yk_book_chapter` VALUES ('920', '27', '第三百五十四章', '相煎何太急', '', '1521034018', '2', '354');
INSERT INTO `yk_book_chapter` VALUES ('921', '27', '第三百五十五章', '最后的底牌', '', '1521034018', '2', '355');
INSERT INTO `yk_book_chapter` VALUES ('922', '27', '第三百五十六章', '动用私刑', '', '1521034018', '2', '356');
INSERT INTO `yk_book_chapter` VALUES ('923', '27', '第三百五十七章', '凶多吉少', '', '1521034018', '2', '357');
INSERT INTO `yk_book_chapter` VALUES ('924', '27', '第三百五十八章', '我娶你，用王爷的身份', '', '1521034018', '2', '358');
INSERT INTO `yk_book_chapter` VALUES ('925', '27', '第三百五十九章', '白小云的到来', '', '1521034018', '2', '359');
INSERT INTO `yk_book_chapter` VALUES ('926', '27', '第三百六十章', '狂拽炫酷霸道的激吻', '', '1521034018', '2', '360');
INSERT INTO `yk_book_chapter` VALUES ('927', '27', '第三百六十一章', '因为她想嫁给我', '', '1521034018', '2', '361');
INSERT INTO `yk_book_chapter` VALUES ('928', '27', '第三百六十二章', '不是不报时候未到', '', '1521034018', '2', '362');
INSERT INTO `yk_book_chapter` VALUES ('929', '27', '第三百六十三章', '徒手撕鱼', '', '1521034018', '2', '363');
INSERT INTO `yk_book_chapter` VALUES ('930', '27', '第三百六十四章', '小心背后的人', '', '1521034018', '2', '364');
INSERT INTO `yk_book_chapter` VALUES ('931', '27', '第三百六十五章', '你不能操纵我的人生', '', '1521034018', '2', '365');
INSERT INTO `yk_book_chapter` VALUES ('932', '27', '第三百六十六章', '梅少翎的到来', '', '1521034018', '2', '366');
INSERT INTO `yk_book_chapter` VALUES ('933', '27', '第三百六十七章', '不想看你成亲', '', '1521034018', '2', '367');
INSERT INTO `yk_book_chapter` VALUES ('934', '27', '第三百六十八章', '她只需要暖心的简单', '', '1521034018', '2', '368');
INSERT INTO `yk_book_chapter` VALUES ('935', '27', '第三百六十九章', '秋猎', '', '1521034018', '2', '369');
INSERT INTO `yk_book_chapter` VALUES ('936', '27', '第三百七十章', '再次胖揍人渣', '', '1521034018', '2', '370');
INSERT INTO `yk_book_chapter` VALUES ('937', '27', '第三百七十一章', '宇文澈的身世', '', '1521034018', '2', '371');
INSERT INTO `yk_book_chapter` VALUES ('938', '27', '第三百七十二章', '遇到刺客', '', '1521034018', '2', '372');
INSERT INTO `yk_book_chapter` VALUES ('939', '27', '第三百七十三章', '只因他是帝王', '', '1521034018', '2', '373');
INSERT INTO `yk_book_chapter` VALUES ('940', '27', '第三百七十四章', '庄妃的心思', '', '1521034018', '2', '374');
INSERT INTO `yk_book_chapter` VALUES ('941', '27', '第三百七十五章', '他没有感受过温暖', '', '1521034018', '2', '375');
INSERT INTO `yk_book_chapter` VALUES ('942', '27', '第三百七十六章', '与庄妃谈心', '', '1521034018', '2', '376');
INSERT INTO `yk_book_chapter` VALUES ('943', '27', '第三百七十七章', '', '', '1521034018', '2', '377');
INSERT INTO `yk_book_chapter` VALUES ('944', '27', '第三百七十八章', '一群八卦的男人', '', '1521034018', '2', '378');
INSERT INTO `yk_book_chapter` VALUES ('945', '27', '第三百七十九章', '穆松失踪了', '', '1521034018', '2', '379');
INSERT INTO `yk_book_chapter` VALUES ('946', '27', '第三百八十章', '装的一脸好无辜', '', '1521034018', '2', '380');
INSERT INTO `yk_book_chapter` VALUES ('947', '27', '第三百八十一章', '动物比人忠心', '', '1521034018', '2', '381');
INSERT INTO `yk_book_chapter` VALUES ('948', '27', '第三百八十二章', '花卷死了', '', '1521034018', '2', '382');
INSERT INTO `yk_book_chapter` VALUES ('949', '27', '第三百八十三章', '有本事去皇帝那告我', '', '1521034018', '2', '383');
INSERT INTO `yk_book_chapter` VALUES ('950', '27', '第三百八十四章', '发现密室', '', '1521034018', '2', '384');
INSERT INTO `yk_book_chapter` VALUES ('951', '27', '第三百八十五章', '危难时刻总遇到他', '', '1521034018', '2', '385');
INSERT INTO `yk_book_chapter` VALUES ('952', '27', '第三百八十六章', '我们的关系匪浅', '', '1521034018', '2', '386');
INSERT INTO `yk_book_chapter` VALUES ('953', '27', '第三百八十七章', '你的命是我的', '', '1521034018', '2', '387');
INSERT INTO `yk_book_chapter` VALUES ('954', '27', '第三百八十八章', '帝王的柔情', '', '1521034018', '2', '388');
INSERT INTO `yk_book_chapter` VALUES ('955', '27', '第三百八十九章', '敌方很了解她', '', '1521034018', '2', '389');
INSERT INTO `yk_book_chapter` VALUES ('956', '27', '第三百九十章', '燕王府失火', '', '1521034018', '2', '390');
INSERT INTO `yk_book_chapter` VALUES ('957', '27', '第三百九十一章', '幸好有你', '', '1521034018', '2', '391');
INSERT INTO `yk_book_chapter` VALUES ('958', '27', '第三百九十二章', '那我扑你？', '', '1521034018', '2', '392');
INSERT INTO `yk_book_chapter` VALUES ('959', '27', '第三百九十三章', '宇文冰的脆弱', '', '1521034018', '2', '393');
INSERT INTO `yk_book_chapter` VALUES ('960', '27', '第三百九十四章', '宇文烨是谁', '', '1521034018', '2', '394');
INSERT INTO `yk_book_chapter` VALUES ('961', '27', '第三百九十五章', '我该感谢她', '', '1521034018', '2', '395');
INSERT INTO `yk_book_chapter` VALUES ('962', '27', '第三百九十六章', '我必须告诉你', '', '1521034018', '2', '396');
INSERT INTO `yk_book_chapter` VALUES ('963', '27', '第三百九十七章', '一孕傻三年', '', '1521034018', '2', '397');
INSERT INTO `yk_book_chapter` VALUES ('964', '27', '第三百九十八章', '成亲，你准备好了吗', '', '1521034018', '2', '398');
INSERT INTO `yk_book_chapter` VALUES ('965', '27', '第三百九十九章', '雪下得那么深', '', '1521034018', '2', '399');
INSERT INTO `yk_book_chapter` VALUES ('966', '27', '第四百章', '那是爱情', '', '1521034018', '2', '400');
INSERT INTO `yk_book_chapter` VALUES ('967', '27', '第四百零一章', '没有气氛', '', '1521034018', '2', '401');
INSERT INTO `yk_book_chapter` VALUES ('968', '27', '第四百零二章', '愉悦的一晚', '', '1521034018', '2', '402');
INSERT INTO `yk_book_chapter` VALUES ('969', '27', '第四百零三章', '对峙燕王妃', '', '1521034018', '2', '403');
INSERT INTO `yk_book_chapter` VALUES ('970', '27', '第四百零四章', '东风破阵舞', '', '1521034018', '2', '404');
INSERT INTO `yk_book_chapter` VALUES ('971', '27', '第四百零五章', '成亲', '', '1521034018', '2', '405');
INSERT INTO `yk_book_chapter` VALUES ('972', '27', '第四百零六章', '新娘子去哪里了', '', '1521034018', '2', '406');
INSERT INTO `yk_book_chapter` VALUES ('973', '27', '第四百零七章', '新娘去查案了', '', '1521034018', '2', '407');
INSERT INTO `yk_book_chapter` VALUES ('974', '27', '第四百零八章', '爱上这么一个女人', '', '1521034018', '2', '408');
INSERT INTO `yk_book_chapter` VALUES ('975', '27', '第四百零九章', '不想她受任何委屈', '', '1521034018', '2', '409');
INSERT INTO `yk_book_chapter` VALUES ('976', '27', '第四百一十章', '来选一个姿势', '', '1521034018', '2', '410');
INSERT INTO `yk_book_chapter` VALUES ('977', '27', '第四百一十一章', '谁是妻奴了啊', '', '1521034018', '2', '411');
INSERT INTO `yk_book_chapter` VALUES ('978', '27', '第四百一十二章', '爱惨你', '', '1521034018', '2', '412');
INSERT INTO `yk_book_chapter` VALUES ('979', '27', '第四百一十三章', '母亲应被孝敬', '', '1521034018', '2', '413');
INSERT INTO `yk_book_chapter` VALUES ('980', '27', '第四百一十四章', '交易', '', '1521034018', '2', '414');
INSERT INTO `yk_book_chapter` VALUES ('981', '27', '第四百一十五章', '瞎了就多瞎一会儿', '', '1521034018', '2', '415');
INSERT INTO `yk_book_chapter` VALUES ('982', '27', '第四百一十六章', '我抢得过么', '', '1521034018', '2', '416');
INSERT INTO `yk_book_chapter` VALUES ('983', '27', '第四百一十七章', '一枚戒指引发的血案', '', '1521034018', '2', '417');
INSERT INTO `yk_book_chapter` VALUES ('984', '27', '第四百一十八章', '婚前婚后', '', '1521034018', '2', '418');
INSERT INTO `yk_book_chapter` VALUES ('985', '27', '第四百一十九章', '她不傻', '', '1521034018', '2', '419');
INSERT INTO `yk_book_chapter` VALUES ('986', '27', '第四百二十章', '冰绡成亲的日子', '', '1521034018', '2', '420');
INSERT INTO `yk_book_chapter` VALUES ('987', '27', '第四百二十一章', '难受也是一个人', '', '1521034018', '2', '421');
INSERT INTO `yk_book_chapter` VALUES ('988', '27', '第四百二十二章', '关于阿暖', '', '1521034018', '2', '422');
INSERT INTO `yk_book_chapter` VALUES ('989', '27', '第四百二十三章', '训练官兵', '', '1521034018', '2', '423');
INSERT INTO `yk_book_chapter` VALUES ('990', '27', '第四百二十四章', '宇文麟的担忧', '', '1521034018', '2', '424');
INSERT INTO `yk_book_chapter` VALUES ('991', '27', '第四百二十五章', '我要振作起来', '', '1521034018', '2', '425');
INSERT INTO `yk_book_chapter` VALUES ('992', '27', '第四百二十六章', '无理的宇文烨', '', '1521034018', '2', '426');
INSERT INTO `yk_book_chapter` VALUES ('993', '27', '第四百二十七章', '余华烟的斥责', '', '1521034018', '2', '427');
INSERT INTO `yk_book_chapter` VALUES ('994', '27', '第四百二十八章', '母子闹矛盾', '', '1521034018', '2', '428');
INSERT INTO `yk_book_chapter` VALUES ('995', '27', '第四百二十九章', '好婚多磨', '', '1521034018', '2', '429');
INSERT INTO `yk_book_chapter` VALUES ('996', '27', '第四百三十章', '阴谋阳谋', '', '1521034018', '2', '430');
INSERT INTO `yk_book_chapter` VALUES ('997', '27', '第四百三十一章', '兄弟相见', '', '1521034018', '2', '431');
INSERT INTO `yk_book_chapter` VALUES ('998', '27', '第四百三十二章', '你抛弃了他', '', '1521034018', '2', '432');
INSERT INTO `yk_book_chapter` VALUES ('999', '27', '第四百三十三章', '交心的谈话', '', '1521034018', '2', '433');
INSERT INTO `yk_book_chapter` VALUES ('1000', '27', '第四百三十四章', '义结金兰', '', '1521034018', '2', '434');
INSERT INTO `yk_book_chapter` VALUES ('1001', '27', '第四百三十五章', '他时日不多了', '', '1521034018', '2', '435');
INSERT INTO `yk_book_chapter` VALUES ('1002', '27', '第四百三十六章', '诉说心事', '', '1521034018', '2', '436');
INSERT INTO `yk_book_chapter` VALUES ('1003', '27', '第四百三十七章', '我们生个孩子吧', '', '1521034018', '2', '437');
INSERT INTO `yk_book_chapter` VALUES ('1004', '27', '第四百三十八章', '到达关州', '', '1521034018', '2', '438');
INSERT INTO `yk_book_chapter` VALUES ('1005', '27', '第四百三十九章', '你是天才', '', '1521034018', '2', '439');
INSERT INTO `yk_book_chapter` VALUES ('1006', '27', '第四百四十章', '他就是白衣人', '', '1521034018', '2', '440');
INSERT INTO `yk_book_chapter` VALUES ('1007', '27', '第四百四十一章', '魂牵梦绕的名字', '', '1521034018', '2', '441');
INSERT INTO `yk_book_chapter` VALUES ('1008', '27', '第四百四十二章', '有什么话我们明说', '', '1521034018', '2', '442');
INSERT INTO `yk_book_chapter` VALUES ('1009', '27', '第四百四十三章', '有什么话我们明说', '', '1521034018', '2', '443');
INSERT INTO `yk_book_chapter` VALUES ('1010', '27', '第四百四十四章', '真相浮出水面', '', '1521034018', '2', '444');
INSERT INTO `yk_book_chapter` VALUES ('1011', '27', '第四百四十五章', '心痛难以言喻', '', '1521034018', '2', '445');
INSERT INTO `yk_book_chapter` VALUES ('1012', '27', '第四百四十六章', '你不了解她', '', '1521034018', '2', '446');
INSERT INTO `yk_book_chapter` VALUES ('1013', '27', '第四百四十七章', '怎可这般绝情？', '', '1521034018', '2', '447');
INSERT INTO `yk_book_chapter` VALUES ('1014', '27', '第四百四十八章', '白小云的伤害', '', '1521034018', '2', '448');
INSERT INTO `yk_book_chapter` VALUES ('1015', '27', '第四百四十九章', '奔溃', '', '1521034018', '2', '449');
INSERT INTO `yk_book_chapter` VALUES ('1016', '27', '第四百五十章', '梅花', '', '1521034018', '2', '450');
INSERT INTO `yk_book_chapter` VALUES ('1017', '27', '第四百五十一章', '烧毁她的一切', '', '1521034018', '2', '451');
INSERT INTO `yk_book_chapter` VALUES ('1018', '27', '第四百五十二章', '还是想逃避', '', '1521034018', '2', '452');
INSERT INTO `yk_book_chapter` VALUES ('1019', '27', '第四百五十三章', '忽然释然', '', '1521034018', '2', '453');
INSERT INTO `yk_book_chapter` VALUES ('1020', '27', '第四百五十四章', '需要一个契机', '', '1521034018', '2', '454');
INSERT INTO `yk_book_chapter` VALUES ('1021', '27', '第四百五十五章', '她是不可或缺的', '', '1521034018', '2', '455');
INSERT INTO `yk_book_chapter` VALUES ('1022', '27', '第四百五十六章', '怀孕', '', '1521034018', '2', '456');
INSERT INTO `yk_book_chapter` VALUES ('1023', '27', '第四百五十七章', '贤妃的试探', '', '1521034018', '2', '457');
INSERT INTO `yk_book_chapter` VALUES ('1024', '27', '第四百五十八章', '圈套', '', '1521034018', '2', '458');
INSERT INTO `yk_book_chapter` VALUES ('1025', '27', '第四百五十九章', '楼兮瑾被抓', '', '1521034018', '2', '459');
INSERT INTO `yk_book_chapter` VALUES ('1026', '27', '第四百六十章', '心怀猜忌', '', '1521034018', '2', '460');
INSERT INTO `yk_book_chapter` VALUES ('1027', '27', '第四百六十一章', '穆和的期限', '', '1521034018', '2', '461');
INSERT INTO `yk_book_chapter` VALUES ('1028', '27', '第四百六十二章', '交出腰牌', '', '1521034018', '2', '462');
INSERT INTO `yk_book_chapter` VALUES ('1029', '27', '第四百六十三章', '不能没有她', '', '1521034018', '2', '463');
INSERT INTO `yk_book_chapter` VALUES ('1030', '27', '第四百六十四章', '逼宫篡位', '', '1521034018', '2', '464');
INSERT INTO `yk_book_chapter` VALUES ('1031', '27', '第四百六十五章', '对决', '', '1521034018', '2', '465');
INSERT INTO `yk_book_chapter` VALUES ('1032', '27', '第四百六十六章', '绝望', '', '1521034018', '2', '466');
INSERT INTO `yk_book_chapter` VALUES ('1033', '27', '第四百六十七章', '死士降临', '', '1521034018', '2', '467');
INSERT INTO `yk_book_chapter` VALUES ('1034', '27', '第四百六十八章', '形势逆转', '', '1521034018', '2', '468');
INSERT INTO `yk_book_chapter` VALUES ('1035', '27', '第四百六十九章', '败退', '', '1521034018', '2', '469');
INSERT INTO `yk_book_chapter` VALUES ('1036', '27', '第四百七十章我有银子', '', '', '1521034018', '2', '470');
INSERT INTO `yk_book_chapter` VALUES ('1037', '27', '第四百七十一章', '离开风轻楼', '', '1521034018', '2', '471');
INSERT INTO `yk_book_chapter` VALUES ('1038', '27', '第四百七十二章', '相守（大结局）', '', '1521034018', '2', '472');

-- ----------------------------
-- Table structure for yk_book_error
-- ----------------------------
DROP TABLE IF EXISTS `yk_book_error`;
CREATE TABLE `yk_book_error` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL COMMENT '书籍id',
  `book_name` varchar(100) NOT NULL COMMENT '书籍名称',
  `book_chapter_num` int(4) NOT NULL COMMENT '章节id',
  `book_chapter_title` varchar(100) NOT NULL COMMENT '章节名称',
  `time` int(11) NOT NULL COMMENT '上报时间',
  `error_type` varchar(50) NOT NULL COMMENT '错误类型',
  `content` varchar(255) DEFAULT NULL,
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='上报书籍错误表';

-- ----------------------------
-- Records of yk_book_error
-- ----------------------------
INSERT INTO `yk_book_error` VALUES ('1', '1', 'sd', '1', 'as', '1521635577', '1,2,3', '', '6');
INSERT INTO `yk_book_error` VALUES ('2', '1', 'sd', '1', 'as', '1521635591', '1,2,3', '1,2,3', '6');
INSERT INTO `yk_book_error` VALUES ('3', '1', 'sd', '1', 'as', '1521635607', '1,2,3', 'sasascac', '6');
INSERT INTO `yk_book_error` VALUES ('4', '1062', '正道潜龙', '37765', '001   ', '1521685320', ',,,,,', '', '13');
INSERT INTO `yk_book_error` VALUES ('5', '1062', '正道潜龙', '37765', '001   ', '1521685321', ',,,,,', '', '13');
INSERT INTO `yk_book_error` VALUES ('6', '1062', '正道潜龙', '37765', '001   ', '1521685322', ',,,,,', '', '13');
INSERT INTO `yk_book_error` VALUES ('7', '1062', '正道潜龙', '37766', '002   ', '1521685856', '1,3,5,6', '', '13');
INSERT INTO `yk_book_error` VALUES ('8', '1062', '正道潜龙', '37766', '002   ', '1521685866', '1,3,6', '', '13');
INSERT INTO `yk_book_error` VALUES ('9', '1062', '正道潜龙', '37766', '002   ', '1521685897', '1,3,6', '哈哈哈哈哈哈\n', '13');
INSERT INTO `yk_book_error` VALUES ('10', '1067', '仕途天骄', '27887', '第二章   被胡萝卜诱惑的笨驴', '1521686423', '1,5,', '', '13');
INSERT INTO `yk_book_error` VALUES ('11', '1067', '仕途天骄', '27887', '第二章   被胡萝卜诱惑的笨驴', '1521686444', '1,5,', '', '13');
INSERT INTO `yk_book_error` VALUES ('12', '1066', '总裁老公追上门', '1', '第一章想用这样的方式引起我的注意？ ', '1521686786', '章节内容与标题不符,内容缺失,章节重复', '', '3');
INSERT INTO `yk_book_error` VALUES ('13', '1066', '总裁老公追上门', '1', '第一章想用这样的方式引起我的注意？ ', '1521686795', '章节内容与标题不符,内容缺失,章节重复', '', '3');
INSERT INTO `yk_book_error` VALUES ('14', '1066', '总裁老公追上门', '10', '第十章你找谁？ ', '1521686902', '章节错乱,章节乱码,色情内容', '', '3');

-- ----------------------------
-- Table structure for yk_book_read
-- ----------------------------
DROP TABLE IF EXISTS `yk_book_read`;
CREATE TABLE `yk_book_read` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `chapter_id` int(11) NOT NULL COMMENT '章节id',
  `time` int(11) NOT NULL COMMENT '阅读时间',
  `book_id` int(11) NOT NULL COMMENT '书籍id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='书籍阅读表';

-- ----------------------------
-- Records of yk_book_read
-- ----------------------------
INSERT INTO `yk_book_read` VALUES ('1', '1', '2', '1520820178', '0');
INSERT INTO `yk_book_read` VALUES ('5', '1', '3', '1520318888', '0');
INSERT INTO `yk_book_read` VALUES ('6', '3', '1', '1520321896', '261');
INSERT INTO `yk_book_read` VALUES ('7', '3', '242', '1520322091', '521');
INSERT INTO `yk_book_read` VALUES ('8', '1', '30', '1520564829', '1');
INSERT INTO `yk_book_read` VALUES ('9', '1', '29', '1520564861', '1');
INSERT INTO `yk_book_read` VALUES ('10', '1', '31', '1520564959', '1');
INSERT INTO `yk_book_read` VALUES ('11', '1', '32', '1520565573', '1');
INSERT INTO `yk_book_read` VALUES ('12', '1', '41', '1520581526', '1');
INSERT INTO `yk_book_read` VALUES ('13', '1', '40', '1520581634', '1');
INSERT INTO `yk_book_read` VALUES ('14', '1', '1', '1520990400', '1');
INSERT INTO `yk_book_read` VALUES ('15', '1', '200', '1520990279', '2');
INSERT INTO `yk_book_read` VALUES ('16', '1', '569', '1521097042', '27');

-- ----------------------------
-- Table structure for yk_collection
-- ----------------------------
DROP TABLE IF EXISTS `yk_collection`;
CREATE TABLE `yk_collection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL COMMENT '''采集平台''',
  `url` varchar(150) NOT NULL COMMENT '''采集地址''',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '结果 1 正常 2 失败',
  `msg` varchar(50) NOT NULL COMMENT '采集模块',
  `time` int(11) NOT NULL COMMENT '采集时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='采集记录表';

-- ----------------------------
-- Records of yk_collection
-- ----------------------------
INSERT INTO `yk_collection` VALUES ('1', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('2', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('3', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('4', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('5', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('6', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('7', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('8', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('9', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('10', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('11', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('12', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('13', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('14', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('15', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('16', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('17', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('18', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('19', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('20', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('21', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('22', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('23', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('24', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('25', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('26', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('27', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('28', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('29', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('30', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('31', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('32', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('33', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('34', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('35', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('36', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('37', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('38', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('39', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('40', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('41', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('42', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('43', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('44', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('45', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('46', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('47', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('48', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('49', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('50', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('51', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('52', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('53', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('54', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('55', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('56', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('57', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('58', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('59', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('60', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('61', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('62', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('63', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('64', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('65', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('66', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('67', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('68', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('69', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('70', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('71', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('72', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('73', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('74', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('75', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('76', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('77', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('78', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('79', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('80', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('81', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('82', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('83', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('84', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('85', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('86', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('87', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('88', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('89', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('90', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('91', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('92', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('93', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('94', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('95', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('96', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('97', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('98', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('99', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('100', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('101', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('102', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('103', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('104', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('105', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('106', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('107', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('108', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('109', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('110', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('111', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('112', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('113', '', '', '1', '', '0');
INSERT INTO `yk_collection` VALUES ('114', '', '', '1', '', '0');

-- ----------------------------
-- Table structure for yk_config
-- ----------------------------
DROP TABLE IF EXISTS `yk_config`;
CREATE TABLE `yk_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL COMMENT '配置名',
  `val` varchar(255) NOT NULL COMMENT '配置值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of yk_config
-- ----------------------------
INSERT INTO `yk_config` VALUES ('2', '新用户赠送金币', '5');
INSERT INTO `yk_config` VALUES ('3', '使用激活码赠送金币', '5');
INSERT INTO `yk_config` VALUES ('4', '签到获得金币量', '1');
INSERT INTO `yk_config` VALUES ('6', '关于我们', '优看阁是中国最主流的无线互联网阅读服务提供商，以精致贴心的移动终端阅读体验为核心，以品质书籍的精细化运营为特色，向亿万阅读用户提供主流的、轻松的文学阅读服务。');
INSERT INTO `yk_config` VALUES ('7', '关于我们二维码', '');
INSERT INTO `yk_config` VALUES ('8', '常见问题URL', '');
INSERT INTO `yk_config` VALUES ('9', 'app启动拷贝内容', '');

-- ----------------------------
-- Table structure for yk_gold_source
-- ----------------------------
DROP TABLE IF EXISTS `yk_gold_source`;
CREATE TABLE `yk_gold_source` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id 0为系统赠送',
  `get_uid` int(11) NOT NULL COMMENT '目标用户',
  `gold` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金币',
  `time` int(11) NOT NULL COMMENT '时间',
  `type` tinyint(4) NOT NULL COMMENT '类型 1充值 2签到 3新用户赠送 4使用激活码赠送 5打赏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='金币记录表';

-- ----------------------------
-- Records of yk_gold_source
-- ----------------------------
INSERT INTO `yk_gold_source` VALUES ('1', '0', '1', '5.00', '1517645047', '3');
INSERT INTO `yk_gold_source` VALUES ('2', '0', '2', '5.00', '1517655516', '3');
INSERT INTO `yk_gold_source` VALUES ('6', '1', '2', '1.00', '1517812292', '5');
INSERT INTO `yk_gold_source` VALUES ('7', '1', '2', '1.00', '1517812340', '5');
INSERT INTO `yk_gold_source` VALUES ('8', '0', '1', '1.00', '1517889119', '2');
INSERT INTO `yk_gold_source` VALUES ('9', '0', '1', '5.00', '1521510091', '3');

-- ----------------------------
-- Table structure for yk_member
-- ----------------------------
DROP TABLE IF EXISTS `yk_member`;
CREATE TABLE `yk_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(50) DEFAULT NULL COMMENT '昵称',
  `portrait` varchar(300) DEFAULT NULL COMMENT '头像',
  `salt` smallint(4) DEFAULT NULL COMMENT '密码加密随机数',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `token` varchar(50) NOT NULL COMMENT '用户token',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别 0未选择 1男 2女',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `is_verify` tinyint(4) NOT NULL DEFAULT '0' COMMENT '手机号是否通过验证 1是',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `model` varchar(100) DEFAULT NULL COMMENT '手机型号',
  `imei` varchar(150) DEFAULT NULL COMMENT '设备号',
  `devtype` tinyint(4) DEFAULT '1' COMMENT '设备类型 1安卓 2ios 3web',
  `end_vip` int(11) NOT NULL DEFAULT '0' COMMENT 'vip到期时间',
  `gold` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金币',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `qq_open_id` varchar(255) DEFAULT NULL COMMENT 'qqopenId',
  `wx_open_id` varchar(255) DEFAULT NULL COMMENT '微信openId',
  `wx_nick` varchar(50) DEFAULT NULL COMMENT '微信昵称',
  `qq_nick` varchar(50) DEFAULT NULL COMMENT 'qq昵称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of yk_member
-- ----------------------------
INSERT INTO `yk_member` VALUES ('1', '蛋炒饭', '相处', null, null, '59180f44b8764042246ee2d370538f23', null, '1', '1521510091', '1521510091', '0', '阿斯顿', '按时', '说的', '45151sada', '1', '1526780491', '5.00', '0', null, '111111', null, null);

-- ----------------------------
-- Table structure for yk_menu
-- ----------------------------
DROP TABLE IF EXISTS `yk_menu`;
CREATE TABLE `yk_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类id',
  `menu_img` varchar(150) DEFAULT '' COMMENT '分类图片',
  `menu_color` varchar(10) DEFAULT '' COMMENT '分类颜色',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '菜单类型 1小说分类 2小说类型 3书籍分组 4 全网分类',
  `score` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `remarks` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of yk_menu
-- ----------------------------
INSERT INTO `yk_menu` VALUES ('1', '男生', '0', '', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('2', '东方玄幻', '0', 'http://127.0.0.1/book//Public/Upfile/Menu/classfy1.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('3', '都市小说', '1', 'classfy2.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('4', '西方玄幻', '1', 'classfy3.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('5', '武侠仙侠', '1', 'classfy4.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('6', '架空历史', '1', 'classfy5.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('7', '科幻未来', '1', 'classfy6.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('8', '网游竞技', '1', 'classfy7.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('9', '悬疑惊悚', '1', 'classfy8.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('10', '女生', '0', '', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('11', '古代言情', '10', 'classfy9.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('12', '幻想言情', '10', 'classfy10.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('13', '都市言情', '10', 'classfy11.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('14', '总裁豪门', '10', 'classfy12.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('15', '青春校园', '10', 'classfy13.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('16', '唯美同人', '10', 'classfy14.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('17', '出版物', '0', '', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('18', '文学小说', '17', 'classfy15.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('19', '经典名著', '17', 'classfy16.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('20', '经管励志', '17', 'classfy17.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('21', '生活休闲', '17', 'classfy18.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('22', '婚姻家庭', '17', 'classfy19.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('23', '科普教育', '17', 'classfy20.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('24', '纪实传记', '17', 'classfy21.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('25', '亲子育儿', '17', 'classfy22.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('26', '工具/百科', '17', 'classfy23.png', '', '1', '0', '');
INSERT INTO `yk_menu` VALUES ('27', '都市', '0', '', '#3f51b5', '2', '0', '');
INSERT INTO `yk_menu` VALUES ('28', '玄幻', '0', '', '#ff4081', '2', '0', '');
INSERT INTO `yk_menu` VALUES ('29', '军事', '0', '', '#e51c23', '2', '0', '');
INSERT INTO `yk_menu` VALUES ('30', '仙侠', '0', '', '#009688', '2', '0', '');
INSERT INTO `yk_menu` VALUES ('31', '历史', '0', '', '#259b24', '2', '0', '');
INSERT INTO `yk_menu` VALUES ('32', '奇幻', '0', '', '#8bc34a', '2', '0', '');
INSERT INTO `yk_menu` VALUES ('33', '悬疑', '0', '', '#ff9800', '2', '0', '');
INSERT INTO `yk_menu` VALUES ('34', '更多', '0', '', '#d96c73', '2', '0', '');
INSERT INTO `yk_menu` VALUES ('35', '完本畅读', '0', 'Menu_5a6ef6ee282665730.png', '#ede3c7', '3', '0', '一次读过瘾');
INSERT INTO `yk_menu` VALUES ('36', '名家有经典', '0', '', '#ebc5ca', '3', '0', '大作出经典');
INSERT INTO `yk_menu` VALUES ('37', '新书入库', '0', '', '#e6e3e4', '3', '0', '新鲜抢先看');
INSERT INTO `yk_menu` VALUES ('38', '发现好书', '0', '', '#d5edf2', '3', '0', '小编来推荐');
INSERT INTO `yk_menu` VALUES ('39', '塔读文学', '0', '', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('40', '起点中文网', '0', 'qw_qidian.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('41', '阿里巴巴·文学', '0', 'qw_alibaba.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('42', '逐浪小说网', '0', 'qw_zhulang.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('43', '创世中文网', '0', 'qw_chuangshi.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('44', '云起书院', '0', 'qw_yunqi.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('45', '晋江文学城', '0', 'jingjian.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('46', '红袖添香', '0', 'qw_hongxiu.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('47', '潇湘书院', '0', 'qw_xiaoshang.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('48', '起点女生网', '0', 'qw_qdnvsheng.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('49', '掌阅', '0', 'qw_zhangyue.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('50', '纵横中文网', '0', 'qw_zongheng.png', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('51', '花语女生网', '0', '', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('52', '香网', '0', '', '', '4', '0', '');
INSERT INTO `yk_menu` VALUES ('53', '小说阅读网', '0', '', '', '4', '0', '');

-- ----------------------------
-- Table structure for yk_module
-- ----------------------------
DROP TABLE IF EXISTS `yk_module`;
CREATE TABLE `yk_module` (
  `mid` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '方法名称',
  `name` varchar(255) DEFAULT '' COMMENT '方法用处',
  `module` varchar(30) DEFAULT '' COMMENT '方法路径',
  `sort` int(8) DEFAULT '0' COMMENT '排序',
  `type` tinyint(5) DEFAULT '0' COMMENT '上级菜单ID，一级菜单为0',
  `level` tinyint(5) DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='后台所有方法名表';

-- ----------------------------
-- Records of yk_module
-- ----------------------------
INSERT INTO `yk_module` VALUES ('1', '管理员管理', '', 'Admin', '0', '0', '1');
INSERT INTO `yk_module` VALUES ('2', '管理员列表', '显示所有管理员', 'Admin/AdminList', '0', '1', '2');
INSERT INTO `yk_module` VALUES ('3', '管理员角色', '显示所有管理员角色', 'Admin/RoleList', '0', '1', '2');
INSERT INTO `yk_module` VALUES ('4', '用户管理', '', 'Member', '0', '0', '1');
INSERT INTO `yk_module` VALUES ('5', '用户列表', '', 'Member/memberList', '0', '4', '1');
INSERT INTO `yk_module` VALUES ('9', '书籍管理', '', 'Book', '0', '0', '1');
INSERT INTO `yk_module` VALUES ('10', '书籍列表', '', 'Book/bookList', '0', '9', '1');
INSERT INTO `yk_module` VALUES ('11', '系统设置', '', 'System', '0', '0', '1');
INSERT INTO `yk_module` VALUES ('12', '系统设置', '', 'System/systemList', '0', '11', '1');
INSERT INTO `yk_module` VALUES ('13', '分类设置', '', 'System/menuList', '0', '11', '1');
INSERT INTO `yk_module` VALUES ('14', '广告设置', '', 'System/advList', '0', '11', '1');
INSERT INTO `yk_module` VALUES ('15', '书籍采集', '', 'System/getData', '0', '11', '1');
INSERT INTO `yk_module` VALUES ('16', '版本更新', '', 'System/versionList', '0', '11', '1');
INSERT INTO `yk_module` VALUES ('17', 'VIP激活卡', '', 'System/vipCardList', '0', '11', '1');
INSERT INTO `yk_module` VALUES ('18', 'VIP面值', '', 'System/vipValueList', '0', '11', '1');
INSERT INTO `yk_module` VALUES ('19', '轮播图', '', 'Rolling', '0', '0', '1');
INSERT INTO `yk_module` VALUES ('20', '轮播图列表', '', 'Rolling/rollingList', '0', '19', '1');
INSERT INTO `yk_module` VALUES ('21', '系统公告', '', 'System/systemMsg', '0', '11', '1');
INSERT INTO `yk_module` VALUES ('22', '发现', '', 'System/newsList', '0', '11', '1');
INSERT INTO `yk_module` VALUES ('23', '书籍错误信息上报列表', '', 'Book/bookErrorList', '0', '9', '1');
INSERT INTO `yk_module` VALUES ('24', '卡券', '', 'Coupons', '0', '0', '1');
INSERT INTO `yk_module` VALUES ('25', '卡券列表', '', 'Coupons/couponsList', '0', '24', '1');

-- ----------------------------
-- Table structure for yk_network
-- ----------------------------
DROP TABLE IF EXISTS `yk_network`;
CREATE TABLE `yk_network` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL COMMENT '书籍id',
  `menu` int(11) NOT NULL COMMENT '全网分类',
  `time` int(11) NOT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='全网表';

-- ----------------------------
-- Records of yk_network
-- ----------------------------
INSERT INTO `yk_network` VALUES ('12', '27', '44', '1521020949');
INSERT INTO `yk_network` VALUES ('8', '1', '40', '1520476418');
INSERT INTO `yk_network` VALUES ('11', '27', '39', '1521020949');
INSERT INTO `yk_network` VALUES ('7', '1', '39', '1520476418');
INSERT INTO `yk_network` VALUES ('10', '1', '41', '1520476465');
INSERT INTO `yk_network` VALUES ('13', '27', '50', '1521020949');

-- ----------------------------
-- Table structure for yk_news
-- ----------------------------
DROP TABLE IF EXISTS `yk_news`;
CREATE TABLE `yk_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '地址',
  `js_1` varchar(255) DEFAULT NULL,
  `js_2` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `equipment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '设备 1 所有 2 安卓 3 ios',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1 正常 2 停用',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='发现表';

-- ----------------------------
-- Records of yk_news
-- ----------------------------
INSERT INTO `yk_news` VALUES ('1', '推荐', 'https://m.uczzd.cn/webview/newslist?app=lekanxia-iflow&zzd_from=lekanxia-iflow&uc_param_str=dndsfrvesvntnwpfgi&uc_biz_str=S%3Acustom%257CC%3Azzd_list&is_hide_top=1&is_hide_bottom=1&is_hide_ad=1&is_channel_mgr=1&is_hide_nav=0&cid=100', '', '', '', '1', '1', '0');
INSERT INTO `yk_news` VALUES ('2', '热点', 'https://m.uczzd.cn/webview/newslist?app=lekanxia-iflow&zzd_from=lekanxia-iflow&uc_param_str=dndsfrvesvntnwpfgi&uc_biz_str=S:custom%7CC:zzd_list&is_hide_top=1&is_hide_bottom=1&is_hide_ad=1&is_channel_mgr=1&is_hide_nav=0&cid=51830095', null, null, null, '1', '1', '0');
INSERT INTO `yk_news` VALUES ('3', '娱乐', 'https://m.uczzd.cn/webview/newslist?app=lekanxia-iflow&zzd_from=lekanxia-iflow&uc_param_str=dndsfrvesvntnwpfgi&uc_biz_str=S:custom%7CC:zzd_list&is_hide_top=1&is_hide_bottom=1&is_hide_ad=1&is_channel_mgr=1&is_hide_nav=0&cid=179223212', null, null, null, '1', '1', '0');
INSERT INTO `yk_news` VALUES ('4', '体育', 'https://m.uczzd.cn/webview/newslist?app=lekanxia-iflow&zzd_from=lekanxia-iflow&uc_param_str=dndsfrvesvntnwpfgi&uc_biz_str=S:custom%7CC:zzd_list&is_hide_top=1&is_hide_bottom=1&is_hide_ad=1&is_channel_mgr=1&is_hide_nav=0&cid=923258246', null, null, null, '1', '1', '0');
INSERT INTO `yk_news` VALUES ('5', '军事', 'https://m.uczzd.cn/webview/newslist?app=lekanxia-iflow&zzd_from=lekanxia-iflow&uc_param_str=dndsfrvesvntnwpfgi&uc_biz_str=S:custom%7CC:zzd_list&is_hide_top=1&is_hide_bottom=1&is_hide_ad=1&is_channel_mgr=1&is_hide_nav=0&cid=1105405272', null, null, null, '1', '1', '0');
INSERT INTO `yk_news` VALUES ('6', '科技', 'https://m.uczzd.cn/webview/newslist?app=lekanxia-iflow&zzd_from=lekanxia-iflow&uc_param_str=dndsfrvesvntnwpfgi&uc_biz_str=S:custom%7CC:zzd_list&is_hide_top=1&is_hide_bottom=1&is_hide_ad=1&is_channel_mgr=1&is_hide_nav=0&cid=1525483516', null, null, null, '1', '1', '0');

-- ----------------------------
-- Table structure for yk_order
-- ----------------------------
DROP TABLE IF EXISTS `yk_order`;
CREATE TABLE `yk_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `time` int(11) NOT NULL COMMENT '下单时间',
  `state` tinyint(4) NOT NULL COMMENT '状态 1待支付 2已支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of yk_order
-- ----------------------------

-- ----------------------------
-- Table structure for yk_rolling
-- ----------------------------
DROP TABLE IF EXISTS `yk_rolling`;
CREATE TABLE `yk_rolling` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(300) NOT NULL COMMENT '图片地址',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型 1书籍 2外链 3 webview',
  `url` varchar(100) NOT NULL COMMENT '点击地址',
  `score` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `time` int(11) NOT NULL COMMENT '添加时间',
  `position` int(11) NOT NULL DEFAULT '-1' COMMENT '位置 -1 所有',
  `source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '来源 1本站 2 采集',
  `equipment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '设备 1 所有 2 安卓 3 ios',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='滚动图表';

-- ----------------------------
-- Records of yk_rolling
-- ----------------------------
INSERT INTO `yk_rolling` VALUES ('36', 'https://h5img.ikanshu.cn/h5image/20180303/img20180303184115390371.jpg', '1', '', '0', '1520584729', '-1', '2', '1');
INSERT INTO `yk_rolling` VALUES ('35', 'https://h5img.ikanshu.cn/h5image/20180305/img20180305150709288246.jpg', '1', '', '0', '1520584729', '-1', '2', '1');
INSERT INTO `yk_rolling` VALUES ('34', 'https://h5img.ikanshu.cn/h5image/20180306/img20180306162647595193.jpg', '1', '', '0', '1520584729', '-1', '2', '1');

-- ----------------------------
-- Table structure for yk_share
-- ----------------------------
DROP TABLE IF EXISTS `yk_share`;
CREATE TABLE `yk_share` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户id',
  `share_id` int(11) DEFAULT '0' COMMENT '分享id 0 为分享app',
  `target` tinyint(4) NOT NULL COMMENT '1：微信好友，2：微信朋友圈，3：qq好友，4：QQ空间',
  `sign` varchar(50) NOT NULL COMMENT '分享签名',
  `time` int(11) NOT NULL COMMENT '分享时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 未收到回调通知 2 收到',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分享表';

-- ----------------------------
-- Records of yk_share
-- ----------------------------
INSERT INTO `yk_share` VALUES ('1', '0', '0', '1', 'a9337a8d42925d7a42aeef8b8ee72019', '1521273043', '1');
INSERT INTO `yk_share` VALUES ('2', '0', '0', '1', 'fd95c91b2182f60704d9ffa3151123fa', '1521273092', '1');
INSERT INTO `yk_share` VALUES ('3', '0', '0', '1', '5c47397f4ddae5bc3bcf4aaeb5e2a43d', '1521273309', '1');
INSERT INTO `yk_share` VALUES ('4', '0', '0', '1', '39bf1a4a8df9ef24ed1649c0681cef29', '1521274889', '1');

-- ----------------------------
-- Table structure for yk_sign
-- ----------------------------
DROP TABLE IF EXISTS `yk_sign`;
CREATE TABLE `yk_sign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `time` int(11) NOT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='签到表';

-- ----------------------------
-- Records of yk_sign
-- ----------------------------
INSERT INTO `yk_sign` VALUES ('1', '1', '1517889119');

-- ----------------------------
-- Table structure for yk_start_page
-- ----------------------------
DROP TABLE IF EXISTS `yk_start_page`;
CREATE TABLE `yk_start_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL COMMENT '图片地址',
  `button_msg` varchar(255) NOT NULL COMMENT '按钮文字',
  `href` varchar(255) NOT NULL COMMENT '点击目标地址',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '设备 1 通用 2 安卓 3 ios',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `time` int(11) NOT NULL COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1 正常 2 关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='启动页表';

-- ----------------------------
-- Records of yk_start_page
-- ----------------------------
INSERT INTO `yk_start_page` VALUES ('1', 'https://pic2.zhimg.com/80/3f0198a9d7af5d05b117317d5f7a3aad_hd.jpg', '进入', 'https://www.baidu.com/', '测试', '测试', '2', '1521255587', '1523933973', '1521255587', '1');

-- ----------------------------
-- Table structure for yk_system_msg
-- ----------------------------
DROP TABLE IF EXISTS `yk_system_msg`;
CREATE TABLE `yk_system_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) NOT NULL COMMENT '公告',
  `url` varchar(50) DEFAULT NULL COMMENT '目标地址',
  `time` int(11) NOT NULL COMMENT '添加时间',
  `position` tinyint(1) NOT NULL DEFAULT '1' COMMENT '位置 1 所有位置 2 推荐 3 男生 4 女生 5 出版',
  `equipment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '设备 1 所有 2 安卓 3 ios',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1 显示 2 隐藏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统公告表';

-- ----------------------------
-- Records of yk_system_msg
-- ----------------------------
INSERT INTO `yk_system_msg` VALUES ('3', '测试测试测试', 'https://www.baidu.com/', '1521613097', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for yk_verify
-- ----------------------------
DROP TABLE IF EXISTS `yk_verify`;
CREATE TABLE `yk_verify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `code` mediumint(6) unsigned NOT NULL COMMENT '验证码',
  `time` int(11) NOT NULL COMMENT '发送时间',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1 正常 2 已使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='验证码表';

-- ----------------------------
-- Records of yk_verify
-- ----------------------------
INSERT INTO `yk_verify` VALUES ('1', '15182928984', '123456', '1516589521', '2');
INSERT INTO `yk_verify` VALUES ('2', '15182928984', '123456', '1516591920', '2');

-- ----------------------------
-- Table structure for yk_version
-- ----------------------------
DROP TABLE IF EXISTS `yk_version`;
CREATE TABLE `yk_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version_number` varchar(30) NOT NULL COMMENT '版本号',
  `path` varchar(150) NOT NULL COMMENT '更新地址',
  `msg` varchar(255) DEFAULT NULL COMMENT '更新内容',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跟新类型 1 安卓 2 ios',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1 强制更新 2 不强制更新',
  `time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='版本更新';

-- ----------------------------
-- Records of yk_version
-- ----------------------------
INSERT INTO `yk_version` VALUES ('1', '1.6', '', '测试', '1', '1', '0');
INSERT INTO `yk_version` VALUES ('2', '1.1', 'http://www.baidu.com', '测试', '2', '2', '0');

-- ----------------------------
-- Table structure for yk_vip_card
-- ----------------------------
DROP TABLE IF EXISTS `yk_vip_card`;
CREATE TABLE `yk_vip_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户id',
  `value_id` int(11) NOT NULL COMMENT '面值id',
  `time` int(11) NOT NULL COMMENT '生成时间',
  `end_time` int(11) NOT NULL COMMENT '过期时间',
  `use_time` int(11) DEFAULT NULL COMMENT '使用时间',
  `code` char(12) NOT NULL COMMENT '激活码',
  `admin_id` int(11) NOT NULL COMMENT '生成管理员id',
  `msg` varchar(255) NOT NULL COMMENT '备注消息',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 正常 2 已使用 3 已删除',
  `activity_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动id',
  `title` varchar(50) DEFAULT NULL COMMENT '激活码标题',
  `content` varchar(100) DEFAULT NULL COMMENT '活动内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='vip充值卡';

-- ----------------------------
-- Records of yk_vip_card
-- ----------------------------
INSERT INTO `yk_vip_card` VALUES ('3', '1', '2', '1522377152', '1523690460', '1522377221', '202018033019', '1', '测试测试测试', '2', '32', '测试', '156123156');
INSERT INTO `yk_vip_card` VALUES ('4', '1', '2', '1522390984', '1522425600', '1522391003', '192018033098', '1', '', '2', '0', '', null);

-- ----------------------------
-- Table structure for yk_vip_card_activity
-- ----------------------------
DROP TABLE IF EXISTS `yk_vip_card_activity`;
CREATE TABLE `yk_vip_card_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value_id` int(11) NOT NULL COMMENT '面值id',
  `time` int(11) NOT NULL COMMENT '生成时间',
  `end_time` int(11) NOT NULL COMMENT '过期时间',
  `admin_id` int(11) NOT NULL COMMENT '生成管理员id',
  `msg` varchar(255) NOT NULL COMMENT '备注消息',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 正常 2 已删除',
  `title` varchar(50) NOT NULL COMMENT '激活码标题',
  `content` varchar(100) NOT NULL COMMENT '活动内容',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '可领取数量',
  `get_num` int(11) NOT NULL COMMENT '已领取数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='vip活动充值卡';

-- ----------------------------
-- Records of yk_vip_card_activity
-- ----------------------------
INSERT INTO `yk_vip_card_activity` VALUES ('1', '2', '1520823248', '1523690460', '1', '', '2', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('2', '2', '1520823248', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('3', '2', '1520823248', '1523690460', '1', '', '1', '', '121231231', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('4', '2', '1520823248', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('5', '2', '1520823248', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('6', '1', '1520823410', '1523690460', '1', '测试', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('7', '1', '1520823410', '1523690460', '1', '测试', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('8', '1', '1520823410', '1523690460', '1', '测试', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('9', '1', '1520823410', '1523690460', '1', '测试', '3', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('10', '1', '1520823410', '1523690460', '1', '测试', '3', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('11', '2', '1521018258', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('12', '2', '1521018258', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('13', '2', '1521018258', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('14', '2', '1521018258', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('15', '2', '1521018258', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('16', '2', '1521018309', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('17', '2', '1521018309', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('18', '2', '1521018309', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('19', '2', '1521018309', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('20', '2', '1521018309', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('21', '2', '1521018325', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('22', '2', '1521018325', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('23', '2', '1521018325', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('24', '2', '1521018325', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('25', '2', '1521018325', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('26', '2', '1521018355', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('27', '2', '1521018355', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('28', '2', '1521018355', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('29', '2', '1521018355', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('30', '2', '1521018355', '1523690460', '1', '', '1', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('31', '2', '1521604239', '1523690460', '1', '查杀查杀', '2', '', '', '10', '0');
INSERT INTO `yk_vip_card_activity` VALUES ('32', '2', '1521604325', '1523690460', '1', '测试测试测试', '1', '测试', '156123156', '10', '1');
INSERT INTO `yk_vip_card_activity` VALUES ('33', '2', '1522382555', '1522857600', '1', '清明节备注信息', '2', '清明节', '清明节活动内容', '100', '0');

-- ----------------------------
-- Table structure for yk_vip_card_value
-- ----------------------------
DROP TABLE IF EXISTS `yk_vip_card_value`;
CREATE TABLE `yk_vip_card_value` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL COMMENT '数量',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 天 2 月 3 年',
  `time` int(11) NOT NULL COMMENT '生成时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='vip充值卡面值';

-- ----------------------------
-- Records of yk_vip_card_value
-- ----------------------------
INSERT INTO `yk_vip_card_value` VALUES ('1', '1', '1', '1520676176');
INSERT INTO `yk_vip_card_value` VALUES ('2', '1', '2', '1520676252');
