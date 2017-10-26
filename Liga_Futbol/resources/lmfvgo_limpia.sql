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
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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

-- Dump completed on 2017-10-26 13:46:33
