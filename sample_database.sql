# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: farmers
# Generation Time: 2018-07-06 15:12:58 +0000
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
	(1,'*','All abilities',NULL,'*',0,NULL,'2018-07-06 12:00:30','2018-07-06 12:00:30');

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
	(1,'Tembo St.',NULL,'Tanzania','Dar es Salaam',NULL,'App\\Farmer',1,NULL,'2018-07-06 12:03:37','2018-07-06 12:03:37'),
	(2,'Uhindini St.',NULL,'Tanzania','Morogoro',NULL,'App\\Farmer',2,NULL,'2018-07-06 12:04:20','2018-07-06 12:04:20'),
	(3,'Kasanga St.',NULL,'Tanzania','Morogoro','4565','App\\Farmer',3,NULL,'2018-07-06 12:05:28','2018-07-06 12:05:28'),
	(4,'Mji Mpya St.',NULL,'Tanzania','Dar es Salaam','11575','App\\Farmer',4,NULL,'2018-07-06 12:06:31','2018-07-06 12:06:31'),
	(5,'Mwenge St.',NULL,'Tanzania','Dar es Salaam',NULL,'App\\Farmer',5,NULL,'2018-07-06 12:07:50','2018-07-06 12:07:50'),
	(6,'Uhuru St.',NULL,'Tanzania','Ruvuma','4667','App\\Farmer',6,NULL,'2018-07-06 12:09:22','2018-07-06 12:09:22'),
	(7,'',NULL,'Tanzania','Arusha',NULL,'App\\Farm',1,NULL,'2018-07-06 13:18:04','2018-07-06 13:18:04'),
	(8,'',NULL,'Tanzania','Pwani',NULL,'App\\Farm',2,NULL,'2018-07-06 17:52:22','2018-07-06 17:52:22');

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
	(1,'App\\User',1,'created','App\\Farmer',1,'[]','{\"first_name\":\"Juma\",\"last_name\":\"Mwidadi\",\"phone\":\"0714681951\",\"email\":\"juma.mwidadi@example.com\",\"gender\":\"male\",\"creator_id\":1,\"id\":1}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:03:37','2018-07-06 12:03:37'),
	(2,'App\\User',1,'created','App\\Address',1,'[]','{\"street\":\"Tembo St.\",\"address\":null,\"state\":\"Dar es Salaam\",\"country\":\"Tanzania\",\"postal_code\":null,\"addressable_id\":1,\"addressable_type\":\"App\\\\Farmer\",\"id\":1}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:03:37','2018-07-06 12:03:37'),
	(3,'App\\User',1,'created','App\\Farmer',2,'[]','{\"first_name\":\"Magreth\",\"last_name\":\"Mayunga\",\"phone\":\"0756787800\",\"email\":null,\"gender\":\"female\",\"creator_id\":1,\"id\":2}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:04:20','2018-07-06 12:04:20'),
	(4,'App\\User',1,'created','App\\Address',2,'[]','{\"street\":\"Uhindini St.\",\"address\":null,\"state\":\"Morogoro\",\"country\":\"Tanzania\",\"postal_code\":null,\"addressable_id\":2,\"addressable_type\":\"App\\\\Farmer\",\"id\":2}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:04:20','2018-07-06 12:04:20'),
	(5,'App\\User',1,'created','App\\Farmer',3,'[]','{\"first_name\":\"Gideon\",\"last_name\":\"James\",\"phone\":\"0756789654\",\"email\":\"gideon.james@example.com\",\"gender\":\"male\",\"creator_id\":1,\"id\":3}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:05:28','2018-07-06 12:05:28'),
	(6,'App\\User',1,'created','App\\Address',3,'[]','{\"street\":\"Kasanga St.\",\"address\":null,\"state\":\"Morogoro\",\"country\":\"Tanzania\",\"postal_code\":\"4565\",\"addressable_id\":3,\"addressable_type\":\"App\\\\Farmer\",\"id\":3}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:05:28','2018-07-06 12:05:28'),
	(7,'App\\User',1,'created','App\\Farmer',4,'[]','{\"first_name\":\"David\",\"last_name\":\"Pella\",\"phone\":\"0762764819\",\"email\":\"david.pella@example.come\",\"gender\":\"male\",\"creator_id\":1,\"id\":4}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:06:31','2018-07-06 12:06:31'),
	(8,'App\\User',1,'created','App\\Address',4,'[]','{\"street\":\"Mji Mpya St.\",\"address\":null,\"state\":\"Dar es Salaam\",\"country\":\"Tanzania\",\"postal_code\":\"11575\",\"addressable_id\":4,\"addressable_type\":\"App\\\\Farmer\",\"id\":4}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:06:31','2018-07-06 12:06:31'),
	(9,'App\\User',1,'created','App\\Farmer',5,'[]','{\"first_name\":\"Denis\",\"last_name\":\"Christian\",\"phone\":\"0783855313\",\"email\":\"denis.christian@example.com\",\"gender\":\"male\",\"creator_id\":1,\"id\":5}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:07:50','2018-07-06 12:07:50'),
	(10,'App\\User',1,'created','App\\Address',5,'[]','{\"street\":\"Mwenge St.\",\"address\":null,\"state\":\"Dar es Salaam\",\"country\":\"Tanzania\",\"postal_code\":null,\"addressable_id\":5,\"addressable_type\":\"App\\\\Farmer\",\"id\":5}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:07:50','2018-07-06 12:07:50'),
	(11,'App\\User',1,'created','App\\Farmer',6,'[]','{\"first_name\":\"Juliana\",\"last_name\":\"Mussa\",\"phone\":\"0789007645\",\"email\":\"juliana.mussa@example.com\",\"gender\":\"female\",\"creator_id\":1,\"id\":6}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:09:22','2018-07-06 12:09:22'),
	(12,'App\\User',1,'created','App\\Address',6,'[]','{\"street\":\"Uhuru St.\",\"address\":null,\"state\":\"Ruvuma\",\"country\":\"Tanzania\",\"postal_code\":\"4667\",\"addressable_id\":6,\"addressable_type\":\"App\\\\Farmer\",\"id\":6}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 12:09:22','2018-07-06 12:09:22'),
	(13,'App\\User',1,'created','App\\Farm',1,'[]','{\"size\":\"10\",\"size_unit\":\"acre\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farmer_id\":4,\"id\":1}','http://farmers.test/farmers/4/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 13:18:04','2018-07-06 13:18:04'),
	(14,'App\\User',1,'created','App\\Address',7,'[]','{\"country\":\"Tanzania\",\"state\":\"Arusha\",\"addressable_id\":1,\"addressable_type\":\"App\\\\Farm\",\"id\":7}','http://farmers.test/farmers/4/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 13:18:04','2018-07-06 13:18:04'),
	(15,'App\\User',1,'created','App\\Block',1,'[]','{\"number\":\"DP3748AR\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farm_id\":1,\"id\":1}','http://farmers.test/farmers/4/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 13:18:04','2018-07-06 13:18:04'),
	(16,'App\\User',1,'created','App\\Batch',1,'[]','{\"number\":\"4563748\",\"description\":\"\",\"id\":1}','http://farmers.test/farmers/4/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 16:14:23','2018-07-06 16:14:23'),
	(17,'App\\User',1,'created','App\\Harvest',1,'[]','{\"expected_amount\":\"4500\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-13 00:00:00\",\"farm_id\":\"1\",\"block_id\":\"1\",\"product_id\":\"6\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":1,\"id\":1}','http://farmers.test/farmers/4/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 16:14:24','2018-07-06 16:14:24'),
	(18,'App\\User',1,'created','App\\Purchase',1,'[]','{\"batch_id\":1,\"product_id\":6,\"farmer_id\":\"4\",\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"450\",\"weight_before\":\"450\",\"weight_after\":null,\"creator_id\":1,\"id\":1}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:00:52','2018-07-06 17:00:52'),
	(19,'App\\User',1,'created','App\\Purchase',2,'[]','{\"batch_id\":1,\"product_id\":6,\"farmer_id\":\"4\",\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"450\",\"weight_before\":\"430\",\"weight_after\":null,\"creator_id\":1,\"id\":2}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:20:27','2018-07-06 17:20:27'),
	(20,'App\\User',1,'created','App\\Farm',2,'[]','{\"size\":\"45\",\"size_unit\":\"acre\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farmer_id\":4,\"id\":2}','http://farmers.test/farmers/4/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:52:22','2018-07-06 17:52:22'),
	(21,'App\\User',1,'created','App\\Address',8,'[]','{\"country\":\"Tanzania\",\"state\":\"Pwani\",\"addressable_id\":2,\"addressable_type\":\"App\\\\Farm\",\"id\":8}','http://farmers.test/farmers/4/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:52:22','2018-07-06 17:52:22'),
	(22,'App\\User',1,'created','App\\Block',2,'[]','{\"number\":\"475788\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farm_id\":2,\"id\":2}','http://farmers.test/farmers/4/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:52:22','2018-07-06 17:52:22'),
	(23,'App\\User',1,'created','App\\Batch',2,'[]','{\"number\":\"465758\",\"description\":\"\",\"id\":2}','http://farmers.test/farmers/4/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:53:18','2018-07-06 17:53:18'),
	(24,'App\\User',1,'created','App\\Harvest',2,'[]','{\"expected_amount\":\"4500\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-14 00:00:00\",\"farm_id\":\"2\",\"block_id\":\"2\",\"product_id\":\"6\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":2,\"id\":2}','http://farmers.test/farmers/4/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:53:18','2018-07-06 17:53:18'),
	(25,'App\\User',1,'created','App\\Batch',3,'[]','{\"number\":\"467588\",\"description\":\"\",\"id\":3}','http://farmers.test/farmers/4/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:54:01','2018-07-06 17:54:01'),
	(26,'App\\User',1,'created','App\\Harvest',3,'[]','{\"expected_amount\":\"7800\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-20 00:00:00\",\"farm_id\":\"2\",\"block_id\":\"2\",\"product_id\":\"3\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum.\",\"batch_id\":3,\"id\":3}','http://farmers.test/farmers/4/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:54:01','2018-07-06 17:54:01'),
	(27,'App\\User',1,'created','App\\Purchase',3,'[]','{\"batch_id\":2,\"product_id\":6,\"harvest_id\":2,\"farmer_id\":\"4\",\"amount\":585000,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"750\",\"weight_before\":\"670\",\"weight_after\":\"650\",\"creator_id\":1,\"id\":3}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:55:22','2018-07-06 17:55:22'),
	(28,'App\\User',1,'created','App\\Remark',1,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget.\",\"remarkable_id\":3,\"remarkable_type\":\"App\\\\Purchase\",\"id\":1}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:55:22','2018-07-06 17:55:22'),
	(29,'App\\User',1,'updated','App\\Purchase',3,'{\"status\":null}','{\"status\":\"processed\"}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:55:22','2018-07-06 17:55:22'),
	(30,'App\\User',1,'created','App\\Purchase',4,'[]','{\"batch_id\":1,\"product_id\":6,\"harvest_id\":1,\"farmer_id\":\"4\",\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"567\",\"weight_before\":\"550\",\"weight_after\":null,\"creator_id\":1,\"id\":4}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 17:59:31','2018-07-06 17:59:31'),
	(31,'App\\User',1,'created','App\\Purchase',5,'[]','{\"batch_id\":3,\"product_id\":3,\"harvest_id\":3,\"farmer_id\":\"4\",\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"890\",\"weight_before\":\"880\",\"weight_after\":null,\"creator_id\":1,\"id\":5}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-06 18:00:06','2018-07-06 18:00:06');

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
	(1,'4563748','','2018-07-06 16:14:22','2018-07-06 16:14:22'),
	(2,'465758','','2018-07-06 17:53:18','2018-07-06 17:53:18'),
	(3,'467588','','2018-07-06 17:54:01','2018-07-06 17:54:01');

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
	(1,'DP3748AR',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-06 13:18:04','2018-07-06 13:18:04'),
	(2,'475788',2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-06 17:52:22','2018-07-06 17:52:22');

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
	(1,1,6,'2018-07-06 13:18:04','2018-07-06 13:18:04'),
	(2,1,8,'2018-07-06 13:18:04','2018-07-06 13:18:04'),
	(3,1,9,'2018-07-06 13:18:04','2018-07-06 13:18:04'),
	(4,2,3,'2018-07-06 17:52:22','2018-07-06 17:52:22'),
	(5,2,1,'2018-07-06 17:52:22','2018-07-06 17:52:22'),
	(6,2,2,'2018-07-06 17:52:22','2018-07-06 17:52:22'),
	(7,2,6,'2018-07-06 17:52:22','2018-07-06 17:52:22');

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
	(1,4,1,'2018-07-06 16:14:23','2018-07-06 16:14:23'),
	(2,4,2,'2018-07-06 17:53:18','2018-07-06 17:53:18'),
	(3,4,3,'2018-07-06 17:54:01','2018-07-06 17:54:01');

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
	(1,'Juma','Mwidadi','0714681951','juma.mwidadi@example.com','male',1,'2018-07-06 12:03:37','2018-07-06 12:03:37'),
	(2,'Magreth','Mayunga','0756787800',NULL,'female',1,'2018-07-06 12:04:20','2018-07-06 12:04:20'),
	(3,'Gideon','James','0756789654','gideon.james@example.com','male',1,'2018-07-06 12:05:28','2018-07-06 12:05:28'),
	(4,'David','Pella','0762764819','david.pella@example.come','male',1,'2018-07-06 12:06:31','2018-07-06 12:06:31'),
	(5,'Denis','Christian','0783855313','denis.christian@example.com','male',1,'2018-07-06 12:07:50','2018-07-06 12:07:50'),
	(6,'Juliana','Mussa','0789007645','juliana.mussa@example.com','female',1,'2018-07-06 12:09:22','2018-07-06 12:09:22');

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
	(1,10,'acre',4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-06 13:18:04','2018-07-06 13:18:04'),
	(2,45,'acre',4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-06 17:52:22','2018-07-06 17:52:22');

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
	(1,4500,'kg','2018-07-13 00:00:00',1,1,6,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-06 16:14:24','2018-07-06 16:14:24'),
	(2,4500,'kg','2018-07-14 00:00:00',2,2,6,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-06 17:53:18','2018-07-06 17:53:18'),
	(3,7800,'kg','2018-07-20 00:00:00',2,2,3,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum.','2018-07-06 17:54:01','2018-07-06 17:54:01');

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
	(359,'2014_10_12_000000_create_users_table',1),
	(360,'2014_10_12_100000_create_password_resets_table',1),
	(361,'2018_05_12_140817_create_farmers_table',1),
	(362,'2018_05_13_060556_create_products_table',1),
	(363,'2018_05_13_061031_create_product_categories_table',1),
	(364,'2018_05_13_062152_create_product_category_table',1),
	(365,'2018_05_14_050338_create_product_prices_table',1),
	(366,'2018_05_15_083531_create_purchases_table',1),
	(367,'2018_05_15_135954_create_remarks_table',1),
	(368,'2018_05_29_183330_create_addresses_table',1),
	(369,'2018_05_30_090730_create_bouncer_tables',1),
	(370,'2018_05_30_172904_create_audits_table',1),
	(371,'2018_06_25_135944_create_farms_table',1),
	(372,'2018_06_25_142204_create_harvests_table',1),
	(373,'2018_06_25_142951_create_farm_crop_table',1),
	(374,'2018_06_25_144104_create_batches_table',1),
	(375,'2018_06_25_144622_create_farmer_batch_table',1),
	(376,'2018_06_25_153201_create_blocks_table',1);

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
	(1,'Cereals','Qui quasi doloribus officiis id.',NULL,'2018-07-06 12:00:30','2018-07-06 12:00:30'),
	(2,'Pulses','Dignissimos et dolores vitae dolorum at harum expedita.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(3,'Vegetables','Alias cum dolorem recusandae neque quia eius.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(4,'Fruits','Itaque et quos consequatur quo repellendus et.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(5,'Nuts','Culpa in praesentium qui blanditiis ut pariatur ea.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(6,'Oilseeds','Earum necessitatibus eveniet ab suscipit dolorem dicta.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(7,'Sugars and Starches','Labore eligendi illo quis aut placeat voluptas.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(8,'Fibres','Autem omnis dolor ut laboriosam harum.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(9,'Beverages','Omnis ratione reiciendis quo labore.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(10,'Narcotics','Animi eaque dolor eligendi doloremque quia et quaerat.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(11,'Spices','Cumque odit omnis ex quidem maxime.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(12,'Condiments','Quia amet ipsum in consectetur.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(13,'Rubber Forages','Distinctio ut vel dolorum iure reprehenderit non eum odit.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(14,'Green and Green leaf manure','Nostrum aut aut est est dolor eum sequi reprehenderit.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31');

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
	(1,1,1,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(2,1,2,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(3,1,3,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(4,1,4,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(5,1,5,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(6,2,6,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(7,2,7,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(8,2,8,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(9,2,9,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(10,3,10,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(11,3,11,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(12,3,12,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(13,3,13,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(14,4,14,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(15,4,15,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(16,4,16,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(17,4,17,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(18,4,18,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(19,4,19,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(20,5,20,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(21,5,21,'2018-07-06 12:00:31','2018-07-06 12:00:31');

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
	(1,700,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,1,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(2,450,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,2,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(3,750,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,3,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(4,850,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,4,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(5,650,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,5,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(6,900,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,6,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(7,650,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,7,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(8,950,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,8,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(9,950,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,9,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(10,750,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,10,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(11,700,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,11,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(12,800,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,12,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(13,600,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,13,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(14,600,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,14,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(15,850,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,15,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(16,800,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,16,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(17,850,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,17,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(18,550,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,18,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(19,750,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,19,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(20,950,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,20,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(21,750,'TZS','kg',0,'2018-07-06 12:00:31',NULL,1,21,NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31');

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
	(1,'Maize','Consequatur excepturi odit dolorem explicabo id rem.',NULL,'2018-07-06 12:00:30','2018-07-06 12:00:30'),
	(2,'Rice','Impedit ut sit natus ab eligendi est.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(3,'Wheat','Rerum dolores qui sint repellat.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(4,'Sorghum','Nulla voluptatem provident labore facere totam quidem quaerat quis.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(5,'Barley','Sunt omnis et sit aliquam.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(6,'Kidney bean','Rem enim non ducimus delectus rem.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(7,'Lima bean','Esse consequatur voluptas eius sunt ex provident.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(8,'Horse bean','Optio quasi ad sed voluptatem.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(9,'Garden pea','Eos quia praesentium facere.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(10,'Mchicha','Modi dicta doloribus iste at inventore harum vero.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(11,'Tembele','Nihil illum quo doloremque suscipit aut incidunt.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(12,'Kabichi','Praesentium saepe ipsum sed architecto quo fugit qui.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(13,'Kisanvu','Enim beatae sit fugiat est et eum sed.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(14,'Chungwa','Omnis voluptatem ab soluta cum ut temporibus.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(15,'Embe','Et dignissimos blanditiis eligendi dolore.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(16,'Ndizi','Veritatis hic magni cum maxime.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(17,'Tango','Tenetur ea quas eum.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(18,'Tikiti','Itaque quas impedit nobis qui et nesciunt laudantium consequatur.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(19,'Zabibu','Rerum cumque doloribus sit nulla.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(20,'Karanga','Sed et pariatur laboriosam et accusantium occaecati atque.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31'),
	(21,'Korosho','Quia ipsa delectus accusantium quas ad quia qui.',NULL,'2018-07-06 12:00:31','2018-07-06 12:00:31');

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
  `harvest_id` int(10) unsigned DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;

INSERT INTO `purchases` (`id`, `field_weight`, `weight_before`, `weight_after`, `weight_unit`, `amount`, `currency`, `status`, `product_id`, `batch_id`, `farmer_id`, `harvest_id`, `paid_at`, `creator_id`, `created_at`, `updated_at`)
VALUES
	(1,450,450,NULL,'kg',NULL,'TZS','received',6,1,4,1,NULL,1,'2018-07-06 17:00:52','2018-07-06 17:00:52'),
	(2,450,430,NULL,'kg',NULL,'TZS','received',6,1,4,1,NULL,1,'2018-07-06 17:20:27','2018-07-06 17:20:27'),
	(3,750,670,650,'kg',585000,'TZS','processed',6,2,4,2,NULL,1,'2018-07-06 17:55:21','2018-07-06 17:55:22'),
	(4,567,550,NULL,'kg',NULL,'TZS','received',6,1,4,1,NULL,1,'2018-07-06 17:59:31','2018-07-06 17:59:31'),
	(5,890,880,NULL,'kg',NULL,'TZS','received',3,3,4,3,NULL,1,'2018-07-06 18:00:06','2018-07-06 18:00:06');

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
	(1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in tellus interdum eros vulputate placerat sed non enim. Pellentesque eget.','App\\Purchase',3,NULL,'2018-07-06 17:55:22','2018-07-06 17:55:22');

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
	(1,'admin','System administrator',1,NULL,'Responsible for the upkeep, configuration, and reliable operation of the systems; The system administrator seeks to ensure that the uptime, performance, resources, and security of the computers they manage meet the needs of the users.','2018-07-06 12:00:30','2018-07-06 12:00:30');

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
	(1,'Evans','Rolfson','admin@homeverge.co.tz','921-297-6290','female','1988-08-08','$2y$10$4wIS/bi3ZosjCEYi0PtmD.mX2JyLNmwDC0a1TPeWrBYhu/O47dDr2','Isle of Man','8yVSwJ7raS',NULL,'2018-07-06 12:00:30','2018-07-06 12:00:30');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
