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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES (1,'ROSTICERIA EL POLLITO',1,'2017-10-04',NULL,NULL),(2,'18 PRIMOS',1,'2017-10-04',NULL,NULL),(3,'AGUILAS REALES',1,'2017-10-04',NULL,NULL),(4,'CORTIJO',1,'2017-10-04',NULL,NULL),(5,'CAMPAMENTO',1,'2017-10-04',NULL,NULL),(6,'RANCHO JOSE MARIA',1,'2017-10-04',NULL,NULL),(7,'TOROS',1,'2017-10-04',NULL,NULL),(8,'CARRO',1,'2017-10-04',NULL,NULL),(9,'DEPORTIVO JR',1,'2017-10-04',NULL,NULL),(10,'COLONIA',1,'2017-10-04',NULL,NULL),(11,'LIRAS',1,'2017-10-04',NULL,NULL),(12,'3 CRUCES',1,'2017-10-04',NULL,NULL),(13,'DEP 2000',1,'2017-10-04',NULL,NULL),(99,'DESCANSA',1,'2017-10-04',NULL,NULL);
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
  PRIMARY KEY (`id_estadistica`),
  KEY `fk_estadistica_jugador_idx` (`id_jugador`),
  KEY `fk_estadistica_juego_idx` (`id_juego`),
  CONSTRAINT `fk_estadistica_juego` FOREIGN KEY (`id_juego`) REFERENCES `juegos` (`id_juego`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estadistica_jugador` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
INSERT INTO `juegos` VALUES (1,1,6,5,NULL,NULL,1,NULL,1,NULL),(2,1,7,3,NULL,NULL,1,NULL,1,NULL),(3,1,99,4,NULL,NULL,1,NULL,1,NULL),(4,1,8,1,NULL,NULL,1,NULL,1,NULL),(5,1,13,12,NULL,NULL,1,NULL,1,NULL),(6,1,9,10,NULL,NULL,1,NULL,1,NULL),(7,1,11,2,NULL,NULL,1,NULL,1,NULL),(8,2,2,9,NULL,NULL,1,NULL,1,NULL),(9,2,12,8,NULL,NULL,1,NULL,1,NULL),(10,2,1,99,NULL,NULL,1,NULL,1,NULL),(11,2,3,6,NULL,NULL,1,NULL,1,NULL),(12,2,5,11,NULL,NULL,1,NULL,1,NULL),(13,2,10,13,NULL,NULL,1,NULL,1,NULL),(14,2,4,7,NULL,NULL,1,NULL,1,NULL),(15,3,7,1,NULL,NULL,1,NULL,1,NULL),(16,3,99,12,NULL,NULL,1,NULL,1,NULL),(17,3,8,10,NULL,NULL,1,NULL,1,NULL),(18,3,4,3,NULL,NULL,1,NULL,1,NULL),(19,3,13,2,NULL,NULL,1,NULL,1,NULL),(20,3,9,5,NULL,NULL,1,NULL,1,NULL),(21,3,11,6,NULL,NULL,1,NULL,1,NULL),(22,4,2,8,NULL,NULL,1,NULL,1,NULL),(23,4,12,7,NULL,NULL,1,NULL,1,NULL),(24,4,6,9,NULL,NULL,1,NULL,1,NULL),(25,4,1,4,NULL,NULL,1,NULL,1,NULL),(26,4,3,11,NULL,NULL,1,NULL,1,NULL),(27,4,5,13,NULL,NULL,1,NULL,1,NULL),(28,4,10,99,NULL,NULL,1,NULL,1,NULL),(29,5,1,3,NULL,NULL,1,NULL,1,NULL),(30,5,7,10,NULL,NULL,1,NULL,1,NULL),(31,5,99,2,NULL,NULL,1,NULL,1,NULL),(32,5,8,5,NULL,NULL,1,NULL,1,NULL),(33,5,4,12,NULL,NULL,1,NULL,1,NULL),(34,5,13,6,NULL,NULL,1,NULL,1,NULL),(35,5,9,11,NULL,NULL,1,NULL,1,NULL),(36,6,2,7,NULL,NULL,1,NULL,1,NULL),(37,6,12,1,NULL,NULL,1,NULL,1,NULL),(38,6,6,8,NULL,NULL,1,NULL,1,NULL),(39,6,3,9,NULL,NULL,1,NULL,1,NULL),(40,6,5,99,NULL,NULL,1,NULL,1,NULL),(41,6,10,4,NULL,NULL,1,NULL,1,NULL),(42,6,11,13,NULL,NULL,1,NULL,1,NULL),(43,7,12,3,NULL,NULL,1,NULL,1,NULL),(44,7,1,10,NULL,NULL,1,NULL,1,NULL),(45,7,7,5,NULL,NULL,1,NULL,1,NULL),(46,7,99,6,NULL,NULL,1,NULL,1,NULL),(47,7,8,11,NULL,NULL,1,NULL,1,NULL),(48,7,4,2,NULL,NULL,1,NULL,1,NULL),(49,7,13,9,NULL,NULL,1,NULL,1,NULL),(50,8,2,1,NULL,NULL,1,NULL,1,NULL),(51,8,6,7,NULL,NULL,1,NULL,1,NULL),(52,8,3,13,NULL,NULL,1,NULL,1,NULL),(53,8,5,4,NULL,NULL,1,NULL,1,NULL),(54,8,10,12,NULL,NULL,1,NULL,1,NULL),(55,8,9,8,NULL,NULL,1,NULL,1,NULL),(56,8,11,99,NULL,NULL,1,NULL,1,NULL),(57,9,12,2,NULL,NULL,1,NULL,1,NULL),(58,9,1,5,NULL,NULL,1,NULL,1,NULL),(59,9,7,11,NULL,NULL,1,NULL,1,NULL),(60,9,99,9,NULL,NULL,1,NULL,1,NULL),(61,9,8,13,NULL,NULL,1,NULL,1,NULL),(62,9,10,3,NULL,NULL,1,NULL,1,NULL),(63,9,4,6,NULL,NULL,1,NULL,1,NULL),(64,10,2,10,NULL,NULL,1,NULL,1,NULL),(65,10,6,1,NULL,NULL,1,NULL,1,NULL),(66,10,3,8,NULL,NULL,1,NULL,1,NULL),(67,10,5,12,NULL,NULL,1,NULL,1,NULL),(68,10,13,99,NULL,NULL,1,NULL,1,NULL),(69,10,9,7,NULL,NULL,1,NULL,1,NULL),(70,10,11,4,NULL,NULL,1,NULL,1,NULL),(71,11,2,3,NULL,NULL,1,NULL,1,NULL),(72,11,12,6,NULL,NULL,1,NULL,1,NULL),(73,11,1,11,NULL,NULL,1,NULL,1,NULL),(74,11,7,13,NULL,NULL,1,NULL,1,NULL),(75,11,99,8,NULL,NULL,1,NULL,1,NULL),(76,11,10,5,NULL,NULL,1,NULL,1,NULL),(77,11,4,9,NULL,NULL,1,NULL,1,NULL),(78,12,6,10,NULL,NULL,1,NULL,1,NULL),(79,12,99,3,NULL,NULL,1,NULL,1,NULL),(80,12,5,2,NULL,NULL,1,NULL,1,NULL),(81,12,8,7,NULL,NULL,1,NULL,1,NULL),(82,12,13,4,NULL,NULL,1,NULL,1,NULL),(83,12,9,1,NULL,NULL,1,NULL,1,NULL),(84,12,11,12,NULL,NULL,1,NULL,1,NULL),(85,13,2,6,NULL,NULL,1,NULL,1,NULL),(86,13,12,9,NULL,NULL,1,NULL,1,NULL),(87,13,1,13,NULL,NULL,1,NULL,1,NULL),(88,13,7,99,NULL,NULL,1,NULL,1,NULL),(89,13,3,5,NULL,NULL,1,NULL,1,NULL),(90,13,10,11,NULL,NULL,1,NULL,1,NULL),(91,13,4,8,NULL,NULL,1,NULL,1,NULL),(92,14,5,6,NULL,NULL,1,NULL,1,NULL),(93,14,3,7,NULL,NULL,1,NULL,1,NULL),(94,14,4,99,NULL,NULL,1,NULL,1,NULL),(95,14,1,8,NULL,NULL,1,NULL,1,NULL),(96,14,12,13,NULL,NULL,1,NULL,1,NULL),(97,14,10,9,NULL,NULL,1,NULL,1,NULL),(98,14,2,11,NULL,NULL,1,NULL,1,NULL),(99,15,9,2,NULL,NULL,1,NULL,1,NULL),(100,15,8,12,NULL,NULL,1,NULL,1,NULL),(101,15,99,1,NULL,NULL,1,NULL,1,NULL),(102,15,6,3,NULL,NULL,1,NULL,1,NULL),(103,15,11,5,NULL,NULL,1,NULL,1,NULL),(104,15,13,10,NULL,NULL,1,NULL,1,NULL),(105,15,7,4,NULL,NULL,1,NULL,1,NULL),(106,17,8,2,NULL,NULL,1,NULL,1,NULL),(107,17,7,12,NULL,NULL,1,NULL,1,NULL),(108,17,9,6,NULL,NULL,1,NULL,1,NULL),(109,17,4,1,NULL,NULL,1,NULL,1,NULL),(110,17,11,3,NULL,NULL,1,NULL,1,NULL),(111,17,13,5,NULL,NULL,1,NULL,1,NULL),(112,17,99,10,NULL,NULL,1,NULL,1,NULL),(113,16,1,7,NULL,NULL,1,NULL,1,NULL),(114,16,12,99,NULL,NULL,1,NULL,1,NULL),(115,16,10,8,NULL,NULL,1,NULL,1,NULL),(116,16,3,4,NULL,NULL,1,NULL,1,NULL),(117,16,2,13,NULL,NULL,1,NULL,1,NULL),(118,16,5,9,NULL,NULL,1,NULL,1,NULL),(119,16,6,11,NULL,NULL,1,NULL,1,NULL),(120,19,7,2,NULL,NULL,1,NULL,1,NULL),(121,19,1,12,NULL,NULL,1,NULL,1,NULL),(122,19,8,6,NULL,NULL,1,NULL,1,NULL),(123,19,9,3,NULL,NULL,1,NULL,1,NULL),(124,19,99,5,NULL,NULL,1,NULL,1,NULL),(125,19,4,10,NULL,NULL,1,NULL,1,NULL),(126,19,13,11,NULL,NULL,1,NULL,1,NULL),(127,18,3,1,NULL,NULL,1,NULL,1,NULL),(128,18,10,7,NULL,NULL,1,NULL,1,NULL),(129,18,2,99,NULL,NULL,1,NULL,1,NULL),(130,18,5,8,NULL,NULL,1,NULL,1,NULL),(131,18,12,4,NULL,NULL,1,NULL,1,NULL),(132,18,6,13,NULL,NULL,1,NULL,1,NULL),(133,18,11,9,NULL,NULL,1,NULL,1,NULL),(134,21,1,2,NULL,NULL,1,NULL,1,NULL),(135,21,7,6,NULL,NULL,1,NULL,1,NULL),(136,21,13,3,NULL,NULL,1,NULL,1,NULL),(137,21,4,5,NULL,NULL,1,NULL,1,NULL),(138,21,12,10,NULL,NULL,1,NULL,1,NULL),(139,21,8,9,NULL,NULL,1,NULL,1,NULL),(140,21,99,11,NULL,NULL,1,NULL,1,NULL),(141,20,3,12,NULL,NULL,1,NULL,1,NULL),(142,20,10,1,NULL,NULL,1,NULL,1,NULL),(143,20,5,7,NULL,NULL,1,NULL,1,NULL),(144,20,6,99,NULL,NULL,1,NULL,1,NULL),(145,20,11,8,NULL,NULL,1,NULL,1,NULL),(146,20,2,4,NULL,NULL,1,NULL,1,NULL),(147,20,9,13,NULL,NULL,1,NULL,1,NULL),(148,23,10,2,NULL,NULL,1,NULL,1,NULL),(149,23,1,6,NULL,NULL,1,NULL,1,NULL),(150,23,8,3,NULL,NULL,1,NULL,1,NULL),(151,23,12,5,NULL,NULL,1,NULL,1,NULL),(152,23,99,13,NULL,NULL,1,NULL,1,NULL),(153,23,7,9,NULL,NULL,1,NULL,1,NULL),(154,23,4,11,NULL,NULL,1,NULL,1,NULL),(155,22,2,12,NULL,NULL,1,NULL,1,NULL),(156,22,5,1,NULL,NULL,1,NULL,1,NULL),(157,22,11,7,NULL,NULL,1,NULL,1,NULL),(158,22,9,99,NULL,NULL,1,NULL,1,NULL),(159,22,13,8,NULL,NULL,1,NULL,1,NULL),(160,22,3,10,NULL,NULL,1,NULL,1,NULL),(161,22,6,4,NULL,NULL,1,NULL,1,NULL),(162,25,10,6,NULL,NULL,1,NULL,1,NULL),(163,25,3,99,NULL,NULL,1,NULL,1,NULL),(164,25,2,5,NULL,NULL,1,NULL,1,NULL),(165,25,7,8,NULL,NULL,1,NULL,1,NULL),(166,25,4,13,NULL,NULL,1,NULL,1,NULL),(167,25,1,9,NULL,NULL,1,NULL,1,NULL),(168,25,12,11,NULL,NULL,1,NULL,1,NULL),(169,24,3,2,NULL,NULL,1,NULL,1,NULL),(170,24,6,12,NULL,NULL,1,NULL,1,NULL),(171,24,11,1,NULL,NULL,1,NULL,1,NULL),(172,24,13,7,NULL,NULL,1,NULL,1,NULL),(173,24,8,99,NULL,NULL,1,NULL,1,NULL),(174,24,5,10,NULL,NULL,1,NULL,1,NULL),(175,24,9,4,NULL,NULL,1,NULL,1,NULL),(176,26,6,2,NULL,NULL,1,NULL,1,NULL),(177,26,9,12,NULL,NULL,1,NULL,1,NULL),(178,26,13,1,NULL,NULL,1,NULL,1,NULL),(179,26,99,7,NULL,NULL,1,NULL,1,NULL),(180,26,5,3,NULL,NULL,1,NULL,1,NULL),(181,26,11,10,NULL,NULL,1,NULL,1,NULL),(182,26,8,4,NULL,NULL,1,NULL,1,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `rel_equipo_jugadores` ENABLE KEYS */;
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
INSERT INTO `torneo` VALUES (1,'CLAUSURA 2017','2017-09-28',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2017-10-05 11:27:30
