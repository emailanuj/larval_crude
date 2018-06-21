-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: product
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_type` enum('MAIN','OTHER') DEFAULT 'MAIN',
  `sub_account_type` varchar(50) DEFAULT NULL,
  `account_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_id` (`account_id`),
  KEY `FK_account_company_id` (`company_id`),
  CONSTRAINT `FK_account_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_code` varchar(50) DEFAULT NULL,
  `company_status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `company_name` varchar(255) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `company_url` varchar(512) DEFAULT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) unsigned NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `company_id` (`company_id`),
  UNIQUE KEY `company_code_key` (`company_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'MPSLTD','ACTIVE','Mps Limited',NULL,'http://adi-mps.com',1,'2018-05-07 02:39:40',1,'2018-06-21 15:47:37');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL,
  `customer_name` varchar(250) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  `state_name` varchar(50) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `sys_rec` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_by` int(11) unsigned NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) unsigned NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id` (`customer_id`),
  KEY `FK_customer_company_id` (`company_id`),
  CONSTRAINT `FK_customer_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `driver_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `driver_phone` varchar(50) DEFAULT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`driver_id`),
  UNIQUE KEY `driver_id` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `last_login`
--

DROP TABLE IF EXISTS `last_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `last_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `sessionData` varchar(2048) NOT NULL,
  `machineIp` varchar(1024) NOT NULL,
  `userAgent` varchar(128) NOT NULL,
  `agentString` varchar(1024) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `createdDtm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `last_login`
--

LOCK TABLES `last_login` WRITE;
/*!40000 ALTER TABLE `last_login` DISABLE KEYS */;
INSERT INTO `last_login` VALUES (1,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','127.0.0.1','Safari 604.5.6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6','Mac OS X','2018-02-25 18:11:22'),(2,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','127.0.0.1','Safari 604.5.6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6','Mac OS X','2018-02-25 18:19:01'),(3,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','127.0.0.1','Safari 604.5.6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6','Mac OS X','2018-02-25 18:22:49'),(4,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','127.0.0.1','Safari 604.5.6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6','Mac OS X','2018-02-25 18:23:15'),(5,2,'{\"role\":\"2\",\"roleText\":\"Manager\",\"name\":\"Manager\"}','127.0.0.1','Safari 604.5.6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6','Mac OS X','2018-02-25 18:25:18'),(6,3,'{\"role\":\"3\",\"roleText\":\"Employee\",\"name\":\"Employee\"}','127.0.0.1','Safari 604.5.6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6','Mac OS X','2018-02-25 18:25:40'),(7,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','127.0.0.1','Safari 604.5.6','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6','Mac OS X','2018-02-25 18:26:34'),(8,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','127.0.0.1','Chrome 63.0.3239.132','Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','Windows 8.1','2018-02-26 10:52:41'),(9,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','127.0.0.1','Chrome 64.0.3282.186','Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','Windows 8.1','2018-03-01 17:47:49'),(10,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','127.0.0.1','Chrome 64.0.3282.186','Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','Windows 8.1','2018-03-01 17:49:48'),(11,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','127.0.0.1','Chrome 65.0.3325.181','Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36','Windows 8.1','2018-04-14 09:31:47'),(12,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15','Mac OS X','2018-04-28 12:34:53'),(13,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15','Mac OS X','2018-04-29 12:09:04'),(14,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15','Mac OS X','2018-04-29 13:13:34'),(15,2,'{\"role\":\"2\",\"roleText\":\"Manager\",\"name\":\"Manager\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15','Mac OS X','2018-04-29 13:15:01'),(16,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15','Mac OS X','2018-04-29 13:15:26'),(17,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15','Mac OS X','2018-05-03 22:31:15'),(18,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15','Mac OS X','2018-05-05 18:22:08'),(19,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15','Mac OS X','2018-05-06 17:15:59'),(20,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15','Mac OS X','2018-05-07 07:41:40'),(21,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15','Mac OS X','2018-06-20 21:22:17'),(22,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.1 Safari/605.1.15','Mac OS X','2018-06-21 21:16:36'),(23,1,'{\"role\":\"1\",\"roleText\":\"System Administrator\",\"name\":\"System Administrator\"}','::1','Safari 605.1.15','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.1 Safari/605.1.15','Mac OS X','2018-06-21 22:27:01');
/*!40000 ALTER TABLE `last_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reset_password`
--

DROP TABLE IF EXISTS `reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reset_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reset_password`
--

LOCK TABLES `reset_password` WRITE;
/*!40000 ALTER TABLE `reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text',
  PRIMARY KEY (`roleId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'System Administrator'),(2,'Manager'),(3,'Employee');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transaction_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned NOT NULL,
  `voucher_number` varchar(100) NOT NULL,
  `transaction_type` enum('D','W') NOT NULL DEFAULT 'D',
  `transaction_amount` double(10,2) DEFAULT '0.00',
  `created_by` int(11) unsigned NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) unsigned NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `FK_account_transaction` (`account_id`),
  CONSTRAINT `FK_account_transaction` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_order`
--

DROP TABLE IF EXISTS `transport_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL,
  `customer_id` int(11) unsigned NOT NULL,
  `lr_number` varchar(50) NOT NULL,
  `lr_date` datetime DEFAULT NULL,
  `egp_no` varchar(50) DEFAULT NULL,
  `vehicle_id` int(11) unsigned NOT NULL,
  `desrination` varchar(50) DEFAULT NULL,
  `weight_in_mt` int(11) unsigned DEFAULT '0',
  `advance_amount` double(10,2) DEFAULT '0.00',
  `diesel_amount` double(10,2) DEFAULT '0.00',
  `tolltax_amount` double(10,2) DEFAULT '0.00',
  `gps_device_amount` double(10,2) DEFAULT '0.00',
  `prov_rate_per_km` int(11) unsigned DEFAULT '0',
  `actual_rate_per_km` int(11) unsigned DEFAULT '0',
  `bag_short_qty` int(11) unsigned DEFAULT '0',
  `bag_short_amount` double(10,2) DEFAULT '0.00',
  `di_date` datetime DEFAULT NULL,
  `acc_voucher_number` varchar(100) NOT NULL,
  `commission_amount` double(10,2) DEFAULT '0.00',
  `acc_bal_voucher_number` varchar(100) NOT NULL,
  `bill_no` varchar(100) NOT NULL,
  `bill_date` datetime DEFAULT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) unsigned NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `FK_order_company_id` (`company_id`),
  KEY `FK_order_customer` (`customer_id`),
  KEY `FK_order_vehicle` (`vehicle_id`),
  CONSTRAINT `FK_order_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `FK_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FK_order_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_order`
--

LOCK TABLES `transport_order` WRITE;
/*!40000 ALTER TABLE `transport_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `transport_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@example.com','$2y$10$oSeD27FzbW.jYj4ejcQKg.RH7cfvB7w9HC.JA0KuIUMUJseYdCd4S','System Administrator','9890098900',1,0,0,'2015-07-01 18:56:49',1,'2018-02-25 13:53:05'),(2,'manager@example.com','$2y$10$oSeD27FzbW.jYj4ejcQKg.RH7cfvB7w9HC.JA0KuIUMUJseYdCd4S','Manager','9890098900',2,0,1,'2016-12-09 17:49:56',1,'2018-01-12 07:22:11'),(3,'employee@example.com','$2y$10$oSeD27FzbW.jYj4ejcQKg.RH7cfvB7w9HC.JA0KuIUMUJseYdCd4S','Employee','9890098900',3,0,1,'2016-12-09 17:50:22',3,'2018-01-04 07:58:28'),(9,'anuj.dubey@adi-mps.com','$2y$10$8eiJv5gbPTGbft2uF6gXUeb4A6tPMlWNz378b4uxYE3K1LOYbHz0O','Anuj','9971443532',2,0,1,'2018-02-25 13:57:28',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `vehicle_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL,
  `vehicle_number` varchar(50) DEFAULT NULL,
  `vendor_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  UNIQUE KEY `vehicle_id` (`vehicle_id`),
  KEY `FK_vehicle_owner` (`vendor_id`),
  KEY `FK_vendor_company_id` (`company_id`),
  CONSTRAINT `FK_vehicle_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `FK_vehicle_owner` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `vendor_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) unsigned NOT NULL,
  `vendor_name` varchar(250) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `add_city` varchar(50) DEFAULT NULL,
  `add_state` varchar(50) DEFAULT NULL,
  `add_zipcode` varchar(10) DEFAULT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) unsigned NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`vendor_id`),
  UNIQUE KEY `vendor_id` (`vendor_id`),
  KEY `FK_vendor_company_id` (`company_id`),
  CONSTRAINT `FK_vendor_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-21 22:34:48
