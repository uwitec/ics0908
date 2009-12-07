/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : icdb
Target Host     : localhost:3306
Target Database : icdb
Date: 2009-12-06 19:06:39
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `accountCode` varchar(45) NOT NULL,
  `accountNumber` varchar(45) default NULL,
  `accountType` varchar(45) default NULL,
  `personCode` varchar(45) default NULL,
  `bankCode` int(11) default NULL,
  `isEnabled` int(11) default NULL,
  `supplierCode` varchar(100) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`accountCode`),
  KEY `fk_Account_Bank1` (`bankCode`),
  KEY `fk_Account_People1` (`personCode`),
  KEY `fk_Account_Supplier` (`supplierCode`),
  CONSTRAINT `fk_Account_Bank1` FOREIGN KEY (`bankCode`) REFERENCES `bank` (`bankCode`),
  CONSTRAINT `fk_Account_People1` FOREIGN KEY (`personCode`) REFERENCES `person` (`personCode`),
  CONSTRAINT `fk_Account_Supplier` FOREIGN KEY (`supplierCode`) REFERENCES `supplier` (`supplierCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('A20091010165657156', '0444132441', '无', null, '83809', '1', 'S20091010155815130', null);
INSERT INTO `account` VALUES ('A20091010165718181', '102304550223', '无', null, '73646', '1', 'S20091010154237182', null);

-- ----------------------------
-- Table structure for backorder
-- ----------------------------
DROP TABLE IF EXISTS `backorder`;
CREATE TABLE `backorder` (
  `backOrderCode` varchar(45) NOT NULL,
  `stockOutOrderCode` varchar(45) default NULL,
  `stockOutDate` datetime default NULL,
  `stockOutOptionor` varchar(45) default NULL,
  `stockOutState` int(11) default NULL,
  `stockPersion` varchar(45) default NULL,
  PRIMARY KEY  (`backOrderCode`),
  KEY `FK_Reference_25` (`stockOutOrderCode`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`stockOutOrderCode`) REFERENCES `stockoutorder` (`stockOutOrderCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backorder
-- ----------------------------

-- ----------------------------
-- Table structure for backorderhasmateriel
-- ----------------------------
DROP TABLE IF EXISTS `backorderhasmateriel`;
CREATE TABLE `backorderhasmateriel` (
  `backOrderCode` varchar(45) NOT NULL,
  `materielCode` varchar(45) NOT NULL,
  `materelCount` decimal(10,0) default NULL,
  `materelPrice` decimal(10,0) default NULL,
  `cargoSpaceCode` varchar(45) NOT NULL,
  PRIMARY KEY  (`backOrderCode`,`materielCode`,`cargoSpaceCode`),
  KEY `FK_Reference_31` (`materielCode`),
  KEY `FK_Reference_40` (`cargoSpaceCode`),
  CONSTRAINT `FK_Reference_30` FOREIGN KEY (`backOrderCode`) REFERENCES `backorder` (`backOrderCode`),
  CONSTRAINT `FK_Reference_31` FOREIGN KEY (`materielCode`) REFERENCES `materiel` (`materielCode`),
  CONSTRAINT `FK_Reference_40` FOREIGN KEY (`cargoSpaceCode`) REFERENCES `cargospace` (`cargoSpaceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of backorderhasmateriel
-- ----------------------------

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank` (
  `bankCode` int(11) NOT NULL,
  `bankName` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`bankCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES ('24663', '中国银行', '1', null);
INSERT INTO `bank` VALUES ('29533', '交通银行', '1', null);
INSERT INTO `bank` VALUES ('39278', '广东发展银行', '1', null);
INSERT INTO `bank` VALUES ('73140', '民生银行', '1', null);
INSERT INTO `bank` VALUES ('73646', '建设银行', '1', null);
INSERT INTO `bank` VALUES ('74220', '光大银行', '1', null);
INSERT INTO `bank` VALUES ('82241', '农业银行', '1', null);
INSERT INTO `bank` VALUES ('83809', '工商银行', '1', null);

-- ----------------------------
-- Table structure for cargospace
-- ----------------------------
DROP TABLE IF EXISTS `cargospace`;
CREATE TABLE `cargospace` (
  `cargoSpaceCode` varchar(45) NOT NULL,
  `cargoSpaceName` varchar(45) default NULL,
  `cargoSpaceAddress` varchar(45) default NULL,
  `storehouseCode` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`cargoSpaceCode`),
  KEY `fk_CargoSpace_Storehouse1` (`storehouseCode`),
  CONSTRAINT `fk_CargoSpace_Storehouse1` FOREIGN KEY (`storehouseCode`) REFERENCES `storehouse` (`storehouseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cargospace
-- ----------------------------
INSERT INTO `cargospace` VALUES ('C20091011082127174', '粮食大豆货区', '', 'ST20091011081424182', '1', null);
INSERT INTO `cargospace` VALUES ('C20091011082613185', '粮食综合区', '', 'ST20091011081424182', '1', null);
INSERT INTO `cargospace` VALUES ('C20091011082620161', '粮食麦谷区', '', 'ST20091011081424182', '1', null);
INSERT INTO `cargospace` VALUES ('C20091011082708141', '钢管区', '', 'ST20091011081527194', '1', null);
INSERT INTO `cargospace` VALUES ('C20091011082714184', '配件区', '', 'ST20091011081527194', '1', null);
INSERT INTO `cargospace` VALUES ('C20091011082719181', '钢板区', '', 'ST20091011081527194', '1', null);
INSERT INTO `cargospace` VALUES ('C20091011082737133', '无缝管区', '', 'ST20091011081732188', '1', null);
INSERT INTO `cargospace` VALUES ('C20091011082749134', '轨梁区', '', 'ST20091011081732188', '1', null);
INSERT INTO `cargospace` VALUES ('C20091011082812192', '综合粮食区', '', 'ST20091011081849115', '1', null);
INSERT INTO `cargospace` VALUES ('C20091011082824188', '综合谷物区', '', 'ST20091011081849115', '1', null);
INSERT INTO `cargospace` VALUES ('C20091011082858180', '豆类存放区', '', 'ST20091011081849115', '1', null);

-- ----------------------------
-- Table structure for checkstock
-- ----------------------------
DROP TABLE IF EXISTS `checkstock`;
CREATE TABLE `checkstock` (
  `csCode` varchar(45) NOT NULL,
  `storehouseCode` varchar(45) default NULL,
  `csDate` datetime default NULL,
  `csApprove` varchar(45) default NULL,
  `csApproveMessage` varchar(450) default NULL,
  `csApproveState` varchar(45) default NULL,
  `csCheckPerson` varchar(45) default NULL,
  `csOptionor` varchar(45) default NULL,
  `csState` int(11) default NULL,
  `csStartStock` int(11) default NULL,
  PRIMARY KEY  (`csCode`),
  KEY `FK_Reference_35` (`storehouseCode`),
  CONSTRAINT `FK_Reference_35` FOREIGN KEY (`storehouseCode`) REFERENCES `storehouse` (`storehouseCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkstock
-- ----------------------------
INSERT INTO `checkstock` VALUES ('CS20091030113221179', 'ST20091011081424182', '2009-10-30 11:32:21', null, '', '1', '仓库管理员', 'P20091010172633124', '1', '1');
INSERT INTO `checkstock` VALUES ('CS20091030113442136', 'ST20091011081527194', '2009-10-30 11:34:42', null, null, '0', null, 'P20091010172633124', '1', '0');
INSERT INTO `checkstock` VALUES ('CS20091030120001165', 'ST20091011081732188', '2009-10-30 12:00:01', null, null, '0', null, 'P20091010172633124', '1', '0');
INSERT INTO `checkstock` VALUES ('CS20091030120010104', 'ST20091011081849115', '2009-10-30 12:00:10', null, null, '0', null, 'P20091010172633124', '2', '0');

-- ----------------------------
-- Table structure for checkstocklist
-- ----------------------------
DROP TABLE IF EXISTS `checkstocklist`;
CREATE TABLE `checkstocklist` (
  `csCode` varchar(45) default NULL,
  `materielCode` varchar(45) default NULL,
  `cargoSpaceCode` varchar(45) default NULL,
  `csStartPrice` decimal(10,0) default NULL,
  `csStartNumber` decimal(10,0) default NULL,
  `csCheckPrice` decimal(10,0) default NULL,
  `csCheckNumber` decimal(10,0) default NULL,
  `csDiffMessage` varchar(450) default NULL,
  `csRemark` varchar(450) default NULL,
  `csGM` varchar(45) default NULL,
  KEY `FK_Reference_32` (`csCode`),
  KEY `FK_Reference_33` (`materielCode`),
  KEY `FK_Reference_34` (`cargoSpaceCode`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`csCode`) REFERENCES `checkstock` (`csCode`),
  CONSTRAINT `FK_Reference_33` FOREIGN KEY (`materielCode`) REFERENCES `materiel` (`materielCode`),
  CONSTRAINT `FK_Reference_34` FOREIGN KEY (`cargoSpaceCode`) REFERENCES `cargospace` (`cargoSpaceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkstocklist
-- ----------------------------
INSERT INTO `checkstocklist` VALUES ('CS20091030113221179', 'M20091011083026106', 'C20091011082127174', '3', '170', '3', '170', '', '', '');
INSERT INTO `checkstocklist` VALUES ('CS20091030113221179', 'M20091011083057172', 'C20091011082613185', '1', '380', '1', '380', '', '', '');
INSERT INTO `checkstocklist` VALUES ('CS20091030113442136', 'M20091011083126129', 'C20091011082708141', '230', '200', '230', '200', '', '', '');
INSERT INTO `checkstocklist` VALUES ('CS20091030113442136', 'M20091011083312151', 'C20091011082719181', '300', '30', '300', '30', '', '', '');
INSERT INTO `checkstocklist` VALUES ('CS20091030120001165', 'M20091011083126129', 'C20091011082737133', '230', '40', '230', '41', '', '', '');
INSERT INTO `checkstocklist` VALUES ('CS20091030120001165', 'M20091011083230143', 'C20091011082737133', '800', '50', '800', '49', '', '', '');
INSERT INTO `checkstocklist` VALUES ('CS20091030120010104', 'M20091011083026106', 'C20091011082858180', '3', '110', '3', '110', null, null, null);
INSERT INTO `checkstocklist` VALUES ('CS20091030120010104', 'M20091011083057172', 'C20091011082812192', '1', '400', '1', '400', null, null, null);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerCode` varchar(45) NOT NULL,
  `customerName` varchar(45) default NULL,
  `customerAddress` varchar(45) default NULL,
  `customerPhone` varchar(45) default NULL,
  `customerZipCode` varchar(45) default NULL,
  `customerFax` varchar(45) default NULL,
  `customerRemark` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`customerCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('CUS20091010171345105', '粮食加工客户', '上不明确', '23311134', '3331123', '1333311234', '', '1', '二毛');
INSERT INTO `customer` VALUES ('CUS20091010171423152', '机械制造商', '不明确', '342444213', '00223441', '213132123', '', '1', '二楞');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentCode` varchar(45) NOT NULL,
  `departmentName` varchar(45) default NULL,
  `structCode` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`departmentCode`),
  KEY `fk_Department_Struct1` (`structCode`),
  CONSTRAINT `fk_Department_Struct1` FOREIGN KEY (`structCode`) REFERENCES `struct` (`structCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('D20091010153506199', '生产一厂', 'S20091010153417119', '1', null);
INSERT INTO `department` VALUES ('D20091010153520148', '生产二厂', 'S20091010153417119', '1', null);
INSERT INTO `department` VALUES ('D20091010153527176', '销售部', 'S20091010153417119', '1', null);
INSERT INTO `department` VALUES ('D20091010153838145', '库管中心', 'S20091010153417119', '1', null);
INSERT INTO `department` VALUES ('D20091010153854132', '财务部', 'S20091010153417119', '1', null);
INSERT INTO `department` VALUES ('D20091010154145158', '厂长办公室', 'S20091010153417119', '1', null);
INSERT INTO `department` VALUES ('D20091030211717109', '生产三厂', 'S20091010153417119', '1', null);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employeeCode` varchar(45) NOT NULL,
  `personCode` varchar(45) NOT NULL,
  `jobCode` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  `userName` varchar(255) default NULL,
  `password` varchar(45) default NULL,
  `permissionCode` varchar(1000) default NULL,
  `isAlowLogin` int(11) default NULL,
  PRIMARY KEY  (`employeeCode`),
  KEY `fk_Employee_Job1` (`jobCode`),
  KEY `fk_Employee_Person` (`personCode`),
  CONSTRAINT `fk_Employee_Job1` FOREIGN KEY (`jobCode`) REFERENCES `job` (`jobCode`),
  CONSTRAINT `fk_Employee_Person` FOREIGN KEY (`personCode`) REFERENCES `person` (`personCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('E20091010172633100', 'P20091010172633124', 'J20091010154055166', '1', null, 'gm', '4d9012b4a77a9524d675dad27c3276ab5705e5e8', '11111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000010000000010000010000000000000000000000011000000001111000000000000000000000000000000000000110000000000000000001100000000111000000011100000001100000000000000000011', '1');
INSERT INTO `employee` VALUES ('E20091011081247168', 'P20091011081247124', 'J20091010154050182', '1', null, 'laoxiao', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '1111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000001', '1');
INSERT INTO `employee` VALUES ('E20091011081342198', 'P20091011081342117', 'J20091010153945108', '1', null, 'xiaoli', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', '1001000000011111110000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001', '1');
INSERT INTO `employee` VALUES ('E20091030214526190', 'P20091030214526168', 'J20091010153945108', '1', null, 'chencheng', '3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d', null, '0');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `jobCode` varchar(45) NOT NULL,
  `jobName` varchar(45) default NULL,
  `departmentCode` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  `permissionCode` varchar(255) default NULL,
  PRIMARY KEY  (`jobCode`),
  KEY `fk_Job_Department1` (`departmentCode`),
  CONSTRAINT `fk_Job_Department1` FOREIGN KEY (`departmentCode`) REFERENCES `department` (`departmentCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('J20091010153945108', '职工', 'D20091010153506199', '1', null, null);
INSERT INTO `job` VALUES ('J20091010154005121', '车间主任', 'D20091010153506199', '1', null, null);
INSERT INTO `job` VALUES ('J20091010154031173', '车间主任', 'D20091010153520148', '1', null, null);
INSERT INTO `job` VALUES ('J20091010154037130', '职工', 'D20091010153520148', '1', null, null);
INSERT INTO `job` VALUES ('J20091010154042179', '销售经理', 'D20091010153527176', '1', null, null);
INSERT INTO `job` VALUES ('J20091010154050182', '销售员', 'D20091010153527176', '1', null, null);
INSERT INTO `job` VALUES ('J20091010154055166', '管理员', 'D20091010153838145', '1', null, null);
INSERT INTO `job` VALUES ('J20091010154103101', '出纳', 'D20091010153854132', '1', null, null);
INSERT INTO `job` VALUES ('J20091010154205108', '厂长', 'D20091010154145158', '1', null, null);
INSERT INTO `job` VALUES ('J20091030210211150', ' 财务主管', 'D20091010153854132', '1', null, null);
INSERT INTO `job` VALUES ('J20091030210258121', '检测', 'D20091010153838145', '1', null, null);

-- ----------------------------
-- Table structure for materiel
-- ----------------------------
DROP TABLE IF EXISTS `materiel`;
CREATE TABLE `materiel` (
  `materielCode` varchar(45) NOT NULL,
  `materielName` varchar(45) default NULL,
  `materielMadeIn` varchar(45) default NULL,
  `materielPrice` varchar(45) default NULL,
  `materielMaxStore` varchar(45) default NULL,
  `materielMinStore` varchar(45) default NULL,
  `materielSpell` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  `materielSize` varchar(45) default NULL,
  `materielABC` varchar(45) default NULL,
  PRIMARY KEY  (`materielCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of materiel
-- ----------------------------
INSERT INTO `materiel` VALUES ('M20091011083026106', '大豆', '东北', '3.0', '10000', '20', null, '1', null, '公斤', '3');
INSERT INTO `materiel` VALUES ('M20091011083057172', '土豆', '内蒙', '1.0', '30000', '100', null, '1', null, '公斤', '3');
INSERT INTO `materiel` VALUES ('M20091011083126129', '无缝钢管', '河北', '230', '3000', '100', null, '1', null, '根（3.5CM×3.4M）', '1');
INSERT INTO `materiel` VALUES ('M20091011083230143', '轨梁', '内蒙', '800', '1000', '10', null, '1', null, '根（24M）', '1');
INSERT INTO `materiel` VALUES ('M20091011083312151', '铁板', '内蒙', '300', '800', '20', null, '1', null, '张（2000MM×4000MM）', '2');
INSERT INTO `materiel` VALUES ('M20091011083401175', '滚轴配件', '湖北', '1040', '300', '10', null, '1', null, '汽车标配', '1');
INSERT INTO `materiel` VALUES ('M20091011083452194', '轴承', '内蒙', '70', '3000', '100', null, '1', null, '个', '2');
INSERT INTO `materiel` VALUES ('M20091030220640118', '发动机', '十堰', '2000', '20', '10', null, '1', null, '500CC', '1');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permissionCode` varchar(45) NOT NULL,
  `permissionName` varchar(255) default NULL,
  `permissionRmark` varchar(500) default NULL,
  `permissionParentCode` varchar(45) default NULL,
  PRIMARY KEY  (`permissionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `personCode` varchar(45) NOT NULL,
  `personName` varchar(45) default NULL,
  `personPhone` varchar(45) default NULL,
  `personEmail` varchar(45) default NULL,
  `personSex` varchar(45) default NULL,
  `personPhoto` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  `personCertificateType` int(11) default NULL,
  `personCertificateCode` varchar(45) default NULL,
  PRIMARY KEY  (`personCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('P20091010172633124', '仓库管理员', '123', '132', '男', null, '1', null, null, null);
INSERT INTO `person` VALUES ('P20091011081247124', '老萧', '13243567542', '', '男', null, '1', null, null, null);
INSERT INTO `person` VALUES ('P20091011081342117', '小李', '13245566423', '', '男', null, '1', null, null, null);
INSERT INTO `person` VALUES ('P20091030214526168', '陈诚', '11234422', '12321123', '男', null, '1', null, null, null);

-- ----------------------------
-- Table structure for pricechange
-- ----------------------------
DROP TABLE IF EXISTS `pricechange`;
CREATE TABLE `pricechange` (
  `pchangeCode` varchar(45) NOT NULL,
  `pchangeDate` varchar(45) NOT NULL,
  `optionar` varchar(45) default NULL,
  `pchangeMessage` varchar(2000) default NULL,
  `jsonField` varchar(3000) default NULL,
  `pchangeState` int(11) default NULL,
  PRIMARY KEY  (`pchangeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pricechange
-- ----------------------------
INSERT INTO `pricechange` VALUES ('PC20091102145152138', '2009/11/02 14:51:52', null, null, null, '2');
INSERT INTO `pricechange` VALUES ('PC20091102145253153', '2009/11/02 14:52:53', null, null, null, '1');
INSERT INTO `pricechange` VALUES ('PC20091102145934187', '2009/11/02 14:59:34', 'P20091010172633124', null, null, '2');
INSERT INTO `pricechange` VALUES ('PC20091102150234194', '2009/11/02 15:02:34', 'P20091010172633124', null, null, '2');
INSERT INTO `pricechange` VALUES ('PC20091102160522167', '2009/11/02 16:05:22', 'P20091010172633124', null, null, '1');

-- ----------------------------
-- Table structure for pricechangemateriel
-- ----------------------------
DROP TABLE IF EXISTS `pricechangemateriel`;
CREATE TABLE `pricechangemateriel` (
  `materielCode` varchar(45) NOT NULL,
  `pchangeCode` varchar(45) NOT NULL,
  `cargoSpaceCode` varchar(45) NOT NULL,
  `stockPriceOld` decimal(10,0) default NULL,
  `stockPriceNew` decimal(10,0) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`materielCode`,`pchangeCode`,`cargoSpaceCode`),
  KEY `FK_Reference_41` (`pchangeCode`),
  KEY `FK_Reference_42` (`cargoSpaceCode`),
  CONSTRAINT `FK_Reference_41` FOREIGN KEY (`pchangeCode`) REFERENCES `pricechange` (`pchangeCode`),
  CONSTRAINT `FK_Reference_42` FOREIGN KEY (`cargoSpaceCode`) REFERENCES `cargospace` (`cargoSpaceCode`),
  CONSTRAINT `FK_Reference_43` FOREIGN KEY (`materielCode`) REFERENCES `materiel` (`materielCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pricechangemateriel
-- ----------------------------
INSERT INTO `pricechangemateriel` VALUES ('M20091011083026106', 'PC20091102145152138', 'C20091011082127174', '3', '3', null);
INSERT INTO `pricechangemateriel` VALUES ('M20091011083026106', 'PC20091102145253153', 'C20091011082127174', '3', '3', null);
INSERT INTO `pricechangemateriel` VALUES ('M20091011083026106', 'PC20091102145934187', 'C20091011082127174', '3', '3', null);
INSERT INTO `pricechangemateriel` VALUES ('M20091011083026106', 'PC20091102150234194', 'C20091011082127174', '3', '3', null);
INSERT INTO `pricechangemateriel` VALUES ('M20091011083026106', 'PC20091102160522167', 'C20091011082127174', '3', '3', null);
INSERT INTO `pricechangemateriel` VALUES ('M20091011083057172', 'PC20091102145152138', 'C20091011082613185', '1', '1', null);
INSERT INTO `pricechangemateriel` VALUES ('M20091011083057172', 'PC20091102145253153', 'C20091011082613185', '1', '1', null);
INSERT INTO `pricechangemateriel` VALUES ('M20091011083057172', 'PC20091102145934187', 'C20091011082613185', '1', '1', null);
INSERT INTO `pricechangemateriel` VALUES ('M20091011083057172', 'PC20091102150234194', 'C20091011082613185', '1', '1', null);
INSERT INTO `pricechangemateriel` VALUES ('M20091011083057172', 'PC20091102160522167', 'C20091011082613185', '1', '1', null);

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `cargoSpaceCode` varchar(45) NOT NULL,
  `materielCode` varchar(45) NOT NULL,
  `stockPrice` decimal(10,0) default NULL,
  `stockAmount` varchar(45) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`cargoSpaceCode`,`materielCode`),
  KEY `fk_Stock_Materiel` (`materielCode`),
  CONSTRAINT `fk_Stock_CargoSpace` FOREIGN KEY (`cargoSpaceCode`) REFERENCES `cargospace` (`cargoSpaceCode`),
  CONSTRAINT `fk_Stock_Materiel` FOREIGN KEY (`materielCode`) REFERENCES `materiel` (`materielCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('C20091011082127174', 'M20091011083026106', '3', '170.0', null);
INSERT INTO `stock` VALUES ('C20091011082613185', 'M20091011083057172', '1', '380.0', null);
INSERT INTO `stock` VALUES ('C20091011082708141', 'M20091011083126129', '230', '200', null);
INSERT INTO `stock` VALUES ('C20091011082719181', 'M20091011083312151', '300', '30', null);
INSERT INTO `stock` VALUES ('C20091011082737133', 'M20091011083126129', '230', '40', null);
INSERT INTO `stock` VALUES ('C20091011082737133', 'M20091011083230143', '800', '50', null);
INSERT INTO `stock` VALUES ('C20091011082812192', 'M20091011083057172', '1', '400', null);
INSERT INTO `stock` VALUES ('C20091011082858180', 'M20091011083026106', '3', '110', null);

-- ----------------------------
-- Table structure for stockincheckmateriel
-- ----------------------------
DROP TABLE IF EXISTS `stockincheckmateriel`;
CREATE TABLE `stockincheckmateriel` (
  `materielCode` varchar(45) NOT NULL,
  `supplierCode` varchar(100) NOT NULL,
  `cargoSpaceCode` varchar(45) default NULL,
  `stockInCode` varchar(45) NOT NULL,
  `amountPercent` decimal(10,0) default NULL,
  `qualityPercent` decimal(10,0) default NULL,
  `checkTime` bigint(20) default NULL,
  `packagePercent` decimal(10,0) default NULL,
  `errorStockPercent` decimal(10,0) default NULL,
  `checkNote` varchar(400) default NULL,
  `checkAmount` int(11) default NULL,
  `checkRemark` varchar(400) default NULL,
  `lastAmount` int(11) default NULL,
  `stockInAmount` decimal(10,0) default NULL,
  `onePrice` decimal(10,0) default NULL,
  `stockInType` int(11) default NULL,
  PRIMARY KEY  (`materielCode`,`supplierCode`,`stockInCode`),
  KEY `FK_Reference_27` (`supplierCode`),
  KEY `FK_Reference_29` (`stockInCode`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`materielCode`) REFERENCES `materiel` (`materielCode`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`supplierCode`) REFERENCES `supplier` (`supplierCode`),
  CONSTRAINT `FK_Reference_29` FOREIGN KEY (`stockInCode`) REFERENCES `stockincheckorder` (`stockInCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockincheckmateriel
-- ----------------------------
INSERT INTO `stockincheckmateriel` VALUES ('M20091011083126129', 'S20091010154237182', 'undefined', 'SI20091203170819176', null, null, null, null, null, '', null, '', null, '400', '20', '2');
INSERT INTO `stockincheckmateriel` VALUES ('M20091011083230143', 'S20091010154237182', 'undefined', 'SI20091203170819176', null, null, null, null, null, '', null, '', null, '500', '60', '2');
INSERT INTO `stockincheckmateriel` VALUES ('M20091011083312151', 'S20091010154237182', null, 'SI20091204100247187', null, null, null, null, null, '', null, '', null, '300', '20', '1');
INSERT INTO `stockincheckmateriel` VALUES ('M20091011083401175', 'S20091010154237182', null, 'SI20091204111427194', null, null, null, null, null, '', null, '', null, '400', '5', '1');
INSERT INTO `stockincheckmateriel` VALUES ('M20091011083401175', 'S20091010160015177', null, 'SI20091204100247187', null, null, null, null, null, '', null, '', null, '400', '10', '1');
INSERT INTO `stockincheckmateriel` VALUES ('M20091011083452194', 'S20091010155714156', null, 'SI20091204105418177', null, null, null, null, null, '', null, '', null, '3405', '5', '1');
INSERT INTO `stockincheckmateriel` VALUES ('M20091011083452194', 'S20091010155714156', null, 'SI20091204111427194', null, null, null, null, null, '', null, '', null, '20', '5', '1');
INSERT INTO `stockincheckmateriel` VALUES ('M20091030220640118', 'S20091010154237182', null, 'SI20091204105418177', null, null, null, null, null, '', null, '', null, '5004', '502', '1');

-- ----------------------------
-- Table structure for stockincheckorder
-- ----------------------------
DROP TABLE IF EXISTS `stockincheckorder`;
CREATE TABLE `stockincheckorder` (
  `stockInCode` varchar(45) NOT NULL,
  `stockInDate` datetime default NULL,
  `employeeCode` varchar(45) default NULL,
  `checkMessage` varchar(450) default NULL,
  `checkResult` int(11) default NULL,
  `orderNumber` varchar(45) default NULL,
  `checkRemark` varchar(450) default NULL,
  `sendTime` datetime default NULL,
  `arriveTime` datetime default NULL,
  `checkTime` datetime default NULL,
  `stockInType` varchar(45) default NULL,
  `stockInState` int(11) default NULL,
  `stockInStateType` int(11) default NULL,
  `stockInGM` varchar(45) default NULL,
  `stockInExGM` varchar(45) default NULL,
  `stockInExDate` datetime default NULL,
  `stockInExMessage` varchar(450) default NULL,
  `stockInWill` varchar(45) default NULL,
  `stockInCheckState` int(11) default NULL,
  PRIMARY KEY  (`stockInCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockincheckorder
-- ----------------------------
INSERT INTO `stockincheckorder` VALUES ('SI20091203170819176', '2009-12-04 15:20:15', 'fddf', '', '1', '', '', null, null, null, '2', null, '3', '', '', '2009-12-04 10:00:17', '', '', '1');
INSERT INTO `stockincheckorder` VALUES ('SI20091204100247187', '2009-12-04 10:03:14', null, '', '0', '', '', null, null, null, '1', null, '1', '', '', null, '', '', '0');
INSERT INTO `stockincheckorder` VALUES ('SI20091204100521186', '2009-12-04 10:05:27', null, '', '0', '', '', null, null, null, '1', null, '1', '', '', null, '', '', '0');
INSERT INTO `stockincheckorder` VALUES ('SI20091204105418177', '2009-12-04 10:56:02', null, '', '0', '', '', null, null, null, '1', null, '1', '', '', null, '', '', '0');
INSERT INTO `stockincheckorder` VALUES ('SI20091204111427194', '2009-12-04 11:14:45', null, '', '0', '', '', null, null, null, '1', null, '2', '', '', null, '', '', '0');

-- ----------------------------
-- Table structure for stockouthasmateriel
-- ----------------------------
DROP TABLE IF EXISTS `stockouthasmateriel`;
CREATE TABLE `stockouthasmateriel` (
  `cargoSpaceCode` varchar(45) NOT NULL,
  `materielCode` varchar(45) NOT NULL,
  `stockOutOrderCode` varchar(45) NOT NULL,
  `stockOutAmount` int(11) default NULL,
  `stockOutPrice` decimal(10,0) default NULL,
  `typeIsOk` int(11) default NULL,
  `amountIsOk` int(11) default NULL,
  `specificationIsOk` int(11) default NULL,
  PRIMARY KEY  (`cargoSpaceCode`,`materielCode`,`stockOutOrderCode`),
  KEY `FK_Reference_54` (`stockOutOrderCode`),
  CONSTRAINT `FK_Reference_50` FOREIGN KEY (`cargoSpaceCode`, `materielCode`) REFERENCES `stock` (`cargoSpaceCode`, `materielCode`),
  CONSTRAINT `FK_Reference_54` FOREIGN KEY (`stockOutOrderCode`) REFERENCES `stockoutorder` (`stockOutOrderCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockouthasmateriel
-- ----------------------------

-- ----------------------------
-- Table structure for stockoutorder
-- ----------------------------
DROP TABLE IF EXISTS `stockoutorder`;
CREATE TABLE `stockoutorder` (
  `stockOutOrderCode` varchar(45) NOT NULL,
  `customerCode` varchar(45) default NULL,
  `stockOutState` int(11) default NULL,
  `stockOutDealWith` varchar(45) default NULL,
  `stockOutDealMessage` varchar(45) default NULL,
  `stockOutDealDate` datetime default NULL,
  `stockOutDealState` int(11) default NULL,
  `stockOutManager` varchar(45) default NULL,
  `stockOutDate` datetime default NULL,
  `stockOutDestination` varchar(400) default NULL,
  `stockOutChecker` varchar(45) default NULL,
  `stockOutCheckState` int(11) default NULL,
  `stockOutCheckDate` datetime default NULL,
  `stockOutMessage` varchar(45) default NULL,
  `stockOutStateType` int(11) default NULL,
  `stockOrtherMoney` varchar(45) default NULL,
  `stockOrtherMessage` varchar(400) default NULL,
  `stockOutWillDate` datetime default NULL,
  `stockOutWith` varchar(45) default NULL,
  `stockOutWithState` int(11) default NULL,
  PRIMARY KEY  (`stockOutOrderCode`),
  KEY `FK_Reference_37` (`customerCode`),
  CONSTRAINT `FK_Reference_37` FOREIGN KEY (`customerCode`) REFERENCES `customer` (`customerCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stockoutorder
-- ----------------------------
INSERT INTO `stockoutorder` VALUES ('SO20091102221453131', null, null, '', '', '2009-12-02 17:13:56', '0', '', '2009-12-02 17:13:56', '', '', '1', '2009-12-02 17:13:56', '', '1', '', '', '2009-12-02 17:13:56', '', '0');

-- ----------------------------
-- Table structure for storehouse
-- ----------------------------
DROP TABLE IF EXISTS `storehouse`;
CREATE TABLE `storehouse` (
  `storehouseCode` varchar(45) NOT NULL,
  `storehouseName` varchar(45) default NULL,
  `storehouseAddress` varchar(45) default NULL,
  `storehouseDefaultCargo` varchar(45) default NULL,
  `employeeCode` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`storehouseCode`),
  KEY `fk_Storehouse_Employee1` (`employeeCode`),
  CONSTRAINT `fk_Storehouse_Employee1` FOREIGN KEY (`employeeCode`) REFERENCES `employee` (`employeeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storehouse
-- ----------------------------
INSERT INTO `storehouse` VALUES ('ST20091011081424182', '粮食仓库', '山西', null, 'E20091010172633100', '1', null);
INSERT INTO `storehouse` VALUES ('ST20091011081527194', '钢铁原料仓库', '内蒙', null, 'E20091010172633100', '2', null);
INSERT INTO `storehouse` VALUES ('ST20091011081732188', '钢铁成品仓库', '内蒙', null, 'E20091011081342198', '2', null);
INSERT INTO `storehouse` VALUES ('ST20091011081849115', '粮食第二仓库', '河北', null, 'E20091010172633100', '2', null);

-- ----------------------------
-- Table structure for struct
-- ----------------------------
DROP TABLE IF EXISTS `struct`;
CREATE TABLE `struct` (
  `structCode` varchar(45) NOT NULL,
  `structName` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`structCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of struct
-- ----------------------------
INSERT INTO `struct` VALUES ('S20091010153417119', '公司总部', '1', null);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `supplierCode` varchar(100) NOT NULL,
  `supplierName` varchar(45) default NULL,
  `supplierAddress` varchar(45) default NULL,
  `supplierPhone` varchar(45) default NULL,
  `supplierFax` varchar(45) default NULL,
  `supplierZipCode` varchar(45) default NULL,
  `supplierTaxFileNumber` varchar(45) default NULL,
  `supplierRemark` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`supplierCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('S20091010154237182', '山东日照钢铁公司', '山东日照', '033-88737661', '033-87662343', '00031103', '', '无缝钢管', '1', '日照负责人');
INSERT INTO `supplier` VALUES ('S20091010155714156', '河北邯郸钢铁公司', '河北邯郸', '031-87643223', '031-88634432', '044221', '', '冷轧、薄板', '1', '邯郸负责人');
INSERT INTO `supplier` VALUES ('S20091010155815130', '黑龙江农垦', '黑龙江丹东', '0543-1288633111', '0543-322112344', '11344431', '', '大米，小麦、黄豆等', '1', '东北负责人');
INSERT INTO `supplier` VALUES ('S20091010155906157', '山西粮食有限公司', '山西太原', '053-12134444', '053-4332213', '0442213', '', '粮食生产加工', '1', '山西负责人');
INSERT INTO `supplier` VALUES ('S20091010160015177', '湖北十堰汽配', '湖北十堰', '08732-4343213', '08732-3243552', '0873761', '', '汽车配件', '1', '湖北负责人');

-- ----------------------------
-- Table structure for transferorder
-- ----------------------------
DROP TABLE IF EXISTS `transferorder`;
CREATE TABLE `transferorder` (
  `transferOrderCode` varchar(45) NOT NULL,
  `transferOrderTime` datetime default NULL,
  `transferOrderType` int(11) default NULL,
  `transferOrderCredence` varchar(45) default NULL,
  `transferOrderChecker` varchar(45) default NULL,
  `transferOrderPerson` varchar(45) default NULL,
  `storehouseCode` varchar(45) default NULL,
  `transferState` int(11) default NULL,
  PRIMARY KEY  (`transferOrderCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transferorder
-- ----------------------------
INSERT INTO `transferorder` VALUES ('TM20091011180234185', '2009-10-11 18:02:34', '4', '', '', null, 'ST20091011081424182', '1');
INSERT INTO `transferorder` VALUES ('TM20091011180327160', '2009-10-11 18:03:27', '1', '', '', null, 'ST20091011081424182', '1');
INSERT INTO `transferorder` VALUES ('TM20091012090822154', '2009-10-12 09:08:22', '1', '', '', null, 'ST20091011081424182', '2');
INSERT INTO `transferorder` VALUES ('TM20091102165513109', '2009-11-02 16:55:13', '1', '', '', null, 'ST20091011081424182', '2');
INSERT INTO `transferorder` VALUES ('TM20091102171958178', '2009-11-02 17:19:58', '1', '', '', 'transferOrder.transferOrderPerson', 'ST20091011081424182', '2');
INSERT INTO `transferorder` VALUES ('TM20091102172210135', '2009-11-02 17:22:10', '1', '', '', 'P20091010172633124', 'ST20091011081424182', '2');

-- ----------------------------
-- Table structure for transferorderhasmateriel
-- ----------------------------
DROP TABLE IF EXISTS `transferorderhasmateriel`;
CREATE TABLE `transferorderhasmateriel` (
  `transferOrderCode` varchar(45) NOT NULL,
  `newcargoSpaceCode` varchar(45) NOT NULL,
  `cargoSpaceCode` varchar(45) NOT NULL,
  `materielCode` varchar(45) NOT NULL,
  `moveAmount` decimal(10,0) default NULL,
  PRIMARY KEY  (`transferOrderCode`,`newcargoSpaceCode`,`cargoSpaceCode`,`materielCode`),
  KEY `FK_Reference_51` (`cargoSpaceCode`,`materielCode`),
  KEY `FK_Reference_52` (`newcargoSpaceCode`),
  CONSTRAINT `FK_Reference_49` FOREIGN KEY (`transferOrderCode`) REFERENCES `transferorder` (`transferOrderCode`),
  CONSTRAINT `FK_Reference_51` FOREIGN KEY (`cargoSpaceCode`, `materielCode`) REFERENCES `stock` (`cargoSpaceCode`, `materielCode`),
  CONSTRAINT `FK_Reference_52` FOREIGN KEY (`newcargoSpaceCode`) REFERENCES `cargospace` (`cargoSpaceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transferorderhasmateriel
-- ----------------------------
INSERT INTO `transferorderhasmateriel` VALUES ('TM20091011180234185', 'C20091011082858180', 'C20091011082127174', 'M20091011083026106', '100');
INSERT INTO `transferorderhasmateriel` VALUES ('TM20091011180327160', 'C20091011082858180', 'C20091011082127174', 'M20091011083026106', '10');
INSERT INTO `transferorderhasmateriel` VALUES ('TM20091012090822154', 'C20091011082812192', 'C20091011082613185', 'M20091011083057172', '3');
INSERT INTO `transferorderhasmateriel` VALUES ('TM20091012090822154', 'C20091011082858180', 'C20091011082127174', 'M20091011083026106', '3');
INSERT INTO `transferorderhasmateriel` VALUES ('TM20091102165513109', 'C20091011082613185', 'C20091011082127174', 'M20091011083026106', '170');
INSERT INTO `transferorderhasmateriel` VALUES ('TM20091102171958178', 'C20091011082613185', 'C20091011082127174', 'M20091011083026106', '170');
INSERT INTO `transferorderhasmateriel` VALUES ('TM20091102172210135', 'C20091011082613185', 'C20091011082127174', 'M20091011083026106', '170');

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `unitCode` varchar(45) NOT NULL,
  `unitName` varchar(45) default NULL,
  `isEnabled` int(11) default NULL,
  `unitTypeCode` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`unitCode`),
  KEY `fk_Unit_UnitType` (`unitTypeCode`),
  CONSTRAINT `fk_Unit_UnitType` FOREIGN KEY (`unitTypeCode`) REFERENCES `unittype` (`unitTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unit
-- ----------------------------

-- ----------------------------
-- Table structure for unittype
-- ----------------------------
DROP TABLE IF EXISTS `unittype`;
CREATE TABLE `unittype` (
  `unitTypeCode` int(11) NOT NULL,
  `unitTypeName` varchar(45) default NULL,
  `unitTypeRemark` varchar(200) default NULL,
  `isEnabled` int(11) default NULL,
  `jsonField` varchar(3000) default NULL,
  PRIMARY KEY  (`unitTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unittype
-- ----------------------------

-- ----------------------------
-- Table structure for wasmateriel
-- ----------------------------
DROP TABLE IF EXISTS `wasmateriel`;
CREATE TABLE `wasmateriel` (
  `materielCode` varchar(45) NOT NULL,
  `wasCode` varchar(45) NOT NULL,
  `wasNumber` int(11) default NULL,
  `wasMoney` decimal(10,0) default NULL,
  `wasCause` varchar(500) default NULL,
  `cargoSpaceCode` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`materielCode`,`wasCode`,`cargoSpaceCode`),
  KEY `FK_Reference_38` (`wasCode`),
  KEY `cargoSpaceCode` (`cargoSpaceCode`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`wasCode`) REFERENCES `wastage` (`wasCode`),
  CONSTRAINT `FK_Reference_44` FOREIGN KEY (`materielCode`) REFERENCES `materiel` (`materielCode`),
  CONSTRAINT `wasmateriel_ibfk_1` FOREIGN KEY (`cargoSpaceCode`) REFERENCES `cargospace` (`cargoSpaceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wasmateriel
-- ----------------------------
INSERT INTO `wasmateriel` VALUES ('M20091011083026106', 'W20091011153832102', '10', '3', '', 'C20091011082127174');
INSERT INTO `wasmateriel` VALUES ('M20091011083026106', 'W20091011153917189', '20', '3', '', 'C20091011082127174');
INSERT INTO `wasmateriel` VALUES ('M20091011083026106', 'W20091102104831170', '0', '3', '', 'C20091011082127174');
INSERT INTO `wasmateriel` VALUES ('M20091011083057172', 'W20091011153832102', '10', '1', '  ', 'C20091011082613185');
INSERT INTO `wasmateriel` VALUES ('M20091011083057172', 'W20091011153917189', '20', '1', ' ', 'C20091011082613185');
INSERT INTO `wasmateriel` VALUES ('M20091011083057172', 'W20091102104831170', '0', '1', ' ', 'C20091011082613185');

-- ----------------------------
-- Table structure for wastage
-- ----------------------------
DROP TABLE IF EXISTS `wastage`;
CREATE TABLE `wastage` (
  `wasCode` varchar(45) NOT NULL,
  `cargoSpaceCode` varchar(45) default NULL,
  `wasType` int(11) default NULL,
  `wasTime` datetime default NULL,
  `optionor` varchar(45) default NULL,
  `wasState` int(11) default NULL,
  `wasDoc` varchar(45) default NULL,
  PRIMARY KEY  (`wasCode`),
  KEY `FK_Reference_39` (`cargoSpaceCode`),
  CONSTRAINT `FK_Reference_39` FOREIGN KEY (`cargoSpaceCode`) REFERENCES `cargospace` (`cargoSpaceCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wastage
-- ----------------------------
INSERT INTO `wastage` VALUES ('W20091011153832102', null, '1', '2009-10-11 15:53:57', 'P20091010172633124', '2', 'ST20091011081424182');
INSERT INTO `wastage` VALUES ('W20091011153917189', null, '3', '2009-10-11 15:39:31', 'P20091010172633124', '1', 'ST20091011081424182');
INSERT INTO `wastage` VALUES ('W20091102104831170', null, '1', '2009-11-02 10:48:58', 'P20091010172633124', '2', 'ST20091011081424182');
INSERT INTO `wastage` VALUES ('W20091102105227104', null, '1', '2009-11-02 10:52:29', 'P20091010172633124', '1', '');
