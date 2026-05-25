-- MySQL dump 10.13  Distrib 8.4.8, for macos15 (arm64)
--
-- Host: localhost    Database: CourseLog
-- ------------------------------------------------------
-- Server version	8.4.8

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_text` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'This looks very clean, nice work!',2,1,'2026-05-24 14:29:21'),(2,'Normalization is important for the report.',4,2,'2026-05-24 14:29:21'),(3,'Good progress on the web project.',3,3,'2026-05-24 14:29:21'),(4,'Joins were confusing at first but this helps.',1,4,'2026-05-24 14:29:21'),(5,'Can you share your notes?',7,5,'2026-05-24 14:29:21'),(6,'The layout looks much better now.',6,6,'2026-05-24 14:29:21'),(7,'OOP examples are useful.',5,7,'2026-05-24 14:29:21'),(8,'Your schema looks organized.',1,8,'2026-05-24 14:29:21'),(9,'Linked lists need practice for sure.',7,9,'2026-05-24 14:29:21'),(10,'Nice Java progress.',3,10,'2026-05-24 14:29:21'),(11,'This summary is helpful.',8,11,'2026-05-24 14:29:21'),(12,'Bootstrap is easier with examples.',1,12,'2026-05-24 14:29:21'),(13,'Good luck with the stats quiz.',2,13,'2026-05-24 14:29:21'),(14,'Nice start for the project.',4,14,'2026-05-24 14:29:21'),(15,'CHECK constraints are a good addition.',1,15,'2026-05-24 14:29:21'),(16,'Nice improvement on the ER diagram.',2,16,'2026-05-24 14:33:55'),(17,'The REST API structure looks clean.',3,17,'2026-05-24 14:33:55'),(18,'Aggregation queries are very useful.',4,18,'2026-05-24 14:33:55'),(19,'Good luck with the statistics homework.',5,19,'2026-05-24 14:33:55'),(20,'Frontend looks smoother now.',6,20,'2026-05-24 14:33:55'),(21,'Interfaces are important in Java.',7,21,'2026-05-24 14:33:55'),(22,'Foreign keys are connected correctly.',8,22,'2026-05-24 14:33:55'),(23,'Linked lists are difficult at first.',1,23,'2026-05-24 14:33:55'),(24,'Recursion needs a lot of practice.',2,24,'2026-05-24 14:33:55'),(25,'Queue examples are very clear.',3,25,'2026-05-24 14:33:55'),(26,'The CSS looks cleaner now.',4,26,'2026-05-24 14:33:55'),(27,'These statistics notes are useful.',5,27,'2026-05-24 14:33:55'),(28,'The project timeline is organized.',6,28,'2026-05-24 14:33:55'),(29,'The updated ER diagram looks professional.',7,29,'2026-05-24 14:33:55');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_repos`
--

DROP TABLE IF EXISTS `course_repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_repos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `progress_percentage` int DEFAULT '0',
  `final_grade` decimal(5,2) DEFAULT NULL,
  `repo_status` varchar(30) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `course_repos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `course_repos_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `course_repos_chk_1` CHECK ((`progress_percentage` between 0 and 100)),
  CONSTRAINT `course_repos_chk_2` CHECK ((`repo_status` in (_utf8mb4'active',_utf8mb4'completed',_utf8mb4'paused',_utf8mb4'dropped'))),
  CONSTRAINT `course_repos_chk_3` CHECK (((`final_grade` is null) or (`final_grade` between 0 and 100)))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_repos`
--

LOCK TABLES `course_repos` WRITE;
/*!40000 ALTER TABLE `course_repos` DISABLE KEYS */;
INSERT INTO `course_repos` VALUES (1,1,1,65,NULL,'active','2026-05-24 14:29:21'),(2,1,5,80,NULL,'active','2026-05-24 14:29:21'),(3,2,1,70,NULL,'active','2026-05-24 14:29:21'),(4,2,4,55,NULL,'active','2026-05-24 14:29:21'),(5,3,5,90,88.50,'completed','2026-05-24 14:29:21'),(6,3,2,60,NULL,'active','2026-05-24 14:29:21'),(7,4,1,85,NULL,'active','2026-05-24 14:29:21'),(8,4,3,50,NULL,'paused','2026-05-24 14:29:21'),(9,5,2,75,NULL,'active','2026-05-24 14:29:21'),(10,5,3,68,NULL,'active','2026-05-24 14:29:21'),(11,6,5,72,NULL,'active','2026-05-24 14:29:21'),(12,7,4,66,NULL,'active','2026-05-24 14:29:21'),(13,8,1,40,NULL,'active','2026-05-24 14:29:21'),(14,19,1,92,94.00,'completed','2026-05-25 11:08:17'),(15,20,1,78,NULL,'active','2026-05-25 11:08:17'),(16,23,5,88,NULL,'active','2026-05-25 11:08:17'),(17,24,1,67,NULL,'active','2026-05-25 11:08:17'),(18,25,4,73,NULL,'active','2026-05-25 11:08:17'),(19,26,3,35,NULL,'paused','2026-05-25 11:08:17');
/*!40000 ALTER TABLE `course_repos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_code` varchar(20) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `credits` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_code` (`course_code`),
  CONSTRAINT `courses_chk_1` CHECK ((`credits` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'COMP2004','Database Management Systems','Spring 2026',5,'2026-05-24 14:29:21'),(2,'COMP2010','Object Oriented Programming','Spring 2026',5,'2026-05-24 14:29:21'),(3,'COMP2022','Data Structures','Spring 2026',6,'2026-05-24 14:29:21'),(4,'STAT2004','Statistics','Spring 2026',4,'2026-05-24 14:29:21'),(5,'COMP3001','Web Development','Spring 2026',5,'2026-05-24 14:29:21'),(6,'MATH2010','Differential Equations','Spring 2026',4,'2026-05-24 14:29:21');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `follower_id` int NOT NULL,
  `followee_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`follower_id`,`followee_id`),
  KEY `followee_id` (`followee_id`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`followee_id`) REFERENCES `users` (`id`),
  CONSTRAINT `follows_chk_1` CHECK ((`follower_id` <> `followee_id`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (1,2,'2026-05-24 14:29:21'),(1,3,'2026-05-24 14:33:55'),(1,4,'2026-05-24 14:29:21'),(2,1,'2026-05-24 14:29:21'),(2,4,'2026-05-24 14:33:55'),(2,7,'2026-05-24 14:29:21'),(3,1,'2026-05-24 14:29:21'),(3,5,'2026-05-24 14:33:55'),(3,6,'2026-05-24 14:29:21'),(4,1,'2026-05-24 14:29:21'),(4,6,'2026-05-24 14:33:55'),(4,8,'2026-05-24 14:29:21'),(5,3,'2026-05-24 14:29:21'),(5,7,'2026-05-24 14:29:21'),(5,8,'2026-05-24 14:33:55'),(6,1,'2026-05-24 14:29:21'),(6,2,'2026-05-24 14:33:55'),(6,3,'2026-05-24 14:29:21'),(7,1,'2026-05-24 14:33:55'),(7,2,'2026-05-24 14:29:21'),(7,5,'2026-05-24 14:29:21'),(8,1,'2026-05-24 14:29:21'),(8,4,'2026-05-24 14:29:21'),(8,7,'2026-05-24 14:33:55'),(19,23,'2026-05-25 11:08:17'),(20,24,'2026-05-25 11:08:17'),(23,26,'2026-05-25 11:08:17'),(24,25,'2026-05-25 11:08:17'),(25,19,'2026-05-25 11:08:17'),(25,20,'2026-05-25 11:08:17'),(25,21,'2026-05-25 11:08:17'),(25,22,'2026-05-25 11:08:17'),(25,23,'2026-05-25 11:08:17'),(25,24,'2026-05-25 11:08:17');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,4,'2026-05-24 14:29:21'),(1,8,'2026-05-24 14:29:21'),(1,13,'2026-05-24 14:29:21'),(1,18,'2026-05-24 14:33:55'),(1,22,'2026-05-24 14:33:55'),(2,1,'2026-05-24 14:29:21'),(2,5,'2026-05-24 14:29:21'),(2,10,'2026-05-24 14:29:21'),(2,18,'2026-05-24 14:33:55'),(2,22,'2026-05-24 14:33:55'),(3,1,'2026-05-24 14:29:21'),(3,11,'2026-05-24 14:29:21'),(3,19,'2026-05-24 14:33:55'),(3,23,'2026-05-24 14:33:55'),(4,1,'2026-05-24 14:29:21'),(4,12,'2026-05-24 14:29:21'),(4,19,'2026-05-24 14:33:55'),(4,23,'2026-05-24 14:33:55'),(5,4,'2026-05-24 14:29:21'),(5,13,'2026-05-24 14:29:21'),(5,16,'2026-05-24 14:33:55'),(5,20,'2026-05-24 14:33:55'),(5,24,'2026-05-24 14:33:55'),(6,6,'2026-05-24 14:29:21'),(6,14,'2026-05-24 14:29:21'),(6,16,'2026-05-24 14:33:55'),(6,20,'2026-05-24 14:33:55'),(6,24,'2026-05-24 14:33:55'),(7,6,'2026-05-24 14:29:21'),(7,15,'2026-05-24 14:29:21'),(7,17,'2026-05-24 14:33:55'),(7,21,'2026-05-24 14:33:55'),(7,25,'2026-05-24 14:33:55'),(8,8,'2026-05-24 14:29:21'),(8,15,'2026-05-24 14:29:21'),(8,17,'2026-05-24 14:33:55'),(8,21,'2026-05-24 14:33:55'),(8,25,'2026-05-24 14:33:55'),(19,33,'2026-05-25 11:08:17'),(19,36,'2026-05-25 11:08:17'),(20,33,'2026-05-25 11:08:17'),(20,37,'2026-05-25 11:08:17'),(21,33,'2026-05-25 11:08:17'),(22,33,'2026-05-25 11:08:17'),(23,34,'2026-05-25 11:08:17'),(24,33,'2026-05-25 11:08:17'),(25,33,'2026-05-25 11:08:17'),(25,34,'2026-05-25 11:08:17');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file_url` varchar(255) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `repo_id` int NOT NULL,
  `uploaded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`),
  CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`repo_id`) REFERENCES `course_repos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (1,'ER Diagram Draft','/files/dbms_er_diagram.png','image',1,'2026-05-24 14:29:21'),(2,'Normalization Summary','/files/normalization_notes.pdf','pdf',1,'2026-05-24 14:29:21'),(3,'Express Routing Notes','/files/express_routes.pdf','pdf',2,'2026-05-24 14:29:21'),(4,'SQL Joins Examples','/files/sql_joins.sql','sql',3,'2026-05-24 14:29:21'),(5,'Confidence Interval Notes','/files/confidence_intervals.pdf','pdf',4,'2026-05-24 14:29:21'),(6,'Web Project Screenshots','/files/web_project_screenshots.zip','zip',5,'2026-05-24 14:29:21'),(7,'OOP Class Diagram','/files/oop_class_diagram.png','image',6,'2026-05-24 14:29:21'),(8,'Database Tables Script','/files/courselog_schema.sql','sql',7,'2026-05-24 14:29:21'),(9,'Linked List Notes','/files/linked_lists.pdf','pdf',8,'2026-05-24 14:29:21'),(10,'Java Assignment File','/files/java_assignment.docx','docx',9,'2026-05-24 14:29:21'),(11,'Stack Queue Summary','/files/stack_queue.pdf','pdf',10,'2026-05-24 14:29:21'),(12,'Bootstrap Components','/files/bootstrap_components.pdf','pdf',11,'2026-05-24 14:29:21'),(13,'Hypothesis Testing Sheet','/files/hypothesis_testing.pdf','pdf',12,'2026-05-24 14:29:21'),(14,'DBMS Project Plan','/files/dbms_project_plan.pdf','pdf',13,'2026-05-24 14:29:21'),(15,'SQL Constraints Notes','/files/sql_constraints.pdf','pdf',1,'2026-05-24 14:31:22'),(16,'REST API Diagram','/files/rest_api.png','image',2,'2026-05-24 14:31:22'),(17,'Aggregation Exercises','/files/aggregation.sql','sql',3,'2026-05-24 14:31:22'),(18,'Statistics Homework Sheet','/files/stat_homework.pdf','pdf',4,'2026-05-24 14:31:22'),(19,'Frontend Mockups','/files/frontend_mockups.zip','zip',5,'2026-05-24 14:31:22'),(20,'Java Interface Notes','/files/interfaces.pdf','pdf',6,'2026-05-24 14:31:22'),(21,'Foreign Key Schema','/files/foreign_keys.sql','sql',7,'2026-05-24 14:31:22'),(22,'Linked List Examples','/files/linked_list_examples.pdf','pdf',8,'2026-05-24 14:31:22'),(23,'Recursion Quiz Notes','/files/recursion_notes.pdf','pdf',9,'2026-05-24 14:31:22'),(24,'Queue Practice File','/files/queue_practice.docx','docx',10,'2026-05-24 14:31:22'),(25,'CSS Components','/files/css_components.pdf','pdf',11,'2026-05-24 14:31:22'),(26,'Confidence Interval Sheet','/files/confidence_sheet.pdf','pdf',12,'2026-05-24 14:31:22'),(27,'Project Timeline Draft','/files/project_timeline.pdf','pdf',13,'2026-05-24 14:31:22'),(28,'Updated ER Diagram','/files/updated_er.png','image',1,'2026-05-24 14:31:22'),(29,'DBMS Final Summary PDF','/files/dbms_final_summary.pdf','pdf',14,'2026-05-25 11:08:17'),(30,'Normalization Cheat Sheet','/files/normalization_cheatsheet.pdf','pdf',15,'2026-05-25 11:08:17'),(31,'ER Diagram Image','/files/er_diagram_final.png','png',15,'2026-05-25 11:08:17'),(32,'Web Project Screenshot','/files/web_project_ui.png','png',16,'2026-05-25 11:08:17'),(33,'Backend Code Zip','/files/backend_code.zip','zip',16,'2026-05-25 11:08:17'),(34,'DBMS Notes PDF 1','/files/dbms_notes_1.pdf','pdf',17,'2026-05-25 11:08:17'),(35,'DBMS Notes PDF 2','/files/dbms_notes_2.pdf','pdf',17,'2026-05-25 11:08:17'),(36,'Statistics Practice DOCX','/files/statistics_practice.docx','docx',18,'2026-05-25 11:08:17');
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `progress_status` varchar(30) DEFAULT 'in_progress',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`repo_id`) REFERENCES `course_repos` (`id`),
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_chk_1` CHECK ((`progress_status` in (_utf8mb4'started',_utf8mb4'in_progress',_utf8mb4'completed',_utf8mb4'improved',_utf8mb4'blocked')))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,1,'Finished ER Diagram','Completed the first version of the ER diagram for the DBMS project.','completed','2026-05-24 14:29:21'),(2,1,1,'Started Normalization','Started reviewing 1NF, 2NF, and 3NF concepts.','started','2026-05-24 14:29:21'),(3,2,1,'Built Express Routes','Created basic routes for my web development project.','completed','2026-05-24 14:29:21'),(4,3,2,'SQL Joins Practice','Practiced inner joins and left joins using sample tables.','completed','2026-05-24 14:29:21'),(5,4,2,'Statistics Notes','Uploaded notes about confidence intervals.','in_progress','2026-05-24 14:29:21'),(6,5,3,'Final Web Project Update','Finished the main layout and database connection.','completed','2026-05-24 14:29:21'),(7,6,3,'OOP Classes Review','Reviewed inheritance and polymorphism examples.','in_progress','2026-05-24 14:29:21'),(8,7,4,'Database Schema Done','Created tables with primary keys and foreign keys.','completed','2026-05-24 14:29:21'),(9,8,4,'Paused Data Structures','Need to review linked lists before continuing.','blocked','2026-05-24 14:29:21'),(10,9,5,'Java Assignment Progress','Implemented the first part of the assignment.','in_progress','2026-05-24 14:29:21'),(11,10,5,'Stack and Queue Notes','Added notes about stacks and queues.','completed','2026-05-24 14:29:21'),(12,11,6,'Bootstrap Layout','Improved the responsive design of the project.','improved','2026-05-24 14:29:21'),(13,12,7,'Statistics Practice','Solved problems about hypothesis testing.','completed','2026-05-24 14:29:21'),(14,13,8,'DBMS Project Started','Created the first repository for Database Management Systems.','started','2026-05-24 14:29:21'),(15,13,8,'SQL Constraints Added','Added CHECK and UNIQUE constraints to the schema.','completed','2026-05-24 14:29:21'),(16,1,1,'Finished SQL Constraints','Added UNIQUE and CHECK constraints to all tables.','completed','2026-05-24 14:31:22'),(17,2,1,'REST API Progress','Finished GET and POST routes for the project.','in_progress','2026-05-24 14:31:22'),(18,3,2,'Aggregation Practice','Solved AVG and GROUP BY exercises.','completed','2026-05-24 14:31:22'),(19,4,2,'Statistics Homework','Started solving hypothesis testing questions.','started','2026-05-24 14:31:22'),(20,5,3,'Frontend Update','Improved navbar and responsive layout.','improved','2026-05-24 14:31:22'),(21,6,3,'Java Review','Reviewed abstract classes and interfaces.','completed','2026-05-24 14:31:22'),(22,7,4,'Foreign Keys Added','Connected all related tables correctly.','completed','2026-05-24 14:31:22'),(23,8,4,'Linked List Revision','Reviewed insertion and deletion operations.','in_progress','2026-05-24 14:31:22'),(24,9,5,'Quiz Preparation','Practiced recursion and stack questions.','started','2026-05-24 14:31:22'),(25,10,5,'Queue Exercises','Solved queue implementation exercises.','completed','2026-05-24 14:31:22'),(26,11,6,'CSS Improvements','Improved button styling and spacing.','improved','2026-05-24 14:31:22'),(27,12,7,'Statistics Notes Uploaded','Uploaded notes for confidence intervals.','completed','2026-05-24 14:31:22'),(28,13,8,'Project Timeline','Created a timeline for the DBMS project.','completed','2026-05-24 14:31:22'),(29,1,1,'ER Diagram Improvements','Cleaned and reorganized the EER diagram.','improved','2026-05-24 14:31:22'),(30,3,2,'Subqueries Practice','Practiced nested SQL queries.','completed','2026-05-24 14:31:22'),(31,14,19,'Completed DBMS Repository','Finished all DBMS project requirements and documentation.','completed','2026-05-20 07:10:00'),(32,15,20,'Normalization Progress','Finished 1NF and 2NF examples.','completed','2026-05-21 10:45:00'),(33,16,23,'Web Project Milestone','Finished backend routing and views.','improved','2026-05-22 06:20:00'),(34,17,24,'Uploaded DBMS PDF Pack','Added several PDF summaries for database design.','completed','2026-05-22 12:40:00'),(35,18,25,'Statistics Revision Update','Reviewed confidence intervals and hypothesis testing.','in_progress','2026-05-23 14:00:00'),(36,19,26,'Blocked on Data Structures','Need help understanding tree traversal problems.','blocked','2026-05-24 08:30:00'),(37,19,26,'Still Blocked on Recursion','Recursion examples are still confusing.','blocked','2026-05-24 13:50:00');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `repo_id` int NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text,
  `due_date` date DEFAULT NULL,
  `status` varchar(30) DEFAULT 'not_started',
  `grade` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`repo_id`) REFERENCES `course_repos` (`id`),
  CONSTRAINT `tasks_chk_1` CHECK ((`status` in (_utf8mb4'not_started',_utf8mb4'in_progress',_utf8mb4'completed',_utf8mb4'late',_utf8mb4'cancelled'))),
  CONSTRAINT `tasks_chk_2` CHECK (((`grade` is null) or (`grade` between 0 and 100)))
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,1,'Create ER Diagram','Design the logical ER diagram.','2026-05-25','completed',95.00,'2026-05-24 14:29:21'),(2,1,'Write SQL Schema','Create all physical database tables.','2026-05-27','completed',90.00,'2026-05-24 14:29:21'),(3,1,'Add Sample Data','Insert meaningful records across all tables.','2026-05-29','in_progress',NULL,'2026-05-24 14:29:21'),(4,2,'Finish Routes','Complete CRUD routes.','2026-05-26','completed',88.00,'2026-05-24 14:29:21'),(5,3,'Practice Joins','Solve SQL join exercises.','2026-05-24','completed',92.00,'2026-05-24 14:29:21'),(6,4,'Solve Statistics Quiz','Review confidence interval examples.','2026-05-28','in_progress',NULL,'2026-05-24 14:29:21'),(7,5,'Finalize Web Project','Prepare demo version.','2026-05-30','completed',89.00,'2026-05-24 14:29:21'),(8,6,'Review OOP Concepts','Study inheritance and interfaces.','2026-05-29','in_progress',NULL,'2026-05-24 14:29:21'),(9,7,'Check 3NF','Verify that tables satisfy 3NF.','2026-05-28','completed',94.00,'2026-05-24 14:29:21'),(10,8,'Review Linked Lists','Study linked list operations.','2026-06-01','not_started',NULL,'2026-05-24 14:29:21'),(11,9,'Submit Java Assignment','Upload Java assignment file.','2026-05-31','in_progress',NULL,'2026-05-24 14:29:21'),(12,10,'Data Structures Practice','Solve stack and queue questions.','2026-05-30','completed',87.00,'2026-05-24 14:29:21'),(13,11,'Improve UI','Fix Bootstrap layout problems.','2026-05-27','completed',91.00,'2026-05-24 14:29:21'),(14,12,'Solve Hypothesis Problems','Practice z-test and p-value questions.','2026-05-29','completed',85.00,'2026-05-24 14:29:21'),(15,13,'Prepare DBMS Report','Write project report sections.','2026-06-01','in_progress',NULL,'2026-05-24 14:29:21'),(29,1,'Review SQL Constraints','Check all table constraints.','2026-06-02','completed',93.00,'2026-05-24 14:33:55'),(30,2,'Build REST API','Create CRUD endpoints.','2026-06-03','in_progress',NULL,'2026-05-24 14:33:55'),(31,3,'Practice Aggregates','Solve aggregate function exercises.','2026-06-01','completed',90.00,'2026-05-24 14:33:55'),(32,4,'Finish Statistics HW','Complete all statistics questions.','2026-06-04','in_progress',NULL,'2026-05-24 14:33:55'),(33,5,'Improve Frontend','Fix responsive layout issues.','2026-06-02','completed',88.00,'2026-05-24 14:33:55'),(34,6,'Review Interfaces','Study Java interfaces deeply.','2026-06-03','completed',91.00,'2026-05-24 14:33:55'),(35,7,'Test Relationships','Verify all foreign key relations.','2026-06-01','completed',95.00,'2026-05-24 14:33:55'),(36,8,'Solve Linked Lists','Practice linked list coding problems.','2026-06-05','in_progress',NULL,'2026-05-24 14:33:55'),(37,9,'Prepare Quiz','Review recursion examples.','2026-06-04','in_progress',NULL,'2026-05-24 14:33:55'),(38,10,'Complete Queue Sheet','Finish queue exercises.','2026-06-03','completed',87.00,'2026-05-24 14:33:55'),(39,11,'Refactor CSS','Organize CSS classes.','2026-06-02','completed',89.00,'2026-05-24 14:33:55'),(40,12,'Statistics Revision','Review confidence intervals.','2026-06-01','completed',86.00,'2026-05-24 14:33:55'),(41,13,'Prepare Presentation','Create project presentation slides.','2026-06-06','in_progress',NULL,'2026-05-24 14:33:55'),(42,14,'Submit Final Report','Upload the final DBMS project report.','2026-05-28','completed',96.00,'2026-05-25 11:08:17'),(43,15,'Review 3NF','Check all schema tables for 3NF.','2026-05-29','in_progress',NULL,'2026-05-25 11:08:17'),(44,16,'Finish Frontend Demo','Prepare project demo screens.','2026-05-30','completed',91.00,'2026-05-25 11:08:17'),(45,17,'Organize PDFs','Rename and organize uploaded PDFs.','2026-05-31','in_progress',NULL,'2026-05-25 11:08:17'),(46,18,'Practice Statistics','Solve 10 statistics examples.','2026-06-01','not_started',NULL,'2026-05-25 11:08:17'),(47,19,'Solve Tree Traversal','Practice preorder and postorder traversal.','2026-06-02','late',NULL,'2026-05-25 11:08:17');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `bio` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ali_dev','ali@example.com','Ali','Alneela','Software engineering student interested in databases and web development.','2026-05-24 14:29:21'),(2,'sara_ai','sara@example.com','Sara','Demir','Interested in AI, Python, and data science.','2026-05-24 14:29:21'),(3,'mert_web','mert@example.com','Mert','Yilmaz','Frontend and backend development learner.','2026-05-24 14:29:21'),(4,'zeynep_db','zeynep@example.com','Zeynep','Kaya','Focused on database design and SQL.','2026-05-24 14:29:21'),(5,'omar_code','omar@example.com','Omar','Hassan','Computer science student building course projects.','2026-05-24 14:29:21'),(6,'lina_ui','lina@example.com','Lina','Aksoy','Interested in UI design and software projects.','2026-05-24 14:29:21'),(7,'emre_data','emre@example.com','Emre','Can','Learning data structures and analytics.','2026-05-24 14:29:21'),(8,'nour_se','nour@example.com','Nour','Sahin','Software engineering student tracking academic progress.','2026-05-24 14:29:21'),(9,'kerem_js','kerem@example.com','Kerem','Aydin','Interested in JavaScript and backend systems.','2026-05-24 14:34:57'),(10,'yasmin_ml','yasmin@example.com','Yasmin','Khaled','Machine learning and AI enthusiast.','2026-05-24 14:34:57'),(11,'baris_cpp','baris@example.com','Baris','Demir','C++ and algorithms learner.','2026-05-24 14:34:57'),(12,'rana_design','rana@example.com','Rana','Yildiz','UI/UX designer and frontend learner.','2026-05-24 14:34:57'),(13,'ahmed_linux','ahmed@example.com','Ahmed','Saleh','Interested in Linux and system programming.','2026-05-24 14:34:57'),(14,'selin_stats','selin@example.com','Selin','Arslan','Statistics and data analysis student.','2026-05-24 14:34:57'),(15,'yusuf_java','yusuf@example.com','Yusuf','Kara','Focused on Java and OOP concepts.','2026-05-24 14:34:57'),(16,'deniz_web','deniz@example.com','Deniz','Celik','Building MERN stack projects.','2026-05-24 14:34:57'),(17,'farah_sql','farah@example.com','Farah','Nasser','Practicing SQL queries and database design.','2026-05-24 14:34:57'),(18,'kaan_dev','kaan@example.com','Kaan','Eren','Software engineering student interested in web apps.','2026-05-24 14:34:57'),(19,'oldest_ayla','ayla@example.com','Ayla','Koc','Early CourseLog user.','2025-09-01 06:15:00'),(20,'early_mohammed','mohammed@example.com','Mohammed','Naji','Uses CourseLog for DBMS progress.','2025-09-03 11:20:00'),(21,'inactive_huda','huda@example.com','Huda','Yasin','Joined but has not posted yet.','2025-09-05 07:00:00'),(22,'inactive_efe','efe@example.com','Efe','Bulut','New user still exploring the platform.','2025-09-07 15:30:00'),(23,'active_mina','mina@example.com','Mina','Arslan','Posts course progress frequently.','2025-09-08 09:10:00'),(24,'pdf_master','pdfmaster@example.com','Can','Oz','Uploads many PDF materials.','2025-09-10 13:45:00'),(25,'social_leader','leader@example.com','Leyla','Demir','Very active in following students.','2025-09-13 08:25:00'),(26,'blocked_student','blocked@example.com','Samir','Kara','Currently blocked in some course tasks.','2025-09-15 17:05:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'CourseLog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-25 14:42:03
