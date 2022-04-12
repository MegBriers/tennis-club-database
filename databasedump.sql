-- MySQL dump 10.19  Distrib 10.3.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mrb21_cs3101_p2_db
-- ------------------------------------------------------
-- Server version	10.3.28-MariaDB

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
-- Table structure for table `court`
--

DROP TABLE IF EXISTS `court`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `court` (
  `number` int(11) NOT NULL,
  `venue_name` varchar(40) COLLATE utf8_bin NOT NULL,
  `surface` varchar(9) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`number`,`venue_name`),
  KEY `fk6` (`venue_name`),
  CONSTRAINT `fk6` FOREIGN KEY (`venue_name`) REFERENCES `venue` (`name`),
  CONSTRAINT `court_type` CHECK (`surface` in ('grass','clay','hardcourt'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `court`
--

LOCK TABLES `court` WRITE;
/*!40000 ALTER TABLE `court` DISABLE KEYS */;
INSERT INTO `court` VALUES (1,'East Sands Leisure Centre','hardcourt'),(1,'Forthill Lawn Tennis Club','clay'),(1,'University Sports Centre','hardcourt'),(1,'Waterstone Crook Sports Centre','grass'),(2,'East Sands Leisure Centre','hardcourt'),(2,'Forthill Lawn Tennis Club','clay'),(2,'University Sports Centre','hardcourt'),(2,'Waterstone Crook Sports Centre','grass'),(3,'University Sports Centre','hardcourt'),(3,'Waterstone Crook Sports Centre','hardcourt'),(4,'Waterstone Crook Sports Centre','hardcourt');
/*!40000 ALTER TABLE `court` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `played_match`
--

DROP TABLE IF EXISTS `played_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `played_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p1_email` varchar(50) COLLATE utf8_bin NOT NULL,
  `p2_email` varchar(50) COLLATE utf8_bin NOT NULL,
  `date_played` date NOT NULL,
  `court_number` int(11) NOT NULL,
  `venue_name` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1` (`p1_email`),
  KEY `fk2` (`p2_email`),
  KEY `fk3` (`court_number`),
  KEY `fk4` (`venue_name`),
  CONSTRAINT `fk1` FOREIGN KEY (`p1_email`) REFERENCES `player` (`email`),
  CONSTRAINT `fk2` FOREIGN KEY (`p2_email`) REFERENCES `player` (`email`),
  CONSTRAINT `fk3` FOREIGN KEY (`court_number`) REFERENCES `court` (`number`),
  CONSTRAINT `fk4` FOREIGN KEY (`venue_name`) REFERENCES `venue` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_match`
--

LOCK TABLES `played_match` WRITE;
/*!40000 ALTER TABLE `played_match` DISABLE KEYS */;
INSERT INTO `played_match` VALUES (1,'jwh@hotmail.co','tabitha.stacey@gmail.com','2018-04-05',1,'University Sports Centre'),(2,'louis.payne@gmail.com','final_fantasy_freak1993@hotmail.com','2018-04-11',3,'University Sports Centre'),(3,'jwh@hotmail.co','sylvia.hathaway@gmail.com','2018-04-17',1,'University Sports Centre'),(4,'louis.payne@gmail.com','jwh@hotmail.co','2018-05-07',3,'University Sports Centre'),(5,'tabitha.stacey@gmail.com','final_fantasy_freak1993@hotmail.com','2018-05-23',2,'Forthill Lawn Tennis Club'),(6,'sylvia.hathaway@gmail.com','tabitha.stacey@gmail.com','2018-05-25',2,'Waterstone Crook Sports Centre'),(7,'louis.payne@gmail.com','tabitha.stacey@gmail.com','2018-05-28',1,'University Sports Centre'),(8,'final_fantasy_freak1993@hotmail.com','sylvia.hathaway@gmail.com','2018-06-13',1,'University Sports Centre'),(9,'jwh@hotmail.co','final_fantasy_freak1993@hotmail.com','2018-06-21',1,'University Sports Centre'),(10,'sylvia.hathaway@gmail.com','louis.payne@gmail.com','2018-07-09',3,'University Sports Centre'),(11,'srrogers@yahoo.co.uk','tasha.marsden@gmail.com','2018-09-30',1,'Waterstone Crook Sports Centre'),(12,'gary_the_man@yahoo.co.uk','u_marsden@gmail.com','2018-10-28',2,'Forthill Lawn Tennis Club'),(13,'srrogers@yahoo.co.uk','u_marsden@gmail.com','2018-11-02',1,'Waterstone Crook Sports Centre'),(14,'gary_the_man@yahoo.co.uk','tasha.marsden@gmail.com','2018-11-04',4,'Waterstone Crook Sports Centre'),(15,'tasha.marsden@gmail.com','u_marsden@gmail.com','2018-11-06',2,'Forthill Lawn Tennis Club'),(16,'gary_the_man@yahoo.co.uk','srrogers@yahoo.co.uk','2018-11-09',2,'Waterstone Crook Sports Centre'),(17,'tabitha.stacey@gmail.com','butch@xyz.club','2019-04-11',1,'University Sports Centre'),(18,'butch@xyz.club','final_fantasy_freak1993@hotmail.com','2019-04-12',1,'University Sports Centre'),(19,'sylvia.hathaway@gmail.com','butch@xyz.club','2019-04-16',3,'University Sports Centre'),(20,'gary_the_man@yahoo.co.uk','tabitha.stacey@gmail.com','2019-04-19',1,'University Sports Centre'),(21,'jwh@hotmail.co','sylvia.hathaway@gmail.com','2019-04-24',2,'Waterstone Crook Sports Centre'),(22,'gary_the_man@yahoo.co.uk','final_fantasy_freak1993@hotmail.com','2019-04-30',2,'Waterstone Crook Sports Centre'),(23,'sylvia.hathaway@gmail.com','final_fantasy_freak1993@hotmail.com','2019-05-03',4,'Waterstone Crook Sports Centre'),(24,'tabitha.stacey@gmail.com','final_fantasy_freak1993@hotmail.com','2019-05-13',3,'University Sports Centre'),(25,'jwh@hotmail.co','final_fantasy_freak1993@hotmail.com','2019-05-21',3,'University Sports Centre'),(26,'gary_the_man@yahoo.co.uk','sylvia.hathaway@gmail.com','2019-06-06',4,'Waterstone Crook Sports Centre'),(27,'tabitha.stacey@gmail.com','sylvia.hathaway@gmail.com','2019-06-28',1,'University Sports Centre'),(28,'jwh@hotmail.co','tabitha.stacey@gmail.com','2019-07-15',2,'Waterstone Crook Sports Centre'),(29,'jwh@hotmail.co','gary_the_man@yahoo.co.uk','2019-07-17',1,'University Sports Centre'),(30,'jwh@hotmail.co','butch@xyz.club','2019-07-22',1,'University Sports Centre'),(31,'gary_the_man@yahoo.co.uk','butch@xyz.club','2019-07-26',1,'University Sports Centre'),(32,'tasha.marsden@gmail.com','u_marsden@gmail.com','2019-09-27',2,'Waterstone Crook Sports Centre'),(33,'srrogers@yahoo.co.uk','u_marsden@gmail.com','2019-09-29',2,'Waterstone Crook Sports Centre'),(34,'gary_the_man@yahoo.co.uk','tasha.marsden@gmail.com','2019-09-29',4,'Waterstone Crook Sports Centre'),(35,'srrogers@yahoo.co.uk','tasha.marsden@gmail.com','2019-10-02',1,'Forthill Lawn Tennis Club'),(36,'gary_the_man@yahoo.co.uk','srrogers@yahoo.co.uk','2019-10-09',1,'Waterstone Crook Sports Centre'),(37,'gary_the_man@yahoo.co.uk','u_marsden@gmail.com','2019-10-30',3,'University Sports Centre'),(38,'tabitha.stacey@gmail.com','butch@xyz.club','2020-05-05',1,'Waterstone Crook Sports Centre'),(39,'butch@xyz.club','sylvia.hathaway@gmail.com','2020-05-15',2,'Waterstone Crook Sports Centre'),(40,'gary_the_man@yahoo.co.uk','sylvia.hathaway@gmail.com','2020-05-26',1,'East Sands Leisure Centre'),(41,'tabitha.stacey@gmail.com','sylvia.hathaway@gmail.com','2020-05-28',1,'East Sands Leisure Centre'),(42,'tabitha.stacey@gmail.com','gary_the_man@yahoo.co.uk','2020-07-03',2,'East Sands Leisure Centre'),(43,'butch@xyz.club','gary_the_man@yahoo.co.uk','2020-07-06',3,'University Sports Centre'),(44,'tasha.marsden@gmail.com','u_marsden@gmail.com','2020-10-02',1,'Waterstone Crook Sports Centre'),(45,'gary_the_man@yahoo.co.uk','tasha.marsden@gmail.com','2020-10-09',2,'Waterstone Crook Sports Centre'),(46,'gary_the_man@yahoo.co.uk','u_marsden@gmail.com','2020-11-05',1,'Forthill Lawn Tennis Club');
/*!40000 ALTER TABLE `played_match` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mrb21`@`%`*/ /*!50003 TRIGGER match_date_check
BEFORE INSERT ON played_match
FOR EACH ROW
BEGIN
IF DATEDIFF(NEW.date_played, CURDATE()) > 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid date!';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `played_set`
--

DROP TABLE IF EXISTS `played_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `played_set` (
  `match_id` int(11) NOT NULL,
  `set_number` int(11) NOT NULL,
  `p1_games_won` int(11) NOT NULL,
  `p2_games_won` int(11) NOT NULL,
  PRIMARY KEY (`match_id`,`set_number`),
  CONSTRAINT `played_set_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `played_match` (`id`),
  CONSTRAINT `valid_sets` CHECK (`p1_games_won` = 6 and `p2_games_won` <= 4 or `p1_games_won` = 7 and (`p2_games_won` = 5 or `p2_games_won` = 6) or `p2_games_won` = 6 and `p1_games_won` <= 4 or `p2_games_won` = 7 and (`p1_games_won` = 5 or `p1_games_won` = 6)),
  CONSTRAINT `valid_set_numbers` CHECK (`set_number` in (1,2,3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `played_set`
--

LOCK TABLES `played_set` WRITE;
/*!40000 ALTER TABLE `played_set` DISABLE KEYS */;
INSERT INTO `played_set` VALUES (1,1,7,6),(1,2,1,6),(1,3,6,3),(2,1,6,4),(2,2,6,0),(3,1,2,6),(3,2,7,6),(3,3,6,0),(4,1,0,6),(4,2,6,7),(5,1,6,4),(5,2,3,6),(5,3,3,6),(6,1,3,6),(6,2,1,6),(7,1,6,4),(7,2,2,6),(7,3,5,7),(8,1,5,7),(8,2,0,6),(9,1,6,0),(9,2,6,3),(10,1,6,0),(10,2,6,7),(10,3,5,7),(11,1,6,7),(11,2,2,6),(12,1,0,6),(12,2,6,3),(12,3,3,6),(13,1,7,5),(13,2,6,3),(14,1,6,4),(14,2,6,7),(14,3,6,2),(15,1,3,6),(15,2,0,6),(16,1,0,6),(16,2,6,1),(16,3,3,6),(17,1,4,6),(17,2,6,3),(17,3,4,6),(18,1,6,7),(18,2,6,4),(18,3,6,1),(19,1,0,6),(19,2,0,6),(20,1,7,5),(20,2,6,4),(21,1,0,6),(21,2,1,6),(22,1,5,7),(22,2,6,0),(22,3,6,2),(23,1,5,7),(23,2,7,5),(23,3,7,5),(24,1,6,7),(24,2,6,1),(24,3,4,6),(25,1,6,7),(25,2,0,6),(26,1,6,4),(26,2,3,6),(26,3,6,3),(27,1,4,6),(27,2,3,6),(28,1,2,6),(28,2,4,6),(29,1,6,3),(29,2,3,6),(29,3,6,4),(30,1,6,3),(30,2,2,6),(30,3,6,7),(31,1,3,6),(31,2,2,6),(32,1,6,2),(32,2,6,4),(33,1,6,4),(33,2,5,7),(33,3,0,6),(34,1,4,6),(34,2,6,4),(34,3,5,7),(35,1,6,0),(35,2,0,6),(35,3,4,6),(36,1,6,0),(36,2,1,6),(36,3,7,6),(37,1,6,4),(37,2,6,2),(38,1,4,6),(38,2,2,6),(39,1,6,4),(39,2,5,7),(39,3,6,7),(40,1,6,0),(40,2,6,3),(41,1,6,4),(41,2,6,4),(42,1,3,6),(42,2,7,6),(42,3,6,0),(43,1,7,6),(43,2,6,7),(43,3,4,6),(44,1,6,2),(44,2,6,7),(44,3,4,6),(45,1,7,6),(45,2,7,6),(46,1,6,4),(46,2,6,7),(46,3,6,3);
/*!40000 ALTER TABLE `played_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `forename` varchar(20) COLLATE utf8_bin NOT NULL,
  `middlenames` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `surname` varchar(30) COLLATE utf8_bin NOT NULL,
  `date_of_birth` date NOT NULL,
  `elo` int(11) DEFAULT 1000,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `email_at` CHECK (`email` regexp '^(.+)@(.+)$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES ('butch@xyz.club','Jamie','Eugene Korey','Butcher','1985-09-21',1000),('final_fantasy_freak1993@hotmail.com','Kirsten','Aileen Louise','Jackman','1993-10-28',1000),('gary_the_man@yahoo.co.uk','Gary','Carl','Marsden','1985-10-12',1000),('jwh@hotmail.co','Jeremy','Wardell','Huddleston','1991-02-13',1000),('leighton.buzzard@gmail.com','Leighton','Alan','Buzzard','1980-05-17',1000),('louis.payne@gmail.com','Louis','Kennard','Payne','2000-05-31',1000),('mad_maddy@gmail.com','Madeleine',NULL,'Daubney','1991-03-08',1000),('srrogers@yahoo.co.uk','Sue','Rosemary','Rogers','1965-07-30',1000),('sylvia.hathaway@gmail.com','Sylvia','Loraine','Hathaway','2004-01-02',1000),('tabitha.stacey@gmail.com','Tabitha',NULL,'Stacey','2005-09-10',1000),('tasha.marsden@gmail.com','Natasha','Joy Bernardette Louise','Marsden','1993-10-28',1000),('u_marsden@gmail.com','Ulysses',NULL,'Marsden','1977-05-07',1000);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mrb21`@`%`*/ /*!50003 TRIGGER date_check BEFORE INSERT ON player FOR EACH ROW BEGIN IF DATEDIFF(NEW.date_of_birth, CURDATE()) > -1826 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid date!'; END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`mrb21`@`%`*/ /*!50003 TRIGGER null_middle_names
BEFORE INSERT ON player
FOR EACH ROW
BEGIN
IF CHAR_LENGTH(NEW.middlenames) = 0 THEN
SET NEW.middlenames = NULL;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `player_phone`
--

DROP TABLE IF EXISTS `player_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_phone` (
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `phone_number` char(11) COLLATE utf8_bin NOT NULL,
  `phone_type` varchar(6) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`email`,`phone_number`),
  CONSTRAINT `fk` FOREIGN KEY (`email`) REFERENCES `player` (`email`),
  CONSTRAINT `limited` CHECK (`phone_type` in ('work','mobile','home')),
  CONSTRAINT `numbers` CHECK (`phone_number` regexp '^[0-9]+$'),
  CONSTRAINT `numberlen` CHECK (char_length(`phone_number`) = 11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_phone`
--

LOCK TABLES `player_phone` WRITE;
/*!40000 ALTER TABLE `player_phone` DISABLE KEYS */;
INSERT INTO `player_phone` VALUES ('butch@xyz.club','07969438448','mobile'),('final_fantasy_freak1993@hotmail.com','07700900909','mobile'),('gary_the_man@yahoo.co.uk','01514960777','home'),('jwh@hotmail.co','01314960470','home'),('leighton.buzzard@gmail.com','01174960714','home'),('leighton.buzzard@gmail.com','01314960962','work'),('louis.payne@gmail.com','07700900654','mobile'),('mad_maddy@gmail.com','01154960961','work'),('mad_maddy@gmail.com','02079460501','home'),('srrogers@yahoo.co.uk','07700900949','mobile'),('sylvia.hathaway@gmail.com','07700900939','mobile'),('tabitha.stacey@gmail.com','07837585417','mobile'),('tasha.marsden@gmail.com','07889344229','mobile'),('u_marsden@gmail.com','01314960745','home');
/*!40000 ALTER TABLE `player_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue` (
  `name` varchar(40) COLLATE utf8_bin NOT NULL,
  `address` varchar(50) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES ('East Sands Leisure Centre','2 St Mary St, St Andrews KY16 8LH'),('Forthill Lawn Tennis Club','20 Forthill Road, Broughty Ferry, Dundee DD5 3SR'),('University Sports Centre','9 St Leonard\'s Rd, St Andrews, KY16 9DY'),('Waterstone Crook Sports Centre','69 Kirk Rd, Newport-on-Tay DD6 8HY');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_contact_details`
--

DROP TABLE IF EXISTS `view_contact_details`;
/*!50001 DROP VIEW IF EXISTS `view_contact_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_contact_details` (
  `name` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `numbers` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_grass_courts`
--

DROP TABLE IF EXISTS `view_grass_courts`;
/*!50001 DROP VIEW IF EXISTS `view_grass_courts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_grass_courts` (
  `number` tinyint NOT NULL,
  `venue_name` tinyint NOT NULL,
  `address` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_win_count`
--

DROP TABLE IF EXISTS `view_win_count`;
/*!50001 DROP VIEW IF EXISTS `view_win_count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_win_count` (
  `email` tinyint NOT NULL,
  `elo` tinyint NOT NULL,
  `count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'mrb21_cs3101_p2_db'
--
/*!50003 DROP FUNCTION IF EXISTS `is_winner_cur` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mrb21`@`%` FUNCTION `is_winner_cur`(matchid int) RETURNS int(11)
    DETERMINISTIC
BEGIN
DECLARE set3p1 int;
DECLARE set3p2 int;
DECLARE set2p1 int;
DECLARE set2p2 int;
DECLARE test int;
DECLARE winner int;

SET test = (SELECT match_id from played_set where match_id = matchid and set_number = 3);

IF test is NULL then
  SET set2p1 = (SELECT p1_games_won from played_set where match_id = matchid and set_number = 2);
  SET set2p2 = (SELECT p2_games_won from played_set where match_id = matchid and set_number = 2);
  set winner = winner_of_set(set2p1, set2p2);
else
  SET set3p1 = (SELECT p1_games_won from played_set where match_id = matchid and set_number = 3);
  SET set3p2 = (SELECT p2_games_won from played_set where match_id = matchid and set_number = 3);
  set winner = winner_of_set(set3p1, set3p2);
end if;

return winner;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `name_from_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_bin */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mrb21`@`%` FUNCTION `name_from_email`(cur_email varchar(50)) RETURNS varchar(70) CHARSET utf8 COLLATE utf8_bin
    DETERMINISTIC
BEGIN
DECLARE first varchar(20);
DECLARE middle varchar(30);
DECLARE last varchar(30);
DECLARE together varchar(80);
SET first = (SELECT forename from player where email=cur_email);
SET middle = (SELECT middlenames from player where email=cur_email);
SET last = (SELECT surname from player where email=cur_email);
SET together = CONCAT_WS(' ', first, middle, last);
RETURN together;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `set_condition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mrb21`@`%` FUNCTION `set_condition`(winner INT, loser INT) RETURNS tinyint(1)
    DETERMINISTIC
begin if (winner = 6 and loser <=4) or (winner = 7 and (loser = 5 or loser = 6)) then return true; else return false; end if; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `winner_of_set` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mrb21`@`%` FUNCTION `winner_of_set`(p1 int, p2 int) RETURNS int(11)
    DETERMINISTIC
BEGIN if p1 > p2 then return 1; else return 2; end if; end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `win_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mrb21`@`%` FUNCTION `win_count`(email varchar(50)) RETURNS int(11)
    DETERMINISTIC
BEGIN  DECLARE countz INT;  SET countz = (select count(distinct(played_match.id)) from played_match where (email=played_match.p1_email and is_winner_cur(played_match.id) = 1) or (email=played_match.p2_email and is_winner_cur (played_match.id) = 2));  return countz; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_add_match` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`mrb21`@`%` PROCEDURE `proc_add_match`(in p1email varchar(50), in p2email varchar(50), in date date, in venue varchar(30), in court_no int, in set1p1 int, in set1p2 int, in set2p1 int, in set2p2 int, in set3p1 int, in set3p2 int)
BEGIN DECLARE id int; DECLARE p1elo int; DECLARE p2elo int; DECLARE c int; DECLARE winner int;  
INSERT INTO played_match (p1_email, p2_email, date_played, venue_name, court_number) VALUES(p1email, p2email, date, venue, court_no); 
SET id = (SELECT LAST_INSERT_ID()); 
INSERT INTO played_set (match_id, set_number, p1_games_won, p2_games_won) VALUES (id, 1, set1p1, set1p2);  
INSERT INTO played_set (match_id, set_number, p1_games_won, p2_games_won) VALUES (id, 2, set2p1, set2p2);  
INSERT INTO played_set (match_id, set_number, p1_games_won, p2_games_won) VALUES (id, 3, set3p1, set3p2);   
SET p1elo = (SELECT elo from player where player.email = p1email);  
SET p2elo = (SELECT elo from player where player.email = p2email); 
IF set3p1 = NULL then set winner = winner_of_set(set2p1, set2p2); 
else set winner = winner_of_set(set3p1, set3p2); end if; 
if winner = 1 then set c = 40 * (1 - (1/(1+POWER(10,(p2elo-p1elo)/400)))); update player set elo = elo + c where player.email=p1email; update player set elo = elo - c where player.email = p2email; 
else set c = 40 * (1 - (1/(1+POWER(10,(p1elo-p2elo)/400)))); update player set elo = elo + c where player.email = p2email; update player set elo = elo - c where player.email = p1email; end if; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_contact_details`
--

/*!50001 DROP TABLE IF EXISTS `view_contact_details`*/;
/*!50001 DROP VIEW IF EXISTS `view_contact_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mrb21`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_contact_details` AS select concat_ws(' ',`player`.`forename`,`player`.`middlenames`,`player`.`surname`) AS `name`,`player`.`email` AS `email`,group_concat(`player_phone`.`phone_number` separator ',') AS `numbers` from (`player` join `player_phone` on(`player`.`email` = `player_phone`.`email`)) where `player`.`email` = `player_phone`.`email` group by `player`.`email` order by `player`.`surname`,concat_ws(' ',`player`.`forename`,`player`.`middlenames`,`player`.`surname`),`player`.`email` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_grass_courts`
--

/*!50001 DROP TABLE IF EXISTS `view_grass_courts`*/;
/*!50001 DROP VIEW IF EXISTS `view_grass_courts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mrb21`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_grass_courts` AS select `court`.`number` AS `number`,`court`.`venue_name` AS `venue_name`,`venue`.`address` AS `address` from (`court` join `venue`) where `court`.`surface` = 'grass' and `venue`.`name` = `court`.`venue_name` order by `court`.`venue_name`,`court`.`number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_win_count`
--

/*!50001 DROP TABLE IF EXISTS `view_win_count`*/;
/*!50001 DROP VIEW IF EXISTS `view_win_count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mrb21`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_win_count` AS (select `player`.`email` AS `email`,`player`.`elo` AS `elo`,`win_count`(`player`.`email`) AS `count` from `player` order by `player`.`elo` desc,`player`.`email`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-11 11:10:52
