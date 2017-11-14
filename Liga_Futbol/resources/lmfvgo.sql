-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: lmfvgo
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fuerza` int(11) NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `motivo_baja` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'DESCANSA',1,'2017-10-30',NULL,NULL),(2,'DESCANSA',2,'2017-10-30',NULL,NULL),(3,'ROSTICERIA EL POLLITO',1,'2017-11-01',NULL,NULL),(4,'DEP CARRO',1,'2017-11-01',NULL,NULL),(5,'TOROS',1,'2017-11-01',NULL,NULL),(6,'LIRAS',1,'2017-11-01',NULL,NULL),(7,'AGUILAS REALES',1,'2017-11-01',NULL,NULL),(8,'3 CRUCES',1,'2017-11-01',NULL,NULL),(9,'CORTIJO',1,'2017-11-01',NULL,NULL),(10,'CAMPAMENTO',1,'2017-11-01',NULL,NULL),(11,'18 PRIMOS',1,'2017-11-01',NULL,NULL),(12,'RANCHO JM',1,'2017-11-01',NULL,NULL),(13,'COLONIA',1,'2017-11-01',NULL,NULL),(14,'JUNIOR',1,'2017-11-01',NULL,NULL),(15,'DEP 2000',1,'2017-11-01',NULL,NULL);
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadisticas_equipo`
--

DROP TABLE IF EXISTS `estadisticas_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadisticas_equipo` (
  `id_estadistica` int(11) NOT NULL AUTO_INCREMENT,
  `id_juego` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `goles_favor` int(11) NOT NULL,
  `goles_contra` int(11) NOT NULL,
  `puntos` int(11) NOT NULL,
  PRIMARY KEY (`id_estadistica`),
  KEY `fk_eq_juego_idx` (`id_juego`),
  KEY `fk_eq_equipo_idx` (`id_equipo`),
  CONSTRAINT `fk_eq_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_eq_juego` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id_juego`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas_equipo`
--

LOCK TABLES `estadisticas_equipo` WRITE;
/*!40000 ALTER TABLE `estadisticas_equipo` DISABLE KEYS */;
INSERT INTO `estadisticas_equipo` VALUES (1,4,13,0,0,1),(2,4,3,0,0,1);
/*!40000 ALTER TABLE `estadisticas_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadisticas_jugador`
--

DROP TABLE IF EXISTS `estadisticas_jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadisticas_jugador` (
  `id_estadistica` int(11) NOT NULL AUTO_INCREMENT,
  `id_jugador` int(11) NOT NULL,
  `id_juego` int(11) NOT NULL,
  `goles` int(11) DEFAULT NULL,
  `ta` int(11) DEFAULT NULL,
  `tr` int(11) DEFAULT NULL,
  `inicio_cambio_nj` varchar(2) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  PRIMARY KEY (`id_estadistica`),
  KEY `fk_estadistica_jugador_idx` (`id_jugador`),
  KEY `fk_estadistica_juego_idx` (`id_juego`),
  KEY `fk_estadisticas_jug_equipo_idx` (`id_equipo`),
  CONSTRAINT `fk_estadistica_juego` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id_juego`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estadistica_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estadisticas_jug_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas_jugador`
--

LOCK TABLES `estadisticas_jugador` WRITE;
/*!40000 ALTER TABLE `estadisticas_jugador` DISABLE KEYS */;
INSERT INTO `estadisticas_jugador` VALUES (1,20,4,0,0,0,'I',13),(2,18,4,0,0,0,'I',13),(3,13,4,0,0,0,'I',13),(4,21,4,0,0,0,'I',13),(5,12,4,0,0,0,'I',13),(6,19,4,0,0,0,'I',13),(7,9,4,0,0,0,'I',13),(8,7,4,0,0,0,'I',13),(9,17,4,0,0,0,'I',13),(10,15,4,0,0,0,'I',13),(11,4,4,0,0,0,'I',13),(12,2,4,0,0,0,'NJ',3),(13,1,4,0,0,0,'I',3),(14,22,4,0,0,0,'I',3),(15,11,4,0,0,0,'I',3),(16,14,4,0,0,0,'I',3),(17,16,4,0,0,0,'I',3),(18,8,4,0,0,0,'I',3),(19,6,4,0,0,0,'I',3),(20,10,4,0,0,0,'I',3),(21,3,4,0,0,0,'I',3),(22,5,4,0,0,0,'I',3),(23,23,4,0,0,0,'I',3);
/*!40000 ALTER TABLE `estadisticas_jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juegos`
--

DROP TABLE IF EXISTS `juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `juegos` (
  `id_juego` int(11) NOT NULL AUTO_INCREMENT,
  `jornada` int(11) NOT NULL,
  `local` int(11) NOT NULL,
  `visitante` int(11) NOT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `resultado` int(11) DEFAULT NULL,
  `id_torneo` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `fuerza` int(11) NOT NULL,
  `marcador` varchar(5) DEFAULT NULL,
  `hora` varchar(5) DEFAULT NULL,
  `cerrado` int(11) DEFAULT '0',
  PRIMARY KEY (`id_juego`),
  KEY `fk_juego_torneo_idx` (`id_torneo`),
  KEY `fk_local_equipo_idx` (`local`),
  KEY `fk_visitante_equipo_idx` (`visitante`),
  CONSTRAINT `fk_juego_torneo` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_local_equipo` FOREIGN KEY (`local`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_visitante_equipo` FOREIGN KEY (`visitante`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juegos`
--

LOCK TABLES `juegos` WRITE;
/*!40000 ALTER TABLE `juegos` DISABLE KEYS */;
INSERT INTO `juegos` VALUES (1,1,12,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(2,1,5,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(3,1,1,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(4,1,13,3,'COLONIA',NULL,1,'2017-11-11',1,NULL,'8:00',0),(5,1,4,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(6,1,14,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(7,1,6,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(8,2,11,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(9,2,8,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(10,2,3,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(11,2,7,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(12,2,10,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(13,2,9,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(14,2,15,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(15,3,5,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(16,3,1,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(17,3,13,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(18,3,15,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(19,3,4,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(20,3,14,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(21,3,6,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(22,4,11,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(23,4,8,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(24,4,12,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(25,4,3,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(26,4,7,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(27,4,10,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(28,4,9,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(29,5,3,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(30,5,5,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(31,5,1,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(32,5,13,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(33,5,15,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(34,5,4,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(35,5,14,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(36,6,11,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(37,6,8,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(38,6,12,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(39,6,7,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(40,6,10,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(41,6,9,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(42,6,6,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(43,7,8,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(44,7,3,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(45,7,5,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(46,7,1,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(47,7,13,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(48,7,15,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(49,7,4,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(50,8,11,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(51,8,12,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(52,8,7,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(53,8,10,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(54,8,9,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(55,8,14,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(56,8,6,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(57,9,8,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(58,9,3,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(59,9,5,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(60,9,1,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(61,9,13,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(62,9,9,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(63,9,15,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(64,10,11,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(65,10,12,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(66,10,7,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(67,10,10,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(68,10,4,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(69,10,14,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(70,10,6,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(71,11,11,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(72,11,8,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(73,11,3,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(74,11,5,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(75,11,1,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(76,11,9,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(77,11,15,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(78,12,12,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(79,12,1,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(80,12,10,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(81,12,13,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(82,12,4,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(83,12,14,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(84,12,6,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(85,13,11,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(86,13,8,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(87,13,3,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(88,13,5,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(89,13,7,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(90,13,9,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(91,13,15,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(92,14,10,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(93,14,7,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(94,14,15,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(95,14,3,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(96,14,8,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(97,14,9,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(98,14,11,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(99,15,14,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(100,15,13,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(101,15,1,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(102,15,12,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(103,15,6,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(104,15,4,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(105,15,5,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(106,17,13,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(107,17,5,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(108,17,14,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(109,17,15,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(110,17,6,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(111,17,4,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(112,17,1,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(113,16,3,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(114,16,8,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(115,16,9,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(116,16,7,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(117,16,11,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(118,16,10,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(119,16,12,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(120,19,5,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(121,19,3,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(122,19,13,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(123,19,14,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(124,19,1,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(125,19,15,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(126,19,4,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(127,18,7,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(128,18,9,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(129,18,11,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(130,18,10,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(131,18,8,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(132,18,12,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(133,18,6,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(134,21,3,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(135,21,5,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(136,21,4,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(137,21,15,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(138,21,8,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(139,21,13,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(140,21,1,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(141,20,7,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(142,20,9,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(143,20,10,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(144,20,12,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(145,20,6,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(146,20,11,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(147,20,14,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(148,23,9,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(149,23,3,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(150,23,13,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(151,23,8,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(152,23,1,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(153,23,5,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(154,23,15,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(155,22,11,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(156,22,10,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(157,22,6,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(158,22,14,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(159,22,4,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(160,22,7,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(161,22,12,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(162,25,9,12,NULL,NULL,1,NULL,1,NULL,NULL,0),(163,25,7,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(164,25,11,10,NULL,NULL,1,NULL,1,NULL,NULL,0),(165,25,5,13,NULL,NULL,1,NULL,1,NULL,NULL,0),(166,25,15,4,NULL,NULL,1,NULL,1,NULL,NULL,0),(167,25,3,14,NULL,NULL,1,NULL,1,NULL,NULL,0),(168,25,8,6,NULL,NULL,1,NULL,1,NULL,NULL,0),(169,24,7,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(170,24,12,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(171,24,6,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(172,24,4,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(173,24,13,1,NULL,NULL,1,NULL,1,NULL,NULL,0),(174,24,10,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(175,24,14,15,NULL,NULL,1,NULL,1,NULL,NULL,0),(176,26,12,11,NULL,NULL,1,NULL,1,NULL,NULL,0),(177,26,14,8,NULL,NULL,1,NULL,1,NULL,NULL,0),(178,26,4,3,NULL,NULL,1,NULL,1,NULL,NULL,0),(179,26,1,5,NULL,NULL,1,NULL,1,NULL,NULL,0),(180,26,10,7,NULL,NULL,1,NULL,1,NULL,NULL,0),(181,26,6,9,NULL,NULL,1,NULL,1,NULL,NULL,0),(182,26,13,15,NULL,NULL,1,NULL,1,NULL,NULL,0);
/*!40000 ALTER TABLE `juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugadores` (
  `id_jugador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `paterno` varchar(45) NOT NULL,
  `materno` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `lugar_procedencia` varchar(70) NOT NULL,
  `fecha_registro` date NOT NULL,
  `imagen` blob,
  PRIMARY KEY (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'CARLOS','GARCIA','MONTOYA','1983-11-15','VILLA GONZALEZ ORTEGA','2017-11-01','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0à€\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0÷º(¢ßt×!{ÿ\0+ï×^ßt×!}ÿ\0+þýmDÊ{U¯ü{§Ò¦¨,Îm–§¬žåÇ` ŒŒQE\"Œ««cm+\\F¤£¬®=EMk: TÈ1·*Â¯EeÏÙ	ëä1ëºjÕžæMYèjÑUíå8çžÇÖ¬T\Z\'p¢Š(QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0×8S\\£F.®Øgó®­þá¬¡†Ò]âBZCÓüý+¢…µ¹…MÍ›L\0ªz©br‡Ò­Ö2VlÖ@¢Š*J\nk¢È¥Xd\ZušQ­ä3	ýÛc§µ_‰‹&ï´²F²!Vèi‘eNÆê:Zm•™-QH°¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(¯÷\rr6ëö‹»˜dvÀ9R{+¯a•5ÈÛÈBqÜ7?¥tÐêc=Î‹OSnzUÚ¥cÐÕÚÂ4†ÁET”QE\0Àß½eìiõÜÌÞ„S$¢£LÆv“‘ØÔ”;…Q@ÂŠ( Š( Š( Š( Š( Š( Š*¥Î¡³ì`K{t¦“{	´µeºî!ŒáåE8Ï\'µq×¾)–Yä³…ö;`‚£îLûâ¹ûrfkÍòÑ|¹-œŸZÕQ}LÝNÇ¦%ý´ƒrH\nóÏLàâ¨¿ˆ-UÝOzdõ¯:²Ö\'‘‘<Ö	ÐŒõ¨uÙ\ZäùLÄm ñC§byäô;øüYÏåùX?6xÆ:Ôsx¡VC ä²öÁËr „m,]Ç<ãŠÎk÷w*	U³œÔ¨¡s3ÓGŒ ~!ƒv[^M»‡¯#ŠÐƒ\\ŽuwURˆ[wR{\nònŸ&Ir\0éSK­»DgŽ0>êñºŸ*)#Ú#¼‚F\n²¡ld…9ÇåSõ¯!²ÕdL-¼Ì’ªni<Ï•GP1Ðý=«¥ÓüY;†ÄcËLo’Fáôý*\\KU;ÍÏÁâ»Yç†(àÖ@›·åÔúVôr$«¹0Î2*lZ’c¨¢ŠEQ@!8¥¢;‘™@íL7*;TÅAê7ÊCü\"™6—rz£µ4ß¯¥YòcþâþTß³Ãÿ\0<×ò£@å—r«ê‘¢’@¦E©GW°õ«†ÒÝºÄ§ð Ú[‰p)\\9_r¯ö¬^Ô\rV<ö©þÁlåŠÒgZÿ\0Ï!OArË¹Ô¢>•*ÞÆÝÅ7û:ß²b”XÄ:Q ZD¢ázxpÝ\rB-t&¥XÂ÷¤5Ì>Š( °¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢ŠJW\n3F(Å-IwÒhÅ&ÓëH.>Š(«,Fû¦¸¹®ì¯åh6sÎEwÍ÷Mq:ü|¨ãïÖÔ›W3•¹Ž‹DóÞÛÌ˜\0O¥jÕkh€UšÊNîåÅhQE!…Q@&>rihï@˜Á¤qKE`¢Š(QE\0QE\0QE\0QE\0QE\0TsM¼fI\\\"IÇ$àSò	\"¹«­RBK0Í_†?þ¢åZSƒ“3œùMõDÆøÜÛž•Ê__ß]ÝÜÇÿ\0G‚3+-“œýhWû6±6Ÿ4Ë/—h²‡Q·xÉÈÁ=x5Ÿ§^Ëgq5ÌŠ¦+é–Ý ØãßŠì…8¥¡ƒ¼ž§5y«õ£*±,\\ã¯J½¨O¹“yx\r(ßçXö6Bé¥’qƒ¨¤·0ê)ÚÄëÕèP>IŽzäœÿ\0*™Eµv4í¡aÍ9NÒÜ\"úÞ®E’\'H˜\Zîwíôæ±ídÚ\\…©ond‚Ä Còßù“E_Qò\\y’f6ÝïŠ…¦†Õsülj”2:#y>ý*´óî\'%sŠ›.I~&vNÁíM‹t²‰¥=øª6D0Nøçn*}þd‡-Ž(k \"äú‡>\\d…ïŽõf¯´[­»å-•·‘žŽ™¬Ôû<p_÷†¡ä»;W+éQmGduÒë×²[ÉöHË`,p² Â(êO¾0Ò­i>!ŸJP¡_Íêå¹Ë{ûV¬í³p88Uq}3Ìáç,Ç’ ð”ía_S×4¿XÞÜ-¬ÁÒf8\r³	ŽÜæºŠð‹{¸a!DêÒ·ì,çØsõ®—Fñ{h‘¬;d»³\Zi[§\0pxöö¨h¸É­ÏR¢£·¸†îÞ;‹iVXd‘ÐäRTš…Q@Q@Q@Q@Q@Q@Q@¤¥¢—P\n(¢˜Q@Q@Q@Q@Q@Q@Q@Q@€‚2ihîŸ¥pú‰ÿ\0I_úèw\r÷Ò¸‹Ý†í/™É­©lÌ¥ñ}üz¥YªÖñè¸«5‰¢Ø(¢ŠQE\0QIÞ1h¢ŠQE\0QE\0QE\0QE\0QE\0Vþf†ÕÙ£#ßÚ–öúÞÂÝ¦¹•bŒuféXZ†±½“ê(ÿ\0h‡<sßó­©Srwf5\'edeê^/ŽHßìS¼1²#\0GNÇ¿=ñ\\n›¯·ü%ÖÒÌvÅ1òäF0AÁÉéÎ+_Qñ&~næ×x”)&]GÝ²zz×3­Åc4	s¦´É´â[YÈlsÃ#\02:py®«YY#%¹×›«y5]M¦p.¢‰’%n“ëšæ£ÔK­Ý•É“Î‚`ðýÖÉaŽs×Æ Ö/óKÒõkBEÂGä]çºãž¾æ²mn¤{«›€¿;GÁ›ŒÒ¯=…ft¥-´û‹˜\\žc(#¹‘Û­rÎò]ÌIie\0ÿ\0i]ÜçLc\"?4©úò*”Aç¯QÒ³ž¶E-\ròÚhá#å„òCŠ†îàJÍ¿&1Ú µ”ù®Iå²:YâdB¼3žsYÉ®…X©ö¼Üâ A¹‹ÈFÓÑjR\0B™ëU¶’Åºt¨Ô…™dŽ4=€¨ÎÙžj«1s¾Cœö©_.2ÀsÚ†ÂÅ¥@!ÌÍÉ=¨¦½;¼¨FØÇ§z¥,Í€	äÓ­ÀiÏ§qØ×YæHöD[j¨ÝþópElŒ±M+°bN‹â©ÜÌ#Zýây¤¸¼ÿ\0F[tÆ:µ 5lZ6‘åÃÇ\\þ‚®Çs·O’4—nóµ†ï¼=ý«ší>Zp·5-yç‰â59&‰Yng¤ëº†—$Ka|æ5Œ/ã÷KžN8÷5êú>ªº­˜›lI&2R9„ ¨ÿ\0\nð\rBæEò£·*/^Y«gBÖoôÔ»+\0uà‡\'æSØâ¡ê8ÝïEQû\\÷¶1ÜiŸg1)™Î}væ¸‹ß\Zêñ\\ÍmöÍ\"\"v¿Ñn›vâ¤ÑÍ#Ñh¯)kn~_YÇžËe\'õ†£oëî¹o[€zbÑ‡þÐ¤ÚBçG­Q^>u]fVÁñ„DŸE•”Bšo5Läø¾?ûû?ÿ\0EÐs3Ø¨¯7z‹ôñ|GþÞ&ÿ\0âi¿jÔºD[þ¾fÿ\0âiÝ;=¦ŠñS¨jÑ®G‹¢ÞêOê´£XñOòøº;süÒ—2sÚh¯Å(Eÿ\0‘šÉÁéŸ,ÿ\0í:¿ˆ<^Ê¬º­Œ ô$GƒùEÇÎR¢¼Õ<WâØÇÌtIûlGòjÛÐ|G¯êRÊ²éº|ËCkv2¹ö9þtÄ¦Ž¾ŠŽHÃIDÝÕˆ$~G%¦QE\0QE\0QE\0QE\0ÔÑšÁñšçÂ·xí³ÿ\0Bã“Þ,lûtÀ¬g[–\\¶6§G^çÐ4WÏÚQK7ëHÚ’ÍúÖo×Ù/êÞgÐ´`úWÏTG,ÿ\0­!ÕâÇúÇýhúÃþQýY÷>ˆÁô£Ò¾uþÖ@r%ÌÑý´£þ[Ëÿ\0}\Z~ÝöÃ>çÑX£5ó¸×Èÿ\0—©Æ?Ûoñ§/‰dSÅìãíµW¶òÕåÜ÷2·§#,µbèß‡ùZ­ÁRâÂ9FSÞµÓt÷99ZØ²Hd8 Šàõÿ\0J8ýà¿1¼±?yŠúö®gPr×\n[»ƒZÓD7yÖÿ\0kVê–”ÁìTŠ»X\Z­‚Š( aEPEPEPEPEPEPEPHÌI&‚B‚OjÉ¹ÔŠÆ=ÌT,ª@?¥\\ äÌêO•h6ýb¸+Ý¡–ÖF\0 =²+‹×µëƒ,p­¢EfÆæ3¼g\'/ß\\¹{ØšImµxgr`W/ýôÓ°¬ƒ¬N»’x_vJ¢ïúãé^…:ils7ÜÈÔ>Ç¬´qÄ‘‡v‰bM¬Ç ÝŸJ£e¤˜õ#m;[¡S“  tÈæ¯_j0½ØKX£@X\0Î¡±þðÿ\0õÓo.L‘¬®;”8dv,?3MÅ7r“G3<rÚÏ,®	V­îàÕ ¨–R@$`…<‚:ÿ\0Jn¥µÛz ÑG¢µo(#l7B§¸¬-iX¥ª.XXÜZ“û¹7\'G¥6Îv[iP”v5Ã˜vÙâ¬\\M.ü°Ë(aÆ8þh»· ìMdÑ0’FûÀrÖ –àáŸ·šŒ1H€ÎÐy\'Ö£’T	“Éíš9ln1[qäŸz‡ËÉ.ç:{Ò$ ±À8ïLžF”ˆÔpµ\Z¥p¶£·°ì¢¤¼‚xôå‰#Q»\ráÍDf\\ž2•+…‰%Ž)p7`ô©m£D€rXõ>Õ\ZßÇüª¼ŽòŸ™È…\'ëb´¬Þæ3Lß*“š°±A|Ç©&®G\"´,SåU\Z—pd(× aÔÔ²\\³“åacáx¬©ç”\"¼Œ{‘AFœ2ˆÉšC—#8cÒ­Û»]bä\'£sšÇ‚Öy·<„€y­k¶Bñ\\„eùI=‚Ìî<#â(´=@5å¬¸|&àø\nSâ¯a·¸ŽêÞ9à}ñ8Ü­Ó\"¾lŠ[«r­pÒeH Èÿ\0<×°ü8½’÷L¸y/£”+€-Ñ|¯rg­MÓkC·Éõ£\'Ö’ŠF“ëFO­PEQ`R`zRÑJÈÚ§°£jÿ\0t~T´S°\rØ¿Ý•\nˆ¤•Pu u§Q@Q@Q@Q@Q@Q@ž.ð½çÑô!^D±	$*-šg=Œ×¯ø¬gÃ7£8ùWÿ\0BÅøJ\0Âñˆ†P~†¼üL¹fÙÕIþé™–~ymEÕÌk“÷1ÍhÞø_N¶Ò$¹HÛz¨<ž:×Nc_ìÒïMÔ#á™ÿ\0ÜÌW+“–·›Ló4¹µ±kgj²HÇ¹×šì´¿…Ö¸jWO)#˜áP€©É5WÁ¨?á(+ÿ\0Lþ«^š0Q]´)§³*•%Íkžkà}\"	ÙeÛ,ôª-àÝ3·›ùð®ÏXdg$VKO\Zÿ\0üéòêfêMu9×ðn™ž²~cü*œ¾ÓÖTUgÃvÿ\0\nê^hÛ8aùÕvæ:Óåaí§Õž—EWXÊ`ŒŠÃÕ¼9àlÞ\\¡!ÊEnÑM6¶I”t¸$·¶1È¸`}jõR¬QE\n(¢€\n(¢0¢Š(QHz\ZÊ¸ƒ‘»\\!Ìg:œ¦›J‰÷˜\naº€u•k˜¹œ’~Ö«E¸‡ºH†3–5·°I]³¬;Ù#¯7–ê2fOÎ :Å€ëp£ð5ç÷3²ÜÆ¡³ócëÁ¦<ŒZ`»‡¶‘èÛóð´.±`Çå3^xY€á–¥±%î•YÔKØ®ãöÌë§ÖYÊE +Øþ½P’ñ<éO˜á:ä`\ZÈ’îÞÒI§º¶†\\¨\n\n† äã¨ëY—zŒ/f¿-¸Á$Å·Ù<â»!•¬c&ÛÜž´×_PÒ®–%lÃqƒÀ#w×Åb\\j&ÒýVRdµuó\\¯%w)êöàÕ[½~ëQ¼`‰.¸\nmÃ\0Iýj¥ýìrÃæZÖS˜Ûº³½Ø`óÈæ›”RÓr’a¬=â3Mæ´Ö³|ÂV@Ù\r×·éTgûM³,ðÝApþŸÀ‚)ÿ\0Î™Vã²|®ÑŒdtÎ*¤¶ÏÌ•ÇQÀ¬Û»º-üË{ØÆaû=Âƒ¸\'Ý~=Nk5¬êž}ªArvì”G*ýê¤³!¨’ê4‰sºV\0â˜74Šri‘¶ånª0íæÜVwrñþd…ON\rW¸“t`\\TLäÍ’iŠNìžESi‡˜«•`§¿&$à \0:‹$«9êOàä÷¨–àY…¾ñéPÆ¥b@ÖmïŽ€SÉàt©e\"S*Æ§o$÷5¶X±¨‰ç­8t¤êžl¤8Z¶ï¢†*¡x\0Ó¹÷5še$c5O­K×pÔÒ†;r&ælôn€{ÔŠâ\"¢0¹\'ð—æ¶6¯¬CAw<û[°ÆhC5b¸]ÇsñŽxïR%ÙC•_“Ö<r¤RfßŽ•,S<œœì\'ðº\nÅá&œ|§Ú½?áEòÇ=õ›J£Ì	\"!êq{ý?:òÔ¹Ü…ÅhøkS:ˆ,®ñèN}23úT]Ï¥(¤	4´PQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE‘âqŸ^eÿ\0Ð…r¾\rUõORÊ@ü\ru¾#ðýàÿ\0`1\\×‚m„§P}ßqõ¸1r¨ÒìtÂÊ‹~fÜ04–¬	ã&¬%€¹ÓÙ²ÆÒEXŽ[LÉäÕ¨—l@JÎ•$ÝžÖ2”ŽLð´\Zf nb‘Ù¶®3ÛÚ¹mzâ{}nèÃ<Š7vb;\nôµêEyÇŠ#®\\Rè)Ô‹„S‹Þ¦—ÊÅ¤•Øž¤œÔEØucR2/jŒ õ5šm—b&‘½j%»0^ÀìøPÜšK–©5ÊøŽêC89®Š*ò3’>Ÿ¢Š+¸Ì(¢Š\0(¢Š\0(íE]#9FXzÔõ¤£* “A÷Nôô=ièÉ»[–i)‰2¿ƒèiÿ\0ÅE´Å¢Š)#}ÓXWŠûŽãÚ·OÝ5›s;ªÇÒ¶£¹Ï[s™¹Wc€­ùV{¤ ýÇü« ’ëÉpØ ý*´ú£¶\0ÉÇA¶ºõèrès·1È“[;#*³¤ŽŸåK(ÞŠHöc\\»ŽX4ôV>dr1`F1‘Å:Îy’Õ–0åX|Ø¦ú—¡GÈó¶\'lrp3N&‰üÃÛŠ¹ô¶åü“\"—R­òŽ”Ã{?Ù>ÎY¼¥9ÚTuúÒÖãV3äÔ<ÆuøäÃãð=>½ª+yî~Ñ,)‡“2)ÏÓ ãðªîÖíq‰Aa»\'ŽjÚOm*˜âÏCòžõÓ}Æô3.¬#·‘žD¹…†\0È-ôªÞÏ¨ÚI¡\ZT%Øyk–?ÞéÞ§­X™â‚7+l¢Lü²†O÷yÆ> Õ¦Ê%Û²\\uêd’bFYØSi\\¦´´€ùSÚ¦DA\'­@Ñ˜ø`qíX7cTU8#oåU¤jìˆÌ¹ÍWu,j$4@	FÍ!?6áOÚHÅ4ÆAâ¥±Œ<¸æ—8\Z1†>´Ù;R’»TtÇ4ÃÏáK %ª2FìRo¨!Y‚ñL\'#š4¸ÊóQr¬3“Þƒ÷hÁ&€¥š„ìiqÅ?aÏJQÍ&ÂÄcŽ53F­ ŒƒÍ\"¶Â…Á&¬¤ë>PQŠƒaì)â<x¥£\rÇDNì‡½[#YÁ›qû­ƒT¢‘€ëœŠœI»j?Þ€úgÃ3‹ŸXÊ³K0hÿ\0ÖJ 1Á#>•­\\·ÃÝ@ê>µwlË42ap¯WSAQØ(¢Š\n\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€3µá»D»ìZÀð*5Lôóù\Zèu®t{®?åbx+o—¨c¯˜¹ür¿÷‘ºþõ:H—6àT `L–h­â2K\"¢¥Žs÷ž7Ò-”ù--ÓzD¸›cúÕÂ*˜6t``šóÏ\ZÂöú¿›œ¬¨{céU¯> _Í#,m\r´@ñå¦÷Ç¹n?JÑñðc=›gg\'ñ4§%fJªµ³8Çº**»_¨ëV&ŽÞNZF’Lt-b^G1]áyõ¢8dÖÆqÅs;\"{«øYpOë\\Þ»*¼*Tp3Kums€nXø¨µ\0µÛêkXÑPÔ×½õ]QV0¢Š(\0¢Š(\0¢Š(\0¢Š(­\Z·$sëJ)h V[…Q@Äc…\'Ú°îu£nYDJ~µ·!ÄN}®\Zòé\ZbŒ¥³Ç·£+Üæ®ÚjÅ‹H	ýÂU9<VÃ‡³VôÃãú\Z·.,	m¼ÒN>WéX\ZÃÅ6ßeò¥\r’KgŠè\\¯c¤ž¥mcQ:– ·E`ƒœ`c­]µ×d²‰cX!b½Ïó®zf;¢ÿ\0~ºx<)©ÜAÂ$Øêp	³rŠÜ´ŸB|Is+†)8ÇJ–J]G÷O\ZÅY_ÜAµåŽÙ‰òÌäúT‹§-“qQ’:$Þf(RM‡%·1îí!,Wp8ëÅU–Ù`„K\ZíÁÏ4²NËtÊFO5\rÜá†1Xv9®øØ—ØÆ½_:VuÀÝÎÕè>•A­XîãÞ´âŒ;½\\M*I!MsTi³X#ŸlÍ×ñ¡¬¤^çõÑG§4m†SùUÆ°‰¢û€c­cfÍ-cŠh\n¶\n‘P½¸ê;×W5Î‰Ôb¸\0ÆúVm”¢rÆÌ¯Ì©Ì8ÇC]Y (\r1,”•™J™ÌKdÈÄ~µ^Hq÷º×a%”n0@¬CKdÒSLN36G\0Ôõ«7HÊH#š®ªIªnäZÃ£Œ¿j+V=¸§ÚÀXZÙ‚×åéYÊV**æWØI\nO±ŒkymÀã}wVn¡§³1\r™R8?•5­öýÑ“[\0+ÅB-€ÉÇ>µ<ì|—1–Íº°æ¤[S»ëZ‹~õbeb2hç‰’,‰8éMž‘dý+ ÆT–Æ{\nÍ¿Œ,]9Í5&\'\rSÅ;i,ê;ÔŽ¾Y?…1° Ö—FG´ü\"Ô¥ŸGº°x¾Xd2,™ë»Ö½¼{àôÒ®«yõòžÛÜy†kØh*;QAAEPEPEPEPEPEÊø‡Äš†¬-……´7ÙÃyŽW\nùŠÝŽªŠóëOj—2bXìá\\àc,MuVú…Ì±	&Ï.iÍz+™¹ñGØ¤‘$òËŒaY‚õ¬§ñÁr(Ï0¨•dº\\¤wtW<[tGúø‡â)‹.@nb×\"§Ûÿ\0u…—s¯ÕÑ¤Òn‘XÆp+È5{SÐ\"adòÇçË$=ÿ\0\Zô;]iäˆý¾áRRW¯ã\\~·Ô‹$!HØBòEqb*¸ÍTHê ”©ÊŸÏâbò\\$2M)è_tVa‡V‡N’ÿ\0Tµ½H£lnte^zu¯\\ðV‹fºD=¬Bàƒ½Êç\'úb¢ø%ºx.úÐM\ZÏ!Œ¬e†ã‡àWd]•ìqJ*WG“Ãâ[X£9òÑq’HÉê¾>$rÈÐÝkË|àÁâM–hÌÖ±©3ª¶Üg€	÷þ•ê¿!ßih€ãžk9]Ó¢ Û]O8VþÖ^\rÃw;¨úÕ‹ÿ\0Ïmá±©¤žlìûEºÍŒ‘ž>Ÿ­G éòÍqs*\\F±[Ì°´qIËç=¹¯p²Ò¬¬£U··Qâ?1üÏ4½çÔ¸$‘ò…ìîÒÿ\0)ô¢V&$_jï|G?†l<I©ý£NûD†s°Æ€ªŒœâ¸ÍjúÚòé¥µ„CT\0\nÑ^Ú•Ôú®¸.säÊ¯Ž \Zš¼R<3‰áÇB\rz†õ¿í­?Ìu*a[9÷¡è]®mQE\0QE\0QE\0QE\0QE\0QE—¯jOÓ‹²,}H\'úWžKr’K—lWYãöÛ¢ÛžãäüqëÎD¾õÓFV‰ÉU7#Ó¼0–7š A&]–mÃ©ÿ\0õb¹[êÏu/‘i¶ì#/\"W<wôÅ[ðÞ¿™áýEZdóÐ™ ”ÌWã¶@ªrøÿ\0Yaò‹Dÿ\0v#ýM%Ì›°Û‹µÎwW´›L»6—DÑºî\0‚p‘¯gÓX>•fËÈ0!ÿ\0tWˆj÷\r<‚wbÎì19$Ô«páFŠ\'g¸ã>U±ë³j\Z}®µ$w2ŸÉ\\R~\\ž+™¼º²—SºžÈnŠL`€@\'8Þ¹¿¶›.¤F«#¤½‘Œûu«VR4PÊaRã\'½3NšJB“¼LÉ¤•¦pø#×Ò”*¼¼áQÜ3—,Ñ¨\'¨æ¡k™¤U‰Ñè+¿›¹‚É“®MtöÛG9‹k–À¿ZèmË\\ªs\\•[Lé¦´.5²•˜j©ržXÚ«S¼É:öª77,\\ŠÂSêl£Ð‹`8¦Kn$ã5HY¸ÍH\ZB0Ô*šÙ¡ò”¦‰TñÖ«ÆñZFÛIaTùÎMD›E%raÁâ«È»×k*éù‡^*EÏZÍ=n6‘ËjºfId\\jÄK6rµÞÈŠÜ)JªÖ+æçhüªÔô1”;6V`¨$`Ö˜‹o«^R…\\T-Ü\ZÎM·cHFÈ„ÄÃ‘M1œdÔÙŒÓXázf³µDƒŠiëÅ=¥FNi\\\0)cOUž´Õ#šQŸÂ†+-K\n3ÈäÖméi”+J,8ß^ê ˆp¤S‹H™-vårG8\"«ã-Š³;|æ˜ìq“[­Œçsð¬F|];DnÈ3m#ëœ\n÷:ðŸ†M\ZxÊÓ{´lÉ\"ŒÇ\0ûqú\n÷j¤8õ\n(¢‚‚Š( Š( Š( Š( Š)·Ð×â+;ÓâÖ¼ŠÎI¡þËx·(Èß¼?Jèµ=Z;IR%•7î‡Reëzü0à¡Æz\ZOc9I^!ÕíC‹	\"!ò¥Æ\05ÚizWŠo-á{BÖÞÛ\nÂ5˜LãÓÞ¹={Å~~œößi‘™ÜgvyÁ­ïkww:DÃÄÛ.Q‡uÅsÍÊÚ\"ÕžæˆðÕŽ«â‚I?uÀY\nŒŽüsZÇáæ‚Ë³Ê¿îÎßÔšÅÒgº›Ä+›­\\È§?Aï]öÙÔ\rŽ­ÇV£­J{Øåÿ\0á\\h²­v¾Þp?ÌV¶—á}3J…cŠ1•‹	%›ŸÃ¤ívÈ‘îÄRxÃ–OÐŸð«QW¶¢¹©¥Cª[y2–P¹*S¨5ƒ ø{Êº»KøÉÀQ\rÔs“Çá]7“3&nØþ¦ªØZ][ê2O:ÊŽG‚ g¯>â³%)¦ÑjmE¤h*$h*ŽÀW’kÚkO¨\\1\\†v$þ&½q‰Åx×Ž/õ(|Túnž¦DhÕö¢lœúRÄÐuRè(TQ¹g<ºíÍÌK¡?vÑžàçx#Ž•éž0»1éö7XW,œ‡^WÒ¼®ïH×­—~£e<+(;‹Œ×¤ø ™ü/¥6àIEäqü5¿³TéÆ7Ô‡.fÙÅøbx¬´IÙC_]]²c9,AF:¿­gx“UÕm®æ´Ô\'¹Y‡?0àd{WKá	Á¼×w7R¤â_‘T\09ÎO½tzö‰ IáËûÛ¨ãšõ¢É¸“æ}À`sÚµp›×¡‚­n[ê|û4îí…@ôªsÉ”5¿¨¥­¬r€`z+›’w5s‹NÅÂ|úÁwÜW¨|2óŸíd†\0¼žçšà´ýëU½Hmã.ÍÛ5í^ÐÓCÓ„ æGÃ9Ï|VM§do±±E„€2j‰Š@Aèih\0¢£/‰1Ú¤§a)\\(¢ŠC\n(¢€\n(¢€9?ˆ1¼š²¢’~Ö½?ÝzæN•§Á´ò*S]g<äðËÍ¢™çÓ¡þuä’ê—’4 LV‘9ê\'Í¡ÚË¤é–éºYÕT÷&¢û.³›¨·¼k}NòXü¶”ôÅUq+œù˜«æD(³SÄkÓ-œ›¡¸>¾µ¥¦Üi	k‹¼ù™ì¹ãó®NH^DÃKÅCösŽf4Ü•ÐùOAø{‚$`}6õëOOŸK”<6Ï¹ˆ\'qýkÊ\r»g‰jøe^ß_µs8\nIS»Ðÿ\0U8É_@å¿S¥Ô\"h™Øœ\nÆWf—#Œk¢ÖÔ$„0Á\"¹©	RG8ÍwKc8înY8q’r{Ví±„·\'·5ÈÚÜå” ük¬²T®*Ìê¦=’YÎN{U«}ßrÙ>‚¬¤ël€§\rôÍU¸ÔFÚ»‰ïY¤–¬Õó1óÁg\0‰;ãšZ#¡p?\n­î¥Pá­Uä\n‘&Ìû\ZÓ™µt‰²ØŽåÃp cÚ²¥Îê´óžr*£Î7r+’£»5ŽˆgãQ¶XqO-¸ð)Z6ÆJ…„ÌÉ™£|äÓ£ºF\'Ÿz±2:Uxá‹#šZ2ÜI«Œj¼˜\'#j»å!5‘Í)E<ã&˜ÏžÕe¢\rô¨Ú-¢³¿r’*±â˜wtéV>8\"f—0XŽ8­XH3ÔÓÕ@*R¿&áK =4DöñyhYj­ò	P€1Wâª=1Ö¡wH¤û™£‹¾‹ËsÏV&9À­M];VT$nâº£+£nv_åX¼m¦³¦àÎËô%ùâ½þ¾nÐ.\Z×W¶ž4‰¤GÜQòôïŠõKÄ~*´±šòÎßF½Š$ic2†Úx­Ri\n,îh¯?u’]3NÁõó?Æ™ÿ\0³\\ÿ\0 n™ÿ\0‘?øª¡ó£Ü¨¯ozèÇüKtÏÊOþ*›ÿ\0¯^?óÓ?ï™?øª,.t{•áŸðºµþÖ\Z_ýñ\'ÿ\0J>4x„ÿ\0ËŽ•ÿ\0~äÿ\0âé:=ÊŠðßø\\þ!ÿ\0Ÿ-+þýÉÿ\0ÅÐ~3x‡þ|ô ?ë”Ÿü]Îr¢¼%¾0xŒ‘µl\0ö¿«ÔÖÿ\0uõsæ[éò)=âu#òjáQ€ÑÆÙù^+Ê¿áqL:tÿ\0yª×Æ=[v-ììU}Yþ„*d“:;«’eÕ|>a÷…Oâ=îmÊÃjÒ¿`«“^Tÿ\0<Bnšt6hÌ\0 A‘ÇÕ8üXñ6×Úÿ\0^ãühŠj6fvWl‹ÄžÕ-´ÉnßM\"æw1ð£=MmøGÆRØhÙµ²ºÄ0­»géXZ‡ÄM{V°šÊæâ#ëµÕaQ‘éšÂŽvTÂ¶¥KŒ¬Òe§w×zôÓkmRv2ÓßA¬$ÖèÂ`Ÿ(ÎXW‚›‰à1ªÏ4™Îyõ\"¡SÛRœ“>ŠGº™°Ü+Fz09 ‡Ql´€\r|Ôn¦ï‘ô¨ÚòfêÕ|¤ŸL´W\róê‘Ž¥°æk*ÏT’_ÜAçŸ‹„¤1’1ÔWÎæáðzdûQõÍ¼ŠñLñº«)Áð§Êî,ª|ç#85^ÖG”5ÂÙÂ²*H,Fz“ŠùŸûgPsó_\\ÿ\0ßÖÿ\0\Zõ?ƒwÒÌÚêOpìª°:‰œdÉ¸óøPâÉÓ;?[LºEÞ¡çkh]Ò6@TW+{¨É©øM¹‘×~I;F\0 ‘Óð­¿x¢Å¼?©YÇ –âX^ Š	êë\\ÅŒWð®ìwÂP—r¡Æ275gdÛh©tGuã/}¥óªÆåH\'~§ëTd×5BÖðË©Ï%»Ì¡¢vùH\'ŸçYú†‹s-ËºÛ°;¸äsÍA-¥û¬q½¹Xg‘ÅZçÓR\"Þ¨ÖñÉ†ÚH`‰QK fõ?á\\dÄ¸ÏJÛñIs|’6Xó&qÅ^·.*ÈûNÒ,t¨öYÛ$yêØùÔõ«´QBV,+7Z¹û=–AÁ$w­*ç<JKl´É‘rÖãÍ†7\rÃÖ„.XsX~ŒI¦ºJÛÝ$ jÝDTÈZ»¦ŒåÊNìÕ„mÈ\rV“­InÝVœ–„Ó—¼OEVg@QE\0QEƒãTÝàýHçîÄ~W…»sƒ_AëvÚš%å˜#óã)¼Œí÷¯9†±Î½Ÿx¿û*¥$·1šwÐàNk»ÿ\0…m?ä`ƒñˆñtÂµ„ù-óÿ\0\\‡ÿ\0Ofp†CQ´™í^€~\ZAßÄ0ß¡ÿ\0ÅÓOÃ(?èbƒþüþ.Ždgž–§[Ý½½ÂJ‡æB®õ¾Dqÿ\0¸ÿ\0¶ÿ\0‹¤ÿ\0…Z…¾_A»<oÿ\0ÙÕ)ÄÇ_H“À“©óÐÄäs\\åÙ(0Üd×W¯éÇFµŠÁÂ¦€1\\MÄÅ¹rz×o?ºŒ”u.Øæ\0µÜY(üpqÖ¸ý\Z(Ýƒc&»›87F\0ÇQûÇ]4I&Le‰«±Ç}ñ¥X€À$Š>cWÙ^IPŸ›åQïU¥–\'R±…ÇzeÃvŽ•FC³8Í©`QtŠE#hÈïY3Û®ìŠ¾dÈÅFP¼×,ª)$âglLb1ïZBè*›ÆCt¬ù™I+$PÂ¡ªzÕ©\0©¡3Ú¦ão±;{}(hË¦§	Æqš]¹ÅVêÈ›•6ÔN*ÿ\0’[œT2F³hµÜ T“ÓŠ] {TÌ9¨\\Z‹_Pm¼/¥>)ö?+UŽ¦›æ¨ù¹ÒCsÁµ•O|š©8VoJÄKí­€Çó­+iÄ€g½\'ÔÆ±nYXã8Î)(ÄÕÞ_ÚïR;\\ž£d`°_Êµ§-,g%}GØHÛàŸ­vqxŽêÉ¡[wÛŒn9<×a–9EjÀYØî=\r7:°TÔÛ¹OÆÑÂu{Ð·‹æ”UÆ×þ/Ìó\\Ö\r{>Ÿáÿ\0jš5œºÌW2\\€øòä*\0-ÇO`*Òø3À8âÆðýnükU%mNJÎ*£Hñ\'Î>”Ñš÷QàÏ\0Ó.H·/ÿ\0ÅT‹à¯Ð\"sõ¹“ÿ\0Š£™w2¹àý(ÁëŠ÷ÅðGûhÒ~7Rÿ\0ñU2ø\'Á]´Fÿ\0À™øª9îx\0Ý×—“Î+èàŸvÐÿ\0;‰øªpðgƒÇBOÆiþÍG2‡Ïœ÷ÍI5ôü!ž?ó‡þûþ*œ<á?ú\0Áÿ\0}?øÒçBÐùö]áø›ó·c_CøPœØŸ}ßãLoøJ.á³ÿ\0¾úô¹ÐÏŸpÃ±¥@Ié^þ4o\n/OØ~1Göw…ÓîøOöÁÂh™áÍ\\QòŽZöÑ‡SîøOÿ\0ÀTÿ\0\nw™¡¯M\nÄ}-“ü):‰…‘âd|½EW•O¨¯q7š:4K?üOð¨_ZÓ¢?\'‡ào÷mÓü):ˆi\ZcsÈ¦ýšc÷bfú×¿Ûjvs(#I·ŒúWÒ´#º„ýÛ8é\Zÿ\0…\n¢ÑóØ/OÝ´œý\"cý)F“©1ãO»?Hü+é¸d-± Â´b\\.Hæ®2lw¹òÀÑ5cÓK¾?Kwÿ\0\nßð¶¯ÿ\0åáÔ4´<±ª¬w\nP¦	9ÁÖ¾ŒÏ½xgŽ5õ_ÜÜJÅ\nˆAÛËm\'šRmh6’DÓxå®Ïú>‘o\0í´ú«®{¹o¼§]H»dd¯§,?¥y•Ý£Ê±pÞ¥x¯Lˆ†ð-€L2ÌÕš¾·#í#‹!”å3Ïz»\r‡ž>h€ü*T)æã ó[¶1¡XÝƒv9»ï@ÖsKäåÕIQ^At?~Øéž+éØ`\\”}E|ñâ‹x­üC}(¥Ãª¢öŽmE½™QzYQIFG­nÑw¸ÏÜn•”Œ¯5Ù\0uÎji¹£ñìúÞ¦?‡µ9-Ú]Š’sÇA]®ãjŒøÜÊc×½p¨#³¹Š@Ë\Z™’NOõ\"»äR¢ž¡FiÆÖ\"}È¤¦Å‘ ¥“­I\nw«“ÐÊ+Rz*´WÖ÷—V‘ÈÖ»<Õþîá‘úW5âOI ëØ¥´s«Û‰K3• –aŽŸìÔE6ìŽ‡$–§Uq#Åm,‘§˜è…•3Äqö_-nná¶“OY<«†\nIÇ=+JÛÅ–7G\"Î•‘cvÚHäp+M#ÃWx÷k†o;\r7–wgwFÁÆjý”ŒeY_C¾¢¸9>!ËmxðÏa@;¡¹È9ü\rhZxÿ\0L›þ>bšßßïÒ¡¦™²œZº:§‘‡¨®U„¤í]•†£iª[}¢Î_6,íÎÒ0~†¹íjß7\rõ\"hâ®Ýâ%8jŸöÌ`ËÍlÜ[‡È#Šåôû&—ÅEÑÅ‹‘±¤à@ÏáN©	]Øìî,¥µŠÙÙ÷	£v¨Ô1ïZRÍ{(y”+€ªr\0ö¦,°wêT­wb¨\rë[š[A#ËpyÆÚ¨jÍ´Cæ¦)¦U;9$È<v«p:ûAÇ é^ksçl¯\0õ½TŸÎÒn-ÎÕ~]Üæ¸u;§X0{°¯N…HÊš\nô¥J§+5¼9mÆz×skæ²4Ëoj¼r}«t¶OLW3w‘¢ÑšqyÆk.çRHÜ+?ZÕÒ®áÏ½r“j¯¸°5M6´2:ãtûÕL	Îk”Uf$`uæ§V7øÖ2‹)M¶NE9dë&;ÕeÈÖ¥[ëœÖN6Ôµ+£L²‘Pº–æªùÙšzÎäÐš)ë°…Wv)Æ%ÇZk9=…4¶IªÑ²PÖQ¤Œ‡éPÏ.îšH§Z.&]Q±Iâ³\'˜qVf—ddX·KR– ºŽ¸”Œb«}MR¹Õ#?6MeM©´„ìãNì‰OC^[µRrjŒ·Á³ŠÌÝs;cc\Z’;+‚~d\"¯•\"9›$k‰7e+^Âñ¾PÇšÍ[9\0ÁÈ5=´OsÈ©šMXi´Î½\\[†#‘éT¯­D–Žq’>Âb°ž*â(–6Šæµ‹¹Èi\0-É8æµ®­Ì\0§GäVg0^È˜ïÁ­ ~Ñoþ @ª¨õ¹Õ„|ºu¥¾,m“n1çëŒÕ´·jÎoè–‰\\¸‘U€‰ ø¦è*~Y¥?öÈŠ|ždîäÛ6Ò¸â¡—T²‚VŠK˜Ã¯wt¬ÑãK\"¤V×2;\"ˆùcéŠä¡Ò/__»¸þÁÕ&‚r\\Æ!”“œýÞ™ÈÇ½8Ó¾âV±èßiÚø5u\'\0žkÆ<W¨]Ï¬\"È“[_-¡pTƒ×zTÞÕo4ù¤\r4†7u˜ãê*•7k†Ç²}©sÖœ.AèEpSêA1K‹»„m¡¾T\'¨Ï¥1uË1º•×ýú?áSÊîîz4rdÕ€	Êé×o%Ì·E­Ê‡ËŽÄpZÜƒ\\ÓfuD¼œ6Œç&“´]›4„\'5x«—öñU&M²«‘éZ\0TR \"Ÿ)7+í‡ÓJ/üó«J£í Š9DQ(?¹M1îÕÖZc(š”:ü‚«;”?êêíÕÌÑ4³J‘Æ£,îp`A¯Å¨´†Ê1<küAÀÏáK’ýiB¸Œfµ­áïY\Z]Ê]W‚§¾‡=+¡·^•¢7.[EŒUÊŠÂÔµªF°Z\\1N§½qºžu(/q¾Î=k²ÊÀÌ85B˜Cw<šæ­ÊWc»G˜êÖO	Ì0©Þ·tõðY¨Ý…,1ŒWc5·Ú.Ðs×Š¥«Zù:h‰¼=ªaU ›mžag¦Ü%ÓÊù\n_ f»}2±)+Ú®®–°%2Ì2*kks\0ÊGáIîN¯Rä1¹\"¹Ïi¶ßÚvw+oH¾ÞsžµÓ©x¬Í]Þ\"FH4î¬4ŽŸi?Å@@;×’¯Å{uK²ÝòëY·ß5i‹[kx—øZ@Y‡ëŠîåbº=†i6¾N0+ŸÔï\"$åMxÝçŒ|GzO›ªJ³•Œ ¨SÄzÚÇ°jw?º[?Î—,žÌŠÜõ|»»«km¹\ryóÓ\"·ô¯B•ÀÍ|ÖÚæªê¯çÀuq†ÆNAãÐVŠ¼@Ýu{²?ë¥8ÂÁ)¦´>„U2«*˜Å|×.»«O‘&¥vs×÷Íþ5Yuô×@˜™¿Æ©Å²bÒ=“HþÔ·ñö§<Úeà³½vŒÉåŸ)ŸLÖ¸¿‰’ˆ|fq!Áµ\0œ·çÖ¸ç¿¾mkÛ¢Pfoñ¦	åQÄýyª‚iê)4Í:â{«ylíïf¶¹‘•’A7–¸Îã‘Om—7ïÞ©åÔ!žRfÞËÁÁy¬as(þ:_µMÿ\0=\rmuÑëýy’Ýô4íVòXüï5á\\{ÖÊÛ<Ã#9ÿ\0df¹?´KŸ¿A¹›8ú5dáÍ¨‘î¾‚x4Y–häLË•¥OOzÐÔmüûï\'f=û±Ç\\WÏBæãþ~&Ç ‘¿Æ¢‘Ý,îÙõcYªMni)ó+á.‰p×F$B}Œ\nóµ†Y5¸6æh&pvòT«]O…¼Aªê×å»½’i­c\rŒWå\'~í`[øÆúÂFœÝ²1ûïå©${ñSËËt$¶:}sy¤Å3œ²’{à‘šÔ+ÊuíCWÑ¤¶×²Çcw¸·ÙÐ‚NzŽ¹ÏçXÉ®êÓ6Ñ{;÷ÍB¤Þ·]î[\0©#\0ƒÚ¼=µ\rl.ãu8\nç¡â’ÓÄ\ZÅ¥ÜwÝJÍÈWbTöÁ{&8Ù;ž—xÄÌê?‹\"¹Ø Æ¼¶ÿ\0Æ[·Ö·ígW[[Û¹+\0ëŽTñ‘YÅbñå®ÁµEÊƒúUÐN1g£qŸ$‘ßÖ4D›¨Hc·Àn1RÌpséÒ¨jæÜ‚2HéUõ8ÞÇ¬JŽämÜÙü«ŸxdfÉÎ=+¦’/1Ï9¥aøe©•^ˆjõ8éDËÂ#íU÷\\&IF®ÜX*±ã¥#ZÚ¥ÔÔ^ÍœJê7QêÔ\ZÕÈûÁ«¢’Ê,`¨üë>m>O?Z\\ë©\\¢Ûj¯(ùhEu¸VH·Táx«¡N*EÆèÙYƒ¹4ÙY±œÕHœqV×.¹Ôß¢4KK‘nÀËQç\0”Ë‘…÷¬Ùî\n.(½¶%®£ïoJƒÖ¹ë«¦•Š‚pjìŒgcG—c sZjŒž¦\\zd³¶æn=ëR×J·@<À§ëO…%¸}‘ŒšÌ½MVK©míÑ•÷°=Eh£)¹$oˆ-#(AL‘cÇ®\"èß[Lc™Ùd\0½Y‚[Ñœ	eæ¥Ó}Æ¦–§RÐ©éM0`ñYz~¦ò`Hr+~&WÅg&Ñ­¯±\n»(Ø3øVÖž2‹“Û½d:0—ñ­4²“VG=«EäêmŽúÖ†ÝÝÛZ¦7Í*Æ3Ó’\ZÝ±“TŒ*e™x­¿iï7Šmw¯É	27¶ÇëŠ¥gczSå‹f|1¨hz‘{˜Õ­åoÝMv··Nµ`iˆ§SµpfAÿ\0\núSWÒ­õ­2{¥ÊH¤œlpÃé_;%”¶zìv³®Ù¢¹D`;âº£Øóê¦µ>6VžjÉöhw¡Ê¶Á•>Þ”ùæ[xgÎÔ8ô§ºÈÉçŠ†òÜ]ÙMlÌBÊ…Ž¸#^‹Dx\'ÅP©ã»Ö\\gtDÿ\0ß¥®xHÒ4XÈä\néþ-Bá3™‡WX‰ÿ\0¾\0þ•É¡ò™\0êièŒdîv\ZæÔ½eq\n½?Ý˜€;–´OŽnäu¥¹ùvŸ½þ4é|[/•æ½´G~8JÍÂí³6t7Éäø%ä$ÚÃŒvûµÃhºÝ¦®·$ÁTå¶‚	Ç½YÖ¼s-Þ5›[F‹ #=×Ú²--æÐï4ýZêHä‘eL°ùÔOO_ZÎ¤g£‚«ì“Mþ\'Ð±¸–%t`ÊÃ Ž„\Z©pþ\\è†â4/ÑY€-ôõ®Iø—¡i–?còoZ8äa	Ú¼!9\0óÔdÀVv·ãO	k—Ö·Wv7ÎöÜ#n\nG9ìÞ¼Öœ¶8š=e# u¨în’ÆÙ¦‘]”c!qü«Î­þ-é–ð,mitåreyã<õÇZWøÃ§²ü–3À˜P“3Ò—dÊ²#¬2èE2dÚkËm¾-Ãko\"Ä‹´\0Ý‡JŠóâË]C$)h‘ïR»ù%sÜRq™bâø’KFžXthTŸ—þ[2êÞý)¾ ð‘ðüqÞèWÛËù9o3ê…/†|iá=#O·I†¤\'Š3ÁmÙëšOüGÑ5CŸør-* ØÃ\ZZ•flxîKûW»—‡•¾aŒr8&½Ôg¼Ÿá¦ª·ÞÃÈX]pOS»q¯ZÓˆ•wŽEjÕ‘’ÞÆˆàbšdQ(?1ì?ýt¤…RIÀ$×+£êo©xÚìîÌ1Û:F1Ø2f°u-%ç\\ Úo±ÓÜÂÂ©[ÃN*ôßêdEs³ÍÇcSSâ\"Fœ\nÃ“Žj†¶Qívà·Ì2dÛxÄ>¯.˜l&šáT´k	^@êNâ\0Š†Ö}Nm!¤Õ`K{†”¨á°¹ãMO2O–ám.uvð ‚2FNÑ×éRI2T~U¼«ö8œ·\'¿âÎÃ ŒUT«h•î8­«— — /½dÞN$(3Í[ñ>‰.µ§%´wfß3+»’Tu¨¬pêÅ-Á	´nsÎOOÒ¹#SžVKÕu/’\n\rÉëÐñ01KE!À¯eœ¬RisŸ¥39£<â—Qf—>”ÌÑš«€üÑži™¥Î(i\\QœÓhéT•1Ù¥SùS3@niÞÂ±&h,zŒ·jJt$ÝA=é€ÐM=Äz_ÃñæxWÅ>BŸüuë˜ÕXÿ\0fbN‡æfº?‡Å+ëf‡ÿ\0’¹[ðçOÈ\\|¾½8¬$õ)»´kø†å.~	è-(_9.ÂÄØç½~CôÍx%×ûY÷¢°òøÜ3ÎEtèz–µà=Õí¥ˆÏ$Ç~rÃæÇÔÖ‡¬n4½~[{”d}Ÿ.Fr:VpMFÌÒR»=Rh¥Ño ‹ýCvS‚=ëËÙˆn¯G¼-ý“uœãìòè&¼Ñ›’jŒ¡©è?\r§\\^ÚHÙVdR{ŒƒÒ—[Œ/‰ q‰Ïâ+ÀW~G‹mW$	RXÏýðHþUÓxŠ=ºŒ\0ÿ\0Z	?T7±Öµ¦vJ`šÄ¾‘IÛž¢¶‘<ÛEãšÅºµs6+)>U ÑJ;pÀõ¥’Hí´¤\0=jÑC~õÎêŒòç$í«õÔµ¶„WºühÐ v$ÖKëS«4@;óU>ÊóÝ™Ç=\0®ãLÑmO0’\\nÇZè§sÕ“Š¹æÿ\0ÚšÅéaøÿ\0žjN*„š¦¡›&\\7ulƒ[—ö\Z×†oe{pÂÝùlÜ‡Øä`\ZÌ´Ó¯uÍG{\'.Fù{UGà1Z´­k¤÷¾…ûi.ŒÎÁ‚¸È8­[y«žõ.£-¦Ÿa\r u•ã]»S¶A¤MÁe²\02V\"tS›µÙq	VÉ­+fÜ¹¬Ù˜À«¶\'+Ž¢¹$µ7Ý\\uö	í\\Íì½k¦½å1\\ÅúpH­\"îCZZ¾óÖ¬OäÃ2$Î¸äâ³-å1MžzÖ¤ñCxUÛïŽkemÌšÔè´%³.2ÆÒ)ãsÅeø£HÕ!¿mSLFa Xá\\ãhàã¾{Ölvë”aÐƒƒV´5H“bÞÎW§,Ok¤¬ÌÍtÎFk-GP¼i$·‘]¾ñ1í•°‘}šÐ[+ãæ«²½Ôÿ\0zG?ZlV¸9jÎSÔÞ4í¹J²n\\ŒÖÅ¼2:–8Ô˜«p°Î¬g\'bÒ$†ÛróÖ¯Z!G#µ@2¸=ªäddV-êÐ§¨‘¡m3rªp~‡\"»ÿ\0Ú¢Ûß^2AœvQŸý›ô®XPv±8äW«xfÑ-4uA0y‡êkjKfg¶†½xeH|$G…ºCÇ¯ËŸ×5î\ZÆ­m¢is_Ý:…NÕ-ƒ#c!G¹Å|Õw%ÝÔ·±y]÷³ç9®¨ncYécê<å§©¤¨5<CâÜÞ+ÞƒsyœÄWN|Á²ƒŒ€H¯Pñƒ¥ïÄ	 uVÑ@>øÏ?]ð^“i¨è*æ¥ äwâ©»÷Lò³Ã¬L?\nŽPøÚÀ^.©áåÔ¥²–ÒEdœÀ\\\"‘Ûs×¥lë^µžÁþÏ\ný¢& dnÇQÇ¶j.ÖáäxëYÏv#¶•Êóò!c[¾9Y“¥#äl¸Æ;/øW±ø#KM²TFÞaR²¨ÁuÁÆGc\\¿ÆëX†ôû\Z	EæÍÀ\0H(Çú\n4K©àä|½zTx$äÒù›[¡«–ºUýôË¥ÅÌŒ2©LìGÐ\n¦˜òÏ†ô¨óŠ·.¨Ã#G-•Är\n<L¤~SÂë…0¸>…M+ö\Z çšxnzU£¦]/XX}GJpÇ\0\nBçÓŠp\0ŒÓþÁqŒqN7!2qŠ7O$’;é¡„eî\n\0=NHÎ¾ˆÓí…¥¢DJŽIîkÄ¾\rØ¥Æ»4À1µ…\nÙ™?†?Z÷D¨“èLV·àÜ˜5æþÔ Ò|I<Ó‰MÇ”Œ¹°==«Ò›îí^Cqu5–§4°6×À{×&!òÔƒ;è+Óšò=Oér!H~Û#ŸáKþÉY—‹%æ©]ZËqËyQ˜]œ€\0óÀàWê6ñˆýÅâ)÷‰Oô©´¯ë÷…·(Xõ\"ý+gw«8ïÔ_h×.š¬7ö>Hóƒ˜ÙÏ¸|ŒHèyÈïŠôÍY‘!aµÉ&¹¬H ›…ÏýsáZp]ÜÜXŸ´6çÏP1X8©O˜9ô±Ïjz¶·-¼Ð[FXyª€y„˜àcÚ½JÞdÑî‘3´gæÏ8¯6¸Kç¸ÿ\0GÙÉã>¿•h6‡â•´iÖæÓpžcg¦q÷zÑ\Zo›˜§;šž*¶Ô5+«¬ï~Ëj2Ë˜eÆ{wì*•Ìeõ6u×ûÆ¹1«kS/É8ðÕÏ_êoysô¾vJa@ÛÉÍu¼-h¿i%¥ŒhKÝ¾§˜wÏjMÆš	¥>õÔ¼€LœÒîÏCHyéIíK­€~â(ÝLÏ4¼Tê;9£94ÜâŒÐ!û±@oZfx£4ÓÔgœÒƒšfzÐ\rPÍ³LÈÆi3Í+ô £\"™š3ÍUÂÇ¤|4!¬üEþ+%ÿ\0Ùÿ\0Æ¹íM€ÓÈ?Ýþ•¿ð´o›YLðlÇrÚÍÈŠÝ£Ç5Œ¾![SÓ~êóGàM9¡ePO ‘±úVö¡¨=ÂÆ‡cx^iáí6Èü;ûj[´ú”²I.Òÿ\0ÅÔ(2síUô‰\'Ò.’U‰–Eõ84ÝXÓWQÔæúµJ³w¨ÒìuÚ¿Ÿ-µÅ¤[Œ²FÈÉ*@­yÓøKÄqý“vsýØ‰þUìzV½u-¬M0P¬:™3šÚ‹\\°.#–æö-ŠÆX¯hõÐê¡†TSW¹âvþñ‡öë·ZsÛÛÙH’9‘×$n¦sÿ\0ë®ÿ\0^ÓÒ÷D]Nß[€Aþgü*×Ä]sJÿ\0„7Q²[ûYn¤òÕ`I•Ÿ;ÔçnsÀü+Áš«j¾Ô4Æ;¦´‰“<£n+ùc•iMûÇFÉ£­·oôeÀ¨ÙÈI^”i2‰ô¸$Ä¹©Ø`ð*$R3n-w‚+&}63Á­t2gÖ±îZA!ãŠžE¹iµ±‡u¦Æ\n?ZÍ®¬&-nìùŠéBy¼Õ[ˆO#mJ²e§ufeÍ¯jOBb#Ýúõ•wyuuòK/ËýÐ\0¯$@pES’r?\Z~Õµa{§tŒe´RÜóZ°\"ÃqBÁ³ æ¦¶Ü÷¨“°÷*²îcšÔÓ¢\'Š®î##š×°ˆ†0‹nÌ¦ìŠ·±m\Zæ¯cÈ5Ùjq`ë\\½Ô%É\0síU4ã++š\'4ÑíÕ¨]‡z}Å¤±>]õÅ5F*^ä4‹JDœŽµa*Ÿ”rIU¨.Bðãª÷&ÖØ“i\'¥Ny.àÝ\r*©ÅEÊòoèÕƒt¨ß ŒqSÆX¹©jèvÐºŒ6óšµ¥g,¼Š½x¬Ú°™[Ypª¤ûWiáïÂª¶$a#SíŽAúq^{¯MûÅPr+=F[K“/üó†OZé »œÕ[KCÛugÐ|I§L÷±-ÊÚŒ³)V#¶ô¯&ño†M´:†ãfTFl˜Éãñ^ŸlG© ÚBG=Ù\0zãù\ZØ¶Ô#ÞLÁYÁ\rÈ5½IrËÝ9ÖçªFþdHÿ\0ÞPiÕÀ¯ŒoR†Õm@E\n7Æ[ôaTî|oâˆGîì´é×æD`\"ô•U±…ñ.aã¸jã¡\\~ƒó¬ÿ\0	üHµÐí\"ÓÞÊyÛ~âÊT\0{Ö_Šõ}S]Ô÷QƒÉuŒ ŒTzîs\\Î’©ö­Øƒhµ÷‹SÑÂÏ©Í>¤[É7--Ü{Ü`’Û¶ð3ßêZ”Zœwä$¹8#àÏ5åVW²˜Ðy‡qŒ×]áËä·Ñ7HÁÈädöÏøæ¦z2lítûK{A!…6yÒ_“Ë§Ú³<g¤Úk¾¾³¹MÌ±<°ž›dU;M[±¸ûE¼sFrK«Éäèº…Ã\"µ–OÉ\rbâÝì|‹0«»øoâøG¯Læ1\"dåIç‘Ú¸IÈ\rŽœV¾ >j1ÇB?Z¥{Hõÿ\0ø×NÖcˆ­“$¨Ç<ÕÃÜÞ#Îd\rTÚL 	ny¨I“»»,MpdëÐõª¥‚çhæ“u1Ï iÜd©±G9É¥ÊàçÒ¢Ï4d“Åc¹ø3ÿ\0#&´ž¶È\'ÿ\0ë×¶¢â¼áEô6>4½77PÛÇ%‹ i\\*—Þ„{à\Z÷+[Ø®W1ÏƒÖ7ùTÊÜÅ\"ÙèkÇõ0>Ûqÿ\0]ùšö\0r8æ¸«ÿ\0Í<í,W‹‰$$©AÉõæ¹ñå)ÅÄì£R1Œ“ê$ÖÔ}8«~…^íW_©ü2¿›>UÌMìxªö\rÔ´9–ætC/ÌVAÇáÖµ”u8e{y%É#;F`Œ¡éÖ¦´U“Jó;7 þ&zÃ=„W*JSå{ºiBýLëI–;‘#.@5Ñ¶³nÖåì”#ö®ayj”\nÎx©ÆM#XÑ®dE§Ï\Zí!8î\r;N´–\rNG“…evýOZÖü* \0¹¶2+ª9z¯’oFc,%8{ÑZž\'š3Í0ëJMz–0\"ŒþÓK‘B\0 œSNzÑ»¥0°üæŒÓ3Š]À\Zv`ÐúLÓKQœŒÑê·J3MÉíÒ“4ïqÍžÔgÐÈ£ Ózô£ GøPâi¨/­¦?ñá\\vµ5ÄÑ(iòÑÒºÏ„íÿ\0û…?ÅlGþ<+—šiˆ\'‰Øà]ºcþEdïvÊ{/ë©í?a[\0éñU–6—ÌãÅØóø\\¯ÅÛk}bÅ-¢Y#w™€ÀnFÓî~ö\nê<9m-žŸ©[[üž]ôˆŠÇ8Zäücjöq]’‡gËï×4’J-¾„:×¨ Š~\r¸’óÄš|rð3aânGN\rw?¬¡ƒÁ7ÓYÛGÊ4[Àq™`g¡5áY´Ý^‰bk\\G±_û‡#×úW¢}º7\0#.[§4•9[šÛš9Çáê|ÞÚ>³>éŽ™¨8Áf²Èxõ\'­à]i´ÍpÛ¹&¸»!8‰OÔsù×­øÖMvmÉÐ6’ñÉö‰ABB…û£=Ï=¿^¥§Ù®ÃMò•(\'½5~¡{=dð¬áôX””fR=95²ø\rÓ­q>\r¾_ÞÛƒód¾1ô®Í›”·6Ž¨lŠ§ŸJÆ¿ðr}iI0*k:pMO2[–¢TŽU^1Ò™+‘˜ØóÖ¡i2q‚(•š\ZVcf‰*Œ»G\0Uÿ\0\"W(ÎjDÓJ8izúf¦4fßÝDŒuÜäŽ*_/Á­)P+aEPš`²íâ¦i\'b•Ø©	Ü0+kM‹iåj¥VùZÝ³ˆ$gåÎEtPŠ¹2uR	+Ž=+Ÿxñ *^k¢Ô#S+gŠçäf£XbSælÚ’÷KWvñ\\iÈ@°<¶:W1yd-ù+´²‰o,¨9UË‚¹MIžbèJô®u&´F|»”`eÚKëVÒd_™yìk\nÖéLþT¾¸\"ºd\ZhÇ­e4ìQòäŒ2TS„ŒGqVÀÛÁSHOû–•˜Ø×pç­8¹QŽ†œcÀ¨¤ÊõÖÚ\nâ£á†M\\†RsY½[=1SÆÍÛÒ¦B–Æ~±.û“Ï±mßí:Å¼l¹ˆçp=09«zŒ¤ÊÇ<Ö}¬ûgëŠé¢¬sÔ:„º]’OÀ‚¯Fíq @Ø÷®PÝ,OÅ «Pk‰	ù’UÞ)ÇéZ¸ÝÝœí3µkHlT<×ÜõØ«Ÿ×5Õí±¹Ûø®^Kö¹n_Š|cš,…nç[Þ—¨!†âÏÏVêüG5V_	èa÷ÙG5“ÅÌ‹ù1ÏëI¤Ýi:|›µÈáêI?æ¬k~)Ò%(¶/,Š%b gþŠ,¶AfTmîÛ\'Ibè\nõüEO§¼’µ›Á3)r|¥RIÆ{U{?Û}ÉÄª¾é\"Zè|û{›U•J¼yá‘¹ˆæ¡¦Ç{nz…²CiiÓç±¤Ö-\rÞƒ©Z†Uiíeˆ1è7)5æzµÖ»¥[Í;S¹6¡ráœNzóÔt¬ñÄ\Z&Ôä*Ãi49\\SPm{¥¦–§¨ø^S“«ØÊIû±I“UôëHí¦m³«û[w[]&É`ŒŒç…ÅV[Käó#‹k¸&´ä•µ\'›AÜj7È«>d8ÀÍ4ùycSìä‚åRi£’MZ0ÄÝâ—ì€•Á©åiì;­Š¼ÑÒ¬‹)™° Ûš½ÿ\0Î¯…&É€=ôÿ\0\ZVÔw!´³µ6Ï6_Ï\'§jô]4¦+Ä›äb»·p;ô®	¬µ;(Ixp™Áùçð5µá>•¨E+¡	ííY8¾kôèz¾‡©Èoæ³¸f,Œcç‘œ×JÇ\nN	Ça^g&½mm®Å«é¶’Í§MºiÞGTmÜîØ	ç¥vÓøO·Ð!Öä‘ÖÊTYùd±28õ¡^1³4Žç›ÿ\0ÂÓ¿¾šîÓ…´±œ¢—$ír1Ö¹ÝKâF§sD]#^s€+_U]^½–ãLÕ,¬®[!MÒº6^Ø®8øXéšÝ„×:¾wj.ci¾ÎìpÆìåGlô¬©«üHìÅº²zõ=‡E¸/ iŒÇwõ#?Ö¯jðy@Ü6íèzÕ»±a™kq`ˆÐ¸V„¯M¤pEdêÆå®RIŠ+€EsB“q{˜MÞ7E$ÆÂ¦ëkO5wo#ž•`Xÿ\0¬5ÇV/›BIE<T\rÄëÈZÑ6`¾k>x¤Šå0ÀztSöˆU$œ\rf™ŸCJH5ôláC³Å\0âš\r&y¢ý€~I¤ïMÏ¥8ïœÓ\0Ç½!&•JóœšRSG˜ÜÐO9¤ëE4ôßJ\\çŸÒ›œP(AaÝO¥Ý©3Ižj–ÀIÚ‚xéQçž´»³Þ„Ißü*?ñUc?zãé\\Åêã_¾—’üˆk£øTâ²ˆzÁ\'ò®{P\'þKñé{7þŒj–·)½\\ð`œøråÕ¿åé¹=sµ+”ñµÐ\ZœÒ1gË.O@+´ðBƒ¡ÜFG?j<÷£ºðTZ¥ÔWZœŠ¨’–X@ûÀ‘ÆxÇëEI)oÿ\0çœmV3Hâ<9Õþ©–Ð»• ¢»+ëåB·‘pØhâ$«ÓƒƒÎOíé]†›a¥[µ‚(»…÷\'·ò®\Z}õï\\ÜÙÍÿ\0k[_#ÌcˆÝ·/ž˜ì+¦kµ´EÔ¤¬ç}L-~çQÓtß³ZG7·Œ¶Ð´)¶BXÕyÇ$ŸlÕÛ‹\r/KÒ­ío5á%ÜQì—ì[a2œ‰Ë·9êEy÷‰üZúï‰–æÕÞ+[\\¥³t\'®dÀîGOJ­§ÝB$frÒ»³±äšª•\"åÍm…IFÌéô›Ø­µ¢`R±c$×§Å0–Ø2ó‘^=É%ÆèÀô¯GðíéºÓÊ19L\nã©½ÎºOBô®7Žj´­Ž;ÔÒ©\rž§Ö¡!™‡ÊN{×5ît\"œ 7é°Ûo`Np9«oÉ%GáPíuÎi\r5d½I·*(ZIÉàÐÒŽƒ­W˜„Í\\ª7¢i¢Ëdï+—K©.u1ö«:Íç\rÅjø+I‰âûdè¹ :\nÆæ‘´½Øš¶6²D‰¼uæ·â¼¼ãhúRÝA{6chôª·ŒŠ(Ç5Óeha¬‘›«É¶fõ®zfÛìMjÜÈ%±bIîkë!º×%y6õ:è­¶’ª£)vùN*4µR²ò7~¢³ÒM¯Ë\Z¿â ]ŽàÃk—ádT‹læüA¡´öøxtÝxù”œgð©4‹Ðñª±+KQ»ûD.„•*}Årv¯ö[‚ ¹À­é»«¸òîvG‘•æª´8“v0j[+1\0cš’eç®E9%°\'Ñ‘ñ·é¥7®\Z’LÁ¨ÖäqéY¸¾ƒÓ Í§$Ó¡£;Q¹íO–LŽ*³Ÿ”ý*/q4sº‹ÈùázÖTæ6AÎ+KZc‹²ã%€¬fhðAúâ»(ü79j^æüxU·5:NTîÜ+*&‘ˆ\';M,ó<•­®dÑªú…ŠÆw¦çìTíÇéUZþI\\¤{¼ƒ·w^9Íd²4¹rv¯^jÕ”Œ?»ä¨Áã·­/Q­\r›HØ» ¯MðÏ„ìÚÊÞæ[x§{ˆüÕ’EWƒÐ\0{ñž}kÌâ–\'1‚=úÖï‡¾#\\xybÓµ¹¸ÓÖmë5¸ñ§÷0q•Ï<3@¢µ»=N}ÑmäE‚ßsó<\nvàvâ¼÷Å6Ðèº¬?e	äÜGæ!#k	R=úuü+GPø¯¢Ks~ù\'Go†#ÄX€¼úf¸+ÝZëÄ:±¿¹„[Æ¨\"‚9 çÀÎI\'>õ*íê;$Ž«KÖïíTª…ž+8-}ó\\ö¥¥M$ò\\[A¶6%¶\'Dö°¥K‰£MªÄ\n–ÛU’Ã’TðyªWƒº#SŸftù[ úS¾õÛ}‡NÖí™\n¬w$b9û¼çÏ×ó®_[Ð/ô+.ê?Ý¸Ýƒîºû\ZÖ5#-6`Š\"Nù¤3Õ[oç¥´¸¼ÓëŠdsÞ³·çøºP\\ŠOk ·L	Ã~µ2jS¦6ÈËCYA½M)|)ZãHÞ\\2nõš¸ž!f•¤`¯pµÊï¥x5pG è¾ð~¹	šåÍãÈÄE#ªÇÎçëšöm Ûi’8¹³Ž–P0§#Ž•ó\"Ý1[ÚGu$¯Ù5	Ñ–Í½0;m9§l\ZÉÓ-K¹ì_\r4‰Ôˆæž3êB·ôŒ~éÏ(’Mbó#û± þy§hÿ\0-n#Õ,ÚÆ°¶å\'Ô©ä~µèV÷‘ÝÄ²ÛËÑ0Ê¼nÄVM$h­Ð©§èVš~g¦ÒÇk^O¼qÜã½Iu£ZÝ…ó7½6?¥\\vq6@®JãÅ7Hñ„óx¬¤é©jµ*úkac3Â¬Xàšpj§ã];É#e‰ïV¡1³âIU¹5æN2^XšEÚ7c‹qY³)ºE\'3[þ^œ~ö¥\nñœ“Šó™|eáyµEg¿¸M¹t8½s]ð•c4ä‰H¸»]œ)r3Q÷ëNÉ¯aéÍ ëMÍ(#8¤‡Ú˜I—ž(â=)¤}¨A äb‹ÝXÎi4´S\0Î=ésH=éhB\0ii8íAªÜæ@­]/ÃZÖ¶3¦é·	Ïï\0Ûí¶õ ‹ácã‹P{Ã/þ‚imü)ªk%»–+gKFÔ&h|5³Ô÷è+¤ðŸ„.¼\'Õµ%_íf&+E,ÃoÌÃ#œöè­ËïxÁë)¼½[Í^Oõé	Þàÿ\0sÑvŸ/Ro®‡Wa§E¤Ú}šÊ=‘“¸´–cê!Un#‘å3=Ï1€z9¯#Õ>3jWr±Ó#p\0Yåi:ç·ÛÖ¹MGÇ>#Ôü~5°ÆµVyÏQÏëWNÑDÊ.OS×¼S}‹g“Ä^\"û.œìU-¬ã+æŒg\rYŽéÏÒ¼ŸÄ¾/ŠòÑôm\'µÑxÊ8d­Ô– ž3Øz\nåç–{™šk‰^IåØ³îOZjÂO@OÐRréR][6gojÔ·DƒŽj¢ZHW$5µºÉi2#äæ’‹ºeé¯\r¼C8ÜNOÒ½ÀúºHäVäaîÿ\0^¼‚ös$‡ž;bºo‡šÀ²×RÒVù.Xmöq’?>”UzYKsÛ%\08ô¥UiK\0Ö¢‘±žkŽçRØl§­Q‘þb*W}ÀÕT°SÏZN]‹ŒE*Š3Xú•Ñ\nÙü*íÔÁqùW1ª]îÏ4µ{\ZEuf]ëµÄûòMz&˜éo¦C\Zœ\0µçV«¸´¤õéZÚ³AÅlã§4\'m}NüêÓi?¥Q»0yæ¸Qâ+¨¥múšÙ‡X†êË\"îÇ#<Š©I•Ù\Z)4lNãŒU+Í­–Z©ö°¤ETš÷“ƒPår¹l÷œ‚sÚ¢kÁ9n\rgÝßŽÍY¼Í’Ø™¨P¾æS™¹%ôeHšÍnËwÎj¢0^sS$ùZ(¤dçsWM¼Æ5¶¬®7kI|©C[–·9AƒC°^åÙXäÕvcž)dpyÍBî*$´5É¼Î9ëUä—\0Óäõ¨¤bAÅd×@oSœñ „\'ÉýkžóŠ¿¨­-^o2ø€GÊ\0¬Øðòõ®Êq´QË7yáº;B«œÆ§{ÑàõTBƒ†ãéCÛÈ¿q‹Z]¹4·o:¨8\0qÅ*HÄm^†ª°˜p@Ô…ÜäÉŠl‹3Eqj»À£©ý3šHu#lþfœšfø÷	‰>˜¨Œªp9¤ß`5íµåAµ€ôéZ–úÍ¹a•Éô¹&·zÃ‘ô¦üªpÁÐÒ½EXîÆ£Ëã zTŠ±¹Âµpé,¨AŽMà~z\rZDXíÏ\\Óbå:å…Óôô5ÑXêÒ][yL¦Xùˆâ¸+ME{9úæµ¡¿2!pÝ˜TKRw4¯</³z«§í‚å²Ò†Ï–:sê;ôü«×<3©è,ÿ\0jHÞ%uO:ßb»±œqê;WQ§êKg”“÷Ï¸œcÜŸJÉžî=fëìáÝ¬£<]»±þ_AUÉ;t\Z]YÊîéMÞsí]°ðŽ—r¤Cy42ðãúTzÃVÚÓíVoÜ9ìUô-Íoí#a&qäûQ»&–h¥·Ç4oŽ¨êTÀÔYÏ®j·Ø.H¥ßÎC¸÷¤ÜGµ-ØÑ6y4àärj¹8sš@i=‹©;/5ÓxgÆš—‡.KÚJ\Ze2ÀàÔwÇíšUr;ÖrÆ«<;â=?Å\ZjÝÙ?<	ao¿zñï^=£ø’òÿ\0[¹²»…Ëc´í9à‘\\w‡üG} j‘_XÌREÀpIÛ\"ç;X£Šê´Kƒ{xn¾L1<†ç?Jçœlõ+V¬kkž+Mâ8¼ìë‘ÏjoI©hz­à„Dm\"%pz¶ÒGëŠÉñ®‘s=µÊ# C¹Ôg÷ª‚uP¸Ã8Â–%+úŠkÝV1|CƒÔõEÿ\0\nå$•¤³œ±<ÓØüÜÐdFÚ­œwMlÐÕº\Zùâ“MÅªDŽÎhSsK“F‚d€öoÎ•±ÆÓQ‚hÉ£D6‡í\0ç4„óÅ3-špç¯Z‡fŽ{QÐQÎ)……íÏZPi¹Å(æXQÖŸ2Ï2Cm$²0TDfcÐÜšˆ£$€+¢Ð¼I„ËÞ[éÑÏ¬çl2ÜîÙ‘ƒ…NzŸñªI½…s¼ðoÂÁÍCÄ±£‡@c±åO_Þtç¶ÞG<×w¬êz~…¥<Ò€V¾PrqÀæ¼]þ\"xÇX»ÛL«+¶U €vã9¨%>+×Qº¼oµ8ò£VpÎFs\0 sZÂ\ZÝêDµêt>?ñ6­w{e¥•ÖŸ*ÿ\0©ŠN&bA‚õ^®kŽjÆ3ux#Œ¿ÌLÒe‰÷?­t~ðµêÎÞ\"ÖÙÕ£bð)<»s–oÎ—YÕ’²ç#5ÑNœmyèCŸHœö‚™WðÉ4¤‚ù#õ­Q3ÈvÆ\0>¦µ4ý	„’Ç9ëZBŒe¤Q2¨Ö­œÝ¶Œ²œ”ãÜV½¿‡Q»áPuâºØtèâPÅzW9â}Y`‰¡ˆÓ ®‡J(Ý™)Êr²9}Rtˆ!Ç\'^vÖËÁr2äS,¢3™.Ü\rˆxÏ­S¼›|Ÿ^ÕæßG#­+hW‘÷\Z}¼o<sDÛ$ƒ«z0ä\Z¯ßš‘Èxè=M`Ê]Ï£´kÿ\0í\nÂ÷?ë­Ñ‰ÇVÆõ¥šUë–ð¢\'ðMœCïÚ¼‘7Óqaú\ZÙšF?7jæžŒì‹ØoÚÆÓÞ¢yƒ:b›#)n;Õy@=«Ù¼R+Þ\\mSÍr×òùÞ¶ï$>•Ï9\rqžÂˆÝ)Y#Û`qÀ­m7Ã—:„FvFŠ2p7)É÷ÓÞŸá-(k\ZüqÜ©™†xùHÆ}²kÖ¾Ä‘G€¼×]§«9g6y„Þ\rB¹bIükÔ|3=«¶‘ãoló^Ë,\'ŠÆ¿‚,Àf®¢[Ž\r#>¡yi!ŽpÙõõ¨ÿ\0µ$“¡#ñ¯BÕô[Kå),gŸC‚+Íõ-.ãHºò¦\\«dÆÿ\0ÞþuÈœ·Si9®£üÒç$šB\Z‚9Õî4}µ=iùÕÉÁÀÇjØx5[íH{Óá{\Zm¾„5bàv=MiY\\``šÃYf®ZÌ7Ü˜½lo4ùÖ™$§¹ª\"l¯Z<Ìz‹\\½‹Ë \"¢–]¨Ç<`ÕpÄ\ZƒQ›fŸ3wØ@¨jîÁ~¬äå”M3HÙäÔ0¶&Z\\§ŠŠ&Äƒë]}N^·5¤  ÏZbNT`óFàÈ3L1“Ò‚GHÁºP‹Æ{T$•àŠ•Çl5±~	0˜©HÉÍT‚	«Šãm4ˆŠìÁ\0ÔrÛE)æ0\nb¶OµZ‰ÁÏ—JŒÝ†ªKeqÞEõk O4Ò\0¥6®C›…äI0„ý\rmG©„‹çëT¯ó‚HÇÔzÕF–6C‚Aª@ÖþÑyXF€~õmX_ZÚà`Ã¾\rpÑÜK…–´­õmŸë¸Gl×‘ÌÛ fCéšÙÓuk¸ã¿›,xìsŠá-µX†dÏLWS¢ë‹\rÂ¤2pøGú\ZRWV¬kk>‹Y²ûNÐ²Ÿ¹62x==ÅyÖ§¦Üé—9Ô®åÜ­ŽzŠîµQôÙÕ-¤>C7ú¾ÄŸAPÄ‡Y²šMÛcaˆøï‘ŸÖ¦œåB<IÍ«7öRX^Km!ðGB;\Z©žqÞº“º¸¶9â‘ŽÜR¼S[ùÐösÞÆ˜A¤\'ê_¹:·kwÃÚÇöuôo)c8uÎ¹´ý*Tr¼ŠÍ­sÛ.`’Kk™b;·DT\rß/=ëžƒõXÁFÃ‚vœàäWEðñ­õ½&k{‚Í5»*2„pB)Þ6Ð­4\rßHLbQ½brr=kš‡4j5-§Éì×.ýOfËu¨‰9©=êsé]-i¡’vgAÚ€8¦ƒš^j˜“C‡J6ž(k°uóFy£Š(ØÒôïMæ–€hÏ)½(ëM ¸î´å8M4\nžØ3\\ A—$ý©i°º+j0J±ø~Éå¿\'kÞí8‡=Æ|œŸZï.¾é÷zµ™ºÔ5‰\Z!%åÄÓ\0Ò´ ‚Ã$¤ñëŠ½g~ðí¾‘b¦Yo‘•~id<–={}*_JÐM<…šêå€@?…\0\0ëÜþ5èS Ý“9eW±¶vksö:Ú+KFÍ…yÀÆw·ñg±§YÚý \\¼(Ž»q°{žôû\r1`RˆÎ=Ï5[Y¿M6ÞI3†è0kd£nXœò”›0|g¯FŠm` ( \ZóvœÏ1ä’M\Z®¢÷—.K1É=NsÍ?GµiîW#Œ×4¥Ï.TuF±Ôëü7¤†A<«Ž¸u®aŒd-gZ?•Eè)÷7žLe‹c½HSä‰Å)s2kQŠÊÙ€*[ý+ÊoîP¼òÃuê}+_Äz³O3(s€OzÁ¶‹Ì$[¿ ¯;SÚK•lŽÚ0å\\ÏrÅìñÃ‚Ž;ûÖ,‡qÍ,³ùšˆž}k–R¹²VC€È§`ŽôÕ8P2}Ï¥gaž­ðÞÎk_\\]Í¼G{?î*Ä~\'ô®¢K€™ü+J¸}?JÓ,ç·tŠÎÔ&xæIv\'Ž}sWe}Î\rN&“…®kFwù#±ËŠªÎø%°iò0>õFyöäŠãwØê‰ãü†±fç­kn/fX-Ñå•ÎI\'ðÑ[ü7¹(\rÕàFêc‰7~§ü+HÓoP©%k¾l7Z»ªÂ«ë‚XŸÔ\nôÖ]Â¸ß	x:mUžæ;§6óG±âqœr}¹üë±žU…2MouXæž¯BâF±<W¨Ë‡89çÖ´µ­`òªçÆr“Ý;±É5†\"¥ýÔuPƒJì–I”Žk#YÓ-õ}9íßåó r‡ü=EY2‡#š‘0+‡Tîjí³<Š}2H.¤‚W`ñ¹SÇ¥IŽ$çÍa]æ¿á¡zÍ{gµn1—BOï0;{ñø×+Ù•`AxÅvFª–ÆJšd1h0÷‘iÛxv ”$Z[f€îOÓ@[ªãœTÍNÅ%Ìá‹+‘´1…»2×;{aq¥^4¨êv8<:úÿ\0õ«¹‹+\'µM«èi­iÇaQs&\"{ŸLûâ²…FŸ,¶&¤RÕ>½?Ì=ª¬‹$4R#$ˆÅYX`‚)D•ÓË¡‹h¶$$æ²µËœ@‘¥²já”(\'5Î_ÜîXç€p)B7w&OKdv¦®<ÁKŒi8Ü\rn‘–åîp\r#H@äR¡ù$‡åéE‰±mÇƒV!=ª7®Dp(bÐ \Z”t5[½H­Mh„njÊITU‰5:?­EÕ“Þ›#ñÅB¥5˜÷4\\ßæëUšÎ6}ýêÖ54pî b•V|ŒÂ•ôÔoï-kEi‚2LÊŠ½ìrW6Má¾_QM‚YapUŽ}«râ$€`{Q¥¢î‘“£åŽ{SEn6ÓS2O¹¯—÷A®ÛIº„Æ3Ç sÎO5Äjöi˜„Á¶}Ã÷ öôÅcZßÜÛH²#8+Ñ‡j‹&&®@ñ}‘ž® ‹&,‰\nóòžçéýk‰&º½Ä‹z‹g¨°%þU”àÏð·øÖ6·§}‚ù’0Æù‘§¡÷­)»>V\r_S394Ö8íKŒw¤o­kbFœæšsJI#4{Tè=ô©½ê&ëJ¬5“ÑŽö:¯ë“hž\'´¹FÛ“ “´«2~„æ»¿ê2ê>¿Þû‚ÂÛpkÈa•‘VÁÏÒ»ûAoütØÃ­®ž¤•Dcï\'Øó\"~lÔLyàT‡ª20j’E›Ê)i™ÁéN©l©r3ïLÏµ;¨¢÷”R\nZ}BÁš3Š)	Å ÜRM\0ÓsšP(@=kS@€Í®Yã¢H¾ƒšÊô­ÿ\0\nauG‘†BÂØú’*à¯$„Ý‘ßÍ-ÄÓ¢E7–§Œƒƒþq[–ë<{\0ƒ\na\\Õwç³+*Ž8¥l%Þ@½¸Fêç7k#jKµ†6•Ûå¼ÇÅšã^LQOÈ1Ž+__Ö’cVõèk€¹v–BI®jïÙ®U¹¥ud1¦÷Ïrk¬Ñmü´ÝŽq\\íœ@È¿Zë¬dcŽÕZw•Í*ËK\Z¨ûFI®^Ô‚ÆÈ§µ]¾»Äy®T»2È@9\'Þº±5yU‘•(]Ü¦Aºº$‚TœU;×Ëœp;UÌ›{n¿3u¬©dÝžõå·dv-È‰4ŠOZLç<ÒƒÚ±{”¶¼Žµ© À·ZþŸn#Þ\Zt.¤õPrß 5–?*ë~iéyâ¸e˜§•nOœlðÉ?…\\ÚB“²lïu»ù?³ÊÉ\n¡¹‘¦VSÆÓœÈŠ£gt&¶\07Ì½jç‹á³†éR×`@6ü:uâ¹kyšÞ}ËÈéõ®Ê´ÕHÒŸ$Ž‚IÇ\0j¬Òg?În”D…º*Œ’~•· øj÷QÖ­b¼¶šuo2V’2 ªHäwàWÈÓ±é)is²ðW‡ÓJÒ—P»ˆ‹éÁês²2xqÎük£Y£&›¨ß$QÄW1&¦|Ì+}k~n]\ZnzÚP/²u+Èy¬Øµë÷¿ZdóïSÎsCjÂä³0µ¹‰¬ÉSt|kbíCÍfºc t®)›¦Ú2Õ6“VQ¾QQÈ¤>\0§¢µ“LÑêL‚rk\'\\Ð†¨ZêÔbôã ¶€_ð­>”ô\'<T&âî„yÅ£²jT€«ÆÅYOc]}” ¨Ï¥_Ô4[M]ÖI?srœ	P}˜wŠö÷:\\›.P…Îÿ\0…½ÅvB¬d\r_CqaV…hÙ\rœ\ZÈÓ¦31Žµk#|ÀŽ”«RN7BMê™ÌxÓ@ßêvˆ|Åù®\0=P½QŽÕÀyœã5íîD‰‚3Åy7‹´C¡Ü™¢Gû§äcü,sòçðÍEý–aR-js÷×\"8Šó0¬~¼šY¤2¾I¤QŠêJÆ\rÜx<b£$)ÄÓ­1ãlÄ¦Êß/Zl\')I7N\r6ÄF­óUÈ[€*Šõ«q’ÚóN¢S‘Rg4ÄJ¥CP)õ§©Å\0O»Þš_&˜\rH‹¸Ó\rÉbMÇ5«m…ÍR„ÅN÷AWÒ2Ì²ª8lóP´í#Ui¥u<ŒÑ`µ‹13Nìƒ4¬îÒ¢¸)Ý‘Þ¡YLh8;æLcw@)=w-ß\\=âùlr‡TZlDía•\'¥Ik-–Í:K‘h	‘R•´ÚÈÌ×,¢Òï”Bs«’§œtÍkXL5}&{Y7ëº2ÝÇoê+œÔnä¼}ÍÉÖ¥Ó®šÞméÕ£*1M&ôOÃÔöóLÎ:šèØ‘„ŒñÒšÙ šsi„ñŠ›€œÇZMâšx=i¿JŽƒ\'Wô®·J”Éá=TzDGÓƒ\\jäžMuzƒá­påcÿ\050ø…\'¡Èæ£cÏµHÙÞp*#ÜÒ¹¢73ž”n>”á¢å¸4ÕÅ¸ÀØ§n=©vòGçJ÷—ó‚dÒÒ\0¤ñ’}5<V·ñ?û±1þ”õ2!ÉíHy­X<?«Ü\"Ó/öÄþz/øžuÌZë{”ÛüñIÙ…Îvœ\ruqü3ñ‹ôÐæÞh‡ój~xÅºèå~·0ÿ\0ñtÖ¹Çf·ü4	’á°~è\0©ÿ\0\nØ_„þ,~¶p ÿ\0nå?¡57ö\ZÚý­gÔ‰?kD9X›<(8ï[QWÈ›\\¶5l¤A…P)ÎM2öûËMˆr}ªŒ÷ioØ¿Ö¦©˜#;\Zõã;$Ž&®îSÔff$±$Ö+·½Z½¸ÞÇZÞ0Í¸×Vå+#¢\Z#OLƒ.	îk§Œ¬PúVfŸ\0X÷·n”jÁ#(\rvÒJœnÌ\'y²†¯z[p\r\\ÉÌ’ï`J¯5bîc,˜­Rž]‰°7AÍpÔŸ<¯Ðé„lˆo.C1\0ãÚ³Ùò1ÐÓå!˜“Ö¢\'Ú¹¤îÍb´ãZv9¦éOœÔî1Â½Sàí•£É«_]²m‰cDWèIOóåƒžµï?	4Ëˆ¾ÜÏŒ=ÕÜŒ»ÇU\nª?‘«ƒ³3©¬t1¼L ]FO,ü„’\09ÅsÖÖ³^ßÃki’i›j îkSYr×³ï\nHÊ@è8®ÓáFK­mò\\1¶ˆg€0¥Ž1ôÏ­wU©ìéÜç§iXê<?á+OZÂO~GÏpW•8Á	è:ÕâžS<Ç©ïZÌ7U@¶*+Ëçrw{ž„W.ˆä5{ÖrpM`ùÇ$ÖŽ¤æ’3œµË9]îwBÜ¥ø$9ëÅ]óÆ+28©ó‘EûÐ²œ“š€ªh•û\Z‹y¬¥+‘{KÝœTkŽâ¤vS“œÓŒTm¹¥îž‚…b\r8dŠ\0ªXÉNëC¤W1471,ˆ{0ýG¡¦ô©Æ0x5ka6T]:;lyeŠÀô«êÐx¤3OGÓ½n±Ü²µÉp¹ªº–›k«ØËgyÉTúŽ„zz°ÛŠp9¬å+;¡µ}àÞ$ðíÏ†µ3gpÁÕ†øe^’.qŸ¯¨¬€+Ûüc¦E¬xnî63À†hº²òGâ+ÄcŒ}k¶•NtqÎ¬¥0úÔ„åO5hBÔ±|¼Ñ)8¨âm¦œäš}·{U”<\n¬½jÂb„–ªU9Y[š™[iÜZ/\'šxíQ¯LÓÁÏJ`J§žEL§*¸85(<P®RÀ~:ÔrÉ“Šfì\namÇ5V$\rµW’MÌäŠ{³ÅUÞ|ÂqÈ¥a¢Y#är	ãa&…OATL»¥PGNi²NC“JÚ\\[\ZÏz±¦AÁúÖeåãL	&«4¦N½)„æ’óÃ£SÜu®“Âº2^Ï-ÄøòULJ¤unzö¬›52E¸Íwºp‚ÖáBÆ£\0Î¦NÁ©ÁÏ‚âH_‡Š°÷T\r]/‹ì’+øî`N™\'?Ä?ÌW5€;×DeÌ®L†œúb˜Ãž)äóíL\'Ú˜\"3ƒ×­&)Æšj.;0SŽÕÔxpçAÖ†:Çÿ\0²šå½+¦ðØ-¢ëCŽ#úQŒRZ#˜nÔ/ŒÔÌFò*\'5C4Ñ³ìdð†#á|=¥~6ˆ¥Lž\Zðúrš˜‡Õm#Ò±¿á.r~[	?ÿ\0ëRÜÅƒ~/ÿ\0Ö¬ö\'™é£éqýÍ:Í~ þ•a-mãÿ\0WIþê\\Êøžðÿ\0ËŠÿ\0ßgü)á$¿=-QàDÿ\0J.ÈêÇFO­rG\\Õ«CIý­«·IÀhtuÔœW$Ú†°ý.@ú ÿ\0\n`¸Õ[Æü‡øP?hŽÆšÎ¨ŒÌÊª£$“€rFMMúÞH>•æÞ9ñeüÒÉ i×77npd0HX8ÆJàvf®1æµ4|}ñ:kÉÎ‡á©¬¿»kˆÉÝ#Œ!ì=ûæ±n4Ðíí’K–žêxÄ³±9\nç¨JŽÃÂE–ÚêòE’ðaÈ^‘ŸAëZŸZ»2Ü)$äd×¡N\"»9çS›DQÂç$þu^öu	´Óe—ë6âRÜ•¼ªi¡šWd.|Ç«Ö0eùU(†^´ã”D˜k$ÝÙrzY\Z\\ˆbÚ¤t®zúì±<þµ=ÕÁlóXó±vÀ9&ªµG²8C–gÏ¨Nå˜Ö¬‘ù6ÞY\nOSYcã\\²VÐÜªNNh>¸¥ tÜqÖ±h±ÀóO^¾ÕîÄTƒ$pi¡_BT?lWÒ^¶»Ò~é’$É%Ú˜2g†ñ×Ð×Í‹ó3‚GîZ†¿©ëZ†™¥lŠÂk%Œ˜Ð8\n\0IìqÆ+H¦ä¬L´Ž§5Ë\\o•È-!ÜqïÏõ¯løw•à}7ÕÕÜýL^e¼A+:¥ƒ„L$˜@Þã<×«xV	t¿\néö·J#š(Èupwýk\\T“ŠI“B.í›Îá5¨ÜpFi—ššî+»bÝÞÞ5Åt‘Ú Þ¦}öÍfÃæ¯O&O\"«8ùÍq»s`Uî)ÏÀâ‘zç4²\rd-Æ	Óš˜ŒŽj&ÀµVTÁÍWsÐÕÒ™äÔN \Z‘¤1_#¤ñLÛÎE4¹ÎJ‘Ýõ$,£¤ßùTdŒŒÒ†©{BÌOŽüTÁÉçM[Šã“ÅN„²Æx£x9Áô¨ó•8¨·‘ÔR.ãÝ†y­xF¯l-5›ë~ÑÜH£ŽÛŽ?J÷|‚\ryŒa1ø¢ð»&×üJŒ×V^óF¾\0˜Šaàõ¥<>i\\b»N`SƒJynôÕ^:Ó—¯\\Ò=ENœT\0ûTÊiô$\Z•H¨GjNâ¨~e…5 9¨c9§Ž)±t&ð*%<S·àb˜®+pM4\ZcÇ­&H¢à,®pyªáŽÒsÖ+áOz` GÅ+€Ðä–$*À“NfÂŸSP3mæ”¤RB³?<*ëÍY‚#<É!w2Ç\0}M 54hNó/à+ª‡rF	<úVMŒ0[(ÍGqÁ\nr?:ÖÊ:…SÍCwbDúì+sá÷sËÅ‡_¦pJá¡ÅzêçIš3Žaoå^zEkFöbè7pÆ:ÔgOn´Þ•­Å°ÎM3£S˜ã ¦qY´®0,s‘]7†rtkþYŒÿ\0ß-\\ÁÍt¾liºÀÏX†}þV¢¥±ÌHsëL|“R>7‘ž*7À5/MM7>¯ãÒž°Ú¼Ì|N»o»°üøÔmñ#S`@[aŸöøÔr™r³ÔÄC°§¬+Þ¼‰¼ª;®Eú\ncxÏVôùGû¬E5Xö/-E;b×Š·Š5&äê7\'þÚ·øÔmâ;×ë{p{®oñªPópòÔuR“\Z™€üWƒ¾³pÜ™¤nÜ¹4ÅÔCÉ\'¹9¦©ŽÇªxÛÅ0h\Z+¬öä2E´ƒåñËŸ¦Gç\\ÏÃí*;=Mfæ#öËÆ!V0F8÷ ŸÊ¹íLþÖ¹mBñØíØyG7|ç¨éÞ»„¹fµP½.í3\n³IY5{‚òžy®KP—2rkoS›÷üúW/}1{“è*ëÉ§b`´#w5YÎM=œP–æ±lÕ\"XÎ)Ï1Žµ\\¿ÂÄš9¬;\nî_9¤…™û}ÚŽ*åËmÙœÕŸ2Z²’êëÌrÄóTI,yéQ—ÜHÏãJŒ\ZÉË›rì4ŸjFÇjR}èô©ºlcí¡óåÚzVŠÛÛH<´ûË×Š£nÂ)ƒÆµa–Ö2GíÖž·Üoc0ÆQÈnÕì?<>nînõÉžO³ÚH\"­)_˜‘ß\nWçÚ¼y7në_J|\'¶û\'Ãû F¯$½1Ôÿ\0õ©OE âŽÙÆTŠÊÔO•¦äÖ^ª3¬ÒÐÑnq×·mæžj%˜ºòi÷pcU#S`ô®6ÎËÝÉ’3PK`Õ‡;—Úªœƒ‘D—B¶¤£¯4×aœu¦îÏ=éÊ2ýªPÛÛš¬Ü>jÖÞj)Ô§ÐrDdwïLaŽH©:ýi|¸¤Ð•ÊÍ‚xÅDã\"§eºT\';ºqJúb\nz‘Ò‘—¯Ni RdØ”¤T±óÍB¾E8*m¦ƒ[–s´SäûSCrhÈ<Š‹wØ‰ÆEy¯`Ù©A/üôŒøþ½z\\¼\nà¾ Cº)zíwOÌý\rmAÚ¢&ªN\'”È¥PŸp×¢q§ƒBcu\"õ4åé%*E&¢¥^KQuž)ùÍFj@@Å4ûˆ•:f¥wéP‚µ<ØÕ$!ý¸¤-“Iž1ži¦“×a\'šBÝé\0¦¹ù}*®2\\n¸ÎF\\n9¦†\0çµG¨ì¾^•Ë’H üÍš•@Qš‘Š¸U«V2D\'	*î\rÅVC¹ùTdùSäP¬;}ªÊÈÒG	\Z}ó»’=y5¡ÊÊû•ž¢°ôû¤šs\n¼ˆ»X°àz²î°ÊTº,}Wcu¨z1$×«p}Ò¿p“‚³:€‘]Ç™ ¥b_¨[É€n5­+\'¨š*0Å4—ƒRd“Ú£#­mº&ÄmÏJiã­<ãwÆô©’Ønk¥ð¾>Á«‡Éþ\\Ñ>µÑøaØõN:Åý\r(îZÜ™ó:ÓŠ|„o#ÆVlÐîµ¿xƒÃ\'uý›:}¢¾,žƒwnÀ¬´·°V7?E&¾°†2ˆUÛ“KDÀä’:s\\”1<ñ¼ôeJÒ\'Ì°x[Ä ‘4=QÕ¹YÉ‚=zUÈü%â6éáýL}m˜WÒÂE\'éÕÑßa8_sç(<â{‚\0ÑnÓÞEüÍ^áŠ$ÿ\0—_÷¦QýkßèªRh^Í¿\n|RßòÆÕÞ¸ÐV&µá»ýW·Ñnd·7—JŒX\"±#žÏ×Ñ—÷ÖÚe„÷×ryvð.÷ltóÆ—¨K®xªÿ\0\\º9“q+è»³Àú\nÚŠs‘KE\\Ü˜¦ŸgŒ<$*§\'ñ<Õ˜îUmG5Ï^Þo»~y,hûK4{A¯YO[#Åµv÷$Ì[­a]¹oZÑ¹oÝk*àåG5ËQ¶Íc-Øj\"ri[ëMëY7ÐÒÃ½é¤æšc*[Ù\rSÕA‘bé´íP:zâ¬»`f Y%e­g-M–zS› `ô«RÚym¹ySÒ¢#5	wÈ7ÑŸJqQšiÅ;85 b:\Z„7§i©‹¿ÍÏZúáì øF\0çýsõæ¾[F!³Ú¾ƒøY©›ŸÛ†#6ó<ÃèT#±é¥²+R“ƒÍJ×Ê©Ö±uÀÀPä‘q‹¹™ràµSn§Št’f˜[Šâ”µÐëay+PºþTòÜc4²óQÍv)¢»eAæ`tÍ+¨ïLCÎqÍ7ägäË\0±çÙWáÇ~\r2A“žÕ(¦ô\"#°<ÑÈ¦×Ö†;zw¡¤B)Tõ	Ï5?\'©¨®*lièFÃ#\"™Û¥Kž)¤sœTÚÂÜfqO@{ÓJÞžƒ±¡®¨ž¢Œd‚isŠB½qHµK]Gq\\½kŽñÔeôTuÙ:“Û?­uìN+ÄQ,úò0$¬,ËõŠªoßL\'¬O%r(ý[PøÉ¢?¸kÓ8D\\å»RÇÖ‘zZTëHDÇò¥éG qLC©G\'šŒT‰V»1)séLó¥¢ýÇzSºÓAô§Þ„ì <rj9Ž9©LÕk†è({ÈŒšc6FÑJÄ‚ˆÐ±É¨Ü¥ èÒ‰ðŠs«QŽ´®2D$Ó&ùŽsN$ïMÁ=ª„YÓnü‰—p,½×v2+£AfèV+rÌ~d¿Ø×!Ê6Eniò,±ùr1ÀäKPf²:«®Þ¾;Vf¢\nÝ¹9çŸÒ®¯“æ†„0SÏÌjÎ·k»M·»QÈù[‡§ò§“Ô–Žq¹¦qOÆZi\"¶}w·&£nOJóÁ¦dtÍfîaê+¢ðÁÄ:ˆ\'ƒÓ­s§¥tl&¢3Öñ¢P–Ç=&7ži¯‘ŒŠ|‡ç>ÔÇ=\r\'¾…yhÆŒê@ÎjäqˆÐÖ¡·áªÏJó0TãsËq’€c9¥Œ’ƒ5)Ú½SRŠé‹æŸ2Ø‘h¢¡¼»†ÂÊ{Ë†Û´ŽxèOZÔ,øÑâa\r¬¿y.ÙçÚÇîóµH¤gŸA\\‡ØôöÎUßælúâ‹çñG‰®umHù¬y;‡~€~ZZŸ—¥Q@z\nï¡M¨óœugwcŸšãý%Ž{Õ¸n3šÇš]·=êH\'ãÅTef&´/\\Ì[<Õ)yAI,™hbLkô¥\'qGBMæ•Û\Znx¨}÷æ™!\n)ìxªòT0Dd™ï,cŠT\0QÎí uô¥a‹ÀÊÎz\Z›ìÖw9Cî§=OáéQ¿îãÚ¸æ«Ï(†<¾Â«•X<ˆ¦²’&?Ä¹~GâG5X€\"´¬šX!,í¹_\'ks×¿=ñÞŸqYx‘bo@8¥Ë¥Æ·ÐÈ#<\no·54˜ßŠŒä•ŸA _c^Áð†ëìöZ…œÎ33¬Ñ.}ú~UãÊH\0k³ð¾¨Ú?ˆ,¼âÑ.ÿ\0-Õ¾^åç>™Í4Ÿ+eEêg»¼ØvƒÒ³¥¹,y5%Â‰FðGçTB²œ‘\\3Üí[fÈÎzP®hÆJCòóŠ‡“Åý)y) ädÒ‚zž†³ÛCU pç­BW\rš°pWÞ¡qUd*ŽiÌA\Z“¸\n¨ä÷£ ®0škšU;z‚sI\"ñÒ“@‘_x9ö¨&¦dÊú\Z„žÆ“ØÑ1H c®M;ït¦‘·ëSk»ì{šUéÅ&xäóH¤Ò‰‡“Q°Ï Ò“Å§/¸Ú¸ÃÂóÖ²uOžÊáñDê?5§&Hæ³oî}ˆ¡7pµ~yôÇ–}i²\0ÚœŸr½Dp>ÁÀ4ôàÒ/zpëT¬CŠ^h8Ç­ÏJ-p=©Ùæ˜§c§\\Ob@iÂš;SøÍR¸…Òž(\0ôb˜·íU$lµI+ã½TbIÇ­LÇ.w6N\0DÉ8¦ÅÑ’)ïlv¥a§q¹ÜiØ .9éBõ\r¤Ôè£4Š=x«PF:·A@®Tž1Ž)l¦dpÁ=ã&Ü(æ¨Dø”Ò‚Ž’(Ã\rí8$…­öQ6\"c9ŒãØ×1hæ@1´8ëÚº‹@~Ê€òm4ž„³Œa‚E0žqÒ¦¸Ë™”ñ´â¢l@Ít]“¹d\ZŒç­HrOZŒ’*^ †ž¸Åt\ZÀ[ÑÉÌ\\þµÏ“Íoø`ó}éåD~-\'¡ƒ0ýñÖì)ÓÞ¶=i’s¥n^‡ÚK/”»ªh‹N77P„Þ»jÚ\rª\0¯#MÏY=\r\'+\0(À¥¤µé$–ˆŽfÂ¼Ûã¯<\ZMŽ‰jûdÔdc&ð.8>Ä°ü«Ð/o¡±…¤•À\n3É¯\rñ¯ý»âÛKÌßob(8P:ãñ­iÁ·rg4´\"±°·ÓmV|œrYŽKSTu6;\'4¨ln1ùÕ[¹|Ø˜’3^2åÐã³½Îzüb}Ã¡5Rí`sR^þñ8ê+=±í\\su±¥#þU pbÕE$Ü¸ÍXÝ…^iÞÂ°×|šPÜS­4¶Ú‘Ø{sÒ˜EÆx¤v€\"ílf¥‰v©sŒÔ(žd¾ª:Ô²Hp@¡0]I28Æ=*¬ö«íÐ\Z[©7‘oÈêqW#m ÿ\0hŠk]‡Ðl­–Ú:,c5É|æ¬¢ŒsTÝÄ5ÑÃšƒì1ùìòzóçVOZag÷) ç¨8¥$4Ê~LI•aWç˜\n\\Ùàæµ\"Õ¢’1å±xçÊ`¤Q@8Â@MM&›¦ê#ýö”¶ÑçËÜK*ŒÀ±êNÐ¼“YÝ/\"­s¹ðÎª·ú4\06^%°úp?JÜÜ{×•è7²økX1\\`[Ì|¶låq¸€àŽàà÷ê°kŠ¤yduÂwÉç ¡ãš±\0Å9‚§N€Ê óŒS”zSÝNi˜5“CRkA8i§“jB¤\\œÑd‹½È˜ÀOW)Î0*¹È?-4™/Aí¸qAÎÞi å°Oâ¤ö*,…#&«–fPÅxâ«0\'*Uöe^ècQ<gŠ˜óMdÏ¥&µ+¨Â8Í.)X\02Ji8*^…[¸ñÊðiruæ¡ÞsÀÀ¥\'9æ–¬ãœ†Z¡txÈíW	ÇÅV¸ù€*z“±ã7po&ˆç*äsõ¤E+WÄpyZíËcö°ü‡õ³W!=+Õ‹¼S8$š•E)Ý4ƒ½WBn:w¥ojNÔšBžy§ŒŠ4ñŽ*„Ñ éOÓH8Z9‘ÛjÓ‰5^wÆE°’ÖÅy’{S\"MíŸJ0]°Z˜‘{{š”ºšy!$áÕ¦d©£9©ÛP±.áÐS—Žµ\Z®jÊª¨É¢Á ôP~cÒ‰.6Œ-FîGJ„+3t&žÀ®#È\\óÒ˜øSÀ«+líü4³YÈvÚ5Ë6.„€Ãå<œWUi:›5ÚH^Â¸»W*Ê=\ZºÛ&O±œ6iOÌ¬ ûk0Î³‡\nè5k]úz\\¯$6Ó\\ùäc¥k\rQ,c6zaàýiÜäÓšO@CHÏ5½áŒo»Éÿ\0–_ãXLksÃX2\\Ž¹ŽˆüHRøLI‰ó›Ö˜äqO¹À€Éæ£?ZV-ö>Ô„€:Õ•jÊ¶i03Z\nIÉErÁ$\rÝÜœ5Cwt–°ïn½\0§ŒŠâõýqD2Ý+|Š6¦GæuÑ§ÎõÙÔ›ŠÓs”ñïŠßrØÆíºS†Áíž•É¨Ü›1Œ•Î½üš¯ˆ¼òw*±#éÎ+XÎË.®˜;êD£d‘ÈwUžF<Å^ŸsYîG8­ZH”ÊS˜ÖUÂ˜äÜ¼\nÔ˜s‘T§MêkžzèkA¬9È«ûó\Z…\'¿¥dr×Žõ¥n¶8¬×a¶9[æùºÓf8#	lô8Ö¤Þ¯;Õ\"mmF<õâ‚ùéÖ›¸©æòz\n/Ø-©aH‚#‘†5H\"F‘°IéC¹‘¶ÈVQçÌ±\'E¢ãIXÅ¾c+\n¹pÙ§F‚Àj92E^ÑÔ/Ô…TÕ•\ZSÍ8’ÆŸ^”Æ<Ô€*8¢CB0ÁëLÉÏŒù=i:VcE¨ï¼¨Ù\'C<D}ÂØÁ\0…?†OÞøSVŠK1n·M8L”i÷…2Xs·œÉãæÒsU´Ônt»Á5»\0Ã¨l~¢²«dmJZÙŸAÃ.ja/5Éx{^U¶Þ‡æB®:qü«£ŽPÀ\nâÙêt5Ø°àcÞ£Æ~”¹Å!8)z Ï_J089æƒÈ¤Àù§`L\\çéPËÇJ”ð\rE\"ç\"¡ØÍ¿.î¾´á–Á(Œ|¸Í9²ªqÞ­Äœõ«ƒ¬)ñ¤“8Á©iØÑIÙv“ëQ3TònôëQ\'‚*™q!\'Œâ˜{š‘—\rC É¤üÊ9ïùÒ‡È5sÁè)€jFXÎàr1PÈJ~I\ZdœŠ–\ZœŒl™na¸‚»?çú×4GÉÍwž-‰¥ÑäeòˆCüëƒW»[­wÐ•éëÐã­|A¾ÔÐ}ªO/hõ¢\'šè1FFi£4ŸJ^Ô…qO=êTÆ95õÁ§¯š}@˜\ZpF:SÁ\"­9›¨ÊùjšWãÞ«¢–mÇ ©–»\r[rHÇ”›Û¯aQÞK\Z·¿McŽ*[(CÍH£&š£5a€zEÛCiN1ïQ3óTìNàN[­Xˆ¢Iª…æ3°¥b¶5–æÅIçDêpÖ2«1ëV1³£ÐWÔ>YØ;×Obø²VÇ&¹bàÜô®‡O}öx”=Š6-àûU£Dzâ¹	I9®ËL“\0zä×7®ÅäêR8r[ó4A½Q&fGãQ’äÓ»äS\Z®ú\0ÓŠÝðß2\\ÿ\0×*Áïí[¾ÏŸsÓý]·0¤­àþýÏ½0Ž¥IqÄì=i‡G­&‹lûe`ÐT\0§Ô—pØYËupÁbw1\'ôúÖJ=8ÛVdx«T\Zvœ!B<ëœÆ£8!qËOÆ¼«Ç»4q\n8ÇJÐÕµÉ5­aæfalF„ýÕô¬/F$Ó²£¦+Ó.Jû³ŽR½Tqþ·W7wcŠžWÃ·¨5†gXîš&ÎÖã&¦<›·ùp¤œVqIA3I;ÈU¸.0OÆ*xÍSóv÷§‰22M50qp¡³Š§œ\r¦­¼¢ªÉ†ng+\\kRÊ“ŠšÙÿ\0pãLAM§¯jbG·Ò³V¾…y1òœƒQäŽAæ’9ŠB@ÆÞèæ¸XsI½yëR`Ç=êÃÉ’@ÅI$›˜-\Zn\0ï²\"ßÄzT–B95UÎùÕp+M\0Ž%Ò©-C¥‰	Üy¦°âô¥íTõä\0sKÍMÎ7wj¹•¬!XúÕidô§ÈüuªNß9É¬å-J±\"ŸJ“qšˆŽ)<Îµ.VLzu¬Û¡‰\r]WÏZ«xQCh¨›>ÕJÔ\"”9òØ*v*¨ë^¯iÄ)$LdÞ¼JÝ°ªMu~ñö|ÂË9û‡=~•ÏVŸ2º6§?²ÏSIjE#<Vt7Ô2°ÚzzÕ´c#­r´‘­ÉÛ®3L#<P#šv8<Òæç×µ!ÝŽƒ4½:šCŒg©¤ÒØˆdFH‚OJG^àÒ)Á&©11»¶±ô¤Ü[N‘w”óéQŒ‚qKrŒ­ŸëQ²’:sëS4™;pj6çÚ“HÕ]•\nyªç$‘Í]‘Töæ«H0*[ÔwdD\r¸ïMÛCeO­0“ë“Pî]“ dŠV9¢cÏ4O\0ñE‰Ø‚æ,L¬¹R0A¯(šmy,\'ïFå#^³+åH=kÎ¼E\Z©u9Åm†zò™VWW)G‚„3vªò.ÓŒTËåíÇ\\ÓeË\'^•Ý¶‡M/áLÍ(9ÂÃÔŒÓÇZ„75\"‘Ö§ ™.y®À.i™ã­C4Ùoa%qŽåâH@£ñ¨”óRù¨Ü­ƒ!VšcJî•aPeª–¢lHá©’>‡š‚Iº…â¢-ÎIÍº’4¬O˜U‰É¦™={žôœ®Ê°ây4ôà\n’+Ryj›1ÅÛš6bÆ›F[Q\\L7qLšàžâ«O4\\îI-0ë[údÄDW£ük?¾¸­{¯½+ƒFâJÑcoJ©®41ÍƒÇSI…AéWím–ûOšÆX|¤ö=©s%¨™Åô¨ÛïdU›¨^ÞâHœa‘ŠŸ¨ªÇ8­^¨Öéï[ž\Zÿ\0_7òÎ°ÏksÃ-þ“?´|R‚¼¥¤L{\rÃc×µDÜõ%ß-õ¨Ø‚£šW?ÿÙ'),(2,'ABEL','VAZQUEZ','HERNANDEZ','1979-01-10','VILLA GONZALEZ ORTEGA','2017-11-01',NULL),(3,'SAMUEL','ARTEAGA','SALAZAR','1990-09-16','FRANCISCO I MADERO','2017-11-01',NULL),(4,'HECTOR','ARTEAGA','SALAZAR','1990-12-12','FRANCISCO I MADERO','2017-11-10',NULL),(5,'SEBASTIAN','CASTILLO','HERNANDEZ','1980-05-05','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(6,'ROMAN','LOZANO','CAMPA','1986-03-10','NORIA DE ANGELES','2017-11-10',NULL),(7,'FRANCISCO','MARTINEZ','MARTINEZ','1986-06-12','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(8,'RAUL','GONZALEZ','HERRERA','1978-05-04','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(9,'EFRAIN','TORRES','HERNANDEZ','1978-04-08','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(10,'ROSENDO','ALVAREZ','DEL CASTILLO','1985-02-01','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(11,'JOAQUIN','CORONEL','HERNANDEZ','1972-01-01','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(12,'CESAR','CORONEL','HERNANDEZ','1981-11-20','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(13,'ANTONIO','HERNANDEZ','GARCIA','1984-01-20','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(14,'JORGE','MORAN','GONZALEZ','1983-08-08','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(15,'GILBERTO','SANCHEZ','ESPARZA','1983-09-10','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(16,'PEDRO','GARCIA','MONTOYA','1993-10-13','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(17,'GERARDO','RODRIGUEZ','HERNANDEZ','1993-05-10','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(18,'ALFONSO','CORTEZ','RUELAS','1983-01-01','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(19,'EDWIN','REYES','HERNANDEZ','1993-05-10','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(20,'ABELARDO','SIFUENTES','GUZMAN','1980-06-03','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(21,'ANTONIO','ORNELAS','HERNANDEZ','1989-05-09','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(22,'ISAAC','ORNELAS','HERNANDEZ','1986-02-03','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(23,'WILIBALDO','MOTA','DEL CAMPO','1986-04-08','VILLA GONZALEZ ORTEGA','2017-11-10',NULL);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reglamento`
--

DROP TABLE IF EXISTS `reglamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reglamento` (
  `clave` varchar(5) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `sancion_juegos` int(11) DEFAULT NULL,
  `sancion_economica` float DEFAULT NULL,
  PRIMARY KEY (`clave`),
  UNIQUE KEY `clave_UNIQUE` (`clave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglamento`
--

LOCK TABLES `reglamento` WRITE;
/*!40000 ALTER TABLE `reglamento` DISABLE KEYS */;
INSERT INTO `reglamento` VALUES ('J1','DOBLE TARJETA AMARILLA',1,NULL),('J2','AGRESION AL ARBITRO',20,500);
/*!40000 ALTER TABLE `reglamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_equipo_jugadores`
--

DROP TABLE IF EXISTS `rel_equipo_jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_equipo_jugadores` (
  `id_equipo` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_torneo` int(11) NOT NULL,
  `numero` varchar(3) DEFAULT NULL,
  KEY `fk_torneo_ej_idx` (`id_torneo`),
  KEY `fk_ej_equipo_idx` (`id_equipo`),
  KEY `fk_ej_jugador_idx` (`id_jugador`),
  CONSTRAINT `fk_ej_equipo` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ej_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torneo_ej` FOREIGN KEY (`id_torneo`) REFERENCES `torneo` (`id_torneo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_equipo_jugadores`
--

LOCK TABLES `rel_equipo_jugadores` WRITE;
/*!40000 ALTER TABLE `rel_equipo_jugadores` DISABLE KEYS */;
INSERT INTO `rel_equipo_jugadores` VALUES (13,20,1,'10'),(13,18,1,'11'),(13,13,1,'8'),(13,21,1,'7'),(13,12,1,'9'),(13,19,1,'2'),(13,9,1,'1'),(13,7,1,'12'),(13,17,1,'14'),(13,15,1,'20'),(13,4,1,'21'),(3,2,1,'DT'),(3,1,1,'27'),(3,22,1,'8'),(3,11,1,'10'),(3,14,1,'9'),(3,16,1,'7'),(3,8,1,'11'),(3,6,1,'6'),(3,10,1,'12'),(3,3,1,'5'),(3,5,1,'4'),(3,23,1,'1');
/*!40000 ALTER TABLE `rel_equipo_jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanciones`
--

DROP TABLE IF EXISTS `sanciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanciones` (
  `clave_reglamento` varchar(5) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `jornada` int(11) NOT NULL,
  `id_torneo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `activo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanciones`
--

LOCK TABLES `sanciones` WRITE;
/*!40000 ALTER TABLE `sanciones` DISABLE KEYS */;
INSERT INTO `sanciones` VALUES ('J1',2,1,1,'2017-11-01',1);
/*!40000 ALTER TABLE `sanciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneo`
--

DROP TABLE IF EXISTS `torneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torneo` (
  `id_torneo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `campeon_primera` int(11) DEFAULT NULL,
  `subcampeon_primera` int(11) DEFAULT NULL,
  `campeon_segunda` int(11) DEFAULT NULL,
  `subcampeon_segunda` int(11) DEFAULT NULL,
  `goleador_primera` int(11) DEFAULT NULL,
  `goleador_segunda` int(11) DEFAULT NULL,
  `presidente` varchar(50) DEFAULT NULL,
  `secretario` varchar(50) DEFAULT NULL,
  `tesorero` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_torneo`),
  KEY `fk_torneo_cp_idx` (`campeon_primera`),
  KEY `fk_torneo_sp_idx` (`subcampeon_primera`),
  KEY `fk_torneo_cs_idx` (`campeon_segunda`),
  KEY `fk_torneo_ss_idx` (`subcampeon_segunda`),
  KEY `fk_torneo_gp_idx` (`goleador_primera`),
  KEY `fk_torneo_gs_idx` (`goleador_segunda`),
  CONSTRAINT `fk_torneo_cp` FOREIGN KEY (`campeon_primera`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torneo_cs` FOREIGN KEY (`campeon_segunda`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torneo_gp` FOREIGN KEY (`goleador_primera`) REFERENCES `jugadores` (`id_jugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torneo_gs` FOREIGN KEY (`goleador_segunda`) REFERENCES `jugadores` (`id_jugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torneo_sp` FOREIGN KEY (`subcampeon_primera`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_torneo_ss` FOREIGN KEY (`subcampeon_segunda`) REFERENCES `equipos` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneo`
--

LOCK TABLES `torneo` WRITE;
/*!40000 ALTER TABLE `torneo` DISABLE KEYS */;
INSERT INTO `torneo` VALUES (1,'CLAUSURA 2017','2017-10-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ABEL VAZQUEZ HERNANDEZ','ABELARDO SIFUENTES GUZMAN','TILON CHAVEZ');
/*!40000 ALTER TABLE `torneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lmfvgo'
--

--
-- Dumping routines for database 'lmfvgo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-13 14:23:20
