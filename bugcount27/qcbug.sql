/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.4-m14 : Database - qcbug
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

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add bug info',7,'add_buginfo'),(20,'Can change bug info',7,'change_buginfo'),(21,'Can delete bug info',7,'delete_buginfo');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$36000$DqLDwv5PiIE8$Rw/QR0HzCYGhpL5VJdvcC0ZlBpU25WF12SZd2LQkxoI=','2018-09-08 18:48:29.758000',1,'root','','','minwu163@163.com',1,1,'2018-09-08 18:47:31.484000');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `buginfo` */

DROP TABLE IF EXISTS `buginfo`;

CREATE TABLE `buginfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stat` varchar(30) COLLATE utf8_bin NOT NULL,
  `leve` varchar(30) COLLATE utf8_bin NOT NULL,
  `syst` varchar(30) COLLATE utf8_bin DEFAULT 'WIN7 32',
  `versio` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `project` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `buginfo` */

insert  into `buginfo`(`id`,`stat`,`leve`,`syst`,`versio`,`project`) values (1,'打开','严重','WIN7 32','v1.1.1.2','CRM9250Dev'),(2,'重新打开','严重','WIN7 32','v1.1.1.1','CRM9250Dev'),(3,'关闭','严重','WIN7 64','v1.1.1.2','CRM9250Dev'),(4,'修复','严重','WIN7 32','v1.1.1.3','CRM9250Dev'),(5,'挂起','严重','WIN7 32','v1.1.1.1','CRM9250Dev'),(6,'打开','一般','WIN7 32','v1.1.1.2','CRM9250Dev'),(7,'重新打开','一般','WIN7 32','v1.1.1.1','CDM8240'),(8,'关闭','一般','WIN7 64','v1.1.1.2','CRM9250Dev'),(9,'修复','一般','WIN7 32','v1.1.1.3','CDM8240'),(10,'挂起','一般','WIN7 32','v1.1.1.1','CDM8240'),(11,'打开','致命','WIN7 32','v1.1.1.2','CDM8240'),(12,'重新打开','致命','WIN7 32','v1.1.1.1','CDM8240'),(13,'关闭','致命','WIN7 64','v1.1.1.2','CRM9250Dev'),(14,'修复','致命','WIN7 32','v1.1.1.3','CRM9250Dev'),(15,'挂起','致命','WIN7 32','v1.1.1.1','CRM9250Dev'),(16,'打开','致命','WIN7 32','v1.1.1.2','CDM8240'),(17,'重新打开','警告','WIN7 32','v1.1.1.1','CDM8240'),(18,'关闭','警告','WIN7 64','v1.1.1.2','CDM8240'),(19,'修复','警告','WIN7 32','v1.1.1.3','CDM8240'),(20,'挂起','警告','WIN7 32','v1.1.1.1','CDM8240'),(21,'打开','警告','WIN7 32','v1.1.1.2','CDM8240'),(22,'重新打开','警告','WIN7 32','v1.1.1.1','CDM8240'),(23,'关闭','警告','WIN7 64','v1.1.1.2','CDM8240'),(24,'修复','警告','WIN7 32','v1.1.1.3','CDM8240'),(25,'挂起','建议','WIN7 32','v1.1.1.1','CDM8240'),(26,'打开','建议','WIN7 32','v1.1.1.2','CDM8240'),(27,'重新打开','建议','WIN7 32','v1.1.1.1','CDM8240'),(28,'关闭','建议','WIN7 64','v1.1.1.2','CDM8240'),(29,'修复','建议','WIN7 32','v1.1.1.3','CardReader'),(30,'挂起','建议','WIN7 32','v1.1.1.1','CardReader'),(31,'打开','建议','WIN7 32','v1.1.1.2','CardReader'),(32,'重新打开','建议','WIN7 32','v1.1.1.1','CardReader'),(33,'关闭','建议','WIN7 64','v1.1.1.2','CardReader'),(34,'修复','严重','WIN7 32','v1.1.1.3','CardReader'),(35,'挂起','严重','WIN7 32','v1.1.1.1','CardReader'),(36,'打开','一般','WIN7 32','v1.1.1.2','CardReader'),(37,'重新打开','一般','WIN7 32','v1.1.1.1','CardReader'),(38,'关闭','一般','WIN7 64','v1.1.1.2','CardReader'),(39,'修复','一般','WIN7 32','v1.1.1.3','CardReader'),(40,'挂起','一般','WIN7 32','v1.1.1.1','CardReader'),(41,'打开','严重','WIN7 32','v1.1.1.2','CRM9250Dev'),(42,'重新打开','严重','WIN7 32','v1.1.1.1','CRM9250Dev'),(43,'关闭','严重','WIN7 64','v1.1.1.2','CRM9250Dev'),(44,'修复','严重','WIN7 32','v1.1.1.3','CRM9250Dev'),(45,'挂起','严重','WIN7 32','v1.1.1.1','CRM9250Dev'),(46,'打开','一般','WIN7 32','v1.1.1.2','CRM9250Dev'),(47,'重新打开','一般','WIN7 32','v1.1.1.1','CDM8240'),(48,'关闭','一般','WIN7 64','v1.1.1.2','CRM9250Dev'),(49,'修复','一般','WIN7 32','v1.1.1.3','CDM8240'),(50,'挂起','一般','WIN7 32','v1.1.1.1','CDM8240'),(51,'打开','致命','WIN7 32','v1.1.1.2','CDM8240'),(52,'重新打开','致命','WIN7 32','v1.1.1.1','CDM8240'),(53,'关闭','致命','WIN7 64','v1.1.1.2','CRM9250Dev'),(54,'修复','致命','WIN7 32','v1.1.1.3','CRM9250Dev'),(55,'挂起','致命','WIN7 32','v1.1.1.1','CRM9250Dev'),(56,'打开','致命','WIN7 32','v1.1.1.2','CDM8240'),(57,'重新打开','警告','WIN7 32','v1.1.1.1','CDM8240'),(58,'关闭','警告','WIN7 64','v1.1.1.2','CDM8240'),(59,'修复','警告','WIN7 32','v1.1.1.3','CDM8240'),(60,'挂起','警告','WIN7 32','v1.1.1.1','CDM8240'),(61,'打开','警告','WIN7 32','v1.1.1.2','CDM8240'),(62,'重新打开','警告','WIN7 32','v1.1.1.1','CDM8240'),(63,'关闭','警告','WIN7 64','v1.1.1.2','CDM8240N'),(64,'修复','警告','WIN7 32','v1.1.1.3','CDM8240N'),(65,'挂起','建议','WIN7 32','v1.1.1.1','CDM8240N'),(66,'打开','建议','WIN7 32','v1.1.1.2','CDM8240N'),(67,'重新打开','建议','WIN7 32','v1.1.1.1','CDM8240N'),(68,'关闭','建议','WIN7 64','v1.1.1.2','CDM8240N'),(69,'修复','建议','WIN7 32','v1.1.1.3','CardReader'),(70,'挂起','建议','WIN7 32','v1.1.1.1','CardReader'),(71,'打开','建议','WIN7 32','v1.1.1.2','CardReader'),(72,'重新打开','建议','WIN7 32','v1.1.1.1','CardReader'),(73,'关闭','建议','WIN7 64','v1.1.1.2','CardReader'),(74,'修复','严重','WIN7 32','v1.1.1.3','CardReader'),(75,'挂起','严重','WIN7 32','v1.1.1.1','CardReader'),(76,'打开','一般','WIN7 32','v1.1.1.2','CardReader'),(77,'重新打开','一般','WIN7 32','v1.1.1.1','CardReader'),(78,'关闭','一般','WIN7 64','v1.1.1.2','CardReader'),(79,'修复','一般','WIN7 32','v1.1.1.3','CardReader'),(80,'挂起','一般','WIN7 32','v1.1.1.1','CardReader'),(81,'打开','建议','WIN7 32','v1.1.1.2','CDM8240'),(82,'打开','建议','WIN7 32','v1.1.1.2','CDM8240');

/*Table structure for table `bugs_buginfo` */

DROP TABLE IF EXISTS `bugs_buginfo`;

CREATE TABLE `bugs_buginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat` varchar(30) NOT NULL,
  `leve` varchar(30) NOT NULL,
  `syst` varchar(30) NOT NULL,
  `versio` varchar(30) NOT NULL,
  `project` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

/*Data for the table `bugs_buginfo` */

insert  into `bugs_buginfo`(`id`,`stat`,`leve`,`syst`,`versio`,`project`) values (1,'打开','严重','WIN7 32','v1.1.1.2','CRM9250Dev'),(2,'重新打开','严重','WIN7 32','v1.1.1.1','CRM9250Dev'),(3,'关闭','严重','WIN7 64','v1.1.1.2','CRM9250Dev'),(4,'修复','严重','WIN7 32','v1.1.1.3','CRM9250Dev'),(5,'挂起','严重','WIN7 32','v1.1.1.1','CRM9250Dev'),(6,'打开','一般','WIN7 32','v1.1.1.2','CRM9250Dev'),(7,'重新打开','一般','WIN7 32','v1.1.1.1','CDM8240'),(8,'关闭','一般','WIN7 64','v1.1.1.2','CRM9250Dev'),(9,'修复','一般','WIN7 32','v1.1.1.3','CDM8240'),(10,'挂起','一般','WIN7 32','v1.1.1.1','CDM8240'),(11,'打开','致命','WIN7 32','v1.1.1.2','CDM8240'),(12,'重新打开','致命','WIN7 32','v1.1.1.1','CDM8240'),(13,'关闭','致命','WIN7 64','v1.1.1.2','CRM9250Dev'),(14,'修复','致命','WIN7 32','v1.1.1.3','CRM9250Dev'),(15,'挂起','致命','WIN7 32','v1.1.1.1','CRM9250Dev'),(16,'打开','致命','WIN7 32','v1.1.1.2','CDM8240'),(17,'重新打开','警告','WIN7 32','v1.1.1.1','CDM8240'),(18,'关闭','警告','WIN7 64','v1.1.1.2','CDM8240'),(19,'修复','警告','WIN7 32','v1.1.1.3','CDM8240'),(20,'挂起','警告','WIN7 32','v1.1.1.1','CDM8240'),(21,'打开','警告','WIN7 32','v1.1.1.2','CDM8240'),(22,'重新打开','警告','WIN7 32','v1.1.1.1','CDM8240'),(23,'关闭','警告','WIN7 64','v1.1.1.2','CDM8240'),(24,'修复','警告','WIN7 32','v1.1.1.3','CDM8240'),(25,'挂起','建议','WIN7 32','v1.1.1.1','CDM8240'),(26,'打开','建议','WIN7 32','v1.1.1.2','CDM8240'),(27,'重新打开','建议','WIN7 32','v1.1.1.1','CDM8240'),(28,'关闭','建议','WIN7 64','v1.1.1.2','CDM8240'),(29,'修复','建议','WIN7 32','v1.1.1.3','CardReader'),(30,'挂起','建议','WIN7 32','v1.1.1.1','CardReader'),(31,'打开','建议','WIN7 32','v1.1.1.2','CardReader'),(32,'重新打开','建议','WIN7 32','v1.1.1.1','CardReader'),(33,'关闭','建议','WIN7 64','v1.1.1.2','CardReader'),(34,'修复','严重','WIN7 32','v1.1.1.3','CardReader'),(35,'挂起','严重','WIN7 32','v1.1.1.1','CardReader'),(36,'打开','一般','WIN7 32','v1.1.1.2','CardReader'),(37,'重新打开','一般','WIN7 32','v1.1.1.1','CardReader'),(38,'关闭','一般','WIN7 64','v1.1.1.2','CardReader'),(39,'修复','一般','WIN7 32','v1.1.1.3','CardReader'),(40,'挂起','一般','WIN7 32','v1.1.1.1','CardReader'),(41,'打开','严重','WIN7 32','v1.1.1.2','CRM9250Dev'),(42,'重新打开','严重','WIN7 32','v1.1.1.1','CRM9250Dev'),(43,'关闭','严重','WIN7 64','v1.1.1.2','CRM9250Dev'),(44,'修复','严重','WIN7 32','v1.1.1.3','CRM9250Dev'),(45,'挂起','严重','WIN7 32','v1.1.1.1','CRM9250Dev'),(46,'打开','一般','WIN7 32','v1.1.1.2','CRM9250Dev'),(47,'重新打开','一般','WIN7 32','v1.1.1.1','CDM8240'),(48,'关闭','一般','WIN7 64','v1.1.1.2','CRM9250Dev'),(49,'修复','一般','WIN7 32','v1.1.1.3','CDM8240'),(50,'挂起','一般','WIN7 32','v1.1.1.1','CDM8240'),(51,'打开','致命','WIN7 32','v1.1.1.2','CDM8240'),(52,'重新打开','致命','WIN7 32','v1.1.1.1','CDM8240'),(53,'关闭','致命','WIN7 64','v1.1.1.2','CRM9250Dev'),(54,'修复','致命','WIN7 32','v1.1.1.3','CRM9250Dev'),(55,'挂起','致命','WIN7 32','v1.1.1.1','CRM9250Dev'),(56,'打开','致命','WIN7 32','v1.1.1.2','CDM8240'),(57,'重新打开','警告','WIN7 32','v1.1.1.1','CDM8240'),(58,'关闭','警告','WIN7 64','v1.1.1.2','CDM8240'),(59,'修复','警告','WIN7 32','v1.1.1.3','CDM8240'),(60,'挂起','警告','WIN7 32','v1.1.1.1','CDM8240'),(61,'打开','警告','WIN7 32','v1.1.1.2','CDM8240'),(62,'重新打开','警告','WIN7 32','v1.1.1.1','CDM8240'),(63,'关闭','警告','WIN7 64','v1.1.1.2','CDM8240N'),(64,'修复','警告','WIN7 32','v1.1.1.3','CDM8240N'),(65,'挂起','建议','WIN7 32','v1.1.1.1','CDM8240N'),(66,'打开','建议','WIN7 32','v1.1.1.2','CDM8240N'),(67,'重新打开','建议','WIN7 32','v1.1.1.1','CDM8240N'),(68,'关闭','建议','WIN7 64','v1.1.1.2','CDM8240N'),(69,'修复','建议','WIN7 32','v1.1.1.3','CardReader'),(70,'挂起','建议','WIN7 32','v1.1.1.1','CardReader'),(71,'打开','建议','WIN7 32','v1.1.1.2','CardReader'),(72,'重新打开','建议','WIN7 32','v1.1.1.1','CardReader'),(73,'关闭','建议','WIN7 64','v1.1.1.2','CardReader'),(74,'修复','严重','WIN7 32','v1.1.1.3','CardReader'),(75,'挂起','严重','WIN7 32','v1.1.1.1','CardReader'),(76,'打开','一般','WIN7 32','v1.1.1.2','CardReader'),(77,'重新打开','一般','WIN7 32','v1.1.1.1','CardReader'),(78,'关闭','一般','WIN7 64','v1.1.1.2','CardReader'),(79,'修复','一般','WIN7 32','v1.1.1.3','CardReader'),(80,'挂起','一般','WIN7 32','v1.1.1.1','CardReader'),(82,'打开','建议','WIN7 32','v1.1.1.2','CDM8240');

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(7,'bugs','buginfo'),(5,'contenttypes','contenttype'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2018-09-07 18:57:01.534000'),(2,'auth','0001_initial','2018-09-07 18:57:13.964000'),(3,'admin','0001_initial','2018-09-07 18:57:15.886000'),(4,'admin','0002_logentry_remove_auto_add','2018-09-07 18:57:15.921000'),(5,'contenttypes','0002_remove_content_type_name','2018-09-07 18:57:17.490000'),(6,'auth','0002_alter_permission_name_max_length','2018-09-07 18:57:18.333000'),(7,'auth','0003_alter_user_email_max_length','2018-09-07 18:57:19.184000'),(8,'auth','0004_alter_user_username_opts','2018-09-07 18:57:19.232000'),(9,'auth','0005_alter_user_last_login_null','2018-09-07 18:57:21.853000'),(10,'auth','0006_require_contenttypes_0002','2018-09-07 18:57:21.955000'),(11,'auth','0007_alter_validators_add_error_messages','2018-09-07 18:57:22.044000'),(12,'auth','0008_alter_user_username_max_length','2018-09-07 18:57:23.281000'),(13,'bugs','0001_initial','2018-09-07 18:57:23.681000'),(14,'sessions','0001_initial','2018-09-07 18:57:24.478000');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('n1ssts1sueas47vsu43ug6w9y2dst0uw','NmVlNzJkMjM2MzU3OTNkMjRkOWJmNzA0MWMwZDBjNjlhZjY0YjRjNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg3NWY2ZjFhMzljMjIyNjE1YWI3ZTRhNTdjNzEyYTlhMjhmZWQ2ZWUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-09-22 18:48:29.979000');

/* Trigger structure for table `buginfo` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `BBB` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `BBB` AFTER INSERT ON `buginfo` FOR EACH ROW BEGIN
	INSERT INTO `qcbug`.`bugs_buginfo` VALUES(new.id,new.stat,new.leve,new.syst,new.versio,new.project);
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
