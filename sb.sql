-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: sb
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `保养类别`
--

DROP TABLE IF EXISTS `保养类别`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养类别` (
  `设备类型` varchar(10) NOT NULL,
  `保养类型` varchar(10) NOT NULL,
  PRIMARY KEY (`设备类型`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养类别`
--

LOCK TABLES `保养类别` WRITE;
/*!40000 ALTER TABLE `保养类别` DISABLE KEYS */;
INSERT INTO `保养类别` VALUES ('6000V及以上电机','年检'),('上位机','月检'),('浓缩机','季检'),('装车定量秤','周检');
/*!40000 ALTER TABLE `保养类别` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `保养项目`
--

DROP TABLE IF EXISTS `保养项目`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `保养项目` (
  `设备类型` varchar(10) NOT NULL,
  `保养项目` varchar(100) NOT NULL,
  PRIMARY KEY (`设备类型`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `保养项目`
--

LOCK TABLES `保养项目` WRITE;
/*!40000 ALTER TABLE `保养项目` DISABLE KEYS */;
/*!40000 ALTER TABLE `保养项目` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `检修信息`
--

DROP TABLE IF EXISTS `检修信息`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `检修信息` (
  `设备编号` varchar(10) NOT NULL,
  `检修编号` varchar(10) NOT NULL,
  `检修时间` date NOT NULL,
  `下次检修时间` date NOT NULL,
  `检修状态` varchar(10) NOT NULL,
  `检修人员` varchar(10) NOT NULL,
  PRIMARY KEY (`检修编号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `检修信息`
--

LOCK TABLES `检修信息` WRITE;
/*!40000 ALTER TABLE `检修信息` DISABLE KEYS */;
INSERT INTO `检修信息` VALUES ('A01','001','2016-01-01','2016-01-08','正常','张三'),('B01','002','2016-01-01','2016-02-01','正常','张三'),('C01','003','2016-01-01','2016-07-01','故障','张三'),('D01','004','2016-01-01','2017-01-01','故障','张三'),('E01','005','2016-09-15','2016-10-15','正常','张三');
/*!40000 ALTER TABLE `检修信息` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `设备信息`
--

DROP TABLE IF EXISTS `设备信息`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `设备信息` (
  `设备编号` varchar(10) NOT NULL,
  `设备类型` varchar(10) NOT NULL,
  PRIMARY KEY (`设备编号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `设备信息`
--

LOCK TABLES `设备信息` WRITE;
/*!40000 ALTER TABLE `设备信息` DISABLE KEYS */;
INSERT INTO `设备信息` VALUES ('A01','装车定量秤'),('B01','上位机'),('C01','浓缩机'),('D01','6000V及以上电机'),('E01','采样机');
/*!40000 ALTER TABLE `设备信息` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `设备维修`
--

DROP TABLE IF EXISTS `设备维修`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `设备维修` (
  `检修编号` varchar(10) NOT NULL,
  `维修编号` varchar(10) NOT NULL,
  `维修内容` varchar(20) NOT NULL,
  PRIMARY KEY (`检修编号`,`维修编号`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `设备维修`
--

LOCK TABLES `设备维修` WRITE;
/*!40000 ALTER TABLE `设备维修` DISABLE KEYS */;
INSERT INTO `设备维修` VALUES ('003','01','更换滤网'),('004','02','更换螺丝');
/*!40000 ALTER TABLE `设备维修` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `设备耗材`
--

DROP TABLE IF EXISTS `设备耗材`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `设备耗材` (
  `维修编号` varchar(10) NOT NULL,
  `维修耗材` varchar(10) NOT NULL,
  PRIMARY KEY (`维修编号`,`维修耗材`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `设备耗材`
--

LOCK TABLES `设备耗材` WRITE;
/*!40000 ALTER TABLE `设备耗材` DISABLE KEYS */;
INSERT INTO `设备耗材` VALUES ('01','滤网'),('02','螺丝');
/*!40000 ALTER TABLE `设备耗材` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-16 23:32:12
