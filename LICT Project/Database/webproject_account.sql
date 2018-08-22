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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `User_reg` varchar(45) NOT NULL,
  `Email_id` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_pass` varchar(45) NOT NULL,
  `user_photo` varchar(100) NOT NULL,
  PRIMARY KEY (`User_reg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('10000','test1','test1','test1','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331001','adnan@gmail.com','adnan','Md. Adnan Hossain','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331002','limon@sust.com','limon','Limon Mia','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331006','palak@gmail.com','palak','Palak','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331011','razzak@rana','razzak','razzak','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331012','ahsan@gmail.com','ahsan','Ahsan','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331014','ragib@gmail.com','ragib','ragib','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331016','K2@ppp','K2','K2','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331018','saif@gmail.com','Md. Saiful Islam Bhuiyan','saif','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331046','nadir@gmail.com','nadir','Nadir','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331061','Imtiaz@gmail.com','Imtiaz','Imtiaz','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331090','razzakrana@gmail.com','razzak','Abdur Razzak','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2013331111','razzak@gmail.com','razzak','razzak','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('2132','sdvsdv','vsdbs','dfasf','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('21324','sdasd','saddasd','dsasfasf','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('235235235','adasg','gagaga','wrw4543','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('24235','vsvsb','bsfbsfb','advsdf','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('3242','asfaef','fasfasf','dfsdf','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('34','AlfredSchmidt@gmail.com','Frankfurt','dfwef','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('342352','gsdsg','adfdffa','asfadf','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('4234','vcwsw','sdvdv','dsv','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('4543535','bdsfbdsbd','4363sfgsfg','dvsfbsfbs','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('5123','hbjhb','kjnjn','kjbj','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('515645','jnkjnj','kjnjn','jhbhb','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('53153','kjnjkn','kjnjn','klnkn','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg'),('654321321','vcwsw','asdva','dsv','D:/Study/4-1/Web Engineering Lab/WebContent/Img/2013331046.jpg');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-27 23:29:17
