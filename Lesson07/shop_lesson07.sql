CREATE DATABASE  IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
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
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`(10))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'Процессоры'),(2,'Материнские платы'),(3,'Видеокарты'),(4,'Жесткие диски'),(5,'Оперативная память');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`),
  KEY `index_of_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1,1,0.29762,'1973-12-30 13:44:05','2002-04-14 19:05:09','1976-02-14 11:53:45','1983-05-21 05:36:01'),(2,2,2,0.1452,'2012-09-28 18:09:35','1974-08-04 15:18:12','1973-05-04 00:40:33','1985-02-26 10:09:15'),(3,3,3,0,'2018-08-11 21:51:08','1987-08-24 08:35:54','1978-12-18 07:22:25','2015-05-07 07:39:53'),(4,4,4,0.537393,'1993-01-23 07:06:40','2006-03-11 06:55:04','1979-12-24 19:28:55','2021-12-17 22:06:42'),(5,5,5,0.495,'2007-07-08 03:19:28','2008-11-01 05:07:45','2011-09-18 04:23:29','2019-12-02 11:28:58'),(6,6,6,0.2296,'2017-07-09 06:46:06','1984-11-27 10:10:06','1977-06-08 14:25:07','1987-04-02 11:25:16'),(7,1,7,0.66,'1992-11-23 02:39:22','1970-05-07 13:21:19','1990-06-13 14:36:30','2000-04-01 04:06:03'),(8,2,1,0.7,'2006-05-17 09:52:11','1974-09-13 15:04:48','1984-01-12 16:40:02','2003-02-05 23:36:24'),(9,3,2,0,'1989-03-24 10:38:31','1980-01-14 00:18:56','2012-09-15 16:55:56','1996-11-08 15:53:26'),(10,4,3,0.0025,'2017-05-12 11:44:49','1999-10-24 21:00:54','1987-07-01 00:37:51','2010-09-03 06:24:10'),(11,5,4,0.782556,'2008-01-05 02:20:06','2011-08-02 01:19:44','2011-05-24 04:46:48','1992-05-16 07:10:41'),(12,6,5,0.5,'1981-12-12 18:32:39','2011-06-28 04:09:11','1994-05-20 10:07:52','1987-08-24 17:09:33'),(13,1,6,0.256538,'1986-06-06 15:28:32','1992-06-09 22:43:44','1973-05-15 18:30:45','2000-08-23 12:49:16'),(14,2,7,0.91,'2017-12-14 00:59:54','2018-01-23 19:56:32','1977-07-22 04:37:08','1971-05-30 17:57:30'),(15,3,1,0.75,'2009-06-19 01:57:24','2021-01-18 19:27:11','2012-03-15 22:34:39','2006-11-09 14:44:12'),(16,4,2,0.853727,'2003-11-18 23:58:59','2015-09-07 00:50:44','2008-06-09 09:38:53','2002-03-30 10:07:08'),(17,5,3,0.519364,'1987-08-13 12:13:08','1977-09-01 23:29:17','1994-10-28 12:37:44','2017-04-03 02:06:59'),(18,6,4,0.0548155,'1975-04-26 05:58:55','2007-05-17 03:39:27','1970-05-14 06:11:31','1994-09-10 14:12:36'),(19,1,5,0,'2020-01-11 00:17:56','1987-05-26 23:30:30','1999-04-07 03:22:12','1979-04-28 16:26:11'),(20,2,6,0.14724,'2016-02-19 01:42:26','2000-12-27 00:42:41','1986-10-02 22:41:32','1983-06-14 14:51:58');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_of_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2003-10-09 03:31:42','1979-10-17 04:29:19'),(2,2,'2008-06-04 09:41:46','1986-05-08 00:14:35'),(3,3,'1976-10-25 04:55:33','2003-02-06 02:39:25'),(4,4,'1977-08-23 16:10:51','1986-03-27 16:37:44'),(5,4,'1977-05-24 10:53:32','2021-12-24 16:47:29'),(6,6,'1988-01-08 16:46:34','2009-06-25 22:52:17'),(7,1,'2010-03-24 15:57:25','2014-07-25 18:36:09'),(8,2,'2000-08-07 23:57:25','1989-07-05 19:54:41'),(9,3,'1983-10-26 00:41:17','1981-07-24 17:58:04'),(10,4,'1988-07-24 05:43:18','1987-03-07 21:24:32'),(11,1,'2013-10-03 05:39:09','2021-12-24 16:47:29'),(12,6,'1977-01-17 19:30:49','2006-11-10 06:20:11'),(13,1,'2016-06-29 13:45:07','2006-06-09 12:01:59'),(14,2,'1980-07-27 13:10:40','2021-08-15 16:01:09'),(15,3,'1981-10-19 07:37:46','1989-11-09 22:11:35'),(16,4,'2009-04-10 19:31:06','2010-04-01 23:59:20'),(17,2,'1998-10-01 17:45:25','2021-12-24 16:47:29'),(18,6,'1987-04-28 02:31:36','1998-10-15 23:32:37'),(19,1,'2000-12-06 13:57:42','2007-12-11 20:16:53'),(20,2,'1979-05-18 04:00:38','1999-03-25 13:58:25');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `total` int unsigned DEFAULT '1' COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Состав заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_products`
--

LOCK TABLES `orders_products` WRITE;
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` VALUES (1,1,1,6,'1999-03-22 22:31:57','1987-03-08 02:33:56'),(2,2,2,7,'1977-08-22 02:18:08','2008-11-10 06:37:53'),(3,3,3,7,'1999-04-09 18:15:26','2019-08-08 22:46:27'),(4,4,4,3,'1983-05-06 06:12:33','1977-08-01 12:17:48'),(5,5,5,4,'1990-09-12 02:44:08','1980-11-30 15:32:12'),(6,6,6,5,'2020-01-07 17:29:41','2021-05-08 01:11:19'),(7,7,7,5,'1999-12-16 09:27:28','1991-03-09 06:14:57'),(8,8,1,6,'1996-10-05 17:03:47','1991-06-09 21:48:24'),(9,9,2,7,'1988-06-20 14:55:45','2008-06-17 19:20:22'),(10,10,3,1,'1999-10-09 12:33:15','2012-07-05 16:09:14'),(11,11,4,5,'1986-11-30 03:54:56','1994-03-13 15:27:36'),(12,12,5,4,'1976-10-19 08:27:11','1981-02-16 04:16:49'),(13,13,6,4,'1980-03-14 14:15:25','1992-01-15 20:05:09'),(14,14,7,7,'1974-04-21 05:25:46','2016-07-29 02:57:45'),(15,15,1,3,'1981-04-11 03:19:40','2011-05-10 19:45:48'),(16,16,2,1,'1991-03-20 20:30:00','1972-06-12 09:38:39'),(17,17,3,4,'1973-05-19 12:17:04','1977-10-29 13:27:39'),(18,18,4,6,'1986-08-17 04:45:16','2021-03-18 11:18:30'),(19,19,5,5,'2009-10-18 15:15:43','1981-03-01 15:56:50'),(20,20,6,4,'1999-12-17 19:10:51','1984-08-14 00:12:34');
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_of_catalog_id` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Intel Core i3-8100','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',7890.00,1,'2021-12-24 13:41:38','2021-12-24 13:41:38'),(2,'Intel Core i5-7400','Процессор для настольных персональных компьютеров, основанных на платформе Intel.',12700.00,1,'2021-12-24 13:41:38','2021-12-24 13:41:38'),(3,'AMD FX-8320E','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',4780.00,1,'2021-12-24 13:41:38','2021-12-24 13:41:38'),(4,'AMD FX-8320','Процессор для настольных персональных компьютеров, основанных на платформе AMD.',7120.00,1,'2021-12-24 13:41:38','2021-12-24 13:41:38'),(5,'ASUS ROG MAXIMUS X HERO','Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',19310.00,2,'2021-12-24 13:41:38','2021-12-24 13:41:38'),(6,'Gigabyte H310M S2H','Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',4790.00,2,'2021-12-24 13:41:38','2021-12-24 13:41:38'),(7,'MSI B250M GAMING PRO','Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',5060.00,2,'2021-12-24 13:41:38','2021-12-24 13:41:38');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubrics`
--

DROP TABLE IF EXISTS `rubrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubrics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrics`
--

LOCK TABLES `rubrics` WRITE;
/*!40000 ALTER TABLE `rubrics` DISABLE KEYS */;
INSERT INTO `rubrics` VALUES (1,'Видеокарты'),(2,'Память');
/*!40000 ALTER TABLE `rubrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Склады';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
INSERT INTO `storehouses` VALUES (1,'veniam','1995-10-20 07:34:12','2021-12-08 11:40:02'),(2,'sapiente','2002-11-07 06:59:16','2004-10-05 20:26:05'),(3,'iste','2002-06-17 23:51:11','1982-09-15 22:07:10'),(4,'omnis','2003-04-14 07:02:59','1976-04-15 11:54:29'),(5,'omnis','2017-02-03 06:02:24','1994-03-08 18:43:34'),(6,'libero','1992-01-28 23:32:56','2003-01-08 06:28:34'),(7,'dolorum','1970-12-09 13:02:35','2014-04-02 01:21:47'),(8,'dicta','2017-06-16 01:49:40','2007-07-07 23:55:28'),(9,'ab','1988-08-20 11:47:49','1981-06-22 02:33:34'),(10,'quia','1998-06-18 07:05:58','1970-11-21 11:08:41'),(11,'neque','1989-11-13 12:19:35','1991-07-21 01:04:02'),(12,'vitae','2005-05-25 07:21:32','2019-10-03 21:00:55'),(13,'consequatur','1983-06-17 04:08:55','1978-08-13 21:53:45'),(14,'eum','1986-01-04 05:00:45','2019-05-12 06:20:56'),(15,'et','2002-12-05 16:30:43','1990-05-23 10:50:17'),(16,'corrupti','2001-01-13 03:11:45','2020-08-22 05:54:00'),(17,'dicta','2002-10-30 11:39:32','1983-05-16 07:15:02'),(18,'consequuntur','1995-11-30 00:54:46','2021-09-29 23:11:42'),(19,'natus','2002-11-21 19:11:16','2004-08-01 21:30:59'),(20,'placeat','1985-12-28 16:47:46','1984-07-07 11:39:50');
/*!40000 ALTER TABLE `storehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storehouses_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `value` int unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,1,1,51,'2020-08-04 00:13:02','1994-04-30 00:18:21'),(2,2,2,218,'2017-11-04 20:54:46','2012-08-12 04:13:17'),(3,3,3,235,'2011-08-06 07:31:02','1984-10-25 06:44:50'),(4,4,4,289,'1972-04-18 01:26:50','1971-02-08 23:00:41'),(5,5,5,292,'2021-06-15 02:07:31','2004-07-01 08:38:02'),(6,6,6,16,'1988-11-10 02:41:52','1992-10-30 03:15:17'),(7,7,7,246,'2010-08-17 00:22:27','1975-11-10 16:08:56'),(8,8,1,227,'2004-12-30 08:48:19','1987-12-26 18:07:57'),(9,9,2,133,'2010-02-19 12:30:32','1979-03-27 09:03:03'),(10,10,3,10,'1980-01-05 04:39:20','2003-03-30 20:58:07'),(11,11,4,126,'2015-04-02 00:15:43','2020-04-26 07:47:05'),(12,12,5,187,'1978-04-17 13:33:40','2008-08-24 15:49:08'),(13,13,6,100,'2017-06-17 11:06:43','2003-08-22 16:13:20'),(14,14,7,229,'2016-01-16 10:16:10','2017-07-04 23:43:48'),(15,15,1,283,'1990-03-27 12:43:25','1976-08-24 02:49:08'),(16,16,2,35,'2013-03-31 23:30:11','2015-11-01 12:55:58'),(17,17,3,72,'1990-07-04 01:05:16','2012-02-02 16:41:38'),(18,18,4,229,'2013-01-02 10:26:54','2019-03-15 01:36:43'),(19,19,5,83,'1998-06-28 02:00:26','1992-02-08 03:36:11'),(20,20,6,80,'1979-08-12 22:21:44','2009-09-16 00:19:31');
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя покупателя',
  `birthday_at` date DEFAULT NULL COMMENT 'Дата рождения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Покупатели';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Геннадий','1990-10-05','2021-12-24 13:41:38','2021-12-24 13:41:38'),(2,'Наталья','1984-11-12','2021-12-24 13:41:38','2021-12-24 13:41:38'),(3,'Александр','1985-05-20','2021-12-24 13:41:38','2021-12-24 13:41:38'),(4,'Сергей','1988-02-14','2021-12-24 13:41:38','2021-12-24 13:41:38'),(5,'Иван','1998-01-12','2021-12-24 13:41:38','2021-12-24 13:41:38'),(6,'Мария','1992-08-29','2021-12-24 13:41:38','2021-12-24 13:41:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-24 17:00:34
