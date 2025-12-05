-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: db_raquetclub
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer_reservation`
--

DROP TABLE IF EXISTS `customer_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_reservation` (
  `id_customer_reservation` int NOT NULL AUTO_INCREMENT,
  `id_customer` int NOT NULL,
  `id_reservation` int NOT NULL,
  `courts_id_court` int NOT NULL,
  `id_coach` int DEFAULT NULL,
  PRIMARY KEY (`id_customer_reservation`),
  UNIQUE KEY `id_customer_reservation_UNIQUE` (`id_customer_reservation`),
  KEY `fk_customer_reservation_customer_idx` (`id_customer`) /*!80000 INVISIBLE */,
  KEY `fk_customer_reservation_reservation1_idx` (`id_reservation`),
  KEY `fk_customer_reservation_courts1_idx` (`courts_id_court`),
  KEY `fk_customer_reservation_coach1_idx` (`id_coach`),
  CONSTRAINT `fk_customer_reservation_coach1` FOREIGN KEY (`id_coach`) REFERENCES `coach` (`id_coach`),
  CONSTRAINT `fk_customer_reservation_courts1` FOREIGN KEY (`courts_id_court`) REFERENCES `courts` (`id_court`),
  CONSTRAINT `fk_customer_reservation_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  CONSTRAINT `fk_customer_reservation_reservation1` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id_reservation`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reservation`
--

LOCK TABLES `customer_reservation` WRITE;
/*!40000 ALTER TABLE `customer_reservation` DISABLE KEYS */;
INSERT INTO `customer_reservation` VALUES (1,4,1,4,7),(2,10,2,2,4),(3,9,3,1,4),(4,27,4,3,1),(5,24,5,2,8),(6,28,6,4,7),(7,7,7,3,2),(8,1,8,3,5),(9,18,9,3,6),(10,7,10,3,8),(11,10,11,3,7),(12,18,12,3,7),(13,28,13,4,4),(14,23,14,2,5),(15,6,15,1,1),(16,5,16,3,8),(17,4,17,3,8),(18,17,18,3,1),(19,7,19,3,7),(20,27,20,2,3),(21,19,21,4,6),(22,13,22,2,1),(23,18,23,3,5),(24,5,24,2,8),(25,2,25,3,8),(26,2,26,3,6),(27,14,27,1,1),(28,21,28,1,7),(29,18,29,3,7),(30,21,30,4,2),(31,22,31,3,2),(32,16,32,3,6),(33,30,33,2,3),(34,17,34,1,5),(35,11,35,2,2),(36,22,36,4,5),(37,1,37,4,6),(38,23,38,1,1),(39,25,39,1,3),(40,1,40,2,3),(41,3,41,4,7),(42,18,42,1,2),(43,11,43,1,7),(44,28,44,3,3),(45,12,45,4,7),(46,18,46,1,7),(47,6,47,3,5),(48,23,48,3,5),(49,30,49,2,8),(50,28,50,2,4),(51,8,51,1,8),(52,26,52,1,2),(53,25,53,4,7),(54,22,54,1,1),(55,10,55,3,5),(56,21,56,1,1),(57,29,57,3,1),(58,4,58,4,2),(59,6,59,2,8),(60,2,60,3,2),(61,2,61,1,5),(62,5,62,3,1),(63,15,63,1,2),(64,24,64,4,6),(65,18,65,4,7),(66,6,66,3,8),(67,20,67,1,8),(68,10,68,3,1),(69,24,69,1,4),(70,24,70,2,7),(71,12,71,3,NULL),(72,4,72,1,NULL),(73,29,73,4,NULL),(74,7,74,2,NULL),(75,18,75,1,NULL),(76,21,76,3,NULL),(77,6,77,4,NULL),(78,9,78,2,NULL),(79,1,79,1,NULL),(80,27,80,3,NULL),(81,13,81,4,NULL),(82,22,82,2,NULL),(83,30,83,1,NULL),(84,10,84,4,NULL),(85,5,85,3,NULL),(86,8,86,1,NULL),(87,17,87,3,NULL),(88,24,88,2,NULL),(89,14,89,4,NULL),(90,3,90,1,NULL);
/*!40000 ALTER TABLE `customer_reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-04 12:35:43
