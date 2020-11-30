-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: football_api
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'England','2020-10-20 06:07:55','2020-10-20 06:07:55'),(2,'Italy','2020-10-20 06:08:00','2020-10-20 06:08:00'),(3,'Spain','2020-10-20 06:08:04','2020-10-20 06:08:04'),(4,'Germany','2020-10-20 06:08:08','2020-10-20 06:08:08'),(5,'France','2020-10-20 06:08:13','2020-10-20 06:08:13');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assists_on_seasons`
--

DROP TABLE IF EXISTS `assists_on_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assists_on_seasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `season_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `assists_created` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `season_id` (`season_id`),
  CONSTRAINT `assists_on_seasons_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `assists_on_seasons_ibfk_2` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assists_on_seasons`
--

LOCK TABLES `assists_on_seasons` WRITE;
/*!40000 ALTER TABLE `assists_on_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `assists_on_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `coaches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `image_url_fr_internet` varchar(300) DEFAULT NULL,
  `image_url_fr_server` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `appointed` date DEFAULT NULL,
  `contract_until` date DEFAULT NULL,
  `team_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `coaches_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitions`
--

DROP TABLE IF EXISTS `competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `competitions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `logo_url` varchar(100) DEFAULT NULL,
  `area_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `area_id` (`area_id`),
  CONSTRAINT `competitions_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitions`
--

LOCK TABLES `competitions` WRITE;
/*!40000 ALTER TABLE `competitions` DISABLE KEYS */;
INSERT INTO `competitions` VALUES (1,'Premier League',NULL,1,'2020-10-20 06:17:25','2020-10-20 06:17:25'),(2,'Serie A',NULL,2,'2020-10-20 06:19:00','2020-10-20 06:19:00'),(3,'La Liga',NULL,3,'2020-10-20 06:19:10','2020-10-20 06:19:10'),(4,'Bundesliga',NULL,4,'2020-10-20 06:19:18','2020-10-20 06:19:18'),(5,'Ligue 1',NULL,5,'2020-10-20 06:19:53','2020-10-20 06:19:53');
/*!40000 ALTER TABLE `competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals_on_matches`
--

DROP TABLE IF EXISTS `goals_on_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goals_on_matches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `match_stats_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `minutes` tinyint(3) unsigned NOT NULL,
  `status_team` char(8) NOT NULL,
  `status_goals` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `match_stats_id` (`match_stats_id`),
  CONSTRAINT `goals_on_matches_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `goals_on_matches_ibfk_2` FOREIGN KEY (`match_stats_id`) REFERENCES `match_stats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals_on_matches`
--

LOCK TABLES `goals_on_matches` WRITE;
/*!40000 ALTER TABLE `goals_on_matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `goals_on_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals_on_seasons`
--

DROP TABLE IF EXISTS `goals_on_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `goals_on_seasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `season_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `goals_scored` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `season_id` (`season_id`),
  CONSTRAINT `goals_on_seasons_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `goals_on_seasons_ibfk_2` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals_on_seasons`
--

LOCK TABLES `goals_on_seasons` WRITE;
/*!40000 ALTER TABLE `goals_on_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `goals_on_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_stats`
--

DROP TABLE IF EXISTS `match_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `match_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` int(10) unsigned NOT NULL,
  `home_team_shots` tinyint(3) unsigned NOT NULL,
  `away_team_shots` tinyint(3) unsigned NOT NULL,
  `home_team_shots_on_target` tinyint(3) unsigned NOT NULL,
  `away_team_shots_on_target` tinyint(3) unsigned NOT NULL,
  `home_team_possession` tinyint(3) unsigned NOT NULL,
  `away_team_possession` tinyint(3) unsigned NOT NULL,
  `home_team_passes` smallint(5) unsigned NOT NULL,
  `away_team_passes` smallint(5) unsigned NOT NULL,
  `home_team_pass_accuracy` tinyint(3) unsigned NOT NULL,
  `away_team_pass_accuracy` tinyint(3) unsigned NOT NULL,
  `home_team_fouls` tinyint(3) unsigned NOT NULL,
  `away_team_fouls` tinyint(3) unsigned NOT NULL,
  `home_team_yellow_cards` tinyint(3) unsigned NOT NULL,
  `away_team_yellow_cards` tinyint(3) unsigned NOT NULL,
  `home_team_offsides` tinyint(3) unsigned NOT NULL,
  `away_team_offsides` tinyint(3) unsigned NOT NULL,
  `home_team_corners` tinyint(3) unsigned NOT NULL,
  `away_team_corners` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `match_stats_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_stats`
--

LOCK TABLES `match_stats` WRITE;
/*!40000 ALTER TABLE `match_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `match_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `matches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `season_id` int(10) unsigned NOT NULL,
  `time_date` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `matchday` tinyint(3) unsigned DEFAULT NULL,
  `home_team_id` int(10) unsigned NOT NULL,
  `away_team_id` int(10) unsigned NOT NULL,
  `score_home_team_half_time` tinyint(3) unsigned DEFAULT NULL,
  `score_away_team_half_time` tinyint(3) unsigned DEFAULT NULL,
  `score_home_team_full_time` tinyint(3) unsigned DEFAULT NULL,
  `score_away_team_full_time` tinyint(3) unsigned DEFAULT NULL,
  `stadium` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `season_id` (`season_id`),
  KEY `home_team_id` (`home_team_id`),
  KEY `away_team_id` (`away_team_id`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`away_team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `players` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image_url_fr_internet` varchar(300) DEFAULT NULL,
  `image_url_fr_server` varchar(150) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
  `height` decimal(3,2) unsigned DEFAULT NULL,
  `prefer_position_id` int(10) unsigned NOT NULL,
  `position_id` int(10) unsigned DEFAULT NULL,
  `team_id` int(10) unsigned NOT NULL,
  `shirt_number` char(2) DEFAULT NULL,
  `rating` tinyint(3) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `prefer_position_id` (`prefer_position_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `players_ibfk_2` FOREIGN KEY (`prefer_position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `players_ibfk_3` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(4) NOT NULL,
  `details` varchar(50) NOT NULL,
  `position_class_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `position_class_id` (`position_class_id`),
  CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`position_class_id`) REFERENCES `positions_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'GK','Goalkeeper',1,'2020-11-04 15:08:30','2020-11-04 15:08:30'),(2,'LB','Left Back',2,'2020-11-04 15:08:50','2020-11-04 15:08:50'),(3,'CB','Center Back',2,'2020-11-04 15:09:01','2020-11-04 15:09:01'),(4,'RB','Right Back',2,'2020-11-04 15:09:09','2020-11-04 15:09:09'),(5,'LWB','Left Wing Back',2,'2020-11-04 15:17:40','2020-11-04 15:17:40'),(6,'RWB','Right Wing Back',2,'2020-11-04 15:18:09','2020-11-04 15:18:09'),(7,'SW','Sweeper',2,'2020-11-04 15:18:19','2020-11-04 15:18:19'),(8,'CDM','Center Defensive Midfielder',3,'2020-11-04 15:19:34','2020-11-04 15:19:34'),(9,'LM','Left Midfielder',3,'2020-11-04 15:19:48','2020-11-04 15:19:48'),(10,'CM','Center Midfielder',3,'2020-11-04 15:20:15','2020-11-04 15:20:15'),(11,'RM','Right Midfielder',3,'2020-11-04 15:20:24','2020-11-04 15:20:24'),(12,'CAM','Center Attacking Midfielder',3,'2020-11-04 15:21:23','2020-11-04 15:21:23'),(13,'LW','Left Wing',4,'2020-11-04 15:23:54','2020-11-04 15:23:54'),(14,'RW','Right Wing',4,'2020-11-04 15:24:03','2020-11-04 15:24:03'),(15,'LF','Left Forward',4,'2020-11-04 15:24:13','2020-11-04 15:24:13'),(16,'CF','Center Forward',4,'2020-11-04 15:24:21','2020-11-04 15:24:21'),(17,'RF','Right Forward',4,'2020-11-04 15:24:29','2020-11-04 15:24:29'),(18,'ST','Striker',4,'2020-11-04 15:24:40','2020-11-04 15:24:40');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_class`
--

DROP TABLE IF EXISTS `positions_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_class`
--

LOCK TABLES `positions_class` WRITE;
/*!40000 ALTER TABLE `positions_class` DISABLE KEYS */;
INSERT INTO `positions_class` VALUES (1,'GOALKEEPER','2020-11-04 15:05:30','2020-11-04 15:05:30'),(2,'DEFENDER','2020-11-04 15:05:38','2020-11-04 15:05:38'),(3,'MIDFIELDER','2020-11-04 15:05:48','2020-11-04 15:05:48'),(4,'FORWARD','2020-11-04 15:05:54','2020-11-04 15:05:54');
/*!40000 ALTER TABLE `positions_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `red_cards_on_matches`
--

DROP TABLE IF EXISTS `red_cards_on_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `red_cards_on_matches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `match_stats_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `status_team` char(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `match_stats_id` (`match_stats_id`),
  CONSTRAINT `red_cards_on_matches_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `red_cards_on_matches_ibfk_2` FOREIGN KEY (`match_stats_id`) REFERENCES `match_stats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `red_cards_on_matches`
--

LOCK TABLES `red_cards_on_matches` WRITE;
/*!40000 ALTER TABLE `red_cards_on_matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `red_cards_on_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `red_cards_on_seasons`
--

DROP TABLE IF EXISTS `red_cards_on_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `red_cards_on_seasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `season_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `red_cards_obtained` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `season_id` (`season_id`),
  CONSTRAINT `red_cards_on_seasons_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `red_cards_on_seasons_ibfk_2` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `red_cards_on_seasons`
--

LOCK TABLES `red_cards_on_seasons` WRITE;
/*!40000 ALTER TABLE `red_cards_on_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `red_cards_on_seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `year` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `current_matchday` tinyint(3) unsigned DEFAULT NULL,
  `number_of_matches` smallint(5) unsigned NOT NULL,
  `winner_team_id` int(10) unsigned DEFAULT NULL,
  `competition_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `competition_id` (`competition_id`),
  KEY `winner_team_id` (`winner_team_id`),
  CONSTRAINT `seasons_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`),
  CONSTRAINT `seasons_ibfk_2` FOREIGN KEY (`winner_team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,'2020/2021','2020-09-12','2021-05-23',5,380,NULL,1,'2020-10-20 09:50:36','2020-10-24 15:45:27'),(2,'2020/2021','2020-09-19','2021-05-23',4,380,NULL,2,'2020-10-20 09:52:03','2020-10-24 15:45:35'),(3,'2020/2021','2020-09-12','2021-05-23',6,380,NULL,3,'2020-10-20 09:52:32','2020-10-24 15:45:36'),(4,'2020/2021','2020-09-18','2021-05-22',4,306,NULL,4,'2020-10-20 09:53:16','2020-10-24 15:45:38'),(5,'2020/2021','2020-08-22','2021-05-23',7,380,NULL,5,'2020-10-20 09:53:44','2020-10-24 15:45:39');
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `standings`
--

DROP TABLE IF EXISTS `standings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `standings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(10) unsigned NOT NULL,
  `season_id` int(10) unsigned NOT NULL,
  `plays` tinyint(3) unsigned NOT NULL,
  `wins` tinyint(3) unsigned NOT NULL,
  `draws` tinyint(3) unsigned NOT NULL,
  `losses` tinyint(3) unsigned NOT NULL,
  `goals_against` tinyint(3) unsigned NOT NULL,
  `goals_for` tinyint(3) unsigned NOT NULL,
  `goals_difference` tinyint(3) unsigned NOT NULL,
  `points` tinyint(3) unsigned NOT NULL,
  `last_five_matches` char(5) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `season_id` (`season_id`),
  CONSTRAINT `standings_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `standings_ibfk_2` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `standings`
--

LOCK TABLES `standings` WRITE;
/*!40000 ALTER TABLE `standings` DISABLE KEYS */;
/*!40000 ALTER TABLE `standings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `logo_url_fr_internet` varchar(100) DEFAULT NULL,
  `logo_url_fr_server` varchar(100) DEFAULT NULL,
  `description` text,
  `address` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `founded_year` char(4) NOT NULL,
  `stadium` varchar(100) NOT NULL,
  `ceo` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Arsenal F.C.','Arsenal','https://crests.football-data.org/57.svg','base_url/resources/images/teams-logo/premier-league/arsenal.svg','Arsenal Football Club is a professional football club based in Islington, London, England, that plays in the Premier League, the top flight of English football. The club has won 13 League titles, a record 13 FA Cups, 2 League Cups, 15 FA Community Shields, 1 League Centenary Trophy, 1 UEFA Cup Winners Cup and 1 Inter-Cities Fairs Cup.\r\n\r\nArsenal was the first club from the South of England to join The Football League, in 1893, and they reached the First Division in 1904. Relegated only once, in 1913, they continue the longest streak in the top division, and have won the second-most top-flight matches in English football history. In the 1930s, Arsenal won five League Championships and two FA Cups, and another FA Cup and two Championships after the war. In 1970-71, they won their first League and FA Cup Double. Between 1989 and 2005, they won five League titles and five FA Cups, including two more Doubles. They completed the 20th century with the highest average league position.\r\n\r\nHerbert Chapman won Arsenal\'s first national trophies, but died prematurely. He helped introduce the WM formation, floodlights, and shirt numbers, and added the white sleeves and brighter red to the club\'s kit. Arsène Wenger was the longest-serving manager and won the most trophies. He won a record 7 FA Cups, and his title-winning team set an English record for the longest top-flight unbeaten league run at 49 games between 2003 and 2004, receiving the nickname The Invincibles.\r\n\r\nIn 1886, Woolwich munitions workers founded the club as Dial Square. In 1913, the club crossed the city to Arsenal Stadium in Highbury, becoming close neighbours of Tottenham Hotspur, and creating the North London derby. In 2006, they moved to the nearby Emirates Stadium. In terms of revenue, Arsenal is the ninth highest-earning football club in the world, earned €487.6m in 2016-17 season. Based on social media activity from 2014 to 2015, Arsenal\'s fanbase is the fifth largest in the world. In 2018, Forbes estimated the club was the third most valuable in England, with the club being worth $2.24 billion.','Highbury House, 75 Drayton Park, London, N5 1BU','London Borough of Islington, London, United Kingdom','+44 (20) 7619 5003','https://www.arsenal.com','1886','Emirates Stadium','Vinai Venkatesham','2020-11-03 15:04:56','2020-11-15 09:36:02'),(2,'Aston Villa F.C.','Aston Villa','https://crests.football-data.org/58.svg','base_url/resources/images/teams-logo/premier-league/aston-villa.svg','Aston Villa Football Club is an English professional football club based in Aston, Birmingham. The club competes in the Premier League, the top tier of the English football league system. Founded in 1874, they have played at their home ground, Villa Park, since 1897. Aston Villa were one of the founder members of the Football League in 1888 and of the Premier League in 1992. Villa are one of only five English clubs to have won the European Cup, in 1981-82. They have also won the Football League First Division seven times, the FA Cup seven times, the League Cup five times, and the European (UEFA) Super Cup once.\r\n\r\nVilla have a fierce local rivalry with Birmingham City and the Second City derby between the teams has been played since 1879. The club\'s traditional kit colours are claret shirts with sky blue sleeves, white shorts and sky blue socks. Their traditional club badge is of a rampant lion. The club is currently owned by the NSWE group, a company owned by the Egyptian billionaire Nassef Sawiris and the American billionaire Wes Edens.','Villa Park, Birmingham, B6 6HE','Aston, Birmingham, United Kingdom','+44 (121) 327 2299','https://www.avfc.co.uk','1874','Villa Park','Christian Purslow','2020-11-03 15:04:56','2020-11-15 09:38:03'),(3,'Brighton & Hove Albion F.C.','Brighton','https://crests.football-data.org/397.svg','base_url/resources/images/teams-logo/premier-league/brighton.svg','Brighton & Hove Albion Football Club, commonly referred to simply as Brighton, is an English professional football club based in the city of Brighton and Hove. They compete in the Premier League, the top tier of the English football league system. The club\'s home ground is the 30,750-capacity Falmer Stadium, situated in Falmer to the north east of the city.\r\n\r\nFounded in 1901, and nicknamed the \"Seagulls\" or \"Albion\", Brighton played their early professional football in the Southern League, before being elected to the Football League in 1920. The club enjoyed greatest prominence between 1979 and 1983 when they played in the First Division and reached the 1983 FA Cup Final, losing to Manchester United after a replay. They were relegated from the First Division in the same season.\r\n\r\nBy the late 1990s, Brighton was in the fourth tier of English football and were having financial difficulties. After narrowly avoiding relegation from the Football League to the Conference in 1997, a boardroom takeover saved the club from liquidation. Successive promotions in 2001 and 2002 brought Brighton back to the second tier, and in 2011, the club moved into the Falmer Stadium after 14 years without a permanent home ground. In the 2016-17 season, Brighton finished second in the EFL Championship and were thus promoted to the Premier League, ending a 34-year absence from the top flight.','Village Way, Brighton and Hove, BN1 9BL','Brighton and Hove, United Kingdom','+44 (1273) 668 855','https://www.brightonandhovealbion.com','1901','American Express Community Stadium','Paul Barber','2020-11-03 15:04:56','2020-11-15 09:38:13'),(4,'Burnley F.C.','Burnley','https://crests.football-data.org/328.svg','base_url/resources/images/teams-logo/premier-league/burnley.svg','Burnley Football Club is an English association football club based in Burnley, Lancashire. Founded on 18 May 1882, it was one of the first to become professional (in 1883), and subsequently put pressure on the Football Association to permit payments to players. The club entered the FA Cup for the first time in 1885-86 and was one of the 12 founder members of the Football League in 1888-89. The team currently competes in the Premier League, the top tier of English football.\r\n\r\nBurnley have been champions of England twice, in 1920-21 and 1959-60, have won the FA Cup once, in 1913-14, and have won the FA Charity Shield twice, in 1960 and 1973. They have been runners-up in the First Division twice, in 1919-20 and 1961-62, and FA Cup runners-up twice, in 1946-47 and 1961-62. The team also reached the quarter-finals of the 1960-61 European Cup. Burnley are one of only five sides to have won all four professional divisions of English football, along with Wolverhampton Wanderers, Preston North End, Sheffield United and Portsmouth.\r\n\r\nThe team have played home games at Turf Moor since 1883, after they had moved from their original premises at Calder Vale. The club colours of claret and blue were adopted before the 1910-11 season in tribute to the then Football League champions Aston Villa. The club is nicknamed \"The Clarets\", because of the dominant colour of its home shirts. Burnley\'s current emblem is based on the town\'s coat of arms. The team have a long-standing rivalry with nearby club Blackburn Rovers, with whom they contest the East Lancashire Derby.','Harry Potts Way, Burnley, Lancashire, BB10 4BX','Burnley, United Kingdom','+44 (1282) 446 800','https://www.burnleyfootballclub.com','1882','Turf Moor','Neil Hart','2020-11-03 15:04:56','2020-11-15 09:38:22'),(5,'Chelsea F.C.','Chelsea','https://crests.football-data.org/61.svg','base_url/resources/images/teams-logo/premier-league/chelsea.svg','Chelsea Football Club are an English professional football club based in Fulham, London. Founded in 1905, the club competes in the Premier League, the top division of English football. Chelsea are among England\'s most successful clubs, having won over thirty competitive honours, including six league titles and six European trophies. Their home ground is Stamford Bridge.\r\n\r\nChelsea won their first major honour, the League Championship, in 1955. The club won the FA Cup for the first time in 1970 and their first European honour, the UEFA Cup Winners Cup, in 1971. After a period of decline in the late 1970s and 1980s, the club enjoyed a revival in the 1990s and had more success in cup competitions. The past two decades have been the most successful in Chelsea\'s history: they won five of its six league titles and the UEFA Champions League during this period. Chelsea are one of five clubs to have won all three of UEFA\'s main club competitions, and the only London club to have won the Champions League.\r\n\r\nChelsea\'s home kit colours are royal blue shirts and shorts with white socks. The club\'s crest features a ceremonial lion rampant regardant holding a staff. The club has rivalries with neighbouring teams Arsenal and Tottenham Hotspur, and a historic rivalry with Leeds United. Based on attendance figures, the club has the sixth-largest fanbase in England. In terms of club value, Chelsea are the sixth most valuable football club in the world, worth £2.13 billion ($2.576 billion), and are the eighth highest-earning football club in the world, with earnings of over €428 million in the 2017-18 season. Since 2003, Chelsea have been owned by Russian billionaire Roman Abramovich.','Fulham Road, London, SW6 1HS','London, United Kingdom','+44 (207) 386 9373','https://www.chelseafc.com','1905','Stamford Bridge','Guy Laurence','2020-11-03 15:04:56','2020-11-15 09:38:35'),(6,'Crystal Palace F.C.','Crystal Palace','https://crests.football-data.org/354.svg','base_url/resources/images/teams-logo/premier-league/crystal-palace.svg','Crystal Palace Football Club is a professional football club based in Selhurst, South London, England, who currently compete in the Premier League, the highest level of English football. Although their official founding date is 1905, the club claim to be a continuation of the original amateur Crystal Palace football club first established in 1861, which would make them the oldest professional football club in the world, after historians discovered a direct lineage through their ownership under the same Crystal Palace Company. Both the amateur and professional clubs played inside the grounds of the Crystal Palace Exhibition building, with the professional club playing at the FA Cup Final stadium until 1915, when they were forced to leave due to the outbreak of the First World War. In 1924, they moved to their current home at Selhurst Park.\r\n\r\nThe club became founder members of the Premier League in 1992. Following their relegation from the Premier League in 1998, Palace went into decline after suffering financial problems which resulted in the club going into administration twice in 1999 and 2010, but they recovered and returned to the Premier League in 2013 where they have remained ever since, and reached another FA Cup final in 2016, again finishing runners-up to Manchester United.\r\n\r\nThe club\'s kit colours were claret and blue until 1973, but then they decided to change to the red and blue vertical stripes worn today. Palace have a long-standing and fierce rivalry with Brighton & Hove Albion, with whom they contest the M23 derby, and also share rivalries with fellow South London clubs Millwall and Charlton Athletic.','Whitehorse Lane, London, SE25 6PU','London, United Kingdom','+44 (20) 8768 6000','https://www.cpfc.co.uk','1905','Selhust Park Stadium','Philip James Alexander','2020-11-03 15:04:56','2020-11-15 09:38:46'),(7,'Everton F.C.','Everton','https://crests.football-data.org/62.svg','base_url/resources/images/teams-logo/premier-league/everton.svg','Everton Football Club is an English professional football club based in Liverpool that competes in the Premier League, the top tier of English football. The club has competed in the top division for a record 117 seasons, missing only four top-flight seasons (1930-31, 1951-52, 1952-53, 1953-54) since the creation of the Football League, of which it was a founding member. Everton is the second-longest continuous serving club in English top-flight football and has won nine league titles, five FA Cups, one European Cup Winners Cup and nine Charity Shields.\r\n\r\nFormed in 1878, Everton won its first League Championship during the 1890-91 season. After winning four more League Championships and two FA Cups, the club experienced a post-World War II until a revival in the 1960s. A period of sustained success came in the mid-1980s, when Everton won a further two League Championships, one FA Cup, and the 1985 European Cup Winners Cup. The club\'s most recent major trophy was the 1995 FA Cup.\r\n\r\nThe club\'s supporters are colloquially known as \"Evertonians\" or \"Blues\". Everton\'s main rivals are Liverpool, whose home stadium at Anfield is just under one mile away from Everton\'s home at Goodison Park, and the two clubs contest the Merseyside derby. Everton has been based at Goodison Park since 1892, having moved from its original home at Anfield following a disagreement over its rent. The club\'s home colours are royal blue shirts with white shorts and socks.','Goodison Park, Liverpool, L4 4EL','Liverpool, United Kingdom','+44 (151) 556 1878','https://www.evertonfc.com','1878','Goodison Park','Denise Barrett-Baxendale','2020-11-03 15:04:56','2020-11-15 09:38:54'),(8,'Fulham F.C.','Fulham','https://crests.football-data.org/63.svg','base_url/resources/images/teams-logo/premier-league/fulham.svg','Fulham Football Club is an English professional association football club based in Fulham, London. They currently compete in the Premier League, the highest level of the English football league system. Founded in 1879, they are London\'s oldest football club playing professionally.\r\n\r\nThe club has spent 27 seasons in English football\'s top division, the majority of which have come in two periods during the 1960s and 2000s. The latter period was associated with former chairman Mohamed Al-Fayed, after the club had climbed up from the fourth tier in the 1990s. Fulham have reached two major finals: in 1975 they lost 2-0 against West Ham United in the FA Cup Final as a Second Division team, and in 2010 they played Atlético Madrid in the UEFA Europa League Final, losing 2-1 after extra time.\r\n\r\nFulham\'s main rivalries are with fellow West London clubs Chelsea, Queens Park Rangers and Brentford. The club adopted a white shirt and black socks as its kit in 1903, which has been used ever since.','Stevenage Road, London, SW6 6HH','Fulham, London, United Kingdom','+44 (843) 208 1222','https://www.fulhamfc.com','1879','Craven Cottage','Alistair Mackintosh','2020-11-03 15:04:56','2020-11-15 09:39:02'),(9,'Leeds United F.C.','Leeds United','https://crests.football-data.org/341.svg','base_url/resources/images/teams-logo/premier-league/leeds-united.svg','Leeds United Football Club is an English professional football club based in the city of Leeds, West Yorkshire. The club was formed in 1919 following the disbanding of Leeds City by the Football League and took over their Elland Road Stadium. The club currently competes in the Premier League, the top flight of English football, following promotion from the EFL Championship during the 2019-20 season. Most of their history has been spent competing in the first tier of English football. Their longest continuous spell inside the first tier was a period of 18 years between 1964 and 1982, while their longest period outside of it spanned 16 years between 2004 and 2020.\r\n\r\nThey have won three English league titles, one FA Cup, one League Cup, two Charity Community Shields and two Inter-Cities Fairs Cups. The club reached the 1975 European Cup Final, losing to Bayern Munich. Leeds reached the semi-finals of the tournament\'s successor, the Champions League in 2001. The club were also runners-up in the European Cup Winners Cup final in 1973. The majority of the honours were won under the management of Don Revie in the 1960s and 1970s.\r\n\r\nLeeds play in all-white kits at home matches. The club\'s badge features the White Rose of York. The club\'s anthem is an original song released in 1972, \"Marching on Together\". Leeds share rivalries with Manchester United and Chelsea, as well as with local teams such as Huddersfield Town, Bradford City, Sheffield United and Sheffield Wednesday.','Elland Road, Leeds, LS11 0ES','Leeds, West Yorkshire, United Kingdom','+44 (871) 334 1919','https://www.leedsunited.com','1919','Elland Road','Angus Kinnear','2020-11-03 15:04:56','2020-11-15 09:39:19'),(10,'Leicester City F.C.','Leicester City','https://crests.football-data.org/338.svg','base_url/resources/images/teams-logo/premier-league/leicester-city.svg','Leicester City Football Club is an English professional football club based in Leicester in the East Midlands. The club competes in the Premier League, the top division of England\'s football league system, and plays its home matches at the King Power Stadium.\r\n\r\nThe club was founded in 1884 as Leicester Fosse F.C. playing on a field near Fosse Road. They moved to Filbert Street in 1891, were elected to the Football League in 1894 and adopted the name Leicester City in 1919. They moved to the nearby Walkers Stadium in 2002, which was renamed the King Power Stadium in 2011.\r\n\r\nLeicester won the 2015-16 Premier League, their first top-level football championship. They are one of only seven clubs to have won the Premier League since its inception in 1992. A number of newspapers described Leicester\'s title win as the greatest sporting shock ever, multiple bookmakers had never paid out at such long odds for any sport. As a result, the team was dubbed \"The Unbelievables\", a spin-off harking back to Arsenal\'s undefeated team \"The Invincibles\". The club\'s previous highest finish was second place in the top flight, in 1928-29, then known as the First Division.','Filbert Way, Leicester, LE2 7FL','Leicester, United Kingdom','+44 (344) 815 5000','https://www.lcfc.com','1884','King Power Stadium','Susan Whelan','2020-11-03 15:04:56','2020-11-15 09:39:29'),(11,'Liverpool F.C.','Liverpool','https://crests.football-data.org/64.svg','base_url/resources/images/teams-logo/premier-league/liverpool.svg','Liverpool Football Club is a professional football club in Liverpool, England, that competes in the Premier League, the top tier of English football. Domestically, the club has won nineteen League titles, seven FA Cups, a record eight League Cups and fifteen FA Community Shields. In international competitions, the club has won six European Cups, more than any other English club, three UEFA Cups, four UEFA Super Cups (also English records) and one FIFA Club World Cup.\r\n\r\nFounded in 1892, the club joined the Football League the following year and has played at Anfield since its formation. Liverpool established itself as a major force in English and European football in the 1970s and 1980s, when Bill Shankly, Bob Paisley, Joe Fagan and Kenny Dalglish led the club to a combined eleven League titles and four European Cups. Liverpool won two further European Cups in 2005 and 2019 under the management of Rafael Benítez and Jürgen Klopp, respectively, the latter of whom led Liverpool to a nineteenth League title in 2020, the club\'s first during the Premier League era.\r\n\r\nOne of the most widely supported teams in the world, in 2019, Liverpool was the world\'s seventh-highest-earning football club, with an annual revenue of €604 million, and the world\'s eighth-most-valuable football club, valued at $2.183 billion. Liverpool has long-standing rivalries with Manchester United and Everton. The team changed from red shirts and white shorts to an all-red home strip in 1964 which has been used ever since. The club\'s anthem is \"You\'ll Never Walk Alone\".','Anfield Road, Liverpool, L4 0TH','Liverpool, United Kingdom','+44 (151) 264 2500','https://www.liverpoolfc.com','1892','Anfield','Billy Hogan','2020-11-03 15:04:56','2020-11-15 09:39:36'),(12,'Manchester City F.C.','Man City','https://crests.football-data.org/65.svg','base_url/resources/images/teams-logo/premier-league/man-city.svg','Manchester City Football Club is an English football club based in Manchester that competes in the Premier League, the top flight of English football. Founded in 1880 as St. Mark\'s (West Gorton), it became Ardwick Association Football Club in 1887 and Manchester City in 1894. The club\'s home ground is the City of Manchester Stadium in east Manchester, to which it moved in 2003, having played at Maine Road since 1923. The club adopted their sky blue home shirts in 1894 in the first season of the club\'s current iteration, that have been used ever since.\r\n\r\nManchester City entered the Football League in 1899, and won their first major honour with the FA Cup in 1904. The club had its first major period of success in the late 1960s, winning the League, European Cup Winners Cup, FA Cup and League Cup under the management of Joe Mercer and Malcolm Allison. After losing the 1981 FA Cup Final, the club went through a period of decline, culminating in relegation to the third tier of English football for the only time in its history in 1998. They since regained promotion to the top tier in 2001-02 and have remained a fixture in the Premier League since 2002-03.\r\n\r\nIn 2008, Manchester City was purchased by Abu Dhabi United Group for £210 million and received considerable financial investment in both playing staff and club facilities, including the £150 million Etihad Campus in east Manchester. Under the management of Pep Guardiola they won the Premier League in 2018 becoming the only Premier League team to attain 100 points in a single season. In 2019, they won four trophies, completing an unprecedented sweep of all domestic trophies in England and becoming the first English men\'s team to win the domestic treble.\r\n\r\nManchester City\'s revenue was the fifth highest of a football club in the world in the 2018-19 season at €568.4 million. In 2019, Forbes estimated the club was the fifth most valuable in the world at $2.69 billion. The club is owned by the City Football Group, a British-based holding company valued at £3.73 (US$4.8) billion in November 2019 following a 10% stake sale to Silver Lake.','Etihad Campus, Manchester, M11 3FF','Manchester, United Kingdom','+44 (161) 444 1894','https://www.mancity.com','1880','Etihad Stadium','Ferran Soriano','2020-11-03 15:04:56','2020-11-15 09:39:44'),(13,'Manchester United F.C.','Man United','https://crests.football-data.org/66.svg','base_url/resources/images/teams-logo/premier-league/man-united.svg','Manchester United Football Club is a professional football club based in Old Trafford, Greater Manchester, England, that competes in the Premier League, the top flight of English football. Nicknamed \"The Red Devils\", the club was founded as Newton Heath LYR Football Club in 1878, changed its name to Manchester United in 1902 and moved to its current stadium, Old Trafford, in 1910.\r\n\r\nManchester United have won more trophies than any other club in English football, with a record 20 League titles, 12 FA Cups, five League Cups and a record 21 FA Community Shields. United have also won three UEFA Champions Leagues, one UEFA Europa League, one UEFA Cup Winners Cup, one UEFA Super Cup, one Intercontinental Cup and one FIFA Club World Cup. In 1998-99, the club became the first in the history of English football to achieve the continental European treble. By winning the UEFA Europa League in 2016-17, they became one of five clubs to have won all three main UEFA club competitions.\r\n\r\nThe 1958 Munich air disaster claimed the lives of eight players. In 1968, under the management of Matt Busby, Manchester United became the first English football club to win the European Cup. Alex Ferguson won 38 trophies as manager, including 13 Premier League titles, 5 FA Cups and 2 UEFA Champions Leagues, between 1986 and 2013, when he announced his retirement. Manchester United is one of the most widely supported football clubs in the world, and has rivalries with Liverpool, Manchester City, Arsenal and Leeds United.\r\n\r\nManchester United was the highest-earning football club in the world for 2016-17, with an annual revenue of €676.3 million, and the world\'s third most valuable football club in 2019, valued at £3.15 billion ($3.81 billion). As of 2015, it is the world\'s most valuable football brand, estimated to be worth $1.2 billion.','Sir Matt Busby Way, Manchester, M16 0RA','Manchester, United Kingdom','+44 (161) 868 8000','https://www.manutd.com','1878','Old Trafford','Ed Woodward','2020-11-03 15:04:56','2020-11-15 09:39:51'),(14,'Newcastle United F.C.','Newcastle','https://crests.football-data.org/67.svg','base_url/resources/images/teams-logo/premier-league/newcastle.svg','Newcastle United Football Club is an English professional football club based in Newcastle upon Tyne, Tyne and Wear, that plays in the Premier League, the top flight of English football. Founded in 1892 by the merger of Newcastle East End and Newcastle West End. The team plays its home matches at St. James Park. Per the Taylor Report\'s requirement that all Premier League clubs have an all-seater stadium, the ground was adjusted in the mid-1990s and now has a capacity of 52,305.\r\n\r\nThe club has been a member of the Premier League for all but three years of the competition\'s history, spending 88 seasons in the top flight as of July 2020, and have never dropped below English football\'s second tier since joining the Football League in 1893. Newcastle have won 4 League titles, 6 FA Cups and a Charity Shield, as well as the 1969 Inter-Cities Fairs Cup and the 2006 UEFA Intertoto Cup, the ninth highest total of trophies won by an English club. The club\'s most successful period was between 1904 and 1910, when they won an FA Cup and three of their League titles. Newcastle were relegated in 2009, and again in 2016. The club won promotion at the first time of asking each time, returning to the Premier League, as Championship winners, in 2010 and 2017.\r\n\r\nNewcastle have a long-standing rivalry with nearby club Sunderland, with whom they have contested the Tyne-Wear derby since 1898. The club\'s traditional kit colours are black and white striped shirts, black shorts and black socks. Their crest has elements of the city coat of arms, which features two grey seahorses. Before each home game, the team enters the field to \"Local Hero\", and \"Blaydon Races\" is also sung during games.','St. James Park, Newcastle upon Tyne, NE1 4ST','Newcastle, Tyne and Wear, United Kingdom','+44 (344) 372 1892','https://www.nufc.co.uk','1892','St. James Park','-','2020-11-03 15:04:56','2020-11-15 09:40:01'),(15,'Sheffield United F.C.','Sheffield United','https://crests.football-data.org/356.svg','base_url/resources/images/teams-logo/premier-league/sheffield_united.svg','Sheffield United Football Club is a professional football club in Sheffield, South Yorkshire, England, which competes in the Premier League, the top division of English football. They formed in 1889, as an offshoot of Sheffield United Cricket Club, and are nicknamed The Blades due to Sheffield\'s history of steel production. They have played home games at Bramall Lane since their formation.\r\n\r\nSheffield United won the original Football League in 1898 and the FA Cup in 1899, 1902, 1915 and 1925. They were beaten finalists in the FA Cup in 1901 and 1936, and reached the semi-finals in 1961, 1993, 1998, 2003 and 2014. They reached the semi-finals of the League Cup in 2003 and 2015.\r\n\r\nSheffield United were the first club in English football to achieve promotion from the newly formed Second Division to the First Division in 1892-93. The club was also a founder member of the Premier League in the 1992-93 season, during which they scored the first ever goal of the Premier League era. Brian Deane was the scorer of the first goal in a 2-1 win at Bramall Lane, against the eventual champions, Manchester United.\r\n\r\nSince the club\'s formation, they have played in tiers 1 through to 4 of the football league. They are one of only four clubs to have finished as champions of each of the top four tiers of the football league. Most of the club\'s history however has been spent in tier 1. For most of the club\'s history they have played in red and white striped shirts with black shorts. Their closest rivals are Sheffield Wednesday, with whom they contest the Steel City derby.','Bramall Lane, Sheffield, S2 4SU','Sheffield, United Kingdom','+44 (114) 253 7200','https://www.sufc.co.uk','1889','Bramall Lane','Stephen Bettis','2020-11-03 15:04:56','2020-11-15 09:40:16'),(16,'Southampton F.C.','Southampton','https://crests.football-data.org/340.svg','base_url/resources/images/teams-logo/premier-league/southampton.svg','Southampton Football Club is an English professional football club based in Southampton, Hampshire, which plays in the Premier League, the top tier of English football. The club was originally known as St. Mary\'s Young Men\'s Association F.C. (usually abbreviated to \"St. Mary\'s Y.M.A.\") and then became simply St. Mary\'s F.C. in 1887-88, before adopting the name Southampton St. Mary\'s when the club joined the Southern League in 1894.\r\n\r\nSouthampton were founding members of the Premier League in 1992-93, but spent most of the next ten seasons struggling against relegation. Since the Premier League\'s inception in 1992, Southampton have competed in 20 of the 27 seasons completed to date, accumulating close to 1,000 points. The principle honour of the club, formed in 1885, is being the FA Cup holders in 1976 but, since first winning promotion to the old Division One in 1966, they have spent just two stints, amounting to 11 seasons, out of the top-flight. Their longest absence being the spell in the Championship and League 1 between 2005 and 2013. Southampton returned to the Premier League for season 2012-13 initially under Nigel Adkins. Substantial sums were spent to strengthen the playing squad, but early in the season, Adkins was replaced by Argentine coach Mauricio Pochettino. Southampton finished the season in 14th place, and next season in 8th.\r\n\r\nTheir home ground since 2001 has been St Mary\'s Stadium, prior to which they were based at The Dell. The club has been nicknamed \"The Saints\" since its inception in 1885 due to its history as a church football team, and play in red and white shirts. Southampton have a long-standing rivalry with Portsmouth, due in part to geographic proximity and both cities respective maritime histories. Matches between the two clubs are known as the South Coast derby.','Britannia Road, Southampton, SO14 5FP','Southampton, United Kingdom','+44 (845) 688 9448','https://www.southamptonfc.com','1885','St. Mary\'s Stadium','Martin Semmens','2020-11-03 15:04:56','2020-11-15 09:40:25'),(17,'Tottenham Hotspurs F.C.','Tottenham','https://crests.football-data.org/73.svg','base_url/resources/images/teams-logo/premier-league/tottenham.svg','Tottenham Hotspur Football Club, commonly referred to as Tottenham or Spurs, is an English professional football club in Tottenham, London, that competes in the Premier League. Tottenham Hotspur Stadium has been the club\'s home ground since April 2019, replacing their former home of White Hart Lane, which had been demolished to make way for the new stadium on the same site. Their training ground is on Hotspur Way in Bulls Cross in the London Borough of Enfield. The club is owned by ENIC Group. Tottenham have played in a first (home) strip of white shirts and navy blue shorts since the 1898-99 season. The club\'s emblem is a cockerel standing upon a football, with a Latin motto Audere est Facere (\"To Dare Is to Do\").\r\n\r\nFounded in 1882, Tottenham won the FA Cup for the first time in 1901, the only non-League club to do so since the formation of the Football League in 1888. Tottenham were the first club in the 20th century to achieve the League and FA Cup Double, winning both competitions in the 1960-61 season. After successfully defending the FA Cup in 1962, in 1963 they became the first British club to win a UEFA club competition - the European Cup Winners Cup. They were also the inaugural winners of the UEFA Cup in 1972, becoming the first British club to win two different major European trophies. They collected at least one major trophy in each of the six decades from the 1950s to 2000s - an achievement only matched by Manchester United. In total, Spurs have won two league titles, eight FA Cups, four League Cups, seven FA Community Shields, one European Cup Winners Cup and two UEFA Cups. Tottenham were also the runners-up in the 2018-19 UEFA Champions League. They have a long-standing rivalry with nearby club Arsenal, with whom they contest the North London derby.','Bill Nicholson Way, 748 High Road, London, N17 0AP','Tottenham, London, United Kingdom','+44 (344) 499 5000','https://www.tottenhamhotspur.com','1882','Tottenham Hotspur Stadium','Daniel Levy','2020-11-03 15:04:56','2020-11-15 09:40:33'),(18,'West Bromwich Albion F.C.','West Brom','https://crests.football-data.org/74.svg','base_url/resources/images/teams-logo/premier-league/west-brom.svg','West Bromwich Albion Football Club is an English professional football club based in West Bromwich, West Midlands, England, that competes in the Premier League, the top tier of English football. The club was formed in 1878 and has played at its home ground, The Hawthorns, since 1900.\r\n\r\nAlbion was one of the 12 founding members of the Football League in 1888, the first professional football league in the world. The club has spent the majority of its existence in the top tier of English football, where as of May 2020 the team had played for 81 seasons. The club has been champions of England once, in 1919-20, and has been runners-up twice. Albion teams have reached ten FA Cup finals and won the Cup on five occasions. The first win came in 1888, the year the league was founded, and the most recent in 1968, the club\'s last major trophy. It also won the Football League Cup at the first attempt in 1966. The club\'s longest continuous period in the top division spanned 24 years between 1949 and 1973, and from 1986 to 2002 it spent its longest ever spell out of the top division.\r\n\r\nThe team has played in navy blue and white stripes for most of the club\'s history, and the club badge features a throstle perched on a hawthorn branch. Albion has a number of long-standing rivalries with other West Midlands clubs, with its traditional rivals being Aston Villa and Wolves. Albion contests the Black Country derby with the latter.','The Hawthorns, West Bromwich, West Midlands, B71 4LF','West Bromwich, West Midlands, United Kingdom','+44 (345) 241 3784','https://www.wba.co.uk','1878','The Hawthorns','Xu Ke','2020-11-03 15:04:56','2020-11-15 09:40:40'),(19,'West Ham United F.C.','West Ham','https://crests.football-data.org/563.svg','base_url/resources/images/teams-logo/premier-league/west-ham.svg','West Ham United Football Club is an English professional football club based in Stratford, East London. They compete in the Premier League, the top tier of English football. The club play at the London Stadium, having moved from their former home the Boleyn Ground in 2016.\r\n\r\nThe club was founded in 1895 as Thames Ironworks and reformed in 1900 as West Ham United. They moved to the Boleyn Ground in 1904, which remained their home ground for more than a century. The team initially competed in the Southern League and Western League before joining the Football League in 1919. They were promoted to the top flight in 1923, when they were also losing finalists in the first FA Cup Final held at Wembley. In 1940, the club won the inaugural Football League War Cup.\r\n\r\nWest Ham have been winners of the FA Cup three times: in 1964, 1975 and 1980, and have also been runners-up twice: in 1923 and 2006. The club have reached two major European finals, winning the European Cup Winners Cup in 1965 and finishing runners-up in the same competition in 1976. West Ham also won the Intertoto Cup in 1999. They are one of eight clubs never to have fallen below the second tier of English football, spending 62 of 94 league seasons in the top flight, up to and including the 2019-20 season. The club\'s highest league position to date came in 1985-86, when they achieved third place in the then First Division.\r\n\r\nThree West Ham players were members of the 1966 World Cup final-winning England team: captain Bobby Moore and goalscorers Geoff Hurst and Martin Peters. The club has a long-standing rivalry with Millwall. West Ham adopted their claret and sky blue colour scheme in the early 1900s, with the most common iteration of a claret shirt and sky blue sleeves first emerging in 1904.','London Stadium, Queen Elizabeth Olympic Park, London, E20 2ST','Stratford, London, United Kingdom','+44 (333) 030 0174','https://www.whufc.com','1895','London Stadium','Karren Brady','2020-11-03 15:04:56','2020-11-15 09:40:46'),(20,'Wolverhampton Wanderers F.C.','Wolves','https://crests.football-data.org/76.svg','base_url/resources/images/teams-logo/premier-league/wolves.svg','Wolverhampton Wanderers Football Club, commonly known as Wolves, is a professional association football club based in the city of Wolverhampton in the West Midlands, England. Formed as St. Luke\'s F.C. in 1877, the club has played at Molineux Stadium since 1889 and has been competing in the Premier League, the top division of English football, since winning promotion in 2018. The 2020-21 season is the club\'s 66th season in total at the highest level.\r\n\r\nThe club was one of the founding members of the Football League in 1888. During 26 consecutive seasons spent in the top flight between 1932 and 1965, it was English League champions three times (in 1953-54, 1957-58 and 1958-59, all under the management of Stan Cullis. Wolves also finished English league runners-up in five other seasons between 1937-38 and 1959-60. Wolves has won the FA Cup four times, most recently in 1960, and finished runners-up on a further four occasions. The club has also won the League Cup twice, in 1974 and 1980, and finished top of all four divisions in the English professional game.\r\n\r\nWolves reached the quarter-finals of the European Cup (now known as the UEFA Champions League) in 1959-60 as well as the semi-finals of the 1960-61 European Cup Winners Cup and the inaugural UEFA Cup Final in 1972. Following a 39-year absence from European competition, they reached the UEFA Europa League quarter-finals in 2020.\r\n\r\nWolves traditional kit consists of old gold shirts and socks and black shorts. Since 1979, the kit has also featured the club\'s \"wolf\'s head\" badge. Long-standing rivalries exist with other West Midlands clubs, the main one being the Black Country derby contested with West Bromwich Albion. Although the two clubs have not met since 2011-12, they are set to play one another during the 2020-21 season following West Brom\'s promotion back to the top flight.','Waterloo Road, Wolverhampton, WV1 4QR','Wolverhampton, United Kingdom','+44 (871) 222 2220','https://www.wolves.co.uk','1877','Molineux Stadium','-','2020-11-03 15:04:56','2020-11-15 09:40:52');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yellow_cards_on_seasons`
--

DROP TABLE IF EXISTS `yellow_cards_on_seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `yellow_cards_on_seasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `season_id` int(10) unsigned NOT NULL,
  `player_id` int(10) unsigned NOT NULL,
  `yellow_cards_obtained` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `season_id` (`season_id`),
  CONSTRAINT `yellow_cards_on_seasons_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`),
  CONSTRAINT `yellow_cards_on_seasons_ibfk_2` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yellow_cards_on_seasons`
--

LOCK TABLES `yellow_cards_on_seasons` WRITE;
/*!40000 ALTER TABLE `yellow_cards_on_seasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `yellow_cards_on_seasons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-15 23:36:29
