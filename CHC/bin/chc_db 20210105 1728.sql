-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.50


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema chc_db
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ chc_db;
USE chc_db;

--
-- Table structure for table `chc_db`.`ac_resource`
--

DROP TABLE IF EXISTS `ac_resource`;
CREATE TABLE `ac_resource` (
  `resource_id` varchar(50) NOT NULL DEFAULT '',
  `resource_des` varchar(200) DEFAULT NULL,
  `SrlNo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`ac_resource`
--

/*!40000 ALTER TABLE `ac_resource` DISABLE KEYS */;
INSERT INTO `ac_resource` (`resource_id`,`resource_des`,`SrlNo`) VALUES 
 ('aboutToolStripMenuItem','About',23),
 ('batchSummeryToolStripMenuItem','Batch Summary',21),
 ('batchToolStripMenuItem','New Batch Create',3),
 ('boxSummaryToolStripMenuItem','UAT Report',20),
 ('changePasswordToolStripMenuItem','Change Password',17),
 ('configurationToolStripMenuItem','Configuration',16),
 ('expertQualityControlCentreToolStripMenuItem','Expert QC',11),
 ('exportToolStripMenuItem','Export',12),
 ('imageQCToolStripMenuItem','Image QC',9),
 ('indexingToolStripMenuItem','Indexing',10),
 ('itemsToolStripMenuItem','New Item Create',1),
 ('lICToolStripMenuItem','LIC Audit',14),
 ('mnuJobCreation','Job Creation',7),
 ('newUserToolStripMenuItem','Create New User',18),
 ('projectToolStripMenuItem','New Project Create',2),
 ('projectToolStripMenuItem1','Inventory In',6),
 ('reexportToolStripMenuItem','Re Export',22),
 ('reportsToolStripMenuItem','Reports',19),
 ('toolsToolStripMenuItem','Tools',15),
 ('toolStripMenuItem1','Batch Scanning',8),
 ('toolStripMenuItem2','LIC',13);
INSERT INTO `ac_resource` (`resource_id`,`resource_des`,`SrlNo`) VALUES 
 ('transactinToolStripMenuItem','Transaction',4),
 ('uploadCSVToolStripMenuItem','Upload CSV',5),
 ('userManualToolStripMenuItem','User Manual',24);
/*!40000 ALTER TABLE `ac_resource` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`ac_role`
--

DROP TABLE IF EXISTS `ac_role`;
CREATE TABLE `ac_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`ac_role`
--

/*!40000 ALTER TABLE `ac_role` DISABLE KEYS */;
INSERT INTO `ac_role` (`role_id`,`role_description`) VALUES 
 (1,'Scan'),
 (2,'Admin'),
 (3,'QC'),
 (4,'Supervisor'),
 (5,'Indexing'),
 (6,'InventoryIn'),
 (7,'DP'),
 (8,'Audit');
/*!40000 ALTER TABLE `ac_role` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`ac_role_resource_map`
--

DROP TABLE IF EXISTS `ac_role_resource_map`;
CREATE TABLE `ac_role_resource_map` (
  `sr_no` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `resource_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sr_no`),
  KEY `ac_role_resource_map_ibfk_2` (`resource_id`),
  KEY `ac_role_resource_map_ibfk_1` (`role_id`),
  CONSTRAINT `ac_role_resource_map_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `ac_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`ac_role_resource_map`
--

/*!40000 ALTER TABLE `ac_role_resource_map` DISABLE KEYS */;
INSERT INTO `ac_role_resource_map` (`sr_no`,`role_id`,`resource_id`) VALUES 
 (12,1,'transactinToolStripMenuItem'),
 (13,1,'toolStripMenuItem1'),
 (14,1,'toolStripButton1'),
 (15,3,'transactinToolStripMenuItem'),
 (16,3,'imageQCToolStripMenuItem'),
 (17,3,'toolStripButton3'),
 (21,5,'transactinToolStripMenuItem'),
 (22,5,'indexingToolStripMenuItem'),
 (23,5,'toolStripButton2'),
 (24,4,'transactinToolStripMenuItem'),
 (25,4,'projectToolStripMenuItem1'),
 (26,4,'toolStripMenuItem1'),
 (27,4,'mnuJobCreation'),
 (28,4,'imageQCToolStripMenuItem'),
 (29,4,'indexingToolStripMenuItem'),
 (30,4,'expertQualityControlCentreToolStripMenuItem'),
 (31,4,'exportToolStripMenuItem'),
 (32,4,'lICToolStripMenuItem'),
 (33,4,'toolStripMenuItem2'),
 (34,4,'reportsToolStripMenuItem'),
 (35,4,'reexportToolStripMenuItem'),
 (36,4,'batchSummeryToolStripMenuItem'),
 (37,6,'transactinToolStripMenuItem'),
 (38,6,'projectToolStripMenuItem1'),
 (39,7,'transactinToolStripMenuItem'),
 (40,7,'mnuJobCreation'),
 (41,4,'toolStripButton1'),
 (42,4,'toolStripButton2');
INSERT INTO `ac_role_resource_map` (`sr_no`,`role_id`,`resource_id`) VALUES 
 (43,4,'toolStripButton3'),
 (44,4,'boxSummaryToolStripMenuItem'),
 (45,4,'aboutToolStripMenuItem'),
 (46,4,'userManualToolStripMenuItem'),
 (47,1,'toolsToolStripMenuItem'),
 (48,1,'aboutToolStripMenuItem'),
 (49,1,'userManualToolStripMenuItem'),
 (50,3,'changePasswordToolStripMenuItem'),
 (51,3,'toolsToolStripMenuItem'),
 (52,3,'aboutToolStripMenuItem'),
 (53,3,'userManualToolStripMenuItem'),
 (54,5,'toolsToolStripMenuItem'),
 (55,5,'changePasswordToolStripMenuItem'),
 (56,5,'helpToolStripMenuItem'),
 (57,5,'aboutToolStripMenuItem'),
 (58,5,'userManualToolStripMenuItem'),
 (59,4,'helpToolStripMenuItem'),
 (60,1,'helpToolStripMenuItem'),
 (61,1,'changePasswordToolStripMenuItem'),
 (62,3,'helpToolStripMenuItem'),
 (63,8,'toolStripMenuItem2'),
 (64,8,'lICToolStripMenuItem'),
 (65,8,'helpToolStripMenuItem'),
 (66,8,'aboutToolStripMenuItem'),
 (67,8,'userManualToolStripMenuItem');
/*!40000 ALTER TABLE `ac_role_resource_map` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`ac_user`
--

DROP TABLE IF EXISTS `ac_user`;
CREATE TABLE `ac_user` (
  `user_id` varchar(30) NOT NULL DEFAULT '',
  `user_name` varchar(100) DEFAULT NULL,
  `user_pwd` varchar(50) NOT NULL DEFAULT '',
  `logged` int(1) NOT NULL DEFAULT '0',
  `logged_dttm` datetime DEFAULT NULL,
  `last_activity` varchar(40) DEFAULT NULL,
  `current_activity` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`ac_user`
--

/*!40000 ALTER TABLE `ac_user` DISABLE KEYS */;
INSERT INTO `ac_user` (`user_id`,`user_name`,`user_pwd`,`logged`,`logged_dttm`,`last_activity`,`current_activity`) VALUES 
 ('anita','Anita Sur','ani123',0,NULL,'',''),
 ('hasan','hasan gazi','has123',0,NULL,'',''),
 ('priya','priya golder','pri123',0,NULL,'',''),
 ('santu','Santu Roy','san123',0,NULL,'',''),
 ('sayan','sayan swarnakar','say123',0,NULL,'',''),
 ('sriparna','Sriparna Saha','sri123',0,NULL,'',''),
 ('surajit','Surajit Palit','sur123',0,NULL,'',''),
 ('tina','tina roy','tin123',0,NULL,'',''),
 ('u1','u1','ntpl123',0,NULL,NULL,NULL),
 ('u6','tanmoy','zzzzzz',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ac_user` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`ac_user_role_map`
--

DROP TABLE IF EXISTS `ac_user_role_map`;
CREATE TABLE `ac_user_role_map` (
  `sr_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sr_no`),
  KEY `FK_ac_user_role_map` (`user_id`),
  KEY `ac_user_role_map_ibfk_2` (`role_id`),
  CONSTRAINT `ac_user_role_map_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `ac_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`ac_user_role_map`
--

/*!40000 ALTER TABLE `ac_user_role_map` DISABLE KEYS */;
INSERT INTO `ac_user_role_map` (`sr_no`,`user_id`,`role_id`) VALUES 
 (35,'u1',2),
 (36,'u2',1),
 (37,'u3',3),
 (38,'u4',4),
 (39,'u5',5),
 (40,'u6',8),
 (41,'sdas',2),
 (42,'dass',4),
 (43,'usc',1),
 (44,'uinv',6),
 (45,'udp',1),
 (46,'uqc',3),
 (47,'uidx',5),
 (48,'ulic',8),
 (49,'ldas',1),
 (50,'pnath',3),
 (51,'rbiswas',5),
 (52,'msinha',3),
 (53,'udeb',5),
 (54,'niladri',3),
 (55,'sandipk',3),
 (56,'malakarm',1),
 (57,'ulodh',3),
 (58,'subrata',4),
 (59,'jdas',5),
 (60,'pratima',4),
 (61,'schakraborty',8),
 (62,'rbiswasqc',3),
 (63,'jdasqc',3),
 (64,'udebqc',3),
 (65,'rbqc',3),
 (66,'malakar',3),
 (67,'hirokhkd',2),
 (68,'bdebroy',8),
 (69,'gdas',8),
 (70,'manmohan',8),
 (71,'sujit',3),
 (72,'dasj',4),
 (73,'mmalakar',3),
 (74,'piya',5),
 (75,'prakash',3),
 (76,'udedfqc',4),
 (77,'rbiswasfqc',4),
 (78,'piyafqc',4),
 (79,'tp',2),
 (80,'kshamke',8),
 (81,'sujit1',1),
 (82,'mdc',3),
 (83,'jsb',3),
 (84,'mm',3),
 (85,'ad',3),
 (86,'kc',3),
 (87,'bs',3),
 (88,'kn',3),
 (89,'kclicin',5),
 (90,'ns',3);
INSERT INTO `ac_user_role_map` (`sr_no`,`user_id`,`role_id`) VALUES 
 (91,'knath',3),
 (92,'sizu',2),
 (93,'amit',5),
 (94,'gayatri',3),
 (95,'biswami',3),
 (96,'shelly',3),
 (97,'monirul',3),
 (98,'ujjwal',5),
 (99,'uttam',3),
 (100,'rahul',3),
 (101,'sandip',3),
 (102,'kurmi',5),
 (103,'abhishek',3),
 (104,'pritam',3),
 (105,'mdcindex',5),
 (106,'nil',1),
 (107,'jddas',4),
 (108,'lic',8),
 (109,'sanjoy',3),
 (110,'ranjan',3),
 (111,'vikki',3),
 (112,'test',3),
 (113,'paltu',1),
 (114,'sanjoyb',8),
 (115,'paltuqc',3),
 (116,'skbose',8),
 (117,'vikkis',4),
 (118,'mousumid',3),
 (119,'paltuf',4),
 (120,'amitavad',8),
 (121,'shazia',2),
 (122,'nepal',1),
 (123,'scan',1),
 (124,'shazia1',2),
 (125,'balaram',1),
 (126,'anup',1),
 (127,'sazia',4),
 (128,'surojit',4),
 (129,'raju',1),
 (130,'mintu',1),
 (131,'singh',1),
 (132,'kumar',1),
 (133,'chandan',1),
 (134,'rajan',4),
 (135,'dipak',1),
 (136,'jugal',1),
 (137,'rajusardar',1),
 (138,'ajoy',4),
 (139,'ajoy1',2),
 (140,'dipanwita',4),
 (141,'raju1',4),
 (142,'rajkumar',3);
INSERT INTO `ac_user_role_map` (`sr_no`,`user_id`,`role_id`) VALUES 
 (143,'moujit1',4),
 (144,'sukla',4),
 (145,'anita',1),
 (146,'sirparna',1),
 (147,'priya',1),
 (148,'sriparna',1),
 (149,'sayan',1),
 (150,'tina',1),
 (151,'hasan',1),
 (152,'surajit',1),
 (153,'santu',4);
/*!40000 ALTER TABLE `ac_user_role_map` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`bundle_master`
--

DROP TABLE IF EXISTS `bundle_master`;
CREATE TABLE `bundle_master` (
  `proj_code` int(11) NOT NULL,
  `bundle_key` int(25) NOT NULL AUTO_INCREMENT,
  `bundle_code` varchar(50) NOT NULL,
  `bundle_name` varchar(50) DEFAULT NULL,
  `establishment` varchar(50) NOT NULL,
  `bundle_no` varchar(25) NOT NULL,
  `creation_date` date NOT NULL,
  `handover_date` date NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_dttm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dttm` datetime DEFAULT '0000-00-00 00:00:00',
  `bundle_path` varchar(250) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bundle_key`,`bundle_no`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`bundle_master`
--

/*!40000 ALTER TABLE `bundle_master` DISABLE KEYS */;
INSERT INTO `bundle_master` (`proj_code`,`bundle_key`,`bundle_code`,`bundle_name`,`establishment`,`bundle_no`,`creation_date`,`handover_date`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`bundle_path`,`status`) VALUES 
 (1,1,'HN000001_A1175','HN000001_A1175','Appellate','A1175','2021-01-04','2021-01-05','u1','2021-01-04 13:17:12',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000001_A1175',1),
 (1,2,'HN000002_A1171','HN000002_A1171','Appellate','A1171','2021-01-04','2021-01-05','u1','2021-01-04 13:21:48',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000002_A1171',1),
 (1,3,'HN000003_A1172','HN000003_A1172','Appellate','A1172','2021-01-04','2021-01-05','u1','2021-01-04 13:22:10',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000003_A1172',1),
 (1,4,'HN000004_A1176','HN000004_A1176','Appellate','A1176','2021-01-04','2021-01-05','u1','2021-01-04 13:38:38',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000004_A1176',1),
 (1,5,'HN000005_A1138','HN000005_A1138','Appellate','A1138','2021-01-04','2021-01-05','u1','2021-01-04 13:44:56',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000005_A1138',8);
INSERT INTO `bundle_master` (`proj_code`,`bundle_key`,`bundle_code`,`bundle_name`,`establishment`,`bundle_no`,`creation_date`,`handover_date`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`bundle_path`,`status`) VALUES 
 (1,6,'HN000006_A1174','HN000006_A1174','Appellate','A1174','2021-01-04','2021-01-05','u1','2021-01-04 13:50:16',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000006_A1174',1),
 (1,7,'HN000007_A1105B','HN000007_A1105B','Appellate','A1105B','2021-01-04','2021-01-05','u1','2021-01-04 14:56:25',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000007_A1105B',1),
 (1,8,'HN000008_A1182','HN000008_A1182','Appellate','A1182','2021-01-04','2021-01-05','u1','2021-01-04 15:19:08',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000008_A1182',1),
 (1,9,'HN000009_A1169','HN000009_A1169','Appellate','A1169','2021-01-04','2021-01-05','u1','2021-01-04 15:28:21',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000009_A1169',1),
 (1,10,'HN000010_A1168B','HN000010_A1168B','Appellate','A1168B','2021-01-04','2021-01-05','u1','2021-01-04 16:30:50',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000010_A1168B',1);
INSERT INTO `bundle_master` (`proj_code`,`bundle_key`,`bundle_code`,`bundle_name`,`establishment`,`bundle_no`,`creation_date`,`handover_date`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`bundle_path`,`status`) VALUES 
 (1,11,'HN000011_A1179','HN000011_A1179','Appellate','A1179','2021-01-04','2021-01-05','u1','2021-01-04 16:39:54',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000011_A1179',1),
 (1,12,'HN000012_A1131','HN000012_A1131','Appellate','A1131','2021-01-04','2021-01-05','u1','2021-01-04 16:51:51',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000012_A1131',1),
 (1,13,'HN000013_A1157','HN000013_A1157','Appellate','A1157','2021-01-04','2021-01-05','u1','2021-01-04 16:53:49',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000013_A1157',1),
 (1,14,'HN000014_B1177','HN000014_B1177','Appellate','B1177','2021-01-05','2021-01-06','u1','2021-01-05 10:35:45',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000014_B1177',1),
 (1,15,'HN000015_A1123','HN000015_A1123','Appellate','A1123','2021-01-05','2021-01-06','u1','2021-01-05 11:04:44',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000015_A1123',1);
INSERT INTO `bundle_master` (`proj_code`,`bundle_key`,`bundle_code`,`bundle_name`,`establishment`,`bundle_no`,`creation_date`,`handover_date`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`bundle_path`,`status`) VALUES 
 (1,16,'HN000016_A1166','HN000016_A1166','Appellate','A1166','2021-01-05','2021-01-06','u1','2021-01-05 11:16:06',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000016_A1166',1),
 (1,17,'HN000017_A1136','HN000017_A1136','Appellate','A1136','2021-01-05','2021-01-06','u1','2021-01-05 11:25:50',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000017_A1136',1),
 (1,18,'HN000018_A1152C','HN000018_A1152C','Appellate','A1152C','2021-01-05','2021-01-06','u1','2021-01-05 11:50:38',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000018_A1152C',1),
 (1,19,'HN000019_A1113','HN000019_A1113','Appellate','A1113','2021-01-05','2021-01-06','u1','2021-01-05 11:57:50',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000019_A1113',1),
 (1,20,'HN000020_A1105A','HN000020_A1105A','Appellate','A1105A','2021-01-05','2021-01-06','u1','2021-01-05 12:08:59',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000020_A1105A',1);
INSERT INTO `bundle_master` (`proj_code`,`bundle_key`,`bundle_code`,`bundle_name`,`establishment`,`bundle_no`,`creation_date`,`handover_date`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`bundle_path`,`status`) VALUES 
 (1,21,'HN000021_A1185','HN000021_A1185','Appellate','A1185','2021-01-05','2021-01-06','u1','2021-01-05 12:44:49',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000021_A1185',1),
 (1,22,'HN000022_A1124','HN000022_A1124','Appellate','A1124','2021-01-05','2021-01-06','u1','2021-01-05 13:16:05',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000022_A1124',1),
 (1,23,'HN000023_A1165','HN000023_A1165','Appellate','A1165','2021-01-05','2021-01-06','u1','2021-01-05 13:24:47',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000023_A1165',1),
 (1,24,'HN000024_A1191','HN000024_A1191','Appellate','A1191','2021-01-05','2021-01-06','u1','2021-01-05 13:35:22',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000024_A1191',1),
 (1,25,'HN000025_A1162','HN000025_A1162','Appellate','A1162','2021-01-05','2021-01-06','u1','2021-01-05 14:02:29',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000025_A1162',1);
INSERT INTO `bundle_master` (`proj_code`,`bundle_key`,`bundle_code`,`bundle_name`,`establishment`,`bundle_no`,`creation_date`,`handover_date`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`bundle_path`,`status`) VALUES 
 (1,26,'HN000026_A1152C','HN000026_A1152C','Appellate','A1152C','2021-01-05','2021-01-06','Santu Roy','2021-01-05 15:05:08',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000026_A1152C',1),
 (1,27,'HN000027_A1148','HN000027_A1148','Appellate','A1148','2021-01-05','2021-01-06','Santu Roy','2021-01-05 15:16:23',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000027_A1148',1),
 (1,28,'HN000028_A1127','HN000028_A1127','Appellate','A1127','2021-01-05','2021-01-06','Santu Roy','2021-01-05 15:39:35',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000028_A1127',0),
 (1,29,'HN000029_A1109','HN000029_A1109','Appellate','A1109','2021-01-05','2021-01-06','Santu Roy','2021-01-05 15:51:03',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000029_A1109',1),
 (1,30,'HN000030_A1184','HN000030_A1184','Appellate','A1184','2021-01-05','2021-01-06','Santu Roy','2021-01-05 16:02:04',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000030_A1184',0);
INSERT INTO `bundle_master` (`proj_code`,`bundle_key`,`bundle_code`,`bundle_name`,`establishment`,`bundle_no`,`creation_date`,`handover_date`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`bundle_path`,`status`) VALUES 
 (1,31,'HN000031_A1120','HN000031_A1120','Appellate','A1120','2021-01-05','2021-01-06','u1','2021-01-05 16:06:06',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000031_A1120',0),
 (1,32,'HN000032_A1152A','HN000032_A1152A','Appellate','A1152A','2021-01-05','2021-01-06','Santu Roy','2021-01-05 16:26:43',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000032_A1152A',0),
 (1,33,'HN000033_A1116','HN000033_A1116','Appellate','A1116','2021-01-05','2021-01-06','Santu Roy','2021-01-05 16:42:38',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000033_A1116',0),
 (1,34,'HN000034_A1128','HN000034_A1128','Appellate','A1128','2021-01-05','2021-01-06','Santu Roy','2021-01-05 17:01:18',NULL,'0000-00-00 00:00:00','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT\\HN000034_A1128',0);
/*!40000 ALTER TABLE `bundle_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`case_file_master`
--

DROP TABLE IF EXISTS `case_file_master`;
CREATE TABLE `case_file_master` (
  `proj_code` int(20) NOT NULL,
  `bundle_key` int(20) NOT NULL,
  `sl_no` int(100) NOT NULL,
  `item_no` int(30) NOT NULL,
  `case_file_no` varchar(50) NOT NULL,
  `case_status` varchar(30) NOT NULL,
  `case_nature` varchar(30) NOT NULL,
  `case_type` varchar(30) NOT NULL,
  `case_year` varchar(20) NOT NULL,
  `created_dttm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(20) NOT NULL,
  `modified_by` varchar(20) DEFAULT NULL,
  `modified_dttm` datetime DEFAULT '0000-00-00 00:00:00',
  `status` int(2) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `photo` int(2) DEFAULT '0',
  PRIMARY KEY (`sl_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`case_file_master`
--

/*!40000 ALTER TABLE `case_file_master` DISABLE KEYS */;
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,1,1,1,'27975W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,2,2,'27948W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,3,3,'27896W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,4,4,'25664W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,5,5,'9851W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,6,6,'2247W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,7,7,'20485W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,1,8,8,'27790W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,9,9,'26894W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,10,10,'27651W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,11,11,'12173W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,12,12,'25002W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,13,13,'26557W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,14,14,'20806W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,1,15,15,'23226W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,16,16,'2253W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:33:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,17,1,'26650W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:37','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,18,2,'27534W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,19,3,'158','Disposed','WRIT PETITION','WP.CT','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,20,4,'4913W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,21,5,'17532W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,3,22,6,'18653W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,23,7,'20167W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,24,8,'26775W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,25,9,'26171W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,26,10,'21596W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,27,11,'17528W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,28,12,'27846W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,3,29,13,'21554W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,30,14,'19272W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,31,15,'22558W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,32,16,'4961W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,33,17,'20690W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,34,18,'27591W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,3,35,19,'340','Disposed','WRIT PETITION','WPLRT','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,3,36,20,'26261W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:31:38','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,5,37,1,'21754W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:54:56','u1','u1','2021-01-05 15:35:25',5,'Incomplete',0),
 (1,5,38,2,'22102W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:54:56','u1','u1','2021-01-05 16:01:15',8,'Incomplete',0),
 (1,5,39,3,'21699W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:54:56','u1','u1','2021-01-05 16:10:00',8,'Incomplete',0),
 (1,5,40,4,'22116W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:54:56','u1','u1','2021-01-05 16:15:23',8,'Incomplete',0),
 (1,5,41,5,'22119W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:54:56','u1','u1','2021-01-05 16:20:34',8,'Incomplete',0),
 (1,5,42,6,'11738W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:54:56','u1','u1','2021-01-05 16:22:46',8,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,5,43,7,'21447W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:54:56','u1','u1','2021-01-05 16:34:42',8,'Incomplete',0),
 (1,5,44,8,'20334W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:54:56','u1','u1','2021-01-05 16:54:05',8,'Incomplete',0),
 (1,5,45,9,'19907W','Disposed','WRIT PETITION','WP','2012','2021-01-04 13:54:56','u1','u1','2021-01-05 17:24:55',8,'Incomplete',0),
 (1,4,46,1,'19625W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,47,2,'12953W','Disposed','WRIT PETITION','WP','2011','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,48,3,'26343W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,49,4,'324','Disposed','WRIT PETITION','WPLRT','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,4,50,5,'16562W','Disposed','WRIT PETITION','WP','2010','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,51,6,'316W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,52,7,'1768W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,53,8,'13915W','Disposed','WRIT PETITION','WP','2009','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,54,9,'1171W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,55,10,'3021W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,56,11,'2318W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,4,57,12,'2316W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,58,13,'23078W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,59,14,'15273W','Disposed','WRIT PETITION','WP','2011','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,60,15,'21723W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,61,16,'7336W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,62,17,'24830W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,63,18,'17947W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,4,64,19,'1542W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,65,20,'1383W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,66,21,'481W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,67,22,'2135W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,68,23,'18186W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,69,24,'1770W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,70,25,'27606W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,4,71,26,'2105W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,72,27,'636W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,73,28,'27957W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,74,29,'1750W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,75,30,'1941W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,76,31,'26290W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,4,77,32,'3854W','Disposed','WRIT PETITION','WP','2013','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,4,78,33,'25918W','Disposed','WRIT PETITION','WP','2012','2021-01-04 01:52:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,1,79,17,'20060W','Disposed','WRIT PETITION','WP','2012','0000-00-00 00:00:00','U1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,80,1,'2713W','Disposed','WRIT PETITION','WP','2004','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,81,2,'2714W','Disposed','WRIT PETITION','WP','2004','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,82,3,'6474W','Disposed','WRIT PETITION','WP','2004','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,83,4,'11374W','Disposed','WRIT PETITION','WP','2004','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,84,5,'7240W','Disposed','WRIT PETITION','WP','2005','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,7,85,6,'1851W','Disposed','WRIT PETITION','WP','2005','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,86,7,'2683W','Disposed','WRIT PETITION','WP','2005','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,87,8,'10035W','Disposed','WRIT PETITION','WP','2005','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,88,9,'13025W','Disposed','WRIT PETITION','WP','2005','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,89,10,'23787W','Disposed','WRIT PETITION','WP','2005','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,90,11,'17314W','Disposed','WRIT PETITION','WP','2001','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,91,12,'6952W','Disposed','WRIT PETITION','WP','2001','2021-01-04 03:14:22','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,7,92,13,'14008W','Disposed','WRIT PETITION','WP','2003','2021-01-04 03:14:23','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,93,14,'13548W','Disposed','WRIT PETITION','WP','2002','2021-01-04 03:14:23','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,94,15,'16695W','Disposed','WRIT PETITION','WP','2006','2021-01-04 03:14:23','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,95,16,'24331W','Disposed','WRIT PETITION','WP','2005','2021-01-04 03:14:23','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,7,96,17,'15766W','Disposed','WRIT PETITION','WP','2005','2021-01-04 03:14:23','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,97,1,'26298W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:52','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,6,98,2,'21602W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:52','u1',NULL,'0000-00-00 00:00:00',1,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,6,99,3,'8446W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:52','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,6,100,4,'8555W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:52','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,6,101,5,'445','Disposed','WRIT PETITION','WP.ST','2012','2021-01-04 15:18:52','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,6,102,6,'20058W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:52','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,6,103,7,'22998W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:52','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,104,8,'2246W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,105,9,'2237W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,106,10,'24051W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,6,107,11,'26567W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,108,12,'53','Disposed','WRIT PETITION','WP.TT','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,109,13,'22731W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,110,14,'10321W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,111,15,'25595W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,112,16,'411','Disposed','WRIT PETITION','WP.CT','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,113,17,'24569W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,6,114,18,'4561W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,115,19,'26267W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,116,20,'2229W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,6,117,21,'14813W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:18:53','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,118,1,'18158W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,119,2,'18432W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,120,3,'18499W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,8,121,4,'18409W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:42','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,122,5,'18129W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,123,6,'18751W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,124,7,'18258W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,125,8,'18775W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,126,9,'18675W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,127,10,'18895W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,8,128,11,'18288W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,129,12,'18463W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,130,13,'18822W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,131,14,'18206W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,132,15,'18980W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,133,16,'18767W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,134,17,'18686W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,8,135,18,'18185W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,136,19,'18946W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,137,20,'17045W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,8,138,21,'18502W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:24:43','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,139,1,'12234W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:08','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,140,2,'2294W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:08','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,141,3,'26568W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:08','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,9,142,4,'12905W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,143,5,'21200W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,144,6,'25964W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,145,7,'26453W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,146,8,'17592W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,147,9,'26303W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,148,10,'6380W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,9,149,11,'22596W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,150,12,'23338W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,151,13,'22532W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,152,14,'21826W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,153,15,'21390W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,154,16,'286W','Disposed','WRIT PETITION','WP','2013','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,155,17,'133','Disposed','WRIT PETITION','WP.ST','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,9,156,18,'2329W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,157,19,'19553W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,158,20,'21118W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,159,21,'415','Disposed','WRIT PETITION','WP.ST','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,160,22,'21836W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,161,23,'20438W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,9,162,24,'19616W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,9,163,25,'2085W','Disposed','WRIT PETITION','WP','2012','2021-01-04 03:39:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,2,164,1,'26305W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,165,2,'24135W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,166,3,'19061W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,167,4,'25470W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,168,5,'8418W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,169,6,'21601W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,170,7,'17934W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,2,171,8,'21184W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,172,9,'13874W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,173,10,'5984W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,174,11,'13147W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,175,12,'27578W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,176,13,'17076W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,2,177,14,'19884W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,2,178,15,'8971W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,2,179,16,'21920W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,2,180,17,'21207W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,2,181,18,'23737W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,2,182,19,'18652W','Disposed','WRIT PETITION','WP','2012','2021-01-04 15:57:09','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,183,1,'27923W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:49','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,184,2,'18433W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:49','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,185,3,'22505W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:49','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,10,186,4,'22524W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:49','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,187,5,'21312W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:49','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,188,6,'1075W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:49','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,189,7,'440','Disposed','WRIT PETITION','WP.CT','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,190,8,'23120W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,191,9,'25221W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,192,10,'22057W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,10,193,11,'26913W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,194,12,'17072W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,195,13,'7193W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,196,14,'20576W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,197,15,'18789W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,198,16,'17073W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,199,17,'18671W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,10,200,18,'20299W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,201,19,'25126W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,202,20,'20513W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,203,21,'28055W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,10,204,22,'28089W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:45:50','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,205,1,'15438W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:05','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,206,2,'15306W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:05','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,11,207,3,'15747W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:05','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,208,4,'15910W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:05','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,209,5,'15680W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:05','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,210,6,'15126W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:05','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,211,7,'15441W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:05','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,212,8,'15358W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:05','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,213,9,'15131W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:05','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,11,214,10,'15455W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:05','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,215,11,'15677W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,216,12,'15433W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,217,13,'15399W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,218,14,'15914W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,219,15,'15440W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,220,16,'15105W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,11,221,17,'15156W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,222,18,'15818W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,223,19,'15463W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,224,20,'15814W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,225,21,'15868W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,226,22,'15094W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,11,227,23,'15948W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,11,228,24,'18094W','Disposed','WRIT PETITION','WP','2012','2021-01-04 16:57:06','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,229,1,'431','Disposed','WRIT PETITION','WPLRT','2005','2021-01-04 17:06:56','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,230,2,'445W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:56','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,231,3,'495W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:56','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,232,4,'577','Disposed','WRIT PETITION','WP.ST','2005','2021-01-04 17:06:56','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,233,5,'585','Disposed','WRIT PETITION','WPLRT','2005','2021-01-04 17:06:56','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,234,6,'622','Disposed','WRIT PETITION','WP.ST','2005','2021-01-04 17:06:56','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,12,235,7,'637','Disposed','WRIT PETITION','WPLRT','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,236,8,'655','Disposed','WRIT PETITION','WP.ST','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,237,9,'657','Disposed','WRIT PETITION','WPLRT','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,238,10,'3821W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,239,11,'823W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,240,12,'1076W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,241,13,'1279W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,12,242,14,'1364W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,243,15,'1419W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,244,16,'1433W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,245,17,'1637W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,246,18,'679W','Disposed','WRIT PETITION','WPLRT','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,247,19,'3516W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,248,20,'3533W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,12,249,21,'3620W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,250,22,'3667W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,251,23,'3683W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,252,24,'3782W','Disposed','WRIT PETITION','WP','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,12,253,25,'763','Disposed','WRIT PETITION','WPLRT','2005','2021-01-04 17:06:57','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,254,1,'14939W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,255,2,'14255W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,13,256,3,'14530W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,257,4,'14743W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,258,5,'14934W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,259,6,'14664W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,260,7,'22547W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,261,8,'22980W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,262,9,'17851W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,13,263,10,'21576W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,264,11,'22286W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,265,12,'20907W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,266,13,'22499W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,267,14,'15258W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:24','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,268,15,'22913W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,269,16,'21774W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,13,270,17,'7584W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,271,18,'20549W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,272,19,'21666W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,273,20,'20904W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,274,21,'23447W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,275,22,'16721W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,276,23,'20671W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,13,277,24,'20369W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,278,25,'13129W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,279,26,'20228W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,13,280,27,'8970W','Disposed','WRIT PETITION','WP','2012','2021-01-04 19:36:25','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,15,281,1,'17152W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,15,282,2,'17654W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,15,283,3,'18443W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,15,284,4,'17145W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,15,285,5,'17428W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,15,286,6,'18774W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,15,287,7,'18490W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,288,8,'18492W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,289,9,'18439W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,290,10,'18441W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,15,291,11,'17448W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,292,12,'17991W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,293,13,'18345W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,294,14,'17006W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:41','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,295,15,'18577W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,296,16,'18445W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,297,17,'17233W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,298,18,'17639W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:42','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,15,299,19,'17151W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,15,300,20,'18500W','Disposed','WRIT PETITION','WP','2012','2021-01-05 13:50:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,14,301,1,'2386W','Disposed','WRIT PETITION','WP','2013','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,302,2,'4952W','Disposed','WRIT PETITION','WP','2013','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,303,3,'3473W','Disposed','WRIT PETITION','WP','2013','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,304,4,'23956W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,305,5,'2712W','Disposed','WRIT PETITION','WP','2013','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,306,6,'3300W','Disposed','WRIT PETITION','WP','2013','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,14,307,7,'3661W','Disposed','WRIT PETITION','WP','2013','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,308,8,'8043W','Disposed','WRIT PETITION','WPCRC','2005','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,309,9,'3922W','Disposed','WRIT PETITION','WP','2013','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,310,10,'2898W','Disposed','WRIT PETITION','WP','2013','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,311,11,'518W','Disposed','WRIT PETITION','WP','2013','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,312,12,'26072W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,313,13,'25062W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,14,314,14,'5644W','Disposed','WRIT PETITION','WP','2010','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,14,315,15,'21355W','Disposed','WRIT PETITION','WP','2007','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,14,316,16,'25294W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,14,317,17,'24790W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,14,318,18,'2061W','Disposed','WRIT PETITION','WP','2013','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,14,319,19,'2271W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,14,320,20,'27951W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,14,321,21,'23263W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,14,322,22,'16198W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,14,323,23,'17081W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,14,324,24,'21796W','Disposed','WRIT PETITION','WP','2012','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,14,325,25,'20348W','Disposed','WRIT PETITION','WP','2003','2021-01-05 11:36:06','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,326,1,'8070W','Disposed','WRIT PETITION','WP','2007','2021-01-05 14:07:23','u1','surajit','2021-01-05 14:03:35',2,'Incomplete',0),
 (1,16,327,2,'8466W','Disposed','WRIT PETITION','WP','2007','2021-01-05 14:07:23','u1','surajit','2021-01-05 14:43:45',2,'Incomplete',0),
 (1,16,328,3,'9419W','Disposed','WRIT PETITION','WP','2007','2021-01-05 14:07:23','u1','surajit','2021-01-05 15:20:04',2,'',0),
 (1,16,329,4,'13572W','Disposed','WRIT PETITION','WP','2007','2021-01-05 14:07:23','u1','surajit','2021-01-05 15:46:50',2,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,16,330,5,'19890W','Disposed','WRIT PETITION','WP','2007','2021-01-05 14:07:23','u1','surajit','2021-01-05 16:20:50',2,'',0),
 (1,16,331,6,'25200W','Disposed','WRIT PETITION','WP','2007','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,332,7,'97W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,333,8,'12098W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,334,9,'11681W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,335,10,'10418W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,336,11,'25148W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,337,12,'11678W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,16,338,13,'6993W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,339,14,'24433W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,340,15,'20788W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,341,16,'20008W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,342,17,'9540W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,16,343,18,'8280W','Disposed','WRIT PETITION','WP','2010','2021-01-05 14:07:23','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,344,1,'10298W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,345,2,'10074W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,18,346,3,'9847W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,347,4,'9848W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,348,5,'9899W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,349,6,'9923W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,350,7,'10466W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,351,8,'10516W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,352,9,'10080W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,353,10,'10127W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,18,354,11,'10228W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,355,12,'10234W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,356,13,'10241W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,357,14,'10002W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,358,15,'10524W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,359,16,'10539W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,360,17,'10594W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,361,18,'10629W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,18,362,19,'10732W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,363,20,'10844W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,364,21,'10338W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,18,365,22,'10456W','Disposed','WRIT PETITION','WP','2005','2021-01-05 14:25:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,366,1,'21038W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,367,2,'21926W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,368,3,'21951W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,369,4,'8529W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,19,370,5,'21044W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,371,6,'21046W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,372,7,'21246W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,373,8,'21275W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,374,9,'21248W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,375,10,'21260W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,376,11,'21781W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,377,12,'21849W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,19,378,13,'21805W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,379,14,'21253W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,380,15,'21243W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,381,16,'21255W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,382,17,'21261W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,383,18,'21269W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,384,19,'21277W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,385,20,'21256W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,19,386,21,'21265W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,387,22,'21252W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,388,23,'21999W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,389,24,'21660W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,390,25,'21684W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,391,26,'21667W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,392,27,'21779W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,393,28,'21045W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,19,394,29,'21254W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,19,395,30,'21249W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:35:44','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,396,1,'20323W','Disposed','WRIT PETITION','WP','2003','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,397,2,'872','Disposed','WRIT PETITION','WP.ST','2003','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,398,3,'12185W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,399,4,'18730W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,400,5,'3716W','Disposed','WRIT PETITION','WP','2005','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,401,6,'21108W','Disposed','WRIT PETITION','WP','2000','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,20,402,7,'20347W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,403,8,'17873W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,404,9,'17876W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,405,10,'11128W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,406,11,'21131W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,407,12,'12656W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,408,13,'9879','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,409,14,'2715W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,20,410,15,'20932W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,411,16,'17872W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,412,17,'2712W','Disposed','WRIT PETITION','WP','2004','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,413,18,'18320W','Disposed','WRIT PETITION','WP','2003','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,414,19,'17288W','Disposed','WRIT PETITION','WP','2003','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,20,415,20,'9088W','Disposed','WRIT PETITION','WP','2003','2021-01-05 15:04:00','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,416,1,'8326W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,17,417,2,'8328W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,17,418,3,'21759W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,17,419,4,'22105W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,17,420,5,'16336W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,17,421,6,'22098W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,17,422,7,'14277W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,17,423,8,'19649W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,17,424,9,'13467W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,17,425,10,'22356W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,17,426,11,'18059W','Disposed','WRIT PETITION','WP','2011','2021-01-05 15:21:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,427,12,'21884W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,428,13,'6866W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,429,14,'8535W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,430,15,'21691W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,431,16,'23143W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,432,17,'17209W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,433,18,'15604W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,17,434,19,'22097W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,435,20,'8405W','Disposed','WRIT PETITION','WP','2011','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,436,21,'21325W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,437,22,'21804W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,438,23,'15313W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,439,24,'12606W','Disposed','WRIT PETITION','WP','2010','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,440,25,'16880W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,441,26,'23108W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,17,442,27,'7483W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,443,28,'22582W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,444,29,'22045W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,445,30,'20490W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,446,31,'17705W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,447,32,'17896W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,448,33,'22122W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,17,449,34,'21645W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:21:43','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,21,450,1,'17776W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,451,2,'17204W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,452,3,'16090W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,453,4,'16088W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,454,5,'16795W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:42','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,455,6,'16932W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,456,7,'16767W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,457,8,'16000W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,21,458,9,'17519W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,459,10,'16616W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,460,11,'16834W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,461,12,'16208W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,462,13,'16693W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,463,14,'16759W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,464,15,'16096W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,465,16,'16175W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,21,466,17,'16664W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,467,18,'16575W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,468,19,'16156W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,469,20,'16364W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,470,21,'17724W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,471,22,'17179W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,472,23,'17232W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,473,24,'17848W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,21,474,25,'17981W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,475,26,'17014W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,476,27,'17457W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,477,28,'17376W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,478,29,'17562W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,479,30,'17429W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,480,31,'17859W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,21,481,32,'17747W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,21,482,33,'17857W','Disposed','WRIT PETITION','WP','2012','2021-01-05 15:43:43','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,483,1,'9555W','Disposed','WRIT PETITION','WP','2010','2021-01-05 16:04:17','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,484,2,'1941W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,485,3,'13041W','Disposed','WRIT PETITION','WP','2010','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,486,4,'3733W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,487,5,'3743W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,488,6,'4401W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,489,7,'5401W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,23,490,8,'5503W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,491,9,'5893W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,492,10,'6754W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,493,11,'6814W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,494,12,'6957W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,495,13,'7287W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,496,14,'7572W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,497,15,'10045W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,23,498,16,'14521W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,23,499,17,'20503W','Disposed','WRIT PETITION','WP','2008','2021-01-05 16:04:18','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,500,1,'13011W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,501,2,'13065W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,502,3,'13067W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,503,4,'13068W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,504,5,'13069W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,505,6,'13145W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,25,506,7,'13170W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,507,8,'13182W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,508,9,'13183W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,509,10,'13268W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,510,11,'13293W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,511,12,'13296W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,512,13,'13298W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,513,14,'13301W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,25,514,15,'13477W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,515,16,'13503W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,516,17,'13519W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,517,18,'13675W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,518,19,'13681W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,519,20,'13686W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,520,21,'22246W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,521,22,'17677W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,25,522,23,'17444W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,523,24,'17402W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,25,524,25,'17580W','Disposed','WRIT PETITION','WP','2012','2021-01-05 16:44:11','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,22,525,1,'10263W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,22,526,2,'10482W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,22,527,3,'10506W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,22,528,4,'10807W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,22,529,5,'11119W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,22,530,6,'9311W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,22,531,7,'9532W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,22,532,8,'23356W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,22,533,9,'2862W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,22,534,10,'8628W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,22,535,11,'15626W','Disposed','WRIT PETITION','WP','2012','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,22,536,12,'15084W','Disposed','WRIT PETITION','WP','2011','2021-01-05 14:25:39','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,537,1,'10298W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,26,538,2,'10074W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,539,3,'9847W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,540,4,'9848W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,541,5,'9899W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,542,6,'9923W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,543,7,'10466W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,544,8,'10516W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,26,545,9,'10080W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,546,10,'10127W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,547,11,'10228W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,548,12,'10234W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,549,13,'10241W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,550,14,'10002W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,551,15,'10524W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,26,552,16,'16539W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,553,17,'10594W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,554,18,'10616W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,555,19,'10629W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,556,20,'10732W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,557,21,'10844W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,26,558,22,'10338W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,26,559,23,'10456W','Disposed','WRIT PETITION','WP','2005','2021-01-05 17:45:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,560,1,'14465W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,561,2,'12179W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,562,3,'1262W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,563,4,'2705W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,564,5,'12451W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,565,6,'2809W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,27,566,7,'3787W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,567,8,'14866W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,568,9,'12522W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,569,10,'9549W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,570,11,'16556W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,571,12,'9092W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,572,13,'15871W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,27,573,14,'21793W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,574,15,'3128W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,575,16,'16463W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,576,17,'391','Disposed','WRIT PETITION','WP.ST','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,577,18,'16325W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:10','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,578,19,'57','Disposed','WRIT PETITION','WP.ST','2004','2021-01-05 18:03:11','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,579,20,'780','Disposed','WRIT PETITION','WP.ST','2004','2021-01-05 18:03:11','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,27,580,21,'18392W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:11','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,581,22,'13485W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:11','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,582,23,'2357W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:11','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,27,583,24,'1708W','Disposed','WRIT PETITION','WP','2004','2021-01-05 18:03:11','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,24,584,1,'6316W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,585,2,'22799W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,586,3,'27782W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,24,587,4,'22674W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:06','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,588,5,'21903W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,589,6,'28062W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,590,7,'7891W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,591,8,'2276W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,592,9,'27828W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,593,10,'1043W','Disposed','WRIT PETITION','WP','2013','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,594,11,'24285W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,24,595,12,'23312W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,596,13,'15480W','Disposed','WRIT PETITION','WP','2011','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,597,14,'13200W','Disposed','WRIT PETITION','WP','2009','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,598,15,'16508W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,599,16,'1227W','Disposed','WRIT PETITION','WP','2011','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,600,17,'27818W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,601,18,'133','Disposed','WRIT PETITION','WPLRT','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,602,19,'26090W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,24,603,20,'11102W','Disposed','WRIT PETITION','WP','2011','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,604,21,'9027W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,605,22,'27013W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,606,23,'27960W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,NULL,0),
 (1,24,607,24,'23640W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:07:07','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,608,1,'6568W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,609,2,'6639W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,610,3,'6716W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,28,611,4,'6723W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,612,5,'6739W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,613,6,'6809W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,614,7,'3896W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,615,8,'3972W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,616,9,'4096W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,617,10,'4180W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,28,618,11,'4273W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,619,12,'4422W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,620,13,'4440W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,621,14,'4459W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,622,15,'4469W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,623,16,'4649W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,624,17,'4657W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,28,625,18,'4669W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,626,19,'4705W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,627,20,'5059W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,628,21,'5384W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,28,629,22,'2518W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,28,630,23,'2727W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:38','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,28,631,24,'2745W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:39','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,28,632,25,'3044W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:39','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,28,633,26,'820W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:39','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,28,634,27,'3089W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:39','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,28,635,28,'3130W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:39','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,28,636,29,'3152W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:39','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,28,637,30,'3458W','Disposed','WRIT PETITION','WP','2005','2021-01-05 18:21:39','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,29,638,1,'20831W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,29,639,2,'20786W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,640,3,'20260W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,641,4,'20828W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,642,5,'20891W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,643,6,'20428W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,644,7,'20844W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,645,8,'20215W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,29,646,9,'20108W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,647,10,'20723W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,648,11,'20346W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,649,12,'20213W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'Incomplete',0),
 (1,29,650,13,'23136W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,651,14,'23149W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,652,15,'23719W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,29,653,16,'23144W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,654,17,'20722W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,655,18,'20826W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:43','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,656,19,'20832W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,657,20,'23138W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,658,21,'23146W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,659,22,'23151W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,29,660,23,'23443W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,661,24,'23134W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,662,25,'21267W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,663,26,'21274W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,664,27,'21263W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,665,28,'21271W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,666,29,'21093W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,29,667,30,'21840W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,668,31,'21616W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,29,669,32,'21006W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:29:44','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,31,670,1,'10240W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,31,671,2,'3800W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,31,672,3,'9428W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,31,673,4,'11960W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,31,674,5,'11804W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,675,6,'11839W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,676,7,'11928W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,677,8,'11770W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,678,9,'11997W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,679,10,'11934W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,680,11,'6249W','Disposed','WRIT PETITION','WP','1999','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,681,12,'22068W','Disposed','WRIT PETITION','WP','1998','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,31,682,13,'21272W','Disposed','WRIT PETITION','WP','1998','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,683,14,'5427W','Disposed','WRIT PETITION','WP','1997','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,684,15,'1041','Disposed','WRIT PETITION','WPLRT','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,685,16,'2003W','Disposed','WRIT PETITION','WP','2001','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,31,686,17,'11732W','Disposed','WRIT PETITION','WP','2000','2021-01-05 16:15:51','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,687,1,'17459W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:35','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,30,688,2,'17386W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:35','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,30,689,3,'17516W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:35','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,30,690,4,'17475W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:35','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,30,691,5,'17452W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:35','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,30,692,6,'17898W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:35','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,30,693,7,'17320W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,30,694,8,'17368W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,30,695,9,'17660W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,30,696,10,'17775W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,30,697,11,'17503W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,698,12,'17401W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,699,13,'17986W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,700,14,'17841W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,701,15,'17513W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,702,16,'17915W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,30,703,17,'17048W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,704,18,'17865W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,705,19,'17405W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,706,20,'17306W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,707,21,'17321W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,708,22,'17914W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,709,23,'17461W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,30,710,24,'17126W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,711,25,'17946W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,712,26,'17634W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,713,27,'18890W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,714,28,'17392W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,715,29,'17709W','Disposed','WRIT PETITION','WP','2011','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,716,30,'17968W','Disposed','WRIT PETITION','WP','2011','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,30,717,31,'17447W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,718,32,'17496W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,719,33,'17034W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,30,720,34,'17601W','Disposed','WRIT PETITION','WP','2012','2021-01-05 18:51:36','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,721,1,'8084W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,32,722,2,'8142W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,32,723,3,'8172W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,32,724,4,'8194W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,32,725,5,'8197W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,32,726,6,'8202W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,32,727,7,'8211W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,32,728,8,'8219W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,32,729,9,'8227W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,32,730,10,'8235W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,32,731,11,'8243W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,32,732,12,'8302W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,32,733,13,'8328W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,734,14,'8399W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,735,15,'8479W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,736,16,'8497W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,737,17,'8499W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,32,738,18,'8500W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,739,19,'8501W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,740,20,'8509W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,741,21,'8510W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,742,22,'8520W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,743,23,'8521W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:25','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,744,24,'8522W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,32,745,25,'8531W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,746,26,'8569W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,747,27,'8570W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,748,28,'8571W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,749,29,'8611W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,750,30,'8677W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,751,31,'8697W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,32,752,32,'9024W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,753,33,'8994W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,754,34,'8982W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,755,35,'8732','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,756,36,'8758W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,757,37,'8782W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,758,38,'8842W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,32,759,39,'8853W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,760,40,'8905W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,761,41,'8928W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,32,762,42,'8970W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:10:26','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,763,1,'8381W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,764,2,'8388W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,765,3,'8347W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,34,766,4,'8348W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,767,5,'9844W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,768,6,'9969W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,769,7,'9999W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,770,8,'10047W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,771,9,'10200W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,772,10,'10270W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,34,773,11,'10271W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,774,12,'10272W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,775,13,'10273W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,776,14,'10339W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:47','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,777,15,'10344W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,778,16,'8955W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,779,17,'8958W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,34,780,18,'8972W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,781,19,'8976W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,782,20,'9003W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,783,21,'9180W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,784,22,'9212W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,785,23,'9285W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,786,24,'9317W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,34,787,25,'9382W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,788,26,'9502W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,789,27,'9586W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,790,28,'9590W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,791,29,'9619W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,792,30,'9724W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,34,793,31,'9730W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,34,794,32,'9782W','Disposed','WRIT PETITION','WP','2005','2021-01-05 19:43:48','Santu Roy',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,795,1,'17138W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,796,2,'17328W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,797,3,'17919W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,798,4,'17647W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,799,5,'17984W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,800,6,'17430W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,801,7,'17373W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,33,802,8,'18516W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,803,9,'18289W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,804,10,'18064W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,805,11,'17242W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,806,12,'17335W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,33,807,13,'17692W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,808,14,'17800W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,33,809,15,'17326W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',1,'',0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,33,810,16,'17226W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,33,811,17,'17139W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,33,812,18,'18904W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',1,'',0),
 (1,33,813,19,'18128W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,814,20,'18630W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,815,21,'18861W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,816,22,'18298W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,817,23,'18386W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,33,818,24,'18169W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,819,25,'18377W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:20','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,820,26,'18379W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:21','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,821,27,'18261W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:21','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,822,28,'18493W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:21','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,823,29,'17871W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:21','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,824,30,'19755W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:21','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,825,31,'19066W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:21','u1',NULL,'0000-00-00 00:00:00',0,NULL,0);
INSERT INTO `case_file_master` (`proj_code`,`bundle_key`,`sl_no`,`item_no`,`case_file_no`,`case_status`,`case_nature`,`case_type`,`case_year`,`created_dttm`,`created_by`,`modified_by`,`modified_dttm`,`status`,`remarks`,`photo`) VALUES 
 (1,33,826,32,'19704W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:21','u1',NULL,'0000-00-00 00:00:00',0,NULL,0),
 (1,33,827,33,'17404W','Disposed','WRIT PETITION','WP','2012','2021-01-05 19:46:21','u1',NULL,'0000-00-00 00:00:00',0,NULL,0);
/*!40000 ALTER TABLE `case_file_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`case_nature_master`
--

DROP TABLE IF EXISTS `case_nature_master`;
CREATE TABLE `case_nature_master` (
  `case_nature_id` int(20) NOT NULL AUTO_INCREMENT,
  `case_nature` varchar(20) NOT NULL,
  PRIMARY KEY (`case_nature_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`case_nature_master`
--

/*!40000 ALTER TABLE `case_nature_master` DISABLE KEYS */;
INSERT INTO `case_nature_master` (`case_nature_id`,`case_nature`) VALUES 
 (1,'Civil'),
 (2,'Criminal'),
 (3,'WRIT PETITION');
/*!40000 ALTER TABLE `case_nature_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`case_status_master`
--

DROP TABLE IF EXISTS `case_status_master`;
CREATE TABLE `case_status_master` (
  `case_status_id` int(20) NOT NULL AUTO_INCREMENT,
  `case_status` varchar(20) NOT NULL,
  PRIMARY KEY (`case_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`case_status_master`
--

/*!40000 ALTER TABLE `case_status_master` DISABLE KEYS */;
INSERT INTO `case_status_master` (`case_status_id`,`case_status`) VALUES 
 (1,'Pending'),
 (2,'Disposed');
/*!40000 ALTER TABLE `case_status_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`case_type_master`
--

DROP TABLE IF EXISTS `case_type_master`;
CREATE TABLE `case_type_master` (
  `case_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `case_type_code` varchar(20) NOT NULL,
  `case_type` varchar(20) NOT NULL,
  PRIMARY KEY (`case_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`case_type_master`
--

/*!40000 ALTER TABLE `case_type_master` DISABLE KEYS */;
INSERT INTO `case_type_master` (`case_type_id`,`case_type_code`,`case_type`) VALUES 
 (1,'AST','TEMPORARY NUMBER'),
 (2,'CCGAT','CUSTOMS/EXC/GOLD227'),
 (3,'CO','CIVIL ORDER/MISC.CAS'),
 (4,'CO.CT','CO(CENTRAL ADMIN TRI'),
 (5,'CO.ST','CO(STATE ADMIN TRIBN'),
 (6,'CO.TT','CO(W.B. TAX TRIBUNAL'),
 (7,'COLRT','WB LAND RE&TEN.227'),
 (8,'COT','CROSS OBJECTION APPE'),
 (9,'CPAN','CONTEMPT APPLICATION'),
 (10,'CR','CIVIL REVISION'),
 (11,'CRA','CRIMINAL APPEAL'),
 (12,'CRC','CIVIL REVI. CONTEMPT'),
 (13,'CRLCP','CRIMINAL(CONTEMPT)'),
 (14,'CRM','CRIMINAL MISC. CASE('),
 (15,'CRMSPL','CRIMINAL MISC. CASE('),
 (16,'CRR','CRIMINAL REVISION'),
 (17,'DR','DEATH REFERENCE'),
 (18,'DVW','PROTECTION OF WOMEN '),
 (19,'FA','CIVIL FIRST APPEAL'),
 (20,'FAT','TENDER FIRST APPEAL'),
 (21,'FCA','FAMILY COURT APPEAL'),
 (22,'FMA','C. APPEAL FROM ORDER'),
 (23,'FMAT','ADMS. C. APPL ORDER'),
 (24,'GA','GOVT. APPEAL'),
 (25,'IRD','TEMP D'),
 (26,'IRE','TEMP E'),
 (27,'IRH','TEMP H'),
 (28,'LPA','LETTERS PATENT APPEA'),
 (29,'MA','MANDAMUS APPEAL');
INSERT INTO `case_type_master` (`case_type_id`,`case_type_code`,`case_type`) VALUES 
 (30,'MAT','TENDER OF MAND APPL'),
 (31,'RVW','REVIEW'),
 (32,'SA','CIVIL SECOND APPEAL'),
 (33,'SAT','TNDER SECOND APPEAL'),
 (34,'SMA','SECOND MISC APPEAL'),
 (35,'SMAT','SEC.MISC.APPEAL TEND'),
 (36,'SRC','SPECIAL REFERENCE CA'),
 (37,'SRCR','SPECIAL REFERENCE CA'),
 (38,'WCGAT','CUSTOMS/EXC/GOLD226'),
 (39,'WP','WRIT PETITION'),
 (40,'WP.CT','WP(CENTRAL ADMIN TRI'),
 (41,'WP.ST','WP(STATE ADMIN TRIBU'),
 (42,'WP.TT','WP(WB TAX TRIBUNAL)'),
 (43,'WP.WT','WAKF TRIBUNAL (227)'),
 (44,'WPCR','WRIT PETITION(CIVIL '),
 (45,'WPCRC','WP CIVIL RULE CONT.'),
 (46,'WPDRT','DEBT APPL. TRIBUNAL'),
 (47,'WPLRT','WB LAND RE&TEN.226'),
 (48,'CAN','CONNECTED APPLICATIO');
/*!40000 ALTER TABLE `case_type_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`configuration_master`
--

DROP TABLE IF EXISTS `configuration_master`;
CREATE TABLE `configuration_master` (
  `DO_CODE` char(3) NOT NULL DEFAULT '',
  `BO_CODE` varchar(4) NOT NULL DEFAULT '',
  `VENDOR_CODE` char(2) NOT NULL DEFAULT '',
  `VERSION_NUMBER` char(2) NOT NULL DEFAULT '',
  `CREATED_BY` varchar(100) NOT NULL DEFAULT '',
  `created_dttm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` int(1) NOT NULL DEFAULT '0',
  `SCAN_CENTER` varchar(50) NOT NULL DEFAULT '',
  `Vendor_name` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`configuration_master`
--

/*!40000 ALTER TABLE `configuration_master` DISABLE KEYS */;
INSERT INTO `configuration_master` (`DO_CODE`,`BO_CODE`,`VENDOR_CODE`,`VERSION_NUMBER`,`CREATED_BY`,`created_dttm`,`active`,`SCAN_CENTER`,`Vendor_name`) VALUES 
 ('043','43C','NT','01','ADMIN','2008-04-13 00:00:00',1,'JALPAIGURI','Nevaeh Technology');
/*!40000 ALTER TABLE `configuration_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`custom_exception`
--

DROP TABLE IF EXISTS `custom_exception`;
CREATE TABLE `custom_exception` (
  `Proj_key` int(11) NOT NULL DEFAULT '0',
  `batch_key` int(11) NOT NULL DEFAULT '0',
  `box_number` int(11) NOT NULL DEFAULT '0',
  `policy_number` int(11) NOT NULL DEFAULT '0',
  `problem_type` varchar(50) NOT NULL DEFAULT '',
  `Image_name` varchar(50) NOT NULL DEFAULT '0',
  `Remarks` varchar(200) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '0',
  `created_by` varchar(50) NOT NULL DEFAULT '',
  `created_dttm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_dttm` datetime DEFAULT NULL,
  KEY `Proj_key` (`Proj_key`,`batch_key`,`box_number`,`policy_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`custom_exception`
--

/*!40000 ALTER TABLE `custom_exception` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_exception` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`disposal_type_master`
--

DROP TABLE IF EXISTS `disposal_type_master`;
CREATE TABLE `disposal_type_master` (
  `disposal_type_id` int(10) NOT NULL AUTO_INCREMENT,
  `disposal_type_name` varchar(30) NOT NULL,
  PRIMARY KEY (`disposal_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`disposal_type_master`
--

/*!40000 ALTER TABLE `disposal_type_master` DISABLE KEYS */;
INSERT INTO `disposal_type_master` (`disposal_type_id`,`disposal_type_name`) VALUES 
 (1,'Disposal'),
 (2,'Dismissed'),
 (3,'Dismissed for Default'),
 (4,'Transferred');
/*!40000 ALTER TABLE `disposal_type_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `district_code` varchar(2) NOT NULL DEFAULT '',
  `district_name` varchar(30) DEFAULT NULL,
  `zone_code` varchar(1) DEFAULT NULL,
  `Active` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`district_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`district`
--

/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` (`district_code`,`district_name`,`zone_code`,`Active`) VALUES 
 ('00','Others','1','N'),
 ('01','Bankura                       ','2','N'),
 ('02','Burdwan                       ','2','N'),
 ('03','Birbhum                       ','3','N'),
 ('04','Darjeeling                    ','3','N'),
 ('05','Howrah                        ','1','N'),
 ('06','Hooghly                       ','2','N'),
 ('07','Jalpaiguri                    ','3','N'),
 ('08','Coochbehar                    ','3','N'),
 ('09','Malda                         ','3','N'),
 ('10','Paschim Medinipur             ','2','N'),
 ('11','Purba Medinipur               ','2','N'),
 ('12','Murshidabad                   ','3','N'),
 ('13','Nadia                         ','1','N'),
 ('14','Purulia                       ','2','N'),
 ('15','North 24-Parganas             ','1','N'),
 ('16','South 24-Parganas             ','1','N'),
 ('17','Dakshin Dinajpur              ','3','N'),
 ('18','Uttar Dinajpur                ','3','N'),
 ('19','Kolkata                       ','1','N');
INSERT INTO `district` (`district_code`,`district_name`,`zone_code`,`Active`) VALUES 
 ('20','Andaman and Nicobar Islands',NULL,'N'),
 ('99','N/A','1','N');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`doc_type_master`
--

DROP TABLE IF EXISTS `doc_type_master`;
CREATE TABLE `doc_type_master` (
  `doc_type` varchar(50) DEFAULT NULL,
  `srlno` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`doc_type_master`
--

/*!40000 ALTER TABLE `doc_type_master` DISABLE KEYS */;
INSERT INTO `doc_type_master` (`doc_type`,`srlno`) VALUES 
 ('Proposal_form',1),
 ('Proposal_enclosures',2),
 (NULL,16);
/*!40000 ALTER TABLE `doc_type_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`establishment_master`
--

DROP TABLE IF EXISTS `establishment_master`;
CREATE TABLE `establishment_master` (
  `establishment_no` int(50) NOT NULL AUTO_INCREMENT,
  `establishment_name` varchar(50) NOT NULL,
  PRIMARY KEY (`establishment_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`establishment_master`
--

/*!40000 ALTER TABLE `establishment_master` DISABLE KEYS */;
INSERT INTO `establishment_master` (`establishment_no`,`establishment_name`) VALUES 
 (1,'Appellate'),
 (2,'Original');
/*!40000 ALTER TABLE `establishment_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`export_log`
--

DROP TABLE IF EXISTS `export_log`;
CREATE TABLE `export_log` (
  `proj_key` varchar(10) DEFAULT NULL,
  `batch_key` varchar(10) DEFAULT NULL,
  `created_dttm` datetime DEFAULT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `runnum` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`export_log`
--

/*!40000 ALTER TABLE `export_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `export_log` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`image_master`
--

DROP TABLE IF EXISTS `image_master`;
CREATE TABLE `image_master` (
  `proj_key` int(11) NOT NULL DEFAULT '0',
  `batch_key` int(11) NOT NULL DEFAULT '0',
  `box_number` varchar(25) NOT NULL DEFAULT '0',
  `policy_number` varchar(40) NOT NULL DEFAULT '0',
  `serial_no` int(11) DEFAULT NULL,
  `page_index_name` varchar(500) DEFAULT NULL,
  `created_by` varchar(100) NOT NULL DEFAULT '',
  `created_dttm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(100) DEFAULT NULL,
  `modified_dttm` datetime DEFAULT NULL,
  `Page_name` varchar(100) NOT NULL DEFAULT '',
  `status` int(2) NOT NULL DEFAULT '0',
  `Doc_Type` varchar(30) DEFAULT NULL,
  `SCanned_size` double NOT NULL DEFAULT '0',
  `QC_size` double NOT NULL DEFAULT '0',
  `fqc_size` double NOT NULL DEFAULT '0',
  `index_size` double NOT NULL DEFAULT '0',
  `Photo` int(1) NOT NULL DEFAULT '0',
  `Image_seq` int(4) DEFAULT NULL,
  PRIMARY KEY (`proj_key`,`batch_key`,`box_number`,`policy_number`,`Page_name`),
  KEY `indx_policy_number` (`policy_number`),
  KEY `indx_doc_type` (`Doc_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`image_master`
--

/*!40000 ALTER TABLE `image_master` DISABLE KEYS */;
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','11738W',2,'11738W_001_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_001_A.TIF',27,'Main_petition',29,24.630859375,0,0,0,NULL),
 (1,5,'1','11738W',3,'11738W_002_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_002_A.TIF',27,'Main_petition',15,10.44140625,0,0,0,NULL),
 (1,5,'1','11738W',4,'11738W_003_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_003_A.TIF',27,'Main_petition',13,11.4609375,0,0,0,NULL),
 (1,5,'1','11738W',5,'11738W_004_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_004_A.TIF',27,'Main_petition',17,14.232421875,0,0,0,NULL),
 (1,5,'1','11738W',6,'11738W_005_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_005_A.TIF',27,'Main_petition',105,75.73828125,0,0,0,NULL),
 (1,5,'1','11738W',7,'11738W_006_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_006_A.TIF',27,'Main_petition',12,10.087890625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','11738W',8,'11738W_007_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_007_A.TIF',27,'Main_petition',14,11.466796875,0,0,0,NULL),
 (1,5,'1','11738W',9,'11738W_008_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_008_A.TIF',27,'Main_petition',14,12.87890625,0,0,0,NULL),
 (1,5,'1','11738W',10,'11738W_009_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_009_A.TIF',27,'Main_petition',20,18.25,0,0,0,NULL),
 (1,5,'1','11738W',11,'11738W_010_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_010_A.TIF',27,'Main_petition',23,20.232421875,0,0,0,NULL),
 (1,5,'1','11738W',12,'11738W_011_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_011_A.TIF',27,'Main_petition',20,18.11328125,0,0,0,NULL),
 (1,5,'1','11738W',13,'11738W_012_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_012_A.TIF',27,'Main_petition',17,14.28515625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','11738W',14,'11738W_013_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_013_A.TIF',27,'Main_petition',11,9.712890625,0,0,0,NULL),
 (1,5,'1','11738W',15,'11738W_014_A-Main_petition.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_014_A.TIF',27,'Main_petition',26,21.880859375,0,0,0,NULL),
 (1,5,'1','11738W',16,'11738W_015_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_015_A.TIF',27,'Main_petition_annextures',51,34.40234375,0,0,0,NULL),
 (1,5,'1','11738W',17,'11738W_016_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_016_A.TIF',27,'Main_petition_annextures',22,18.263671875,0,0,0,NULL),
 (1,5,'1','11738W',18,'11738W_017_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_017_A.TIF',27,'Main_petition_annextures',48,38.865234375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','11738W',19,'11738W_018_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_018_A.TIF',27,'Main_petition_annextures',78,61.037109375,0,0,0,NULL),
 (1,5,'1','11738W',20,'11738W_019_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_019_A.TIF',27,'Main_petition_annextures',32,28.69921875,0,0,0,NULL),
 (1,5,'1','11738W',21,'11738W_020_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_020_A.TIF',27,'Vakalatname_and_warrent',45,35.6875,0,0,0,NULL),
 (1,5,'1','11738W',22,'11738W_021_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_021_A.TIF',27,'Vakalatname_and_warrent',5,3.880859375,0,0,0,NULL),
 (1,5,'1','11738W',23,'11738W_022_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_022_A.TIF',27,'Vakalatname_and_warrent',28,23.080078125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','11738W',24,'11738W_023_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_023_A.TIF',27,'Vakalatname_and_warrent',15,8.7578125,0,0,0,NULL),
 (1,5,'1','11738W',25,'11738W_024_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_024_A.TIF',27,'Affidavits_with_annextures',23,18.744140625,0,0,0,NULL),
 (1,5,'1','11738W',26,'11738W_025_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_025_A.TIF',27,'Affidavits_with_annextures',13,11.59375,0,0,0,NULL),
 (1,5,'1','11738W',27,'11738W_026_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_026_A.TIF',27,'Affidavits_with_annextures',195,62.6015625,0,0,0,NULL),
 (1,5,'1','11738W',28,'11738W_027_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_027_A.TIF',27,'Affidavits_with_annextures',8,7.095703125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','11738W',29,'11738W_028_A-Others.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_028_A.TIF',27,'Others',25,26,0,0,0,NULL),
 (1,5,'1','11738W',30,'11738W_029_A-Others.TIF','surajit','2021-01-05 13:09:42','u1','2021-01-05 15:35:25','11738W_029_A.TIF',27,'Others',19,0,0,0,0,NULL),
 (1,5,'1','11738W',1,'11738W_030_A-Final_judgement_order.TIF','u1','2021-01-05 15:26:40','u1','2021-01-05 15:35:25','11738W_030_A.TIF',27,'Final_judgement_order',0,23,0,0,0,NULL),
 (1,5,'1','19907W',2,'19907W_001_A-Final_judgement_order.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_001_A.TIF',27,'Final_judgement_order',29,31,0,0,0,NULL),
 (1,5,'1','19907W',3,'19907W_002_A-Final_judgement_order.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_002_A.TIF',27,'Final_judgement_order',17,16.1484375,0,0,0,NULL),
 (1,5,'1','19907W',4,'19907W_003_A-Orders_main_case.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_003_A.TIF',27,'Orders_main_case',11,10.2578125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',5,'19907W_004_A-Orders_main_case.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_004_A.TIF',27,'Orders_main_case',15,13.513671875,0,0,0,NULL),
 (1,5,'1','19907W',6,'19907W_005_A-Orders_main_case.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_005_A.TIF',27,'Orders_main_case',14,11.9765625,0,0,0,NULL),
 (1,5,'1','19907W',7,'19907W_006_A-Orders_main_case.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_006_A.TIF',27,'Orders_main_case',19,16.921875,0,0,0,NULL),
 (1,5,'1','19907W',8,'19907W_007_A-Orders_main_case.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_007_A.TIF',27,'Orders_main_case',27,26.693359375,0,0,0,NULL),
 (1,5,'1','19907W',9,'19907W_008_A-Orders_main_case.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_008_A.TIF',27,'Orders_main_case',33,32.96484375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',10,'19907W_009_A-Orders_main_case.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_009_A.TIF',27,'Orders_main_case',15,14.63671875,0,0,0,NULL),
 (1,5,'1','19907W',11,'19907W_010_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_010_A.TIF',27,'Main_petition',23,20.66796875,0,0,0,NULL),
 (1,5,'1','19907W',12,'19907W_011_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_011_A.TIF',27,'Main_petition',10,9.947265625,0,0,0,NULL),
 (1,5,'1','19907W',13,'19907W_012_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_012_A.TIF',27,'Main_petition',8,7.541015625,0,0,0,NULL),
 (1,5,'1','19907W',14,'19907W_013_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_013_A.TIF',27,'Main_petition',8,8.625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',15,'19907W_014_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_014_A.TIF',27,'Main_petition',10,9.494140625,0,0,0,NULL),
 (1,5,'1','19907W',16,'19907W_015_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_015_A.TIF',27,'Main_petition',14,11.875,0,0,0,NULL),
 (1,5,'1','19907W',17,'19907W_016_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_016_A.TIF',27,'Main_petition',6,5.70703125,0,0,0,NULL),
 (1,5,'1','19907W',18,'19907W_017_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_017_A.TIF',27,'Main_petition',10,9.533203125,0,0,0,NULL),
 (1,5,'1','19907W',19,'19907W_018_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_018_A.TIF',27,'Main_petition',99,68.3125,0,0,0,NULL),
 (1,5,'1','19907W',20,'19907W_019_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_019_A.TIF',27,'Main_petition',9,8.1015625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',21,'19907W_020_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_020_A.TIF',27,'Main_petition',9,7.76953125,0,0,0,NULL),
 (1,5,'1','19907W',22,'19907W_021_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_021_A.TIF',27,'Main_petition',16,14.375,0,0,0,NULL),
 (1,5,'1','19907W',23,'19907W_022_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_022_A.TIF',27,'Main_petition',17,15.546875,0,0,0,NULL),
 (1,5,'1','19907W',24,'19907W_023_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_023_A.TIF',27,'Main_petition',19,17.869140625,0,0,0,NULL),
 (1,5,'1','19907W',25,'19907W_024_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_024_A.TIF',27,'Main_petition',17,16.23046875,0,0,0,NULL),
 (1,5,'1','19907W',26,'19907W_025_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_025_A.TIF',27,'Main_petition',16,14.6875,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',27,'19907W_026_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_026_A.TIF',27,'Main_petition',17,16.359375,0,0,0,NULL),
 (1,5,'1','19907W',28,'19907W_027_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_027_A.TIF',27,'Main_petition',14,13.6015625,0,0,0,NULL),
 (1,5,'1','19907W',29,'19907W_028_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_028_A.TIF',27,'Main_petition',16,15.43359375,0,0,0,NULL),
 (1,5,'1','19907W',30,'19907W_029_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_029_A.TIF',27,'Main_petition',18,17.1484375,0,0,0,NULL),
 (1,5,'1','19907W',31,'19907W_030_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_030_A.TIF',27,'Main_petition',16,15.4921875,0,0,0,NULL),
 (1,5,'1','19907W',32,'19907W_031_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_031_A.TIF',27,'Main_petition',16,15.017578125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',33,'19907W_032_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_032_A.TIF',27,'Main_petition',18,17.775390625,0,0,0,NULL),
 (1,5,'1','19907W',34,'19907W_033_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_033_A.TIF',27,'Main_petition',12,10.87109375,0,0,0,NULL),
 (1,5,'1','19907W',35,'19907W_034_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_034_A.TIF',27,'Main_petition',11,10.71875,0,0,0,NULL),
 (1,5,'1','19907W',36,'19907W_035_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_035_A.TIF',27,'Main_petition',11,10.75390625,0,0,0,NULL),
 (1,5,'1','19907W',37,'19907W_036_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_036_A.TIF',27,'Main_petition',8,6.755859375,0,0,0,NULL),
 (1,5,'1','19907W',38,'19907W_037_A-Main_petition.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_037_A.TIF',27,'Main_petition',35,32.232421875,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',39,'19907W_038_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_038_A.TIF',27,'Main_petition_annextures',62,48.62109375,0,0,0,NULL),
 (1,5,'1','19907W',40,'19907W_039_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_039_A.TIF',27,'Main_petition_annextures',53,42.396484375,0,0,0,NULL),
 (1,5,'1','19907W',41,'19907W_040_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_040_A.TIF',27,'Main_petition_annextures',18,12.458984375,0,0,0,NULL),
 (1,5,'1','19907W',42,'19907W_041_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_041_A.TIF',27,'Main_petition_annextures',64,44.5078125,0,0,0,NULL),
 (1,5,'1','19907W',43,'19907W_042_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_042_A.TIF',27,'Main_petition_annextures',66,52.62109375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',44,'19907W_043_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_043_A.TIF',27,'Main_petition_annextures',65,51.25,0,0,0,NULL),
 (1,5,'1','19907W',45,'19907W_044_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_044_A.TIF',27,'Main_petition_annextures',40,32.412109375,0,0,0,NULL),
 (1,5,'1','19907W',46,'19907W_045_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_045_A.TIF',27,'Main_petition_annextures',25,16.13671875,0,0,0,NULL),
 (1,5,'1','19907W',47,'19907W_046_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_046_A.TIF',27,'Main_petition_annextures',77,46.228515625,0,0,0,NULL),
 (1,5,'1','19907W',48,'19907W_047_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_047_A.TIF',27,'Main_petition_annextures',162,82.19921875,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',49,'19907W_048_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_048_A.TIF',27,'Main_petition_annextures',28,21.732421875,0,0,0,NULL),
 (1,5,'1','19907W',50,'19907W_049_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_049_A.TIF',27,'Main_petition_annextures',22,14.404296875,0,0,0,NULL),
 (1,5,'1','19907W',51,'19907W_050_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_050_A.TIF',27,'Main_petition_annextures',43,35.328125,0,0,0,NULL),
 (1,5,'1','19907W',52,'19907W_051_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_051_A.TIF',27,'Main_petition_annextures',17,10.509765625,0,0,0,NULL),
 (1,5,'1','19907W',53,'19907W_052_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_052_A.TIF',27,'Main_petition_annextures',44,39.0390625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',54,'19907W_053_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_053_A.TIF',27,'Main_petition_annextures',50,41.59375,0,0,0,NULL),
 (1,5,'1','19907W',55,'19907W_054_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_054_A.TIF',27,'Main_petition_annextures',59,45.142578125,0,0,0,NULL),
 (1,5,'1','19907W',56,'19907W_055_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_055_A.TIF',27,'Main_petition_annextures',54,42.70703125,0,0,0,NULL),
 (1,5,'1','19907W',57,'19907W_056_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_056_A.TIF',27,'Main_petition_annextures',18,11.962890625,0,0,0,NULL),
 (1,5,'1','19907W',58,'19907W_057_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_057_A.TIF',27,'Main_petition_annextures',65,44.30078125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',59,'19907W_058_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_058_A.TIF',27,'Main_petition_annextures',69,53.708984375,0,0,0,NULL),
 (1,5,'1','19907W',60,'19907W_059_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_059_A.TIF',27,'Main_petition_annextures',26,19.935546875,0,0,0,NULL),
 (1,5,'1','19907W',61,'19907W_060_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_060_A.TIF',27,'Main_petition_annextures',20,13.18359375,0,0,0,NULL),
 (1,5,'1','19907W',62,'19907W_061_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_061_A.TIF',27,'Main_petition_annextures',48,34.439453125,0,0,0,NULL),
 (1,5,'1','19907W',63,'19907W_062_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_062_A.TIF',27,'Main_petition_annextures',16,9.666015625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',64,'19907W_063_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_063_A.TIF',27,'Main_petition_annextures',38,31.77734375,0,0,0,NULL),
 (1,5,'1','19907W',65,'19907W_064_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_064_A.TIF',27,'Main_petition_annextures',41,34.734375,0,0,0,NULL),
 (1,5,'1','19907W',66,'19907W_065_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_065_A.TIF',27,'Main_petition_annextures',64,48.849609375,0,0,0,NULL),
 (1,5,'1','19907W',67,'19907W_066_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_066_A.TIF',27,'Main_petition_annextures',44,33.216796875,0,0,0,NULL),
 (1,5,'1','19907W',68,'19907W_067_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_067_A.TIF',27,'Main_petition_annextures',22,14.078125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',69,'19907W_068_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_068_A.TIF',27,'Main_petition_annextures',76,49.00390625,0,0,0,NULL),
 (1,5,'1','19907W',70,'19907W_069_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_069_A.TIF',27,'Main_petition_annextures',141,74.220703125,0,0,0,NULL),
 (1,5,'1','19907W',71,'19907W_070_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_070_A.TIF',27,'Main_petition_annextures',56,48.29296875,0,0,0,NULL),
 (1,5,'1','19907W',72,'19907W_071_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_071_A.TIF',27,'Main_petition_annextures',46,42.013671875,0,0,0,NULL),
 (1,5,'1','19907W',73,'19907W_072_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_072_A.TIF',27,'Main_petition_annextures',56,50.123046875,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',74,'19907W_073_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_073_A.TIF',27,'Main_petition_annextures',47,42.076171875,0,0,0,NULL),
 (1,5,'1','19907W',75,'19907W_074_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_074_A.TIF',27,'Main_petition_annextures',47,40.181640625,0,0,0,NULL),
 (1,5,'1','19907W',76,'19907W_075_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_075_A.TIF',27,'Main_petition_annextures',46,40.203125,0,0,0,NULL),
 (1,5,'1','19907W',77,'19907W_076_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_076_A.TIF',27,'Main_petition_annextures',47,42.353515625,0,0,0,NULL),
 (1,5,'1','19907W',78,'19907W_077_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_077_A.TIF',27,'Main_petition_annextures',46,41.2109375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',79,'19907W_078_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_078_A.TIF',27,'Vakalatname_and_warrent',45,38.49609375,0,0,0,NULL),
 (1,5,'1','19907W',80,'19907W_079_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_079_A.TIF',27,'Vakalatname_and_warrent',4,3.39453125,0,0,0,NULL),
 (1,5,'1','19907W',81,'19907W_080_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_080_A.TIF',27,'Vakalatname_and_warrent',11,10.361328125,0,0,0,NULL),
 (1,5,'1','19907W',82,'19907W_081_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_081_A.TIF',27,'Affidavits_with_annextures',23,18.904296875,0,0,0,NULL),
 (1,5,'1','19907W',83,'19907W_082_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_082_A.TIF',27,'Affidavits_with_annextures',20,19.599609375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',84,'19907W_083_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_083_A.TIF',27,'Affidavits_with_annextures',13,11.15625,0,0,0,NULL),
 (1,5,'1','19907W',85,'19907W_084_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_084_A.TIF',27,'Affidavits_with_annextures',17,14.513671875,0,0,0,NULL),
 (1,5,'1','19907W',86,'19907W_085_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_085_A.TIF',27,'Affidavits_with_annextures',9,7.55859375,0,0,0,NULL),
 (1,5,'1','19907W',87,'19907W_086_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_086_A.TIF',27,'Affidavits_with_annextures',9,8.419921875,0,0,0,NULL),
 (1,5,'1','19907W',88,'19907W_087_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_087_A.TIF',27,'Affidavits_with_annextures',17,16.037109375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',89,'19907W_088_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_088_A.TIF',27,'Affidavits_with_annextures',18,15.548828125,0,0,0,NULL),
 (1,5,'1','19907W',90,'19907W_089_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_089_A.TIF',27,'Affidavits_with_annextures',15,14.177734375,0,0,0,NULL),
 (1,5,'1','19907W',91,'19907W_090_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_090_A.TIF',27,'Affidavits_with_annextures',15,14.369140625,0,0,0,NULL),
 (1,5,'1','19907W',92,'19907W_091_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_091_A.TIF',27,'Affidavits_with_annextures',18,16.041015625,0,0,0,NULL),
 (1,5,'1','19907W',93,'19907W_092_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_092_A.TIF',27,'Affidavits_with_annextures',17,15.958984375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','19907W',94,'19907W_093_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_093_A.TIF',27,'Affidavits_with_annextures',16,14.283203125,0,0,0,NULL),
 (1,5,'1','19907W',95,'19907W_094_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_094_A.TIF',27,'Affidavits_with_annextures',11,8.95703125,0,0,0,NULL),
 (1,5,'1','19907W',96,'19907W_095_A-Others.TIF','surajit','2021-01-05 13:27:25','u1','2021-01-05 15:35:25','19907W_095_A.TIF',27,'Others',19,15.65234375,0,0,0,NULL),
 (1,5,'1','19907W',1,'19907W_096_A-Final_judgement_order.TIF','u1','2021-01-05 15:26:40','u1','2021-01-05 15:35:25','19907W_096_A.TIF',27,'Final_judgement_order',0,27,0,0,0,NULL),
 (1,5,'1','20334W',2,'20334W_001_A-Final_judgement_order.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_001_A.TIF',27,'Final_judgement_order',14,13.134765625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',3,'20334W_002_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_002_A.TIF',27,'Main_petition',24,21.9140625,0,0,0,NULL),
 (1,5,'1','20334W',4,'20334W_003_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_003_A.TIF',27,'Main_petition',10,8.357421875,0,0,0,NULL),
 (1,5,'1','20334W',5,'20334W_004_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_004_A.TIF',27,'Main_petition',20,17.576171875,0,0,0,NULL),
 (1,5,'1','20334W',6,'20334W_005_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_005_A.TIF',27,'Main_petition',19,16.36328125,0,0,0,NULL),
 (1,5,'1','20334W',7,'20334W_006_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_006_A.TIF',27,'Main_petition',12,10.658203125,0,0,0,NULL),
 (1,5,'1','20334W',8,'20334W_007_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_007_A.TIF',27,'Main_petition',99,70.791015625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',9,'20334W_008_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_008_A.TIF',27,'Main_petition',13,11.49609375,0,0,0,NULL),
 (1,5,'1','20334W',10,'20334W_009_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_009_A.TIF',27,'Main_petition',13,10.90234375,0,0,0,NULL),
 (1,5,'1','20334W',11,'20334W_010_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_010_A.TIF',27,'Main_petition',12,10.658203125,0,0,0,NULL),
 (1,5,'1','20334W',12,'20334W_011_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_011_A.TIF',27,'Main_petition',20,18.138671875,0,0,0,NULL),
 (1,5,'1','20334W',13,'20334W_012_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_012_A.TIF',27,'Main_petition',28,25.544921875,0,0,0,NULL),
 (1,5,'1','20334W',14,'20334W_013_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_013_A.TIF',27,'Main_petition',27,24.640625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',15,'20334W_014_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_014_A.TIF',27,'Main_petition',25,22.7578125,0,0,0,NULL),
 (1,5,'1','20334W',16,'20334W_015_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_015_A.TIF',27,'Main_petition',26,23.443359375,0,0,0,NULL),
 (1,5,'1','20334W',17,'20334W_016_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_016_A.TIF',27,'Main_petition',23,21.193359375,0,0,0,NULL),
 (1,5,'1','20334W',18,'20334W_017_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_017_A.TIF',27,'Main_petition',24,22.203125,0,0,0,NULL),
 (1,5,'1','20334W',19,'20334W_018_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_018_A.TIF',27,'Main_petition',22,20.439453125,0,0,0,NULL),
 (1,5,'1','20334W',20,'20334W_019_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_019_A.TIF',27,'Main_petition',22,20.037109375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',21,'20334W_020_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_020_A.TIF',27,'Main_petition',23,20.83203125,0,0,0,NULL),
 (1,5,'1','20334W',22,'20334W_021_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_021_A.TIF',27,'Main_petition',23,19.9453125,0,0,0,NULL),
 (1,5,'1','20334W',23,'20334W_022_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_022_A.TIF',27,'Main_petition',16,13.52734375,0,0,0,NULL),
 (1,5,'1','20334W',24,'20334W_023_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_023_A.TIF',27,'Main_petition',15,12.734375,0,0,0,NULL),
 (1,5,'1','20334W',25,'20334W_024_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_024_A.TIF',27,'Main_petition',15,12.4921875,0,0,0,NULL),
 (1,5,'1','20334W',26,'20334W_025_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_025_A.TIF',27,'Main_petition',11,10,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',27,'20334W_026_A-Main_petition.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_026_A.TIF',27,'Main_petition',26,23.103515625,0,0,0,NULL),
 (1,5,'1','20334W',28,'20334W_027_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_027_A.TIF',27,'Main_petition_annextures',57,31.732421875,0,0,0,NULL),
 (1,5,'1','20334W',29,'20334W_028_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_028_A.TIF',27,'Main_petition_annextures',45,29.966796875,0,0,0,NULL),
 (1,5,'1','20334W',30,'20334W_029_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_029_A.TIF',27,'Main_petition_annextures',83,34.712890625,0,0,0,NULL),
 (1,5,'1','20334W',31,'20334W_030_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_030_A.TIF',27,'Main_petition_annextures',42,31.48828125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',32,'20334W_031_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_031_A.TIF',27,'Main_petition_annextures',50,32.296875,0,0,0,NULL),
 (1,5,'1','20334W',33,'20334W_032_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_032_A.TIF',27,'Main_petition_annextures',30,26.23828125,0,0,0,NULL),
 (1,5,'1','20334W',34,'20334W_033_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_033_A.TIF',27,'Main_petition_annextures',39,29.099609375,0,0,0,NULL),
 (1,5,'1','20334W',35,'20334W_034_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_034_A.TIF',27,'Main_petition_annextures',41,28.970703125,0,0,0,NULL),
 (1,5,'1','20334W',36,'20334W_035_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_035_A.TIF',27,'Main_petition_annextures',45,31,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',37,'20334W_036_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_036_A.TIF',27,'Main_petition_annextures',13,9.462890625,0,0,0,NULL),
 (1,5,'1','20334W',38,'20334W_037_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_037_A.TIF',27,'Main_petition_annextures',18,13.759765625,0,0,0,NULL),
 (1,5,'1','20334W',39,'20334W_038_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_038_A.TIF',27,'Main_petition_annextures',46,41.71875,0,0,0,NULL),
 (1,5,'1','20334W',40,'20334W_039_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_039_A.TIF',27,'Main_petition_annextures',19,15.916015625,0,0,0,NULL),
 (1,5,'1','20334W',41,'20334W_040_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_040_A.TIF',27,'Main_petition_annextures',20,18.375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',42,'20334W_041_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_041_A.TIF',27,'Main_petition_annextures',47,41.779296875,0,0,0,NULL),
 (1,5,'1','20334W',43,'20334W_042_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_042_A.TIF',27,'Main_petition_annextures',20,17.439453125,0,0,0,NULL),
 (1,5,'1','20334W',44,'20334W_043_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_043_A.TIF',27,'Main_petition_annextures',42,38.55078125,0,0,0,NULL),
 (1,5,'1','20334W',45,'20334W_044_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_044_A.TIF',27,'Main_petition_annextures',36,32.591796875,0,0,0,NULL),
 (1,5,'1','20334W',46,'20334W_045_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_045_A.TIF',27,'Main_petition_annextures',43,37.720703125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',47,'20334W_046_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_046_A.TIF',27,'Main_petition_annextures',53,42.66015625,0,0,0,NULL),
 (1,5,'1','20334W',48,'20334W_047_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_047_A.TIF',27,'Main_petition_annextures',37,34,0,0,0,NULL),
 (1,5,'1','20334W',49,'20334W_048_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_048_A.TIF',27,'Main_petition_annextures',32,28.2109375,0,0,0,NULL),
 (1,5,'1','20334W',50,'20334W_049_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_049_A.TIF',27,'Main_petition_annextures',35,27.8828125,0,0,0,NULL),
 (1,5,'1','20334W',51,'20334W_050_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_050_A.TIF',27,'Main_petition_annextures',60,48,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',52,'20334W_051_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_051_A.TIF',27,'Main_petition_annextures',56,46,0,0,0,NULL),
 (1,5,'1','20334W',53,'20334W_052_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_052_A.TIF',27,'Main_petition_annextures',54,44,0,0,0,NULL),
 (1,5,'1','20334W',54,'20334W_053_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_053_A.TIF',27,'Main_petition_annextures',81,47.701171875,0,0,0,NULL),
 (1,5,'1','20334W',55,'20334W_054_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_054_A.TIF',27,'Main_petition_annextures',26,26,0,0,0,NULL),
 (1,5,'1','20334W',56,'20334W_055_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_055_A.TIF',27,'Main_petition_annextures',16,10.556640625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',57,'20334W_056_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_056_A.TIF',27,'Main_petition_annextures',29,25.958984375,0,0,0,NULL),
 (1,5,'1','20334W',58,'20334W_057_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_057_A.TIF',27,'Main_petition_annextures',24,22.466796875,0,0,0,NULL),
 (1,5,'1','20334W',59,'20334W_058_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_058_A.TIF',27,'Main_petition_annextures',19,17.681640625,0,0,0,NULL),
 (1,5,'1','20334W',60,'20334W_059_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_059_A.TIF',27,'Main_petition_annextures',17,14.96484375,0,0,0,NULL),
 (1,5,'1','20334W',61,'20334W_060_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_060_A.TIF',27,'Main_petition_annextures',34,29.28125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',62,'20334W_061_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_061_A.TIF',27,'Main_petition_annextures',54,44.955078125,0,0,0,NULL),
 (1,5,'1','20334W',63,'20334W_062_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_062_A.TIF',27,'Main_petition_annextures',48,41.9375,0,0,0,NULL),
 (1,5,'1','20334W',64,'20334W_063_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_063_A.TIF',27,'Main_petition_annextures',39,33.357421875,0,0,0,NULL),
 (1,5,'1','20334W',65,'20334W_064_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_064_A.TIF',27,'Main_petition_annextures',20,17.076171875,0,0,0,NULL),
 (1,5,'1','20334W',66,'20334W_065_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_065_A.TIF',27,'Vakalatname_and_warrent',41,34.03515625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','20334W',67,'20334W_066_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_066_A.TIF',27,'Vakalatname_and_warrent',4,2.92578125,0,0,0,NULL),
 (1,5,'1','20334W',68,'20334W_067_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_067_A.TIF',27,'Vakalatname_and_warrent',10,7.908203125,0,0,0,NULL),
 (1,5,'1','20334W',69,'20334W_068_A-Others.TIF','surajit','2021-01-05 13:20:49','u1','2021-01-05 15:35:25','20334W_068_A.TIF',27,'Others',19,15.626953125,0,0,0,NULL),
 (1,5,'1','20334W',1,'20334W_069_A-Final_judgement_order.TIF','u1','2021-01-05 15:26:40','u1','2021-01-05 15:35:25','20334W_069_A.TIF',27,'Final_judgement_order',0,21,0,0,0,NULL),
 (1,5,'1','21447W',2,'21447W_001_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_001_A.TIF',27,'Main_petition',25,22.193359375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21447W',3,'21447W_002_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_002_A.TIF',27,'Main_petition',11,10.892578125,0,0,0,NULL),
 (1,5,'1','21447W',4,'21447W_003_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_003_A.TIF',27,'Main_petition',10,9.134765625,0,0,0,NULL),
 (1,5,'1','21447W',5,'21447W_004_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_004_A.TIF',27,'Main_petition',9,8.37890625,0,0,0,NULL),
 (1,5,'1','21447W',6,'21447W_005_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_005_A.TIF',27,'Main_petition',11,9.943359375,0,0,0,NULL),
 (1,5,'1','21447W',7,'21447W_006_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_006_A.TIF',27,'Main_petition',8,7.505859375,0,0,0,NULL),
 (1,5,'1','21447W',8,'21447W_007_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_007_A.TIF',27,'Main_petition',55,42.107421875,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21447W',9,'21447W_008_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_008_A.TIF',27,'Main_petition',68,51.92578125,0,0,0,NULL),
 (1,5,'1','21447W',10,'21447W_009_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_009_A.TIF',27,'Main_petition',12,10.123046875,0,0,0,NULL),
 (1,5,'1','21447W',11,'21447W_010_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_010_A.TIF',27,'Main_petition',9,8.94140625,0,0,0,NULL),
 (1,5,'1','21447W',12,'21447W_011_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_011_A.TIF',27,'Main_petition',12,10.7421875,0,0,0,NULL),
 (1,5,'1','21447W',13,'21447W_012_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_012_A.TIF',27,'Main_petition',19,18,0,0,0,NULL),
 (1,5,'1','21447W',14,'21447W_013_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_013_A.TIF',27,'Main_petition',23,21.61328125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21447W',15,'21447W_014_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_014_A.TIF',27,'Main_petition',22,20.28125,0,0,0,NULL),
 (1,5,'1','21447W',16,'21447W_015_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_015_A.TIF',27,'Main_petition',25,22.576171875,0,0,0,NULL),
 (1,5,'1','21447W',17,'21447W_016_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_016_A.TIF',27,'Main_petition',25,25,0,0,0,NULL),
 (1,5,'1','21447W',18,'21447W_017_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_017_A.TIF',27,'Main_petition',23,22.759765625,0,0,0,NULL),
 (1,5,'1','21447W',19,'21447W_018_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_018_A.TIF',27,'Main_petition',21,20.546875,0,0,0,NULL),
 (1,5,'1','21447W',20,'21447W_019_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_019_A.TIF',27,'Main_petition',19,17.61328125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21447W',21,'21447W_020_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_020_A.TIF',27,'Main_petition',24,22.05859375,0,0,0,NULL),
 (1,5,'1','21447W',22,'21447W_021_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_021_A.TIF',27,'Main_petition',22,20.83984375,0,0,0,NULL),
 (1,5,'1','21447W',23,'21447W_022_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_022_A.TIF',27,'Main_petition',15,13.677734375,0,0,0,NULL),
 (1,5,'1','21447W',24,'21447W_023_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_023_A.TIF',27,'Main_petition',13,12.126953125,0,0,0,NULL),
 (1,5,'1','21447W',25,'21447W_024_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_024_A.TIF',27,'Main_petition',18,16.2421875,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21447W',26,'21447W_025_A-Main_petition.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_025_A.TIF',27,'Main_petition',31,27.044921875,0,0,0,NULL),
 (1,5,'1','21447W',27,'21447W_026_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_026_A.TIF',27,'Main_petition_annextures',29,24.216796875,0,0,0,NULL),
 (1,5,'1','21447W',28,'21447W_027_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_027_A.TIF',27,'Main_petition_annextures',63,49.6171875,0,0,0,NULL),
 (1,5,'1','21447W',29,'21447W_028_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_028_A.TIF',27,'Main_petition_annextures',44,27.58984375,0,0,0,NULL),
 (1,5,'1','21447W',30,'21447W_029_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_029_A.TIF',27,'Main_petition_annextures',27,24.5234375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21447W',31,'21447W_030_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_030_A.TIF',27,'Main_petition_annextures',32,28.896484375,0,0,0,NULL),
 (1,5,'1','21447W',32,'21447W_031_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_031_A.TIF',27,'Main_petition_annextures',13,10.248046875,0,0,0,NULL),
 (1,5,'1','21447W',33,'21447W_032_A-Main_petition_annextures.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_032_A.TIF',27,'Main_petition_annextures',22,13.279296875,0,0,0,NULL),
 (1,5,'1','21447W',34,'21447W_033_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_033_A.TIF',27,'Vakalatname_and_warrent',44,37.90234375,0,0,0,NULL),
 (1,5,'1','21447W',35,'21447W_034_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_034_A.TIF',27,'Vakalatname_and_warrent',9,7.59375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21447W',36,'21447W_035_A-Others.TIF','surajit','2021-01-05 13:12:56','u1','2021-01-05 15:35:25','21447W_035_A.TIF',27,'Others',19,15.630859375,0,0,0,NULL),
 (1,5,'1','21447W',1,'21447W_036_A-Final_judgement_order.TIF','u1','2021-01-05 15:26:40','u1','2021-01-05 15:35:25','21447W_036_A.TIF',27,'Final_judgement_order',0,11,0,0,0,NULL),
 (1,5,'1','21699W',1,'21699W_001_A-Final_judgement_order.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_001_A.TIF',27,'Final_judgement_order',23,20.6953125,0,0,0,NULL),
 (1,5,'1','21699W',2,'21699W_002_A-Final_judgement_order.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_002_A.TIF',27,'Final_judgement_order',19,17.26171875,0,0,0,NULL),
 (1,5,'1','21699W',3,'21699W_003_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_003_A.TIF',27,'Main_petition',26,24.5859375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21699W',4,'21699W_004_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_004_A.TIF',27,'Main_petition',10,9.904296875,0,0,0,NULL),
 (1,5,'1','21699W',5,'21699W_005_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_005_A.TIF',27,'Main_petition',8,7.27734375,0,0,0,NULL),
 (1,5,'1','21699W',6,'21699W_006_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_006_A.TIF',27,'Main_petition',15,14.3046875,0,0,0,NULL),
 (1,5,'1','21699W',7,'21699W_007_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_007_A.TIF',27,'Main_petition',7,6.59765625,0,0,0,NULL),
 (1,5,'1','21699W',8,'21699W_008_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_008_A.TIF',27,'Main_petition',16,14.599609375,0,0,0,NULL),
 (1,5,'1','21699W',9,'21699W_009_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_009_A.TIF',27,'Main_petition',100,70.3359375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21699W',10,'21699W_010_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_010_A.TIF',27,'Main_petition',14,13.541015625,0,0,0,NULL),
 (1,5,'1','21699W',11,'21699W_011_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_011_A.TIF',27,'Main_petition',11,10.44140625,0,0,0,NULL),
 (1,5,'1','21699W',12,'21699W_012_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_012_A.TIF',27,'Main_petition',11,10.529296875,0,0,0,NULL),
 (1,5,'1','21699W',13,'21699W_013_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_013_A.TIF',27,'Main_petition',22,20.158203125,0,0,0,NULL),
 (1,5,'1','21699W',14,'21699W_014_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_014_A.TIF',27,'Main_petition',27,25.232421875,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21699W',15,'21699W_015_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_015_A.TIF',27,'Main_petition',25,23.34765625,0,0,0,NULL),
 (1,5,'1','21699W',16,'21699W_016_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_016_A.TIF',27,'Main_petition',23,21.505859375,0,0,0,NULL),
 (1,5,'1','21699W',17,'21699W_017_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_017_A.TIF',27,'Main_petition',26,24.306640625,0,0,0,NULL),
 (1,5,'1','21699W',18,'21699W_018_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_018_A.TIF',27,'Main_petition',26,25.42578125,0,0,0,NULL),
 (1,5,'1','21699W',19,'21699W_019_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_019_A.TIF',27,'Main_petition',19,17.970703125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21699W',20,'21699W_020_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_020_A.TIF',27,'Main_petition',28,26.41015625,0,0,0,NULL),
 (1,5,'1','21699W',21,'21699W_021_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_021_A.TIF',27,'Main_petition',26,24.79296875,0,0,0,NULL),
 (1,5,'1','21699W',22,'21699W_022_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_022_A.TIF',27,'Main_petition',27,26.099609375,0,0,0,NULL),
 (1,5,'1','21699W',23,'21699W_023_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_023_A.TIF',27,'Main_petition',26,24.900390625,0,0,0,NULL),
 (1,5,'1','21699W',24,'21699W_024_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_024_A.TIF',27,'Main_petition',29,26.78515625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21699W',25,'21699W_025_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_025_A.TIF',27,'Main_petition',25,22.619140625,0,0,0,NULL),
 (1,5,'1','21699W',26,'21699W_026_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_026_A.TIF',27,'Main_petition',26,24.474609375,0,0,0,NULL),
 (1,5,'1','21699W',27,'21699W_027_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_027_A.TIF',27,'Main_petition',27,24.48046875,0,0,0,NULL),
 (1,5,'1','21699W',28,'21699W_028_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_028_A.TIF',27,'Main_petition',25,23.8046875,0,0,0,NULL),
 (1,5,'1','21699W',29,'21699W_029_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_029_A.TIF',27,'Main_petition',26,24.044921875,0,0,0,NULL),
 (1,5,'1','21699W',30,'21699W_030_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_030_A.TIF',27,'Main_petition',24,22.408203125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21699W',31,'21699W_031_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_031_A.TIF',27,'Main_petition',25,22.771484375,0,0,0,NULL),
 (1,5,'1','21699W',32,'21699W_032_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_032_A.TIF',27,'Main_petition',22,20.63671875,0,0,0,NULL),
 (1,5,'1','21699W',33,'21699W_033_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_033_A.TIF',27,'Main_petition',14,12.7734375,0,0,0,NULL),
 (1,5,'1','21699W',34,'21699W_034_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_034_A.TIF',27,'Main_petition',12,11.947265625,0,0,0,NULL),
 (1,5,'1','21699W',35,'21699W_035_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_035_A.TIF',27,'Main_petition',13,11.83203125,0,0,0,NULL),
 (1,5,'1','21699W',36,'21699W_036_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_036_A.TIF',27,'Main_petition',25,21.783203125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21699W',37,'21699W_037_A-Main_petition_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_037_A.TIF',27,'Main_petition_annextures',25,22.546875,0,0,0,NULL),
 (1,5,'1','21699W',38,'21699W_038_A-Main_petition_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_038_A.TIF',27,'Main_petition_annextures',16,14.24609375,0,0,0,NULL),
 (1,5,'1','21699W',39,'21699W_039_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_039_A.TIF',27,'Vakalatname_and_warrent',33,29.091796875,0,0,0,NULL),
 (1,5,'1','21699W',40,'21699W_040_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_040_A.TIF',27,'Vakalatname_and_warrent',4,4.318359375,0,0,0,NULL),
 (1,5,'1','21699W',41,'21699W_041_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_041_A.TIF',27,'Vakalatname_and_warrent',8,6.666015625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21699W',42,'21699W_042_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_042_A.TIF',27,'Affidavits_with_annextures',24,20.41796875,0,0,0,NULL),
 (1,5,'1','21699W',43,'21699W_043_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_043_A.TIF',27,'Affidavits_with_annextures',20,19.640625,0,0,0,NULL),
 (1,5,'1','21699W',44,'21699W_044_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_044_A.TIF',27,'Affidavits_with_annextures',8,7.77734375,0,0,0,NULL),
 (1,5,'1','21699W',45,'21699W_045_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_045_A.TIF',27,'Affidavits_with_annextures',30,26.298828125,0,0,0,NULL),
 (1,5,'1','21699W',46,'21699W_046_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_046_A.TIF',27,'Affidavits_with_annextures',16,13.767578125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21699W',47,'21699W_047_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_047_A.TIF',27,'Affidavits_with_annextures',22,17.58984375,0,0,0,NULL),
 (1,5,'1','21699W',48,'21699W_048_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_048_A.TIF',27,'Affidavits_with_annextures',13,10.35546875,0,0,0,NULL),
 (1,5,'1','21699W',49,'21699W_049_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_049_A.TIF',27,'Affidavits_with_annextures',9,8.12109375,0,0,0,NULL),
 (1,5,'1','21699W',50,'21699W_050_A-Others.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21699W_050_A.TIF',27,'Others',19,15.5390625,0,0,0,NULL),
 (1,5,'1','21754W',1,'21754W_001_A-Final_judgement_order.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_001_A.TIF',27,'Final_judgement_order',18,16.16015625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21754W',2,'21754W_002_A-Final_judgement_order.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_002_A.TIF',27,'Final_judgement_order',30,28.482421875,0,0,0,NULL),
 (1,5,'1','21754W',3,'21754W_003_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_003_A.TIF',27,'Main_petition',33,32.455078125,0,0,0,NULL),
 (1,5,'1','21754W',4,'21754W_004_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_004_A.TIF',27,'Main_petition',12,11.654296875,0,0,0,NULL),
 (1,5,'1','21754W',5,'21754W_005_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_005_A.TIF',27,'Main_petition',13,12.12109375,0,0,0,NULL),
 (1,5,'1','21754W',6,'21754W_006_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_006_A.TIF',27,'Main_petition',7,6.869140625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21754W',7,'21754W_007_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_007_A.TIF',27,'Main_petition',19,18.8046875,0,0,0,NULL),
 (1,5,'1','21754W',8,'21754W_008_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_008_A.TIF',27,'Main_petition',56,41.419921875,0,0,0,NULL),
 (1,5,'1','21754W',9,'21754W_009_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_009_A.TIF',27,'Main_petition',62,43.509765625,0,0,0,NULL),
 (1,5,'1','21754W',10,'21754W_010_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_010_A.TIF',27,'Main_petition',10,9.4609375,0,0,0,NULL),
 (1,5,'1','21754W',11,'21754W_011_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_011_A.TIF',27,'Main_petition',13,11.740234375,0,0,0,NULL),
 (1,5,'1','21754W',12,'21754W_012_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_012_A.TIF',27,'Main_petition',16,15.162109375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21754W',13,'21754W_013_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_013_A.TIF',27,'Main_petition',25,24.16015625,0,0,0,NULL),
 (1,5,'1','21754W',14,'21754W_014_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_014_A.TIF',27,'Main_petition',21,20.677734375,0,0,0,NULL),
 (1,5,'1','21754W',15,'21754W_015_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_015_A.TIF',27,'Main_petition',21,19.859375,0,0,0,NULL),
 (1,5,'1','21754W',16,'21754W_016_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_016_A.TIF',27,'Main_petition',22,21.349609375,0,0,0,NULL),
 (1,5,'1','21754W',17,'21754W_017_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_017_A.TIF',27,'Main_petition',19,18.5234375,0,0,0,NULL),
 (1,5,'1','21754W',18,'21754W_018_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_018_A.TIF',27,'Main_petition',21,20.0625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21754W',19,'21754W_019_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_019_A.TIF',27,'Main_petition',20,19.087890625,0,0,0,NULL),
 (1,5,'1','21754W',20,'21754W_020_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_020_A.TIF',27,'Main_petition',13,12.466796875,0,0,0,NULL),
 (1,5,'1','21754W',21,'21754W_021_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_021_A.TIF',27,'Main_petition',11,10.298828125,0,0,0,NULL),
 (1,5,'1','21754W',22,'21754W_022_A-Main_petition.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_022_A.TIF',27,'Main_petition',28,27,0,0,0,NULL),
 (1,5,'1','21754W',23,'21754W_023_A-Main_petition_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_023_A.TIF',27,'Main_petition_annextures',23,15.828125,0,0,0,NULL),
 (1,5,'1','21754W',24,'21754W_024_A-Main_petition_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_024_A.TIF',27,'Main_petition_annextures',20,11.47265625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21754W',25,'21754W_025_A-Main_petition_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_025_A.TIF',27,'Main_petition_annextures',13,7.91796875,0,0,0,NULL),
 (1,5,'1','21754W',26,'21754W_026_A-Main_petition_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_026_A.TIF',27,'Main_petition_annextures',37,33.021484375,0,0,0,NULL),
 (1,5,'1','21754W',27,'21754W_027_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_027_A.TIF',27,'Vakalatname_and_warrent',45,38.255859375,0,0,0,NULL),
 (1,5,'1','21754W',28,'21754W_028_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_028_A.TIF',27,'Vakalatname_and_warrent',5,4.51953125,0,0,0,NULL),
 (1,5,'1','21754W',29,'21754W_029_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_029_A.TIF',27,'Vakalatname_and_warrent',9,8.322265625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21754W',30,'21754W_030_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_030_A.TIF',27,'Vakalatname_and_warrent',35,29.09765625,0,0,0,NULL),
 (1,5,'1','21754W',31,'21754W_031_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_031_A.TIF',27,'Affidavits_with_annextures',21,18.13671875,0,0,0,NULL),
 (1,5,'1','21754W',32,'21754W_032_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_032_A.TIF',27,'Affidavits_with_annextures',19,17.5859375,0,0,0,NULL),
 (1,5,'1','21754W',33,'21754W_033_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_033_A.TIF',27,'Affidavits_with_annextures',24,21.763671875,0,0,0,NULL),
 (1,5,'1','21754W',34,'21754W_034_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_034_A.TIF',27,'Affidavits_with_annextures',18,17.578125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','21754W',35,'21754W_035_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_035_A.TIF',27,'Affidavits_with_annextures',10,8.46875,0,0,0,NULL),
 (1,5,'1','21754W',36,'21754W_036_A-Others.TIF','surajit','2021-01-05 12:43:50','u1','2021-01-05 15:35:25','21754W_036_A.TIF',27,'Others',19,15.751953125,0,0,0,NULL),
 (1,5,'1','22102W',2,'22102W_001_A-Final_judgement_order.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_001_A.TIF',27,'Final_judgement_order',29,28.28125,0,0,0,NULL),
 (1,5,'1','22102W',3,'22102W_002_A-Final_judgement_order.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_002_A.TIF',27,'Final_judgement_order',22,20.83984375,0,0,0,NULL),
 (1,5,'1','22102W',4,'22102W_003_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_003_A.TIF',27,'Main_petition',26,23.3203125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22102W',5,'22102W_004_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_004_A.TIF',27,'Main_petition',13,12.404296875,0,0,0,NULL),
 (1,5,'1','22102W',6,'22102W_005_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_005_A.TIF',27,'Main_petition',10,7.73828125,0,0,0,NULL),
 (1,5,'1','22102W',7,'22102W_006_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_006_A.TIF',27,'Main_petition',12,11.01953125,0,0,0,NULL),
 (1,5,'1','22102W',8,'22102W_007_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_007_A.TIF',27,'Main_petition',7,7.01953125,0,0,0,NULL),
 (1,5,'1','22102W',9,'22102W_008_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_008_A.TIF',27,'Main_petition',103,75.796875,0,0,0,NULL),
 (1,5,'1','22102W',10,'22102W_009_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_009_A.TIF',27,'Main_petition',9,8.271484375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22102W',11,'22102W_010_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_010_A.TIF',27,'Main_petition',9,8.744140625,0,0,0,NULL),
 (1,5,'1','22102W',12,'22102W_011_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_011_A.TIF',27,'Main_petition',11,9.849609375,0,0,0,NULL),
 (1,5,'1','22102W',13,'22102W_012_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_012_A.TIF',27,'Main_petition',15,13.4296875,0,0,0,NULL),
 (1,5,'1','22102W',14,'22102W_013_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_013_A.TIF',27,'Main_petition',21,19.962890625,0,0,0,NULL),
 (1,5,'1','22102W',15,'22102W_014_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_014_A.TIF',27,'Main_petition',20,18.51953125,0,0,0,NULL),
 (1,5,'1','22102W',16,'22102W_015_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_015_A.TIF',27,'Main_petition',21,20.271484375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22102W',17,'22102W_016_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_016_A.TIF',27,'Main_petition',22,20.884765625,0,0,0,NULL),
 (1,5,'1','22102W',18,'22102W_017_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_017_A.TIF',27,'Main_petition',21,20.017578125,0,0,0,NULL),
 (1,5,'1','22102W',19,'22102W_018_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_018_A.TIF',27,'Main_petition',19,18.150390625,0,0,0,NULL),
 (1,5,'1','22102W',20,'22102W_019_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_019_A.TIF',27,'Main_petition',21,18.7421875,0,0,0,NULL),
 (1,5,'1','22102W',21,'22102W_020_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_020_A.TIF',27,'Main_petition',19,17.548828125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22102W',22,'22102W_021_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_021_A.TIF',27,'Main_petition',13,11.78125,0,0,0,NULL),
 (1,5,'1','22102W',23,'22102W_022_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_022_A.TIF',27,'Main_petition',12,10.9296875,0,0,0,NULL),
 (1,5,'1','22102W',24,'22102W_023_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_023_A.TIF',27,'Main_petition',5,4.951171875,0,0,0,NULL),
 (1,5,'1','22102W',25,'22102W_024_A-Main_petition.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_024_A.TIF',27,'Main_petition',27,23.841796875,0,0,0,NULL),
 (1,5,'1','22102W',26,'22102W_025_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_025_A.TIF',27,'Vakalatname_and_warrent',42,36.29296875,0,0,0,NULL),
 (1,5,'1','22102W',27,'22102W_026_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_026_A.TIF',27,'Vakalatname_and_warrent',5,5.48046875,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22102W',28,'22102W_027_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_027_A.TIF',27,'Vakalatname_and_warrent',10,9,0,0,0,NULL),
 (1,5,'1','22102W',29,'22102W_028_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_028_A.TIF',27,'Affidavits_with_annextures',23,19.185546875,0,0,0,NULL),
 (1,5,'1','22102W',30,'22102W_029_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_029_A.TIF',27,'Affidavits_with_annextures',15,13.701171875,0,0,0,NULL),
 (1,5,'1','22102W',31,'22102W_030_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_030_A.TIF',27,'Affidavits_with_annextures',28,25.103515625,0,0,0,NULL),
 (1,5,'1','22102W',32,'22102W_031_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_031_A.TIF',27,'Affidavits_with_annextures',10,8.810546875,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22102W',33,'22102W_032_A-Others.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_032_A.TIF',27,'Others',22,14.525390625,0,0,0,NULL),
 (1,5,'1','22102W',34,'22102W_033_A-Others.TIF','surajit','2021-01-05 12:51:16','u1','2021-01-05 15:35:25','22102W_033_A.TIF',27,'Others',20,15.78515625,0,0,0,NULL),
 (1,5,'1','22102W',1,'22102W_034_A-Final_judgement_order.TIF','u1','2021-01-05 15:26:40','u1','2021-01-05 15:35:25','22102W_034_A.TIF',27,'Final_judgement_order',0,25,0,0,0,NULL),
 (1,5,'1','22116W',2,'22116W_001_A-Final_judgement_order.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_001_A.TIF',27,'Final_judgement_order',32,29.98046875,0,0,0,NULL),
 (1,5,'1','22116W',3,'22116W_002_A-Final_judgement_order.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_002_A.TIF',27,'Final_judgement_order',16,15.26171875,0,0,0,NULL),
 (1,5,'1','22116W',4,'22116W_003_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_003_A.TIF',27,'Main_petition',24,22.0703125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22116W',5,'22116W_004_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_004_A.TIF',27,'Main_petition',14,11.298828125,0,0,0,NULL),
 (1,5,'1','22116W',6,'22116W_005_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_005_A.TIF',27,'Main_petition',11,7.0234375,0,0,0,NULL),
 (1,5,'1','22116W',7,'22116W_006_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_006_A.TIF',27,'Main_petition',14,10.326171875,0,0,0,NULL),
 (1,5,'1','22116W',8,'22116W_007_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_007_A.TIF',27,'Main_petition',10,6.552734375,0,0,0,NULL),
 (1,5,'1','22116W',9,'22116W_008_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_008_A.TIF',27,'Main_petition',98,70.501953125,0,0,0,NULL),
 (1,5,'1','22116W',10,'22116W_009_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_009_A.TIF',27,'Main_petition',12,8.71484375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22116W',11,'22116W_010_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_010_A.TIF',27,'Main_petition',13,9.025390625,0,0,0,NULL),
 (1,5,'1','22116W',12,'22116W_011_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_011_A.TIF',27,'Main_petition',14,10.41015625,0,0,0,NULL),
 (1,5,'1','22116W',13,'22116W_012_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_012_A.TIF',27,'Main_petition',18,14.599609375,0,0,0,NULL),
 (1,5,'1','22116W',14,'22116W_013_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_013_A.TIF',27,'Main_petition',22,18.84375,0,0,0,NULL),
 (1,5,'1','22116W',15,'22116W_014_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_014_A.TIF',27,'Main_petition',26,20.490234375,0,0,0,NULL),
 (1,5,'1','22116W',16,'22116W_015_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_015_A.TIF',27,'Main_petition',24,18.6328125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22116W',17,'22116W_016_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_016_A.TIF',27,'Main_petition',25,20.46484375,0,0,0,NULL),
 (1,5,'1','22116W',18,'22116W_017_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_017_A.TIF',27,'Main_petition',24,19.96875,0,0,0,NULL),
 (1,5,'1','22116W',19,'22116W_018_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_018_A.TIF',27,'Main_petition',21,17.412109375,0,0,0,NULL),
 (1,5,'1','22116W',20,'22116W_019_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_019_A.TIF',27,'Main_petition',22,18.79296875,0,0,0,NULL),
 (1,5,'1','22116W',21,'22116W_020_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_020_A.TIF',27,'Main_petition',23,19.236328125,0,0,0,NULL),
 (1,5,'1','22116W',22,'22116W_021_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_021_A.TIF',27,'Main_petition',16,12.615234375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22116W',23,'22116W_022_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_022_A.TIF',27,'Main_petition',14,11.1015625,0,0,0,NULL),
 (1,5,'1','22116W',24,'22116W_023_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_023_A.TIF',27,'Main_petition',5,5.021484375,0,0,0,NULL),
 (1,5,'1','22116W',25,'22116W_024_A-Main_petition.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_024_A.TIF',27,'Main_petition',32,24.6875,0,0,0,NULL),
 (1,5,'1','22116W',26,'22116W_025_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_025_A.TIF',27,'Vakalatname_and_warrent',43,37.111328125,0,0,0,NULL),
 (1,5,'1','22116W',27,'22116W_026_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_026_A.TIF',27,'Vakalatname_and_warrent',5,5.021484375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22116W',28,'22116W_027_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_027_A.TIF',27,'Vakalatname_and_warrent',11,8.265625,0,0,0,NULL),
 (1,5,'1','22116W',29,'22116W_028_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_028_A.TIF',27,'Vakalatname_and_warrent',26,23.49609375,0,0,0,NULL),
 (1,5,'1','22116W',30,'22116W_029_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_029_A.TIF',27,'Affidavits_with_annextures',25,21.25390625,0,0,0,NULL),
 (1,5,'1','22116W',31,'22116W_030_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_030_A.TIF',27,'Affidavits_with_annextures',28,26.357421875,0,0,0,NULL),
 (1,5,'1','22116W',32,'22116W_031_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_031_A.TIF',27,'Affidavits_with_annextures',9,9.5703125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22116W',33,'22116W_032_A-Others.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_032_A.TIF',27,'Others',22,13.302734375,0,0,0,NULL),
 (1,5,'1','22116W',34,'22116W_033_A-Others.TIF','surajit','2021-01-05 13:01:31','u1','2021-01-05 15:35:25','22116W_033_A.TIF',27,'Others',19,15.8515625,0,0,0,NULL),
 (1,5,'1','22116W',1,'22116W_034_A-Final_judgement_order.TIF','u1','2021-01-05 15:26:40','u1','2021-01-05 15:35:25','22116W_034_A.TIF',27,'Final_judgement_order',0,23,0,0,0,NULL),
 (1,5,'1','22119W',2,'22119W_001_A-Final_judgement_order.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_001_A.TIF',27,'Final_judgement_order',33,29.5234375,0,0,0,NULL),
 (1,5,'1','22119W',3,'22119W_002_A-Final_judgement_order.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_002_A.TIF',27,'Final_judgement_order',18,15,0,0,0,NULL),
 (1,5,'1','22119W',4,'22119W_003_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_003_A.TIF',27,'Main_petition',25,22.99609375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22119W',5,'22119W_004_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_004_A.TIF',27,'Main_petition',18,11.626953125,0,0,0,NULL),
 (1,5,'1','22119W',6,'22119W_005_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_005_A.TIF',27,'Main_petition',11,6.943359375,0,0,0,NULL),
 (1,5,'1','22119W',7,'22119W_006_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_006_A.TIF',27,'Main_petition',14,10.341796875,0,0,0,NULL),
 (1,5,'1','22119W',8,'22119W_007_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_007_A.TIF',27,'Main_petition',10,6.779296875,0,0,0,NULL),
 (1,5,'1','22119W',9,'22119W_008_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_008_A.TIF',27,'Main_petition',105,74.400390625,0,0,0,NULL),
 (1,5,'1','22119W',10,'22119W_009_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_009_A.TIF',27,'Main_petition',11,8.6953125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22119W',11,'22119W_010_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_010_A.TIF',27,'Main_petition',11,8.830078125,0,0,0,NULL),
 (1,5,'1','22119W',12,'22119W_011_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_011_A.TIF',27,'Main_petition',14,10.666015625,0,0,0,NULL),
 (1,5,'1','22119W',13,'22119W_012_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_012_A.TIF',27,'Main_petition',20,16.42578125,0,0,0,NULL),
 (1,5,'1','22119W',14,'22119W_013_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_013_A.TIF',27,'Main_petition',22,18.701171875,0,0,0,NULL),
 (1,5,'1','22119W',15,'22119W_014_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_014_A.TIF',27,'Main_petition',22,18.39453125,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22119W',16,'22119W_015_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_015_A.TIF',27,'Main_petition',22,19.212890625,0,0,0,NULL),
 (1,5,'1','22119W',17,'22119W_016_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_016_A.TIF',27,'Main_petition',24,20.328125,0,0,0,NULL),
 (1,5,'1','22119W',18,'22119W_017_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_017_A.TIF',27,'Main_petition',24,20.201171875,0,0,0,NULL),
 (1,5,'1','22119W',19,'22119W_018_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_018_A.TIF',27,'Main_petition',20,16.712890625,0,0,0,NULL),
 (1,5,'1','22119W',20,'22119W_019_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_019_A.TIF',27,'Main_petition',21,18.27734375,0,0,0,NULL),
 (1,5,'1','22119W',21,'22119W_020_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_020_A.TIF',27,'Main_petition',24,18.947265625,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22119W',22,'22119W_021_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_021_A.TIF',27,'Main_petition',16,12.591796875,0,0,0,NULL),
 (1,5,'1','22119W',23,'22119W_022_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_022_A.TIF',27,'Main_petition',14,11.07421875,0,0,0,NULL),
 (1,5,'1','22119W',24,'22119W_023_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_023_A.TIF',27,'Main_petition',6,4.93359375,0,0,0,NULL),
 (1,5,'1','22119W',25,'22119W_024_A-Main_petition.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_024_A.TIF',27,'Main_petition',29,23.29296875,0,0,0,NULL),
 (1,5,'1','22119W',26,'22119W_025_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_025_A.TIF',27,'Vakalatname_and_warrent',43,37.533203125,0,0,0,NULL),
 (1,5,'1','22119W',27,'22119W_026_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_026_A.TIF',27,'Vakalatname_and_warrent',6,5.8359375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22119W',28,'22119W_027_A-Vakalatname_and_warrent.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_027_A.TIF',27,'Vakalatname_and_warrent',11,8.38671875,0,0,0,NULL),
 (1,5,'1','22119W',29,'22119W_028_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_028_A.TIF',27,'Affidavits_with_annextures',22,19.541015625,0,0,0,NULL),
 (1,5,'1','22119W',30,'22119W_029_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_029_A.TIF',27,'Affidavits_with_annextures',15,14.25390625,0,0,0,NULL),
 (1,5,'1','22119W',31,'22119W_030_A-Affidavits_with_annextures.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_030_A.TIF',27,'Affidavits_with_annextures',28,26.955078125,0,0,0,NULL),
 (1,5,'1','22119W',32,'22119W_031_A-Others.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_031_A.TIF',27,'Others',21,13.02734375,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,5,'1','22119W',33,'22119W_032_A-Others.TIF','surajit','2021-01-05 13:05:49','u1','2021-01-05 15:35:25','22119W_032_A.TIF',27,'Others',18,15.5859375,0,0,0,NULL),
 (1,5,'1','22119W',1,'22119W_033_A-Final_judgement_order.TIF','u1','2021-01-05 15:26:40','u1','2021-01-05 15:35:25','22119W_033_A.TIF',27,'Final_judgement_order',0,23,0,0,0,NULL),
 (1,16,'1','13572W',1,'13572W_001_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_001_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','13572W',2,'13572W_002_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_002_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','13572W',3,'13572W_003_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_003_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','13572W',4,'13572W_004_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_004_A.TIF',24,NULL,35,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',5,'13572W_005_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_005_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','13572W',6,'13572W_006_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_006_A.TIF',24,NULL,11,0,0,0,0,NULL),
 (1,16,'1','13572W',7,'13572W_007_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_007_A.TIF',24,NULL,122,0,0,0,0,NULL),
 (1,16,'1','13572W',8,'13572W_008_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_008_A.TIF',24,NULL,106,0,0,0,0,NULL),
 (1,16,'1','13572W',9,'13572W_009_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_009_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','13572W',10,'13572W_010_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_010_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','13572W',11,'13572W_011_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_011_A.TIF',24,NULL,21,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',12,'13572W_012_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_012_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','13572W',13,'13572W_013_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_013_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','13572W',14,'13572W_014_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_014_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','13572W',15,'13572W_015_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_015_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','13572W',16,'13572W_016_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_016_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','13572W',17,'13572W_017_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_017_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','13572W',18,'13572W_018_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_018_A.TIF',24,NULL,21,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',19,'13572W_019_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_019_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','13572W',20,'13572W_020_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_020_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','13572W',21,'13572W_021_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_021_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','13572W',22,'13572W_022_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_022_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','13572W',23,'13572W_023_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_023_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','13572W',24,'13572W_024_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_024_A.TIF',24,NULL,37,0,0,0,0,NULL),
 (1,16,'1','13572W',25,'13572W_025_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_025_A.TIF',24,NULL,26,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',26,'13572W_026_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_026_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','13572W',27,'13572W_027_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_027_A.TIF',24,NULL,30,0,0,0,0,NULL),
 (1,16,'1','13572W',28,'13572W_028_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_028_A.TIF',24,NULL,44,0,0,0,0,NULL),
 (1,16,'1','13572W',29,'13572W_029_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_029_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','13572W',30,'13572W_030_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_030_A.TIF',24,NULL,36,0,0,0,0,NULL),
 (1,16,'1','13572W',31,'13572W_031_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_031_A.TIF',24,NULL,37,0,0,0,0,NULL),
 (1,16,'1','13572W',32,'13572W_032_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_032_A.TIF',24,NULL,26,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',33,'13572W_033_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_033_A.TIF',24,NULL,4,0,0,0,0,NULL),
 (1,16,'1','13572W',34,'13572W_034_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_034_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','13572W',35,'13572W_035_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_035_A.TIF',24,NULL,47,0,0,0,0,NULL),
 (1,16,'1','13572W',36,'13572W_036_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_036_A.TIF',24,NULL,4,0,0,0,0,NULL),
 (1,16,'1','13572W',37,'13572W_037_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_037_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','13572W',38,'13572W_038_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_038_A.TIF',24,NULL,49,0,0,0,0,NULL),
 (1,16,'1','13572W',39,'13572W_039_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_039_A.TIF',24,NULL,4,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',40,'13572W_040_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_040_A.TIF',24,NULL,30,0,0,0,0,NULL),
 (1,16,'1','13572W',41,'13572W_041_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_041_A.TIF',24,NULL,12,0,0,0,0,NULL),
 (1,16,'1','13572W',42,'13572W_042_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_042_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','13572W',43,'13572W_043_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_043_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','13572W',44,'13572W_044_A.TIF','surajit','2021-01-05 15:20:04',NULL,NULL,'13572W_044_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','13572W',45,'13572W_045_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_045_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','13572W',46,'13572W_046_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_046_A.TIF',24,NULL,19,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',47,'13572W_047_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_047_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','13572W',48,'13572W_048_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_048_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','13572W',49,'13572W_049_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_049_A.TIF',24,NULL,35,0,0,0,0,NULL),
 (1,16,'1','13572W',50,'13572W_050_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_050_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','13572W',51,'13572W_051_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_051_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','13572W',52,'13572W_052_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_052_A.TIF',24,NULL,122,0,0,0,0,NULL),
 (1,16,'1','13572W',53,'13572W_053_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_053_A.TIF',24,NULL,107,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',54,'13572W_054_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_054_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','13572W',55,'13572W_055_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_055_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','13572W',56,'13572W_056_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_056_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','13572W',57,'13572W_057_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_057_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','13572W',58,'13572W_058_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_058_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','13572W',59,'13572W_059_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_059_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','13572W',60,'13572W_060_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_060_A.TIF',24,NULL,24,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',61,'13572W_061_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_061_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','13572W',62,'13572W_062_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_062_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','13572W',63,'13572W_063_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_063_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','13572W',64,'13572W_064_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_064_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','13572W',65,'13572W_065_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_065_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','13572W',66,'13572W_066_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_066_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','13572W',67,'13572W_067_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_067_A.TIF',24,NULL,17,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',68,'13572W_068_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_068_A.TIF',24,NULL,13,0,0,0,0,NULL),
 (1,16,'1','13572W',69,'13572W_069_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_069_A.TIF',24,NULL,35,0,0,0,0,NULL),
 (1,16,'1','13572W',70,'13572W_070_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_070_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','13572W',71,'13572W_071_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_071_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','13572W',72,'13572W_072_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_072_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','13572W',73,'13572W_073_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_073_A.TIF',24,NULL,45,0,0,0,0,NULL),
 (1,16,'1','13572W',74,'13572W_074_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_074_A.TIF',24,NULL,22,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',75,'13572W_075_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_075_A.TIF',24,NULL,36,0,0,0,0,NULL),
 (1,16,'1','13572W',76,'13572W_076_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_076_A.TIF',24,NULL,36,0,0,0,0,NULL),
 (1,16,'1','13572W',77,'13572W_077_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_077_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','13572W',78,'13572W_078_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_078_A.TIF',24,NULL,4,0,0,0,0,NULL),
 (1,16,'1','13572W',79,'13572W_079_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_079_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','13572W',80,'13572W_080_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_080_A.TIF',24,NULL,51,0,0,0,0,NULL),
 (1,16,'1','13572W',81,'13572W_081_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_081_A.TIF',24,NULL,4,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',82,'13572W_082_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_082_A.TIF',24,NULL,11,0,0,0,0,NULL),
 (1,16,'1','13572W',83,'13572W_083_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_083_A.TIF',24,NULL,47,0,0,0,0,NULL),
 (1,16,'1','13572W',84,'13572W_084_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_084_A.TIF',24,NULL,4,0,0,0,0,NULL),
 (1,16,'1','13572W',85,'13572W_085_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_085_A.TIF',24,NULL,29,0,0,0,0,NULL),
 (1,16,'1','13572W',86,'13572W_086_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_086_A.TIF',24,NULL,11,0,0,0,0,NULL),
 (1,16,'1','13572W',87,'13572W_087_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_087_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','13572W',88,'13572W_088_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_088_A.TIF',24,NULL,9,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','13572W',89,'13572W_089_A.TIF','surajit','2021-01-05 15:40:59',NULL,NULL,'13572W_089_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','19890W',1,'19890W_001_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_001_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','19890W',2,'19890W_002_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_002_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','19890W',3,'19890W_003_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_003_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','19890W',4,'19890W_004_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_004_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','19890W',5,'19890W_005_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_005_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','19890W',6,'19890W_006_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_006_A.TIF',24,NULL,23,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',7,'19890W_007_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_007_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','19890W',8,'19890W_008_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_008_A.TIF',24,NULL,11,0,0,0,0,NULL),
 (1,16,'1','19890W',9,'19890W_009_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_009_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','19890W',10,'19890W_010_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_010_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','19890W',11,'19890W_011_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_011_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','19890W',12,'19890W_012_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_012_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','19890W',13,'19890W_013_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_013_A.TIF',24,NULL,19,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',14,'19890W_014_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_014_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','19890W',15,'19890W_015_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_015_A.TIF',24,NULL,128,0,0,0,0,NULL),
 (1,16,'1','19890W',16,'19890W_016_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_016_A.TIF',24,NULL,122,0,0,0,0,NULL),
 (1,16,'1','19890W',17,'19890W_017_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_017_A.TIF',24,NULL,11,0,0,0,0,NULL),
 (1,16,'1','19890W',18,'19890W_018_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_018_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','19890W',19,'19890W_019_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_019_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','19890W',20,'19890W_020_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_020_A.TIF',24,NULL,25,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',21,'19890W_021_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_021_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','19890W',22,'19890W_022_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_022_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','19890W',23,'19890W_023_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_023_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','19890W',24,'19890W_024_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_024_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','19890W',25,'19890W_025_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_025_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','19890W',26,'19890W_026_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_026_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','19890W',27,'19890W_027_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_027_A.TIF',24,NULL,26,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',28,'19890W_028_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_028_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','19890W',29,'19890W_029_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_029_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','19890W',30,'19890W_030_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_030_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','19890W',31,'19890W_031_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_031_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','19890W',32,'19890W_032_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_032_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','19890W',33,'19890W_033_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_033_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','19890W',34,'19890W_034_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_034_A.TIF',24,NULL,23,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',35,'19890W_035_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_035_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','19890W',36,'19890W_036_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_036_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','19890W',37,'19890W_037_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_037_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','19890W',38,'19890W_038_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_038_A.TIF',24,NULL,35,0,0,0,0,NULL),
 (1,16,'1','19890W',39,'19890W_039_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_039_A.TIF',24,NULL,40,0,0,0,0,NULL),
 (1,16,'1','19890W',40,'19890W_040_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_040_A.TIF',24,NULL,34,0,0,0,0,NULL),
 (1,16,'1','19890W',41,'19890W_041_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_041_A.TIF',24,NULL,29,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',42,'19890W_042_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_042_A.TIF',24,NULL,54,0,0,0,0,NULL),
 (1,16,'1','19890W',43,'19890W_043_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_043_A.TIF',24,NULL,57,0,0,0,0,NULL),
 (1,16,'1','19890W',44,'19890W_044_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_044_A.TIF',24,NULL,51,0,0,0,0,NULL),
 (1,16,'1','19890W',45,'19890W_045_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_045_A.TIF',24,NULL,43,0,0,0,0,NULL),
 (1,16,'1','19890W',46,'19890W_046_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_046_A.TIF',24,NULL,47,0,0,0,0,NULL),
 (1,16,'1','19890W',47,'19890W_047_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_047_A.TIF',24,NULL,43,0,0,0,0,NULL),
 (1,16,'1','19890W',48,'19890W_048_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_048_A.TIF',24,NULL,30,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',49,'19890W_049_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_049_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','19890W',50,'19890W_050_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_050_A.TIF',24,NULL,37,0,0,0,0,NULL),
 (1,16,'1','19890W',51,'19890W_051_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_051_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','19890W',52,'19890W_052_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_052_A.TIF',24,NULL,34,0,0,0,0,NULL),
 (1,16,'1','19890W',53,'19890W_053_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_053_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','19890W',54,'19890W_054_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_054_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','19890W',55,'19890W_055_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_055_A.TIF',24,NULL,16,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',56,'19890W_056_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_056_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','19890W',57,'19890W_057_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_057_A.TIF',24,NULL,39,0,0,0,0,NULL),
 (1,16,'1','19890W',58,'19890W_058_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_058_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','19890W',59,'19890W_059_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_059_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','19890W',60,'19890W_060_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_060_A.TIF',24,NULL,32,0,0,0,0,NULL),
 (1,16,'1','19890W',61,'19890W_061_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_061_A.TIF',24,NULL,55,0,0,0,0,NULL),
 (1,16,'1','19890W',62,'19890W_062_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_062_A.TIF',24,NULL,6,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',63,'19890W_063_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_063_A.TIF',24,NULL,13,0,0,0,0,NULL),
 (1,16,'1','19890W',64,'19890W_064_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_064_A.TIF',24,NULL,5,0,0,0,0,NULL),
 (1,16,'1','19890W',65,'19890W_065_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_065_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','19890W',66,'19890W_066_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_066_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','19890W',67,'19890W_067_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_067_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','19890W',68,'19890W_068_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_068_A.TIF',24,NULL,7,0,0,0,0,NULL),
 (1,16,'1','19890W',69,'19890W_069_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_069_A.TIF',24,NULL,16,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',70,'19890W_070_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_070_A.TIF',24,NULL,7,0,0,0,0,NULL),
 (1,16,'1','19890W',71,'19890W_071_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_071_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','19890W',72,'19890W_072_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_072_A.TIF',24,NULL,13,0,0,0,0,NULL),
 (1,16,'1','19890W',73,'19890W_073_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_073_A.TIF',24,NULL,36,0,0,0,0,NULL),
 (1,16,'1','19890W',74,'19890W_074_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_074_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','19890W',75,'19890W_075_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_075_A.TIF',24,NULL,35,0,0,0,0,NULL),
 (1,16,'1','19890W',76,'19890W_076_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_076_A.TIF',24,NULL,5,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',77,'19890W_077_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_077_A.TIF',24,NULL,4,0,0,0,0,NULL),
 (1,16,'1','19890W',78,'19890W_078_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_078_A.TIF',24,NULL,4,0,0,0,0,NULL),
 (1,16,'1','19890W',79,'19890W_079_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_079_A.TIF',24,NULL,5,0,0,0,0,NULL),
 (1,16,'1','19890W',80,'19890W_080_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_080_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','19890W',81,'19890W_081_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_081_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','19890W',82,'19890W_082_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_082_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','19890W',83,'19890W_083_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_083_A.TIF',24,NULL,20,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',84,'19890W_084_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_084_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','19890W',85,'19890W_085_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_085_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','19890W',86,'19890W_086_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_086_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','19890W',87,'19890W_087_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_087_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','19890W',88,'19890W_088_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_088_A.TIF',24,NULL,8,0,0,0,0,NULL),
 (1,16,'1','19890W',89,'19890W_089_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_089_A.TIF',24,NULL,8,0,0,0,0,NULL),
 (1,16,'1','19890W',90,'19890W_090_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_090_A.TIF',24,NULL,6,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',91,'19890W_091_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_091_A.TIF',24,NULL,11,0,0,0,0,NULL),
 (1,16,'1','19890W',92,'19890W_092_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_092_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','19890W',93,'19890W_093_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_093_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','19890W',94,'19890W_094_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_094_A.TIF',24,NULL,13,0,0,0,0,NULL),
 (1,16,'1','19890W',95,'19890W_095_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_095_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','19890W',96,'19890W_096_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_096_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','19890W',97,'19890W_097_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_097_A.TIF',24,NULL,24,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',98,'19890W_098_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_098_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','19890W',99,'19890W_099_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_099_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','19890W',100,'19890W_100_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_100_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','19890W',101,'19890W_101_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_101_A.TIF',24,NULL,30,0,0,0,0,NULL),
 (1,16,'1','19890W',102,'19890W_102_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_102_A.TIF',24,NULL,53,0,0,0,0,NULL),
 (1,16,'1','19890W',103,'19890W_103_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_103_A.TIF',24,NULL,57,0,0,0,0,NULL),
 (1,16,'1','19890W',104,'19890W_104_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_104_A.TIF',24,NULL,69,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',105,'19890W_105_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_105_A.TIF',24,NULL,51,0,0,0,0,NULL),
 (1,16,'1','19890W',106,'19890W_106_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_106_A.TIF',24,NULL,61,0,0,0,0,NULL),
 (1,16,'1','19890W',107,'19890W_107_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_107_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','19890W',108,'19890W_108_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_108_A.TIF',24,NULL,33,0,0,0,0,NULL),
 (1,16,'1','19890W',109,'19890W_109_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_109_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','19890W',110,'19890W_110_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_110_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','19890W',111,'19890W_111_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_111_A.TIF',24,NULL,25,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',112,'19890W_112_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_112_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','19890W',113,'19890W_113_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_113_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','19890W',114,'19890W_114_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_114_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','19890W',115,'19890W_115_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_115_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','19890W',116,'19890W_116_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_116_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','19890W',117,'19890W_117_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_117_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','19890W',118,'19890W_118_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_118_A.TIF',24,NULL,10,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',119,'19890W_119_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_119_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','19890W',120,'19890W_120_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_120_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','19890W',121,'19890W_121_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_121_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','19890W',122,'19890W_122_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_122_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','19890W',123,'19890W_123_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_123_A.TIF',24,NULL,5,0,0,0,0,NULL),
 (1,16,'1','19890W',124,'19890W_124_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_124_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','19890W',125,'19890W_125_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_125_A.TIF',24,NULL,36,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',126,'19890W_126_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_126_A.TIF',24,NULL,68,0,0,0,0,NULL),
 (1,16,'1','19890W',127,'19890W_127_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_127_A.TIF',24,NULL,8,0,0,0,0,NULL),
 (1,16,'1','19890W',128,'19890W_128_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_128_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','19890W',129,'19890W_129_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_129_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','19890W',130,'19890W_130_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_130_A.TIF',24,NULL,106,0,0,0,0,NULL),
 (1,16,'1','19890W',131,'19890W_131_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_131_A.TIF',24,NULL,12,0,0,0,0,NULL),
 (1,16,'1','19890W',132,'19890W_132_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_132_A.TIF',24,NULL,10,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',133,'19890W_133_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_133_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','19890W',134,'19890W_134_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_134_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','19890W',135,'19890W_135_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_135_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','19890W',136,'19890W_136_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_136_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','19890W',137,'19890W_137_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_137_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','19890W',138,'19890W_138_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_138_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','19890W',139,'19890W_139_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_139_A.TIF',24,NULL,18,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',140,'19890W_140_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_140_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','19890W',141,'19890W_141_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_141_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','19890W',142,'19890W_142_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_142_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','19890W',143,'19890W_143_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_143_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','19890W',144,'19890W_144_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_144_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','19890W',145,'19890W_145_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_145_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','19890W',146,'19890W_146_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_146_A.TIF',24,NULL,22,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',147,'19890W_147_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_147_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','19890W',148,'19890W_148_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_148_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','19890W',149,'19890W_149_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_149_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','19890W',150,'19890W_150_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_150_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','19890W',151,'19890W_151_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_151_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','19890W',152,'19890W_152_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_152_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','19890W',153,'19890W_153_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_153_A.TIF',24,NULL,19,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',154,'19890W_154_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_154_A.TIF',24,NULL,11,0,0,0,0,NULL),
 (1,16,'1','19890W',155,'19890W_155_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_155_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','19890W',156,'19890W_156_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_156_A.TIF',24,NULL,8,0,0,0,0,NULL),
 (1,16,'1','19890W',157,'19890W_157_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_157_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','19890W',158,'19890W_158_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_158_A.TIF',24,NULL,37,0,0,0,0,NULL),
 (1,16,'1','19890W',159,'19890W_159_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_159_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','19890W',160,'19890W_160_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_160_A.TIF',24,NULL,11,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',161,'19890W_161_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_161_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','19890W',162,'19890W_162_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_162_A.TIF',24,NULL,30,0,0,0,0,NULL),
 (1,16,'1','19890W',163,'19890W_163_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_163_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','19890W',164,'19890W_164_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_164_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','19890W',165,'19890W_165_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_165_A.TIF',24,NULL,29,0,0,0,0,NULL),
 (1,16,'1','19890W',166,'19890W_166_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_166_A.TIF',24,NULL,29,0,0,0,0,NULL),
 (1,16,'1','19890W',167,'19890W_167_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_167_A.TIF',24,NULL,26,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',168,'19890W_168_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_168_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','19890W',169,'19890W_169_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_169_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','19890W',170,'19890W_170_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_170_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','19890W',171,'19890W_171_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_171_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','19890W',172,'19890W_172_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_172_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','19890W',173,'19890W_173_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_173_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','19890W',174,'19890W_174_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_174_A.TIF',24,NULL,25,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',175,'19890W_175_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_175_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','19890W',176,'19890W_176_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_176_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','19890W',177,'19890W_177_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_177_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','19890W',178,'19890W_178_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_178_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','19890W',179,'19890W_179_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_179_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','19890W',180,'19890W_180_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_180_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','19890W',181,'19890W_181_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_181_A.TIF',24,NULL,15,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',182,'19890W_182_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_182_A.TIF',24,NULL,11,0,0,0,0,NULL),
 (1,16,'1','19890W',183,'19890W_183_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_183_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','19890W',184,'19890W_184_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_184_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','19890W',185,'19890W_185_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_185_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','19890W',186,'19890W_186_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_186_A.TIF',24,NULL,33,0,0,0,0,NULL),
 (1,16,'1','19890W',187,'19890W_187_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_187_A.TIF',24,NULL,33,0,0,0,0,NULL),
 (1,16,'1','19890W',188,'19890W_188_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_188_A.TIF',24,NULL,25,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','19890W',189,'19890W_189_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_189_A.TIF',24,NULL,13,0,0,0,0,NULL),
 (1,16,'1','19890W',190,'19890W_190_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_190_A.TIF',24,NULL,32,0,0,0,0,NULL),
 (1,16,'1','19890W',191,'19890W_191_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_191_A.TIF',24,NULL,13,0,0,0,0,NULL),
 (1,16,'1','19890W',192,'19890W_192_A.TIF','surajit','2021-01-05 15:46:50',NULL,NULL,'19890W_192_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','25200W',1,'25200W_001_A.TIF','surajit','2021-01-05 16:20:50',NULL,NULL,'25200W_001_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','8070W',1,'8070W_001_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_001_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','8070W',2,'8070W_002_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_002_A.TIF',24,NULL,15,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8070W',3,'8070W_003_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_003_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','8070W',4,'8070W_004_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_004_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','8070W',5,'8070W_005_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_005_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','8070W',6,'8070W_006_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_006_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','8070W',7,'8070W_007_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_007_A.TIF',24,NULL,7,0,0,0,0,NULL),
 (1,16,'1','8070W',8,'8070W_008_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_008_A.TIF',24,NULL,199,0,0,0,0,NULL),
 (1,16,'1','8070W',9,'8070W_009_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_009_A.TIF',24,NULL,76,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8070W',10,'8070W_010_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_010_A.TIF',24,NULL,11,0,0,0,0,NULL),
 (1,16,'1','8070W',11,'8070W_011_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_011_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','8070W',12,'8070W_012_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_012_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','8070W',13,'8070W_013_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_013_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','8070W',14,'8070W_014_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_014_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','8070W',15,'8070W_015_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_015_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','8070W',16,'8070W_016_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_016_A.TIF',24,NULL,19,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8070W',17,'8070W_017_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_017_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','8070W',18,'8070W_018_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_018_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','8070W',19,'8070W_019_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_019_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','8070W',20,'8070W_020_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_020_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','8070W',21,'8070W_021_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_021_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','8070W',22,'8070W_022_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_022_A.TIF',24,NULL,7,0,0,0,0,NULL),
 (1,16,'1','8070W',23,'8070W_023_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_023_A.TIF',24,NULL,32,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8070W',24,'8070W_024_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_024_A.TIF',24,NULL,114,0,0,0,0,NULL),
 (1,16,'1','8070W',25,'8070W_025_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_025_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','8070W',26,'8070W_026_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_026_A.TIF',24,NULL,68,0,0,0,0,NULL),
 (1,16,'1','8070W',27,'8070W_027_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_027_A.TIF',24,NULL,42,0,0,0,0,NULL),
 (1,16,'1','8070W',28,'8070W_028_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_028_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','8070W',29,'8070W_029_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_029_A.TIF',24,NULL,54,0,0,0,0,NULL),
 (1,16,'1','8070W',30,'8070W_030_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_030_A.TIF',24,NULL,78,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8070W',31,'8070W_031_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_031_A.TIF',24,NULL,54,0,0,0,0,NULL),
 (1,16,'1','8070W',32,'8070W_032_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_032_A.TIF',24,NULL,74,0,0,0,0,NULL),
 (1,16,'1','8070W',33,'8070W_033_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_033_A.TIF',24,NULL,50,0,0,0,0,NULL),
 (1,16,'1','8070W',34,'8070W_034_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_034_A.TIF',24,NULL,76,0,0,0,0,NULL),
 (1,16,'1','8070W',35,'8070W_035_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_035_A.TIF',24,NULL,59,0,0,0,0,NULL),
 (1,16,'1','8070W',36,'8070W_036_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_036_A.TIF',24,NULL,94,0,0,0,0,NULL),
 (1,16,'1','8070W',37,'8070W_037_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_037_A.TIF',24,NULL,52,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8070W',38,'8070W_038_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_038_A.TIF',24,NULL,80,0,0,0,0,NULL),
 (1,16,'1','8070W',39,'8070W_039_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_039_A.TIF',24,NULL,50,0,0,0,0,NULL),
 (1,16,'1','8070W',40,'8070W_040_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_040_A.TIF',24,NULL,75,0,0,0,0,NULL),
 (1,16,'1','8070W',41,'8070W_041_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_041_A.TIF',24,NULL,77,0,0,0,0,NULL),
 (1,16,'1','8070W',42,'8070W_042_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_042_A.TIF',24,NULL,53,0,0,0,0,NULL),
 (1,16,'1','8070W',43,'8070W_043_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_043_A.TIF',24,NULL,73,0,0,0,0,NULL),
 (1,16,'1','8070W',44,'8070W_044_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_044_A.TIF',24,NULL,49,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8070W',45,'8070W_045_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_045_A.TIF',24,NULL,80,0,0,0,0,NULL),
 (1,16,'1','8070W',46,'8070W_046_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_046_A.TIF',24,NULL,49,0,0,0,0,NULL),
 (1,16,'1','8070W',47,'8070W_047_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_047_A.TIF',24,NULL,76,0,0,0,0,NULL),
 (1,16,'1','8070W',48,'8070W_048_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_048_A.TIF',24,NULL,53,0,0,0,0,NULL),
 (1,16,'1','8070W',49,'8070W_049_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_049_A.TIF',24,NULL,91,0,0,0,0,NULL),
 (1,16,'1','8070W',50,'8070W_050_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_050_A.TIF',24,NULL,46,0,0,0,0,NULL),
 (1,16,'1','8070W',51,'8070W_051_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_051_A.TIF',24,NULL,83,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8070W',52,'8070W_052_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_052_A.TIF',24,NULL,46,0,0,0,0,NULL),
 (1,16,'1','8070W',53,'8070W_053_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_053_A.TIF',24,NULL,65,0,0,0,0,NULL),
 (1,16,'1','8070W',54,'8070W_054_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_054_A.TIF',24,NULL,124,0,0,0,0,NULL),
 (1,16,'1','8070W',55,'8070W_055_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_055_A.TIF',24,NULL,34,0,0,0,0,NULL),
 (1,16,'1','8070W',56,'8070W_056_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_056_A.TIF',24,NULL,34,0,0,0,0,NULL),
 (1,16,'1','8070W',57,'8070W_057_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_057_A.TIF',24,NULL,140,0,0,0,0,NULL),
 (1,16,'1','8070W',58,'8070W_058_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_058_A.TIF',24,NULL,47,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8070W',59,'8070W_059_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_059_A.TIF',24,NULL,29,0,0,0,0,NULL),
 (1,16,'1','8070W',60,'8070W_060_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_060_A.TIF',24,NULL,53,0,0,0,0,NULL),
 (1,16,'1','8070W',61,'8070W_061_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_061_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','8070W',62,'8070W_062_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_062_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','8070W',63,'8070W_063_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_063_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','8070W',64,'8070W_064_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_064_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','8070W',65,'8070W_065_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_065_A.TIF',24,NULL,42,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8070W',66,'8070W_066_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_066_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','8070W',67,'8070W_067_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_067_A.TIF',24,NULL,35,0,0,0,0,NULL),
 (1,16,'1','8070W',68,'8070W_068_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_068_A.TIF',24,NULL,43,0,0,0,0,NULL),
 (1,16,'1','8070W',69,'8070W_069_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_069_A.TIF',24,NULL,13,0,0,0,0,NULL),
 (1,16,'1','8070W',70,'8070W_070_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_070_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','8070W',71,'8070W_071_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_071_A.TIF',24,NULL,12,0,0,0,0,NULL),
 (1,16,'1','8070W',72,'8070W_072_A.TIF','surajit','2021-01-05 12:43:50',NULL,NULL,'8070W_072_A.TIF',24,NULL,19,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8466W',1,'8466W_001_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_001_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','8466W',2,'8466W_002_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_002_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','8466W',3,'8466W_003_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_003_A.TIF',24,NULL,12,0,0,0,0,NULL),
 (1,16,'1','8466W',4,'8466W_004_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_004_A.TIF',24,NULL,8,0,0,0,0,NULL),
 (1,16,'1','8466W',5,'8466W_005_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_005_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','8466W',6,'8466W_006_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_006_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','8466W',7,'8466W_007_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_007_A.TIF',24,NULL,15,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8466W',8,'8466W_008_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_008_A.TIF',24,NULL,7,0,0,0,0,NULL),
 (1,16,'1','8466W',9,'8466W_009_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_009_A.TIF',24,NULL,153,0,0,0,0,NULL),
 (1,16,'1','8466W',10,'8466W_010_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_010_A.TIF',24,NULL,93,0,0,0,0,NULL),
 (1,16,'1','8466W',11,'8466W_011_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_011_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','8466W',12,'8466W_012_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_012_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','8466W',13,'8466W_013_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_013_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','8466W',14,'8466W_014_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_014_A.TIF',24,NULL,17,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8466W',15,'8466W_015_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_015_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','8466W',16,'8466W_016_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_016_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','8466W',17,'8466W_017_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_017_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','8466W',18,'8466W_018_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_018_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','8466W',19,'8466W_019_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_019_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','8466W',20,'8466W_020_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_020_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','8466W',21,'8466W_021_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_021_A.TIF',24,NULL,16,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8466W',22,'8466W_022_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_022_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','8466W',23,'8466W_023_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_023_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','8466W',24,'8466W_024_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_024_A.TIF',24,NULL,29,0,0,0,0,NULL),
 (1,16,'1','8466W',25,'8466W_025_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_025_A.TIF',24,NULL,57,0,0,0,0,NULL),
 (1,16,'1','8466W',26,'8466W_026_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_026_A.TIF',24,NULL,44,0,0,0,0,NULL),
 (1,16,'1','8466W',27,'8466W_027_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_027_A.TIF',24,NULL,52,0,0,0,0,NULL),
 (1,16,'1','8466W',28,'8466W_028_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_028_A.TIF',24,NULL,44,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8466W',29,'8466W_029_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_029_A.TIF',24,NULL,51,0,0,0,0,NULL),
 (1,16,'1','8466W',30,'8466W_030_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_030_A.TIF',24,NULL,41,0,0,0,0,NULL),
 (1,16,'1','8466W',31,'8466W_031_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_031_A.TIF',24,NULL,46,0,0,0,0,NULL),
 (1,16,'1','8466W',32,'8466W_032_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_032_A.TIF',24,NULL,56,0,0,0,0,NULL),
 (1,16,'1','8466W',33,'8466W_033_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_033_A.TIF',24,NULL,44,0,0,0,0,NULL),
 (1,16,'1','8466W',34,'8466W_034_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_034_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','8466W',35,'8466W_035_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_035_A.TIF',24,NULL,7,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8466W',36,'8466W_036_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_036_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','8466W',37,'8466W_037_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_037_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','8466W',38,'8466W_038_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_038_A.TIF',24,NULL,30,0,0,0,0,NULL),
 (1,16,'1','8466W',39,'8466W_039_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_039_A.TIF',24,NULL,9,0,0,0,0,NULL),
 (1,16,'1','8466W',40,'8466W_040_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_040_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','8466W',41,'8466W_041_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_041_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','8466W',42,'8466W_042_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_042_A.TIF',24,NULL,31,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','8466W',43,'8466W_043_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_043_A.TIF',24,NULL,37,0,0,0,0,NULL),
 (1,16,'1','8466W',44,'8466W_044_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_044_A.TIF',24,NULL,4,0,0,0,0,NULL),
 (1,16,'1','8466W',45,'8466W_045_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_045_A.TIF',24,NULL,45,0,0,0,0,NULL),
 (1,16,'1','8466W',46,'8466W_046_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_046_A.TIF',24,NULL,3,0,0,0,0,NULL),
 (1,16,'1','8466W',47,'8466W_047_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_047_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','8466W',48,'8466W_048_A.TIF','surajit','2021-01-05 14:03:35',NULL,NULL,'8466W_048_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','9419W',1,'9419W_001_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_001_A.TIF',24,NULL,10,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',2,'9419W_002_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_002_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','9419W',3,'9419W_003_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_003_A.TIF',24,NULL,12,0,0,0,0,NULL),
 (1,16,'1','9419W',4,'9419W_004_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_004_A.TIF',24,NULL,30,0,0,0,0,NULL),
 (1,16,'1','9419W',5,'9419W_005_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_005_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','9419W',6,'9419W_006_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_006_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','9419W',7,'9419W_007_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_007_A.TIF',24,NULL,8,0,0,0,0,NULL),
 (1,16,'1','9419W',8,'9419W_008_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_008_A.TIF',24,NULL,20,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',9,'9419W_009_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_009_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','9419W',10,'9419W_010_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_010_A.TIF',24,NULL,129,0,0,0,0,NULL),
 (1,16,'1','9419W',11,'9419W_011_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_011_A.TIF',24,NULL,117,0,0,0,0,NULL),
 (1,16,'1','9419W',12,'9419W_012_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_012_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','9419W',13,'9419W_013_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_013_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','9419W',14,'9419W_014_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_014_A.TIF',24,NULL,12,0,0,0,0,NULL),
 (1,16,'1','9419W',15,'9419W_015_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_015_A.TIF',24,NULL,19,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',16,'9419W_016_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_016_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','9419W',17,'9419W_017_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_017_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',18,'9419W_018_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_018_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','9419W',19,'9419W_019_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_019_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','9419W',20,'9419W_020_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_020_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','9419W',21,'9419W_021_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_021_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',22,'9419W_022_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_022_A.TIF',24,NULL,24,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',23,'9419W_023_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_023_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','9419W',24,'9419W_024_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_024_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','9419W',25,'9419W_025_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_025_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','9419W',26,'9419W_026_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_026_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',27,'9419W_027_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_027_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','9419W',28,'9419W_028_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_028_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','9419W',29,'9419W_029_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_029_A.TIF',24,NULL,18,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',30,'9419W_030_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_030_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','9419W',31,'9419W_031_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_031_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','9419W',32,'9419W_032_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_032_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','9419W',33,'9419W_033_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_033_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','9419W',34,'9419W_034_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_034_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','9419W',35,'9419W_035_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_035_A.TIF',24,NULL,40,0,0,0,0,NULL),
 (1,16,'1','9419W',36,'9419W_036_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_036_A.TIF',24,NULL,32,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',37,'9419W_037_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_037_A.TIF',24,NULL,33,0,0,0,0,NULL),
 (1,16,'1','9419W',38,'9419W_038_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_038_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','9419W',39,'9419W_039_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_039_A.TIF',24,NULL,33,0,0,0,0,NULL),
 (1,16,'1','9419W',40,'9419W_040_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_040_A.TIF',24,NULL,42,0,0,0,0,NULL),
 (1,16,'1','9419W',41,'9419W_041_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_041_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','9419W',42,'9419W_042_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_042_A.TIF',24,NULL,36,0,0,0,0,NULL),
 (1,16,'1','9419W',43,'9419W_043_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_043_A.TIF',24,NULL,33,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',44,'9419W_044_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_044_A.TIF',24,NULL,32,0,0,0,0,NULL),
 (1,16,'1','9419W',45,'9419W_045_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_045_A.TIF',24,NULL,46,0,0,0,0,NULL),
 (1,16,'1','9419W',46,'9419W_046_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_046_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',47,'9419W_047_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_047_A.TIF',24,NULL,35,0,0,0,0,NULL),
 (1,16,'1','9419W',48,'9419W_048_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_048_A.TIF',24,NULL,62,0,0,0,0,NULL),
 (1,16,'1','9419W',49,'9419W_049_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_049_A.TIF',24,NULL,45,0,0,0,0,NULL),
 (1,16,'1','9419W',50,'9419W_050_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_050_A.TIF',24,NULL,28,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',51,'9419W_051_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_051_A.TIF',24,NULL,44,0,0,0,0,NULL),
 (1,16,'1','9419W',52,'9419W_052_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_052_A.TIF',24,NULL,29,0,0,0,0,NULL),
 (1,16,'1','9419W',53,'9419W_053_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_053_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','9419W',54,'9419W_054_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_054_A.TIF',24,NULL,46,0,0,0,0,NULL),
 (1,16,'1','9419W',55,'9419W_055_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_055_A.TIF',24,NULL,43,0,0,0,0,NULL),
 (1,16,'1','9419W',56,'9419W_056_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_056_A.TIF',24,NULL,33,0,0,0,0,NULL),
 (1,16,'1','9419W',57,'9419W_057_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_057_A.TIF',24,NULL,25,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',58,'9419W_058_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_058_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','9419W',59,'9419W_059_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_059_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','9419W',60,'9419W_060_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_060_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','9419W',61,'9419W_061_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_061_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',62,'9419W_062_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_062_A.TIF',24,NULL,32,0,0,0,0,NULL),
 (1,16,'1','9419W',63,'9419W_063_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_063_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','9419W',64,'9419W_064_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_064_A.TIF',24,NULL,57,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',65,'9419W_065_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_065_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','9419W',66,'9419W_066_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_066_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',67,'9419W_067_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_067_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','9419W',68,'9419W_068_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_068_A.TIF',24,NULL,47,0,0,0,0,NULL),
 (1,16,'1','9419W',69,'9419W_069_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_069_A.TIF',24,NULL,47,0,0,0,0,NULL),
 (1,16,'1','9419W',70,'9419W_070_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_070_A.TIF',24,NULL,46,0,0,0,0,NULL),
 (1,16,'1','9419W',71,'9419W_071_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_071_A.TIF',24,NULL,27,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',72,'9419W_072_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_072_A.TIF',24,NULL,57,0,0,0,0,NULL),
 (1,16,'1','9419W',73,'9419W_073_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_073_A.TIF',24,NULL,6,0,0,0,0,NULL),
 (1,16,'1','9419W',74,'9419W_074_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_074_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','9419W',75,'9419W_075_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_075_A.TIF',24,NULL,35,0,0,0,0,NULL),
 (1,16,'1','9419W',76,'9419W_076_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_076_A.TIF',24,NULL,32,0,0,0,0,NULL),
 (1,16,'1','9419W',77,'9419W_077_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_077_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','9419W',78,'9419W_078_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_078_A.TIF',24,NULL,30,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',79,'9419W_079_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_079_A.TIF',24,NULL,8,0,0,0,0,NULL),
 (1,16,'1','9419W',80,'9419W_080_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_080_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','9419W',81,'9419W_081_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_081_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','9419W',82,'9419W_082_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_082_A.TIF',24,NULL,10,0,0,0,0,NULL),
 (1,16,'1','9419W',83,'9419W_083_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_083_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','9419W',84,'9419W_084_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_084_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','9419W',85,'9419W_085_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_085_A.TIF',24,NULL,12,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',86,'9419W_086_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_086_A.TIF',24,NULL,11,0,0,0,0,NULL),
 (1,16,'1','9419W',87,'9419W_087_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_087_A.TIF',24,NULL,14,0,0,0,0,NULL),
 (1,16,'1','9419W',88,'9419W_088_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_088_A.TIF',24,NULL,13,0,0,0,0,NULL),
 (1,16,'1','9419W',89,'9419W_089_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_089_A.TIF',24,NULL,18,0,0,0,0,NULL),
 (1,16,'1','9419W',90,'9419W_090_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_090_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','9419W',91,'9419W_091_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_091_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','9419W',92,'9419W_092_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_092_A.TIF',24,NULL,23,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',93,'9419W_093_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_093_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',94,'9419W_094_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_094_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','9419W',95,'9419W_095_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_095_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',96,'9419W_096_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_096_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',97,'9419W_097_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_097_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','9419W',98,'9419W_098_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_098_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','9419W',99,'9419W_099_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_099_A.TIF',24,NULL,21,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',100,'9419W_100_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_100_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','9419W',101,'9419W_101_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_101_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','9419W',102,'9419W_102_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_102_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','9419W',103,'9419W_103_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_103_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','9419W',104,'9419W_104_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_104_A.TIF',24,NULL,17,0,0,0,0,NULL),
 (1,16,'1','9419W',105,'9419W_105_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_105_A.TIF',24,NULL,19,0,0,0,0,NULL),
 (1,16,'1','9419W',106,'9419W_106_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_106_A.TIF',24,NULL,22,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',107,'9419W_107_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_107_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','9419W',108,'9419W_108_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_108_A.TIF',24,NULL,13,0,0,0,0,NULL),
 (1,16,'1','9419W',109,'9419W_109_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_109_A.TIF',24,NULL,16,0,0,0,0,NULL),
 (1,16,'1','9419W',110,'9419W_110_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_110_A.TIF',24,NULL,12,0,0,0,0,NULL),
 (1,16,'1','9419W',111,'9419W_111_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_111_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',112,'9419W_112_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_112_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','9419W',113,'9419W_113_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_113_A.TIF',24,NULL,33,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',114,'9419W_114_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_114_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','9419W',115,'9419W_115_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_115_A.TIF',24,NULL,33,0,0,0,0,NULL),
 (1,16,'1','9419W',116,'9419W_116_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_116_A.TIF',24,NULL,28,0,0,0,0,NULL),
 (1,16,'1','9419W',117,'9419W_117_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_117_A.TIF',24,NULL,33,0,0,0,0,NULL),
 (1,16,'1','9419W',118,'9419W_118_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_118_A.TIF',24,NULL,38,0,0,0,0,NULL),
 (1,16,'1','9419W',119,'9419W_119_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_119_A.TIF',24,NULL,24,0,0,0,0,NULL),
 (1,16,'1','9419W',120,'9419W_120_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_120_A.TIF',24,NULL,32,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',121,'9419W_121_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_121_A.TIF',24,NULL,33,0,0,0,0,NULL),
 (1,16,'1','9419W',122,'9419W_122_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_122_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','9419W',123,'9419W_123_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_123_A.TIF',24,NULL,43,0,0,0,0,NULL),
 (1,16,'1','9419W',124,'9419W_124_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_124_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',125,'9419W_125_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_125_A.TIF',24,NULL,31,0,0,0,0,NULL),
 (1,16,'1','9419W',126,'9419W_126_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_126_A.TIF',24,NULL,55,0,0,0,0,NULL),
 (1,16,'1','9419W',127,'9419W_127_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_127_A.TIF',24,NULL,45,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',128,'9419W_128_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_128_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','9419W',129,'9419W_129_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_129_A.TIF',24,NULL,39,0,0,0,0,NULL),
 (1,16,'1','9419W',130,'9419W_130_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_130_A.TIF',24,NULL,29,0,0,0,0,NULL),
 (1,16,'1','9419W',131,'9419W_131_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_131_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','9419W',132,'9419W_132_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_132_A.TIF',24,NULL,43,0,0,0,0,NULL),
 (1,16,'1','9419W',133,'9419W_133_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_133_A.TIF',24,NULL,43,0,0,0,0,NULL),
 (1,16,'1','9419W',134,'9419W_134_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_134_A.TIF',24,NULL,29,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',135,'9419W_135_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_135_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','9419W',136,'9419W_136_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_136_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','9419W',137,'9419W_137_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_137_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','9419W',138,'9419W_138_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_138_A.TIF',24,NULL,23,0,0,0,0,NULL),
 (1,16,'1','9419W',139,'9419W_139_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_139_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',140,'9419W_140_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_140_A.TIF',24,NULL,29,0,0,0,0,NULL),
 (1,16,'1','9419W',141,'9419W_141_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_141_A.TIF',24,NULL,14,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',142,'9419W_142_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_142_A.TIF',24,NULL,55,0,0,0,0,NULL),
 (1,16,'1','9419W',143,'9419W_143_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_143_A.TIF',24,NULL,20,0,0,0,0,NULL),
 (1,16,'1','9419W',144,'9419W_144_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_144_A.TIF',24,NULL,22,0,0,0,0,NULL),
 (1,16,'1','9419W',145,'9419W_145_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_145_A.TIF',24,NULL,21,0,0,0,0,NULL),
 (1,16,'1','9419W',146,'9419W_146_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_146_A.TIF',24,NULL,47,0,0,0,0,NULL),
 (1,16,'1','9419W',147,'9419W_147_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_147_A.TIF',24,NULL,46,0,0,0,0,NULL),
 (1,16,'1','9419W',148,'9419W_148_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_148_A.TIF',24,NULL,46,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',149,'9419W_149_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_149_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','9419W',150,'9419W_150_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_150_A.TIF',24,NULL,15,0,0,0,0,NULL),
 (1,16,'1','9419W',151,'9419W_151_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_151_A.TIF',24,NULL,25,0,0,0,0,NULL),
 (1,16,'1','9419W',152,'9419W_152_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_152_A.TIF',24,NULL,32,0,0,0,0,NULL),
 (1,16,'1','9419W',153,'9419W_153_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_153_A.TIF',24,NULL,26,0,0,0,0,NULL),
 (1,16,'1','9419W',154,'9419W_154_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_154_A.TIF',24,NULL,27,0,0,0,0,NULL),
 (1,16,'1','9419W',155,'9419W_155_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_155_A.TIF',24,NULL,7,0,0,0,0,NULL);
INSERT INTO `image_master` (`proj_key`,`batch_key`,`box_number`,`policy_number`,`serial_no`,`page_index_name`,`created_by`,`created_dttm`,`modified_by`,`modified_dttm`,`Page_name`,`status`,`Doc_Type`,`SCanned_size`,`QC_size`,`fqc_size`,`index_size`,`Photo`,`Image_seq`) VALUES 
 (1,16,'1','9419W',156,'9419W_156_A.TIF','surajit','2021-01-05 14:43:45',NULL,NULL,'9419W_156_A.TIF',24,NULL,19,0,0,0,0,NULL);
/*!40000 ALTER TABLE `image_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`judge_master`
--

DROP TABLE IF EXISTS `judge_master`;
CREATE TABLE `judge_master` (
  `judge_id` int(50) NOT NULL AUTO_INCREMENT,
  `judge_designation` varchar(50) DEFAULT NULL,
  `judge_name` varchar(50) NOT NULL,
  PRIMARY KEY (`judge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`judge_master`
--

/*!40000 ALTER TABLE `judge_master` DISABLE KEYS */;
INSERT INTO `judge_master` (`judge_id`,`judge_designation`,`judge_name`) VALUES 
 (1,'JUSTICE','A. K. SENGUPTA'),
 (2,'JUSTICE','A.K. DE'),
 (3,'JUSTICE','A.K. DUTTA'),
 (4,'JUSTICE','A.M. BHATTACHARJEE'),
 (5,'JUSTICE','ABHIJIT GANGOPADHYAY'),
 (6,'JUSTICE','ALOK KUMAR BASU'),
 (7,'JUSTICE','ALOKE CHAKRABARTI'),
 (8,'JUSTICE','ALTAMAS KABIR'),
 (9,'JUSTICE','AMIT TALUKDAR'),
 (10,'JUSTICE','AMITABHA CHATTERJEE'),
 (11,'JUSTICE','AMITAVA LALA'),
 (12,'JUSTICE','AMRITA SINHA'),
 (13,'JUSTICE','ANINDITA ROY SARASWATI'),
 (14,'JUSTICE','ARIJIT BANERJEE'),
 (15,'JUSTICE','ARINDAM MUKHERJEE'),
 (16,'JUSTICE','ARINDAM SINHA'),
 (17,'JUSTICE','ARUN KUMAR BHATTACHARYA'),
 (18,'JUSTICE','ARUN KUMAR MITRA'),
 (19,'JUSTICE','ARUNABHA BARUA'),
 (20,'JUSTICE','ARUNABHA BASU'),
 (21,'JUSTICE','ASHA ARORA'),
 (22,'JUSTICE','ASHIM KUMAR BANERJEE'),
 (23,'JUSTICE','ASHIM KUMAR ROY'),
 (24,'JUSTICE','ASHIS KUMAR CHAKRABORTY'),
 (25,'JUSTICE','ASHOKE KUMAR DASADHIKARI'),
 (26,'JUSTICE','ASIM KR. MONDAL'),
 (27,'JUSTICE','ASIM KUMAR RAY');
INSERT INTO `judge_master` (`judge_id`,`judge_designation`,`judge_name`) VALUES 
 (28,'JUSTICE','ASIT KUMAR BISI'),
 (29,'JUSTICE','B.M. MITRA'),
 (30,'JUSTICE','B.P. BANERJEE'),
 (31,'JUSTICE','BARIN GHOSH'),
 (32,'JUSTICE','BASUDEV PANIGRAHI'),
 (33,'JUSTICE','BASUDEV PANIGRAHI'),
 (34,'JUSTICE','BHASKAR BHATTACHARYA'),
 (35,'JUSTICE','BIBEK CHAUDHURI'),
 (36,'JUSTICE','BISWAJIT BASU'),
 (37,'JUSTICE','BISWANATH SOMADDER'),
 (38,'JUSTICE','C. S. KARNAN'),
 (39,'JUSTICE','D.P.KUNDU'),
 (40,'JUSTICE','DEBANGSU BASAK'),
 (41,'JUSTICE','DEBASISH KAR GUPTA'),
 (42,'JUSTICE','DEBI PROSAD DEY'),
 (43,'JUSTICE','DEBIPRASAD SENGUPTA'),
 (44,'JUSTICE','DILIP KUMAR SETH'),
 (45,'JUSTICE','DIPAK KUMAR SEN'),
 (46,'JUSTICE','DIPAK SAHA RAY'),
 (47,'JUSTICE','DIPANKAR DATTA'),
 (48,'JUSTICE','DR. SAMBUDDHA CHAKRABARTI'),
 (49,'JUSTICE','G. C. GANGULY'),
 (50,'JUSTICE','G. R. BHATTACHARJEE'),
 (51,'JUSTICE','G.C.DE'),
 (52,'JUSTICE','GANGULY'),
 (53,'JUSTICE','GIRISH CHANDRA GUPTA'),
 (54,'JUSTICE','HARISH TANDON'),
 (55,'JUSTICE','HRISHIKESH BANERJI');
INSERT INTO `judge_master` (`judge_id`,`judge_designation`,`judge_name`) VALUES 
 (56,'JUSTICE','I. P. MUKERJI'),
 (57,'JUSTICE','INDIRA BANERJEE'),
 (58,'JUSTICE','INDRAJIT CHATTERJEE'),
 (59,'JUSTICE','ISHAN CHANDRA DAS'),
 (60,'JUSTICE','J. NAG'),
 (61,'JUSTICE','JAY SENGUPTA'),
 (62,'JUSTICE','JAYANTA KUMAR BISWAS'),
 (63,'JUSTICE','JOYMALYA BAGCHI'),
 (64,'JUSTICE','JOYTOSH BANERJEE'),
 (65,'JUSTICE','JYOTIRMAY BHATTACHARYA'),
 (66,'JUSTICE','K. M. YUSUF'),
 (67,'JUSTICE','KALIDAS MUKHERJEE'),
 (68,'JUSTICE','KALYAN JYOTI SENGUPTA'),
 (69,'JUSTICE','KANCHAN CHAKRABORTY'),
 (70,'JUSTICE','KANWALJIT SINGH AHLUWALIA'),
 (71,'JUSTICE','KISHORE KUMAR PRASAD'),
 (72,'JUSTICE','M. G. MUKHERJEE'),
 (73,'JUSTICE','M.H.S.ANSARI'),
 (74,'JUSTICE','MADHUMATI MITRA'),
 (75,'JUSTICE','MAHARAJ SINHA'),
 (76,'JUSTICE','MAHITOSH MAJUMDAR'),
 (77,'JUSTICE','MALAY KUMAR BASU'),
 (78,'JUSTICE','MALAY MARUT BANERJEE'),
 (79,'JUSTICE','MANIK MOHAN SARKAR'),
 (80,'JUSTICE','MD. ABDUL GHANI'),
 (81,'JUSTICE','MD. MUMTAZ KHAN'),
 (82,'JUSTICE','MIR DARA SHEKO');
INSERT INTO `judge_master` (`judge_id`,`judge_designation`,`judge_name`) VALUES 
 (83,'JUSTICE','MOLOY SENGUPTA'),
 (84,'JUSTICE','MONORANJAN MALLICK'),
 (85,'JUSTICE','MOUSHUMI BHATTACHARYA'),
 (86,'JUSTICE','MR.ASHOK KUMAR MATHUR'),
 (87,'JUSTICE','MRINAL KANTI CHAUDHURI'),
 (88,'JUSTICE','MRINAL KANTI SINHA'),
 (89,'JUSTICE','MUKUL GOPAL MUKHERJEE'),
 (90,'JUSTICE','MURARI PRASAD SHRIVASTAVA'),
 (91,'JUSTICE','N. K. MITRA'),
 (92,'JUSTICE','N. N. BHATTARJEE'),
 (93,'JUSTICE','NADIRA PATHERIA'),
 (94,'JUSTICE','NARAYAN CHANDRA SIL'),
 (95,'JUSTICE','NISHITA MHATRE'),
 (96,'JUSTICE','NURE ALAM CHOWDHURY'),
 (97,'JUSTICE','P.K DEB'),
 (98,'CHIEF JUSTICE','MANJULA CHELLUR,C.J.'),
 (99,'JUSTICE','ANIRUDDHA BOSE'),
 (100,'JUSTICE','SOUMITRA PAL'),
 (101,'JUSTICE','PATHERYA'),
 (102,'CHIEF JUSTICE','ARUN MISHRA'),
 (103,'JUSTICE','PRANAB KUMAR CHATTOPADHYAYA'),
 (104,'JUSTICE','TARUN KUMAR DAS'),
 (105,'CHIEF JUSTICE','J. N. PATEL'),
 (106,'JUSTICE','PRASANJIT MANDAL'),
 (107,'JUSTICE','SAMBUDDHA CHAKRABARTI'),
 (108,'JUSTICE','PINAKI CHANDRA GHOSE');
INSERT INTO `judge_master` (`judge_id`,`judge_designation`,`judge_name`) VALUES 
 (109,'JUSTICE','BISWANATH SOMADDAR'),
 (110,'JUSTICE','TAPAN KUMAR DUTT'),
 (111,'ADDITIONAL CHIEF JUSTICE','ASOK KUMAR GANGULY'),
 (112,'JUSTICE','SUBHRO KAMAL MUKHERJEE'),
 (113,'CHIEF JUSTICE','V.S. SIRPURKAR'),
 (114,'JUSTICE','PRATAP KUMAR RAY'),
 (116,'JUSTICE','SHUKLA KABIR (SINHA)'),
 (117,'JUSTICE','SOUMEN SEN'),
 (118,'JUSTICE','TAPEN SEN'),
 (119,'JUSTICE','RUDRENTRA NATH BANERJEE');
/*!40000 ALTER TABLE `judge_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`lc_case_type_master`
--

DROP TABLE IF EXISTS `lc_case_type_master`;
CREATE TABLE `lc_case_type_master` (
  `lc_case_type_id` int(20) NOT NULL AUTO_INCREMENT,
  `lc_case_type_code` varchar(50) NOT NULL,
  `lc_case_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`lc_case_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`lc_case_type_master`
--

/*!40000 ALTER TABLE `lc_case_type_master` DISABLE KEYS */;
INSERT INTO `lc_case_type_master` (`lc_case_type_id`,`lc_case_type_code`,`lc_case_type_name`) VALUES 
 (1,'AC','ARBITRN/ADMINISTRN /ARB.EXEC/AWARD CASE'),
 (2,'ACT','ACT-VIII CASE/ACT XXX CASE'),
 (3,'ACT39','ACT 39 CASE/ACT XXXIX'),
 (4,'AP','ARBITRATION PROCEEDINGS / APPEAL'),
 (5,'APPEAL','APPEAL/APPL CASE/ZILLA APPL/APPLICATION'),
 (6,'ARC','ADDL. RENT CONTROLLAR CASE'),
 (7,'AST','AST/APPELLATE SIDE TENDER'),
 (8,'AT','APPEAL TENDER /ARBITRAL TRIBUNAL'),
 (9,'ATA','APPELLATE TRIBUNAL APPLICATION'),
 (10,'AXXXIX','INDIAN SUCCESSION ACT LETTER OF ADMINIS.'),
 (11,'BC','B.C.CASE'),
 (12,'BIFR','BOARD FOR INDUSTRIAL & FINANCIAL RECONST'),
 (13,'BTA','BLDG TRIB APPEAL/ BT/BLDG I/C/BLD PERMIT'),
 (14,'CA','CLAIM\\CUSTOM APPEAL/APPLICN / PETITION'),
 (15,'CAN','CAN (APPLICATION CIVIL),A.S.'),
 (16,'CAT','CENTRAL ADMINISTRATIVE TRIBUNAL'),
 (17,'CC','CLAIM CASE/CIVIL CASE\\CONSUMER CASE'),
 (18,'CDF','C.D.F. CASE'),
 (19,'CEX','CIVIL EXECUTION'),
 (20,'CN','CASE NO/C.M.C. CASE NO.\\COMPUTER NO.'),
 (21,'CO','CIVIL ORDER / CIVIL APPEAL');
INSERT INTO `lc_case_type_master` (`lc_case_type_id`,`lc_case_type_code`,`lc_case_type_name`) VALUES 
 (22,'COMC','COMPLAINT CASE'),
 (23,'COMEX','COM. EXECUTION'),
 (24,'COMS','COM. SUIT / COMMERCIAL SUIT'),
 (25,'CP','CONTEMPT/CLAIM/COMPANY PETN/COMPANY APPL'),
 (26,'CPAN','CONTEMPT APPLICATION'),
 (27,'CPC','C.P.C./CENTRAL POLICE CODE'),
 (28,'CR','CIVIL REVISION / CIVIL RULE /CIVIL CASE'),
 (29,'CRA','CROSS APPEAL/CIVIL REV APPLICATION'),
 (30,'CRC','CERTIFICATE CASE NO.'),
 (31,'CRR','CRIMINAL REVISION'),
 (32,'CS','CIVIL SUIT / CIVIL SUIT OF O.S.'),
 (33,'CTA','CONTEMPT APPLICATION'),
 (34,'CWC','CHILD WELFARE COMMITTEE'),
 (35,'DC','DISPUTE(CMAH)/INDSTRL.DISP./DEMOLN. CASE'),
 (36,'DFC','DISTRICT FORUM CASE/DIST FORM. EXEC.CASE'),
 (37,'DNC','DEATH N. CASE'),
 (38,'DRAT','DEBT RECOVERY APPELLATE TRIBUNAL'),
 (39,'DTC','DISTRESS CASE'),
 (40,'EA','EXCISE APPEAL'),
 (41,'EAA','ESTATE ACQUISITION APPEAL'),
 (42,'EC','ENROLLMENT CASE/ ENQUIRY CASE/ESTATE'),
 (43,'EEC','EJECTMENT EXECUTION CASE'),
 (44,'EJ','EJECTMENT SUIT/APPLICATION/APPEAL/MOTION');
INSERT INTO `lc_case_type_master` (`lc_case_type_id`,`lc_case_type_code`,`lc_case_type_name`) VALUES 
 (45,'EJC','EJECTMENT CASE'),
 (46,'EO','ESTATE OFFICER'),
 (47,'EP','ELECTION PETITION'),
 (48,'ES','EVICTION SUIT'),
 (49,'ESC','ESSENTIAL COMMIDITIES'),
 (50,'ESI','EMPLOYEES STATE INSURANCE CASE'),
 (51,'EVIC','EVICTION CASE'),
 (52,'EXC','EXECUTION CASES/EXECUTION SUIT/OTHER EX.'),
 (53,'FA','FIRST APPEAL'),
 (54,'FAT','FIRST APPEAL TENDER'),
 (55,'FMA','FIRST MISC. APPL.'),
 (56,'FMAT','FMAT/FIRST MISC. APPEAL TENDER'),
 (57,'GA','GENERAL APPLICATION'),
 (58,'GC','GUARDIANSHIP CASE NO./GRATUITY CASE'),
 (59,'GO','GOVERNMENT/GENERAL ORDER'),
 (60,'HDF','HOWRAH DIST FORUM CASE'),
 (61,'HMC','HOWRAH MUNICIPAL CORPORATION CASE'),
 (62,'HRC','HOUSE RENT CONTROL COURT [H.R.C.(M)]'),
 (63,'IA','INTERLOCUTORY APPLICATION'),
 (64,'IC','INSOLVENCY CASE'),
 (65,'IR','INDUSTRIAL REFERENCE'),
 (66,'ITA','INCOME TAX APPEAL'),
 (67,'ITC','INDUSTRIAL TRIBUNAL CASE'),
 (68,'JMC','JUDICIAL MISC CASE- /JUD. MISC APPEAL'),
 (69,'LA','LAND ACQUISITION / L.A.REF. CASE/EXEC');
INSERT INTO `lc_case_type_master` (`lc_case_type_id`,`lc_case_type_code`,`lc_case_type_name`) VALUES 
 (70,'LAA','LAND ACQUISITION APPEAL/L.A. SUIT'),
 (71,'LAM','LAND ACQUISITION MISC. CASE'),
 (72,'LC','LICENCE NO.'),
 (73,'LOA','LETTER OF ADMINISTRATION SUIT/LOA CASE'),
 (74,'LR','LAND REQUISITION CASE'),
 (75,'LRA','LAND REFORMS APPEAL/ACT/MISC. CASE'),
 (76,'LREX','LAND REVENUE EXECUTION CASE'),
 (77,'LRP','LAND REFORMS PETITION'),
 (78,'MA','MONEY APPEAL/MAIN APPLICATION'),
 (79,'MAAP','M.A. APPEAL/MUN.APPL/ MUN. ASSES. APPEAL'),
 (80,'MAC','MOTOR ACCIDENT CLAIM/EXECN/MOTOR VEHICLE'),
 (81,'MAT','MANDAMOUS APPEAL TENDER'),
 (82,'MATA','MATRIMONIAL APPEAL/MAINTAINENCE CASE'),
 (83,'MATS','MAT.SUITS/MATRIMONIAL CASE/DIVORCE SUIT'),
 (84,'MAXC','MATRIMONIAL EXECUTION CASE'),
 (85,'MBTA','MUNICIPAL BLDG TRIBUNAL APPEAL'),
 (86,'MCR','MIS.C.R./MISC. CIVIL REVISION'),
 (87,'MDF','MIDNAPORE DISTRICT FORUM CASE'),
 (88,'MEMO','MEMO NO.'),
 (89,'MEP','MENT PETITION CASE'),
 (90,'MEXC','MONEY EXECUTION CASE/L.A.MONEY.EXE.CASE'),
 (91,'MF','MISC. FORUM');
INSERT INTO `lc_case_type_master` (`lc_case_type_id`,`lc_case_type_code`,`lc_case_type_name`) VALUES 
 (92,'MIEX','MISC EXECUTION/MISC.L.A./L.R. MISC'),
 (93,'MISA','MISC.APPEAL/APPLICN/PREMPTION APPEAL'),
 (94,'MISC','MISC.CASE/REVIEW/MISC.(PREEMPTION)'),
 (95,'MISP','MISC. PROCEEDING/PROBATE CASE/PETITION'),
 (96,'MISS','MISCELLANEOUS SUIT / MISC. PETITION'),
 (97,'MJC','MISC. JUD CASE/M J APPEAL//MOT JUD CASE'),
 (98,'MORT','MORTGAGE SUIT'),
 (99,'MP','MAT PETITION/MAT APPEAL/MAGISTRATE PROC.'),
 (100,'MPC','MISC. PETITION/MISC.ELECTION P\'TION/CASE'),
 (101,'MS','MONEY SUIT'),
 (102,'NC','N.C. NO./NOTIFICATION NO.'),
 (103,'NT','NATIONAL TRIBUNAL'),
 (104,'OA','OTHER APPEAL/OTHER APPLICATION'),
 (105,'OAPP','ORIGINAL APPLICATION/ APPEAL / PETITION'),
 (106,'OBC','OBJECTION CASE'),
 (107,'OBJA','OBJECTION APPLICATION'),
 (108,'OC','OC CASE/OTHER CASE /O.C.INJUNCTION CASE'),
 (109,'OCA','OTHER CLAS/CASES APPEAL/ORGNL CIVIL APPL'),
 (110,'OCC','OTHER CONTESTED CASE'),
 (111,'OCEC','ORDINARY COMMERCIAL EXECUTION CASE'),
 (112,'OCLM','ORIGINAL CLAIM SUIT/ORG.CIV.PER.SUIT');
INSERT INTO `lc_case_type_master` (`lc_case_type_id`,`lc_case_type_code`,`lc_case_type_name`) VALUES 
 (113,'OCLS','OTHER CLASS SUIT'),
 (114,'OCMS','ORIGINAL [COMPLAINT] / [COMMERCIAL] SUIT'),
 (115,'OCS','ORIGINAL CIVIL SUIT/OC SUIT/OTHR CASE ST'),
 (116,'OCX','O.C. EXECUTION CASE'),
 (117,'ODA','ORDINARY APPLICATION'),
 (118,'ORC','ORIGINAL CASE'),
 (119,'ORS','ORIGINAL SUIT/ ORGNL. EJECTMENT SUIT'),
 (120,'OS','OTHER SUIT/OTHR EXEC CASE/ORIGINATIC SUM'),
 (121,'OSW','ORIGINAL SUIT WILL (PROBATE) CASE'),
 (122,'PC','PROBATE/MISC. (PROBATE)/WILL PROB. CASE'),
 (123,'PMC','PRE-EMPTION CASE/SUIT'),
 (124,'PN','PROCEEDING NO./PETITION NO.'),
 (125,'PO','PAYMENTARY ORDER'),
 (126,'PPA','P.P. APPEAL / PUBLIC PREMISES APPEAL'),
 (127,'PPC','PUBLIC PREMISES CASE'),
 (128,'PS','PROBATE SUITS'),
 (129,'PSC','POLICE STATION CASE'),
 (130,'PSE','PARTITION SUIT EXECUTION'),
 (131,'PTC','PREMISES TENANCY CASE'),
 (132,'PTS','PARTITION SUIT / PARTITION CASE/APPEAL'),
 (133,'PWA','PAYMENT  OF WAGES ACT'),
 (134,'RA','R.A./RENT APPEAL/REVISNL APPEAL/REVIEW A');
INSERT INTO `lc_case_type_master` (`lc_case_type_id`,`lc_case_type_code`,`lc_case_type_name`) VALUES 
 (135,'RAL','RESTORATION OF ALLIENATED LAND(1973 ACT)'),
 (136,'RC','REVOCATION / WILL CASE'),
 (137,'RCA','RENT CONTROL APPEAL'),
 (138,'RCC','RENT CONTROLLER CASE/SUIT/EXECUTION CASE'),
 (139,'RCS','REGISTERED OF COOPERATIVE SOCIETIES'),
 (140,'RES','RELIGIOUS ENDOWMENTT SUIT'),
 (141,'RN','R.N.CASE TYPE\\REGISTRATION NO.\\REF NO.'),
 (142,'RO','REASON ORDER'),
 (143,'RP','R.P. NO/RECOVERY PETITION/PROCEEDNG/CASE'),
 (144,'RVA','REVIEW APPLICATION'),
 (145,'SA','SECURITISATION /SARFAESI/SECOND APPEAL/'),
 (146,'SAT','STATE ADMINISTRATIVE TRIBUNAL\\SAT\\SEC AP'),
 (147,'SCC','STATE CONSUMER CASE/STATE COMMISSION'),
 (148,'SCCA','SMALL CAUSES COURT APPEAL/S.C.C.APPEAL'),
 (149,'SCCC','SMALL CAUSES COURT CASE'),
 (150,'SCCS','S.C.C. SUITS / PSCC SUIT'),
 (151,'SEXC','S.C.C. EXECUTION CASE'),
 (152,'SMA','SAT/SA/SECOND MISC. APPEAL'),
 (153,'SMAT','SECOND MISC. APPEAL TENDER(SMAT)'),
 (154,'SN','SUIT NO./SPECIAL SUIT/SL NO/SUMMARY SUIT'),
 (155,'SP','STAY PETITION');
INSERT INTO `lc_case_type_master` (`lc_case_type_id`,`lc_case_type_code`,`lc_case_type_name`) VALUES 
 (156,'SUC','SUCCESSION CASE'),
 (157,'TA','TITLE APPEAL'),
 (158,'TC','TESTAMENTERY CASE/SUIT/TENDER CASE'),
 (159,'TDC','TITLE DECLARATION CASE/SUIT'),
 (160,'TEX','TIT EXEC CASE /T.EX. ST./TIT EJ ST/T M C'),
 (161,'TP','TARIFF PETITION'),
 (162,'TRA','TRANSFER APPLICATION / TRANSFER APPEAL'),
 (163,'TRC','TRANSFER REC.CASE/PROCEEDING/R.C.APPL.'),
 (164,'TRIA','TRIBUNAL APPLICATION / TRIBUNAL APPEAL'),
 (165,'TRP','TRIBUNAL RECOVERY PROCEEDINGS/PROCEDURE'),
 (166,'TRS','TRUST SUIT'),
 (167,'TS','TITLE SUIT/TRUST SUIT'),
 (168,'TTA','THIKA TENANCY APPEAL'),
 (169,'URA','UN REGISTERED APPEAL'),
 (170,'WBCTA','WEST BENGAL CO-OPERATIVE TRIBUNAL APPEAL'),
 (171,'WBSE','WEST BENGAL SHOPS & ESTABLISHMENT'),
 (172,'WP','WRIT PETITION / W.P.C.R.C. / W.P.C.T.'),
 (173,'LVA','LEVY APPEAL');
/*!40000 ALTER TABLE `lc_case_type_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`lic_qa_log`
--

DROP TABLE IF EXISTS `lic_qa_log`;
CREATE TABLE `lic_qa_log` (
  `proj_key` int(11) NOT NULL DEFAULT '0',
  `box_number` char(25) NOT NULL DEFAULT '0',
  `policy_number` varchar(40) NOT NULL DEFAULT '0',
  `missing_img_exp` int(1) DEFAULT '0',
  `crop_clean_exp` int(1) DEFAULT '0',
  `poor_scan_exp` int(1) DEFAULT '0',
  `wrong_indexing_exp` int(1) DEFAULT '0',
  `linked_policy_exp` int(1) DEFAULT '0',
  `decision_misd_exp` int(1) DEFAULT '0',
  `extra_page_exp` int(1) DEFAULT '0',
  `rearrange_exp` int(1) DEFAULT '0',
  `other_exp` int(1) DEFAULT '0',
  `move_to_respective_policy_exp` int(1) DEFAULT '0',
  `Created_by` varchar(30) NOT NULL DEFAULT '',
  `created_dttm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(30) DEFAULT NULL,
  `modified_dttm` datetime DEFAULT NULL,
  `batch_key` int(11) NOT NULL DEFAULT '0',
  `SOLVED` int(1) NOT NULL DEFAULT '0',
  `comments` text,
  `qa_status` int(1) NOT NULL DEFAULT '0',
  KEY `proj_key` (`proj_key`,`batch_key`,`box_number`,`policy_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`lic_qa_log`
--

/*!40000 ALTER TABLE `lic_qa_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lic_qa_log` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`metadata_entry`
--

DROP TABLE IF EXISTS `metadata_entry`;
CREATE TABLE `metadata_entry` (
  `proj_code` int(100) NOT NULL,
  `bundle_key` int(100) NOT NULL,
  `item_no` varchar(50) DEFAULT NULL,
  `case_file_no` varchar(50) NOT NULL,
  `case_status` varchar(20) NOT NULL,
  `case_type` varchar(20) NOT NULL,
  `case_nature` varchar(20) NOT NULL,
  `case_year` varchar(20) NOT NULL,
  `disposal_date` varchar(100) DEFAULT NULL,
  `judge_name` text,
  `district` varchar(50) NOT NULL,
  `petitioner_name` text,
  `petitioner_counsel_name` text,
  `respondant_name` text,
  `respondant_counsel_name` text,
  `case_filling_date` varchar(100) DEFAULT NULL,
  `ps_name` varchar(500) DEFAULT NULL,
  `ps_case_no` varchar(500) DEFAULT NULL,
  `lc_case_no` text,
  `lc_order_date` varchar(100) DEFAULT NULL,
  `lc_judge_name` text,
  `conn_app_case_no` text,
  `conn_disposal_type` varchar(100) DEFAULT NULL,
  `conn_main_case_no` text,
  `analogous_case_no` text,
  `old_case_type` varchar(50) DEFAULT NULL,
  `old_case_no` varchar(50) DEFAULT NULL,
  `old_case_year` varchar(50) DEFAULT NULL,
  `file_move_history` text,
  `dept_remark` text,
  `created_dttm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(20) NOT NULL,
  `modified_dttm` datetime DEFAULT '0000-00-00 00:00:00',
  `modified_by` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`metadata_entry`
--

/*!40000 ALTER TABLE `metadata_entry` DISABLE KEYS */;
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'1','27975W','Disposed','WP','WRIT PETITION','2012','2013-01-29','HON`BLE JUSTICE ANIRUDDHA BOSE','Murshidabad                   ','SALAUDDIN SK','LIPIKA CHATTERJEE||ARINDAM CHATTERJEE','THE WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LTD & ORS','','2012-12-20','','','','','','','','','','','','','','','2021-01-04 14:25:42','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'1','26650W','Disposed','WP','WRIT PETITION','2012','2012-12-18','HON`BLE JUSTICE HARISH TANDON','Burdwan                       ','RADHE SHYAM','ARUN KHUTIA','THE STATE OF WEST BENGAL & ORS','','2012-12-11','','','','','','','','','','','','','','','2021-01-04 01:56:10','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,2,'1','26305W','Disposed','WP','WRIT PETITION','2012','2012-12-17','HON`BLE JUSTICE DEBASISH KARGUPTA','Burdwan                       ','MD REZAUL KARIM','ARUN KHUTA','THE STATE OF WEST BENGAL & ORS','','2012-12-10','','','','','','','','','','','','','','','2021-01-04 16:54:22','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'1','19625W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KARGUPTA','Malda                         ','MD MAZAHAR HOSSAIN','JUDHAJIT GUHA','THE STATE OF WEST BENGAL & ORS','','2012-08-30','','','','','','','','','','','','','','','2021-01-04 14:25:54','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,5,'1','21754W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','SUBHAS SARKAR','BISWADEB RAY CHAUDHURI||SOURAV CHOUDHURI','THE STATE OF WEST BENGAL','','2012-09-25','','','','','','','','','','','','','','','2021-01-04 14:25:15','tina roy','0000-00-00 00:00:00',NULL,'Exported'),
 (1,6,'1','26298W','Disposed','WP','WRIT PETITION','2012','2012-12-17','HON`BLE JUSTICE DEBASISH KARGUPTA','Burdwan                       ','TAPAN KUMAR MONDAL','ARUN KHUTIA','THE STATE OF WEST BENGAL & ORS.','','2012-12-10','','','','','','','','','','','','','','','2021-01-04 14:27:54','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,2,'2','24135W','Disposed','WP','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Hooghly                       ','DULAL BHATTACHARJEE','','THE BHADRESWAR MUNICIPALITY & ORS','','2012-10-18','','','','','','','','','','','','','','','2021-01-04 16:59:03','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,1,'2','27948W','Disposed','WP','WRIT PETITION','2012','2013-01-18','HON`BLE JUSTICE SOUMITRA PAL','Burdwan                       ','RAM PRASAD MUKHERJEE','ARIJIT DEY','THE STATE OF WEST BENGAL AND OTHERS','','2012-12-20','','','','','','','','','','','','','','','2021-01-04 14:32:05','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,5,'2','22102W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE DEBASISH KARGUPTA','Paschim Medinipur             ','GOPAL CH MAITY','SABITA KHUTIA (BHUIYA)','STATE OF WEST BENGAL & ORS','','2012-09-28','','','','','','','','','','','','','','','2021-01-04 14:31:21','tina roy','0000-00-00 00:00:00',NULL,'Exported');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,2,'3','19061W','Disposed','WP','WRIT PETITION','2012','2013-01-28','HON`BLE JUSTICE DIPANKAR DATTA','Howrah                        ','BANDANA MONDAL','PARIMAL KUMAR DWARI','THE STATE OF WEST BENGAL & ORS','','2012-08-28','','','','','','','','','','','','','','','2021-01-04 17:03:19','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,5,'3','21699W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE BISWANATH SOMADDER','Birbhum                       ','ARUN MAL','ARUN KUMAR SINHA','THE STATE OF WEST BENGAL & ORS','','2012-09-25','','','','','','','','','','','','','','','2021-01-04 14:34:16','tina roy','0000-00-00 00:00:00',NULL,'Exported'),
 (1,1,'3','27896W','Disposed','WP','WRIT PETITION','2012','2012-12-21','HON`BLE JUSTICE DEBASISH KARGUPTA','Jalpaiguri                    ','DEBES CHANDRA SARKAR','SUBHRANGSHU PANNDA','THE STATE OF WEST BENGAL & OTHERS','','2012-12-19','','','','','','','','','','','','','','','2021-01-04 14:35:59','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,3,'2','27534W','Disposed','WP','WRIT PETITION','2012','2012-12-20','HON`BLE JUSTICE PAPHERYA J.','Birbhum                       ','DILASAD SAIKH','MD. KUTUBUDDIN','THE STATE OF WEST BANGAL & ORG.','','2018-12-18','','','','','','','','','','','','','','','2021-01-04 02:07:30','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'2','12953W','Disposed','WP','WRIT PETITION','2011','2013-01-03','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Howrah                        ','MANJU HATI','JOYDEEP ACHARYA','STATE OF WEST BENGAL & ORS','','2011-08-04','','','','','','','','','','','','','','','2021-01-04 14:36:18','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,2,'4','25470W','Disposed','WP','WRIT PETITION','2012','2012-12-07','HON`BLE JUSTICE DIPANKAR DATTA','Purba Medinipur               ','PURBA CHANDRA BHUNIA','BHASKAR CHANDRA MANNA','THE STATE OF WEST BENGAL & ORS','','2012-12-03','','','','','','','','','','','','','','','2021-01-04 17:07:11','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,6,'2','21602W','Disposed','WP','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE JOYMALYA BAGCHI||HON`BLE CHIEF JUSTICE ARUN MISHRA','Hooghly                       ','SRI GOUR HARI KUNDU','MR. HIRANMAY BHATTACHARYYA','THE STATE OF WEST BENGAL & ORS.','','2012-09-25','','','','','','','','','','','','','','','2021-01-04 14:39:35','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,5,'4','22116W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE DEBASISH KARGUPTA','Howrah                        ','KANAILAL MAKSHAL','SABITA KHUTIYA( BHUIYA)','THE STATE OF WEST BENGAL & ORS','','2012-09-28','','','','','','','','','','','','','','','2021-01-04 14:37:39','tina roy','0000-00-00 00:00:00',NULL,'Exported'),
 (1,1,'4','25664W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KARGUPTA','Nadia                         ','NANIGOPAL NAG','MRS. SABITA KHUTIA','THE STATE OF WEST BENGAL & ORS','','2012-12-04','','','','','','','','','','','','','','','2021-01-04 14:39:39','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,5,'5','22119W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE DEBASISH KARGUPTA','Howrah                        ','AMARENDRA NATH CHAKRABORTY','SABITA KHUTIA (BHUIYA)','THE STATE OF WEST BENGAL & ORS','','2012-09-28','','','','','','','','','','','','','','','2021-01-04 14:40:14','tina roy','0000-00-00 00:00:00',NULL,'Exported'),
 (1,2,'5','8418W','Disposed','WP','WRIT PETITION','2012','2012-05-17','HON`BLE JUSTICE PATHERYA','Birbhum                       ','SHYAMAPADA CHOUDHURY','YUBHAJIT GUHA','THE STATE OF WEST BENGAL & ORS','','2012-04-23','','','','','','','','','','','','','','','2021-01-04 17:12:16','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,5,'6','11738W','Disposed','WP','WRIT PETITION','2012','2012-06-14','HON`BLE JUSTICE PATHERYA','Purba Medinipur               ','SWAPAN KUMAR SAHOO','BHASKAR CHANDRA MANNA','THE STATE OF WEST BENGAL & ORS','','2012-06-11','','','','','','','','','','','','','','','2021-01-04 14:43:22','tina roy','0000-00-00 00:00:00',NULL,'Exported');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'5','9851W','Disposed','WP','WRIT PETITION','2012','2012-12-18','HON`BLE JUSTICE SOUMITRA PAL','Dakshin Dinajpur              ','RAMEN SARKAR','SUJIT KUMAR MITRA','STATE OF WEST BENGAL AND OTHERS','','2012-05-07','','','','','','','','','','','','','','','2021-01-04 14:45:01','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,2,'6','21601W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','BINOY BHUSAN MANDAL','SABITA KHUTIYA BHUNAYA','THE STATE OF WEST BENGAL & ORS','','2012-09-25','','','','','','','','','','','','','','','2021-01-04 17:15:32','Sriparna Saha','2021-01-04 17:31:01','Sriparna Saha','N'),
 (1,3,'3','158','Disposed','WP.CT','WRIT PETITION','2012','2013-02-06','HON`BLE JUSTICE NISHITA MHATRE||HON`BLE JUSTICE ANINDITA ROY SARASWATI','Burdwan                       ','JYOTSHNA CHATTERJEE & ANR.','NIRMAL ROY','UNION OT INDIA & ANR.','','2012-06-12','','','','','','','','','','','','','','','2021-01-04 02:17:54','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'6','2247W','Disposed','WP','WRIT PETITION','2012','2013-01-21','HON`BLE JUSTICE INDIRA BANERJEE','Birbhum                       ','KALI PADA GHOSH','MD YUSUF ALI','THE STATE OF WEST BENGAL & ORS','','2012-02-02','','','','','','','','','','','','','','','2021-01-04 14:48:03','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'3','8446W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE PATHERYA','Birbhum                       ','DIPAK KUMAR SADHU','YUDHAJIT GUHA','THE STATE OF WEST BENGAL & ORS.','','2012-04-23','','','','','','','','','','','','','','','2021-01-04 14:49:18','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,5,'7','21447W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE DIPANKAR DATTA','Hooghly                       ','SUSANTA SASMAL||SANGITA SASMAL','MITUSREE BORAL','RESERVE BANK OF INDIA & ORS','','2012-09-21','','','','','','','','','','','','','','','2021-01-04 14:47:52','tina roy','0000-00-00 00:00:00',NULL,'Exported');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'3','26343W','Disposed','WP','WRIT PETITION','2012','2012-12-14','HON`BLE JUSTICE DIPANKAR DATTA','Nadia                         ','TAPAN BISWAS','DILIP KUMAR KAR','THE DISTRICT MAGISTRATE AND PRINCIPAL CENSUS OFFICER, NADIA & ORS','','2012-12-10','','','','','','','','','','','','','','','2021-01-04 14:50:39','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'4','4913W','Disposed','WP','WRIT PETITION','2012','2012-04-05','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','SALARA KHATUN','MD. ASHRAFUL HAQ','THE STATE OF WEST BENGAL & ORS','','2012-03-07','','','','','','','','','','','','','','','2021-01-04 02:22:10','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,5,'8','20334W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE PATHERYA','Malda                         ','SK DULAL','ZAMIRUL ALAM','THE OMBUDSMAN STATE OF WEST BENGAL & ORS','','2012-09-07','','','','','','','','','','','','','','','2021-01-04 14:50:44','tina roy','0000-00-00 00:00:00',NULL,'Exported');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,3,'5','17532W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Jalpaiguri                    ','MAJENDRA NATH RAY','SAKTIPADA JANA','THE STATE OF WEST BENGAL AND OTHERS','','2012-08-03','','','','','','','','','','','','','','','2021-01-04 02:25:01','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,1,'7','20485W','Disposed','WP','WRIT PETITION','2012','2013-01-14','HON`BLE JUSTICE DIPANKAR DATTA','Paschim Medinipur             ','SWADESH RANJAN SINHA','SANTANU CHATTERJEE','THE STATE OF WEST BENGAL & ORS','','2012-09-10','','','','','','','','','','','','','','','2021-01-04 14:56:39','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'6','18653W','Disposed','WP','WRIT PETITION','2012','2012-12-19','HON`BLE JUSTICE SOUMITRA PAL','Hooghly                       ','KALPANA BASU','DINESH CH. MAHAPATRA','STATE OF WEST BANGAL AND OTHERS','','2012-08-22','','','','','','','','','','','','','','','2021-01-04 02:27:04','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,5,'9','19907W','Disposed','WP','WRIT PETITION','2012','2012-09-24','HON`BLE JUSTICE INDIRA BANERJEE','Burdwan                       ','M/S PIONEER CABLE NETWORK & ANOTHER','SAYANTAN BOSE','UNION OF INDIA & ORS','','2012-08-03','','','','','','','','','','','','','','','2021-01-04 14:55:08','tina roy','0000-00-00 00:00:00',NULL,'Exported'),
 (1,1,'17','20060W','Disposed','WP','WRIT PETITION','2012','2013-01-04','HON`BLE JUSTICE SOUMITRA PAL','Purulia                       ','SANTOSH KUMAR','BAISALI GHOSHAL','THE STATE OF WEST BENGAL & ORS','','2012-09-05','','','','','','','','','','','','','','','2021-01-04 15:04:55','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,2,'7','17934W','Disposed','WP','WRIT PETITION','2012','2012-09-24','HON`BLE JUSTICE DEBASISH KAR GUPTA','Birbhum                       ','CHAKRADHAR DAS & ORS','SRIKANTA DATTA','THE STATE OF WEST BENGAL & ORS','','2012-08-08','','','','','','','','','','','','','','','2021-01-04 17:34:41','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'8','27790W','Disposed','WP','WRIT PETITION','2012','2013-02-19','HON`BLE JUSTICE BISWANATH SOMADDER','Jalpaiguri                    ','SRI JIBESH CHANDRA ROY','PARTHA SARKAR','THE STATE OF WEST BENGAL & ORS','','2012-12-19','','','','','','','','','','','','','','','2021-01-04 15:07:17','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'7','20167W','Disposed','WP','WRIT PETITION','2012','2013-01-24','HON`BLE JUSTICE JOYMALYA BAGCHI||HON`BLE CHIEF JUSTICE ARUN MISHRA','Malda                         ','MD. JIAUL ISLAM','SUBODH BANERJEE','THE STATE OF WEST BANGAL AND OTHERS','','2012-09-06','','','','','','','','','','','','','','','2021-01-04 02:37:58','priya golder','2021-01-04 02:45:38','priya golder','N'),
 (1,2,'8','21184W','Disposed','WP','WRIT PETITION','2012','2013-11-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','KASHI NATH GHOSH','SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL AND ORS','','2012-09-18','','','','','','','','','','','','','','','2021-01-04 17:37:15','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'4','324','Disposed','WPLRT','WRIT PETITION','2012','2012-12-19','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA||HON`BLE JUSTICE TARUN KUMAR DAS','Burdwan                       ','SAJJAD RAHAMAN SAIKH & ANR','SANKAR PRASAD DALAPATI','THE STATE OF WEST BENGAL & OTHERS','','2012-11-30','','','','','','','','','','','','','','','2021-01-04 15:09:32','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'8','26775W','Disposed','WP','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE SOUMITRA PAL||HON`BLE JUSTICE DEBASISH KAR GUPTA','Uttar Dinajpur                ','RIJWANA BEGUM','MD. HABIBUR RAHAMAN','THE STATE OF WEST BANGAL AND OTHERS','','2012-12-12','','','','','','','','','','','','','','','2021-01-04 02:41:44','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'4','8555W','Disposed','WP','WRIT PETITION','2012','2013-01-08','HON`BLE JUSTICE JOYMALYA BAGCHI||HON`BLE CHIEF JUSTICE ARUN MISHRA','North 24-Parganas             ','DIPAK MONDAL','SUVADIP BHATTACHARJEE','THE STATE OF WEST BENGAL & ORS.','','2012-04-24','','','','','','','','','','','','','','','2021-01-04 15:12:43','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'9','26894W','Disposed','WP','WRIT PETITION','2012','2013-02-11','HON`BLE JUSTICE HARISH TANDON','Darjeeling                    ','MUNA TAMANG & ORS','MR. ASHOK KUMAR JANAH','THE STATE OF W.B & ORS','','2012-12-12','','','','','','','','','','','','','','','2021-01-04 15:15:43','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,2,'9','13874W','Disposed','WP','WRIT PETITION','2012','2013-02-12','HON`BLE  PRASANJIT MANDAL','North 24-Parganas             ','SATYABRATA CHOUDHURY','','THE STATE OF WESTG BENGAL & OTHERS','','2012-06-29','','','','','','','','','','','','','','','2021-01-04 17:45:25','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'5','445','Disposed','WP.ST','WRIT PETITION','2012','2013-02-01','HON`BLE JUSTICE NISHITA MHATRE||HON`BLE JUSTICE ANINDITA ROY SARASWATI','Nadia                         ','SABBIR MONDAL','DILIP KUMAR MAITI','THE STATE OF WEST BENGAL & ORS.','','2012-12-18','','','','','','','','','','','','','','','2021-01-04 15:18:18','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'5','16562W','Disposed','WP','WRIT PETITION','2010','2011-01-28','HON`BLE JUSTICE ASHIM KUMAR ROY||HON`BLE CHIEF JUSTICE J N PATEL','South 24-Parganas             ','GAUTAM DEY & ANR','ANINDYA CHAKRABORTY','THE STATE OF WEST BENGAL & ANR','','2010-08-04','','','','','','','','','','','','','','','2021-01-04 15:17:13','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'6','20058W','Disposed','WP','WRIT PETITION','2012','2013-01-04','HON`BLE JUSTICE SOUMITRA PAL','Purulia                       ','SRIPADA MAHATO','MRS. BAISALI GHOSHAL','STATE OF WEST BENGAL & ORS','','2012-09-05','','','','','','','','','','','','','','','2021-01-04 15:22:35','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'9','26171W','Disposed','WP','WRIT PETITION','2012','2013-01-03','HON`BLE JUSTICE HARISH TANDON','Hooghly                       ','CHINMOY CHATTAPADHAY','MALAY BHATTACHARYA','THE STATE OF WEST BANGAL AND ORS.','','2012-12-07','','','','','','','','','','','','','','','2021-01-04 03:10:06','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'10','27651W','Disposed','WP','WRIT PETITION','2012','2013-01-31','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','SAMINA BIBI','TAPAS DUTTA','KOLKATA MUNICIPAL CORPORATION & OTHERS','','2012-12-21','','','','','','','','','','','','','','','2021-01-04 15:39:56','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'1','2713W','Disposed','WP','WRIT PETITION','2004','2004-03-04','HON`BLE JUSTICE MAHARAJ SINHA','Paschim Medinipur             ','NARAYAN CHANDRA DAS','RAJ KUMAR CHAKRABORTY||TAPAN KUMAR CHAKRABORTY','STATE OF WEST BENGAL & ORS','','2004-02-18','','','','','','','','','','','','','','','2021-01-04 15:39:36','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'6','316W','Disposed','WP','WRIT PETITION','2013','2013-01-14','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','PANNALAL DUTTA','SUKUMAR GHOSH','THE STATE OF WEST BENGAL & ORS','','2013-01-07','','','','','','','','','','','','','','','2021-01-04 15:40:18','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,3,'10','21596W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','AJIT KUMAR BISWAS','SABITA KHUTIA  BHUNYA','THE STATE OF WEST BENGAL AND ORS.','','2012-09-25','','','','','','','','','','','','','','','2021-01-04 03:12:31','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'7','22998W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','MST.FATAMA KHATUN','BRATATI DUTTA','THE STATE OF WEST BENGAL & ORS.','','2012-10-09','','','','','','','','','','','','','','','2021-01-04 15:43:04','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,2,'10','5984W','Disposed','WP','WRIT PETITION','2012','2013-01-18','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','North 24-Parganas             ','SHIBANI GHOSH AND ANO','AMIT ROY','THE STATE BANK OF INDIA & OTHERS','','2012-02-22','','','','','','','','','','','','','','','2021-01-04 18:11:43','Sriparna Saha','2021-01-04 18:17:23','Sriparna Saha','N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,7,'2','2714W','Disposed','WP','WRIT PETITION','2004','2004-03-04','HON`BLE JUSTICE MAHARAJ SINHA','Paschim Medinipur             ','HEAMANTA KUMAR GHOSH','RAJ KUMAR CHAKRABORTY||TAPAN KUMAR CHAKRABORTY','STATE OF WEST BENGAL & ORS','','2004-02-18','','','','','','','','','','','','','','','2021-01-04 15:41:44','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'11','17528W','Disposed','WP','WRIT PETITION','2012','2013-01-10','HON`BLE JUSTICE DEBASISH KAR GUPTA','Jalpaiguri                    ','DULAL CHANDRA SIL','SAKTI PADA JANA','THE STATE OF WEST BENGAL AND ORS.','','2012-08-03','','','','','','','','','','','','','','','2021-01-04 03:14:12','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,1,'11','12173W','Disposed','WP','WRIT PETITION','2012','2013-01-09','HON`BLE JUSTICE JOYMALYA BAGCHI||HON`BLE CHIEF JUSTICE ARUN MISHRA','North 24-Parganas             ','ABDUL KHALIQUE AND ANR','SANKHA SUBHRA RAY','THE STATE OF WEST BENGAL & OTHERS','','2012-06-13','','','','','','','','','','','','','','','2021-01-04 15:45:09','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,6,'8','2246W','Disposed','WP','WRIT PETITION','2012','2013-01-21','HON`BLE JUSTICE INDIRA BANERJEE','Birbhum                       ','ANADI NATH CHATTERJEE','MD. YUSUF ALI','THE STATE OF WEST BENGAL & ORS.','','2012-02-02','','','','','','','','','','','','','','','2021-01-04 15:46:10','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'12','27846W','Disposed','WP','WRIT PETITION','2012','2012-12-21','HON`BLE JUSTICE DEBASISH KAR GUPTA','Burdwan                       ','ANIL KUMAR ROY','DWARIKA NATH MUKHERJEE','THE STATE OF WEST BENGAL AND ORS.','','2012-12-19','','','','','','','','','','','','','','','2021-01-04 03:16:10','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'7','1768W','Disposed','WP','WRIT PETITION','2013','2013-01-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','Nadia                         ','GANESH CHANDRA ROY','SABITA KHUTIA(BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2013-04-18','','','','','','','','','','','','','','','2021-01-04 15:45:11','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,2,'11','13147W','Disposed','WP','WRIT PETITION','2012','2013-01-30','HON`BLE JUSTICE DIPANKAR DATTA','Kolkata                       ','MEDINIRAI COAL MINING PVT LTS & ORS','SUBHOJIT SAHA','UNION OF INDIA & ORS','','2012-06-23','','','','','','','','','','','','','','','2021-01-04 18:16:07','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'13','21554W','Disposed','WP','WRIT PETITION','2012','2013-01-11','HON`BLE JUSTICE DEBASISH KAR GUPTA','Hooghly                       ','SURESH CHAKRABORTY','AMITABRATA ROY','THE STATE OF WEST BENGAL AND ORS.','','2012-09-24','','','','','','','','','','','','','','','2021-01-04 03:18:03','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'9','2237W','Disposed','WP','WRIT PETITION','2012','2013-01-21','HON`BLE JUSTICE INDIRA BANERJEE','Malda                         ','BASANTA KUMAR SARKAR','MD. YUSUF ALI','THE STATE OF WEST BENGAL & ORS.','','2012-02-02','','','','','','','','','','','','','','','2021-01-04 15:48:21','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'12','25002W','Disposed','WP','WRIT PETITION','2012','2012-12-03','HON`BLE JUSTICE DIPANKAR DATTA','Burdwan                       ','SUMATI CHOWDHURY','MR. ALLEN FELIX','THE STATE OF WEST BENGAL AND OTHERS','','2012-11-27','','','','','','','','','','','','','','','2021-01-04 15:48:11','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'3','6474W','Disposed','WP','WRIT PETITION','2004','2005-01-17','HON`BLE JUSTICE MAHARAJ SINHA','Kolkata                       ','ARUN KUMAR MITRUKA','DILIP KUMAR SAMANTA','STATE OF WEST BENGAL & ORS','','2004-04-15','','','','','','','','CPAN/41/2006','','','','','','','2021-01-04 15:48:15','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'10','24051W','Disposed','WP','WRIT PETITION','2012','2012-12-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','NEKCHHAR ALI','DILIP KUMAR MAITI','THE STATE OF WEST BENGAL & ORS.','','2012-10-18','','','','','','','','','','','','','','','2021-01-04 15:50:50','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'13','26557W','Disposed','WP','WRIT PETITION','2012','2012-12-17','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','SK ABED ALI','SOURAV M ITRA','THE STATE OF WEST BENGAL & ORS','','2012-12-11','','','','','','','','','','','','','','','2021-01-04 15:50:13','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'14','19272W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE HARISH TANDON','North 24-Parganas             ','GAYETRI SAHA','SIPRA MAITY','THE STATE OF WEST BENGAL AND ORS.','','2012-08-29','','','','','','','','','','','','','','','2021-01-04 03:21:29','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'8','13915W','Disposed','WP','WRIT PETITION','2009','2013-02-04','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Murshidabad                   ','NAZIMUDDIN ANSARI & ANOTHER','ZAIUL HAQUE','THE STATE OF WEST BENGAL & OTHERS','','2009-08-07','','','','','','','','','','','','','','','2021-01-04 15:50:19','sayan swarnakar','2021-01-04 15:51:52','sayan swarnakar','N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,2,'12','27578W','Disposed','WP','WRIT PETITION','2012','2012-12-20','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','ABDUL GANI MALLICK','CHANDNI CHARAN DE','CALCUTTA BOOK LABOUR BOARD & ORS','','2012-12-18','','','','','','','','','','','','','','','2021-01-04 18:20:34','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'15','22558W','Disposed','WP','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE DEBASISH KAR GUPTA','Hooghly                       ','SHITAL KUMAR BISWAS','AMRITENDU BHOWMICK','THE STATE OF WEST BENGAL AND ORS.','','2012-10-04','','','','','','','','','','','','','','','2021-01-04 03:23:42','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'11','26567W','Disposed','WP','WRIT PETITION','2012','2012-12-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','RAM BAHADUR SHOW','CHANDI CHARAN DE','CALCUTTA DOCK LABOUR BOARD & ORS.','','2012-12-11','','','','','','','','','','','','','','','2021-01-04 15:55:14','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'14','20806W','Disposed','WP','WRIT PETITION','2012','2013-01-04','HON`BLE JUSTICE SOUMITRA PAL','Burdwan                       ','SRI SUNIL RUIDAS & ORS','SOUMYA RAY','STATE OF WEST BENGAL & ORS','','2012-09-13','','','','','','','','','','','','','','','2021-01-04 15:55:07','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'16','4961W','Disposed','WP','WRIT PETITION','2012','2012-03-26','HON`BLE JUSTICE SOUMITRA PAL','Nadia                         ','RABJAN DASGUPTA','DIBASHIS BASU','THE STATE OF WEST BENGAL AND ORS.','','2012-03-12','','','','','','','','','','','','','','','2021-01-04 03:26:01','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,2,'14','19884W','Disposed','WP','WRIT PETITION','2012','2012-12-18','HON`BLE JUSTICE SOUMITRA PAL','Nadia                         ','SAMARENDRA NATH BISWAS','SUBIR DEBNATH','THE STATE OF WEST BENGAL & ORS','','2012-09-03','','','','','','','','','','','','','','','2021-01-04 18:24:42','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'9','1171W','Disposed','WP','WRIT PETITION','2013','2013-01-29','HON`BLE JUSTICE SOUMITRA PAL','Purba Medinipur               ','DIPALI PRAMANIC','ZAIZSUL HAUE','THE STATE OF WEST BENGAL & ORS','','2013-01-15','','','','','','','','','','','','','','','2021-01-04 15:56:15','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'4','11374W','Disposed','WP','WRIT PETITION','2004','2004-04-27','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Jalpaiguri                    ','AKHIL BANDHU SAHA','DEBASISH MUKHOPADHYAY','THE STATE OF WEST BENGAL & ORS','','2004-07-12','','','','','','','','','','','','','','','2021-01-04 15:55:39','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'17','20690W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Coochbehar                    ','DIRENDRA NATH SINGH','BINOY DAS','THE STATE OF WEST BENGAL AND ORS.','','2012-09-12','','','','','','','','','','','','','','','2021-01-04 03:27:53','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'15','23226W','Disposed','WP','WRIT PETITION','2012','2013-01-16','HON`BLE JUSTICE DIPANKAR DATTA','Kolkata                       ','DR SANGITA CHANDA','DEBASHIS BANERJEE','THE PUBLIC INFORMATION OFFICER & ORS','','2012-10-10','','','','','','','','','','','','','','','2021-01-04 15:57:38','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'18','27591W','Disposed','WP','WRIT PETITION','2012','2013-01-31','HON`BLE JUSTICE DIPANKAR DATTA','Nadia                         ','ASIM SAHA','SANKAR SAHA','THE STATE OF WEST BENGAL AND ORS.','','2012-12-18','','','','','','','','','','','','','','','2021-01-04 03:34:42','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'12','53','Disposed','WP.TT','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA||HON`BLE JUSTICE ASIM KR. MONDAL','Burdwan                       ','PIRAMAL HEALTH CARE LTD.','MR. PIYAL GUPTA','SALES TAX OFFICER, DUBURDIH CHECK POST & ORS.','','2012-10-11','','','','','','','','','','','','','','','2021-01-04 16:06:08','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,1,'16','2253W','Disposed','WP','WRIT PETITION','2012','2013-01-21','HON`BLE JUSTICE INDIRA BANERJEE','Birbhum                       ','ANIL KUMAR CHOUDHURY','MD. YUSUF ALI','THE STATE OF WEST BENGAL & ORS','','2012-02-02','','','','','','','','','','','','','','','2021-01-04 16:06:19','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,3,'19','340','Disposed','WPLRT','WRIT PETITION','2012','2013-01-28','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA||HON`BLE JUSTICE TARUN KUMAR DAS','Murshidabad                   ','SEKENDAR MONDAL','MD. ASHRAFUL HAQ','THE STATE OF WEST BENGAL AND ORS.','','2012-12-13','','','','','','','','','','','','','','','2021-01-04 03:37:46','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'5','7240W','Disposed','WP','WRIT PETITION','2005','2012-06-25','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','MD LIKMAN','SK OBAIDULLAH DEWAN','CESC LIMITED & ORS','','2005-04-05','','','','','','','','','','','','','','','2021-01-04 16:05:53','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,3,'20','26261W','Disposed','WP','WRIT PETITION','2012','2013-02-04','HON`BLE JUSTICE HARISH TANDON','South 24-Parganas             ','SAKTIPADA NATH','TAPAN KR. MAHAPATRA','THE STATE OF WEST BENGAL AND ORS.','','2012-12-10','','','','','','','','','','','','','','','2021-01-04 03:39:40','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'13','22731W','Disposed','WP','WRIT PETITION','2012','2013-01-14','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','SRI PRIYA RANJAN SEN','MR. TAPAN KUMAR BANERJEE','THE STATE OF WEST BENGAL & OTHERS.','','2012-10-08','','','','','','','','','','','','','','','2021-01-04 16:10:07','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'10','3021W','Disposed','WP','WRIT PETITION','2012','2013-02-12','HON`BLE JUSTICE BISWANATH SOMADDER','Murshidabad                   ','GOLAM SELIM HAQUE','BHAGABAT CHAUDHURI','THE STATE OF WEST BENGAL & ORS','','2012-02-13','','','','','','','','','','','','','','','2021-01-04 16:09:36','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,7,'6','1851W','Disposed','WP','WRIT PETITION','2005','2012-04-05','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','North 24-Parganas             ','TILESWAR SINGH','DEBESH HALDER','C E S C & ORS','','2005-01-31','','','','','','','','','','','','','','','2021-01-04 16:10:05','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'1','18158W','Disposed','WP','WRIT PETITION','2012','2013-01-04','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','SMT. PRAVABATI MONDAL','MR. PANKAJ HALDER','THE STATE OF WEST BENGAL & ORS','','2012-08-13','','','','','','','','','','','','','','','2021-01-04 16:13:20','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'1','12234W','Disposed','WP','WRIT PETITION','2012','2013-01-10','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Coochbehar                    ','SUMAN SUTRADHAR','JAKIR HOSSAIN','THE STATE OF WEST BENGAL AND ORS.','','2012-06-14','','','','','','','','','','','','','','','2021-01-04 03:44:10','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,6,'14','10321W','Disposed','WP','WRIT PETITION','2012','2013-01-14','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','MOSLIMA KHATUN (BEGUM)','MD. HARUN AL RASHID','THE WEST BENGAL BOARD OF MADRASAH EDUCATION & ORS.','','2012-05-14','','','','','','','','','','','','','','','2021-01-04 16:14:39','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'7','2683W','Disposed','WP','WRIT PETITION','2005','2005-03-21','HON`BLE JUSTICE MAHARAJ SINHA','Burdwan                       ','SUCHARITA CHOWDHURY','ALLEN FELIX','THE STATE OF WEST BENGAL & ORS','','2005-02-09','','','','','','','','CPAN/1091/2005','','','','','','','2021-01-04 16:13:39','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'2','18432W','Disposed','WP','WRIT PETITION','2012','2012-12-06','HON`BLE JUSTICE HARISH TANDON','Purulia                       ','PIJUSH KANTI MAHATA','MR. RUDRANIL DE','THE STATE OF WEST BENGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-04 16:15:53','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,9,'2','2294W','Disposed','WP','WRIT PETITION','2012','2012-01-21','HON`BLE JUSTICE INDIRA BANERJEE','South 24-Parganas             ','SRIPATI CHARAN JANA','TAMAL TARU PANDA','THE STATE OF WEST BENGAL AND ORS.','','2012-02-01','','','','','','','','','','','','','','','2021-01-04 03:46:51','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'15','25595W','Disposed','WP','WRIT PETITION','2012','2012-12-12','HON`BLE JUSTICE PATHERYA','Birbhum                       ','MD MUSTAKIM SK','BAIDURYA GHOSAL','W.B.S.E.D.C.L & ORS.','','2012-12-04','','','','','','','','','','','','','','','2021-01-04 16:18:12','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'3','26568W','Disposed','WP','WRIT PETITION','2012','2012-12-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','MD. JANU','CHANDI CHARAN DE','THE STATE OF WEST BENGAL AND ORS.','','2012-12-11','','','','','','','','','','','','','','','2021-01-04 03:49:19','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,7,'8','10035W','Disposed','WP','WRIT PETITION','2005','2005-04-13','HON`BLE JUSTICE MAHARAJ SINHA','North 24-Parganas             ','PROVASH DAS','SAKTI PADA JANA','THE STATE OF WEST BENGAL & ORS','','2005-04-13','','','','','','','','CPAN/1262/2005','','','','','','','2021-01-04 16:17:26','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'4','18409W','Disposed','WP','WRIT PETITION','2012','2012-12-10','HON`BLE JUSTICE HARISH TANDON','Dakshin Dinajpur              ','SACHINDRA MOHAN KARMAKAR','TARUN KUMAR DAS','THE STATE OF WEST BENGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-04 16:19:07','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'11','2318W','Disposed','WP','WRIT PETITION','2013','2013-02-18','HON`BLE JUSTICE ANIRUDDHA BOSE','Nadia                         ','JITENDRA BISWAS','DEBASHISH KUNDU','THE STATE OF WEST BENGAL & ORS','','2013-01-24','','','','','','','','','WP/2316W/2013','','','','','','2021-01-04 16:18:45','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,2,'15','8971W','Disposed','WP','WRIT PETITION','2012','2013-01-16','HON`BLE JUSTICE JOYMALYA BAGCHI||HON`BLE CHIEF JUSTICE ARUN MISHRA','Kolkata                       ','PEOPEL OF BETTER TRETMENT','TAPAS MIDYA','THE STATE OF WEST BENGAL & ORS','','2012-04-27','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-04 18:48:45','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'16','411','Disposed','WP.CT','WRIT PETITION','2012','2013-01-15','HON`BLE JUSTICE NISHITA MHATRE||HON`BLE JUSTICE ANINDITA ROY SARASWATI','Kolkata                       ','UNION OF INDIA & OTHERS','AMITABHA NAYAK','SHRI RAKESH RANJAN','','2012-11-26','','','','','','','','','','','','','','','2021-01-04 16:20:53','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,7,'9','13025W','Disposed','WP','WRIT PETITION','2005','2012-08-06','HON`BLE JUSTICE JOYMALYA BAGCHI','Coochbehar                    ','SOMANATH PAUL','ARABINDA CHATTERJEE','UNION OF INDIA & ORS','','2005-07-04','','','','','','','','','','','','','','','2021-01-04 16:19:57','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'5','18129W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DIPANKAR DATTA','South 24-Parganas             ','PAGASUS ASSETS RECONSTRUCTION PRIVATE LIMITED & ANR','SANJIV KUMAR TRIVEDI','THE STATE OF WEST BENGAL & ORS','','2012-08-13','','','','','','','','','','','','','','','2021-01-04 16:22:30','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'17','24569W','Disposed','WP','WRIT PETITION','2012','2012-11-29','HON`BLE JUSTICE BISWANATH SOMADDER','South 24-Parganas             ','JAYANTA PODDAR','AMAR NATH SEN','THE STATE OF WEST BENGAL & OTHERS','','2012-11-20','','','','','','','','','','','','','','','2021-01-04 16:23:45','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,2,'13','17076W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','PANCHANAN PRASHAN','SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL & ORS','','2012-08-01','','','','','','','','','','','','','','','2021-01-04 18:53:00','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'10','23787W','Disposed','WP','WRIT PETITION','2005','2011-01-06','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA||HON`BLE JUSTICE ASIM KUMAR RAY','Birbhum                       ','ABHIMANI DAS','RAJENDRA BANERJEE','THE STATE OF WEST BENGAL & ORS','','2005-12-12','','','','','','','','','','','','','','','2021-01-04 16:23:20','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'12','2316W','Disposed','WP','WRIT PETITION','2013','2013-02-18','HON`BLE JUSTICE ANIRUDDHA BOSE','Nadia                         ','MIHIR BISWAS','DEBASHISH KUNDU','THE STATE OF WEST BENGAL & ORS','','2013-01-24','','','','','','','','','WP/2318W/2013','','','','','','2021-01-04 16:24:10','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,8,'3','18499W','Disposed','WP','WRIT PETITION','2012','2012-12-18','HON`BLE JUSTICE HARISH TANDON','Purba Medinipur               ','JASODANANDAN BHUNIA','TANUJA BASAK','THE STATE OF WEST BENGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-04 16:25:53','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'18','4561W','Disposed','WP','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE SOUMITRA PAL','Howrah                        ','SHRI SUPRIYO DOLUI','RAMAPRASAD SARKAR','STATE OF WST BENGAL & ORS.','','2012-03-02','','','','','','','','','','','','','','','2021-01-04 16:27:00','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'4','12905W','Disposed','WP','WRIT PETITION','2012','2012-12-20','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Purba Medinipur               ','BANDANA SARKAR','RAM CHANDRA GUCHHAIT','THE STATE OF WEST BENGAL AND ORS.','','2012-06-21','','','','','','','','','','','','','','','2021-01-04 03:57:00','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,2,'16','21920W','Disposed','WP','WRIT PETITION','2012','2013-01-15','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','MAINOR DIPANJAN KARMAKAR','SANKAR SARKAR','THE STATE OF WEST BENGAL & ORS','','2012-09-26','','','','','','','','','','','','','','','2021-01-04 18:55:39','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'13','23078W','Disposed','WP','WRIT PETITION','2012','2013-12-05','HON`BLE JUSTICE DEBASISH KAR GUPTA','Coochbehar                    ','RAFIKUL ISLAM','NIRAJ GUPTA','STATE OF WEST BENGAL & ORS','','2012-10-10','','','','','','','','','','','','','','','2021-01-04 16:26:49','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'11','17314W','Disposed','WP','WRIT PETITION','2001','2012-06-28','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','HARI PRASAD MONDAL','ARUN KUMAR RAY','THE STATE OF WEST BENGAL & ORS','','2001-11-27','','','','','','','','','WP/6952/2001','','','','','','2021-01-04 16:26:12','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,8,'6','18751W','Disposed','WP','WRIT PETITION','2012','2012-12-20','HON`BLE JUSTICE HARISH TANDON','North 24-Parganas             ','ABANI KUMAR MRIDHA','MISS ANITA KHATTRI','THE STATE OF WEST BENGAL & ORS','','2012-08-23','','','','','','','','','','','','','','','2021-01-04 16:28:26','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'19','26267W','Disposed','WP','WRIT PETITION','2012','2012-12-17','HON`BLE JUSTICE DEBASISH KAR GUPTA','Burdwan                       ','NIBEDITA SARKAR','ARUN KHUTIA','THE STATE OF WEST BENGAL & ORS.','','2012-12-10','','','','','','','','','','','','','','','2021-01-04 16:29:30','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,2,'17','21207W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','SUBHAS CHANDRA GHOSH','SABITA KHUNTIA BHUNYA','THE STATE OF WEST BENGAL & ORS','','2012-09-18','','','','','','','','','','','','','','','2021-01-04 18:58:15','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,9,'5','21200W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Jalpaiguri                    ','HEM KANTI ROY','SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL AND ORS.','','2012-09-18','','','','','','','','','','','','','','','2021-01-04 04:00:14','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'20','2229W','Disposed','WP','WRIT PETITION','2012','2013-01-21','HON`BLE JUSTICE INDIRA BANERJEE','North 24-Parganas             ','ANANGAMOHAN ROY','SABITA KHUTIA (BHUNYA)','THE STATE OF WEST BENGAL & ORS.','','2012-02-02','','','','','','','','','','','','','','','2021-01-04 16:31:59','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'7','18258W','Disposed','WP','WRIT PETITION','2012','2012-12-20','HON`BLE JUSTICE JOYMALYA BAGCHI||HON`BLE CHIEF JUSTICE ARUN MISHRA','Burdwan                       ','SHIB KINKAR GHOSH','MR. CHITTAPRIYA GHOSH','THE STATE OF WEST BENGAL & ORS','','2012-08-14','','','','','','','','','','','','','','','2021-01-04 16:31:24','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,2,'18','23737W','Disposed','WP','WRIT PETITION','2012','2013-01-16','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','SATYABRATA MOITRA','SUTAPA ROYCHOUDHURY','THE KOLKATA MUNICIPAL CORPORATION & OTHERS','','2012-10-16','','','','','','','','','','','','','','','2021-01-04 19:00:42','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'14','15273W','Disposed','WP','WRIT PETITION','2011','2012-12-05','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Kolkata                       ','DR. ASHIM KUMAR CHATERJREE','MRS. NAMITA BASU','THE UNION OF INDIA & OTHERS','','2011-09-07','','','','','','','','','','','','','','','2021-01-04 16:31:38','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'12','6952W','Disposed','WP','WRIT PETITION','2001','2012-06-28','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','SRI MANAS KUMAR JODDAR','MRINAL KUMAR CHANDA','DISTRICT INSPECTOR OF SCHOOLS & ORS','','2001-05-09','','','','','','','','','WP/17314 W/2001','','','','','','2021-01-04 16:31:11','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,9,'6','25964W','Disposed','WP','WRIT PETITION','2012','2013-02-06','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','JNANENDRA NATH MAHATA','SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL AND ORS.','','2012-12-06','','','','','','','','','','','','','','','2021-01-04 04:03:16','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,6,'21','14813W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','MURALIDHAR MANDAL','MRS. SABITA KHUTIA(BHUNYA)','THE STATE OF WEST BENGAL & ORS.','','2012-07-12','','','','','','','','','','','','','','','2021-01-04 16:34:16','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,2,'19','18652W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Paschim Medinipur             ','REKHA SARKAR','PRITIKANA GANTAIT','THE STATE OF WEST BENGAL & ORS','','2012-08-22','','','','','','','','','','','','','','','2021-01-04 19:03:18','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,8,'8','18775W','Disposed','WP','WRIT PETITION','2012','2012-12-21','HON`BLE JUSTICE JOYMALYA BAGCHI||HON`BLE CHIEF JUSTICE ARUN MISHRA','South 24-Parganas             ','NIRMALENDU NAIYA','INDRANATH MITRA','THE STATE OF WEST BENGAL & ORS','','2012-08-23','','','','','','','','','','','','','','','2021-01-04 16:34:59','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'7','26453W','Disposed','WP','WRIT PETITION','2012','2013-02-14','HON`BLE JUSTICE PATHERYA','Birbhum                       ','MIR KASEM','KISHORE MUKHERJEE','W.B.S.E.D. COMPANY LTD.','','2012-12-11','','','','','','','','','','','','','','','2021-01-04 04:05:45','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'13','14008W','Disposed','WP','WRIT PETITION','2003','2005-09-13','HON`BLE JUSTICE ARUN KUMAR MITRA','Howrah                        ','SAILEN CHANDRA MALIK','SOMIR KUMAR DAS KAR','THE STATE OF WEST BENGAL & ORS','','2003-09-10','','','','','','','','','','','','','','','2021-01-04 16:33:53','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'15','21723W','Disposed','WP','WRIT PETITION','2012','2012-09-27','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','NISHI KANTA JANA','SAKTI PADA JANA','THE STATE OF WEST BENGAL & OTHERS','','2012-09-25','','','','','','','','','','','','','','','2021-01-04 16:34:50','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'9','18675W','Disposed','WP','WRIT PETITION','2012','2012-12-04','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','South 24-Parganas             ','BALLYGUNGE MAHARAJA RESIDENTS WELFARE ASSOCIATION','MISS TANUTA GURAY','THE KOLKATA MUNICIPAL CORPORATION & ORS','','2012-08-22','','','','','','','','','','','','','','','2021-01-04 16:37:21','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'8','17592W','Disposed','WP','WRIT PETITION','2012','2012-12-19','HON`BLE JUSTICE SOUMITRA PAL','Purba Medinipur               ','MANI GHORAI','RITA PATRA','THE STATE OF WEST BENGAL AND ORS.','','2012-08-03','','','','','','','','','','','','','','','2021-01-04 04:07:56','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,9,'9','26303W','Disposed','WP','WRIT PETITION','2012','2012-12-17','HON`BLE JUSTICE DEBASISH KAR GUPTA','Burdwan                       ','HARINARAYAN MUKHERJEE','ARUN KHUTIA','THE STATE OF WEST BENGAL AND ORS.','','2012-12-10','','','','','','','','','','','','','','','2021-01-04 04:09:43','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'10','18895W','Disposed','WP','WRIT PETITION','2012','2012-12-06','HON`BLE JUSTICE SOUMITRA PAL','North 24-Parganas             ','MD. SAMSUR ALAM','GDEBASIS GUIN.','THE STATE OF WEST BENGAL & ORS','','2012-08-24','','','','','','','','','','','','','','','2021-01-04 16:39:38','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'16','7336W','Disposed','WP','WRIT PETITION','2012','2013-01-10','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Hooghly                       ','SHRI PRADIP KUMAR PRAMANIK','SUBODH BANERJEE','THE MAYOR,CHANDERNAGORE MUNICIPAL CORPORATION & ORS','','2012-04-05','','','','','','','','','','','','','','','2021-01-04 16:40:08','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,9,'10','6380W','Disposed','WP','WRIT PETITION','2012','2013-01-29','HON`BLE JUSTICE JOYMALYA BAGCHI||HON`BLE CHIEF JUSTICE ARUN MISHRA','Purba Medinipur               ','SRI BALAI MONDAL','AMIT BARAN DAS','THE STATE OF WEST BENGAL AND ORS.','','2012-03-27','','','','','','','','','','','','','','','2021-01-04 04:11:35','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'11','18288W','Disposed','WP','WRIT PETITION','2012','2012-09-26','HON`BLE JUSTICE DR. SAMBUDDHA CHAKRABARTI','Jalpaiguri                    ','REGIONAL PROVIDENT FUND COMMISSIONER WEST BENGAL & ANR','MR. SHIV CHANDRA PRASAD','EMPLOYEES PROVIDENT FUND APPELLATE TRIBUNAL NEW DELHI & AMNOTHER','','2012-08-13','','','','','','','','','','','','','','','2021-01-04 16:42:41','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'11','22596W','Disposed','WP','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','MD. HABIB MOLLA','MR.  HIRANMAY PAIK','THE STATE OF WEST BENGAL AND ORS.','','2012-10-05','','','','','','','','','','','','','','','2021-01-04 04:13:30','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,7,'14','13548W','Disposed','WP','WRIT PETITION','2002','2005-01-27','HON`BLE JUSTICE BHASKAR BHATTACHARYA','North 24-Parganas             ','ALL BACKWARD CLASSES RELIEF AND DEVLOPMENT MISSION','KHANDEKAR MOAZZEM HOSSAIN','BACKWARD CLASSES WELFARE DEPARTMENT','','2002-09-11','','','','','','','','','','','','','','','2021-01-04 16:42:16','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'12','23338W','Disposed','WP','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE BISWANATH SOMADDER','South 24-Parganas             ','FATEMA BEWA','SUMITA GHOSAL','THE STATE OF WEST BENGAL AND ORS.','','2012-10-11','','','','','','','','','','','','','','','2021-01-04 04:15:13','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'12','18463W','Disposed','WP','WRIT PETITION','2012','2012-12-03','HON`BLE JUSTICE HARISH TANDON','Howrah                        ','PRITHA NASKAR','TANUJA BASAK','THE STATE OF WEST BENGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-04 16:44:57','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'17','24830W','Disposed','WP','WRIT PETITION','2012','2013-02-11','HON`BLE JUSTICE DIPANKAR DATTA','North 24-Parganas             ','DR.SUBHASH CHANDRA DAS','KAUSHIK CHANDRA GUPTA','WEST BENGAL MEDICAL COUNCIL AND OTHERS','','2012-11-26','','','','','','','','','','','','','','','2021-01-04 16:44:08','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'13','22532W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','ARUN KUMAR HALDER','PANKAJ HALDER','THE STATE OF WEST BENGAL AND ORS.','','2012-10-04','','','','','','','','','','','','','','','2021-01-04 04:16:30','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'13','18822W','Disposed','WP','WRIT PETITION','2012','2012-12-05','HON`BLE JUSTICE SOUMITRA PAL','Howrah                        ','MINU DUTTA','TANUJA BASAK','THE STATE OF WEST BENGAL & ORS','','2012-08-23','','','','','','','','','','','','','','','2021-01-04 16:46:26','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,7,'15','16695W','Disposed','WP','WRIT PETITION','2006','2012-03-14','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','NARAYAN CHANDRA GHOSH','MR NABANKUR PAUL','THE FOOD CORPORATION OF INDIA & ORS','','2006-07-11','','','','','','','','','','','','','','','2021-01-04 16:45:37','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'18','17947W','Disposed','WP','WRIT PETITION','2012','2013-02-07','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Kolkata                       ','REBA MUKHERJEE','SHATARUPA GHOSH','KOLKATA MUNICIPAL CORPORATION & ORS','','2012-08-10','','','','','','','','','','','','','','','2021-01-04 16:46:28','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'14','21826W','Disposed','WP','WRIT PETITION','2012','2012-12-20','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','South 24-Parganas             ','MEHER NIGAR','IMDADUL BISWAS','THE STATE OF WEST BENGAL AND ORS.','','2012-09-26','','','','','','','','','','','','','','','2021-01-04 04:17:58','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,8,'14','18206W','Disposed','WP','WRIT PETITION','2012','2012-12-19','HON`BLE JUSTICE HARISH TANDON','Nadia                         ','AKHIL KUMAR DATTA','SANKAR HALDER','THE STATE OF WEST BENGAL','','2012-08-14','','','','','','','','','','','','','','','2021-01-04 16:48:29','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'1','27923W','Disposed','WP','WRIT PETITION','2012','2012-12-21','HON`BLE JUSTICE DEBASISH KAR GUPTA','Coochbehar                    ','BISWANATH BARMAN','SUBHRANGSU PANDA','THE STATE OF WEST BENGAL & ORS.','','2012-12-19','','','','','','','','','','','','','','','2021-01-04 16:49:41','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'15','21390W','Disposed','WP','WRIT PETITION','2012','2013-01-11','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','SUMAN KUMAR NAYAK','MANAS DAS','THE STATE OF WEST BENGAL AND ORS.','','2012-09-21','','','','','','','','','','','','','','','2021-01-04 04:19:41','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'19','1542W','Disposed','WP','WRIT PETITION','2013','2013-01-22','HON`BLE JUSTICE DEBASISH KAR GUPTA','Coochbehar                    ','GANESH CHANDRA ROY','SUBHRANGSHU PANDA','THE STATE OF WEST BENGAL & OTHERS','','2013-01-17','','','','','','','','','','','','','','','2021-01-04 16:49:19','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'15','18980W','Disposed','WP','WRIT PETITION','2012','2012-12-13','HON`BLE JUSTICE SOUMITRA PAL','Malda                         ','ANKUR KUMAR GHOSH & ORS','RAFIKUL ISLAM SARDAR','THE STATE OF WEST BENGAL & ORS','','2012-08-27','','','','','','','','','','','','','','','2021-01-04 16:50:44','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'16','24331W','Disposed','WP','WRIT PETITION','2005','2012-05-14','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Paschim Medinipur             ','SUDAMA TIWARY','ACHIN KUMAR MAJUMDER','UNION OF INDIA & ORS','','2005-12-19','','','','','','','','','','','','','','','2021-01-04 16:50:04','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,10,'2','18433W','Disposed','WP','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','North 24-Parganas             ','RANJIT CHAKRABORTY','MR. ZIAUL ISLAM','THE BHATPARA MUNICIPALITY & ORS.','','2012-08-17','','','','','','','','','','','','','','','2021-01-04 16:52:45','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'16','18767W','Disposed','WP','WRIT PETITION','2012','2012-12-06','HON`BLE JUSTICE SOUMITRA PAL','Malda                         ','SARFARAJ AHMED','TANUJA BASAK','THE STATE OF WEST BENGAL & ORS','','2012-08-23','','','','','','','','','','','','','','','2021-01-04 16:52:38','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'20','1383W','Disposed','WP','WRIT PETITION','2013','2013-01-18','HON`BLE JUSTICE DEBASISH KAR GUPTA','Burdwan                       ','SK.SAMSUDDIN','DWARIKANATH MUKHERJEE','THE STATE OF WEST BENGAL & ORS','','2013-01-16','','','','','','','','','','','','','','','2021-01-04 16:52:19','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,9,'17','133','Disposed','WP.ST','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE NISHITA MHATRE||HON`BLE JUSTICE ANINDITA ROY SARASWATI','South 24-Parganas             ','LUTFA BEGUM','ZIAUL ISLAM','THE STATE OF WEST BENGAL AND ORS.','','2012-04-20','','','','','','','','','','','','','','','2021-01-04 04:23:52','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,7,'17','15766W','Disposed','WP','WRIT PETITION','2005','2012-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','North 24-Parganas             ','SAILEN CHANDRA DAS','DIPAK KRISHNA MITRA','THE STATE OF WEST BENGAL & ORS','','2005-08-12','','','','','','','','','','','','','','','2021-01-04 16:52:37','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'3','22505W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE DIPANKAR DATTA','Paschim Medinipur             ','ANIMA KERIYA','JAYANTA DAS','THE STATE OF WEST BENGAL & ORS.','','2012-10-05','','','','','','','','','','','','','','','2021-01-04 16:54:54','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,8,'17','18686W','Disposed','WP','WRIT PETITION','2012','2012-12-21','HON`BLE JUSTICE JOYMALYA BAGCHI||HON`BLE CHIEF JUSTICE ARUN MISHRA','Purba Medinipur               ','SRI CHANDAN MANNA & ORS','BHARAT CHANDRA SIMAI','THE CHAIRMAN STATE ELECTRICITY DISTRIBUTION COMPANY LTD & ORS','','2012-08-22','','','','','','','','','','','','','','','2021-01-04 16:55:38','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'18','2329W','Disposed','WP','WRIT PETITION','2012','2013-01-21','HON`BLE JUSTICE INDIRA BANERJEE','Howrah                        ','SANTOSH KUMAR PRAMANIK','SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL AND ORS.','','2012-02-02','','','','','','','','','','','','','','','2021-01-04 04:26:03','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'4','22524W','Disposed','WP','WRIT PETITION','2012','2013-01-11','HON`BLE JUSTICE DIPANKAR DATTA','Howrah                        ','SUDHARSHAN DHARI MONDAL & ORS.','RANJAN SAHA','THE STATE OF WEST BENGAL & ORS.','','2008-09-01','','','','','','','','','','','','','','','2021-01-04 16:57:51','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'21','481W','Disposed','WP','WRIT PETITION','2013','2013-02-16','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','BISHNUPADA ROY CHOWDHURY','MS. SUSMITA DEY','THE STATE OF WEST BENGAL & ORS','','2013-01-08','','','','','','','','','','','','','','','2021-01-04 16:56:20','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'5','21312W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','GOURISANKAR MUKHOPADHYAY','MRS. SABITA KHUTIA (BHUNYA)','THE STATE OF WEST BENGAL & ORS.','','2012-09-19','','','','','','','','','','','','','','','2021-01-04 17:00:12','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'22','2135W','Disposed','WP','WRIT PETITION','2013','2013-01-30','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','DILIP KUMAR BHANJA','MS. SUSMITA DEY','THE STATE OF WEST BENGAL & ORS','','2013-01-22','','','','','','','','','','','','','','','2021-01-04 16:59:11','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,11,'1','15438W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','UMAPADA LAYEK','SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL & ORS','','2012-07-18','','','','','','','','','','','','','','','2021-01-04 19:30:44','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'23','18186W','Disposed','WP','WRIT PETITION','2012','2012-09-05','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','SUSHANTA KUMAR GHOSH & ORS','MR. LAKSHIMINATH BHATTACHARYA','THE STATE OF WEST BENGAL & ORS','','2012-08-14','','','','','','','','','','','','','','','2021-01-04 17:02:09','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'2','15306W','Disposed','WP','WRIT PETITION','2012','2012-11-26','HON`BLE JUSTICE SOUMITRA PAL','Hooghly                       ','DR ASOKE KUMAR DAS','SALIL KUMAR SARKAR','THE STATE OF WEST BENGAL & ORS','','2012-07-18','','','','','','','','','','','','','','','2021-01-04 19:32:22','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,9,'19','19553W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Jalpaiguri                    ','MAHIUDDIN AHAMED','SAKTI PADA JANA','THE STATE OF WEST BENGAL AND OTHERS','','2012-08-30','','','','','','','','','','','','','','','2021-01-04 04:34:33','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'6','1075W','Disposed','WP','WRIT PETITION','2012','2013-02-05','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Kolkata                       ','M/S. CALCUTTA JUTE MANUFACTURING CO.LTD. & ANR.','DALIA BHATTACHERJEE','STATE OF WEST BENGAL & ORS.','','2012-01-17','','','','','','','','','','','','','','','2021-01-04 17:04:47','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'3','15747W','Disposed','WP','WRIT PETITION','2012','2012-10-16','HON`BLE JUSTICE SOUMITRA PAL','Howrah                        ','GOUTAM KUMAR BOSE','ANASUYA BHATTACHARYA','THE STATE OF WEST BENGAL & ORS','','2012-07-20','','','','','','','','','','','','','','','2021-01-04 19:34:44','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'24','1770W','Disposed','WP','WRIT PETITION','2013','2013-01-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','Howrah                        ','JIBAN KRSIHAN RIT','MRS. SABITA KHUTIA(BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2013-01-18','','','','','','','','','','','','','','','2021-01-04 17:05:24','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'20','21118W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Jalpaiguri                    ','KRISHNALAL CHAKRABORTY','SUBHRANGSU PANDA','THE STATE OF WEST BENGAL AND OTHERS','','2012-09-18','','','','','','','','','','','','','','','2021-01-04 04:36:47','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'7','440','Disposed','WP.CT','WRIT PETITION','2012','2013-01-10','HON`BLE JUSTICE NISHITA MHATRE||HON`BLE JUSTICE ANINDITA ROY SARASWATI','Kolkata                       ','UNION OF INDIA & ORS.','MRS. CHAITALI BHATTACHARYYA','SHRI SUBHAS CHANDRA SARKAR','','2012-12-10','','','','','','','','','','','','','','','2021-01-04 17:08:00','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,11,'4','15910W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Jalpaiguri                    ','AJI9T KUMAR RAY','SUBHARNGSU PANDA','THE STATE OF WEST BENGAL & ORS','','2013-07-23','','','','','','','','','','','','','','','2021-01-04 19:36:58','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'25','27606W','Disposed','WP','WRIT PETITION','2012','2012-10-21','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','North 24-Parganas             ','SRI ARABINDA SAHA','MS. SUSMITA DEY(BASU)','THE STATE OF WEST BENGAL & ORS','','2012-12-18','','','','','','','','','','','','','','','2021-01-04 17:07:47','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'21','415','Disposed','WP.ST','WRIT PETITION','2012','2013-01-15','HON`BLE JUSTICE NISHITA MHATRE||HON`BLE JUSTICE ANINDITA ROY SARASWATI','South 24-Parganas             ','TUSHAR HALDER','ARINDAM MONDAL','THE STATE OF WEST BENGAL AND OTHERS','','2012-11-29','','','','','','','','','','','','','','','2021-01-04 04:39:15','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,11,'5','15680W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Jalpaiguri                    ','MD MOZAMMEL HAQUE','MR SAKTI PADA JANA','THE STATE OF WEST BENGAL & ORS','','2012-07-20','','','','','','','','','','','','','','','2021-01-04 19:39:05','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'18','18185W','Disposed','WP','WRIT PETITION','2012','2012-09-05','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','BIMAL KUMAR MONDAL & ORS','MR. LAKSHMINATH BHATTACJHARYA','THE STATE OF WEST BENGAL & ORS','','2012-08-14','','','','','','','','','','','','','','','2021-01-04 17:11:12','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'26','2105W','Disposed','WP','WRIT PETITION','2013','2013-02-01','HON`BLE JUSTICE DEBASISH KAR GUPTA','Howrah                        ','MANIKANA BERA(CHAUDHURI)','SABITA KHUTIA(BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2013-01-22','','','','','','','','','','','','','','','2021-01-04 17:10:31','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,9,'22','21836W','Disposed','WP','WRIT PETITION','2012','2013-01-14','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','MANAGING COMMITEE CHANDPUR MSK','SARBANANDA SANYAL','THE STATE OF WEST BENGAL AND OTHERS','','2012-09-26','','','','','','','','','','','','','','','2021-01-04 04:41:59','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'6','15126W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','NEMAI CHANDRA DEY','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS','','2012-07-17','','','','','','','','','','','','','','','2021-01-04 19:40:43','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'23','20438W','Disposed','WP','WRIT PETITION','2012','2012-12-20','HON`BLE JUSTICE SOUMITRA PAL','Darjeeling                    ','SMT. SASWATI DUTTA','SUNIL KUMAR PAL','THE STATE OF WEST BENGAL AND OTHERS','','2012-09-10','','','','','','','','','','','','','','','2021-01-04 04:43:58','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'27','636W','Disposed','WP','WRIT PETITION','2013','2013-01-18','HON`BLE JUSTICE SOUMITRA PAL','South 24-Parganas             ','BASANTI RANI SHIT','MR. DILIP KUMAR SHYAMAL','THE STATE OF WEST BENGAL & OTHERSTHE STATE OF WEST BENGAL & ORS','','2013-01-09','','','','','','','','','','','','','','','2021-01-04 17:12:44','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'7','15441W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','PANCHANAN SAHA','SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL & ORS','','2012-07-18','','','','','','','','','','','','','','','2021-01-04 19:42:42','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'19','18946W','Disposed','WP','WRIT PETITION','2012','2012-12-17','HON`BLE JUSTICE SOUMITRA PAL','Paschim Medinipur             ','SUKLA BASU ROY (GHOSH)','MR. SAYAN DE','THE STATE OF WEST BENGAL & ORS','','2012-08-24','','','','','','','','','','','','','','','2021-01-04 17:14:34','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,9,'24','19616W','Disposed','WP','WRIT PETITION','2012','2012-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Birbhum                       ','MANSUR ALAM','YUDHAJIT GUHA','THE STATE OF WEST BENGAL AND OTHERS','','2012-09-30','','','','','','','','','','','','','','','2021-01-04 04:46:23','priya golder','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'8','15358W','Disposed','WP','WRIT PETITION','2012','2012-08-21','HON`BLE JUSTICE DEBASISH KAR GUPTA','Nadia                         ','PROVASH KUMAR BISWAS','DILIP KUMAR MAITY','THE STATE OF WEST BENGAL & ORS','','2012-07-18','','','','','','','','','','','','','','','2021-01-04 19:44:51','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,8,'20','17045W','Disposed','WP','WRIT PETITION','2012','2012-12-13','HON`BLE JUSTICE SOUMITRA PAL','Murshidabad                   ','ABUL HASMAT SK','MR. S.K. HUMAYAN REZA','THE STATE OF WEST BENGAL & ORS','','2012-08-01','','','','','','','','','','','','','','','2021-01-04 17:16:33','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'28','27957W','Disposed','WP','WRIT PETITION','2012','2013-01-31','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','SMT.RANJEETA KAR','MR.HIRANMAY BHATTACHARYYA','THE KOLKATA MUINICIPAL CORPORATION & ORS','','2012-12-19','','','','','','','','','','','','','','','2021-01-04 17:16:54','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'9','15131W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Paschim Medinipur             ','RUMAPATI MAHATA','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS','','2012-07-17','','','','','','','','','','','','','','','2021-01-04 19:46:36','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'25','2085W','Disposed','WP','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE INDIRA BANERJEE','Bankura                       ','NANUPADA ROY','ARUNAVA PATI','THE STATE OF WEST BENGAL AND OTHERS','','2012-02-01','','','','','','','','','','','','','','','2021-01-04 04:48:34','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,10,'8','23120W','Disposed','WP','WRIT PETITION','2012','2013-02-07','HON`BLE JUSTICE PRASANJIT MANDAL','Kolkata                       ','MS. RIDDHIDIPA BHOWMICK & OTHER','MR. MUKTINARAYAN BANERJEE||MR. MAYUKHMOY ADHIKARI','STATE OF WEST BENGAL & OTHERS.','','2012-10-10','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-04 17:19:07','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'10','15455W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','BANSHI BADAN MUKHOPADHYAY','SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL & ORS','','2012-07-18','','','','','','','','','','','','','','','2021-01-04 19:49:15','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,4,'29','1750W','Disposed','WP','WRIT PETITION','2013','2013-01-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','Howrah                        ','SHIB SADHAN MAITYA','MRS. SABITA KHUTIA(BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2013-01-18','','','','','','','','','','','','','','','2021-01-04 17:19:49','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'9','25221W','Disposed','WP','WRIT PETITION','2012','2013-01-24','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','MD. AKBAR ALI.','AINUL HAQUE','THE STATE OF WEST BENGAL & OTHERS.','','2012-11-30','','','','','','','','','','','','','','','2021-01-04 17:21:29','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,9,'16','286W','Disposed','WP','WRIT PETITION','2013','2013-01-18','HON`BLE JUSTICE DEBASISH KAR GUPTA','Paschim Medinipur             ','CHANDI CHARAN GHOSH','PULAK RANJAN MONDAL','THE ADMINISTRATION BOARD OF SECONDARY EDUCATION OF WEST BENGAL AND OTHERS','','2013-01-07','','','','','','','','','','','','','','','2021-01-04 04:51:29','priya golder','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,11,'11','15677W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Jalpaiguri                    ','RAJENDRA NATH BARMAN','MR SAKTI PADA JANA','THE STATE OF WEST BENGAL & ORS','','2012-07-20','','','','','','','','','','','','','','','2021-01-04 19:51:10','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'10','22057W','Disposed','WP','WRIT PETITION','2012','2012-12-04','HON`BLE JUSTICE BISWANATH SOMADDER','North 24-Parganas             ','SMT. KANIKA MONDAL (BACHAR)','SANKAR SARKAR','STATE OF WEST BENGAL & ORS.','','2012-09-27','','','','','','','','','','','','','','','2021-01-04 17:23:50','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'30','1941W','Disposed','WP','WRIT PETITION','2013','2013-01-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','AJOY KUMAR PATI','YUDHAJIT GUHA','THE STATE OF WEST BENGAL & ORS','','2013-01-21','','','','','','','','','','','','','','','2021-01-04 17:22:26','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,11,'12','15433W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','TARAPADA JHARIMUNYA','MRS SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL & ORS','','2012-07-18','','','','','','','','','','','','','','','2021-01-04 19:53:01','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'11','26913W','Disposed','WP','WRIT PETITION','2012','2013-02-04','HON`BLE JUSTICE HARISH TANDON','Birbhum                       ','NITYA GOPAL MONDAL.','TARUN KUMAR DAS','THE STATE OF WEST BENGAL & ORS.','','2012-12-12','','','','','','','','','','','','','','','2021-01-04 17:25:55','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'31','26290W','Disposed','WP','WRIT PETITION','2012','2013-02-13','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','BENOY KRISHNA BISWAS','SABITA KHATUA(BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2012-12-10','','','','','','','','','','','','','','','2021-01-04 17:24:26','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,11,'13','15399W','Disposed','WP','WRIT PETITION','2012','2013-01-04','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Murshidabad                   ','UMA SARKAR','MR ARINDAM CHATERJEE','THE STATE OF WEST BENGAL & ORS','','2012-07-18','','','','','','','','','','','','','','','2021-01-04 19:54:36','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'12','17072W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','SUBHAS CHANDRA DAS','MRS. SABITA KHUTIA (BHUNYA)','THE STATE OF WEST BENGAL & ORS.','','2012-08-01','','','','','','','','','','','','','','','2021-01-04 17:27:57','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,4,'32','3854W','Disposed','WP','WRIT PETITION','2013','2013-02-11','HON`BLE JUSTICE DEBASISH KAR GUPTA','Nadia                         ','KAMALAKSHI BISWAS','MRS.SABITA KHUTIA(BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2013-02-07','','','','','','','','','','','','','','','2021-01-04 17:26:34','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,8,'21','18502W','Disposed','WP','WRIT PETITION','2012','','','Murshidabad                   ','RUBAL ALI & ORS','CHAMPAK GHOSH','STATE OF WEST BENGAL & OTHER','','2012-08-17','','','','','','','','','','','','','','','2021-01-04 17:29:14','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'14','15914W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Jalpaiguri                    ','BINODE RANJAN CHAKRABORTY','SUBHARANGSU PANDA','THE STATE OF WEST BENGAL & ORS','','2012-07-23','','','','','','','','','','','','','','','2021-01-04 19:58:26','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'15','15440W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','SADANANDA KUNDU','MRS SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL & ORS','','2012-07-18','','','','','','','','','','','','','','','2021-01-05 12:46:22','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,12,'1','431','Disposed','WPLRT','WRIT PETITION','2005','2005-08-02','HON`BLE JUSTICE GANGULY||HON`BLE JUSTICE ASIT KUMAR BISI','South 24-Parganas             ','SRI SUDHIR CHANDRA SHAW','MR. GAUTAM SAPHUI','THE STATE OF WEST BENGAL AND OTHERS','','2005-07-08','','','','','','','','','','','','','','','2021-01-05 10:20:43','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'16','15105W','Disposed','WP','WRIT PETITION','2012','2012-09-18','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Purulia                       ','PABAN CHANDRA MAHATO','MRS KABERI GHOSH (DEY)','THE STATE OF WEST BENGAL & ORS','','2012-07-17','','','','','','','','','','','','','','','2021-01-05 12:49:35','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'17','15156W','Disposed','WP','WRIT PETITION','2012','2012-08-06','HON`BLE JUSTICE DIPANKAR DATTA','Murshidabad                   ','SMT BULBUL DEY DAS','MR MRINMAY BHATTACHARYA','THE STATE OF WEST BENGAL & ORS','','2012-07-17','','','','','','','','','','','','','','','2021-01-05 12:51:00','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,12,'2','445W','Disposed','WP','WRIT PETITION','2005','2005-11-22','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA','Burdwan                       ','GRAMA PROSAD ROY & ANR','MD. HASDANUZ ZAMAN','THE SECRETARY, WBSE B & ORS','','2005-01-12','','','','','','','','CPAN/582/2005','','','','','','','2021-01-05 10:24:09','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'18','15818W','Disposed','WP','WRIT PETITION','2012','2012-09-25','HON`BLE JUSTICE BISWANATH SOMADDER','South 24-Parganas             ','SANTOSHPUR CONSUMERS COOPERATIVE STORE LIMITED & ANR','SUPRATICK SYAMAL','THE STATE OF WEST BENGAL & ORS','','2012-07-20','','','','','','','','','','','','','','','2021-01-05 12:54:08','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'3','495W','Disposed','WP','WRIT PETITION','2005','2005-12-05','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA','North 24-Parganas             ','SWAPAN PRASANNA MUKHERJEE','SK. FARIDULLAH','STATE OF WEST BENGAL & ORS','','2005-01-13','','','','','','','','','','','','','','','2021-01-05 10:26:13','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,11,'19','15463W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','SURAPATI TRIPATHY','MR PRASANTA BEHARI MAHATA','THE STATE OF WEST BENGAL & ORS','','2012-07-18','','','','','','','','','','','','','','','2021-01-05 12:55:53','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'20','15814W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE PATHERYA','Dakshin Dinajpur              ','M/S MULTIPURPOSE COLD STORAGE PVT LTD & ANR','SAIKAT GHOSAL','THE STATE OF WEST BENGAL & ORS','','2012-07-20','','','','','','','','','','','','','','','2021-01-05 12:58:05','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'4','577','Disposed','WP.ST','WRIT PETITION','2005','2005-09-19','HON`BLE JUSTICE GANGULY||HON`BLE JUSTICE TAPAN KUMAR DUTT','Bankura                       ','SRI TUSHAR KANTI DUTTA','MR. ANADI BANRERJEE','STATE OF WEST BENGAL & ORS','','2005-08-24','','','','','','','','','','','','','','','2021-01-05 10:29:29','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,11,'21','15868W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE DEBASISH KAR GUPTA','Hooghly                       ','KAMALA RANI HAZRA','MD AHIYA','THE STATE OF WEST BENGAL & ORS','','2012-07-23','','','','','','','','','','','','','','','2021-01-05 12:59:20','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'5','585','Disposed','WPLRT','WRIT PETITION','2005','2005-09-05','HON`BLE JUSTICE GANGULY||HON`BLE JUSTICE TAPAN KUMAR DUTT','Hooghly                       ','SRI NEMAI CHANDRA ROY','AMBU BINDU CHAKRABORTY','WEST BENGAL LAND REFORMS TENANCY TRIBUNAL & ORS','','2005-08-26','','','','','','','','','','','','','','','2021-01-05 10:31:49','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'6','622','Disposed','WP.ST','WRIT PETITION','2005','2005-09-20','HON`BLE JUSTICE GANGULY||HON`BLE JUSTICE TAPAN KUMAR DUTT','South 24-Parganas             ','GOPAL CHANDRA MONDAL & ORS','ANGSHUMOY GUHA','THE STATE OF WEST BENGAL & ORS','','2005-09-13','','','','','','','','','','','','','','','2021-01-05 10:34:51','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,11,'22','15094W','Disposed','WP','WRIT PETITION','2012','2012-08-17','HON`BLE JUSTICE DIPANKAR DATTA','Kolkata                       ','POOJA MINING & MARBELS (P) LIMITED & ORS','MR OARITOSH SINHA','UNION OF INDIA & ORS','','2012-07-16','','','','','','','','','','','','','','','2021-01-05 13:03:55','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'7','637','Disposed','WPLRT','WRIT PETITION','2005','2005-11-17','HON`BLE JUSTICE GANGULY||HON`BLE JUSTICE MAHARAJ SINHA','South 24-Parganas             ','SRI ANUPAM DAS AND ANR','GURUPADA DAS','STATE OF WEST BENGAL & ORS','','2005-09-20','','','','','','','','','','','','','','','2021-01-05 10:36:39','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,11,'23','15948W','Disposed','WP','WRIT PETITION','2012','2012-09-24','HON`BLE JUSTICE DIPANKAR DATTA','Kolkata                       ','RABIA BIBI 7 ORS','RUNA PALIT','THE STATE OF WEST BENGAL & ORS','','2012-07-23','','','','','','','','','','','','','','','2021-01-05 13:05:50','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,11,'24','18094W','Disposed','WP','WRIT PETITION','2012','2012-12-17','HON`BLE JUSTICE HARISH TANDON','Murshidabad                   ','SARADINDU MONDAL','MR SUBRATA CHAKRABORTY','THE STATE OF WEST BENGAL & ORS','','2012-08-13','','','','','','','','','','','','','','','2021-01-05 13:07:48','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'8','655','Disposed','WP.ST','WRIT PETITION','2005','2005-10-04','HON`BLE JUSTICE GANGULY||HON`BLE JUSTICE TAPAN KUMAR DUTT','Purulia                       ','SIBA PRASAD PAINE','SUPRIYO CHATTOPADHYAY','THE LEARNED WEST BBENGAL ADMINISTRATIVE TRIBUNAL AND 3 ORS','','2005-09-26','','','','','','','','','','','','','','','2021-01-05 10:39:41','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'9','657','Disposed','WPLRT','WRIT PETITION','2005','2005-10-04','HON`BLE JUSTICE GANGULY||HON`BLE JUSTICE TAPAN KUMAR DUTT','South 24-Parganas             ','SRI PIJUSH KANTI GHORUI','GURUPADA DAS','THE STATE OF WEST BENGAL & ORS','','2005-09-27','','','','','','','','','','','','','','','2021-01-05 10:41:38','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,12,'10','3821W','Disposed','WP','WRIT PETITION','2005','2005-10-04','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Kolkata                       ','SMT. ANJANA MONDAL','SAMBHUNATH DE','CESC LIMITED & ANR','','2005-02-23','','','','','','','','','','','','','','','2021-01-05 10:43:46','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'1','14939W','Disposed','WP','WRIT PETITION','2012','2012-07-23','HON`BLE JUSTICE SOUMITRA PAL','North 24-Parganas             ','PRADIP DASGUPTA & ORS','MR TAPAN RAY','NORTH DUM DUM MUNICIPALITY & ORS','','2012-07-13','','','','','','','','','','','','','','','2021-01-05 10:45:32','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'2','14255W','Disposed','WP','WRIT PETITION','2012','2012-07-23','HON`BLE JUSTICE SOUMITRA PAL','Nadia                         ','SEKHAR CHOWDHURY','ARINDAM CHATTERJEE','THE STATE OF WEST BENGAL & OTHERS','','2012-07-04','','','','','','','','','','','','','','','2021-01-05 10:48:39','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,10,'13','7193W','Disposed','WP','WRIT PETITION','2012','2012-04-16','HON`BLE JUSTICE INDIRA BANERJEE','Kolkata                       ','INDIAN INSTITUTE OF CHEMICAL ENGINEERS','MS. SUTAPA ROYCHOUDHURY','CENTRAL BOARD OF DIRECT TAXES, DEPARTMENT OF REVENUE & OTHERS','','2012-04-04','','','','','','','','','','','','','','','2021-01-05 10:51:08','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'11','823W','Disposed','WP','WRIT PETITION','2005','2005-03-18','HON`BLE ADD. CHIEF JUSTICE ASOK KUMAR GANGULY||HON`BLE JUSTICE TAPAN KUMAR DUTT','Murshidabad                   ','DULAL GHOSH','M.R. ABEDIN','TH E STATE OF WEST BENGAL & ORS','','2005-01-17','','','','','','','','','','','','','','','2021-01-05 10:50:46','Anita Sur','2021-01-05 10:51:09','Anita Sur','N'),
 (1,4,'33','25918W','Disposed','WP','WRIT PETITION','2012','2013-02-06','HON`BLE JUSTICE DEBASISH KAR GUPTA','Darjeeling                    ','KABITA ROY','MRS. SABITA KHUTIA(BHUNYA)','THE STATE OF WEST BERNGAL & ORS','','2012-12-06','','','','','','','','','','','','','','','2021-01-05 10:50:19','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,13,'3','14530W','Disposed','WP','WRIT PETITION','2012','2012-08-10','HON`BLE JUSTICE ANIRUDDHA BOSE','Kolkata                       ','SANJAY SARKAR','ACHIN KUMAR MAJUMDER','UNION OF INDIA & ORS','','','','','','','','','','','','','','','','','2021-01-05 10:52:12','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'14','20576W','Disposed','WP','WRIT PETITION','2012','2013-01-04','HON`BLE JUSTICE SOUMITRA PAL','Jalpaiguri                    ','PARTHA SARATHI GUHA','SUBHRANGSU PANDA','THE STATE OF WEST BENGAL & ORS.','','2012-09-11','','','','','','','','','','','','','','','2021-01-05 10:54:28','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'12','1076W','Disposed','WP','WRIT PETITION','2005','2005-03-08','HON`BLE JUSTICE SUBHRO KAMAL MUKHERJEE','Coochbehar                    ','KRISHNA KUMAR SHARMA','RAMENDRANATH BISWAS','THE PRESCRIBED AUTHORITY & B..D.O COOCHBEAHAR BLOCK II AND OTHERS','','2005-01-19','','','','','','','','','','','','','','','2021-01-05 10:55:23','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,13,'4','14743W','Disposed','WP','WRIT PETITION','2012','2012-08-10','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Jalpaiguri                    ','BIDHU BHUSAN SARKAR','MR SAKTI PADA JANA','THE STATE OF WEST BENGAL & ORS','','2012-07-11','','','','','','','','','','','','','','','2021-01-05 10:54:09','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'15','18789W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','GOPAL CHANDRA NANDI','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS.','','2012-08-23','','','','','','','','','','','','','','','2021-01-05 10:56:35','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'5','14934W','Disposed','WP','WRIT PETITION','2012','2012-08-17','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','SMT TAPATI GHOSH','PALLAV CHATTERJEE','THE STATE OF WEST BENGAL & OTHERS','','2012-07-13','','','','','','','','','','','','','','','2021-01-05 10:56:34','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,10,'16','17073W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Nadia                         ','NITU BHUSHAN DE SARKAR','MRS. SABITA KHUTIA (BHUNYA)','THE STATE OF WEST BENGAL & ORS.','','2012-08-01','','','','','','','','','','itu','','','','','2021-01-05 10:59:34','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'13','1279W','Disposed','WP','WRIT PETITION','2005','2005-04-13','HON`BLE JUSTICE TAPAN KUMAR DUTT','Bankura                       ','NITISH RANJAN MISHRA','MR. PROLOY BHATTACHARJEE','THE STATE OF WEST BENGAL & ORS','','2005-01-20','','','','','','','','','','','','','','','2021-01-05 10:59:57','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'6','14664W','Disposed','WP','WRIT PETITION','2012','2012-08-06','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','JAGADISH BARMAN','MR ATIS KUMAR BISWAS','THE STATE OF WEST BENGAL & OTHERS','','2012-07-10','','','','','','','','','','','','','','','2021-01-05 10:58:28','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,10,'17','18671W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','MANASRANJAN SAINIK','MRS. SABITA KHUTIA (BHUNYA)','THE STATE OF WEST BENGAL & ORS.','','2012-08-22','','','','','','','','','','','','','','','2021-01-05 11:01:35','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'14','1364W','Disposed','WP','WRIT PETITION','2005','2005-11-23','HON`BLE JUSTICE SOUMITRA PAL','Nadia                         ','ASOK KUMAR MONDAL','SHRI P.K. MUNSI','STATE OF WEST BENGAL & ORS','','2005-01-24','','','','','','','','','','','','','','','2021-01-05 11:01:35','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'7','22547W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','SUDHANSU SEKHAR PATRA','DILIP KUMAR SHYAMAL','THE STATE OF WEST BENGAL & OTHERS','','','','','','','','','','','','','','','','','2021-01-05 11:00:34','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,10,'18','20299W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','ANGSUMAN GANGULY','MRS. SABITA KHUTIA (BHUNYA)','THE STATE OF WEST BENGAL & ORS.','','2012-09-07','','','','','','','','','','','','','','','2021-01-05 11:03:45','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'15','1419W','Disposed','WP','WRIT PETITION','2005','2005-11-14','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','ANIRBAN SINHA','MR. SAILENDRA CHANDRA DATTA','CONTROLLER OF EXAMINATION BURDWAN UNIVERSITY & OTHERS','','2005-01-25','','','','','','','','','','','','','','','2021-01-05 11:04:08','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'8','22980W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','BIJAY CHANDRA DUTTA','SHIBNATH BHATTACHARYA','THE CALCUTTA TRAMWAYS COMPANY LIMITED & OTHERS','','2012-10-09','','','','','','','','','','','','','','','2021-01-05 11:03:36','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,12,'16','1433W','Disposed','WP','WRIT PETITION','2005','2005-11-17','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Birbhum                       ','MAHARAJA BIBI & ORS','RAJASRI CHANDA','THE UNION OF INDIA & ORS','','2005-01-25','','','','','','','','','','','','','','','2021-01-05 11:06:35','Anita Sur','2021-01-05 11:06:49','Anita Sur','N'),
 (1,13,'9','17851W','Disposed','WP','WRIT PETITION','2012','2012-08-13','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','North 24-Parganas             ','TAPASH KUMAR GHOSH','BISWAPRIYA SAMANTA','STATE OF WEST BENGAL & OTHERS','','2012-08-08','','','','','','','','','','','','','','','2021-01-05 11:05:32','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'1','2386W','Disposed','WP','WRIT PETITION','2013','2013-02-19','HON`BLE JUSTICE DEBASISH KAR GUPTA','Hooghly                       ','SUJATA CHAKRABORTY','MR SUDIP DAS','THE STATE OF WEST BENGAL & ORS','','2013-01-24','','','','','','','','','','','','','','','2021-01-05 13:37:43','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,10,'19','25126W','Disposed','WP','WRIT PETITION','2012','2013-01-22','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','M/S. NIZAM`S PESTRURENT LIMITED & ANR.','SAMRAT CHOWDHURY','KOLKATA MUNICIPAL CORPORATION & ORS.','','2012-11-29','','','','','','','','','','','','','','','2021-01-05 11:09:48','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'10','21576W','Disposed','WP','WRIT PETITION','2012','2012-10-16','HON`BLE JUSTICE BISWANATH SOMADDER','Uttar Dinajpur                ','JAMIRUDDIN AHAMED','SAUGHAMITRA DAS','THE STATE OF WEST BENGAL & OTHERS','','2012-09-24','','','','','','','','','','','','','','','2021-01-05 11:08:21','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'17','1637W','Disposed','WP','WRIT PETITION','2005','2005-12-02','HON`BLE CHIEF JUSTICE V.S. SIRPURKAR||HON`BLE JUSTICE GANGULY','Hooghly                       ','MUHAMMAD ABDUL LATIF','MR. KRISHNA DAS GHOSH','THE STATE OF WEST BENGAL & ORS','','2005-01-28','','','','','','','','','','','','','','','2021-01-05 11:11:26','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,10,'20','20513W','Disposed','WP','WRIT PETITION','2012','2013-01-09','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','SRI INDRAJIT GHOSH','ARUN KUMAR RAHA','STATE OF WEST BENGAL & ORS.','','2012-09-11','','','','','','','','','','','','','','','2021-01-05 11:12:33','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'11','22286W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','PHANINDRA NATH SARKAR','DILIP KUMAR MAITI','THE STATE OF WEST BENGAL & OTHERS','','2012-10-03','','','','','','','','','','','','','','','2021-01-05 11:10:23','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'2','4952W','Disposed','WP','WRIT PETITION','2013','2013-02-28','HON`BLE JUSTICE DIPANKAR DATTA','North 24-Parganas             ','SMT CHINTA RANI PRAMANICK','MR NANDADULAL  BANERJEE','THE STATE OF WEST BENGAL & ORS','','2013-02-14','','','','','','','','','','','','','','','2021-01-05 13:40:41','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,13,'12','20907W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','MANOJ ROY','BHAGABAT CHAUDHURI','THE STATE OF WEST BENGAL & OTHERS','','2012-09-14','','','','','','','','','','','','','','','2021-01-05 11:12:01','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'3','3473W','Disposed','WP','WRIT PETITION','2013','2013-02-14','HON`BLE JUSTICE DIPANKAR DATTA','Burdwan                       ','SAHARAB MONDAL','MR GORA CHAD SAMANTA','THE STATE OF WEST BENGAL & ORS','','2013-02-04','','','','','','','','','','','','','','','2021-01-05 13:42:26','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'21','28055W','Disposed','WP','WRIT PETITION','2012','2013-01-30','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','PRAVAS MONDAL','SYED MANSUR ALI','THE STATE OF WEST BENGAL & ORS.','','2012-12-20','','','','','','','','','','','','','','','2021-01-05 11:14:55','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,13,'13','22499W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Hooghly                       ','ABANI KUMAR PAUL','MISS SUSMITA DEY ( BASU )','THE STATE OF WEST BENGAL & OTHERS','','2012-10-04','','','','','','','','','','','','','','','2021-01-05 11:13:51','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'4','23956W','Disposed','WP','WRIT PETITION','2012','2013-02-21','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Burdwan                       ','SAMBHU NATH HALDER','MR PALLAV CHATERJEE','THE STATE OF WEST BENGAL & ORS','','2012-10-17','','','','','','','','','','','','','','','2021-01-05 13:44:11','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,10,'22','28089W','Disposed','WP','WRIT PETITION','2012','2013-01-11','HON`BLE JUSTICE SOUMITRA PAL','Murshidabad                   ','SYED HASIBUL ISLAM','MR. SUTIRTHA DAS','THE STATE OF WEST BENGAL & ORS.','','2012-12-20','','','','','','','','','','','','','','','2021-01-05 11:16:53','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,13,'14','15258W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE SOUMITRA PAL','Murshidabad                   ','MD NUHUR ALI','MR MD ASRAF HUQ','THE STATE OF WEST BENGAL & OTHERS','','2012-07-17','','','','','','','','','','','','','','','2021-01-05 11:15:26','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'5','2712W','Disposed','WP','WRIT PETITION','2013','2013-02-18','HON`BLE JUSTICE ANIRUDDHA BOSE','Hooghly                       ','MILAN SUR','SK NIZAMUDDIN','THE STATE OF WEST BENGAL & ORS','','2013-01-29','','','','','','','','','','','','','','','2021-01-05 13:45:45','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'6','3300W','Disposed','WP','WRIT PETITION','2013','2013-02-25','HON`BLE JUSTICE DIPANKAR DATTA','Burdwan                       ','SMT BABY ACHARJEE','KUNTAL BANERJEE','THE STATE OF WEST BENGAL & ORS','','2013-02-01','','','','','','','','','','','','','','','2021-01-05 13:47:33','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,13,'15','22913W','Disposed','WP','WRIT PETITION','2012','2012-10-16','HON`BLE JUSTICE DIPANKAR DATTA','Burdwan                       ','SANTI KUMAR GHOSH','RAHUL SARKAR','THE STATE OF WEST BENGAL & OTHERS','','2012-10-09','','','','','','','','','','','','','','','2021-01-05 11:17:43','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'18','679W','Disposed','WPLRT','WRIT PETITION','2005','2005-10-06','HON`BLE JUSTICE GANGULY||HON`BLE JUSTICE TAPAN KUMAR DUTT','Birbhum                       ','SOMNATH BANERJEE AND OTHERS','KISHORE MUKHERJEE','THE STATE OF WEST BENGAL & ORS','','2005-09-30','','','','','','','','','','','','','','','2021-01-05 11:19:56','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'7','3661W','Disposed','WP','WRIT PETITION','2013','2013-02-08','HON`BLE JUSTICE DEBASISH KAR GUPTA','Paschim Medinipur             ','BELA RANI MAITY','ARIJIT BANERJEE','THE STATE OF WEST BENGAL & ORS','','2013-02-06','','','','','','','','','','','','','','','2021-01-05 13:49:12','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,13,'16','21774W','Disposed','WP','WRIT PETITION','2012','2012-10-10','HON`BLE JUSTICE DEBASISH KAR GUPTA','Howrah                        ','KAMALA MOYEE MONDAL','MR TAPAN KUMAR MAHAPATRA','STATE OF WEST BENGAL & ORS','','2012-09-25','','','','','','','','','','','','','','','2021-01-05 11:19:56','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'19','3516W','Disposed','WP','WRIT PETITION','2005','2005-11-14','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Nadia                         ','TARUN ACHARYA','SANKAR HALDER','THE STATE OF WEST BENGAL & ORS','','2005-02-21','','','','','','','','','','','','','','','2021-01-05 11:21:42','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'17','7584W','Disposed','WP','WRIT PETITION','2012','2012-10-01','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Purba Medinipur               ','SWARUP KUMAR GHORAI','SURANJAN MANDAL','THE STATE OF WEST BENGAL & OTHERS','','2012-04-11','','','','','','','','','','','','','','','2021-01-05 11:22:40','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,12,'20','3533W','Disposed','WP','WRIT PETITION','2005','2005-03-10','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Purba Medinipur               ','M/S ANNAPURNA STORE & ORS','ABIRA BHAUMIK','THE STATE OF WEST BENGAL & ORS','','2005-02-21','','','','','','','','','','','','','','','2021-01-05 11:24:26','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'18','20549W','Disposed','WP','WRIT PETITION','2012','2012-10-10','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','TAKIUL SK','JOY CHAKRABORTY||HAIDAR ALI SK','UNION OF INDIA & ORS','','2012-09-11','','','','','','','','','','','','','','','2021-01-05 11:25:41','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'21','3620W','Disposed','WP','WRIT PETITION','2005','2005-11-30','HON`BLE JUSTICE SOUMITRA PAL','Paschim Medinipur             ','SRI SUDARSAN SAMANTA','SNEHASIS JANA','THE STATE OF WEST BENGAL & ORS','','2005-02-22','','','','','','','','','','','','','','','2021-01-05 11:27:45','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,13,'19','21666W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE PATHERYA','Birbhum                       ','MD RIYAJUDDIN SK','JAHANGIR HOSSAIN','W.B.S.E.D.C.L. & ORS','','2012-09-25','','','','','','','','','','','','','','','2021-01-05 11:28:01','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'20','20904W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','ANJALI ROY','BHAGBAT CHAUDHURI','THE STATE OF WEST BENGAL & OTHERS','','2012-09-14','','','','','','','','','','','','','','','2021-01-05 11:29:18','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'1','17152W','Disposed','WP','WRIT PETITION','2012','2012-08-06','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Purba Medinipur               ','BADAL KUMAR DAS','MR. SAKTIPADA JANA','THE STATE OF WEST BERNGAL & ORS','','2012-08-01','','','','','','','','','','','','','','','2021-01-05 11:31:33','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,14,'8','8043W','Disposed','WPCRC','WRIT PETITION','2005','2012-03-16','HON`BLE JUSTICE MAHARAJ SINHA','Nadia                         ','RAMENDRA NATH MONDAL','MR REZAUL HOSSAIN','BISWAJIT BISWAS','','2005-03-29','','','','','','','','CPAN/1512/2004','WP/20348W/2003','','','','','','2021-01-05 14:01:11','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'22','3667W','Disposed','WP','WRIT PETITION','2005','2005-09-27','HON`BLE JUSTICE PRATAP KUMAR RAY','South 24-Parganas             ','MISS. LATIKA DAS','MR. ARINDAM JANA','UNION OF INDIA & ORS','','2005-02-22','','','','','','','','','','','','','','','2021-01-05 11:32:59','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'21','23447W','Disposed','WP','WRIT PETITION','2012','2012-11-26','HON`BLE JUSTICE PATHERYA','South 24-Parganas             ','SULAGNA BASU','SRI BIDYUT KUMAR HALDER','CESC LIMITED & ORS','','2012-10-12','','','','','','','','','','','','','','','2021-01-05 11:31:59','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,12,'23','3683W','Disposed','WP','WRIT PETITION','2005','2005-09-21','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','DULAL BAKULI','AMIT KUMART PAN','THE STATE OF WEST BENGAL & ORS','','2005-02-23','','','','','','','','CPAN/1124/2005','','','','','','','2021-01-05 11:35:05','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'9','3922W','Disposed','WP','WRIT PETITION','2013','2013-02-12','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','PRABHAKAR KHATUA','YUDHAJIT GUHA','THE STATE OF WEST BENGAL & ORS','','2013-02-07','','','','','','','','','','','','','','','2021-01-05 14:03:45','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'22','16721W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE SOUMITRA PAL','Purulia                       ','NIRMAL KUMAR MAJHI','MR MADHUSUDAN MANDAL','THE STATE OF WEST BENGAL & OTHERS','','2012-07-27','','','','','','','','','','','','','','','2021-01-05 11:33:35','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,12,'24','3782W','Disposed','WP','WRIT PETITION','2005','2005-08-09','HON`BLE JUSTICE ARUN KUMAR MITRA','North 24-Parganas             ','JAHANARA BIBI','MR. NARAYAN CH. MANDAL','STATE OF WEST BENGAL & ORS','','2005-02-23','','','','','','','','','','','','','','','2021-01-05 11:36:35','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'2','17654W','Disposed','WP','WRIT PETITION','2012','2012-08-10','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','ENAITULLAH SK.','MD. ABDUL ALIM','THE W.B.S.E.D.CO.LTD & ORS.','','2012-08-06','','','','','','','','','','','','','','','2021-01-05 11:35:57','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'23','20671W','Disposed','WP','WRIT PETITION','2012','2012-09-19','HON`BLE JUSTICE ANIRUDDHA BOSE','Kolkata                       ','JAWAID BASHER','SRI SOUMEN BHATTACHARJEE','STATE OF WEST BENGAL & ORS','','2012-09-12','','','','','','','','','','','','','','','2021-01-05 11:35:25','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,14,'10','2898W','Disposed','WP','WRIT PETITION','2013','2013-02-05','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','BINAY KUMAR SARKAR','DILIP KUMAR MAITY','THE STATE OF WEST BENGAL & ORS','','2013-01-30','','','','','','','','','','','','','','','2021-01-05 14:05:42','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,12,'25','763','Disposed','WPLRT','WRIT PETITION','2005','2005-12-14','HON`BLE JUSTICE GANGULY||HON`BLE JUSTICE SOUMITRA PAL','Birbhum                       ','NARAYAN CHANDRA DAS & ORS','AMAR KUMAR SINHA','THE STATE OF WEST BENGAL & ORS','','2005-12-02','','','','','','','','','','','','','','','2021-01-05 11:38:04','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'3','18443W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','JAGANNATH HALDER','MR. PANKAJ HALDER','THE STATE OF WEST BERNGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-05 11:38:02','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,14,'11','518W','Disposed','WP','WRIT PETITION','2013','2013-02-19','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','JATINDRA NATH DHAURIA','MR SOUMEN KUMAR GUPTA','THE CHAIRMAN WBSEDCL & ORS','','2013-01-09','','','','','','','','','','','','','','','2021-01-05 14:07:48','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'24','20369W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Burdwan                       ','DEOBARAT GIRI & ANR','MD MANSOOR ALAM','THE COAL INDIA LIMITED & ORS','','2012-09-07','','','','','','','','','','','','','','','2021-01-05 11:38:04','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'12','26072W','Disposed','WP','WRIT PETITION','2012','2013-02-27','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','NARAYAN CHANDRA DAS','PRITIKANA GANTAIT','THE STATE OF WEST BENGAL & ORS','','2012-12-06','','','','','','','','','','','','','','','2021-01-05 14:09:39','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,13,'25','13129W','Disposed','WP','WRIT PETITION','2012','2012-07-24','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Howrah                        ','BIMAL KANTI KARMAKAR','MRS SABITA KHUTIA( BHUIYA)','THE STATE OF WEST BENGAL & OTHERS','','2012-06-25','','','','','','','','','','','','','','','2021-01-05 11:40:06','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'4','17145W','Disposed','WP','WRIT PETITION','2012','2012-08-21','HON`BLE JUSTICE DEBASISH KAR GUPTA','Dakshin Dinajpur              ','MALATI SARKAR','TARUN KUMAR DAS','THE STATE OF WEST BERNGAL & ORS','','2012-08-01','','','','','','','','','','','','','','','2021-01-05 11:41:49','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'26','20228W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Hooghly                       ','GURUDAS TRIVEDI','KAUSTAV MANNA','STATE OF WEST BENGAL & ORS','','2012-09-06','','','','','','','','','','','','','','','2021-01-05 11:42:00','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,14,'13','25062W','Disposed','WP','WRIT PETITION','2012','2013-02-21','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Burdwan                       ','SMT ALPANA GHOSH','MR PALLAV CHATERJEE','THE STATE OF WEST BENGAL & ORS','','2012-11-29','','','','','','','','','','','','','','','2021-01-05 14:12:22','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,13,'27','8970W','Disposed','WP','WRIT PETITION','2012','2012-10-16','HON`BLE JUSTICE SUBHRO KAMAL MUKHERJEE','North 24-Parganas             ','SRI DHIRENDRA NATH GHOSH','MR ASHIM KUMAR GOPE','STATE OF WEST BENGAL & ORS','','2012-04-27','','','','','','','','','','','','','','','2021-01-05 11:43:57','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'5','17428W','Disposed','WP','WRIT PETITION','2012','2012-08-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','SAFATULLA SK.','MRS. SUJATU GHOSH','THE CHAIRMAN & MANAGING DIRECTOR WEST BENGAL STATE  ELECTRICITY DISTRIBUTION COMPANY LTD & ORS.','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 11:46:11','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,15,'6','18774W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DIPANKAR DATTA','Kolkata                       ','M/S FRIENDS AUTO MOBILES  & ORS','SHAMBHU NATH SARDAR','STATE BANK OF INDIA & ORS','','2012-08-23','','','','','','','','','','','','','','','2021-01-05 11:52:02','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'1','8070W','Disposed','WP','WRIT PETITION','2007','2007-04-30','HON`BLE JUSTICE DEBASISH KAR GUPTA','Birbhum                       ','UJJAL KUMAR SARKAR','MR. KISHORE MUKHERJEE','THE STATE OF WEST BENGAL & ORS.','','2007-04-23','','','','','','','','','','','','','','','2021-01-05 11:55:35','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'2','8466W','Disposed','WP','WRIT PETITION','2007','2007-07-20','HON`BLE JUSTICE SOUMITRA PAL','Kolkata                       ','SASHI KANT DIDWANIA & ANR.','A.P. AGARWALLA','UNION OF INDIA & ANR.','','2007-04-27','','','','','','','','','','','','','','','2021-01-05 11:59:01','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,18,'1','10298W','Disposed','WP','WRIT PETITION','2005','2005-07-14','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','South 24-Parganas             ','EFRED ALI MOLLA','TUSHER KANTI MUKHERJEE','STATE OF WEST BENGAL & OTHERS','','2005-05-16','','','','','','','','','','','','','','','2021-01-05 12:10:52','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'2','10074W','Disposed','WP','WRIT PETITION','2005','2005-07-21','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Howrah                        ','ABDUL RASHID','UDDIPAN BANERJEE','C.E.S.C LIMITED & OTHERS','','2005-05-12','','','','','','','','','','','','','','','2021-01-05 12:12:40','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'3','9847W','Disposed','WP','WRIT PETITION','2005','2005-08-12','HON`BLE CHIEF JUSTICE V.S. SIRPURKAR','Kolkata                       ','ARUN KUMAR RAY','ARUN KANTI CHATTAPADHYAY','THE WEST BENGAL POLLUTION CONTROL','','2005-05-06','','','','','','','','','','','','','','','2021-01-05 12:15:26','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,15,'7','18490W','Disposed','WP','WRIT PETITION','2012','2012-08-30','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','SUBARNA KUMAR DAS','MR. PANKAJ HALDER','THE STATE OF WEST BENGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-05 12:08:59','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'4','9848W','Disposed','WP','WRIT PETITION','2005','2005-07-19','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','North 24-Parganas             ','SRI ATUL KRISHNA MONDAL & ANR','MR MANOJ MALHOTRA','STATE OF WEST BENGAL & OTHERS','','2005-05-06','','','','','','','','','','','','','','','2021-01-05 12:19:16','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'8','18492W','Disposed','WP','WRIT PETITION','2012','2012-08-30','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','MD. MAHASIN BAIDYA','MR. PANKAJ HALDER','THE STATE OF WEST BENGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-05 12:13:23','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,18,'5','9899W','Disposed','WP','WRIT PETITION','2005','2005-08-01','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','Hooghly                       ','KEYA MUKHERJEE','RAM CHANDRA DE','STATE OF WEST BENGAL & OTHERS','','2005-05-11','','','','','','','','','','','','','','','2021-01-05 12:22:04','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'6','9923W','Disposed','WP','WRIT PETITION','2005','2005-05-28','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Nadia                         ','SMT BINA ROY ( KHAN )','MR RAMKRISHNA BHATTACHARJEE','THE STATE OF WEST BENGAL & OTHERS','','2005-05-11','','','','','','','','','','','','','','','2021-01-05 12:23:56','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'9','18439W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','NJALI BHUSAN HALDER','MR. PANKAJ HALDER','THE STATE OF WEST BENGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-05 12:16:49','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,15,'10','18441W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','PURNENDU DAS','MR. PANKAJ HALDER','THE STATE OF WEST BENGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-05 12:19:59','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'7','10466W','Disposed','WP','WRIT PETITION','2005','2005-06-28','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Dakshin Dinajpur              ','HANIFUDDIN MONDAL','MR ANIMESH BHATTACHERJEE','STATE OF WEST BENGAL & OTHERS','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 12:27:43','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'8','10516W','Disposed','WP','WRIT PETITION','2005','2005-09-06','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Purba Medinipur               ','SUKUMAR MONDAL','MR PABITRA CHANDRA BHATTACHERJEE','STATE OF WEST BENGAL & OTHERS','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 12:30:57','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,15,'11','17448W','Disposed','WP','WRIT PETITION','2012','2012-08-10','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','BINOY MONDAL','MR. SUJATA GHOSH','THE CHAIRMAN & MANAGING DIRECTOR WEST  BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LTD  & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 12:24:02','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'9','10080W','Disposed','WP','WRIT PETITION','2005','2005-08-05','HON`BLE JUSTICE SOUMITRA PAL','Murshidabad                   ','DHULIAN MUNICIPALITY & ANR','MD TALAY MASOOD SIDDIQUI','STATE OF WEST BENGAL & OTHERS','','2005-05-12','','','','','','','','','','','','','','','2021-01-05 12:33:21','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'12','17991W','Disposed','WP','WRIT PETITION','2012','2012-08-21','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','SATYA RANJAN LAHA','MS. LIPIKA CHATERJEE','THE WEST BERNGAL STATE ELECTRICITY DISTRIBUTION COMPANY LTD &  OTHERS','','2012-08-10','','','','','','','','','','','','','','','2021-01-05 12:27:22','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,17,'1','8326W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','INDRAJIT GHOSH','MD. MOJNU SK','MURSHIDABAD DISTRICT PRIMARY SCHOOL COUNCIL & ORS','','2012-08-16','','','','','','','','','','','','','','','2021-01-05 12:29:36','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'13','18345W','Disposed','WP','WRIT PETITION','2012','2012-09-03','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','BRISHAPATI KANSARI','MR. PANKAJ HALDER','THE STATE OF WEST BENGAL & ORS','','2012-08-16','','','','','','','','','','','','','','','2021-01-05 12:29:48','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'14','5644W','Disposed','WP','WRIT PETITION','2010','2011-09-12','HON`BLE JUSTICE BISWANATH SOMADDER','Coochbehar                    ','PRAFULLA KUMAR RAY','MR SAKTI PADA JANA','THE STATE OF WEST BENGAL & ORS','','2010-03-17','','','','','','','','','','','','','','','2021-01-05 12:36:12','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,17,'2','8328W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE SUBHRO KAMAL MUKHERJEE','Howrah                        ','SRI BHAKTI RANJA SINGHA AND OTHERS','MR. JASOBANTA RAKSHIT','THE STATE OF WEST BENGAL AND OTHERS','','2012-04-20','','','','','','','','','','','','','','','2021-01-05 12:31:58','Anita Sur','2021-01-05 12:32:27','Anita Sur','N'),
 (1,18,'10','10127W','Disposed','WP','WRIT PETITION','2005','2005-09-30','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Murshidabad                   ','MIRZA MOHIBUDDIN','GOPA BARUA','THE STATE OF WEST BENGAL & OTHERS','','2005-05-12','','','','','','','','','','','','','','','2021-01-05 12:37:51','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'14','17006W','Disposed','WP','WRIT PETITION','2012','2012-08-06','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','UTTAM SAHA','SAKTI PADA JANA','THE STATE OF WEST BENGAL & ORS','','2012-07-31','','','','','','','','','','','','','','','2021-01-05 12:32:22','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,14,'15','21355W','Disposed','WP','WRIT PETITION','2007','2013-02-27','HON`BLE JUSTICE DIPANKAR DATTA','Paschim Medinipur             ','TAPAN KR BHATTACHARYA','MR SOUMEN KUMAR DUTTA','THE STATE OF WEST BENGAL & ORS','','2007-09-25','','','','','','','','','','','','','','','2021-01-05 12:38:16','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'11','10228W','Disposed','WP','WRIT PETITION','2005','2005-08-18','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Hooghly                       ','S M ENTERPRISE  MILON GHOSH','DIPANKAR PAL','STATE OF WEST BENGAL & ORS','','2005-05-13','','','','','','','','','','','','','','','2021-01-05 12:40:51','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'15','18577W','Disposed','WP','WRIT PETITION','2012','2012-08-27','HON`BLE JUSTICE DEBASISH KAR GUPTA','Kolkata                       ','RAM KRISHNA SHAW','MRS. NAMITA BASU','STATE OF WEST BENGAL & ORS,RESPONDENTS','','2012-08-21','','','','','','','','','','','','','','','2021-01-05 12:34:53','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,17,'3','21759W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','CHANDRIKA RAJBANSHI','BISWADEB ROY CHOUDHURI','THE STATE OF WEST BENGAL & ORS','','2012-09-25','','','','','','','','','','','','','','','2021-01-05 12:36:49','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'12','10234W','Disposed','WP','WRIT PETITION','2005','2005-07-21','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Birbhum                       ','SRI NARAYAN PRASAD GINODIA','MR RAKESH SINGH','THE WEST BENGAL STATE OF ELECTRICITY BOARD & ORS','','2005-05-13','','','','','','','','','','','','','','','2021-01-05 12:42:42','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'25','20348W','Disposed','WP','WRIT PETITION','2003','2003-12-22','HON`BLE JUSTICE MAHARAJ SINHA','Nadia                         ','RAMENDRA NATH MONDAL','MR RAMKRISHNA BHATTACHARYA','THE STATE OF WEST BENGAL & ORS','','2003-12-19','','','','','','','','','','','','','','','2021-01-05 12:41:21','Sriparna Saha','2021-01-05 12:42:19','Sriparna Saha','N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,15,'16','18445W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','ASHALATA PURAKAIT NEOGI','MR. PANKAJ HALDER','THE STATE OF WEST BENGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-05 12:37:25','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'3','9419W','Disposed','WP','WRIT PETITION','2007','2013-01-24','HON`BLE JUSTICE SHUKLA KABIR (SINHA)||HON`BLE CHIEF JUSTICE ARUN MISHRA','North 24-Parganas             ','AGROCHEMICAL FORMULATORS WELFARE ASSOCIATION OF EASTERN INDIA & ANOTHER','ANGSHUMOY GUHA','WEST BENGAL POLLUTION CONTROL BOARD & ORS.','','2007-05-11','','','','','','','','','','','','','','','2021-01-05 12:37:16','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'13','10241W','Disposed','WP','WRIT PETITION','2005','2005-08-31','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Murshidabad                   ','UDAY KUNDU & OTHERS','SUMIT KUMAR BASU','RANINAGAR PANCHAYAT SAMITY & ORS','','2005-05-13','','','','','','','','','','','','','','','2021-01-05 12:45:06','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,17,'4','22105W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE DEBASISH KAR GUPTA','Howrah                        ','SAMIR KUMAR GHOSH','SABITA KHUTIA (BHUNIYA)','THE STATE OF WEST BENGAL & ORS','','2012-09-28','','','','','','','','','','','','','','','2021-01-05 12:39:35','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'16','25294W','Disposed','WP','WRIT PETITION','2012','2012-12-21','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Nadia                         ','ARUN KUMAR SINGH','MINTU KUMAR GOSWAMI','UNION OF INDIA AND OTHERS','','2012-11-30','','','','','','','','','','','','','','','2021-01-05 12:45:09','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'5','16336W','Disposed','WP','WRIT PETITION','2012','2012-10-19','HON`BLE JUSTICE NISHITA MHATRE','Kolkata                       ','SRI PIJUSH PAUL','MR. DIBASHIS BASU','THE STATE OF WEST BENGAL AND OTHERS','','2012-07-25','','','','','','','','','','','','','','','2021-01-05 12:41:24','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,18,'14','10002W','Disposed','WP','WRIT PETITION','2005','2005-07-15','HON`BLE JUSTICE MAHARAJ SINHA','Birbhum                       ','SANTOSH KUMAR PAL','DILIP KUMAR SAMANTA','STATE OF WEST BENGAL & ORS','','2005-03-30','','','','','','','','','','','','','','','2021-01-05 12:47:47','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'17','24790W','Disposed','WP','WRIT PETITION','2012','2013-01-18','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Howrah                        ','SMT SANCHITA KUNDU','MR UDAYAN DATTA','HOWRAH MUNICIPAL CORPORATION AND OTHERS','','2012-11-23','','','','','','','','','','','','','','','2021-01-05 12:47:16','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'6','22098W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE DEBASISH KAR GUPTA','Howrah                        ','ABDUL KOBIR MOLLAH','MRS SABITA KHUTIA(BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2012-09-28','','','','','','','','','','','','','','','2021-01-05 12:43:25','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,18,'15','10524W','Disposed','WP','WRIT PETITION','2005','2005-08-05','HON`BLE JUSTICE SOUMITRA PAL','Hooghly                       ','SUDIP DAS','MR SUDIP DAS','CHANDERNAGORE MUNICIPAL CORPORATION','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 12:50:00','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'17','17233W','Disposed','WP','WRIT PETITION','2012','2012-08-23','HON`BLE JUSTICE INDIRA BANERJEE','North 24-Parganas             ','M/S AMI ENTERPRISES PVTY. LTD & ANR','CHANCHAL KUMAR DUTTA','THE CERTIFICATE OFFICER, NORTH 24 PARGANAS, BARASAT & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 12:42:52','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'4','13572W','Disposed','WP','WRIT PETITION','2007','2013-01-11','HON`BLE JUSTICE DR. SAMBUDDHA CHAKRABARTI','Purba Medinipur               ','SITAL PRASAD JANA','RAM KRISHNA ROY','UNION OF INDIA & ORS.','','2007-06-25','','','','','','','','','','','','','','','2021-01-05 12:42:40','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,17,'7','14277W','Disposed','WP','WRIT PETITION','2012','2012-09-27','HON`BLE JUSTICE SOUMITRA PAL','Birbhum                       ','SYED MAHABUB MOULA','RWITENDRA BANERJEE','THE STATE OF WEST BENGAL & ORS','','2012-07-04','','','','','','','','','','','','','','','2021-01-05 12:44:46','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'18','2061W','Disposed','WP','WRIT PETITION','2013','2013-02-04','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Hooghly                       ','SRI NEMAI KOSTA @ TANTI & OTHERS','MR ASHIS KUMAR DUTTA','THE STATE OF WEST BENGAL & ORS','','2013-01-21','','','','','','','','','','','','','','','2021-01-05 12:50:01','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'16','10539W','Disposed','WP','WRIT PETITION','2005','2005-08-25','HON`BLE JUSTICE SOUMITRA PAL','North 24-Parganas             ','PRESIDENCY RUBBER MILLS P LTD & ANR','Y K KHANNA','EMPLOYEES PROVIDENT FUND ORGANISATION','','2002-08-22','','','','','','','','','','','','','','','2021-01-05 12:52:44','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,15,'18','17639W','Disposed','WP','WRIT PETITION','2012','2012-08-13','HON`BLE JUSTICE DIPANKAR DATTA','Paschim Medinipur             ','SUKHEN KUMAR HAZRA & OTHERS','TARUNJYOTI TEWARI','THE STATE OF WEST BENGAL & ORS','','2012-08-06','','','','','','','','','','','','','','','2021-01-05 12:45:37','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'8','19649W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE ANIRUDDHA BOSE','South 24-Parganas             ','SRI KRISHNA DAS','MR. JJAYANTA KUMAR PAIN||MR. OPRADIP KUMAR BANDYOPADHYAY','NETAJI SUBHAS OPEN UNIVERSITY AND OTHERS','','2012-08-30','','','','','','','','','','','','','','','2021-01-05 12:47:05','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'17','10594W','Disposed','WP','WRIT PETITION','2005','2005-09-26','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Dakshin Dinajpur              ','MAMLUKA BIBI','TAPAS MAITY','STATE OF WEST BENGAL & ORS','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 12:54:01','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,14,'19','2271W','Disposed','WP','WRIT PETITION','2012','2013-01-21','HON`BLE JUSTICE INDIRA BANERJEE','Malda                         ','MD KHURSED ALI','YUDHAJIT GUHA','THE STATE OF WEST BENGAL & ORS','','2012-02-02','','','','','','','','','','','','','','','2021-01-05 12:52:32','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'9','13467W','Disposed','WP','WRIT PETITION','2012','2012-09-27','HON`BLE JUSTICE SOUMITRA PAL','South 24-Parganas             ','MAHIM CHANDRA MONDAL','SUNIT KUMAR ROY','STATE OF WEST BENGAL & ORS','','2012-06-27','','','','','','','','','','','','','','','2021-01-05 12:48:51','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'19','17151W','Disposed','WP','WRIT PETITION','2012','2012-08-06','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Purba Medinipur               ','BALAILAL DAS MAHAPATRA','MR. SAKTIPADA JANA','THE STATE OF WEST BENGAL & ORS','','2012-08-03','','','','','','','','','','','','','','','2021-01-05 12:47:54','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,18,'18','10629W','Disposed','WP','WRIT PETITION','2005','2005-08-22','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA','Malda                         ','MASTAQUE ALI','RAFIQUL ISLAM','STATE OF WEST BENGAL & ORS','','2005-05-18','','','','','','','','','','','','','','','2021-01-05 12:55:34','tina roy','2021-01-05 13:05:14','tina roy','N'),
 (1,14,'20','27951W','Disposed','WP','WRIT PETITION','2012','2013-01-30','HON`BLE JUSTICE BISWANATH SOMADDER','Purulia                       ','NEPAL MAHATA & ORS','MR PRASANTA BEHARI MAHATA','THE STATE OF WEST BENGAL & ORS','','2012-12-20','','','','','','','','','','','','','','','2021-01-05 12:54:52','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,15,'20','18500W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','AMALENDU NAIYA','MR. PANKAJ HALDER','THE STATE OF WEST BENGAL & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-05 12:49:38','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,16,'5','19890W','Disposed','WP','WRIT PETITION','2007','2013-01-09','HON`BLE JUSTICE DIPANKAR DATTA','Jalpaiguri                    ','SHRI DIPAK BHATTACHARJEE','RAJDEEP BISWAS','THE STATE OF WEST BENGAL AND OTHERS.','','2007-09-10','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 12:49:57','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'21','23263W','Disposed','WP','WRIT PETITION','2012','2013-01-15','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','SMT BASITA GHOSH','MR SUKALYAN SARKAR','THE MUNICIPAL COMMISSIONER, KOLKATA MUNICIPAL CORPORATION','','2012-10-10','','','','','','','','','','','','','','','2021-01-05 12:57:51','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'10','22356W','Disposed','WP','WRIT PETITION','2012','2012-10-16','HON`BLE JUSTICE DR. SAMBUDDHA CHAKRABARTI','Kolkata                       ','NATIONAL UNION OF SEAFARERS OF INDIA & ANR','SAURABH GUHATHAKURTA','THE SHIPPING CORPORATION OF INDIA','','2012-10-03','','','','','','','','','','','','','','','2021-01-05 12:53:46','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,14,'22','16198W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','MADAN MOHAN SAMANTA','MRS SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL & ORS','','2012-07-25','','','','','','','','','','','','','','','2021-01-05 12:59:40','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'6','25200W','Disposed','WP','WRIT PETITION','2007','2008-03-19','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Uttar Dinajpur                ','SHANAZ BEGUM','MD HABIBUR RAHAMAN','THE STATE OF WEST BENGAL & ORS.','','2007-11-28','','','','','','','','','','','','','','','2021-01-05 12:53:46','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'19','10732W','Disposed','WP','WRIT PETITION','2005','2005-08-19','HON`BLE CHIEF JUSTICE V.S. SIRPURKAR||HON`BLE JUSTICE GANGULY','Paschim Medinipur             ','SRI AMARENDRA NATH DAS','MR HABIBUR RAHMAN','STATE OF WEST BENGAL & ORS','','','','','','','','','','','','','','','','','2021-01-05 13:02:06','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,14,'23','17081W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Nadia                         ','SRIKRISHNA DEY','MRS SABITA KHUTIA BHUNYA','THE STATE OF WEST BENGAL & ORS','','2012-08-01','','','','','','','','','','','','','','','2021-01-05 13:01:21','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'33','22122W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE DEBASISH KAR GUPTA','Paschim Medinipur             ','MAHADEB BHAUMIK','MRS. SABITA KHUTIA (BLHUNYA)','THE STATE OF WEST BENGAL & ORS','','2012-09-28','','','','','','','','','','','','','','','2021-01-05 12:58:07','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,14,'24','21796W','Disposed','WP','WRIT PETITION','2012','2013-01-14','HON`BLE JUSTICE DEBASISH KAR GUPTA','Burdwan                       ','MD SALAUDDIN SANA','TANUJA BASAK','THE STATE OF WEST BENGAL & ORS','','2012-09-26','','','','','','','','','','','','','','','2021-01-05 13:03:17','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,17,'34','21645W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE BISWANATH SOMADDER','Birbhum                       ','SABINA YEASMIN','AMAR KUMAR SINHA','THE STATE OF WEST BENGAL & ORS','','2012-09-25','','','','','','','','','','','','','','','2021-01-05 13:00:30','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'20','10844W','Disposed','WP','WRIT PETITION','2005','2005-08-25','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','Howrah                        ','SRI BASUDEV DHALI','MR ANADI BANERJEE','ALLAHBAD BANK THOROUGH ITS CHAIRMAN','','2005-05-19','','','','','','','','','','','','','','','2021-01-05 13:08:35','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'11','18059W','Disposed','WP','WRIT PETITION','2011','2012-10-16','HON`BLE JUSTICE SUBHRO KAMAL MUKHERJEE','Birbhum                       ','RADHA KRISHNA PAL','ANUPAMA HAJARI','THE STATE OF WEST BENGAL & ORS','','2011-11-03','','','','','','','','','','','','','','','2021-01-05 13:03:08','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'1','21038W','Disposed','WP','WRIT PETITION','2012','2012-10-08','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','NAJIRUL MONDAL','PROBAL SARKAR','WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LIMITED & ORS','','2012-09-17','','','','','','','','','','','','','','','2021-01-05 13:08:47','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'21','10338W','Disposed','WP','WRIT PETITION','2005','2005-09-26','HON`BLE JUSTICE PRATAP KUMAR RAY','Howrah                        ','SRI SWAPAN GHOSH','BHASKAR NANDI','THE COATE OF WEST BENGAL & ORS','','2005-05-16','','','','','','','','','','','','','','','2021-01-05 13:11:17','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'12','21884W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Paschim Medinipur             ','MD. JAHANGIR','MR. SHYAMAL KUMAR MUKHERJEE','THE STATE OF WEST BENGAL & ORS','','2012-09-26','','','','','','','','','','','','','','','2021-01-05 13:05:43','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,20,'1','20323W','Disposed','WP','WRIT PETITION','2003','2003-12-24','HON`BLE JUSTICE MAHARAJ SINHA','Burdwan                       ','MOHAMED BELAL','MR. SYED NASIRUL HOSAIN','THE BURDWAN DISTRICT PRIMARY SCHOOL COUNCIL AND OTHERS','','2003-12-23','','','','','','','','','','AST','1777','2003','\r\n','\r\n','2021-01-05 13:04:51','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'2','21926W','Disposed','WP','WRIT PETITION','2012','2012-10-10','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','KALAM SK','PROBAL SARKAR','WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LIMITED & ORS','','2012-09-26','','','','','','','','','','','','','','','2021-01-05 13:10:53','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,18,'22','10456W','Disposed','WP','WRIT PETITION','2005','2005-06-28','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Howrah                        ','NITU PRADHAN','MR DWIJADAS PATTANAYAK','STATE OF WEST BENGAL & ORS','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 13:12:57','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,16,'7','97W','Disposed','WP','WRIT PETITION','2010','2012-06-18','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','North 24-Parganas             ','DEBNATH DAS','SHAMIM UL BARI','THE STATE OF WEST BENGAL & ORS','','2010-01-04','','','','','','','','','','','','','','','2021-01-05 13:05:19','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'13','6866W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Burdwan                       ','SMT. KALPANA MUKHERJEE','','STATE OF WEST BENGAL & ORS','','2012-03-29','','','','','','','','','','','','','','','2021-01-05 13:08:01','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'3','21951W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','BABLU KUMAR MONDAL','PROBAL SARKAR','WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LIMITED & ORS','','2012-09-27','','','','','','','','','','','','','','','2021-01-05 13:13:35','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,16,'8','12098W','Disposed','WP','WRIT PETITION','2010','2011-11-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','North 24-Parganas             ','DIPALI RAPHAEL','MR. KAUSHIK SARKAR','THE STATE OF WEST BENGAL & ORS.','','2010-06-10','','','','','','','','','','','','','','','2021-01-05 13:07:59','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'14','8535W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','Kolkata                       ','SIDDHARTHA BASU & OTHERS','DIBYENDU CHATTERJEE','STATE OF WEST BENGAL & ORS','','2012-04-24','','','','','','','','','','','','','','','2021-01-05 13:10:21','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'4','8529W','Disposed','WP','WRIT PETITION','2012','2012-07-23','HON`BLE JUSTICE DEBASISH KAR GUPTA','Hooghly                       ','RAKHAL CHANDRA KEAORA @ ROY AND ORS','MR SANDIP GHOSH','W B S E D C LTD','','2012-04-24','','','','','','','','','','','','','','','2021-01-05 13:15:54','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,17,'15','21691W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE BISWANATH SOMADDER','Birbhum                       ','SANJOY KUMAR MAL','AMAR KUMAR SINHA','THE STATE OF WEST BENGAL & ORS','','2012-09-25','','','','','','','','','','','','','','','2021-01-05 13:11:43','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'9','11681W','Disposed','WP','WRIT PETITION','2010','2012-07-27','HON`BLE JUSTICE BISWANATH SOMADDER','Uttar Dinajpur                ','MD. MAHATABUDDIN SARKAR','REZAUL HOSSAIN','THE STATE OF WEST BENGAL & ORS.','','2010-06-07','','','','','','CPAN/703/2011','','','','','','','','','2021-01-05 13:10:51','hasan gazi','2021-01-05 13:20:50','hasan gazi','N'),
 (1,19,'5','21044W','Disposed','WP','WRIT PETITION','2012','2012-10-08','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','SENTULAL GHOSH','PROBAL SARKAR','WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LIMITED & ORS','','2012-09-17','','','','','','','','','','','','','','','2021-01-05 13:17:31','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,20,'2','872','Disposed','WP.ST','WRIT PETITION','2003','2003-11-25','HON`BLE JUSTICE ALOK KUMAR BASU','Hooghly                       ','SATYA RANJAN DAS BANIK','MR. SUKUMAR GHOSH||MR. SANDIP GHOSH','THE STATE OF WEST BENGAL & ORS','','2003-11-10','','','','','','','','','','','','','','','2021-01-05 13:11:58','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'16','23143W','Disposed','WP','WRIT PETITION','2012','2012-10-19','HON`BLE JUSTICE PATHERYA','Malda                         ','SETARA BEGAM','MR. JAHANGIR ALAM','WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LTD & ORS','','2012-10-10','','','','','','','','','','','','','','','2021-01-05 13:13:51','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'6','21046W','Disposed','WP','WRIT PETITION','2012','2012-10-08','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','HIRALAL MANDAL','PROBAL SARKAR','WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LIMITED & ORS','','2012-09-17','','','','','','','','','','','','','','','2021-01-05 13:19:00','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,16,'10','10418W','Disposed','WP','WRIT PETITION','2010','2012-06-18','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Bankura                       ','MAHASIN MONDAL','MR. CHANDAN MISRA','STATE OF WEST BENGAL & ORS.','','2010-05-13','','','','','','','','','','','','','','','2021-01-05 13:13:04','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'7','21246W','Disposed','WP','WRIT PETITION','2012','2012-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','KHOKAN DE','SRINJAY SENGUPTA','THE STATE OF WEST BENGAL AND OTHERS','','2012-09-18','','','','','','','','','','','','','','','2021-01-05 13:21:01','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'11','25148W','Disposed','WP','WRIT PETITION','2010','2012-07-10','HON`BLE JUSTICE HARISH TANDON','Hooghly                       ','SUBAL CHANDRA SAU','MR. SOURAV MITRA','THE STATE OF WEST BENGAL & ORS.','','2010-12-16','','','','','','','','','','','','','','','2021-01-05 13:15:13','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'8','21275W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','RANJIT MIDDYA','MR MANAS DAS','THE STAER OF WEST BENGAL & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 13:22:52','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'12','11678W','Disposed','WP','WRIT PETITION','2010','2012-07-27','HON`BLE JUSTICE BISWANATH SOMADDER','Uttar Dinajpur                ','MD. FAJLUL HOQUE','REZAUL HOSSAIN','THE STATE OF WEST BENGAL & ORS.','','2010-06-07','','','','','','','','','','','','','','','2021-01-05 13:17:24','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'3','12185W','Disposed','WP','WRIT PETITION','2004','2011-04-19','HON`BLE JUSTICE HARISH TANDON','Coochbehar                    ','DHANANJOY ROY AND  OTHERS','BIBEKANANDA SINGHA ROY','STATE OF WEST BENGAL & ORS','','','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 13:20:34','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'1','17776W','Disposed','WP','WRIT PETITION','2012','2013-01-08','HON`BLE JUSTICE HARISH TANDON','Hooghly                       ','LAKSHMAN CHANDRA KOLEY','HARI MOHAN DAS','THE SUTATE OF WEST BENGAL & ORS','','2012-08-07','','','','','','','','','','','','','','','2021-01-05 13:29:52','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'4','18730W','Disposed','WP','WRIT PETITION','2004','2004-11-22','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Birbhum                       ','ISMAIL MONDAL','MD ASHANUZZAMAN','THE STATE OF WEST BENGAL & ORS','','2004-11-18','','','','','','','','','','','','','','','2021-01-05 13:23:52','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'13','6993W','Disposed','WP','WRIT PETITION','2010','2012-06-18','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','South 24-Parganas             ','SMT. SUPRIYA BARMAN','MR. CHANDAN MISRA','STATE OF WEST BENGAL & ORS.','','2010-04-06','','','','','','','','','','','','','','','2021-01-05 13:23:56','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'2','17204W','Disposed','WP','WRIT PETITION','2012','2012-10-08','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','TARAPADA DAS','MAHADEB KHAN','THE SUTATE OF WEST BENGAL & ORS','','2012-01-20','','','','','','','','','','','','','','','2021-01-05 13:31:52','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'9','21248W','Disposed','WP','WRIT PETITION','2012','2012-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','ARABINDA NASKAR','SRI SRINJAY SENGUPTA','THE STATE OF WEST BENGAL AND OTHERS','','2012-09-18','','','','','','','','','','','','','','','2021-01-05 13:30:34','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'5','3716W','Disposed','WP','WRIT PETITION','2005','2012-03-15','HON`BLE JUSTICE SOUMITRA PAL','Coochbehar                    ','ANANTA KUMAR MODAK','MR. SUKANTA RAY','STATE OF WEST BENGAL & ORS','','2005-02-23','','','','','','','','','','','','','','','2021-01-05 13:25:58','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,16,'14','24433W','Disposed','WP','WRIT PETITION','2010','2012-07-03','HON`BLE JUSTICE HARISH TANDON','North 24-Parganas             ','PRATIVA BISWAS (HALDER)','ARUNAVA BANERJEE','THE STATE OF WEST BENGAL & ORS.','','2010-12-09','','','','','','','','','','','','','','','2021-01-05 13:26:11','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'10','21260W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','SK ABDUL AHAD ALI','MR MANAS DAS','THE STATE OF WEST BENGAL & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 13:32:59','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'17','17209W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Coochbehar                    ','SRI BIKAS MALAKAR','MR AMAR NATH SEN','THE STATE OF WEST BENGAL AND OTHERS','','2012-08-01','','','','','','','','','','','','','','','2021-01-05 13:29:08','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,16,'15','20788W','Disposed','WP','WRIT PETITION','2010','2012-07-07','HON`BLE JUSTICE HARISH TANDON','Paschim Medinipur             ','USHA RANI DAS','MR. SOURAV MITRA','THE STATE OF WEST BENGAL & ORS.','','2010-10-01','','','','','','','','','','','','','','','2021-01-05 13:28:10','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'3','16090W','Disposed','WP','WRIT PETITION','2012','2012-08-02','HON`BLE JUSTICE INDIRA BANERJEE','Kolkata                       ','SRI PAWAN DALUKA','SHAKEEL MOHAMMED AKHTER','THE COMMISSIONER OF CUSTOMS & ORS','','2012-07-24','','','','','','','','','WP/16088W/2012','','','','','','2021-01-05 13:36:10','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'18','15604W','Disposed','WP','WRIT PETITION','2012','2012-10-08','HON`BLE JUSTICE SOUMITRA PAL','Purulia                       ','JUNIOR HIGH SCHOOL & ORS','MR. JAYANTA MITRA','THE STATE OF WEST BENGAL & ORS','','2012-07-13','','','','','','','','','','','','','','','2021-01-05 13:30:46','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'11','21781W','Disposed','WP','WRIT PETITION','2012','2012-10-08','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Nadia                         ','SARIYATULLAH MALLICK & ORS','MR PINGAL BHATTACHARYA','THE STATE OF WEST BENGAL & ORS','','2012-09-26','','','','','','','','','','','','','','','2021-01-05 13:35:13','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'16','20008W','Disposed','WP','WRIT PETITION','2010','2011-09-05','HON`BLE JUSTICE DEBASISH KAR GUPTA','Burdwan                       ','SMT. BANASHREE MUKHERJEE','MR. SUBRATA BHATTACHARYYA','UNION OF INDIA & ORS.','','2010-09-17','','','','','','','','','','','','','','','2021-01-05 13:30:31','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'19','22097W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE DEBASISH KAR GUPTA','Howrah                        ','PANCHKARI MAJI','MRS. SABITA KHUTIA (BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2012-09-28','','','','','','','','','','','','','','','2021-01-05 13:32:23','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'4','16088W','Disposed','WP','WRIT PETITION','2012','2012-08-06','HON`BLE JUSTICE INDIRA BANERJEE','Kolkata                       ','SHRI ARUN KUMAR BHUWANIA','SHAKEEL MOHAMED AKHTER','THE COMMISSIONER OF CUSTOMS & ORS','','2012-07-24','','','','','','','','','WP/16090W/2012','','','','','','2021-01-05 13:38:52','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'12','21849W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE PATHERYA','Bankura                       ','SRI SHIB SANKAR DEY','SUPRIYA RAY CHOWDHURY','THE WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LTD & ORS','','2012-09-26','','','','','','','','','','','','','','','2021-01-05 13:37:22','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,16,'17','9540W','Disposed','WP','WRIT PETITION','2010','2012-05-15','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Purulia                       ','BANSHIDHAR NAYAK','MR. MD. SARWAR JAHAN','THE STATE OF WEST BENGAL & ORS.','','2010-05-05','','','','','','','','','','','','','','','2021-01-05 13:33:04','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,17,'20','8405W','Disposed','WP','WRIT PETITION','2011','2012-10-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','SUBHAJIT SARKAR','','STATE OF WEST BENGAL & ORS','','','','','','','','CAN/7142/2012','','','','','','','','','2021-01-05 13:35:30','Anita Sur','2021-01-05 13:37:36','Anita Sur','N'),
 (1,19,'13','21805W','Disposed','WP','WRIT PETITION','2012','2012-10-16','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','BANAMALI MONDAL (SARKAR)','ARUP SARKAR','THE W B C E D CO LTD & ORS','','2012-09-26','','','','','','','','','','','','','','','2021-01-05 13:40:05','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'14','21253W','Disposed','WP','WRIT PETITION','2012','2012-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','RAHAMAT ALI','SRI SRINJAY SENGUPTA','THE STATE OF WEST BENGAL & ORS','','2012-09-20','','','','','','','','','','','','','','','2021-01-05 13:42:29','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,16,'18','8280W','Disposed','WP','WRIT PETITION','2010','2012-07-13','HON`BLE JUSTICE HARISH TANDON','Hooghly                       ','SRI SYAMAL KANTI CHATTORAJ','MR. GAUTAM BANERJEE','THE STATE OF WEST BENGAL & ORS.','','2010-04-22','','','','','','','','','','','','','','','2021-01-05 13:36:28','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'5','16795W','Disposed','WP','WRIT PETITION','2012','2012-12-18','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','MD ISHA','SUNANDA MOHAN GHOSH','CALCUTTA DOCK LABOUR BOARD & ORS','','2012-07-30','','','','','','','','','','','','','','','2021-01-05 13:44:25','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'21','21325W','Disposed','WP','WRIT PETITION','2012','2012-10-10','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','North 24-Parganas             ','BISWANATH MUKHOPADHYAY','JHUMA CHAKRABORTY','CANARA BANK & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 13:39:31','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'15','21243W','Disposed','WP','WRIT PETITION','2012','2012-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','PROSAD KUMAR PAUL','SRI SRINJAY SENGUPTA','THE STATE OF WEST BENGAL & ORS','','2012-09-18','','','','','','','','','','','','','','','2021-01-05 13:44:05','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'6','16932W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','GITA GHATAK ( MAHANTA)','SOURAV MITRA','THE SUTATE OF WEST BENGAL & ORS','','2012-07-31','','','','','','','','','','','','','','','2021-01-05 13:46:11','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'22','21804W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE DIPANKAR DATTA','Burdwan                       ','SRI KASHI PRASAD','MR. PURNANSIS BHUNIYA','UNION OF INDIA & ORS','','2012-09-26','','','','','','','','','','','','','','','2021-01-05 13:41:47','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'16','21255W','Disposed','WP','WRIT PETITION','2012','2012-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','SK SAIFUDDIN MONDAL','SRI SRINJAY SENGUPTA','THE STATE OF WEST BENGAL & ORS','','2012-09-18','','','','','','','','','','','','','','','2021-01-05 13:46:54','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'1','9555W','Disposed','WP','WRIT PETITION','2010','2012-06-18','HON`BLE JUSTICE HARISH TANDON','Jalpaiguri                    ','AGAPIT TUILA MURHU SANGA','MR. SUBHRANGSU PANDA','THE STATE OF WEST BENGAL & ORS.','','2010-05-05','','','','','','','','','','','','','','','2021-01-05 13:41:03','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'23','15313W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE SOUMITRA PAL','Paschim Medinipur             ','DR. NIRJHAR PATSA','SHRI BISWA PRIYA RAY','THE STATE OF WEST BENGAL AND OTHERS','','2012-07-18','','','','','','','','','','','','','','','2021-01-05 13:44:04','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'17','21261W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','SHUKDEB SHIT','MR MANAS DAS','THE STATE OF WEST BENGAL & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 13:49:31','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'2','1941W','Disposed','WP','WRIT PETITION','2008','2013-01-16','HON`BLE JUSTICE DIPANKAR DATTA','Kolkata                       ','RADHANATH NEOGI','MR. SAJAL KUMAR CHEL','THE CESC LTD & ORS','','2008-01-28','','','','','','','','','','','','','','','2021-01-05 13:43:32','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'7','16767W','Disposed','WP','WRIT PETITION','2012','2012-08-14','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','ELECTROSTEEL CASTINGS LIMITED & ORS','V V V SASTRY','SHRI B S V PRAKASH KUMAR & ORS','','2012-07-30','','','','','','','','','','','','','','','2021-01-05 13:51:25','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'18','21269W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','PRASENJIT SAHOO','MR MANAS DAS','THE STATE OF WEST BENGAL & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 13:51:18','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'3','13041W','Disposed','WP','WRIT PETITION','2010','2012-07-31','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','South 24-Parganas             ','BALAI CHANDRA DAS','MR. GORA CHAND SAMANTA','THE STATE OF WEST BENGAL & ORS.','','2010-06-18','','','','','','','','','','','','','','','2021-01-05 13:45:22','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'8','16000W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE DEBASISH KAR GUPTA','Birbhum                       ','ANIMESH SEN & OTHERS','MR SAIKAT CHATTERJII','THE SUTATE OF WEST BENGAL & ORS','','2012-07-23','','','','','','','','','','','','','','','2021-01-05 13:53:41','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'19','21277W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','ASHIS KUMAR JANA','MR MANAS DAS','THE STATE OF WEST BENGAL & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 13:53:29','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'9','17519W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE DEBASISH KAR GUPTA','Hooghly                       ','DILIP CHATTERJEE','MD HOSSAIN','STATE OF WEST BENGAL & ORS','','2012-08-03','','','','','','','','','','','','','','','2021-01-05 13:55:31','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'24','12606W','Disposed','WP','WRIT PETITION','2010','2012-04-12','HON`BLE JUSTICE AMIT TALUKDAR','Bankura                       ','SUKESH KUMAR SHOM','MR. SUSHANTA KUMAR RAKSHIT','THE STATE OF WEST BENGAL & ORS','','2010-06-15','','`','','','','CAN/7078/2011||CAN/7079/2011','','','','','','','','','2021-01-05 13:50:22','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'20','21256W','Disposed','WP','WRIT PETITION','2012','2012-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','NARENDRA NATH MONDAL','SRI SRINJAY SENGUPTA','THE STATE OF WEST BENGAL & ORS','','2012-09-18','','','','','','','','','','','','','','','2021-01-05 13:55:23','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'10','16616W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE DEBASISH KAR GUPTA','Uttar Dinajpur                ','SIKHA RANI GUPTA','MD ABDUL ALIM','THE STATE OF WEST BENGAL & ORS','','2012-07-27','','','','','','','','','','','','','','','2021-01-05 13:57:50','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'21','21265W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','SURANJAN MURA','MR MANAS DAS','THE STATE OF WEST BENGAL & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 13:56:56','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'11','16834W','Disposed','WP','WRIT PETITION','2012','2012-09-14','HON`BLE JUSTICE SOUMITRA PAL','Murshidabad                   ','NAMITA SARKAR','SRIKANTA DUTTA','THE STATE OF WEST BENGAL & ORS','','2012-07-30','','','','','','','','','','','','','','','2021-01-05 13:59:42','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'22','21252W','Disposed','WP','WRIT PETITION','2012','2012-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','BHUT NATH KUNDU','SRI SRINJAY SENGUPTA','THE STATE OF WEST BENGAL & ORS','','2012-09-18','','','','','','','','','','','','','','','2021-01-05 13:58:44','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'25','16880W','Disposed','WP','WRIT PETITION','2012','2012-10-16','HON`BLE JUSTICE SOUMITRA PAL','Nadia                         ','INDRAJIT ROY','ANINDYA BHATTACHARYA','THE STATE OF WEST BENGAL & ORS','','2012-07-30','','','','','','','','','','','','','','','2021-01-05 13:54:37','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,20,'6','21108W','Disposed','WP','WRIT PETITION','2000','2012-04-27','HON`BLE JUSTICE BISWANATH SOMADDER','North 24-Parganas             ','SK JAKIR HOSSAIN','FARLE RALUS','THE STATE OF WST BENGAL,SERVICE TOUGH THE SECRETARY, CO OPERATIVE SOCIETIES DEPERMNENT NEW SEDRETARIATE BUILDINGS KOLKATA-1||THE REGISTRAR OF CO OPERATIVE SOCIETIES, NEW SECRATRIES BUILDING KOLKATA - 700001||THE ASSISTANT REGISTER OF CO OPERATIVE SOCIETIES , NORTH 24 PARGANAS OFFICER AT BARASAT RISHI BANKIM SARANI , ZILLA PARISHAD BUILDING P.O AND P.S  BARASAT ,DISTRICT NORTH 24 PARGANAS||THE CHAIRMAN,BOARD OF ADMINISTRATORS, MURISHA , D.K PARA, SOMOBAY KRISHI UNNON SAMITY LIMITED,VILLAGER AND P.O MURARISHA P.S HANSHBAD DISTRICT NORTH 24 PGS||GOUTAM KUNDU,MEMBAR OF BOARD OF ADMINISTRATOR,BRANCH MANAGER ,WEST BENGAL STATE CO-OPERATIVE BANK LIMITED BARIRHAT BRANCH P.O BASIRHAT DISTRICT- NORTH 24 PARAGANAS||SRI NABA KUMAR BANERJEE MEMBAR BOARD OF ADMINISTRATORS  AREA SUPERVISOR HANSHBAD BLOCK,WEST BENGAL CO OPERRATIVE BANK LTD.BASIRHAT BRANCH P.O  AND P.S  BASIRHAT, DISTRICT NORTH 24 PARGANAS||THE SECRETARY OF MURISHA D.K. PARA SOMOBAY KRISHI UNNON SAMITY LTD VILLAGE AND P.O MURISHA DISTRICT NORTH 24 PARGANAS','','2002-11-11','','','','','','CAN/1381/2012||CAN/11791/2011','','','','','','','','','2021-01-05 13:53:36','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'4','3733W','Disposed','WP','WRIT PETITION','2008','2013-01-11','HON`BLE JUSTICE SOUMEN SEN','Purba Medinipur               ','SWAPAN JANA AND OTHERS','SK. MUSTAK ALI','WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LIMITED AND OTHERS','','2008-02-27','','','','','','','','','','','','','','','2021-01-05 13:53:15','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'12','16208W','Disposed','WP','WRIT PETITION','2012','2012-08-22','HON`BLE JUSTICE DEBASISH KAR GUPTA','Bankura                       ','LALMOHAN KUNDU','MRS SABITA KHUTIA (BHUIYA)','THE STATE OF WEST BENGAL & ORS','','2012-07-25','','','','','','','','','','','','','','','2021-01-05 14:01:42','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'26','23108W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','GOURDAS BHAUMIK','MR. GURUPADA DAS','THE STATE OF WEST BENGAL & OTHERS','','2012-10-10','','','','','','','','','','','','','','','2021-01-05 13:56:12','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'23','21999W','Disposed','WP','WRIT PETITION','2012','2012-10-10','HON`BLE JUSTICE DIPANKAR DATTA','Burdwan                       ','SHYAMAL PAL & ANR','M F RAHAMAN','THE STATE OF WEST BENGAL & ORS','','2012-09-27','','','','','','','','','','','','','','','2021-01-05 14:00:55','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'13','16693W','Disposed','WP','WRIT PETITION','2012','2012-09-11','HON`BLE JUSTICE DEBASISH KAR GUPTA','Paschim Medinipur             ','KARTICK CHANDRA BHUNIA','YUDHAJIT GUHA','THE STATE OF WEST BENGAL & ORS','','2012-07-27','','','','','','','','','','','','','','','2021-01-05 14:03:54','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'24','21660W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE BISWANATH SOMADDER','Birbhum                       ','RITA GORAI MONDAL','AMAR KUMAR SINHA','THE STATE OF WEST BENGAL & ORS','','2012-09-25','','','','','','','','','','','','','','','2021-01-05 14:02:20','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'7','20347W','Disposed','WP','WRIT PETITION','2004','2012-08-31','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','PLASTO CHEM  PRIVATE LIMITED & ANR','R.L. GAGGAR','WEST BENGAL STATE ELECTRICITY BOARD & ORS','','2004-10-25','','','','','','','','','','','','','','','2021-01-05 13:57:33','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'25','21684W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE BISWANATH SOMADDER','Birbhum                       ','GOUR SUNDAR MONDAL','AMAR KUMAR SINHA','THE STATE OF WEST BENGAL & ORS','','2012-09-25','','','','','','','','','','','','','','','2021-01-05 14:04:00','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'14','16759W','Disposed','WP','WRIT PETITION','2012','2012-09-19','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','South 24-Parganas             ','DINABANDHU MONDAL','MR PINGAL BHATTACHERJEE','PASCHIM BANGA GRAMIN BANK & ORS','','2012-07-30','','','','','','','','','','','','','','','2021-01-05 14:06:34','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'5','3743W','Disposed','WP','WRIT PETITION','2008','2013-01-16','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Kolkata                       ','SUBHOMOY NEOGI','KABERI SENGUPTA (MRS. MAITI)','THE STATE OF WEST BENGAL & ORS.','','2008-02-27','','','','','','','','','','','','','','','2021-01-05 13:58:56','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'26','21667W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE BISWANATH SOMADDER','Birbhum                       ','BHUPEN BHUIN MALI','AMAR KUMAR SINHA','THE STATE OF WEST BENGAL & ORS','','2012-09-25','','','','','','','','','','','','','','','2021-01-05 14:05:28','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'27','7483W','Disposed','WP','WRIT PETITION','2012','2012-10-18','HON`BLE JUSTICE SUBHRO KAMAL MUKHERJEE','South 24-Parganas             ','SANKAR NASKAR','SHAH JAMAL HAZRA','THE STATE OF WEST BENGAL & ORS','','','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 14:01:59','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'27','21779W','Disposed','WP','WRIT PETITION','2012','2012-03-09','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Purulia                       ','BISHAKHA MAHATO & ORS','MR TIMIR BARAN SAHA','THE STATE OF WEST BENGAL AND OTHERS','','2012-09-26','','','','','','','','','','','','','','','2021-01-05 14:07:22','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'15','16096W','Disposed','WP','WRIT PETITION','2012','2012-09-14','HON`BLE JUSTICE BISWANATH SOMADDER','Purba Medinipur               ','ANIL KUMAR GIRI','BISWAJIT SARKAR','THE STATE OF WEST BENGAL & ORS','','2012-07-24','','','','','','','','','','','','','','','2021-01-05 14:09:30','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'28','22582W','Disposed','WP','WRIT PETITION','2012','2012-10-10','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','SMT. SHANTI DEVI','UPENDRA ROY','BOARD OF TRUSTEES FOR THE PORT OF KOLKATA & ORS','','2012-10-05','','','','','','','','','','','','','','','2021-01-05 14:03:48','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'29','22045W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','SANJAY HAZRA','MR. AMAR NATH SEN','THE STATE OF WEST BENGAL & ORS','','2012-09-27','','','','','','','','','','','','','','','2021-01-05 14:05:15','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,23,'6','4401W','Disposed','WP','WRIT PETITION','2008','2010-05-05','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','North 24-Parganas             ','RABINDRA KUMAR SINGH','MR. SHEKHAR BARMAN','THE STATE OF WEST BENGAL & ORS.','','2008-03-05','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 14:03:39','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'16','16175W','Disposed','WP','WRIT PETITION','2012','2012-08-03','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','SUDIP BANDOPADHYAY','DIPAK RANJAN MUKHERJEE','STATE OF WEST BENGAL & ORS','','2012-07-24','','','','','','','','','','','','','','','2021-01-05 14:11:57','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'30','20490W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','North 24-Parganas             ','GOURAB DAS','SRI JAYANTA KUMAR MUKHOPADHYAY','INDIRA GANDHI NATIONAL OPEN UNIVERSITY & ORS','','2012-09-10','','','','','','','','','','','','','','','2021-01-05 14:07:00','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'28','21045W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','SRI SUSANTA PAL & OTHERS','SANKAR SARKAR','THE STATE OF WEST BENGAL & OTHERS','','2012-09-17','','','','','','','','','','','','','','','2021-01-05 14:11:45','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'31','17705W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','Burdwan                       ','MADHUSUDAN DAS','SK. HEDAYATULLAH','THE STATE OF WEST BENGAL & ORS','','2012-08-06','','','','','','','','','','','','','','','2021-01-05 14:08:20','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,19,'29','21254W','Disposed','WP','WRIT PETITION','2012','2012-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','JAGADIS SINGH','SRI SRINJAY SENGUPTA','THE STATE OF WEST BENGAL & OTHERS','','2012-09-18','','','','','','','','','','','','','','','2021-01-05 14:13:14','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'17','16664W','Disposed','WP','WRIT PETITION','2012','2012-08-30','HON`BLE JUSTICE DEBASISH KAR GUPTA','Paschim Medinipur             ','SUJIT KUMAR GHOSH','MRS SABITA KHUTIA ( BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2012-07-27','','','','','','','','','','','','','','','2021-01-05 14:15:02','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'7','5401W','Disposed','WP','WRIT PETITION','2008','2013-01-11','HON`BLE JUSTICE SOUMEN SEN','Burdwan                       ','M/S. UJJAL TRANSPORT AGENCY & ANR.','SUMITA SHAW','EASTERN COALFIELDS LIMITED & ORS.','','2008-03-20','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 14:07:44','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,17,'32','17896W','Disposed','WP','WRIT PETITION','2012','2012-08-27','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Hooghly                       ','ACHINTA KUSHARI','MR. KAJAL RAY','THE STATE OF WEST BENGAL & ORS','','2012-08-08','','','','','','','','','','','','','','','2021-01-05 14:09:56','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,19,'30','21249W','Disposed','WP','WRIT PETITION','2012','2012-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','MANICK CHANDRA DAS','SRI SRINJAY SENGUPTA','THE STATE OF WEST BENGAL & OTHERS','','2012-09-18','','','','','','','','','','','','','','','2021-01-05 14:14:37','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'18','16575W','Disposed','WP','WRIT PETITION','2012','2012-08-22','HON`BLE JUSTICE DEBASISH KAR GUPTA','South 24-Parganas             ','BIBEKANANDA NAYEK','KAMAL MISHRA','THE STATE OF WEST BENGAL & ORS','','2012-07-26','','','','','','','','','','','','','','','2021-01-05 14:16:12','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'8','5503W','Disposed','WP','WRIT PETITION','2008','2008-03-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Uttar Dinajpur                ','KARIMA KHATUN','MD. HABIBUR RAHMAN','THE STATE OF WEST BENGAL & ORS.','','2008-03-24','','','','','','','','','','','','','','','2021-01-05 14:10:06','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'19','16156W','Disposed','WP','WRIT PETITION','2012','2012-08-14','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Purba Medinipur               ','ANIL BARAN BHUNIYA','UTTAM KUMAR DE','THE STATE OF WEST BENGAL & ORS','','2012-07-24','','','','','','','','','','','','','','','2021-01-05 14:18:45','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'8','17873W','Disposed','WP','WRIT PETITION','2004','2005-04-13','HON`BLE JUSTICE MAHARAJ SINHA','Howrah                        ','SRI. BIMAL MAITY','BHASKAR NANDI','THE REGIONAL TRANSPORT AUTHORITY,HOWRAH P.O,P.S & DISTRICT -HOWRAH 3||THE CHAIRMAN, REGIONAL TRANSPORT AUTHORITY, HOWRAH P.O,P.S & DISTRICT -HOWRAH||THE SECTARY, REGIONAL TRANSPORT AUTHORITY,HOWRAH,P.O,P.S & DISTRICT -HOWRAH||THE STATE OF WST BENGAL, SERVICE THROUGH THE SECTARY,DEPERMENT OF TRANSHPORT WRITIERS BUILDING KOLKATA-700001','','2005-08-17','','','','','','','','','','','','','','','2021-01-05 14:11:34','sayan swarnakar','2021-01-05 14:13:53','sayan swarnakar','N'),
 (1,23,'9','5893W','Disposed','WP','WRIT PETITION','2008','2013-01-11','HON`BLE JUSTICE SOUMEN SEN','Purba Medinipur               ','SABITA GIRI (SAHOO)','MR. MANORANJAN JANA','THE DIRECTOR OF PENSION, P.F. & G.I & OTHERS','','2008-03-28','','','','','','','','','','','','','','','2021-01-05 14:12:59','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'20','16364W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Coochbehar                    ','NARAYAN CHANDRA GHOSH','SUBHRANGSU PANDA','THE STATE OF WEST BENGAL & ORS','','2012-07-26','','','','','','','','','','','','','','','2021-01-05 14:20:54','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,22,'1','10263W','Disposed','WP','WRIT PETITION','2012','2012-05-17','HON`BLE JUSTICE DEBASISH KAR GUPTA','Birbhum                       ','RASOBA BIBI','MD. ABDUL ALIM','THE W.B.S.E.D CO LTD & ORS','','2012-05-11','','','','','','','','','','','','','','','2021-01-05 14:15:13','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'1','6316W','Disposed','WP','WRIT PETITION','2012','2012-12-13','HON`BLE JUSTICE BISWANATH SOMADDER','Birbhum                       ','UTPAL GORAI & ORS','BIKASH KUMAR MUKHERJEE','THE STATE OF WEST BENGAL & ORS','','2012-03-27','','','','','','','','','','','','','','','2021-01-05 14:20:06','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,23,'10','6754W','Disposed','WP','WRIT PETITION','2008','2013-01-11','HON`BLE JUSTICE SOUMEN SEN','Burdwan                       ','SK. IMDADUL HOSSAIN & ORS.','BINAY KUMAR PANDA','STATE OF WEST BENGAL & ORS.','','2008-04-10','','','','','','','','','','','','','','','2021-01-05 14:15:26','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'2','22799W','Disposed','WP','WRIT PETITION','2012','2012-10-18','HON`BLE JUSTICE DIPANKAR DATTA','North 24-Parganas             ','MD ESTULLAH GAZI @ MALLEK GAZI & ORA','MR RAMKRISHNA BISWAS','THE STATE OF WEST BENGAL & ORS','','2012-10-08','','','','','','','','','','','','','','','2021-01-05 14:22:14','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'9','17876W','Disposed','WP','WRIT PETITION','2004','2005-04-13','HON`BLE JUSTICE MAHARAJ SINHA','Howrah                        ','SRI BHIM SENGUPTA & ANR','BHASKAR NANDI','STATE OF WEST BENGAL & ORS','','2004-10-12','','','','','','','','','','','','','','','2021-01-05 14:17:40','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,22,'2','10482W','Disposed','WP','WRIT PETITION','2012','2012-05-18','HON`BLE JUSTICE DIPANKAR DATTA','Kolkata                       ','BIJOY PATWARI & ANR','','ORIENTAL BANK OF COMMERCERCE & ORS','','2012-05-15','','','','','','','','','','','','','','','2021-01-05 14:19:09','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'21','17724W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE ANIRUDDHA BOSE','North 24-Parganas             ','POULAMI SINHA RAY','SUROJIT ROYCHOUDHURY','UNIVERSITY OF CALCUTTA & ORS','','2012-08-06','','2012','','','','','','','','','','','','','2021-01-05 14:25:02','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'3','27782W','Disposed','WP','WRIT PETITION','2012','2013-01-28','HON`BLE JUSTICE SAMBUDDHA CHAKRABARTI','Burdwan                       ','SRI NIKHIL RANJAN MAITRA','ABHIJIT SARKAR','UNION OF INDIA','','2012-12-19','','','','','','','','','','','','','','','2021-01-05 14:23:56','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,23,'11','6814W','Disposed','WP','WRIT PETITION','2008','2013-01-16','HON`BLE JUSTICE SOUMEN SEN','Paschim Medinipur             ','MODERN ELECTRIC WORKS.','MR. SWAPAN KUMAR PAL','STATE OF WEST BENGAL & ORS.','','2008-04-11','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 14:18:10','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,22,'3','10506W','Disposed','WP','WRIT PETITION','2012','2012-08-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Coochbehar                    ','SRI ABINASH CHANDRA','MR. SAYED NAZMUL HOSSAIN','THE STATE OF WEST BENGAL & ORS','','2012-05-15','','','','','','','','','','','','','','','2021-01-05 14:20:37','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'4','22674W','Disposed','WP','WRIT PETITION','2012','2013-01-16','HON`BLE JUSTICE SOUMITRA PAL','Uttar Dinajpur                ','MUSTT SAMSUN NEHAR KHATUN','MD HABIBUR RAHAMAN','THE STATE OF WEST BENGAL & OTHERS','','2012-10-05','','','','','','','','','','','','','','','2021-01-05 14:25:58','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'22','17179W','Disposed','WP','WRIT PETITION','2012','2012-12-19','HON`BLE JUSTICE DIPANKAR DATTA','North 24-Parganas             ','PEGASUS ASSETS RECONSTRUCTION PRIVATE LIMITED & ANR','SANJIV KUMAR TRIVEDI','STATE OF WEST BENGAL & ORS','','2012-08-01','','','','','','','','','','','','','','','2021-01-05 14:27:58','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'12','6957W','Disposed','WP','WRIT PETITION','2008','2013-01-11','HON`BLE JUSTICE SOUMEN SEN','South 24-Parganas             ','MANNAN DEWAN & ORS.','M.A. SAMAD','THE STATE OF WEST BENGAL & ORS.','','2008-04-16','','','','','','','','','','','','','','','2021-01-05 14:20:21','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,22,'5','11119W','Disposed','WP','WRIT PETITION','2012','2012-06-26','HON`BLE JUSTICE SOUMITRA PAL','Murshidabad                   ','BRAMHAMANTULI PIARAPUR BHAGIRATHI FISHERMENS CO OP SOCIETY LIMITED','ARINDAM DAS','THE STATE OF WEST BENGAL & ORS','','2012-05-18','','','','','','','','','','','','','','','2021-01-05 14:23:21','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,24,'5','21903W','Disposed','WP','WRIT PETITION','2012','2012-12-20','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','SMT BHASWATI MONDAL','MISS ANEE RAY','THE STATE OF WEST BENGAL & ORS','','2012-09-26','','','','','','','','','','','','','','','2021-01-05 14:27:47','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'23','17232W','Disposed','WP','WRIT PETITION','2012','2012-12-05','HON`BLE JUSTICE DEBASISH KAR GUPTA','Paschim Medinipur             ','MONORANJAN MURMU','MR DEBASIS DEY','THE STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 14:29:50','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'13','7287W','Disposed','WP','WRIT PETITION','2008','2013-01-11','HON`BLE JUSTICE SOUMEN SEN','Kolkata                       ','M/S S. ENTERPRISE & ANR.','MS. TANUSREE GHOSH','STATE OF WEST BENGAL AND OTHERS','','2008-04-22','','','','','','','','','','','','','','','2021-01-05 14:23:15','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,24,'6','28062W','Disposed','WP','WRIT PETITION','2012','2013-02-07','HON`BLE JUSTICE DIPANKAR DATTA','Kolkata                       ','ALL INDIA PUNJAB NATIONAL BANK','SIMONTINI BHADRA','PUNJAB NATIONAL BANK & ORS','','2012-12-20','','','','','','','','','','','','','','','2021-01-05 14:30:30','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'24','17848W','Disposed','WP','WRIT PETITION','2012','2012-12-13','HON`BLE JUSTICE HARISH TANDON','Murshidabad                   ','RABINDRA NATH PAUL & ANR','GOLAM SEYADAIN KEDARI','STATE OF WEST BENGAL & ORS','','2012-08-08','','','','','','','','','','','','','','','2021-01-05 14:32:13','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,22,'6','9311W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE SOUMITRA PAL','Jalpaiguri                    ','LATA CHAKRABOLRTY','TANUJA BASAK','THE STATE OF WEST BENGAL & ORS','','2012-05-02','','','','','','','','','','','','','','','2021-01-05 14:26:37','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'25','17981W','Disposed','WP','WRIT PETITION','2012','2013-01-03','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','RAJKUMAR PANDIT','SHAMIM UL BARI','THE STATE OF WEST BENGAL & ORS','','2012-08-10','','','','','','','','','','','','','','','2021-01-05 14:33:53','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,22,'4','10807W','Disposed','WP','WRIT PETITION','2012','2012-07-03','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Purba Medinipur               ','PRAKAS KUMAR MAITY','YUDHAJIT GUHA','THE STATE OF WEST BENGAL & ORS','','2012-05-17','','','','','','','','','','','','','','','2021-01-05 14:28:29','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'7','7891W','Disposed','WP','WRIT PETITION','2012','2013-02-07','HON`BLE JUSTICE SOUMITRA PAL','North 24-Parganas             ','CHAPALA SANA','MR DEBABRATA MANDAL','THE STATE OF WEST BENGAL & ORS','','2012-04-17','','','','','','','','','','','','','','','2021-01-05 14:32:54','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'26','17014W','Disposed','WP','WRIT PETITION','2012','2012-09-11','HON`BLE JUSTICE DEBASISH KAR GUPTA','Paschim Medinipur             ','LASA MANDI','MR DEBASIS DEY','THE STATE OF WEST BENGAL & ORS','','2012-07-31','','','','','','','','','','','','','','','2021-01-05 14:35:34','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'14','7572W','Disposed','WP','WRIT PETITION','2008','2013-01-10','HON`BLE JUSTICE SOUMEN SEN','North 24-Parganas             ','PRAHLAD CHANDRA DEB','MR. SWAPAN KUMAR DUTTA','WBSEDCOLTD & ORS','','2008-04-23','','','','','','','','','','','','','','','2021-01-05 14:28:00','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'8','2276W','Disposed','WP','WRIT PETITION','2012','2013-01-21','HON`BLE JUSTICE INDIRA BANERJEE','Malda                         ','BIRENDRA NATH PANDAY','MD YUSUF ALI','THE STATE OF WEST BENGAL & ORS','','2012-02-02','','','','','','','','','','','','','','','2021-01-05 14:34:41','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,22,'7','9532W','Disposed','WP','WRIT PETITION','2012','2012-07-02','HON`BLE JUSTICE PATHERYA','North 24-Parganas             ','SMT. SATI DAS','MR RASOMAY MONDAL','STATE OF WEST BENGAL & OTHERS','','2012-05-03','','','','','','','','','','','','','','','2021-01-05 14:30:42','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'27','17457W','Disposed','WP','WRIT PETITION','2012','2012-10-16','HON`BLE JUSTICE SOUMITRA PAL','Hooghly                       ','PUJA NANDY','TARUN KUMAR DAS','THE WEST BENGAL BOARD OF SECONDARY EDUCATION & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 14:37:42','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'15','10045W','Disposed','WP','WRIT PETITION','2008','2013-01-10','HON`BLE JUSTICE SOUMEN SEN','Burdwan                       ','KARTICK DOCKAL & ORS.','MR. DIPANKAR PAL','THE STATE OF WEST BENGAL & ORS.','','2008-06-02','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 14:30:19','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,22,'8','23356W','Disposed','WP','WRIT PETITION','2012','2012-10-18','HON`BLE JUSTICE ANIRUDDHA BOSE','Paschim Medinipur             ','MANIKA MAJUMDER','SYED MANSUR ALI','THE STATE OF WEST BENGAL & ORS','','2012-10-11','','','','','','','','','','','','','','','2021-01-05 14:32:14','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'9','27828W','Disposed','WP','WRIT PETITION','2012','2013-01-03','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Howrah                        ','VIVEKANANDA LAHA','BISEADEB RAY CHAUDHURI','THE STATE OF WEST BENGAL & ORS','','2012-12-19','','','','','','','','','','','','','','','2021-01-05 14:36:38','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'28','17376W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Purba Medinipur               ','NARENDRA NATH RAUL','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 14:39:14','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'29','17562W','Disposed','WP','WRIT PETITION','2012','2012-12-03','HON`BLE JUSTICE SOUMITRA PAL','Birbhum                       ','SHANTANU BISWAS & ORS','SIDDHARTHA SANKAR MANDAL','THE STATE OF WEST BENGAL & ORS','','2012-08-03','','','','','','','','','','','','','','','2021-01-05 14:41:06','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'10','1043W','Disposed','WP','WRIT PETITION','2013','2013-02-07','HON`BLE JUSTICE ANIRUDDHA BOSE','Kolkata                       ','KRISHNA SARKAR','AMLAN KUMAR MUKHERJEE','THE STATE OF WEST BENGAL & OTHERS','','2013-07-14','','','','','','','','','','','','','','','2021-01-05 14:39:55','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,23,'16','14521W','Disposed','WP','WRIT PETITION','2008','2013-01-16','HON`BLE JUSTICE SOUMEN SEN','Kolkata                       ','WEST BENGAL STATE ELECTRICAL CONTRACTOR`S ASSOCIATION AND ANOTHER','MR. SUPRIYO CHATTOPADHYAY','WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LIMITED AND OTHERS','','2008-07-11','','','','','','','','','','','','','','','2021-01-05 14:35:00','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,21,'30','17429W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Purba Medinipur               ','ANJANA BISWAS (GIRI)','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 14:43:21','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'11','24285W','Disposed','WP','WRIT PETITION','2012','2013-01-17','HON`BLE JUSTICE ANIRUDDHA BOSE','Hooghly                       ','SRI NRIPENDFRA SAMANTA','DWARIKA NATH MUKHERJEE','THE WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LTD & ORS','','2012-10-19','','','','','','','','','','','','','','','2021-01-05 14:42:10','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'31','17859W','Disposed','WP','WRIT PETITION','2012','2012-10-18','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Howrah                        ','SUBHASH CHANDRA PANDEY','MRS SABITA KHUTIA ( BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2012-08-08','','','','','','','','','','','','','','','2021-01-05 14:45:25','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,23,'17','20503W','Disposed','WP','WRIT PETITION','2008','2013-01-10','HON`BLE JUSTICE SOUMEN SEN','North 24-Parganas             ','SANTOSH CHATTERJEE & ORS.','MR. MURARIDAS RAY','STATE OF WEST BENGAL & ORS.','','2008-08-18','','','','','','','','','','','','','','','2021-01-05 14:38:23','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'12','23312W','Disposed','WP','WRIT PETITION','2012','2013-01-14','HON`BLE JUSTICE SOUMITRA PAL','Burdwan                       ','GOPI NATH DEY','MR SARIFUL ISLAM MALLICK','THE STATE OF WEST BENGAL & ORS','','2012-10-11','','','','','','','','','','','','','','','2021-01-05 14:44:30','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'32','17747W','Disposed','WP','WRIT PETITION','2012','2012-11-30','HON`BLE JUSTICE SOUMITRA PAL','South 24-Parganas             ','MD ABDULLAH GAZI','MR MD ASRAFUL HUQ','THE STATE OF WEST BENGAL & ORS','','2012-08-07','','','','','','','','','','','','','','','2021-01-05 14:47:02','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,24,'13','15480W','Disposed','WP','WRIT PETITION','2011','2013-01-08','HON`BLE JUSTICE JOYMALYA BAGCHI||HON`BLE CHIEF JUSTICE ARUN MISHRA','Murshidabad                   ','BISWAJIT SHEE','MR SUBRATA GHOSH','THE STATE OF WEST BENGAL & OTHERS','','2011-09-09','','','','','','','','','','','','','','','2021-01-05 14:47:04','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,21,'33','17857W','Disposed','WP','WRIT PETITION','2012','2012-10-18','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Purba Medinipur               ','NIMAI CHARAN MISRA','MRS SABITA KHUTIA (BHUNYA)','THE STATE OF WEST BENGAL & ORS','','2012-08-08','','','','','','','','','','','','','','','2021-01-05 14:49:30','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,22,'9','2862W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA||HON`BLE JUSTICE ASIM KR. MONDAL','North 24-Parganas             ','MRINAL KANTI BIKSWAS','','UNION OF INDIA, SERVICE THROUGH THE SECRETARY, MINISTRY OF LAW AND JUSTICE||THE STATE OF WEST BENGAL, SERVICE THROUGH THE CHIEF SECRETARY, WRITERS BUILDING||THE CHAIRMAN, LAW COMMISSION, SHAHSTRI BHAVAN||JUDICIAL MAGISTRATE','','2012-02-10','','','','','','','','','','','','','','','2021-01-05 14:44:12','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,20,'10','11128W','Disposed','WP','WRIT PETITION','2004','2012-06-21','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Nadia                         ','BEDIBHAWAN RABITIRRTHA||MADHUSUDAN CHAKRABORTY','PRATIK DHAR','THE STATE OF WEST BENGAL||WEST BENGAL BOARD OF SECANDARY EDUCATION||ASSISTANT ACCOUNT OFFICER||THE ENCROFMENT OFFICER||THE ASSASTANT PROVIDENT FUND COMMISSION||UNION OF INDIA||CENTRAL PROVIDENT FUND COMMISSIONER||THE REGIONAL PROVIDENT FUND||THEB REGIONAL P[ROVIDENT FUND COMMISION','','2004-07-07','','','','','','','','','','','','','','','2021-01-05 14:43:13','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,22,'10','8628W','Disposed','WP','WRIT PETITION','2012','2012-04-30','HON`BLE JUSTICE DIPANKAR DATTA','Howrah                        ','SRI PRABIR ROY CHOWDHURY','MR. KAMAL KANTA KAR','THE STATE OF WEST BENGAL & ORS','','2012-04-25','','','','','','','','','','','','','','','2021-01-05 14:46:08','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,24,'14','13200W','Disposed','WP','WRIT PETITION','2009','2009-08-25','HON`BLE JUSTICE TAPEN SEN','Purba Medinipur               ','SK AMIR ALI','SOUMEN BHATTACHARJEE','STATE OF WEST BENGAL & ORS','','2009-07-09','','','','','','','','','','','','','','','2021-01-05 14:50:55','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'11','21131W','Disposed','WP','WRIT PETITION','2004','2005-01-17','HON`BLE JUSTICE MAHARAJ SINHA','Howrah                        ','MC 48 TREKKER OWNERS ASSOCATION','SAILDENDRA CHANDRA DEBNATH','THE STATE OF WEST BENGAL & ORS','','2004-12-15','','','','','','','','','','','','','','','2021-01-05 14:45:54','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,22,'11','15626W','Disposed','WP','WRIT PETITION','2012','2012-10-03','HON`BLE JUSTICE DEBASISH KAR GUPTA','Nadia                         ','BHABANI MOHAN SINHA','DILIP KUMAR MAITI','THE STATE OF WEST BENGAL & ORS','','2012-07-20','','','','','','','','','','','','','','','2021-01-05 14:47:44','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,24,'15','16508W','Disposed','WP','WRIT PETITION','2012','2013-01-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Howrah                        ','JOYDEB MAJI','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS','','2012-07-26','','','','','','','','','','','','','','','2021-01-05 14:52:16','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,22,'12','15084W','Disposed','WP','WRIT PETITION','2011','2012-08-23','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','MOKTAR ALI MOLLA','SIBANI BHAGAT','THE STATE OF WEST BENGAL & OTHERS','','2011-09-06','','','','','','','','','','','','','','','2021-01-05 14:49:23','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'16','1227W','Disposed','WP','WRIT PETITION','2011','2012-10-16','HON`BLE JUSTICE BISWANATH SOMADDER','South 24-Parganas             ','DASARATH MONDAL','PRANAB KR JANA','THE PRADHAN KACHU KHALI GRAM PANCHAYAT & OTHERS','','2011-01-19','','','','','','','','','','','','','','','2021-01-05 14:54:32','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,25,'1','13011W','Disposed','WP','WRIT PETITION','2012','2012-07-24','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Hooghly                       ','PRITHINDRA CHAKRABORTY','MR. AMIT BANERJEE','THE STATE OF WEST BENGAL & ORS.','','2012-06-22','','','','','','','','','','','','','','','2021-01-05 15:03:15','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'2','13065W','Disposed','WP','WRIT PETITION','2012','2012-08-16','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','BASUDEV MAITY','MR. ANUP DASGUPTA','THE STATE OF WEST BENGAL & ORS.','','2012-06-22','','','','','','','','','','','','','','','2021-01-05 15:05:24','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'3','13067W','Disposed','WP','WRIT PETITION','2012','2012-08-16','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','URMILA MONDAL','MR. ANUP DASGUPTA','THE STATE OF WEST BENGAL & ORS.','','2012-06-22','','','','','','','','','','','','','','','2021-01-05 15:07:13','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,25,'4','13068W','Disposed','WP','WRIT PETITION','2012','2012-08-16','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','SMT. GITA HALDER','MR. ANUP DASGUPTA','THE STATE OF WEST BENGAL & ORS.','','2012-06-22','','','','','','','','','','','','','','','2021-01-05 15:09:07','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'5','13069W','Disposed','WP','WRIT PETITION','2012','2012-08-16','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','ANUKUL MANDAL','MR. ANUP DASGUPTA','THE STATE OF WEST BENGAL & ORS.','','2012-06-22','','','','','','','','','','','','','','','2021-01-05 15:10:46','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'12','12656W','Disposed','WP','WRIT PETITION','2004','2005-03-14','HON`BLE JUSTICE MAHARAJ SINHA','Hooghly                       ','MIRZA MAHASIN','DILIP KUMAR SAMANTA','STATE OF WEST BENGAL & ORS','','2004-11-18','','','','','','','','','','','','','','','2021-01-05 15:12:42','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,25,'6','13145W','Disposed','WP','WRIT PETITION','2012','2012-08-23','HON`BLE JUSTICE DEBASISH KAR GUPTA','Uttar Dinajpur                ','FARUQUE AZAM','MD. HABIBUR RAHMAN','THE STATE OF WEST BENGAL AND OTHERS,','','2012-06-25','','','','','','','','','','','','','','','2021-01-05 15:13:15','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'17','27818W','Disposed','WP','WRIT PETITION','2012','2013-01-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Howrah                        ','SK SUBID ALI & ORS','SUSMITA CHATERJEE','STATE OF WEST BENGAL & ORS','','2012-12-19','','','','','','','','','','','','','','','2021-01-05 15:20:30','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'13','9879','Disposed','WP','WRIT PETITION','2004','2004-08-06','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','North 24-Parganas             ','GAURI SANKAR SHAW','SIVA PRASAD GHOSH','CESC LIMITED & ANOTHER','','2004-06-21','','','','','','','','','','','','','','','2021-01-05 15:15:46','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,25,'7','13170W','Disposed','WP','WRIT PETITION','2012','2012-08-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Burdwan                       ','AKSHAY MONDAL','MR. MIRZA KAMRUDDIN','THE STATE OF WEST BENGAL & ORS.','','2012-06-25','','','','','','','','','','','','','','','2021-01-05 15:15:24','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'1','10298W','Disposed','WP','WRIT PETITION','2005','2005-07-14','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','South 24-Parganas             ','EFRED ALI MOLLA','TUSHER KANTI MUKHERJEE','THE STATE OF WEST BENGAL & ORS','','2005-05-16','','','','','','','','','','','','','','','2021-01-05 15:25:07','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'8','13182W','Disposed','WP','WRIT PETITION','2012','2012-08-01','HON`BLE JUSTICE PATHERYA','Malda                         ','CHHABILAL MANDAL','KAKALI SAMAJPATY','THE STATE OF WEST BENGAL & ORS.','','2012-06-25','','','','','','','','','','','','','','','2021-01-05 15:17:35','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,24,'18','133','Disposed','WPLRT','WRIT PETITION','2012','2012-12-05','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA||HON`BLE JUSTICE TARUN KUMAR DAS','Birbhum                       ','KABATULLAH MOLLA AND OTHERS','MD AHNASANUZZAMAN','THE STATE OF WEST BENGAL & OTHERS','','2012-05-14','','','','','','','','','','','','','','','2021-01-05 15:24:02','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'9','13183W','Disposed','WP','WRIT PETITION','2012','2012-08-01','HON`BLE JUSTICE PATHERYA','Malda                         ','BHASKAR MANDAL','KAKALI SAMAJPATY','THE STATE OF WEST BENGAL & ORS.','','2012-06-25','','','','','','','','','','','','','','','2021-01-05 15:19:23','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'14','2715W','Disposed','WP','WRIT PETITION','2004','2004-03-04','HON`BLE JUSTICE MAHARAJ SINHA','Paschim Medinipur             ','SUNIL KUMAR BERA','RAJ KUMAR CHAKRABORTY','STATE OF WEST BENGAL & ORS','','2004-02-18','','','','','','','','CPAN/531/2005','','','','','','','2021-01-05 15:20:28','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,26,'2','10074W','Disposed','WP','WRIT PETITION','2005','2005-07-21','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Howrah                        ','ABDUL RASHID','UDDIPAN BANERJEE','C.E.S.C LIMITED & OTHERS','','2005-05-12','','','','','','','','','','','','','','','2021-01-05 15:28:36','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'10','13268W','Disposed','WP','WRIT PETITION','2012','2012-08-17','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purulia                       ','DINESH BOURI','MR. UTTAM BANERJEE','THE STATE OF WEST BENGAL & ORS.','','2012-06-26','','','','','','','','','','','','','','','2021-01-05 15:21:36','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'11','13293W','Disposed','WP','WRIT PETITION','2012','2012-08-01','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Purba Medinipur               ','SK. AFSAR ALI','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS.','','2012-06-26','','','','','','','','','','','','','','','2021-01-05 15:23:32','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,26,'3','9847W','Disposed','WP','WRIT PETITION','2005','2005-08-12','HON`BLE CHIEF JUSTICE V.S. SIRPURKAR||HON`BLE JUSTICE GANGULY','Kolkata                       ','ARUN KUMAR ROY','ARUN KANTI CHATTAPADHYAY','THE WEST BENGAL POLLUTION BOARD & OTHERS','','2005-05-06','','','','','','','','','','','','','','','2021-01-05 15:31:14','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'15','20932W','Disposed','WP','WRIT PETITION','2004','2011-12-23','HON`BLE JUSTICE MAHARAJ SINHA','Paschim Medinipur             ','SRI. LAKSHMAN CHANDRA DAS','MR A.B MUKHERJEE','THE STATE OF WEST BENGAL & OTHERS','','2004-12-13','','','','','','','','CPAN/1404/2006','','','','','','','2021-01-05 15:24:33','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'19','26090W','Disposed','WP','WRIT PETITION','2012','2013-01-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','BASUDEV SENGUPTA','POOJA SHUKLA','KOLKATA MUNICIPAL CORPORATION & ORS','','2012-12-06','','','','','','','','','','','','','','','2021-01-05 15:30:58','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,25,'12','13296W','Disposed','WP','WRIT PETITION','2012','2012-08-01','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Kolkata                       ','NARES CHANDRA NANDA','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS.','','2012-06-26','','','','','','','','','','','','','','','2021-01-05 15:25:19','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'4','9848W','Disposed','WP','WRIT PETITION','2005','2005-07-19','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','North 24-Parganas             ','ATUL KRISHNA MONDAL & ANR','MANOJ MALHOTRA','THE STATE OF WEST BENGAL & ORS','','2005-05-06','','','','','','','','','','','','','','','2021-01-05 15:33:30','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'13','13298W','Disposed','WP','WRIT PETITION','2012','2012-08-01','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Purba Medinipur               ','AMALENDU BIKASH JANA','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS.','','2012-06-26','','','','','','','','','','','','','','','2021-01-05 15:27:01','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,20,'16','17872W','Disposed','WP','WRIT PETITION','2004','2005-04-13','HON`BLE JUSTICE MAHARAJ SINHA','Howrah                        ','SHIBA PRASAD CHATERJEE','BHASKAR NANDI','THE STATE OF WEST BENGAL & ORS','','2005-08-25','','','','','','','','','','','','','','','2021-01-05 15:28:18','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'5','9899W','Disposed','WP','WRIT PETITION','2005','2005-07-27','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','Hooghly                       ','KEYA MUKHERJEE','RAM CHANDRA DE','THE STATE OF WEST BENGAL & ORS','','2005-05-11','','','','','','','','','','','','','','','2021-01-05 15:35:54','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'14','13301W','Disposed','WP','WRIT PETITION','2012','2012-07-26','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Purulia                       ','KSHIROD GOPAL DAS','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS.','','2012-06-26','','','','','','','','','','','','','','','2021-01-05 15:28:23','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,24,'20','11102W','Disposed','WP','WRIT PETITION','2011','2012-12-17','HON`BLE CHIEF JUSTICE ARUN MISHRA','Uttar Dinajpur                ','SUKUMAR DASGUPTA AND OTHERS','MR KOUSHIK CHATERJEE','THE STATE OF WEST BENGAL & OTHERS','','2011-07-07','','','','','','','','','','','','','','','2021-01-05 15:35:09','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'6','9923W','Disposed','WP','WRIT PETITION','2005','2005-05-28','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Nadia                         ','BINA ROY (KHAN)','RAMKRISHNA BHATTACHARYYA','THE STATE OF WEST BENGAL & ORS','','2005-05-11','','','','','','','','','','','','','','','2021-01-05 15:37:33','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,20,'17','2712W','Disposed','WP','WRIT PETITION','2004','2004-03-04','HON`BLE JUSTICE MAHARAJ SINHA','Paschim Medinipur             ','SHRI ASHUTOSH MISHRA','TAPAN KUMAR CHAKRABORTY','STATE OF WEST BENGAL & ORS','','2004-02-18','','','','','','','','','','','','','','','2021-01-05 15:31:07','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,25,'15','13477W','Disposed','WP','WRIT PETITION','2012','2012-07-16','HON`BLE JUSTICE DEBASISH KAR GUPTA','North 24-Parganas             ','SMT. SHIKHA CHAKRABORTY AND OTHERS','NABAMITA SENGUPTA','THE STATE OF WEST BENGAL & OTHERS','','2012-06-27','','','','','','','','','','','','','','','2021-01-05 15:31:01','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'21','9027W','Disposed','WP','WRIT PETITION','2012','2013-01-30','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','SUDESWARI DEVI','MR ZAIAUL ISLAM','THE KOLKATA MUNICIPAL  CORPORATION AND OTHERS','','2012-04-30','','','','','','','','','','','','','','','2021-01-05 15:37:29','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'7','10466W','Disposed','WP','WRIT PETITION','2005','2005-06-28','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Dakshin Dinajpur              ','HANIFUDDIN MONDAL','MR ANIMESH BHATTACHARYA','STATE OF WEST BENGAL & ORS','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 15:39:39','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,20,'18','18320W','Disposed','WP','WRIT PETITION','2003','2004-07-27','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Kolkata                       ','RADHA RANI TEWARI','MR. SHAMBHUNATH DE','THE STATE OF WEST BENGAL & ORS','','2003-12-01','','','','','','','','','','','','','','','2021-01-05 15:33:32','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'22','27013W','Disposed','WP','WRIT PETITION','2012','2012-12-18','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','JYOTSNA HAIT','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS','','2012-12-13','','','','','','','','','','','','','','','2021-01-05 15:39:11','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'16','13503W','Disposed','WP','WRIT PETITION','2012','2012-07-30','HON`BLE JUSTICE DEBASISH KAR GUPTA','Kolkata                       ','M/S. SHUBHASREE & ORS.','SUDHIR KUMAR SADHUKHAN','CESC LIMITED & OTHERS','','2012-06-27','','','','','','','','','','','','','','','2021-01-05 15:33:26','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,24,'23','27960W','Disposed','WP','WRIT PETITION','2012','2013-02-06','HON`BLE JUSTICE PRASANJIT MANDAL','Coochbehar                    ','APURBA ROY','SABYASACHI CHATERJEE','THE STATE OF WEST BENGAL & ORS','','2012-12-20','','','','','','','','','','','','','','','2021-01-05 15:40:41','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'8','10516W','Disposed','WP','WRIT PETITION','2005','2005-09-06','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Purba Medinipur               ','SUKUMAR MONDAL','P C BHATTACHARYA','THE STATE OF WEST BENGAL & ORS','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 15:42:39','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'17','13519W','Disposed','WP','WRIT PETITION','2012','2012-08-16','HON`BLE JUSTICE DEBASISH KAR GUPTA','Purba Medinipur               ','BASANTI BALA KHILA.','ANUP DASGUPTA','THE STATE OF WEST BENGAL AND OTHERS','','2012-06-27','','','','','','','','','','','','','','','2021-01-05 15:35:23','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,20,'19','17288W','Disposed','WP','WRIT PETITION','2003','2004-06-08','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Murshidabad                   ','SRI DINABANDHU MANNA','SK OLI MAHAMMAD','THE CULCUTTA ELECTRIC SUYPPLY','','2003-09-29','','','','','','','','','','','','','','','2021-01-05 15:36:58','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'1','14465W','Disposed','WP','WRIT PETITION','2004','2004-10-11','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','North 24-Parganas             ','SANTANU CHATTERJEE AND OTHERS','MANASIJ DASGUPTA','STATE OF WEST BENGAL & OTHERS','','2004-08-26','','','','','','','','','','','','','','','2021-01-05 15:39:19','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'9','10080W','Disposed','WP','WRIT PETITION','2005','2005-08-05','HON`BLE JUSTICE SOUMITRA PAL','Murshidabad                   ','DHULIAN MUNICIPALITY & ANR','MD TALAY MASOOD SIDDIQUI','STATE OF WEST BENGAL & ORS','','2005-05-12','','','','','','','','','','','','','','','2021-01-05 15:45:41','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,25,'18','13675W','Disposed','WP','WRIT PETITION','2012','2012-08-02','HON`BLE JUSTICE PATHERYA','Birbhum                       ','NANDALAL HARA','YUDHAJIT GUHA','THE STATE OF WEST BENGAL & ORS.','','2012-06-28','','','','','','','','','','','','','','','2021-01-05 15:38:17','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'2','12179W','Disposed','WP','WRIT PETITION','2004','2012-04-11','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Burdwan                       ','MOLLAH AFTABUDDIN','ASIT BARAN GHOSH','THE STATE OF WEST BENGAL & ORS','','2004-07-22','','','','','','','','','','','','','','','2021-01-05 15:41:39','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'19','13681W','Disposed','WP','WRIT PETITION','2012','2012-08-02','HON`BLE JUSTICE PATHERYA','Malda                         ','DWIJA PADA GUPTA','YUDHAJIT GUHA','THE STATE OF WEST BENGAL & ORS.','','2012-06-28','','','','','','','','','','','','','','','2021-01-05 15:40:20','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,20,'20','9088W','Disposed','WP','WRIT PETITION','2003','2012-06-28','HON`BLE JUSTICE DEBASISH KAR GUPTA','Howrah                        ','SRI DILIP DEBNATH AND  OTHERS','INDRANIL BHATTACHARYYA','THE SPECIAL LAND ACQUISITION OFFICER','','2003-06-19','','','','','','','','','','','','','','','2021-01-05 15:41:52','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,24,'24','23640W','Disposed','WP','WRIT PETITION','2012','2013-01-16','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Murshidabad                   ','SRIKANTA CHATERJEE','MR PARTHA PRATIM ROY','BERHAMPORE MUNICIPALITY & ORS','','2012-10-16','','','','','','','','','','','','','','','2021-01-05 15:47:33','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'10','10127W','Disposed','WP','WRIT PETITION','2005','2005-09-30','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Murshidabad                   ','MIRZA MAHIBUDDIN','MS GOPA BARUA','STATE OF WEST BENGAL & ORS','','2005-05-12','','','','','','CAN/10127W/2005','','','','','','','','','2021-01-05 15:49:11','tina roy','2021-01-05 15:59:34','tina roy','N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,27,'3','1262W','Disposed','WP','WRIT PETITION','2004','2012-08-02','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Nadia                         ','SUJIT KUMAR DAS','PRIYABRATA BATABYAL','THE DIRECTOR OF SCHOOL EDUCATION, WEST BENGAL AND OTHERS','','2004-01-22','','','','','','','','','','','','','','','2021-01-05 15:43:49','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'20','13686W','Disposed','WP','WRIT PETITION','2012','2012-07-03','HON`BLE JUSTICE SOUMITRA PAL','Howrah                        ','TAPAS ROY & ANOTHER.','MR. BAJRANG MANOT','HOWRAH MUNICIPAL CORPORATION & ORS.','','2012-06-28','','','','','','','','','','','','','','','2021-01-05 15:42:54','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'11','10228W','Disposed','WP','WRIT PETITION','2005','2005-08-18','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Hooghly                       ','S M ENTERPRISE MILAN GHOSE','DIPANKAR PAL','STATE OF WEST BENGAL & ORS','','2005-05-13','','','','','','','','','','','','','','','2021-01-05 15:51:21','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,27,'4','2705W','Disposed','WP','WRIT PETITION','2004','2012-08-01','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','SMT. RINA BISWAS','','THE STATE OF WEST BENGAL & OTHERS','','','','','','','','','','','','','','','','','2021-01-05 15:46:46','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'21','22246W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE BISWANATH SOMADDER','Paschim Medinipur             ','SADHAN CHANDRA HANRA','MR. SEKHAR MUSTAPHI','STATE OF WEST BENGAL & ORS.','','2012-10-01','','','','','','','','','','','','','','','2021-01-05 15:45:03','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'22','17677W','Disposed','WP','WRIT PETITION','2012','2012-08-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','North 24-Parganas             ','SRI RABINDRA CHANDRA DAS','MS. SUSMITA DEY (BASU)','THE STATE OF WEST BENGAL & ORS.','','2012-08-06','','','','','','','','','','','','','','','2021-01-05 15:46:54','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,26,'12','10234W','Disposed','WP','WRIT PETITION','2005','2005-07-21','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Birbhum                       ','SRI NARAYAN PRASAD GINODIA','MR RAKESH SINGH','THE WEST BENGAL ELECTRICITY BOARD & ORS','','2005-05-13','','','','','','','','','','','','','','','2021-01-05 15:54:39','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'5','12451W','Disposed','WP','WRIT PETITION','2004','2004-10-15','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Kolkata                       ','MD. YOKUB BEIG & ANOTHER','MR. DILIP KUMAR MUKHERJEE','KOLKATA MUNICIPAL CORPORATIUON & ORS','','2004-07-28','','','','','','','','','','','','','','','2021-01-05 15:49:22','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'6','2809W','Disposed','WP','WRIT PETITION','2005','2012-03-07','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Purulia                       ','SRI DAYAMOY MAHATO & ORS','TARAPADA DAS','THE STATE OF WEST BENGAL & ORS','','2005-02-10','','','','','','','','','','','','','','','2021-01-05 15:51:07','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,26,'13','10241W','Disposed','WP','WRIT PETITION','2005','2005-08-31','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Murshidabad                   ','UDAY KUNDU & OTHERS','SUMIT KUMAR BASU','RANINAGAR I PANCHAYAT SAMITY & ORS','','2005-05-13','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 15:57:29','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,25,'23','17444W','Disposed','WP','WRIT PETITION','2012','2012-08-07','HON`BLE JUSTICE DEBASISH KAR GUPTA','Murshidabad                   ','SADHAN DAS.','MRS. SUJATA GHOSH','THE CHAIRMAN & MANAGIND DIRECTOR, WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LTD. & ORS.','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 15:50:06','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'7','3787W','Disposed','WP','WRIT PETITION','2005','2005-03-22','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA','Hooghly                       ','AMALENGU GHOSH','MR. AMIT PROKASH LAHIRI','STATE OF W.B. & ORS','','2005-02-23','','','','','','','','','','','','','','','2021-01-05 15:52:44','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,25,'24','17402W','Disposed','WP','WRIT PETITION','2012','2012-08-13','HON`BLE JUSTICE DIPANKAR DATTA','North 24-Parganas             ','SMT. DURGA DEBNATH','MR. JAYANTA KUMAR BHAUMIK','THE STATE OF WEST BENGAL & ORS.','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 15:53:15','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'1','6568W','Disposed','WP','WRIT PETITION','2005','2005-07-18','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','South 24-Parganas             ','DILIP SARKAR AND ORS','MR. KAMAL KANTA KAR','THE STATE OF WEST BENGAL & ORS','','2005-03-29','','','','','','','','','','','','','','','2021-01-05 15:54:37','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'8','14866W','Disposed','WP','WRIT PETITION','2005','2012-02-22','HON`BLE JUSTICE INDIRA BANERJEE','South 24-Parganas             ','SMT. DIPALI DAS','MISS. BULBUL YEASMIN','STATE OF WEST BENGAL & ORS','','2005-08-01','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 15:57:00','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,25,'25','17580W','Disposed','WP','WRIT PETITION','2012','2012-08-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Howrah                        ','SRI GOPAL CHANDRA SARKAR','MS. SUSMITA DEY (BASU)','THE STATE OF WEST BENGAL & ORS.','','2012-08-03','','','','','','','','','','','','','','','2021-01-05 15:55:12','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'2','6639W','Disposed','WP','WRIT PETITION','2005','2005-06-09','HON`BLE JUSTICE SOUMITRA PAL','Kolkata                       ','SUBIR KUMAR DEY','MR. TAPAS KUMAR ADHIKARI','THE MUNICIPAL CORPORATION & OTHERS','','2005-03-29','','','','','','','','','','','','','','','2021-01-05 15:57:36','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'14','10002W','Disposed','WP','WRIT PETITION','2005','2005-07-15','HON`BLE JUSTICE MAHARAJ SINHA','Birbhum                       ','SANTOSH KUMAR PAL','DILIP KUMAR SAMANTA','STATE OF WEST BENGAL & ORS','','2005-03-30','','','','','','System.Collections.Generic.List`1[System.String]','','','','AST','322','2005','','\r\n','2021-01-05 16:06:10','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,28,'3','6716W','Disposed','WP','WRIT PETITION','2005','2005-07-11','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Burdwan                       ','RANAJIT KUMAR SAMANTA','RITA PATRA','THE SECRETARY,WBSEB & ORS','','2005-03-30','','','','','','','','','','','','','','','2021-01-05 15:59:49','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'9','12522W','Disposed','WP','WRIT PETITION','2005','2005-08-29','HON`BLE JUSTICE ARUN KUMAR MITRA','Purba Medinipur               ','SRI KANAI LAL MANDAL','KINKAR KUMAR BHATTACHARYA','THE STATE OF WEST BENGAL & ORS','','2005-06-24','','','','','','','','','','','','','','','2021-01-05 16:01:17','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'15','10524W','Disposed','WP','WRIT PETITION','2005','2005-08-05','HON`BLE JUSTICE SOUMITRA PAL','Hooghly                       ','SUDIP DAS','MR SUDIP DAS','CHANDERNAGORE MUNICIPAL CORPORATION & ORS','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 16:08:39','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'1','20831W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','JHARNA MONDAL','MR PALLAV CHATERJEE','STATE OF WEST BENGAL & ORS','','2012-09-13','','','','','','','','','','','','','','','2021-01-05 16:07:49','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'4','6723W','Disposed','WP','WRIT PETITION','2005','2005-09-26','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','South 24-Parganas             ','SRI SANJIB BANIK','MRS. MIRU HAZRA','THE STATE OF WEST BENGAL & OTHERS','','2005-03-30','','','','','','','','','','','','','','','2021-01-05 16:02:42','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'16','16539W','Disposed','WP','WRIT PETITION','2005','2005-08-25','HON`BLE JUSTICE SOUMITRA PAL','North 24-Parganas             ','PRESIDENCY RUBBER MILLS LTD & ANR','Y K KHANNA','EMPLOYEES PROVIDENT FUND ORGANISATION & ORS','','2005-08-22','','','','','','','','','','','','','','','2021-01-05 16:11:14','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'2','20786W','Disposed','WP','WRIT PETITION','2012','2012-10-10','HON`BLE JUSTICE BISWANATH SOMADDER','Paschim Medinipur             ','UMA SANKAR SEN','MR MAHANANDA ROY','STATE OF WEST BENGAL & OTHERS','','2012-09-13','','','','','','','','','','','','','','','2021-01-05 16:09:40','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'10','9549W','Disposed','WP','WRIT PETITION','2004','2010-06-09','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','South 24-Parganas             ','SMT. NILANJANA ROY','MR. SIRSHENDU ROY CHAUDHURI','THE KOLKATA MUNICIPAL CORPORATION & ORS','','2004-06-15','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 16:05:58','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'5','6739W','Disposed','WP','WRIT PETITION','2005','2005-07-11','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Kolkata                       ','SMT. HASI ROY','MR. SUPRIYO KUMAR ROY','THE UNION OF INDIA & ORS','','2005-03-30','','','','','','','','','','','','','','','2021-01-05 16:04:43','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'3','20260W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Purba Medinipur               ','SRI JHANTU CHANDRA BERA','SURANJAN MODAL','THE STATE OF WEST BENGAL & OTHERS','','2012-09-07','','','','','','','','','','','','','','','2021-01-05 16:11:04','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'17','10594W','Disposed','WP','WRIT PETITION','2005','2005-09-26','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Dakshin Dinajpur              ','MAMLUKA BIBI','TAPAS MAITY','THE STATE OF WEST BENGAL & ORS','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 16:12:50','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'11','16556W','Disposed','WP','WRIT PETITION','2004','2012-07-20','HON`BLE JUSTICE JOYMALYA BAGCHI','Burdwan                       ','BISWADEEP ROY CHOWDHURY','MRS. SUBRATO RAY','INDIAL OIL CORPORATION LIMITED & ORS','','2004-09-27','','','','','','','','','','','','','','','2021-01-05 16:07:55','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,28,'6','6809W','Disposed','WP','WRIT PETITION','2005','2005-07-20','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','Howrah                        ','VIIRENDRA KUMAR SHUKLA','UDDIPAN BANERJEE','C.E.S.C LIMITED & OTHERS','','2005-03-31','','','','','','','','','','','','','','','2021-01-05 16:06:39','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'4','20828W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','CHANDAN SINGH','MR PALLAV CHATTERJEE','STATE OF WEST BENGAL & ORS','','2012-09-13','','','','','','','','','','','','','','','2021-01-05 16:12:34','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'18','10616W','Disposed','WP','WRIT PETITION','2005','2005-09-06','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Purba Medinipur               ','DILIP KUMAR MANNA','MR P C BHATTACHARYA','THE STATE OF WEST BENGAL & ORS','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 16:14:25','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,27,'12','9092W','Disposed','WP','WRIT PETITION','2004','2012-07-03','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','North 24-Parganas             ','SRI MONORANJAN MONDAL','MR. NARAYAN CH. MANDAL','STATE OF WEST BENGAL & OTHERS','','2004-06-07','','','','','','','','','','','','','','','2021-01-05 16:09:37','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'5','20891W','Disposed','WP','WRIT PETITION','2012','2012-10-08','HON`BLE JUSTICE PATHERYA','Kolkata                       ','ARTI NASKAR','DEBESH HALDER','W N S E D C L & ORS','','2012-09-14','','','','','','','','','','','','','','','2021-01-05 16:14:05','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'7','3896W','Disposed','WP','WRIT PETITION','2005','2005-08-10','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','South 24-Parganas             ','RANAGHATA BMORAL MISSION||MD.MAHIUDDIN LASKAR','AMAR NATH SEN','THE STATE OF WEST BENGAL & ORS','','2005-02-24','','','','','','','','','','','','','','','2021-01-05 16:08:42','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,26,'19','10629W','Disposed','WP','WRIT PETITION','2005','2005-08-22','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA','Malda                         ','MD MUSTAQUE ALI & ORS','RAFIQUL ISLAM','THE STATE OF WEST BENGAL & ORS','','2005-05-18','','','','','','','','','','','','','','','2021-01-05 16:16:12','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'6','20428W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','LACHMAN SHAW','MR PALLAV CHATTERJEE','STATE OF WEST BENGAL & ORS','','2012-09-10','','','','','','','','','','','','','','','2021-01-05 16:15:37','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'13','15871W','Disposed','WP','WRIT PETITION','2004','2012-06-04','HON`BLE JUSTICE JOYMALYA BAGCHI','Burdwan                       ','SRI PRABIR KUMAR BANERJEE','MR. SANDIPAN BANERJEE','THE INDIAN OIL CORPORATION LIMITED & ORS','','2004-09-17','','','','','','','','','','','','','','','2021-01-05 16:11:38','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,26,'20','10732W','Disposed','WP','WRIT PETITION','2005','2005-08-19','HON`BLE CHIEF JUSTICE V.S. SIRPURKAR||HON`BLE JUSTICE GANGULY','Purba Medinipur               ','SRI AMARENDRA NATH DAS & ORS','MR HABIBUR RAHMAN','THE STATE OF WEST BENGAL & ORS','','2005-05-18','','','','','','','','','','','','','','','2021-01-05 16:18:13','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'7','20844W','Disposed','WP','WRIT PETITION','2012','2012-09-26','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Hooghly                       ','SUMAN CHATTERJEE','MRINMOY MAJUMDER','THE STATE OF WEST BENGAL & OTH','','2012-09-13','','','','','','','','','','','','','','','2021-01-05 16:17:13','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'8','3972W','Disposed','WP','WRIT PETITION','2005','2005-09-13','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','Murshidabad                   ','INDRANIL BHATTACHARYYA','MR. TARIT KUMAR BHATTACHARYYA','THE STATE OF WEST BENGAL & ORS','','2005-02-24','','','','','','','','','','','','','','','2021-01-05 16:11:34','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,27,'14','21793W','Disposed','WP','WRIT PETITION','2004','2012-08-13','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Dakshin Dinajpur              ','GURUDAYAL HALDEDR','KAUSIK CHANDA','THE STATE OF WEST BENGAL & OTHERS','','2004-12-23','','','','','','','','','','','','','','','2021-01-05 16:13:33','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'8','20215W','Disposed','WP','WRIT PETITION','2012','2012-10-10','HON`BLE JUSTICE ANIRUDDHA BOSE','Bankura                       ','SUKANTA CHOWDHURY','MALAY BHATTACHARYA','UNION OF INDIA','','2012-09-06','','','','','','','','','','','','','','','2021-01-05 16:19:02','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'21','10844W','Disposed','WP','WRIT PETITION','2005','2005-08-25','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','Howrah                        ','BASU DEV DHALI','MR ANADI BANERJEE','ALLAHABAD BANK THROUGH ITS CHAIRMAN & MANAGING DIRECTOR & ORS','','2005-05-19','','','','','','','','','','','','','','','2021-01-05 16:20:58','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,28,'9','4096W','Disposed','WP','WRIT PETITION','2005','2005-03-28','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA','Burdwan                       ','JYOTASANA BEGUM & ANR','SK. GOLAM GOUS','WEST BENGAL STATE ELECTRICITY BOARD & ORS','','2005-02-25','','','','','','','','','','','','','','','2021-01-05 16:14:03','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'9','20108W','Disposed','WP','WRIT PETITION','2012','2012-10-09','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Nadia                         ','GOUKUL CHANDRA BISWAS','MR PINGAL BHATTACHARYA','THE STATE OF WEST BENGAL & ORS','','2012-09-05','','','','','','','','','','','','','','','2021-01-05 16:20:28','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'15','3128W','Disposed','WP','WRIT PETITION','2004','2010-12-24','HON`BLE JUSTICE MAHARAJ SINHA','Malda                         ','ABANI MONDAL & ORS','MR. SUKUMAR SARKAR','THE STATE OF WEST BENGAL & ORS','','2004-02-25','','','','','','','','CPAN/311/2012','','','','','','','2021-01-05 16:16:19','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,26,'22','10338W','Disposed','WP','WRIT PETITION','2005','2005-09-26','HON`BLE JUSTICE PRATAP KUMAR RAY','Howrah                        ','SRI SWAPAN GHOSH','BHASKAR NANDI','THE COATE WEST BENGAL & ORS','','2005-05-16','','','','','','','','','','','','','','','2021-01-05 16:23:15','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'10','20723W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE PATHERYA','Paschim Medinipur             ','SMT BABITA MAITY','JAYANTA DEY','THE STATE OF WEST BENGAL & ORS','','2011-09-12','','','','','','','','','','','','','','','2021-01-05 16:21:59','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'10','4180W','Disposed','WP','WRIT PETITION','2005','2005-11-24','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Birbhum                       ','SK. ABUL KASEM','MR. GORA CHAND SAMANTA','WEST BENGAL STATE ELECTRICITY BOARD AND OTHERS','','2005-02-28','','','','','','','','','','','','','','','2021-01-05 16:16:40','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,27,'16','16463W','Disposed','WP','WRIT PETITION','2004','2011-09-16','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','South 24-Parganas             ','SRI ANIL KRISHNA PAL','DEBANSU BISWAS','THE STATE OF WEST BENGAL & ORS','','2004-09-24','','','','','','','','','','','','','','','2021-01-05 16:18:04','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'11','20346W','Disposed','WP','WRIT PETITION','2012','2012-10-10','HON`BLE JUSTICE PATHERYA','South 24-Parganas             ','DEBIKA BANIK','MR BIDYUT KUMAR HALDER','CESC LTD & ORS','','2012-09-07','','','','','','','','','','','','','','','2021-01-05 16:23:36','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,26,'23','10456W','Disposed','WP','WRIT PETITION','2005','2005-06-28','HON`BLE JUSTICE ASHIM KUMAR BANERJEE','Howrah                        ','NITU PRADHAN','DWIJADAS PATTANAYAK','THE STATE OF WEST BENGAL & ORS','','2005-05-17','','','','','','','','','','','','','','','2021-01-05 16:25:20','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'12','20213W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','','SANDIPAN PAL','THE STATE OF WEST BENGAL & ORS','','2012-09-06','','','','','','','','','','','','','','','2021-01-05 16:24:57','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,31,'1','10240W','Disposed','WP','WRIT PETITION','2000','2012-08-02','HON`BLE JUSTICE DIPANKAR DATTA','Murshidabad                   ','SRI SUBHAS MONDAL','MRS. BAISALI GHOSHAL','THE STATE OF WEST BENGAL & ORS.','','2000-07-04','','','','','','','','','','','','','','','2021-01-05 16:19:27','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'11','4273W','Disposed','WP','WRIT PETITION','2005','2005-09-28','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Howrah                        ','RAGHUNATH MONDAL','MR.NILANJAN BHATTACJHARJEE','THE STATE OF WEST BENGAL & OTHERS','','2005-03-01','','','','','','','','','','','','','','','2021-01-05 16:19:57','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,27,'17','391','Disposed','WP.ST','WRIT PETITION','2004','2007-07-05','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA||HON`BLE JUSTICE RUDRENTRA NATH BANERJEE','Bankura                       ','SHYAMA PADA CHAND & ORS','MR. SAMIRAN MANDAL','STATE OF WEST BENGAL & ORS','','2004-05-21','','','','','','','','CPAN/1587/2009','','','','','','','2021-01-05 16:22:18','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'13','23136W','Disposed','WP','WRIT PETITION','2012','2012-10-19','HON`BLE JUSTICE PATHERYA','Malda                         ','ABDUL JALIL','MR JAHANGIR ALAM','WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LTD & ORS','','2012-10-10','','','','','','','','','','','','','','','2021-01-05 16:26:49','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'14','23149W','Disposed','WP','WRIT PETITION','2012','2012-10-19','HON`BLE JUSTICE PATHERYA','Malda                         ','ABDUS SALAM','MR JAHANGIR ALAM','WEST BENGAL STATE ELCTRICITY DISTRIBUTION COMPANY LTD & ORS','','2012-10-10','','','','','','','','','','','','','','','2021-01-05 16:28:39','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,28,'12','4422W','Disposed','WP','WRIT PETITION','2005','2005-08-22','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','Howrah                        ','SHAMBHU SINGHA','UDDIPAN BANERJEE','C.E.S.C LIMITED & OTHERS','','2003-03-02','','','','','','','','','','','','','','','2021-01-05 16:23:27','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'18','16325W','Disposed','WP','WRIT PETITION','2004','2009-12-18','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Jalpaiguri                    ','DSRI DURGA DUTTA MUNDRA & ORS','MR. SUBHASIS SARKAR','THE STATE OF WEST BENGAL & ORS','','2004-09-22','','','','','','','','','','','','','','','2021-01-05 16:25:43','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,31,'2','3800W','Disposed','WP','WRIT PETITION','2000','2012-06-08','HON`BLE JUSTICE JOYMALYA BAGCHI','North 24-Parganas             ','RAMEN CHANDRA GHOSH','MR. UJJAL KUMAR SARKAR','THE GOVERMENT W.B. AND ANR. ORS.','','2000-03-22','','','','','','','','','','','','','','','2021-01-05 16:24:23','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,30,'1','17459W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Purba Medinipur               ','SARAT CHANDRA PRADHAN','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 16:32:19','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'15','23719W','Disposed','WP','WRIT PETITION','2012','2012-10-19','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','FAKIR MOHAMMAD','MR ABDUL ALIM','THE W B S E D CO LTD','','2012-10-16','','','','','','','','','','','','','','','2021-01-05 16:30:46','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'13','4440W','Disposed','WP','WRIT PETITION','2005','2005-09-13','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','Purba Medinipur               ','SINIL BISAI','MR. SUPRAKASH MISRA','THE CHAIRMAN WEST BENGAL STATE ELECTRICITY BOARD & ORS','','2005-03-02','','','','','','','','','','','','','','','2021-01-05 16:26:10','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'16','23144W','Disposed','WP','WRIT PETITION','2012','2012-10-19','HON`BLE JUSTICE PATHERYA','Malda                         ','SANKAR KISKU','MR JAHANGIR ALAM','WEST BENGAL STATE ELECTRICITY DISTRIBUTION LTD & ORS','','2012-10-10','','','','','','','','','','','','','','','2021-01-05 16:32:07','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,30,'2','17386W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Purba Medinipur               ','MANJURANI MAITI','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 16:33:50','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'19','57','Disposed','WP.ST','WRIT PETITION','2004','2012-04-05','HON`BLE JUSTICE NISHITA MHATRE','Kolkata                       ','SRI KURARAM SARKAR','MR. FAZLE RABI','THE STATE OF WEST BENGAL & ORS','','2004-01-29','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 16:28:47','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,30,'3','17516W','Disposed','WP','WRIT PETITION','2012','2012-11-30','HON`BLE JUSTICE SOUMITRA PAL','Darjeeling                    ','DIL BAHADUR SARKI','MISS MAMATA DUTTA','THE STATE OF WEST BENGAL & ORS','','2012-08-03','','','','','','','','','','','','','','','2021-01-05 16:35:19','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'17','20722W','Disposed','WP','WRIT PETITION','2012','2012-10-05','HON`BLE JUSTICE PATHERYA','Purba Medinipur               ','SRI SUDARSHAN SANTRA','MR SUBHASH CHANDRA SAHA','WEST BENGAL STATE ELECTRICITY & ORS','','2012-09-12','','','','','','','','','','','','','','','2021-01-05 16:33:47','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'14','4459W','Disposed','WP','WRIT PETITION','2005','2005-09-30','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Murshidabad                   ','SAHAR BANU','PARTHA SARATHI GHOSH','THE STATE OF WEST BENGAL & ORS','','2005-03-02','','','','','','','','','','','','','','','2021-01-05 16:28:25','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'18','20826W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','SYED MUZAFFAR HOSSAIN','PALLAV CHATERJEE','STATE OF WEST BENGAL & ORS','','2012-09-13','','','','','','','','','','','','','','','2021-01-05 16:35:24','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,30,'4','17475W','Disposed','WP','WRIT PETITION','2012','2012-11-20','HON`BLE JUSTICE SOUMITRA PAL','Purulia                       ','BISHNU PADA GARAI','KASHISWAR GHOSAL','THE STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 16:37:32','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'20','780','Disposed','WP.ST','WRIT PETITION','2004','2012-04-02','HON`BLE JUSTICE NISHITA MHATRE','Bankura                       ','PRANBALLAV SUBUDDHI','MR. KALYAN KUMAR PANDA','STATE OF WEST BENGAL & ORS','','2004-10-14','','','','','','','','','','','','','','','2021-01-05 16:32:03','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,28,'15','4469W','Disposed','WP','WRIT PETITION','2005','2005-04-01','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA','Purba Medinipur               ','PURNA BHUNIA','NANDALAL BANERJEE','THE WEST BENGAL STATE ELECTRICITY BOARD & ORS','','2005-03-02','','','','','','','','','','','','','','','2021-01-05 16:31:20','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'19','20832W','Disposed','WP','WRIT PETITION','2012','2012-10-17','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','PURNIMA MONDAL','MR PALLAV CHATERJEE','STATE OF WEST BENGAL & ORS','','2012-09-13','','','','','','','','','','','','','','','2021-01-05 16:37:14','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,30,'5','17452W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Purba Medinipur               ','ALAKANANDA MAITI','SOURAV MITRA','THE STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 16:39:01','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,27,'21','18392W','Disposed','WP','WRIT PETITION','2004','2012-05-15','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Birbhum                       ','MANGAL MAL','SUNANDA MOHAN GHOSH','UNION OF INDIA & ORS','','2004-10-15','','','','','','','','','','','','','','','2021-01-05 16:34:10','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'20','23138W','Disposed','WP','WRIT PETITION','2012','2012-10-19','HON`BLE JUSTICE PATHERYA','Malda                         ','ABDUS SAMAD','MR JAHANGIR ALAM','WEST BENGAL STATE ELECTRICITY DISTRIBUTION COMPANY LTS & ORS','','2012-10-10','','','','','','','','','','','','','','','2021-01-05 16:39:14','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'21','23146W','Disposed','WP','WRIT PETITION','2012','2012-10-19','HON`BLE JUSTICE PATHERYA','Malda                         ','ABU SAMAD','MR JAHANGIR ALAM','WEST BENGAL STATE VELECTRICITY DISTRIBUTION COMPANY LTD & ORS','','2012-10-10','','','','','','','','','','','','','','','2021-01-05 16:41:04','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,28,'16','4649W','Disposed','WP','WRIT PETITION','2005','2005-04-05','HON`BLE JUSTICE PRANAB KUMAR CHATTOPADHYAYA','Burdwan                       ','SISIR MONDAL','RITA PATRA','THE SECRETARY, WBSEB & ORS','','2005-03-03','','','','','','','','','','','','','','','2021-01-05 16:35:40','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,31,'3','9428W','Disposed','WP','WRIT PETITION','2000','2000-08-28','HON`BLE ADDITIONAL CHIEF JUSTICE ASOK KUMAR GANGULY','Nadia                         ','SMT. ANJALI DAS||BISHNU CHANDRA DAS','DEBASISH CHATTOPADHYAY','THE STATE OF WEST BENGAL,||THE SECRETARY, URBAN DEVELOPMENT DEPARTMENT, GOVT. OF WEST BENGAL,||THE ESTATE MANAGER & ASSISTANT SECRETARY, GOVT. OF WEST BENGAL, URBAN DEVELOPMENT DEPARTMENT,||THE SUB REGISTRAR KALYANI, NADIA','','2000-06-26','','','','','','','','','','','','','','','2021-01-05 16:35:28','hasan gazi','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'22','23151W','Disposed','WP','WRIT PETITION','2012','2012-10-19','HON`BLE JUSTICE PATHERYA','Malda                         ','GAGAN BASKI','MR JAHANGIR ALAM','WEST BENGAL STATE WEST BENGAL DISTRIBUTUON LTD & ORS','','2012-10-10','','','','','','','','','','','','','','','2021-01-05 16:42:47','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,28,'17','4657W','Disposed','WP','WRIT PETITION','2005','2005-09-30','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Howrah                        ','ALOK MUKHERJEE','MANDLAL SINGHANIA','THE CHAIRMAN, WEST BENGAL STATE ELECTRICITY BOARD & ORS','','2005-03-03','','','','','','','','','','','','','','','2021-01-05 16:38:20','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'23','23443W','Disposed','WP','WRIT PETITION','2012','2012-10-18','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Burdwan                       ','KALYANI PAL','SHRI BAIDURYA GHOSAL','STATE OF WEST BENGAL & ORS','','2012-10-12','','','','','','','','','','','','','','','2021-01-05 16:44:58','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'18','4669W','Disposed','WP','WRIT PETITION','2005','2005-11-07','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Malda                         ','LILA DAS','ZAMIUL ALAM','THE STATE OF WEST BENGAL & ORS','','2005-03-03','','','','','','','','','','','','','','','2021-01-05 16:40:13','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,27,'22','13485W','Disposed','WP','WRIT PETITION','2004','2012-04-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Purba Medinipur               ','NIMAI CHAND SHIT','BHASKAR CHANDRA MANNA','THE STATE OF WEST BENGAL & ORS','','2004-08-13','','','','','','System.Collections.Generic.List`1[System.String]','','','','','','','','','2021-01-05 16:41:47','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,30,'6','17898W','Disposed','WP','WRIT PETITION','2012','2012-12-05','HON`BLE JUSTICE HARISH TANDON','Nadia                         ','AJANTA BISWAS','SUJIT KUMAR LAIK','STATE OF WEST BENGAL & ORS','','2012-08-08','','','','','','','','','','','','','','','2021-01-05 16:47:52','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'24','23134W','Disposed','WP','WRIT PETITION','2012','2012-10-19','HON`BLE JUSTICE PATHERYA','Malda                         ','HASIBUR RAHAMAN','MR JAHANGIR ALAM','WEST BENGAL STATE ELECTRICITY LTD & ORS','','2012-10-10','','','','','','','','','','','','','','','2021-01-05 16:46:31','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,27,'23','2357W','Disposed','WP','WRIT PETITION','2004','2012-04-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Howrah                        ','SRI SWAPAN KUMAR HAIT','ISHITA CHAKRABORTY','WEST BENGAL BOARD OF SECONDARY EDUCATION & ORS','','2004-02-12','','','','','','','','','','','','','','','2021-01-05 16:43:58','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,30,'7','17320W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Purba Medinipur               ','DHANANJOY BHAUMIK','MRS SABITA KHUTIA (BHUNYA)','STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 16:50:00','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'25','21267W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','ADITYA MANDI','MR MANAS DAS','THE STATE OF WEST BENGAL & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 16:48:32','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,28,'19','4705W','Disposed','WP','WRIT PETITION','2005','2005-07-21','HON`BLE JUSTICE ARUN KUMAR MITRA','Paschim Medinipur             ','SMT. IRA ROY CHOWDHURY','MR. NANDALAL NAYAK','THE STATE OF WEST BENGAL & ORS','','2005-03-04','','','','','','','','','','','','','','','2021-01-05 16:42:55','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,30,'8','17368W','Disposed','WP','WRIT PETITION','2012','2012-10-11','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','Birbhum                       ','CHHABI MONDAL','KESHAB KRISHNA PAUL','STATE OF WEST BENGAL & ORS','','2012-08-07','','','','','','','','','','','','','','','2021-01-05 16:51:10','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,31,'4','11960W','Disposed','WP','WRIT PETITION','2000','2012-02-16','HON`BLE JUSTICE SHUKLA KABIR (SINHA)','North 24-Parganas             ','ADITYA GOLDER||ARABINDO GOLDER||PULIN GOLDER||HAZRA GOLDER||NILMANI GOLDER','KAMALESH BHATTACHARYA','EXECUTIVE ENGINEER, CALCUTA DRINAGE OUTFULL DIVION, JALASAMPAD BHABAN||SECRETARY, IRRIGATION AND WATERWAYS DEPARMENT, GOVERNMENT OF WEST BENGAL,||DISTRICT MAGISTRATE,||SUPERINTENDENT OF POLICE,||OFFICER IN CHARGE,','','2000-07-20','','','','','','','','','','','','','','','2021-01-05 16:43:35','hasan gazi','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'26','21274W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','SANJIB BERA','MR MANAS DAS','THE STATE OF WEST BENGAL & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 16:49:43','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'27','21263W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','SUNIT SINHA','MR MANAS DAS','THE STATE OF WEST BENGAL & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 16:51:44','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'20','5059W','Disposed','WP','WRIT PETITION','2005','2005-10-06','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','Kolkata                       ','MS. SANGEETA DAS','GAZIFARUQUE HOSSAIN','UNION OF INDIA & ORS','','2005-03-09','','','','','','','','','','','','','','','2021-01-05 16:46:07','sayan swarnakar','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'28','21271W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE ANIRUDDHA BOSE','Purba Medinipur               ','SRI DIBYENDU SAHU','MR MANAS DAS','THE STATE OF WEST BENGAL & ORS','','2012-09-19','','','','','','','','','','','','','','','2021-01-05 16:53:18','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,30,'9','17660W','Disposed','WP','WRIT PETITION','2012','2012-10-18','HON`BLE JUSTICE DEBASISH KAR GUPTA','Howrah                        ','PREM KRISHNA JAISWAL','BIDYUT KUMAR HALDER','CESC LIMITED & ORS','','2012-08-06','','','','','','','','','','','','','','','2021-01-05 16:55:28','tina roy','0000-00-00 00:00:00',NULL,'N'),
 (1,30,'10','17775W','Disposed','WP','WRIT PETITION','2012','2012-12-10','HON`BLE JUSTICE HARISH TANDON','Kolkata                       ','SHIV DAYAL SINGH','TANUJA BASAK','STATE OF WEST BENGAL & ORS','','2012-08-07','','','','','','','','','','','','','','','2021-01-05 16:56:42','tina roy','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'29','21093W','Disposed','WP','WRIT PETITION','2012','2012-10-10','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Dakshin Dinajpur              ','RASHMI METALIKS LIMITED & ANR','MR TANMOY ROY','BALURGHAT MUNICIPALITY & ORS','','2012-09-17','','','','','','','','','','','','','','','2021-01-05 16:55:36','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,28,'21','5384W','Disposed','WP','WRIT PETITION','2005','2005-08-24','HON`BLE JUSTICE KALYAN JYOTI SENGUPTA','Burdwan                       ','SHIB SANKAR PAL & OTHERS','MRS.APARNA BANERJEDE','THE  WEST BENGAL  STATE ELECTRICITY BOARD AND OTHERS','','2005-03-11','','','','','','','','','','','','','','','2021-01-05 16:50:02','sayan swarnakar','0000-00-00 00:00:00',NULL,'N'),
 (1,27,'24','1708W','Disposed','WP','WRIT PETITION','2004','2012-08-01','HON`BLE JUSTICE ASHOKE KUMAR DASADHIKARI','North 24-Parganas             ','AMIT NAG & OTHERS','SISIR KUMAR BHOWMICK','THE STATE OF WEST BENGAL & OTHERS','','2004-02-04','','','','','','','','','WP/15806/2004','','','','','','2021-01-05 16:53:06','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'30','21840W','Disposed','WP','WRIT PETITION','2012','2012-10-16','HON`BLE JUSTICE PATHERYA','Murshidabad                   ','MD SAIMUDDIN SK','MR PARTHA PRATIM ROY','W B S C E D CO LTD & ORS','','2012-09-26','','','','','','','','','','','','','','','2021-01-05 16:57:54','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,29,'31','21616W','Disposed','WP','WRIT PETITION','2012','2012-10-12','HON`BLE JUSTICE PATHERYA','Howrah                        ','SMT MADHU PATHAK','MR SUBRATA KR ROY KARMAKAR','CESC LIMITED AND OTHERS','','2012-09-25','','','','','','','','','','','','','','','2021-01-05 16:59:56','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'1','17138W','Disposed','WP','WRIT PETITION','2012','2012-08-08','HON`BLE JUSTICE DEBASISH KAR GUPTA','Birbhum                       ','PRABIR SAHA','JAHINGIR HOSSAIN','W.B.S.E.D.C.L & ORS','','2012-08-01','','','','','','','','','','','','','','','2021-01-05 16:56:50','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,29,'32','21006W','Disposed','WP','WRIT PETITION','2012','2012-10-08','HON`BLE JUSTICE PATHERYA','Howrah                        ','SARAJIT KARMAKAR','PIYALI SHOW','CESC LTD & ORS','','2012-09-14','','','','','','','','','','','','','','','2021-01-05 17:01:39','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'2','17328W','Disposed','WP','WRIT PETITION','2012','2012-08-22','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','LAXMI PANDIT','MR. PALLAV CHATTERJEE','STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 16:59:11','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'3','17919W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DEBASISH KAR GUPTA','Dakshin Dinajpur              ','JINNATUN KHATUN','SIBANI BHAGAT','STATE OF WEST BENGAL & ORS','','2012-08-08','','','','','','','','','','','','','','','2021-01-05 17:01:08','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,33,'4','17647W','Disposed','WP','WRIT PETITION','2012','2012-08-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Howrah                        ','RAM ARAJ SINGH','BISWADEB RAY CHAUDHURI','THE STATE OF WEST BENGAL & ORS','','2012-08-06','','','','','','','','','','','','','','','2021-01-05 17:02:27','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'5','17984W','Disposed','WP','WRIT PETITION','2012','2012-08-17','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','South 24-Parganas             ','AMARENDRA NATH GHOSH','BISWADEB RAY CHAUDHURI','STATE OF WEST BENGAL & OTHERS','','2012-08-10','','','','','','','','','','','','','','','2021-01-05 17:03:55','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,32,'1','8084W','Disposed','WP','WRIT PETITION','2005','2005-08-25','HON`BLE JUSTICE ARUN KUMAR MITRA','North 24-Parganas             ','MD ABDUR RAHIM MONDAL','SHAMIM LIL BARI','STATE OF WEST BENGAL & ORS','','2005-04-14','','','','','','','','','','','','','','','2021-01-05 17:08:59','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,33,'6','17430W','Disposed','WP','WRIT PETITION','2012','2012-08-07','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Kolkata                       ','BAPI ROY','SK. NIZAMUDDIN','THE STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 17:05:09','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,32,'2','8142W','Disposed','WP','WRIT PETITION','2005','2005-09-19','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Burdwan                       ','SK OBOYDULLAHA','MRS APARNA BANERJEE','THE FCHAIRMAN W B S E B & ORS','','2005-04-13','','','','','','','','','','','','','','','2021-01-05 17:10:43','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'7','17373W','Disposed','WP','WRIT PETITION','2012','2012-08-16','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Birbhum                       ','SRI JITENDRA NATH KARMAKAR','MR. DIPANKAR BOSE','THE CHAIRMAN, SAINTHIA MUNICIPALITY & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 17:06:39','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,32,'3','8172W','Disposed','WP','WRIT PETITION','2005','2005-09-19','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Kolkata                       ','AKBAR HOSSAIN','SHRI ALOKE CHATERJEE','CESC LIMITED & ORS','','2005-04-18','','','','','','','','','','','','','','','2021-01-05 17:12:10','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'8','18516W','Disposed','WP','WRIT PETITION','2012','2012-08-30','HON`BLE JUSTICE DIPANKAR DATTA','Purba Medinipur               ','PURBA MEDNAPORE ZELLA BEEDI LABOUR WORKERS UNION & ANR','PRAB IR MAJI','THE UNION OF INDIA & ORS','','2012-08-17','','','','','','','','','','','','','','','2021-01-05 17:08:07','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,32,'4','8194W','Disposed','WP','WRIT PETITION','2005','2005-09-19','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Hooghly                       ','ASIT KUMAR HALDER','MR DIPANKAR ROY','THE STATE OF WEST BENGAL & ORS','','2005-04-18','','','','','','','','','','','','','','','2021-01-05 17:13:34','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,33,'9','18289W','Disposed','WP','WRIT PETITION','2012','2012-08-21','HON`BLE JUSTICE JAYANTA KUMAR BISWAS','Jalpaiguri                    ','SMT PINKI GHOSH','TAPASI SINHA','THE STATE OF WEST BENGAL & OTHERS','','2012-08-16','','','','','','','','','','','','','','','2021-01-05 17:09:55','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'10','18064W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE ANIRUDDHA BOSE','Malda                         ','GOUR CHANDRA SAHA','MR SANJIB KUMAR DAN','STATE OF WB & ORS','','2012-08-10','','','','','','','','','','','','','','','2021-01-05 17:11:04','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,32,'5','8197W','Disposed','WP','WRIT PETITION','2005','2005-09-19','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Burdwan                       ','MR SANJUKTA ROY','MRS SANJUKTA ROY','WEST BENGAL STATE ELECTRICITY BOARD & ORS','','2005-04-18','','','','','','','','','','','','','','','2021-01-05 17:15:50','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,33,'11','17242W','Disposed','WP','WRIT PETITION','2012','2012-08-13','HON`BLE JUSTICE DIPANKAR DATTA','Kolkata                       ','M/S SAHA STEEL PVT LTD','TARUNJYOTI TEWARI','STATE OF WEST BENGAL & OTHERS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 17:12:42','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,32,'6','8202W','Disposed','WP','WRIT PETITION','2005','2005-09-19','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Burdwan                       ','DILIP PAL','RITA PATRA','THE SECRETARY WBSEB & ORS','','2005-04-18','','','','','','','','','','','','','','','2021-01-05 17:18:22','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'13','17692W','Disposed','WP','WRIT PETITION','2012','2012-08-13','HON`BLE JUSTICE DIPANKAR DATTA','North 24-Parganas             ','SRI SITAL PRASAD GUPTA','NILANJAN PAL','UNION OF INDIA & ORS','','2012-08-06','','','','','','','','','','','','','','','2021-01-05 17:15:10','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,32,'7','8211W','Disposed','WP','WRIT PETITION','2005','2005-09-19','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Murshidabad                   ','SABER KHAN','MD ANWAR HOSSAIN','STATE OF WEST BENGAL & ORS','','2005-04-13','','','','','','','','','','','','','','','2021-01-05 17:19:48','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,32,'8','8219W','Disposed','WP','WRIT PETITION','2005','2005-09-19','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Hooghly                       ','MD IASIN','MR SAMIR GHOSAL','THE STATE OF WEST BENGAL & ORS','','2005-04-18','','','','','','','','','','','','','','','2021-01-05 17:21:29','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'12','17335W','Disposed','WP','WRIT PETITION','2012','2012-08-22','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','GANGA MALIK','MR. PALLAV CHATTERJEE','STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 17:17:32','Anita Sur','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,32,'9','8227W','Disposed','WP','WRIT PETITION','2005','2005-09-19','HON`BLE JUSTICE PINAKI CHANDRA GHOSE','Kolkata                       ','RAKESH PRASAD','DEBESH HALDER','CESC LTD & ORS','','2005-04-18','','','','','','','','','','','','','','','2021-01-05 17:22:54','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'14','17800W','Disposed','WP','WRIT PETITION','2012','2012-08-30','HON`BLE JUSTICE DIPANKAR DATTA','North 24-Parganas             ','RABY KAVIRAJ (GUPTA)','PHATICK CHANDRA DAS','UNION OF INDIA & ORS','','2012-08-07','','','','','','','','','','','','','','','2021-01-05 17:18:56','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,32,'10','8235W','Disposed','WP','WRIT PETITION','2005','2005-08-26','HON`BLE JUSTICE SOUMITRA PAL','Jalpaiguri                    ','TONDOO TEA CO PVT LTD','MR S P TEWARY','REGIONAL PROVIENT FUND COMMISSIONER WEST BENGAL & OTHERS','','2005-04-18','','','','','','','','','','','','','','','2021-01-05 17:24:37','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,33,'15','17326W','Disposed','WP','WRIT PETITION','2012','2012-08-22','HON`BLE JUSTICE JYOTIRMAY BHATTACHARYA','Burdwan                       ','SRI RANJIT PANDIT','PALLAV CHATTERJEE','STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 17:20:32','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'16','17226W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DIPANKAR DATTA','Hooghly                       ','MADHURI BANERJEE','MR. DEBASIS SUR','STATE OF WEST BENGAL & ORS','','2012-08-02','','','','','','','','','','','','','','','2021-01-05 17:21:48','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,32,'11','8243W','Disposed','WP','WRIT PETITION','2005','2005-08-17','HON`BLE JUSTICE GIRISH CHANDRA GUPTA','South 24-Parganas             ','SRI ANUP NASKAR & ORS','MR ANADI BANERJEE','STATE OF WEST BENGAL & ORS','','2005-04-18','','','','','','','','','','','','','','','2021-01-05 17:26:37','Sriparna Saha','0000-00-00 00:00:00',NULL,'N');
INSERT INTO `metadata_entry` (`proj_code`,`bundle_key`,`item_no`,`case_file_no`,`case_status`,`case_type`,`case_nature`,`case_year`,`disposal_date`,`judge_name`,`district`,`petitioner_name`,`petitioner_counsel_name`,`respondant_name`,`respondant_counsel_name`,`case_filling_date`,`ps_name`,`ps_case_no`,`lc_case_no`,`lc_order_date`,`lc_judge_name`,`conn_app_case_no`,`conn_disposal_type`,`conn_main_case_no`,`analogous_case_no`,`old_case_type`,`old_case_no`,`old_case_year`,`file_move_history`,`dept_remark`,`created_dttm`,`created_by`,`modified_dttm`,`modified_by`,`status`) VALUES 
 (1,33,'17','17139W','Disposed','WP','WRIT PETITION','2012','2012-08-08','HON`BLE JUSTICE DEBASISH KAR GUPTA','Birbhum                       ','IYAR MD','JAHANGIR HOSSAIN','W.B.S.E.D.C.L & ORS','','2012-08-01','','','','','','','','','','','','','','','2021-01-05 17:23:18','Anita Sur','0000-00-00 00:00:00',NULL,'N'),
 (1,32,'12','8302W','Disposed','WP','WRIT PETITION','2005','2005-09-16','HON`BLE CHIEF JUSTICE V.S. SIRPURKAR||HON`BLE JUSTICE GANGULY','Paschim Medinipur             ','PRASANTA KUMAR DAS','MR ASWINI KUMAR BERA','STATE OF WEST BENGAL & ORS','','2005-04-19','','','','','','','','','','','','','','','2021-01-05 17:29:46','Sriparna Saha','0000-00-00 00:00:00',NULL,'N'),
 (1,33,'18','18904W','Disposed','WP','WRIT PETITION','2012','2012-08-29','HON`BLE JUSTICE DIPANKAR DATTA','Purba Medinipur               ','SAID BIBI','MR. SUPRAKAS MISRA','STATE OF W.B & ORS','','2012-08-24','','','','','','','','','','','','','','','2021-01-05 17:25:39','Anita Sur','0000-00-00 00:00:00',NULL,'N');
/*!40000 ALTER TABLE `metadata_entry` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`project_master`
--

DROP TABLE IF EXISTS `project_master`;
CREATE TABLE `project_master` (
  `proj_key` int(11) NOT NULL AUTO_INCREMENT,
  `Proj_Code` varchar(100) NOT NULL DEFAULT '',
  `Project_Path` varchar(200) NOT NULL DEFAULT '',
  `Created_By` varchar(100) NOT NULL DEFAULT '',
  `Created_DTTM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Modified_By` varchar(100) DEFAULT NULL,
  `Modified_DTTM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`proj_key`,`Proj_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`project_master`
--

/*!40000 ALTER TABLE `project_master` DISABLE KEYS */;
INSERT INTO `project_master` (`proj_key`,`Proj_Code`,`Project_Path`,`Created_By`,`Created_DTTM`,`Modified_By`,`Modified_DTTM`,`status`) VALUES 
 (1,'CHC_HIGH COURT','\\\\192.168.100.1\\CHC Processed Data\\htdocs\\CHC\\document\\CHC_HIGH COURT','u1','0000-00-00 00:00:00',NULL,'0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `project_master` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`sysconfig`
--

DROP TABLE IF EXISTS `sysconfig`;
CREATE TABLE `sysconfig` (
  `sysKeys` varchar(50) NOT NULL DEFAULT '',
  `sysValues` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`sysconfig`
--

/*!40000 ALTER TABLE `sysconfig` DISABLE KEYS */;
INSERT INTO `sysconfig` (`sysKeys`,`sysValues`) VALUES 
 ('BATCH_REJECTION','0'),
 ('CENT_FQC','0'),
 ('DB_VERSION','11'),
 ('LOCK_EXPIRES_TIME','600'),
 ('CD_NO','1');
/*!40000 ALTER TABLE `sysconfig` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`tbl_uat_info`
--

DROP TABLE IF EXISTS `tbl_uat_info`;
CREATE TABLE `tbl_uat_info` (
  `percent_checked` varchar(10) DEFAULT NULL,
  `run_no` varchar(20) DEFAULT NULL,
  `cretaed_by` varchar(25) DEFAULT NULL,
  `created_dttm` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`tbl_uat_info`
--

/*!40000 ALTER TABLE `tbl_uat_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_uat_info` ENABLE KEYS */;


--
-- Table structure for table `chc_db`.`transaction_log`
--

DROP TABLE IF EXISTS `transaction_log`;
CREATE TABLE `transaction_log` (
  `proj_key` int(11) NOT NULL DEFAULT '0',
  `Batch_Key` int(11) NOT NULL DEFAULT '0',
  `Box_number` varchar(25) NOT NULL DEFAULT '0',
  `Policy_number` varchar(40) NOT NULL DEFAULT '0',
  `QC_User` varchar(50) NOT NULL DEFAULT '',
  `Index_User` varchar(50) NOT NULL DEFAULT '',
  `Fqc_User` varchar(50) NOT NULL DEFAULT '',
  `Qc_DTTM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fqc_DTTM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Index_DTTM` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Scanned_user` varchar(50) NOT NULL DEFAULT '',
  `scanned_dttm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `indx_qc` (`QC_User`),
  KEY `indx_index` (`Index_User`),
  KEY `indx_scan` (`Scanned_user`),
  KEY `indx_fqc` (`Fqc_User`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chc_db`.`transaction_log`
--

/*!40000 ALTER TABLE `transaction_log` DISABLE KEYS */;
INSERT INTO `transaction_log` (`proj_key`,`Batch_Key`,`Box_number`,`Policy_number`,`QC_User`,`Index_User`,`Fqc_User`,`Qc_DTTM`,`fqc_DTTM`,`Index_DTTM`,`Scanned_user`,`scanned_dttm`) VALUES 
 (1,5,'1','21754W','u1','u1','u1','2021-01-05 14:00:09','2021-01-05 15:35:25','2021-01-05 14:22:39','surajit','2021-01-05 12:51:16'),
 (1,5,'1','22102W','u1','u1','u1','2021-01-05 14:00:45','2021-01-05 15:35:25','2021-01-05 14:29:59','surajit','2021-01-05 12:56:00'),
 (1,5,'1','21699W','u1','u1','u1','2021-01-05 14:01:13','2021-01-05 15:35:25','2021-01-05 14:33:46','surajit','2021-01-05 13:01:31'),
 (1,5,'1','22116W','u1','u1','u1','2021-01-05 14:03:28','2021-01-05 15:35:25','2021-01-05 14:35:19','surajit','2021-01-05 13:05:49'),
 (1,5,'1','22119W','u1','u1','u1','2021-01-05 14:07:43','2021-01-05 15:35:25','2021-01-05 14:36:31','surajit','2021-01-05 13:09:42'),
 (1,5,'1','11738W','u1','u1','u1','2021-01-05 14:08:02','2021-01-05 15:35:25','2021-01-05 14:40:41','surajit','2021-01-05 13:12:56'),
 (1,5,'1','21447W','u1','u1','u1','2021-01-05 14:08:20','2021-01-05 15:35:25','2021-01-05 14:43:47','surajit','2021-01-05 13:20:49'),
 (1,5,'1','20334W','u1','u1','u1','2021-01-05 14:08:56','2021-01-05 15:35:25','2021-01-05 15:01:51','surajit','2021-01-05 13:27:25');
INSERT INTO `transaction_log` (`proj_key`,`Batch_Key`,`Box_number`,`Policy_number`,`QC_User`,`Index_User`,`Fqc_User`,`Qc_DTTM`,`fqc_DTTM`,`Index_DTTM`,`Scanned_user`,`scanned_dttm`) VALUES 
 (1,5,'1','19907W','u1','u1','u1','2021-01-05 14:09:43','2021-01-05 15:35:25','2021-01-05 15:05:33','surajit','2021-01-05 13:42:18'),
 (1,16,'1','8070W','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','surajit','2021-01-05 14:03:35'),
 (1,16,'1','8466W','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','surajit','2021-01-05 14:43:45'),
 (1,16,'1','9419W','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','surajit','2021-01-05 15:20:04'),
 (1,16,'1','13572W','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','surajit','2021-01-05 15:46:50'),
 (1,16,'1','19890W','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','surajit','2021-01-05 16:20:50');
/*!40000 ALTER TABLE `transaction_log` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
