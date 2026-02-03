CREATE DATABASE  IF NOT EXISTS `sarees_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sarees_db`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: sarees_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add saree',8,'add_saree'),(30,'Can change saree',8,'change_saree'),(31,'Can delete saree',8,'delete_saree'),(32,'Can view saree',8,'view_saree'),(33,'Can add about store',9,'add_aboutstore'),(34,'Can change about store',9,'change_aboutstore'),(35,'Can delete about store',9,'delete_aboutstore'),(36,'Can view about store',9,'view_aboutstore'),(37,'Can add faq',10,'add_faq'),(38,'Can change faq',10,'change_faq'),(39,'Can delete faq',10,'delete_faq'),(40,'Can view faq',10,'view_faq');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$h0ZSPTnSryeJlV3m3GCURN$/VDvK3CuWNdb0Sz9eoVS2fXIV+RD3gFki+VF5K77An8=','2026-02-03 08:24:37.652527',1,'sir1','','','sir1@gmail.com',1,1,'2026-02-02 19:03:00.217941'),(2,'pbkdf2_sha256$870000$U4NtXVmCKTYV4LlbA1JkhX$9Kh5bLXrSBznLKxctIj2MYnAR9By8mQtCKtM7yH2YaA=',NULL,1,'Rishabh','','','',1,1,'2026-02-02 19:06:45.000000'),(3,'pbkdf2_sha256$870000$WJzYrR19g7i5E6NDDBcS7i$YyRYM04G8Tk7czTxrXe4EhBhmu/tl8u0sgiuCcnWiPg=',NULL,1,'saritha','','','rot@gmail.com',1,1,'2026-02-03 07:42:33.463751'),(4,'pbkdf2_sha256$870000$AQ5B96DdB3Is3K9KopQ7IU$tt/dII5OUNOaqJ61K5nJXEDs1CcYxlPoXqwut6OCItI=','2026-02-03 08:18:32.602139',0,'hello1','','','chaubeyrishabh00@gmail.com',0,1,'2026-02-03 08:13:40.281383');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-02-02 19:06:45.839831','2','Rishabh',1,'[{\"added\": {}}]',4,1),(2,'2026-02-02 19:07:20.221187','2','Rishabh',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(3,'2026-02-02 20:49:08.319120','41','cooton',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'sarees_user','aboutstore'),(7,'sarees_user','category'),(10,'sarees_user','faq'),(8,'sarees_user','saree'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-02-02 18:33:31.360623'),(2,'auth','0001_initial','2026-02-02 18:33:31.612201'),(3,'admin','0001_initial','2026-02-02 18:33:31.672935'),(4,'admin','0002_logentry_remove_auto_add','2026-02-02 18:33:31.672935'),(5,'admin','0003_logentry_add_action_flag_choices','2026-02-02 18:33:31.688281'),(6,'contenttypes','0002_remove_content_type_name','2026-02-02 18:33:31.735599'),(7,'auth','0002_alter_permission_name_max_length','2026-02-02 18:33:31.766228'),(8,'auth','0003_alter_user_email_max_length','2026-02-02 18:33:31.778102'),(9,'auth','0004_alter_user_username_opts','2026-02-02 18:33:31.784638'),(10,'auth','0005_alter_user_last_login_null','2026-02-02 18:33:31.808240'),(11,'auth','0006_require_contenttypes_0002','2026-02-02 18:33:31.808240'),(12,'auth','0007_alter_validators_add_error_messages','2026-02-02 18:33:31.814332'),(13,'auth','0008_alter_user_username_max_length','2026-02-02 18:33:31.841634'),(14,'auth','0009_alter_user_last_name_max_length','2026-02-02 18:33:31.870192'),(15,'auth','0010_alter_group_name_max_length','2026-02-02 18:33:31.883869'),(16,'auth','0011_update_proxy_permissions','2026-02-02 18:33:31.890068'),(17,'auth','0012_alter_user_first_name_max_length','2026-02-02 18:33:31.917883'),(18,'sarees_user','0001_initial','2026-02-02 18:33:31.953640'),(19,'sarees_user','0002_aboutstore_faq_saree_created_at','2026-02-02 18:33:31.984232'),(20,'sessions','0001_initial','2026-02-02 18:33:32.001227'),(21,'sarees_user','0003_alter_category_options','2026-02-02 20:55:23.130969');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3ri39gsdq69jqfjtmudjbnvfydiv4ric','.eJxVjDkOwjAURO_iGlnfiRegpM8ZrL_YOIAcKU4qxN1JpBTQjea9mbeKuC4lri3NcRR1VUadfjtCfqa6A3lgvU-ap7rMI-ld0QdtepgkvW6H-3dQsJVtnc_CAIJd8C4QMQF2GYSJewq0JQOGA4SeE3uL2TpAe8ngHTtwJqjPFw6ZOGc:1vnBi9:am9bcUdLCh9v99ria5ntgAaO_JzkCdfjTWb016-NKVk','2026-02-17 08:24:37.652527');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarees_user_aboutstore`
--

DROP TABLE IF EXISTS `sarees_user_aboutstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sarees_user_aboutstore` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `history` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarees_user_aboutstore`
--

LOCK TABLES `sarees_user_aboutstore` WRITE;
/*!40000 ALTER TABLE `sarees_user_aboutstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarees_user_aboutstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarees_user_category`
--

DROP TABLE IF EXISTS `sarees_user_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sarees_user_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarees_user_category`
--

LOCK TABLES `sarees_user_category` WRITE;
/*!40000 ALTER TABLE `sarees_user_category` DISABLE KEYS */;
INSERT INTO `sarees_user_category` VALUES (1,'Silk Collection'),(2,'Handloom Cotton');
/*!40000 ALTER TABLE `sarees_user_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarees_user_faq`
--

DROP TABLE IF EXISTS `sarees_user_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sarees_user_faq` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarees_user_faq`
--

LOCK TABLES `sarees_user_faq` WRITE;
/*!40000 ALTER TABLE `sarees_user_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarees_user_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarees_user_saree`
--

DROP TABLE IF EXISTS `sarees_user_saree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sarees_user_saree` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `fabric` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `category_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sarees_user_saree_category_id_9c1ea604_fk_sarees_us` (`category_id`),
  CONSTRAINT `sarees_user_saree_category_id_9c1ea604_fk_sarees_us` FOREIGN KEY (`category_id`) REFERENCES `sarees_user_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarees_user_saree`
--

LOCK TABLES `sarees_user_saree` WRITE;
/*!40000 ALTER TABLE `sarees_user_saree` DISABLE KEYS */;
INSERT INTO `sarees_user_saree` VALUES (1,'Exquisite Saree 1','Banarasi Silk',2500.00,'images/1.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.691639'),(2,'Exquisite Saree 10','Banarasi Silk',2500.00,'images/10.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.691639'),(3,'Exquisite Saree 11','Banarasi Silk',2500.00,'images/11.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.701323'),(4,'Exquisite Saree 12','Banarasi Silk',2500.00,'images/12.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.701323'),(5,'Exquisite Saree 13','Banarasi Silk',2500.00,'images/13.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.701323'),(6,'Exquisite Saree 14','Banarasi Silk',2500.00,'images/14.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.701323'),(7,'Exquisite Saree 15','Banarasi Silk',2500.00,'images/15.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.707519'),(8,'Exquisite Saree 16','Banarasi Silk',2500.00,'images/16.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.720790'),(9,'Exquisite Saree 17','Banarasi Silk',2500.00,'images/17.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.722796'),(10,'Exquisite Saree 18','Banarasi Silk',2500.00,'images/18.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.723795'),(11,'Exquisite Saree 19','Banarasi Silk',2500.00,'images/19.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.727003'),(12,'Exquisite Saree 2','Banarasi Silk',2500.00,'images/2.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.728457'),(13,'Exquisite Saree 20','Banarasi Silk',2500.00,'images/20.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.729462'),(14,'Exquisite Saree 21','Banarasi Silk',2500.00,'images/21.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.735712'),(15,'Exquisite Saree 22','Banarasi Silk',2500.00,'images/22.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.738632'),(16,'Exquisite Saree 23','Banarasi Silk',2500.00,'images/23.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.740559'),(17,'Exquisite Saree 24','Banarasi Silk',2500.00,'images/24.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.742846'),(18,'Exquisite Saree 25','Banarasi Silk',2500.00,'images/25.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.745451'),(19,'Exquisite Saree 26','Banarasi Silk',2500.00,'images/26.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.747232'),(20,'Exquisite Saree 27','Banarasi Silk',2500.00,'images/27.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.749237'),(21,'Exquisite Saree 28','Banarasi Silk',2500.00,'images/28.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.751561'),(22,'Exquisite Saree 29','Banarasi Silk',2500.00,'images/29.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.752562'),(23,'Exquisite Saree 3','Banarasi Silk',2500.00,'images/3.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.754368'),(24,'Exquisite Saree 30','Banarasi Silk',2500.00,'images/30.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.756345'),(25,'Exquisite Saree 31','Banarasi Silk',2500.00,'images/31.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.758677'),(26,'Exquisite Saree 32','Banarasi Silk',2500.00,'images/32.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.760432'),(27,'Exquisite Saree 33','Banarasi Silk',2500.00,'images/33.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.761437'),(28,'Exquisite Saree 34','Banarasi Silk',2500.00,'images/34.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.763670'),(29,'Exquisite Saree 35','Banarasi Silk',2500.00,'images/35.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.764894'),(30,'Exquisite Saree 36','Banarasi Silk',2500.00,'images/36.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.768514'),(31,'Exquisite Saree 37','Banarasi Silk',2500.00,'images/37.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.770149'),(32,'Exquisite Saree 38','Banarasi Silk',2500.00,'images/38.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.772168'),(33,'Exquisite Saree 39','Banarasi Silk',2500.00,'images/39.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.775221'),(34,'Exquisite Saree 4','Banarasi Silk',2500.00,'images/4.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.777382'),(35,'Exquisite Saree 40','Banarasi Silk',2500.00,'images/40.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.779357'),(36,'Exquisite Saree 5','Banarasi Silk',2500.00,'images/5.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.782432'),(37,'Exquisite Saree 6','Banarasi Silk',2500.00,'images/6.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.783437'),(38,'Exquisite Saree 7','Banarasi Silk',2500.00,'images/7.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.786436'),(39,'Exquisite Saree 8','Banarasi Silk',2500.00,'images/8.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.788456'),(40,'silk vns','Banarasi Silk',4452.00,'images/9.webp','Timeless elegance from Savita Sarees.',1,1,'2026-02-02 19:24:44.789461');
/*!40000 ALTER TABLE `sarees_user_saree` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-03 14:09:27
