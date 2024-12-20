-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: picafe
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Admin supremo'),(2,'Faz quase nada');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,2,5);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add product',1,'add_product'),(2,'Can change product',1,'change_product'),(3,'Can delete product',1,'delete_product'),(4,'Can view product',1,'view_product'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add cart item',8,'add_cartitem'),(30,'Can change cart item',8,'change_cartitem'),(31,'Can delete cart item',8,'delete_cartitem'),(32,'Can view cart item',8,'view_cartitem'),(33,'Can add cart',9,'add_cart'),(34,'Can change cart',9,'change_cart'),(35,'Can delete cart',9,'delete_cart'),(36,'Can view cart',9,'view_cart'),(37,'Can add historic',10,'add_historic'),(38,'Can change historic',10,'change_historic'),(39,'Can delete historic',10,'delete_historic'),(40,'Can view historic',10,'view_historic'),(41,'Can add order',11,'add_order'),(42,'Can change order',11,'change_order'),(43,'Can delete order',11,'delete_order'),(44,'Can view order',11,'view_order'),(45,'Can add profile',12,'add_profile'),(46,'Can change profile',12,'change_profile'),(47,'Can delete profile',12,'delete_profile'),(48,'Can view profile',12,'view_profile'),(49,'Can add user address',13,'add_useraddress'),(50,'Can change user address',13,'change_useraddress'),(51,'Can delete user address',13,'delete_useraddress'),(52,'Can view user address',13,'view_useraddress'),(53,'Can add M├®todo de Pagamento',14,'add_userpayments'),(54,'Can change M├®todo de Pagamento',14,'change_userpayments'),(55,'Can delete M├®todo de Pagamento',14,'delete_userpayments'),(56,'Can view M├®todo de Pagamento',14,'view_userpayments'),(57,'Can add wishlist',15,'add_wishlist'),(58,'Can change wishlist',15,'change_wishlist'),(59,'Can delete wishlist',15,'delete_wishlist'),(60,'Can view wishlist',15,'view_wishlist'),(61,'Can add feedback',16,'add_feedback'),(62,'Can change feedback',16,'change_feedback'),(63,'Can delete feedback',16,'delete_feedback'),(64,'Can view feedback',16,'view_feedback'),(65,'Can add category',17,'add_category'),(66,'Can change category',17,'change_category'),(67,'Can delete category',17,'delete_category'),(68,'Can view category',17,'view_category'),(69,'Can add Transportadora',18,'add_carrier'),(70,'Can change Transportadora',18,'change_carrier'),(71,'Can delete Transportadora',18,'delete_carrier'),(72,'Can view Transportadora',18,'view_carrier'),(73,'Can add discount',19,'add_discount'),(74,'Can change discount',19,'change_discount'),(75,'Can delete discount',19,'delete_discount'),(76,'Can view discount',19,'view_discount'),(77,'Can add discount',20,'add_discount'),(78,'Can change discount',20,'change_discount'),(79,'Can delete discount',20,'delete_discount'),(80,'Can view discount',20,'view_discount'),(81,'Can add Mensagem',21,'add_message'),(82,'Can change Mensagem',21,'change_message'),(83,'Can delete Mensagem',21,'delete_message'),(84,'Can view Mensagem',21,'view_message'),(85,'Can add promotions',22,'add_promotions'),(86,'Can change promotions',22,'change_promotions'),(87,'Can delete promotions',22,'delete_promotions'),(88,'Can view promotions',22,'view_promotions');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$SrnJC90QB9y9UWbztPE6xz$VFh2xrSJRj47gbUTae/jNdSravbjkOWIwJC+Xoj0/3I=','2024-12-05 01:26:32.533327',1,'brunao','Bruno','Favaro','brunao@brunao.com',1,1,'2024-11-09 14:23:53.000000'),(2,'pbkdf2_sha256$600000$5pGZcyFNNoxsCuAw6XeRVx$f7jxdCw3Oi3a4JhgBQlXzddByHNvrrImaGiBAKD5JDY=','2024-11-23 21:18:31.707900',0,'lucas','Lucas','Souza','lucas@lucas.com',0,1,'2024-11-09 17:03:35.672978'),(3,'pbkdf2_sha256$600000$B1dFFtVwYiSHpzry21zoHS$UodI+QQrApSz+9tgaraV1OxNS3H/szmh2dB8wIT7QCQ=','2024-12-05 01:26:36.906091',0,'Alexandre','','','aleyamagas@yopmail.com',0,1,'2024-11-15 17:16:04.623626'),(4,'pbkdf2_sha256$600000$vALuBTAuKPPIRlfKpcHS1q$w+5xJ3twB09+BGdqBF+MxU/15lRzGt61njItS1/ZBM4=','2024-11-21 13:41:11.681589',0,'souza','','','souza@gmail.com',0,1,'2024-11-21 13:41:11.113630'),(10,'pbkdf2_sha256$600000$XgtxL9aUgXCyhY5qWkNiAX$R+j6FScbJ+YWdM4m2EDO/l3VrFL8ze1QYunFRQXF1e4=','2024-11-21 14:01:47.965390',0,'Valdecir','','','valdecir@favaro.com',0,1,'2024-11-21 14:01:47.399807'),(11,'pbkdf2_sha256$600000$LgbxzT0BwLTNX6o82V8XyV$1aHZosMFjT9tq72ygsONDDeuUZziU7jXqau/7qpQXQg=','2024-11-21 14:03:59.330141',0,'anderson','','','anderson@marques',0,1,'2024-11-21 14:03:58.766061'),(12,'pbkdf2_sha256$600000$dRlvektjQbXdcqo3JSneXV$xj26U88kUcih06oy+STprpjkFLBq9pqWi4L82X/AxT4=','2024-11-21 14:08:14.746032',0,'paulo','paulo','plinio','paulo@plinio.com',0,1,'2024-11-21 14:08:14.123142'),(13,'pbkdf2_sha256$600000$twTU9OzE8xWKG4oQ63Utyr$YFYnNCU7idpusZjnhU2cSDdfvADsiTMnAbR+5IXS2D0=','2024-11-25 23:10:50.524321',0,'kamizika','Erich','Oliveira','erich@gmail.com',0,1,'2024-11-25 23:10:49.943790'),(14,'pbkdf2_sha256$600000$IAjPZUqjev7PMA0T9cykxK$fSdsXKNxiNaoW0NSgBV3+7QN7P2ju2q+ex8fCraARXc=','2024-12-02 13:06:30.602946',0,'Math','Felipe','Matheus','felipe@matheus.com',0,1,'2024-12-01 22:41:05.681746');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-09 14:26:32.661934','1','Caf├® da Som├ília',1,'[{\"added\": {}}]',1,1),(2,'2024-11-09 14:29:26.473673','2','Ch├í do Sud├úo',1,'[{\"added\": {}}]',1,1),(3,'2024-11-09 14:30:33.016135','3','Caf├® Pike Place',1,'[{\"added\": {}}]',1,1),(4,'2024-11-09 15:20:10.372026','4','Caf├® Premium',1,'[{\"added\": {}}]',1,1),(5,'2024-11-09 20:25:29.309238','4','Caf├® Premium',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',1,1),(6,'2024-11-09 20:27:30.952712','4','Caf├® Premium',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',1,1),(7,'2024-11-16 15:12:29.669080','6','Cart #6 - Alexandre',3,'',9,1),(8,'2024-11-16 15:12:40.882558','5','Cart #5 - Alexandre',3,'',9,1),(9,'2024-11-16 15:12:40.882558','4','Cart #4 - Alexandre',3,'',9,1),(10,'2024-11-16 15:12:40.883557','3','Cart #3 - Alexandre',3,'',9,1),(11,'2024-11-16 15:12:40.883557','2','Cart #2 - Alexandre',3,'',9,1),(12,'2024-11-16 15:12:40.883557','1','Cart #1 - Alexandre',3,'',9,1),(13,'2024-11-17 18:42:14.727561','9','Cart #9 - brunao',3,'',9,1),(14,'2024-11-17 18:42:14.727561','8','Cart #8 - brunao',3,'',9,1),(15,'2024-11-17 18:42:14.727561','7','Cart #7 - brunao',3,'',9,1),(16,'2024-11-17 18:47:35.811893','12','Cart #12 - brunao',3,'',9,1),(17,'2024-11-17 18:47:35.811893','11','Cart #11 - brunao',3,'',9,1),(18,'2024-11-17 18:47:35.811893','10','Cart #10 - brunao',3,'',9,1),(19,'2024-11-17 20:22:37.195784','13','Cart #13 - brunao',3,'',9,1),(20,'2024-11-17 20:22:42.436963','31','2 x Caf├® da Som├ília',3,'',8,1),(21,'2024-11-17 20:22:42.436963','30','4 x Ch├í do Sud├úo',3,'',8,1),(22,'2024-11-21 14:00:48.464708','9','Valdecir',3,'',5,1),(23,'2024-11-22 01:30:54.218920','2','brunao - Rua It├ília, Istambul',2,'[{\"changed\": {\"fields\": [\"Is default\"]}}]',13,1),(24,'2024-12-03 21:49:44.259851','1','Admin_supremo',1,'[{\"added\": {}}]',4,1),(25,'2024-12-03 21:49:48.688835','1','Admin_supremo',2,'[]',4,1),(26,'2024-12-03 21:50:15.604534','1','brunao',2,'[{\"changed\": {\"fields\": [\"First name\", \"Groups\"]}}]',5,1),(27,'2024-12-03 22:00:03.238381','1','Admin supremo',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',4,1),(28,'2024-12-03 22:01:37.869171','2','Faz quase nada',1,'[{\"added\": {}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(6,'contenttypes','contenttype'),(9,'pages','cart'),(8,'pages','cartitem'),(10,'pages','historic'),(11,'pages','order'),(1,'pages','product'),(22,'pages','promotions'),(15,'pages','wishlist'),(7,'sessions','session'),(18,'superuser','carrier'),(17,'superuser','category'),(20,'superuser','discount'),(19,'User','discount'),(16,'User','feedback'),(21,'User','message'),(12,'User','profile'),(13,'User','useraddress'),(14,'User','userpayments');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-09 14:21:03.035272'),(2,'auth','0001_initial','2024-11-09 14:21:03.573233'),(3,'admin','0001_initial','2024-11-09 14:21:03.691647'),(4,'admin','0002_logentry_remove_auto_add','2024-11-09 14:21:03.697673'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-09 14:21:03.704905'),(6,'contenttypes','0002_remove_content_type_name','2024-11-09 14:21:03.775211'),(7,'auth','0002_alter_permission_name_max_length','2024-11-09 14:21:03.830093'),(8,'auth','0003_alter_user_email_max_length','2024-11-09 14:21:03.850157'),(9,'auth','0004_alter_user_username_opts','2024-11-09 14:21:03.858189'),(10,'auth','0005_alter_user_last_login_null','2024-11-09 14:21:03.912554'),(11,'auth','0006_require_contenttypes_0002','2024-11-09 14:21:03.915233'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-09 14:21:03.921232'),(13,'auth','0008_alter_user_username_max_length','2024-11-09 14:21:03.973012'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-09 14:21:04.030067'),(15,'auth','0010_alter_group_name_max_length','2024-11-09 14:21:04.046479'),(16,'auth','0011_update_proxy_permissions','2024-11-09 14:21:04.054507'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-09 14:21:04.112318'),(18,'pages','0001_initial','2024-11-09 14:21:04.129658'),(19,'sessions','0001_initial','2024-11-09 14:21:04.157462'),(20,'pages','0002_cartitem','2024-11-09 21:08:24.521981'),(21,'pages','0003_cart','2024-11-16 14:32:19.519998'),(22,'pages','0004_cart_item','2024-11-16 15:11:02.691877'),(23,'pages','0005_rename_item_cart_items','2024-11-16 15:11:36.498842'),(24,'pages','0006_remove_cart_items_remove_cart_total_price_and_more','2024-11-17 18:28:42.818627'),(25,'pages','0007_cart_items_cart_total_price','2024-11-17 18:42:01.433173'),(26,'pages','0006_remove_cart_items_cartitem_cart','2024-11-18 21:36:14.075260'),(27,'pages','0007_pedido_historico','2024-11-18 21:36:22.120681'),(28,'pages','0008_rename_historico_historic_rename_pedido_order_and_more','2024-11-18 21:36:22.353347'),(29,'User','0001_initial','2024-11-21 14:47:47.548796'),(30,'User','0002_useraddress','2024-11-21 20:44:51.870812'),(31,'User','0003_userpayments','2024-11-23 02:45:57.038502'),(32,'User','0004_alter_userpayments_payment_type','2024-11-23 03:18:08.957298'),(33,'User','0005_alter_userpayments_payment_type','2024-11-23 03:19:01.244752'),(34,'User','0006_remove_userpayments_cvv_and_more','2024-11-23 14:19:01.696919'),(35,'pages','0009_wishlist','2024-11-24 22:35:04.828802'),(36,'superuser','0001_initial','2024-11-25 21:53:27.159779'),(37,'pages','0010_category_product_category','2024-11-25 21:53:27.309700'),(38,'pages','0011_alter_product_category_delete_category','2024-11-25 21:53:27.418530'),(39,'pages','0012_feedback','2024-11-25 21:53:27.553558'),(40,'pages','0013_delete_feedback','2024-11-25 21:53:27.569460'),(41,'User','0007_feedback','2024-11-25 21:53:27.827791'),(42,'User','0008_remove_feedback_page','2024-11-26 00:39:02.889668'),(43,'superuser','0002_carrier','2024-11-26 21:23:45.532081'),(44,'User','0009_discount','2024-11-26 21:39:38.387310'),(45,'User','0010_delete_discount','2024-11-26 21:46:19.947374'),(46,'superuser','0003_discount','2024-11-26 21:46:19.992428'),(47,'superuser','0004_alter_discount_end_date_alter_discount_start_date','2024-11-26 22:38:29.051454'),(48,'superuser','0005_alter_discount_discount_type','2024-11-26 22:56:11.625925'),(49,'pages','0014_order_address_order_carrier_order_status_and_more','2024-11-28 14:32:04.771269'),(50,'pages','0015_order_payment','2024-11-28 21:44:00.222688'),(51,'pages','0016_cartitem_discount','2024-12-01 20:57:41.334970'),(52,'pages','0017_alter_cartitem_discount','2024-12-01 21:19:04.289767'),(53,'pages','0018_cart_discount','2024-12-02 13:46:59.083745'),(54,'User','0011_message','2024-12-04 22:05:19.634383'),(55,'pages','0019_promotions','2024-12-04 23:04:40.413026');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('n38tlatwwf3laeuqijr8vd4qnq0tg5hj','.eJxVjEEOwiAQRe_C2pAChXZcuu8ZyMAMUjWQlHZlvLsh6UK3_73338LjsWd_NN78SuIqjLj8bgHjk0sH9MByrzLWsm9rkF2RJ21yqcSv2-n-HWRsudd2dgDAzkBiCIlHBE08WbIxEo9BxQTOWUphcGaeBrZaK0zKMaI1Wny-AiM4gg:1tJ0dY:kq3l_xe0gdEdG-pEtCR0q_Elol9YOiku4u2fnOesedI','2024-12-19 01:26:36.908091');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_cart`
--

DROP TABLE IF EXISTS `pages_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `discount_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_cart_user_id_bbf447e3_fk_auth_user_id` (`user_id`),
  KEY `pages_cart_discount_id_dd9d7629_fk_superuser_discount_id` (`discount_id`),
  CONSTRAINT `pages_cart_discount_id_dd9d7629_fk_superuser_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `superuser_discount` (`id`),
  CONSTRAINT `pages_cart_user_id_bbf447e3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_cart`
--

LOCK TABLES `pages_cart` WRITE;
/*!40000 ALTER TABLE `pages_cart` DISABLE KEYS */;
INSERT INTO `pages_cart` VALUES (14,'2024-12-02 13:51:58.464226','open',1,252.10,3),(15,'2024-12-05 01:27:14.101965','open',3,3.60,3);
/*!40000 ALTER TABLE `pages_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_cartitem`
--

DROP TABLE IF EXISTS `pages_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `discount_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_cartitem_product_id_29b34f26_fk_pages_product_id` (`product_id`),
  KEY `pages_cartitem_user_id_c4864481_fk_auth_user_id` (`user_id`),
  KEY `pages_cartitem_cart_id_44140230_fk_pages_cart_id` (`cart_id`),
  KEY `pages_cartitem_discount_id_40af586a` (`discount_id`),
  CONSTRAINT `pages_cartitem_cart_id_44140230_fk_pages_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `pages_cart` (`id`),
  CONSTRAINT `pages_cartitem_product_id_29b34f26_fk_pages_product_id` FOREIGN KEY (`product_id`) REFERENCES `pages_product` (`id`),
  CONSTRAINT `pages_cartitem_user_id_c4864481_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `pages_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_cartitem`
--

LOCK TABLES `pages_cartitem` WRITE;
/*!40000 ALTER TABLE `pages_cartitem` DISABLE KEYS */;
INSERT INTO `pages_cartitem` VALUES (89,1,'2024-12-05 01:27:14.106937',3,3,15,NULL);
/*!40000 ALTER TABLE `pages_cartitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_negative_quantity_in_cartitem` BEFORE INSERT ON `pages_cartitem` FOR EACH ROW BEGIN
    
    DECLARE available_stock INT;
    
    
    SELECT stock_quantity INTO available_stock
    FROM pages_product
    WHERE id = NEW.product_id;
    
    
    IF available_stock < NEW.quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estoque insuficiente para o produto no carrinho.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pages_historic`
--

DROP TABLE IF EXISTS `pages_historic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_historic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_historico_product_id_bf3be037_fk_pages_product_id` (`product_id`),
  KEY `pages_historic_order_id_4ef8c37d_fk_pages_order_id` (`order_id`),
  CONSTRAINT `pages_historic_order_id_4ef8c37d_fk_pages_order_id` FOREIGN KEY (`order_id`) REFERENCES `pages_order` (`id`),
  CONSTRAINT `pages_historico_product_id_bf3be037_fk_pages_product_id` FOREIGN KEY (`product_id`) REFERENCES `pages_product` (`id`),
  CONSTRAINT `pages_historic_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_historic`
--

LOCK TABLES `pages_historic` WRITE;
/*!40000 ALTER TABLE `pages_historic` DISABLE KEYS */;
INSERT INTO `pages_historic` VALUES (1,3,'2024-11-18 21:37:02.181198',1,1),(2,1,'2024-11-18 21:37:02.186202',3,1),(3,1,'2024-11-18 21:49:09.386174',2,2),(4,1,'2024-11-18 22:32:29.463148',4,3),(5,1,'2024-11-19 23:52:33.886020',4,4),(6,1,'2024-11-20 17:54:40.517359',4,5),(7,0,'2024-11-20 17:54:56.584378',4,6),(8,1,'2024-11-20 18:06:25.234953',2,7),(9,1,'2024-11-20 18:06:25.240199',1,7),(10,1,'2024-11-20 18:06:25.247201',3,7),(11,5,'2024-11-20 18:17:09.934571',1,8),(12,1,'2024-11-21 13:41:57.095499',1,9),(13,1,'2024-11-21 13:41:57.101589',2,9),(14,1,'2024-11-21 13:41:57.107665',3,9),(16,2,'2024-11-23 21:20:42.391666',1,10),(18,1,'2024-11-25 23:12:42.554713',2,11),(19,3,'2024-11-28 14:32:58.189442',4,12),(20,2,'2024-11-28 14:32:58.195442',3,12),(21,2,'2024-11-28 14:32:58.200442',1,12),(22,1,'2024-11-28 20:49:11.003678',2,13),(23,3,'2024-11-28 22:16:06.058066',2,14),(24,1,'2024-11-28 22:19:21.945680',3,15),(25,1,'2024-12-01 20:53:30.383947',1,16),(26,2,'2024-12-01 21:47:03.068671',2,17),(27,1,'2024-12-01 22:44:34.467720',3,18),(28,1,'2024-12-01 22:44:34.474744',8,18),(29,2,'2024-12-02 13:56:54.196351',3,19),(30,3,'2024-12-02 13:57:44.802014',2,20),(31,10,'2024-12-05 00:34:35.272671',10,21),(32,1,'2024-12-05 01:18:57.080584',9,22),(33,1,'2024-12-05 01:18:57.088726',1,22),(34,1,'2024-12-05 01:20:02.649826',9,23);
/*!40000 ALTER TABLE `pages_historic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_order`
--

DROP TABLE IF EXISTS `pages_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `user_id` int NOT NULL,
  `address_id` bigint DEFAULT NULL,
  `carrier_id` bigint DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `payment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_pedido_user_id_1f82a7a3_fk_auth_user_id` (`user_id`),
  KEY `pages_order_address_id_75ec9805_fk_User_useraddress_id` (`address_id`),
  KEY `pages_order_carrier_id_062d3e45_fk_superuser_carrier_id` (`carrier_id`),
  KEY `pages_order_payment_id_bb9adf0a_fk_User_userpayments_id` (`payment_id`),
  CONSTRAINT `pages_order_address_id_75ec9805_fk_User_useraddress_id` FOREIGN KEY (`address_id`) REFERENCES `user_useraddress` (`id`),
  CONSTRAINT `pages_order_carrier_id_062d3e45_fk_superuser_carrier_id` FOREIGN KEY (`carrier_id`) REFERENCES `superuser_carrier` (`id`),
  CONSTRAINT `pages_order_payment_id_bb9adf0a_fk_User_userpayments_id` FOREIGN KEY (`payment_id`) REFERENCES `user_userpayments` (`id`),
  CONSTRAINT `pages_pedido_user_id_1f82a7a3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_order`
--

LOCK TABLES `pages_order` WRITE;
/*!40000 ALTER TABLE `pages_order` DISABLE KEYS */;
INSERT INTO `pages_order` VALUES (1,'2024-11-18 21:37:02.176441',125.96,1,NULL,NULL,'draft',NULL),(2,'2024-11-18 21:49:09.383457',28.99,1,NULL,NULL,'draft',NULL),(3,'2024-11-18 22:32:29.460149',42.99,1,NULL,NULL,'draft',NULL),(4,'2024-11-19 23:52:33.881019',42.99,1,NULL,NULL,'draft',NULL),(5,'2024-11-20 17:54:40.511357',42.99,3,NULL,NULL,'draft',NULL),(6,'2024-11-20 17:54:56.581346',0.00,3,NULL,NULL,'draft',NULL),(7,'2024-11-20 18:06:25.229925',94.97,1,NULL,NULL,'draft',NULL),(8,'2024-11-20 18:17:09.927530',149.95,1,NULL,NULL,'draft',NULL),(9,'2024-11-21 13:41:57.089515',106.97,4,NULL,NULL,'draft',NULL),(10,'2024-11-23 21:20:42.386664',59.98,2,NULL,NULL,'draft',NULL),(11,'2024-11-25 23:12:42.541236',40.99,13,NULL,NULL,'draft',NULL),(12,'2024-11-28 14:32:58.184472',260.93,1,2,1,'draft',NULL),(13,'2024-11-28 20:49:10.997955',28.99,1,1,1,'draft',NULL),(14,'2024-11-28 22:16:06.051094',86.97,1,1,1,'draft',1),(15,'2024-11-28 22:19:21.940173',35.99,1,1,1,'draft',NULL),(16,'2024-12-01 20:53:30.366523',29.99,1,1,1,'draft',NULL),(17,'2024-12-01 21:47:03.062666',7.98,1,1,1,'draft',1),(18,'2024-12-01 22:44:34.460169',70.19,14,7,1,'draft',7),(19,'2024-12-02 13:56:54.189740',71.98,1,1,1,'draft',1),(20,'2024-12-02 13:57:44.797042',86.97,1,1,1,'draft',1),(21,'2024-12-05 00:34:35.267368',100.00,1,1,1,'draft',1),(22,'2024-12-05 01:18:57.075062',2550.98,1,1,2,'draft',8),(23,'2024-12-05 01:20:02.643260',2520.99,1,1,2,'draft',1);
/*!40000 ALTER TABLE `pages_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_product`
--

DROP TABLE IF EXISTS `pages_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `stock_quantity` int NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_product_category_id_5d11e074_fk_superuser_category_id` (`category_id`),
  CONSTRAINT `pages_product_category_id_5d11e074_fk_superuser_category_id` FOREIGN KEY (`category_id`) REFERENCES `superuser_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_product`
--

LOCK TABLES `pages_product` WRITE;
/*!40000 ALTER TABLE `pages_product` DISABLE KEYS */;
INSERT INTO `pages_product` VALUES (1,'Caf├® da Som├ília','Caf├® de alta qualidade, produzido na Som├ília. Torra m├®dia',29.99,'products/SomaliaCoffee_59ia26F.png','2024-11-09 14:26:32.660935',8,1),(2,'Ch├í do Sud├úo','O ch├í do Sud├úo, feito de flores de hibisco, ├® uma bebida refrescante e vibrante, rica em antioxidantes e conhecida por ajudar na sa├║de do cora├º├úo e fortalecer o sistema imunol├│gico. Ideal para ser apreciado quente ou gelado!',28.99,'products/ChaSudao_JInLuQF.jpg','2024-11-09 14:29:26.472672',2,2),(3,'Caf├® Pike Place','Delicioso caf├® da marca norte-americana Starbucks. Torra m├®dia.',35.99,'products/PikePlace_9mlzLBe_gG8pzBc.jpg','2024-11-09 14:30:33.015136',8,1),(4,'Caf├® Premium','Caf├® com 90+ pontos SCA',42.99,'products/CafePremium_xLs0wLW.png','2024-11-09 15:20:10.370549',2,1),(8,'Caf├® Importado','Caf├® de alta qualidade com torra clara. Com nota SCA acima de 90 pontos, este caf├® vem diretamente da ├üsia.',42.00,'products/Coffee_vyi19a9.jpg','2024-11-30 21:42:18.830236',9,1),(9,'Caf├® Kopi Luwa','Kopi Luwak ou Caf├® Civeta ├® um caf├® produzido com gr├úos de caf├® extra├¡dos das fezes da civeta, e ├® principalmente produzido nas ilhas de Sumatra, Java, Bali, e Sulawesi, nos arquip├®lagos da Indon├®sia.',2520.99,'products/KopiLuwa.png','2024-12-03 18:04:50.935203',0,1),(10,'felipe','felipe',10.00,'products/1729609163783.jpg','2024-12-05 00:22:37.653704',0,3);
/*!40000 ALTER TABLE `pages_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_product_delete_with_stock` BEFORE DELETE ON `pages_product` FOR EACH ROW BEGIN
    IF OLD.stock_quantity > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível deletar o produto com estoque disponível.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pages_promotions`
--

DROP TABLE IF EXISTS `pages_promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_promotions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `discounted_price` decimal(10,2) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_promotions_product_id_96cbc7e4_fk_pages_product_id` (`product_id`),
  CONSTRAINT `pages_promotions_product_id_96cbc7e4_fk_pages_product_id` FOREIGN KEY (`product_id`) REFERENCES `pages_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_promotions`
--

LOCK TABLES `pages_promotions` WRITE;
/*!40000 ALTER TABLE `pages_promotions` DISABLE KEYS */;
INSERT INTO `pages_promotions` VALUES (4,2520.99,9),(5,29.99,1),(6,42.99,8);
/*!40000 ALTER TABLE `pages_promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_wishlist`
--

DROP TABLE IF EXISTS `pages_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_wishlist_user_id_product_id_9e4bcd35_uniq` (`user_id`,`product_id`),
  KEY `pages_wishlist_product_id_3102b1d5_fk_pages_product_id` (`product_id`),
  CONSTRAINT `pages_wishlist_product_id_3102b1d5_fk_pages_product_id` FOREIGN KEY (`product_id`) REFERENCES `pages_product` (`id`),
  CONSTRAINT `pages_wishlist_user_id_56c9c374_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_wishlist`
--

LOCK TABLES `pages_wishlist` WRITE;
/*!40000 ALTER TABLE `pages_wishlist` DISABLE KEYS */;
INSERT INTO `pages_wishlist` VALUES (5,'2024-11-24 23:10:52.154607',2,1),(6,'2024-12-01 14:06:55.664360',3,1),(7,'2024-12-05 01:13:13.012799',1,1);
/*!40000 ALTER TABLE `pages_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superuser_carrier`
--

DROP TABLE IF EXISTS `superuser_carrier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superuser_carrier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superuser_carrier`
--

LOCK TABLES `superuser_carrier` WRITE;
/*!40000 ALTER TABLE `superuser_carrier` DISABLE KEYS */;
INSERT INTO `superuser_carrier` VALUES (1,'Rapidex Entregas','132193123/0001','19987452016','rapidex@entrega.com','2024-11-26 21:28:31.456898','2024-11-26 21:28:31.456898'),(2,'Picafe Transporte','15455421','1987412','picafe@gmail.com','2024-12-05 01:17:45.874942','2024-12-05 01:17:45.874942');
/*!40000 ALTER TABLE `superuser_carrier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superuser_category`
--

DROP TABLE IF EXISTS `superuser_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superuser_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superuser_category`
--

LOCK TABLES `superuser_category` WRITE;
/*!40000 ALTER TABLE `superuser_category` DISABLE KEYS */;
INSERT INTO `superuser_category` VALUES (1,'Caf├®s','Todos nossos caf├®s.',1,'2024-11-26 21:29:09.066583'),(2,'Ch├ís','Todos nossos ch├ís.',1,'2024-11-30 21:29:42.378675'),(3,'Random','Produtos aleat├│rios, criado para teste',1,'2024-11-30 21:34:30.927192');
/*!40000 ALTER TABLE `superuser_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superuser_discount`
--

DROP TABLE IF EXISTS `superuser_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superuser_discount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `description` longtext,
  `discount_type` varchar(10) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superuser_discount`
--

LOCK TABLES `superuser_discount` WRITE;
/*!40000 ALTER TABLE `superuser_discount` DISABLE KEYS */;
INSERT INTO `superuser_discount` VALUES (1,'gustavo','cupom de 10%','percentage',10.00,'2024-01-01','2025-01-01',1),(2,'bruno','dasd','fixed',50.00,'2024-01-01','2025-01-01',1),(3,'nosborde','Cupom promocional','percentage',90.00,'2020-01-01','2030-01-01',1);
/*!40000 ALTER TABLE `superuser_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_feedback`
--

DROP TABLE IF EXISTS `user_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback_text` longtext NOT NULL,
  `rating` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `User_feedback_product_id_2062b569_fk_pages_product_id` (`product_id`),
  KEY `User_feedback_user_id_5d8e5f5c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `User_feedback_product_id_2062b569_fk_pages_product_id` FOREIGN KEY (`product_id`) REFERENCES `pages_product` (`id`),
  CONSTRAINT `User_feedback_user_id_5d8e5f5c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_feedback`
--

LOCK TABLES `user_feedback` WRITE;
/*!40000 ALTER TABLE `user_feedback` DISABLE KEYS */;
INSERT INTO `user_feedback` VALUES (3,'dsadsa',4,'2024-11-26 00:41:19.304023',1,1),(4,'adsadasd',1,'2024-11-26 00:44:27.591171',4,1),(5,'Caf├® muito gostoso, recomendo!',5,'2024-12-01 22:44:53.199711',3,14),(6,'At├® que consegui beber enchendo de a├º├║car.',3,'2024-12-03 18:09:27.050706',3,1);
/*!40000 ALTER TABLE `user_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) NOT NULL,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_message_user_id_a6e483f8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `User_message_user_id_a6e483f8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
INSERT INTO `user_message` VALUES (1,'dsadsd','sadasdad','2024-12-05 01:26:44.892924',3);
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_image` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `User_profile_user_id_34d1f369_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'profile_images/Souza.png',2),(2,'profile_images/Foto.jpg',1),(3,'profile_images/imagem_2024-11-25_201139826.png',13),(4,'profile_images/1729609163783.jpg',14);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_useraddress`
--

DROP TABLE IF EXISTS `user_useraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_useraddress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `street` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_useraddress_user_id_a36664d0_fk_auth_user_id` (`user_id`),
  CONSTRAINT `User_useraddress_user_id_a36664d0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_useraddress`
--

LOCK TABLES `user_useraddress` WRITE;
/*!40000 ALTER TABLE `user_useraddress` DISABLE KEYS */;
INSERT INTO `user_useraddress` VALUES (1,'Brasil','S├úo Paulo','Campinas','12','Rua Ant├┤nio de Oliveira Filho',1,1),(2,'Brasil','S├úo Paulo','Istambul','13056336','Rua It├ília',0,1),(5,'Brasil','S├úo Paulo','Campinas','1234567-10','Rua Ov├¡dio da Silva Ribeiro',1,2),(6,'Brasil','S├úo Paulo','Campinas','1324334','rua do erich',1,13),(7,'Brasil','S├úo Paulo','Campinas','13254126','Rua atiati, 48',1,14);
/*!40000 ALTER TABLE `user_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userpayments`
--

DROP TABLE IF EXISTS `user_userpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_userpayments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(50) NOT NULL,
  `card_holder_name` varchar(100) DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `User_userpayments_user_id_2ea3a0e5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `User_userpayments_user_id_2ea3a0e5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userpayments`
--

LOCK TABLES `user_userpayments` WRITE;
/*!40000 ALTER TABLE `user_userpayments` DISABLE KEYS */;
INSERT INTO `user_userpayments` VALUES (1,'Cart├úo de Cr├®dito','Bruno Novo','1234 5678 9012 3456','2027-01-01',1,'2024-11-23 03:12:39.163224','2024-12-05 01:11:58.404418',1),(5,'Cart├úo de Cr├®dito','Lucas Souza dos Santos','5412 9842 6321 4587','2029-10-01',1,'2024-11-23 21:19:33.517353','2024-11-23 21:20:02.763101',2),(6,'Cart├úo de Cr├®dito','Erich Oliveira','5423 5489 6332 1214','2025-01-01',1,'2024-11-25 23:13:30.763395','2024-11-25 23:13:30.763395',13),(7,'Cart├úo de Cr├®dito','Felipe Matheus','1254 6421 4587 9631','2026-01-01',1,'2024-12-01 22:42:46.640092','2024-12-01 22:42:46.640092',14),(8,'Cart├úo de Cr├®dito','Bruno Favaro','32151635466','2026-01-01',0,'2024-12-05 01:11:37.369659','2024-12-05 01:11:37.369659',1);
/*!40000 ALTER TABLE `user_userpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_order_history`
--

DROP TABLE IF EXISTS `vw_order_history`;
/*!50001 DROP VIEW IF EXISTS `vw_order_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_order_history` AS SELECT 
 1 AS `order_id`,
 1 AS `order_date`,
 1 AS `order_total_price`,
 1 AS `user_id`,
 1 AS `user_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_products_with_feedback`
--

DROP TABLE IF EXISTS `vw_products_with_feedback`;
/*!50001 DROP VIEW IF EXISTS `vw_products_with_feedback`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_products_with_feedback` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `product_price`,
 1 AS `category_name`,
 1 AS `feedback_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_sales_summary`
--

DROP TABLE IF EXISTS `vw_sales_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_sales_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_sales_summary` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `total_quantity_sold`,
 1 AS `total_revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_order_history`
--

/*!50001 DROP VIEW IF EXISTS `vw_order_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_order_history` AS select `o`.`id` AS `order_id`,`o`.`created_at` AS `order_date`,`o`.`total_price` AS `order_total_price`,`o`.`user_id` AS `user_id`,`up`.`username` AS `user_name` from (`pages_order` `o` join `auth_user` `up` on((`o`.`user_id` = `up`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_products_with_feedback`
--

/*!50001 DROP VIEW IF EXISTS `vw_products_with_feedback`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_products_with_feedback` AS select `p`.`id` AS `product_id`,`p`.`name` AS `product_name`,`p`.`price` AS `product_price`,`c`.`name` AS `category_name`,count(`f`.`id`) AS `feedback_count` from ((`pages_product` `p` join `superuser_category` `c` on((`p`.`category_id` = `c`.`id`))) left join `user_feedback` `f` on((`p`.`id` = `f`.`product_id`))) group by `p`.`id`,`p`.`name`,`p`.`price`,`c`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_sales_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_sales_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_sales_summary` AS select `p`.`id` AS `product_id`,`p`.`name` AS `product_name`,sum(`h`.`quantity`) AS `total_quantity_sold`,sum((`h`.`quantity` * `p`.`price`)) AS `total_revenue` from (`pages_historic` `h` join `pages_product` `p` on((`h`.`product_id` = `p`.`id`))) group by `p`.`id`,`p`.`name` */;
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

-- Dump completed on 2024-12-04 22:51:50
