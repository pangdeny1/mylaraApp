-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2018 at 06:39 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `abilities`
--

CREATE TABLE `abilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` int(10) UNSIGNED DEFAULT NULL,
  `entity_type` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `only_owned` tinyint(1) NOT NULL DEFAULT '0',
  `scope` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abilities`
--

INSERT INTO `abilities` (`id`, `name`, `title`, `entity_id`, `entity_type`, `only_owned`, `scope`, `created_at`, `updated_at`) VALUES
(1, '*', 'All abilities', NULL, '*', 0, NULL, '2018-07-25 07:56:43', '2018-07-25 07:56:43'),
(2, 'view', 'View farmers', NULL, 'App\\Farmer', 0, NULL, '2018-07-29 17:07:27', '2018-07-29 17:07:27'),
(3, 'create', 'Create farmers', NULL, 'App\\Farmer', 0, NULL, '2018-07-29 17:07:27', '2018-07-29 17:07:27'),
(4, 'edit', 'Edit farmers', NULL, 'App\\Farmer', 0, NULL, '2018-07-29 17:07:28', '2018-07-29 17:07:28'),
(5, 'view', 'View purchases', NULL, 'App\\Purchase', 0, NULL, '2018-07-29 17:07:28', '2018-07-29 17:07:28'),
(6, 'create', 'Create purchases', NULL, 'App\\Purchase', 0, NULL, '2018-07-29 17:07:28', '2018-07-29 17:07:28'),
(7, 'edit', 'Edit purchases', NULL, 'App\\Purchase', 0, NULL, '2018-07-29 17:07:28', '2018-07-29 17:07:28'),
(8, 'view', 'View blocks', NULL, 'App\\Block', 0, NULL, '2018-07-29 17:07:28', '2018-07-29 17:07:28'),
(9, 'create', 'Create blocks', NULL, 'App\\Block', 0, NULL, '2018-07-29 17:07:28', '2018-07-29 17:07:28'),
(10, 'edit', 'Edit blocks', NULL, 'App\\Block', 0, NULL, '2018-07-29 17:07:28', '2018-07-29 17:07:28'),
(11, 'view', 'View farms', NULL, 'App\\Farm', 0, NULL, '2018-07-29 17:07:28', '2018-07-29 17:07:28'),
(12, 'create', 'Create farms', NULL, 'App\\Farm', 0, NULL, '2018-07-29 17:07:28', '2018-07-29 17:07:28'),
(13, 'edit', 'Edit farms', NULL, 'App\\Farm', 0, NULL, '2018-07-29 17:07:28', '2018-07-29 17:07:28'),
(14, 'view', 'View products', NULL, 'App\\Product', 0, NULL, '2018-07-29 17:08:49', '2018-07-29 17:08:49'),
(15, 'create', 'Create products', NULL, 'App\\Product', 0, NULL, '2018-07-29 17:08:49', '2018-07-29 17:08:49'),
(16, 'edit', 'Edit products', NULL, 'App\\Product', 0, NULL, '2018-07-29 17:08:49', '2018-07-29 17:08:49'),
(17, 'view', 'View product categories', NULL, 'App\\ProductCategory', 0, NULL, '2018-07-29 17:08:50', '2018-07-29 17:08:50'),
(18, 'create', 'Create product categories', NULL, 'App\\ProductCategory', 0, NULL, '2018-07-29 17:08:50', '2018-07-29 17:08:50'),
(19, 'edit', 'Edit product categories', NULL, 'App\\ProductCategory', 0, NULL, '2018-07-29 17:08:50', '2018-07-29 17:08:50'),
(20, 'delete', 'Delete farmers', NULL, 'App\\Farmer', 0, NULL, '2018-08-29 05:39:51', '2018-08-29 05:39:51'),
(21, 'delete', 'Delete purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:39:52', '2018-08-29 05:39:52'),
(22, 'farm_weight_view', 'Farm weight view purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:39:52', '2018-08-29 05:39:52'),
(23, 'farm_weight_create', 'Farm weight create purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:39:52', '2018-08-29 05:39:52'),
(24, 'farm_weight_edit', 'Farm weight edit purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:39:52', '2018-08-29 05:39:52'),
(25, 'farm_weight_delete', 'Farm weight delete purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:39:52', '2018-08-29 05:39:52'),
(26, 'delete', 'Delete blocks', NULL, 'App\\Block', 0, NULL, '2018-08-29 05:39:52', '2018-08-29 05:39:52'),
(27, 'view', 'View batches', NULL, 'App\\Batch', 0, NULL, '2018-08-29 05:39:53', '2018-08-29 05:39:53'),
(28, 'create', 'Create batches', NULL, 'App\\Batch', 0, NULL, '2018-08-29 05:39:53', '2018-08-29 05:39:53'),
(29, 'edit', 'Edit batches', NULL, 'App\\Batch', 0, NULL, '2018-08-29 05:39:53', '2018-08-29 05:39:53'),
(30, 'delete', 'Delete batches', NULL, 'App\\Batch', 0, NULL, '2018-08-29 05:39:53', '2018-08-29 05:39:53'),
(31, 'delete', 'Delete farms', NULL, 'App\\Farm', 0, NULL, '2018-08-29 05:39:53', '2018-08-29 05:39:53'),
(32, 'delete', 'Delete products', NULL, 'App\\Product', 0, NULL, '2018-08-29 05:45:14', '2018-08-29 05:45:14'),
(33, 'delete', 'Delete product categories', NULL, 'App\\ProductCategory', 0, NULL, '2018-08-29 05:45:15', '2018-08-29 05:45:15'),
(34, 'packing_house_weight_view', 'Packing house weight view purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:45:15', '2018-08-29 05:45:15'),
(35, 'packing_house_weight_create', 'Packing house weight create purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:45:15', '2018-08-29 05:45:15'),
(36, 'packing_house_weight_edit', 'Packing house weight edit purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:45:15', '2018-08-29 05:45:15'),
(37, 'packing_house_weight_delete', 'Packing house weight delete purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:45:16', '2018-08-29 05:45:16'),
(38, 'graded_weight_view', 'Graded weight view purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:45:16', '2018-08-29 05:45:16'),
(39, 'graded_weight_create', 'Graded weight create purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:45:16', '2018-08-29 05:45:16'),
(40, 'graded_weight_edit', 'Graded weight edit purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:45:16', '2018-08-29 05:45:16'),
(41, 'graded_weight_delete', 'Graded weight delete purchases', NULL, 'App\\Purchase', 0, NULL, '2018-08-29 05:45:16', '2018-08-29 05:45:16'),
(42, 'view', 'View users', NULL, 'App\\User', 0, NULL, '2018-10-23 16:07:22', '2018-10-23 16:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `creator_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `address`, `country`, `state`, `postal_code`, `addressable_type`, `addressable_id`, `creator_id`, `created_at`, `updated_at`) VALUES
(1, '23', '', 'Tanzania', 'Kusini Unguja', '33', 'App\\User', 2, NULL, '2018-10-23 16:06:15', '2018-10-23 16:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `assigned_roles`
--

CREATE TABLE `assigned_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `entity_id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assigned_roles`
--

INSERT INTO `assigned_roles` (`role_id`, `entity_id`, `entity_type`, `scope`) VALUES
(1, 1, 'App\\User', NULL),
(2, 4, 'App\\User', NULL),
(2, 5, 'App\\User', NULL),
(2, 6, 'App\\User', NULL),
(2, 7, 'App\\User', NULL),
(2, 8, 'App\\User', NULL),
(2, 9, 'App\\User', NULL),
(2, 10, 'App\\User', NULL),
(2, 11, 'App\\User', NULL),
(1, 12, 'App\\User', NULL),
(1, 13, 'App\\User', NULL),
(1, 14, 'App\\User', NULL),
(1, 3, 'App\\User', NULL),
(1, 16, 'App\\User', NULL),
(1, 17, 'App\\User', NULL),
(1, 2, 'App\\User', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 1, 'updated', 'App\\User', 1, '{\"remember_token\":\"eyfAGGoIKCENEebG6Knd0ZyT6jrNWrRomTf982tkfryyYTVR0U9xfrX2WfI3\"}', '{\"remember_token\":\"cTPZEeZ7DE4InhNoLsue6zcBGctid54MrQAYIgM47Yq8fciBhe6rVSznexln\"}', 'http://127.0.0.1:8000/logout?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:01:20', '2018-10-23 16:01:20'),
(2, 'App\\User', 1, 'updated', 'App\\User', 1, '{\"remember_token\":\"cTPZEeZ7DE4InhNoLsue6zcBGctid54MrQAYIgM47Yq8fciBhe6rVSznexln\"}', '{\"remember_token\":\"b8K6IhFmaTXU8NJgyrCjV13RvCC7oycgCV9WM9LyZ9XHMbzzPqpP3Po18BgC\"}', 'http://127.0.0.1:8000/logout?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:03:18', '2018-10-23 16:03:18'),
(3, 'App\\User', 1, 'deleted', 'App\\User', 18, '{\"id\":18,\"first_name\":\"Pack\",\"last_name\":\"Officer\",\"email\":\"pack@officer.com\",\"phone\":\"0754997619\",\"gender\":\"male\",\"birthday\":\"2018-08-20\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":\"DmasZQetAD0GZdZiVWxIsPbGCdLjYA1OvJZVWZWKjXhWGM6ybMt8ABpj6fqD\",\"creator_id\":12}', '[]', 'http://127.0.0.1:8000/settings/users/18?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:02', '2018-10-23 16:05:02'),
(4, 'App\\User', 1, 'deleted', 'App\\User', 7, '{\"id\":7,\"first_name\":\"Kyarua\",\"last_name\":\"S Mussa\",\"email\":\"kyarua.mussa@homevegfarmers.co.tz\",\"phone\":\"0672411085\",\"gender\":\"male\",\"birthday\":\"2018-07-15\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":\"bRvUMCXQCqDQSG3irWJ85PmGRqUBNYK7j2L9tVhf2rYWxVaZu1HBcA9OnCKD\",\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/7?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:06', '2018-10-23 16:05:06'),
(5, 'App\\User', 1, 'deleted', 'App\\User', 16, '{\"id\":16,\"first_name\":\"Halima\",\"last_name\":\"Mwenda\",\"email\":\"halimamwenda320@gmail.com\",\"phone\":\"07999999\",\"gender\":\"female\",\"birthday\":\"2018-07-29\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":\"lVY8Afx8Qur9BpGmnupNEmOgO8YLy8uf1JmxkCPCwd5s0Esm6tzRovQRF7Hw\",\"creator_id\":12}', '[]', 'http://127.0.0.1:8000/settings/users/16?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:07', '2018-10-23 16:05:07'),
(6, 'App\\User', 1, 'deleted', 'App\\User', 15, '{\"id\":15,\"first_name\":\"Winifrida\",\"last_name\":\"Ndamugoba\",\"email\":\"boney.neema@gmail.com\",\"phone\":\"0759266551\",\"gender\":\"female\",\"birthday\":\"1981-03-11\",\"password\":\"$2y$10$ZrPVyve.KO1eFqWYpLT9ruK.mk7dV9zeVTFQNNbLMij5JeKomsmTW\",\"country\":\"Tanzania\",\"remember_token\":\"BtxuHAqdDZfrz9v5n4iseG52MuK0Bfgq9SMYq7xVlNmChrA4boaM77C4zkVH\",\"creator_id\":3}', '[]', 'http://127.0.0.1:8000/settings/users/15?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:08', '2018-10-23 16:05:08'),
(7, 'App\\User', 1, 'deleted', 'App\\User', 14, '{\"id\":14,\"first_name\":\"Tarimo\",\"last_name\":\"Machel\",\"email\":\"tmachel.homevegtz@gmail.com\",\"phone\":\"0786683212\",\"gender\":\"male\",\"birthday\":\"2018-08-05\",\"password\":\"$2y$10$NbjNMO\\/.78E2qcVfgFRMzuHIDHfIlkC13Yov.MnTTVA.em8fQGC3C\",\"country\":\"Tanzania\",\"remember_token\":null,\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/14?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:09', '2018-10-23 16:05:09'),
(8, 'App\\User', 1, 'deleted', 'App\\User', 13, '{\"id\":13,\"first_name\":\"Mussa\",\"last_name\":\"Mvungi\",\"email\":\"mussamvungi.homevegtz@gmail.com\",\"phone\":\"0784326206\",\"gender\":\"male\",\"birthday\":\"2018-07-16\",\"password\":\"$2y$10$NbjNMO\\/.78E2qcVfgFRMzuHIDHfIlkC13Yov.MnTTVA.em8fQGC3C\",\"country\":\"Tanzania\",\"remember_token\":null,\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/13?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:11', '2018-10-23 16:05:11'),
(9, 'App\\User', 1, 'deleted', 'App\\User', 12, '{\"id\":12,\"first_name\":\"Meda\",\"last_name\":\"Tanzania\",\"email\":\"meda@homevegfarmers.co.tz\",\"phone\":\"0989988987\",\"gender\":\"male\",\"birthday\":\"2018-08-20\",\"password\":\"$2y$10$Rt8n34InfdaUSB867e7pU.rROT16cCRAalmUiikvi6uvXXaWiPOHC\",\"country\":\"Tanzania\",\"remember_token\":\"CKZlws0OpEvKVLr9EqfqxjFKh9LOudWrJKDlwLTJGtJy6oFYbKX8VbU3Wk70\",\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/12?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:12', '2018-10-23 16:05:12'),
(10, 'App\\User', 1, 'deleted', 'App\\User', 11, '{\"id\":11,\"first_name\":\"Seth\",\"last_name\":\"Athumani\",\"email\":\"seth.athumani@homevegfarmers.co.tz\",\"phone\":\"0659507284\",\"gender\":\"male\",\"birthday\":\"2018-07-01\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":\"ENuXZcqwxYGClrD2Gzi2FVqKSVIGkQjmH2ZNyWAzcMWj81izee37NS8F5dtT\",\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/11?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:13', '2018-10-23 16:05:13'),
(11, 'App\\User', 1, 'deleted', 'App\\User', 10, '{\"id\":10,\"first_name\":\"Juma\",\"last_name\":\"M Kawanje\",\"email\":\"juma.kawanje@homevegfarmers.co.tz\",\"phone\":\"0678236629\",\"gender\":\"male\",\"birthday\":\"2018-07-08\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":\"JDzxmu1BD0C5uJ5XirZp71i5fcRUzeJcI1S4ARUSyqaabXLtDiEC7A7z1ET1\",\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/10?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:14', '2018-10-23 16:05:14'),
(12, 'App\\User', 1, 'deleted', 'App\\User', 9, '{\"id\":9,\"first_name\":\"Samwel\",\"last_name\":\"E Nassary\",\"email\":\"samwel.nassary@homevegfarmers.co.tz\",\"phone\":\"0784884585\",\"gender\":\"male\",\"birthday\":\"2018-07-08\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":\"eupQgsKkexPbyRbeGLgkXvscs6vQ9aB80eCpwVBCyZfeSH7ssCNUKXMf6NlR\",\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/9?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:15', '2018-10-23 16:05:15'),
(13, 'App\\User', 1, 'deleted', 'App\\User', 19, '{\"id\":19,\"first_name\":\"Vista\",\"last_name\":\"Vaos\",\"email\":\"vista@farmers.com\",\"phone\":\"0987564882\",\"gender\":\"female\",\"birthday\":\"2018-07-29\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":null,\"creator_id\":12}', '[]', 'http://127.0.0.1:8000/settings/users/19?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:17', '2018-10-23 16:05:17'),
(14, 'App\\User', 1, 'deleted', 'App\\User', 17, '{\"id\":17,\"first_name\":\"Flora\",\"last_name\":\"Wado\",\"email\":\"flofilowado@gmail.com\",\"phone\":\"0988766555\",\"gender\":\"female\",\"birthday\":\"2018-07-29\",\"password\":\"$2y$10$guTCrvfPy.CC4rHBZ7n8lOkJNLRKHYc4f5mgxPmJH.6GptIaw21xm\",\"country\":\"Tanzania\",\"remember_token\":\"nCbDF9fEdiEVo8rFDqandDHJ7UNYtp6SlQORw37GnpYbUyBLZ4vChzVvbUAZ\",\"creator_id\":12}', '[]', 'http://127.0.0.1:8000/settings/users/17?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:18', '2018-10-23 16:05:18'),
(15, 'App\\User', 1, 'deleted', 'App\\User', 8, '{\"id\":8,\"first_name\":\"Rodgers\",\"last_name\":\"K Makange\",\"email\":\"rodgers.makange@homevegfarmers.co.tz\",\"phone\":\"0713477764\",\"gender\":\"male\",\"birthday\":\"2018-07-08\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":\"ygyvDzqH67tUFv7nRKTHhjy0nyVkXiXFgEj81aTOeBRAdJWvgpd5KEkZpw4e\",\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/8?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:19', '2018-10-23 16:05:19'),
(16, 'App\\User', 1, 'deleted', 'App\\User', 6, '{\"id\":6,\"first_name\":\"Bahati\",\"last_name\":\"H Kiondo\",\"email\":\"bahati.kiondo@homevegfarmers.co.tz\",\"phone\":\"0714293608\",\"gender\":\"female\",\"birthday\":\"2018-07-01\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":\"FmTo1S7Po3jkx4bgVX4tXrmjrznqV3r7cJDgsGgIfkbH0UzlUNhzplCgAbU2\",\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/6?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:21', '2018-10-23 16:05:21'),
(17, 'App\\User', 1, 'deleted', 'App\\User', 5, '{\"id\":5,\"first_name\":\"lubuveg\",\"last_name\":\"2012\",\"email\":\"lubuveg2012@gmail.com\",\"phone\":\"0999999999\",\"gender\":\"male\",\"birthday\":\"2018-07-15\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":null,\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/5?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:22', '2018-10-23 16:05:22'),
(18, 'App\\User', 1, 'deleted', 'App\\User', 4, '{\"id\":4,\"first_name\":\"lukoveg\",\"last_name\":\"933\",\"email\":\"lukoveg933@gmail.com\",\"phone\":\"0999999999\",\"gender\":\"male\",\"birthday\":\"2018-07-15\",\"password\":\"$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36\",\"country\":\"Tanzania\",\"remember_token\":null,\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/4?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:24', '2018-10-23 16:05:24'),
(19, 'App\\User', 1, 'deleted', 'App\\User', 3, '{\"id\":3,\"first_name\":\"Humphrey\",\"last_name\":\"Augustine\",\"email\":\"hajmocube@gmail.com\",\"phone\":\"0785983869\",\"gender\":\"male\",\"birthday\":\"2018-07-17\",\"password\":\"$2y$10$NbjNMO\\/.78E2qcVfgFRMzuHIDHfIlkC13Yov.MnTTVA.em8fQGC3C\",\"country\":\"Tanzania\",\"remember_token\":\"LouYZsHBdlCqNq0EMYls5NTgjPE6lEwYUy8DLi7Rp82bBuxiTGUGyCbB8cb4\",\"creator_id\":1}', '[]', 'http://127.0.0.1:8000/settings/users/3?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:27', '2018-10-23 16:05:27'),
(20, 'App\\User', 1, 'updated', 'App\\User', 2, '{\"first_name\":\"Ivony7\",\"last_name\":\"Sherry\"}', '{\"first_name\":\"admin2\",\"last_name\":\"Admin 2\"}', 'http://127.0.0.1:8000/settings/users/2?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:05:57', '2018-10-23 16:05:57'),
(21, 'App\\User', 1, 'created', 'App\\Address', 1, '[]', '{\"street\":\"23\",\"address\":\"\",\"state\":\"Kusini Unguja\",\"country\":\"Tanzania\",\"postal_code\":\"33\",\"addressable_id\":2,\"addressable_type\":\"App\\\\User\",\"id\":1}', 'http://127.0.0.1:8000/settings/users/2?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:06:15', '2018-10-23 16:06:15'),
(22, 'App\\User', 1, 'updated', 'App\\Role', 2, '{\"name\":\"Farm Group\",\"title\":\"Farm Group\"}', '{\"name\":\"Normal User\",\"title\":\"Normal User\"}', 'http://127.0.0.1:8000/settings/roles/2?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:07:22', '2018-10-23 16:07:22'),
(23, 'App\\User', 1, 'updated', 'App\\User', 1, '{\"remember_token\":\"b8K6IhFmaTXU8NJgyrCjV13RvCC7oycgCV9WM9LyZ9XHMbzzPqpP3Po18BgC\"}', '{\"remember_token\":\"XejpHsSmKYhZ92cmuwQ6bOdVN36jWF4LswvOklhbWSQS0DKuZqXBov4QYrYp\"}', 'http://127.0.0.1:8000/logout?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:07:43', '2018-10-23 16:07:43'),
(24, 'App\\User', 1, 'updated', 'App\\User', 1, '{\"remember_token\":\"XejpHsSmKYhZ92cmuwQ6bOdVN36jWF4LswvOklhbWSQS0DKuZqXBov4QYrYp\"}', '{\"remember_token\":\"BP2cpI2gjD6Dyu1ooXcqC5umuMcp1CIFsikijkwb0AX3YG0Bbzs2dB5QeQEK\"}', 'http://127.0.0.1:8000/logout?', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', NULL, '2018-10-23 16:13:11', '2018-10-23 16:13:11');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_29_183330_create_addresses_table', 1),
(4, '2018_05_30_090730_create_bouncer_tables', 1),
(5, '2018_05_30_172904_create_audits_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `ability_id` int(10) UNSIGNED NOT NULL,
  `entity_id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forbidden` tinyint(1) NOT NULL DEFAULT '0',
  `scope` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`ability_id`, `entity_id`, `entity_type`, `forbidden`, `scope`) VALUES
(1, 1, 'roles', 0, NULL),
(2, 2, 'roles', 0, NULL),
(3, 2, 'roles', 0, NULL),
(4, 2, 'roles', 0, NULL),
(5, 2, 'roles', 0, NULL),
(6, 2, 'roles', 0, NULL),
(7, 2, 'roles', 0, NULL),
(8, 2, 'roles', 0, NULL),
(9, 2, 'roles', 0, NULL),
(10, 2, 'roles', 0, NULL),
(11, 2, 'roles', 0, NULL),
(12, 2, 'roles', 0, NULL),
(13, 2, 'roles', 0, NULL),
(14, 3, 'roles', 0, NULL),
(15, 3, 'roles', 0, NULL),
(16, 3, 'roles', 0, NULL),
(17, 3, 'roles', 0, NULL),
(18, 3, 'roles', 0, NULL),
(19, 3, 'roles', 0, NULL),
(2, 4, 'roles', 0, NULL),
(3, 4, 'roles', 0, NULL),
(4, 4, 'roles', 0, NULL),
(20, 4, 'roles', 0, NULL),
(5, 4, 'roles', 0, NULL),
(6, 4, 'roles', 0, NULL),
(7, 4, 'roles', 0, NULL),
(21, 4, 'roles', 0, NULL),
(22, 4, 'roles', 0, NULL),
(23, 4, 'roles', 0, NULL),
(24, 4, 'roles', 0, NULL),
(25, 4, 'roles', 0, NULL),
(8, 4, 'roles', 0, NULL),
(9, 4, 'roles', 0, NULL),
(10, 4, 'roles', 0, NULL),
(26, 4, 'roles', 0, NULL),
(27, 4, 'roles', 0, NULL),
(28, 4, 'roles', 0, NULL),
(29, 4, 'roles', 0, NULL),
(30, 4, 'roles', 0, NULL),
(11, 4, 'roles', 0, NULL),
(12, 4, 'roles', 0, NULL),
(13, 4, 'roles', 0, NULL),
(31, 4, 'roles', 0, NULL),
(2, 5, 'roles', 0, NULL),
(14, 5, 'roles', 0, NULL),
(15, 5, 'roles', 0, NULL),
(16, 5, 'roles', 0, NULL),
(32, 5, 'roles', 0, NULL),
(17, 5, 'roles', 0, NULL),
(18, 5, 'roles', 0, NULL),
(19, 5, 'roles', 0, NULL),
(33, 5, 'roles', 0, NULL),
(5, 5, 'roles', 0, NULL),
(6, 5, 'roles', 0, NULL),
(7, 5, 'roles', 0, NULL),
(21, 5, 'roles', 0, NULL),
(34, 5, 'roles', 0, NULL),
(35, 5, 'roles', 0, NULL),
(36, 5, 'roles', 0, NULL),
(37, 5, 'roles', 0, NULL),
(38, 5, 'roles', 0, NULL),
(39, 5, 'roles', 0, NULL),
(40, 5, 'roles', 0, NULL),
(41, 5, 'roles', 0, NULL),
(27, 5, 'roles', 0, NULL),
(28, 5, 'roles', 0, NULL),
(29, 5, 'roles', 0, NULL),
(30, 5, 'roles', 0, NULL),
(2, 6, 'roles', 0, NULL),
(3, 6, 'roles', 0, NULL),
(20, 6, 'roles', 0, NULL),
(14, 6, 'roles', 0, NULL),
(15, 6, 'roles', 0, NULL),
(16, 6, 'roles', 0, NULL),
(32, 6, 'roles', 0, NULL),
(17, 6, 'roles', 0, NULL),
(18, 6, 'roles', 0, NULL),
(19, 6, 'roles', 0, NULL),
(33, 6, 'roles', 0, NULL),
(5, 6, 'roles', 0, NULL),
(34, 6, 'roles', 0, NULL),
(35, 6, 'roles', 0, NULL),
(36, 6, 'roles', 0, NULL),
(37, 6, 'roles', 0, NULL),
(38, 6, 'roles', 0, NULL),
(39, 6, 'roles', 0, NULL),
(40, 6, 'roles', 0, NULL),
(41, 6, 'roles', 0, NULL),
(27, 6, 'roles', 0, NULL),
(28, 6, 'roles', 0, NULL),
(29, 6, 'roles', 0, NULL),
(30, 6, 'roles', 0, NULL),
(42, 2, 'roles', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(10) UNSIGNED DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `title`, `level`, `scope`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'System administrator', 1, NULL, 'Responsible for the upkeep, configuration, and reliable operation of the systems; The system administrator seeks to ensure that the uptime, performance, resources, and security of the computers they manage meet the needs of the users.', '2018-07-25 07:56:42', '2018-07-25 07:56:42'),
(2, 'Normal User', 'Normal User', NULL, NULL, 'Farm Group', '2018-07-29 17:07:27', '2018-10-23 16:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `gender`, `birthday`, `password`, `country`, `remember_token`, `creator_id`, `created_at`, `updated_at`) VALUES
(1, 'Admin ', 'Admin', 'admin@homeverge.co.tz', '+1-946-643-5710', 'male', '1988-08-08', '$2y$10$l.WU4Y5swdbVqIZFZp1/Zu07m5sZaX3bwWnVXeXeMJUj8Od04VaiC', 'Serbia', 'BP2cpI2gjD6Dyu1ooXcqC5umuMcp1CIFsikijkwb0AX3YG0Bbzs2dB5QeQEK', NULL, '2018-07-25 04:56:43', '2018-07-25 04:56:43'),
(2, 'admin2', 'Admin 2', 'ivona@gmail.com', '0754455332', 'male', '1987-07-25', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', 'Tanzania', 'alAsGppYHKr6myHLmKBlqqzSMXfSUil0CHGLYzOHUfdV0cdiGUKAaUPdn7dv', 1, '2018-07-25 10:14:46', '2018-10-23 16:05:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abilities`
--
ALTER TABLE `abilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `abilities_scope_index` (`scope`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_addressable_type_addressable_id_index` (`addressable_type`(191),`addressable_id`);

--
-- Indexes for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  ADD KEY `assigned_roles_entity_index` (`entity_id`,`entity_type`,`scope`),
  ADD KEY `assigned_roles_role_id_index` (`role_id`),
  ADD KEY `assigned_roles_scope_index` (`scope`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_user_type_user_id_index` (`user_type`(191),`user_id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`(191),`auditable_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD KEY `permissions_entity_index` (`entity_id`,`entity_type`,`scope`),
  ADD KEY `permissions_ability_id_index` (`ability_id`),
  ADD KEY `permissions_scope_index` (`scope`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`,`scope`),
  ADD KEY `roles_scope_index` (`scope`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abilities`
--
ALTER TABLE `abilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  ADD CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
