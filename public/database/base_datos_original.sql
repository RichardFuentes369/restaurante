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


-- Volcando estructura de base de datos para smart_restaurante2
CREATE DATABASE IF NOT EXISTS `smart_restaurante2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `smart_restaurante2`;

-- Volcando estructura para tabla smart_restaurante2.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL,
  `nombres` int(11) DEFAULT NULL,
  `apellidos` int(11) DEFAULT NULL,
  `email` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `fecha_nacimiento` int(11) DEFAULT NULL,
  `td` int(11) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.clientes: ~0 rows (aproximadamente)
DELETE FROM `clientes`;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.descuentos
CREATE TABLE IF NOT EXISTS `descuentos` (
  `id` int(11) NOT NULL,
  `descripcion` int(11) DEFAULT NULL,
  `nombre` int(11) DEFAULT NULL,
  `porcentaje` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `created_by` varchar(50) NOT NULL DEFAULT '',
  `updated_at` date NOT NULL,
  `updated_by` varchar(50) NOT NULL DEFAULT '',
  `deleted_at` date NOT NULL,
  `deleted_by` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.descuentos: ~0 rows (aproximadamente)
DELETE FROM `descuentos`;
/*!40000 ALTER TABLE `descuentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `descuentos` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.detalle_factura
CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plato` varchar(50) NOT NULL DEFAULT '0',
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `precio` double NOT NULL DEFAULT '0',
  KEY `Índice 1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.detalle_factura: ~0 rows (aproximadamente)
DELETE FROM `detalle_factura`;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.encabezado_factura
CREATE TABLE IF NOT EXISTS `encabezado_factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.encabezado_factura: ~0 rows (aproximadamente)
DELETE FROM `encabezado_factura`;
/*!40000 ALTER TABLE `encabezado_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `encabezado_factura` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.facturas
CREATE TABLE IF NOT EXISTS `facturas` (
  `id` int(11) NOT NULL,
  `id_encabezado` int(11) DEFAULT NULL,
  `id_detalle` int(11) DEFAULT NULL,
  `id_pie` int(11) DEFAULT NULL,
  `id_mesa` int(11) DEFAULT NULL,
  `id_descuento` int(11) DEFAULT NULL,
  `efectivo` enum('Y','N') DEFAULT NULL,
  `pago_electronico_no` varchar(50) DEFAULT NULL COMMENT 'si el efectivo sale no entonces pago electornicamente, aca ira ese numero del baucher',
  `estado_de_pago` enum('Y','N') NOT NULL DEFAULT 'N',
  `estado_de_cocina` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `fk_encabezado` (`id_encabezado`),
  KEY `fk_detalle` (`id_detalle`),
  KEY `fk_pie` (`id_pie`),
  KEY `fk_mesa` (`id_mesa`),
  KEY `fk_desceunto` (`id_descuento`),
  CONSTRAINT `fk_desceunto` FOREIGN KEY (`id_descuento`) REFERENCES `descuentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detalle` FOREIGN KEY (`id_detalle`) REFERENCES `detalle_factura` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_encabezado` FOREIGN KEY (`id_encabezado`) REFERENCES `encabezado_factura` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mesa` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pie` FOREIGN KEY (`id_pie`) REFERENCES `pie_factura` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.facturas: ~0 rows (aproximadamente)
DELETE FROM `facturas`;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.informacion_de_la_empresa
CREATE TABLE IF NOT EXISTS `informacion_de_la_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL COMMENT 'url',
  `slogan` varchar(50) DEFAULT NULL COMMENT 'texto',
  `slogan_color` varchar(50) DEFAULT NULL COMMENT '#fff',
  `fondo` enum('1','2') DEFAULT '1' COMMENT '1 color, 2 imagen',
  `fondo_color` varchar(50) DEFAULT NULL,
  `fondo_imagen` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.informacion_de_la_empresa: ~0 rows (aproximadamente)
DELETE FROM `informacion_de_la_empresa`;
/*!40000 ALTER TABLE `informacion_de_la_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacion_de_la_empresa` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.iva
CREATE TABLE IF NOT EXISTS `iva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `porcentaje` double DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.iva: ~0 rows (aproximadamente)
DELETE FROM `iva`;
/*!40000 ALTER TABLE `iva` DISABLE KEYS */;
/*!40000 ALTER TABLE `iva` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.menus: ~0 rows (aproximadamente)
DELETE FROM `menus`;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.mesas
CREATE TABLE IF NOT EXISTS `mesas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_mesa` varchar(50) DEFAULT '0',
  `sillas` int(11) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT '0',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.mesas: ~0 rows (aproximadamente)
DELETE FROM `mesas`;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.movimientos_mensuales_empleado
CREATE TABLE IF NOT EXISTS `movimientos_mensuales_empleado` (
  `id` int(11) DEFAULT NULL,
  `anho` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `mesero` int(11) DEFAULT NULL,
  `cantidad_facturas` int(11) DEFAULT NULL,
  `turnos_aucentes` int(11) DEFAULT NULL,
  `total_facturas` int(11) DEFAULT NULL,
  `total_sueldo` int(11) DEFAULT NULL,
  `no_pagare` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.movimientos_mensuales_empleado: ~0 rows (aproximadamente)
DELETE FROM `movimientos_mensuales_empleado`;
/*!40000 ALTER TABLE `movimientos_mensuales_empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_mensuales_empleado` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.pie_factura
CREATE TABLE IF NOT EXISTS `pie_factura` (
  `id` int(11) NOT NULL,
  `consumo` int(11) DEFAULT NULL,
  `id_iva` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_iva` (`id_iva`),
  CONSTRAINT `fk_iva` FOREIGN KEY (`id_iva`) REFERENCES `iva` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.pie_factura: ~0 rows (aproximadamente)
DELETE FROM `pie_factura`;
/*!40000 ALTER TABLE `pie_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `pie_factura` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.platos
CREATE TABLE IF NOT EXISTS `platos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `tamano` varchar(50) NOT NULL DEFAULT '0',
  `descripcion` varchar(50) NOT NULL DEFAULT '0',
  `precio` double NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `activo` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_by` varchar(50) NOT NULL DEFAULT '0',
  `created_at` date NOT NULL,
  `updated_by` varchar(50) NOT NULL DEFAULT '0',
  `updated_at` date NOT NULL,
  `deleted_by` varchar(50) NOT NULL DEFAULT '0',
  `deleted_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_platos` (`menu_id`),
  CONSTRAINT `fk_menu_platos` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.platos: ~0 rows (aproximadamente)
DELETE FROM `platos`;
/*!40000 ALTER TABLE `platos` DISABLE KEYS */;
/*!40000 ALTER TABLE `platos` ENABLE KEYS */;

-- Volcando estructura para tabla smart_restaurante2.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `td` enum('cc','ce','ti') DEFAULT NULL,
  `dni` varchar(50) DEFAULT NULL,
  `fijo` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `fecha_contrato` date DEFAULT NULL,
  `isSuperAdmin` enum('Y','N') DEFAULT NULL,
  `isAdmin` enum('Y','N') DEFAULT NULL,
  `isCajero` enum('Y','N') DEFAULT NULL,
  `isMesero` enum('Y','N') DEFAULT NULL,
  `isChef` enum('Y','N') DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla smart_restaurante2.usuarios: ~0 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
