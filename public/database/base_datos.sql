-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para smart_restaurante
CREATE DATABASE IF NOT EXISTS `smart_restaurante` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `smart_restaurante`;

-- Volcando estructura para tabla smart_restaurante.company_information
CREATE TABLE IF NOT EXISTS `company_information` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cellphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slogan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slogan_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.company_information: ~0 rows (aproximadamente)
DELETE FROM `company_information`;
/*!40000 ALTER TABLE `company_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_information` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `td` enum('CC','TI','RC','CE','PA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.customers: ~0 rows (aproximadamente)
DELETE FROM `customers`;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.discounts
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `porcentage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.discounts: ~0 rows (aproximadamente)
DELETE FROM `discounts`;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.dishes
CREATE TABLE IF NOT EXISTS `dishes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` enum('small','big','median') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_menu` bigint(20) unsigned DEFAULT NULL,
  `id_dishes_category` bigint(20) unsigned DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dishes_id_menu_foreign` (`id_menu`),
  KEY `dishes_id_dishes_category_foreign` (`id_dishes_category`),
  CONSTRAINT `dishes_id_dishes_category_foreign` FOREIGN KEY (`id_dishes_category`) REFERENCES `dishes_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dishes_id_menu_foreign` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.dishes: ~3 rows (aproximadamente)
DELETE FROM `dishes`;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` (`id`, `photo`, `name`, `size`, `description`, `price`, `id_menu`, `id_dishes_category`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Carne oreada', 'small', 'qweqwe', '12121', NULL, 122, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, NULL, 'Arroz chino', 'small', 'asdasd', '12121', NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, NULL, 'Pollo apanado', 'small', 'zxczxczxc', '12121', NULL, 123, NULL, NULL, NULL, NULL, NULL, NULL),
	(4, NULL, 'mute santandereano', 'big', 'asdasdasd', '121212', NULL, 122, NULL, NULL, NULL, NULL, '2020-07-17 23:54:28', '2020-07-17 23:54:28');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.dishes_category
CREATE TABLE IF NOT EXISTS `dishes_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.dishes_category: ~2 rows (aproximadamente)
DELETE FROM `dishes_category`;
/*!40000 ALTER TABLE `dishes_category` DISABLE KEYS */;
INSERT INTO `dishes_category` (`id`, `photo`, `name`, `color`, `description`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(122, 'dishes_category1594686934.png', 'Entrada fuerte', '#DD2929', 'Esta es la sopa', NULL, NULL, NULL, NULL, '2020-07-14 00:35:34', '2020-07-16 00:03:59'),
	(123, 'dishes_category1594686955.png', 'Principio', '#DD2929', 'Asá iran lso principios', NULL, NULL, NULL, NULL, '2020-07-14 00:35:55', '2020-07-14 00:54:03');
/*!40000 ALTER TABLE `dishes_category` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_header` bigint(20) unsigned NOT NULL,
  `id_detail` bigint(20) unsigned NOT NULL,
  `id_footer` bigint(20) unsigned NOT NULL,
  `id_table` bigint(20) unsigned NOT NULL,
  `id_discount` bigint(20) unsigned NOT NULL,
  `efectivo` enum('True','False') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pago_electronico_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_pago` enum('True','False') COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado_cocina` enum('True','False') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_id_header_foreign` (`id_header`),
  KEY `invoices_id_detail_foreign` (`id_detail`),
  KEY `invoices_id_footer_foreign` (`id_footer`),
  KEY `invoices_id_table_foreign` (`id_table`),
  KEY `invoices_id_discount_foreign` (`id_discount`),
  CONSTRAINT `invoices_id_detail_foreign` FOREIGN KEY (`id_detail`) REFERENCES `invoice_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoices_id_discount_foreign` FOREIGN KEY (`id_discount`) REFERENCES `discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoices_id_footer_foreign` FOREIGN KEY (`id_footer`) REFERENCES `invoice_footer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoices_id_header_foreign` FOREIGN KEY (`id_header`) REFERENCES `invoice_header` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoices_id_table_foreign` FOREIGN KEY (`id_table`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.invoices: ~0 rows (aproximadamente)
DELETE FROM `invoices`;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.invoice_detail
CREATE TABLE IF NOT EXISTS `invoice_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `dishes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.invoice_detail: ~0 rows (aproximadamente)
DELETE FROM `invoice_detail`;
/*!40000 ALTER TABLE `invoice_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_detail` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.invoice_footer
CREATE TABLE IF NOT EXISTS `invoice_footer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `consumption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_iva` bigint(20) unsigned NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_footer_id_iva_foreign` (`id_iva`),
  CONSTRAINT `invoice_footer_id_iva_foreign` FOREIGN KEY (`id_iva`) REFERENCES `iva` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.invoice_footer: ~0 rows (aproximadamente)
DELETE FROM `invoice_footer`;
/*!40000 ALTER TABLE `invoice_footer` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_footer` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.invoice_header
CREATE TABLE IF NOT EXISTS `invoice_header` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_customer` bigint(20) unsigned NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_header_id_customer_foreign` (`id_customer`),
  CONSTRAINT `invoice_header_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.invoice_header: ~0 rows (aproximadamente)
DELETE FROM `invoice_header`;
/*!40000 ALTER TABLE `invoice_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_header` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.iva
CREATE TABLE IF NOT EXISTS `iva` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.iva: ~0 rows (aproximadamente)
DELETE FROM `iva`;
/*!40000 ALTER TABLE `iva` DISABLE KEYS */;
/*!40000 ALTER TABLE `iva` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.menu: ~0 rows (aproximadamente)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.migrations: ~28 rows (aproximadamente)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(5, '2016_06_01_000004_create_oauth_clients_table', 1),
	(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(7, '2019_08_19_000000_create_failed_jobs_table', 1),
	(8, '2020_06_14_172757_customers', 1),
	(9, '2020_06_14_175244_discounts', 1),
	(10, '2020_06_14_175325_invoice_detail', 1),
	(11, '2020_06_14_175346_invoice_header', 1),
	(12, '2020_06_14_175406_invoices', 1),
	(13, '2020_06_14_175425_company_information', 1),
	(14, '2020_06_14_175441_iva', 1),
	(15, '2020_06_14_175458_menu', 1),
	(16, '2020_06_14_175512_tables', 1),
	(17, '2020_06_14_175537_monthly_movements', 1),
	(18, '2020_06_14_175556_invoice_footer', 1),
	(19, '2020_06_14_175645_dishes_category', 1),
	(20, '2020_06_14_175646_dishes', 1),
	(21, '2020_06_14_202532_foreign_key_invoice_header_customer', 1),
	(22, '2020_06_14_202834_foreign_key_invoice_invoice_header', 1),
	(23, '2020_06_14_202917_foreign_key_invoice_invoice_detail', 1),
	(24, '2020_06_14_202941_foreign_key_invoice_invoice_footer', 1),
	(25, '2020_06_14_203020_foreign_key_invoice_table', 1),
	(26, '2020_06_14_203049_foreign_key_invoice_discounts', 1),
	(27, '2020_06_14_203134_foreign_key_invoice_footer_iva', 1),
	(28, '2020_06_14_203221_foreign_key_dishes_menu', 1),
	(29, '2020_06_30_125704_foreign_key_dishes_category_dishes', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.monthle_movements
CREATE TABLE IF NOT EXISTS `monthle_movements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waiter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_invoices` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aucente_turns` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_bills` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.monthle_movements: ~0 rows (aproximadamente)
DELETE FROM `monthle_movements`;
/*!40000 ALTER TABLE `monthle_movements` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthle_movements` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.oauth_access_tokens: ~1 rows (aproximadamente)
DELETE FROM `oauth_access_tokens`;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('b37433d28f50f4a0f14e22d3e096db225dbbd0e0416b894f1cde997162ec348c9fb0fbcb1539b127', 1, 2, NULL, '[]', 0, '2020-07-16 00:02:42', '2020-07-16 00:02:42', '2021-07-16 00:02:42'),
	('b9588b95f24fae1a3f99f7d5edcfdd997b1e261abf007ea505a53049624be8f212fd64ec141bddba', 1, 2, NULL, '[]', 0, '2020-07-17 23:26:43', '2020-07-17 23:26:43', '2021-07-17 23:26:43');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.oauth_auth_codes: ~0 rows (aproximadamente)
DELETE FROM `oauth_auth_codes`;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.oauth_clients: ~2 rows (aproximadamente)
DELETE FROM `oauth_clients`;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'temeEDzrClZnTLdix5zW8Y2k1RZXuPhdUxhhMmn2', 'http://localhost', 1, 0, 0, '2020-06-30 13:46:47', '2020-06-30 13:46:47'),
	(2, NULL, 'Laravel Password Grant Client', 'RCypNmcwREa7xnIiLulLdvQjtx1xxNMpZxmp7E8L', 'http://localhost', 0, 1, 0, '2020-06-30 13:46:47', '2020-06-30 13:46:47');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.oauth_personal_access_clients: ~0 rows (aproximadamente)
DELETE FROM `oauth_personal_access_clients`;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2020-06-30 13:46:47', '2020-06-30 13:46:47');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.oauth_refresh_tokens: ~39 rows (aproximadamente)
DELETE FROM `oauth_refresh_tokens`;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
	('0b222858c40ed95cf220af672e7c6683ec205e406981a8073ed15fef32fb3ebbba9957f170c12322', '0ed5166b0d857dea083b8e47568b7aba10df7136a688753d09eadeb9615ebc2dd41bdd0543a32f54', 0, '2021-07-13 21:37:20'),
	('122f7dc604a3aea5b962793cc23ffa8f78dcc2be169aa988b0d35d140365db29a8598bf341fba5e1', '8f30c9f0d3acea1ff52086b2eae2e27b74efc82fa839e99cb6aad22f8e5c48077740abfeb6cd331f', 0, '2021-07-03 17:22:06'),
	('1371bfeaafc7b33e4deaa27db4d16a9c9dee86de70209b70f2a9d487e2e235c1c884e2ba2ada017f', '3d588c58abbd100d75e00486e50a8ac680de753f3262d697bd47b649bd70012cb9857c50c4eab5a7', 0, '2021-07-11 21:19:53'),
	('1414d91c7a24437f756f55299e85b54fa3c86aa5b2839113fcf63567c271d80de6c8d728d75d926b', '08fa5bd8116ec0085be15fc4abd28da96726dcfbce18fe02646d4ea58f5813a097995457a7ff131d', 0, '2021-07-09 21:18:13'),
	('144b7678b9f5e28dc163434590f70eb0ec86c566295ac992ac5a17cb0f6a1d31ead2dbcaa79bf85d', 'bf4d2678d7aaebdc1b79d4a116f60e49c2b52a6f78d71132644fdb7ba9eb9c189029931cc5530bc8', 0, '2021-07-05 20:26:30'),
	('165cce5859104bf8328e5a00f3d6b3f3b8c1e16f931a078c26a0a45ae08d1b2274a44e9b93322820', 'cfce429c6b1a4cbb06515ae9018ef198f8e03124847416baac93eae93b9a7646ba976e8ee6d6abb2', 0, '2021-07-14 22:30:42'),
	('18b8eab8c19e9dd1bfcaa48d9fabf6db58162db2f0b82a608c2ec19232c4dbb97a25ea61deadae52', 'b9588b95f24fae1a3f99f7d5edcfdd997b1e261abf007ea505a53049624be8f212fd64ec141bddba', 0, '2021-07-17 23:26:43'),
	('25fa610cbe00f788bcd59e60d0bc2c82ed73dbf31e322b14d739dc92a6d4c3167c126b87511afdf6', '5fa29755b78d47a6d9a3e51097e8f5f3eb6b2140391247dcad779375e94e6da8a05d2b5c7f7393bf', 0, '2021-07-07 21:18:14'),
	('39df66f36ca6ffc00cbd64e2b6b8d02138d6f00f32bd296f2732dbec6425237412ccc6d71f8125b7', '567505557d066fdb6bccf6da5c0728ee383ccea6839855847d56669a6f86f12eb3866a4f39213b19', 0, '2021-07-13 20:37:24'),
	('3b65a392c155b6bb00da25c107490da25f884ebe442812d2806bfb8c673d0d292216c20d87c74ebc', '22d7637ea07e2f1b9df6d029c43ce4e99e648cc92bae2f1a835af0d23bf97a4f72d29f722933d459', 0, '2021-07-10 21:08:14'),
	('3cf5a58102c78813ab297ee2ce26c98fd2c687ef94236343d4662a0f12cbb8830cc9410e3f9c800c', '951da3553e965589a7956ee788fc5c488534a7ec6d8674c69b8d6d0521ba783a441b36bb43995365', 0, '2021-07-04 16:42:32'),
	('418c346f3d2e51740b77630d7083f54b2dede852d12d939fc7b2622fc578bc3e148f79c23d500d81', 'a4ec588bab2e19b9bece51e681916efad4977c52455627b13f5b7779bc5df685ec92b11cdc5365b5', 0, '2021-07-11 22:41:36'),
	('491e582d4e8099a9aef8acb24eb08374ae428d3b55f25fdd0dd6f428dccf6ba140fd500d763d22e7', '46aada1e7898e632719437491fda4191b32837bce4cde6db4da06e90b7531f078d9c25710b24f75a', 0, '2021-07-12 02:13:47'),
	('56a972b3d1989e741a6dc23913bbc64d3e5a223028529cf70ac39486720a963e7c8dfcb7a3201efb', 'e7cd5e06e5d1bd8b00b3d76315d459c184f3e2b55282e70566fea9410750bce54bcc99d354a9d066', 0, '2021-07-13 23:05:23'),
	('56c279eb4a65cd56e524cd5dcc6de520b60e0dfc41ce8405bce4b167a1713ccd771d957ae9e3fc38', 'd11f9c3741c3d2a8c7744212fc6c2eb0b4f51232c6688b9f695c4e7cf4dc51fb00733538428977a9', 0, '2021-07-14 20:03:16'),
	('5bffff5beefa1bed69bc80e91dcb1d07589f36bbf454487bb39c43b6b4d814f39f296cbe20f28910', '66f75a352895159f1f64dfbee5717a41f5b90da8bec9e1adb1b660e305d492aa2641a720b7c57f59', 0, '2021-07-05 19:57:09'),
	('5dc460f3e17b44921d34034b6d9f3e5581f4f372b34c9ed290a69c4410e965ea133d291360cd85bd', '6d8fd2eef20570757bf248058eba8995b46b91e24dd3c104f64cb61a5e737839fa62164a5443e540', 0, '2021-07-03 17:11:10'),
	('6105eec9b65d81b9cc4c2936fbbe729459c9f76bcd3a7282caf5d71f92ac645cbc858169b7739854', '9b5df110f0ae524c44f16b26a39667ef44162cb736d65d843db95a7be36ad68895da477e250d74b6', 0, '2021-07-03 16:26:00'),
	('66500e1b62c07a636169f7ebde7606474713425605b08582402310d3914b56174b32783948920203', 'd8b94bb28a21b5c80f233c9bd665ef82dc33c028ed121c1242491b32b935051c2192375e6c325bef', 0, '2021-07-04 17:01:13'),
	('66d9b1b6222ab779a804f279a41b9b62e134605e73dad75c6ebcbab7b5c2b4651415de97190bab8c', 'c1c5411344a60fce8fffb88dddef721acf29ae7f51824c8b4b64d9fdac25bf96a9edcf856265ea97', 0, '2021-07-09 23:19:13'),
	('6b0486f75c0e92149fee1bb6d95fae4f8e7e459365c9c8154e5d4b3a687515155d32ad27b66a4d16', '93606dc8d5cb4da6f3ec0eac74e651e052ca8f7dd1a2264e41209bfd0ee41988d77aee1235d7f0f8', 0, '2021-07-12 03:09:03'),
	('71d837405563acd9e58b6e979a32a315072e41c11ecd3d71aa31f7b6786549d061d7b703dfd0b38a', '3952622d5952bc67885bf4b124ee00fe983528c0fb062eb428cb2a95cf2976eecbdb82729c547b2c', 0, '2021-07-09 22:21:30'),
	('726dee9ae8fe4c23a359882613a7d4ed08301b4ea60e54492a6765fa0fbb978f7a9e65579f93271a', 'bf943262e5c07a16f7d57b73ebaa5d9a0d1d92f2b5fee556650e5a06f607f4d8aec9fd68ca1fd3a8', 0, '2021-06-30 16:09:06'),
	('7612105c8f13daad510fbb0827c945fdd64fdab78779eaa0d155f93259954b2570abfab594c9b6ef', 'd181470c94ea07017479651d547bb25ad6bc3511678a8da552e29ad2a421635c079bd41bf5b1217b', 0, '2021-07-10 23:26:33'),
	('78b5f37350bf1c139145930bb48fee24601583443cacde32790661e435d76219f823cdfeb18366f8', '17051eaf9fd187859169c850be63440827d9fc5b7d92b7dc3ed95434a42e113737c7b3d32ddf9014', 0, '2021-07-04 17:05:49'),
	('78f54e647f2c4233d47bb6ebb95db295437e821013850209474331b5260343b539d178c05addddf0', '445e9424d6ccae060f9e7ab7cebf93e23ed737b180b52c0daf5a6c1873f294850f630dee25fcb9fe', 0, '2021-07-05 22:06:32'),
	('7aad6d16f9454f70324a82923a264b62bd0cc5714e8e4510f1ef464602fd94b1dd624b2de0b77058', 'f378896685656957f49e303c1214ba7d490f752ba5fcec60b5156659ad0af6945b35473690fa9a4e', 0, '2021-07-12 03:09:14'),
	('811e819f4dcff8908ee05849457fe5826556e4aec5b9824aebe49c9ef4137ba5b04c881c2f832f24', '574628ac4dba2f7533bf1455f83749d666d3ec2bd5b93d32cb9aa7bad012476e0ceaabfcaa780c0d', 0, '2021-06-30 16:34:19'),
	('83bcad71e72a49aec77bd1ace27ff72dbe1d6a1ce7e918cef1e3f14d6b487d140a8ad3cbba2d0bac', '79ba426bbc9408041fafb3615bd6916e54ad2ef3af72bbc9bd0acb2406c8e1429b83c31061e08f06', 0, '2021-07-15 22:48:31'),
	('8cfebfe49b8ffb3330b8981376845d473729252c5dc6ae7b97bd937991970640ed0b7780f370f021', '5d433862607a3faf3cee71508a884fae3b9fd32055c9633d34a7d419784931a51facabef258c23a8', 0, '2021-07-03 17:15:40'),
	('901786c0abbd69cc30fbff433a95e441844f970c91f0924df8653044941c7abc6df3b3207b5664c8', '1417ebf81780d585b28e9dd8259d58b71146917027c4d86f2107795378b59b3ae88b3d8942109d3b', 0, '2021-07-04 16:39:43'),
	('95a87ab6b70b6780c94aa59db7ebe521414c3c904fee4dea454374cdec711f3920fc60f81b75253b', 'e7963acdc85bedaa6783ac89483c9c2428c59a796b5bef5922e7fceb6eadc28cf74c6ac4f7e02583', 0, '2021-07-05 22:02:38'),
	('b076d789d903d2a0227d93e11b8d1ddc04b214c143fdda020fadbce41c2087f5bdfecd77c54ccf79', '6867c1966e000f7132386346c7241cdef55c8d4da4d44f874b2ac9412d5e84f37f22980e70e74327', 0, '2021-07-14 20:03:17'),
	('b208314b8202b54367d544afd11d2074b639cacf0e182581d008a3e3fc7a044300dd9b64e2d91172', 'b5d4963919f49e920965e9708cd8342e960719ed160089c3fbada39f22172f40bdbb45fce81f929d', 0, '2021-07-12 02:53:39'),
	('b769ba18dc07d288bee916ac050edf8d192363d04260511ef0f67a9e127b420441c72fac3054e981', 'e25db7bb437c37b362e715a368bcf5dbbd791372580761dba14bdcec96ffa37d39f9599834f50c0a', 0, '2021-07-09 21:18:13'),
	('b93bbcc22ab9237492d9865297094ab1c27523baf757599171bddf24dd8ae6bd10f2640a127b8961', 'd0db0addce67ffedadf2cd17b1f7fe2592c63529203a76b061d29bd4e36fb341ffd2a77ca3a9f7fe', 0, '2021-07-05 20:26:37'),
	('bb5c5bec740658962207ac75727c0aeb710571749c4c3c2550dad325f42c0b6ab5b78594bd53eec0', '4b048c348ecb7e7b723ccf3727e071c09b2aaf6bd3fdb83ffba75b1d20f0c3c26feeda91cb3d90f4', 0, '2021-07-05 21:58:15'),
	('c59b199373f2d03a9be44014b5db2b5435101bafc6783cbc9726c77108319957f771bcae12a84fe4', '539cc7ce8d2451c4e689a13420a3a8dc7886667f4ce97c56944337760b03a1a80cf88fb839e2e5bb', 0, '2021-07-03 15:55:11'),
	('d0dc2843148bbad64f5488cfc447b77e442bded95fbbf35f8f2cf2916b75716c68b39d4225539d5e', 'b37433d28f50f4a0f14e22d3e096db225dbbd0e0416b894f1cde997162ec348c9fb0fbcb1539b127', 0, '2021-07-16 00:02:42'),
	('dc702d1ad0f642f84da6aa6b3b39e0b14ccdb7b2fe60b518d7d40baf8194a0ca3a58106113b68a33', 'dcd85ad56d8197a5de3e688099c3f32b19dcdb68d4b3098f982334b898d8157eaff25a410c1e2c17', 0, '2021-07-12 00:37:20'),
	('dd5327ac2e24ae2fd1bb25fe3bbfb9ee35d09999dc5e372fcc781347bfcfff4cb0006fe975c18315', '47e5805d74065965dc26e6cf5ea9a74dd476127814a931414509d72d924ee4736e0f0e858207de8e', 0, '2021-07-09 22:23:41'),
	('e0954fcd9ebb728e6cf0a4ab6a7b7851baa53b22e41af8795dad3b7a6cedcc079b7200c1a2f1fc6d', '61db9c8077035e40432654f41c3b9539a2c2f8d9ccbdd2afb451463eddcf8fe38ec0b8060b6a5d5d', 0, '2021-07-14 22:06:29'),
	('e574eea2eb0eee653a6486a9871305414f9c15614df3bc4a2018e7513cf75abbfd21905d3714b068', '9b3f267fd9a16d4c2bf21c924de6271949f2ac5ef5189c0a7fac9ef8d21b6c4c7e3dcf1e992e1d11', 0, '2021-07-11 23:01:22'),
	('e63215fe62dfa509375f457421e802e073e6831fff46090744017affa57050efc9fdaa8abb4c4f29', '6cd9286ffc04e8e158f21436d5b85ae18ca0325d010c0df3629e73d706bbd5692c4d597bd77b7f2e', 0, '2021-07-04 16:42:10'),
	('ebbf48c7cb94758b97fe2dc0e9a7855f8f3a9cc45ded983ad494b891eae3a399969793de2ad4eef6', '0b2c50fa53d8398bcf3db4cc6e61598e2f763c1d0151bd111a86086f5683378f7cf8c3c033689738', 0, '2021-07-11 22:32:31'),
	('f2533834eefeaaa0aafe8c3bb7982474f699112af82526aa00c177aa8c9d630ec64b23e425974e55', '539e81cc5d50c9bf698fe302e05572ce23a13ed0d208763ffb48b494118e6aedd256054ebb21a382', 0, '2021-06-30 13:48:18'),
	('f4066d6f313043ea56e55d3b2a6f2d3622fc20f25ebb365dbdcb2cfce98f84aafea2bc82f6b4440b', 'ce2d2e7c8264d05132b9f2f08da30ea622382d9a17ea007b57760efc7b278a0e023ab6e305a60c30', 0, '2021-07-09 21:18:43'),
	('f44ac9b91e5268b8a1b3bf405813839ca24e1e8764f8716065ff6586cffb62e3dd9b5fd8f1bace89', '92aafea287ca5961f0bb1f6be3ec9639eabe390cfa7edd5688eaf40891fdcd0566908cf04c361b54', 0, '2021-07-11 22:33:11');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.tables
CREATE TABLE IF NOT EXISTS `tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nro_table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nro_chair` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.tables: ~0 rows (aproximadamente)
DELETE FROM `tables`;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `td` enum('CC','TI','RC','CE','PA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cellphone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexo` enum('M','F') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contract_date` date DEFAULT NULL,
  `isSuperAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `isAtm` tinyint(1) NOT NULL DEFAULT '0',
  `isWaiter` tinyint(1) NOT NULL DEFAULT '0',
  `isChef` tinyint(1) NOT NULL DEFAULT '0',
  `isClient` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.users: ~1 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `photo`, `name`, `lastname`, `td`, `dni`, `phone`, `cellphone`, `sexo`, `email`, `email_verified_at`, `password`, `address`, `contract_date`, `isSuperAdmin`, `isAdmin`, `isAtm`, `isWaiter`, `isChef`, `isClient`, `created_by`, `updated_by`, `deleted_by`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Myriam Hintz', 'Dr. Paula Stokes', 'RC', '4', NULL, NULL, 'M', 'hertha19@example.org', '2020-06-30 13:47:14', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '140 Nader Stream Suite 741\nSouth Amina, AR 33949', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, 'moSsd4fQ0i', NULL, '2020-06-30 13:47:14', '2020-06-30 13:47:14'),
	(3, NULL, 'sdsd', 'sdsd', 'CC', '2323', '2323', '2323', 'M', 'qwe@sd.com', NULL, '$2y$10$olKt2ioGVwNUkN2e9u8zC.UGWJOZcWdOzGPvyXJvJjZ2NZxk./8Lm', '12121212', NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2020-07-11 23:21:33', '2020-07-11 23:21:33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
