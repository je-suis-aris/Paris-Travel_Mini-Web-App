-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Accounts_data
-- ------------------------------------------------------
-- Server version    10.11.4-MariaDB-1~deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Accounts_data`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Accounts_data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `Accounts_data`;

--
-- Table structure for table `Infos`
--

DROP TABLE IF EXISTS `Infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Infos` (
  `Nom_de_famille` varchar(40) NOT NULL,
  `Prenom` varchar(40) NOT NULL,
  `Pays_origine` varchar(40) NOT NULL,
  `Adresse_email` varchar(40) NOT NULL,
  `Mot_passe` varchar(40) NOT NULL,
  `Saison` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Infos`
--

LOCK TABLES `Infos` WRITE;
/*!40000 ALTER TABLE `Infos` DISABLE KEYS */;
INSERT INTO `Infos` VALUES
('Aris','Ilie','Romania','aris@gmail.com','aris','Printemps-Ete'),
('Dubois','Marie','France','marie.dubois@email.fr','motdepasse123','Automne'),
('Schmidt','Hans','Germania','hschmidt@email.de','berlin2026','Hiver'),
('Rossi','Giulia','Italie','giulia.r@email.it','pizza456','Ete'),
('Smith','James','Royaume-Uni','jsmith@email.co.uk','london789','Printemps');
/*!40000 ALTER TABLE `Infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Accounts_data'
--

--
-- Dumping routines for database 'Accounts_data'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-05 20:38:29