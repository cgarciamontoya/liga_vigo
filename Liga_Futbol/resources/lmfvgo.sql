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
INSERT INTO `jugadores` VALUES (1,'CARLOS','GARCIA','MONTOYA','1983-11-15','VILLA GONZALEZ ORTEGA','2017-11-01','����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0��\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��(���t�!{�\0+���^�t�!}�\0+��mD�{�U��{�Ҧ�,�m������`���QE\"���cm+\\F����=EMk:�T�1�*¯Ee��	��1돺j՞�MY�j�U��8��֬T\Z\'p��(QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0�8S\\�F.��g������]�BZC���+�����M͛L\0�z�br�ҭ�2Vl�@��*J\nk�ȥXd\Zu�Q��3	��c��_��&���F�!V�i�eN��:Zm���-QH���(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(��\rr6�����dv�9R{+�a�5���Bq�7?�t��c=΋OSnzUڥc����4��ET�QE\0�߽e�i���ބS$��L�v���Ԕ�;�Q@(��(��(��(��(��(��*�Ρ��`K{t��{	��e���!���E8�\'�q׾)�Y䳅�;`���L����rfk���|�-��Z�Q}L�NǦ%���rH\n��L�⨿�-U�Ozd��:��\'��<�	Ќ��u�\Z��L�m �C�by��;��Y���X?6x�:�sx�VC ����r �m,]�<��k�w*	U��Ԩ�s3�G��~!�v[^M���#�Ѓ\\�uwUR�[wR{\n�n�&Ir\0�SK��Dg�0>��*)#�#��F\n��ld�9��S��!��dL-�̒�ni<ϕGP1��=����Y;��c�Lo�F���*\\KU;�����Y�(���@�����V�r$��0�2*lZ�c���EQ@!8���;��@�L7*;T�A�7�C�\"�6�rz��4߯�Y�c���T߳��\0<��@�r�ꑢ�@�E�GW�����ݺħ��[��p)\\9_r���^�\rV<����l��gZ�\0�!OAr˹Ԣ>�*����7�:߲b�X�:Q�ZD��zxp�\rB-t&�X���5�>�(����(\0��(\0��(\0��(\0��(\0��(\0��JW\n3F(�-Iw�h�&��H.>�(�,F�������h6s�Ew��Mq:��|����ԛW3����D���̘\0O�j�kh�U��N���hQE!�Q@&>rih�@���qKE`��(QE\0QE\0QE\0QE\0QE\0TsM�fI\\\"I�$�S�	\"���RBK�0�_��?���ZS��3��M�D���۞��__�]����\0G�3+-����hW�6�6�4�/�h��Q�x���=x5��^�gq5̊�+��� ��ߊ�8������5y���*�,\\�J��O��yx\r(�ߏ�X�6B饒q����0�)�����P>I�z��\0*�E�v4�a�9N��\"�ޮE�\'H�\Z�w����d�\\��ond�ĠC�ߏ��E_Q�\\y�f6����s�lj�2:#y>�*���\'%s��.I~&vN��M�t���=��6D0N��n*}�d�-��(k�\"���>\\d���f��[���-���������<p_�����;W+�QmGdu��ײ[��H�`,p���(�O�0ҭi>!�JP�_����{�V���p88Uq}3���,ǒ���a_S�4�X��-���f8\r�	��溊��{�a!D�ҷ�,��s����F�{h��;d��\Zi[�\0�px���h�ɭ�R�������;�iVXd���RT��Q@Q@Q@Q@Q@Q@Q@����P\n(��Q@Q@Q@Q@Q@Q@Q@Q@��2ihp���\0I_��w\r�Ҹ�݆�/�ɭ�l̥�}��z�Y���踫5���(��QE\0QIށ1h��QE\0QE\0QE\0QE\0QE\0V�f����#�ږ����ݦ��b�uf�XZ�����(�\0h�<s��Srwf5\'ede�^/�H��S�1�#\0GNǿ=�\\n����%���v�1��F0A����+_Q�&�~n��x�)&]G�ݲzz�3��c4	s��ɴ�[Y�ls�#\02:py��YY#%�כ�y5]M�p.���%n�����K�ݕɓ΂`����a�s׏Ơ�/�K��kBE�G�]��㞾�mn�{����;G���ү�=�ft�-����\\�c(#��ۭr��]�Iie\0�\0�i]��Lc\"?4���*�A�Qҳ��E-\r��h�#��C����JͿ&1ڠ����I�:Y�dB�3�sYɮ�X������A���F��jR\0B��U���źt����d�4=������j�1s�C���_.2�sچ�ť@!���=���;��F�ǧz�,̀	�ӭ�i��q��Y�H�D[j����pEl��M+�bN����#Z��y����\0F[t�:� 5lZ6����\\����s�O�4�n��=����>Zp�5-�y��59&�Yng�뺆�$Ka|�5�/���K�N8�5��>�����lI&2R9����\0\n�\rB�E�*�/^Y�gB�o�Ի+\0u��\'�S���8��EQ�\\��1�i�g1)��}v渋�\Z��\\�m��\"\"v���n�v���#�h�)kn~_YǞ�e\'���o��o[�zbч�Ф�B�G�Q^>u]fV��D�E��B�o5L���?��?�\0E�s3ب�7z���|G��&�\0�i�jԺD[��f�\0�i�;=���S�jѮG����O괣X�O���;s�җ2s�h���(E�\0�����,�\0�:��<^ʬ�����$G��E�ΏR���<W����tI�lG�j��|G��Rʲ�|�Ckv2��9�tĦ����H�ID�Ո$~G%�QE\0QE\0QE\0QE\0��њ���·x��\0B��,l�t��g[�\\�6�G�^��4W��QK7�Hڒ����o��/��gд`�W�T�G,�\0�!������h���Q�Y�>����Ҿu��@r%������[��\0}\Z~���>��X�5����\0���?�o�/�dS����W������2��#,�b�߇�Z���R��9FS޵�t�99ZزHd8 ����\0J8���1��?y����gPr�\n[��Z�D7y֝�\0kVꖔ��T��X\Z���(�aEPEPEPEPEPEPEPH�I&�B�Ojɹ����=�T,�@?��\\ ���O�h6�b�+ݡ��F\0�=�+�׵�,p��Ef��3�g\'/ߝ\\�{ؚIm�xgr`W/��Ӱ���N��x�_vJ�����^�:ils7���>Ǭ�qđ��v�bM�ǠݟJ�e���#m;[�S�  t��_j0��KX�@X\0Ρ����\0��o.L���;�8dv,?3M�7r�G3<r��,�	V���Ս ��R@$`�<�:�\0Jn���z��G��o(#l7B���-iX��.XX�Z���7\'�G�6�v[iP��v5���v���\\M.���(a�8��h����Md�0�F��r֠������1H���y\'֣�T	��획9ln1[q�z���.�:{�$���8�L�F���p�\Z�p����좤��x��#Q�\r���Df\\�2�+��%�)p7`��m�D�rX�>�\Z����������\'�b�����3L�*����A|ǩ&�G\"�,S�U\Z�pd(��a�Բ\\���ac�x��甐\"���{�AF�2�ɚC�#8cҭۻ]b�\'�s�ǂ�y�<��y�k�B�\\�e�I=���<#�(�=@5嬸|&��\nS��a�����9�}�8ܭ�\"�l�[�r�p�eH ��\0<װ�8���L�y/��+�-�|�rg�M��kC����\'֒�F���FO�PEQ`R`zR�J�ڧ��j�\0t~T�S�\rؿ��\n���Pu u�Q@Q@Q@Q@Q@Q@�.����!^D�	$*-�g=�ׯ��g�7�8�W�\0B��J\0���P~���L�f��I�陖~ymE��k��1�h��_N��$�H�z�<�:�Nc_���M�#��\0��W+����L�4���kgj�Hǹך촿�ָjWO)#��P���5W��?�(+�\0L��^�0Q]�)��*�%�k�k�}\"	�e�,��-��3������Xdg$VKO\Z�\0����f�Mu9��n���~c�*����TUg�v�\0\n�^h�8a��v�:��a�՞�EWX�`���ռ9�l�\\��!��En�M6�I�t�$��1ȸ`}j�R�QE\n(��\n(��0��(QHz\Zʸ�����\\!�g:���J���\na��u�k����~֫E����H�3�5��I]��;�#�7��2fOΠ:ŀ�p��5��3��ơ��c���<�Z�`��������.�`��3^xY�ᖥ�%�Y�Kخ�����Y�E +؏��P��<�O��:��`\ZȒ���I����\\�\n\n� ����Y�z�/f�-��$ŷف<�!��c&�ܞ��_PҮ�%l�q��#w��b\\j&��VRd�u�\\�%w)����[�~�Q�`�.�\nm�\0I�j���r��Z�S�ۺ����`��曔R�r�a�=�3M�ֳ|�V@�\r׷�Tg�M�,��Ap����)�\0ΙV��|�ьdt�*������Q��ۻ�-��{��a�=�\'�~=Nk5����}�Arv�G*�ꤳ!���4�s�V\0�74��ri���n��0���Vwr��d�ON\rW��t`\\TL�͒i�N�ESi����`��&�$� \0:�$�9�O������Y�����Pƥ�b@�mS��t�e\"S*Ƨo$�5�X����8t��l��8Z����*�x\0ӹ�5�e$c5O�K�p�҆;r&�l�n�{Ԋ�\"�0�\'���6��CAw<�[��hC5b�]�s�x�R%�C�_��<r�Rfߎ�,S<���\'���\n��&�|�ڽ?�E��=��J��	\"!�q�{�?:�Թ܅�h�kS:�,���N}23�T�]ϥ(��	4��PQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE��q�^e�\0Ѕr�\rU�OR�@�\ru�#����\0`1\\ׂm��P}�q���1r���t�ʋ~f�04��	�&�%���ٲ��EX�[L���ը�l@JΕ$ݞ�2��L�\Zf�nb�ٶ��3�ڹmz�{}n��<�7vb;\n���EyǊ#�\\R�)ԋ�S�ަ��Ť�؞���E�ucR2/j���5�m�b&��j%�0^���PܚK��5����C89��*�3�>���+��(��\0(��\0(�E]#9FXz�����* �A�N��=i�ɻ[�i)�2���i�\0�E��Ţ�)#}�XW����ڷO�5�s;���Ҷ���[s��Wc���V{����������p� �*����\0��A����r�s�1ȓ[;#*������K(ފH�c\\��X4�V>dr1`F1��:�y�Ֆ0�X|�����Gȝ�\'lrp3N�&���ۊ������\"�R���{?�>�Y��9�Tu����V3��<�u������=>��+y�~�,)��2)�� �����q�Aa�\'�j�Om*���C���}��3.�#���D���\0�-���Ϩ�I�\ZT%�yk�?��ާ�X��7+l�L���O�y�>����%۲\\u�d�bFY�Si\\������Sڦ�D��A\'�@ј�`q�X7cTU8#o�U�j�̹�Wu,j$4@	F�!?6�O�H�4�A⥱�<��8\Z1�>��;R���Tt�4���K %�2F�Ro�!Y��L\'#�4���Qr�3��ރ�h�&�����iq�?a�JQ�&��c�53F� ���\"��&���>PQ��a�)�<x��\r�DN���[�#Y��q���T���뜊�I�j?���g�3��XʳK0h�\0�J�1�#�>��\\���@�>�wl�42ap��WSAQ�(��\n\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��3��D��Z��*�5L���\Z�u�t{�?�bx+o��c�����r�������:H�6�T�`L�h��2K\"���s��7�-��--�zD��c���*�6t``���\Z��������{c��U�> _�#,m\r�@���ǹn?J���c=�gg\'�4�%fJ���8Ǻ**�_��V&��NZF�Lt-b^G1]�y��8d��q�s;\"{��YpO�\\޻*�*Tp3Kums�nX���\0���kX�P�ם��]QV0��(\0��(\0��(\0��(�\Z�$s�J)h�V[�Q@�c�\'ڰ�u�nYDJ~��!�N}�\Z��\Zb������+���jŋ�H	��U9<VÇ�V����\Z�.�,	m��N>W�X\Z��6�e�\r�Kg��\\�c���mcQ:���E`��`c�]��d��cX!b����zf;��\0~�x<)��A�$��p	�r�ܴ�B|Is+�)8�J�J]G�O\Z�Y_�A��ى����T��-�qQ�:$�f(RM�%�1��!,Wp8��U��`�K\Z���4�N�t�FO5\r�ᐆ1Xv9��ؗ�ƽ_:Vu�����>�A�X��޴�;�\\M*I!MsTi�X#�l��񡬤^���G�4m�S�Uư����c�cf�-c�h\n�\n�P���;�W5����b�\0��Vm��r�̯���8�C]Y (\r1,���J��Kd��~�^Hq���a%�n0@��CKd��SLN36G\0���7H�H#���I�n�Zã��j+V=����X�Zق���Y�V**�W�I\nO��kym��}�wVn���1\r�R8?�5���ѓ[�\0+�B-���>�<�|�1�ͺ��[S��Z�~�beb2h���,�8�M��d�+��T��{\nͿ�,]9�5&\'\rS�;i,�;Ԏ�Y?�1� ֗FG��\"ԥ�G��x�Xd2,��ֽ�{��Ү�y����y�k�h*;QAAEPEPEPEPEPE���Ě���-���7ٍ�y�W\n��ݎ����Oj�2bX��\\�c,MuV��̱	&�.i�z+���Gؤ�$�ˌaY������r�(�0��d�\\�wtW<[tG����)�.@nb�\"���\0u��s��Ѥ�n�X�p+�5�{S�\"ad����$=�\0\Z�;]i����RRW��\\~�ԋ$!HؐB�Eqb*��THꠔ�����b�\\$2M)�_t�Va�V�N��\0T��H�lnte^zu�\\�V�f�D=�B�����\'�b���%�x.��M\Z�!��e���Wd]��qJ*WG���[X�9��q�H��>�$r���k�|���M�h�ֱ�3���g�	����!�ih���k9]Ӣ��]O8V�ց^\r�w;��Ջ�\0�mᱩ��l��E��͌��>��G����qs*\\F�[̰�qI��=��p�Ҭ��U��Q��?1��4��Ը$�������\0)��V&$_j�|G?�l<I���N�D�s�ƀ�����j���饵�CT\0\n�^ڕ����.s�ʯ��\Z��R<3���B\rz�����?�u*a[9���]��mQE\0QE\0QE\0QE\0QE\0QE��jOӋ�,}H\'�W�Kr�K�lWY��ۢ۞���q��D���FV��U7#Ӽ0�7��A&]�mé�\0�b�[���u/�i��#/\"W<w��[�޿���EZd�Й ����W�@�r��\0Ya�D�\0v#�M%̛�ۋ��wW��L�6�DѺ�\0�p��g�X>�f��0!�\0tW�j�\r<�wb��19$ԫp�F�\'g��>U��j\Z}��$w2��\\R~\\�+�����S���n�L`�@\'8޹���.�F�#�����u�VR4P�aR�\'�3N�JB��Lɤ��p�#�Ҕ*����Q�3�,Ѩ\'��k��U���+�����ɓ�Mt��G9�k���Z�m�\\�s\\�[L馴.5���j�r�XګS��:��77,\\��S�l�Ћ`8�Kn$�5HY��H\ZB0�*�١򔦉T�֫��ZF�IaT��MD�E%ra��Ȼ�k*���^*E�Z�=n6��j�fId\\�j�K6r��Ȋ�)J��+��h����1�;6V`�$`֘�o�^R�\\T-��\Z�M�cHFȄ�ÑM1�d����X�zf���D��i��=��FNi\\\0)cOU���#�Q�+-K\n3���m�i�+J,8�^� �p�S�H�-v�rG8\"��-��;|��q�[���s�F|];�Dn�3m#�\n�:�M\Zx��{�l�\"��\0�q�\n�j�8�\n(����(��(��(��(��)����+;��ּ��I���x�(�߼?J�=Z;IR%�7��Re�z�0��z\ZOc9I^!��C�	\"!��\05�izW�o-�{�B���\n�5��L��޹={�~~���i���gvy���kww:D���.Q�u�s���\"՞��Վ���I?u�Y\n���sZ���ˏ�ʿ���Ԛ��g���+��\\ȧ?A�]���\r���V��J{���\0�\\h���v��p?�V���}3J�c�1��	%�����vȑ��RxÖ�OП�QW�����C�[y2�P�*S�5���{ʺ�K���Q\r�s���]7�3&n�����Z][�2O:ʎG���g�>ⳝ%)��jmE�h*$h*��W�k�kO�\\1\\�v$�&�q��x׎/�(|T�n��Dh���l��R��uR�(TQ��g<����K�?vў��x#���0�1��7XW,��^WҼ��H׭�~�e<+(;��פ����/�6�IE�q�5��T��7ԇ.f���bx��I�C_]]�c9,AF:��gx�U�m���\'�Y�?0�d{WK�	���w7R��_�T\09�O�tz���I���ۨ���ɸ��}�`sڵp�ס��n[�|�4��@��sɔ5�����r�`z+���w5s�N��|���w�W�|2��d�\0������U�Hm�.��5�^��Cӄ �G�9�|VM�do��E��2j��@A�ih\0��/�1ڤ�a)\\(��C\n(��\n(��9?�1�����~ֽ?�z�N�����*�S]g�<�������ӡ�u�ꗒ4��LV�9�\'͡�ˤ��Y�T�&��.������k�}N�X�����Uq+�����D(�S�k�-����>�����i	k�������NH^D�K�C�s�f4ܕ��OA�{�$`}6��OO�K�<6Ϲ�\'q�k�\r�g��j�e^�_�s8\nIS�Џ�\0U8�_@�S��\"h����\n�Wf�#�k���$�0�\"��	RG8�wKc8�nY8q�r{V���\'�5���� �k��T�*��=�Y�N{U�}�r�>����l��\r��U��Fڻ��Y�����1��g\0�;㚁Z#��p?\n���P��U�\n�&��\Zә�t��؎��p�cڲ����r*��7r+���5��g�Q�XqO-��)Z6�J���ə�|�ӣ�F\'�z�2:Ux�#�Z2�I��j��\'#�j��!5��)E<�&�Ϟ�e�\r���-���r�*��wt�V>8\"f�0X�8��XH3���@*R�&�K�=4D��yhYj��	P�1W��=1֡�wH��������s�V&9��M];VT$n⺣+�nv_�X�m�������%����n�.\Z�W��4��G�Q�����K�~*������F��$ic2��x�Ri\n,�h�?u�]3N���?ƙ�\0�\\�\0�n��\0�?����ܨ�o�z���Kt��O�*��\0�^?��?�?��,.t{�����\Z_��\'�\0J>4x��\0ˎ��\0~��\0��:=ʊ���\\�!�\0�-+����\0��~3x��|��?딟�]Ώr��%�0x���l\0�������\0u�s�[��)=�u#�j��Q������^+ʿ�qL:t�\0y����=[v-��U}Y���*d�:;��e�|>a��O�=�m��jҿ`��^T�\0<Bn�t6h�\0 A��Ս8�X�6�ځ�\0^��h�j6fvWl�Ğ�-��n�M�\"��w1�=Mm�G�R�h�ٵ���0��g�XZ��M{V�����#��aQ��vT¶�K���e�w�z��kmRv2��A�$���`�(�XW����1��4��y�\"�S�R��>�G����+Fz09 �Ql��\r|�n������f��|��L�W�\r�������k*�T�_�A����1�1�W����zd�Q�ͼ��L��)����,��|�#85^�G�5��²*H,Fz�����gPs�_\\�\0���\0\Z�?�w����Op쪰:��dɸ��P�ɍ�;?[L�Eޡ�kh]�6@TW+{�ɩ�M���~I;F\0 ���x�ż?�Y� ��X^ �	��\\ŌW��w�P�r��275gd�h�tGu�/}����H\'~��Td�5B��˩�%�̡�v�H\'��Y���s-˺۰;��s�A-���q��Xg��Z��R\"ި��Ɇ�H`�QK f�?�\\dč��J��Is|�6�X�&q�^�.*��N�,t��Y�$y��������QBV,+7Z��=�A�$w�*�<JK�l�ɑr��͆7\r�ք.XsX~�I��J��$ j�DT�Z�����N�Մm�\rV��In�V���ӗ�OEVg@QE\0QE��T���H���~W��s�_A�vښ%变#��)�����9��ν�x��*�$�1�w��Nk��\0�m?�`���tµ���-��\0\\��\0O�fp�CQ���^�~\ZA��0ߡ�\0��O�(?�b�����.�dg���[ݽ��J��B���Dq�\0��\0��\0���\0�Z��_A�<o�\0��)��_H��������s\\��(0�d�W���F���¦�1\\M�Źrz�o?���u.��\0��Y(�pqָ�\Z(݃c&��87F\0�Q��]4I&Le����}�X��$�>c�W�^IP���Q�U��\'R���ze�v��FC�8��`Qt�E#h��Y3ۮ슾d��FP��,�)$�glLb1�ZB�*��Ct���I+$P¡�zթ\0��3ڦ�o�;{}(h���	�q�]��V�ț�6�N*�\0�[�T2F�h�ܠT�ӊ]�{T�9�\\�Z�_Pm�/�>)�?+U�������Cs���O|��8VoJ�K���+iĀg�\'ԝ��nYX�8�)(���_��R;\\��d`��_ʵ�-,g%}G�Hہ���vqx��ɡ[wیn9<�a�9Ej�Y��=\r7:�T�۹O���u�{з��U���/��\\�\r{>���\0j�5���W2\\����*\0-�O`*��3�8����n�kU%mNJ�*�H�\'�>�њ�Q���\0�.H�/�\0�T���\"s����\0���w2���(�����G��h�~7R�\0�U2�\'�]�F�\0����9��x\0�����+���v��\0;���p�g��BO�i��G2�Ϝ��I5��!�?�����*�<�?�\0��\0}?���B���]����c_C�P��؟}��Lo�J.���\0�����ϟpñ�@I�^�4o\n/O�~1G�w����O��h����\\Q�Z���S��O�\0�T�\0\nw���M\n�}-��):����d|�EW�O��q7�:4K?�O�_ZӢ?\'��o�m��):�i\Zcs����c�bf�׿�jvs(#I���W�Ҵ#����8�\Z�\0�\n����/Oݴ��\"c�)F��1�O�?H�+�d-�� ´b\\.H�2lw����5c�K�?Kw�\0\n���\0����4�<���w\nP�	9�־�Ͻxg�5�_��J�\n�A��m\'�Rmh6�D�x���>�o\0����{�o��]H�d�d��,?�y��ݣʱpޥx�L���-�L2�՚��#�#�!��3�z�\r��>h��*T)�� �[�1��X݃v9��@�sK���IQ^At?~��+��`\\�}E|��x��C}(�ê���mE��QzYQIFG�n��w���n����5�\0u�ji�����ަ?��9-�]��s�A]���j����c׽p�#���@�\Z��NO�\"��R����Fi��\"}Ȥ�ő ���I\nw����+Rz*�W���V��ֻ<�����W5�OI��إ�s�ۉK3� �a����E6쎇$��Uq#�m,���腕3��q�_-nnᶓO�Y<��\nI�=+J�Ŗ7G\"���cv�H�p+M#�W�x�k�o;\r7�wgwF��j���eY_C���9>!�mx��a�@;���9�\rhZx�\0L��>b����ҡ�����Z�:�����U���]���i�[}��_6,���0~���j�7\r�\"h���%�8j���`��l�[��#����&��E�ŋ����@��N�	]���,������	�v��1�ZR�{(y�+��r\0��,�w�T�wb�\r�[�[A#�py�ڨjʹC��)�U;9$�<v�p�:��AǠ�^ks�l�\0��T���n-��~]��u;�X0{��N�Hʚ\n��J�+5�9m�z�sk�4�oj�r}�t�OLW3w����qy�k.�RH�+?Z����Ͻr�j���5M6�2:�t��L	�k��Uf$`u槏V7��2�)M�NE9d�&;�e�֥[���N6Ե+�L��P������z��К)밅Wv)�%�Zk9=�4�I�ѲP�Q����P�.��H�Z.�&]Q�I�\'�qVf�ddX�KR��������b�}MR��#�?6MeM�����N�OC^[�Rrj�������s;cc\Z�;+�~d\"��\"9�$k�7e+^��Pǚ�[9\0��5=�Osȩ�MXi�ν\\[�#��T��D��q�>�b��*�(�6�测��i\0-�8浮��\0�G�Vg0^Ș����~�o� @����Մ|��u��,m�n1��մ�j�o薉\\��U��� ����*~Y�?�Ȋ|��d���6��⡗T��V�K�ïwt���K\"�V�2;\"��c���/__�����&�r\\�!����ޙ�ǽ8Ӿ�V���i��5u\'\0�k�<W�]Ϭ\"ȓ[_-�pT�אzT��o4��\r4�7u���*�7k�ǲ}�s֜.A�EpS�A1K���m��T\'�ϥ1u�1������?�S���z4rdՀ	���o%̷E�ʇˎ�pZ܃\\�fuD����6��&��]�4�\'5x����U&M����Z\0TR \"�)7+퍇�J/��J��9DQ(?�M1����Zc(��:���;�?������4�J�ƣ,�p`A�Ũ���1<k�A���K��iB���f����Y\Z]�]W����=+��^���7.[E�Uʊ�Ե�F�Z\\1N��q���u(/q��=k�����85B�Cw<���Wc�G���O	̐0�޷t���Y�݅,1�Wc5��.�s׊��Z�:h��=�aU��m�ag��%���\n_ f�}2�)+ڮ���%2�2*kks\0�G�I�N�R�1��\"��i���vw+o�H��s��өx��]�\"FH4�4��i?�@@;ג��{uK����Y��5i�[kx��Z@Y����b�=�i6�N0+���\"$�Mx��|GzO��J�����S�z�ǰjw?�[?Η,�����|���km�\ry��\"���B���|�������uq��NA�ЁV���@�u{�?�8��)��>�U2�*��|�.��O�&�vs����5Yu��@���ƩŲb�=�H�Է���<�e೽v��坟)�Lָ����|fq!���\0���ָ翾�mkۢPfo�	�Q���y��i�)4͝:�{�yl��f�����A7����Om�7�ީ��!�Rf����y�as(�:_�M�\0=\rmu���y���4�V�X��5�\\{���<�#9�\0df�?�K��A��8�5d�ͨ���x4Y�h�L˕�OOz��m���\'f=���\\W�B���~&Ǡ��Ƣ�݁,���cY�Mni)�+�.�p�F$B}�\n�Y5�6�h&pv�T�]O��A���廽�i�c\r�W�\'~�`[����F�ݲ1���${�S��t$�:}sy��3���{����+�u�CWѤ�ײ�cw���ЂNz����Xɮ��6�{;��B�޷]�[\0�#\0�ڼ=�\rl.�u8\n����\Zť�w�J��WbT��{&8�;��x���?�\"�� Ƽ��\0�[�ַ�g�W[[��+\0�T�Y�b����Eʃ�U�N1g��q�$���4D��Hc��n1R�ps�Ҩj�܂2H�U�8���J��m�����xdf��=+��/1�9�a�e��^�j��8�D��#�U�\\&IF��X*��#Z�ڥ��^͜J�7Q��\Z��������,`���>m>O?Z\\�\\��j�(��hEu�VH�T�x��N�*E���Y��4�Y���H�qV�.��ߢ4KK�n��Q�\0�ˑ�����\n.(��%���oJ�ֹ뫦���pj�gcG�c sZj���\\zd���n=�R�J�@<���O�%�}���̽MVK�m�я���=Eh�)�$o�-#(AL�c��\"��[Lc��d\0�Y�[��	e��}Ʀ��RЩ�M0`�Yz~��`Hr+~&W�g&ѭ��\n�(�3�V֞2��۽d:0��4��VG=�E��m��ֆ����Z�7�*�3Ӓ\Zݱ�T�*e�x��i�7�mw��	27��능gczS�f�|1�hz�{�խ�o�Mv��N�`i��S�pfA�\0�\n�SWҭ��2{��H��lp��_;%��z�v��٢�D`;⺣��ꦵ>�6V�j��hw�ʶ��>ޔ��[xg��8�����犆��]�Ml�Bʅ��#�^�Dx\'�P���\\gtD�\0ߥ�xH�4X��\n��-B�3��WX��\0�\0��ɡ�\0�i�d�v\Z�Խeq\n�?���;��O�n�u���v���4�|[/�潴G~8J���6t7���%�$�Ìv���h��ݦ��$��T嶂	ǽYּs-ޝ5�[F� #=�ڲ--���4�Z�H�eL���OO_ZΤg����M�\'б��%t`�� ��\Z�p�\\��4/�Y�-���I���i�?c�oZ8�a	ڼ!9\0��d��Vv��O	k�ַWv7���#n\nG9�޼֜�8�=e# u��n��٦�]�c!q��έ�-��,mit�rey�<��ZW�ç���3��P�3җdʲ#�2�E2dڝk�m�-�ko\"���\0݇J����]C$)h��R��%s�Rq�b����KF�XthT���[2����)� ���q��W����9o3��/�|i�=#O�I��\'�3�m��O�G�5C��r-* ��\ZZ�flx�K�W�����a�r8&��g��ᦪ����X]pOS�q�Zӈ�w�EjՑ��ƈ�b�dQ(�?1��?�t��RI�$�+��o�x����1�:F1�2f�u-%�\\ �o����©[ÏN*���dEs���cSS�\"F�\nÓ�j��Q�v��2d�x�>�.�l&��T�k	^@�N�\0���}Nm!��`K{����᰹�MO2O��m.uv� �2FN���RI2T~U���8��\'���� �UT�h��8����� /�d�N$(3�[�>�.��%�wf�3+��Tu���p��-�	�ns�OOҹ#S�VK�u/�\n\r����01KE!��e��Ris��39�<�Qf�>��њ���ўi���(i\\Q��h�T��1٥S�S3@ni�±&h,z��jJt$�A=��M=�z_���xW�>B��u��X�\0f�bN��f�?��+�f��\0��[��O�\\|��8�$�)��k���.~	�-(_9.�����~C��x%��Y������3�Et�z���=����$�~r�������n4�~[{�d}�.Fr:VpMF��R�=Rh��o���C�vS�=��وn�G�-��u�����&�ћ�j����?\r�\\^�H�VdR{���җ[�/���q����+�W~G�mW$	RX���H�U�x�=��\0�\0Z	?�T7�ֵ�vJ`�ľ�I۞���<�E�ź�s6+)>U��J;p����H퐴�\0=j�C~�����$���Ե��W��hРv$�K�S�4@�;�U>������=\0��L�mO0�\\n�Z�sՓ����\0ښ��a��\0�jN*�����&\\7ul�[��\Z׆oe{p���l܇��`\Z̴ӯu�G{\'.F�{UG�1Z��k�����i.������8�[y���.�-��a\r�u��]�S�A�M�e�\02V\"tS���q	Vɭ+fܹ�٘���\'+���$�7�\\u�	�\\��k���1\\��pH�\"�CZZ��֬O��2$����-�1M�z֤�CxU���kem̚��%�.2��)�s�e��H�!�mSLFa X�\\�h��{�lv��aЃ�V�5H�b��W�,O�k����t�Fk-GP�i$��]��1����}��[+�櫲���\0zG?ZlV�9j�S��4�J�n\\��ż2:�8���p���g\'b�$��r�֯Z!G#�@2�=��ddV-�Ч���m3r�p~�\"��\0ڢ��^2A�vQ�����XPv�8�W�xf�-4uA�0y��kjKfg���x�eH|$G��Cǯ˟�5�\Zƭm�is_�:��N�-�#c!G��|�w%�Է�y]���9��ncY�c�<�����5<C���+ރsy��WN|�����H�P���	�uV�@>��?�]�^�i��*�� �w⩻�L�ìL?\n�P����^�.���ԥ���Ed��\\\"���sץl�^�����\n��&�dn�QǶj.���x�Y�v�#�����!c[�9Y��#�l��;/�W��#K�M��TF�aR���u��Gc\\���X����\Z	E���\0H(��\n4K���|�zTx$����[����U������̌2�L�G�\n����φ���.���#G-��r\n<L�~S��0�>�M+�\Z �xnzU��]/XX}GJ�p�\0\nB�ӊp\0����q�qN7!2q�7�O�$�;顄e�\n\0=NHξ��텥�DJ�I�kľ\rإƻ4�1��\nٙ�?�?Z�D���LV����5��� �|I<ӉMǔ���==�қ��^Cqu5��4�6��{�&!�ԃ;�+Ӛ�=O�r!H~�#��K���Y��%恩]Z�q�yQ�]��\0���W��6�����)��O��������(X�\"�+gw�8��_h�.��7�>H��ϸ|�H�y����Y�!a��&��H�����s�Zp]��X��6��P1X8�O�9���jz��-��[FXy��y���cڽJ�d��3�g��8�6�K��\0G���>��h6�╴i���p�cg�q�z�\Zo���;��*��5+���~�j2��e�{w�*��e�6u��ƹ1�kS/�8���_�oys��vJa@���u�-h�i%��hKݾ��w�jMƚ	�>�Լ�L����CHy�I�K��~�(�L�4�T��;9�94���!��@oZfx�4��g�҃�fz�\rP��L��i3�+� �\"��3�U�Ǥ|4!��E�+%�\0��\0ƹ�M���?�����o�YL�l��r��Ȋݣ�5��![S�~��G�M9�ePO����V���=�Ƈcx^i��6��;�j[����I.��\0��(2s�U�\'�.�U��E�84�X�WQ����J�w���uڿ�-�Ť[��F��*@�y��K�q��vs�؉�U�zV�u-�M0P�:�3�ڋ\\�.#����-��X�h��ꡆTSW��v�����Zs���H�9��$n�s�\0��\0^���D]N�[�A�g�*��]sJ�\0�7Q�[�Yn���`I��;��ns��+���j��4�;����<�n+�c�iM��Fɣ��o�e����I^�i2���$Ĺ��`�*$R3n-w�+&}63��t2gֱ�ZA!㊞E�i���u��\n?Z͍��&-n����By��[�O#mJ�e�ufeͯjOBb#����wyuu�K/���\0�$@pES�r?\Z~յa{�t�e�R��Z�\"�qB�����������*��c��Ӣ\'����##�װ��0�n̦슷�m\Z�c�5�jq`�\\��%�\0s�U4�++�\'4��ը]�z}Ť�>]��5F*^�4�JD���a�*��rIU�.B����&�ؓi\'�Ny.��\r*��E��o�Ճt�� �qS�X��j�vк�6���g,���x�ڰ�[Yp���Wi��ª�$a#S�A�q^{�M��Pr+=F[K�/���OZ頻��[KC�ug�|I�L��-����)V#���&�o�M�:���fTFl����^��lG���BG=�\0z��\Zض�#�L�Y�\r�5�Ir��9���F�dH�\0�Pi����oR��m@E\n7�[��aT�|o�G�����D`\"�U���.a��j��\\~���\0	�H���\"���y�~��T\0{�_��}S]��Q��u� �Tz�s\\Β������h���S��ϩ�>�[�7--�{�`�۶�3��Z�Z��w��$�8#���5�VW���y�q��]����7H���d����z2l�t�K{A!�6y�_���ڳ<g��k����M̱<���dU;M[���E�sFr�K���躅�\"��O�\rb���|�0���o��G�L�1\"d�I�ڸI�\r��V�� >j1�B?Z�{H��\0��N�c���$��<����#�d\rT�L�	ny�I���,Mpd�������h�u1� i�d��G9ɥ���Ң�4d��c��3�\0#&����\'�\0�׶���E�6>4�77P��%� i\\*�ބ{�\Z�+[خW1���7�T���\"��k��0>�q�\0]���\0r8渫�\0�<�,W��$$��A�����)���R1���$��}8�~�^�W_��2��>U�M�x��\rԴ9��tC/�VA��ֵ��u8e{y%�#;F`���֦�U�J�;7 �&�z�=�W*JS�{�iB�L�I�;�#.@5Ѷ�n���#��ayj�\n�x��M#Xэ�dE��\Z�!8�\r;N��\rNG��ev�OZ��* \0��2+�9�z��oFc,%8{�Z�\'�3�0�JMz�0\"���K�B\0��SNzѻ�0����3�]�\Zv`��L�KQ�����J3M��ғ4�q���g�ȣ �z���G�P�i�/��?��\\v�5��(i��Һτ��\0��?�lG�<+��i�\'���]�c�Ed�v�{/��?a[\0��U�6�������\\���k}b�-�Y#w���nF��~�\n�<9m-���[[��]��8Z��cj�q]��g���4�J-��:ר��~\r���Ě|r�3a�nGN\rw?����7�Y�G�4[�q�`g�5��Y��^�bk\\G�_��#��W�}�7\0#.[�4�9[�ۚ9���|��>�>鎙�8�f��x�\'��]i��p۹&���!8�O�s�׭��Mvm��6�����ABB���=�=�^��ٮ�M�(\'�5~�{=d���X��fR=95��\rӭq>\r�_�ۃ�d�1��͛��6��l���Jƿ�r}iI0*k:pMO2[��T�U^1ҙ+����֡i2q�(��\ZVcf�*��G\0U�\0\"W(�jD�J8iz�f�4fߐ�D�u���*_/��)P+aEP�`���i\'b�ة	�0+kM�i�j��V��Zݳ�$g��EtP��2uR	+�=+�x� *^k��#S+g���f��XbS�lڒ�KWv�\\i�@�<�:W1yd-�+���o,�9U���MI�b�J��u&�F|��`e�K��V�d_�y�k\n��L�T��\"�d�\Zh��e4�Q�䌐2TS��GqV���SHO�������p�8�Q���c�������\n��M\\�RsY�[=1S���ҦB��~�.����m��:żl���p=09�z����<�}��g�颬s�:��]�O���F�q @���P�,O�ŏ��Pk�	��U�)��Z��ݜ�3�kHlT<���ث��5�������^K��n_�|c�,�n�[ޗ�!����V��G5V_	�a��G5��̋�1��I��i:|�����I?��k~)�%(�/,�%b g��,�AfTm��\'Ib�\n��EO�������3)r|�RI�{U{?�}�Đ����\"Z�|�{�U�J�yᑹ�桦�{nz��Cii�籤�-\rރ�Z�Ui�e�1�7)5�z�ֻ�[�;S�6�r�Nz��t���\Z&��*�i49\\SPm{������^S����I��I�U��H�m���[w[]&�`����V[K��#�k�&�䕵\'�A�j7ȫ>d8��4�ycS���Ri��MZ0���쀏����i�;����Ҭ�)���ۚ��\0ί�&ɀ=��\0\ZV�w!���6�6_�\'�j�]4�+ě�b��p;��	��;(Ixp������5��>��E+�	��Y8�k��z����o泸f,�c瑜�J�\nN	�a^g&�mm�ū鶒ͧM�i�GTm���	�v���O��!����TY�d�28��^1�4���\0�ӿ���Ӆ�����$�r1ֹ�K�F�sD]#^s�+_U]^���L�,��[!MҺ6^خ8�X�݄�:��wj.ci���p����Gl�����H�ź��z�=�E�/�i��w��#?֯j�y@�6��zջ�a�kq`�иV��M�pEd���RI�+�EsB�q{�M�7E$�¦�kO5wo#��`X�\0�5�V/��BIE�<T\r���Z�6`�k>x���0��ztS��U$��\rf��CJH5�l�C��\0�\r&y���~I��Mϥ8��\0ǽ!&�J�RSG����O9��E4��J\\�қ�P(Aa�O�ݩ3I�j��Iڂx�Q瞴��ބI��*?�Uc?z��\\���_������k��TⲈz�\'�{P\'�K��{7��j��)��\\�`��r�տ��=s�+���\Z���1g�.O@+��B���FG?j<����TZ��WZ�����X@����x��EI)o�\0�mV3H�<9����л� ���+��B��p�h�$�����O��]���a�[��(���\'��\Z}��\\����\0k[_#�c�ݷ/���+��k��EԤ��}L-~�Q�t߳ZG7���д)�BX��y�$�l�ۋ\r/Kҭ�o5�%�Q��[a2��˷9�Ey���Z����+[\\��t\'�d��GOJ���B$frһ��䚪�\"��m�IF����ح��`R�c$ק�0��2�^=�%�����G�����19L\n㩽κOB��7�j���;�ҩ\r��֡!���N{�5�t\"��7��o`Np9�o�%G�P�u�i\r5d�I�*(ZI���Ҏ��W���\\�7�i�ˁd�+�K�.u1��:��\r�j�+I���d�� :\n�摴�ؚ�6�D��u�⍼��h�R�A{6ch�����(�5�eha����ɶf��zf��Mj��%��bI�k�!��%y6�:�����)v�N*4�R��7~���M��\Z�� ]���k��dT�l��A����xt�x���g�4���+KQ��D.��*}�rv��[������黫���vG��檴8�v0j[+�1\0c��e�E9%�\'ё��7�\Z�L�����q�Y���Ӡͧ$ӡ�;Q��O�L�*����*/q4s�����z�T�6A�+KZc���%��fh�A��(�79j^��xU�5:NT��+*&��\';M,�<���dѪ����w���T���UZ�I\\�{����w^9�d�4�rv�^jՔ�?���㷭/Q�\r�H����M�τ�����[x�{��ՒEW��\0{�}k��\'1�=��#\\xybӵ����m�5���0q��<3@���=N}�m�E��s�<\nv�v���6�躬?e	��G�!#k	R=�u�+GP���Ks~�\'Go�#�X���f�+�Z��:����[ƨ\"�9 ���I\'>�*��;$��K���T���+8-�}�\\���M$�\\[A�6%�\'D���K��M��\n��U�ÒT�y�W��#S�ft�[ �S���}�N��\n�w$b9�������_[�/�+�.�?ݸ����\Z�5#-6`�\"N��3�[o������늝ds޳����P\\�Ok���L	�~�2jS�6�ˏCYA�M)|)Z�Hޏ\\�2n����!f��`�p���x5pG���~�	��͝���E#������m��i�8������P0�#���\"�1[�G�u�$��5	��ͽ0;m9�l\Z��-K��_\r4�Ԉ�3�B���~��(�Mb�#����y�h�\0-n#�,�����\'ԩ�~��V���Ĳ���0ʼn�VM$h�Щ��V�~�g����k�^O�q��Iu�Z݅�7��6�?�\\vq6@�J��7H��x���j�*�kac3¬X��pj��];�#e��V�1��IU�5�N2�^X�E�7c�qY�)�E\'3[�^�~��\n񜓊�|e�y�Eg��M�t8�s]�c4䉝H��]�)r3Q��Nɯa�� �M�(#8��ژI��(�=)��}�A��b��X�i4�S\0�=�sH=�hB\0ii8�A���@�]/�Zֶ3��	��\0������c�P{�/��im�)�k%��+gKF�&h|�5�����+��.�\'յ%_�f&+E�,�o��#������x��)��[�^O��	���\0s�v�/Ro��Wa�E��}��=������c�!Un#��3=�1�z9�#�>3jWr��#�p\0Y�i:���ֹMG�>#��~5���Vy�Q��WN�D�.OS׼S}�g��^\"�.��U-��+�g\r�Y���Ҽ�ľ/����m\'��x�8d�Ԗ �3�z\n��{��k�^I�س�OZj�O@O�Rr�R][6gojԷ�D��j�ZHW$5���i2#�撋�e�\r�C8�NOҽ����H�V�a��\0^���s$��;b�o�����R�V�.Xm�q�?>�UzYKs�%\08��UiK\0�֢���k��R�l��Q��b*W}���T�S�ZN]��E*�3X���\n��*���q�W1�]��4�{\ZEuf]����Mz&��o�C\Z�\0��V������ZڳA�l�4\'m}N���i?�Q��0y�Q�+���m��هX���\"��#<��I��\Z)4lN�U+ͭ�Z�����ET����P�r�l���sڢk�9n\rg�ߎ�Y�͒���P��S��%�eH�͐n�w�j�0^sS$�Z(�d�sWM���5���7k�I|�C[��9A�C�^��X��vc�)dpy�B�*$�5ɼ�9�U�\0�����bA�d�@oS�����\'��k�󊿨�-^o2��G�\0�������q�Q�7y�;B��Ƨ{����TB����C�ȿq�Z]�4�o:�8\0q�*H�m^����p@ԅ��Ɋl�3Eqj�����3�Hu#l�f��f��	�>�����p9��`5��A����Z��͹a����&��zÑ����p��ҽ�EX�ƣ�� zT���µp�,�A�M�~z\rZDX��\\�b�:����5�X��][yL�X����+ME{9�浡�2!pݘTKRw4�</�z����҆ϖ:s�;�����<3��,�\0jH�%uO:�b���q�;WQ��Kg���ρ��cܟJɞ�=f���ݬ�<�]���_AU�;t\Z]Y���M�s�]����r�Cy42����Tz�ÝV���Vo�9�U�-�o�#a&q��Q�&�h����4o���T���YϮj��.H���C����G�-��6y4��rj�8s�@i=��;/5�xgƚ��.K�J\Ze2����w��Ur;�r�Ə�<;�=?�\Zj��?<	ao�z��^=�����\0[�����c��9��\\w��G}�j�_X�RE�pI�\"�;X���K�{xn�L1<��?J�l�+V�kk�+M�8�����joI�hz���Dm\"%pz��G���s=��#�C��g����uP��8�%+��k�V1��|C����E�\0\n�$������<�����dFڭ�wMl�պ\Z�❓M��D��hSsK�F�d��oΕ���Q�hɣD6��\0�4���3-�p�Z�f�{Q�Q�)����ZPi��(�XQ֟2�2Cm$�0TDfc�ܚ���$�+�мI���[��Ϭ�l2������Nz��I��s��o���Cı��@c��O_�t��G<�w��z~��<��V�Prq��]�\"x�X��L�+�U �v�9�%>+��Q��o�8�Vp�Fs�\0 sZ�\Z��D��t>?�6�w{e��֟*�\0��N&bA��^�k�j�3ux#���L�e��?�t~����\"��գb�)<�s�oΗY����#5�N�my�C�H������W��4����#��Q3�v�\0>��4�	�����9�ZB�e�Q2�֭�ݶ������V���Q��Pu��t��P�zW9�}Y`����Ӡ��J�(ݙ)�r�9}Rt�!�\'^v���r2�S,�3�.�\r�xϭS��|��^���G#�+hW��\Z}��o<sD�$���z0�\Z�ߚ��x�=M`�]ϣ�k�\0�\n��?�щ�V����U���\'�M�C�ڼ�7�qa�\ZٚF?7j枌��o���ޢy�:b�#)n;�y@=�ټR+�\\mS�r�����޶�$>��9\rq��)Y#�`q��m7×:�FvF�2p7)���ޟ�-(k\Z�qܐ���x�H�}�k־đG���]��9g6y��\rB�bI�k��|3=����ol�^�,\'�ƿ�,�f��[�\r#>�yi!�p�����\0�$��#�B��[K�),g�C�+��-.�H��\\�d��\0��uȜ�Si9�����$�B\Z�9��4}�=i������j�x5[�H{��{\Zm��5b�v=MiY\\``��Yf�Z�7ܘ�lo4�֙$���\"l�Z<̏z�\\��� \"��]��<`�p�\Z�Q�f�3w�@�j��~���M3H���0�&Z\\�����&ă�]}N^�5� ��ZbNT`�F��3L1�҂GH��P��{T$�����l5�~	0��H��T��	���m4����\0�r�E)�0\nb�O�Z��ϗJ��ݝ��Keq�E�k�O4�\0�6�C���I0��\rmG�����T���H��z�F�6C�A�@���yXF�~�mX_Z��`þ\rp��K�����m���Glב�۠fC���uk����,x�s��-�X�d�LWS��\r¤2p�G�\ZRWV�kk>�Y��Nв��62x==�y֧���9Ԯ�ܭ�z�Q���-�>C7��ğAPćY��M�ca��֦��B�<I��7�RX^Km!��GB;\Z��q޺����9⑎�R�S[���sލƘA�\'�_�:�kw����u�o)c8uι��*Tr��ͭs�.`�Kk�b;�DT\r�/=덞��X�FÂv���WE����&k{��5�*2�pB)�6Э4\r�HLbQ��brr=k��4j5-�����.�Of�u��9�=�s�]-i��vgAڀ8���^j��C�J6��(k�u�Fy��(����M斀h�)�(�M ���8M4\n��3\\ A�$��i��+j0J��~��\'k��8�=���|��Z�.���z����5�\Z!%���\0�����$��늽g~��b�Yo��~id<�={}*_J�M<����@?�\0\0���5�S�ݓ9eW��vks�:�+KF��y��w��g��Y���\\�(��q�{���\r1`�R��=�5[Y�M6�I3��0kd�nX��0|g�F�m` ( \Z�v��1�M\Z����.K1�=Ns�?G�i�W#��4��.TuF����7��A<���u��a�d-gZ?�E�)�7�Le�c�HS��)s2kQ��ـ*[�+�o�P���u�}+_�z�O3(s�Oz����$[���;S�K�l��0�\\�r������;��,�q�,������}k�R��VC�ȧ`���8P2}ϥga�����k_\\]ͼG{?�*�~\'���K���+J�}?J�,�t���&x�Iv\'��}sWe}�\rN&���kFw�#������%�i�0>�Fy����w������f�kn/fX-���I\'��[�7�(\r��F�c�7~��+H�oP�%k�l7Z��«�X��\n��]¸�	x:mU��;�6�G��q��r}��뱞U�2MouX枯B��F��<W�ˇ89�ִ��`���r��;��5�\"���uP�J�I��k#Y�-�}9�����r��=EY2�#��0+�T�j�<�}2H.��W`�SǥI�$��a]��z�{g�n1�BO�0;{���+ٕ`Ax�vF���J�d1h0���i�xv��$Z[f��O�@[��T�N�%́�+��1��2�;{aq�^4��v8<:��\0����+\'�M��i�i�aQs&\"{�L�ⲅF�,�&�R�>�?�=���$4R#$��YX`�)D��ˡ�h�$$沵˜@���j�(\'5�_��X�p)B7w&OKdv��<�K�i8�\rn����p\r#H@�R��$���E��mǃV!=��7�Dp(b� \Z�t5[�H�Mh�nj�ITU�5:?�EՓޛ#��B�5��4\\���U��6}���54p� b��V|���o�-kEi�2Lʊ��rW6M�_QM�YapU�}�r�$�`{Q�����{SEn6�S2O�����A��I���3� s�O5�j�i����}������cZ���H�#8+чj�&&��@�}�����&,�\n�����k�&��ċz�g��%�U������6��}���0��������)�>V\r_S394�8�K�w�o�kbF��sJI#4�{T�=����&�J�5�ю�:��h�\'��F������2~�滿�2�>������pk�a���V��һ��Ao�t�í����Dc�\'��\"~l�Ly�T��20j�E��)i���N�l�r3�Lϵ;����R\nZ}B��3�)	� �RM\0�s�P(@=kS@�ͮY�H�������\0\nauG��B����*�$�ݑ��-�ӢE7������q[��<{\0�\na\\Ձw�+*�8�l%�@��F��7k#jK��6�����Ś�^LQO�1�+__��cV��k��v�BI�j�ٮU��ud1���rk��m��ݎq\\�@ȿZ�dc��Zw��*�K\Z��FI�^Ԃ�ȧ�]���y�T�2�@9\'޺�5yU��(]ܦA��$�T�U;�˜p;Ư{n�3u��dݞ��dv-ȉ4�OZL�<҃ڱ{���������Z��n#�\Zt.��Prߠ5�?*�~i�y�e���nO�l��?�\\�B��l�u��?���\n����VS�ӜȊ�gt&�\07̽j�᳆�R�`@6��:u�ky��}�����ʴ�Hҟ$��I�\0j��g?ΐn��D���*��~����j�Q֭b���uo2V�2���H�w�W��ӱ�)is��W��JҗP������s�2xq��k�Y�&���$Q��W1&�|�+}k~n]\Znz��P/�u+��y�ص���Zd��S�sCj��0�����St|kb�C�f�c t�)���2�6�VQ�QQȤ>\0�����L��L��rk\'\\І�Z��b�� ��_�>��\'<T&��yţ�jT����YOc]}���ϥ_�4[M]�I?sr�	P}�w���:\\�.P���\0���vB�d\r_CqaV�h�\r�\Z�Ӧ31��k#|����RN7BM��x�@��v�|���\0=P��Q���y��5��D��3�y7��C�ܙ�G���c�,s����E��aR-js��\"8��0�~��Y�2�I�Q��J�\r�x<b�$)���1�l����/Zl\')�I7N\r6�F��U�[�*���q���N�S�Rg4�J�CP)����\0O�ޚ_&�\rH���\r�bM�5�m��R��N�AWҁ2̲�8l�P��#Ui�u<��`��13N��4��Ң�)ݑޡYLh8;�Lcw@)=w-�\\=��lr�TZlD�a�\'�Ik-��:K�h	�R������,���Bs����t�kXL5}&{Y7�2��o�+��n�}��֥Ӯ��m�գ*1M&�OÍ���L�:��ؑ���Қ� �si�񊛀���ZM�x=i�J��\'W���J���=TzDGӃ\\j�Muz��p�c�\050��\'���cϵH��p*#��ҹ�73��n>������4�Ÿ�اn=�v�G�J����d��\0��}�5<V��?��1���2!��Hy�X<?��\"�/���z/��u�Z�{����Iم�v�\ruq�3�����h��j�~xź��~�0�\0�tց��f��4	��~�\0��\0\n�_��,~�p �\0n�?�57�\Z���gԉ?kD9X�<(8�[QW�ț\\�5l�A�P)�M2���M�r}���ioؿ����#;\Z��;$�&��S�ff$�$�+��Z����Z�0͸�V�+#�\Z#OL�.	�k���P�Vf�\0X��n�j�#(\rv�J�n�\'y���z[p\r\\�̒�`J�5b�c,��R�]��7A�pԟ<���l�o.C1\0�ڳ��1���!��֢\'ڹ���b��Zv9���O���1½S�핣ɫ_]�m�cDW�IO�僞��?	4ˈ����=�܌��U\n�?����3��t1�L ]FO,���\09�s�ֳ^��ki�i�j �kSYr׳�\nH�@�8���F�K�m�\\1��g�0��1�ϭwU�����iX�<?�+OZ�O~G�pW�8�	�:��S<ǩ�Z�7U@�*+��rw{��W.��5{�rpM`��$֎���3���9]�wBܥ�$9��]��+28��E�в������h��\Z�y��+�{KݜTk��vS����Tm������b\r8d�\0�X�N�C�W1471,�{0�G�����0x5ka6T]:;lye������x�3OGӽn�ܲ��p�����k���gy��T���zz�ۊp9��+;��}��$��φ�3gp�Ն�e^�.q�����+��c�E�xn�6�3��h���G�+�c�}k��Ntq���0�Ԅ�O5hBԱ|��)8��m���}�{U�<\n��j�b����U9Y[��[i�Z/\'�x�Q�L���J`J��EL�*�85(<P�R�~:�rɓ�f�\nam�5V$\r�W�M��{��U�|�qȥa�Y#�r	�a&�OATL��PGNi�NC�J�\\[\Z�z��A���e��L	&�4�N�)���ãS�u��º2^�-���ULJ�unz���52E��w�p���Bƣ\0ΦN������H_�����T\r]/��+��`N�\'?�?�W5�;�De̮L���b�Þ)���L\'ژ\"3�׭&)ƚj.;0S���xp�Aֆ:��\0���+���-��C�#�Q�RZ#�n�/���F�*\'5C4ѳ�d���#�|=�~6��L�\Z��r����m#ұ��.r~[	?�\0�R��Ń~/�\0֬�\'���q��:�~� ��a-m��\0WI��\\�����\0ˊ�\0�g�)�$�=-Q�D�\0J.����FO�rG\\���CI����I�htuԜW$چ��.@� �\0\n`�Տ[����P?h�ƚΨ��ʪ�$��rFMM��H>���9�e��ɠi�77npd0HX8�J�vf�1��4|}�:k�·����k���#�!�=��n4���K���xĳ�9\n�J���E����E��a�^��A�Z�Z�2�)$�dסN�\"�9�S�DQ��$�u^�u	��e��6�R����i��Wd.|ǫ�0e�U(�^��D�k$��rzY\Z\\�bڤt�z��<��=��l�X�v�9&��G�8C�g��N�֬��6�Y\nOSYc��\\�V�ܪNNh>�� t�qֱh���O^����T�$pi�_BT?lW�^���~�$�%�ژ2g�����͋�3�G�Z����Z���l��k%���8\n\0I�q�+H��L���5�\\o��-!�q����l�w��}7����L�^e��A+:���L$�@��<׫xV	t�\n���J#�(�upw�k\\T��I�B.���5���pFi����+��b���5�t�ڠަ}��f��O&O\"�8���q�s`U�)���z�4�\rd-�	�����j&��VT��Ws��ҙ��N�\Z��1_#��L��E4��J���$,����Td��҆�{�B�O��T���M[����N���x�x9����8����R.�݆y�xF�l-5��~��H��ێ?J�|�\ry�a1�����&��J��V^�F�\0��a���<>i\\b�N`S�Jyn��^:ӗ�\\�=EN�T\0�T�i�$�\Z�H�GjN�~e�5 9�c9��)�t&�*%<S��b��+pM4\Zcǭ&H��,�py���s֝+�Oz` G�+���$*��NfSP3m攤RB�?�<*��Y�#<�!w2�\0}M 54hN�/�+��rF	<�VM�0[(��Gq�\nr?:��:�S�CwbD��+s��s�Ň_�pJ���z��I�3�ao�^zEkF�b�7p�:�g�On�ޕ�Ű�M3�S�㠦qY��0,s�]7�rt�k�Y��\0�-\\��t�li���X�}�V����Hs�L|�R>7��*7�5/MM7>��Ҟ�ڼ�|N�o�����m�#S`@[a����r�r���C���+޼���;�E�\ncx�V���G��E5X�/-E;b׊��5&��7\'�ڷ��m�;��{p{�o�P��p��uR�\Z���W���pܙ�nܹ4��C�\'�9���Ǫx��0h\Z+���2E����˟�G�\\���*;=Mf�#���!V0F8� �ʹ�L�ֹmB����yG7|��޻��f�P�.�3\n�IY5{��y�KP�2rkoS����W/}1{��*�ɧb`�#w5Y�M=�P��l�\"X�)�1��\\��Ě9�;\n�_9����}ڍ�*���mٜ՟2Z�����r��TI,y�Q��H��J�\Z�˛r�4��jF�jR}����lc����zV���H<���׊�n�)�Ƶa��2G��֞��oc0�Q�n��?<>n�n�ɞO��H\"��)_���\nW�ڼ��y7n�_J|\'��\'�� F�$�1��\0��OE����T���O����^�3����nq׷m�j%���i�pcU#S`��6����ɒ3PK`Շ;�ڪ���D�B����4�a�u���=��2��P�ۚ��>j��j)ԧ�rDdw�La�H�:�i|��Е�͂x�D�\"�e�T\';�qJ�b\nz�ґ��Ni Rdؔ��T���B�E8*m��[�s�S��SCrh�<��w؉�Ey��`٩A/�����z\\�\n� C�)z�wO��\rmAڢ&�N\'����P�pעq��Bcu\"�4��%*E&��^KQu�)��Fj@@�4���:f�w�P��<��$!���-�I�1�i���a\'�B��\0���}*�2\\n���F\\n9��\0�G���^�˒H��͚�@Q����U�V2D\'	*�\r�VC��Td�S�P�;}����G	\Z}�=y5�������������s\n���X���z���T�,}Wcu�z1$׫p}ҿ�p���:��]�Ǚ �b_�[ɀn5�+\'��*0�4���Rd�ڣ#�m�&�m�Ji�<�w�����nk��>������\\�>���a���N:��\r(�Zܙ�:��|�o#�Vl�x��\'u��:}��,��wn�������V7?E&���2�UۓKD��:s\\�1<��eJ�\'̰x[���4=QչYɂ=zU��%�6���L}m�W��E\'����a8_s�(<�{�\0�n��E��^�Ꮚ$�\0�_��Q�k��Rh^��\n|R����޸�V&���W��nd�7�J�X\"�#���ї���e���ryv�.�lt�Ɨ�K�x��\0\\�9�q+軳��\nڊs��KE\\ܘ��g�<$*��\'�<՘�UmG5�^�o�~y,h�K4{A�YO[#�ŵv�$�[�a]�oZѹoݐk*��G5�Q��c-�j\"ri[�M�Y7��ý�搚c*[�\rS�A�b���P:z⬻`f�Y%e�g-M�zS� `��R�ym�ySҢ#5	w�7џJqQ�i�;85 b:\Z�7��i�����Z����F\0��s��[F!�ھ��Y���ۆ#6�<��T�#�饲+R���J�ʩֱu���P�q���r�Sn��t�f�[�┵��ay+P��T��c4��Q�v)��eA�`t�+��LC�q�7�g��\0���W��~\r2A���(��\"#�<�Ȧ��ֆ;zw��B)T�	�5?\'���*li�F�#\"�ۥK�)�s�T���fqO@{�Jޞ��������d�is�B�qH�K]Gq\\��k���e�Tu�:���?�u�N+�Q,��0$�,����o�L\'�O%r(��[P�ɢ?�k�8D\\�R�֑zZT�HD���G�qLC��G\'��T�V�1)s�L���zS��A��ބ� <rj9�9�L�k��({����c6F�J���бɨܥ��҉��s��Q���2D$�&��sN$�M�=��Y�n���p,��v2+�Af�V+r�~d����!�6Eni�,��r1��KPf�:����;Vf�\nݹ9�Ү��憄0S��jηk�M��Q��[����Ԗ�q���qO�Zi\"�}�w�&�nOJ����dt�f�a�+����:�\'�ӭs��tl&�3��P��=&7�i����|��>��=\r\'��yhƌ�@�j�q��֡���J�0T�s�q��c9����5)ڽSR�����2ؑh�������{ˆ���x�OZ�,���a\r���y.������H�g�A\\�����U��l����G��umH��y;�~�~ZZ���Q@z\n�M��ugwc����%�{ոn3�ǚ]�=�H\'��Tef&�/\\�[<�)yAI,�hbLk��\'qGBM��\Znx�}���!\n)�x��T0Dd��,c�T\0Q��u��a����z\Z���w9C��=O��Q���ڸ��(�<�«�X<����&?Ĺ�~G�G5X�\"���X!,�_\'ks׿=�ޟqYx�bo@8�˥Ʒ��#<\no�54��������A�_c^������Z���33��.}�~U��H\0k���?�,���.�\0-վ^��>��4�+eE�g���v�ҳ��,y5%F�G�TB���\\3��[f��zP�h�JC���ŏ�)y)��d҂z����CU p�BW\r��pWޡqUd*�i�A\Z��\n�������0�k�U;z�sI\"�ғ@�_x9���&�d��\Z��Ɠ��1�H�c�M;�t����Sk��{�U��&x��H�����Q�� ғ��/�ڸ���ֲuO����D�?5�&H�o�}��7p��~y�ǖ}i�\0�ڜ�r�Dp>��4���/zp�T�C��^h8ǭ�J-p=����c�\\Ob@i;S��R��Ҟ(\0�b���U$l�I+�TbIǭL��.w6N\0D�8��ђ)�lv�a�q��iؠ.9�B�\r���4�=x�PF:�A@�T�1�)l�dp�=�&�(�D��҂��(�\r�8$���Q6�\"c9����1h�@1�8�ں�@~ʀ�m4����a�E0�qҦ��˙���l@�t]��d\Z��HrOZ��*^�����t\Z�[���\\��ϓ�o�`�}���D~-\'��0����)ӏ޶=i�s��n^��K/���h�N77P�޻j�\r�\0�#M�Y=\r\'+\0(�����$���f¼���<\ZM��j�d�dc&�.8>İ���/o������\n3ɯ\r�����ۍK��ob(8P:��i��rg4�\"����mV|�rY�KSTu6;�\'4��ln1��[�|ؘ�3^�2��㳽�z�b}á5R�`sR^��8�+=��\\�su��#�U pb�E$ܸ�X݅^i�°�|�P�S�4�ڑ�{sҘE�x�v�\"��lf��v�s��(�d��:Բ�H�p@�0]I28�=*������\Z[�7�o��qW#�m��\0h�k]��l���:,c5�|欢�sT���5�Ú��1���z��VOZag��) �8�$4�~L�I�aW�\n\\����\"բ�1�x��`�Q�@8@MM&���#��������K*����Nм�Y�/\"�s��Ϊ��4\06^%��p?J��{ו�7��kX1\\`[�|�l�q����������k��ydu�w��砡�㚱\0�9���N�� �S�zS�Ni�5�CRkA8i���jB�\\��d��Ș��OW)�0*��?-4�/A�qA��i��O���*,��#&��fP�x�0\'�*U�e^�c�Q<g���Mdϥ&�+��8�.)X\02Ji8*^�[����iru��s���\'9斬㜆Z�tx��W	��V����*z���7po&��*�s��E+W�pyZ��c������W!=+Ջ�S8$���E)�4��WBn:w�ojN��B�y����4�*�� �O�H8Z9��jӉ5^w�E����y�{S\"M�J0]�Z��{{����y!$�զd��9��P�.��S���\Z�jʪ�ɢ���P~c҉.6�-F�GJ�+3t&���#�\\�Ҙ�S��+l��4�Y�v�5�6.����<�WUi:�5�H^¸�W*�=\Z��&O��6iO�����k0���\n�5k]�z\\�$6�\\��c�k\rQ,c6za��i����O@CH�5��o���\0�_�XLks�X2\\�����HR�LI��֘�qO������?ZV-�>Ԅ�:Օjʶi03Z\nI�Er�$\r�ܜ5Cwt���n�\0������qD2�+|�6�G��uѧ���ԛ��s����r���S��힕ɨܛ1��ν������w*�#��+X��.��;�D�d��wU�F<�^�sY�G8�ZH��S��U�ܼ\nԘs�T�M�k�z�kA�9ȫ��\Z�\'��dr�׎��n�8��a�9[����f8#	l�8֤ޯ;�\"mmF<����֛����z\n/�-�aH�#��5H\"F��I�C����VQ�̱\'E��IXžc+\n�p٧F��j92E^��/ԅTՕ\ZS���8�Ɵ^��<ԏ�*8�CB0��L����=i:VcE�Ｈ�\'C<D}���\0�?�O��SV�K1n�M8L�i��2Xs�������sU��nt��5�\0èl�~���dmJZٟA�.ja/5�x{^�U�އ�B�:q����P�\n���t5ذ�cޣ�~���!8)z��_J089�Ȥ���`L\\��P��J��\rE\"�\"��Ϳ.��(�|��9��qޭā������)�8��i��I�v��Q3T�n��Q\'�*�q!\'��{���\rC ɤ��9��҇�5s��)�jFX��r1P�J~I\Zd���\Z��l�na���?���4G��w�-����e�C��W�[�wЕ����|A����}�O/h��\'��1FFi�4�J^ԅqO=�T�95�����}@�\Zp�F:S�\"�9����j�W�ޫ��mǠ���\r[rHǔ�ۯaQ�K\Z���Mc�*[(C�H�&��5a�zE�CiN1�Q3�T�N�N[�X���I����3��b�5���I�D�p�2�1�V1���Wԍ>Y�;�Ob��V�&�b�����O}�x�=�6-��U�Dz�	�I9��L�\0z��7����R8r[�4A�Q&fG�Q��ӻ�S\Z��\0ӊ���2\\�\0�*���[�ϟs��]�0�����Ͻ0��Iq��=i�G�&�l�e`�T�\0���p�Y�up�b�w1\'���J=8�Vdx�T\Zv�!B<�ƣ8!q�OƼ���4q\n8�J�յ�5�a�falF�����/F$Ӳ��+Ӎ.J���R�Tq��W7�wc��W÷�5�gX�&���&�<���p��VqIA3I;�U�.0O�*x�S�v���22M50qp�����\r�����Ɇng+\\kR�������\0p�LAM��jbG�ҳV��y1���Q�A搒9�B@�ޝ��XsI�y�R`�=��ɒ@�I$��-\Zn\0�\"��zT�B95U���p+M\0�%ҩ-C��	�y������T��\0sK��M�7wj���!X��id����u�N�9ɬ�-J�\"�J�q���)<ε.VLzu�ۡ�\r]W�Z�xQCh��>�J�\"�9�؁*v*��^�i�)$Ld޼Jݰ�Mu~��|��9��=~��V�2�6�?��SIjE#<Vt7�2��zzմ�c#�r����ۮ3L#<P#�v8<���׵!ݎ�4�:�C�g���؈dFH�OJG^��)�&�11������[�N�w���Q��qKr�����Q��:s�S4�;pj6�ړH�]�\ny��$��]�T��H0*[�wdD\r��MہCeO�0��P�]� d�V9�c�4O\0�E�؂�,L��R0A�(�my,\'�F�#^�+�H=kμE\Z�u9�m�z�VWW)G��3v��.ӌT����\\�e�\'^�ݶ�M/�L�(9��Ԍ��Z�75\"�֧��.y��.i��C4�oa%q���H@���R��ܭ�!V�cJ�aPe���lH��>���I���-�I���4�O�U�ɦ�={����ʰ�y4��\n�+Ryj�1�ۚ6bƛF[�Q\\L7qL����O4\\�I-0�[�d�DW���k?���{��+�F�J�coJ��41̓��SI�A�W�m��O��X|��=�s%�������dU��^��H�a������8�^����[�\Z�\0_7�ΰ�ks�-��?�|R�����L{�\r�c׵D��%�-��؂��W?��'),(2,'ABEL','VAZQUEZ','HERNANDEZ','1979-01-10','VILLA GONZALEZ ORTEGA','2017-11-01',NULL),(3,'SAMUEL','ARTEAGA','SALAZAR','1990-09-16','FRANCISCO I MADERO','2017-11-01',NULL),(4,'HECTOR','ARTEAGA','SALAZAR','1990-12-12','FRANCISCO I MADERO','2017-11-10',NULL),(5,'SEBASTIAN','CASTILLO','HERNANDEZ','1980-05-05','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(6,'ROMAN','LOZANO','CAMPA','1986-03-10','NORIA DE ANGELES','2017-11-10',NULL),(7,'FRANCISCO','MARTINEZ','MARTINEZ','1986-06-12','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(8,'RAUL','GONZALEZ','HERRERA','1978-05-04','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(9,'EFRAIN','TORRES','HERNANDEZ','1978-04-08','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(10,'ROSENDO','ALVAREZ','DEL CASTILLO','1985-02-01','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(11,'JOAQUIN','CORONEL','HERNANDEZ','1972-01-01','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(12,'CESAR','CORONEL','HERNANDEZ','1981-11-20','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(13,'ANTONIO','HERNANDEZ','GARCIA','1984-01-20','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(14,'JORGE','MORAN','GONZALEZ','1983-08-08','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(15,'GILBERTO','SANCHEZ','ESPARZA','1983-09-10','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(16,'PEDRO','GARCIA','MONTOYA','1993-10-13','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(17,'GERARDO','RODRIGUEZ','HERNANDEZ','1993-05-10','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(18,'ALFONSO','CORTEZ','RUELAS','1983-01-01','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(19,'EDWIN','REYES','HERNANDEZ','1993-05-10','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(20,'ABELARDO','SIFUENTES','GUZMAN','1980-06-03','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(21,'ANTONIO','ORNELAS','HERNANDEZ','1989-05-09','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(22,'ISAAC','ORNELAS','HERNANDEZ','1986-02-03','VILLA GONZALEZ ORTEGA','2017-11-10',NULL),(23,'WILIBALDO','MOTA','DEL CAMPO','1986-04-08','VILLA GONZALEZ ORTEGA','2017-11-10',NULL);
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
