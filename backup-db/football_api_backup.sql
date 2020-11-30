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
  `player_id` int(10) unsigned NOT NULL,
  `assists_created` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `assists_on_seasons_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
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
  `name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `team_id` int(10) unsigned NOT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
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
  `player_id` int(10) unsigned NOT NULL,
  `minutes` tinyint(3) unsigned NOT NULL,
  `status_team` char(8) NOT NULL,
  `status_goals` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `goals_on_matches_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
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
  `player_id` int(10) unsigned NOT NULL,
  `goals_scored` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `goals_on_seasons_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
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
  `goals_on_match_id` int(10) unsigned DEFAULT NULL,
  `red_cards_on_match_id` int(10) unsigned DEFAULT NULL,
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
  KEY `goals_on_match_id` (`goals_on_match_id`),
  KEY `red_cards_on_match_id` (`red_cards_on_match_id`),
  CONSTRAINT `match_stats_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `match_stats_ibfk_2` FOREIGN KEY (`goals_on_match_id`) REFERENCES `goals_on_matches` (`id`),
  CONSTRAINT `match_stats_ibfk_3` FOREIGN KEY (`red_cards_on_match_id`) REFERENCES `red_cards_on_matches` (`id`)
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
  `image_url` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
  `height` decimal(2,2) unsigned DEFAULT NULL,
  `prefer_position_id` int(10) unsigned NOT NULL,
  `position_id` int(10) unsigned DEFAULT NULL,
  `team_id` int(10) unsigned NOT NULL,
  `shirt_number` tinyint(3) unsigned DEFAULT NULL,
  `rating` tinyint(3) unsigned NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_class`
--

LOCK TABLES `positions_class` WRITE;
/*!40000 ALTER TABLE `positions_class` DISABLE KEYS */;
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
  `player_id` int(10) unsigned NOT NULL,
  `status_team` char(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `red_cards_on_matches_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
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
  `player_id` int(10) unsigned NOT NULL,
  `red_cards_obtained` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `red_cards_on_seasons_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
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
-- Table structure for table `seasons_stats`
--

DROP TABLE IF EXISTS `seasons_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seasons_stats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `season_id` int(10) unsigned NOT NULL,
  `goals_on_season_id` int(10) unsigned NOT NULL,
  `assists_on_season_id` int(10) unsigned NOT NULL,
  `yellow_cards_on_season_id` int(10) unsigned NOT NULL,
  `red_cards_on_season_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `season_id` (`season_id`),
  KEY `goals_on_season_id` (`goals_on_season_id`),
  KEY `assists_on_season_id` (`assists_on_season_id`),
  KEY `yellow_cards_on_season_id` (`yellow_cards_on_season_id`),
  KEY `red_cards_on_season_id` (`red_cards_on_season_id`),
  CONSTRAINT `seasons_stats_ibfk_1` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`),
  CONSTRAINT `seasons_stats_ibfk_2` FOREIGN KEY (`goals_on_season_id`) REFERENCES `goals_on_seasons` (`id`),
  CONSTRAINT `seasons_stats_ibfk_3` FOREIGN KEY (`assists_on_season_id`) REFERENCES `assists_on_seasons` (`id`),
  CONSTRAINT `seasons_stats_ibfk_4` FOREIGN KEY (`yellow_cards_on_season_id`) REFERENCES `yellow_cards_on_seasons` (`id`),
  CONSTRAINT `seasons_stats_ibfk_5` FOREIGN KEY (`red_cards_on_season_id`) REFERENCES `red_cards_on_seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons_stats`
--

LOCK TABLES `seasons_stats` WRITE;
/*!40000 ALTER TABLE `seasons_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `seasons_stats` ENABLE KEYS */;
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
  `logo_url` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
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
  `player_id` int(10) unsigned NOT NULL,
  `yellow_cards_obtained` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `yellow_cards_on_seasons_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`)
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

-- Dump completed on 2020-11-02 23:01:10
