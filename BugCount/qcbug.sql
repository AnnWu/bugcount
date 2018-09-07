/*
SQLyog Ultimate v12.08 (32 bit)
MySQL - 5.7.23 : Database - qcbug
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qcbug` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `qcbug`;

/*Table structure for table `buginfo` */

DROP TABLE IF EXISTS `buginfo`;

CREATE TABLE `buginfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stat` varchar(30) COLLATE utf8_bin NOT NULL,
  `leve` varchar(30) COLLATE utf8_bin NOT NULL,
  `syst` char(30) COLLATE utf8_bin DEFAULT 'WIN7 32',
  `versio` char(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `buginfo` */

insert  into `buginfo`(`id`,`stat`,`leve`,`syst`,`versio`) values (1,'打开','严重','WIN7 32','v1.1.1.2'),(2,'重新打开','严重','WIN7 32','v1.1.1.1'),(3,'关闭','严重','WIN7 64','v1.1.1.2'),(4,'修复','严重','WIN7 32','v1.1.1.3'),(5,'挂起','严重','WIN7 32','v1.1.1.1'),(6,'打开','一般','WIN7 32','v1.1.1.2'),(7,'重新打开','一般','WIN7 32','v1.1.1.1'),(8,'关闭','一般','WIN7 64','v1.1.1.2'),(9,'修复','一般','WIN7 32','v1.1.1.3'),(10,'挂起','一般','WIN7 32','v1.1.1.1'),(11,'打开','致命','WIN7 32','v1.1.1.2'),(12,'重新打开','致命','WIN7 32','v1.1.1.1'),(13,'关闭','致命','WIN7 64','v1.1.1.2'),(14,'修复','致命','WIN7 32','v1.1.1.3'),(15,'挂起','致命','WIN7 32','v1.1.1.1'),(16,'打开','致命','WIN7 32','v1.1.1.2'),(17,'重新打开','警告','WIN7 32','v1.1.1.1'),(18,'关闭','警告','WIN7 64','v1.1.1.2'),(19,'修复','警告','WIN7 32','v1.1.1.3'),(20,'挂起','警告','WIN7 32','v1.1.1.1'),(21,'打开','警告','WIN7 32','v1.1.1.2'),(22,'重新打开','警告','WIN7 32','v1.1.1.1'),(23,'关闭','警告','WIN7 64','v1.1.1.2'),(24,'修复','警告','WIN7 32','v1.1.1.3'),(25,'挂起','建议','WIN7 32','v1.1.1.1'),(26,'打开','建议','WIN7 32','v1.1.1.2'),(27,'重新打开','建议','WIN7 32','v1.1.1.1'),(28,'关闭','建议','WIN7 64','v1.1.1.2'),(29,'修复','建议','WIN7 32','v1.1.1.3'),(30,'挂起','建议','WIN7 32','v1.1.1.1'),(31,'打开','建议','WIN7 32','v1.1.1.2'),(32,'重新打开','建议','WIN7 32','v1.1.1.1'),(33,'关闭','建议','WIN7 64','v1.1.1.2'),(34,'修复','严重','WIN7 32','v1.1.1.3'),(35,'挂起','严重','WIN7 32','v1.1.1.1'),(36,'打开','一般','WIN7 32','v1.1.1.2'),(37,'重新打开','一般','WIN7 32','v1.1.1.1'),(38,'关闭','一般','WIN7 64','v1.1.1.2'),(39,'修复','一般','WIN7 32','v1.1.1.3'),(60,'挂起','一般','WIN7 32','v1.1.1.1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
