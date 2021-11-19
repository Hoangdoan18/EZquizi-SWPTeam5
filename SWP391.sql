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
INSERT INTO `rating` VALUES ('bao',3,5.0),('long',3,3.0);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (3,'English Vocabulary: IELTS',3,'bao','1231-01-02'),(4,'Science (Life Science)\r\n',1,'long','1231-01-02'),(5,'C',1,'bao','2021-09-29'),(6,'D',1,'bao','2012-01-02'),(8,'E',1,'long','1212-01-01'),(9,'F',1,'bao','2001-12-12'),(10,'G',1,'long','2001-01-01'),(11,'Y',1,'bao','2002-01-01'),(12,'AB',1,'bao','2001-01-12'),(13,'CA',1,'long','2002-01-01'),(14,'DC',1,'long','2002-02-02'),(15,'abc',2,'bao','2021-10-01'),(16,'Ielts',2,'bao','2021-10-01'),(17,'Toeic',2,'long','2021-10-01'),(18,'LUK3',2,'bao','2021-10-01'),(19,'Trans4',2,'long','2021-10-01'),(20,'Trans5',3,'bao','2021-10-01'),(21,'Trans6',3,'long','2021-10-01'),(22,'subject',1,'bao','2021-11-15'),(23,'subject',1,'bao','2021-11-15'),(26,'Game la de',2,'bao','2021-11-19');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjectdetail`
--

LOCK TABLES `subjectdetail` WRITE;
/*!40000 ALTER TABLE `subjectdetail` DISABLE KEYS */;
INSERT INTO `subjectdetail` VALUES (1,3,'Down in the dumps','rất buồn, rất chán nản'),(6,3,'Be all ears','hào hứng muốn nghe, dỏng tai lên nghe'),(8,3,'It\'s been ages','đã rất lâu rồi'),(10,3,'Cut to the chase','nói thẳng vào vấn đề'),(11,3,'A blessing in disguise','trong cái rủi có cái may'),(12,3,'Actions speak louder than words','hành động quan trọng hơn lời nói'),(13,3,'Back to the drawing board','làm lại từ đầu'),(14,3,'Practice makes perfect','có công mài sắt có ngày nên kim');
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
INSERT INTO `users` VALUES ('bao','1','bao@gmail.com','Duc Bao',19,'1234',1,1),('bao1','1','b@gmail.com','Bao',21,'123456789',1,0),('hoang','123456','hoang@gmail.com','Hoang18',18,'',1,0),('long','1','long@gmail.com','Duc Long',18,'123456789',1,1),('mra','1','vuducbao.2000@gmail.com','Vũ Đức Bảo',21,'0869631128',1,0);
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

-- Dump completed on 2021-11-19 20:20:56
