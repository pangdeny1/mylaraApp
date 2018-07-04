# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: farmers
# Generation Time: 2018-07-04 13:26:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table abilities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `abilities`;

CREATE TABLE `abilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `entity_type` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `only_owned` tinyint(1) NOT NULL DEFAULT '0',
  `scope` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abilities_scope_index` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;

INSERT INTO `abilities` (`id`, `name`, `title`, `entity_id`, `entity_type`, `only_owned`, `scope`, `created_at`, `updated_at`)
VALUES
	(1,'*','All abilities',NULL,'*',0,NULL,'2018-07-04 13:17:17','2018-07-04 13:17:17');

/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressable_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_addressable_type_addressable_id_index` (`addressable_type`,`addressable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;

INSERT INTO `addresses` (`id`, `street`, `address`, `country`, `state`, `postal_code`, `addressable_type`, `addressable_id`, `creator_id`, `created_at`, `updated_at`)
VALUES
	(1,'Karoleni St.',NULL,'Tanzania','Arusha',NULL,'App\\Farmer',1,NULL,'2018-07-04 13:23:43','2018-07-04 13:23:43'),
	(2,'',NULL,'Tanzania','Arusha',NULL,'App\\Farm',1,NULL,'2018-07-04 13:24:52','2018-07-04 13:24:52'),
	(3,'Uhindini St.',NULL,'Tanzania','Arusha',NULL,'App\\Farmer',2,NULL,'2018-07-04 15:45:34','2018-07-04 15:45:34'),
	(4,'',NULL,'Tanzania','Morogoro',NULL,'App\\Farm',2,NULL,'2018-07-04 15:46:19','2018-07-04 15:46:19'),
	(5,'Mwenge St.',NULL,'Tanzania','Dar es Salaam',NULL,'App\\Farmer',3,NULL,'2018-07-04 15:54:08','2018-07-04 15:54:08'),
	(6,'',NULL,'Tanzania','Pwani',NULL,'App\\Farm',3,NULL,'2018-07-04 15:55:41','2018-07-04 15:55:41');

/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table assigned_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assigned_roles`;

CREATE TABLE `assigned_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` int(11) DEFAULT NULL,
  KEY `assigned_roles_entity_index` (`entity_id`,`entity_type`,`scope`),
  KEY `assigned_roles_role_id_index` (`role_id`),
  KEY `assigned_roles_scope_index` (`scope`),
  CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `assigned_roles` WRITE;
/*!40000 ALTER TABLE `assigned_roles` DISABLE KEYS */;

INSERT INTO `assigned_roles` (`role_id`, `entity_id`, `entity_type`, `scope`)
VALUES
	(1,1,'App\\User',NULL);

/*!40000 ALTER TABLE `assigned_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table audits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `audits`;

CREATE TABLE `audits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) unsigned NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`)
VALUES
	(1,'App\\User',1,'created','App\\Farmer',1,'[]','{\"first_name\":\"Daniel\",\"last_name\":\"Nathan\",\"phone\":\"0714656500\",\"email\":\"daniel.nathan@example.com\",\"gender\":\"male\",\"creator_id\":1,\"id\":1}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 13:23:43','2018-07-04 13:23:43'),
	(2,'App\\User',1,'created','App\\Address',1,'[]','{\"street\":\"Karoleni St.\",\"address\":null,\"state\":\"Arusha\",\"country\":\"Tanzania\",\"postal_code\":null,\"addressable_id\":1,\"addressable_type\":\"App\\\\Farmer\",\"id\":1}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 13:23:43','2018-07-04 13:23:43'),
	(3,'App\\User',1,'created','App\\Farm',1,'[]','{\"size\":\"5\",\"size_unit\":\"acre\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farmer_id\":1,\"id\":1}','http://farmers.test/farmers/1/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 13:24:52','2018-07-04 13:24:52'),
	(4,'App\\User',1,'created','App\\Address',2,'[]','{\"country\":\"Tanzania\",\"state\":\"Arusha\",\"addressable_id\":1,\"addressable_type\":\"App\\\\Farm\",\"id\":2}','http://farmers.test/farmers/1/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 13:24:52','2018-07-04 13:24:52'),
	(5,'App\\User',1,'created','App\\Block',1,'[]','{\"number\":\"678-KHHT\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farm_id\":1,\"id\":1}','http://farmers.test/farmers/1/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 13:24:52','2018-07-04 13:24:52'),
	(6,'App\\User',1,'created','App\\Batch',1,'[]','{\"number\":\"JHG-364785\",\"description\":\"\",\"id\":1}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 13:34:28','2018-07-04 13:34:28'),
	(7,'App\\User',1,'created','App\\Harvest',1,'[]','{\"expected_amount\":\"4560\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-05 00:00:00\",\"farm_id\":\"1\",\"block_id\":\"1\",\"product_id\":\"6\",\"batch_id\":1,\"id\":1}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 13:34:28','2018-07-04 13:34:28'),
	(8,'App\\User',1,'created','App\\Batch',2,'[]','{\"number\":\"HDB38498\",\"description\":\"\",\"id\":2}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 13:47:40','2018-07-04 13:47:40'),
	(9,'App\\User',1,'created','App\\Harvest',2,'[]','{\"expected_amount\":\"46570\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-07 00:00:00\",\"farm_id\":\"1\",\"block_id\":\"1\",\"product_id\":\"14\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":2,\"id\":2}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 13:47:40','2018-07-04 13:47:40'),
	(10,'App\\User',1,'created','App\\Batch',3,'[]','{\"number\":\"354758\",\"description\":\"\",\"id\":3}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 14:03:35','2018-07-04 14:03:35'),
	(11,'App\\User',1,'created','App\\Harvest',3,'[]','{\"expected_amount\":\"35670\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-13 00:00:00\",\"farm_id\":\"1\",\"block_id\":\"1\",\"product_id\":\"4\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":3,\"id\":3}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 14:03:35','2018-07-04 14:03:35'),
	(12,'App\\User',1,'created','App\\Batch',4,'[]','{\"number\":\"354664HJSG\",\"description\":\"\",\"id\":4}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 14:19:45','2018-07-04 14:19:45'),
	(13,'App\\User',1,'created','App\\Harvest',4,'[]','{\"expected_amount\":\"9980\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-13 00:00:00\",\"farm_id\":\"1\",\"block_id\":\"1\",\"product_id\":\"14\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":4,\"id\":4}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 14:19:45','2018-07-04 14:19:45'),
	(14,'App\\User',1,'created','App\\Purchase',1,'[]','{\"product_id\":null,\"farmer_id\":\"1\",\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"450\",\"weight_before\":\"445\",\"weight_after\":null,\"id\":1}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 14:43:19','2018-07-04 14:43:19'),
	(15,'App\\User',1,'created','App\\Purchase',2,'[]','{\"batch_id\":4,\"farmer_id\":\"1\",\"amount\":279500,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"450\",\"weight_before\":\"450\",\"weight_after\":\"430\",\"creator_id\":1,\"id\":2}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:10:01','2018-07-04 15:10:01'),
	(16,'App\\User',1,'created','App\\Purchase',3,'[]','{\"batch_id\":4,\"farmer_id\":\"1\",\"amount\":279500,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"450\",\"weight_before\":\"450\",\"weight_after\":\"430\",\"creator_id\":1,\"id\":3}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:10:35','2018-07-04 15:10:35'),
	(17,'App\\User',1,'created','App\\Remark',1,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"remarkable_id\":3,\"remarkable_type\":\"App\\\\Purchase\",\"id\":1}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:10:35','2018-07-04 15:10:35'),
	(18,'App\\User',1,'updated','App\\Purchase',3,'{\"status\":null}','{\"status\":\"processed\"}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:10:35','2018-07-04 15:10:35'),
	(19,'App\\User',1,'created','App\\Purchase',4,'[]','{\"batch_id\":4,\"farmer_id\":\"1\",\"amount\":279500,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"450\",\"weight_before\":\"450\",\"weight_after\":\"430\",\"creator_id\":1,\"id\":4}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:11:14','2018-07-04 15:11:14'),
	(20,'App\\User',1,'created','App\\Remark',2,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"remarkable_id\":4,\"remarkable_type\":\"App\\\\Purchase\",\"id\":2}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:11:14','2018-07-04 15:11:14'),
	(21,'App\\User',1,'updated','App\\Purchase',4,'{\"status\":null}','{\"status\":\"processed\"}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:11:14','2018-07-04 15:11:14'),
	(22,'App\\User',1,'created','App\\Purchase',5,'[]','{\"batch_id\":4,\"farmer_id\":\"1\",\"amount\":279500,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"450\",\"weight_before\":\"450\",\"weight_after\":\"430\",\"creator_id\":1,\"id\":5}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:12:47','2018-07-04 15:12:47'),
	(23,'App\\User',1,'created','App\\Remark',3,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"remarkable_id\":5,\"remarkable_type\":\"App\\\\Purchase\",\"id\":3}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:12:47','2018-07-04 15:12:47'),
	(24,'App\\User',1,'updated','App\\Purchase',5,'{\"status\":null}','{\"status\":\"processed\"}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:12:47','2018-07-04 15:12:47'),
	(25,'App\\User',1,'created','App\\Purchase',6,'[]','{\"batch_id\":4,\"farmer_id\":\"1\",\"amount\":279500,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"450\",\"weight_before\":\"450\",\"weight_after\":\"430\",\"creator_id\":1,\"id\":6}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:13:02','2018-07-04 15:13:02'),
	(26,'App\\User',1,'created','App\\Remark',4,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"remarkable_id\":6,\"remarkable_type\":\"App\\\\Purchase\",\"id\":4}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:13:02','2018-07-04 15:13:02'),
	(27,'App\\User',1,'updated','App\\Purchase',6,'{\"status\":null}','{\"status\":\"processed\"}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:13:02','2018-07-04 15:13:02'),
	(28,'App\\User',1,'created','App\\Purchase',7,'[]','{\"batch_id\":3,\"product_id\":4,\"farmer_id\":\"1\",\"amount\":600000,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"760\",\"weight_before\":\"755\",\"weight_after\":\"750\",\"creator_id\":1,\"id\":7}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:23:17','2018-07-04 15:23:17'),
	(29,'App\\User',1,'created','App\\Remark',5,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"remarkable_id\":7,\"remarkable_type\":\"App\\\\Purchase\",\"id\":5}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:23:17','2018-07-04 15:23:17'),
	(30,'App\\User',1,'updated','App\\Purchase',7,'{\"status\":null}','{\"status\":\"processed\"}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:23:17','2018-07-04 15:23:17'),
	(31,'App\\User',1,'created','App\\Farmer',2,'[]','{\"first_name\":\"Juma\",\"last_name\":\"Mwindadi\",\"phone\":\"0762764819\",\"email\":\"juma.mwindadi@example.com\",\"gender\":\"male\",\"creator_id\":1,\"id\":2}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:45:34','2018-07-04 15:45:34'),
	(32,'App\\User',1,'created','App\\Address',3,'[]','{\"street\":\"Uhindini St.\",\"address\":null,\"state\":\"Arusha\",\"country\":\"Tanzania\",\"postal_code\":null,\"addressable_id\":2,\"addressable_type\":\"App\\\\Farmer\",\"id\":3}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:45:34','2018-07-04 15:45:34'),
	(33,'App\\User',1,'created','App\\Farm',2,'[]','{\"size\":\"10\",\"size_unit\":\"acre\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farmer_id\":2,\"id\":2}','http://farmers.test/farmers/2/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:46:19','2018-07-04 15:46:19'),
	(34,'App\\User',1,'created','App\\Address',4,'[]','{\"country\":\"Tanzania\",\"state\":\"Morogoro\",\"addressable_id\":2,\"addressable_type\":\"App\\\\Farm\",\"id\":4}','http://farmers.test/farmers/2/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:46:19','2018-07-04 15:46:19'),
	(35,'App\\User',1,'created','App\\Block',2,'[]','{\"number\":\"47HJM564\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farm_id\":2,\"id\":2}','http://farmers.test/farmers/2/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:46:19','2018-07-04 15:46:19'),
	(36,'App\\User',1,'created','App\\Batch',5,'[]','{\"number\":\"JM4589\",\"description\":\"\",\"id\":5}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:47:17','2018-07-04 15:47:17'),
	(37,'App\\User',1,'created','App\\Harvest',5,'[]','{\"expected_amount\":\"67800\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-20 00:00:00\",\"farm_id\":\"2\",\"block_id\":\"2\",\"product_id\":\"10\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":5,\"id\":5}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:47:17','2018-07-04 15:47:17'),
	(38,'App\\User',1,'created','App\\Purchase',8,'[]','{\"batch_id\":5,\"product_id\":10,\"farmer_id\":\"2\",\"amount\":450000,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"790\",\"weight_before\":\"780\",\"weight_after\":\"750\",\"creator_id\":1,\"id\":8}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:47:51','2018-07-04 15:47:51'),
	(39,'App\\User',1,'created','App\\Remark',6,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"remarkable_id\":8,\"remarkable_type\":\"App\\\\Purchase\",\"id\":6}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:47:51','2018-07-04 15:47:51'),
	(40,'App\\User',1,'updated','App\\Purchase',8,'{\"status\":null}','{\"status\":\"processed\"}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:47:51','2018-07-04 15:47:51'),
	(41,'App\\User',1,'created','App\\Farmer',3,'[]','{\"first_name\":\"Denis\",\"last_name\":\"Christian\",\"phone\":\"0783855313\",\"email\":\"denis.christian@example.com\",\"gender\":\"male\",\"creator_id\":1,\"id\":3}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:54:08','2018-07-04 15:54:08'),
	(42,'App\\User',1,'created','App\\Address',5,'[]','{\"street\":\"Mwenge St.\",\"address\":null,\"state\":\"Dar es Salaam\",\"country\":\"Tanzania\",\"postal_code\":null,\"addressable_id\":3,\"addressable_type\":\"App\\\\Farmer\",\"id\":5}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:54:08','2018-07-04 15:54:08'),
	(43,'App\\User',1,'created','App\\Farm',3,'[]','{\"size\":\"5\",\"size_unit\":\"acre\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farmer_id\":3,\"id\":3}','http://farmers.test/farmers/3/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:55:41','2018-07-04 15:55:41'),
	(44,'App\\User',1,'created','App\\Address',6,'[]','{\"country\":\"Tanzania\",\"state\":\"Pwani\",\"addressable_id\":3,\"addressable_type\":\"App\\\\Farm\",\"id\":6}','http://farmers.test/farmers/3/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:55:41','2018-07-04 15:55:41'),
	(45,'App\\User',1,'created','App\\Block',3,'[]','{\"number\":\"DC647P\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farm_id\":3,\"id\":3}','http://farmers.test/farmers/3/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:55:41','2018-07-04 15:55:41'),
	(46,'App\\User',1,'created','App\\Batch',6,'[]','{\"number\":\"DC467P456\",\"description\":\"\",\"id\":6}','http://farmers.test/farmers/3/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:56:42','2018-07-04 15:56:42'),
	(47,'App\\User',1,'created','App\\Harvest',6,'[]','{\"expected_amount\":\"4890\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-28 00:00:00\",\"farm_id\":\"3\",\"block_id\":\"3\",\"product_id\":\"6\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":6,\"id\":6}','http://farmers.test/farmers/3/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:56:42','2018-07-04 15:56:42'),
	(48,'App\\User',1,'created','App\\Purchase',9,'[]','{\"batch_id\":6,\"product_id\":6,\"farmer_id\":\"3\",\"amount\":350000,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"560\",\"weight_before\":\"540\",\"weight_after\":\"500\",\"creator_id\":1,\"id\":9}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:57:18','2018-07-04 15:57:18'),
	(49,'App\\User',1,'created','App\\Remark',7,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"remarkable_id\":9,\"remarkable_type\":\"App\\\\Purchase\",\"id\":7}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:57:18','2018-07-04 15:57:18'),
	(50,'App\\User',1,'updated','App\\Purchase',9,'{\"status\":null}','{\"status\":\"processed\"}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-04 15:57:18','2018-07-04 15:57:18');

/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table batches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `batches`;

CREATE TABLE `batches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `batches` WRITE;
/*!40000 ALTER TABLE `batches` DISABLE KEYS */;

INSERT INTO `batches` (`id`, `number`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'JHG-364785','','2018-07-04 13:34:27','2018-07-04 13:34:27'),
	(2,'HDB38498','','2018-07-04 13:47:40','2018-07-04 13:47:40'),
	(3,'354758','','2018-07-04 14:03:35','2018-07-04 14:03:35'),
	(4,'354664HJSG','','2018-07-04 14:19:45','2018-07-04 14:19:45'),
	(5,'JM4589','','2018-07-04 15:47:17','2018-07-04 15:47:17'),
	(6,'DC467P456','','2018-07-04 15:56:42','2018-07-04 15:56:42');

/*!40000 ALTER TABLE `batches` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blocks`;

CREATE TABLE `blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `farm_id` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;

INSERT INTO `blocks` (`id`, `number`, `farm_id`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'678-KHHT',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 13:24:52','2018-07-04 13:24:52'),
	(2,'47HJM564',2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 15:46:19','2018-07-04 15:46:19'),
	(3,'DC647P',3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 15:55:41','2018-07-04 15:55:41');

/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table farm_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `farm_product`;

CREATE TABLE `farm_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `farm_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `farm_product` WRITE;
/*!40000 ALTER TABLE `farm_product` DISABLE KEYS */;

INSERT INTO `farm_product` (`id`, `farm_id`, `product_id`, `created_at`, `updated_at`)
VALUES
	(1,1,15,'2018-07-04 13:24:52','2018-07-04 13:24:52'),
	(2,1,6,'2018-07-04 13:24:52','2018-07-04 13:24:52'),
	(3,1,9,'2018-07-04 13:24:52','2018-07-04 13:24:52'),
	(4,2,4,'2018-07-04 15:46:19','2018-07-04 15:46:19'),
	(5,2,7,'2018-07-04 15:46:19','2018-07-04 15:46:19'),
	(6,2,11,'2018-07-04 15:46:19','2018-07-04 15:46:19'),
	(7,2,10,'2018-07-04 15:46:19','2018-07-04 15:46:19'),
	(8,3,6,'2018-07-04 15:55:41','2018-07-04 15:55:41'),
	(9,3,7,'2018-07-04 15:55:41','2018-07-04 15:55:41'),
	(10,3,9,'2018-07-04 15:55:41','2018-07-04 15:55:41');

/*!40000 ALTER TABLE `farm_product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table farmer_batch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `farmer_batch`;

CREATE TABLE `farmer_batch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `farmer_id` int(10) unsigned DEFAULT NULL,
  `batch_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `farmer_batch` WRITE;
/*!40000 ALTER TABLE `farmer_batch` DISABLE KEYS */;

INSERT INTO `farmer_batch` (`id`, `farmer_id`, `batch_id`, `created_at`, `updated_at`)
VALUES
	(1,1,3,'2018-07-04 14:19:45','2018-07-04 14:19:45'),
	(2,1,4,'2018-07-04 14:19:45','2018-07-04 14:19:45'),
	(3,2,5,'2018-07-04 15:47:17','2018-07-04 15:47:17'),
	(4,3,6,'2018-07-04 15:56:42','2018-07-04 15:56:42');

/*!40000 ALTER TABLE `farmer_batch` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table farmers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `farmers`;

CREATE TABLE `farmers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `farmers` WRITE;
/*!40000 ALTER TABLE `farmers` DISABLE KEYS */;

INSERT INTO `farmers` (`id`, `first_name`, `last_name`, `phone`, `email`, `gender`, `creator_id`, `created_at`, `updated_at`)
VALUES
	(1,'Daniel','Nathan','0714656500','daniel.nathan@example.com','male',1,'2018-07-04 13:23:43','2018-07-04 13:23:43'),
	(2,'Juma','Mwindadi','0762764819','juma.mwindadi@example.com','male',1,'2018-07-04 15:45:34','2018-07-04 15:45:34'),
	(3,'Denis','Christian','0783855313','denis.christian@example.com','male',1,'2018-07-04 15:54:08','2018-07-04 15:54:08');

/*!40000 ALTER TABLE `farmers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table farms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `farms`;

CREATE TABLE `farms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `size` double NOT NULL,
  `size_unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `farmer_id` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `farms` WRITE;
/*!40000 ALTER TABLE `farms` DISABLE KEYS */;

INSERT INTO `farms` (`id`, `size`, `size_unit`, `farmer_id`, `description`, `created_at`, `updated_at`)
VALUES
	(1,5,'acre',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 13:24:52','2018-07-04 13:24:52'),
	(2,10,'acre',2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 15:46:19','2018-07-04 15:46:19'),
	(3,5,'acre',3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 15:55:41','2018-07-04 15:55:41');

/*!40000 ALTER TABLE `farms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table harvests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `harvests`;

CREATE TABLE `harvests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `expected_amount` double NOT NULL,
  `amount_unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expected_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `block_id` int(10) unsigned DEFAULT NULL,
  `farm_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `batch_id` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `harvests` WRITE;
/*!40000 ALTER TABLE `harvests` DISABLE KEYS */;

INSERT INTO `harvests` (`id`, `expected_amount`, `amount_unit`, `expected_date`, `block_id`, `farm_id`, `product_id`, `batch_id`, `description`, `created_at`, `updated_at`)
VALUES
	(1,4560,'kg','2018-07-04 13:36:22',1,1,6,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 13:34:28','2018-07-04 13:34:28'),
	(2,46570,'kg','2018-07-07 00:00:00',1,1,14,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 13:47:40','2018-07-04 13:47:40'),
	(3,35670,'kg','2018-07-13 00:00:00',1,1,4,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 14:03:35','2018-07-04 14:03:35'),
	(4,9980,'kg','2018-07-13 00:00:00',1,1,14,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 14:19:45','2018-07-04 14:19:45'),
	(5,67800,'kg','2018-07-20 00:00:00',2,2,10,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 15:47:17','2018-07-04 15:47:17'),
	(6,4890,'kg','2018-07-28 00:00:00',3,3,6,6,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-04 15:56:42','2018-07-04 15:56:42');

/*!40000 ALTER TABLE `harvests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(341,'2014_10_12_000000_create_users_table',1),
	(342,'2014_10_12_100000_create_password_resets_table',1),
	(343,'2018_05_12_140817_create_farmers_table',1),
	(344,'2018_05_13_060556_create_products_table',1),
	(345,'2018_05_13_061031_create_product_categories_table',1),
	(346,'2018_05_13_062152_create_product_category_table',1),
	(347,'2018_05_14_050338_create_product_prices_table',1),
	(348,'2018_05_15_083531_create_purchases_table',1),
	(349,'2018_05_15_135954_create_remarks_table',1),
	(350,'2018_05_29_183330_create_addresses_table',1),
	(351,'2018_05_30_090730_create_bouncer_tables',1),
	(352,'2018_05_30_172904_create_audits_table',1),
	(353,'2018_06_25_135944_create_farms_table',1),
	(354,'2018_06_25_142204_create_harvests_table',1),
	(355,'2018_06_25_142951_create_farm_crop_table',1),
	(356,'2018_06_25_144104_create_batches_table',1),
	(357,'2018_06_25_144622_create_farmer_batch_table',1),
	(358,'2018_06_25_153201_create_blocks_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `ability_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forbidden` tinyint(1) NOT NULL DEFAULT '0',
  `scope` int(11) DEFAULT NULL,
  KEY `permissions_entity_index` (`entity_id`,`entity_type`,`scope`),
  KEY `permissions_ability_id_index` (`ability_id`),
  KEY `permissions_scope_index` (`scope`),
  CONSTRAINT `permissions_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`ability_id`, `entity_id`, `entity_type`, `forbidden`, `scope`)
VALUES
	(1,1,'roles',0,NULL);

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;

INSERT INTO `product_categories` (`id`, `name`, `description`, `creator_id`, `created_at`, `updated_at`)
VALUES
	(1,'Cereals','Sed fugit ab est iste blanditiis.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(2,'Pulses','Vel impedit eum totam et.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(3,'Vegetables','Non eius vel officia quasi nulla nostrum expedita.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(4,'Fruits','Corporis maxime sapiente est et deleniti explicabo.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(5,'Nuts','Similique aut voluptas velit quo consectetur veniam fuga.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(6,'Oilseeds','Aut quidem similique cupiditate ea cupiditate nam.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(7,'Sugars and Starches','Eius illo itaque sed eius omnis et corporis.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(8,'Fibres','Et non ratione dolore et veniam repellat.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(9,'Beverages','Velit aut ut itaque autem.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(10,'Narcotics','Quas rerum quis rerum fugiat.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(11,'Spices','Quia non sint et tempore consectetur.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(12,'Condiments','Rerum aut officia a consequatur necessitatibus inventore.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(13,'Rubber Forages','Ipsa delectus molestiae maiores qui.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(14,'Green and Green leaf manure','Quia ratione voluptas autem debitis excepturi consectetur perspiciatis.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18');

/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;

INSERT INTO `product_category` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(2,1,2,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(3,1,3,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(4,1,4,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(5,1,5,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(6,2,6,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(7,2,7,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(8,2,8,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(9,2,9,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(10,3,10,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(11,3,11,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(12,3,12,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(13,3,13,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(14,4,14,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(15,4,15,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(16,4,16,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(17,4,17,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(18,4,18,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(19,4,19,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(20,5,20,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(21,5,21,'2018-07-04 13:17:18','2018-07-04 13:17:18');

/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_prices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_prices`;

CREATE TABLE `product_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_value` double NOT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_till` timestamp NULL DEFAULT NULL,
  `is_current_price` tinyint(1) NOT NULL DEFAULT '1',
  `product_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_prices` WRITE;
/*!40000 ALTER TABLE `product_prices` DISABLE KEYS */;

INSERT INTO `product_prices` (`id`, `amount`, `currency`, `unit`, `unit_value`, `valid_from`, `valid_till`, `is_current_price`, `product_id`, `creator_id`, `created_at`, `updated_at`)
VALUES
	(1,850,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,1,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(2,550,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,2,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(3,550,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,3,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(4,800,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,4,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(5,950,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,5,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(6,700,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,6,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(7,850,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,7,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(8,800,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,8,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(9,450,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,9,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(10,600,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,10,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(11,850,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,11,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(12,750,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,12,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(13,700,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,13,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(14,650,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,14,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(15,600,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,15,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(16,550,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,16,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(17,900,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,17,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(18,750,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,18,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(19,450,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,19,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(20,800,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,20,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(21,700,'TZS','kg',0,'2018-07-04 13:17:18',NULL,1,21,NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18');

/*!40000 ALTER TABLE `product_prices` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `name`, `description`, `creator_id`, `created_at`, `updated_at`)
VALUES
	(1,'Maize','Voluptas molestiae enim ex et beatae.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(2,'Rice','Eos ea voluptatem consequatur hic non perspiciatis.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(3,'Wheat','Exercitationem sunt facilis aliquid nostrum ad rerum.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(4,'Sorghum','Aliquam quis facere aut consequatur et iste laborum.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(5,'Barley','Autem sed molestiae quia fuga.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(6,'Kidney bean','Occaecati nihil autem consequatur et.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(7,'Lima bean','Ut nulla aliquid voluptates excepturi.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(8,'Horse bean','Tenetur accusamus veritatis neque minus.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(9,'Garden pea','Recusandae et qui vero dolor.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(10,'Mchicha','Fugiat natus ut officiis ut nobis nulla.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(11,'Tembele','Impedit vitae ut ut deleniti laudantium iure voluptate.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(12,'Kabichi','Inventore optio dicta quia esse quia.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(13,'Kisanvu','Saepe suscipit commodi nihil.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(14,'Chungwa','Blanditiis quam ab est repudiandae culpa quia quo.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(15,'Embe','Quam saepe dignissimos eum ea.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(16,'Ndizi','Iure incidunt incidunt sit quia laudantium voluptatem tempore.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(17,'Tango','Qui quos quia impedit quibusdam cumque sunt cumque.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(18,'Tikiti','Aut magnam excepturi repellendus libero.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(19,'Zabibu','Culpa ut et error fugit neque enim.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(20,'Karanga','Aut molestiae ut saepe.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18'),
	(21,'Korosho','Voluptate quae nobis aliquam inventore quibusdam quo illo.',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchases
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchases`;

CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_weight` double NOT NULL,
  `weight_before` double DEFAULT NULL,
  `weight_after` double DEFAULT NULL,
  `weight_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('received','processed','pending','rejected','completed','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `product_id` int(10) unsigned DEFAULT NULL,
  `batch_id` int(10) unsigned DEFAULT NULL,
  `farmer_id` int(10) unsigned DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;

INSERT INTO `purchases` (`id`, `field_weight`, `weight_before`, `weight_after`, `weight_unit`, `amount`, `currency`, `status`, `product_id`, `batch_id`, `farmer_id`, `paid_at`, `creator_id`, `created_at`, `updated_at`)
VALUES
	(1,450,445,NULL,'kg',NULL,'TZS','received',1,1,1,NULL,1,'2018-07-04 14:43:19','2018-07-04 14:43:19'),
	(2,450,450,430,'kg',279500,'TZS','received',2,4,1,NULL,1,'2018-07-04 15:10:01','2018-07-04 15:10:01'),
	(3,450,450,430,'kg',279500,'TZS','processed',3,4,1,NULL,1,'2018-07-04 15:10:35','2018-07-04 15:10:35'),
	(4,450,450,430,'kg',279500,'TZS','processed',4,4,1,NULL,1,'2018-07-04 15:11:14','2018-07-04 15:11:14'),
	(5,450,450,430,'kg',279500,'TZS','processed',5,4,1,NULL,1,'2018-07-04 15:12:47','2018-07-04 15:12:47'),
	(6,450,450,430,'kg',279500,'TZS','processed',6,4,1,NULL,1,'2018-07-04 15:13:02','2018-07-04 15:13:02'),
	(7,760,755,750,'kg',600000,'TZS','processed',4,3,1,NULL,1,'2018-07-04 15:23:17','2018-07-04 15:23:17'),
	(8,790,780,750,'kg',450000,'TZS','processed',10,5,2,NULL,1,'2018-07-04 15:47:51','2018-07-04 15:47:51'),
	(9,560,540,500,'kg',350000,'TZS','processed',6,6,3,NULL,1,'2018-07-04 15:57:18','2018-07-04 15:57:18');

/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table remarks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `remarks`;

CREATE TABLE `remarks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarkable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarkable_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remarks_remarkable_type_remarkable_id_index` (`remarkable_type`,`remarkable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `remarks` WRITE;
/*!40000 ALTER TABLE `remarks` DISABLE KEYS */;

INSERT INTO `remarks` (`id`, `body`, `remarkable_type`, `remarkable_id`, `creator_id`, `created_at`, `updated_at`)
VALUES
	(1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','App\\Purchase',3,NULL,'2018-07-04 15:10:35','2018-07-04 15:10:35'),
	(2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','App\\Purchase',4,NULL,'2018-07-04 15:11:14','2018-07-04 15:11:14'),
	(3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','App\\Purchase',5,NULL,'2018-07-04 15:12:47','2018-07-04 15:12:47'),
	(4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','App\\Purchase',6,NULL,'2018-07-04 15:13:02','2018-07-04 15:13:02'),
	(5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','App\\Purchase',7,NULL,'2018-07-04 15:23:17','2018-07-04 15:23:17'),
	(6,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','App\\Purchase',8,NULL,'2018-07-04 15:47:51','2018-07-04 15:47:51'),
	(7,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','App\\Purchase',9,NULL,'2018-07-04 15:57:18','2018-07-04 15:57:18');

/*!40000 ALTER TABLE `remarks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`,`scope`),
  KEY `roles_scope_index` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `title`, `level`, `scope`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'admin','System administrator',1,NULL,'Responsible for the upkeep, configuration, and reliable operation of the systems; The system administrator seeks to ensure that the uptime, performance, resources, and security of the computers they manage meet the needs of the users.','2018-07-04 13:17:17','2018-07-04 13:17:17');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `gender`, `birthday`, `password`, `country`, `remember_token`, `creator_id`, `created_at`, `updated_at`)
VALUES
	(1,'Philip','Krajcik','admin@homeverge.co.tz','782.237.3298','male','1988-08-08','$2y$10$tXiHNtM1uhCtFd.Yix9I/OFrVjverCGJUdQuh6G9gImV5ajjbi81a','Uruguay','4rmUe5IsYV',NULL,'2018-07-04 13:17:18','2018-07-04 13:17:18');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
