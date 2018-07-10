# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: farmers
# Generation Time: 2018-07-10 08:01:47 +0000
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
	(1,'*','All abilities',NULL,'*',0,NULL,'2018-07-07 17:17:53','2018-07-07 17:17:53');

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
	(1,'Mji Mpya St.',NULL,'Tanzania','Dar es Salaam','36476','App\\Farmer',1,NULL,'2018-07-07 17:21:45','2018-07-07 17:21:45'),
	(2,'Mwenge St.',NULL,'Tanzania','Dar es Salaam',NULL,'App\\Farmer',2,NULL,'2018-07-07 18:04:03','2018-07-07 18:04:03'),
	(3,'',NULL,'Tanzania','Arusha',NULL,'App\\Farm',1,NULL,'2018-07-07 18:08:07','2018-07-07 18:08:07'),
	(4,'',NULL,'Tanzania','Pwani',NULL,'App\\Farm',2,NULL,'2018-07-07 20:33:44','2018-07-07 20:33:44'),
	(5,'',NULL,'Tanzania','Kagera',NULL,'App\\Farm',3,NULL,'2018-07-09 07:52:40','2018-07-09 07:52:40'),
	(6,'76799 Flatley Land','6399 Herzog Avenue\nNew Antonio, KY 49909','Puerto Rico','Georgia','13127-3549','App\\Farmer',103,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(7,'68373 Jarrod Shore','30242 Padberg Crescent Suite 066\nReillychester, MD 03531','Namibia','District of Columbia','78742-1649','App\\Farm',4,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(8,'1889 Wolff Mews','803 Domenic Common\nMorarland, CA 01388-8696','Mauritania','Colorado','96121-1900','App\\Farmer',104,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(9,'93356 Wuckert Unions Apt. 869','227 Richmond Creek Suite 101\nStoltenbergstad, TX 50287','Kyrgyz Republic','Ohio','54821','App\\Farm',5,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(10,'61779 Annamae Shores Suite 172','9630 Rosie Fields\nSalmaside, AR 11142','Vietnam','Tennessee','43835','App\\Farmer',105,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(11,'661 Ignatius Squares Suite 356','2564 Jenifer Pass Suite 564\nNorth Helgafurt, MN 10615','South Africa','North Carolina','27826-0455','App\\Farm',6,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(12,'636 Senger Pines','896 Gleason Mount Apt. 235\nEast Vernon, DE 66518','Isle of Man','Arizona','90364','App\\Farmer',106,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(13,'9001 Edyth Dale Apt. 246','4855 Bernhard Row\nRomagueraborough, KY 90013','Lao People\'s Democratic Republic','Maine','90905','App\\Farm',7,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(14,'669 Ronaldo Trace','4857 Aliza Freeway Suite 601\nLake Judson, NV 84227-7636','Russian Federation','New York','10747','App\\Farmer',107,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(15,'32434 Prosacco Drive Suite 159','41682 Adelia Stream Suite 183\nElodystad, KS 65272-9114','Liechtenstein','Oregon','34906','App\\Farm',8,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(16,'63813 Langosh Glens Apt. 408','89358 VonRueden Common\nBechtelarshire, AZ 36911','Turkmenistan','Delaware','80602-3881','App\\Farmer',108,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(17,'4023 Leta Valley Suite 816','2331 Bergstrom Forks\nStrosinmouth, AZ 02405','Tajikistan','Michigan','45849','App\\Farm',9,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(18,'32269 Kerluke Expressway','2626 Abernathy Dale\nConsidineland, MO 81010','Timor-Leste','South Dakota','43319','App\\Farmer',109,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(19,'50929 Kling Forks','5237 Rickie Bridge\nPredovicchester, ID 93554-2465','Guinea-Bissau','Maine','42341','App\\Farm',10,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(20,'606 Zieme Villages Suite 421','363 Liza Trafficway Apt. 305\nSouth Oriechester, UT 77709','Sri Lanka','Colorado','56638-5212','App\\Farmer',110,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(21,'869 Waters Pike','4762 Jenkins Grove\nWest Jaida, RI 48197','Venezuela','Virginia','91223','App\\Farm',11,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(22,'62442 Reilly Trail','66092 Yvette Junctions\nPort Nikki, WA 87624','Holy See (Vatican City State)','Idaho','13784-4888','App\\Farmer',111,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(23,'977 Zboncak Extensions','7002 Feil Plains\nSipeschester, OH 68968','Dominica','Alaska','27838-1466','App\\Farm',12,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(24,'3019 Koby Glens','67112 Greenfelder Run Suite 728\nNew Loraineberg, SC 99399','San Marino','Hawaii','98970-1412','App\\Farmer',112,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(25,'1918 Savanah Ramp Suite 308','22099 Kub Cliffs\nSouth Emely, PA 46818','Hong Kong','Iowa','95811-3449','App\\Farm',13,NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04');

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
	(1,'App\\User',1,'created','App\\Farmer',1,'[]','{\"first_name\":\"David\",\"last_name\":\"Pella\",\"phone\":\"0762764819\",\"email\":\"david.pella@example.com\",\"gender\":\"male\",\"creator_id\":1,\"id\":1}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 17:21:45','2018-07-07 17:21:45'),
	(2,'App\\User',1,'created','App\\Address',1,'[]','{\"street\":\"Mji Mpya St.\",\"address\":null,\"state\":\"Dar es Salaam\",\"country\":\"Tanzania\",\"postal_code\":\"36476\",\"addressable_id\":1,\"addressable_type\":\"App\\\\Farmer\",\"id\":1}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 17:21:45','2018-07-07 17:21:45'),
	(3,'App\\User',1,'created','App\\Batch',1,'[]','{\"number\":\"IWXA-622\",\"valid_from\":\"2018-07-07 00:00:00\",\"valid_till\":\"2018-07-28 00:00:00\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"max_count\":\"10\",\"id\":1}','http://farmers.test/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 17:22:42','2018-07-07 17:22:42'),
	(4,'App\\User',1,'created','App\\Farmer',2,'[]','{\"first_name\":\"Denis\",\"last_name\":\"Christian\",\"phone\":\"0783855313\",\"email\":\"denis.christian@example.com\",\"gender\":\"male\",\"creator_id\":1,\"id\":2}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 18:04:03','2018-07-07 18:04:03'),
	(5,'App\\User',1,'created','App\\Address',2,'[]','{\"street\":\"Mwenge St.\",\"address\":null,\"state\":\"Dar es Salaam\",\"country\":\"Tanzania\",\"postal_code\":null,\"addressable_id\":2,\"addressable_type\":\"App\\\\Farmer\",\"id\":2}','http://farmers.test/farmers?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 18:04:03','2018-07-07 18:04:03'),
	(6,'App\\User',1,'created','App\\Farm',1,'[]','{\"size\":\"5\",\"size_unit\":\"acre\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farmer_id\":2,\"id\":1}','http://farmers.test/farmers/2/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 18:08:07','2018-07-07 18:08:07'),
	(7,'App\\User',1,'created','App\\Address',3,'[]','{\"country\":\"Tanzania\",\"state\":\"Arusha\",\"addressable_id\":1,\"addressable_type\":\"App\\\\Farm\",\"id\":3}','http://farmers.test/farmers/2/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 18:08:07','2018-07-07 18:08:07'),
	(8,'App\\User',1,'created','App\\Block',1,'[]','{\"number\":\"485HJD\",\"size\":\"10\",\"size_unit\":\"acre\",\"farm_id\":\"1\",\"product_id\":\"6\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"id\":1}','http://farmers.test/farmers/2/blocks?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 19:07:18','2018-07-07 19:07:18'),
	(9,'App\\User',1,'created','App\\Block',2,'[]','{\"number\":\"356747\",\"size\":\"2\",\"size_unit\":\"acre\",\"farm_id\":\"1\",\"product_id\":\"4\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"id\":2}','http://farmers.test/farmers/2/blocks?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 19:16:30','2018-07-07 19:16:30'),
	(10,'App\\User',1,'created','App\\Batch',2,'[]','{\"number\":\"7BIL-362\",\"valid_from\":\"2018-07-07 00:00:00\",\"valid_till\":\"2018-07-31 00:00:00\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"max_count\":\"10\",\"id\":2}','http://farmers.test/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 19:26:26','2018-07-07 19:26:26'),
	(11,'App\\User',1,'created','App\\Harvest',1,'[]','{\"expected_amount\":\"4500\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-14 00:00:00\",\"block_id\":\"1\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"2\",\"id\":1}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 19:32:31','2018-07-07 19:32:31'),
	(12,'App\\User',1,'created','App\\Harvest',2,'[]','{\"expected_amount\":\"6000\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-21 00:00:00\",\"block_id\":\"2\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"2\",\"id\":2}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 19:52:18','2018-07-07 19:52:18'),
	(13,'App\\User',1,'updated','App\\Harvest',2,'{\"farmer_id\":null}','{\"farmer_id\":2}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 19:52:18','2018-07-07 19:52:18'),
	(14,'App\\User',1,'created','App\\Purchase',1,'[]','{\"batch_id\":2,\"product_id\":6,\"harvest_id\":1,\"farmer_id\":2,\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"450\",\"creator_id\":1,\"id\":1}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:13:29','2018-07-07 20:13:29'),
	(15,'App\\User',1,'created','App\\Remark',1,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"remarkable_id\":1,\"remarkable_type\":\"App\\\\Purchase\",\"id\":1}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:13:29','2018-07-07 20:13:29'),
	(16,'App\\User',1,'created','App\\Purchase',2,'[]','{\"batch_id\":2,\"product_id\":6,\"harvest_id\":1,\"farmer_id\":2,\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"670\",\"creator_id\":1,\"id\":2}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:15:09','2018-07-07 20:15:09'),
	(17,'App\\User',1,'created','App\\Remark',2,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"remarkable_id\":2,\"remarkable_type\":\"App\\\\Purchase\",\"id\":2}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:15:09','2018-07-07 20:15:09'),
	(18,'App\\User',1,'created','App\\Farm',2,'[]','{\"size\":\"8\",\"size_unit\":\"acre\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farmer_id\":1,\"id\":2}','http://farmers.test/farmers/1/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:33:44','2018-07-07 20:33:44'),
	(19,'App\\User',1,'created','App\\Address',4,'[]','{\"country\":\"Tanzania\",\"state\":\"Pwani\",\"addressable_id\":2,\"addressable_type\":\"App\\\\Farm\",\"id\":4}','http://farmers.test/farmers/1/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:33:44','2018-07-07 20:33:44'),
	(20,'App\\User',1,'created','App\\Block',3,'[]','{\"number\":\"456JHG\",\"size\":\"2\",\"size_unit\":\"acre\",\"farm_id\":\"2\",\"product_id\":\"9\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"id\":3}','http://farmers.test/farmers/1/blocks?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:34:29','2018-07-07 20:34:29'),
	(21,'App\\User',1,'created','App\\Harvest',3,'[]','{\"expected_amount\":\"4500\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-21 00:00:00\",\"block_id\":\"3\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"1\",\"id\":3}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:35:01','2018-07-07 20:35:01'),
	(22,'App\\User',1,'updated','App\\Harvest',3,'{\"farmer_id\":null}','{\"farmer_id\":1}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:35:01','2018-07-07 20:35:01'),
	(23,'App\\User',1,'created','App\\Purchase',3,'[]','{\"batch_id\":1,\"product_id\":9,\"harvest_id\":3,\"farmer_id\":1,\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"780\",\"creator_id\":1,\"id\":3}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:35:23','2018-07-07 20:35:23'),
	(24,'App\\User',1,'created','App\\Remark',3,'[]','{\"body\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"remarkable_id\":3,\"remarkable_type\":\"App\\\\Purchase\",\"id\":3}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-07 20:35:23','2018-07-07 20:35:23'),
	(25,'App\\User',1,'created','App\\Harvest',4,'[]','{\"expected_amount\":\"78600\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-20 00:00:00\",\"block_id\":\"1\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"2\",\"id\":4}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 20:18:30','2018-07-08 20:18:30'),
	(26,'App\\User',1,'updated','App\\Harvest',4,'{\"farmer_id\":null}','{\"farmer_id\":2}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 20:18:30','2018-07-08 20:18:30'),
	(27,'App\\User',1,'created','App\\Harvest',5,'[]','{\"expected_amount\":\"4500\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-14 00:00:00\",\"block_id\":\"3\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"2\",\"id\":5}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 21:27:39','2018-07-08 21:27:39'),
	(28,'App\\User',1,'updated','App\\Harvest',5,'{\"farmer_id\":null}','{\"farmer_id\":1}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 21:27:39','2018-07-08 21:27:39'),
	(29,'App\\User',1,'created','App\\Batch',3,'[]','{\"number\":\"BN0M-439\",\"valid_from\":\"2018-07-08 00:00:00\",\"valid_till\":\"2018-07-31 00:00:00\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"max_count\":\"10\",\"id\":3}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 21:40:42','2018-07-08 21:40:42'),
	(30,'App\\User',1,'created','App\\Harvest',6,'[]','{\"expected_amount\":\"45600\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-18 00:00:00\",\"block_id\":\"3\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"3\",\"id\":6}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 21:41:33','2018-07-08 21:41:33'),
	(31,'App\\User',1,'updated','App\\Harvest',6,'{\"farmer_id\":null}','{\"farmer_id\":1}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 21:41:33','2018-07-08 21:41:33'),
	(32,'App\\User',1,'created','App\\Harvest',7,'[]','{\"expected_amount\":\"5600\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-14 00:00:00\",\"block_id\":\"1\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"3\",\"id\":7}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 21:43:02','2018-07-08 21:43:02'),
	(33,'App\\User',1,'updated','App\\Harvest',7,'{\"farmer_id\":null}','{\"farmer_id\":2}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 21:43:02','2018-07-08 21:43:02'),
	(34,'App\\User',1,'created','App\\Harvest',8,'[]','{\"expected_amount\":\"4500\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-26 00:00:00\",\"block_id\":\"2\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"3\",\"id\":8}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 21:45:05','2018-07-08 21:45:05'),
	(35,'App\\User',1,'updated','App\\Harvest',8,'{\"farmer_id\":null}','{\"farmer_id\":2}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 21:45:05','2018-07-08 21:45:05'),
	(36,'App\\User',1,'created','App\\Batch',4,'[]','{\"number\":\"XNM6-363\",\"valid_from\":\"2018-07-12 00:00:00\",\"valid_till\":\"2018-07-20 00:00:00\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"max_count\":\"10\",\"id\":4}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 22:01:38','2018-07-08 22:01:38'),
	(37,'App\\User',1,'created','App\\Batch',5,'[]','{\"number\":\"DARR-442\",\"valid_from\":\"2018-07-08 00:00:00\",\"valid_till\":\"2018-07-31 00:00:00\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"max_count\":\"2\",\"id\":5}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 22:02:37','2018-07-08 22:02:37'),
	(38,'App\\User',1,'created','App\\Batch',6,'[]','{\"number\":\"IL1T-105\",\"valid_from\":\"2018-07-20 00:00:00\",\"valid_till\":\"2018-08-03 00:00:00\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"max_count\":\"2\",\"id\":6}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 22:04:20','2018-07-08 22:04:20'),
	(39,'App\\User',1,'updated','App\\Batch',6,'{\"status\":null}','{\"status\":\"status\"}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 22:04:20','2018-07-08 22:04:20'),
	(40,'App\\User',1,'created','App\\Batch',7,'[]','{\"number\":\"Z2N6-735\",\"valid_from\":\"2018-07-08 00:00:00\",\"valid_till\":\"2018-07-31 00:00:00\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"max_count\":\"2\",\"id\":7}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 22:05:30','2018-07-08 22:05:30'),
	(41,'App\\User',1,'updated','App\\Batch',7,'{\"status\":null}','{\"status\":\"active\"}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 22:05:30','2018-07-08 22:05:30'),
	(42,'App\\User',1,'created','App\\Batch',8,'[]','{\"number\":\"7JGH-567\",\"valid_from\":\"2018-07-08 00:00:00\",\"valid_till\":\"2018-07-31 00:00:00\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"max_count\":\"10\",\"id\":8}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 22:09:03','2018-07-08 22:09:03'),
	(43,'App\\User',1,'created','App\\Harvest',9,'[]','{\"expected_amount\":\"45600\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-18 00:00:00\",\"block_id\":\"3\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum.\",\"batch_id\":\"5\",\"id\":9}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 22:11:21','2018-07-08 22:11:21'),
	(44,'App\\User',1,'updated','App\\Harvest',9,'{\"farmer_id\":null}','{\"farmer_id\":1}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-08 22:11:21','2018-07-08 22:11:21'),
	(45,'App\\User',1,'created','App\\Farm',3,'[]','{\"size\":\"7\",\"size_unit\":\"acre\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"farmer_id\":3,\"id\":3}','http://farmers.test/farmers/3/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 07:52:40','2018-07-09 07:52:40'),
	(46,'App\\User',1,'created','App\\Address',5,'[]','{\"country\":\"Tanzania\",\"state\":\"Kagera\",\"addressable_id\":3,\"addressable_type\":\"App\\\\Farm\",\"id\":5}','http://farmers.test/farmers/3/farms?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 07:52:40','2018-07-09 07:52:40'),
	(47,'App\\User',1,'created','App\\Batch',9,'[]','{\"number\":\"R4WI-448\",\"valid_from\":\"2018-07-09 00:00:00\",\"valid_till\":\"2018-07-31 00:00:00\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"max_count\":\"10\",\"id\":9}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(48,'App\\User',1,'updated','App\\Batch',9,'{\"status\":null}','{\"status\":\"active\"}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(49,'App\\User',1,'created','App\\Harvest',10,'[]','{\"expected_amount\":\"3200\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-14 00:00:00\",\"block_id\":\"3\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"9\",\"id\":10}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 08:54:34','2018-07-09 08:54:34'),
	(50,'App\\User',1,'updated','App\\Harvest',10,'{\"farmer_id\":null}','{\"farmer_id\":1}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 08:54:34','2018-07-09 08:54:34'),
	(51,'App\\User',1,'created','App\\Harvest',11,'[]','{\"expected_amount\":\"67500\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-26 00:00:00\",\"block_id\":\"1\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"9\",\"id\":11}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 09:26:53','2018-07-09 09:26:53'),
	(52,'App\\User',1,'updated','App\\Harvest',11,'{\"farmer_id\":null}','{\"farmer_id\":2}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 09:26:53','2018-07-09 09:26:53'),
	(53,'App\\User',1,'created','App\\Harvest',12,'[]','{\"expected_amount\":\"12000\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-19 00:00:00\",\"block_id\":\"8\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"9\",\"id\":12}','http://farmers.test/farmers/107/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 09:28:10','2018-07-09 09:28:10'),
	(54,'App\\User',1,'updated','App\\Harvest',12,'{\"farmer_id\":null}','{\"farmer_id\":107}','http://farmers.test/farmers/107/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 09:28:10','2018-07-09 09:28:10'),
	(55,'App\\User',1,'created','App\\Purchase',4,'[]','{\"batch_id\":9,\"product_id\":11,\"harvest_id\":12,\"farmer_id\":107,\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"375\",\"creator_id\":1,\"id\":4}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 10:01:54','2018-07-09 10:01:54'),
	(56,'App\\User',1,'created','App\\Purchase',5,'[]','{\"batch_id\":9,\"product_id\":9,\"harvest_id\":10,\"farmer_id\":1,\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"560\",\"creator_id\":1,\"id\":5}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 10:16:15','2018-07-09 10:16:15'),
	(57,'App\\User',1,'created','App\\Harvest',13,'[]','{\"expected_amount\":\"54500\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-14 00:00:00\",\"block_id\":\"9\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"9\",\"id\":13}','http://farmers.test/farmers/108/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 10:36:21','2018-07-09 10:36:21'),
	(58,'App\\User',1,'updated','App\\Harvest',13,'{\"farmer_id\":null}','{\"farmer_id\":108}','http://farmers.test/farmers/108/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 10:36:21','2018-07-09 10:36:21'),
	(59,'App\\User',1,'created','App\\Harvest',14,'[]','{\"expected_amount\":\"2500\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-26 00:00:00\",\"block_id\":\"10\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"9\",\"id\":14}','http://farmers.test/farmers/109/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 10:37:14','2018-07-09 10:37:14'),
	(60,'App\\User',1,'updated','App\\Harvest',14,'{\"farmer_id\":null}','{\"farmer_id\":109}','http://farmers.test/farmers/109/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 10:37:14','2018-07-09 10:37:14'),
	(61,'App\\User',1,'created','App\\Harvest',15,'[]','{\"expected_amount\":\"5600\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-08-04 00:00:00\",\"block_id\":\"6\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh.\",\"batch_id\":\"9\",\"id\":15}','http://farmers.test/farmers/105/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 10:38:11','2018-07-09 10:38:11'),
	(62,'App\\User',1,'updated','App\\Harvest',15,'{\"farmer_id\":null}','{\"farmer_id\":105}','http://farmers.test/farmers/105/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 10:38:11','2018-07-09 10:38:11'),
	(63,'App\\User',1,'created','App\\Purchase',6,'[]','{\"batch_id\":9,\"product_id\":6,\"harvest_id\":11,\"farmer_id\":2,\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"985\",\"creator_id\":1,\"id\":6}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 10:38:55','2018-07-09 10:38:55'),
	(64,'App\\User',1,'updated','App\\Purchase',5,'{\"weight_before\":null,\"status\":\"received\"}','{\"weight_before\":\"460\",\"status\":\"processed\"}','http://farmers.test/purchases/5/packing_house_weight?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 22:11:46','2018-07-09 22:11:46'),
	(65,'App\\User',1,'updated','App\\Purchase',3,'{\"weight_before\":null,\"status\":\"received\"}','{\"weight_before\":\"750\",\"status\":\"processed\"}','http://farmers.test/purchases/3/packing_house_weight?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 22:17:47','2018-07-09 22:17:47'),
	(66,'App\\User',1,'updated','App\\Purchase',5,'{\"weight_after\":null,\"amount\":null,\"status\":\"processed\"}','{\"weight_after\":\"450\",\"amount\":337500,\"status\":\"completed\"}','http://farmers.test/purchases/5/graded_weight?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 22:44:05','2018-07-09 22:44:05'),
	(67,'App\\User',1,'updated','App\\Purchase',3,'{\"weight_after\":null,\"amount\":null,\"status\":\"processed\"}','{\"weight_after\":\"740\",\"amount\":555000,\"status\":\"completed\"}','http://farmers.test/purchases/3/graded_weight?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-09 22:46:41','2018-07-09 22:46:41'),
	(68,'App\\User',1,'created','App\\Batch',10,'[]','{\"number\":\"9MEC-033\",\"valid_from\":\"2018-07-10 00:00:00\",\"valid_till\":\"2018-07-31 00:00:00\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"max_count\":\"10\",\"id\":10}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(69,'App\\User',1,'updated','App\\Batch',10,'{\"status\":null}','{\"status\":\"active\"}','http://farmers.test/settings/batches?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(70,'App\\User',1,'created','App\\Harvest',16,'[]','{\"expected_amount\":\"12000\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-14 00:00:00\",\"block_id\":\"3\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"10\",\"id\":16}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:47:36','2018-07-10 08:47:36'),
	(71,'App\\User',1,'updated','App\\Harvest',16,'{\"farmer_id\":null}','{\"farmer_id\":1}','http://farmers.test/farmers/1/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:47:36','2018-07-10 08:47:36'),
	(72,'App\\User',1,'created','App\\Harvest',17,'[]','{\"expected_amount\":\"23000\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-15 00:00:00\",\"block_id\":\"9\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"10\",\"id\":17}','http://farmers.test/farmers/108/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:48:35','2018-07-10 08:48:35'),
	(73,'App\\User',1,'updated','App\\Harvest',17,'{\"farmer_id\":null}','{\"farmer_id\":108}','http://farmers.test/farmers/108/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:48:35','2018-07-10 08:48:35'),
	(74,'App\\User',1,'created','App\\Harvest',18,'[]','{\"expected_amount\":\"34500\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-16 00:00:00\",\"block_id\":\"4\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"10\",\"id\":18}','http://farmers.test/farmers/103/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:49:18','2018-07-10 08:49:18'),
	(75,'App\\User',1,'updated','App\\Harvest',18,'{\"farmer_id\":null}','{\"farmer_id\":103}','http://farmers.test/farmers/103/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:49:18','2018-07-10 08:49:18'),
	(76,'App\\User',1,'created','App\\Harvest',19,'[]','{\"expected_amount\":\"45000\",\"amount_unit\":\"kg\",\"expected_date\":\"2018-07-17 00:00:00\",\"block_id\":\"1\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.\",\"batch_id\":\"10\",\"id\":19}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:50:05','2018-07-10 08:50:05'),
	(77,'App\\User',1,'updated','App\\Harvest',19,'{\"farmer_id\":null}','{\"farmer_id\":2}','http://farmers.test/farmers/2/harvests?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:50:05','2018-07-10 08:50:05'),
	(78,'App\\User',1,'created','App\\Purchase',7,'[]','{\"batch_id\":10,\"product_id\":9,\"harvest_id\":16,\"farmer_id\":1,\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"3500\",\"creator_id\":1,\"id\":7}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:51:30','2018-07-10 08:51:30'),
	(79,'App\\User',1,'created','App\\Purchase',8,'[]','{\"batch_id\":10,\"product_id\":16,\"harvest_id\":17,\"farmer_id\":108,\"amount\":null,\"currency\":\"TZS\",\"weight_unit\":\"kg\",\"field_weight\":\"5600\",\"creator_id\":1,\"id\":8}','http://farmers.test/purchases?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:52:02','2018-07-10 08:52:02'),
	(80,'App\\User',1,'updated','App\\Purchase',8,'{\"weight_before\":null,\"status\":\"received\"}','{\"weight_before\":\"5550\",\"status\":\"packed\"}','http://farmers.test/purchases/8/packing_house_weight?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:55:54','2018-07-10 08:55:54'),
	(81,'App\\User',1,'updated','App\\Purchase',8,'{\"weight_after\":null,\"amount\":null,\"status\":\"packed\"}','{\"weight_after\":\"5500\",\"amount\":3850000,\"status\":\"graded\"}','http://farmers.test/purchases/8/graded_weight?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 08:57:44','2018-07-10 08:57:44'),
	(82,'App\\User',1,'updated','App\\Purchase',6,'{\"status\":\"received\"}','{\"status\":\"rejected\"}','http://farmers.test/purchases/6/reject?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 09:04:38','2018-07-10 09:04:38'),
	(83,'App\\User',1,'updated','App\\Purchase',7,'{\"weight_before\":null,\"status\":\"received\"}','{\"weight_before\":\"3400\",\"status\":\"packed\"}','http://farmers.test/purchases/7/packing_house_weight?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 09:06:42','2018-07-10 09:06:42'),
	(84,'App\\User',1,'updated','App\\Purchase',4,'{\"status\":\"received\"}','{\"status\":\"rejected\"}','http://farmers.test/purchases/4/rejections?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 10:39:11','2018-07-10 10:39:11'),
	(85,'App\\User',1,'updated','App\\Purchase',8,'{\"status\":\"graded\"}','{\"status\":\"completed\"}','http://farmers.test/purchases/8/completions?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 10:41:00','2018-07-10 10:41:00'),
	(86,'App\\User',1,'updated','App\\Purchase',5,'{\"paid_at\":null}','{\"paid_at\":{\"date\":\"2018-07-10 10:50:02.859926\",\"timezone_type\":3,\"timezone\":\"Africa\\/Dar_es_Salaam\"}}','http://farmers.test/purchases/5/payment_completions?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 10:50:02','2018-07-10 10:50:02'),
	(87,'App\\User',1,'updated','App\\Purchase',5,'{\"status\":\"completed\",\"paid_at\":\"2018-07-10 10:50:02\"}','{\"status\":\"paid\",\"paid_at\":{\"date\":\"2018-07-10 10:51:03.163495\",\"timezone_type\":3,\"timezone\":\"Africa\\/Dar_es_Salaam\"}}','http://farmers.test/purchases/5/payment_completions?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 10:51:03','2018-07-10 10:51:03'),
	(88,'App\\User',1,'updated','App\\Purchase',1,'{\"weight_before\":null,\"status\":\"received\"}','{\"weight_before\":\"440\",\"status\":\"packed\"}','http://farmers.test/purchases/1/packing_house_weight?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 10:51:39','2018-07-10 10:51:39'),
	(89,'App\\User',1,'updated','App\\Purchase',1,'{\"weight_after\":null,\"amount\":null,\"status\":\"packed\"}','{\"weight_after\":\"430\",\"amount\":322500,\"status\":\"graded\"}','http://farmers.test/purchases/1/graded_weight?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 10:51:56','2018-07-10 10:51:56'),
	(90,'App\\User',1,'updated','App\\Purchase',1,'{\"status\":\"graded\"}','{\"status\":\"completed\"}','http://farmers.test/purchases/1/completions?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 10:52:12','2018-07-10 10:52:12'),
	(91,'App\\User',1,'updated','App\\Purchase',1,'{\"status\":\"completed\",\"paid_at\":null}','{\"status\":\"paid\",\"paid_at\":{\"date\":\"2018-07-10 10:52:20.632401\",\"timezone_type\":3,\"timezone\":\"Africa\\/Dar_es_Salaam\"}}','http://farmers.test/purchases/1/payment_completions?','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36',NULL,'2018-07-10 10:52:20','2018-07-10 10:52:20');

/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table batches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `batches`;

CREATE TABLE `batches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_count` int(11) NOT NULL,
  `valid_from` timestamp NULL DEFAULT NULL,
  `valid_till` timestamp NULL DEFAULT NULL,
  `status` enum('open','active','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `batches` WRITE;
/*!40000 ALTER TABLE `batches` DISABLE KEYS */;

INSERT INTO `batches` (`id`, `number`, `max_count`, `valid_from`, `valid_till`, `status`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'IWXA-622',10,'2018-07-07 00:00:00','2018-07-28 00:00:00','open','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-07 17:22:42','2018-07-07 17:22:42'),
	(2,'7BIL-362',10,'2018-07-07 00:00:00','2018-07-31 00:00:00','open','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-07 19:26:26','2018-07-07 19:26:26'),
	(3,'BN0M-439',10,'2018-07-08 00:00:00','2018-07-31 00:00:00','open','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 21:40:42','2018-07-08 21:40:42'),
	(4,'XNM6-363',10,'2018-07-12 00:00:00','2018-07-20 00:00:00','open','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 22:01:38','2018-07-08 22:01:38'),
	(5,'DARR-442',2,'2018-07-08 00:00:00','2018-07-31 00:00:00','open','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 22:02:37','2018-07-08 22:02:37'),
	(6,'IL1T-105',2,'2018-07-20 00:00:00','2018-08-03 00:00:00','active','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 22:04:20','2018-07-08 22:04:20'),
	(7,'Z2N6-735',2,'2018-07-08 00:00:00','2018-07-31 00:00:00','active','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 22:05:30','2018-07-08 22:05:30'),
	(8,'7JGH-567',10,'2018-07-08 00:00:00','2018-07-31 00:00:00','open','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 22:09:03','2018-07-08 22:09:03'),
	(9,'R4WI-448',10,'2018-07-09 00:00:00','2018-07-31 00:00:00','active','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(10,'9MEC-033',10,'2018-07-10 00:00:00','2018-07-31 00:00:00','active','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-10 08:46:49','2018-07-10 08:46:49');

/*!40000 ALTER TABLE `batches` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table blocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blocks`;

CREATE TABLE `blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` double DEFAULT NULL,
  `size_unit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `farm_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;

INSERT INTO `blocks` (`id`, `number`, `size`, `size_unit`, `farm_id`, `product_id`, `description`, `created_at`, `updated_at`, `status`)
VALUES
	(1,'485HJD',10,'acre',1,6,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-07 19:07:18','2018-07-07 19:07:18','Active'),
	(2,'356747',2,'acre',1,4,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-07 19:16:30','2018-07-07 19:16:30','Active'),
	(3,'456JHG',2,'acre',2,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-07 20:34:29','2018-07-07 20:34:29','Active'),
	(4,'HUYAR',8,'acre',4,16,'Aut nihil asperiores ut laudantium.','2018-07-09 08:25:05','2018-07-09 08:25:05','Active'),
	(5,'TZOOA',9,'acre',5,8,'Earum eius perferendis quo fuga quo odio sunt.','2018-07-09 08:25:05','2018-07-09 08:25:05','Active'),
	(6,'WJHER',2,'acre',6,13,'Ducimus libero et quis recusandae.','2018-07-09 08:25:05','2018-07-09 08:25:05','Active'),
	(7,'PT7M2',1,'acre',7,10,'Nisi autem id deleniti error omnis.','2018-07-09 08:25:05','2018-07-09 08:25:05','Active'),
	(8,'HBWQL',8,'acre',8,11,'Blanditiis facere aliquid velit est tempore qui eius earum.','2018-07-09 08:25:05','2018-07-09 08:25:05','Active'),
	(9,'TOU6K',3,'acre',9,16,'Recusandae et harum aliquam deleniti eos nobis est.','2018-07-09 08:25:05','2018-07-09 08:25:05','Active'),
	(10,'PS5DW',5,'acre',10,21,'Labore inventore velit vero harum.','2018-07-09 08:25:05','2018-07-09 08:25:05','Active'),
	(11,'KINVG',6,'acre',11,19,'Officia officiis culpa praesentium sed quia consequatur similique.','2018-07-09 08:25:05','2018-07-09 08:25:05','Active'),
	(12,'WABF7',4,'acre',12,11,'Ex voluptas delectus qui aliquid est et non.','2018-07-09 08:25:05','2018-07-09 08:25:05','Active'),
	(13,'K5FVK',8,'acre',13,8,'Ut ex error magni officiis quia rerum.','2018-07-09 08:25:05','2018-07-09 08:25:05','Active');

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
	(1,1,1,'2018-07-07 17:22:42','2018-07-07 17:22:42'),
	(2,1,2,'2018-07-07 19:26:26','2018-07-07 19:26:26'),
	(3,2,2,'2018-07-07 19:26:26','2018-07-07 19:26:26'),
	(4,1,3,'2018-07-08 21:40:42','2018-07-08 21:40:42'),
	(5,2,3,'2018-07-08 21:40:42','2018-07-08 21:40:42'),
	(6,1,4,'2018-07-08 22:01:38','2018-07-08 22:01:38'),
	(7,2,4,'2018-07-08 22:01:38','2018-07-08 22:01:38'),
	(8,1,5,'2018-07-08 22:02:37','2018-07-08 22:02:37'),
	(9,2,5,'2018-07-08 22:02:37','2018-07-08 22:02:37'),
	(10,2,6,'2018-07-08 22:04:20','2018-07-08 22:04:20'),
	(11,1,6,'2018-07-08 22:04:20','2018-07-08 22:04:20'),
	(12,1,7,'2018-07-08 22:05:30','2018-07-08 22:05:30'),
	(13,2,7,'2018-07-08 22:05:30','2018-07-08 22:05:30'),
	(14,1,8,'2018-07-08 22:09:03','2018-07-08 22:09:03'),
	(15,1,9,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(16,2,9,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(17,108,9,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(18,109,9,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(19,105,9,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(20,112,9,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(21,3,9,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(22,107,9,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(23,103,9,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(24,110,9,'2018-07-09 08:30:48','2018-07-09 08:30:48'),
	(25,1,10,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(26,108,10,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(27,103,10,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(28,2,10,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(29,3,10,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(30,104,10,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(31,105,10,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(32,109,10,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(33,111,10,'2018-07-10 08:46:49','2018-07-10 08:46:49'),
	(34,112,10,'2018-07-10 08:46:49','2018-07-10 08:46:49');

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
	(1,'David','Pella','0762764819','david.pella@example.com','male',1,'2018-07-07 17:21:45','2018-07-07 17:21:45'),
	(2,'Denis','Christian','0783855313','denis.christian@example.com','male',1,'2018-07-07 18:04:03','2018-07-07 18:04:03'),
	(3,'Dejah','Lindgren','(313) 384-4322 x000','leonard64@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(4,'Jaron','Connelly','253.974.9049 x696','tstreich@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(5,'Bennie','Carter','+1 (483) 485-9915','heathcote.laurel@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(6,'Sedrick','Keeling','874.782.6541 x45078','dimitri24@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(7,'Everett','Veum','(691) 705-6182 x3805','genoveva.schumm@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(8,'Freeman','Batz','818.891.7844 x7831','sromaguera@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(9,'Jenifer','O\'Connell','1-994-540-2343','mhettinger@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(10,'Haven','Marks','1-427-502-8610 x0497','grady.adrain@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(11,'Winifred','Weissnat','1-743-807-0756 x508','patricia.luettgen@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(12,'Astrid','Block','885-378-0183 x90178','angie.kreiger@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(13,'Cassandre','Ondricka','(656) 745-8088 x73983','arch19@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(14,'Darwin','Adams','780.917.0852 x4833','grady.jodie@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(15,'Wayne','Kuphal','(887) 559-8096','kmurray@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(16,'Lisette','Ruecker','(764) 802-2024','adele40@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(17,'Gaylord','Jerde','1-235-309-1222','herman.laurence@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(18,'Jordane','Carroll','(430) 572-5588 x4385','ferry.marcos@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(19,'Matteo','McCullough','898.493.1401','crooks.hilbert@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(20,'Tracey','Bogisich','(749) 343-8909 x9841','ipaucek@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(21,'Berry','Schiller','1-946-827-7030','awolf@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(22,'Lucas','Zulauf','341-341-9498','harmony06@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(23,'Deon','Stark','981-567-4231','christiansen.nannie@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(24,'Rudy','DuBuque','821.505.4554 x2691','maximo.kshlerin@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(25,'Kathryne','Hoeger','549-760-3849 x96001','braulio52@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(26,'Horace','Kozey','841.306.2083 x71391','bonnie33@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(27,'Brad','Kling','+1-526-325-9555','leonora.ferry@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(28,'Mireya','Parker','243-714-8708 x540','mjacobs@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(29,'Erik','Champlin','224-463-2222 x2038','cremin.lyric@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(30,'Amira','Swaniawski','609-346-5572 x03056','maggio.vesta@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(31,'Crystel','Bogisich','(276) 932-0209 x87632','kenna.ruecker@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(32,'Emil','Flatley','417-333-0510 x9151','zwisoky@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(33,'Alisa','Abernathy','536-562-2081 x782','morar.brittany@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(34,'Amelia','Lowe','737.297.2126 x681','zpaucek@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(35,'Jennings','Marks','696.543.8826','joseph.gerhold@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(36,'Jennifer','Hodkiewicz','+1-379-439-3437','hnolan@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(37,'Marlen','Treutel','(917) 977-1100 x54180','jones.lulu@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(38,'Larissa','McClure','417-981-0188','willms.jana@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(39,'Helga','O\'Kon','356-461-7252','violette.hessel@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(40,'Brandt','Stiedemann','+17367186794','myrtle09@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(41,'Eladio','Cummerata','(301) 389-9952 x1271','davis.golda@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(42,'Forest','Ruecker','(798) 841-6080 x11286','jodie86@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(43,'Judd','Aufderhar','+1-652-832-4224','madaline.rolfson@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(44,'Winston','Bauch','606.957.5088 x74068','velma26@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(45,'Murray','Mueller','+1-815-742-2842','maryam.rempel@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(46,'Stan','Pagac','1-636-983-0334 x387','sylvia54@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(47,'Citlalli','Christiansen','(893) 628-4958 x4664','labadie.stephan@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(48,'Antonia','Casper','+1-985-446-5565','ugrady@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(49,'Ted','Witting','1-548-999-1947','judd.bailey@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(50,'Krystal','Rice','1-206-864-5197 x30427','cswaniawski@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(51,'Braulio','Paucek','601.402.2840 x29156','pacocha.mylene@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(52,'Mauricio','Kreiger','494.427.6229','trenton73@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(53,'Kacie','Veum','1-390-397-9859 x6332','morissette.precious@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(54,'Winnifred','Haley','575.806.9483','kelsie56@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(55,'Roy','Strosin','+1 (203) 626-7694','jerad16@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(56,'Michale','Hickle','+1.501.403.0684','marianna54@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(57,'Antonina','Howell','730.312.2253','zfeil@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(58,'Suzanne','Schulist','971.737.8253 x95587','ierdman@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(59,'Johnson','Morissette','791-279-4427 x25320','mlabadie@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(60,'Jordane','Crona','752-346-6268 x5126','welch.shany@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(61,'Frances','Cronin','(721) 966-4740 x0151','nelda91@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(62,'Julio','Johns','(342) 947-7663 x95411','powlowski.caitlyn@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(63,'Julio','McDermott','403.913.0495','ismitham@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(64,'Wanda','Monahan','1-582-428-3443 x6494','maybell57@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(65,'Cheyenne','Hyatt','1-431-280-9867 x49069','weissnat.kasandra@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(66,'Coralie','Crist','+1 (548) 792-6644','stamm.catalina@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(67,'Kaela','Miller','(242) 455-4076','bayer.dean@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(68,'Ramona','Kunde','1-460-287-3171 x1281','lexie.kirlin@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(69,'Deontae','Fisher','484-701-9082','jettie85@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(70,'Doyle','Stokes','1-639-986-4365','willy.cruickshank@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(71,'Melvina','Rath','+1-531-919-6912','vivian.torp@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(72,'Francisca','Schimmel','465.417.1744 x80150','bobbie61@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(73,'Vincent','Stehr','(386) 347-5790 x7835','gilbert37@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(74,'Shanny','Jacobson','353-228-0753','schimmel.kaci@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(75,'Jennifer','Glover','1-441-221-1486','davis.hyman@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(76,'Delbert','Considine','627-535-1493 x214','vnikolaus@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(77,'Camila','Becker','1-827-456-9292 x433','raul29@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(78,'Melissa','Conroy','291.337.8606','sydnie.bergnaum@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(79,'Cornell','Feeney','+1-913-785-7479','veronica.mckenzie@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(80,'Audie','Champlin','(628) 205-0199 x3432','gunnar.tillman@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(81,'Vella','Hettinger','226-468-6482 x1749','michael60@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(82,'Elmore','Cronin','+15474192193','oconnell.kattie@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(83,'Hettie','Glover','(984) 491-5246','audrey30@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(84,'Jayda','Raynor','256-619-7442','elton00@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(85,'Rafaela','Tremblay','1-409-270-2167','nkling@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(86,'Ian','Cummerata','(437) 583-3524','chesley44@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(87,'Caroline','Corkery','(349) 221-9176 x2257','joelle.wiza@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(88,'Vena','Mertz','1-574-268-1771','weber.lavonne@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(89,'Helen','Trantow','1-202-681-7932 x4875','ismael58@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(90,'Mark','Parisian','258.621.7796 x78890','laury49@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(91,'Kylee','Bechtelar','+1.864.353.5907','sheila.pagac@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(92,'Lukas','Swaniawski','1-464-724-6499','deckow.kelvin@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(93,'Viola','Boehm','465.246.4346 x23596','delia80@example.org','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(94,'Andreanne','Brekke','1-671-322-3611','arden.ernser@example.net','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(95,'Boris','Nicolas','221.368.5858 x9204','bvonrueden@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(96,'Hattie','Wisoky','+1-574-725-5391','wiegand.lia@example.com','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(97,'Gabe','Wolf','1-464-409-7098 x378','frank.pagac@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(98,'Dashawn','Beatty','539.561.5088 x3188','vschmidt@example.com','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(99,'Shad','Cole','+1-301-414-1624','ursula98@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(100,'Emilia','Armstrong','+1-461-565-0771','mayert.serenity@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(101,'Carey','Sporer','287.897.1513 x62505','fatima.torphy@example.net','male',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(102,'Ayana','Wolf','(395) 567-3929 x531','wendy99@example.org','female',NULL,'2018-07-09 07:51:01','2018-07-09 07:51:01'),
	(103,'Bette','Walter','1-439-412-2561 x3968','smith.evans@example.net','male',NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(104,'Kassandra','Jakubowski','984-502-0661 x81664','kirlin.erna@example.org','male',NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(105,'Penelope','O\'Connell','765-922-2554 x63801','gerlach.bernardo@example.net','female',NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(106,'Sydney','Dooley','1-378-987-8000','reginald.wisoky@example.org','male',NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(107,'Micheal','Wolf','(438) 394-0292 x11473','fadel.kianna@example.com','male',NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(108,'Ofelia','Mosciski','902.380.8318 x005','hansen.melissa@example.net','female',NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(109,'Solon','Dickinson','447-261-0807 x053','wabernathy@example.com','male',NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(110,'Caroline','Koss','+1-502-764-5379','marina16@example.com','male',NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(111,'Caleb','Luettgen','532-300-8341 x9609','mcole@example.org','male',NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(112,'Keara','Morissette','908-362-3521 x72404','don.mcglynn@example.net','female',NULL,'2018-07-09 08:25:04','2018-07-09 08:25:04');

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
	(1,5,'acre',2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-07 18:08:07','2018-07-07 18:08:07'),
	(2,8,'acre',1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-07 20:33:44','2018-07-07 20:33:44'),
	(3,7,'acre',3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-09 07:52:40','2018-07-09 07:52:40'),
	(4,4,'acre',103,'Est neque reprehenderit aut quia a.','2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(5,9,'acre',104,'Et quo placeat exercitationem.','2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(6,6,'acre',105,'Aut voluptatem nesciunt cumque necessitatibus sed nihil omnis.','2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(7,8,'acre',106,'Delectus debitis quia ut distinctio quia ab sit.','2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(8,4,'acre',107,'Atque dolorem quasi ut qui fuga doloribus exercitationem.','2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(9,5,'acre',108,'Voluptas quae nostrum et nisi fugiat magnam voluptatem.','2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(10,4,'acre',109,'Nesciunt eos non est et est sunt.','2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(11,9,'acre',110,'Exercitationem minima modi sequi ratione odio et.','2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(12,2,'acre',111,'Odio velit ratione ad illo labore quo laborum.','2018-07-09 08:25:04','2018-07-09 08:25:04'),
	(13,7,'acre',112,'Cumque voluptatem architecto commodi.','2018-07-09 08:25:04','2018-07-09 08:25:04');

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
  `farmer_id` int(10) unsigned DEFAULT NULL,
  `batch_id` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `harvests` WRITE;
/*!40000 ALTER TABLE `harvests` DISABLE KEYS */;

INSERT INTO `harvests` (`id`, `expected_amount`, `amount_unit`, `expected_date`, `block_id`, `farmer_id`, `batch_id`, `description`, `created_at`, `updated_at`)
VALUES
	(1,4500,'kg','2018-07-07 19:36:05',1,2,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-07 19:32:31','2018-07-07 19:32:31'),
	(2,6000,'kg','2018-07-07 19:52:18',2,2,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-07 19:52:18','2018-07-07 19:52:18'),
	(3,4500,'kg','2018-07-07 20:35:01',3,1,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-07 20:35:01','2018-07-07 20:35:01'),
	(4,78600,'kg','2018-07-08 20:18:30',1,2,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 20:18:29','2018-07-08 20:18:30'),
	(5,4500,'kg','2018-07-08 21:27:39',3,1,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 21:27:39','2018-07-08 21:27:39'),
	(6,45600,'kg','2018-07-08 21:41:33',3,1,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 21:41:33','2018-07-08 21:41:33'),
	(7,5600,'kg','2018-07-08 21:43:02',1,2,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 21:43:02','2018-07-08 21:43:02'),
	(8,4500,'kg','2018-07-08 21:45:05',2,2,3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-08 21:45:05','2018-07-08 21:45:05'),
	(9,45600,'kg','2018-07-08 22:11:21',3,1,5,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum.','2018-07-08 22:11:20','2018-07-08 22:11:21'),
	(10,3200,'kg','2018-07-09 08:54:34',3,1,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-09 08:54:34','2018-07-09 08:54:34'),
	(11,67500,'kg','2018-07-09 09:26:53',1,2,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-09 09:26:53','2018-07-09 09:26:53'),
	(12,12000,'kg','2018-07-09 09:28:10',8,107,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-09 09:28:10','2018-07-09 09:28:10'),
	(13,54500,'kg','2018-07-09 10:36:21',9,108,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-09 10:36:21','2018-07-09 10:36:21'),
	(14,2500,'kg','2018-07-09 10:37:14',10,109,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-09 10:37:14','2018-07-09 10:37:14'),
	(15,5600,'kg','2018-07-09 10:38:11',6,105,9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh.','2018-07-09 10:38:11','2018-07-09 10:38:11'),
	(16,12000,'kg','2018-07-10 08:47:36',3,1,10,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-10 08:47:36','2018-07-10 08:47:36'),
	(17,23000,'kg','2018-07-10 08:48:35',9,108,10,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-10 08:48:35','2018-07-10 08:48:35'),
	(18,34500,'kg','2018-07-10 08:49:18',4,103,10,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-10 08:49:18','2018-07-10 08:49:18'),
	(19,45000,'kg','2018-07-10 08:50:05',1,2,10,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','2018-07-10 08:50:04','2018-07-10 08:50:05');

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
	(377,'2014_10_12_000000_create_users_table',1),
	(378,'2014_10_12_100000_create_password_resets_table',1),
	(379,'2018_05_12_140817_create_farmers_table',1),
	(380,'2018_05_13_060556_create_products_table',1),
	(381,'2018_05_13_061031_create_product_categories_table',1),
	(382,'2018_05_13_062152_create_product_category_table',1),
	(383,'2018_05_14_050338_create_product_prices_table',1),
	(384,'2018_05_15_083531_create_purchases_table',1),
	(385,'2018_05_15_135954_create_remarks_table',1),
	(386,'2018_05_29_183330_create_addresses_table',1),
	(387,'2018_05_30_090730_create_bouncer_tables',1),
	(388,'2018_05_30_172904_create_audits_table',1),
	(389,'2018_06_25_135944_create_farms_table',1),
	(390,'2018_06_25_142204_create_harvests_table',1),
	(391,'2018_06_25_142951_create_farm_crop_table',1),
	(392,'2018_06_25_144104_create_batches_table',1),
	(393,'2018_06_25_144622_create_farmer_batch_table',1),
	(394,'2018_06_25_153201_create_blocks_table',1);

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
	(1,'Cereals','Voluptate doloremque ex aut ducimus ut.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(2,'Pulses','Architecto architecto pariatur odio quis rerum et consequatur.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(3,'Vegetables','Natus sit nihil est tempore asperiores.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(4,'Fruits','Repellendus cupiditate fuga sequi rerum molestiae voluptas.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(5,'Nuts','Magni pariatur eum repudiandae inventore esse eum qui.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(6,'Oilseeds','Atque debitis et ut distinctio porro.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(7,'Sugars and Starches','Quia qui atque possimus laudantium quibusdam et.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(8,'Fibres','Sapiente qui veritatis odio aut debitis aperiam.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(9,'Beverages','Quibusdam sit ad eius sint.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(10,'Narcotics','Officiis itaque sapiente ipsa quisquam.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(11,'Spices','Placeat est dolor et minima.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(12,'Condiments','Sapiente id modi ea illo.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(13,'Rubber Forages','Suscipit ut sit ratione quas iusto ut repellat adipisci.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(14,'Green and Green leaf manure','Reiciendis ut et tempore sunt.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54');

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
	(1,1,1,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(2,1,2,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(3,1,3,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(4,1,4,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(5,1,5,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(6,2,6,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(7,2,7,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(8,2,8,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(9,2,9,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(10,3,10,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(11,3,11,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(12,3,12,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(13,3,13,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(14,4,14,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(15,4,15,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(16,4,16,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(17,4,17,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(18,4,18,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(19,4,19,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(20,5,20,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(21,5,21,'2018-07-07 17:17:54','2018-07-07 17:17:54');

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
	(1,650,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,1,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(2,600,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,2,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(3,950,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,3,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(4,900,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,4,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(5,950,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,5,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(6,750,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,6,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(7,850,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,7,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(8,950,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,8,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(9,750,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,9,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(10,650,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,10,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(11,500,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,11,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(12,550,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,12,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(13,550,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,13,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(14,650,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,14,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(15,800,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,15,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(16,700,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,16,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(17,600,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,17,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(18,750,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,18,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(19,700,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,19,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(20,650,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,20,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(21,650,'TZS','kg',0,'2018-07-07 17:17:54',NULL,1,21,NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54');

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
	(1,'Maize','Atque omnis id molestiae omnis ut qui.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(2,'Rice','Exercitationem nostrum commodi magni.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(3,'Wheat','Quisquam reprehenderit eos et dolor ut deleniti.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(4,'Sorghum','Nam nihil mollitia laborum laboriosam omnis ex.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(5,'Barley','Dolore qui itaque soluta error eius blanditiis in.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(6,'Kidney bean','Est at sit libero et debitis.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(7,'Lima bean','Reprehenderit assumenda excepturi ipsa sapiente debitis veritatis.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(8,'Horse bean','Non facilis et minima provident quae est perferendis.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(9,'Garden pea','Enim repudiandae velit illum sit temporibus et nostrum culpa.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(10,'Mchicha','Eius a et quas atque modi.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(11,'Tembele','Esse veniam et quasi praesentium voluptas adipisci.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(12,'Kabichi','Adipisci eum culpa eligendi et.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(13,'Kisanvu','Quaerat voluptatibus consectetur illum.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(14,'Chungwa','Iste eligendi ex et rerum.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(15,'Embe','Sed sint cumque quia magnam.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(16,'Ndizi','Nostrum minus adipisci odit illum ipsam alias.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(17,'Tango','Qui est qui nemo aspernatur.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(18,'Tikiti','Dolorum excepturi eum id sit.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(19,'Zabibu','Quaerat occaecati omnis quia enim fugiat.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(20,'Karanga','Animi nobis architecto explicabo illo est id nemo.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54'),
	(21,'Korosho','Consectetur sunt totam eum eos.',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54');

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
  `status` enum('received','packed','graded','rejected','completed','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `product_id` int(10) unsigned DEFAULT NULL,
  `batch_id` int(10) unsigned DEFAULT NULL,
  `harvest_id` int(10) unsigned DEFAULT NULL,
  `farmer_id` int(10) unsigned DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;

INSERT INTO `purchases` (`id`, `field_weight`, `weight_before`, `weight_after`, `weight_unit`, `amount`, `currency`, `status`, `product_id`, `batch_id`, `harvest_id`, `farmer_id`, `paid_at`, `creator_id`, `created_at`, `updated_at`)
VALUES
	(1,450,440,430,'kg',322500,'TZS','paid',6,2,1,2,'2018-07-10 10:52:20',1,'2018-07-07 20:13:29','2018-07-10 10:52:20'),
	(2,670,NULL,NULL,'kg',NULL,'TZS','received',6,2,1,2,NULL,1,'2018-07-07 20:15:09','2018-07-07 20:15:09'),
	(3,780,750,740,'kg',555000,'TZS','completed',9,1,3,1,NULL,1,'2018-07-07 20:35:23','2018-07-09 22:46:40'),
	(4,375,NULL,NULL,'kg',NULL,'TZS','rejected',11,9,12,107,NULL,1,'2018-07-09 10:01:54','2018-07-10 10:39:11'),
	(5,560,460,450,'kg',337500,'TZS','paid',9,9,10,1,'2018-07-10 10:51:03',1,'2018-07-09 10:16:15','2018-07-10 10:51:03'),
	(6,985,NULL,NULL,'kg',NULL,'TZS','rejected',6,9,11,2,NULL,1,'2018-07-09 10:38:55','2018-07-10 09:04:38'),
	(7,3500,3400,NULL,'kg',NULL,'TZS','packed',9,10,16,1,NULL,1,'2018-07-10 08:51:30','2018-07-10 09:06:42'),
	(8,5600,5550,5500,'kg',3850000,'TZS','completed',16,10,17,108,NULL,1,'2018-07-10 08:52:02','2018-07-10 10:41:00');

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
	(1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','App\\Purchase',1,NULL,'2018-07-07 20:13:29','2018-07-07 20:13:29'),
	(2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','App\\Purchase',2,NULL,'2018-07-07 20:15:09','2018-07-07 20:15:09'),
	(3,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et fermentum dui. Ut orci quam, ornare sed lorem sed, hendrerit auctor dolor. Nulla viverra, nibh quis ultrices malesuada, ligula ipsum vulputate diam, aliquam egestas nibh ante vel dui. Sed in.','App\\Purchase',3,NULL,'2018-07-07 20:35:23','2018-07-07 20:35:23');

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
	(1,'admin','System administrator',1,NULL,'Responsible for the upkeep, configuration, and reliable operation of the systems; The system administrator seeks to ensure that the uptime, performance, resources, and security of the computers they manage meet the needs of the users.','2018-07-07 17:17:53','2018-07-07 17:17:53');

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
	(1,'Leann','Jacobson','admin@homeverge.co.tz','1-271-700-2657 x676','male','1988-08-08','$2y$10$GEB9QOGDxdPaVWirA.uNvOn0hr5grhms3Nn3fSDhwX.bbVhRbN8Ym','Mayotte','xeMo0NHyJ4',NULL,'2018-07-07 17:17:54','2018-07-07 17:17:54');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
