-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: prueba
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(300) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `estado` varchar(200) NOT NULL,
  `solicitud_id` int DEFAULT NULL,
  `usuario_mod_id` int DEFAULT NULL,
  `tiempo_fin` datetime(6) DEFAULT NULL,
  `tiempo_inicio` datetime(6) DEFAULT NULL,
  `id_tecnico_id` int DEFAULT NULL,
  `distancia` varchar(125) DEFAULT NULL,
  `ruta_id` int DEFAULT NULL,
  `km` varchar(20) DEFAULT NULL,
  `id_cuadrilla_id` int DEFAULT NULL,
  `id_reagendado` int DEFAULT NULL,
  `motivo_cancelado` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `actividad_id_tecnico_id_f99140db_fk_usuario_id` (`id_tecnico_id`),
  KEY `actividad_solicitud_id_50dcb09c_fk_solicitud_id` (`solicitud_id`),
  KEY `actividad_ruta_id_2ca2be31_fk_ruta_id` (`ruta_id`),
  KEY `actividad_id_cuadrilla_id_df70a898_fk_bodega_id` (`id_cuadrilla_id`),
  KEY `actividad_usuario_mod_id_fcd70abb_fk_usuario_id` (`usuario_mod_id`),
  CONSTRAINT `actividad_id_cuadrilla_id_df70a898_fk_bodega_id` FOREIGN KEY (`id_cuadrilla_id`) REFERENCES `bodega` (`id`),
  CONSTRAINT `actividad_id_tecnico_id_f99140db_fk_usuario_id` FOREIGN KEY (`id_tecnico_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `actividad_ruta_id_2ca2be31_fk_ruta_id` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`),
  CONSTRAINT `actividad_solicitud_id_50dcb09c_fk_solicitud_id` FOREIGN KEY (`solicitud_id`) REFERENCES `solicitud` (`id`),
  CONSTRAINT `actividad_usuario_mod_id_fcd70abb_fk_usuario_id` FOREIGN KEY (`usuario_mod_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (63,'para mañana','2024-03-21 15:00:00.000000','2024-03-20 20:24:38.300880','2024-03-20 20:24:38.300883','TERMINADO',43,27,'2024-03-20 20:55:00.000000','2024-03-20 20:52:00.000000',27,NULL,40,'316262',19,NULL,NULL),(64,'retiro','2024-03-20 14:00:00.000000','2024-03-20 20:45:00.568903','2024-03-20 20:45:00.568905','TERMINADO',44,16,'2024-03-20 21:10:00.000000','2024-03-20 21:10:00.000000',16,NULL,40,'311313',19,NULL,NULL),(65,'ascasca','2024-03-28 02:29:00.000000','2024-03-28 02:29:46.405516','2024-03-28 02:29:46.405516','TERMINADO',43,27,'2024-03-28 02:39:00.000000','2024-03-28 02:37:00.000000',27,NULL,41,'33311',19,NULL,NULL),(66,'ascasca','2024-03-28 02:29:00.000000','2024-03-28 02:29:59.524411','2024-03-28 02:29:59.524411','CANCELADO',44,27,NULL,NULL,27,NULL,41,NULL,19,NULL,NULL),(67,'acascasca','2024-03-28 02:29:00.000000','2024-03-28 02:30:08.277169','2024-03-28 02:30:08.277169','TERMINADO',NULL,27,NULL,NULL,27,NULL,41,NULL,NULL,NULL,NULL),(68,'ascascasc','2024-04-06 11:57:00.000000','2024-04-06 11:57:25.289246','2024-04-06 11:57:25.289246','INGRESADO',47,27,NULL,NULL,NULL,NULL,41,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividad_historial`
--

DROP TABLE IF EXISTS `actividad_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad_historial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_modificacion` datetime(6) NOT NULL,
  `estado` varchar(200) NOT NULL,
  `actividad_id` int DEFAULT NULL,
  `usuario_mod_id` int DEFAULT NULL,
  `ruta_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `actividad_historial_ruta_id_ed72c86f_fk_ruta_id` (`ruta_id`),
  KEY `actividad_historial_actividad_id_513cc29b_fk_actividad_id` (`actividad_id`),
  KEY `actividad_historial_usuario_mod_id_b7bacd94_fk_usuario_id` (`usuario_mod_id`),
  CONSTRAINT `actividad_historial_actividad_id_513cc29b_fk_actividad_id` FOREIGN KEY (`actividad_id`) REFERENCES `actividad` (`id`),
  CONSTRAINT `actividad_historial_ruta_id_ed72c86f_fk_ruta_id` FOREIGN KEY (`ruta_id`) REFERENCES `ruta` (`id`),
  CONSTRAINT `actividad_historial_usuario_mod_id_b7bacd94_fk_usuario_id` FOREIGN KEY (`usuario_mod_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_historial`
--

LOCK TABLES `actividad_historial` WRITE;
/*!40000 ALTER TABLE `actividad_historial` DISABLE KEYS */;
INSERT INTO `actividad_historial` VALUES (111,'2024-03-09 15:52:32.242481','INGRESADO',NULL,NULL,NULL),(112,'2024-03-09 15:52:44.018279','INGRESADO',NULL,NULL,NULL),(113,'2024-03-09 15:53:21.780299','INGRESADO',NULL,NULL,NULL),(114,'2024-03-09 16:31:11.041737','EN CURSO',NULL,NULL,NULL),(115,'2024-03-09 17:13:45.546013','INGRESADO',NULL,NULL,NULL),(116,'2024-03-09 17:13:53.046559','INGRESADO',NULL,NULL,NULL),(117,'2024-03-09 17:23:44.641620','EN CURSO',NULL,NULL,NULL),(118,'2024-03-09 17:25:11.947507','EN CURSO',NULL,NULL,NULL),(119,'2024-03-09 17:28:42.757081','EN CURSO',NULL,NULL,NULL),(120,'2024-03-09 17:29:08.873779','EN CURSO',NULL,NULL,NULL),(121,'2024-03-09 17:29:22.533888','EN CURSO',NULL,NULL,NULL),(122,'2024-03-09 17:32:52.510818','CANCELADO',NULL,NULL,NULL),(123,'2024-03-09 17:35:40.973860','SUBIR HOJA',NULL,NULL,NULL),(124,'2024-03-10 00:32:14.040245','TERMINADO',NULL,NULL,NULL),(125,'2024-03-10 01:05:36.003439','INGRESADO',NULL,NULL,NULL),(126,'2024-03-10 01:05:36.612870','CANCELADO',NULL,NULL,NULL),(127,'2024-03-10 02:41:14.391214','INGRESADO',NULL,NULL,NULL),(128,'2024-03-10 02:41:14.712017','CANCELADO',NULL,NULL,NULL),(129,'2024-03-10 02:41:54.843984','INGRESADO',NULL,NULL,NULL),(130,'2024-03-10 02:42:19.943466','INGRESADO',NULL,NULL,NULL),(131,'2024-03-10 02:43:33.082667','INGRESADO',NULL,NULL,NULL),(132,'2024-03-10 02:43:37.429196','INGRESADO',NULL,NULL,NULL),(133,'2024-03-10 02:45:09.518516','EN CURSO',NULL,NULL,NULL),(134,'2024-03-10 02:45:37.686732','SUBIR HOJA',NULL,NULL,NULL),(135,'2024-03-10 02:46:10.533932','CANCELADO',NULL,NULL,NULL),(136,'2024-03-12 20:46:01.882287','INGRESADO',NULL,24,NULL),(137,'2024-03-12 20:46:28.478913','INGRESADO',NULL,NULL,NULL),(138,'2024-03-12 20:46:28.490099','INGRESADO',NULL,24,NULL),(139,'2024-03-12 20:47:48.483873','INGRESADO',NULL,24,NULL),(140,'2024-03-12 20:47:51.849286','SUBIR HOJA',NULL,NULL,NULL),(141,'2024-03-12 20:47:56.488611','SUBIR HOJA',NULL,NULL,NULL),(142,'2024-03-12 21:08:07.843231','INGRESADO',NULL,24,NULL),(143,'2024-03-12 21:08:16.616482','INGRESADO',NULL,24,NULL),(144,'2024-03-13 18:13:43.962590','INGRESADO',NULL,21,NULL),(145,'2024-03-13 18:13:57.813188','INGRESADO',NULL,21,NULL),(146,'2024-03-13 18:13:58.875580','INGRESADO',NULL,21,NULL),(147,'2024-03-13 18:13:59.741616','INGRESADO',NULL,21,NULL),(148,'2024-03-13 18:17:52.205873','INGRESADO',NULL,21,NULL),(149,'2024-03-13 18:20:53.078611','INGRESADO',NULL,21,NULL),(150,'2024-03-13 18:44:48.153541','INGRESADO',NULL,19,NULL),(151,'2024-03-13 18:50:15.466641','EN CURSO',NULL,20,NULL),(152,'2024-03-13 18:50:39.464783','SUBIR HOJA',NULL,20,NULL),(153,'2024-03-13 18:51:20.238732','EN CURSO',NULL,20,NULL),(154,'2024-03-13 18:52:29.145858','SUBIR HOJA',NULL,20,NULL),(155,'2024-03-13 18:56:29.847423','EN CURSO',NULL,20,NULL),(156,'2024-03-13 18:56:37.273648','SUBIR HOJA',NULL,20,NULL),(157,'2024-03-13 19:08:12.039058','SUBIR HOJA',NULL,20,NULL),(158,'2024-03-13 19:36:29.065032','TERMINADO',NULL,20,NULL),(159,'2024-03-13 19:36:36.468467','TERMINADO',NULL,20,NULL),(160,'2024-03-15 19:42:55.742870','INGRESADO',NULL,24,NULL),(161,'2024-03-15 19:43:36.289150','INGRESADO',NULL,24,NULL),(162,'2024-03-15 19:44:26.871252','SUBIR HOJA',NULL,20,NULL),(163,'2024-03-15 19:44:26.877815','TERMINADO',NULL,20,NULL),(164,'2024-03-15 19:44:26.891384','INGRESADO',NULL,24,NULL),(165,'2024-03-15 19:44:26.914062','INGRESADO',NULL,21,NULL),(166,'2024-03-15 19:44:26.927752','INGRESADO',NULL,24,NULL),(167,'2024-03-15 19:45:59.437376','SUBIR HOJA',NULL,20,NULL),(168,'2024-03-15 19:45:59.444989','TERMINADO',NULL,20,NULL),(169,'2024-03-15 19:45:59.460019','INGRESADO',NULL,24,NULL),(170,'2024-03-15 19:45:59.474509','INGRESADO',NULL,21,NULL),(171,'2024-03-15 19:46:08.855726','INGRESADO',NULL,19,NULL),(172,'2024-03-15 19:46:08.871630','INGRESADO',NULL,21,NULL),(173,'2024-03-15 19:46:53.084713','TERMINADO',NULL,24,NULL),(174,'2024-03-15 19:46:55.254989','TERMINADO',NULL,24,NULL),(175,'2024-03-15 20:00:13.614413','INGRESADO',NULL,21,NULL),(176,'2024-03-15 20:00:31.113231','INGRESADO',NULL,21,NULL),(177,'2024-03-15 20:00:50.024289','INGRESADO',NULL,21,NULL),(178,'2024-03-15 20:00:50.038648','INGRESADO',NULL,21,NULL),(179,'2024-03-18 19:19:54.290863','INGRESADO',NULL,21,NULL),(180,'2024-03-18 19:20:58.488584','INGRESADO',NULL,21,NULL),(181,'2024-03-18 19:23:15.894173','INGRESADO',NULL,21,NULL),(182,'2024-03-18 19:23:26.785471','TERMINADO',NULL,NULL,NULL),(183,'2024-03-18 19:26:01.396930','INGRESADO',NULL,21,NULL),(184,'2024-03-18 19:26:18.756091','INGRESADO',NULL,21,NULL),(185,'2024-03-18 19:26:25.709413','INGRESADO',NULL,21,NULL),(186,'2024-03-18 19:31:41.290791','TERMINADO',NULL,20,NULL),(187,'2024-03-18 19:31:44.972087','TERMINADO',NULL,20,NULL),(188,'2024-03-18 19:32:19.768805','INGRESADO',NULL,21,NULL),(189,'2024-03-18 19:32:25.149717','INGRESADO',NULL,21,NULL),(190,'2024-03-18 19:32:29.556152','INGRESADO',NULL,21,NULL),(191,'2024-03-18 19:33:43.332624','CANCELADO',NULL,20,NULL),(192,'2024-03-18 19:33:50.473385','CANCELADO',NULL,20,NULL),(193,'2024-03-18 19:34:00.276106','CANCELADO',NULL,20,NULL),(194,'2024-03-18 19:34:59.806547','EN CURSO',NULL,20,NULL),(195,'2024-03-18 19:36:03.219491','SUBIR HOJA',NULL,20,NULL),(196,'2024-03-18 19:55:05.732467','TERMINADO',NULL,20,NULL),(197,'2024-03-18 19:55:10.558440','TERMINADO',NULL,20,NULL),(198,'2024-03-18 19:55:12.266440','TERMINADO',NULL,20,NULL),(199,'2024-03-18 19:55:50.518651','EN CURSO',NULL,20,NULL),(200,'2024-03-18 19:57:22.369970','SUBIR HOJA',NULL,20,NULL),(201,'2024-03-18 20:07:10.024569','TERMINADO',NULL,20,NULL),(202,'2024-03-18 20:07:39.928102','EN CURSO',NULL,20,NULL),(203,'2024-03-18 20:07:49.209595','SUBIR HOJA',NULL,20,NULL),(204,'2024-03-18 20:43:14.849089','TERMINADO',NULL,20,NULL),(205,'2024-03-19 20:59:31.571885','EN CURSO',NULL,16,NULL),(206,'2024-03-19 20:59:40.052991','SUBIR HOJA',NULL,16,NULL),(207,'2024-03-19 20:59:48.760490','TERMINADO',NULL,16,NULL),(208,'2024-03-19 20:59:51.232944','TERMINADO',NULL,16,NULL),(209,'2024-03-20 20:24:38.303686','INGRESADO',63,19,NULL),(210,'2024-03-20 20:26:06.334879','INGRESADO',63,19,40),(211,'2024-03-20 20:45:00.571669','INGRESADO',64,19,NULL),(212,'2024-03-20 20:45:21.642997','INGRESADO',64,19,40),(213,'2024-03-20 20:52:38.843470','EN CURSO',63,16,40),(214,'2024-03-20 20:55:13.967898','SUBIR HOJA',63,16,40),(215,'2024-03-20 21:08:21.083785','TERMINADO',63,16,40),(216,'2024-03-20 21:10:43.748899','EN CURSO',64,16,40),(217,'2024-03-20 21:10:53.068739','SUBIR HOJA',64,16,40),(218,'2024-03-20 21:11:28.936455','TERMINADO',64,16,40),(219,'2024-03-28 02:29:46.405516','INGRESADO',65,27,NULL),(220,'2024-03-28 02:29:59.524411','INGRESADO',66,27,NULL),(221,'2024-03-28 02:30:08.277169','INGRESADO',67,27,NULL),(222,'2024-03-28 02:33:15.248292','INGRESADO',65,27,41),(223,'2024-03-28 02:33:15.258831','INGRESADO',66,27,41),(224,'2024-03-28 02:33:15.264348','INGRESADO',67,27,41),(225,'2024-03-28 02:37:45.460066','EN CURSO',65,27,41),(226,'2024-03-28 02:39:13.779630','SUBIR HOJA',65,27,41),(227,'2024-03-28 02:39:53.937943','CANCELADO',66,27,41),(228,'2024-04-06 11:57:25.291246','INGRESADO',68,27,NULL),(229,'2024-04-06 11:58:46.294267','INGRESADO',68,27,41),(230,'2024-04-06 12:00:35.829368','SUBIR HOJA',65,27,41),(231,'2024-04-06 12:00:35.839369','CANCELADO',66,27,41),(232,'2024-04-06 12:00:35.855435','TERMINADO',67,27,41),(233,'2024-04-06 12:00:35.855435','INGRESADO',68,27,41);
/*!40000 ALTER TABLE `actividad_historial` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add bodega',7,'add_bodega'),(26,'Can change bodega',7,'change_bodega'),(27,'Can delete bodega',7,'delete_bodega'),(28,'Can view bodega',7,'view_bodega'),(29,'Can add marca',8,'add_marca'),(30,'Can change marca',8,'change_marca'),(31,'Can delete marca',8,'delete_marca'),(32,'Can view marca',8,'view_marca'),(33,'Can add modelo',9,'add_modelo'),(34,'Can change modelo',9,'change_modelo'),(35,'Can delete modelo',9,'delete_modelo'),(36,'Can view modelo',9,'view_modelo'),(37,'Can add producto',10,'add_producto'),(38,'Can change producto',10,'change_producto'),(39,'Can delete producto',10,'delete_producto'),(40,'Can view producto',10,'view_producto'),(41,'Can add proveedor',11,'add_proveedor'),(42,'Can change proveedor',11,'change_proveedor'),(43,'Can delete proveedor',11,'delete_proveedor'),(44,'Can view proveedor',11,'view_proveedor'),(45,'Can add unidad',12,'add_unidad'),(46,'Can change unidad',12,'change_unidad'),(47,'Can delete unidad',12,'delete_unidad'),(48,'Can view unidad',12,'view_unidad'),(49,'Can add stock',13,'add_stock'),(50,'Can change stock',13,'change_stock'),(51,'Can delete stock',13,'delete_stock'),(52,'Can view stock',13,'view_stock'),(53,'Can add serie',14,'add_serie'),(54,'Can change serie',14,'change_serie'),(55,'Can delete serie',14,'delete_serie'),(56,'Can view serie',14,'view_serie'),(57,'Can add movimiento',15,'add_movimiento'),(58,'Can change movimiento',15,'change_movimiento'),(59,'Can delete movimiento',15,'delete_movimiento'),(60,'Can view movimiento',15,'view_movimiento'),(61,'Can add motivo movimiento',16,'add_motivomovimiento'),(62,'Can change motivo movimiento',16,'change_motivomovimiento'),(63,'Can delete motivo movimiento',16,'delete_motivomovimiento'),(64,'Can view motivo movimiento',16,'view_motivomovimiento'),(65,'Can add rol',17,'add_rol'),(66,'Can change rol',17,'change_rol'),(67,'Can delete rol',17,'delete_rol'),(68,'Can view rol',17,'view_rol'),(69,'Can add usuario',18,'add_usuario'),(70,'Can change usuario',18,'change_usuario'),(71,'Can delete usuario',18,'delete_usuario'),(72,'Can view usuario',18,'view_usuario'),(73,'Can add permiso',19,'add_permiso'),(74,'Can change permiso',19,'change_permiso'),(75,'Can delete permiso',19,'delete_permiso'),(76,'Can view permiso',19,'view_permiso'),(77,'Can add usuario wishup api',20,'add_usuariowishupapi'),(78,'Can change usuario wishup api',20,'change_usuariowishupapi'),(79,'Can delete usuario wishup api',20,'delete_usuariowishupapi'),(80,'Can view usuario wishup api',20,'view_usuariowishupapi'),(81,'Can add version',21,'add_version'),(82,'Can change version',21,'change_version'),(83,'Can delete version',21,'delete_version'),(84,'Can view version',21,'view_version'),(85,'Can add actividad',22,'add_actividad'),(86,'Can change actividad',22,'change_actividad'),(87,'Can delete actividad',22,'delete_actividad'),(88,'Can view actividad',22,'view_actividad'),(89,'Can add ruta',23,'add_ruta'),(90,'Can change ruta',23,'change_ruta'),(91,'Can delete ruta',23,'delete_ruta'),(92,'Can view ruta',23,'view_ruta'),(93,'Can add actividad historial',24,'add_actividadhistorial'),(94,'Can change actividad historial',24,'change_actividadhistorial'),(95,'Can delete actividad historial',24,'delete_actividadhistorial'),(96,'Can view actividad historial',24,'view_actividadhistorial'),(97,'Can add kit',25,'add_kit'),(98,'Can change kit',25,'change_kit'),(99,'Can delete kit',25,'delete_kit'),(100,'Can view kit',25,'view_kit'),(101,'Can add tipo solicitud',26,'add_tiposolicitud'),(102,'Can change tipo solicitud',26,'change_tiposolicitud'),(103,'Can delete tipo solicitud',26,'delete_tiposolicitud'),(104,'Can view tipo solicitud',26,'view_tiposolicitud'),(105,'Can add solicitud',27,'add_solicitud'),(106,'Can change solicitud',27,'change_solicitud'),(107,'Can delete solicitud',27,'delete_solicitud'),(108,'Can view solicitud',27,'view_solicitud'),(109,'Can add kit x producto',28,'add_kitxproducto'),(110,'Can change kit x producto',28,'change_kitxproducto'),(111,'Can delete kit x producto',28,'delete_kitxproducto'),(112,'Can view kit x producto',28,'view_kitxproducto'),(113,'Can add hojade trabajo',29,'add_hojadetrabajo'),(114,'Can change hojade trabajo',29,'change_hojadetrabajo'),(115,'Can delete hojade trabajo',29,'delete_hojadetrabajo'),(116,'Can view hojade trabajo',29,'view_hojadetrabajo'),(117,'Can add wisphub',30,'add_wisphub'),(118,'Can change wisphub',30,'change_wisphub'),(119,'Can delete wisphub',30,'delete_wisphub'),(120,'Can view wisphub',30,'view_wisphub'),(121,'Can add recepcion',31,'add_recepcion'),(122,'Can change recepcion',31,'change_recepcion'),(123,'Can delete recepcion',31,'delete_recepcion'),(124,'Can view recepcion',31,'view_recepcion'),(125,'Can add combustible',32,'add_combustible'),(126,'Can change combustible',32,'change_combustible'),(127,'Can delete combustible',32,'delete_combustible'),(128,'Can view combustible',32,'view_combustible');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$4thgxT8Pi8xIsKVqgohhA3$fr7QMz0f/5jUFjy7dDPVDGJdyZHunrc/FECEm+Zj0l4=',NULL,1,'admin','','','admin@gmail.com',1,1,'2024-04-20 13:12:49.542100'),(2,'pbkdf2_sha256$600000$lkLYehsmAbqxo4qvCSFeWf$8DZfzgWWzBU80t72BhB5+MMEadEEgdlxLTJTgqFB8wE=','2026-02-23 15:36:21.768556',1,'miguel','','','miguel.cabrera@terranet.com.ec',1,1,'2026-02-23 15:35:18.619751');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
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
-- Table structure for table `bodega`
--

DROP TABLE IF EXISTS `bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodega` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `ubicacion` varchar(150) DEFAULT NULL,
  `tipo` varchar(25) NOT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `placa` varchar(25) DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodega`
--

LOCK TABLES `bodega` WRITE;
/*!40000 ALTER TABLE `bodega` DISABLE KEYS */;
INSERT INTO `bodega` VALUES (16,'nod001','Km20','Via daule km20','NODO',NULL,NULL,'2024-02-22 16:17:47.935753','2024-02-22 16:17:47.935750'),(17,'004900','CUADRILLA DMAX',NULL,'CUADRILLA','DMAX','GSR-9951','2024-02-22 17:15:15.122791','2024-02-22 17:15:15.122788'),(18,'nod002','MiLote','Villa bonita / Mi lote','NODO',NULL,NULL,'2024-02-22 17:30:15.507724','2024-02-22 17:30:15.507722'),(19,'005000','CUADRILLA MAZDA2',NULL,'CUADRILLA','BT-50 TSX OUTDOORS','GSR-2109','2024-02-22 17:53:01.472724','2024-02-22 17:53:01.472720'),(20,'bod001','Bauhaus','Av Fco Orellana','BODEGA',NULL,NULL,'2024-02-22 18:00:54.133425','2024-02-22 18:00:54.133422'),(22,'15_Tecnico','PETER GONZALO SANTOS QUIZHPI',NULL,'TECNICO',NULL,NULL,'2024-03-10 16:55:12.513942','2024-03-10 16:55:12.513939'),(23,'005001','CUADRILLA WINGLE',NULL,'CUADRILLA','WINGLE 9','GT14064','2024-03-10 16:58:10.995079','2024-03-10 16:58:10.995075'),(26,'16_Tecnico','JASSER ISMAEL MORENO BOLOÑA',NULL,'TECNICO',NULL,NULL,'2024-03-10 17:55:23.006257','2024-03-10 17:55:23.006253'),(27,'18_Tecnico','ALEX DAVID COBA UREÑA',NULL,'TECNICO',NULL,NULL,'2024-03-10 17:55:27.648168','2024-03-10 17:55:27.648165'),(28,'20_Tecnico','KEVIN FRANKLIN SOTO SILVA',NULL,'TECNICO',NULL,NULL,'2024-03-10 17:55:32.107713','2024-03-10 17:55:32.107709'),(29,'17_Tecnico','JOSE RODOLFO PARDO FIGUEROA',NULL,'TECNICO',NULL,NULL,'2024-03-10 17:55:48.434709','2024-03-10 17:55:48.434705'),(35,'base_dev12','base_dev12','base_dev12','BODEGA',NULL,NULL,'2024-03-23 14:58:37.997572','2024-03-23 14:58:37.997567'),(38,'27_Tecnico','Richard Nuñez De la Rosa',NULL,'TECNICO',NULL,NULL,'2024-03-26 16:54:42.553290','2024-03-26 16:54:42.553290'),(39,'aaaa','aaaa','aaa','BODEGA',NULL,NULL,'2024-03-29 02:06:56.658541','2024-03-29 02:06:56.658541');
/*!40000 ALTER TABLE `bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodega_personas_encargadas`
--

DROP TABLE IF EXISTS `bodega_personas_encargadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodega_personas_encargadas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bodega_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bodega_personas_encargadas_bodega_id_usuario_id_84eccb34_uniq` (`bodega_id`,`usuario_id`),
  KEY `bodega_personas_encargadas_usuario_id_73be9c09_fk_usuario_id` (`usuario_id`),
  CONSTRAINT `bodega_personas_encargadas_bodega_id_311eb0b9_fk_bodega_id` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  CONSTRAINT `bodega_personas_encargadas_usuario_id_73be9c09_fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodega_personas_encargadas`
--

LOCK TABLES `bodega_personas_encargadas` WRITE;
/*!40000 ALTER TABLE `bodega_personas_encargadas` DISABLE KEYS */;
INSERT INTO `bodega_personas_encargadas` VALUES (35,17,20),(41,17,24),(50,17,27),(34,19,16),(45,19,25),(51,19,27),(26,22,15),(27,23,15),(30,26,16),(31,27,18),(32,28,20),(33,29,17),(46,35,25),(49,38,27),(52,39,25),(53,39,27);
/*!40000 ALTER TABLE `bodega_personas_encargadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combustible`
--

DROP TABLE IF EXISTS `combustible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combustible` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foto_comprobante` longtext NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `monto_gasolina` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `id_cuadrilla_id` int DEFAULT NULL,
  `id_tecnico_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `combustible_id_cuadrilla_id_07ac9f4e_fk_bodega_id` (`id_cuadrilla_id`),
  KEY `combustible_id_tecnico_id_000f4de4_fk_usuario_id` (`id_tecnico_id`),
  CONSTRAINT `combustible_id_cuadrilla_id_07ac9f4e_fk_bodega_id` FOREIGN KEY (`id_cuadrilla_id`) REFERENCES `bodega` (`id`),
  CONSTRAINT `combustible_id_tecnico_id_000f4de4_fk_usuario_id` FOREIGN KEY (`id_tecnico_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combustible`
--

LOCK TABLES `combustible` WRITE;
/*!40000 ALTER TABLE `combustible` DISABLE KEYS */;
INSERT INTO `combustible` VALUES (5,'https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/21%2F%5Bobject%20Object%5D%2FFoto%20Comprobante%3A%20%2018-03-2024%2015%3A57%3A02%20%20WhatsApp%20Image%202024-03-16%20at%207.09.07%20PM.jpeg?alt=media&token=4c017418-24c5-4bc9-9b72-6dc4f7f8db0c','SE ENTREGA $15 PARA COMBUSTIBLE, PETER Y ALEX',15,'2024-03-18 20:57:04.756719','2024-03-18 20:57:04.756724',23,21);
/*!40000 ALTER TABLE `combustible` ENABLE KEYS */;
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
INSERT INTO `django_admin_log` VALUES (1,'2023-11-18 00:35:46.313832','1','crear',1,'[{\"added\": {}}]',18,1),(2,'2023-11-18 00:36:10.680354','2','leer',1,'[{\"added\": {}}]',18,1),(3,'2023-11-18 00:36:16.921145','3','editar',1,'[{\"added\": {}}]',18,1),(4,'2023-11-18 00:36:19.982361','4','eliminar',1,'[{\"added\": {}}]',18,1),(5,'2023-11-18 00:36:53.848720','1','Rol object (1)',1,'[{\"added\": {}}]',16,1),(6,'2023-11-18 01:06:50.005408','1','lenovo',1,'[{\"added\": {}}]',8,1),(7,'2023-11-18 01:07:16.132502','1','laptop cap34y',1,'[{\"added\": {}}]',9,1),(8,'2023-11-18 01:07:54.242638','1','unidad',1,'[{\"added\": {}}]',10,1),(9,'2023-11-18 01:11:27.915071','1','Matrix',1,'[{\"added\": {}}]',7,1),(10,'2023-11-18 01:21:57.889412','1','ZC MAYORISTA',1,'[{\"added\": {}}]',12,1),(11,'2023-11-18 01:22:55.802175','1','lap234 - lenovoOficinaa',1,'[{\"added\": {}}]',11,1),(12,'2023-11-18 01:23:54.419065','1','LE5G12345',1,'[{\"added\": {}}]',15,1),(13,'2023-11-18 15:32:16.659272','1','lap234 - lenovoOficinaa - 1 - EGRESO',1,'[{\"added\": {}}]',14,1),(14,'2023-11-18 15:32:26.281518','2','lap234 - lenovoOficinaa - 1 - INGRESO',1,'[{\"added\": {}}]',14,1),(15,'2023-11-18 15:35:50.652922','1','lap234 - lenovoOficinaa - 1 - EGRESO',3,'',14,1),(16,'2023-11-18 15:36:07.451191','3','lap234 - lenovoOficinaa - 15 - INGRESO',1,'[{\"added\": {}}]',14,1),(17,'2023-11-18 15:47:37.930783','4','lap234 - lenovoOficinaa - 15 - INGRESO',1,'[{\"added\": {}}]',14,1),(18,'2023-12-03 18:54:09.146229','1','RUTA LA ROSA base_dev',1,'[{\"added\": {}}]',20,1),(19,'2023-12-03 18:56:04.189964','2','RUTA LA ROSA base_dev2',1,'[{\"added\": {}}]',20,1),(20,'2023-12-03 18:57:43.196764','1','RUTA LA ROSA base_dev',2,'[{\"changed\": {\"fields\": [\"Cuadrilla\"]}}]',20,1),(21,'2023-12-03 18:58:28.586514','11','Cuadrilla saccas',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',7,1),(22,'2023-12-03 18:58:52.033873','1','RUTA LA ROSA base_dev',2,'[{\"changed\": {\"fields\": [\"Cuadrilla\"]}}]',20,1),(23,'2023-12-03 19:02:43.449453','1','ACTIVIDAD DE LA ROSA',1,'[{\"added\": {}}]',19,1),(24,'2023-12-03 19:03:32.355269','2','RUTA de LA ROSA',1,'[{\"added\": {}}]',19,1),(25,'2023-12-03 19:12:39.507221','2','ACTIVIDAD DE LA ROSA',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',19,1),(26,'2023-12-16 10:59:40.318119','1','base_dev',1,'[{\"added\": {}}]',21,1),(27,'2023-12-16 17:27:46.753226','1','TIPO base_dev',1,'[{\"added\": {}}]',23,1),(28,'2023-12-16 17:58:46.099109','1','NAVIDEÑO',1,'[{\"added\": {}}]',25,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(29,'agenda','hojadetrabajo'),(25,'agenda','kit'),(28,'agenda','kitxproducto'),(27,'agenda','solicitud'),(26,'agenda','tiposolicitud'),(30,'agenda','wisphub'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(32,'contabilidad','combustible'),(31,'contabilidad','recepcion'),(5,'contenttypes','contenttype'),(22,'rutas','actividad'),(24,'rutas','actividadhistorial'),(23,'rutas','ruta'),(6,'sessions','session'),(7,'store','bodega'),(8,'store','marca'),(9,'store','modelo'),(16,'store','motivomovimiento'),(15,'store','movimiento'),(10,'store','producto'),(11,'store','proveedor'),(14,'store','serie'),(13,'store','stock'),(12,'store','unidad'),(19,'user','permiso'),(17,'user','rol'),(18,'user','usuario'),(20,'user','usuariowishupapi'),(21,'user','version');
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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-20 12:56:01.605041'),(2,'auth','0001_initial','2024-04-20 12:56:01.904599'),(3,'admin','0001_initial','2024-04-20 12:56:01.992597'),(4,'admin','0002_logentry_remove_auto_add','2024-04-20 12:56:01.999640'),(5,'admin','0003_logentry_add_action_flag_choices','2024-04-20 12:56:02.005187'),(6,'user','0001_initial','2024-04-20 12:56:02.148184'),(7,'user','0002_permiso_rol_created_at_usuario_created_at','2024-04-20 12:56:02.205180'),(8,'user','0003_rol_permisos','2024-04-20 12:56:02.300174'),(9,'user','0004_alter_permiso_created_at_alter_permiso_updated_at_and_more','2024-04-20 12:56:02.318176'),(10,'user','0005_usuario_uid','2024-04-20 12:56:02.337177'),(11,'user','0006_usuariowishupapi','2024-04-20 12:56:02.352176'),(12,'store','0001_initial','2024-04-20 12:56:02.839434'),(13,'store','0002_bodega_created_at_marca_created_at_modelo_created_at_and_more','2024-04-20 12:56:02.981008'),(14,'store','0003_alter_producto_marca_alter_producto_modelo_and_more','2024-04-20 12:56:03.279109'),(15,'store','0004_alter_movimiento_id','2024-04-20 12:56:03.291123'),(16,'store','0005_alter_stock_cantidad','2024-04-20 12:56:03.300164'),(17,'store','0006_movimiento_usuario','2024-04-20 12:56:03.345174'),(18,'store','0007_remove_serie_estado_movimiento_series','2024-04-20 12:56:03.465164'),(19,'store','0008_serie_estado','2024-04-20 12:56:03.489163'),(20,'store','0009_remove_movimiento_series_alter_serie_bodega','2024-04-20 12:56:03.582164'),(21,'store','0010_movimiento_series','2024-04-20 12:56:03.674173'),(22,'store','0011_remove_serie_estado_alter_serie_ubicacion','2024-04-20 12:56:03.724176'),(23,'store','0012_motivomovimiento_movimiento_motivo_movimiento','2024-04-20 12:56:03.785174'),(24,'store','0013_remove_movimiento_motivo_movimiento_and_more','2024-04-20 12:56:03.847168'),(25,'store','0014_motivomovimiento','2024-04-20 12:56:03.861165'),(26,'store','0015_movimiento_motivo_movimiento','2024-04-20 12:56:03.916753'),(27,'store','0016_remove_movimiento_motivo','2024-04-20 12:56:03.934746'),(28,'store','0017_alter_bodega_ubicacion','2024-04-20 12:56:03.972744'),(29,'store','0018_alter_bodega_created_at_alter_bodega_updated_at_and_more','2024-04-20 12:56:04.043289'),(30,'store','0019_movimiento_id_actividad','2024-04-20 12:56:04.077292'),(31,'store','0020_alter_movimiento_bodega_and_more','2024-04-20 12:56:04.151300'),(32,'store','0021_alter_stock_bodega_alter_stock_producto','2024-04-20 12:56:04.169289'),(33,'store','0022_alter_stock_bodega_alter_stock_producto','2024-04-20 12:56:04.327300'),(34,'agenda','0001_initial','2024-04-20 12:56:04.511389'),(35,'agenda','0002_solicitud_usuario_agendo_solicitud_usuario_revision_and_more','2024-04-20 12:56:04.667191'),(36,'agenda','0003_solicitud_estado_solicitud_fecha_agenda','2024-04-20 12:56:04.683836'),(37,'agenda','0004_solicitud_fecha_agenda','2024-04-20 12:56:04.702833'),(38,'agenda','0005_alter_solicitud_fecha_agenda','2024-04-20 12:56:04.749844'),(39,'agenda','0006_alter_solicitud_idcliente','2024-04-20 12:56:04.757843'),(40,'agenda','0007_alter_solicitud_idcliente','2024-04-20 12:56:04.782853'),(41,'agenda','0008_solicitud_cedula_solicitud_celular_and_more','2024-04-20 12:56:05.266096'),(42,'agenda','0009_remove_solicitud_tiposolicitud_solicitud_tipo','2024-04-20 12:56:05.351940'),(43,'agenda','0010_remove_solicitud_plan_vigente_and_more','2024-04-20 12:56:05.464916'),(44,'agenda','0011_solicitud_casa_npisos_solicitud_cliente_tiene_equipo_and_more','2024-04-20 12:56:05.524918'),(45,'agenda','0012_alter_solicitud_descripcion','2024-04-20 12:56:05.580925'),(46,'agenda','0013_alter_kit_created_at_alter_kit_updated_at_and_more','2024-04-20 12:56:05.609917'),(47,'agenda','0014_alter_solicitud_foto_casa','2024-04-20 12:56:05.656918'),(48,'agenda','0015_hojadetrabajo','2024-04-20 12:56:05.742922'),(49,'agenda','0016_alter_hojadetrabajo_tipo','2024-04-20 12:56:05.752919'),(50,'agenda','0017_wisphub','2024-04-20 12:56:05.806928'),(51,'agenda','0018_hojadetrabajo_id_actividad','2024-04-20 12:56:05.830923'),(52,'agenda','0019_alter_hojadetrabajo_usuario_creacion_and_more','2024-04-20 12:56:05.962537'),(53,'agenda','0021_remove_wisphub_iduser_alter_wisphub_idservicio','2024-04-20 12:56:05.970505'),(54,'agenda','0022_delete_wisphub','2024-04-20 12:56:05.982517'),(55,'agenda','0023_wisphub','2024-04-20 12:56:06.069641'),(56,'agenda','0024_rename_idplan_wisphub_id_plan','2024-04-20 12:56:06.088632'),(57,'agenda','0025_alter_hojadetrabajo_usuario_creacion_and_more','2024-04-20 12:56:06.334822'),(58,'agenda','0026_alter_solicitud_senal_potencia','2024-04-20 12:56:06.354147'),(59,'contenttypes','0002_remove_content_type_name','2024-04-20 12:56:06.435743'),(60,'auth','0002_alter_permission_name_max_length','2024-04-20 12:56:06.476733'),(61,'auth','0003_alter_user_email_max_length','2024-04-20 12:56:06.495732'),(62,'auth','0004_alter_user_username_opts','2024-04-20 12:56:06.504737'),(63,'auth','0005_alter_user_last_login_null','2024-04-20 12:56:06.554738'),(64,'auth','0006_require_contenttypes_0002','2024-04-20 12:56:06.558740'),(65,'auth','0007_alter_validators_add_error_messages','2024-04-20 12:56:06.566736'),(66,'auth','0008_alter_user_username_max_length','2024-04-20 12:56:06.621738'),(67,'auth','0009_alter_user_last_name_max_length','2024-04-20 12:56:06.690733'),(68,'auth','0010_alter_group_name_max_length','2024-04-20 12:56:06.710743'),(69,'auth','0011_update_proxy_permissions','2024-04-20 12:56:06.728732'),(70,'auth','0012_alter_user_first_name_max_length','2024-04-20 12:56:06.774736'),(71,'contabilidad','0001_initial','2024-04-20 12:56:06.941939'),(72,'contabilidad','0002_alter_combustible_foto_comprobante_and_more','2024-04-20 12:56:07.051546'),(73,'contabilidad','0003_alter_combustible_monto_gasolina_and_more','2024-04-20 12:56:07.170548'),(74,'rutas','0001_initial','2024-04-20 12:56:07.244540'),(75,'rutas','0002_actividad_ruta','2024-04-20 12:56:07.347549'),(76,'rutas','0003_alter_actividad_ruta','2024-04-20 12:56:07.440544'),(77,'rutas','0004_alter_ruta_cuadrilla','2024-04-20 12:56:07.537547'),(78,'rutas','0005_actividad_estado_actividad_solicitud','2024-04-20 12:56:07.607540'),(79,'rutas','0006_alter_actividad_solicitud','2024-04-20 12:56:07.720537'),(80,'rutas','0007_actividad_usuario_mod_alter_actividad_tipo_and_more','2024-04-20 12:56:07.931838'),(81,'rutas','0008_alter_actividadhistorial_table','2024-04-20 12:56:07.947369'),(82,'rutas','0009_remove_actividad_tipo','2024-04-20 12:56:07.984159'),(83,'rutas','0010_alter_actividad_fecha','2024-04-20 12:56:08.034721'),(84,'rutas','0011_actividad_tiempo_fin_actividad_tiempo_inicio_and_more','2024-04-20 12:56:08.146723'),(85,'rutas','0012_actividad_id_tecnico','2024-04-20 12:56:08.204721'),(86,'rutas','0013_actividad_distancia','2024-04-20 12:56:08.231724'),(87,'rutas','0014_ruta_actividades','2024-04-20 12:56:08.352721'),(88,'rutas','0015_rename_actividades_ruta_actividades','2024-04-20 12:56:08.365722'),(89,'rutas','0016_alter_actividad_solicitud','2024-04-20 12:56:08.486735'),(90,'rutas','0017_alter_actividad_tiempo_fin_and_more','2024-04-20 12:56:08.715481'),(91,'rutas','0018_remove_actividad_ruta','2024-04-20 12:56:08.825684'),(92,'rutas','0019_remove_actividadhistorial_ruta','2024-04-20 12:56:08.882677'),(93,'rutas','0020_alter_ruta_actividades','2024-04-20 12:56:08.900748'),(94,'rutas','0021_alter_ruta_actividades','2024-04-20 12:56:08.915685'),(95,'rutas','0022_remove_ruta_actividades_actividad_ruta','2024-04-20 12:56:08.994773'),(96,'rutas','0023_actividadhistorial_ruta','2024-04-20 12:56:09.049400'),(97,'rutas','0024_alter_actividadhistorial_ruta','2024-04-20 12:56:09.065412'),(98,'rutas','0025_remove_actividad_nombre_remove_ruta_nombre','2024-04-20 12:56:09.111414'),(99,'rutas','0026_alter_actividad_id_tecnico','2024-04-20 12:56:09.128402'),(100,'rutas','0027_ruta_estado','2024-04-20 12:56:09.153401'),(101,'rutas','0028_actividad_km','2024-04-20 12:56:09.186414'),(102,'rutas','0029_actividad_id_cuadrilla','2024-04-20 12:56:09.262408'),(103,'rutas','0030_alter_actividad_id_cuadrilla_and_more','2024-04-20 12:56:09.337402'),(104,'rutas','0031_actividad_id_reagendado_and_more','2024-04-20 12:56:09.419402'),(105,'rutas','0032_alter_actividad_id_cuadrilla_and_more','2024-04-20 12:56:09.891037'),(106,'sessions','0001_initial','2024-04-20 12:56:09.938052'),(107,'store','0023_alter_movimiento_bodega_and_more','2024-04-20 12:56:10.539197'),(108,'store','0024_movimiento_proveedor_producto_tipo2_and_more','2024-04-20 12:56:10.857198'),(109,'store','0025_remove_stock_nombre_bodega_and_more','2024-04-20 12:56:10.889188'),(110,'store','0026_producto_nombre_simple','2024-04-20 12:56:10.932647'),(111,'store','0027_remove_serie_ubicacion_serie_stock','2024-04-20 12:56:11.009221'),(112,'store','0028_serie_garantia','2024-04-20 12:56:11.045222'),(113,'store','0029_alter_serie_garantia','2024-04-20 12:56:11.073213'),(114,'store','0030_alter_serie_serie','2024-04-20 12:56:11.105212'),(115,'user','0007_version','2024-04-20 12:56:11.121212'),(116,'user','0008_version_sistema','2024-04-20 12:56:11.135219'),(117,'rutas','0033_actividad_motivo_cancelado','2024-04-21 23:47:48.791305'),(118,'rutas','0034_remove_actividad_motivo_cancelado','2024-04-22 00:07:40.562387'),(119,'rutas','0035_actividad_motivo_cancelado','2024-04-22 00:18:07.855168');
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
INSERT INTO `django_session` VALUES ('thuj6msz0f354n8id9psmjqnutubwc2w','.eJxVjEEOwiAQRe_C2pAyTAt16d4zEGaYStXQpLQr492VpAvd_vfef6kQ9y2Hvcoa5qTOCtTpd6PIDykNpHsst0XzUrZ1Jt0UfdCqr0uS5-Vw_w5yrPlbEzLw6KfeCRvjHEdv7eQHm3oEYkDPNEBnGIVGMa4B5s4xWvACqN4f5DA3og:1vuXyv:AitxwLZ6RsX3hM0oDAjkyj9dRqGVvYNI8sULejyE020','2026-03-09 15:36:21.801405');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hojatrabajo`
--

DROP TABLE IF EXISTS `hojatrabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hojatrabajo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(35) NOT NULL,
  `tipo` varchar(60) NOT NULL,
  `datos` json DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `usuario_creacion_id` int DEFAULT NULL,
  `usuario_modificacion_id` int DEFAULT NULL,
  `id_actividad` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hojatrabajo_usuario_creacion_id_67810900_fk_usuario_id` (`usuario_creacion_id`),
  KEY `hojatrabajo_usuario_modificacion_id_7943836b_fk_usuario_id` (`usuario_modificacion_id`),
  CONSTRAINT `hojatrabajo_usuario_creacion_id_67810900_fk_usuario_id` FOREIGN KEY (`usuario_creacion_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `hojatrabajo_usuario_modificacion_id_7943836b_fk_usuario_id` FOREIGN KEY (`usuario_modificacion_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hojatrabajo`
--

LOCK TABLES `hojatrabajo` WRITE;
/*!40000 ALTER TABLE `hojatrabajo` DISABLE KEYS */;
INSERT INTO `hojatrabajo` VALUES (3,'USUARIO CREADO','TRASLADO','{\"foto1\": \"23456787ygvxcdswefrgf\", \"foto2\": \"234gv3456765tgefdfrgf\"}','2024-03-09 22:56:12.329541','2024-03-09 22:56:12.329541',NULL,16,NULL),(4,'USUARIO CREADO','VISITA TECNICA','{\"Pago\": \"SI\", \"Observación\": \"ascasc\", \"FotoEquipousado\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-47%2FFoto%20Equipo%20usado%2Ffavicon.png?alt=media&token=dd5ff1ca-4995-46f1-b06b-589d4e0b2f29\", \"Valorcomentario\": \"ascasc\", \"Coordenadascliente\": \"21312313123\", \"Problemaeléctrico\": \"SI\", \"Problemainterferencia\": \"NO\", \"Problemacoberturarouter\": \"NO\", \"gestionProblemaeléctrico\": \"asc\", \"FotoSpeedtestdelasdosbandas\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-47%2FFoto%20Speedtest%20de%20las%20dos%20bandas%2Ffavicon.png?alt=media&token=0a1cbf5c-245a-4e4f-b17f-abd3691bf753\", \"gestionProblemainterferencia\": \"asc\", \"gestionProblemacoberturarouter\": \"acasca\"}','2024-03-09 23:32:54.641621','2024-03-09 23:32:54.641621',NULL,22,NULL),(5,'USUARIO CREADO','VISITA TECNICA','{\"Pago\": \"SI\", \"FotoEquipousado\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20Equipo%20usado%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=2a575e4d-b661-4658-9692-4fe5a1a8030b\", \"Valorcomentario\": \"35 por transferencia\", \"Problemaeléctrico\": \"NO\", \"FotoPotenciadelacaja\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20Potencia%20de%20la%20caja%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=62d17be8-cac1-4fdc-bf69-8fe2e3c68ae3\", \"FotoPotenciadecliente\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20Potencia%20de%20cliente%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=f9d1fff0-c1ae-42e2-bbf9-1d7b78c373de\", \"Problemainterferencia\": \"NO\", \"Fotoubicacióndeequipos\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20ubicaci%C3%B3n%20de%20equipos%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=62c5e20d-5ab5-4bf5-ad9e-955a2a2ddd59\", \"Problemacoberturarouter\": \"SI\", \"FotoSpeedtestdelasdosbandas\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20Speedtest%20de%20las%20dos%20bandas%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=7d2191c9-4e9a-4d00-a4e2-83cc4be8bbb6\", \"Verificacióndispositivoscliente\": \"SI\", \"FotoPartetraseraequiposinstalados\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20Parte%20trasera%20equipos%20instalados%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=6ce7c3f6-ccda-4049-8e5e-c0f419cd819d\"}','2024-03-13 19:36:29.010731','2024-03-13 19:36:29.010736',20,22,NULL),(6,'SUBIDO','VISITA TECNICA','{\"Pago\": \"SI\", \"FotoEquipousado\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20Equipo%20usado%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=2a575e4d-b661-4658-9692-4fe5a1a8030b\", \"Valorcomentario\": \"35 por transferencia\", \"Problemaeléctrico\": \"NO\", \"FotoPotenciadelacaja\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20Potencia%20de%20la%20caja%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=62d17be8-cac1-4fdc-bf69-8fe2e3c68ae3\", \"FotoPotenciadecliente\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20Potencia%20de%20cliente%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=f9d1fff0-c1ae-42e2-bbf9-1d7b78c373de\", \"Problemainterferencia\": \"NO\", \"Fotoubicacióndeequipos\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20ubicaci%C3%B3n%20de%20equipos%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=62c5e20d-5ab5-4bf5-ad9e-955a2a2ddd59\", \"Problemacoberturarouter\": \"SI\", \"FotoSpeedtestdelasdosbandas\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20Speedtest%20de%20las%20dos%20bandas%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=7d2191c9-4e9a-4d00-a4e2-83cc4be8bbb6\", \"Verificacióndispositivoscliente\": \"SI\", \"FotoPartetraseraequiposinstalados\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-52%2FFoto%20Parte%20trasera%20equipos%20instalados%2FWhatsApp_Image_2024-03-13_at_12.22.49-removebg-preview.png?alt=media&token=6ce7c3f6-ccda-4049-8e5e-c0f419cd819d\"}','2024-03-13 19:36:36.422174','2024-03-13 19:36:36.422177',20,NULL,NULL),(7,'SUBIDO','INSTALACION','{}','2024-03-15 19:46:53.052006','2024-03-15 19:46:53.052011',24,NULL,NULL),(8,'SUBIDO','INSTALACION','{}','2024-03-15 19:46:55.227770','2024-03-15 19:46:55.227773',24,NULL,NULL),(9,'SUBIDO','-','{}','2024-03-18 19:31:41.255820','2024-03-18 19:31:41.255824',20,NULL,NULL),(10,'SUBIDO','-','{}','2024-03-18 19:31:44.779117','2024-03-18 19:31:44.779120',20,NULL,NULL),(11,'USUARIO CREADO','INSTALACION','{\"Pago\": \"SI\", \"FotoContrato\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Contrato%2F17107915510837288384486970980020.jpg?alt=media&token=30a24383-2a6c-4232-beb0-2845bfd7a3b2\", \"Observación\": \"Instalacion\", \"Coordenadascaja\": \"Ksis8wkwixn8diek\", \"Valorcomentario\": \"50 efectivo\", \"Coordenadascliente\": \"Kdisiwnsisn\", \"FotoCédulaanverso\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20C%C3%A9dula%20anverso%2FIMG-20240318-WA0152.jpg?alt=media&token=b0bcb548-c594-4f0a-84e9-b5c4f8725b5b\", \"FotoCédulareverso\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20C%C3%A9dula%20reverso%2F17107915356997929030547726379828.jpg?alt=media&token=788871f4-82ab-428d-a87f-5d3aa0ba1965\", \"FotoEtiquetadecaja\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Etiqueta%20de%20caja%2F17107916066806848135668500353638.jpg?alt=media&token=f1bd3c2e-c429-497f-aa65-c2b818690818\", \"FotoPotenciadelacaja\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Potencia%20de%20la%20caja%2F17107915778416087933565639301105.jpg?alt=media&token=f91bcc33-b5ab-41cd-a1b4-77857a46e7ca\", \"FotoPigtailetiquetado\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Pigtail%20etiquetado%2F17107916230418556255806824209203.jpg?alt=media&token=e115bdf9-a9dd-4246-973e-333ec29daeae\", \"FotoUbicacióndeequipos\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Ubicaci%C3%B3n%20de%20equipos%2F17107915606017131363345029238136.jpg?alt=media&token=e58c5637-4704-473f-8808-863abdcb4521\", \"FotoSpeedtestdelasdosbandas\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Speedtest%20de%20las%20dos%20bandas%2F17107916354144511005568151067495.jpg?alt=media&token=5586cafc-c265-4d3f-8ad1-4c871e77df47\"}','2024-03-18 19:55:05.679391','2024-03-18 19:55:05.679394',20,21,NULL),(12,'SUBIDO','INSTALACION','{\"Pago\": \"SI\", \"FotoContrato\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Contrato%2F17107915510837288384486970980020.jpg?alt=media&token=30a24383-2a6c-4232-beb0-2845bfd7a3b2\", \"Observación\": \"Instalacion\", \"Coordenadascaja\": \"Ksis8wkwixn8diek\", \"Valorcomentario\": \"50 efectivo\", \"Coordenadascliente\": \"Kdisiwnsisn\", \"FotoCédulaanverso\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20C%C3%A9dula%20anverso%2FIMG-20240318-WA0152.jpg?alt=media&token=b0bcb548-c594-4f0a-84e9-b5c4f8725b5b\", \"FotoCédulareverso\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20C%C3%A9dula%20reverso%2F17107915356997929030547726379828.jpg?alt=media&token=788871f4-82ab-428d-a87f-5d3aa0ba1965\", \"FotoEtiquetadecaja\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Etiqueta%20de%20caja%2F17107916066806848135668500353638.jpg?alt=media&token=f1bd3c2e-c429-497f-aa65-c2b818690818\", \"FotoPotenciadelacaja\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Potencia%20de%20la%20caja%2F17107915778416087933565639301105.jpg?alt=media&token=f91bcc33-b5ab-41cd-a1b4-77857a46e7ca\", \"FotoPigtailetiquetado\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Pigtail%20etiquetado%2F17107916230418556255806824209203.jpg?alt=media&token=e115bdf9-a9dd-4246-973e-333ec29daeae\", \"FotoUbicacióndeequipos\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Ubicaci%C3%B3n%20de%20equipos%2F17107915606017131363345029238136.jpg?alt=media&token=e58c5637-4704-473f-8808-863abdcb4521\", \"FotoSpeedtestdelasdosbandas\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Speedtest%20de%20las%20dos%20bandas%2F17107916354144511005568151067495.jpg?alt=media&token=5586cafc-c265-4d3f-8ad1-4c871e77df47\"}','2024-03-18 19:55:10.493598','2024-03-18 19:55:10.493602',20,NULL,NULL),(13,'SUBIDO','INSTALACION','{\"Pago\": \"SI\", \"FotoContrato\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Contrato%2F17107915510837288384486970980020.jpg?alt=media&token=30a24383-2a6c-4232-beb0-2845bfd7a3b2\", \"Observación\": \"Instalacion\", \"Coordenadascaja\": \"Ksis8wkwixn8diek\", \"Valorcomentario\": \"50 efectivo\", \"Coordenadascliente\": \"Kdisiwnsisn\", \"FotoCédulaanverso\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20C%C3%A9dula%20anverso%2FIMG-20240318-WA0152.jpg?alt=media&token=b0bcb548-c594-4f0a-84e9-b5c4f8725b5b\", \"FotoCédulareverso\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20C%C3%A9dula%20reverso%2F17107915356997929030547726379828.jpg?alt=media&token=788871f4-82ab-428d-a87f-5d3aa0ba1965\", \"FotoEtiquetadecaja\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Etiqueta%20de%20caja%2F17107916066806848135668500353638.jpg?alt=media&token=f1bd3c2e-c429-497f-aa65-c2b818690818\", \"FotoPotenciadelacaja\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Potencia%20de%20la%20caja%2F17107915778416087933565639301105.jpg?alt=media&token=f91bcc33-b5ab-41cd-a1b4-77857a46e7ca\", \"FotoPigtailetiquetado\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Pigtail%20etiquetado%2F17107916230418556255806824209203.jpg?alt=media&token=e115bdf9-a9dd-4246-973e-333ec29daeae\", \"FotoUbicacióndeequipos\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Ubicaci%C3%B3n%20de%20equipos%2F17107915606017131363345029238136.jpg?alt=media&token=e58c5637-4704-473f-8808-863abdcb4521\", \"FotoSpeedtestdelasdosbandas\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-60%2FFoto%20Speedtest%20de%20las%20dos%20bandas%2F17107916354144511005568151067495.jpg?alt=media&token=5586cafc-c265-4d3f-8ad1-4c871e77df47\"}','2024-03-18 19:55:12.228165','2024-03-18 19:55:12.228168',20,NULL,NULL),(14,'SUBIDO','VISITA TECNICA','{\"Pago\": \"NO\", \"Dañofibra\": \"NO\", \"Cambioequipo\": \"NO\", \"Problemabridge\": \"NO\", \"Problemaroseta\": \"NO\", \"Problemarouter\": \"NO\", \"Coordenadascaja\": \"Isjdbwuwjwh\", \"FotoEquipousado\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-61%2FFoto%20Equipo%20usado%2F17107923691737055454356797645072.jpg?alt=media&token=e963f656-acc4-4a57-96eb-a8d05bc9b1f6\", \"Férulaslimpias\": \"SI\", \"Coordenadascliente\": \"Jwbsusjsvw\", \"Problemaeléctrico\": \"NO\", \"FotoPotenciadelacaja\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-61%2FFoto%20Potencia%20de%20la%20caja%2F17107924053305041620027600355232.jpg?alt=media&token=b04ed7dc-a6b9-4a61-82cd-893a758a344b\", \"Problemainterferencia\": \"NO\", \"Fotoubicacióndeequipos\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-61%2FFoto%20ubicaci%C3%B3n%20de%20equipos%2F17107923823893058347365827917373.jpg?alt=media&token=f1bddd12-6673-4ef7-9c73-11fdb9044334\", \"Problemacoberturarouter\": \"SI\", \"FotoSpeedtestdelasdosbandas\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-61%2FFoto%20Speedtest%20de%20las%20dos%20bandas%2F1710792393506557240411081233993.jpg?alt=media&token=781a546d-29f8-4a7a-8a2e-25d7b45eae5b\", \"gestionProblemacoberturarouter\": \"Sussusvwhw\", \"Verificacióndispositivoscliente\": \"SI\", \"FotoPartetraseraequiposinstalados\": \"https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/HOJA%20DE%20TRABAJO%2FACTIVIDAD-61%2FFoto%20Parte%20trasera%20equipos%20instalados%2F17107923549103088864323611011606.jpg?alt=media&token=e5db5009-b49d-478b-965a-403a9dafb1ad\"}','2024-03-18 20:07:09.976447','2024-03-18 20:07:09.976450',20,NULL,NULL),(15,'SUBIDO','RETIRO','{\"Pago\": \"SI\", \"Equiposok\": \"SI\", \"Motivoretira\": \"Sin dinero \", \"Observación\": \"Ninguno\", \"Valorcomentario\": \"Por proporcional días con consumo\", \"Equiposcompletos\": \"SI\", \"gestionEquiposok\": \"Verificación equipos encienden\", \"gestionEquiposcompletos\": \"Retiro de equipos\"}','2024-03-18 20:43:14.804518','2024-03-18 20:43:14.804521',20,NULL,NULL),(16,'SUBIDO','MIGRACION','{}','2024-03-19 20:59:48.700767','2024-03-19 20:59:48.700771',16,NULL,NULL),(17,'SUBIDO','MIGRACION','{}','2024-03-19 20:59:51.193092','2024-03-19 20:59:51.193097',16,NULL,NULL),(18,'SUBIDO','VISITA TECNICA','{}','2024-03-20 21:08:21.053192','2024-03-20 21:08:21.053194',16,NULL,63),(19,'SUBIDO','RETIRO','{\"Motivoretira\": \"no tiene dinero\"}','2024-03-20 21:11:28.909234','2024-03-20 21:11:28.909237',16,NULL,64),(21,'SUBIDA','TRASLADO','{\"foto1\": \"23456787ygvxcdswefrgf\", \"foto2\": \"234gv3456765tgefdfrgf\"}','2024-03-29 20:39:22.044660','2024-03-29 20:39:22.044660',27,NULL,NULL),(22,'SUBIDA','TRASLADO','\"\"','2024-03-29 20:41:29.438965','2024-03-29 20:41:29.438965',27,NULL,NULL),(25,'SUBIDA','TRASLADO','\"\"','2024-03-29 20:51:59.591309','2024-03-29 20:51:59.591309',27,NULL,67),(26,'SUBIDA','TRASLADO','\"\"','2024-03-29 20:52:05.787354','2024-03-29 20:52:05.787354',27,NULL,63),(27,'SUBIDO','VISITA TECNICA','{\"Observación\": \"ascascasc\"}','2024-04-06 12:06:19.338862','2024-04-06 12:06:19.338862',27,NULL,65),(28,'SUBIDO','VISITA TECNICA','{\"Observación\": \"ascascasc\"}','2024-04-06 12:07:32.277723','2024-04-06 12:07:32.277723',27,NULL,65),(29,'SUBIDO','VISITA TECNICA','{\"Observación\": \"ascascasc\"}','2024-04-06 12:17:44.389215','2024-04-06 12:17:44.389215',27,NULL,65);
/*!40000 ALTER TABLE `hojatrabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit`
--

DROP TABLE IF EXISTS `kit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kit`
--

LOCK TABLES `kit` WRITE;
/*!40000 ALTER TABLE `kit` DISABLE KEYS */;
INSERT INTO `kit` VALUES (1,'NAVIDEÑO2','2023-12-16 17:58:46.098118','2023-12-17 00:11:49.331126'),(2,'CAMBIO DE DOMICIO','2023-12-16 18:00:18.286164','2023-12-16 18:00:52.038389');
/*!40000 ALTER TABLE `kit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kitxproducto`
--

DROP TABLE IF EXISTS `kitxproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kitxproducto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `kit_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kitxproducto_kit_id_3551cfb7_fk_kit_id` (`kit_id`),
  KEY `kitxproducto_producto_id_0be59c52_fk_producto_id` (`producto_id`),
  CONSTRAINT `kitxproducto_kit_id_3551cfb7_fk_kit_id` FOREIGN KEY (`kit_id`) REFERENCES `kit` (`id`),
  CONSTRAINT `kitxproducto_producto_id_0be59c52_fk_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `kitxproducto_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kitxproducto`
--

LOCK TABLES `kitxproducto` WRITE;
/*!40000 ALTER TABLE `kitxproducto` DISABLE KEYS */;
INSERT INTO `kitxproducto` VALUES (2,2,'2023-12-16 18:09:36.075398','2023-12-16 18:09:36.075398',1,NULL),(4,1,'2023-12-17 01:42:37.199157','2023-12-17 01:42:37.199157',1,NULL),(6,3,'2023-12-17 01:48:47.065422','2023-12-17 01:48:47.065422',1,NULL),(7,2,'2023-12-17 02:08:43.109030','2023-12-17 02:08:43.109030',2,NULL),(8,3,'2023-12-17 02:08:48.594055','2023-12-17 02:08:48.594055',2,NULL);
/*!40000 ALTER TABLE `kitxproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(30) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (5,'Huawei','2024-02-22 17:41:07.490502','2024-02-22 17:41:07.490499'),(6,'Tp-Link','2024-02-22 17:41:12.626758','2024-02-22 17:41:12.626755'),(7,'D-Link','2024-02-22 17:41:16.535262','2024-02-22 17:41:16.535259'),(8,'Ubiquiti','2024-02-22 17:41:23.548638','2024-02-22 17:41:23.548633'),(9,'Mercusys','2024-02-22 17:41:30.666128','2024-02-22 17:41:30.666125'),(10,'GENERICO','2024-03-15 20:19:17.302402','2024-03-15 20:19:17.302397'),(11,'FIBRAMERICA','2024-03-15 20:20:43.322907','2024-03-15 20:20:43.322902'),(12,'LILCHI','2024-03-20 19:49:03.266835','2024-03-20 19:49:03.266833'),(13,'3M','2024-03-21 03:38:07.998248','2024-03-21 03:38:07.998244'),(14,'ARPATEL','2024-03-21 03:43:06.488311','2024-03-21 03:43:06.488306'),(15,'Tenda','2024-03-22 04:31:41.137051','2024-03-22 04:31:41.137048'),(16,'QPCOM','2024-03-22 04:35:05.718856','2024-03-22 04:35:05.718853');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(30) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'HS8546V5','2023-11-18 01:07:16.131513','2023-11-18 01:07:16.131513'),(3,'EG8145V5','2023-12-01 15:06:13.201990','2023-12-01 15:06:13.201990'),(6,'HG8310M','2024-03-11 17:09:10.597348','2024-03-11 17:09:10.597344'),(7,'HG8546M','2024-03-11 17:10:01.992719','2024-03-11 17:10:01.992714'),(8,'XZ000-G3','2024-03-11 17:10:23.129028','2024-03-11 17:10:23.129024'),(9,'XZ000-G7','2024-03-11 17:10:36.278149','2024-03-11 17:10:36.278145'),(10,'EG8141A5','2024-03-11 17:10:57.306689','2024-03-11 17:10:57.306684'),(11,'HG8010H','2024-03-11 17:13:24.054898','2024-03-11 17:13:24.054894'),(12,'GENERICO','2024-03-15 20:21:42.291344','2024-03-15 20:21:42.291340'),(15,'UTP GENERICO','2024-03-20 19:54:00.722659','2024-03-20 19:54:00.722655'),(16,'LiteBeam-2G','2024-03-20 19:58:09.144361','2024-03-20 19:58:09.144357'),(17,'Nano loco AC','2024-03-20 20:08:16.798469','2024-03-20 20:08:16.798466'),(18,'Nano loco M5','2024-03-20 20:08:23.104289','2024-03-20 20:08:23.104287'),(19,'Poe Ubiquiti white','2024-03-20 20:11:15.431788','2024-03-20 20:11:15.431785'),(20,'Poe Ubiquiti Black','2024-03-20 20:11:21.208059','2024-03-20 20:11:21.208056'),(23,'Puntas patch-APC','2024-03-21 03:48:18.907842','2024-03-21 03:48:18.907838'),(24,'Puntas patch-UPC','2024-03-21 03:53:50.437533','2024-03-21 03:53:50.437529'),(26,'Bobina Drop 8 hilos','2024-03-22 04:17:54.679420','2024-03-22 04:17:54.679416'),(27,'Dir-615','2024-03-22 04:22:58.137251','2024-03-22 04:22:58.137248'),(28,'Archer-C50','2024-03-22 04:24:28.696165','2024-03-22 04:24:28.696161'),(29,'AC12G','2024-03-22 04:26:06.371524','2024-03-22 04:26:06.371520'),(30,'HC220-G5','2024-03-22 04:28:24.661002','2024-03-22 04:28:24.660997'),(31,'F3-3antenas','2024-03-22 04:30:17.011685','2024-03-22 04:30:17.011682'),(32,'QP-COM','2024-03-22 04:35:29.926081','2024-03-22 04:35:29.926078'),(33,'Conector RJ45','2024-03-22 04:37:16.101912','2024-03-22 04:37:16.101909'),(34,'Amarras','2024-03-22 04:38:58.110820','2024-03-22 04:38:58.110817'),(35,'Amarritas','2024-03-22 04:39:26.156577','2024-03-22 04:39:26.156574'),(36,'Canaleta','2024-03-22 04:40:31.002242','2024-03-22 04:40:31.002239'),(37,'Grapas plasticas','2024-03-22 04:41:53.116687','2024-03-22 04:41:53.116684'),(38,'Cinta aislante','2024-03-22 04:43:11.948521','2024-03-22 04:43:11.948518'),(39,'Splitter 1 X 8','2024-03-22 04:45:58.600296','2024-03-22 04:45:58.600292'),(40,'Splitter 1 X 16','2024-03-22 04:46:07.343969','2024-03-22 04:46:07.343966'),(41,'Taco Fisher 10','2024-03-22 04:46:37.848139','2024-03-22 04:46:37.848137'),(42,'Polo metálico grande','2024-03-22 04:50:45.251503','2024-03-22 04:50:45.251500'),(43,'Polo metálico pequeño','2024-03-22 04:51:31.709132','2024-03-22 04:51:31.709130');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivo_movimiento`
--

DROP TABLE IF EXISTS `motivo_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motivo_movimiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `motivo` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivo_movimiento`
--

LOCK TABLES `motivo_movimiento` WRITE;
/*!40000 ALTER TABLE `motivo_movimiento` DISABLE KEYS */;
INSERT INTO `motivo_movimiento` VALUES (4,'Ingreso','2024-01-09 18:15:39.762879','2024-01-09 18:15:39.762879'),(5,'Egreso','2024-01-10 19:21:03.086437','2024-01-10 19:21:03.086437'),(7,'Recepcion','2024-03-18 21:21:45.185918','2024-03-18 21:21:45.185923'),(8,'Compra','2024-03-26 19:50:13.312983','2024-03-26 19:50:13.312983');
/*!40000 ALTER TABLE `motivo_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `bodega_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `tipomovimiento` varchar(10) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `usuario_id` int DEFAULT NULL,
  `motivo_movimiento_id` int DEFAULT NULL,
  `id_actividad` int DEFAULT NULL,
  `proveedor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimiento_bodega_id_753469c2_fk_bodega_id` (`bodega_id`),
  KEY `movimiento_motivo_movimiento_id_f38bdc69_fk_motivo_movimiento_id` (`motivo_movimiento_id`),
  KEY `movimiento_producto_id_d143dcf2_fk_producto_id` (`producto_id`),
  KEY `movimiento_usuario_id_90f8f5ea_fk_usuario_id` (`usuario_id`),
  KEY `movimiento_proveedor_id_801523ab_fk_proveedor_id` (`proveedor_id`),
  CONSTRAINT `movimiento_bodega_id_753469c2_fk_bodega_id` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  CONSTRAINT `movimiento_motivo_movimiento_id_f38bdc69_fk_motivo_movimiento_id` FOREIGN KEY (`motivo_movimiento_id`) REFERENCES `motivo_movimiento` (`id`),
  CONSTRAINT `movimiento_producto_id_d143dcf2_fk_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `movimiento_proveedor_id_801523ab_fk_proveedor_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`),
  CONSTRAINT `movimiento_usuario_id_90f8f5ea_fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `movimiento_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (91,0,2,NULL,'EGRESO','ascas','2024-01-31 01:44:14.000000','2024-03-22 09:41:46.000000',NULL,5,NULL,NULL),(92,0,1,NULL,'EGRESO','CAS','2024-01-31 01:52:39.000000','2024-03-22 09:41:46.000000',NULL,4,NULL,NULL),(93,0,1,NULL,'INGRESO','CAS','2024-01-31 01:52:40.000000','2024-03-22 09:41:46.000000',NULL,4,NULL,NULL),(94,0,1,NULL,'EGRESO','ejemplo transferencia','2024-02-01 17:13:23.000000','2024-03-22 09:41:46.000000',NULL,NULL,NULL,NULL),(95,0,1,NULL,'INGRESO','ejemplo transferencia','2024-02-01 17:13:23.000000','2024-03-22 09:41:46.000000',NULL,NULL,NULL,NULL),(96,0,1,16,'EGRESO','base_dev','2024-02-22 17:38:16.000000','2024-03-22 09:41:50.000000',NULL,NULL,NULL,NULL),(97,0,1,18,'INGRESO','base_dev','2024-02-22 17:38:17.000000','2024-03-22 09:41:50.000000',NULL,NULL,NULL,NULL),(98,0,2,20,'INGRESO','SE INGRESÓ 10 CAJAS','2024-02-22 18:03:23.000000','2024-03-22 09:41:50.000000',NULL,4,NULL,NULL),(99,0,1,16,'EGRESO','Tal cuadrilla Retiro algo y trajo a bauhaus','2024-02-22 18:04:31.000000','2024-03-22 09:41:50.000000',NULL,NULL,NULL,NULL),(100,0,1,20,'INGRESO','Tal cuadrilla Retiro algo y trajo a bauhaus','2024-02-22 18:04:31.000000','2024-03-22 09:41:50.000000',NULL,NULL,NULL,NULL),(101,0,1,NULL,'INGRESO','a','2024-03-09 18:48:23.000000','2024-03-22 09:41:50.000000',NULL,4,47,NULL),(102,0,1,NULL,'EGRESO','base_dev','2024-03-09 21:31:08.000000','2024-03-22 09:41:46.000000',NULL,NULL,NULL,NULL),(103,0,1,NULL,'INGRESO','base_dev','2024-03-09 21:31:08.000000','2024-03-22 09:41:46.000000',NULL,NULL,NULL,NULL),(104,0,1,NULL,'EGRESO','acas','2024-03-09 21:46:02.000000','2024-03-22 09:41:46.000000',NULL,5,47,NULL),(105,0,2,NULL,'EGRESO','acas','2024-03-10 16:07:01.000000','2024-03-22 09:41:50.000000',NULL,NULL,NULL,NULL),(106,0,2,NULL,'INGRESO','acas','2024-03-10 16:07:02.000000','2024-03-22 09:41:50.000000',NULL,NULL,NULL,NULL),(107,0,2,NULL,'EGRESO','ascas','2024-03-10 16:08:03.000000','2024-03-22 09:41:50.000000',NULL,NULL,NULL,NULL),(108,0,2,NULL,'INGRESO','ascas','2024-03-10 16:08:03.000000','2024-03-22 09:41:50.000000',NULL,NULL,NULL,NULL),(109,0,10,20,'INGRESO','Ingresaron 100 amarras','2024-03-12 20:52:00.000000','2024-03-22 09:41:50.000000',24,NULL,NULL,NULL),(110,0,5,20,'INGRESO','Ingresaron 100 amarras','2024-03-12 20:52:01.000000','2024-03-22 09:42:02.000000',24,NULL,NULL,NULL),(111,0,2,20,'EGRESO','Se le entrego a Kevin a tal hora','2024-03-12 20:53:21.000000','2024-03-22 09:41:50.000000',24,NULL,NULL,NULL),(112,0,2,17,'INGRESO','Se le entrego a Kevin a tal hora','2024-03-12 20:53:22.000000','2024-03-22 09:41:50.000000',24,NULL,NULL,NULL),(113,0,2,17,'INGRESO','por instalación de equipos','2024-03-13 19:02:06.000000','2024-03-22 09:41:50.000000',20,4,49,NULL),(114,0,1,17,'INGRESO','por instalación de equipos','2024-03-13 19:02:07.000000','2024-03-22 00:09:32.000000',20,4,49,NULL),(115,0,2,17,'EGRESO','por instalación','2024-03-13 19:04:14.000000','2024-03-22 09:41:50.000000',20,5,49,NULL),(116,0,1,17,'EGRESO','por instalación','2024-03-13 19:04:14.000000','2024-03-22 00:09:32.000000',20,5,49,NULL),(117,0,2,17,'INGRESO','para instalacion','2024-03-13 19:11:12.000000','2024-03-22 00:09:32.000000',20,4,52,NULL),(118,0,2,17,'INGRESO','para instalacion','2024-03-13 19:11:12.000000','2024-03-22 09:41:46.000000',20,4,52,NULL),(119,0,2,17,'EGRESO','instalado a cliente','2024-03-13 19:12:17.000000','2024-03-22 09:41:50.000000',20,5,52,NULL),(120,0,2,17,'EGRESO','instalado a cliente','2024-03-13 19:12:17.000000','2024-03-22 00:09:32.000000',20,5,52,NULL),(121,0,2,17,'EGRESO','instalado a cliente','2024-03-13 19:12:17.000000','2024-03-22 09:41:46.000000',20,5,52,NULL),(122,11,40,NULL,'INGRESO','INGRESA A BODEHA BAUHAUS 40 ROSETAS ENTREGADAS POR ECONOMISTA.','2024-03-15 20:25:40.000000','2024-03-19 12:26:40.000000',21,4,NULL,NULL),(123,11,40,20,'INGRESO','Ingresaron el Ing Richard','2024-03-15 20:29:02.000000','2024-03-15 20:29:02.000000',24,4,NULL,NULL),(124,12,2000,20,'INGRESO','A','2024-03-15 20:37:08.000000','2024-03-15 20:37:08.000000',24,4,NULL,NULL),(125,0,1,17,'INGRESO','por concepto de instalación','2024-03-18 19:38:37.000000','2024-03-22 00:09:32.000000',20,4,60,NULL),(126,0,1,17,'EGRESO','por instalación','2024-03-18 19:45:42.000000','2024-03-22 00:09:32.000000',20,5,60,NULL),(127,0,1,17,'INGRESO','Por visita','2024-03-18 19:58:41.000000','2024-03-22 09:41:50.000000',20,4,61,NULL),(128,0,1,17,'EGRESO','Visita','2024-03-18 20:01:40.000000','2024-03-22 09:41:50.000000',20,5,61,NULL),(129,11,1,17,'INGRESO','Por retiro de equipos','2024-03-18 20:09:54.000000','2024-03-18 20:09:54.000000',20,4,62,NULL),(130,0,1,17,'INGRESO','Por retiro de equipos','2024-03-18 20:09:54.000000','2024-03-22 00:09:32.000000',20,4,62,NULL),(131,10,1,17,'INGRESO','Por retiro de equipos','2024-03-18 20:09:54.000000','2024-03-18 20:09:54.000000',20,4,62,NULL),(132,11,1,17,'EGRESO','Por retiro','2024-03-18 20:42:12.000000','2024-03-18 20:42:12.000000',20,5,62,NULL),(133,10,1,17,'EGRESO','Por retiro','2024-03-18 20:42:12.000000','2024-03-18 20:42:12.000000',20,5,62,NULL),(134,0,1,17,'EGRESO','Por retiro','2024-03-18 20:42:13.000000','2024-03-22 00:09:32.000000',20,5,62,NULL),(135,0,5,20,'EGRESO','SE ENTREGA MATERIALES A CUADRILLA EL DIA DE HOY','2024-03-18 21:03:22.000000','2024-03-22 09:41:50.000000',21,5,NULL,NULL),(136,11,5,20,'EGRESO','SE ENTREGA MATERIALES A CUADRILLA EL DIA DE HOY','2024-03-18 21:03:23.000000','2024-03-18 21:03:23.000000',21,5,NULL,NULL),(137,0,5,NULL,'INGRESO','SE ENTREGA MATERIALES A CUADRILLA EL DIA DE HOY','2024-03-18 21:03:23.000000','2024-03-22 09:41:50.000000',21,5,NULL,NULL),(138,11,5,NULL,'INGRESO','SE ENTREGA MATERIALES A CUADRILLA EL DIA DE HOY','2024-03-18 21:03:23.000000','2024-03-19 12:28:42.000000',21,5,NULL,NULL),(139,13,10,20,'INGRESO','INGRESAN A BODEHA BAUHAUS, 10 PATCH APC APC Y 100 AMARRITAS','2024-03-19 20:07:41.000000','2024-03-19 20:07:41.000000',21,4,NULL,NULL),(140,14,100,20,'INGRESO','INGRESAN A BODEHA BAUHAUS, 10 PATCH APC APC Y 100 AMARRITAS','2024-03-19 20:07:41.000000','2024-03-19 20:07:41.000000',21,4,NULL,NULL),(141,0,3,20,'INGRESO','INGRESAN A BODEHA BAUHAUS 3 ONU EG8145V5','2024-03-19 20:14:21.000000','2024-03-22 00:09:32.000000',21,4,NULL,NULL),(142,14,11,20,'EGRESO','Se entrega material','2024-03-19 20:44:27.000000','2024-03-19 20:44:27.000000',21,5,NULL,NULL),(143,11,2,20,'EGRESO','Se entrega material','2024-03-19 20:44:27.000000','2024-03-19 20:44:27.000000',21,5,NULL,NULL),(144,13,1,20,'EGRESO','Se entrega material','2024-03-19 20:44:27.000000','2024-03-19 20:44:27.000000',21,5,NULL,NULL),(145,0,1,20,'EGRESO','Se entrega material','2024-03-19 20:44:27.000000','2024-03-22 00:09:32.000000',21,5,NULL,NULL),(146,14,11,19,'INGRESO','Se entrega material','2024-03-19 20:44:28.000000','2024-03-19 20:44:28.000000',21,5,NULL,NULL),(147,11,2,19,'INGRESO','Se entrega material','2024-03-19 20:44:28.000000','2024-03-19 20:44:28.000000',21,5,NULL,NULL),(148,13,1,19,'INGRESO','Se entrega material','2024-03-19 20:44:28.000000','2024-03-19 20:44:28.000000',21,5,NULL,NULL),(149,0,1,19,'INGRESO','Se entrega material','2024-03-19 20:44:28.000000','2024-03-22 00:09:32.000000',21,5,NULL,NULL),(150,11,1,19,'EGRESO','materiales utilizados.','2024-03-19 21:00:48.000000','2024-03-19 21:00:48.000000',16,5,58,NULL),(151,14,5,19,'EGRESO','materiales utilizados.','2024-03-19 21:00:48.000000','2024-03-19 21:00:48.000000',16,5,58,NULL),(152,0,1,19,'EGRESO','materiales utilizados.','2024-03-19 21:00:48.000000','2024-03-22 00:09:32.000000',16,5,58,NULL),(153,12,10,20,'INGRESO','INGRESAN 10 BOBINAS DE FIBRA DE PROVEEDOR LILCHI','2024-03-20 19:51:27.000000','2024-03-20 19:51:27.000000',21,4,NULL,NULL),(154,16,5,20,'INGRESO','INGRESAN 5 BOBINA UTP A BODEGA BAUHAUS','2024-03-20 19:56:36.000000','2024-03-20 19:56:36.000000',21,4,NULL,NULL),(155,19,5,20,'INGRESO','INGRESAN 5 NANOLOCO AC Y 5 NANOLOCO M5','2024-03-20 20:10:15.000000','2024-03-20 20:10:15.000000',21,4,NULL,NULL),(156,18,5,20,'INGRESO','INGRESAN 5 NANOLOCO AC Y 5 NANOLOCO M5','2024-03-20 20:10:15.000000','2024-03-20 20:10:15.000000',21,4,NULL,NULL),(157,20,10,20,'INGRESO','INGRESAN 10 POE BLANCOS','2024-03-20 20:32:15.000000','2024-03-20 20:32:15.000000',21,4,NULL,NULL),(158,21,10,20,'INGRESO','INGRESA A BODEGA BAUHAUS 10 POE NEGROS.','2024-03-20 20:35:41.000000','2024-03-20 20:35:41.000000',21,4,NULL,NULL),(159,17,10,20,'INGRESO','INGRESAN 10 LITEBEAM AC 2DA GENERACION','2024-03-20 20:50:44.000000','2024-03-20 20:50:44.000000',21,4,NULL,NULL),(160,12,1,20,'EGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 20:53:59.000000','2024-03-20 20:53:59.000000',21,5,NULL,NULL),(161,19,2,20,'EGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 20:54:00.000000','2024-03-20 20:54:00.000000',21,5,NULL,NULL),(162,18,2,20,'EGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 20:54:00.000000','2024-03-20 20:54:00.000000',21,5,NULL,NULL),(163,20,4,20,'EGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 20:54:00.000000','2024-03-20 20:54:00.000000',21,5,NULL,NULL),(164,21,2,20,'EGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 20:54:00.000000','2024-03-20 20:54:00.000000',21,5,NULL,NULL),(165,12,1,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 20:54:00.000000','2024-03-20 20:54:00.000000',21,5,NULL,NULL),(166,19,2,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 20:54:00.000000','2024-03-20 20:54:00.000000',21,5,NULL,NULL),(167,18,2,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 20:54:00.000000','2024-03-20 20:54:00.000000',21,5,NULL,NULL),(168,20,4,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 20:54:00.000000','2024-03-20 20:54:00.000000',21,5,NULL,NULL),(169,21,2,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 20:54:00.000000','2024-03-20 20:54:00.000000',21,5,NULL,NULL),(170,14,5,19,'EGRESO','por instalación','2024-03-20 21:06:11.000000','2024-03-20 21:06:11.000000',16,5,63,NULL),(171,11,1,19,'EGRESO','por instalación','2024-03-20 21:06:11.000000','2024-03-20 21:06:11.000000',16,5,63,NULL),(172,12,200,19,'EGRESO','por instalación','2024-03-20 21:06:11.000000','2024-03-20 21:06:11.000000',16,5,63,NULL),(173,13,1,19,'EGRESO','por instalación','2024-03-20 21:06:11.000000','2024-03-20 21:06:11.000000',16,5,63,NULL),(174,21,2,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 21:07:36.000000','2024-03-20 21:07:36.000000',21,4,NULL,NULL),(175,20,2,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 21:07:36.000000','2024-03-20 21:07:36.000000',21,4,NULL,NULL),(176,14,22,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 21:07:36.000000','2024-03-20 21:07:36.000000',21,4,NULL,NULL),(177,13,4,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 21:07:36.000000','2024-03-20 21:07:36.000000',21,4,NULL,NULL),(178,11,5,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 21:07:36.000000','2024-03-20 21:07:36.000000',21,4,NULL,NULL),(179,16,1,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 21:07:36.000000','2024-03-20 21:07:36.000000',21,4,NULL,NULL),(180,12,1,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 21:07:36.000000','2024-03-20 21:07:36.000000',21,4,NULL,NULL),(181,15,2,19,'INGRESO','SE ENTREGA:\n\n01 BOBINA\n02 NANOLOCO M5\n02 NANOLOCO A5\n04 POES UBIQUITI BLANCO\n02 POES UBIQUITI NEGRO\n02 LITEBEAM 2DA GENERACION','2024-03-20 21:07:36.000000','2024-03-20 21:07:36.000000',21,4,NULL,NULL),(182,22,3,20,'INGRESO','SE RECIBE EN OFICINA: 3 CINTAS AISLANTES 3M, 34 PUNTAS APC-UPC Y 7 SPLITTER DE FUSION DE 1 X 8.','2024-03-21 03:57:19.000000','2024-03-21 03:57:19.000000',21,4,NULL,NULL),(183,23,7,20,'INGRESO','SE RECIBE EN OFICINA: 3 CINTAS AISLANTES 3M, 34 PUNTAS APC-UPC Y 7 SPLITTER DE FUSION DE 1 X 8.','2024-03-21 03:57:19.000000','2024-03-21 03:57:19.000000',21,4,NULL,NULL),(184,25,34,20,'INGRESO','SE RECIBE EN OFICINA: 3 CINTAS AISLANTES 3M, 34 PUNTAS APC-UPC Y 7 SPLITTER DE FUSION DE 1 X 8.','2024-03-21 03:57:19.000000','2024-03-21 03:57:19.000000',21,4,NULL,NULL),(185,14,10,19,'EGRESO','se retira del inventario para cuadrar.','2024-03-22 01:14:57.000000','2024-03-22 01:14:57.000000',16,5,NULL,NULL),(186,11,1,19,'EGRESO','se retira del inventario para cuadrar.','2024-03-22 01:14:57.000000','2024-03-22 01:14:57.000000',16,5,NULL,NULL),(187,13,4,19,'EGRESO','se retira del inventario para cuadrar.','2024-03-22 01:14:57.000000','2024-03-22 01:14:57.000000',16,5,NULL,NULL),(188,18,1,19,'EGRESO','se retira del inventario para cuadrar.','2024-03-22 01:14:57.000000','2024-03-22 01:14:57.000000',16,5,NULL,NULL),(189,19,1,19,'EGRESO','se retira del inventario para cuadrar.','2024-03-22 01:14:57.000000','2024-03-22 01:14:57.000000',16,5,NULL,NULL),(190,20,4,19,'EGRESO','se retira del inventario para cuadrar.','2024-03-22 01:14:57.000000','2024-03-22 01:14:57.000000',16,5,NULL,NULL),(191,15,1,19,'EGRESO','se retira del inventario para cuadrar.','2024-03-22 01:14:57.000000','2024-03-22 01:14:57.000000',16,5,NULL,NULL),(192,12,1,19,'EGRESO','se retira una bobina','2024-03-22 01:41:54.000000','2024-03-22 01:41:54.000000',16,5,NULL,NULL),(193,17,2,19,'INGRESO','ingresa 2 litebeam, 2 poes biquiti negros y 2 bridges tplink blancos.','2024-03-22 05:17:45.000000','2024-03-22 05:17:45.000000',21,4,NULL,NULL),(194,21,1,19,'INGRESO','ingresa 2 litebeam, 2 poes biquiti negros y 2 bridges tplink blancos.','2024-03-22 05:17:45.000000','2024-03-22 05:17:45.000000',21,4,NULL,NULL),(195,10,2,19,'INGRESO','ingresa 2 litebeam, 2 poes biquiti negros y 2 bridges tplink blancos.','2024-03-22 05:17:45.000000','2024-03-22 05:17:45.000000',21,4,NULL,NULL),(197,25,3,23,'INGRESO','Ingreso posm','2024-03-23 15:07:24.000000','2024-03-23 15:07:24.000000',25,4,NULL,2),(202,33,3,20,'INGRESO','aa','2024-03-23 00:00:00.000000','2024-03-23 00:00:00.000000',25,4,NULL,NULL),(203,33,2,20,'EGRESO','aa','2024-03-23 00:00:00.000000','2024-03-23 00:00:00.000000',25,4,NULL,NULL),(204,33,3,20,'INGRESO','aa','2024-03-23 00:00:00.000000','2024-03-23 00:00:00.000000',25,4,NULL,NULL),(205,25,7,35,'INGRESO','Ingreso posm','2024-03-24 15:42:42.000000','2024-03-24 15:42:42.000000',25,4,NULL,NULL),(206,25,7,35,'INGRESO','Ingreso posm','2024-03-24 16:09:16.000000','2024-03-24 16:09:16.000000',25,4,NULL,2),(207,25,7,35,'INGRESO','Ingreso posm','2024-03-24 16:18:21.000000','2024-03-24 16:18:21.000000',25,4,NULL,2),(208,25,7,35,'INGRESO','Ingreso posm','2024-03-24 16:19:29.000000','2024-03-24 16:19:29.000000',25,4,NULL,2),(209,25,4,23,'EGRESO','Egreso posm','2024-03-24 16:36:48.000000','2024-03-24 16:36:48.000000',25,5,NULL,NULL),(215,25,1,23,'EGRESO','Egreso posm','2024-03-24 16:44:12.000000','2024-03-24 16:44:12.000000',25,5,NULL,NULL),(216,25,7,35,'INGRESO','Ingreso posm','2024-03-24 16:45:37.000000','2024-03-24 16:45:37.000000',25,4,NULL,NULL),(217,35,1500,35,'INGRESO','base_dev completa','2024-03-24 17:17:19.000000','2024-03-24 17:17:19.000000',25,4,NULL,1),(218,11,12,35,'INGRESO','base_dev completa','2024-03-24 17:17:21.000000','2024-03-24 17:17:21.000000',25,4,NULL,1),(219,34,1500,35,'INGRESO','base_dev completa','2024-03-24 17:17:23.000000','2024-03-24 17:17:23.000000',25,4,NULL,1),(220,11,6,35,'INGRESO','asc','2024-03-24 17:50:44.000000','2024-03-24 17:50:44.000000',25,4,NULL,2),(221,35,300,35,'INGRESO','asc','2024-03-24 17:50:46.000000','2024-03-24 17:50:46.000000',25,4,NULL,2),(222,34,402,35,'INGRESO','asc','2024-03-24 17:50:49.000000','2024-03-24 17:50:49.000000',25,4,NULL,2),(223,11,1,35,'EGRESO','4115','2024-03-24 17:58:02.000000','2024-03-24 17:58:02.000000',25,5,NULL,NULL),(224,35,10,35,'EGRESO','4115','2024-03-24 17:58:04.000000','2024-03-24 17:58:04.000000',25,5,NULL,NULL),(225,34,20,35,'EGRESO','4115','2024-03-24 17:58:07.000000','2024-03-24 17:58:07.000000',25,5,NULL,NULL),(226,34,200,35,'EGRESO','4115','2024-03-24 17:58:09.000000','2024-03-24 17:58:09.000000',25,5,NULL,NULL),(227,11,1,35,'EGRESO','base_dev transferencia compuesta','2024-03-24 21:37:52.000000','2024-03-24 21:37:52.000000',25,7,NULL,NULL),(228,11,1,18,'INGRESO','base_dev transferencia compuesta','2024-03-24 21:37:55.000000','2024-03-24 21:37:55.000000',25,7,NULL,NULL),(229,35,122,35,'EGRESO','base_dev transferencia compuesta','2024-03-24 21:37:57.000000','2024-03-24 21:37:57.000000',25,7,NULL,NULL),(230,35,122,18,'INGRESO','base_dev transferencia compuesta','2024-03-24 21:37:59.000000','2024-03-24 21:37:59.000000',25,7,NULL,NULL),(231,34,202,35,'EGRESO','base_dev transferencia compuesta','2024-03-24 21:38:02.000000','2024-03-24 21:38:02.000000',25,7,NULL,NULL),(232,34,202,18,'INGRESO','base_dev transferencia compuesta','2024-03-24 21:38:04.000000','2024-03-24 21:38:04.000000',25,7,NULL,NULL),(234,11,1,18,'EGRESO','base_dev final','2024-03-24 23:59:44.000000','2024-03-24 23:59:44.000000',25,7,NULL,NULL),(235,11,1,35,'INGRESO','base_dev final','2024-03-24 23:59:46.000000','2024-03-24 23:59:46.000000',25,7,NULL,NULL),(236,35,100,18,'EGRESO','base_dev final','2024-03-24 23:59:49.000000','2024-03-24 23:59:49.000000',25,7,NULL,NULL),(237,35,100,35,'INGRESO','base_dev final','2024-03-24 23:59:51.000000','2024-03-24 23:59:51.000000',25,7,NULL,NULL),(238,34,202,18,'EGRESO','base_dev final','2024-03-24 23:59:54.000000','2024-03-24 23:59:54.000000',25,7,NULL,NULL),(239,34,202,35,'INGRESO','base_dev final','2024-03-24 23:59:56.000000','2024-03-24 23:59:56.000000',25,7,NULL,NULL),(240,13,50,35,'INGRESO','base_dev ingreso zc','2024-03-25 01:14:25.000000','2024-03-25 01:14:25.000000',25,4,NULL,1),(241,35,15000,35,'INGRESO','base_dev ingreso zc','2024-03-25 01:14:27.000000','2024-03-25 01:14:27.000000',25,4,NULL,1),(242,36,2000,35,'INGRESO','base_dev ingreso zc','2024-03-25 01:14:29.000000','2024-03-25 01:14:29.000000',25,4,NULL,1),(243,36,2000,35,'INGRESO','base_dev ingreso zc','2024-03-25 01:14:32.000000','2024-03-25 01:14:32.000000',25,4,NULL,1),(244,11,2,35,'EGRESO','base_dev egreso','2024-03-25 01:17:50.000000','2024-03-25 01:17:50.000000',25,5,NULL,NULL),(245,36,1500,35,'EGRESO','base_dev egreso','2024-03-25 01:17:52.000000','2024-03-25 01:17:52.000000',25,5,NULL,NULL),(246,36,700,35,'EGRESO','base_dev egreso','2024-03-25 01:17:55.000000','2024-03-25 01:17:55.000000',25,5,NULL,NULL),(247,36,500,35,'EGRESO','base_dev transferencia richard','2024-03-25 01:23:34.000000','2024-03-25 01:23:34.000000',25,7,NULL,NULL),(248,36,500,16,'INGRESO','base_dev transferencia richard','2024-03-25 01:23:36.000000','2024-03-25 01:23:36.000000',25,7,NULL,NULL),(249,10,12,38,'INGRESO','..15','2024-03-26 16:55:58.000000','2024-03-26 16:55:58.000000',27,7,NULL,NULL),(250,11,20,38,'INGRESO','..15','2024-03-26 16:56:00.000000','2024-03-26 16:56:00.000000',27,7,NULL,NULL),(251,25,12,38,'INGRESO','..15','2024-03-26 16:56:03.000000','2024-03-26 16:56:03.000000',27,7,NULL,NULL),(252,10,12,35,'INGRESO','Ejemplo','2024-03-26 17:43:59.000000','2024-03-26 17:43:59.000000',27,4,NULL,1),(253,35,1500,35,'INGRESO','Ejemplo','2024-03-26 17:44:01.000000','2024-03-26 17:44:01.000000',27,4,NULL,1),(254,15,2,35,'INGRESO','Ejemplo','2024-03-26 17:44:04.000000','2024-03-26 17:44:04.000000',27,4,NULL,1),(255,34,2000,35,'INGRESO','Ejemplo','2024-03-26 17:44:06.000000','2024-03-26 17:44:06.000000',27,4,NULL,1),(256,11,2,39,'INGRESO','acs','2024-03-29 02:08:29.000000','2024-03-29 02:08:29.000000',27,4,NULL,NULL),(257,11,2,39,'INGRESO','acs','2024-03-29 02:13:24.000000','2024-03-29 02:13:24.000000',27,4,NULL,NULL),(258,37,2000,39,'INGRESO','acs','2024-03-29 02:13:26.000000','2024-03-29 02:13:26.000000',27,4,NULL,NULL),(259,11,3,39,'INGRESO','acs','2024-03-29 02:14:19.000000','2024-03-29 02:14:19.000000',27,4,NULL,NULL),(260,37,2000,39,'INGRESO','acs','2024-03-29 02:14:22.000000','2024-03-29 02:14:22.000000',27,4,NULL,NULL),(261,37,2000,39,'INGRESO','acs','2024-03-29 02:14:24.000000','2024-03-29 02:14:24.000000',27,4,NULL,NULL),(262,25,7,35,'INGRESO','Ingreso posm','2024-03-29 03:06:29.000000','2024-03-29 03:06:29.000000',25,4,NULL,NULL),(263,25,1,23,'EGRESO','Egreso posm','2024-03-29 03:08:54.000000','2024-03-29 03:08:54.000000',25,5,NULL,NULL),(264,25,7,35,'INGRESO','Ingreso posm','2024-03-29 03:12:02.000000','2024-03-29 03:12:02.000000',25,4,NULL,NULL),(265,25,7,35,'INGRESO','Ingreso posm','2024-03-29 03:12:41.000000','2024-03-29 03:12:41.000000',25,4,NULL,NULL),(273,25,7,35,'INGRESO','Ingreso posm','2024-03-29 03:34:08.000000','2024-03-29 03:34:08.000000',25,4,NULL,NULL),(276,25,7,35,'INGRESO','Ingreso posm','2024-03-29 03:39:23.000000','2024-03-29 03:39:23.000000',25,4,NULL,NULL),(278,12,2,39,'INGRESO','acasca','2024-03-29 03:43:36.000000','2024-03-29 03:43:36.000000',27,4,NULL,NULL),(279,37,2000,39,'INGRESO','acasca','2024-03-29 03:43:38.000000','2024-03-29 03:43:38.000000',27,4,NULL,NULL),(280,37,1500,39,'INGRESO','acasca','2024-03-29 03:43:41.000000','2024-03-29 03:43:41.000000',27,4,NULL,NULL),(281,37,220,18,'INGRESO','ascas','2024-03-29 03:46:30.000000','2024-03-29 03:46:30.000000',27,4,NULL,NULL),(282,37,212,18,'INGRESO','ascas','2024-03-29 03:46:32.000000','2024-03-29 03:46:32.000000',27,4,NULL,NULL),(283,37,2,18,'EGRESO','asca','2024-03-29 03:48:12.000000','2024-03-29 03:48:12.000000',27,5,NULL,NULL),(284,37,4,18,'EGRESO','asca','2024-03-29 03:48:15.000000','2024-03-29 03:48:15.000000',27,5,NULL,NULL),(285,25,3,35,'INGRESO','Ingreso posm','2024-04-05 20:06:45.000000','2024-04-05 20:06:45.000000',25,4,36,NULL),(286,11,2,19,'INGRESO','ascas','2024-04-06 12:02:41.000000','2024-04-06 12:02:41.000000',27,4,65,NULL),(287,11,1,19,'EGRESO','asc','2024-04-06 12:05:19.000000','2024-04-06 12:05:19.000000',27,5,65,NULL);
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento_series`
--

DROP TABLE IF EXISTS `movimiento_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento_series` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `movimiento_id` int NOT NULL,
  `serie_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movimiento_series_movimiento_id_serie_id_b3912884_uniq` (`movimiento_id`,`serie_id`),
  KEY `movimiento_series_serie_id_0026d369_fk_series_id` (`serie_id`),
  CONSTRAINT `movimiento_series_movimiento_id_e4df1244_fk_movimiento_id` FOREIGN KEY (`movimiento_id`) REFERENCES `movimiento` (`id`),
  CONSTRAINT `movimiento_series_serie_id_0026d369_fk_series_id` FOREIGN KEY (`serie_id`) REFERENCES `series` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento_series`
--

LOCK TABLES `movimiento_series` WRITE;
/*!40000 ALTER TABLE `movimiento_series` DISABLE KEYS */;
INSERT INTO `movimiento_series` VALUES (81,91,1),(82,91,2),(83,92,7),(84,93,7),(85,94,7),(86,95,7),(87,102,7),(88,103,7),(89,104,7),(90,110,10),(91,110,11),(92,110,12),(93,110,13),(94,110,14),(95,114,15),(96,116,15),(97,117,16),(98,117,17),(99,118,18),(100,118,19),(101,120,16),(102,120,17),(103,121,18),(104,121,19),(105,125,20),(106,126,20),(107,130,21),(108,131,22),(109,133,22),(110,134,21),(113,141,23),(111,141,24),(112,141,25),(114,145,25),(115,149,25),(116,152,25),(117,181,26),(121,197,30),(122,197,31),(126,207,37),(127,209,37),(128,215,37),(129,216,37),(130,219,38),(131,222,39),(132,225,38),(133,226,39),(134,231,39),(135,232,39),(136,238,39),(137,239,39),(138,242,40),(139,243,41),(140,245,40),(141,246,41),(142,247,40),(143,248,40),(144,254,42),(145,254,43),(146,255,44),(147,258,45),(148,260,45),(149,261,46),(151,263,37),(152,264,54),(153,265,54),(154,273,54),(155,276,54),(156,279,55),(157,280,56),(158,281,57),(159,282,58),(160,283,57),(161,284,58);
/*!40000 ALTER TABLE `movimiento_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso`
--

DROP TABLE IF EXISTS `permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso`
--

LOCK TABLES `permiso` WRITE;
/*!40000 ALTER TABLE `permiso` DISABLE KEYS */;
INSERT INTO `permiso` VALUES (1,'CREAR PRODUCTO','2023-11-18 00:35:46.313832','2023-11-18 11:28:17.788833'),(2,'EDITAR PRODUCTO','2023-11-18 00:36:10.679343','2023-11-18 11:28:25.742571'),(3,'LEER PRODUCTO','2023-11-18 00:36:16.920134','2023-11-18 11:28:34.900379'),(4,'ELIMINAR PRODUCTO','2023-11-18 00:36:19.981363','2023-11-18 11:28:43.219063'),(7,'LEER BODEGA','2023-11-18 11:29:27.585633','2023-11-18 11:29:27.585633'),(8,'ELIMINAR BODEGA','2023-11-18 11:29:33.731738','2023-11-18 11:29:33.731738'),(9,'ELIMINAR PROVEEDOR','2023-11-18 11:29:38.574686','2023-11-18 11:29:38.574686'),(10,'LEER PROVEEDOR','2023-11-18 11:29:42.118701','2023-11-18 11:29:42.118701'),(11,'EDITAR PROVEEDOR','2023-11-18 11:29:45.734986','2023-11-18 11:29:45.734986'),(12,'CREAR PROVEEDOR','2023-11-18 11:29:48.716012','2023-11-18 11:29:48.716012'),(13,'CREAR USUARIO','2023-11-18 11:30:02.840381','2023-11-18 11:30:02.850413'),(14,'EDITAR USUARIO','2023-11-18 11:30:15.188532','2023-11-18 11:30:15.188532'),(15,'ELIMINAR USUARIO','2023-11-18 11:30:21.332495','2023-11-18 11:30:21.332495'),(16,'LEER USUARIO','2023-11-18 11:30:40.925697','2023-11-18 11:30:40.925697'),(20,'LEER PARAMETROS INVENTARIO','2023-11-18 11:33:02.730738','2023-11-18 11:33:02.730738'),(21,'CREAR PARAMETROS INVENTARIO','2023-11-18 11:33:06.015221','2023-11-18 11:33:06.015221'),(22,'EDITAR PARAMETROS INVENTARIO','2023-11-18 11:33:09.772989','2023-11-18 11:33:09.772989'),(23,'ELIMINAR PARAMETROS INVENTARIO','2023-11-18 11:33:30.027449','2023-11-18 11:33:30.027449'),(24,'NOTIFICACIONES STOCK MINIMO','2024-03-21 16:26:25.773285','2024-03-21 16:26:25.773285'),(25,'ADMIN','2024-03-21 16:28:17.069731','2024-03-21 16:28:17.069731'),(26,'LEER STOCK','2024-03-21 16:45:46.226655','2024-03-21 16:45:46.226655'),(27,'LEER STOCK TECNICO','2024-03-21 16:49:09.530003','2024-03-21 16:49:09.530003'),(28,'LEER STOCK CUADRILLA','2024-03-21 16:57:27.710469','2024-03-21 16:57:27.710469'),(29,'VER RUTAS ASIGNADAS','2024-03-21 16:57:32.425672','2024-03-21 16:57:32.425672'),(30,'LEER SERIES','2024-03-21 17:01:42.769653','2024-03-21 17:01:42.769653'),(31,'LEER MOVIMIENTOS','2024-03-21 17:01:51.640442','2024-03-21 17:01:51.640442'),(32,'LEER MOTIVOS MOVIMIENTOS','2024-03-21 17:01:56.559480','2024-03-21 17:01:56.559480'),(33,'CREAR BODEGA','2024-03-21 17:09:46.055208','2024-03-21 17:09:46.055208'),(34,'EDITAR BODEGA','2024-03-21 17:09:53.581947','2024-03-21 17:09:53.581947'),(35,'REALIZAR MOVIMIENTOS','2024-03-21 19:05:59.378760','2024-03-21 19:05:59.378760'),(36,'CREAR MOTIVOS MOVIMIENTOS','2024-03-21 19:13:08.233872','2024-03-21 19:13:08.233872'),(37,'EDITAR MOTIVOS MOVIMIENTOS','2024-03-21 19:13:14.089732','2024-03-21 19:13:14.089732'),(38,'ELIMINAR MOTIVOS MOVIMIENTOS','2024-03-21 19:13:20.179213','2024-03-21 19:13:20.179213'),(39,'LEER ROLES','2024-03-21 19:25:39.925545','2024-03-21 19:25:39.925545'),(40,'EDITAR ROLES','2024-03-21 19:25:47.116867','2024-03-21 19:25:47.116867'),(41,'CREAR ROLES','2024-03-21 19:25:53.880897','2024-03-21 19:25:53.880897'),(42,'ELIMINAR ROLES','2024-03-21 19:26:00.279006','2024-03-21 19:26:00.279006'),(43,'LEER RUTAS','2024-03-21 19:29:39.748898','2024-03-21 19:29:39.748898'),(44,'EDITAR RUTAS','2024-03-21 19:29:56.965225','2024-03-21 19:29:56.965225'),(45,'ELIMINAR RUTAS','2024-03-21 19:30:03.537783','2024-03-21 19:30:03.537783'),(46,'CREAR RUTAS','2024-03-21 19:30:12.539278','2024-03-21 19:30:12.539278'),(47,'CREAR ACTIVIDADES','2024-03-21 19:30:35.982783','2024-03-21 19:30:35.982783'),(48,'EDITAR ACTIVIDADES','2024-03-21 19:30:42.025633','2024-03-21 19:30:42.025633'),(49,'ELIMINAR ACTIVIDADES','2024-03-21 19:30:48.261048','2024-03-21 19:30:48.261048'),(50,'LEER ACTIVIDADES','2024-03-21 19:30:54.508920','2024-03-21 19:30:54.508920'),(51,'REAGENDAR ACTIVIDADES','2024-03-21 19:31:53.588425','2024-03-21 19:31:53.588425'),(52,'APROBAR SOLICITUDES','2024-03-21 19:39:34.768850','2024-03-21 19:39:34.768850'),(53,'LEER SOLICITUDES','2024-03-21 19:39:48.180972','2024-03-21 19:39:48.180972'),(54,'CREAR SOLICITUDES','2024-03-21 19:39:53.946063','2024-03-21 19:39:53.946063'),(56,'ELIMINAR SOLICITUDES','2024-03-21 19:40:06.812039','2024-03-21 19:40:06.812039'),(57,'LEER HOJAS','2024-03-21 19:47:05.025793','2024-03-21 19:47:05.025793'),(58,'LEER COMBUSTIBLE','2024-03-21 19:53:37.836790','2024-03-21 19:53:37.836790'),(59,'CREAR COMBUSTIBLE','2024-03-21 19:53:47.866691','2024-03-21 19:53:47.866691'),(60,'ELIMINAR COMBUSTIBLE','2024-03-21 19:54:01.657033','2024-03-21 19:54:01.657033'),(61,'ELIMINAR RECAUDACIONES','2024-03-21 19:54:10.167776','2024-03-21 19:54:10.167776'),(62,'LEER RECAUDACIONES','2024-03-21 19:54:17.330727','2024-03-21 19:54:17.330727'),(63,'CREAR RECAUDACIONES','2024-03-21 19:54:22.607629','2024-03-21 19:54:22.607629'),(64,'LEER CLIENTES','2024-03-21 19:55:17.764737','2024-03-21 19:55:17.764737'),(65,'CREAR CLIENTES','2024-03-21 19:55:22.715845','2024-03-21 19:55:22.715845'),(66,'INACTIVAR SERIES','2024-03-23 16:53:33.267998','2024-03-23 16:53:33.267998'),(67,'LEER METRICAS RUTAS','2024-03-23 21:31:33.732411','2024-03-23 21:31:33.732411');
/*!40000 ALTER TABLE `permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock_min` int unsigned NOT NULL,
  `tipo` varchar(35) NOT NULL,
  `usa_serie` tinyint(1) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `marca_id` int DEFAULT NULL,
  `modelo_id` int DEFAULT NULL,
  `unidad_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `tipo2` varchar(35) NOT NULL,
  `unidad_real` int DEFAULT NULL,
  `nombre_simple` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `producto_marca_id_2793ee53_fk_marca_id` (`marca_id`),
  KEY `producto_modelo_id_aa4ef980_fk_modelo_id` (`modelo_id`),
  KEY `producto_unidad_id_c269b12c_fk_unidad_id` (`unidad_id`),
  CONSTRAINT `producto_marca_id_2793ee53_fk_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id`),
  CONSTRAINT `producto_modelo_id_aa4ef980_fk_modelo_id` FOREIGN KEY (`modelo_id`) REFERENCES `modelo` (`id`),
  CONSTRAINT `producto_unidad_id_c269b12c_fk_unidad_id` FOREIGN KEY (`unidad_id`) REFERENCES `unidad` (`id`),
  CONSTRAINT `producto_chk_1` CHECK ((`stock_min` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (10,'BTP-L002','BRIDGE TPLINK XZ000-G7',5,'Material',127,'0000-00-00 00:00:00.000000',9,7,2024,'0000-00-00 00:00:00.000000','1',0,'BRIDGE TPLINK XZ000-G7'),(11,'Ro001','ROSETA',40,'Material',127,'0000-00-00 00:00:00.000000',12,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'ROSETA'),(12,'Drop-001','BOBINA FIBRA DROP 2000M',2,'Material',127,'0000-00-00 00:00:00.000000',12,4,2024,'0000-00-00 00:00:00.000000','1',0,'BOBINA FIBRA DROP 2000M'),(13,'APC','PUNTAS APC-APC',5,'Material',127,'0000-00-00 00:00:00.000000',12,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'PUNTAS APC-APC'),(14,'FISD','AMARRITAS',25,'Material',127,'0000-00-00 00:00:00.000000',NULL,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'AMARRITAS'),(15,'FRICHI','ONU EG8145V5',5,'Material',127,'0000-00-00 00:00:00.000000',3,7,2024,'0000-00-00 00:00:00.000000','1',1,'ONU EG8145V5'),(16,'UTP','BOBINA DE UTP',2,'Material',127,'0000-00-00 00:00:00.000000',15,4,2024,'0000-00-00 00:00:00.000000','1',NULL,'BOBINA DE UTP'),(17,'LITE 2DAGEN','LITEBEAM 2DA GENERACION',5,'Material',127,'0000-00-00 00:00:00.000000',16,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'LITEBEAM 2DA GENERACION'),(18,'NANOAC','NANO LOCO AC',3,'Material',127,'0000-00-00 00:00:00.000000',17,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'NANO LOCO AC'),(19,'NANOM5','NANALOCO M5',3,'Material',127,'0000-00-00 00:00:00.000000',18,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'NANALOCO M5'),(20,'POE UBIQUITI','POE UBIQUITI BLANCO',5,'Material',127,'0000-00-00 00:00:00.000000',19,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'POE UBIQUITI BLANCO'),(21,'POENEGRO','POE UBIQUITI NEGRO',5,'Material',127,'0000-00-00 00:00:00.000000',20,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'POE UBIQUITI NEGRO'),(22,'CINT-3M','CINTA AISLANTE',5,'Material',127,'0000-00-00 00:00:00.000000',12,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'CINTA AISLANTE'),(23,'SPLITTER-FUS-ARP','SPLITTER DE FUSION 1 X 8',5,'Material',127,'0000-00-00 00:00:00.000000',12,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'SPLITTER DE FUSION 1 X 8'),(24,'PATCH-UPC UPC','PUNTAS UPC-UPC',5,'Material',127,'0000-00-00 00:00:00.000000',23,7,2024,'0000-00-00 00:00:00.000000','1',NULL,'PUNTAS UPC-UPC'),(25,'APC-UPC','PUNTAS APC-UPC',5,'Material',127,'0000-00-00 00:00:00.000000',NULL,NULL,2024,'0000-00-00 00:00:00.000000','1',NULL,'PUNTAS APC-UPC'),(32,'asca','producto compuesto 2km Huawei',300,'Material',127,'0000-00-00 00:00:00.000000',NULL,4,2024,'0000-00-00 00:00:00.000000','2000',1,'producto compuesto 2km'),(33,'acasc','asc 100m',22,'Material',127,'0000-00-00 00:00:00.000000',NULL,4,2024,'0000-00-00 00:00:00.000000','100',0,'asc 100m'),(34,'aaa','aaa base_dev compuesto  2km',300,'Material',127,'0000-00-00 00:00:00.000000',NULL,4,2024,'0000-00-00 00:00:00.000000','2000',1,'aaa base_dev compuesto  2km'),(35,'bbb','bbb base_dev compuesto  1km UTP GENERICO',500,'Material',127,'0000-00-00 00:00:00.000000',15,4,2024,'0000-00-00 00:00:00.000000','1000',0,'bbb base_dev compuesto  1km'),(36,'1132','rollo 2km HG8546M',200,'Material',127,'0000-00-00 00:00:00.000000',7,4,2024,'0000-00-00 00:00:00.000000','2000',1,'rollo 2km'),(37,'bbbbbbb','bbbbbbbbb Huawei',300,'Herramienta',127,'0000-00-00 00:00:00.000000',NULL,4,2024,'0000-00-00 00:00:00.000000','2000',1,'bbbbbbbbb');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `garantia` varchar(100) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'XC234','ZC MAYORISTA','NEXUS 1','no lo se','2023-11-18 01:21:57.889412','2023-11-18 01:21:57.889412'),(2,'DFC123','Hentel','Fco orellana','SI','2024-02-22 17:35:20.001043','2024-02-22 17:35:20.001038'),(3,'Ejemplo','Ejemplo 332','Guayas Guayaquil','NO','2024-03-26 17:25:26.199964','2024-03-26 17:25:26.199964');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcion`
--

DROP TABLE IF EXISTS `recepcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recepcion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `foto_plata` longtext NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `monto` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `id_tecnico_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recepcion_id_tecnico_id_41654196_fk_usuario_id` (`id_tecnico_id`),
  CONSTRAINT `recepcion_id_tecnico_id_41654196_fk_usuario_id` FOREIGN KEY (`id_tecnico_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcion`
--

LOCK TABLES `recepcion` WRITE;
/*!40000 ALTER TABLE `recepcion` DISABLE KEYS */;
INSERT INTO `recepcion` VALUES (11,'https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/21%2FFoto%20Recepci%C3%B3n%3A%20%2015-03-2024%2014%3A36%3A02%20%20WhatsApp%20Image%202024-01-14%20at%2012.47.04%20PM.jpeg?alt=media&token=9bc9801d-8e9f-4776-9a57-6efa04ca0074','se recauda 15',15,'2024-03-15 19:36:05.888482','2024-03-15 19:36:05.888487',21),(12,'https://firebasestorage.googleapis.com/v0/b/terranet-92509.appspot.com/o/21%2FFoto%20Recepci%C3%B3n%3A%20%2020-03-2024%2015%3A45%3A25%20%20WhatsApp%20Image%202024-03-16%20at%207.09.07%20PM.jpeg?alt=media&token=2f376d0a-24a7-4dfc-aac9-e0c44df82c73','EL DIA DE HOY SE RECIBIÓ $55, QUEDANDO DEBIENDO EL TÉCNICO PETER $10, AL PARECER SE LLEVO SIN PERMISO Y NO CONSULTÓ.$40 DE UNA INSTALACION Y $25 DE OTRA INSTALACION.',55,'2024-03-20 20:45:28.492378','2024-03-20 20:45:28.492382',21);
/*!40000 ALTER TABLE `recepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rol` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (3,'Producto','2023-11-18 12:05:34.853953','2023-11-18 12:00:32.769244'),(5,'Ejemplo','2023-12-06 00:19:12.987394','2023-11-19 02:10:47.791189'),(7,'ADMIN','2024-02-22 17:39:48.051231','2024-02-22 17:39:48.051227'),(8,'TECNICO','2024-02-22 17:40:04.038548','2024-02-22 17:40:04.038544'),(9,'SERVICIO AL CLIENTE','2024-03-10 17:16:03.623249','2024-03-10 17:16:03.623245'),(10,'base_dev','2024-03-25 01:26:49.670963','2024-03-25 01:26:49.670963');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permisos`
--

DROP TABLE IF EXISTS `rol_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_permisos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rol_id` int NOT NULL,
  `permiso_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rol_permisos_rol_id_permiso_id_c961e5e5_uniq` (`rol_id`,`permiso_id`),
  KEY `rol_permisos_permiso_id_7c5dddc4_fk_permiso_id` (`permiso_id`),
  CONSTRAINT `rol_permisos_permiso_id_7c5dddc4_fk_permiso_id` FOREIGN KEY (`permiso_id`) REFERENCES `permiso` (`id`),
  CONSTRAINT `rol_permisos_rol_id_0648740b_fk_rol_id` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permisos`
--

LOCK TABLES `rol_permisos` WRITE;
/*!40000 ALTER TABLE `rol_permisos` DISABLE KEYS */;
INSERT INTO `rol_permisos` VALUES (7,3,1),(8,3,2),(9,3,3),(10,3,4),(12,5,3),(13,5,8),(14,5,12),(15,5,16),(54,7,3),(53,7,25),(50,8,3),(36,8,7),(52,8,16),(51,8,20),(37,9,1),(38,9,3),(41,9,7),(42,9,10),(43,9,12),(44,9,13),(45,9,16),(46,9,21),(55,10,1),(56,10,2),(57,10,3);
/*!40000 ALTER TABLE `rol_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruta`
--

DROP TABLE IF EXISTS `ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cuadrilla_id` int DEFAULT NULL,
  `tiempo_fin` datetime(6) DEFAULT NULL,
  `tiempo_inicio` datetime(6) DEFAULT NULL,
  `estado` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ruta_cuadrilla_id_3c15c564_fk_bodega_id` (`cuadrilla_id`),
  CONSTRAINT `ruta_cuadrilla_id_3c15c564_fk_bodega_id` FOREIGN KEY (`cuadrilla_id`) REFERENCES `bodega` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruta`
--

LOCK TABLES `ruta` WRITE;
/*!40000 ALTER TABLE `ruta` DISABLE KEYS */;
INSERT INTO `ruta` VALUES (40,'2024-03-20 20:25:31.709566','2024-03-20 20:25:31.709569',19,'2024-03-24 22:00:00.000000','2024-03-20 20:52:00.000000','TERMINADO'),(41,'2024-03-28 02:33:15.238294','2024-03-28 02:33:15.238294',19,NULL,'2024-03-28 02:36:00.000000','EN CURSO'),(42,'2024-04-06 12:01:29.020706','2024-04-06 12:01:29.020706',17,NULL,NULL,'PENDIENTE');
/*!40000 ALTER TABLE `ruta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serie` varchar(60) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bodega_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `estado` varchar(35) NOT NULL,
  `proveedor_id` int DEFAULT NULL,
  `tipo` varchar(35) NOT NULL,
  `stock` int unsigned DEFAULT NULL,
  `garantia` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series_serie_713e5218_uniq` (`serie`),
  KEY `series_bodega_id_fa36b16a_fk_bodega_id` (`bodega_id`),
  KEY `series_producto_id_7064c64e_fk_producto_id` (`producto_id`),
  KEY `series_proveedor_id_7923efd8_fk_proveedor_id` (`proveedor_id`),
  CONSTRAINT `series_bodega_id_fa36b16a_fk_bodega_id` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  CONSTRAINT `series_producto_id_7064c64e_fk_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `series_proveedor_id_7923efd8_fk_proveedor_id` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`),
  CONSTRAINT `series_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,'LE5G12345','2023-11-18 01:23:54.419065',NULL,NULL,'2023-11-18 01:23:54.419065','ACTIVO',NULL,'SIMPLE',1,'NO'),(2,'LE5G12346','2023-11-18 01:37:35.643923',NULL,NULL,'2023-11-18 01:35:28.467937','ACTIVO',NULL,'SIMPLE',1,'NO'),(3,'123434','2024-01-11 02:05:53.530065',NULL,NULL,'2023-12-13 21:41:27.359941','ACTIVO',NULL,'SIMPLE',1,'NO'),(4,'aqw345','2024-01-11 02:05:53.534067',NULL,NULL,'2023-12-15 16:02:48.648589','ACTIVO',NULL,'SIMPLE',1,'NO'),(5,'ju87654','2023-12-16 22:33:09.095113',NULL,NULL,'2023-12-15 16:02:48.655590','ACTIVO',NULL,'SIMPLE',1,'NO'),(6,'fghju765','2023-12-16 22:33:09.100128',NULL,NULL,'2023-12-15 16:02:48.658589','ACTIVO',NULL,'SIMPLE',1,'NO'),(7,'LE5G12347','2023-12-15 17:01:54.121072',NULL,NULL,'2023-12-15 17:01:54.121072','ACTIVO',NULL,'SIMPLE',1,'NO'),(8,'LE5G12348','2023-12-16 03:36:48.312145',NULL,NULL,'2023-12-16 03:36:48.312145','ACTIVO',NULL,'SIMPLE',1,'NO'),(9,'111111','2024-01-11 02:05:53.537069',NULL,NULL,'2023-12-16 09:02:30.315296','ACTIVO',NULL,'SIMPLE',1,'NO'),(10,'213123','2024-03-12 20:52:00.617694',20,NULL,'2024-03-12 20:52:00.617684','ACTIVO',NULL,'SIMPLE',1,'NO'),(11,'123123213','2024-03-12 20:52:00.646189',20,NULL,'2024-03-12 20:52:00.646179','ACTIVO',NULL,'SIMPLE',1,'NO'),(12,'123213','2024-03-12 20:52:00.666253',20,NULL,'2024-03-12 20:52:00.666244','ACTIVO',NULL,'SIMPLE',1,'NO'),(13,'2132321','2024-03-12 20:52:00.686836',20,NULL,'2024-03-12 20:52:00.686825','ACTIVO',NULL,'SIMPLE',1,'NO'),(14,'HTC123123','2024-03-12 20:52:00.709052',20,NULL,'2024-03-12 20:52:00.709043','ACTIVO',NULL,'SIMPLE',1,'NO'),(15,'dsc316s1dvv','2024-03-13 19:02:06.582655',NULL,NULL,'2024-03-13 19:02:06.582647','ACTIVO',NULL,'SIMPLE',1,'NO'),(16,'vfdb1fd5b135dfb5','2024-03-13 19:11:12.146567',NULL,NULL,'2024-03-13 19:11:12.146563','ACTIVO',NULL,'SIMPLE',1,'NO'),(17,'dfbfdbd5454','2024-03-13 19:11:12.162739',NULL,NULL,'2024-03-13 19:11:12.162734','ACTIVO',NULL,'SIMPLE',1,'NO'),(18,'fvdvbdfbdfb','2024-03-13 19:11:12.354686',NULL,NULL,'2024-03-13 19:11:12.354680','ACTIVO',NULL,'SIMPLE',1,'NO'),(19,'bfdbthbdrhe','2024-03-13 19:11:12.367486',NULL,NULL,'2024-03-13 19:11:12.367480','ACTIVO',NULL,'SIMPLE',1,'NO'),(20,'ascacacascwqcc','2024-03-18 19:38:37.075111',NULL,NULL,'2024-03-18 19:38:37.075107','ACTIVO',NULL,'SIMPLE',1,'NO'),(21,'Hehekdjeb','2024-03-18 20:09:53.705928',NULL,NULL,'2024-03-18 20:09:53.705923','ACTIVO',NULL,'SIMPLE',1,'NO'),(22,'Wnquwh','2024-03-18 20:09:53.812197',NULL,10,'2024-03-18 20:09:53.812192','ACTIVO',NULL,'SIMPLE',1,'NO'),(23,'HWTC52AC1288','2024-03-19 20:14:20.631067',23,NULL,'2024-03-19 20:14:20.631063','ACTIVO',NULL,'SIMPLE',1,'NO'),(24,'HWTCC17CD09C	','2024-03-19 20:14:20.639745',19,NULL,'2024-03-19 20:14:20.639742','ACTIVO',NULL,'SIMPLE',1,'NO'),(25,'HWTC526A8988','2024-03-19 20:14:20.645535',NULL,NULL,'2024-03-19 20:14:20.645532','ACTIVO',NULL,'SIMPLE',1,'NO'),(26,'HWTC2F82F79A','2024-03-20 21:07:36.452169',19,15,'2024-03-20 21:07:36.452166','ACTIVO',NULL,'SIMPLE',1,'NO'),(30,'787878','2024-03-23 15:07:24.106016',23,25,'2024-03-23 15:07:24.106016','INACTIVO',2,'SIMPLE',1,'NO'),(31,'74444','2024-03-23 15:07:24.114018',23,25,'2024-03-23 15:07:24.114018','INACTIVO',2,'SIMPLE',1,'NO'),(32,'LE5G123482','2024-03-23 16:45:40.015168',20,25,'2024-03-23 16:45:40.015168','INACTIVO',NULL,'COMPUESTO',1,'NO'),(37,'1818181','2024-03-24 16:18:21.213037',35,25,'2024-03-24 16:18:21.213037','ACTIVO',2,'COMPUESTO',8,'SI'),(38,'1212122','2024-03-24 17:17:23.480566',35,34,'2024-03-24 17:17:23.480566','ACTIVO',1,'COMPUESTO',1480,'SI'),(39,'123131','2024-03-24 17:50:48.601286',35,34,'2024-03-24 17:50:48.601286','ACTIVO',2,'COMPUESTO',202,'NO'),(40,'a111','2024-03-25 01:14:29.380110',16,36,'2024-03-25 01:14:29.380110','INACTIVO',1,'COMPUESTO',500,'SI'),(41,'a112','2024-03-25 01:14:31.704883',35,36,'2024-03-25 01:14:31.704883','ACTIVO',1,'COMPUESTO',1300,'NO'),(42,'22aca','2024-03-26 17:44:03.781723',35,15,'2024-03-26 17:44:03.781723','ACTIVO',1,'SIMPLE',1,'NO'),(43,'2cacve','2024-03-26 17:44:03.791724',35,15,'2024-03-26 17:44:03.791724','ACTIVO',1,'SIMPLE',1,'NO'),(44,'211222','2024-03-26 17:44:06.399886',35,34,'2024-03-26 17:44:06.399886','ACTIVO',1,'COMPUESTO',2000,'NO'),(45,'aaaaab1','2024-03-29 02:08:31.690961',39,37,'2024-03-29 02:08:31.690961','ACTIVO',NULL,'SIMPLE',4001,'NO'),(46,'aaaaab2','2024-03-29 02:13:28.575926',39,37,'2024-03-29 02:13:28.575926','ACTIVO',NULL,'SIMPLE',2001,'NO'),(47,'aaaaab3','2024-03-29 02:20:43.247582',NULL,34,'2024-03-29 02:20:43.247582','ACTIVO',NULL,'SIMPLE',1,'NO'),(54,'1919191919','2024-03-29 03:12:01.498198',35,25,'2024-03-29 03:12:01.498198','ACTIVO',NULL,'COMPUESTO',10,'SI'),(55,'acaca1','2024-03-29 03:43:38.271852',39,37,'2024-03-29 03:43:38.271852','ACTIVO',NULL,'COMPUESTO',2000,'NO'),(56,'proveedor','2024-03-29 03:43:40.592934',39,37,'2024-03-29 03:43:40.592934','ACTIVO',NULL,'COMPUESTO',1500,'NO'),(57,'111111111','2024-03-29 03:46:30.104565',18,37,'2024-03-29 03:46:30.104565','ACTIVO',NULL,'COMPUESTO',218,'NO'),(58,'1111111112','2024-03-29 03:46:32.419386',18,37,'2024-03-29 03:46:32.419386','ACTIVO',NULL,'COMPUESTO',208,'NO');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idcliente` varchar(20) NOT NULL,
  `descripcion` longtext,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `usuario_agendo_id` int DEFAULT NULL,
  `usuario_revision_id` int DEFAULT NULL,
  `usuario_solicitud_id` int DEFAULT NULL,
  `estado` varchar(220) DEFAULT NULL,
  `fecha_agenda` datetime(6) DEFAULT NULL,
  `cedula` varchar(20) NOT NULL,
  `celular` varchar(50) NOT NULL,
  `correo_electronico` varchar(254) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `direccion_anterior` varchar(255) NOT NULL,
  `foto_casa` longtext NOT NULL,
  `horarios_disponibles` varchar(256) NOT NULL,
  `latitud` varchar(50) NOT NULL,
  `latitud_anterior` varchar(20) NOT NULL,
  `latitud_nueva` varchar(20) NOT NULL,
  `longitud` varchar(50) NOT NULL,
  `longitud_anterior` varchar(20) NOT NULL,
  `longitud_nueva` varchar(20) NOT NULL,
  `nombres_cliente` varchar(255) NOT NULL,
  `observacion_diagnostico` longtext NOT NULL DEFAULT (_utf8mb3''),
  `plan_contratar` varchar(100) NOT NULL,
  `senal_potencia` varchar(50) NOT NULL,
  `tecnologia` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `tipo` varchar(60) NOT NULL,
  `gestion_operador` longtext NOT NULL DEFAULT (_utf8mb3''),
  `observacion` longtext NOT NULL DEFAULT (_utf8mb3''),
  `casa_npisos` varchar(120) NOT NULL,
  `cliente_tiene_equipo` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `solicitud_usuario_agendo_id_5b248ad2_fk_usuario_id` (`usuario_agendo_id`),
  KEY `solicitud_usuario_revision_id_a19477bc_fk_usuario_id` (`usuario_revision_id`),
  KEY `solicitud_usuario_solicitud_id_ceb81181_fk_usuario_id` (`usuario_solicitud_id`),
  CONSTRAINT `solicitud_usuario_agendo_id_5b248ad2_fk_usuario_id` FOREIGN KEY (`usuario_agendo_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `solicitud_usuario_revision_id_a19477bc_fk_usuario_id` FOREIGN KEY (`usuario_revision_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `solicitud_usuario_solicitud_id_ceb81181_fk_usuario_id` FOREIGN KEY (`usuario_solicitud_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (26,'4869','no esta el numero correcto','2024-01-30 14:56:20.615731','2024-01-30 14:56:20.615731',NULL,NULL,NULL,'RECHAZADO',NULL,'0932572076','213124124','','SALITRE / REF: LOCAL\r\nINST $0 PLAN $20','','','','-1.8340315136496688','','','-79.81371868023588','','','STEVEN MICHAEL MONCADA GARCIA','casccascasca','','ascasc','ascasc','0967669463','VISITA TECNICA','scascas','','',''),(43,'3978','APROBADO','2024-03-19 19:47:40.645202','2024-03-19 19:47:40.645208',27,19,21,'TERMINADO',NULL,'0941737207','+5985582220','','CASUARINA FRENTE A MERCADO \r\nINST $0 PLAN $30','','','','-2.122532','','','-79.957137','','','STIVEN ALEXANDER VILLA DELGADO','CLIENTE RECIEN PAGÓ EL DIA DE HOY Y ESTA EN CORTE HACE 16 HORAS, ESPERA SOLUCION ELDIA DE HOY.','','en corte','FIBRA','0985582220,0999431567','VISITA TECNICA','VERIFICACION DE PATCH Y DE CONEXIONES','','',''),(44,'3351','APROBADO','2024-03-19 19:50:05.652087','2024-03-19 19:50:05.652093',27,19,21,'APROBADO',NULL,'0923927529','+5991940103','','MONTEBELLO Cambio de domicilio desde el 24 nov 2021: \r\nCIUDAD DE DIOS\r\nINST $10 PLAN $25','','','','-2.079648','','','-80.003463','','','NECCY MAGALY RONQUILLO HOLGUIN','CLIENTE NOS VA AYUDAR LLEVANDO LOS EQUIPOS A MONTEBELLO PARA EL RESPECTIVO RETIRO ANTES DE LAS 09:00 AM','','','','0991940103','RETIRO','VERIFICACION DE DISPONIBILIDAD.','','',''),(47,'3996','APROBADO','2024-03-20 18:38:26.361097','2024-03-20 18:38:26.361100',27,19,21,'APROBADO',NULL,'0931020614','+59989805831','','BASTION POPULAR BQ 1\r\nINST $0 PLAN $30','','','','-2.105567','','','-79.933842','','','DANIEL ANDRES HOLGUIN FLORES','EN EL TRASCURSO DEL DIA.LLAMR ANTES DE DIRIGIRSE AL DOMICILIO','','','','0989805831','RETIRO','COORDINACION DE RETIRO','','',''),(48,'2469','APROBADO','2024-03-20 18:41:21.891833','2024-03-20 18:41:21.891838',NULL,19,21,'APROBADO',NULL,'0921573242','+59958716264','','Nuevo domicilio desde el 20 Ago 2021: \r\nVILLA ESPAÑA ETAPA VALENCIA  MZ. 2251 VILLA 1\r\n\r\nVILLA ESPAÑA ETAPA VALENCIA  MZ. 2113 SOLAR 13\r\nINST $50 PLAN $30\r\n\r\nRef: Compro Router en $25 el 12 Enero 2022','','','','-2.082871','','','-79.921244','','','ELIZABETH ENCARNACION CASTILLO BAQUE','Se le indica que en el transcurso del dia y nos inidca que maximo 14:30 o 15:00 hasta esa hora estará','','-32 dBm / -35 dBm','Fibra','0958716264','VISITA TECNICA','Cliente aparece en power fails hace 1 hora, se valida que tenga los equipos conectados, se verifica que \ntodo está encendido, pero sigue en power fail. único cliente de esa VLAN.Se verifica Patch en la parte de atrás, pero la cliente no nos ayuda mucho, no nos contesta las llamadas.','','',''),(49,'4877','APROBADO','2024-03-20 19:10:11.192160','2024-03-20 19:10:11.192162',NULL,19,21,'APROBADO',NULL,'0956761027','+59994772172','','COOP 5 DE DICIEMBRE\r\nINST $0 PLAN $25','','','','-2.0698156597689246','','','-79.94646167055356','','','ELIZABETH VIVIANA TARCO GAVILANES','DIFERENTES CAJAS','','','','0994772172','OTRO','GESTION DE CLIENTES CON POTENCIA ELEVADA: \nCAJA 7 / VLAN 555\n * TARCO GAVILANES ELIZABETH VIVIANA  -29.58 dBm / -30.97 dBm (7053m)- sábado 13pm\n Observación: cliente nuevo, lleva un mes con el servicio y ese mes ha tenido problemas de lentitud e intermitencia\n Coordenadas de referencia: -2.0698156597689246, -79.94646167055356        \n* ROMERO ALVARADO EUGENIA JAMILETH -27.96 dBm / -30.97 dBm (7210m)\n * MORA CAMPUZANO JOSE AMADO -29.58 dBm / -30.97 dBm (7105m)\n CAJA 8 /VLAN 555\n * CASTRO OCAMPO JEFFERSON ROLANDO -27.21 dBm / -30.46 dBm (7508m)\n CAJA 5 / VLAN 555\n * FRIAS LEON DAVID STALYN -29.21 dBm / -30.97 dBm (6962m)\n * ALCIVAR CEVALLOS GLENDA JACINTA -26.99 dBm / -29.59 dBm (6833m)\n CAJA 3 / VLAN 555\n * MORA SEGURA HIPOLITO RAUL -28.86 dBm / -30.46 dBm (6588m)','','',''),(50,'2662','APROBADO','2024-03-20 19:15:28.352473','2024-03-20 19:15:28.352476',NULL,19,21,'APROBADO',NULL,'1719856484','+5996186945','','URB. CIUDAD SANTIAGO ETAPA. CITY MZ. 6301 VILLA 36\r\nINST $50 PLAN $30','','','','-2.021687','','','-79.940796','','','JONATHAN ANDRES SILVA VALVERDE','VERIFICACION DE PAGOS','','','','0996186945','RETIRO','CLIENTE INDICA QUE DESDE QUE DEJO DE USAR EL SERVICIO, REPORTO, SOLICITO EL RETIRO Y LOS TECNICOS NO LLEGARON','','',''),(51,'3351','APROBADO','2024-03-20 19:29:44.942730','2024-03-20 19:29:44.942734',NULL,19,21,'APROBADO',NULL,'0923927529','+59991940103','','MONTEBELLO Cambio de domicilio desde el 24 nov 2021: \r\nCIUDAD DE DIOS\r\nINST $10 PLAN $25','','','','-2.079648','','','-80.003463','','','NECCY MAGALY RONQUILLO HOLGUIN','solo es equipos internos del otro plan que tenía en montebello','','','','0991940103','RETIRO','Cliente indica que llega siempre a su domicilio a las 10:00 am entonces nos indica que para mañana va \na llevar los equipos a Montebello para entregarle a los técnicos, ella se encuentra desde las 3:00 am hasta las 9:00: indica que \nla espera en su puesto de trabajo.','','',''),(52,'2818','POR REVISAR','2024-03-21 18:18:19.263151','2024-03-21 18:18:19.263156',NULL,NULL,21,'PENDIENTE',NULL,'107158800','+5963756838','','MONTEBELLO MZ. 16 SOLAR 57\r\nINST $50 PLAN $30\r\n\r\nRef: Anderson Efrain Duran','','','A PARTIR DE LA 13:30 PM','-2.088087','','','-79.941330','','','CELESTE KATHERINE CHACON ROA','NOS OCNTESTA SU ESPOSO INDICANDO QUE LLEGAN AL DOMICILIO A PARTIR DE MEDIO DIA POR ESO SE AGENDA  PARA EL MEDIO DIA.','','','','0958812787,979377978','MIGRACION','','','',''),(53,'4435','POR REVISAR','2024-03-21 18:20:54.830054','2024-03-21 18:20:54.830057',NULL,NULL,21,'PENDIENTE',NULL,'1307158095','+5997359708','','CIUDAD DE DIOS\r\nINST $0 PLAN $25','','','','-2.078336','','','-80.001089','','','LUCY JAQUELINE FAJARDO MORA','cliente tiene problemas con le equipos, se le desconecta automáticamente, se verifica y se encuentra el UPNP desactivado, se activa pero sigue con problemas de conectividad. Adicional acceso lento.','','-20.27 dBm / -28.87 dBm (','fibra','0997359708','VISITA TECNICA','verificación de conexión, parámetros y conexión en sus móviles.','','',''),(54,'035','SOLICITUD PARA EL CLIENTE base_dev 3','2023-12-17 02:05:52.790552','2023-12-17 02:05:52.793554',NULL,NULL,27,'Estado de base_dev','2023-12-26 21:00:00.000000','','','','','','','','','','','','','','','','','','','','MIGRACION','','','',''),(55,'',NULL,'2024-04-04 19:45:44.616915','2024-04-04 19:45:44.616915',NULL,NULL,NULL,NULL,NULL,'','','','','','','','','','','','','','','','','','','','MIGRACION','','','',''),(56,'','APROBADO','2024-04-04 20:23:14.132070','2024-04-04 20:23:14.132070',NULL,27,27,'APROBADO',NULL,'2222222222222','asc','','a','','','ascas','asc','','','asc','','','a','','asc','','','asc','INSTALACION','','','as','');
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `bodega_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_bodega_id_8687b127_fk_bodega_id` (`bodega_id`),
  KEY `stock_producto_id_f049591d_fk_producto_id` (`producto_id`),
  CONSTRAINT `stock_bodega_id_8687b127_fk_bodega_id` FOREIGN KEY (`bodega_id`) REFERENCES `bodega` (`id`),
  CONSTRAINT `stock_producto_id_f049591d_fk_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `stock_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,5,'2023-12-06 01:23:43.536517',NULL,NULL,'2023-11-18 16:15:53.360329'),(2,143,'2023-11-19 02:18:35.482188',NULL,NULL,'2023-11-18 21:58:48.809318'),(3,301,'2023-11-19 02:18:35.794270',NULL,NULL,'2023-11-18 22:04:38.806344'),(4,4,'2023-12-05 19:46:25.181822',NULL,NULL,'2023-12-05 19:46:25.180828'),(5,9,'2024-01-11 02:05:53.552259',NULL,NULL,'2023-12-05 19:47:28.760609'),(6,0,'2024-01-31 01:52:39.657902',NULL,NULL,'2024-01-31 01:52:39.657902'),(7,1,'2024-02-22 17:38:16.537539',18,NULL,'2024-02-22 17:38:16.537536'),(8,6,'2024-02-22 18:03:22.516477',20,NULL,'2024-02-22 18:03:22.516473'),(9,1,'2024-03-09 18:48:22.748576',NULL,NULL,'2024-03-09 18:48:22.748576'),(10,0,'2024-03-09 21:31:08.366895',NULL,NULL,'2024-03-09 21:31:08.366895'),(11,0,'2024-03-10 16:07:01.832044',NULL,NULL,'2024-03-10 16:07:01.832039'),(12,2,'2024-03-10 16:08:03.409605',NULL,NULL,'2024-03-10 16:08:03.409600'),(13,25,'2024-03-12 14:26:56.958807',NULL,NULL,'2024-03-12 14:26:56.958807'),(14,5,'2024-03-12 20:52:00.740679',20,NULL,'2024-03-12 20:52:00.740668'),(15,0,'2024-03-12 20:53:21.572573',17,NULL,'2024-03-12 20:53:21.572568'),(16,0,'2024-03-13 19:02:06.600514',17,NULL,'2024-03-13 19:02:06.600508'),(17,0,'2024-03-13 19:11:12.385255',17,NULL,'2024-03-13 19:11:12.385249'),(18,40,'2024-03-15 20:25:40.436426',NULL,11,'2024-03-15 20:25:40.436421'),(19,33,'2024-03-15 20:29:01.653814',20,11,'2024-03-15 20:29:01.653810'),(20,2009,'2024-03-15 20:37:08.268730',20,12,'2024-03-15 20:37:08.268726'),(21,0,'2024-03-18 20:09:53.635332',17,11,'2024-03-18 20:09:53.635329'),(22,0,'2024-03-18 20:09:53.825919',17,10,'2024-03-18 20:09:53.825915'),(23,5,'2024-03-18 21:03:22.747656',NULL,NULL,'2024-03-18 21:03:22.747622'),(24,5,'2024-03-18 21:03:22.981010',NULL,11,'2024-03-18 21:03:22.980994'),(25,9,'2024-03-19 20:07:41.305130',20,13,'2024-03-19 20:07:41.305126'),(26,89,'2024-03-19 20:07:41.404033',20,14,'2024-03-19 20:07:41.404028'),(27,2,'2024-03-19 20:14:20.659426',20,NULL,'2024-03-19 20:14:20.659423'),(28,13,'2024-03-19 20:44:27.602524',19,14,'2024-03-19 20:44:27.602519'),(29,5,'2024-03-19 20:44:27.707070',19,11,'2024-03-19 20:44:27.707065'),(30,0,'2024-03-19 20:44:27.860948',19,13,'2024-03-19 20:44:27.860944'),(31,0,'2024-03-19 20:44:27.917582',19,NULL,'2024-03-19 20:44:27.917578'),(32,5,'2024-03-20 19:56:35.746855',20,16,'2024-03-20 19:56:35.746852'),(33,3,'2024-03-20 20:10:15.281562',20,19,'2024-03-20 20:10:15.281559'),(34,3,'2024-03-20 20:10:15.405313',20,18,'2024-03-20 20:10:15.405309'),(35,6,'2024-03-20 20:32:14.508575',20,20,'2024-03-20 20:32:14.508572'),(36,8,'2024-03-20 20:35:41.090639',20,21,'2024-03-20 20:35:41.090636'),(37,10,'2024-03-20 20:50:44.189682',20,17,'2024-03-20 20:50:44.189680'),(38,1,'2024-03-20 20:53:59.798336',19,12,'2024-03-20 20:53:59.798333'),(39,1,'2024-03-20 20:53:59.892122',19,19,'2024-03-20 20:53:59.892118'),(40,1,'2024-03-20 20:53:59.966324',19,18,'2024-03-20 20:53:59.966321'),(41,2,'2024-03-20 20:54:00.040678',19,20,'2024-03-20 20:54:00.040675'),(42,5,'2024-03-20 20:54:00.111175',19,21,'2024-03-20 20:54:00.111172'),(43,1,'2024-03-20 21:07:36.299950',19,16,'2024-03-20 21:07:36.299948'),(44,1,'2024-03-20 21:07:36.471929',19,15,'2024-03-20 21:07:36.471926'),(45,3,'2024-03-21 03:57:18.662140',20,22,'2024-03-21 03:57:18.662136'),(46,7,'2024-03-21 03:57:18.796029',20,23,'2024-03-21 03:57:18.796024'),(47,34,'2024-03-21 03:57:18.880387',20,25,'2024-03-21 03:57:18.880383'),(48,2,'2024-03-22 05:17:45.110072',19,17,'2024-03-22 05:17:45.110069'),(49,2,'2024-03-22 05:17:45.275241',19,10,'2024-03-22 05:17:45.275239'),(52,10,'2024-03-23 11:38:46.782252',18,10,'2024-03-23 11:38:46.782252'),(53,0,'2024-03-23 15:02:44.724855',23,25,'2024-03-23 15:02:44.724855'),(54,4,'2024-03-23 00:00:00.000000',20,33,'2024-03-23 00:00:00.000000'),(55,73,'2024-03-24 00:00:00.000000',35,25,'2024-03-24 00:00:00.000000'),(56,18268,'2024-03-24 00:00:00.000000',35,35,'2024-03-24 00:00:00.000000'),(57,15,'2024-03-24 00:00:00.000000',35,11,'2024-03-24 00:00:00.000000'),(58,3682,'2024-03-24 00:00:00.000000',35,34,'2024-03-24 00:00:00.000000'),(59,0,'2024-03-24 00:00:00.000000',18,11,'2024-03-24 00:00:00.000000'),(60,22,'2024-03-24 00:00:00.000000',18,35,'2024-03-24 00:00:00.000000'),(61,0,'2024-03-24 00:00:00.000000',18,34,'2024-03-24 00:00:00.000000'),(62,50,'2024-03-24 00:00:00.000000',35,13,'2024-03-24 00:00:00.000000'),(63,1300,'2024-03-24 00:00:00.000000',35,36,'2024-03-24 00:00:00.000000'),(64,500,'2024-03-24 00:00:00.000000',16,36,'2024-03-24 00:00:00.000000'),(65,12,'2024-03-26 00:00:00.000000',38,10,'2024-03-26 00:00:00.000000'),(66,20,'2024-03-26 00:00:00.000000',38,11,'2024-03-26 00:00:00.000000'),(67,12,'2024-03-26 00:00:00.000000',38,25,'2024-03-26 00:00:00.000000'),(68,12,'2024-03-26 00:00:00.000000',35,10,'2024-03-26 00:00:00.000000'),(69,2,'2024-03-26 00:00:00.000000',35,15,'2024-03-26 00:00:00.000000'),(70,7,'2024-03-28 00:00:00.000000',39,11,'2024-03-28 00:00:00.000000'),(71,9500,'2024-03-28 00:00:00.000000',39,37,'2024-03-28 00:00:00.000000'),(72,2,'2024-03-28 00:00:00.000000',39,12,'2024-03-28 00:00:00.000000'),(73,426,'2024-03-28 00:00:00.000000',18,37,'2024-03-28 00:00:00.000000');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_solicitud`
--

DROP TABLE IF EXISTS `tipo_solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_solicitud` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_solicitud`
--

LOCK TABLES `tipo_solicitud` WRITE;
/*!40000 ALTER TABLE `tipo_solicitud` DISABLE KEYS */;
INSERT INTO `tipo_solicitud` VALUES (1,'TIPO base_dev','2023-12-16 17:27:46.753226','2023-12-16 17:27:46.753226'),(4,'INSTALACION','2023-12-17 02:04:44.650394','2023-12-17 02:04:44.651405'),(5,'CAMBIO DOMICILIO','2023-12-17 02:04:52.114743','2023-12-17 02:04:52.114743');
/*!40000 ALTER TABLE `tipo_solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unidad` varchar(30) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES (4,'Metro','2024-02-22 17:54:01.233924','2024-02-22 17:54:01.233920'),(5,'Funda','2024-02-22 17:54:05.578331','2024-02-22 17:54:05.578327'),(6,'Caja','2024-02-22 17:54:09.487495','2024-02-22 17:54:09.487492'),(7,'Unidad','2024-03-13 19:36:44.777707','2024-03-13 19:36:44.777702');
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `uid` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (15,'PETER GONZALO SANTOS QUIZHPI','1003324231','tecnicoecontel@gmail.com','Rd31053105','2024-03-10 16:49:38.504392','2024-03-10 16:49:38.504387','4wrzWps0VwZTOxiB6GgLmRrnsgl1'),(16,'JASSER ISMAEL MORENO BOLOÑA','0952090181','tecnico23432@gmail.com','Rd31053105','2024-03-10 17:03:46.643712','2024-03-10 17:03:46.643707','DV8dZtVsRtTyRR83qF0YBZboukE3'),(17,'JOSE RODOLFO PARDO FIGUEROA','0918901810','tecnico234323@gmail.com','Rd31053105','2024-03-10 17:08:15.110522','2024-03-10 17:08:15.110519','qmI3vW9v1OUoDT9q6nDekye57Lw1'),(18,'ALEX DAVID COBA UREÑA','0927175307','tecnico2343234@gmail.com','Rd31053105','2024-03-10 17:10:56.594729','2024-03-10 17:10:56.594725','lsdxNXpmlwdRKyVDImqxkAgGe3N2'),(19,'RONALD ELIAS SANCHEZ ZAMORA','0940660467','ronald.sanchez@econtel.com.ec','Ronald92Ecuador','2024-03-10 17:13:59.751679','2024-03-10 17:13:59.751675','K2uXKeB69eUJV5LCi4OlmojWFEg2'),(20,'KEVIN FRANKLIN SOTO SILVA','0940526940','kevin.soto@econtel.com.ec','Rd31053105','2024-03-10 17:54:10.119003','2024-03-10 17:54:10.118998','ZuvwFSycoBZn0b0SIWbpiIEV2oY2'),(21,'CESAR ANDRES LOIS BARAHONA','0943575316','cesar.lois@econtel.com.ec','Rd31053105','2024-03-11 15:46:21.951718','2024-03-11 15:46:21.951713','bl4ZPPODPxcnQ6AChBWN7mDPIth1'),(22,'Bryan Adrián Pilozo Bernardino','0953182672','bryan.pilozo@econtel.com.ec','Rd31053105','2024-03-11 15:51:25.062123','2024-03-11 15:51:25.062115','hfaDlrRc5XWJxEkZt5mQGmhCyT92'),(23,'José Fernando Pinos Alava','0952610970','jose9803pinos@hotmail.com','Rd31053105','2024-03-11 15:52:14.815268','2024-03-11 15:52:14.815263','1fLQPHGL0MTqphqurpgGRKG0rSL2'),(24,'RICHARD DALTON NUÑEZ TORRES','0930444674','richard.nunez@econtel.com.ec','Rd31053105','2024-03-11 18:54:21.604397','2024-03-11 18:54:21.604388','HGyJSMGdWMXOqfjzmhaRH8L1yXm2'),(25,'ADMIN','0999999999','admin@gmail.com','123123','2024-03-13 19:29:33.495470','2024-03-13 19:29:33.495466','BgOTDpxySLWKicdSUA8P4uEC5LJ2'),(26,'RUBEN VIRGILIO CHANCAY MARCILLO','0918612946','ruben.chancay@econtel.com.ec','Rd31053105','2024-03-15 18:20:27.288211','2024-03-15 18:20:27.288205','QYc6VZLBebhEYyoy781Vgu0IZP73'),(27,'Richard Nuñez De la Rosa','0911172658','richardnunez43@gmail.com','Ricd19688647','2024-03-19 20:50:52.941679','2024-03-19 20:50:52.941674','RmqWQbWghTgJz5gMOZv3GCZByP63'),(28,'reunion','0959292828','reunion@gmail.com','123123','2024-03-25 01:27:20.039681','2024-03-25 01:27:20.039681','qhEJtSPA73cdFrJg6hn71i1suv92');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_roles`
--

DROP TABLE IF EXISTS `usuario_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `rol_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_roles_usuario_id_rol_id_94f2baf3_uniq` (`usuario_id`,`rol_id`),
  KEY `usuario_roles_rol_id_cd75aaaf_fk_rol_id` (`rol_id`),
  CONSTRAINT `usuario_roles_rol_id_cd75aaaf_fk_rol_id` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `usuario_roles_usuario_id_82bf2f1d_fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_roles`
--

LOCK TABLES `usuario_roles` WRITE;
/*!40000 ALTER TABLE `usuario_roles` DISABLE KEYS */;
INSERT INTO `usuario_roles` VALUES (25,15,8),(26,16,8),(27,17,8),(28,18,8),(29,19,7),(30,20,8),(31,21,7),(32,22,9),(33,23,9),(35,24,3),(34,24,7),(36,25,7),(37,26,8),(38,27,7),(39,28,10);
/*!40000 ALTER TABLE `usuario_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariowishupapi`
--

DROP TABLE IF EXISTS `usuariowishupapi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariowishupapi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `plan_internet` varchar(10) NOT NULL,
  `zona` varchar(10) NOT NULL,
  `nombre` varchar(123) NOT NULL,
  `usuario_rb` varchar(123) NOT NULL,
  `cedula` varchar(13) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariowishupapi`
--

LOCK TABLES `usuariowishupapi` WRITE;
/*!40000 ALTER TABLE `usuariowishupapi` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariowishupapi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` varchar(10) NOT NULL,
  `sistema` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'1.2','');
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wisphub`
--

DROP TABLE IF EXISTS `wisphub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wisphub` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idzona` varchar(25) NOT NULL,
  `zona` varchar(75) NOT NULL,
  `id_plan` varchar(25) NOT NULL,
  `plan` varchar(75) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `usuariorb` varchar(55) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `hojatrabajo_id` int DEFAULT NULL,
  `usuario_creacion_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wisphub_hojatrabajo_id_6c9935c1_fk_hojatrabajo_id` (`hojatrabajo_id`),
  KEY `wisphub_usuario_creacion_id_65b45709_fk_usuario_id` (`usuario_creacion_id`),
  CONSTRAINT `wisphub_hojatrabajo_id_6c9935c1_fk_hojatrabajo_id` FOREIGN KEY (`hojatrabajo_id`) REFERENCES `hojatrabajo` (`id`),
  CONSTRAINT `wisphub_usuario_creacion_id_65b45709_fk_usuario_id` FOREIGN KEY (`usuario_creacion_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wisphub`
--

LOCK TABLES `wisphub` WRITE;
/*!40000 ALTER TABLE `wisphub` DISABLE KEYS */;
INSERT INTO `wisphub` VALUES (4,'3','zona base_dev 3','78','plan 100 megas','154.198.168.75','ejem-plo usuario b','2024-03-10 04:00:55.140244','2024-03-10 04:00:55.140244',6,15),(5,'3','zona base_dev 3','458','plan 100 megas','154.198.168.75','ejem-plo usuario b','2024-03-10 04:01:10.726781','2024-03-10 04:01:10.726781',NULL,NULL),(6,'3','zona base_dev 3','458','plan 100 megas','154.198.168.75','ejem-plo usuario b','2024-03-10 04:04:20.690681','2024-03-10 04:04:20.690681',3,NULL),(7,'49153','Nodo Sevilla','','FO-$30-150M','10.6.29.22','Aroca Jaime Erick Lenin','2024-03-12 22:23:20.949339','2024-03-12 22:23:20.949343',4,NULL),(8,'3','zona base_dev 3','458','plan 100 megas','154.198.168.75','ejem-plo usuario b','2024-03-13 17:22:51.825618','2024-03-13 17:22:51.825618',3,NULL),(9,'49153','Nodo Sevilla','275817','FO-$22.14-400M Discapacidad/Tercera Edad','10.6.24.102','ejem-plo erp','2024-03-13 17:28:38.630887','2024-03-13 17:28:38.630887',3,NULL),(10,'49153','Nodo Sevilla','','FO-$22.14-400M Discapacidad/Tercera Edad','10.6.24.102','base_dev erp1','2024-03-13 20:35:11.696252','2024-03-13 20:35:11.696260',4,NULL),(11,'49153','Nodo Sevilla','','FO-$22.14-400M Discapacidad/Tercera Edad','10.6.24.103','base_dev rp3','2024-03-13 20:37:08.784873','2024-03-13 20:37:08.784878',4,NULL),(12,'49153','Nodo Sevilla','','FO-$22.14-400M Discapacidad/Tercera Edad','10.6.24.102','ejemplo ereee','2024-03-13 20:54:00.580843','2024-03-13 20:54:00.580852',5,NULL),(13,'49153','Nodo Sevilla','275817','FO-$22.14-400M Discapacidad/Tercera Edad','10.6.24.105','a ascasc as','2024-03-13 21:07:24.418395','2024-03-13 21:07:24.418401',5,NULL),(14,'49153','Nodo Sevilla','275817','FO-$22.14-400M Discapacidad/Tercera Edad','10.6.24.106','assa aa a','2024-03-13 21:11:25.851616','2024-03-13 21:11:25.851622',5,NULL),(15,'49153','Nodo Sevilla','275817','FO-$22.14-400M Discapacidad/Tercera Edad','10.6.24.102','ejem-plo erp','2024-03-13 21:34:40.510383','2024-03-13 21:34:40.510383',3,NULL),(16,'49153','Nodo Sevilla','275817','FO-$22.14-400M Discapacidad/Tercera Edad','10.6.24.102','ejem-plo erp','2024-03-13 21:42:26.798550','2024-03-13 21:42:26.798550',3,16),(17,'49153','Nodo Sevilla','274532','FO-$80-900M','10.6.24.107','as as assvvcc','2024-03-13 21:58:08.033615','2024-03-13 21:58:08.033626',5,22),(18,'49153','Nodo Sevilla','276488','FO-$30-250M','10.6.254.101','Giovanna Lisette Guillén Anzules','2024-03-18 19:57:38.851073','2024-03-18 19:57:38.851078',11,21),(19,'49153','Nodo Sevilla','275817','FO-$22.14-400M Discapacidad/Tercera Edad','10.6.24.102','ejem-plo erp','2024-03-29 21:09:12.902300','2024-03-29 21:09:12.902300',3,16);
/*!40000 ALTER TABLE `wisphub` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-24 14:25:25
