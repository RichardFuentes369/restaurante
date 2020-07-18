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

-- Volcando datos para la tabla smart_restaurante.dishes: ~0 rows (aproximadamente)
DELETE FROM `dishes`;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` (`id`, `photo`, `name`, `size`, `description`, `price`, `id_menu`, `id_dishes_category`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
  (1, NULL, 'Chanfaina', 'big', 'Sopa muy deliciosa', '1500', NULL, 1, NULL, NULL, NULL, NULL, '2020-07-18 00:25:55', '2020-07-18 00:25:55'),
  (2, NULL, 'Mariscos', 'median', 'asdasdasd', '2533', NULL, 2, NULL, NULL, NULL, NULL, '2020-07-18 00:26:26', '2020-07-18 00:26:26'),
  (3, NULL, 'Muté', 'big', 'esta es la sopa del mué', '25636', NULL, 1, NULL, NULL, NULL, NULL, '2020-07-18 00:27:10', '2020-07-18 00:27:10'),
  (4, NULL, 'Pollo asado', 'median', 'sdsasdsd', '2626', NULL, 2, NULL, NULL, NULL, NULL, '2020-07-18 00:27:27', '2020-07-18 00:27:27'),
  (5, NULL, 'pollo apanado', 'median', 'sadasdasd', '26262', NULL, 2, NULL, NULL, NULL, NULL, '2020-07-18 00:27:53', '2020-07-18 00:27:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.dishes_category: ~0 rows (aproximadamente)
DELETE FROM `dishes_category`;
/*!40000 ALTER TABLE `dishes_category` DISABLE KEYS */;
INSERT INTO `dishes_category` (`id`, `photo`, `name`, `color`, `description`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
  (1, NULL, 'Sopas', '#29DD32', 'acá iran todas las sopas', NULL, NULL, NULL, NULL, '2020-07-18 00:25:06', '2020-07-18 00:25:28'),
  (2, NULL, 'Carnes', '#72E80A', 'acá iran todas las carnes', NULL, NULL, NULL, NULL, '2020-07-18 00:26:13', '2020-07-18 00:26:13');
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

-- Volcando datos para la tabla smart_restaurante.migrations: ~29 rows (aproximadamente)
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

-- Volcando datos para la tabla smart_restaurante.oauth_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `oauth_access_tokens`;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
  ('0401986f15f5b761b4799a22deec9ed4d2d4b0cfdceda73470b7122f06f53cc10fa13e4868fa626b', 1, 2, NULL, '[]', 0, '2020-07-18 00:21:27', '2020-07-18 00:21:27', '2021-07-18 00:21:27'),
  ('a831069c663e1fc4f56c159b5ad428bd2b103f17ed4134dd1818b14ff672d5fd7e30e761f5ae332d', 1, 2, NULL, '[]', 0, '2020-07-18 00:24:23', '2020-07-18 00:24:23', '2021-07-18 00:24:23');
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
  (1, NULL, 'Laravel Personal Access Client', 'xwUWqn5oSQJvPmMf3Zo4MKN3MclutydYsYYN3SIl', 'http://localhost', 1, 0, 0, '2020-07-18 00:20:16', '2020-07-18 00:20:16'),
  (2, NULL, 'Laravel Password Grant Client', 'lq74VA37kKXCKXsvG6FVvUyniCO3Ho37cmIhoRmI', 'http://localhost', 0, 1, 0, '2020-07-18 00:20:16', '2020-07-18 00:20:16');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.oauth_personal_access_clients: ~1 rows (aproximadamente)
DELETE FROM `oauth_personal_access_clients`;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
  (1, 1, '2020-07-18 00:20:16', '2020-07-18 00:20:16');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla smart_restaurante.oauth_refresh_tokens: ~0 rows (aproximadamente)
DELETE FROM `oauth_refresh_tokens`;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
  ('9d6f44d04e548dad5ef3596f9e368014ee0188616176dea9844ac8c218bfdabf5a78474734943d9f', 'a831069c663e1fc4f56c159b5ad428bd2b103f17ed4134dd1818b14ff672d5fd7e30e761f5ae332d', 0, '2021-07-18 00:24:23'),
  ('ebb799ff9445638a4e3b84a6e5a4dce4673168b70bc1b416a3327d5718a7a6daf5ae4e56b689a5a7', '0401986f15f5b761b4799a22deec9ed4d2d4b0cfdceda73470b7122f06f53cc10fa13e4868fa626b', 0, '2021-07-18 00:21:27');
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
  (1, NULL, 'Thomas Langworth', 'Dr. Tabitha Senger II', 'CE', '3', NULL, NULL, 'F', 'gerson.sanford@example.com', '2020-07-18 00:20:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '279 Loraine Mission\nJarredland, IL 31205', NULL, 1, 1, 1, 1, 1, 1, NULL, NULL, NULL, 'LvTHEKGayw', NULL, '2020-07-18 00:20:50', '2020-07-18 00:20:50'),
  (2, NULL, 'Philipino', 'Parraco', 'CC', '10563', '356299', '262656', 'M', 'prueba1@gmail.com', NULL, '$2y$10$vAnLP3FtF0tASfVQjM8aCeY5vzxuvwgbArAed.CvOiOWGioion9wy', 'calele 1211', NULL, 0, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2020-07-18 00:22:56', '2020-07-18 00:22:56'),
  (3, NULL, 'philipense', 'dasd', 'CC', '12122', '123123', '1231231', 'M', '1qweqw@dsd.com', NULL, '$2y$10$1sfaqD5MVSq6L2BhovXgr.Dx/CK7PaVwG0JVG7H4pjifzWnl5.IeC', 'qweeqwe', NULL, 0, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, '2020-07-18 00:23:27', '2020-07-18 00:23:43');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
