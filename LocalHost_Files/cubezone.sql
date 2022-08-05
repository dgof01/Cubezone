-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 05, 2022 at 05:09 AM
-- Server version: 8.0.25
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cubezone`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add cliente', 7, 'add_cliente'),
(26, 'Can change cliente', 7, 'change_cliente'),
(27, 'Can delete cliente', 7, 'delete_cliente'),
(28, 'Can view cliente', 7, 'view_cliente'),
(29, 'Can add perfil', 8, 'add_perfil'),
(30, 'Can change perfil', 8, 'change_perfil'),
(31, 'Can delete perfil', 8, 'delete_perfil'),
(32, 'Can view perfil', 8, 'view_perfil'),
(33, 'Can add producto', 9, 'add_producto'),
(34, 'Can change producto', 9, 'change_producto'),
(35, 'Can delete producto', 9, 'delete_producto'),
(36, 'Can view producto', 9, 'view_producto'),
(37, 'Can add csv', 10, 'add_csv'),
(38, 'Can change csv', 10, 'change_csv'),
(39, 'Can delete csv', 10, 'delete_csv'),
(40, 'Can view csv', 10, 'view_csv'),
(41, 'Can add venta', 11, 'add_venta'),
(42, 'Can change venta', 11, 'change_venta'),
(43, 'Can delete venta', 11, 'delete_venta'),
(44, 'Can view venta', 11, 'view_venta'),
(45, 'Can add orden', 12, 'add_orden'),
(46, 'Can change orden', 12, 'change_orden'),
(47, 'Can delete orden', 12, 'delete_orden'),
(48, 'Can view orden', 12, 'view_orden'),
(49, 'Can add ordenes', 12, 'add_ordenes'),
(50, 'Can change ordenes', 12, 'change_ordenes'),
(51, 'Can delete ordenes', 12, 'delete_ordenes'),
(52, 'Can view ordenes', 12, 'view_ordenes'),
(53, 'Can add reporte', 13, 'add_reporte'),
(54, 'Can change reporte', 13, 'change_reporte'),
(55, 'Can delete reporte', 13, 'delete_reporte'),
(56, 'Can view reporte', 13, 'view_reporte');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$zHJV15W3ka4NlgLDSd1qHv$xwJnTYI9Y6I5V3WjtS/EXWfCUqHv7BT/9KkiJyo45FI=', '2022-08-05 04:59:27.887013', 1, 'testUser', 'TestName', 'TestLastName', 'test@example.com', 1, 1, '2021-07-30 23:26:24.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clientes_cliente`
--

DROP TABLE IF EXISTS `clientes_cliente`;
CREATE TABLE IF NOT EXISTS `clientes_cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `primerApellido` varchar(120) NOT NULL,
  `segundoApellido` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clientes_cliente`
--

INSERT INTO `clientes_cliente` (`id`, `nombre`, `foto`, `correo`, `primerApellido`, `segundoApellido`) VALUES
(36, 'First', 'sin_foto.png', 'firstclient@example.com', 'Client', 'Example'),
(37, 'Second', 'sin_foto.png', 'secondClient@example.com', 'Cient', 'Example'),
(38, 'Third', 'sin_foto.png', 'thirdClient@example.com', 'Client', 'Example');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'clientes', 'cliente'),
(5, 'contenttypes', 'contenttype'),
(8, 'perfiles', 'perfil'),
(9, 'productos', 'producto'),
(13, 'reportes', 'reporte'),
(6, 'sessions', 'session'),
(10, 'ventas', 'csv'),
(12, 'ventas', 'orden'),
(11, 'ventas', 'venta');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-07-30 23:23:39.926273'),
(2, 'auth', '0001_initial', '2021-07-30 23:23:41.119036'),
(3, 'admin', '0001_initial', '2021-07-30 23:23:41.517899'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-07-30 23:23:41.531663'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-07-30 23:23:41.543068'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-07-30 23:23:41.691059'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-07-30 23:23:41.781076'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-07-30 23:23:41.822679'),
(9, 'auth', '0004_alter_user_username_opts', '2021-07-30 23:23:41.833684'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-07-30 23:23:41.913042'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-07-30 23:23:41.918679'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-07-30 23:23:41.929681'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-07-30 23:23:42.037577'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-07-30 23:23:42.319266'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-07-30 23:23:42.411074'),
(16, 'auth', '0011_update_proxy_permissions', '2021-07-30 23:23:42.435412'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-07-30 23:23:42.661547'),
(18, 'sessions', '0001_initial', '2021-07-30 23:23:42.764624'),
(19, 'clientes', '0001_initial', '2021-07-31 00:11:23.059092'),
(20, 'clientes', '0002_auto_20210730_1923', '2021-07-31 00:23:12.989207'),
(21, 'clientes', '0003_auto_20210730_1924', '2021-07-31 00:24:42.670082'),
(22, 'perfiles', '0001_initial', '2021-07-31 00:36:48.690261'),
(23, 'productos', '0001_initial', '2021-07-31 00:56:38.045222'),
(24, 'ventas', '0001_initial', '2021-07-31 01:25:38.289272'),
(25, 'ventas', '0002_rename_orden_ordenes', '2021-07-31 01:28:54.678942'),
(26, 'ventas', '0003_rename_ordenes_orden', '2021-07-31 01:29:33.789202'),
(27, 'reportes', '0001_initial', '2021-07-31 05:14:27.075061');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0qsz0zkchuetjr8ggrd3fkds8gt8zemb', '.eJxVjDsOwjAQRO_iGln-xD9K-pzB8nrXOIAcKU4qxN1JpBTQjea9mTeLaVtr3DotcUJ2ZZJdfjtI-UntAPhI7T7zPLd1mYAfCj9p5-OM9Lqd7t9BTb3ua1LoNUlThEKRcI9ekcta6CxckclmVwySRIkqoAGwMHiXgwWCQQdkny_0DziJ:1mDc1s:UC2KWHPX9-gkQTbgyXDK0ICGQ_7tCHKa_HK7900n8QU', '2021-08-25 00:23:32.557017'),
('io07glxpuszbyt85dkon1pb66sor1jt6', '.eJxVjDsOwjAQRO_iGln-xD9K-pzB8nrXOIAcKU4qxN1JpBTQjea9mTeLaVtr3DotcUJ2ZZJdfjtI-UntAPhI7T7zPLd1mYAfCj9p5-OM9Lqd7t9BTb3ua1LoNUlThEKRcI9ekcta6CxckclmVwySRIkqoAGwMHiXgwWCQQdkny_0DziJ:1m9bxe:mlScHrnK7VBV8H9VFQehixmregRCvf_fk7CTlsSDVH4', '2021-08-13 23:30:38.404612'),
('jyshs5kdo0gg2bp2vbzfl6f582crhw27', '.eJxVjMsOwiAQRf-FtSHQ4sC4dO83EJgZpGrapI-V8d-lSRe6Pefc-1YxbWuN2yJzHFhdlFWnX5YTPWXcBT_SeJ80TeM6D1nviT7som8Ty-t6tH8HNS21rT30RSxZLo5AxCM4Mix9hxiC4eITUHIBuoIut7ZhZ7AHhnJGMqg-X-t1N6k:1oJpQl:t7LvMWR2lafKGpsoZU2_LwPSgB4OV1S6gDa_q706Ucc', '2022-08-19 04:59:27.893008'),
('ka6f6c6zg8xpfjgsyrsxbcnty67uxpnp', '.eJxVjDsOwjAQRO_iGln-xD9K-pzB8nrXOIAcKU4qxN1JpBTQjea9mTeLaVtr3DotcUJ2ZZJdfjtI-UntAPhI7T7zPLd1mYAfCj9p5-OM9Lqd7t9BTb3ua1LoNUlThEKRcI9ekcta6CxckclmVwySRIkqoAGwMHiXgwWCQQdkny_0DziJ:1mDsbz:FVz1V1S7EiA5g6_SnY01hqSpr9GiLfIrwr_KIkNBr60', '2021-08-25 18:05:55.105529'),
('leybl3d4js38q049gekaa0fh3y3xnssl', '.eJxVjDsOwjAQRO_iGln-xD9K-pzB8nrXOIAcKU4qxN1JpBTQjea9mTeLaVtr3DotcUJ2ZZJdfjtI-UntAPhI7T7zPLd1mYAfCj9p5-OM9Lqd7t9BTb3ua1LoNUlThEKRcI9ekcta6CxckclmVwySRIkqoAGwMHiXgwWCQQdkny_0DziJ:1mK2mX:kdBJvDu5dKTZ5XyKM647f4Z2OyZgPxyrxrpvazzRYoQ', '2021-09-11 18:10:17.607527'),
('yrw77sv8nq7yeb7jr8dy9zs9s8xtze9c', '.eJxVjDsOwjAQRO_iGln-xD9K-pzB8nrXOIAcKU4qxN1JpBTQjea9mTeLaVtr3DotcUJ2ZZJdfjtI-UntAPhI7T7zPLd1mYAfCj9p5-OM9Lqd7t9BTb3ua1LoNUlThEKRcI9ekcta6CxckclmVwySRIkqoAGwMHiXgwWCQQdkny_0DziJ:1mplkh:c0el4Dds3xqAxxUVSKhI_FPKlfmLggv0RlH8X4Aj63k', '2021-12-08 06:27:31.182038');

-- --------------------------------------------------------

--
-- Table structure for table `perfiles_perfil`
--

DROP TABLE IF EXISTS `perfiles_perfil`;
CREATE TABLE IF NOT EXISTS `perfiles_perfil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `info` longtext NOT NULL,
  `foto` varchar(100) NOT NULL,
  `creado` datetime(6) NOT NULL,
  `actualizado` datetime(6) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `perfiles_perfil`
--

INSERT INTO `perfiles_perfil` (`id`, `info`, `foto`, `creado`, `actualizado`, `usuario_id`) VALUES
(1, 'Administrador de la aplicación, encargado de la administración.', 'fotosDeUsuarios/sin_foto.png', '2021-07-31 00:38:24.388252', '2021-08-05 01:04:13.683701', 1);

-- --------------------------------------------------------

--
-- Table structure for table `productos_producto`
--

DROP TABLE IF EXISTS `productos_producto`;
CREATE TABLE IF NOT EXISTS `productos_producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `precio` double NOT NULL,
  `creado` datetime(6) NOT NULL,
  `actualizado` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `productos_producto`
--

INSERT INTO `productos_producto` (`id`, `nombre`, `imagen`, `precio`, `creado`, `actualizado`) VALUES
(2, 'Sonic Adventure 2 Battle', 'productos/SonicAdventure_2_Battle_MLVHttt.jpg', 1800, '2021-07-31 00:59:48.856121', '2021-07-31 00:59:48.856121'),
(3, 'Mario Kart Double Dash', 'productos/MarioKart_DoubleDash.jpg', 2502, '2021-07-31 01:46:33.169877', '2021-08-11 00:08:28.629417'),
(5, 'Super Mario Sunshine', 'productos/SuperMario_SunShine_JpTrnd3.jpg', 1200, '2021-08-04 19:19:57.798503', '2021-08-04 19:20:05.834901'),
(13, 'Mario Party 5', 'productos/MarioParty_5.jpg', 1950, '2021-08-11 19:07:32.356263', '2021-08-11 19:07:47.515415'),
(14, 'Super Mario Strikers', 'productos/SuperMario_Strikers.jpg', 1110, '2021-08-11 19:09:30.323869', '2021-08-11 19:09:39.763175'),
(16, 'Super Smash Bros Melee', 'productos/Super_Smash_Bros_Melee_dyjEjU3.jpg', 1950, '2021-08-11 19:13:53.036653', '2021-08-11 19:17:16.971792'),
(17, 'Disney Pixar Cars', 'productos/Cars.jpg', 1200, '2021-08-11 19:15:14.471673', '2021-08-11 19:17:29.657076'),
(18, 'Crash Bandicoot: The Wrath of Cortex', 'productos/crash_bandicoot.jpg', 1200, '2021-08-11 19:16:13.769603', '2021-08-11 19:17:38.862296');

-- --------------------------------------------------------

--
-- Table structure for table `reportes_reporte`
--

DROP TABLE IF EXISTS `reportes_reporte`;
CREATE TABLE IF NOT EXISTS `reportes_reporte` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `comentarios` longtext NOT NULL,
  `creado` datetime(6) NOT NULL,
  `actualizado` datetime(6) NOT NULL,
  `autor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reportes_reporte_autor_id_cbb7902e_fk_perfiles_perfil_id` (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reportes_reporte`
--

INSERT INTO `reportes_reporte` (`id`, `nombre`, `imagen`, `comentarios`, `creado`, `actualizado`, `autor_id`) VALUES
(8, '01 al 07 de Agosto', 'reportes/7ffa3505-7.png', 'Primer semana de ventas', '2021-08-11 20:05:52.742224', '2021-08-11 20:05:52.742224', 1),
(9, '01 al 18 de Agosto', 'reportes/127d54bc-5.png', 'Reporte de las ventas en las fechas indicadas', '2021-08-11 23:36:58.555946', '2021-08-11 23:36:58.555946', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ventas_csv`
--

DROP TABLE IF EXISTS `ventas_csv`;
CREATE TABLE IF NOT EXISTS `ventas_csv` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_archivo` varchar(120) DEFAULT NULL,
  `archivo_CSV` varchar(100) DEFAULT NULL,
  `creado` datetime(6) NOT NULL,
  `actualizado` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ventas_csv`
--

INSERT INTO `ventas_csv` (`id`, `nombre_archivo`, `archivo_CSV`, `creado`, `actualizado`) VALUES
(16, 'VENTAS_semana1.csv', '', '2021-08-11 20:03:22.987586', '2021-08-11 20:03:23.319583');

-- --------------------------------------------------------

--
-- Table structure for table `ventas_orden`
--

DROP TABLE IF EXISTS `ventas_orden`;
CREATE TABLE IF NOT EXISTS `ventas_orden` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int UNSIGNED NOT NULL,
  `precio` double NOT NULL,
  `creado` datetime(6) NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_orden_producto_id_e2796d9e_fk_productos_producto_id` (`producto_id`)
) ;

--
-- Dumping data for table `ventas_orden`
--

INSERT INTO `ventas_orden` (`id`, `cantidad`, `precio`, `creado`, `producto_id`) VALUES
(81, 1, 1110, '2021-08-01 00:00:00.000000', 14),
(82, 2, 3900, '2021-08-02 00:00:00.000000', 16),
(83, 1, 1200, '2021-08-02 00:00:00.000000', 18),
(84, 1, 1200, '2021-08-04 00:00:00.000000', 17),
(85, 1, 1950, '2021-08-04 00:00:00.000000', 13),
(86, 1, 1200, '2021-08-06 00:00:00.000000', 5),
(87, 2, 3900, '2021-08-07 00:00:00.000000', 16);

-- --------------------------------------------------------

--
-- Table structure for table `ventas_venta`
--

DROP TABLE IF EXISTS `ventas_venta`;
CREATE TABLE IF NOT EXISTS `ventas_venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_orden` varchar(12) NOT NULL,
  `precio_total` double DEFAULT NULL,
  `creado` datetime(6) NOT NULL,
  `actualizado` datetime(6) NOT NULL,
  `cliente_id` bigint NOT NULL,
  `vendedor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ventas_venta_cliente_id_85f33a80_fk_clientes_cliente_id` (`cliente_id`),
  KEY `ventas_venta_vendedor_id_2f6b0d76_fk_perfiles_perfil_id` (`vendedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ventas_venta`
--

INSERT INTO `ventas_venta` (`id`, `id_orden`, `precio_total`, `creado`, `actualizado`, `cliente_id`, `vendedor_id`) VALUES
(78, '1057B3424900', 1110, '2021-08-01 00:00:00.000000', '2021-08-11 20:03:23.049582', 36, 1),
(79, '2224C3111000', 3900, '2021-08-02 00:00:00.000000', '2021-08-11 20:03:23.109597', 37, 1),
(80, '8095A1010101', 1200, '2021-08-02 00:00:00.000000', '2021-08-11 20:03:23.156588', 38, 1),
(81, '0031Z5110092', 1200, '2021-08-04 00:00:00.000000', '2021-08-11 20:03:23.205587', 36, 1),
(82, '8092R4251321', 1950, '2021-08-04 00:00:00.000000', '2021-08-11 20:03:23.244581', 38, 1),
(83, '9650M4443002', 1200, '2021-08-06 00:00:00.000000', '2021-08-11 20:03:23.277583', 38, 1),
(84, '7771A4210990', 7050, '2021-08-07 00:00:00.000000', '2021-08-11 23:02:22.798533', 36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ventas_venta_ordenes`
--

DROP TABLE IF EXISTS `ventas_venta_ordenes`;
CREATE TABLE IF NOT EXISTS `ventas_venta_ordenes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `venta_id` bigint NOT NULL,
  `orden_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ventas_venta_ordenes_venta_id_orden_id_406decff_uniq` (`venta_id`,`orden_id`),
  KEY `ventas_venta_ordenes_orden_id_40fec44a_fk_ventas_orden_id` (`orden_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ventas_venta_ordenes`
--

INSERT INTO `ventas_venta_ordenes` (`id`, `venta_id`, `orden_id`) VALUES
(93, 78, 81),
(94, 79, 82),
(95, 80, 83),
(96, 81, 84),
(97, 82, 85),
(98, 83, 86),
(100, 84, 85),
(101, 84, 86),
(99, 84, 87);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `perfiles_perfil`
--
ALTER TABLE `perfiles_perfil`
  ADD CONSTRAINT `perfiles_perfil_usuario_id_4f6ce2c2_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `reportes_reporte`
--
ALTER TABLE `reportes_reporte`
  ADD CONSTRAINT `reportes_reporte_autor_id_cbb7902e_fk_perfiles_perfil_id` FOREIGN KEY (`autor_id`) REFERENCES `perfiles_perfil` (`id`);

--
-- Constraints for table `ventas_orden`
--
ALTER TABLE `ventas_orden`
  ADD CONSTRAINT `ventas_orden_producto_id_e2796d9e_fk_productos_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `productos_producto` (`id`);

--
-- Constraints for table `ventas_venta`
--
ALTER TABLE `ventas_venta`
  ADD CONSTRAINT `ventas_venta_cliente_id_85f33a80_fk_clientes_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes_cliente` (`id`),
  ADD CONSTRAINT `ventas_venta_vendedor_id_2f6b0d76_fk_perfiles_perfil_id` FOREIGN KEY (`vendedor_id`) REFERENCES `perfiles_perfil` (`id`);

--
-- Constraints for table `ventas_venta_ordenes`
--
ALTER TABLE `ventas_venta_ordenes`
  ADD CONSTRAINT `ventas_venta_ordenes_orden_id_40fec44a_fk_ventas_orden_id` FOREIGN KEY (`orden_id`) REFERENCES `ventas_orden` (`id`),
  ADD CONSTRAINT `ventas_venta_ordenes_venta_id_7c8d80df_fk_ventas_venta_id` FOREIGN KEY (`venta_id`) REFERENCES `ventas_venta` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
