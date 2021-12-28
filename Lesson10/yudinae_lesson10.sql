CREATE DATABASE  IF NOT EXISTS `team_result_yudinae` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `team_result_yudinae`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: team_result_yudinae
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_city_country_idx` (`country_id`),
  CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,51,'ea'),(2,47,'eveniet'),(3,49,'eos'),(4,44,'voluptatem'),(5,28,'est'),(6,45,'eum'),(7,100,'at'),(8,12,'ad'),(9,83,'dolor'),(10,12,'perferendis'),(11,91,'sit'),(12,62,'voluptatem'),(13,75,'numquam'),(14,63,'voluptatem'),(15,11,'rem'),(16,20,'nostrum'),(17,96,'et'),(18,97,'explicabo'),(19,30,'saepe'),(20,71,'fuga'),(21,89,'eum'),(22,98,'ut'),(23,59,'voluptatem'),(24,61,'est'),(25,64,'eius'),(26,72,'voluptatum'),(27,89,'eum'),(28,1,'qui'),(29,57,'repellendus'),(30,50,'numquam'),(31,91,'consequuntur'),(32,7,'tempore'),(33,97,'qui'),(34,39,'in'),(35,50,'sapiente'),(36,24,'aut'),(37,83,'optio'),(38,49,'molestiae'),(39,36,'et'),(40,66,'cum'),(41,61,'id'),(42,26,'tempore'),(43,27,'et'),(44,36,'quo'),(45,89,'laudantium'),(46,38,'animi'),(47,55,'velit'),(48,85,'et'),(49,34,'et'),(50,85,'cupiditate'),(51,56,'et'),(52,23,'expedita'),(53,82,'explicabo'),(54,14,'asperiores'),(55,83,'deserunt'),(56,45,'modi'),(57,86,'et'),(58,72,'magni'),(59,46,'ratione'),(60,42,'ex'),(61,22,'dicta'),(62,36,'et'),(63,49,'sunt'),(64,18,'velit'),(65,75,'omnis'),(66,99,'quidem'),(67,42,'ipsum'),(68,58,'ullam'),(69,48,'maiores'),(70,77,'adipisci'),(71,23,'porro'),(72,8,'omnis'),(73,3,'ea'),(74,50,'laudantium'),(75,43,'doloribus'),(76,92,'dolorum'),(77,87,'eaque'),(78,98,'sit'),(79,76,'ut'),(80,21,'eaque'),(81,82,'sit'),(82,31,'eveniet'),(83,43,'veniam'),(84,64,'voluptas'),(85,45,'velit'),(86,26,'similique'),(87,9,'laborum'),(88,30,'molestias'),(89,97,'nihil'),(90,54,'animi'),(91,71,'temporibus'),(92,18,'iure'),(93,89,'et'),(94,19,'illum'),(95,36,'sequi'),(96,63,'tenetur'),(97,17,'qui'),(98,77,'voluptatem'),(99,20,'minus'),(100,64,'unde');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `position_id` int NOT NULL,
  `type of contract` enum('1','2','3','4') NOT NULL COMMENT '1 - full contract, 2 - incomplete contract, 3 - lease contract, 4 - short term rent',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `bonus` int DEFAULT NULL COMMENT 'подписной бонус',
  `bonus_for_played_match` int DEFAULT NULL COMMENT 'бонус за матч',
  `payment_for_unused_replacement` int DEFAULT NULL COMMENT 'выплаты за неиспользуемую замену',
  `goal_bonus` int DEFAULT NULL COMMENT 'бонус за гол',
  `assists_bonus` int DEFAULT NULL COMMENT 'бонус за голевые передачи',
  `clean_sheet_bonus` int DEFAULT NULL COMMENT 'бонус за матч на ноль',
  `salary_per_month` int DEFAULT NULL COMMENT 'зарплата (в месяц)',
  `salary_increase_per_year(%)` int DEFAULT NULL COMMENT 'Увеличение зарплаты в год',
  `decrease_in_salary_upon_departure(%)` int DEFAULT NULL COMMENT 'уменьшение зарплаты при вылете',
  `player_payout` int DEFAULT NULL,
  `payment_of_non_play` int DEFAULT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `fk_contract_line_up1_idx` (`player_id`),
  KEY `fk_contract_position1_idx` (`position_id`),
  CONSTRAINT `fk_contract_line_up1` FOREIGN KEY (`player_id`) REFERENCES `line_up` (`player_id`),
  CONSTRAINT `fk_contract_position1` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,56,19,'1','1975-12-16 22:43:53','1998-08-14 08:33:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,4,2,'1','2020-01-17 21:01:39','1986-08-16 02:07:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,6,7,'1','1982-12-04 21:07:38','1987-05-07 06:12:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,27,3,'1','1982-07-18 02:31:45','1986-05-08 11:42:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,51,16,'1','2003-10-27 01:26:23','2015-04-13 10:47:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,58,9,'1','1971-01-19 13:34:40','1985-08-05 06:32:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,14,'1','2007-08-16 23:36:36','1983-02-28 21:38:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,81,8,'1','2014-05-18 11:10:55','1991-10-11 05:59:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,12,9,'1','2003-10-25 23:43:08','2004-01-16 08:51:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,59,10,'1','2019-08-27 23:23:29','2011-09-10 09:45:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,97,8,'1','1996-02-18 18:53:38','1993-12-22 06:49:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,35,4,'1','1998-05-15 20:56:41','2018-10-03 06:28:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,33,13,'1','1992-04-18 12:32:14','2004-08-03 15:57:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,53,4,'1','2002-01-29 04:22:14','2001-04-29 09:11:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,92,16,'1','1982-09-07 00:22:18','2010-01-17 03:37:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,34,10,'1','2001-05-18 21:05:29','1985-01-30 17:44:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,66,8,'1','1976-08-29 19:22:16','1993-01-15 11:21:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,55,15,'1','2005-11-18 19:55:24','1990-12-05 21:43:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,69,17,'1','1987-10-18 09:28:40','2009-03-03 04:02:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,84,4,'1','1990-04-21 12:39:25','1973-03-22 20:31:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,57,9,'1','2020-08-31 20:24:16','1986-11-29 05:44:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,61,12,'1','2013-09-17 21:35:01','1978-11-18 06:30:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,8,9,'1','2003-03-21 21:30:41','1983-02-16 13:50:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,98,4,'1','2009-09-18 23:35:46','2020-09-22 22:04:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,84,12,'1','1984-09-05 23:56:49','2006-10-13 10:32:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,67,17,'1','1994-11-19 16:02:19','2007-12-20 02:47:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,95,1,'1','2010-02-25 23:28:14','2017-05-31 08:13:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,98,6,'1','2004-09-13 19:51:42','2009-10-16 07:25:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,63,11,'1','2021-10-03 10:51:04','1980-01-07 21:09:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,44,11,'1','1980-01-08 15:08:55','1999-01-11 14:15:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,26,16,'1','1975-11-30 19:12:08','2019-08-06 20:48:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,2,19,'1','1978-09-23 07:10:44','1995-06-21 05:51:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,13,12,'1','1978-12-26 21:28:24','1980-12-17 05:28:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,63,17,'1','2012-12-26 18:12:32','1972-01-14 10:38:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,36,10,'1','1980-01-18 20:39:09','1979-12-20 09:35:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,1,19,'1','2001-07-22 16:12:14','1991-07-21 18:48:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,88,13,'1','2002-09-23 01:53:59','1970-05-07 00:33:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,52,19,'1','2010-03-23 07:10:04','1976-11-05 17:51:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,2,10,'1','1995-08-20 22:25:55','2021-03-07 12:51:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,15,18,'1','1992-10-19 07:52:37','1983-12-11 17:08:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,5,17,'1','2013-03-24 17:49:43','1986-04-25 19:40:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,66,20,'1','1987-03-10 12:18:55','1974-02-15 21:31:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,82,13,'1','2015-09-05 08:24:28','1983-05-29 04:52:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,27,9,'1','1998-09-22 20:04:25','1983-12-04 08:01:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,14,14,'1','2002-03-20 18:02:14','2006-10-29 07:21:14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,98,8,'1','2014-12-22 19:56:34','1979-12-12 06:14:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,46,20,'1','1985-11-15 11:56:37','1979-07-22 06:09:52',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,31,12,'1','1985-05-27 08:24:47','1975-07-20 08:21:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,55,19,'1','2005-06-10 13:43:00','2000-04-17 17:59:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,41,19,'1','2019-05-22 01:34:53','1975-09-13 17:42:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,39,9,'1','1971-08-10 00:28:37','1985-12-10 03:05:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,84,6,'1','1997-11-03 17:14:13','1997-11-22 00:27:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,2,7,'1','1994-10-19 06:00:20','2002-08-13 01:04:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,21,1,'1','1975-02-28 05:26:03','2013-10-21 14:42:56',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,83,8,'1','1972-04-01 09:40:53','1976-11-13 00:28:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,89,18,'1','1983-11-29 18:02:15','1971-03-25 21:42:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,16,11,'1','2001-07-21 17:24:42','1986-09-23 13:18:51',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,86,20,'1','1988-01-23 13:48:51','1978-07-28 23:15:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,17,3,'1','1993-11-13 10:21:24','1992-09-29 20:18:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,41,6,'1','2010-09-30 20:09:35','1996-09-14 14:05:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,82,8,'1','1973-02-04 11:07:53','2018-06-14 14:12:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,69,6,'1','2007-12-07 23:52:33','2004-09-06 15:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,37,20,'1','1992-01-12 06:37:48','2015-05-11 08:43:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,86,19,'1','2004-08-26 16:02:14','1988-12-13 17:14:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,92,6,'1','2020-11-01 10:57:39','2004-09-20 18:11:03',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,82,7,'1','1979-02-11 10:06:38','2019-01-18 02:33:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,68,13,'1','1982-06-15 01:25:54','1987-09-08 18:28:07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,57,14,'1','1976-10-29 06:10:48','2001-06-03 13:20:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,99,16,'1','2009-07-01 23:47:38','1994-12-29 18:04:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,72,17,'1','1992-05-31 14:43:23','1981-12-03 12:26:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,13,12,'1','1996-07-21 01:42:22','1986-01-28 07:54:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,69,6,'1','2015-09-21 05:45:04','2007-04-29 12:33:22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,14,11,'1','1993-01-09 11:32:28','2000-10-29 08:39:09',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,25,6,'1','2014-10-15 01:08:27','2000-02-11 20:18:17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,66,13,'1','1996-02-19 16:11:07','2013-12-12 19:59:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,60,10,'1','1994-06-21 09:37:52','1975-07-06 00:34:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,2,6,'1','1972-11-16 11:21:52','1985-02-22 13:24:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,75,8,'1','2014-04-01 08:33:40','1974-09-15 09:06:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,28,13,'1','1995-07-19 06:33:55','1987-06-04 01:51:32',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,29,4,'1','2015-04-26 14:37:10','1977-11-03 00:32:24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,87,3,'1','1987-10-15 19:26:51','1985-01-16 10:08:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,50,11,'1','1990-12-30 18:43:47','1998-03-24 07:40:58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,76,2,'1','1970-05-24 22:23:13','1988-08-10 01:51:47',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,23,15,'1','2014-12-06 03:38:18','1977-02-14 14:16:34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,83,19,'1','2004-10-21 03:03:44','1988-11-25 11:54:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,56,19,'1','2005-12-05 23:59:30','1997-11-21 12:05:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,55,5,'1','1981-01-20 19:22:54','2016-12-21 10:04:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,23,14,'1','1973-11-12 20:48:40','1987-11-26 15:22:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,78,10,'1','2018-09-26 08:28:05','1993-09-22 05:43:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,98,9,'1','2014-10-09 19:30:00','1984-11-02 10:33:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,12,12,'1','1986-01-04 20:21:04','2019-09-02 15:23:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,91,3,'1','1974-06-16 09:10:54','1997-01-16 22:28:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,87,14,'1','1999-11-21 16:03:12','1982-01-31 05:56:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,52,3,'1','2015-12-05 04:13:52','2003-11-06 01:26:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,26,17,'1','1984-11-20 00:23:46','2015-09-12 20:37:10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,33,3,'1','2006-12-09 19:41:19','2018-03-28 13:28:55',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,91,17,'1','1984-09-29 23:50:57','2001-11-08 22:44:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,67,14,'1','1982-02-11 04:14:41','2006-08-05 19:23:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,89,18,'1','1980-08-04 21:09:05','2010-06-05 06:37:57',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,40,15,'1','2014-02-27 02:03:33','2010-05-26 16:09:19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'autem'),(2,'beatae'),(3,'vitae'),(4,'et'),(5,'quaerat'),(6,'occaecati'),(7,'nihil'),(8,'tempore'),(9,'unde'),(10,'quos'),(11,'voluptas'),(12,'cumque'),(13,'placeat'),(14,'maiores'),(15,'doloribus'),(16,'ea'),(17,'a'),(18,'at'),(19,'fugiat'),(20,'quasi'),(21,'dolores'),(22,'enim'),(23,'tempore'),(24,'ipsa'),(25,'autem'),(26,'quo'),(27,'natus'),(28,'aliquid'),(29,'est'),(30,'rerum'),(31,'provident'),(32,'qui'),(33,'impedit'),(34,'iure'),(35,'ducimus'),(36,'rerum'),(37,'veniam'),(38,'assumenda'),(39,'culpa'),(40,'architecto'),(41,'magnam'),(42,'facilis'),(43,'quaerat'),(44,'recusandae'),(45,'facere'),(46,'aliquid'),(47,'ut'),(48,'voluptas'),(49,'velit'),(50,'excepturi'),(51,'iste'),(52,'qui'),(53,'id'),(54,'maxime'),(55,'corporis'),(56,'excepturi'),(57,'maxime'),(58,'eos'),(59,'aut'),(60,'velit'),(61,'et'),(62,'sit'),(63,'ipsa'),(64,'sint'),(65,'illo'),(66,'voluptatem'),(67,'porro'),(68,'nihil'),(69,'voluptatem'),(70,'quia'),(71,'est'),(72,'tempora'),(73,'atque'),(74,'asperiores'),(75,'illo'),(76,'aspernatur'),(77,'iusto'),(78,'dolore'),(79,'similique'),(80,'culpa'),(81,'et'),(82,'tempore'),(83,'distinctio'),(84,'illo'),(85,'placeat'),(86,'perspiciatis'),(87,'est'),(88,'vero'),(89,'eligendi'),(90,'incidunt'),(91,'quam'),(92,'cupiditate'),(93,'ullam'),(94,'sed'),(95,'nobis'),(96,'corrupti'),(97,'et'),(98,'magnam'),(99,'doloribus'),(100,'facere');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_up`
--

DROP TABLE IF EXISTS `line_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line_up` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `citizenship` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `surname` varchar(150) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `fk_line_up_team1_idx` (`team_id`) /*!80000 INVISIBLE */,
  KEY `fk_line_up_country1_idx` (`citizenship`),
  CONSTRAINT `fk_line_up_country1` FOREIGN KEY (`citizenship`) REFERENCES `country` (`country_id`),
  CONSTRAINT `fk_line_up_team1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_up`
--

LOCK TABLES `line_up` WRITE;
/*!40000 ALTER TABLE `line_up` DISABLE KEYS */;
INSERT INTO `line_up` VALUES (1,71,88,'ex','sunt','2005-12-19','voluptatum'),(2,70,35,'placeat','odit','2006-04-12','consequatur'),(3,98,29,'corporis','officiis','1988-03-18','nostrum'),(4,52,73,'necessitatibus','earum','1981-07-26','nemo'),(5,93,94,'aut','nobis','2012-05-15','impedit'),(6,76,49,'facere','id','1982-07-17','quis'),(7,76,12,'sed','ipsa','1992-09-13','ducimus'),(8,1,24,'rem','totam','1993-12-17','vitae'),(9,25,20,'nihil','ipsum','2020-04-16','est'),(10,47,13,'recusandae','error','1971-04-20','omnis'),(11,48,44,'velit','libero','2012-11-07','sit'),(12,59,71,'quisquam','totam','1972-09-22','beatae'),(13,14,95,'necessitatibus','voluptatum','2010-04-13','nihil'),(14,94,42,'consequuntur','aperiam','2002-01-20','sit'),(15,79,44,'excepturi','dolores','1995-04-24','iure'),(16,97,50,'et','amet','2004-08-23','provident'),(17,32,67,'necessitatibus','reprehenderit','1972-10-28','sit'),(18,84,29,'aliquam','corrupti','2020-09-20','consequatur'),(19,95,36,'natus','dolores','1995-05-15','sunt'),(20,2,87,'est','in','1978-01-01','sit'),(21,29,78,'eos','et','1978-09-24','sit'),(22,35,4,'hic','optio','1985-11-21','quisquam'),(23,89,36,'doloremque','eius','1980-08-08','et'),(24,27,13,'quos','ducimus','1994-10-19','provident'),(25,56,74,'et','tempora','2010-11-03','quos'),(26,25,3,'est','voluptates','1989-01-12','quo'),(27,17,84,'asperiores','laboriosam','1985-09-24','repellendus'),(28,73,31,'sit','ut','2012-06-18','omnis'),(29,78,67,'ratione','hic','2007-11-06','quasi'),(30,73,57,'velit','optio','1981-12-11','iusto'),(31,11,69,'ut','quo','1999-03-13','libero'),(32,7,42,'omnis','omnis','1993-04-23','officia'),(33,35,90,'totam','quia','1980-02-17','nihil'),(34,71,29,'aliquam','consequuntur','1989-06-01','quasi'),(35,26,72,'eum','sapiente','1972-09-01','reiciendis'),(36,16,54,'molestiae','ut','2009-10-18','dicta'),(37,49,51,'beatae','qui','1992-08-07','ut'),(38,58,38,'voluptate','est','1976-05-26','doloribus'),(39,86,85,'commodi','quas','1983-04-08','asperiores'),(40,51,41,'facilis','atque','1979-08-07','possimus'),(41,59,76,'ea','ut','1990-04-19','consectetur'),(42,44,75,'vitae','animi','1974-03-05','sapiente'),(43,59,17,'sit','ducimus','2020-06-22','praesentium'),(44,6,37,'ab','sunt','2007-12-14','soluta'),(45,83,78,'occaecati','occaecati','1987-05-09','ipsum'),(46,94,94,'sit','at','2005-05-11','sed'),(47,47,100,'animi','nam','1983-12-13','sint'),(48,35,81,'omnis','et','2010-12-11','ut'),(49,90,5,'neque','qui','1975-07-30','et'),(50,10,15,'porro','qui','1990-10-03','impedit'),(51,77,25,'vel','suscipit','1984-12-24','laborum'),(52,68,26,'qui','repellat','1992-02-17','possimus'),(53,75,26,'rerum','eveniet','2013-07-23','quo'),(54,63,61,'repudiandae','qui','1990-06-04','ut'),(55,10,13,'voluptas','suscipit','1970-10-31','nobis'),(56,2,68,'animi','consequatur','1989-07-26','est'),(57,89,45,'omnis','iusto','1971-04-01','atque'),(58,43,47,'tempora','qui','1994-11-19','rerum'),(59,62,48,'fugiat','veritatis','2011-04-27','aspernatur'),(60,84,44,'perferendis','dignissimos','2009-10-22','ea'),(61,26,77,'qui','cumque','2001-10-22','quas'),(62,38,73,'quo','qui','1982-07-21','quaerat'),(63,76,72,'at','nemo','1991-04-02','quis'),(64,54,65,'dolor','beatae','2012-03-28','qui'),(65,77,63,'ut','eum','2000-10-17','id'),(66,80,53,'deleniti','impedit','1987-01-14','occaecati'),(67,88,47,'accusamus','enim','1970-06-30','reprehenderit'),(68,79,63,'ipsa','rem','2012-04-09','dicta'),(69,72,42,'hic','et','1990-10-07','laboriosam'),(70,24,82,'eligendi','blanditiis','1990-10-07','et'),(71,55,25,'voluptatum','ut','1980-04-15','ipsum'),(72,49,43,'quia','illo','1986-09-14','repudiandae'),(73,70,91,'possimus','deleniti','1998-12-28','aut'),(74,90,31,'et','est','2017-08-26','odit'),(75,39,73,'illum','officiis','1996-05-12','fugiat'),(76,75,65,'rerum','totam','1996-03-03','eius'),(77,49,12,'eum','enim','1974-02-25','voluptatibus'),(78,37,25,'eos','repellat','1994-01-02','voluptates'),(79,84,90,'minus','qui','2000-06-15','sequi'),(80,90,60,'repellendus','quo','2015-11-21','cumque'),(81,53,69,'minus','veritatis','2014-05-11','natus'),(82,13,41,'perspiciatis','ut','2009-08-26','autem'),(83,15,92,'doloremque','necessitatibus','1972-11-19','aut'),(84,3,87,'aliquid','ab','2020-05-20','aut'),(85,33,26,'consequatur','voluptatem','2002-03-22','autem'),(86,68,87,'quo','ea','1999-01-15','voluptas'),(87,51,16,'harum','ipsa','2015-04-30','sapiente'),(88,29,20,'provident','molestiae','1993-08-26','commodi'),(89,7,19,'aut','eligendi','1976-06-06','ratione'),(90,51,45,'exercitationem','consequuntur','1986-05-01','voluptatem'),(91,91,26,'fugiat','aspernatur','1998-12-20','et'),(92,10,40,'expedita','aliquam','1992-04-29','non'),(93,37,46,'possimus','quasi','1987-04-17','et'),(94,64,21,'et','rerum','2010-05-07','dolorem'),(95,35,53,'corrupti','eveniet','1988-09-06','iste'),(96,81,88,'debitis','animi','1986-09-30','accusamus'),(97,21,94,'eum','provident','1970-06-04','laudantium'),(98,28,36,'maxime','impedit','2004-10-06','eos'),(99,85,31,'repudiandae','ratione','2008-03-29','rerum'),(100,23,17,'ipsam','ipsa','2016-02-16','aut');
/*!40000 ALTER TABLE `line_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `tournament_id` int NOT NULL,
  `stadium_id` int NOT NULL,
  `home_team_id` int NOT NULL,
  `guest_team_id` int NOT NULL,
  `date` date NOT NULL,
  `type` enum('MT','ET','P') NOT NULL COMMENT 'MT - main time (основное время), ET - Extra time (дополнительное время), P - penalty (пенальти)',
  `home_goal` int DEFAULT NULL,
  `guest_goal` int DEFAULT NULL,
  `penalty_home_goal` int DEFAULT NULL,
  `penalty_guest_goal` int DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  KEY `fk_match_tournament1_idx` (`tournament_id`),
  KEY `fk_match_stadium1_idx` (`stadium_id`),
  KEY `fk_match_team1_idx` (`home_team_id`),
  KEY `fk_match_team2_idx` (`guest_team_id`),
  CONSTRAINT `fk_match_stadium1` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`),
  CONSTRAINT `fk_match_team1` FOREIGN KEY (`home_team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `fk_match_team2` FOREIGN KEY (`guest_team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `fk_match_tournament1` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES (1,55,30,20,29,'1977-12-30','MT',1,10,15,12),(2,36,1,30,74,'1977-01-31','ET',2,11,18,20),(3,51,82,75,33,'1971-12-02','MT',3,8,15,16),(4,77,33,54,45,'1988-03-06','ET',8,6,1,12),(5,62,46,44,32,'2001-04-01','ET',9,3,15,20),(6,67,16,7,85,'1986-07-02','MT',3,1,5,15),(7,22,35,55,61,'2009-06-19','P',1,3,13,1),(8,80,89,54,35,'1975-11-27','MT',6,7,4,12),(9,18,74,63,54,'2005-05-04','MT',10,4,14,15),(10,74,93,27,25,'1984-04-16','MT',11,8,6,14),(11,75,1,58,51,'1975-09-17','ET',4,6,11,9),(12,34,11,95,95,'1983-05-26','ET',11,1,19,17),(13,57,39,26,24,'2016-07-15','ET',11,7,11,16),(14,54,32,8,75,'1971-01-06','ET',4,2,19,18),(15,67,63,36,47,'2008-05-17','MT',7,8,5,8),(16,51,89,81,69,'2019-02-21','P',7,8,4,15),(17,62,44,22,36,'2008-04-05','P',5,10,4,12),(18,36,48,61,10,'2011-06-15','ET',9,6,8,8),(19,49,18,61,82,'1998-04-15','MT',1,7,14,4),(20,29,56,76,85,'1982-09-03','ET',7,9,19,1),(21,95,2,8,48,'2001-06-24','ET',10,1,16,15),(22,34,16,23,100,'2000-12-06','P',8,6,1,13),(23,78,59,47,28,'2004-09-16','P',1,5,16,10),(24,47,27,96,9,'2003-07-28','ET',6,1,9,8),(25,70,17,45,6,'2018-12-05','ET',4,6,3,5),(26,65,6,15,14,'1989-12-08','MT',3,4,1,12),(27,23,76,95,52,'2010-12-18','ET',11,8,8,13),(28,32,71,36,26,'2021-05-15','ET',5,3,14,15),(29,72,44,74,6,'2009-04-29','MT',11,6,1,1),(30,59,96,6,36,'1989-03-02','P',1,10,13,15),(31,55,52,64,2,'2014-10-01','P',7,11,20,2),(32,78,60,10,47,'1983-10-25','MT',7,10,5,18),(33,76,55,52,41,'1973-03-07','P',5,5,11,15),(34,60,67,54,83,'2013-06-28','MT',7,6,7,15),(35,43,49,35,74,'2004-05-04','P',8,11,17,4),(36,19,70,99,91,'1985-11-13','P',11,2,17,15),(37,14,72,96,72,'1981-04-21','P',4,9,11,17),(38,68,1,8,22,'2008-03-27','P',4,3,16,17),(39,52,71,23,30,'1977-02-12','P',3,11,6,6),(40,30,33,77,6,'2021-01-29','ET',8,10,9,2),(41,88,28,47,48,'1985-06-16','MT',2,10,3,19),(42,95,100,31,37,'2000-03-10','P',8,8,3,3),(43,48,65,10,67,'1995-11-26','P',8,9,14,10),(44,35,9,57,48,'2021-02-26','MT',10,11,11,19),(45,81,53,20,48,'2012-02-01','MT',2,7,3,11),(46,54,27,70,6,'1984-11-11','ET',6,6,4,1),(47,98,93,35,28,'1982-05-16','ET',4,4,14,14),(48,25,11,34,13,'1984-08-05','MT',2,7,10,5),(49,39,81,60,34,'1993-03-19','MT',11,1,14,7),(50,80,90,70,28,'1975-06-11','MT',11,3,12,10),(51,55,80,95,89,'2004-04-12','MT',1,4,6,16),(52,89,52,37,69,'1977-12-07','ET',3,1,13,9),(53,4,56,17,57,'2004-05-09','MT',5,3,6,19),(54,83,86,62,81,'2013-12-29','MT',6,2,5,7),(55,78,97,9,3,'2013-08-09','MT',1,5,14,15),(56,7,43,15,46,'1970-05-02','P',8,6,1,5),(57,23,75,79,2,'1984-10-16','P',11,9,15,12),(58,65,49,30,19,'1977-04-05','ET',7,11,16,4),(59,29,24,8,17,'2001-09-04','MT',2,11,14,10),(60,76,44,86,79,'2002-01-11','ET',6,4,20,12),(61,99,2,36,82,'2018-02-14','P',4,3,15,6),(62,87,98,62,65,'1997-01-16','MT',7,6,13,6),(63,94,70,68,1,'1992-02-16','ET',3,9,9,6),(64,12,82,47,34,'1971-08-12','MT',10,11,13,18),(65,57,26,36,21,'1981-02-01','P',5,5,5,11),(66,74,66,40,2,'2014-09-13','ET',8,8,18,16),(67,90,47,19,65,'1972-12-13','P',2,6,15,5),(68,90,5,44,89,'1978-03-24','ET',3,7,10,3),(69,6,79,70,93,'1996-10-10','MT',3,5,4,17),(70,77,31,58,71,'1998-05-18','MT',10,9,15,4),(71,1,25,72,13,'2005-03-01','ET',10,11,19,16),(72,7,18,47,63,'1983-08-13','MT',11,11,16,13),(73,43,83,84,17,'1980-07-18','ET',8,9,1,9),(74,49,23,19,38,'1974-05-18','MT',4,9,10,16),(75,69,38,3,59,'1980-10-26','MT',11,9,5,18),(76,42,46,47,47,'1981-08-16','ET',5,3,7,16),(77,25,16,40,1,'1992-06-16','MT',4,10,18,15),(78,47,97,72,48,'1994-01-05','ET',11,7,16,16),(79,21,43,61,27,'1983-04-01','ET',3,11,10,3),(80,61,8,89,3,'1982-12-09','ET',6,10,15,19),(81,90,72,20,38,'2000-04-30','MT',6,2,19,20),(82,95,38,76,63,'1971-05-10','ET',9,10,9,3),(83,75,78,21,17,'1983-11-17','P',3,6,17,3),(84,24,67,63,48,'2011-07-04','MT',3,7,19,12),(85,83,2,49,30,'2013-03-18','ET',11,4,8,18),(86,98,20,77,19,'2005-02-22','MT',2,4,17,8),(87,63,37,45,23,'1989-02-21','ET',5,6,13,20),(88,44,34,26,34,'1994-02-24','ET',11,3,18,15),(89,6,45,72,100,'1978-08-16','ET',5,10,17,20),(90,83,48,63,58,'2009-10-19','P',2,7,2,20),(91,25,84,74,49,'1980-07-27','ET',7,3,12,10),(92,51,37,97,33,'1997-11-30','P',3,8,3,9),(93,38,45,62,36,'1989-04-23','MT',6,3,7,17),(94,65,39,54,28,'1987-08-24','MT',11,5,13,10),(95,76,99,50,19,'2008-10-24','MT',8,7,12,4),(96,32,76,53,38,'2007-06-06','P',5,3,1,4),(97,20,24,37,3,'1971-07-16','ET',1,4,1,8),(98,72,100,61,97,'2016-01-24','P',1,9,2,15),(99,83,34,45,33,'1987-08-21','ET',6,8,19,10),(100,71,41,66,9,'2005-03-10','P',10,6,7,2);
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_line_up`
--

DROP TABLE IF EXISTS `match_line_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_line_up` (
  `match_line_up_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `home_team_id` int NOT NULL,
  `guest_team_id` int NOT NULL,
  `position_id` int NOT NULL,
  `line_up_player_id` int NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'M,R' COMMENT 'M - main (выход в основном составе на матч), R - reserve (выход на замену в матче)',
  `minute_of_replacement` int DEFAULT '0',
  PRIMARY KEY (`match_line_up_id`),
  KEY `fk_match_line_up_position1_idx` (`position_id`),
  KEY `fk_match_line_up_line_up1_idx` (`line_up_player_id`),
  KEY `fk_match_line_up_match1_idx` (`match_id`),
  KEY `fk_match_line_up_match_home_idx` (`home_team_id`),
  KEY `fk_match_line_up_match_guest_idx` (`guest_team_id`),
  CONSTRAINT `fk_match_line_up_line_up1` FOREIGN KEY (`line_up_player_id`) REFERENCES `line_up` (`player_id`),
  CONSTRAINT `fk_match_line_up_match1` FOREIGN KEY (`match_id`) REFERENCES `match` (`match_id`),
  CONSTRAINT `fk_match_line_up_match_guest` FOREIGN KEY (`guest_team_id`) REFERENCES `match` (`guest_team_id`),
  CONSTRAINT `fk_match_line_up_match_home` FOREIGN KEY (`home_team_id`) REFERENCES `match` (`home_team_id`),
  CONSTRAINT `fk_match_line_up_position1` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_line_up`
--

LOCK TABLES `match_line_up` WRITE;
/*!40000 ALTER TABLE `match_line_up` DISABLE KEYS */;
INSERT INTO `match_line_up` VALUES (1,67,44,35,8,13,'M',82),(2,71,31,74,11,15,'R',82),(3,35,61,82,11,17,'R',58),(4,22,77,48,16,5,'M',39),(5,11,45,2,10,82,'M',89),(6,100,72,6,19,28,'R',39),(7,71,58,51,4,96,'M',92),(8,80,77,19,13,38,'M',17),(9,38,96,2,5,48,'R',57),(10,20,47,28,17,24,'R',48),(11,39,86,51,9,40,'M',33),(12,49,44,17,12,35,'R',11),(13,46,34,91,3,46,'R',65),(14,90,86,28,3,55,'R',61),(15,70,49,38,15,75,'M',26),(16,100,86,17,7,73,'M',83),(17,44,63,48,3,13,'M',26),(18,4,58,41,5,18,'R',9),(19,88,62,35,17,80,'M',59),(20,91,63,59,5,84,'M',40),(21,26,89,28,16,65,'M',33),(22,8,70,47,6,10,'M',82),(23,30,64,72,19,83,'R',28),(24,95,96,34,10,19,'R',14),(25,60,36,81,1,17,'R',9),(26,67,95,82,8,19,'M',20),(27,72,61,6,1,41,'M',73),(28,76,17,14,7,41,'M',48),(29,27,61,9,2,56,'M',71),(30,96,7,38,8,51,'M',87),(31,72,96,79,12,2,'M',9),(32,2,27,97,18,63,'M',56),(33,16,58,23,6,65,'M',90),(34,67,6,67,17,35,'R',52),(35,19,15,95,7,20,'M',49),(36,53,30,19,2,64,'R',88),(37,73,70,48,12,36,'M',37),(38,63,58,48,12,49,'R',77),(39,23,70,6,10,2,'R',14),(40,74,20,2,11,100,'M',96),(41,38,63,6,7,100,'M',52),(42,30,77,23,11,92,'M',3),(43,90,27,54,11,83,'M',25),(44,5,19,33,13,74,'R',13),(45,91,77,36,20,36,'R',8),(46,51,64,38,11,24,'M',78),(47,50,89,89,12,27,'M',59),(48,93,81,9,4,41,'M',13),(49,5,10,48,15,60,'M',62),(50,48,70,61,18,42,'M',43),(51,46,72,25,19,78,'M',76),(52,64,47,38,3,100,'M',17),(53,75,61,85,14,24,'M',23),(54,19,58,9,7,78,'M',4),(55,54,37,81,4,10,'R',24),(56,46,61,81,4,55,'R',77),(57,29,61,28,12,59,'M',79),(58,12,23,2,13,35,'M',85),(59,3,37,100,19,3,'M',60),(60,23,17,48,8,44,'R',92),(61,40,81,69,6,8,'R',6),(62,90,63,63,16,90,'M',69),(63,28,8,38,13,62,'M',2),(64,11,64,72,3,35,'M',61),(65,16,20,58,3,11,'R',66),(66,74,40,19,8,73,'M',89),(67,67,70,48,10,2,'R',53),(68,70,37,61,9,13,'M',32),(69,62,63,13,3,33,'M',90),(70,79,27,3,12,39,'R',22),(71,41,70,46,3,90,'M',68),(72,66,76,24,18,21,'R',57),(73,100,54,95,13,3,'M',69),(74,98,36,32,14,75,'M',61),(75,51,35,35,14,46,'M',86),(76,79,47,57,17,6,'R',59),(77,9,27,71,13,36,'M',86),(78,71,35,17,20,19,'R',89),(79,42,96,63,8,59,'M',17),(80,77,36,83,3,5,'M',93),(81,64,61,29,2,33,'M',33),(82,81,77,69,11,72,'M',18),(83,84,58,93,13,24,'M',20),(84,31,36,41,11,33,'R',9),(85,73,89,26,10,31,'M',80),(86,88,26,49,16,39,'M',37),(87,70,45,2,1,52,'M',1),(88,37,76,32,3,36,'M',3),(89,10,97,91,2,63,'R',71),(90,19,37,95,15,87,'R',41),(91,30,45,69,12,91,'M',67),(92,10,47,9,16,25,'M',52),(93,52,47,49,12,50,'R',65),(94,17,86,28,12,7,'R',73),(95,71,61,2,14,71,'M',82),(96,67,75,3,13,55,'M',39),(97,94,89,100,15,51,'M',87),(98,89,75,97,1,59,'M',51),(99,22,54,2,18,9,'R',32),(100,53,8,1,18,60,'R',37);
/*!40000 ALTER TABLE `match_line_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'voluptate'),(2,'amet'),(3,'et'),(4,'quisquam'),(5,'architecto'),(6,'sequi'),(7,'rerum'),(8,'error'),(9,'ipsam'),(10,'quidem'),(11,'modi'),(12,'odit'),(13,'totam'),(14,'tempora'),(15,'dicta'),(16,'nihil'),(17,'ullam'),(18,'placeat'),(19,'earum'),(20,'quasi');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referee` (
  `referee_id` int NOT NULL AUTO_INCREMENT,
  `sitizenship` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  PRIMARY KEY (`referee_id`),
  KEY `fk_referee_country1_idx` (`sitizenship`),
  CONSTRAINT `fk_referee_country1` FOREIGN KEY (`sitizenship`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee`
--

LOCK TABLES `referee` WRITE;
/*!40000 ALTER TABLE `referee` DISABLE KEYS */;
INSERT INTO `referee` VALUES (1,96,'voluptas','vel'),(2,4,'qui','et'),(3,97,'suscipit','provident'),(4,79,'ut','necessitatibus'),(5,10,'quo','velit'),(6,2,'omnis','qui'),(7,32,'ipsa','qui'),(8,97,'consequuntur','consequuntur'),(9,7,'ea','dolorem'),(10,24,'ut','et'),(11,36,'quis','est'),(12,96,'est','blanditiis'),(13,24,'et','voluptatem'),(14,74,'culpa','doloribus'),(15,44,'fugit','quas'),(16,47,'praesentium','qui'),(17,99,'ipsam','cum'),(18,50,'ratione','repudiandae'),(19,37,'maxime','blanditiis'),(20,77,'voluptatem','minima'),(21,61,'hic','est'),(22,51,'illum','voluptas'),(23,67,'voluptatem','minus'),(24,80,'laudantium','omnis'),(25,82,'commodi','temporibus'),(26,49,'est','error'),(27,99,'aliquam','doloremque'),(28,36,'quisquam','sit'),(29,71,'voluptates','assumenda'),(30,10,'sed','quisquam'),(31,22,'consectetur','odit'),(32,66,'ex','cupiditate'),(33,14,'ut','dolor'),(34,19,'vel','odit'),(35,45,'rerum','mollitia'),(36,24,'optio','error'),(37,21,'dolores','perferendis'),(38,76,'ullam','ut'),(39,21,'natus','eius'),(40,27,'reprehenderit','consequatur'),(41,100,'et','impedit'),(42,56,'dolorum','et'),(43,23,'omnis','est'),(44,24,'iusto','et'),(45,30,'reiciendis','assumenda'),(46,66,'explicabo','dolores'),(47,70,'reiciendis','rerum'),(48,28,'eaque','beatae'),(49,15,'illum','molestiae'),(50,7,'aut','magnam'),(51,5,'id','porro'),(52,76,'ut','voluptatem'),(53,57,'rerum','minima'),(54,71,'expedita','quos'),(55,56,'soluta','aperiam'),(56,39,'sed','iure'),(57,19,'sapiente','aspernatur'),(58,54,'voluptates','qui'),(59,74,'nihil','voluptatem'),(60,90,'eligendi','corrupti'),(61,64,'molestiae','veniam'),(62,96,'aut','dolorum'),(63,55,'magni','dolorem'),(64,77,'expedita','eum'),(65,14,'voluptas','sequi'),(66,100,'rerum','natus'),(67,100,'dignissimos','odio'),(68,34,'laborum','harum'),(69,76,'repellendus','animi'),(70,20,'aut','soluta'),(71,61,'omnis','similique'),(72,76,'quod','labore'),(73,76,'eligendi','eveniet'),(74,83,'omnis','dignissimos'),(75,99,'fuga','doloremque'),(76,5,'autem','aut'),(77,48,'provident','sequi'),(78,69,'quo','id'),(79,33,'quidem','maxime'),(80,63,'aspernatur','quaerat'),(81,75,'voluptas','quos'),(82,37,'voluptatum','ex'),(83,38,'est','architecto'),(84,32,'sapiente','rerum'),(85,7,'et','molestias'),(86,93,'voluptatum','illo'),(87,70,'nemo','ex'),(88,26,'et','quisquam'),(89,46,'et','et'),(90,44,'ullam','veritatis'),(91,15,'qui','quam'),(92,10,'ut','dolorem'),(93,39,'maiores','sed'),(94,70,'aut','officia'),(95,86,'velit','unde'),(96,53,'mollitia','beatae'),(97,70,'qui','commodi'),(98,86,'magnam','ullam'),(99,87,'qui','autem'),(100,45,'placeat','placeat');
/*!40000 ALTER TABLE `referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `stadium_id` int NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `capacity` int NOT NULL,
  `build_date` date DEFAULT NULL,
  `renovation_date` date DEFAULT NULL,
  PRIMARY KEY (`stadium_id`),
  KEY `fk_stadium_city1_idx` (`city_id`),
  CONSTRAINT `fk_stadium_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES (1,39,'illo',47683,'1988-10-22','2001-03-17'),(2,24,'cupiditate',20409,'1986-05-02','1995-01-12'),(3,90,'sint',46970,'2019-12-03','1975-01-25'),(4,12,'explicabo',28146,'1976-11-19','1982-03-28'),(5,64,'est',18280,'1984-04-20','1992-01-29'),(6,2,'rerum',24864,'2013-01-22','1979-10-11'),(7,4,'non',16196,'1982-06-17','2012-03-15'),(8,91,'quia',32462,'1971-04-25','2002-11-08'),(9,6,'hic',32231,'1996-12-09','1993-11-08'),(10,72,'quo',38234,'1983-01-25','1975-06-19'),(11,73,'facilis',42921,'2002-12-28','2008-02-07'),(12,15,'natus',32590,'1991-06-22','2012-07-01'),(13,15,'et',13171,'1994-04-04','1971-11-24'),(14,61,'placeat',22992,'2010-06-13','2021-11-09'),(15,68,'vel',22863,'1993-08-23','1989-06-05'),(16,7,'repudiandae',41657,'1976-05-04','1978-11-20'),(17,71,'vitae',20031,'1973-06-01','1987-08-28'),(18,71,'magni',47805,'2010-08-11','1970-04-27'),(19,85,'reiciendis',45154,'2006-09-23','2001-06-07'),(20,68,'velit',36196,'1986-10-08','1980-05-08'),(21,47,'ut',20644,'2006-02-10','1974-06-13'),(22,74,'delectus',33671,'2014-11-03','1994-03-06'),(23,15,'repellat',16782,'2007-06-08','1992-05-22'),(24,91,'aut',17004,'1981-04-26','1992-04-22'),(25,1,'ipsam',40500,'1993-08-11','1988-01-24'),(26,46,'impedit',23822,'2001-09-03','2014-05-02'),(27,65,'aspernatur',40523,'1996-11-30','1982-08-25'),(28,47,'totam',44622,'2012-03-19','1977-10-17'),(29,56,'nulla',29335,'1981-05-28','1984-01-30'),(30,59,'officia',41061,'1989-02-03','1982-08-23'),(31,3,'porro',12902,'2017-10-03','2005-08-06'),(32,95,'sed',14238,'1988-10-20','1972-08-22'),(33,83,'qui',38984,'1972-10-29','1986-10-19'),(34,92,'dicta',17648,'2013-05-19','2010-09-09'),(35,6,'sapiente',28225,'2006-06-27','1992-07-27'),(36,46,'soluta',21659,'2006-03-13','1988-01-19'),(37,94,'asperiores',45096,'1976-10-14','1975-03-14'),(38,9,'fugiat',14344,'1973-03-09','1983-02-24'),(39,36,'suscipit',39402,'1980-01-30','1980-07-12'),(40,100,'eos',46596,'2019-12-02','1977-12-02'),(41,80,'neque',25404,'1990-12-19','1985-09-02'),(42,9,'accusantium',29133,'2008-04-06','2009-10-20'),(43,14,'unde',36698,'2010-11-19','2015-09-13'),(44,94,'veritatis',28294,'1991-03-02','2019-10-12'),(45,70,'sunt',38253,'2004-10-19','1986-10-15'),(46,82,'ab',16904,'1989-01-24','1972-09-18'),(47,100,'architecto',24721,'1987-03-03','2008-03-06'),(48,41,'omnis',48958,'1989-06-23','1983-05-16'),(49,52,'enim',19086,'1993-12-26','2021-04-28'),(50,85,'quisquam',21173,'2013-03-19','2001-07-16'),(51,8,'nesciunt',37854,'1982-10-23','1995-07-18'),(52,99,'eum',23908,'1998-07-02','2012-09-12'),(53,59,'recusandae',40796,'1989-03-09','2017-11-20'),(54,23,'dolor',29138,'2012-02-22','1990-12-28'),(55,89,'consequatur',25073,'2007-07-03','1992-02-07'),(56,59,'distinctio',15545,'1989-02-07','1986-08-17'),(57,68,'repellendus',12504,'1970-01-25','1978-12-30'),(58,53,'sit',30616,'1997-12-22','1997-08-16'),(59,6,'voluptatibus',20380,'1971-01-30','1984-02-15'),(60,24,'accusamus',27361,'1973-02-24','2021-04-30'),(61,12,'officiis',47894,'1998-09-10','1986-06-11'),(62,8,'fugit',35265,'1985-09-21','2019-03-30'),(63,18,'ratione',32966,'2015-07-12','1979-03-28'),(64,94,'id',29981,'2016-04-23','2001-07-24'),(65,100,'ea',32911,'1998-08-14','2008-04-11'),(66,23,'culpa',23845,'1977-06-03','2010-11-07'),(67,39,'inventore',12932,'1974-08-01','2019-12-02'),(68,93,'a',25051,'1972-05-05','1988-09-01'),(69,32,'commodi',36939,'1970-05-20','2014-02-24'),(70,75,'molestiae',17279,'2020-08-14','2003-09-22'),(71,93,'ad',37116,'1994-05-23','2018-12-08'),(72,12,'debitis',18340,'2000-01-27','1993-09-02'),(73,84,'error',49597,'2016-10-24','2001-11-26'),(74,6,'rem',13790,'1997-11-20','2020-12-26'),(75,5,'saepe',18444,'2014-09-04','1978-08-12'),(76,53,'dolores',39889,'1997-05-09','1976-01-13'),(77,88,'nam',38718,'1974-04-13','1986-09-12'),(78,5,'voluptatem',42090,'1972-09-26','2020-11-25'),(79,93,'eveniet',24520,'1976-02-23','1989-11-03'),(80,40,'quibusdam',14063,'1971-01-01','2017-11-20'),(81,90,'esse',39960,'1999-04-20','1986-12-30'),(82,1,'harum',37944,'1994-08-21','1980-05-13'),(83,38,'aperiam',36606,'1998-08-14','1989-02-19'),(84,48,'modi',24742,'1982-12-23','1974-12-15'),(85,23,'earum',14674,'2008-02-19','1983-12-06'),(86,26,'voluptas',29756,'1979-04-01','2012-07-15'),(87,7,'quod',39796,'2018-01-06','1981-10-26'),(88,91,'dolore',30789,'2015-04-05','1986-06-12'),(89,79,'deserunt',20464,'1973-10-30','1981-01-03'),(90,12,'veniam',30781,'1972-04-11','2012-02-15'),(91,14,'autem',17389,'1983-01-29','2019-11-01'),(92,90,'alias',17152,'2002-09-10','1971-08-22'),(93,20,'reprehenderit',40365,'2001-01-06','2006-06-22'),(94,32,'doloremque',22258,'1971-04-21','2009-11-08'),(95,83,'perferendis',41010,'2018-12-10','2021-04-02'),(96,19,'doloribus',20132,'2004-01-31','1986-01-03'),(97,55,'possimus',20927,'2018-07-23','1980-08-01'),(98,22,'dignissimos',25959,'2015-10-30','2013-08-04'),(99,12,'libero',28600,'1981-01-27','2007-09-03'),(100,86,'adipisci',21346,'1989-04-22','1976-09-05');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `year_of_foundation` int DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `fk_team_country1_idx` (`country_id`),
  CONSTRAINT `fk_team_country1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,6,2001),(2,47,1996),(3,21,1981),(4,82,2004),(5,30,1973),(6,19,1975),(7,87,1976),(8,78,1988),(9,87,1980),(10,19,2006),(11,40,1982),(12,62,2000),(13,56,2013),(14,78,2019),(15,93,2005),(16,62,1972),(17,71,1993),(18,63,1973),(19,88,1992),(20,17,1987),(21,6,2012),(22,3,2007),(23,26,2015),(24,45,2005),(25,73,1979),(26,11,1995),(27,98,1980),(28,42,1996),(29,97,2015),(30,84,2015),(31,87,2010),(32,2,2006),(33,31,1972),(34,7,2012),(35,84,1985),(36,60,2014),(37,25,2009),(38,70,2014),(39,38,2011),(40,12,2015),(41,89,2014),(42,77,1996),(43,73,2000),(44,44,2012),(45,55,2006),(46,66,1992),(47,6,1993),(48,25,1997),(49,28,1975),(50,93,2017),(51,41,1971),(52,33,1990),(53,96,1976),(54,66,1997),(55,78,1979),(56,68,1994),(57,77,1991),(58,75,2009),(59,9,1978),(60,73,1995),(61,59,1989),(62,95,1990),(63,75,2013),(64,90,1984),(65,2,2016),(66,58,1988),(67,50,2017),(68,27,1972),(69,27,1991),(70,87,2013),(71,38,1999),(72,16,1986),(73,64,1986),(74,11,2003),(75,59,1987),(76,18,2013),(77,76,2000),(78,64,2010),(79,42,1975),(80,3,2013),(81,57,1976),(82,83,1972),(83,36,1978),(84,52,2013),(85,48,2007),(86,14,2020),(87,20,2004),(88,24,2005),(89,88,1996),(90,28,1991),(91,97,2019),(92,47,2016),(93,23,2011),(94,71,2016),(95,36,1999),(96,24,1989),(97,28,2017),(98,85,1990),(99,50,1972),(100,55,1975);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament` (
  `tournament_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`tournament_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament`
--

LOCK TABLES `tournament` WRITE;
/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
INSERT INTO `tournament` VALUES (1,'repellat'),(2,'sit'),(3,'molestiae'),(4,'officia'),(5,'sed'),(6,'voluptatem'),(7,'quia'),(8,'est'),(9,'natus'),(10,'sint'),(11,'et'),(12,'harum'),(13,'consequatur'),(14,'provident'),(15,'culpa'),(16,'neque'),(17,'aut'),(18,'id'),(19,'dignissimos'),(20,'ullam'),(21,'qui'),(22,'consectetur'),(23,'quis'),(24,'nemo'),(25,'aliquam'),(26,'inventore'),(27,'aliquid'),(28,'reiciendis'),(29,'tempore'),(30,'voluptas'),(31,'fuga'),(32,'sapiente'),(33,'voluptatum'),(34,'placeat'),(35,'dolore'),(36,'tempora'),(37,'voluptates'),(38,'non'),(39,'ab'),(40,'laudantium'),(41,'aspernatur'),(42,'tenetur'),(43,'recusandae'),(44,'ratione'),(45,'expedita'),(46,'ipsum'),(47,'porro'),(48,'veniam'),(49,'velit'),(50,'totam'),(51,'saepe'),(52,'omnis'),(53,'hic'),(54,'voluptatibus'),(55,'officiis'),(56,'quas'),(57,'at'),(58,'quam'),(59,'modi'),(60,'rem'),(61,'iste'),(62,'exercitationem'),(63,'nobis'),(64,'atque'),(65,'perspiciatis'),(66,'eos'),(67,'quod'),(68,'nulla'),(69,'commodi'),(70,'consequuntur'),(71,'quae'),(72,'architecto'),(73,'distinctio'),(74,'dolor'),(75,'esse'),(76,'vero'),(77,'maiores'),(78,'nostrum'),(79,'rerum'),(80,'sequi'),(81,'error'),(82,'ut'),(83,'ducimus'),(84,'odio'),(85,'incidunt'),(86,'debitis'),(87,'excepturi'),(88,'occaecati'),(89,'quo'),(90,'cum'),(91,'blanditiis'),(92,'eius'),(93,'asperiores'),(94,'sunt'),(95,'autem'),(96,'quibusdam'),(97,'labore'),(98,'ex'),(99,'aperiam'),(100,'praesentium');
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-28 18:23:53
