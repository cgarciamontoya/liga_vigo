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
INSERT INTO `jugadores` VALUES (1,'CARLOS','GARCIA','MONTOYA','1983-11-15','VILLA GONZALEZ ORTEGA','2017-10-07','����\0JFIF\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0��\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�Ѳ1�朋�\n�#�5�c4�x݂GcR�n�\r�ʂ�x�B���қ�r)U����M�X��u�H��b����4HKrI�҃��CQ]�5��1��;�Jn��ҙ�����\'f��O�)I�N\"�\'� 9�Top�r��ʝ�pEF�֗�Ƴi7�Q��z�����<�� dS~bs����I�Xs\'\'�n���g�\ZV9�)�vwC0�<u�`8>���d��)-�h�a�ov�2��A9�\0��J�G\'�E�J�8�Rt�Ԁ�����o����NW��@�O�.*�Ƀl\n�}�(NƐۚUf<Si��6�D�}��qޑO��j��� 1Ou�<`Sn��1������@�z��ޕڍ�+| ��n���J��r�T�I\"���8��Z-�C�I����5���\"@\0�*ʮz����52��Uz`T�@(�h�I��n�zS��▘����)�<���k��$+$���ν��f�e=m��x���K����j❝�n�\"3^:��ێk�����#�N*���no��\'r����m�qW-V�u{�f�Wղ�梶_�U�U�ۻ9ى4�/?#��?�qv��d���Z��\Z�0>m����pЉc\0\'��]=%v$(_�����*8�O�\0:p=*�&1Qdk)]���bٽp�r�G���w\Z���y�U�:�I�JhW[3O��_�s�p?�{*���g��g�������gQ��5Vjī�8��=i�f�iu��H@�Nc�4����R�A�!X�\'\'��/{�zSh5\'ݧy����!��])�ip8�?֣\'&�@LsMU,�\rI����bRy�\ZcM�$朡�h旛�m��HTg9�9�1�(���&�%y��\Z`\'ޛB��2�B\r606u�09����-[��\nw�8f����^�ޜ��e��d˔��L\0�)sJ��sښ�*�����t������p��ۭ? t�ӊ����˖�z���PO�VW9�Ի�����ci�\\�\\��O��\0j�6��&NM	��ӳ�a���$p*\0ǵ.X6���I=B͓$sM������h%��ړ��9��4�?J�7�J�*n������dt��뚈0ی~��J7�����ϭ0��<�������f(w�H	^3�@w��2h�L9V��py�3��X���sI��a��qJ�Lt�`b��j$�J{\Z3����җi<��$䎜Q��fs�is��N2Qco�\0I����I0m1����i挌��`�g��S�sQ�����].��\'��*��R��kȽ�ؔQ+��{\n�U�co:��vn���N���Z`��\rR%��Zx���O(�4����`!�\\��?�o�^K�{&��f@>PF3^�:�	��W�x2�m5;�u%v���5pvM��JgKh}@*��{�U�8��Hϖ?(�*��7�5�����v�Z�|J\0�_jD(��+C�˺21��m���j����TN����4�{��cB���+宆U�Vd�mc�Z��i�s��m��$��q΀�I�⻭P��98�\\w���q�����l��<�ط�6�\"��8\\zW�i���v��\0�U�u��>^�3�������Z���@�Llm���4�)���7JZk�f��1�$�E)=)	41��>��rsHǧ��q@\0�1��\\s����y4��ZR����5�̼�	�ⓞ���h��$�O��#\0sAu#t�I \0���Z�J�ޚylӸ\0y��\"F�J1���YF)n;����zS��aޓ9���64�4V���Ɠq��Ӻ�<�2{❆\' u�?�H���w��*O�B������Ҳ��I1���z�ǭJ1��5���1^;U��\'bc���9�U�qN�i\'����X��8��GJh>����*ț�.�����jb14�<q�vJ���y=\0�\'=j<�d�v�\0��J��ww�I��o�����ߚrZ��\\P�)�L�@�sց�~����2�<R�I��h��H>��f��E.I�I�����e�ɠ�>��8�RN}���i�S��iA��)�T���.Nzԃ�L��N�u$S֕O8�x�ĆI�Niu&�Kf��U��\'�WWoCE\0U>�[��=kMA5=J�\"�S�3Q �Vv��؛���E5EH�������)s@��\n��m��\npu�R�ܸ�S���4V�ܾ��~u�Ҍ����^\'�ʫs{.C���������\\�3D�:=i�f,jk!��Vm�j֑�p3��t~�;�r8*Ҋ�.Mr��S�<�M0)ݫc��9�l�y�:�LHg���k\'Vx��.��Ǌ�|M)yR%9*2\Z��p�v1/�L��<zV#Ǻb\0�l��V�)9TmԫQ4Ϊ�*\Z�f�|���^����a�SBp>pZ�H�Q��s��������Y�1��&8░�i��9�G�MH���!��ъv�	�m�Z	�(#qS	9��s�4�4����z`<���9�d����h\rư<~t�q�;$�7��,d�SI�Ґ{���i��s��7��Iy�	�f���)`*7a�qM۠����Bv�֞��\"3�M�4&�\r1˞��犯2�\ZQZ�v<��=(g�ښNq�O$dP�4�hB���Ɣ�;\rԻ�=�7g�JrM0j.�$ �0Eޚ����RsUЙ+=0��i���i���P\rO*z�#��:S��Qc�HOL\Zw�ɷrif�-�Un:U8���r\\�+�x�oЭ��J�%����zR��\r�����\nM!�� l�4܎��˜T݊QH�\' \ny�Ң_�/S�hR��{��ȥ\r�j�\r�n)��۠��y4��$\Z�9�\Zp89������q�Ҕ�oP�֋�=�3J)���J�v$�8���d��c���ֳ�-\r�ːvɮ��\0\n�4+X�5�XE=sQ 犰�GA[A����9��jQLC��E0Τ�i@�JAN�	��K�Aҗ�1��oM��W��#.�;($t��׸ʤ��zW�i��l� �\0}sU���l~e�`�z~5��ۭ��ƽ��/� ��z��򮻁ޮ�5*�8�Tq�_�Z2�	�HE0��\"����;�\0����ɓ=kWZ�3Nc�N+\0�Yɳ��,����$T���5��g�}x����m\0v����JI�Cί��{���k�m��<~�A�+�5����A��5{-�c��Y��M��u\'Ҕ���4�⳾��R18������:Q�Fx4��T`�O~�y������)�S>��h���Ҟ�T|�FH�v\r7�\"���ǥ4|���}��\"��M\'�4�$4z�N��4�	\r ���Mc��Q��sK�\rj#\0H�I�&�9)��`#�f��pF(}�Dq�W�Jz{S\"����Ke`wDy��!\0I�Jx8l\n�����	�L�1��i��Z�r�H<�f��h�j�ԟҌ�u�d� �Ki�V�~㎦�3��H#�`���bq�����A8l��%~z����O]B2�Q�	=(�ޓ9RGj3�OZz��\\��s�SI\'����O�I=\nj(Te�@�ja S����V�AwmP���8�O8��CJA�Xv�@�H�9I�4_�6vd�������q��p=�L���Z�M܎��� TX=ȧ�T��OD�\Zp$ja`��B���X�yZp!�\r��R��RN�\r؛��,(�H�9&��n8��K�G�0���6١g�±�w��3QFe;R�W\'�x��k�S����,z��R�4(�H�P2zԂ�*E�!qR0i�j7;�&�K�!�s�׏鬿�P��1=>��װ?C�x����[���8���-z��m�9�Hu=k�PIV��\\�s�>���*b����\n�8\nqFc��*����[���}j��,HY�\0�SP�k��\'�J�;#Zp�3ܴ�Kw�Gc�qVb���1�5�x��P�n����4����jTy���Ir����[h�Ԭ�Dp���5����R;�c0x�_7�#�-�g�	eiܳ��$��5���8DB�zV���s��sQ��UhdH�rd�L�~��L%��B{���W�;��AD�#�½(�$X�aT`AX7Ц�\ZF8��Hc��s�1JFqH�4\04ӌ\Z}Dz�bZܥ�A`N#cm-V��=�ޜǦ)�3�i����R�\0&A8���I�i3C}�CM����\'S�@9�9�4��}D�A��-��M-ϵ4�i65qs��ZFn��s�S_v�\'�:�s��Of��@��:Ҳ{�|dw���;����vA<SO�0 ܞ��f^qR�\0�E2�\\�SE�Q����R��4�é�}�:�f�ok�)u�(���\0f��Ք�Гs	�\r0����h}����(<�S����!��O����+��J�\00Fi��lv��@�qڞ�p�-	<���J	\0\r;\'�zT������� 9��\0}�݃�I�=w&-K�T!���O\r��b��ՅԔ)�f�,)C�F��}�&H�8��!��]�#�\Z�4&�sK�p{��iFZMj.muy�NGZf@�RO9ℷ);l;<�)�=�4��b�<�`g�[jf��e���/\0�����j����WP�Sw!�8�1�r*�j:V��N�\Z�1S\'Z��$�5 �0}*Aҋ>��x�N�J=E<\nh�:��J(�����#�v�^_�E�S�r���ӓ^������]��&@p%�G>��U����M��\Zn�e��S��J��Q��~��\rB�c$̼�浏s)\'r�N3J�d���֋�2dn��y��/��rT�:q�Q��j�e�Z��o&#�܊͐Aej�7R*\"�7J�S�,t_6��#�!���\0�y���+�f|��b_����\0���gԻ��F���[.����1Z������\\����E3Wo�]�n.��k���o�&������+�E��\n��x>�F�I ܞ���[:f�k��,Ьj=;����rlcpqK�Ҏ�ђ��@/ZkR�4�ҝ�2i��9���M�<�1�M=I�z�s�8��ʕ���@���O� �������d���d��{��v�E��X|�����y�8��W\0y<S[��:G�\r���#S��֎��J�q��Zd���x���@\\�������u4��b��f��;j]��]%4�끊սh4���Rx5l&i�.\0��1֖��G��P\n�)��4\'\"�6�\Z�� a�u�q�F�py)�TOû	:�T�2H5�� 9=i�nے�c���OZ�8�7=j]�����I�֓?6j=ۻѓ�C��@�ބ��t�9<�j�ӷs�S��E;��├S{\Z�JN��]G��ޛ�`Ӊ��i\\/��sN�x�J� \n7	&Lq�;v\rG���9�L4%�2;����\n������j䣑N�:Ty��wI�й\0�Gch�&�=�?K��_��V�k�R��bd���\0Uxצj��/{��О!����j4*`:SOP&AS(�F�T�U\\��֞)�9��.G�R�qQ�II)��8��֖���!\r~��ڼ-�(�i�W�c^����93���#�~v���\\Ŵ$7�h+1a��V�-ǵhF���,j2I8�C�C���D����{��,g�+5ߧ���ڱ|A�,�қ�i��/��w��$��kU#�Sr&����n���V�G<����%��=��Cm$�p�jh^��nR(��C�\n�M�v\Z!m�2����ML�a߱�xg�0Xl���p9	�k�T����+-B�W�N)M �zQ�S���0sK���\\1��4�)��v��i�1Q�A����X	�x�8	Jq�!#m\0&qޚ���Zu!x�F�%!�FN9�C}�\rjL��A�9�\Z\\nF\r7�)�g֣݃�Qa������ny�)ߨ��x�E9H��&��y��4`�H�m9�N^i ��c[����WҔ�#� l���{��A�\0U~��Se�	��d\'҅�ƺ���R�_���P�`���i�4�Oz�\0�ڜO`x�o]J������L��Lv����P��D��@4g�S2ZA֝��ֈ�w�H����is�B��&���:�ƀ�\Zi9\\R(�\r�-�=�R��L��(1J�@�!$��Mǎi��J3����\rwc��)s�F	�J]ǭ7���d��M*�9&�\rNRv)�I��֗�^��Б:S�sң:R����g�2��_��� $p*��o3�\rtVЬJ�Dݞ��KРA���v j�C=*�K��E�d�b0;ո��W�t&��ɪ^`ބȼ{T�ڣN�2u��&QR-1G�H:���R\nb���F(�֤ũ1I������9zЀQ�A�=ih�a�y֩6��@r[�*�{	��Gz�kY��P��������{\Z�j�	�SM���ݮoeT�}{���\r���}Q��A��t@yosY���s�\\o���Q�G�2�O��U�8�؞�Wt�nN�(�V�\Z�|-�y�FK���[g�s�������)u��g�]�\Z��QB���\0�T�T�ӭ��a�B4�O֬�3R�\"�z�Nh�lt���Py4�&{R�JsM9�\0�#�\'����h�	JzRR�@Ɯ��!֜x�H9��aNI�����=:�g�^ƚ�N�X�<��Ǒ�S���P�A<�HO\0S��sM�� �\n������\rJO�9�/A�\'<�[4���4�a�JB{b��◽�ޘ�($u4�ϵޒZ�Fc�(��W�+����MBf\n��{\n�L,lފN?\nϊFH�Y;��)+=�&�k�gsc��1ҩZ_�1��W	��\"���� A�sA\'�9�s�4��k{!T���$������ڦ��k�XP���x�H<SZ�[ؐN݁��d58�Q�\"��<7(�MG�u�N�n�^㕓�z����qFy�Q\\�0zQ��L��KҚ��q[M	�)ǥC�Oz����}��qGZ`f�)����u�Lrӻ�5\Z�Ӿ�tK����NE$��+N��i0�F�)��`�$sZ��Z�GXv�\n��oD&��n%��B*�jx�F9�X��D��n:�5��V�a���	TqR���5*/ӹ$�R(�z�dT�L*�S֚�)Ԁ�F)☴�\0Q֝�Mi�4\0zR�A�CG8�#󖮭&�t3�L�~f��=A����wi.��	��v,�z�zUE�:���o5���G����#�Q^���\0YhQENG2��Z�V�}��mH�t��h�)7q�qA�.p(�9�#s�4�����5%\r>���\'��\nBy���a4Ѕ�z	�7 �@\nr)�x�SX|�4�sF>QMS���+��i���=�4�h`2^}iޔ��~4��҅��#�M$R�=)�vx�b7JLzP�*i��zS\0�֘��O�6f�q�\Z���Zpv;Tj~g_CR��ږ�S��IHJh�M;���X \0I��̧#�89�LԖ�#�\"2GQU^�ȻI�j��G�$�SҮ	jD�ѐ��QZnq����]v���`�;UI$b�#�NI&8��\Z�,1��x��֝�5+k\Z�P:RKS=H����M6�Q;����\'CM\0����u�s&?~)Kg�Fy�J��[������J�ƣ�v�6�ĶI4d�M���4��$�)I�L\\u��x7)�L�������;u;}�)�5cҖ��(�)�5?.jX� \\Q��i�a�$�Á[1�R(�J6�j�Y8=+;��6�,Ľ:ք nN\"�#ނz��~�i�W�F=��c��i-�Bx��VTT(0F*S��H�*��ך�h[	�b��4�0*T�׊p��)��S��;�\0.x�q@�a@�z�x��K�Hi�	�Rb�ҔR@�-�&G<Pb�3�*���\Z}����FI4���C$ʀ�`\0��;�~\"6��R�a���|_��+�n�,1��R�<Ǩ���J���`��`\'�y�/M�m�C4�p@�?Z�.��\'$���\\����z����y�����SV��.���Y��;W8>��^c/ ���>Q#ڭ� 莣|����oY�z}�^m��R\'�n��I�iVfC�8>��&;X�YdV\0��C�W��x�W�uho�!�C�nk�����ꗖ�;����.V;���<�Gj��u�=R�g��X1�?J�����;���)��:�zPSJ\Z��4(�@��i<�g�#-�b���L`�wz`�v��q{TR.Xz����|m\'<�M��\ZO͊La�(9���=�8�(�c�Q�V�Zci�)1ɧ���\Z���FW���O�}h4���\0��l�\r��Z����d�T��&�\r�9�Fs�!�c�4�#�W\Z<�[�@	�8�r8�;�;�B،Ii4�9�\0|��IwWB.�֜Fy�)\0�i2I�]����ǃ��H�!$u�[��:�5\'��GO�&��ZZ@hϭ;�9;dӔ��>�����lK�3J\rE�zS���1Hx8�J�s�S7�Ҁ�һ���\n��QZ��yi���Z�g�a��+J8��;N|R{h\'�OV��(銊8��hkȭq�X��)t�v[�Q\08��u��nN�q[1me� ���-4�.D��Z�sUa�[�P��,Ơ���CN�2�P�d�S �^�2t��W$*E�����!��ӇZh�R��N��֖�t��P��K�(G4ӌ҃�i9�M�8�s�6��b�(�&H����h��W�9*g�j�O��VzE��s&��c�My/��XuiBA�$@`���x��W��\'�~�/E�q�,N�kD����)cɨ�@��d�y���sN���H0i\'�\Z���{Tc,w\ZRI�i���j�å\'�I搷<RC&�A!�Z��(�i��~�sa2���� �^��\ZE���^b;�>R:H?ƼQ[��v��Ki�H���r��A�}����f���S��+\Z���q�o!��pz��I�\"��v�6�d����M\rB�����i��\'�/jJ�sQg��\r��4�m\0u����08�I�8�.C�lb�{\Zb}�����}G��6�I����ք�Й�O���)pOJ��C�A��I�J{�jL�S�+�H�QNُ#�K��>���\"oJM�=�^TsCd�i����+����e.����I�C+�	���\n�����A�AsۓFi��M�`�����)T��c���A\'&���L[&�I�A�9❞��ڎ���r\r\"�c��sK�\nz���&�3L\Z3�S��z(\'�)���\'\'���I�H�+�)4�W}�s��l��$p*��`քj�Rm�:���J�Gː8�H�8b��?,�q�+���F�K}���ڻ����z}*��W3�oC/S��\r*��D��d`c�q�m��_�\'��N1�u0�H�;p�p�ȿ��?ҸkV#f)M�\'n�=F�c��1�m��Ej�$��S;W��ڹi�}��ҷ��R�I��`��ğ��vF��n՛�j�U��^��i���Ƚ�Z���(3�TåF�(����08��ԫO�D�ԃ�i��S��J�a�O��2i���	.y�JM/@�ө(�b���ii\r0A֝�1�`���umV�I�{��x\0�X�\n�����<���G@+w⎣#kIi������ؿz�+K�j%ąܑP�9��\0�4�v��f9�4��*3�з���B�\0 ��Q�i��i�MPS����	��÷Q�4��4��d��9����\r�j����j�v7̓����z��\'�$F�2�_6��5{_�u5���Q3~�݌d{``ҕ�H�;Sq�K�Ґ������F)	�A�� =j7?0��#\"����Hb����`H�Q���y�&L�g��S�mCޗ��C�$1eE)<�Mɥ�3ֆ����>sO,��R3L��Jd�\'�0��6�`r\n�b�#\"�Bo��I�F�ӎ❐�q��qJ	�23�;���n;3 g�c�\'�Oֵ���`J�v>��Yˡ0q��#uVW�;y��V\"�\'<Ѹ\n�K��=_\'�M��dђ\r4ɓ�P���5nÆOzU��3�sJy��A�k1�QҘ8�85/��&n�֢�}h\r�Z\Z���r]��H�5\\6jղ�٧k!�P�ӓV����@�q�[�m����-6m��UoF�Wk��5�:e�i�\Z��c�v��8A�1�)�����ں1�|�t�t3�? \rr���\\�1Z�6�y�,m\\���R����f1����I�_^f��G5֥$��\0b� \0(���z��Oj\"��c\nĉ;�j�Г(9�f<\\����K�m���bI?�tя��|?�.�c�������i�ΓԳ��g���Bd^������sR�&��{�x���N)sM��~b���4���t�4�җ>�SHx�F*:��֑�(��Et�me9�N}8�;�%�H�|I;#��\\����W�%k��dv$����J���k���Y-KsN�)�Jܴ�����m��I�4Qm2@CQ�{� �P�x�SZ\n͔��9��1ڮ2�Tl���\Z(�r��J�|�)v�N�&�Ah�R�:�\ZOPDey��1O�4b���f�)���4	��]��]C���Z��n���\r�֎�|�v�kt��>�2Z�}�ZBA☒\\���w�k;w�\0�\'ڛ���K�f���o�\03La�)�b擽5>�i{�%��K.��#\0[�J٤Nq�Lpہ�(4j�\re$�ڎ=�(-�Q��mB�E!�晐2�\")��XrM\'�ka�F�\njU�z���;��Z3�h\'4��46	�/z�!lՀܓ����J�׵b���\"�nk\n�thJԝ��H��i;�G�I�B�GzN�N����\"���6��T����5~��[�;���>�w$���V6�&IF��;�]t�Ѹ�b{Կgld�Qma��Z7Pc`iU�K��;����5}���!N�*�x&�m�\nŨ��t�UĖ)*&�\"�\\�}�\n��OZ��>D��$\"��SL��g�[=���W2( �Wx���0+���������R��O���b�\'�)Ϯ)u��WFq4;�Ad�cl9?������g�`I\\1H��O����vp�e���	ns���)�Q�`Z�w�b�R9�dv���1W�Y_b�6@�U4��.�^�`8��d�>+���Ѩ�~��}k:�|����MqacS\n�!�J\r-�ī�S�sQ�Z�u��%�N��z�:Ӗ��O�;�1M8Q����Ҝ90�riU��zӔ���\Z^��x��&��u�j�WG�e�!�j���_���wQ|��o�HgϬ2�n�0XUr잵r�|µ���V�\Z��Gc-�8_��Զ�6�n}��>d�%;~�T$�7�v2�4����@�\Zû�/n+��J��$`�\\�G>��dF�8�*&f�pNj\0qR���Wp<b��}��99�b�t���z����Ӻ��7>���@���y��@�QJP�iW�HE\n���9��|�����&&{߅oΥ�+���^���ҶI\"���Wg�焟�S�~#5�)IY�?�4����i3�N�b;�x���q�D�j�oA-ƃ����O�($Qԭ\'�5�\'�\r�qCP!��G�M7\'�F23O�B�ǵ\'F8�8�݌�\n��քq���GPHoJ\"�bz�^��^{t��8<Ԏ�\0)��^G���T5�M�W�Z\\���9$╱�5W+���]�u\\�c5��sS�u��A��y8��*N���{Ps�h4���}�)psGCS[Fe�G,����	�4��r��S�׺��:��\\�+�8�ym����+;x��iQE{�3�~_ˊ�ݻ�M�G��{Hlp\nH�\0����\0*��P�k0b�@\'޶<B�̷�<d�����wQ���u �Vb�$��N�4�<�湙�K1F�3]�����@�)B)�=J�Dވ�N�p�g>�_�3��1����0�9����v!I��(F7f�FW��Z+���/c�b���0o[V�Z�(�%�G�kՍ�j�s�����i�[�Ep�n��A&����ˣ(#� ��幬gh�ʚ�����?Z�p��\rp�IjS/����a癧,dl��52vz\Z�*���f�y�(��<�����]���Q��˺z`t�G�d���\',���*��J��I��\"�I��vQ��yc+;���);G���?CNДɩہ�AU�.f\0V���v�n9�l����і\"O�͞�h>A�h�qTm�\n0j�p{Ԥ�9/bh�L*$����Z�c��R��*A֎����<pi��t�/��S��R�J�H	#�x����`>�:�Rdb�1�f�\r�q�_xWR�\0�&�:sX�*��\Z��q4�0�fׇ^C�\r\\�C�=kY�];�ː\roZ�!�X��MW���p��f�}M\'�o�j�$�`G��kP�\r׌qTg�2g-Td����Y)w+�pj��V�f�D�Qa߱9���i�h�܋܌�4�dT�w�[�I�6\'J3ڑ�b�g�\n�j���RC!4XW$�֢sV�\\��r�M@�=���B�јbXè� �\0�z�>���6~$���Ѹ���\\��R}�ٴ �W��֐6X�R��⡸$!ɩz\Z�pX�p(���y`w�HH�G��c�)a�:�ZC�i>��9�4��\0�)��{R��Zk��������1��\"�qM$��C41RT�s�c�4}�v��4�C�)\\��TI�S���#ca�\'����8�\"����i����֜@�4�!ߩ��ㇺc�Pq�Y	2}i���;�1��s�j���h�+��槶���ê�\"����wN�N(������^#�������&w�1��r?��V���8��?�U�N�n�� �sUz�r�ܛ����/�?ְ���h�2l�#?N?�g�l���A�x�:�N\r�Қy<�[�m���Z^����H��x�\r6����GJBGr(&�����.I�d��GJ_�>^�~�n$b�8)�=qJ	&�����0GZD��J��i21T�[I�J��6K o�K��U5��0X�ʭ��x�:4�҄\0����қ�Z��g�[}ʼ�*���F*��5��XN80�P\'�N��M�8T�Ң�Q�M��sRD��*@x�����\"��Tk���@:��L�HH4\\f�4�E.hI��\r�Ԇ�{��Z��������~�Y�/�-F�Y���h;��Z�VkH����ڄb��~y���#<Uc\0 �J�Or����E#DF��@Փ���O�5P}j@qޕ�؜�94g#���4�\r�3�y=)�r*,P�؜�6dS���L@J��J�\Zx�9��,c����x���R�c�S]��h.b�\\0?C��?�I��2��ׄ��z��ŀ�CԞ^��(r[J]Ğ��x+\\:��Rf�͹����]6�i5m�1�&�$})�二���j	-ۚBؐc�\r���m�0��;T{�b=)��f��ƍX�aw����FA����\0�z1˖\\v��H�+���N�܉����h=�����s�:�A&!l�*�I^٩�0>�ܕ��J]���L�6�\0�}jM��4�@mئ�,:�;=�>z`I��qK���&����Y�\ZA����ޕyjb�B�5wN�����V^���F~�Ӿ�h�/����[�̲ϭi\\0����iI�o�D��U5ILVS�<!{�Z�Yy��w��N�@�$�&��뚞g\n��Rx�kG�Q�d7�A �����lt�ʷ���KL��у�CZn;���<���ɧpEN��p\'Rd���I����F�JM�Q�*S\r���SyޜNh\'�K\'m�����CË��s�dջ�\"I�P�M7�\n݂�Q#X>������t�+�Ⲋ�R�2��_z�jQ���9z��9NM=��pjE5�ҝH�)���ޣ�wz@?9��Q�vc��.qQӎqF�.{W1���H.�m��(h�n��td�W�x�cg⻶��<��}(�ҜT��~�K�V+��ԗ-�EM�/f���?�V�<\n���*1i4R��2Y#Q�O���泘;7=)�$íWy���L|j��N1T�!�x~jt5Xc����;���[9�\n���j	*R-�,��	9<R�Jo�;��R��l�jm��i�M�(21#���J�\rHiw�)��|�⦏�)4;�B�l�Ԥ�����b��)\"����7��\0m\\&~S\'���!��7�g\Z����,�(��\0�W�+d�rvz�	&SN��ޚH.E��<Б=Ct�I#��g�47$R\\T������\nfsR�\r3v:(�7���@4d���@�\Z6B~B����ҘH#��I>\\�����M��\0qM�sSV��T)�i����2i�t5 O�R(��a�Qϐ��4�Px�)�rh,��:��;i���pi3��Ts�)�Wr�(9�)�����h���&+w@��p�2\\���5�x>�˩�!��1��}��V���b�Gʨb�2�����֥̙sϵs�ԥ�\r�q#�;$r^�����c���9\'�t���&�>j5��v��h\'wAI�qJH\r֓w�/a\0��N�u4�����Ե���#��s�i��0�\n%��Vb��Fpy4�x�!��۰y�ϵ)lb���iz�i�`�c�)��JBM\0���WPlZI�J��˛�n�j����o~+S�I�&|v�j*hi��,�V�=3֪�2j��ZYLv��EJx�MwD��<�=��I��g�p��O��p�)�Ӂ�\\p$�p���sNv�:���jN)h�\n)OJnqK�Ѹ	�5�2B<Sv1Ձ��\n����O�q��j#��k�)�r�����\0��j�ry�6�o���a�sKfl���q��\\�Ǹ�)�\n��mɴu�����7&�6�&����N�]��t��@�Rh��U�-��ҧE��Pi�=&�Kv��@\"�cQ:-@����n7o۔+��m�J��z[H�h�p1�O�^����ho]�ަ.\r0\n�霚��Qpcx�#ғs��Dl<p(�AҀ)rh�<*�C�UU85j�J�A.��*�m�h]���d�Ee5��\r�ﾗ�\n����\0\n�b�Zm�a�җL�+�c��Rz�[Q�x���rI�7�<���f)>h��Zv@5b[چ�Q���I4`�Q	CF��Iy\rُ��)��47\"�#=-�&x��`\Z7\0��iO�{��6I>���Ҕ�	4͹94���G�Ȩ���9�D��8�� 6j��H���4|��*���Q���C�����S�sM#���孀8)�ɩ#P[�Av]��i�$��y�w�\n�۪䄍�~�W5an-�\'�c�+��t{\"����_���I���E3��9�wT�7d�P?������7{&��a�x�1[;��\'r��i��3M$��4�ލ�OQ��ߞ��׭�jL�K�,���1�Hq��u�&�1�c�$p\r!�G�I���h��R����R����3փۚOzwAȢ��\"�Bf��J@9�l�k艺Fv�rbk��R��g<���⹍T��=ɮ����,��R�?�c>��zhu�������&*�*RТt�)ÓQ)�W��LC�A���G�Z�zR���*1�zr�@8c4�L�648�P}��B�\0�Srh�`<zRi���� A�s�1��A���Ѓ]sTuh\rƝ4`d�#�)���%�6����Gҭ�q�\Z�ع�c�j�(��}N�;il�&lɨ��x�/�ww��\r뱩oama�E,}Ef��k���1�\0TwW�gZ���Y��ޤrY�Ul��rX�]6�k�TV?��-$t�7D}kVMDt�L��#�Ѿ�&8�V�m�y�7We�3Y�\n�g!�ަ�u9�=@iH�+�!C��u1�\Z�����\\S�Gz�&&*����C���c��? H}��\0����*D�.�~����\'Z�<l.5�`FvfC���\n�=J��,��A��B§l�1ҡgo0�:��,���O�RJ$`\0��#���h,1��B	ɨ���ҁ�����Mj4:NS���Q��\r+��zd� ��$���I��N8`i�\0PW�<��8�G3����?���4���^cNO�M�qK!;�ϭ!?0��;�����I\'����M�i�\'އv���,�zSAR8�P=i�����M1j����sGZ^���s�(<u��|&{�^���M����^l���>���\Z�F� W{���D�g��kͬ��q$���-�kT��#ܒ�ks�6��t�zv�rv.����ܞ\\�zk\nRv(�V�J]\n�@��4��i�I+]��h)nq�;�A�f�ΪI����<��\0�M�B��Ê͹�ܶ#��Թ#D���l��Z�W�pXb�ì�����9=�rX��^OJ�/PHT�Ƴ��#b\0n\rd�97\r�49v\Z�:��?\"��:��g8x��V_��ZqbK�.p:�L9��M4�V�}{��Չ3Ĺ�k���!ヒ?3\\�n�P{W�hH\"�-T�f�3XOSX-47c<U���UN~�aN*m��Ɇs�R���oZ�Kd\Z�5\"\Z�<S��zP�%R)�Q��(�=i��	�Ri}/^���9�HR�nsGZb9��H\r��^���ǭ.h�)0<��6���\0#.H���J��Qj:K���܍��W�[�	�tk�v2\0�P�1(wڼ\ZϞ|�4�\"����lϚ�g��w\Z��$�spq�F�ٳ�LU�\03�AlK� d�n��8�g4��]!�L�sJƣ<Q�2c�OSQ��<�rS&� �N���i���r�*q�B\rJ)1��s.zg�tԶ�~߂f� �A�^c���׮x=��#�!) {����L�Fݸc�}�bjp�曏��~�Jj�n�;l\\�O��7���犗���W\0��Ӿ���Q����l֢ߙ]�⇠R	 �9U��@���|���[�$=5��@��c�K�ъl�P�հi��rC@�wm�Q���+�9�@\0v-�I�W�ʷ�;��F��U�bK��r9c�p�1\' �L7�I.�1�ı��󰧇�TLO�ӭl���࣭8�M(�}��m����U�l	��$}k*�J+}F1W��=.6o�Y�+�&ڛbV�Q@��yS��@Z�M~�y��RN:`~��ms*�����3.��&��cx�����6�rd�!��pb���:-��jbpe$�r>���s�3Qv<�u&I��OJ���LW\nA<��*�m��҇��udA4�l�zW=y|��B�Ҭ��,�4\'�*���*fc�=�aR��֜/��gh��;��Wh<\Z��_�v沵\r,[��v�澬�SkC�*M4�q��PW\"��ކ�M�>��bq��4�p��@tz[�,y�k�V�$��k�00M\\mc9+������Fpi	��H��U�JV�Ř�>��Mӆ�h���?\n�(�Ԃ�2�רڍ�+;����뚘\Z�NL��ԭ\0�~�05�[S�ن䛳֤V�W�EI^h�L��:���)Xw1Fi(&����Tc�3� 4�4�����C�.y�n��	�����܊n{��λ�e# �+�5Cc�\\D�s�=3^�NG5�~8�1j��(�T����\0]����bg��g�M[���R�Nj�N��l�&{��\0�5;�@sT�������D/��@��F�-Gb�ח�䪆��=i21֔[��zѐ\r&�O�Lv3H>SHzӸ\"���W�Gzj�)i��Ԡ�֡Ӄ{�\Z���{?��h���1���^9m�uE,�G��^�d�g��!��I�Cܰ_\0��>������5;RP�ⓀB���v⑎NMZj��9�5a sޜp9����ޡ��A��L*	�2.EH�1P2��ީj��	I+�֙!,����)�%2x�+�\'�*�\nj,��1��\r\0�`\\Sd��\0:nx��iR:t�r�G\'�O[�vd͜\r��5�sNbTc�6C���C��E$����G9�!��خь�7�jM�b[X�S��Mۜc�*�JՍ�M`��Z���ril�;z⮭���5~������x��*���t�iqMq�G�{Vg��,&m����G��lZQ�>��k{F�<�yۡ��i�mgp���N�ڮF008�@�ڒ�AZ��m��y?t�S�^]�i3i/���U�0��\\�l�CY�ݭ��)�5�*�:sN��m�<ON�K9��Nk���$b���m>M�AQ�֔\Z�M�ݸ�ֹ����$���=��;W;�I�1�:_A\Z�F�P�T�~U���\Zq��ƾ�e%� �i��.eY\"8��M=,g4�t7*Ҁr=�͢��ު�l���\"�J�ӭ����O��I�I��)���.�\n���j�{\\N�]\Z?7Y�\'#~k����7���\0��Gd�\0*�h2s�a��ۡq\rL�f���J��r`ӳ�Q���J����O5�jE�ӰT�S-W��� a���knKH�Σ�.x�J����R���;wj7óK�h�(���L��N4�C����\'���*M�q�K��3�$�AT|��+�l����Z��J� b����[ܣ��EUvȩnF�U	��#K��c�iۀ��d�5l�-�7�\01I��h��e�j�����⫱;��ڂ����jSM�43\"�Z]���pؔt�� <SOZh/a��(4Ν�\rS���xV����9���W��q^�L��	#%\\�+���bh���B��;��;�N��׶�Qo�P��ڭ+�85,Z�ۆy���K��v�9❐yu�A4�@��b~��PM;�F	��v��\\/��n8�����l\nInz�Q���Brx�nnT�&���,��(�L�,�V\\(�H~�LqT۰�f��(����L?(�ԫ��S��3�N<��n�\0�R�{�����Cޕ��Q?��-�pe��upm��*q�~�����;P~�R$��z�U�>�V�����ۯ��5g@��Z�b��������^y8C;9\n���Oj�o�v-�\"�kɀ3H{�=�[��g̷-iz=�����K�5��\0qO�%q����k0��R\Z�jS�*��5Ɏ(+\\�e�:�&�#C��E���>�V�ɓX�!�dvLҰ5y�N����=���,�!���M5�I2�s��Sv�aV2����S�K��J�-拧9��o�3�mʟҦ�H�j��R�Q8F��1Rq�R3�To����k�v�H�̗������`����*݉���y��N@�\r�����|ַ1j�Sf200=�5,�uŪ��J�\0yy��te~g�\Z�vqn�Ւ3��W�J�@^d�]چ�E\'�W��s�±�<��`c�]��+��o�d1\0f�F��9��#4=�rڿ�8��P攞*u{��ц�jE5YڦS�>��m5&qP�O�<6N(�ǆ��M�(\r�I��!����ޣ\'4�x�m�baҁ�3w��N�Vi��Fr9R�n�;w4�ni�S���ڵ2)-I��X�&�Mx���/y��1��Y��[�Y��5���T��p�k��^��7�V�i��+�$8cZ&�In4�i�Mr)�ح�d��8��f��Rԥ�!rj6#4�sQ�M�Ar=(Jni����[��lFx4��$��-L��4�R�Ri��J4�.BJ�����jI�t�Q�����k�~��x%W�FF8�����F�n#��\rq���+��i]KF�nz���ct,�X�i��c�\Z�%��늲���Ǳ%`����\'�=A� BwH��U�R��ɟ�y��Y�b�cޚ.��֛�~���$�-]p�1�⤉Ѿ��5�v�r⧏Q�2\nJ�}�Yn�.�g��\0I4g98�pv~%��wޟ��[�\"�����~�V+[Cs �M���Q���`rOz]�$zRn�V��ܚO�)��qM8�K}�w�<\nk(*OZc��j_0�v���&ˠ��G\0��pf�q��H�F��G�	�SM#���wL�?\nZٗk7ҨZ�X��w滿\nxZk���o�Ū\r��Z7n=+�h���^���8WQ�]���(à����68�֛�/��up�=*�lͽGz~�*�q��5Y�7�d�l�ZK�3T��j�]:�z�i�L�/^�CS�eӮP�\Z6�U�`$��)�(�7`E7��\Zg��T��C���<�T�s�l^Y<SG(\'��coi������\0��{��3�e(\\&O�JInds�ht��I��!rA��P��S$���}�sOc�Zv-�(��\'a�.�xv٠�{q�X\Z|%�무��(���S���k�id�,.���ǺqTcrPSy�^x50�H{�����33c�خOWC	�ǐq].��>6��9Ƞ��[+�!�3s��ݏs���r�\ZR-�#�WQ|��ve�\"p��ޥS��J���H�+u\'�a^�\Z���I��q�:��S\'�VF⦌�9]�[F��B1��x�X�6)7S~tg\"���p\'5&�J�?-�u2bsK�f��ҁU���1ڒ�p;�3q@���L�3�J6\'�ɦ\\;m��Q}jS��1ж1��e$�S���0�-\nQ�E,`����z��7������Ev��B����q�\nVer�#�qQ�+J�ѡ��u�Y츭���L��x\"�\Z�7��qz�q�DÞ)婛���F4�@{�54(z8�s�8��Q��-�1N\r��\0��@���Fi��\nW��8�Y;UUCO\r�ZH���9&��Ҫ�p9❅}I̹����CK�J݁+�I�p)��0:\ZL�U���8b)��}�\0�Z2{R�Z,��Njt�oz���1R�`{��ڍ3��5鬜��<�?J쬵/P�-�Q�W�,�֍����,��qר�%��$�������@ɪ\Zf���<����q���jR{X�T��04���w�A`c\'�\'	���&8�B�c��iI\n�#59#4A�j]�|��5�\0���>H\0��[��W����\0���o�x���+2mẑpݸ����wz\Z�r\"u�w�9�X�^kC���U� c���CU}4\'U��>���9�����V�W̟�;��u� �=���oC*���΢K�[���qP�<�H������Ez�P�ww��Ⳍ3d�����4�2�^����7��WfHc��\0Z��V���W��fݵ��.�t�*ܕ�q���)��$��:�,��2(�Z���I���b�Wұ滹Яt�+Ŝ�sPI;6�A�ўh���7R�k#rj3ӊj�Cr?*^Bmlͻ8pGZ؊\'P�+#IC#��H�1���ш��8�V#�����nI˕\r��$�C��!,zv��h����ɬ�RѮb;d��@���6�	�u�3N�dnEAp�{�*�B�6H5,[�`���ֶ�Q��@�3��鞵���\0g#ڸ�NGZ��s#�S��ʺ;e9�O�+�r�7�a��iC��Ʌ�2�P2)(�Fڰb�z�,�z�]J���Edjz�<�\\o�{w��D\r�t�v��#�Z#֬�����\\B�\r��\n�H�?\Z��ߩ��Gr5�ǘ��ɩc֬�8��5R>�4��8a��G*�5&��u+I�q�q���\0�6����?�W���SI��4�/�w��Gh�h���M§V\r�.\n���!+V!�������	:o�s#�C���>\Z�����O�x�1x�P괔X6��5��bH�W$<Kz̱��*H�[��`/q�M;]��v/�|�j�֪�ǴU���Zlt�n���c�\'\\�jZ��M-4��j�m�9��Iݜ\'��D7{��8��똖������08�&�\'�B�1ZE����Ǎ��q�[v ��Ei~�r��\"��4z��1ZV!�\'9�JAV���Φ��(\"�Эp����)j2.i�S���c�^�џ��1W\"�8�S�I�p��u6��)����f��F2)0i�\r�ZRM ���1�}��\0w��L�<�p\rN�#�z��jTlc��2�?=�9+�2������%��H��==G�v��GuJ�9�6G\'�t\Z�b�ȑ���3���2GZI�c���6�*2w��҅�zRM!uy���L���=)�7�tZi�D�\'�SMY8��֧%�����lq��[}m��z˹wf銯���v�gklv���FBHH=��N��1Aך���<�+}���Dk\Z���[[�S����м־\\�|��+*K�/u�GV��vq��/ץ@.��6y5�TuBj���\r�\0�u��#��B��{���I�<�Yj�rŎv�床1Dz��$�2�sEE;�����i�3�9�+zm��=)�ټٔNrޕ��z.�܄0����_�k��V�\0\0}+���y��ǭvM�8�X�ڌh̑\0���T��+X���}�3����v�\\��\\\0\0�8��&I�yc����6`v���)G����0�ҥ��zTQ�Nf�t����y���GAZM��=傏qZ�Zjc*��Эk��\r���\0K>�3׷��+_[��m�U�<�Ul�V��\0@R}x��br�*��5����;0�R���f\\NK|��jtbI�\'8����\\�T�kQ!!p�ug���V���ܢlU!�Um3g����kec%�������y\n���\\g5�9ީ�ug\r�r\r�2�FU�El�9^�FT�1Y(Im&���.�1�zԊ�psQ����L/�i+�^�%/���N�j�l�J~��\nZl-�\nGJk6ޕ\n�\r)���щ�lK�~&�A�C�G=)��1S�݅k�J	^A�dl�����!�<���w�8����2���U�b�\\�R�f8���{��7̓?|�u�7��sN�0m����#cК�t�m�n��4�\r����/&��j汫-,�����)s�gUȧ+��z�i3�A\Z�cI5�Gz�HǽV�dt��[1�T�>��wd�!ܼ�5�L���5E��٦����ڜE�@�Ҩ2�⻻�7�B�+��t�l�*㎠���2q3q�k7j�e3���Ǳ�ҧ�JE&(��3HG1�M��u\"�i@9�q�ҁ���4�R2��zT�s҂A\0Z~)��8s��h���9��Jni{�Z��(iG4-���� �\\b�qU��{�	�F�Լ�ޕ�[^⩧�<���@��u��w\0����7�E X|��+Ҧ�VWq��X��H�ۥ&��Gy�_-Ղ1a�6}j��}���otcqA԰\'��\n*�gc��R��t����D.����]A�2\rqGR*�\\TgQ�����!�ڬ7\Za�$l�hc����Yq(��k~��.RIii��n�(��MR�����սp#(Ķ28��_�>��Nj���N�$wڋ:�T�B����FBx��rk-V��䔓|ů1��qp*dX-g���ATVm����;CME�R/��\\Һ-�`ޯʜb�{}��w�=�ݭ���>UnSK��;;ۙ.���vT$������tK�Q����-��R0kB+�y9�qY��B\'t�ΪkkGB>�h3�z�G���{㷵��tb�_Κ5u�Ft�Q4.�n3V�7�����-��%����Xg�����Ӹ��lX��:�����rO#�V��L�T�8��s�KCUJ6ס��$w��U��䌚��`[]��r����+Bِ*�T\n��\\��&���֨�~Km�E\r6��v���n/P}�8��O�\r&�$es �V/��D�v����Q�K�+-ʆe�9��q�q֔����c[��+E��/����B�(r����������#փ��i.f��Lv��jմ�FM�]���\0�������g��QĄ����\\y�9y����d{v�T��N��q�{lf\0��8������{{��M����!��e-��*u�M=L���EOuh�v\"�GbM���O��2\0��=��45���_ڝ�\'��*���BPq�i��A�A57��Bi)\"\r,��$��Tl� \n��4����S\'evTcvki�bc�=Mk.@�qS/�sM�ݝ�$�\'S��:��x��[�IҘ���c�����vQ1�j	�LO?Z��$�d*���&1���i��H�Cb�.�L�G�ҳ�]=o! �\Z�	Pʧ�8�������c�0 �Z�G���P�3<c�k��0��J���r��R\Zy�\r4��u��(��1H^�c�iq�Ӏ���QN�FrqJ��a:P\r&0y�q@�]�&i��֗�\0sB��q�ӹ���w�E%�L��OzF=頽��8��A��ӽ����&��ޚ9�\'=)����874��z�3��C�9����zhJ���5\Z�)��);����\'j	$��s�9�|�縢�w�b%8��=��3�l��Z���4�-��a��ܚ�&�<��ågB�\\zT7{��J�6���N>�ߩ-��\\���q0���D�F&���֝��C�0Ӑs@\'<��p1ɮ���m6}��1�>��{3&�elfh|�Jb�s��ǵn��G,��\r�ǅ=�����Ġ�Dk\Z2z�?�b}�������:�ZZl{�����I^̉+FĐ�$�L�8�*94���cm���~(p\0<T����5��YΪI\\�\'K�r����)S�\0�We$Q䏥c�薷h�r��8?�b��r�Q�r�O\'�S&�|����Q��Z�F���t�^�W쳐8�Ը5���WH�ڜ�\'���ݸ�U��q���S�1IF�m�fYiه&�����*XQ��T��-���D������a&U��z���Ec�ZX#��G��<~U�hڔ�n���) �\'�������!8���+H���vtw�����S�w�֑H�z�Iٰ0j�~��kX�lb�Ƴqҳ5v������1�N\0�+Y\r��9��/m����#�җ��\n����[�9������-+�ӝ�q�N[�Mg�Mq(H�,�rz\nێ��N���1����D�ӆ��&��ۊ�z,0ʩ*����@�Z�:m����v�>3��u�V��i-�\0�	���oK�/5)T�s�<����n�W3�5i%&c�&�tm-��Vh�\\�qW4�N�KzBD9#ַn.��Bi�Zo����{+u2ߡ��h���(�\\9\0����6��ڕ�nx(%Wk�h�i��f�q!��ҩ��I��xڼ3g���胚�ab�܀�v�Nk��0��\0�����d����\"����;)F��ɇ�J@F)��Q{��qS$�I��fqK�(�2@h$u4�\n1�v3�A,Ozn��Իr8���1\'؃����=sS��ӁO�wԋr�ԧ ���6<�z�[�	!p�+��tϳO�1�n~��$qY������R��=4t�4Ц���� rv����U�+DN�G�@�?i\'�q�(�7�H�\09�u�I647�Na�M?z�nQ�ޓ\'�=�i��OV=�[#�z��\'֥��4��>���H4�rq�1��-f>n���ˎsNn�\nLf���O4�=)I P	\"�»H9�FH4g4\Z���}Xg4�B�f���\0�Ɓ���)[�k�n\0���Ȩ���>��w����E�*̇r�2y�;�qKS����2:�ɹ��4��\\g&��F�K�*N�N���L���]��wv�K��z���J�Js֒��ȫV�q�����;V��FD��p�X�\n�k��`�c޴Rx��mT\\p0)�xCn&�ŹJ���.GlB��nOQV#��ơH��Y_kf\'q9������ޕ��VS�l�{��ơ7��g���LL��)��g(^ښ\"�pNx����A�㎔����Զ�%G���n5Zkt|�銏q�&$Z{�h�T�t̛����͸^�����n�Ձ{���z\ZrH�i�R_�l��+H��xx~+���l�ޤ��9%+#A2(5����=+>I�S���u�zX�K�R�T�U��8��Q)�Jf�j�ܔ�/�7�52�ۊ���[�\n)�=�_�K��#0q&9*\r\'�7}��~i	#>�UY��O�1+�����mhm�wl���r3��*ZMu�J-�2�+�w��X�=�������#�����ܼrB*oi���4X�!.��dP8��x�MS�dG$�A�j:&�w!�kT2c�T��:��\r>&`��:����[��޳y�Hֶ1�p[��Zz^�����q�v��(�(\0P�\0�X������\'����P�k����u���ɉ��z����\'�\'�g��brY��\r.إ��/�y5|���8sJ��Љ1�*�k�i#\\u��sߜ�h�G4�s��և{孄�R*��� �y�GJmr�ޗ���^b�\n�4A�:ӑx�z����$RH�JRؤ��{PՆ&sM&��\na;�	�ns���Zq#�ӊi1��Q�㚕���E�У}d��r:�1w�2��2}+�nx���*�aJ�Ty�ֲDpѐj�S��z��V�.�e��g9��MI1kk3���H�jɥȜ�8�\r��pj��[I���N�8\' �.���Z���\n��}������}9aV�J��ֶ��<��▷%�L��7��$��g�����(�R����jkGCП�Ve �R�a$��X�SE;�Q�����&����N9�5M�aAh�`Rh\0��BNjwa���-�)3ǽ&8���(#�4�o�)�GA�H����8��r��$�kF6�B��8�)7���)�A%Ԣ8�I��ob���	��\"����W��~�\"8.�]����gd��)��+�9�eH�P��d��m�c��[ݯ���\'/遊��cK�`\\��2k�+�1\\m^q�#�ͨ��\0���ST��r���y̟=�ۚ�M��͓Tϵ(<�ڄﰭwf^3��x�YK�wb��8)Cs��Q\'�pP4c`:���`Q��1��\0�˨���\\�U�z҆9�U��`J6�0��%f�1Mm��08��W��=\0Z�\'kh88�&��$�2f��u�\r��&�N��6�\\6.6���[	sȰ��c��yV8�g&�\"f��9.�J2�5}ΨE���&T�4&6��jl���]R��3��j]2ѯnI�\"��ҪK �=k��E���1��S#�S���P�J�-���խ��n���ۃ)篥y!�/5]T3d��\0:^�$�f���ʀ?\Z�z�i#spH ���ڣi�lf�i\0<u�[j�*ȑ��CU�=jk4�\0������Ym(5ȹ�Y������c���p��@}�5B��QF�H\\�r+\r���y/���we$�\Z����ڒ��z��{�<7Z|-�ǽ]�ҍ�����4����\'Ь�Ù�|�x�5�ĸP1����\"���j5�s�jGL#ȵ9�I�rh��4�=)+=W}G�v�f�h��@�ZY%c;ܒ5}��\0Tg�\0b�����R�:�2��)*O4^���÷�q�Bv��@���vr}���8��Mϵ9>�x�=酆p\0��z�zR0�J��z�.�\n�4�*��*�޻�����l	��3b����h�\'�A#zU/1���;�l��\\c4��n�$p&����ˎ����I�iWv�*�Bqm��Nx�˨�c��ps�T�v�5�l�d�1�BܜU�O4Z�����M4O6��>Ť�WZ�maF�dR[B���ެ�=x����8GQ�o�\n� ����_[�[�B{Uqҳg��o��n[�����4�c����&�d$��+��%`FP��\0�^�Bjڳ!Xf�W�˟j��H9�*�\"ϡXdw�)9�jP�dw����&L���)����\0�Z��t�ح�sN\'�1M�Ҍ�t�	�E�4���Ҕr3F3�����ͱ��');
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
