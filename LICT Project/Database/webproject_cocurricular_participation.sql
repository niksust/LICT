-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: webproject
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `cocurricular_participation`
--

DROP TABLE IF EXISTS `cocurricular_participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cocurricular_participation` (
  `Cocurricular_id` int(11) NOT NULL AUTO_INCREMENT,
  `CoCurricularParticipation` varchar(45) DEFAULT NULL,
  `CoCurricular_Achievement` varchar(45) DEFAULT NULL,
  `CoCurricular_Sports` varchar(45) DEFAULT NULL,
  `CoCurricular_Cultural` varchar(45) DEFAULT NULL,
  `CoCurricular_Organizational` varchar(45) DEFAULT NULL,
  `User_reg` varchar(45) NOT NULL,
  PRIMARY KEY (`Cocurricular_id`),
  UNIQUE KEY `User_reg_UNIQUE` (`User_reg`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocurricular_participation`
--

LOCK TABLES `cocurricular_participation` WRITE;
/*!40000 ALTER TABLE `cocurricular_participation` DISABLE KEYS */;
INSERT INTO `cocurricular_participation` VALUES (1,'Cycling','100km','Cricket','Shortfilm','SSA','2013331018'),(2,'ACM','world','Cricket','dance','SSA','2013331061'),(3,'','dfsf','','wefw','vsv','2013331111'),(5,'','Runnerup','Football,','Movie','Sport','2013331012'),(6,'adsad','das','ergerg','geer','rgerg','2013331046');
/*!40000 ALTER TABLE `cocurricular_participation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-27 23:29:18
