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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas_equipo`
--

LOCK TABLES `estadisticas_equipo` WRITE;
/*!40000 ALTER TABLE `estadisticas_equipo` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas_jugador`
--

LOCK TABLES `estadisticas_jugador` WRITE;
/*!40000 ALTER TABLE `estadisticas_jugador` DISABLE KEYS */;
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
INSERT INTO `juegos` VALUES (1,1,12,10,NULL,NULL,1,NULL,1,NULL,NULL),(2,1,5,7,NULL,NULL,1,NULL,1,NULL,NULL),(3,1,1,15,NULL,NULL,1,NULL,1,NULL,NULL),(4,1,13,3,NULL,NULL,1,NULL,1,NULL,NULL),(5,1,4,8,NULL,NULL,1,NULL,1,NULL,NULL),(6,1,14,9,NULL,NULL,1,NULL,1,NULL,NULL),(7,1,6,11,NULL,NULL,1,NULL,1,NULL,NULL),(8,2,11,14,NULL,NULL,1,NULL,1,NULL,NULL),(9,2,8,13,NULL,NULL,1,NULL,1,NULL,NULL),(10,2,3,1,NULL,NULL,1,NULL,1,NULL,NULL),(11,2,7,12,NULL,NULL,1,NULL,1,NULL,NULL),(12,2,10,6,NULL,NULL,1,NULL,1,NULL,NULL),(13,2,9,4,NULL,NULL,1,NULL,1,NULL,NULL),(14,2,15,5,NULL,NULL,1,NULL,1,NULL,NULL),(15,3,5,3,NULL,NULL,1,NULL,1,NULL,NULL),(16,3,1,8,NULL,NULL,1,NULL,1,NULL,NULL),(17,3,13,9,NULL,NULL,1,NULL,1,NULL,NULL),(18,3,15,7,NULL,NULL,1,NULL,1,NULL,NULL),(19,3,4,11,NULL,NULL,1,NULL,1,NULL,NULL),(20,3,14,10,NULL,NULL,1,NULL,1,NULL,NULL),(21,3,6,12,NULL,NULL,1,NULL,1,NULL,NULL),(22,4,11,13,NULL,NULL,1,NULL,1,NULL,NULL),(23,4,8,5,NULL,NULL,1,NULL,1,NULL,NULL),(24,4,12,14,NULL,NULL,1,NULL,1,NULL,NULL),(25,4,3,15,NULL,NULL,1,NULL,1,NULL,NULL),(26,4,7,6,NULL,NULL,1,NULL,1,NULL,NULL),(27,4,10,4,NULL,NULL,1,NULL,1,NULL,NULL),(28,4,9,1,NULL,NULL,1,NULL,1,NULL,NULL),(29,5,3,7,NULL,NULL,1,NULL,1,NULL,NULL),(30,5,5,9,NULL,NULL,1,NULL,1,NULL,NULL),(31,5,1,11,NULL,NULL,1,NULL,1,NULL,NULL),(32,5,13,10,NULL,NULL,1,NULL,1,NULL,NULL),(33,5,15,8,NULL,NULL,1,NULL,1,NULL,NULL),(34,5,4,12,NULL,NULL,1,NULL,1,NULL,NULL),(35,5,14,6,NULL,NULL,1,NULL,1,NULL,NULL),(36,6,11,5,NULL,NULL,1,NULL,1,NULL,NULL),(37,6,8,3,NULL,NULL,1,NULL,1,NULL,NULL),(38,6,12,13,NULL,NULL,1,NULL,1,NULL,NULL),(39,6,7,14,NULL,NULL,1,NULL,1,NULL,NULL),(40,6,10,1,NULL,NULL,1,NULL,1,NULL,NULL),(41,6,9,15,NULL,NULL,1,NULL,1,NULL,NULL),(42,6,6,4,NULL,NULL,1,NULL,1,NULL,NULL),(43,7,8,7,NULL,NULL,1,NULL,1,NULL,NULL),(44,7,3,9,NULL,NULL,1,NULL,1,NULL,NULL),(45,7,5,10,NULL,NULL,1,NULL,1,NULL,NULL),(46,7,1,12,NULL,NULL,1,NULL,1,NULL,NULL),(47,7,13,6,NULL,NULL,1,NULL,1,NULL,NULL),(48,7,15,11,NULL,NULL,1,NULL,1,NULL,NULL),(49,7,4,14,NULL,NULL,1,NULL,1,NULL,NULL),(50,8,11,3,NULL,NULL,1,NULL,1,NULL,NULL),(51,8,12,5,NULL,NULL,1,NULL,1,NULL,NULL),(52,8,7,4,NULL,NULL,1,NULL,1,NULL,NULL),(53,8,10,15,NULL,NULL,1,NULL,1,NULL,NULL),(54,8,9,8,NULL,NULL,1,NULL,1,NULL,NULL),(55,8,14,13,NULL,NULL,1,NULL,1,NULL,NULL),(56,8,6,1,NULL,NULL,1,NULL,1,NULL,NULL),(57,9,8,11,NULL,NULL,1,NULL,1,NULL,NULL),(58,9,3,10,NULL,NULL,1,NULL,1,NULL,NULL),(59,9,5,6,NULL,NULL,1,NULL,1,NULL,NULL),(60,9,1,14,NULL,NULL,1,NULL,1,NULL,NULL),(61,9,13,4,NULL,NULL,1,NULL,1,NULL,NULL),(62,9,9,7,NULL,NULL,1,NULL,1,NULL,NULL),(63,9,15,12,NULL,NULL,1,NULL,1,NULL,NULL),(64,10,11,9,NULL,NULL,1,NULL,1,NULL,NULL),(65,10,12,3,NULL,NULL,1,NULL,1,NULL,NULL),(66,10,7,13,NULL,NULL,1,NULL,1,NULL,NULL),(67,10,10,8,NULL,NULL,1,NULL,1,NULL,NULL),(68,10,4,1,NULL,NULL,1,NULL,1,NULL,NULL),(69,10,14,5,NULL,NULL,1,NULL,1,NULL,NULL),(70,10,6,15,NULL,NULL,1,NULL,1,NULL,NULL),(71,11,11,7,NULL,NULL,1,NULL,1,NULL,NULL),(72,11,8,12,NULL,NULL,1,NULL,1,NULL,NULL),(73,11,3,6,NULL,NULL,1,NULL,1,NULL,NULL),(74,11,5,4,NULL,NULL,1,NULL,1,NULL,NULL),(75,11,1,13,NULL,NULL,1,NULL,1,NULL,NULL),(76,11,9,10,NULL,NULL,1,NULL,1,NULL,NULL),(77,11,15,14,NULL,NULL,1,NULL,1,NULL,NULL),(78,12,12,9,NULL,NULL,1,NULL,1,NULL,NULL),(79,12,1,7,NULL,NULL,1,NULL,1,NULL,NULL),(80,12,10,11,NULL,NULL,1,NULL,1,NULL,NULL),(81,12,13,5,NULL,NULL,1,NULL,1,NULL,NULL),(82,12,4,15,NULL,NULL,1,NULL,1,NULL,NULL),(83,12,14,3,NULL,NULL,1,NULL,1,NULL,NULL),(84,12,6,8,NULL,NULL,1,NULL,1,NULL,NULL),(85,13,11,12,NULL,NULL,1,NULL,1,NULL,NULL),(86,13,8,14,NULL,NULL,1,NULL,1,NULL,NULL),(87,13,3,4,NULL,NULL,1,NULL,1,NULL,NULL),(88,13,5,1,NULL,NULL,1,NULL,1,NULL,NULL),(89,13,7,10,NULL,NULL,1,NULL,1,NULL,NULL),(90,13,9,6,NULL,NULL,1,NULL,1,NULL,NULL),(91,13,15,13,NULL,NULL,1,NULL,1,NULL,NULL),(92,14,10,12,NULL,NULL,1,NULL,1,NULL,NULL),(93,14,7,5,NULL,NULL,1,NULL,1,NULL,NULL),(94,14,15,1,NULL,NULL,1,NULL,1,NULL,NULL),(95,14,3,13,NULL,NULL,1,NULL,1,NULL,NULL),(96,14,8,4,NULL,NULL,1,NULL,1,NULL,NULL),(97,14,9,14,NULL,NULL,1,NULL,1,NULL,NULL),(98,14,11,6,NULL,NULL,1,NULL,1,NULL,NULL),(99,15,14,11,NULL,NULL,1,NULL,1,NULL,NULL),(100,15,13,8,NULL,NULL,1,NULL,1,NULL,NULL),(101,15,1,3,NULL,NULL,1,NULL,1,NULL,NULL),(102,15,12,7,NULL,NULL,1,NULL,1,NULL,NULL),(103,15,6,10,NULL,NULL,1,NULL,1,NULL,NULL),(104,15,4,9,NULL,NULL,1,NULL,1,NULL,NULL),(105,15,5,15,NULL,NULL,1,NULL,1,NULL,NULL),(106,17,13,11,NULL,NULL,1,NULL,1,NULL,NULL),(107,17,5,8,NULL,NULL,1,NULL,1,NULL,NULL),(108,17,14,12,NULL,NULL,1,NULL,1,NULL,NULL),(109,17,15,3,NULL,NULL,1,NULL,1,NULL,NULL),(110,17,6,7,NULL,NULL,1,NULL,1,NULL,NULL),(111,17,4,10,NULL,NULL,1,NULL,1,NULL,NULL),(112,17,1,9,NULL,NULL,1,NULL,1,NULL,NULL),(113,16,3,5,NULL,NULL,1,NULL,1,NULL,NULL),(114,16,8,1,NULL,NULL,1,NULL,1,NULL,NULL),(115,16,9,13,NULL,NULL,1,NULL,1,NULL,NULL),(116,16,7,15,NULL,NULL,1,NULL,1,NULL,NULL),(117,16,11,4,NULL,NULL,1,NULL,1,NULL,NULL),(118,16,10,14,NULL,NULL,1,NULL,1,NULL,NULL),(119,16,12,6,NULL,NULL,1,NULL,1,NULL,NULL),(120,19,5,11,NULL,NULL,1,NULL,1,NULL,NULL),(121,19,3,8,NULL,NULL,1,NULL,1,NULL,NULL),(122,19,13,12,NULL,NULL,1,NULL,1,NULL,NULL),(123,19,14,7,NULL,NULL,1,NULL,1,NULL,NULL),(124,19,1,10,NULL,NULL,1,NULL,1,NULL,NULL),(125,19,15,9,NULL,NULL,1,NULL,1,NULL,NULL),(126,19,4,6,NULL,NULL,1,NULL,1,NULL,NULL),(127,18,7,3,NULL,NULL,1,NULL,1,NULL,NULL),(128,18,9,5,NULL,NULL,1,NULL,1,NULL,NULL),(129,18,11,1,NULL,NULL,1,NULL,1,NULL,NULL),(130,18,10,13,NULL,NULL,1,NULL,1,NULL,NULL),(131,18,8,15,NULL,NULL,1,NULL,1,NULL,NULL),(132,18,12,4,NULL,NULL,1,NULL,1,NULL,NULL),(133,18,6,14,NULL,NULL,1,NULL,1,NULL,NULL),(134,21,3,11,NULL,NULL,1,NULL,1,NULL,NULL),(135,21,5,12,NULL,NULL,1,NULL,1,NULL,NULL),(136,21,4,7,NULL,NULL,1,NULL,1,NULL,NULL),(137,21,15,10,NULL,NULL,1,NULL,1,NULL,NULL),(138,21,8,9,NULL,NULL,1,NULL,1,NULL,NULL),(139,21,13,14,NULL,NULL,1,NULL,1,NULL,NULL),(140,21,1,6,NULL,NULL,1,NULL,1,NULL,NULL),(141,20,7,8,NULL,NULL,1,NULL,1,NULL,NULL),(142,20,9,3,NULL,NULL,1,NULL,1,NULL,NULL),(143,20,10,5,NULL,NULL,1,NULL,1,NULL,NULL),(144,20,12,1,NULL,NULL,1,NULL,1,NULL,NULL),(145,20,6,13,NULL,NULL,1,NULL,1,NULL,NULL),(146,20,11,15,NULL,NULL,1,NULL,1,NULL,NULL),(147,20,14,4,NULL,NULL,1,NULL,1,NULL,NULL),(148,23,9,11,NULL,NULL,1,NULL,1,NULL,NULL),(149,23,3,12,NULL,NULL,1,NULL,1,NULL,NULL),(150,23,13,7,NULL,NULL,1,NULL,1,NULL,NULL),(151,23,8,10,NULL,NULL,1,NULL,1,NULL,NULL),(152,23,1,4,NULL,NULL,1,NULL,1,NULL,NULL),(153,23,5,14,NULL,NULL,1,NULL,1,NULL,NULL),(154,23,15,6,NULL,NULL,1,NULL,1,NULL,NULL),(155,22,11,8,NULL,NULL,1,NULL,1,NULL,NULL),(156,22,10,3,NULL,NULL,1,NULL,1,NULL,NULL),(157,22,6,5,NULL,NULL,1,NULL,1,NULL,NULL),(158,22,14,1,NULL,NULL,1,NULL,1,NULL,NULL),(159,22,4,13,NULL,NULL,1,NULL,1,NULL,NULL),(160,22,7,9,NULL,NULL,1,NULL,1,NULL,NULL),(161,22,12,15,NULL,NULL,1,NULL,1,NULL,NULL),(162,25,9,12,NULL,NULL,1,NULL,1,NULL,NULL),(163,25,7,1,NULL,NULL,1,NULL,1,NULL,NULL),(164,25,11,10,NULL,NULL,1,NULL,1,NULL,NULL),(165,25,5,13,NULL,NULL,1,NULL,1,NULL,NULL),(166,25,15,4,NULL,NULL,1,NULL,1,NULL,NULL),(167,25,3,14,NULL,NULL,1,NULL,1,NULL,NULL),(168,25,8,6,NULL,NULL,1,NULL,1,NULL,NULL),(169,24,7,11,NULL,NULL,1,NULL,1,NULL,NULL),(170,24,12,8,NULL,NULL,1,NULL,1,NULL,NULL),(171,24,6,3,NULL,NULL,1,NULL,1,NULL,NULL),(172,24,4,5,NULL,NULL,1,NULL,1,NULL,NULL),(173,24,13,1,NULL,NULL,1,NULL,1,NULL,NULL),(174,24,10,9,NULL,NULL,1,NULL,1,NULL,NULL),(175,24,14,15,NULL,NULL,1,NULL,1,NULL,NULL),(176,26,12,11,NULL,NULL,1,NULL,1,NULL,NULL),(177,26,14,8,NULL,NULL,1,NULL,1,NULL,NULL),(178,26,4,3,NULL,NULL,1,NULL,1,NULL,NULL),(179,26,1,5,NULL,NULL,1,NULL,1,NULL,NULL),(180,26,10,7,NULL,NULL,1,NULL,1,NULL,NULL),(181,26,6,9,NULL,NULL,1,NULL,1,NULL,NULL),(182,26,13,15,NULL,NULL,1,NULL,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'CARLOS','GARCIA','MONTOYA','1983-11-15','VILLA GONZALEZ ORTEGA','2017-11-01',NULL),(2,'ABEL','VAZQUEZ','HERNANDEZ','1979-01-10','VILLA GONZALEZ ORTEGA','2017-11-01',NULL),(3,'SAMUEL','ARTEAGA','SALAZAR','1990-09-16','FRANCISCO I MADERO','2017-11-01',NULL);
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
  `numero` int(11) DEFAULT NULL,
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
INSERT INTO `rel_equipo_jugadores` VALUES (3,2,1,NULL),(3,1,1,NULL);
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

-- Dump completed on 2017-11-01 12:27:51
