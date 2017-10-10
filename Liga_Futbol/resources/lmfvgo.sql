-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
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
INSERT INTO `juegos` VALUES (1,1,6,5,NULL,NULL,1,NULL,1,NULL,NULL),(2,1,7,3,NULL,NULL,1,NULL,1,NULL,NULL),(3,1,99,4,NULL,NULL,1,NULL,1,NULL,NULL),(4,1,8,1,'VILLA GONZALEZ ORTEGA',NULL,1,'2017-10-08',1,NULL,'11:00'),(5,1,13,12,NULL,NULL,1,NULL,1,NULL,NULL),(6,1,9,10,NULL,NULL,1,NULL,1,NULL,NULL),(7,1,11,2,NULL,NULL,1,NULL,1,NULL,NULL),(8,2,2,9,NULL,NULL,1,NULL,1,NULL,NULL),(9,2,12,8,NULL,NULL,1,NULL,1,NULL,NULL),(10,2,1,99,NULL,NULL,1,NULL,1,NULL,NULL),(11,2,3,6,NULL,NULL,1,NULL,1,NULL,NULL),(12,2,5,11,NULL,NULL,1,NULL,1,NULL,NULL),(13,2,10,13,NULL,NULL,1,NULL,1,NULL,NULL),(14,2,4,7,NULL,NULL,1,NULL,1,NULL,NULL),(15,3,7,1,NULL,NULL,1,NULL,1,NULL,NULL),(16,3,99,12,NULL,NULL,1,NULL,1,NULL,NULL),(17,3,8,10,NULL,NULL,1,NULL,1,NULL,NULL),(18,3,4,3,NULL,NULL,1,NULL,1,NULL,NULL),(19,3,13,2,NULL,NULL,1,NULL,1,NULL,NULL),(20,3,9,5,NULL,NULL,1,NULL,1,NULL,NULL),(21,3,11,6,NULL,NULL,1,NULL,1,NULL,NULL),(22,4,2,8,NULL,NULL,1,NULL,1,NULL,NULL),(23,4,12,7,NULL,NULL,1,NULL,1,NULL,NULL),(24,4,6,9,NULL,NULL,1,NULL,1,NULL,NULL),(25,4,1,4,NULL,NULL,1,NULL,1,NULL,NULL),(26,4,3,11,NULL,NULL,1,NULL,1,NULL,NULL),(27,4,5,13,NULL,NULL,1,NULL,1,NULL,NULL),(28,4,10,99,NULL,NULL,1,NULL,1,NULL,NULL),(29,5,1,3,NULL,NULL,1,NULL,1,NULL,NULL),(30,5,7,10,NULL,NULL,1,NULL,1,NULL,NULL),(31,5,99,2,NULL,NULL,1,NULL,1,NULL,NULL),(32,5,8,5,NULL,NULL,1,NULL,1,NULL,NULL),(33,5,4,12,NULL,NULL,1,NULL,1,NULL,NULL),(34,5,13,6,NULL,NULL,1,NULL,1,NULL,NULL),(35,5,9,11,NULL,NULL,1,NULL,1,NULL,NULL),(36,6,2,7,NULL,NULL,1,NULL,1,NULL,NULL),(37,6,12,1,NULL,NULL,1,NULL,1,NULL,NULL),(38,6,6,8,NULL,NULL,1,NULL,1,NULL,NULL),(39,6,3,9,NULL,NULL,1,NULL,1,NULL,NULL),(40,6,5,99,NULL,NULL,1,NULL,1,NULL,NULL),(41,6,10,4,NULL,NULL,1,NULL,1,NULL,NULL),(42,6,11,13,NULL,NULL,1,NULL,1,NULL,NULL),(43,7,12,3,NULL,NULL,1,NULL,1,NULL,NULL),(44,7,1,10,NULL,NULL,1,NULL,1,NULL,NULL),(45,7,7,5,NULL,NULL,1,NULL,1,NULL,NULL),(46,7,99,6,NULL,NULL,1,NULL,1,NULL,NULL),(47,7,8,11,NULL,NULL,1,NULL,1,NULL,NULL),(48,7,4,2,NULL,NULL,1,NULL,1,NULL,NULL),(49,7,13,9,NULL,NULL,1,NULL,1,NULL,NULL),(50,8,2,1,NULL,NULL,1,NULL,1,NULL,NULL),(51,8,6,7,NULL,NULL,1,NULL,1,NULL,NULL),(52,8,3,13,NULL,NULL,1,NULL,1,NULL,NULL),(53,8,5,4,NULL,NULL,1,NULL,1,NULL,NULL),(54,8,10,12,NULL,NULL,1,NULL,1,NULL,NULL),(55,8,9,8,NULL,NULL,1,NULL,1,NULL,NULL),(56,8,11,99,NULL,NULL,1,NULL,1,NULL,NULL),(57,9,12,2,NULL,NULL,1,NULL,1,NULL,NULL),(58,9,1,5,NULL,NULL,1,NULL,1,NULL,NULL),(59,9,7,11,NULL,NULL,1,NULL,1,NULL,NULL),(60,9,99,9,NULL,NULL,1,NULL,1,NULL,NULL),(61,9,8,13,NULL,NULL,1,NULL,1,NULL,NULL),(62,9,10,3,NULL,NULL,1,NULL,1,NULL,NULL),(63,9,4,6,NULL,NULL,1,NULL,1,NULL,NULL),(64,10,2,10,NULL,NULL,1,NULL,1,NULL,NULL),(65,10,6,1,NULL,NULL,1,NULL,1,NULL,NULL),(66,10,3,8,NULL,NULL,1,NULL,1,NULL,NULL),(67,10,5,12,NULL,NULL,1,NULL,1,NULL,NULL),(68,10,13,99,NULL,NULL,1,NULL,1,NULL,NULL),(69,10,9,7,NULL,NULL,1,NULL,1,NULL,NULL),(70,10,11,4,NULL,NULL,1,NULL,1,NULL,NULL),(71,11,2,3,NULL,NULL,1,NULL,1,NULL,NULL),(72,11,12,6,NULL,NULL,1,NULL,1,NULL,NULL),(73,11,1,11,NULL,NULL,1,NULL,1,NULL,NULL),(74,11,7,13,NULL,NULL,1,NULL,1,NULL,NULL),(75,11,99,8,NULL,NULL,1,NULL,1,NULL,NULL),(76,11,10,5,NULL,NULL,1,NULL,1,NULL,NULL),(77,11,4,9,NULL,NULL,1,NULL,1,NULL,NULL),(78,12,6,10,NULL,NULL,1,NULL,1,NULL,NULL),(79,12,99,3,NULL,NULL,1,NULL,1,NULL,NULL),(80,12,5,2,NULL,NULL,1,NULL,1,NULL,NULL),(81,12,8,7,NULL,NULL,1,NULL,1,NULL,NULL),(82,12,13,4,NULL,NULL,1,NULL,1,NULL,NULL),(83,12,9,1,NULL,NULL,1,NULL,1,NULL,NULL),(84,12,11,12,NULL,NULL,1,NULL,1,NULL,NULL),(85,13,2,6,NULL,NULL,1,NULL,1,NULL,NULL),(86,13,12,9,NULL,NULL,1,NULL,1,NULL,NULL),(87,13,1,13,NULL,NULL,1,NULL,1,NULL,NULL),(88,13,7,99,NULL,NULL,1,NULL,1,NULL,NULL),(89,13,3,5,NULL,NULL,1,NULL,1,NULL,NULL),(90,13,10,11,NULL,NULL,1,NULL,1,NULL,NULL),(91,13,4,8,NULL,NULL,1,NULL,1,NULL,NULL),(92,14,5,6,NULL,NULL,1,NULL,1,NULL,NULL),(93,14,3,7,NULL,NULL,1,NULL,1,NULL,NULL),(94,14,4,99,NULL,NULL,1,NULL,1,NULL,NULL),(95,14,1,8,NULL,NULL,1,NULL,1,NULL,NULL),(96,14,12,13,NULL,NULL,1,NULL,1,NULL,NULL),(97,14,10,9,NULL,NULL,1,NULL,1,NULL,NULL),(98,14,2,11,NULL,NULL,1,NULL,1,NULL,NULL),(99,15,9,2,NULL,NULL,1,NULL,1,NULL,NULL),(100,15,8,12,NULL,NULL,1,NULL,1,NULL,NULL),(101,15,99,1,NULL,NULL,1,NULL,1,NULL,NULL),(102,15,6,3,NULL,NULL,1,NULL,1,NULL,NULL),(103,15,11,5,NULL,NULL,1,NULL,1,NULL,NULL),(104,15,13,10,NULL,NULL,1,NULL,1,NULL,NULL),(105,15,7,4,NULL,NULL,1,NULL,1,NULL,NULL),(106,17,8,2,NULL,NULL,1,NULL,1,NULL,NULL),(107,17,7,12,NULL,NULL,1,NULL,1,NULL,NULL),(108,17,9,6,NULL,NULL,1,NULL,1,NULL,NULL),(109,17,4,1,NULL,NULL,1,NULL,1,NULL,NULL),(110,17,11,3,NULL,NULL,1,NULL,1,NULL,NULL),(111,17,13,5,NULL,NULL,1,NULL,1,NULL,NULL),(112,17,99,10,NULL,NULL,1,NULL,1,NULL,NULL),(113,16,1,7,NULL,NULL,1,NULL,1,NULL,NULL),(114,16,12,99,NULL,NULL,1,NULL,1,NULL,NULL),(115,16,10,8,NULL,NULL,1,NULL,1,NULL,NULL),(116,16,3,4,NULL,NULL,1,NULL,1,NULL,NULL),(117,16,2,13,NULL,NULL,1,NULL,1,NULL,NULL),(118,16,5,9,NULL,NULL,1,NULL,1,NULL,NULL),(119,16,6,11,NULL,NULL,1,NULL,1,NULL,NULL),(120,19,7,2,NULL,NULL,1,NULL,1,NULL,NULL),(121,19,1,12,NULL,NULL,1,NULL,1,NULL,NULL),(122,19,8,6,NULL,NULL,1,NULL,1,NULL,NULL),(123,19,9,3,NULL,NULL,1,NULL,1,NULL,NULL),(124,19,99,5,NULL,NULL,1,NULL,1,NULL,NULL),(125,19,4,10,NULL,NULL,1,NULL,1,NULL,NULL),(126,19,13,11,NULL,NULL,1,NULL,1,NULL,NULL),(127,18,3,1,NULL,NULL,1,NULL,1,NULL,NULL),(128,18,10,7,NULL,NULL,1,NULL,1,NULL,NULL),(129,18,2,99,NULL,NULL,1,NULL,1,NULL,NULL),(130,18,5,8,NULL,NULL,1,NULL,1,NULL,NULL),(131,18,12,4,NULL,NULL,1,NULL,1,NULL,NULL),(132,18,6,13,NULL,NULL,1,NULL,1,NULL,NULL),(133,18,11,9,NULL,NULL,1,NULL,1,NULL,NULL),(134,21,1,2,NULL,NULL,1,NULL,1,NULL,NULL),(135,21,7,6,NULL,NULL,1,NULL,1,NULL,NULL),(136,21,13,3,NULL,NULL,1,NULL,1,NULL,NULL),(137,21,4,5,NULL,NULL,1,NULL,1,NULL,NULL),(138,21,12,10,NULL,NULL,1,NULL,1,NULL,NULL),(139,21,8,9,NULL,NULL,1,NULL,1,NULL,NULL),(140,21,99,11,NULL,NULL,1,NULL,1,NULL,NULL),(141,20,3,12,NULL,NULL,1,NULL,1,NULL,NULL),(142,20,10,1,NULL,NULL,1,NULL,1,NULL,NULL),(143,20,5,7,NULL,NULL,1,NULL,1,NULL,NULL),(144,20,6,99,NULL,NULL,1,NULL,1,NULL,NULL),(145,20,11,8,NULL,NULL,1,NULL,1,NULL,NULL),(146,20,2,4,NULL,NULL,1,NULL,1,NULL,NULL),(147,20,9,13,NULL,NULL,1,NULL,1,NULL,NULL),(148,23,10,2,NULL,NULL,1,NULL,1,NULL,NULL),(149,23,1,6,NULL,NULL,1,NULL,1,NULL,NULL),(150,23,8,3,NULL,NULL,1,NULL,1,NULL,NULL),(151,23,12,5,NULL,NULL,1,NULL,1,NULL,NULL),(152,23,99,13,NULL,NULL,1,NULL,1,NULL,NULL),(153,23,7,9,NULL,NULL,1,NULL,1,NULL,NULL),(154,23,4,11,NULL,NULL,1,NULL,1,NULL,NULL),(155,22,2,12,NULL,NULL,1,NULL,1,NULL,NULL),(156,22,5,1,NULL,NULL,1,NULL,1,NULL,NULL),(157,22,11,7,NULL,NULL,1,NULL,1,NULL,NULL),(158,22,9,99,NULL,NULL,1,NULL,1,NULL,NULL),(159,22,13,8,NULL,NULL,1,NULL,1,NULL,NULL),(160,22,3,10,NULL,NULL,1,NULL,1,NULL,NULL),(161,22,6,4,NULL,NULL,1,NULL,1,NULL,NULL),(162,25,10,6,NULL,NULL,1,NULL,1,NULL,NULL),(163,25,3,99,NULL,NULL,1,NULL,1,NULL,NULL),(164,25,2,5,NULL,NULL,1,NULL,1,NULL,NULL),(165,25,7,8,NULL,NULL,1,NULL,1,NULL,NULL),(166,25,4,13,NULL,NULL,1,NULL,1,NULL,NULL),(167,25,1,9,NULL,NULL,1,NULL,1,NULL,NULL),(168,25,12,11,NULL,NULL,1,NULL,1,NULL,NULL),(169,24,3,2,NULL,NULL,1,NULL,1,NULL,NULL),(170,24,6,12,NULL,NULL,1,NULL,1,NULL,NULL),(171,24,11,1,NULL,NULL,1,NULL,1,NULL,NULL),(172,24,13,7,NULL,NULL,1,NULL,1,NULL,NULL),(173,24,8,99,NULL,NULL,1,NULL,1,NULL,NULL),(174,24,5,10,NULL,NULL,1,NULL,1,NULL,NULL),(175,24,9,4,NULL,NULL,1,NULL,1,NULL,NULL),(176,26,6,2,NULL,NULL,1,NULL,1,NULL,NULL),(177,26,9,12,NULL,NULL,1,NULL,1,NULL,NULL),(178,26,13,1,NULL,NULL,1,NULL,1,NULL,NULL),(179,26,99,7,NULL,NULL,1,NULL,1,NULL,NULL),(180,26,5,3,NULL,NULL,1,NULL,1,NULL,NULL),(181,26,11,10,NULL,NULL,1,NULL,1,NULL,NULL),(182,26,8,4,NULL,NULL,1,NULL,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'CARLOS','GARCIA','MONTOYA','1983-11-15','VILLA GONZALEZ ORTEGA','2017-10-07','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0à€\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑð$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RðbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0äÑ²1œæœ‹†\n£#¿5àc4½xÝ‚GcRšnÝ\r£Ê‚áxïBîÆÏÒ›ær)Uöœ÷ªMÙX–œuèHÀŒb…Éç4HKrIúÒƒ†éCQ]Å5¸ª1õæ;†JnìñÒ™¹˜Š”¬\'fô£O¶)IÏN\"à\'­ 9ãµTopØržŸÊžpEFÓÖ—Æ³i7©Q³ØzŒô¤ÙÏ<Òî dS~bsš§«ÜIÙXs\'\'ŠnÖö§gœ\ZV9ü)©vwC0Ø<u£`8>”¤ädŽ”)-Ûh“aÍovâ2óšâœA9©\0ÁíJÝG\'ÐEŸJ–8àRtäÔ€ü´®žŒoº¤‘NWÉÐ@ÏOÂ€¿.*ÖÉƒl\n’}Í(NÆÛšUf<Siú±6ÄDÎ}©áqÞ‘O¡Ôj¨Ç¤ 1Ouâ—<`SnÛú1ª‡ñÁÀë@ázÑïÞ•Ú+| žõnÊÌÝJƒ°rÄT«I\"ªŒ±8ÔØZ-¼C»I÷¦¥Ð5½ËÄ\"@\0À*Ê®zô¦…Ï52¯’Uz`T@(©håI‹˜nÎzSÂÒâ–˜Š·©‹)ý<¶ÏäkÆô$+$£©ÈÎ½¢èfÖe=müxöŒKƒóîýjâ‰nÍ\"3^:ªÛŽk¾±þÉ#€N*¦ noµÜ\'r ÷®–m«ÂŒqW-V¡u{‰fWÕ²œæ¢¶_”U¬UìŒÛ»9Ù‰4Ñ/?#ƒý?­qvðàdŠôïZ›­\Zê0>m›‡áÍpÐ‰c\0\'ðè]=%v$(_ÂÕèâ*8éOŠ\0:p=*Ê&1Qdk)]˜úªbÙ½p•r¸GãæÍw\Z²£àyþUÇ:àIÇJhW[3OÀ¹_Ús×p?•{*–¼gÁ‡gŠ¬ˆþùøé¯gQòç5VjÄ«†8 ¯=iÀf“iuÀéH@ÛNcÅ4ýÚÀÍRó‘A­!XŒ\'\'ÁÍ/{ÐzSh5\'Ý§y§ž¸Å!ûâ—])Áip8Í?Ö£\'&@LsMU,Ì\rIŽþôÜbRyæ›\ZcMÁ$æœ¡ƒhæ—›‘mËñHTg9©9Í1½(õ´í&™%yÁæ¥\Z`\'Þ›B½2†B\r606u©09¨ãÀÍ-[¸ú\nwš8f´öëÏ^ÔÞœ÷¥e«ÜdË”õéL\0)ï“ŒsJ«´sÚšº*ÈòÍØät§«½ÁúÕpý±Û­? täÓŠ³º”‰Ë–ÆzÓÆåPO­VW9äÔ»øöô¦šci«\\•\\çëOóÿ\0j†6ú­&NM	® Ó³±aåäæ—$p*\0Çµ.X6âÀÓI=BÍ“$sMÝÏš­‘šh%œ‘Ú“½Ë9ÀÍ4¸?JŒ7¿JŒ*n˜š¾¤Œüdt§Èëšˆ0ÛŒ~ÁÇJ7Ü¤™Á¥Ï­0ôÉ<Òä×©´Åf(wëH	^3š@w´à2h“L9Vè²py§3íâ˜X‚—«sIé¨î­aàäqJáLt§`b¥Åj$ìJ{\Z3Î¨ùíÒ—i<æŽáª$äŽœQœŠfsÆis‘N2Qco½\0I§÷¤ËI0m1À¸§ÆiæŒŒôª`‡gŽ¼S†sQƒŒõ­].ÄÍ\'˜ã*½ïRöÔkÈ½¤Ø”Q+Œä{\nÚUãco:ö©vnâ¸ä½N«ÇZ`ÔÊ\rR%»ŽZx¦ŒƒO(°4¸£´ï`!¸\\ÛÊ?Øoå^Ká{&ºÕf@>PF3^»:æ	ûùW–x2ñm5;Çu%vŽž¹5pvM‰îJgKh}@*„—{¤U–8¬ëHÏ–?(ì*¾7Ú5˜Œäþïv–Z|J\0ª_jD(§ý+C¹Ëº21œ×m¤É´j¼ƒŠîTNª¼Í4û{ÔÚcB€õê+å®†U¤VdÑmcÇZ–™ièsúšm·Ï$ç¥qÎ€‰Iäâ»­P£¾98é\\w—ÄÜqå“úŠžƒl¯á™<ŸØ·ý6ô\"½Á8\\zW„iåëv¤ÿ\0ÏUþuîê>^•3ÒÀ‡šâœšZ„Š@ÛLlmô§ž4ò) ÀÒ7JZkœfˆ¡1¸$ÐE)=)	41ôô>´ÐrsHÇ§­Œq@\0äš1Š\\sõ£ð§°Æy4¸ÇZR œ‘Í5‡Ì¼Ò	Éâ“žôîšh÷¡$ÐOâÅ#\0sAu#téI \0š‡þZŸJ”ÞšylÓ¸\0y¨—\"F¥J1š‰þYF)n;ƒòâçzS™¾aÞ“9Í»°64ž4V‘‡Æ“qòøÓºî<2{â†\' u¦?…H­šwº²*O«BóÔýÜÓúÒ²ÔÇI1·îÜzÇ­J1Œç5áÁ 1^;U­µ\'bcŽ¸æœ9¨UŽqN‚i\'«¹£ÙX”ð8¦’GJh>ô õâ¦*È›¶.üŽ´¼Ÿjb14æ<qšvJàïÐy=\0£\'=j<àdšvÿ\0—¥J¶¦wwÌI÷§oÀõ¦õ ßšrZ¢ú\\PØ)á‡LÔ@ŽsÖïŠ~¢º½‘2·<R–ïšI—ühµÄH>¸§f¢ÎE.IïI¥°ùº²eëÉ ç>ÔÎ8çšRN}©éØi»Sƒ’iAæ£ý)àT«…®.NzÔƒëLãµëNÚu$SÖ•O8îx§Ä†IŽNiu&å«Kf¹¸UåÏ\'ÐWWoCE\0U>Ô[§æ=kMA5=J¹\"óSÆ3Q íVv¤•Ø›£Š‘E5EH£Š´­¸˜à)s@¥\n©§mö \npu¦RÜ¸õSü«Ç4VòÜ¾þê~uìÒŒÆßîŸå^\'¦Ê«s{.C¯ËùŸñ«ŽÌ´‘Ð\\Ü3D›:=iøf,jk!þãVm”jÖ‘äp3üÍt~¶;žr8*ÒŠ³.MrÜéS¥<óM0)Ý«c•9¦lÜy©:ÒLHg–£¶k\'Vx­ã.Ç¬ÇŠå|M)yR%9*2\Z—¡p»v1/®L °<zV#Çºb\0á£lŸÄVš)9TmÔ«Q4Îªª*\Z¼f©|ÅÇç^õ»°¯a³SBp>pZ÷HòQµésº’¥ÜâƒëYì1ñÍ&8â–‘ŽièÐ9ÍGÎMHõ¦×!üàÑŠvŠ	âm·Z	Î(#qS	9âÀsç4Ç4‚›œz`<ô¨É9§d°¦“Îh\rÆ°<~tÆqÍ;$µ7ƒÅ,dœSIæÒ{Š‘Øi¦šsœÍ7œóIyˆ	Ëf¡™¹)`*7a¸qMÛ ÐÃÈëBvÏÖžËÅ\"3‘M­4&î\r1Ëž´òçŠ¯2ú\ZQZ×v<·î·=(gçÚšNqƒO$dP·4ähBàÆ”¾;\rÔ»‡=é»7g¿JrM0j.Ö$ 0EÞšàóÍÇRsUÐ™+=0ÈÎiá¸Àüi‹—ãP\rO*zŽ#·€:Sƒ“Qc“HOL\Zw½É·rif¡-ŠUn:U8®„¥r\\ã¯+Ýx¦oÐ­“JÅ%¦¤»òzR—æ£\rŽ´¹ÝÐ\nM!´í© lÐ4ÜŽ†€ËœTÝŠQH“\' \nyÇÒ¢_­/SÆhR¶á{’©È¥\ršj¶\rn)ù‰Û õÎy4ýÃ$\Z‹9ä\Zp89¡¾¬¾£÷qÒ”ŠoP¤Ö‹Ž=‰3J)¹¤ïJÌv$È8·¤Ùd‰œcû Ö³¬-\rÌËvÉ®¦Õ\0\n™4+Xž5ÅXE=sQ çŠ°‰GA[Aè¼äÔè9¦èjQLCÀ©E0Î¤ªi@ÏJANŠ	«KŠAÒ—Ð1“ªoM§ùW‡Ú#.¡;($tÏÔ×¸Ê¤ÆÀzWŽièßl¼ ð\0}sU£Éºl~e¼`‚z~5ÛÙÛ­½ªÆ½º×/  ‘Æz‡Ïò®»Þ®¹5*ð8ÓTqŠ_­Z2Ó	ÅHE0ô¦\"¥ÕÂÃ;¶\0ÅêµÕÉ“=kWZ¸3NcåN+\0óYÉ³ª”,¹™ýß$T‘Ãç5«Èg}xñ“·£m\0vŽ†í“óJIèCÎ¯Ç{õÁýkÜmÏú<~»Aý+Æ5¸ü«ØAë·ù5{-˜c‡þY¯òMÝ“u\'Ò”ô¤Ï4¹â³¾ƒœR18ã­Ó©Ø:QÍFx4öàT`ÌO~”y€§ ¦“Í)ùS>”h£˜äÒž¼T|’FH v\r7¹\"œ£åÇ¥4|¦˜’}©¸\"ŸïM\'ß4$4zÒNã4ì	\r Ž”»McŽ¼Qœ¦sK™\rj#\0HïIü&—9)¥»`#×f—ÐpF(}ÊDq’W“Jz{S\"ÈüÈíKe`wDy‡µ!\0IÏJx8l\n²²ÈÅ	ÝLò1ŽiÛËZræ•H<ÑfõêhÚjä«ÔŸÒŒàu¦dç æ€Kií£VØ~ãŽ¦”3ôÐH#ž`ô¢Öbq¾¬˜§“A8lýê%~zÓÃäñO]B2ÓQÈ	=(ã‘Þ“9RGj3ÆOZzÚì\\—ØsóSI\'¡âÙíOç‘I=\nj(TeÛ@Çja Sü¦ŽVµAwmP«Éç8¡O8™ÏCJAâ‹Xv“@õHÍ9IÇ4_¡6vdÀŽ”¾´Àq“Šp=…L•ôÒZ¢MÜŽ´á× TX=È§®Tà‘OD´\Zp$ja`§ŠBÄÐØX—yZp!ª\räñRŽüRNú\rØ›¯•,(ÓH¨9&«£n8®‡K³Gæ0ùÏò¤6Ù¡gÛÂ±…w«¨3QFe;RÔW\'‰x«µk‘S¨õ§¡,zôëR­4(ÅHˆP2zÔ‚˜*E¦!qR0iãŸj7;¸&KÅ!Œsò×é¬¿ÚPò¿1=>÷ø×°?CÅxõ•¨—[˜±á8«Šî-zŽ‹mö9ÔHu=k£PIV’³\\ÀsÁ>¾ÕÑ*bµ‰œû\n½8\nqFcÝÎ*ýÚÛ[³Éà}jÜÒ,HYŽ\0®SPºk‰‰\'ÂJ‰;#Zp»3Ü´ŽKw§GcœqVb€½Î1Ï5ÌxƒÆPÛnµÓÎç4½‡ÓüjTyŽ™ÔIr¢öµ¯[hñ˜Ô¬—DpŸÝ÷5ÈÁâýR;…c0xÖ_7Ê#å-Œgò¬	eiÜ³ÎÇ$žõ5­¼“8DBÌzV­¨ès¨ßsQÔÓUhdHŒrdîLä~½›L%´ÛB{ÀŸÈWá;ºÔADê#îÂ½(–$XÐaT`AX7Ð¦‡\ZF8´HcÀ¤s€1JFqHÃ4\04ÓŒ\Z}DzšbZÜ¥ñA`N#cm-VƒÝ=é«ÞœÇ¦)ª3’i€½˜äRÿ\0&A8¥ªˆIÜi3C}êCMòŽ£¥\'S“@9Î9Å4‘š}D¶A»ð¥-…éM-Ïµ4çi65qsZFn‚‚sÐS_vÍ\'Ü:sƒíOfšÝ@¥è:Ò²{¹|dw¥ÁÎ;Ò¾ØãšvA<SO¸0 Üžõçf^qR–\0ã½E2ï\\úSE­Qãå¹ô§R¸Ï4ÀÃ©Æ}é:úf›okŽ)uœ(ç¯ÑÅ\0f•›Õ”öÐ“s	â\r0ŽôŠäðh}ˆ»½Ù(<úS³œàÔ!³ïOó†¯+±î®J’\00Fi…þlv¦ñ@ÆqÚž¯pÑ-	<ÏáíJ	\0\r;\'€zT´Á»‚¸ëÍ 9¨Ë\0}¨ÝƒïIÌ=w&-KœT!¹äñO\rž„b›•Õ…Ô”)Àf¢,)CñF»°}‘&HÍ8ÀÔ!˜š]Ç#½\ZÜ4&¾sKp{ÓìiFZMj.muyïNGZf@¥RO9â„·);l;<ð)Ù=…4àµbÆ<ê `gš[jf†•e½„Ò/\0ü ÷®jŠ«ÀWPñSw!Ä8«1Œr*‡j:Vì™N£\ZŠ1S\'Z¥±$ƒ5 ½0}*AÒ‹>‚ŠxÑNÇJ=E<\nhÎ:ÓÇJ(£¡¥À¥#Šv^_¥E»Sºr¼”ãÓ“^¢Àšòù]¬õ&@p%µG>ü‘U¡©ÐéMþŸ\Znàe«©S•®J¼ò¯QÉà~•Ù\rBÝc$Ì¼™æµs)\'râ’N3JîdšÌþÖ‹È2dnþîy¬™/¦»rT’:qÐQÍÔj›eZ÷Ïo&#‘ÜŠÍAej÷7R*\"³7JSÕ,t_6éó#’!÷œÿ\0…yŽ¹â+½f|Êûb_¹ýÕÿ\0ëûÑgÔ»ÛÝFˆ¼[.¢ÆÚÏ1ZŽ÷Ÿëíí\\ÆÒü´E3WoáŸ]ê›n.Ãkœäõo¥&ôö Ýê·+¼E¹å»\nõÏx>ÓFŒI Üž­Žé[:f™k¦Û,Ð¬j=;ÕþØ²rlcpqKÐÒŽ´Ñ’ÜÒ@/ZkRô4ÒÀ2i‡‚9§ÀéMã<Ð1ËM=I§zÓs•8¦çŸÊ•Ûï@Òõ¤O½ àâ”õ šÂdŽ¢ŒdäÐ{äÒvëEÂÃX|Àö¢‘²y£8÷ÜW\0y<S[Í¿:GÀ\r¦îÉ#SÀÝÖŽùíJÁq§§Zd€­èx§õŽ@\\ž™£¨­¸Öu4§æb†Çf‘Ž;j]÷„]%4¸ëŠÕ½h4îöØRx5l&iÒ.\0ç€1Ö–€šGŒœP\nçž)¹É4\'\"­6\Zº± aœu£qÍFàpy)ÛTOÃ»	:þTî2H5ç‘Å 9=iÜnÛ’äcŽ´£OZ‹8æ”7=j]Öà‰IÏÖ“?6j=Û»Ñ“ëC“²@¬Þ„ ät£9<ÔjÜÓ·sŒS¾–E;õ°â”œS{\ZÍJNäß]GÜÑÞ›Ð`Ó‰Èªi\\/ ñŒsNÏxéJ¹ \n7	&LqÍ;v\rG’¥²9©L4%Ü2;ûÓóŽõ\nÓÁéÚÊÂjä£‘NÜ:TyãšwIåˆÐ¹\0×Gch°&Þ=ë?K³ó_“ØVÜkúR¸­bd«±¨\0Ux×¦jâ•/{Š÷Ðž!Š°Šj4*`:SOP&AS(ÅF T U\\‘ëÖž)Š9§Š.GïRàqQ­II)Âš´ð8â›áÖ–’—¥!\r~•çÚ¼-Ü(äiˆWþc^€çå®Ä93Ùã©Ó#ü~vªŠ¸\\Å´$7½h+1až•VÚ-ÇµhFŠ˜ä,j2I8ëC×C¦ñŽ¤ÑDÒœí¬Í{Åº,g¶+5ß§ð§×ßÚ±|Aã,´Ò›ÈiÇû/ø×wÊÙ$“îkU#šSr&¾¿ºÔnžâæV’G<“ü¾•%†›=õÂCm$Žpªjh^¼ÖnR(ŸšCÐ\nöMÃv\Z!mÓ2‘†ŽMLåaß±ÏxgÀ0XlºÔËp9	ÙkºT€Â—  ž+-BãW’N)M ázQÔSôé0sKüéâ\\1Í4ž)ÄÒv¦€iè1Q‚AºšÓX	¦x©8	JqÍ!#m\0&qÞš¤ßZu!xëFà%!ëFN9ëC}Ú\rjLó‘éAÎ9 \Z\\nF\r7€)ì¤gÖ£ÝƒÜQaç†âÉŠnyÎ)ß¨ŒùxèE9Hô&—øy¤÷4`óHÀm9éN^i Š´c[¦¿ÌWÒ”#Í lÇµ{…×A“\0U~´üSeå	¨Àd\'Ò…°ÆºäœûRŠ_á€ñœP´`ÕÑâiÏ4îOz\0‘ÚœO`x«o]J³¶‚ƒŒŠL“Lv¥ç’×Pµ÷D›°@4gàS2ZAÖµ¸Öˆ—wïH­Éâšëžis‘BÕê&¯¢:Æ€Ã\Zi9\\R(\r»-‰=ºRƒ‘LÈÆ(1Jê@ï¹!$ƒŠMÇŽi¤ñJ3õ¤¬ö\rwc÷ò)sžF	ÇJ]Ç­7¢°µdœŽM*’9&£\rNRv)¦I¸‘Ö—§^”î¢šÐ‘:SƒsÒ£:Räõù…g¹2õÍ_²€Í $p*…¼o3€\rtVÐ¬JªDÝž…­KÐ AŽž•v j´C=*ìK‘ÅEÛdï©b0;Õ¸ÀÅWˆt&­ Éª^`Þ„È¼{TÉÚ£N•2u¦‰&QR-1G½H:ÓåëR\nbŒš‘F(ËÖ¤Å©1I€¢ž´ÑÅ9zÐ€QA¤=ihaÅyÖ©6ûë@r[ì* {	½žGzòkYŠËP·”áÊÚöƒß{\Z¸jì	ÛSM¥†ÆÝ®oeT}{ûÜ×\r¯øš}Q¼ˆAŠÐt@yosYúž«sª\\o™É…QÑGµ2ÏOšêUŽ8ÙØž“Wt´nNì‚(ÚVà\Zî|-àyõFK‹€Ñ[g¯sô®‹Âß£·)u© g¬]¿\ZôQBª…€\0àTó…¬T±Ó­´Ûa¬B4OÖ¬€3RÇ\"˜zÔNhÏlt£œûPy4„&{RéJsM9âš\0É#¤\'£ÐÒÎh°	JzRRë@Æœ“Å!ÖœxéH9ö¦aNI¦š‘¸£=:ÐgŠ^ÆšÇNXŽ<í©Ç‘ŠSÀ¤ÍPA<ñHO\0SŸ®sMö¡ œ\n…œù‹ÀÆ\rJOÁ9¤/AÃ\'<Ó[4½¸Í4ša JB{bžâ—½àÞ˜Ä($u4¸ÏµÞ’ZõFcæ„( ¶Wé+õ§Ü—MBf\n’{\n–L,lÞŠN?\nÏŠFHÚY;žì)+=Ç&‹kægsc §1Ò©Z_‡1îËW	öõ\"›ôûž AÎsA\'ñ¦9¥sÏ4Òìk{!TŒÒî$õ¦ÉÀ£éÚ¦ÖÐk»XP¼´Âx¡H<SZŠ[ØNÝŠˆd58œQÐ\"¬ì<7(ÎMG¸uëNÈn”^ã•“Ðz·¿éªqFy£Q\\0zQ¸àLÈéKÒš½­q[M	ì)Ç¥C‘Ozš––Â}ÐüqGZ`fÇ)ùÂÑËu©LrÓ»ã5\ZœÓ¾ñ¡tK“ ñNE$â£è+NÊÛi0úF–)–ì`¨$sZ€ZªGXv¡\nûÖoD&­¡n%À®B*´jxæ®F9¡XµDéÉn:‚5ÇãV”a©¥Ü	TqR ¨Ç5*/Ó¹$«R(ÏzŒdT‹L*ŒSÖš½)Ô€‘F)â˜´ú\0QÖMiÃ4\0zRÑA CG8ç#ó–®­&«t3œLà~f¾=A«†¸øwi.¨Ó	ŸÈv,ÊzòzUEØ:ð÷…o5«€Gû±÷å#åQ^½áÿ\0YhQENG2ÓéZÖVú}ºÁmHÔtþµhŽ)7q€qAÍ.p(ê9â™#sÅ4ž¸¥¦ö5%\r>´§½\'¥æ€\nBy ‘Ša4Ð…Ïz	Í7 Ñ@\nr)Œx§SX|§4âŽsF>QMSŽ´Æ+ŒŽi˜ÀÅ=¹4Âh`2^}iÞ”×ä~4£¯Ò…¨…#ƒM$R·=)‡vx b7JLzPã*i ázS\0ëÖ˜â”ÊO½6fÂqË\Z¦‘ÇZpv;Tj~g_CR†µÚ–Sª½IHJhÎM;ñ¦çæ‹X \0I¦¯Ì§#ò89éLÔ–µ#›\"2GQU^ÐÈ»IÎjã€ÈGµ$¿SÒ®	jD“ÑÙéQZnq÷˜õ©]vž¾µ`¾;UI$bÃ#ƒNI&8»ž\ZØ,1Å²x¨ËÖÛ5+k\ZØP:RKS=H¦îÉÆM6×Q;Úä™ÀÅ\'CM\0¥š‡u¨s&?~)Kg¥FyéJ¼Ó[ô°ñÀéJßÆ£§vÅ6¬Ä¶I4dM¨Ï4Úê$É)Iç“L\\u òx7)¢L´ýÇ¨ÛÅ;u;}®)Ü5cÒ–‡±(”)Ù5?.jXÉ \\QÒìiìaó$ÜÃ[1¯R(ÄJ6ŽjìY8=+;»è6µ,Ä½:Ö„ nN\"´#Þ‚z²Ô~•iµWF=êÜc‘Æi-öBx³‘VTT(0F*ÂŒS¸®Hµ*õ¨×š‘h[	“bž£4À0*T¦×Šp¦Ž)â€¼Sé«Í;µ\0.xâ”q@Ça@ÎzÒx‘±KHi‰	ÐRbƒÒ”R@Í-¥&G<PbŠ3ž*¥ýü\Z}¬“ÎáFI4À²ÌC$Ê€–`\0õ¯;Ö~\"6éøRßašãï|_¨Ý+‰n›,1‘ÅR‰<Ç¨ßø×J°¸ò`ïß`\'™yñ/M·m±C4Üp@Ú?Zò.²ù\'$÷¨Þ\\÷¦£Üzž³ÄËy÷¶Ž²£SVÛâ.”«†Y‰Ç;W8>•ã^c/ ÒûÍ>Q#Ú­¾ èŽ£|Ïûè¥oYëz}ô^m½ÜR\'¨n•ó¿šIÎiVfC•8>¢‹&;XúYdV\0‚¢CòW‚Øx·W°uho¤!†C¸nk¬±øžîê—–¨;ŒãñÅ.V;ž›ü<ÓGjÏÓu«=RÙg¶™X1ß?J¿œÔìì;ŠÜý)‡¥:šzPSJ\Z›»4(Í@¸úi<Ògæ¤#-šb½€‘L`Šwz`Év¢Áq{TR.Xz”õäÔ|m\'<ŠM…µ\ZOÍŠLaÍ(9Á¥â„=Ä8â”(¤cØQÔVÔZciÝ)1É§¶à“\ZÍíÅFWçÈïOè}h4•îî\0¢¡l«\r§¯Z”œô¨dÎTöÍ&Ú\rÉ9ã½Fs×!àcµ4ô#µW\Z<‚[Š@	Ï8¡r8Ž;Õ;ÛBØŒIi4¸9Å\0|ØïIwWB.áÖœFyý)\0Îi2IÅ]¬„ÕÝÇƒ‘éHÍ!$uçš[…î:”5\'ÞíGO­&ºŒZZ@hÏ­;Ü9;dÓ”š>” µ°lKž3J\rE’zSÁÁæ©1Hx8íJ¬sŒS7óÒ€ÜÒ»½†‹\n»ˆQZ¶ñyi‘÷Z©gÌaÉè+J8äÀ;N|R{h\'…OV«±(éŠŠ8¶¦hkÈ­q¹X±ì)t›v[šQ\08«‘u‘§nN²q[1me§ ÷£¡-4õ.D»…ZŒsUaÍ[ŒP¬÷,Æ ÔëÅCNµ2ŒP‰d‹S â¢^•2t÷ W$*EÁô§©¦!ëúÓ‡Zhâ¤RåéNÇ‹Ö–€t¥äP§ƒKž(G4ÓŒÒƒŠi9éMˆ8§sÍ6–¤bý(Î&H‹¯ëðh–†WÃ9*g’j„OªëVzE¿›s&ÑÐc’My/‹üXuiBAæ$@`†¬ÏxŠçW¸ó\'“~ê/E®q§,NîkD‰¾‚É)cÉ¨Þ@ŽµdšyäÕ’sN±Ó­H0i\'Ü\Z¸¬Å{Tc,w\ZRIêi›¹ÇjÜÃ¥\'˜Iæ·<RC&úA!ÏZš(Ôišº~©sa2Ë¬Ž§ ƒ^±á\ZE¬Ÿ²^b;À>R:H?Æ¼Q[žµvÎòKi’Hœ¤ˆr¬½A£}Äü¤fõ®SÁž+\Zý«Ãqµo!ÆìpzŠêIç\"¢ÖvÜ6Òdö¥ÉëM\rB„üä´½i§‡\'½/jJãsQgÔö\rŽ¸4„m\0u¦Ôôâ08éIž8 .CÏlbž{\Zb}öö§À£}Gäš6óIœœÒçÖ„ÄÐ™çO›œ¶)pOJ×ØCÇAøÓIäJ{ç§jLàSê+ˆHíQNÙ#µKÔð>´ÉÆ\"oJMê=Å^TsCdži‘œ¨Î+œ”–öe.‡ƒ–ïIïC+‚	¦“Œ\n¨Êû–ôA“AsÛ“Fi£¨M·`½–£•Ž)TàÓcŽ”ÒA\'&—®L[&•I¨AÆ9âžôÖÚŽêä»ðr\r\"±cžÕsK»\nzìÖ»&”3L\Z3éSÒåz(\'Ž)™ö¥\'\'í¡œ˜àIàH¦+Å)4›W}‡sš³l›Ÿ$p*”»`Ö„jÐRmŽ:šËæJŠGË8¯H’8b´Š?,´qŽ+ƒÑãFK}Þã×Ú»÷”‡Úz}*¢’W3“oC/SŽÚ\r*âäD ¢d`c½qºmÂÜ_‰\'ÆÎN1Åu0»Hü;pŠpÎÈ¿øð?Ò¸kV#f)MÚ\'nŸ=FŸc£¹1”mÙèEjé³$¶ªS;WåçÚ¹iä}ƒ‘Ò·´©RÛI‰ä`«‚ÄŸ©¬vF¸ŠnÕ›ÑjôU‰¦^‹åiî†À­È½ÅZÐóË(3ÐTÃ¥Fƒ(¦„Øõ08¨”Ô«OÌD€Ôƒži‚¤SíJáaËOš2iýéØ	.y¦JM/@ÐÓ©(ã­bô¤üii\r0AÖž1Š`ö¥âumVÛI±{«™x\0žXú\nñëòê—Ï<¯•ÎG@+wâŽ£#kIi¼˜ãŒ¾æ¼éØ¿zÖ+K‰j%Ä…Ü‘P‡9§’\0õ4Êv¸Åf9Í4¹Í*3œÐ·¥‰¥BÓ\0 Òæ—QŽi…²išMPSÍ‰¦Ð	¤ÂÃ·Q¿4ÑÉ4¸ d…9¢¥šÔ\rïj¥ë÷jåv7ÍƒŒƒÁ¯z·™\'$F¬2ï_6Æß5{_€u5¿ðäQ3~öÝŒd{``Ò•ÙHë;SqƒK“ÒšÎå°ÈÝïF)	ËA÷¦ =j7?0æœÇ#\"™œ‘íHbç™õ¤`H¤QŠ¡y‘&LÒgÛùSØmCÞ—“C­$1eE)<ñMÉ¥ì3Ö†º†ˆŒ>sO,àŒR3LÀÅJdê‘\'Í0œŠ6çš`r\nÌb¡#\"’Boô¡IšFÆÓŽâí¦„q±ò†qJ	Å23ò;âžš™n;3 g½cÍ\'ïOÖµäùã¥`Jùv>´áYË¡0qœæ—#uVWÍ;yô­V\"÷\'<Ñ¸\n€K·½=_\'šM¤’dÑ’\r4É“ŠPÀ÷ 5nÃ†OzUëÍ3¾sJy§¯AËk1šQÒ˜8â“85/°“&nïÖ¢Ü}h\rÇZ\Z¾€Ÿr]ÝÍH‡5\\6jÕ²üÙ§k!àP«Ó“VãÁéÍ@£qÍ[ˆmŽ•´-6mè‘æUoFàWk¹5ç:eëiÅ\Z·®cÅvË8A1î)¶¢¬ÅÈÚº1ü|át»t3Ì? \rr¶ƒå\\Ž1Z¾6ºy®,m\\Œ¿•R±’©f1Ôô¤ÓI†_^fÂçG5Ö¥$±Ç\0b± \0(ïõ«z­äOj\"ŽÙc\nÄ‰;ŸjçÐ“(9¥f<\\œ¢®KðºmÒãõbI?tÑ–°|?Í.Øcøüù­èþîi£Î“Ô³ã¥gŒÔËBd^¹©”ŒŠ‰sRÐ&úŒ{šx¡«‘N)sMÔê~b´¹æ“4£€t¥4ÑÒ—>”SHxïF*:Ó«Ö‘Ž(éÅEtÛme9ÁN}8¤;ž%ñHî|I;#Ú“\\‰€…éW¯%k‹©dv$³ÉúÔJ…ÈÅk°•ÙY-KsNû)ÏJÜ´²ýÖæ¨îmÊŠIö4Qm2@CQ˜{âµ óƒP¼xãSZ\nÍ”¼¾9¨1Ú®2úTl ŠÔ\Z(šr©ÅJÑ|Ý)vñNö&ÄAhÙR€:Ò\ZOPDey¥Ú1OÀ4bíÔfÎ)â¥šÅ4	Œƒ]×Ã]CìúóZ¹ùnõ×\rŒÖŽ‰|Úv¯ktú¹>ã½2Zî}ŸZBAâ˜’\\ŒŒŠw¦k;wÿ\0¬\'Ú›““éKüf“¹æ„ÂŠo§\03Laò’)Übæ“½5>îi{Ð%®£K.í´‡½#\0[JÙ¤Nq“LpÛœ(4jµ\re$ƒÚŽ=°(-œQØÑmBèE!€æ™2­\")®áXrM\'¨kaýF \njU˜zâ‚ÇÕ;˜ÜZ3šh\'4Ž™46	ž/zÛ!lÕ€Ü“ŠÛÔÜJƒ×µbš˜Ý\"çnk\nÇthJÔ€€H¥ï€i;ñGëI­BÝGzNëN·…§”\"Žµ«6ŠáTÀ³íÅ5~ƒº[™;ˆœ®>‘w$ÂØÅV6³&IFü©;¡]t¼Ñ¸Òb{Ô¿gldàQma›¾Z7Pc`iUïK•î;’À››5}˜ª‘!N½*Üx&¦mî\nÅ¨ÁÅtºUÄ–)*&ó\"ä\\ø}ª\nàŸOZô>D†Ê$\"ƒùSLµªg¥[=¾¦êW2( ûWx»”Ú0+—ÒÁ’êîäõ–RËí’Oõ®‘b˜\'Ë)Ï®)uÔ¹WFq4;¼Ad€cl9?‹ðª‘àš—Ägñ`I\\1H”ØOõ«÷övp¤e›ÌÜ	nsŽŸ•)­Qè`ZŠwêbêR9€dv¬˜ï1WµY_b«6@éU4õó.£^¹`8©‚dã>+»§–Ñ¨ì ~•©}k:È|•¤€‘MqacS\n†!ÅJ\r-‚Ä«ŒSÔsQ§Zu¦š%¢NœšzÓ:Ó–†•Oµ;½1M8Q°¥¦“Òœ90ÐriU©zÓ”ŒÐ¿\Z^”Òx£¯&˜‡uæ¨jìWG¼eê!äjèúÖ_ˆäøwQ|ô·oåHgÏ¬2ÕnÒ0XUrìžµrÔ|Âµ–›„Vº\Zñ±í§Gc-Ð8_—ÔÔ¶á6©n}ªü>dŒ%;~œT$·7“v2®4¨¡Îç@þ\ZÃ»Œ/n+µ—J—Ë$`“\\î«§ÉG>†´dFÇ8ç*&f®pNj\0qR¼†ÑWp<b›Ž}©û99£b‚t¹àÓzÓÈÁ¦Óº°¬7>”½é@À¥Æy¢ö@…QJPžiW¥HE\nàŠÌ9¤š|ƒ˜£ž´&&{ß…oÎ¥á»+†ûþ^Çú¯Ò¶I\"¸Ÿ†Wg‡ç„ŸõSœ~#5Û)IY‘?‹4Þô£¦i3ÅNãb;áx¡¾åqëD‡jÓoA-ÆƒòŠàç¡OÊ($QÔ­\'½5ˆ\'­\rËqCP!ª¡GÆM7\'“F23OÔBŽÇµ\'F8¥8ÖÝŒä\n–˜Ö„q“ƒšGPHoJ\"çbzš^¡ê^{t¨À8<ÔŽÿ\0)Èâ£^G±¥¯T5ÜMÅWŸZ\\ã‘×É9$â•±Ç5W+ÌðÍ]¾u\\àc5™»sS“uÎßAŠ¢y8¤“*Núõž{PsŠh4¤óŠ»Ù}ž)psGCS[FeG,ÀÄÑè	ô4´»rÏÏSÐ×ºÊ:Ò·\\¬+»8Íym…ªÍâ+;x—åiQE{ó3Ñ~_ËŠ¨Ý»™MœGˆ´{Hlp\nHò\0¼çÜÿ\0* –PÁk0bÛ@\'Þ¶<BÃÌ·<d·ôþ¦°wQçéšu ÚVb§$·ïN·4¡<°æ¹™ô‰K1Fž3]“¼©´’@ç)B)ó=J•DÞˆæN™pÌg>Õ_ì3ÆÙ1°úŠì0Î9¦¨ªåv!I³—(F7f‰FWŠéZ+ÈàÔ/cñ´b¥ÆÚ0o[VŒZæ(ù%GækÕ¤j¥s€¾•ÃÛið[ÞEpÌnú×A&®ÏÊËË£(#± ŒÒå¹¬ghèÊš¬‘Â±Î?Zêp„Ž\rp¶IjS/‚ƒ‚µaç™§,dl“×52vz\ZÂ*¢µìfëyþ(¾“<®ÕãýÑ]®–Q°•Ëºz`t®GËd»ä\',ùÉî*êÞJ‘íI˜Ô\"¢IÉèvQîyc+;˜ÚÁ);G¸®Ã?CNÐ”É©ÛÞAUµ.f\0V…Óv±n9Èlþ„ÑÊÑ–\"OžÍž§h>AÅh£qTm€\n0jòp{Ô¤Ò9/bhÍL*$©”ûÓZƒcÔóRŠ‰*AÖŽº‰’Å<pi€àt§/µÜSÁ¦RƒJàH	#šx¨§Š`>Ž:ÒRdb˜1Ãfš\r¥q¬_xWRÿ\0®&¶:sXÞ*çÃ\Zýq4áŽ0Õf×‡^C™\r\\±C»=kYê];›Ë\roZá!ñXˆéMW¸ÔÜp¯Åf¯}M\'äoÞj¢$Á`G ®kP½\r×ŒqTg¾2g-Td”¹ëÅY)w+Žpj›¶V¤fÍDÀQaß±9¥ÀüiÛhªÜ‹ÜŒ¨4ÜdT¤w¨[ƒIè6\'J3Ú‘˜b£g™\n™j¥¼‘RC!4XW$“Ö¢sV˜\\úÕr…M@ó=á…æÍBòÑ˜bXÃ¨õ ÿ\0…z‡>•á¾»6~$±Ñ¸þµî\\ŒûR}ÉÙ´ ùW„Ö6XûRâ¤©â¡¸$!É©z\Z‚pXŽp(¾š¤y`wÅHHÅG‘´c­)a€:ÓZCŠi>‚—9Í4ÐÚ\0Ú)§{R©ÏZkÆØæ‹÷…ÜÒ1ÝÅ\"¶qM$ƒëC41RTôs¸c½4}óšvî¤ö4·Cê)\\ƒœTIœS»œÍ#caÅ\'¢°¼Æ8É\"—€£ži ’ÃÓÖœ@Å4º!ß©óýã‡ºcïPqšY	2}i…Èâ©;1ù¤sšjÔìŠh¥+‹Ôæ§¶¤èÃª°\"¡Š–ÙwN£N(ÒöÜôÀ÷^#³™”™þ½&wË1÷Ír?­•VâäË8Â®?ýUÔNÄnõ­ ®sUzèrºÜ›µàŒ/ó?Ö°›©Íhê2î»¸lä—#?N?¥gÍlÓÒÂ‹ÓA›xâš:óN\rïÒšy<Ô[¡m®‚ŽZ^ƒžôÐH¥ÎxÅ\r6õšúñGJBGr(&¥ê•Éæê.I§d¼ÓGJ_¥>^~¢n$bœ8)™=qJ	&¥«–ºê®0GZDÜãJŸ¶i21T›[I½JéÐ6K oçKáøU5ÕÚ0XÊ­É÷xª:4ìºÒ„\0³¾ÏÌÒ›¼Z”µg¥[}Ê¼½*•¸ùF*â×5îìXN80ëP\'­N§½M„8T«Ò¢¤QMˆsRD§ž*@xâ˜Í”´©\"ô§TkÀ§çŠ@:šLñHH4\\f—4ÐE.hI¬Ÿ\rÞÔ†ü{·ò­Z¡­ÚðëþŽü~àYÝ/µ-FÌYöë™Åh;ŒZËVkHŠþñÀÚ„b±ä»~y©î±#<Uc\0 ÒJÈOr´±¥ûE#DFÈ«@Õ“‰ëOÜ5P}j@qÞ•õØœ¸94g#š4·\r‡3â y=)Ìr*,P„Øœš6dSø ‘L@J«ƒJ¤\ZxÀ9¢ú,cäÀ¤•xÍØéRžc¤S]­§h.b‘\\0?Cš÷?é·IŽî2îœ×„îÇz·ÃÅ€åCÔž^§Ð(r[J]Äž•Ìx+\\:¶˜RfÍÍ¹ÇûÃç]6îi5m¨1Ç&¡$})ÒäºŒñÔÔj	-ÛšBØcµ\rŽ´œmâ‚0´ú;T{¾b=)ÊÜf£êÆX×awüØííFAšÞÇ‘\0Ÿz1Ë–\\v¥ïH§+ÓŒñNäÜ‰Û¼ýh=ø¥Çï¤só:ÒA&!l*ìI^Ù©Å0>éÜ•À…J]ˆ¬L¥6\0Î}jMÃÇ4Œ@mØ¦°,:Õ;=Ó>z`I œqK»°¤&œ–¦‰YŒ\ZAœàÒãÞ•yjbòB…5wNˆ½Âç±ÍV^•©¤F~ùÓ¾¢hö/ÛýŸÃ[ñÌ²Ï­i\\0ÚÙô¦iIöoÙDÍå‚U5ILVS¿<!{ñZÁYyœÓw‘ÉNÙ@Ù$·&ªîëšžg\n€¸RxÎkGÐQÓd7éA àÒ”¾lt¤Ê·¤‘KLûÄÑƒŠCZn;©÷£<õ¦÷É§pEN»Øp\'Rdæ½éIª«€éFïJMÜQ*S\r·³ŒSyÞœNh\'½K\'mû³žµCÃ‹¿ÄsüdÕ»–\"IíPøM7ë\nÝ‚“Q#X>ç¥ÃÂŠ´¸ªÑt«+Éâ²ŠÓRÙ2ö§_z…jQÅµ‰9zÓÅ9NM=À”pjE5ëÒHÐ)¹êâÞ£šwz@?9¤¤Qšvc³Í.qQÓŽqF€.{W1ªø€H.ímŠ³(hÈnýtdäW’x–cgâ»¶°<ÍÜ}(ÐÒœTŽ~ÖK—V+‘úÔ—-€EMæ‰/f“ûç?¥V¹<\n¦îô*1i4R“Í2Y#QO•Š¡æ³˜;7=)¤$Ã­Wy¸©ä‰L|j›‚N1Tíº!Üx~jt5XcŠ°‹š;“•¨[9«\n…—Žj	*R-¢,äÓ	9<RžJo½;ÛØR¨‰lðjmÙÎiìMÛ(21#š«ëJ£\rHiw«)ÊÕ|îâ¦®)4;êBÃl¾Ô¤å©÷´ƒŠb¶î)\"—™Ûü7”ÿ\0m\\&~S\'þúé£!Á¯7øg\Zý¾ùÏ,±(‰ÿ\0ëW¤+dšrvz±	&SNÛ×ÞšH.EŒã<Ð‘=CtéI#ü„g­47$R\\Tù˜«€ƒÔ\nfsR½\r3v:(Ü7ÐÒ@4dçØÓ@Ã\Z6B~BŽ”†ƒÒ˜H#ÃÈI>\\‚šÉäÒM½€\0qMÉsSV ×T)Æi¹ÌÄð2iüt5 OÇR(Òþa¯QÏ¤õ4€PxÎ)Ärh,ª:Ðì;i©óÆpi3Ž´TsÍ)éWrì(9§)ù©ƒžh¾€Ó&+w@‰žpª2\\…‰¬5Ùx>ÔË©Ú!òÐ1Àæš}ÄÏV•¼¨bGÊ¨bë2í³ÙýöúÖ¥Ì™sÏµsÚÔ¥ž\rÓq#ò®›;$r^îæïûÌcŠ„ç9\'Štó“Ï&˜>j5½Ùvêýh\'wAIÎqJH\rÖ“wÐ/a\0ãëNäu4Ü÷ÅºäÔµ¨›²#¨ sÎi€æž0Ü\n%¦ÃVböéFpy4ÒxÅ!À¤Û°yÉÏµ)lb£ÉüizŽiÇ`ºcú)¡‡JBM\0¦¥WPlZIJ—ÁË›önáj¦¨øµo~+SÁI‰&|výj*hiŽò,V“=3ÖªÄ2jÂæ²ZYLv©ÍEJxëMwD´å<Ó=©ëI¡’gšp¨³O€špÎ)™Óâ\\p$Šp÷¨ûsNv :¤äŸjN)h°\n)OJnqKœÑ¸	Ï5ä2B<Sv1ÕÇÔ\nõþ¢¸Oéqùñj#ƒ·kþ)ÇràìÎÄì\0«‰j®ryª6²o•ùæµaÏsKfl–¬©q¥¡\\çšÇ¸³)œ\néåmÉ´u¬û€ª¤7&©6µ&ÚØååNÕ]—«t€’@ÅRh‰íU¹-‚óÒ§EÉàPi­=&ØKv¥†@\"“cQ:-@‰´‰ïn7oÛ”+–ÔmöJØÍz[H±h…p1ŽOã^ª²³’ho]•Þ¦.\r0\n°éœšˆŒQpcx¥#Ò“sŽ•Dl<p(šAÒ€)rhÛ<*ÌCœUU85j“JúA.ÇÈ*œmÍh]²¨¤d¶Ee5¡è¿\rï¾—±\n ûõÿ\0\nôb¹ZmÎaÌÒ—Lý+­c•éŠRz™[QŠxÇÛ”rIÅ7¦<¯„Àf)>hôÇZv@5b[Ú†ÃQùäÐI4`“Q	CF±éIy\rÙÝÎ)¬ø47\"£#=-ë¡&x¦ó`\Z7\0ØìiOÒ{Žâ6I>‚˜ÍÒ”ž	4Í¹94•ÐùG“È¨úå9íDÙÚ8Á£ 6j·ÔH¯½4|ËÍ*ÀóQž¸ŠC±óÐäúS»sM#î½êÖå­€8)¸É©#P[ÚAv]Óàiä$ƒµyÍwþ\n·Ûªä„Ž~¼W5an-ìˆ\'æc’+µðt{\"»›ý•_æ «I¹ÞçE3äç9®wT—7dáP?¯õ­¹Œ×7{&ù¥aŽxý1[;ÜÁ\'rƒóži¬î3M$õÏ4‹Þ‹OQÀßžÔÓ×­§jLç­KÜ,’°î1ïHqž”u£&‘1¸cð£$p\r!ëG½IôÎh´¹R¾ôÌóR¹Šî3ÖƒÛšOzwAÈ¢öÜ\"’BfƒÇJ@9¤lÑkè‰ºFvªrbk ðRâÚg<åñôâ¹T·È=É®¿Á«,“üRý?¥c>æÐzhu‘‘‘Š²„â«&*Ê*RÐ¢tÎ)Ã“Q)©WæéLCÆAö§­GŸZ‘zR°§®*1ÏzrÒ@8c4ñL¥648šP}é™æBÿ\0ÂŒäSrhŠ`<zRi¹£©Í A®sÆ1—ÑAëûÀÐƒ]sTuh\rÆ4`dã#ê)‚Üò%µ6³üÃ†GÒ­‰qÅ\Z¼Ø¹ŒcýjÀ(©’}Nˆ;ilÑ&lÉ¨€Þx«/”ww«Ù\rë±©oamaäE,}EfêÍk´„Ž1Á\0TwW§gZçîîYóÏÞ¤rYêUl¼árXà]6ŸköTV?©¬-$tó7D}kVMDtÍL™¬#ÔÑ¾½&8®Vúmîy«7WeÆ3YÒ\n¤g!ŠÞ¦¢u9Í=@iHÍ+«!C“Šu1†\Z¤Š¤„Ä\\S±Gz­&&*š³ÁÍC›©cûÔ? H}Ëð\0¥³€Ï*Dƒ.ì~¦ œ“\'Zé<l.5Û`FvfCøñÅ\nâ=JÎÙ,ìá·A…‰BÂ§l¶1Ò¡go0Ž:Óä,Ñþï‚OéRJ$`\0õ¤#¦îÆh,1ŒóB	É¨Ëò¨úÒÓÜüäñMj4:NSžôÆQ°Æ\r+¿Çzdáš  í$õ¢àI»ŠN8`i§\0PWŠ<§8ÍG3±ãûø?‘§Ç4‡¥Ð^cNOMÜqK!;ÔÏ­!?0´è;Œ•°‹I\' §ÎM÷i™\'Þ‡vƒ­Å,ùzSAR8¤P=i¼ïÈééM1jÙóùÎsGZ^ôŒÕsê(<u«º|&{•^Ýþ•M¯¦ ‰^lŠ¤>†£Ì\ZäF§ W{áÅèDôg’kÍ¬˜Éq$„ñž•ê-ôkTà™#Ü’­ksÎ6ŽŒt®zv®rv.„çÖÍÜž\\Êzk\nRv(ŒV¦J]\nê@¥ã4œŽiŒI+]ÊÙh)nqŠ;ÓAàfšÎªIèü…æ<¶¤\0ªM©B¤ÃŠÍ¹ÕÜ¶#ãÜÔ¹#DíÙlÓÆZæW”pXb®Ã¬¢¼øÔ9=rXÙÈ^OJ®/PHTŸÆ³çÕ#b\0n\rdÉ97\rÁ49v\ZŠ:õ?\"”¶:š§g8x—éV_ ÇZqbK¹.p:ñL9Í¦M4ñVí}{ØÈÕ‰3Ä¹ìk·ðº•Ò!ãƒ’?3\\ûn¼P{W¢hH\"Ó-Tùfæ3XOSX-47c<U…ÈÅUN~µaN*m¨ÕÉ†síR¡üªoZ˜Kd\ZÏ5\"\Z‹<SÁàzP®%R)ëQ¨œ(»=iÀÓ	¥Ri}/^”ÀØ9§HRäŠnsGZb9¤íH\röÀ^ÔÓÈÇ­.hê)0<³Æ6‚Òÿ\0#.H÷îJôéQj:K¾ÌÏÜßÜW™[	£tk©v2\0éPÏ1(wÚ¼\ZÏž|æš4ó\"ºœúÖlÏššgæ©Èw\Z´ï¡$‚spqšF™Ù³“LU§\03ÍAlK» dÔnÔÖ8¦g4­¨]!‘LÞsJÆ£<Q¹2có“OSQ”ä<ÑrS&Å ëNÏ¤èi¡±êrµ*qÍB\rJ)1«Ês.zgtÔ¶Ò~ß‚fŸ ÙAé^cœÉø×®x=Ïü#ð!) {Ž´—ÂL·FÝ¸c³}æbjpÃæ›–•~íJján¢;l\\€O°¦7úÀ çŠ—¼ÓW\0úûÓ¾¢•ëQ…ù‰¤lÖ¢ß™]ðâ‡ R	 Ñ9UŒë@¨®Î|µ÷£[‚$=5»Á@ø¾cíKÎÑŠl¹P‡Õ°i´…rC@æšwmäQÆÓÍ+Ü9¬@\0v-ÎI©WÕÊ·Ò;¸éF©èU…bKŽõr9c¹pã1\' L7ƒI.¡1ÊÄ±¨±ó°§‡ÃTLO™Ó­lö­©à£­8ÓM(ª}ÐímÉŒšØUòl	Üã$}k*ÝJ+}F1WÄþ=.6o”Y°+Ô&Ú›bVùQ@çÜySî‰Œ@ZÙM~îy€’RN:`~µ¬ms*‘¾†Íã3.Õç&²îcx¤ÚãâºÛ6¥rd–!åÄpbÕÓê:-®«jbpe$€r>¾¢´s³3Qv<¿u&IÕÝOJ¹ÒîLW\nA<«Œ*m£ƒÒ‡ðóudA4ëlÎzW=y|óÈB’Ò¬ê’É,¢4\'è*îŸáÑ*fc–=…aR¢ÜÖœ/¡Ïgh÷¤;±œWh<\Z¸Þ_¶væ²µ\r,[©Œv©æ¾¬ÑSkCœ*M4ðqšžPW\"«‘Þ†îMžÂ†>´õbqŽµ4ªpàÒ@tz[,yÍk†V†$ŒÅkÆ00M\\mc9+’ïÁÁ¦¶Fpi	ôëHÇ“UêJVØÅ˜ï¿>¹¯MÓ†Ëh×ûª?\nó(ÎÔ‚÷2ú×¨Úª+;š­‹éëš˜\ZNL„üÔ­\0•~•05âœ[SºÙ†ä›³Ö¤VÅWÎEI^hÜL²:Óêâ¥)Xw1Fi(&“£ýÃTcš3Í 4£4ÌÒçŒ÷ CÅ.y¦nüé	ÁâšÃè”ÜŠn{ÒÆÎ»£e# ‚+È5Ccª\\DÇs€=3^¾NG5ç~8´1j‘Ü(âTÁúÿ\0]ÞÝÇÎbgÈã¥gÊM[‘øªRNj´Nèèl¯&{ô¨\0ç5;Ô@sTŒ›¾Á¶¥·D/–Å@ïÅFç­-GbÍ×—»äª†‚Ã=i21Ö”[ªÓzÑ\r&áOÐLv3H>SHzÓ¸\"…¨‰W‘Gzjž)iõ Ô ‘Ö¡Óƒ{Ò\Z°¿Å{?‡ h¶˜Ç1©ãé^9m–uE,ÁGÔñ^ádŸg³Š!üéIìCÜ°_\0ãšÆ>´Üü´Õ÷5;RPÜâ“€Bô¤ävâ‘ŽNMZjÖš9Ï5a sÞœp9¨ÕÃíÞ¡¦õA¥¬L*	‰2.EH¬1P2åËÞ©jÁ­	I+Ö™!,ûÒó‘ì)¸%2xç¥+\'¹*°\nj,±Î1Í¦\r\0…`\\SdŠÿ\0:nxô¥iR:t¨rÌG\'­O[ÜvdÍœ\r§¿5áºsNbTc¥6C•ÇëCž¶E$÷ýñ‘ÅG9Ã!‰¡Ø®ÑŒæ‚7¦jMõb[XðSÉæMÛœc¥*çŸJÕìM`À¯Zœ»»ril;zâ®­²–Í5~€ÚÜÞðµªËx»À*³Ÿ¥tÑiqMq´GŽ{Vg… ,&m¸¸®ûGÓÄlZQ–>£¥k{Fç<ãyÛ¡¥§iémgp®ÔµNñ˜Ú®F008ç@ëƒÚ’ÛAZ–Ÿm©Ùy?t÷Sí^]¯i3i/ƒåÆUû0õ¯\\œlŒCYúÝ­­î•)ž5*’:sNöÐmª<ON€K9‘†Nk¥‡÷$b¹¤¹m>M»AQùÖ”\ZÊMÎÝ¸íÖ¹¤ž¬ï£$•‘Ð=ãÆ;W;¨Iç1Í:_A\ZFï¥P“TŠ~U¡Ýô\Zq¾¬Æ¾´e%Ç ÖiãŠè.eY\"8¬M=,g4¯t7*Ò€r=êÍ¢Œ“ÞªælÐÒæ\"·JËÓ­öüýëO¡ªI™I ä)²¶çµ.ì\nŠá±Ÿj·{\\NÅ]\Z?7Yƒ\'#~kÒíþà¯7ðéÿ\0‰´Gdÿ\0*ôh2sÅaÖÈÛ¡q\rL„fªƒÍJ‡šr`Ó³‘Q¡õ§Jã‘š•O5žjEäÓ°TñS-WŽµ aŽ”‡knKHÔÎ£­.xëJÚãÔäR÷¨Å;wj7Ã³Kšh¥(€§šLœÐN4óC°Çö¤\'™¤þ*Mˆq®KÆñ3Ø$›AT|“éž+ªlž•™¯Zý³Jž b¤¨÷©[Ü£Çæ“EUvÈ©nFƒU	çšÑ#Kè£c€iÛ€äÔdî5lˆ-Í7¬\01IåƒÎh„ŽeËjŒŠ°À¨â«±;¹¢Ú‚Ñí™ŽjSMÍ43\"ŸZ]´˜¥pØ”t¤Í <SOZh/aÙÍ(4Îè\rS°î›¹·áxVãÄˆä9öçúW±®q^§Löó	#%\\‚+¿Òübh—«ÏBëþ;¢÷;ïNª–×¶÷Qo‚PëíÚ­+†85,Z±Û†y úÓK™¤vÆ9âyuÜA4ò@ÔÆb~”¸PM;ÛF	ÎÜv¨ã\\/¸§n8ö¦Æë’¸l\nInzúQËéŠBrx¦nnTõ&¢ê×,‘‰(ëLþ,çšV\\(íH~ïLqTÛ°¬fš¿(Àõ§éL?(äÔ«¡ÜSÐÅ3ŒN<Šnà\0­R’{’¶¨ÀÇCÞ•ŽQ?ÌÇ-ŠpeÀ¥upm½á*qÀ~ÊÁ®†æ;P~µR$Üêzè¢U…>€V£–ˆ‹ì±Û¯î³õ5g@±—ZÕb²Œå˜º£©¤ò^y8C;9\nª£’Ojõoøv-À\" kÉ€3H{²=…[ºègÌ·-iz=¾—ŽñÎKÉ5³Ï\0qOŽ%qƒÁ©ák0Çâ«R\ZjSÅ*ŒÏ5ÉŽ(+\\©eÆ:Ö&µ#C£ÝEœ‰—>œVÓÉ“X¾!è·dvLÒ°5y§N÷Èö­=ìöí,ù!—åÅM5äI2¦sž¤Sîµ›vaV2”ŽøÂSëK“—J¨-æ‹§9­¸o£3ùmÊŸÒ¦šH£j©©R—Q8Fþë1Rq–R3ëTo£ÁéÍkÏv¥HšÌ—÷ƒš”Û×`”ÈÍÆ*Ý‰ýúç¦y¨ÞN@­\rÄÝÝÁÇ|Ö·1jÏSf200=›5,ºuÅª‚ÈJÿ\0yy­Ãte~g \Z­vqnÜÕ’3õªWïˆJã­@^dþ]Ú†ïE\'úW Âs®Â±ƒ<œ`cë]¼Ú+¬o¡d1\0f¥Fªù9ö©#4=ŸrÚ¿­8±¨Pæ”ž*u{…‰Ñ†ÞjE5YÚ¦SÍ>¢¹m5&qPÆO¥<6N(°Ç†¥íMÎ(\r‘Ièî!àö¥ëÞ£\'4ªx£m‡baÒÅ3w ñNìVi«‘Fr9Râ…n€;w4ÆniÅS¸œ–Úµ2)-I¥»Xø&©Mxî¤”ß/yæšÈ1ŠYªŠ[žY®Ú5µüŠT€ÇpükÉé^“â7íVéiæã®+Í$8cZ&ÚIn4·i³Mr)ªØ­ÂdÙæ—8¨ÃfœRÔ¥ä!rj6#4âsQÍMÛAr=(JniÔÝô˜[”ÔlFx4Ðô$¹¤-L—§4ÔRÜRi¤óJ4Š.BJŠ°“õªjIàt«Q¨ž´¯Ôk±~Òúx%WŠFF8®¢ÇÅÓFÁn#Žì\rqá€ô§+œði]KF©nz…¾»ct,ÛXóµ…i ©cŒ\Zò%˜©ëŠ²º´ñÇ±%`¾€â’ì\'¶=A¯ BwHŠ«UßR¶ÄÉŸ­yÛYÉbÙcÞš.‰ëÖ›Ô~ÎÈõ$Ô-]p—1ìâ¤‰Ñ¾ëô5å‹vêrâ§Q–2\nJê}‰Yn™.ög§«\0I4g98Åpv~%¼€wÞŸíó[ö\"·¸„¤„~ŽV+[Cs ‚MøÀéQ«®Õ`rOz]Ù$zRnãV¸ªÜšOº)¤‚qM8éšK}õwÈ<\nk(*OZc¸Ÿj_0àvö¤Ú&Ë ˜ÍG\0špfËqšˆH¦FþòžG¥	êSM#ÈôØwL²?\nZÙ—k7Ò¨Z†X£Œwæ»¿\nxZk›Èïo¢Åª\rÈþZ7n=+¥hˆæî^ð‡Ú8WQ¸]²ç÷(Ã þñ®úÚ68ÝÖ›¹/¸¨up£=*›lÍ½GÂz~ð*™qŒþ5Yî7“dúlµZKž3Tçºå°j›]:z‚i³LÜ/^•CS‘eÓ®Pò\Z6¥Uû`$Œò)(’7`E7¢Ð\Zg“–T•šCÀ¬ë¢<ÒTåsÅl^Y<SG(\'ØÕcoi°ùŽëèÿ\0ª²{Øí3Še(\\&O¯JIndsŽht‰ÊI¦•!rAÁïPôèS$õ¨ä}ŠsOcÇZv-Æ(°å\'a­.ÓxvÙ —{q‘X\Z|%åë¬´ýÞ(’ÐÃS¤´—kò§ŽidÓ,.›”ØÇºqTcrPSyØ^x50›H{•®ôâÅ33c€Ø®OWC	ØÇq].£¨>6äŠäµ9È õë[+õ!«3sÂëˆÝsŠìrž\ZR-‰#«WQ|µ›ve¯\"pÜóÞ¥SƒÇJ®¼óš™H¥+u\'©a^œ\Z éÍI¿ŠqÐ:œóS\'½VFâ¦Œóš9]Ä[Fâ¤ B1š“xÅX6)7S~tg\"•»ˆp\'5&ïJ‹?-©u2bsK»f£çÒUæÁŽ1Ú’šp;Ò3q@ºÝLÎ3ÓJ6\'“É¦\\Í¾m¾œQ}jSÔÚ1Ð¶1¶¢e$ûS³‘Å0½-\nQêE,`©¼óÅzÙå7å±ù‡¡¯Ev¬ýB¹´’ÎqÅ\nVeró#ÇqQž+JöÑ¡•ƒuïYì¸­’¹“L¹©x\" \Z7ÒØqzØqÅDÃž)å©›©îÓF4Š@{Ò54(z8·sÍ8ôëQôâ-‡1N\rØÓ\0 Ó@˜ìæ•Fi¢¤\nW‰ã8¦Y;UUCO\rÏZH¢Öð9&çÒªšp9â…}IÌ¹õ¥žµCK“JÝ+îIæp)ÁÍ0:\ZLÍU†îÑ8b)Áð}ª\0ÙZ2{R²Z,‰Njt—oz¡¹†1R«`{ÒÖÚ3¡Ó5é¬œ—‹<£?Jì¬µ/P¼-ŸQÜW—,œÖ•ü–³,‘±q×¨¥%¦$¥±èûðÄôŒ@Éª\Zf¡ì²<Ñ÷”•qœ–ýjR{XÏT®ß04ÓØæšwéA`c\'½\'	¥ ó&8£B¾cœŽiI\nØ#59#4A»j]ˆ|àŸ5ÿ\0´ïâ>H\0ÃŽ[ÜûW¡ãæì\0¢þÚo–xÈ–Ü+2mzÌ‚pÝ¸½ôÔçwz\Zþr\"uªwÊ9éXë^kC‘œØUµ cáÆßCU}4\'U¹·>¨•Ï9ãòªÚûÀV’WÌŸÂ;š¡u© Æ=ª•ìoC*ªÑûÎ¢K¹[­qP“<ˆHÀ÷¦ÛßEz¾Pìww©î¯â³Œ3dªº½ê£4ö2Œ^¨®°Ü7ÌÔWfHcÜç\0Z‚ßV¹Æð¹WäÅfÝµìó.°tŠ*Ü•‘q¤Ûõ)ê·ì$à:Ö,×ð2(¿Z¹©£Išåäb¬WÒ±æ»¹Ð¯tµ+ÅœŽsPI;6µAœÑžhõ•É7R¬k#rj3ÓŠjÈCr?*^BmlÍ»8pGZØŠ\'PŽ+#IC#ùŒH1œŽµÑˆ§’8ÆV#ÂûÑÖÆnIË•\r‚å$¥C¨ß!,zv©–hÂöÙÉ¬½RÑ®b;dÁÎ@§ììµ6	µuª3N¤dnEApž{Î*³Bñ6H5,[‹`š¥ÙÖ¶çQ Í@±3€ÙéžµÒÆÃ\0g#Ú¸ÁNGZ½¡s#éSìÝÊº;e9éO×+½rŒ7íaôÅiC¯ÛÉ…2ŸP2)(ÈFÚ°b—z¯,ÀzÏ]JÔôEdjzƒ<ž\\oò{w¤—D\rètÚvÊ©#‚Z#Ö¬Áù¥Çá\\B—\rÄ\n”Hò?\Z×Ùß©Î×Gr5ûÇ˜ß÷É©cÖ¬Ÿ8—ë•5Â‡R>÷4¡Ï8aŸ­G*î5&Îýu+IÉqâqüéÿ\0Ú6‹Á¹‹?ïWùŽSI¹Ç4ù/ÔwÒç¤Ghçh¸ˆŸMÂ§V\ró.\núŠó!+V!¼¸Œü²ºý	:o¸s#ÒCñŠ÷¯>\ZÅúÂæO¦x«1x‹Pê´”X6Žç5ó¢bHàW$<KzÌ±Ÿø*Hµ[‹ì£`/qŠM;]‚³v/£|žjÚÖªÛÇ´U€Ø©Zltò“nÀ¨÷c¥\'\\ÓjZ¶ÃM-4ÃÇjó¨¤m£9¨¹IÝœ\'‰¬D7{€Â8Èüë˜–äŠïõØþÐ08®&æ\'†B¬1ZE¶¥ŒÇÓqÍ[v ÔŠEi~ær¶\"ÝÇ4zö¥1ZV!\'9¦JAV¤“ÇÎ¦”‚(\"Ð­p œÐà)j2.i¤S€Òã”cš^”ÑŸÂž¢†1W\"ž8¤S°I¥p³Šu6ž)ÞÃóŒf“F2)0iì\rØZRM õ¥¡1¥}…Ï\0w§Læ¢<šp\rN÷#Èz‘žjTlcš®2­?=ë9+É2£¶†½†¡%¥ÊH‡•==G¥vðÝGuJ‡9¯6G\'½t\Z¤b›È‘‡–Ý3ØÒæ±2GZIÈcô§ù6€*2w€ÀÒ…ÎzRM!uyÀÏåLÏÏè=) 7˜tZi™D»\'úSMY8”®Ö§%ü±üûÉlq“š[}mó‰zË¹wféŠ¯ÊçŠèvêgklv–÷äFBHH=Á«Nîà»1A×šäô±<·+}úç ÒDk\Z‘»Ô[[›S¤¤ïÐÐ¼Ö¾\\í|ª½+*K¹/uÆGVêÎvq¹Ô/×¥@.Åƒ6y5ŸTuBjœ¯¹\rÿ\0öu‘³#þ•BÚú{™„’IÀ<óYjïrÅŽvÓåºŠ1Dz÷¡$—2êsEE;³©¶Õãi–3–9è+zm¤â¸=)–Ù¼Ù”NrÞ•ÖÁz.ãÜ„0õ“•_½k¼´VÉ\0\0}+–Õô†y±ÞÇ­vM’8éX×ÚŒhÌ‘\0íëØTÁ¹+X™¸¥}Ž3ìì§§ò«vú\\“Æ\\\0\0õ8­Ÿ&IÀycø©È›6`v÷­)G¡Èëö0äÒ¥ŽzTQéNfËt®¢ÞÊyŠ¦ÂGAZMá¹Ò=å‚qZªZjc*’“Ð­k§Á\r…µº\0K>ù3×·ùü+_[¼m£Uã<‘Ul™Vô«\0@R}x¬½bró¸*¹ó5‚ææô;0±Rª›êf\\NK|‡¿jtbIÓ\'8÷¦ÛÀ\\‚TýkQ!!pŠug¦‡­Vª†‘Ü¢lU!Um3gú³“èkec%À­´¥ŠËÍy\nÈÃä\\g5”9Þ©žug\rär\rÆ2ËFU°El›9^ÒFTÌ1Y(Im&õÜä—.1zÔŠ…psQäž”¦L/£i+‰^Ö%/Áæ•Nï¼j¸lŸJ~üŒ\nZl-Ë\nGJk6Þ•\n¾\r)’ª÷Ñ‰ÝlK¼~&‚Aç½C’G=)Áð1S¥Ý…kîJ	^Aæ•dlõ¨ÁÈÍ!Ç<ÐïÐw±8™³Á¥2ÈÜƒUóŒbœ\\äRëf8¾¬›{ôÍ7Ì“?|þuìš7ÐsNÉ0m“ù’œ#cÐšét›m‘n¦°4è\rÍÊçî/&ºèjæ±«-,èÂîì¶)sšgUÈ§+¡³zýi3ƒA\Z cI5ï€Gz°HÇ½V”dt©º[1®T–>õ‘wd“!Ü¼ö5ÑL ƒÇ5E ÜÙ¦·ÐÑÚÚœEå“@çÒ¨2Œâ»»­7ÏBê+“ÔtÙlå*ãŽ ÖÉô2q3qŠk7j—e3ïÜÍÇ±ÉÒ§¥JE&(ÙÎ3HG1çŠM¾Ôu\"Úi@9©qÒô¡è4—R2´»zT sÒ‚A\0Z~)ÀÅ8sš…hÆíÏ9§Jni{ŠZ˜½(iG4-Äõö™ š\\bŒqU¸Ú{ˆ	ïFîÔ¼ÑÞ•º[^â©§õ<šŒž@¥êu»Üw\0ô¥ÈÅ7®E X|Êú+Ò¦†VWqŽõX¸ÍH¯Û¥&õØGy§_-Õ‚1a¼6}jà™}ñù×otcqAÔ°\'Ÿ­\n*í‘gc¶ûRù‡t‹·°ÍD.­¾ÒÎ]AÆ2\rqGR*Ù\\TgQ•›°¡Å!óŒÚ¬7\Za$lÎhcŽõ¹¥Yq(ç°Åk~äÂ.RIiiýŸnÄ(ÜÝMR’ù‘Îî¾Õ½p#(Ä¶28µÌ_à>áíNjÉ…£NŸ$wÚ‹:‘TóºBÏÐûÔFBx™Ærk-V–Ðä”“|Å¯1ß÷qp*dX-gÜôÏATVmƒŠ…‹;CME°R/§ž\\Òº-ñ`Þ¯Êœb¹{}ŠØwÀ=êÝ­ÖÃÅ>UnSKµ«;;Û™.­ü«vT$óôô¨´‹tKëQÔãúÖ-½ñR0kB+ûy9îqY»­B\'tÎªkkGB>äh3zÖGö¤{ã·µ‘˜tb˜_Îš5uŒFtéšQ4.§n3Vê7¹Š¢¯¹-¯ˆ%·ÀšÉXgª’¿þºÓ¸×ñlX¶‚:æ¹Ëûˆâ·rO#¥VµÔLñT®8äÔsÊKCUJ6×¡©€$w–ëUÞØäŒš€Ü`[]ï€Õr–†«–+BÙ*áT\n‰î\\µ›& «œÖ¨É~KmÎE\r6…ÏvÙÓé¬n/P}í§8õ­OÞ\r&Ý$es Â†è¼V/‡§Džvñ“ô®ÓQ‹K¼+-Ê†eè9®ŠqîqÖ”›¹æñc[›ƒ+EŸ¢/ô®ŠÇB†(rÇö‰·ñ®’ÚÍî‡î#Öƒ¦Ìi.fŽÕLvè¤÷jÕ´ôFM«]œÅÿ\0‡»¼à–°gÓç†QÄ„Œ‚µÓ\\y“9y“šÆÔd{vŒTúƒNÊÈq“{lf\0Ñä8ÁÐüäô­{{”–M”ú‘Í!°‚e-ƒô*u¹M=L‚ùéEOuhðv\"ªGbM÷´ìO»Š2\0¨=èÏ45ÊÂè™_Ú»\'ÐÔ*Â”°æúBPqÆiÁ…A“A57»³Bi)\"\r,Šƒ$“ŒTlÙ \nÝÑ4þ—ŒçS\'evTcvki–bcæ=Mk.@ŠqS/½sM»Ý‰$’\'SÍ:£Žx§æ¨[ëIÒ˜¡÷Äc°§Ž´¯vQ1Îj	ÍLO?Z€$­d*¸äÔ&1œŽ•i“H¨CbŸ.£L€G‘Ò³õ]=o! ®\ZÛ	PÊ§¦8¦¢ÉÐòû›c„0 ZªGÛëÚP’3<cæk’0¹ªJäÅÛr©úR\Zyî\r4ŒÕu Þ(¥š1H^¢c€iqøÓ€¦‚ÂQNíFrqJîáa:P\r&0y§q@Ô]®&i óÖ—¥\0sBŽ¡qÜÓ¹¤Œwæ“E%ØLãµæŽOzF=é ½€ž8¤ÜA¢”Ó½„ÄÝÏ&»Þš9£\'=)ö¸Óè874»ŽzÓ3ƒŠCÓ9¨“¾¢zhJ¹ »5\Zž)Ùü);ž¤¡É\'j	$õ©sè9¤|²ç¸¢Öw—b%8¦–=ø¦3µlöÅZ¹›‹4­-šâaŸ»Üšê&¹<Š¾Ã¥gB‹\\zT7{¿J‡6ÝÑ×N>Éß©-åè\\žµ‹q0”ôëD÷F&«îçÖÝîCŸ0Ós@\'<ÓÐp1É®®Éôm6}¢ã«1è>”Û{3&Îelfh|à¹Jb®s¸íÇµnÜßG,ïå\rªÇ…=ª„¶’ÈÄ Âž‹Dk\Z2z£?Ëb}ªÔäœ´©ˆÄ:‘ZZl{åÀéôªI^Ì‰+FÄé$¦L¸8ì*94ûˆÎcmÙüë~(p\0<T¬ˆ§¨5£„YÎªI\\ã\'KØrÏ½Ž)S•\0àWe$Qä¥cÞè–·h¿rþª8?…béérãQ©rêO\'ñS&ª|¢…¶¯QŽõZïF¹†tõ^ÕWì³8úÔ¸5¹®²WHºÚœŒ\'Š®Ý¸ÏU¢”qŠˆîS‚1IFÂm¥fYiÙ‡&š“š€ž*XQ¤•T¦©-½ÕÏDðö“¥áÛa&UË½z˜×Ec£ZX#³ÈGüô<~UÌhÚ”ºn˜°¢) ô\'Š¸úÅÐÝ!8þèè+HÜç—Åvtwº¦åò¢ùSÔw¬Ö‘HÏzÌIÙ°0jì~üýkX«lbäÆ³qÒ³5v¸ÐÖÇ¹¦1ÞN\0Í+Y\r¶µ9¨ì/m‡È±ß#úÒ—½Î\nô®ˆ[î9¦µªµ-+ÜÓ­qášN[¥Mg¥Mq(H¢,Ýrz\nÛŽÐÜN¨Ë1À­Ùâ‡DÓÓ†©þ&§¶ÛŠæz,0Ê©*¤³àÆ@ªZ¬:mŒ›îÑvŠ>3õÅuºVžéi-Ã\0×	¤ãŠó½oKÔ/5)T¹sÓ<ƒô©³nÈW3î5i%&cú&´tm-µ‰VhÐ\\®qW4NäKzBD9#Ö·n.­ìBiúZo”ñòÑ{+u2ß¡ÎÜh“Á¨(œ\\9\0‚£Ÿ¥6óÃÚ•¢nx(%Wk¤híiºâfßq!ù›Ò©ëâI¼xÚ¼3g©¡ÝèƒšÇabóÜ€ÊvŽNk±‚0ˆª\0Àª–ªdŽ¦¯©\"¹êÊò²;)FÊýÉ‡ñ“J@F)øäQ{–ïqS$ãµI»šfqKž(ë¨2@h$u4ƒ\n1šv3ïA,OznÍÜÔ»r8¥Á©1\'ØƒÊõ¦…=sSž´ÓOÌwÔ‹rÜÔ§ õüê6<ŠzÜ[²	!pÝ+ˆ×tÏ³Oº1”n~•Þ$qYº…˜¸ƒR›¸=4tÁ4Ð¦¶¯´É rvü¾µ’U·+DN„Gé@½?i\'¥qÆ(ó7…Hì\09 uëI647ƒNaƒM?znQ§Þ“\'µ=Ži‡ëOV=ƒ[#šzôÆ\'Ö¥§4¬ï©>£Š‘H4òrqš1´ãŠ-f>nˆŒÐËŽsNn¼\nLf’†€O4™=)I P	\"ªÂ»H9FH4g4\Z¤»•}Xg4ëBŠf§¨º\0âÆŽô„Ý)[ªkè‡n\0õ§†È¨Á¥â‰>£‹w¹©‡ÍE¿*Ì‡rÕ2yæ©;ŠqKS©¸”Æ2:šÉ¹–4²Î\\g&«üF²Kð*NëN¢“šL¨“Š]Ã§wvÔKáÐz¹ÝÇJ”JsÖ’ÚËÈ«Vöq¬Á¥€è;V‰ÏFDŒîpªXû\n½köµ`«cÞ´Rx¢ŒmT\\p0)xCn&ŸÅ¹J¬¢·.GlBþ÷nOQV#ÆÄÆ¡HàY_kf\'q9¦ý¥€àóÞ•‰©VS³lÙ{üÆ¡7õÍg’àî LLœÕ)ßäg(^Úš\"ápNx¦µÀÏA˜ãŽ”íÀŽ¼Ô¶Ú%G•—Ùn5Zkt|ãƒéŠqœ&$Z{³hÊTçtÌ›…ØÄŠÍ¸^ù®’â™n¾Õ{ÂÀºz\ZrHèi™R_­léð+H¸¬xx~+£°‡lÞ¤–—9%+#A2(5£ªªŽ=+>IíS©ÜÀuªzXÂK›Rð‘TäU„›8ÁÅQ)ëJfùj¯Ü”ô/‰7·52ÛŠ‚ÆÚ[‚\n)÷=…_—K¸Š#0q&9*\r\'æ7}†¯~i	#>•UY‡ÎO¯1+·±¢íÜmhmøwl—²±r3ù’*ZMu£J-×2«+àw¯éXÚ=ø²¿øÆÖ#·¡®¥æÜ¼rB*oi´Ôæ4Xù!.¤òdP8«“x›MS¹dG$ðA¦j:&›w!’kT2cïTŸ®:Õô\r>&`‹:–º æ[µ©Þ³y«HÖ¶1‘p[§ëZz^›ž¥Üï¸q†víì(Ý(\0P½\0íXú–º¡Ž\'Üþ¹àPík›ÔÖÕu¤µÉ‰‡˜zœôÎÃ\'Ú\'¬g¥brY˜æº\r.Ø¥²³/Îy5|±¹µ8sJÖÐÐ‰1Î*ÄkÎi#\\u©¥sßœîh‘G4ð¤sšãÖ‡{å­„“R*‘×Ä žy©GJmrÞ—ŒœÓ^b¸\n¹4AÆ:Ó‘xÏz®¢”´$RHÏJRØ¤ã¼{PÕ†&sM&”œ\na;…	Ônsõ¦ŸZq# ÓŠi1ÉíQ±ãš•‡µÍEµÐ£}d“Ær:×1w¢2’È2}+²nx¨ÈÚ*¯aJïTyìÖ²DpÑj©S»ÅzöÈV±.´eùŠg9éëMI1kk3™ÀïH¥jÉ¥Èœí8¨\r“Žpj–£[Iãæšç¥Nð8\' Ô.¸àÓZ“ÖÃ\nˆž}©çô¨›Š}9aV¯J†ÏÖ¶´ë<‚Àâ–·%½Lò‡Å7šê$ÒÓgò¬ÉôÒ‡(ßR•ú˜çŠjkGCÐŸ¥Ve ãR¿a$ÖãXúSE;¥Q¾£ô©Å&›†ßíN9Ï5MÛaAhÀ`Rh\0ƒšBNjwaØô¤-Æ)3Ç½&8Í¸®(#¡4êo¸)ÅGAìHª¥Âá²8¬Ôr¦ä$ãkF6›BŒç­8ž)7‚¹Æ)ÐA%Ô¢8ÆI©æobíö¹	ÞÜ\"ô¡¦èW÷ò~î\"8.Ü]ž‡¥ÅgdªÑ)ä–+É9­eHíP¯¸döÅmçcŸ›[Ý¯…Ä‰\'/éŠËÕcK™`\\ü½2k±+æ1\\m^qž#Í¨´˜\0²ŽŸSTâïrý”ÔyÌŸ=ÉÛš˜M´üÍ“TÏµ(<óÚ„ï°­wf^3’½x¤YKáwbª‡8)CsœóQ\'ÛpP4c`:äÔÞ`Q•ª1ÌÝ\0©Ë¨æâ‹\\‰UÉzÒ†9ÅU÷`J6ã½0•÷%fÆ1MmÀ‚08àšW”¹=\0Z¦\'kh88Ç&¢ž$š2f”ãu¤\r·­&ÚNàŸ6Æ\\6.6ž™ë[	sÈ°–ÁcŠ‚yV8‹g&³\"f’í9.ëJ2°5}Î¨EÁ§&Tô4&6®âjl¹­]R¶‚3ìÆj]2Ñ¯nIä\"ýãÒªK Æ=k£³EÒôŸ1þðS#SŒãúPÚJè-­‘¥Õ­’¬nê„ö«Ûƒ)ç¯¥y!Ô/5]T3d»œ\0:^—$ßf±ÜÍÊ€?\ZŸzÃi#spH ŠˆÉÚ£iþlf£i\0<uª[jÂ*È‘œŽCUË=jk4ÿ\0¬²“ÓéYm(5È¹ëY´›½öîéc¢“Äp†Ž@}ˆ5BëÅQF¸H\\Ÿr+\rÜ••y/ÍÁæ›we$»\Z·šåÕÚ’°zŠÈ{‡<7Z|-˜Ç½]°ÒäáäÉÏ4ž…èô\'Ð¬ÍÃ™œ|ªx÷5×Ä¸P1ŠŽÖ…\"€£ j5…sÎjGL#Èµ9ÅIÜrhÂö4à=)+=W}Gäv¤fçŽhåé@óZY%c;Ü’5}éç\0Tg§\0b¥ Ìå³éR‚:Ó2 ç½)*O4^ú‚¾Ã·‚qšBvœçŠ@ÔžÌvr}©€ãµ8·åMÏµ9>xîƒ=é…†p\0 ðzäzR0ÏJ„Úzê.ì\n‹4Ù*îì*æÞ»ˆÁô¢íl	»“3b¡Îhó\'­A#zU/1îÁ¤;¸lŠ‚\\c4ŽÃn¨$p&¦ÚÆÈËŽ™ª¯ŽI¥iWvê*õBqm”çNx¬Ë¨”c´äps“T®vš5¸l®dÈ1ÅBÜœU‰O4ZÃö›´M4O6…í>Å¤ÆWZêmaF dR[B±ÄÞ¬®=x¬ùîì8GQÔoñœ\n“ ±Åý©_[Ô[±B{UqÒ³gÓ×ošÞn[š®ëÎÅ4”c¸æµØå&µd$ö¨+§ž%`FP–Ø\0­^×BjÚ³!XfƒWžËŸj…­H9ê*»\"Ï¡XdwÍ)9ÆjP€dw£ªÒö&L„ŒŽ)£ô©\0Zˆð¼t¡Ø­„sN\'Ž1MÇÒŒàt¡	½Eõ4‡ƒƒÒ”r3F3ÉÐû²¯Í±ÿÙ');
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
INSERT INTO `rel_equipo_jugadores` VALUES (1,1,1);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-09 21:48:12
