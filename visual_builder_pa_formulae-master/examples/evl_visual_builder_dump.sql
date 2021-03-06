-- MySQL dump 10.13  Distrib 5.7.19, for Win32 (AMD64)
--
-- Host: localhost    Database: evl_visual_builder
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `context`
--

DROP TABLE IF EXISTS `context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `context` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context`
--

LOCK TABLES `context` WRITE;
/*!40000 ALTER TABLE `context` DISABLE KEYS */;
INSERT INTO `context` VALUES (1,'Operation'),(2,'Message'),(3,'Component'),(4,'Classifier'),(5,'Node');
/*!40000 ALTER TABLE `context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `do`
--

DROP TABLE IF EXISTS `do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `do` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `body` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `do`
--

LOCK TABLES `do` WRITE;
/*!40000 ALTER TABLE `do` DISABLE KEYS */;
INSERT INTO `do` VALUES (1,'moveToNewOwnerDeployedOnNewNode','body'),(2,'moveToNewOwnerDeployedOnNearLessUsedNode','body'),(3,'moveToLessCriticalOwner','body'),(4,'decomposition','body'),(5,'moveToNewComponentDeployedOnNewNode','body'),(6,'moveToNewComponentDeployedOnNearLessUsedNode','body'),(7,'redeployOnNearLessUsedNode','body'),(8,'moveToLessCriticalComponent','body');
/*!40000 ALTER TABLE `do` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `do_context`
--

DROP TABLE IF EXISTS `do_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `do_context` (
  `do_id` int(11) NOT NULL,
  `context_id` int(11) NOT NULL,
  PRIMARY KEY (`do_id`,`context_id`),
  KEY `context_id` (`context_id`),
  CONSTRAINT `do_context_ibfk_1` FOREIGN KEY (`do_id`) REFERENCES `do` (`id`),
  CONSTRAINT `do_context_ibfk_2` FOREIGN KEY (`context_id`) REFERENCES `context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `do_context`
--

LOCK TABLES `do_context` WRITE;
/*!40000 ALTER TABLE `do_context` DISABLE KEYS */;
INSERT INTO `do_context` VALUES (1,1),(2,1),(3,1),(4,1),(7,1),(5,3),(6,3),(7,3),(8,3),(5,5),(6,5),(7,5),(8,5);
/*!40000 ALTER TABLE `do_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f`
--

DROP TABLE IF EXISTS `f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `return_bool` tinyint(1) DEFAULT NULL,
  `isUnary` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f`
--

LOCK TABLES `f` WRITE;
/*!40000 ALTER TABLE `f` DISABLE KEYS */;
INSERT INTO `f` VALUES (1,'F_probExec',1,1),(2,'F_resDemand',0,1),(3,'F_T',0,1),(4,'F_maxQL',0,1),(5,'F_maxHwUtil',0,1),(6,'F_RT',0,1);
/*!40000 ALTER TABLE `f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_context`
--

DROP TABLE IF EXISTS `f_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_context` (
  `f_id` int(11) NOT NULL,
  `context_id` int(11) NOT NULL,
  `f_body` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`f_id`,`context_id`),
  KEY `context_id` (`context_id`),
  CONSTRAINT `f_context_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `f` (`id`),
  CONSTRAINT `f_context_ibfk_2` FOREIGN KEY (`context_id`) REFERENCES `context` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_context`
--

LOCK TABLES `f_context` WRITE;
/*!40000 ALTER TABLE `f_context` DISABLE KEYS */;
INSERT INTO `f_context` VALUES (1,1,'body'),(1,3,'body'),(2,1,'body'),(2,3,'body'),(3,1,'body'),(4,5,'body'),(5,1,'body'),(5,5,'body'),(6,3,'body');
/*!40000 ALTER TABLE `f_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_f`
--

DROP TABLE IF EXISTS `f_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_f` (
  `f_id` int(11) NOT NULL,
  `f_id_to_compare` int(11) NOT NULL,
  PRIMARY KEY (`f_id`,`f_id_to_compare`),
  KEY `f_id_to_compare` (`f_id_to_compare`),
  CONSTRAINT `f_f_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `f` (`id`),
  CONSTRAINT `f_f_ibfk_2` FOREIGN KEY (`f_id_to_compare`) REFERENCES `f` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_f`
--

LOCK TABLES `f_f` WRITE;
/*!40000 ALTER TABLE `f_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `f_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_thresholds`
--

DROP TABLE IF EXISTS `f_thresholds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_thresholds` (
  `f_id` int(11) NOT NULL,
  `thresholds_id` int(11) NOT NULL,
  PRIMARY KEY (`f_id`,`thresholds_id`),
  KEY `thresholds_id` (`thresholds_id`),
  CONSTRAINT `f_thresholds_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `f` (`id`),
  CONSTRAINT `f_thresholds_ibfk_2` FOREIGN KEY (`thresholds_id`) REFERENCES `thresholds` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_thresholds`
--

LOCK TABLES `f_thresholds` WRITE;
/*!40000 ALTER TABLE `f_thresholds` DISABLE KEYS */;
INSERT INTO `f_thresholds` VALUES (4,1),(5,2),(2,3),(2,4),(3,5),(6,6);
/*!40000 ALTER TABLE `f_thresholds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thresholds`
--

DROP TABLE IF EXISTS `thresholds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thresholds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thresholds`
--

LOCK TABLES `thresholds` WRITE;
/*!40000 ALTER TABLE `thresholds` DISABLE KEYS */;
INSERT INTO `thresholds` VALUES (1,'th_maxQL',12.5),(2,'th_maxHwUtil',12.5),(3,'th_maxResDemand',12.5),(4,'th_minResDemand',12.5),(5,'th_SthReq',12.5),(6,'th_SrtReq',12.5);
/*!40000 ALTER TABLE `thresholds` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-01 19:47:47
