# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: farmers
# Generation Time: 2018-07-25 10:57:10 +0000
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
	(1,'*','All abilities',NULL,'*',0,NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43');

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



# Dump of table blocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blocks`;

CREATE TABLE `blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` double NOT NULL,
  `size_unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `farm_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



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



# Dump of table group_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `group_member`;

CREATE TABLE `group_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned DEFAULT NULL,
  `farmer_id` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `removed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table group_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `group_product`;

CREATE TABLE `group_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `price_id` int(10) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_count` int(10) unsigned NOT NULL DEFAULT '20',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



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
	(500,'2014_10_12_000000_create_users_table',1),
	(501,'2014_10_12_100000_create_password_resets_table',1),
	(502,'2018_05_12_140817_create_farmers_table',1),
	(503,'2018_05_13_060556_create_products_table',1),
	(504,'2018_05_13_061031_create_product_categories_table',1),
	(505,'2018_05_13_062152_create_product_category_table',1),
	(506,'2018_05_14_050338_create_product_prices_table',1),
	(507,'2018_05_15_083531_create_purchases_table',1),
	(508,'2018_05_15_135954_create_remarks_table',1),
	(509,'2018_05_29_183330_create_addresses_table',1),
	(510,'2018_05_30_090730_create_bouncer_tables',1),
	(511,'2018_05_30_172904_create_audits_table',1),
	(512,'2018_06_25_135944_create_farms_table',1),
	(513,'2018_06_25_142204_create_harvests_table',1),
	(514,'2018_06_25_142951_create_farm_crop_table',1),
	(515,'2018_06_25_144104_create_batches_table',1),
	(516,'2018_06_25_144622_create_farmer_batch_table',1),
	(517,'2018_06_25_153201_create_blocks_table',1),
	(518,'2018_07_14_131909_create_groups_table',1),
	(519,'2018_07_14_132352_create_group_members_table',1),
	(520,'2018_07_14_132439_create_group_products_table',1);

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
	(1,'Cereals','Nisi est consequuntur ducimus itaque.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(2,'Pulses','Iste sit non qui consequatur modi voluptatem nihil.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(3,'Vegetables','Accusantium molestiae consequatur dolorem in ad.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(4,'Fruits','Nulla alias debitis qui totam voluptatum.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(5,'Nuts','Quis earum aliquid enim odit et.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(6,'Oilseeds','Voluptas repudiandae ut sed esse.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(7,'Sugars and Starches','Ullam ut dolorem nam dolores aut sed.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(8,'Fibres','Cumque magnam aliquam ipsum repellendus iusto.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(9,'Beverages','Placeat non quia sit exercitationem qui totam cupiditate.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(10,'Narcotics','Fugiat reprehenderit et facere nam voluptatem fuga.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(11,'Spices','Asperiores est debitis minus consectetur veniam ut.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(12,'Condiments','Alias nesciunt ea ipsa soluta.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(13,'Rubber Forages','Neque deleniti veniam architecto aut dolores qui eos.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(14,'Green and Green leaf manure','Id et expedita est molestiae quasi labore aspernatur.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43');

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
	(1,1,1,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(2,1,2,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(3,1,3,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(4,1,4,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(5,1,5,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(6,2,6,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(7,2,7,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(8,2,8,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(9,2,9,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(10,3,10,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(11,3,11,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(12,3,12,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(13,3,13,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(14,4,14,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(15,4,15,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(16,4,16,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(17,4,17,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(18,4,18,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(19,4,19,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(20,5,20,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(21,5,21,'2018-07-25 13:56:43','2018-07-25 13:56:43');

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
  `group_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



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
	(1,'Maize','Fugit in vel minus ut dicta aut ducimus.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(2,'Rice','Ut assumenda rerum sapiente atque voluptate.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(3,'Wheat','Molestias ut nulla ut sit suscipit.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(4,'Sorghum','Et sapiente ut quisquam repellat consequatur hic.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(5,'Barley','Aut voluptatem eos est esse animi esse.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(6,'Kidney bean','Autem modi quisquam et maxime.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(7,'Lima bean','Enim et eum aut deleniti animi et quis.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(8,'Horse bean','Dolorum ipsum et tempore ab blanditiis iste et.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(9,'Garden pea','Perspiciatis deserunt commodi atque itaque aut nulla sit.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(10,'Mchicha','Officiis quo ab eos est quia.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(11,'Tembele','Rem labore voluptatibus commodi est rerum vel aspernatur.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(12,'Kabichi','Quidem repellendus eos reprehenderit.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(13,'Kisanvu','Perspiciatis et molestias amet delectus exercitationem excepturi pariatur.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(14,'Chungwa','Eum quod nulla sit et aspernatur et.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(15,'Embe','Consequatur aperiam sunt occaecati.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(16,'Ndizi','Sapiente temporibus quisquam asperiores voluptates deserunt.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(17,'Tango','Ea repudiandae commodi consectetur amet.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(18,'Tikiti','Atque ut exercitationem ut sunt et aliquid et.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(19,'Zabibu','Unde officiis eligendi ut nulla.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(20,'Karanga','Eveniet quis sed expedita maiores provident assumenda.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43'),
	(21,'Korosho','Unde ratione aut quia qui.',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43');

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
	(1,'admin','System administrator',1,NULL,'Responsible for the upkeep, configuration, and reliable operation of the systems; The system administrator seeks to ensure that the uptime, performance, resources, and security of the computers they manage meet the needs of the users.','2018-07-25 13:56:42','2018-07-25 13:56:42');

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
	(1,'Lavonne','Bauch','admin@homeverge.co.tz','+1-946-643-5710','male','1988-08-08','$2y$10$ATgp4OWtJwHb2I1gw28BLe1dpWdFJFkTMQIPjZL4Gk9PNQtpNWySi','Serbia','9VoVcwbjqu',NULL,'2018-07-25 13:56:43','2018-07-25 13:56:43');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
