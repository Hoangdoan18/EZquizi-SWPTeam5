CREATE DATABASE  IF NOT EXISTS `swp391` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `swp391`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: swp391
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cateID` int NOT NULL,
  `cateName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`cateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Beginner'),(2,'Elementary'),(3,'Intermediate');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplechoice`
--

DROP TABLE IF EXISTS `multiplechoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiplechoice` (
  `username` varchar(30) NOT NULL,
  `subjectID` int NOT NULL,
  `questionID` int NOT NULL,
  `Learned` tinyint(1) NOT NULL,
  KEY `FK_110` (`username`),
  KEY `FK_120` (`questionID`),
  KEY `FK_140` (`subjectID`),
  CONSTRAINT `FK_110` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `FK_120` FOREIGN KEY (`questionID`) REFERENCES `subjectdetail` (`questionID`),
  CONSTRAINT `FK_140` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplechoice`
--

LOCK TABLES `multiplechoice` WRITE;
/*!40000 ALTER TABLE `multiplechoice` DISABLE KEYS */;
INSERT INTO `multiplechoice` VALUES ('bao',4,19,1),('bao',4,20,0),('bao',4,21,0),('bao',4,22,0),('bao',4,23,1),('bao',4,24,0),('bao',4,25,0),('bao',4,26,0),('bao',4,27,0),('bao',4,28,0);
/*!40000 ALTER TABLE `multiplechoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `username` varchar(30) NOT NULL,
  `subjectID` int NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  KEY `fkIdx_67` (`username`),
  KEY `fkIdx_70` (`subjectID`),
  CONSTRAINT `FK_65` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `FK_68` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES ('bao',3,5.0),('long',3,3.0),('bao',10,5.0),('bao',5,5.0),('bao',4,3.0),('long',4,4.0),('long',5,3.0),('long',8,2.0);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subjectID` int NOT NULL AUTO_INCREMENT,
  `subjectTitle` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cateID` int DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`subjectID`),
  KEY `FK_Subject_34` (`cateID`),
  KEY `fk_Subject` (`username`),
  CONSTRAINT `fk_Subject` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE,
  CONSTRAINT `FK_Subject_34` FOREIGN KEY (`cateID`) REFERENCES `category` (`cateID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (3,'English Vocabulary: IELTS',3,'bao','1231-01-02'),(4,'Science (Life Science)\r\n',1,'long','1231-01-02'),(5,'C',1,'bao','2021-09-29'),(6,'D',1,'bao','2012-01-02'),(8,'E',1,'long','1212-01-01'),(9,'F',1,'bao','2001-12-12'),(10,'G',1,'long','2001-01-01'),(11,'Y',1,'bao','2002-01-01'),(12,'AB',1,'bao','2001-01-12'),(13,'CA',1,'long','2002-01-01'),(14,'DC',1,'long','2002-02-02'),(15,'abc',2,'bao','2021-10-01'),(16,'Ielts',2,'bao','2021-10-01'),(17,'Toeic',2,'long','2021-10-01'),(18,'LUK3',2,'bao','2021-10-01'),(19,'Trans4',2,'long','2021-10-01'),(20,'Trans5',3,'bao','2021-10-01'),(21,'Trans6',3,'long','2021-10-01'),(22,'subject',1,'bao','2021-11-15'),(23,'subject',1,'bao','2021-11-15'),(26,'Game la de',2,'bao','2021-11-19'),(27,'Game la de',1,'bao','2021-11-19'),(28,'dummy',3,'bao','2021-11-20');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjectdetail`
--

DROP TABLE IF EXISTS `subjectdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjectdetail` (
  `questionID` int NOT NULL AUTO_INCREMENT,
  `subjectID` int NOT NULL,
  `term` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `definition` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`questionID`),
  KEY `fk_SubjectDetail` (`subjectID`),
  CONSTRAINT `fk_SubjectDetail` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectdetail`
--

LOCK TABLES `subjectdetail` WRITE;
/*!40000 ALTER TABLE `subjectdetail` DISABLE KEYS */;
INSERT INTO `subjectdetail` VALUES (1,3,'Down in the dumps','r???t bu???n, r???t ch??n n???n'),(6,3,'Be all ears','h??o h???ng mu???n nghe, d???ng tai l??n nghe'),(8,3,'It\'s been ages','???? r???t l??u r???i'),(10,3,'Cut to the chase','n??i th???ng v??o v???n ?????'),(11,3,'A blessing in disguise','trong c??i r???i c?? c??i may'),(12,3,'Actions speak louder than words','h??nh ?????ng quan tr???ng h??n l???i n??i'),(13,3,'Back to the drawing board','l??m l???i t??? ?????u'),(14,3,'Practice makes perfect','c?? c??ng m??i s???t c?? ng??y n??n kim'),(16,27,'frog','con ???ch'),(18,27,'frog','con ???ch'),(19,4,'Phonology','??m v??? h???c'),(20,4,'shift','s??? thay ?????i'),(21,4,'aesthetic','th???m m???'),(22,4,'migration','s??? di c??'),(23,4,'alternate','alternate'),(24,4,'concede','th???a nh???n'),(25,4,'bring about','th???a nh???n'),(26,4,'integrity','ch??nh tr???c'),(27,4,'loyalty','loyalty'),(28,4,'atmosphere','kh??ng kh??'),(29,5,'Phonology','??m v??? h???c'),(30,5,'shift','s??? thay ?????i'),(31,5,'aesthetic','th???m m???'),(32,5,'migration','s??? di c??'),(33,5,'alternate','alternate'),(34,5,'concede','th???a nh???n'),(35,5,'bring about','th???a nh???n'),(36,5,'integrity','ch??nh tr???c'),(37,5,'loyalty','loyalty'),(38,5,'atmosphere','kh??ng kh??'),(39,6,'Phonology','??m v??? h???c'),(40,6,'shift','s??? thay ?????i'),(41,6,'aesthetic','th???m m???'),(42,6,'migration','s??? di c??'),(43,6,'alternate','alternate'),(44,6,'concede','th???a nh???n'),(45,6,'bring about','th???a nh???n'),(46,6,'integrity','ch??nh tr???c'),(47,6,'loyalty','loyalty'),(48,6,'atmosphere','kh??ng kh??'),(49,8,'Phonology','??m v??? h???c'),(50,8,'shift','s??? thay ?????i'),(51,8,'aesthetic','th???m m???'),(52,8,'migration','s??? di c??'),(53,8,'alternate','alternate'),(54,8,'concede','th???a nh???n'),(55,8,'bring about','th???a nh???n'),(56,8,'integrity','ch??nh tr???c'),(57,8,'loyalty','loyalty'),(58,8,'atmosphere','kh??ng kh??'),(59,9,'Phonology','??m v??? h???c'),(60,9,'shift','s??? thay ?????i'),(61,9,'aesthetic','th???m m???'),(62,9,'migration','s??? di c??'),(63,9,'alternate','alternate'),(64,9,'concede','th???a nh???n'),(65,9,'bring about','th???a nh???n'),(66,9,'integrity','ch??nh tr???c'),(67,9,'loyalty','loyalty'),(68,9,'atmosphere','kh??ng kh??'),(69,10,'Phonology','??m v??? h???c'),(70,10,'shift','s??? thay ?????i'),(71,10,'aesthetic','th???m m???'),(72,10,'migration','s??? di c??'),(73,10,'alternate','alternate'),(74,10,'concede','th???a nh???n'),(75,10,'bring about','th???a nh???n'),(76,10,'integrity','ch??nh tr???c'),(77,10,'loyalty','loyalty'),(78,10,'atmosphere','kh??ng kh??'),(79,11,'Phonology','??m v??? h???c'),(80,11,'shift','s??? thay ?????i'),(81,11,'aesthetic','th???m m???'),(82,11,'migration','s??? di c??'),(83,11,'alternate','alternate'),(84,11,'concede','th???a nh???n'),(85,3,'Phonology','??m v??? h???c'),(86,3,'shift','s??? thay ?????i'),(87,3,'aesthetic','th???m m???'),(88,3,'migration','s??? di c??'),(89,3,'alternate','alternate'),(90,3,'concede','th???a nh???n'),(91,3,'bring about','th???a nh???n'),(92,3,'integrity','ch??nh tr???c'),(93,3,'loyalty','loyalty'),(94,3,'atmosphere','kh??ng kh??'),(95,28,'cat','con m??o'),(96,28,'frog','con ???ch');
/*!40000 ALTER TABLE `subjectdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribe` (
  `username` varchar(30) NOT NULL,
  `subjectID` int NOT NULL,
  KEY `fkIdx_73` (`username`),
  KEY `fkIdx_76` (`subjectID`),
  CONSTRAINT `fk_subcribe_1` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE CASCADE,
  CONSTRAINT `fk_subcribe_2` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe`
--

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
INSERT INTO `subscribe` VALUES ('bao',3),('bao',3),('bao',4),('bao',5),('bao',8),('bao',6),('bao',9),('bao',12),('long',4),('long',5),('long',8);
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `TestID` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `subjectID` int NOT NULL,
  PRIMARY KEY (`TestID`),
  KEY `fkIdx_126` (`username`),
  KEY `fkIdx_129` (`subjectID`),
  CONSTRAINT `FK_124` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `FK_127` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`),
  CONSTRAINT `FK_200` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`),
  CONSTRAINT `FK_201` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testsummary`
--

DROP TABLE IF EXISTS `testsummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testsummary` (
  `TestID` int NOT NULL,
  `questionID` int NOT NULL,
  `TestCheck` varchar(50) DEFAULT NULL,
  `TestResult` tinyint(1) NOT NULL,
  KEY `fkIdx_132` (`questionID`),
  KEY `FK_202` (`TestID`),
  CONSTRAINT `FK_130` FOREIGN KEY (`questionID`) REFERENCES `subjectdetail` (`questionID`),
  CONSTRAINT `FK_202` FOREIGN KEY (`TestID`) REFERENCES `test` (`TestID`),
  CONSTRAINT `FK_203` FOREIGN KEY (`questionID`) REFERENCES `subjectdetail` (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testsummary`
--

LOCK TABLES `testsummary` WRITE;
/*!40000 ALTER TABLE `testsummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `testsummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(30) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `active` int NOT NULL,
  `admin` int NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('bao','1','bao@gmail.com','Duc Bao',20,'123446234',1,1),('bao1','1','b@gmail.com','B???o',20,'12345678',1,0),('hoang','123456','hoang@gmail.com','Hoang18',18,'',1,0),('long','1','long@gmail.com','Duc Long',12,'123456789',1,1),('mra','1','vuducbao.2000@gmail.com','V?? ?????c B???o',21,'0869631128',1,0);
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

-- Dump completed on 2021-11-20 16:11:45
