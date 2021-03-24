
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Course Name',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'Course Description',
  `language` varchar(2) NOT NULL DEFAULT '' COMMENT 'Language',
  `status` int NOT NULL DEFAULT '0' COMMENT '-1 = Annullato\r\n0 = New\r\n\r\n2 = Pubblicato\r\n3 = Eseguito',
  `start_date` date DEFAULT NULL COMMENT 'Course Start Date',
  `start_time` time DEFAULT NULL COMMENT 'Course Start Time',
  `end_time` time DEFAULT NULL COMMENT 'Course End Time',
  `note` text,
  `close` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'Course is finished = ''Y''',
  `max_register` int DEFAULT '0' COMMENT 'Max count register',
  `courses_type_id` bigint DEFAULT NULL COMMENT 'Course Type',
  `location_id` bigint DEFAULT NULL COMMENT 'Course Location',
  PRIMARY KEY (`id`),
  KEY `index_courses_on_courses_type_id` (`courses_type_id`),
  KEY `index_courses_on_location_id` (`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Corso/Courses';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `courses_dealers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_dealers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mail_count` int NOT NULL DEFAULT '0' COMMENT '0 = no mail, count mail sending',
  `participate` varchar(1) DEFAULT 'N' COMMENT 'Conferm participate : Y',
  `date_participate` date DEFAULT NULL COMMENT 'Registrazione date',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT 'Dealers / Users with type = ''D''',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT 'Course ID',
  PRIMARY KEY (`id`),
  KEY `index_courses_dealers_on_user_id` (`user_id`),
  KEY `index_courses_dealers_on_course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Courses Dealers';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `courses_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_participants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `mail_count` int NOT NULL DEFAULT '0' COMMENT '0 = no mail, count mail sending',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT 'Users with type ''C'', ''V''',
  `courses_dealer_id` bigint NOT NULL DEFAULT '0' COMMENT 'Course Dealer id',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT 'Course id',
  PRIMARY KEY (`id`),
  KEY `index_courses_participants_on_user_id` (`user_id`),
  KEY `index_courses_participants_on_courses_dealer_id` (`courses_dealer_id`),
  KEY `index_courses_participants_on_course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Courses Participants';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `courses_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_registers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `people` varchar(255) NOT NULL DEFAULT '' COMMENT 'Participant People',
  `vote` varchar(1) NOT NULL DEFAULT '' COMMENT 'Participant Vote\r\nY : graduate , N : rejected',
  `rating` mediumtext COMMENT 'Participant Rating',
  `email` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) NOT NULL DEFAULT '' COMMENT 'telephone number',
  `register_type_code` varchar(5) NOT NULL DEFAULT '' COMMENT 'tabel register type id',
  `courses_participant_id` bigint NOT NULL DEFAULT '0' COMMENT 'tabel courses participants id',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT 'tabel courses id',
  PRIMARY KEY (`id`),
  KEY `index_courses_registers_on_courses_participant_id` (`courses_participant_id`),
  KEY `index_courses_registers_on_course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Courses Registers';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `courses_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_teachers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT 'Teachers / Users with type = ''T''',
  `course_id` bigint NOT NULL DEFAULT '0' COMMENT 'Course ID',
  PRIMARY KEY (`id`),
  KEY `index_courses_teachers_on_user_id` (`user_id`),
  KEY `index_courses_teachers_on_course_id` (`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Courses Teachers';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `courses_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses_types` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Course Register ID',
  `note` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tipo di ruolo / Types roles';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `nation` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Locations';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `register_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(1) NOT NULL DEFAULT '0',
  `nameIT` varchar(50) NOT NULL DEFAULT '' COMMENT 'Italiano',
  `nameEN` varchar(50) NOT NULL DEFAULT '' COMMENT 'Inglese',
  `nameFR` varchar(50) NOT NULL DEFAULT '' COMMENT 'Francais',
  `nameDE` varchar(50) NOT NULL DEFAULT '' COMMENT 'Germain',
  `nameES` varchar(50) NOT NULL DEFAULT '' COMMENT 'Spana',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Types register';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `roles_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(1) NOT NULL DEFAULT '0',
  `nameIT` varchar(50) NOT NULL DEFAULT '' COMMENT 'Italiano',
  `nameEN` varchar(50) NOT NULL DEFAULT '' COMMENT 'Inglese',
  `nameFR` varchar(50) NOT NULL DEFAULT '' COMMENT 'Francais',
  `nameDE` varchar(50) NOT NULL DEFAULT '' COMMENT 'Germain',
  `nameES` varchar(50) NOT NULL DEFAULT '' COMMENT 'Spana',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tipo di ruolo / Types roles';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `first_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'First Name',
  `last_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Last Name',
  `nation` varchar(5) NOT NULL DEFAULT '' COMMENT 'Nation',
  `language` varchar(2) NOT NULL DEFAULT '' COMMENT 'Language for form',
  `as_400` varchar(80) NOT NULL DEFAULT '' COMMENT 'Code ERP',
  `note` varchar(255) DEFAULT NULL,
  `area` varchar(100) NOT NULL DEFAULT '' COMMENT 'Geografic Area',
  `roles_type_code` varchar(1) NOT NULL DEFAULT '' COMMENT 'id Tabel: Roles_type',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Users';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

INSERT INTO `schema_migrations` (version) VALUES
('20210321131906'),
('20210321141622'),
('20210322120434'),
('20210322120821'),
('20210322121953'),
('20210322124111'),
('20210322130231'),
('20210322131228'),
('20210322134049'),
('20210322135845');


