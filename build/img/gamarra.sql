-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 09, 2017 at 08:43 AM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamarra`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `nombre`) VALUES
(1, 'Rojo'),
(2, 'Amarillo');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-05-07 20:30:39.882540'),
(2, 'auth', '0001_initial', '2017-05-07 20:30:40.719040'),
(3, 'admin', '0001_initial', '2017-05-07 20:30:40.919282'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-05-07 20:30:40.946573'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-05-07 20:30:41.073898'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-05-07 20:30:41.095183'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-05-07 20:30:41.119087'),
(8, 'auth', '0004_alter_user_username_opts', '2017-05-07 20:30:41.132314'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-05-07 20:30:41.193284'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-05-07 20:30:41.198663'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-05-07 20:30:41.212605'),
(12, 'sessions', '0001_initial', '2017-05-07 20:30:41.265777');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `local`
--

CREATE TABLE `local` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `local`
--

INSERT INTO `local` (`id`, `nombre`) VALUES
(1, 'Almacen'),
(2, 'Torre'),
(3, 'Centro');

-- --------------------------------------------------------

--
-- Table structure for table `modelo`
--

CREATE TABLE `modelo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modelo`
--

INSERT INTO `modelo` (`id`, `nombre`) VALUES
(3, 'TRAPECIO'),
(4, 'ELIZABETH'),
(5, 'ESTER'),
(6, 'ANGELA'),
(7, 'SILVANA LARGO'),
(8, 'PAMELA'),
(9, 'ASIMETRICO'),
(10, 'LAZO'),
(11, 'BOBITOS'),
(12, 'SIRENA'),
(13, 'GRECIA'),
(14, 'SILVANA CORTO'),
(15, 'DIANA'),
(16, 'PUAS'),
(17, 'VANIA');

-- --------------------------------------------------------

--
-- Table structure for table `movimiento`
--

CREATE TABLE `movimiento` (
  `id` int(11) NOT NULL,
  `local` int(11) DEFAULT NULL,
  `modelo` int(11) DEFAULT NULL,
  `talla` int(11) DEFAULT NULL,
  `cantidad` int(100) DEFAULT NULL,
  `tipo` varchar(1000) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `fecha` varchar(1000) DEFAULT NULL,
  `proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movimiento`
--

INSERT INTO `movimiento` (`id`, `local`, `modelo`, `talla`, `cantidad`, `tipo`, `color`, `fecha`, `proveedor`) VALUES
(1, 1, 3, 1, 545, 'Entrada', NULL, NULL, NULL),
(2, 1, 3, 1, 545, 'Entrada', NULL, NULL, NULL),
(3, 1, 4, 2, 45, 'Entrada', NULL, NULL, NULL),
(4, 1, 4, 2, 45, 'Entrada', NULL, NULL, NULL),
(5, 1, 4, 1, 255, 'Entrada', NULL, NULL, NULL),
(6, 1, 4, 1, 255, 'Salida', NULL, NULL, NULL),
(7, 3, 6, 1, 12, 'Entrada', NULL, NULL, NULL),
(8, 1, 3, 1, 5, 'Entrada', NULL, NULL, NULL),
(9, 1, 4, 1, 56, 'Entrada', NULL, NULL, NULL),
(10, 1, 4, 1, 54, 'Entrada', NULL, NULL, NULL),
(11, 1, 4, 1, 54, 'Salida', NULL, NULL, NULL),
(12, 2, 4, 1, 5, 'Entrada', NULL, NULL, NULL),
(13, 2, 4, 1, 5, 'Entrada', NULL, NULL, NULL),
(14, 2, 4, 1, 5, 'Entrada', NULL, NULL, NULL),
(15, 2, 4, 1, 5, 'Entrada', NULL, NULL, NULL),
(16, 1, 4, 1, 1, 'Entrada', NULL, NULL, NULL),
(17, 1, 4, 1, 1, 'Entrada', NULL, NULL, NULL),
(18, 1, 4, 1, 22, 'Entrada', NULL, '2017-05-08 03:58:19.413402', NULL),
(19, 1, 5, 2, 5, 'Salida', NULL, '2017-05-08 04:05:07.763295', NULL),
(20, 1, 3, 1, 1, 'Salida', NULL, '2017-05-08 04:07:58.160623', NULL),
(21, 1, 7, 2, 2, 'Entrada', NULL, '2017-05-08 04:17:01.323266', NULL),
(22, 2, 4, 1, 2, 'Entrada', NULL, '2017-05-08 04:33:13.704396', NULL),
(23, 1, 3, 1, 52, 'Entrada', NULL, '2017-05-09 02:57:19.570493', NULL),
(24, 1, 16, 1, 228, 'Entrada', NULL, '2017-05-09 03:11:15.031354', NULL),
(25, 1, 3, 1, 25, 'Salida', NULL, '2017-05-09 03:12:10.686764', NULL),
(26, 1, 3, 1, 55, 'Entrada', NULL, '2017-05-09 03:39:19.715929', NULL),
(27, 1, 3, 1, 6, 'Entrada', NULL, '2017-05-09 03:41:19.634890', NULL),
(28, 1, 3, 1, 55, 'Entrada', NULL, '2017-05-09 03:41:57.845109', NULL),
(29, 1, 3, 1, 5, 'Entrada', NULL, '2017-05-09 03:43:10.858952', NULL),
(30, 1, 3, 1, 5, 'Salida', NULL, '2017-05-09 03:43:19.721865', NULL),
(31, 1, 3, 1, 56, 'Salida', NULL, '2017-05-09 03:43:25.041376', NULL),
(32, 2, 3, 1, 2, 'Entrada', NULL, '2017-05-09 03:44:58.673861', NULL),
(33, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:01.611527', NULL),
(34, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:05.556734', NULL),
(35, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:06.234680', NULL),
(36, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:06.405436', NULL),
(37, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:06.594813', NULL),
(38, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:06.760232', NULL),
(39, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:06.930556', NULL),
(40, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:07.117748', NULL),
(41, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:07.283788', NULL),
(42, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:07.443492', NULL),
(43, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:07.614190', NULL),
(44, 2, 3, 1, 2, 'Salida', NULL, '2017-05-09 03:45:07.780088', NULL),
(45, 1, 3, 1, 1, 'Entrada', NULL, '2017-05-09 03:45:25.089385', NULL),
(46, NULL, 3, 1, 54, 'Entrada', NULL, '2017-05-09 04:20:43.639880', 2),
(47, 1, 3, 1, 54, 'Salida', NULL, '2017-05-09 04:20:53.849537', 2),
(48, 1, 4, 1, 88, 'Salida', NULL, '2017-05-09 04:32:58.597965', NULL),
(49, 1, 4, 1, 88, 'Entrada', NULL, '2017-05-09 04:33:05.146996', 1),
(50, NULL, 3, 1, 23, 'Entrada', NULL, '2017-05-09 04:37:24.686556', 1),
(51, NULL, 6, 2, 58, 'Entrada', NULL, '2017-05-09 04:44:40.477716', 1),
(52, NULL, 3, 1, 55, 'Entrada', NULL, '2017-05-09 04:45:36.767464', 1),
(53, NULL, 3, 1, 55, 'Entrada', 1, '2017-05-09 04:59:06.833579', 2),
(54, NULL, 3, 1, 55, 'Entrada', 1, '2017-05-09 05:02:50.244074', 1),
(55, NULL, 3, 1, 55, 'Entrada', 1, '2017-05-09 05:08:14.156086', 1),
(56, NULL, 3, 1, 5, 'Entrada', 1, '2017-05-09 05:08:18.614330', 1),
(57, NULL, 3, 1, 5, 'Entrada', 1, '2017-05-09 05:09:02.204598', 1),
(58, NULL, 3, 1, 5, 'Salida', 1, '2017-05-09 05:09:04.962057', 1),
(59, 1, 3, 1, 5, 'Salida', 1, '2017-05-09 05:09:10.246040', 1),
(60, 1, 3, 1, 5, 'Salida', 1, '2017-05-09 05:09:16.343279', 1),
(61, 2, 3, 1, 5, 'Salida', 1, '2017-05-09 05:09:29.486639', 1),
(62, 2, 3, 1, 5, 'Entrada', 1, '2017-05-09 05:09:35.200212', 1),
(63, 2, 3, 1, 5, 'Entrada', 1, '2017-05-09 05:09:46.435198', 1),
(64, 2, 3, 1, 5, 'Entrada', 1, '2017-05-09 05:09:48.814712', 1),
(65, 2, 3, 1, 5, 'Salida', 1, '2017-05-09 05:09:52.687624', 1),
(66, 2, 3, 1, 5, 'Salida', 1, '2017-05-09 05:09:54.970536', 1),
(67, 2, 3, 1, 5, 'Entrada', 1, '2017-05-09 05:09:57.516514', 1),
(68, 2, 3, 1, 5, 'Entrada', 1, '2017-05-09 05:10:00.953584', 2),
(69, 2, 5, 1, 5, 'Entrada', 1, '2017-05-09 05:10:05.125628', 2),
(70, 2, 5, 1, 5, 'Salida', 1, '2017-05-09 05:10:18.012403', 2),
(71, 2, 5, 1, 5, 'Salida', 1, '2017-05-09 05:10:39.110198', 2),
(72, 2, 5, 1, 5, 'Entrada', 1, '2017-05-09 05:10:43.712178', 2),
(73, 2, 5, 1, 5, 'Entrada', 1, '2017-05-09 05:10:50.521271', 2),
(74, 2, 5, 1, 5, 'Entrada', 1, '2017-05-09 05:10:53.015483', 2),
(75, 2, 5, 1, 5, 'Salida', 1, '2017-05-09 05:10:57.719493', 2),
(76, 2, 5, 1, 5, 'Salida', 1, '2017-05-09 05:10:59.425958', 2),
(77, 2, 5, 1, 5, 'Salida', 1, '2017-05-09 05:10:59.854854', 2),
(78, NULL, 3, 1, 54, 'Entrada', 1, '2017-05-09 05:11:19.844906', 1);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`) VALUES
(1, 'Lucho'),
(2, 'Priscila');

-- --------------------------------------------------------

--
-- Table structure for table `talla`
--

CREATE TABLE `talla` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `talla`
--

INSERT INTO `talla` (`id`, `nombre`) VALUES
(1, 'S'),
(2, 'X');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `local` (`local`),
  ADD KEY `modelo` (`modelo`) USING BTREE,
  ADD KEY `talla` (`talla`) USING BTREE;

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `local`
--
ALTER TABLE `local`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `talla`
--
ALTER TABLE `talla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

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
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
