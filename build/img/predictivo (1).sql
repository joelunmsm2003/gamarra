-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 12, 2017 at 04:23 AM
-- Server version: 5.7.18-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `predictivo`
--

-- --------------------------------------------------------

--
-- Table structure for table `acciones`
--

CREATE TABLE `acciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `accion` int(10) UNSIGNED NOT NULL,
  `origen` varchar(20) NOT NULL,
  `destino` varchar(20) NOT NULL,
  `canal` varchar(100) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `id_agente` int(11) NOT NULL,
  `id_campania` int(11) NOT NULL,
  `fechahora` datetime NOT NULL,
  `id_base` int(11) NOT NULL,
  `flag` int(10) UNSIGNED NOT NULL,
  `id_gestion` int(11) NOT NULL,
  `id_llamada` int(11) NOT NULL,
  `empresa` varchar(50) NOT NULL,
  `accountcode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tabla de acciones - ori_acciones';

-- --------------------------------------------------------

--
-- Table structure for table `agendados`
--

CREATE TABLE `agendados` (
  `id` int(100) NOT NULL,
  `base` int(100) DEFAULT NULL,
  `agente` int(100) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agentebase`
--

CREATE TABLE `agentebase` (
  `id` int(100) NOT NULL,
  `agente` int(100) DEFAULT NULL,
  `base` int(100) DEFAULT NULL,
  `tiniciogestion` datetime DEFAULT NULL,
  `tfingestion` datetime DEFAULT NULL,
  `duracion` int(11) DEFAULT '0',
  `comentario` mediumtext,
  `facuerdo` datetime DEFAULT NULL,
  `macuerdo` int(100) DEFAULT NULL,
  `status` int(100) DEFAULT NULL,
  `tiniciollamada` datetime DEFAULT NULL,
  `tfinllamada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agentecalificacion`
--

CREATE TABLE `agentecalificacion` (
  `id` int(100) NOT NULL,
  `pregunta` int(100) DEFAULT NULL,
  `nota` int(100) DEFAULT NULL,
  `agente` int(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `calificacion` int(100) DEFAULT NULL,
  `item` int(100) DEFAULT NULL,
  `atributo` int(100) DEFAULT NULL,
  `criterio` int(100) DEFAULT NULL,
  `categoria` int(100) DEFAULT NULL,
  `campania` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `agentes`
--

CREATE TABLE `agentes` (
  `id` int(11) NOT NULL,
  `anexo` int(11) DEFAULT NULL,
  `fono` int(11) DEFAULT NULL,
  `tiempo` datetime DEFAULT NULL,
  `destino` int(11) DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `atendidas` int(11) DEFAULT '0',
  `contactadas` int(11) DEFAULT '0',
  `estado` int(11) DEFAULT '1',
  `est_ag_predictivo` int(11) DEFAULT '0',
  `canal` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `user` int(100) DEFAULT NULL,
  `supervisor` int(100) DEFAULT NULL,
  `disponible` int(100) DEFAULT '0',
  `tiniciogestion` datetime DEFAULT NULL,
  `tfingestion` datetime DEFAULT NULL,
  `tiniciollamada` datetime DEFAULT NULL,
  `tfinllamada` datetime DEFAULT NULL,
  `tinicioespera` datetime DEFAULT NULL,
  `tfinespera` datetime DEFAULT NULL,
  `tiniciotipeo` datetime DEFAULT NULL,
  `wordstipeo` int(100) DEFAULT NULL,
  `tiniciopausa` datetime DEFAULT NULL,
  `checa` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `checabreak` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tiniciobreak` datetime DEFAULT NULL,
  `checaser` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tinicioservicio` datetime DEFAULT NULL,
  `id_cliente` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado_llamada` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `agentes`
--

INSERT INTO `agentes` (`id`, `anexo`, `fono`, `tiempo`, `destino`, `duracion`, `atendidas`, `contactadas`, `estado`, `est_ag_predictivo`, `canal`, `user`, `supervisor`, `disponible`, `tiniciogestion`, `tfingestion`, `tiniciollamada`, `tfinllamada`, `tinicioespera`, `tfinespera`, `tiniciotipeo`, `wordstipeo`, `tiniciopausa`, `checa`, `checabreak`, `tiniciobreak`, `checaser`, `tinicioservicio`, `id_cliente`, `estado_llamada`) VALUES
(1, 299, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, NULL),
(2, 298, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `agentescampanias`
--

CREATE TABLE `agentescampanias` (
  `id` int(100) NOT NULL,
  `agente` int(100) DEFAULT NULL,
  `campania` int(100) DEFAULT NULL,
  `anexo` int(10) DEFAULT NULL,
  `discado` int(1) DEFAULT NULL,
  `ACD` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `agentescampanias`
--

INSERT INTO `agentescampanias` (`id`, `agente`, `campania`, `anexo`, `discado`, `ACD`) VALUES
(1, 1, 1, NULL, NULL, 0),
(2, 2, 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `agentesupervisor`
--

CREATE TABLE `agentesupervisor` (
  `id` int(100) NOT NULL,
  `agente` int(100) DEFAULT NULL,
  `supervisor` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agentesupervisor`
--

INSERT INTO `agentesupervisor` (`id`, `agente`, `supervisor`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ajx_pro_acd`
--

CREATE TABLE `ajx_pro_acd` (
  `id_ori_acd` int(10) UNSIGNED NOT NULL,
  `DID_Campana` varchar(45) NOT NULL,
  `Numero_Llamado` varchar(45) NOT NULL,
  `Numero_Entrante` varchar(45) NOT NULL,
  `Channel_Entrante` varchar(50) NOT NULL,
  `Tiempo` varchar(15) NOT NULL,
  `flag` int(3) NOT NULL,
  `uniqueid` varchar(30) NOT NULL,
  `fin` int(2) NOT NULL DEFAULT '0',
  `age_nombre` varchar(100) DEFAULT NULL,
  `tie_ing` datetime NOT NULL,
  `tie_acd` datetime NOT NULL,
  `tie_tra` datetime NOT NULL,
  `tie_con` datetime NOT NULL,
  `tie_fin` datetime NOT NULL,
  `tie_acw` datetime NOT NULL,
  `id_ori_campana` int(3) NOT NULL,
  `sql` int(1) NOT NULL,
  `CodHU` int(5) NOT NULL,
  `bill` int(10) NOT NULL,
  `asterisk` int(3) NOT NULL,
  `audio` varchar(100) NOT NULL,
  `valorllamada` varchar(200) NOT NULL,
  `id_ori_usuario` int(10) NOT NULL,
  `llam_estado` int(2) NOT NULL,
  `anexo` int(10) NOT NULL,
  `duration` int(5) NOT NULL,
  `espera` int(5) NOT NULL,
  `pais` varchar(10) NOT NULL,
  `g_id1` varchar(100) NOT NULL,
  `g_id2` varchar(100) NOT NULL,
  `g_id3` varchar(100) NOT NULL,
  `g_id4` varchar(100) NOT NULL,
  `g_id5` varchar(100) NOT NULL,
  `g_id6` varchar(100) NOT NULL,
  `g_id7` varchar(100) NOT NULL,
  `g_id8` varchar(100) NOT NULL,
  `g_id9` varchar(100) NOT NULL,
  `g_id10` varchar(100) NOT NULL,
  `accountcode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Triggers `ajx_pro_acd`
--
DELIMITER $$
CREATE TRIGGER `replica` AFTER INSERT ON `ajx_pro_acd` FOR EACH ROW BEGIN
    INSERT INTO logPhon set
     logPhon.id_ori_usuario=NEW.id_ori_usuario,
     logPhon.id_ori_seg_cola=NEW.id_ori_campana,
     logPhon.duration=NEW.duration,
     logPhon.anexo=NEW.anexo,
     logPhon.espera=NEW.espera,
     logPhon.llam_estado=new.llam_estado,
     logPhon.id_ori_campana=NEW.id_ori_campana,
     logPhon.origen=NEW.Numero_Entrante,
     logPhon.destino=NEW.Numero_Llamado,
     logPhon.tipo_llamada=1,
     logPhon.audio=NEW.audio,
     logPhon.channel1=NEW.Channel_Entrante,
     logPhon.age_nombre=NEW.age_nombre,
     logPhon.tie_ing=NEW.tie_ing,
     logPhon.tie_acd=NEW.tie_acd,
     logPhon.tie_tra=NEW.tie_tra,
     logPhon.tie_con=NEW.tie_con,
     logPhon.tie_fin=NEW.tie_fin,
     logPhon.tie_acw=NEW.tie_acw,
     logPhon.flag=NEW.flag,
     logPhon.uniqueid=NEW.uniqueid,
     logPhon.fin=NEW.fin,
     logPhon.sql=NEW.sql,
     logPhon.codhu=NEW.CodHU,
     logPhon.bill=NEW.bill,
     logPhon.asterisk=NEW.asterisk,
     logPhon.valorllamada=NEW.valorllamada,
     logPhon.bk_id=NEW.id_ori_acd ;
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `replica3` AFTER UPDATE ON `ajx_pro_acd` FOR EACH ROW BEGIN
    UPDATE logPhon SET
     logPhon.anexo=NEW.anexo,
     logPhon.duration=NEW.duration,
     logPhon.espera=NEW.espera,
     logPhon.llam_estado=new.llam_estado,
     logPhon.id_ori_usuario=NEW.id_ori_usuario,
     logPhon.id_ori_seg_cola=NEW.id_ori_campana,
     logPhon.id_ori_campana=NEW.id_ori_campana,
     logPhon.origen=NEW.Numero_Entrante,
     logPhon.destino=NEW.Numero_Llamado,
     logPhon.tipo_llamada=1,
     logPhon.audio=NEW.audio,
     logPhon.channel1=NEW.Channel_Entrante,
     logPhon.age_nombre=NEW.age_nombre,
     logPhon.tie_ing=NEW.tie_ing,
     logPhon.tie_acd=NEW.tie_acd,
     logPhon.tie_tra=NEW.tie_tra,
     logPhon.tie_con=NEW.tie_con,
     logPhon.tie_fin=NEW.tie_fin,
     logPhon.tie_acw=NEW.tie_acw,
     logPhon.flag=NEW.flag,
     logPhon.uniqueid=NEW.uniqueid,
     logPhon.fin=NEW.fin,
     logPhon.sql=NEW.sql,
     logPhon.codhu=NEW.CodHU,
     logPhon.bill=NEW.bill,
     logPhon.asterisk=NEW.asterisk,
     logPhon.valorllamada=NEW.valorllamada
   WHERE logPhon.bk_id = NEW.id_ori_acd and logPhon.tipo = 0;
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ajx_pro_bas`
--

CREATE TABLE `ajx_pro_bas` (
  `id` int(11) NOT NULL,
  `ti01` int(1) NOT NULL,
  `ti02` int(1) NOT NULL,
  `ti03` int(1) NOT NULL,
  `ti04` int(1) NOT NULL,
  `ti05` int(1) NOT NULL,
  `ti06` int(1) NOT NULL,
  `ti07` int(1) NOT NULL,
  `ti08` int(1) NOT NULL,
  `ti09` int(1) NOT NULL,
  `ti10` int(1) NOT NULL,
  `bi01` int(11) NOT NULL,
  `bi02` int(11) NOT NULL,
  `bi03` int(11) NOT NULL,
  `bi04` int(11) NOT NULL,
  `bi05` int(11) NOT NULL,
  `bi06` int(11) NOT NULL,
  `bi07` int(11) NOT NULL,
  `bi08` int(11) NOT NULL,
  `bi09` int(11) NOT NULL,
  `bi10` int(11) NOT NULL,
  `ts01` varchar(100) NOT NULL,
  `ts02` varchar(100) NOT NULL,
  `ts03` varchar(100) NOT NULL,
  `ts04` varchar(100) NOT NULL,
  `ts05` varchar(100) NOT NULL,
  `ts06` varchar(100) NOT NULL,
  `ts07` varchar(100) NOT NULL,
  `ts08` varchar(100) NOT NULL,
  `ts09` varchar(100) NOT NULL,
  `ts10` varchar(100) NOT NULL,
  `bs01` varchar(500) NOT NULL,
  `bs02` varchar(500) NOT NULL,
  `bs03` varchar(500) NOT NULL,
  `bs04` varchar(500) NOT NULL,
  `bs05` varchar(500) NOT NULL,
  `bs06` varchar(500) NOT NULL,
  `bs07` varchar(500) NOT NULL,
  `bs08` varchar(500) NOT NULL,
  `bs09` varchar(500) NOT NULL,
  `bs10` varchar(500) NOT NULL,
  `dt01` datetime NOT NULL,
  `dt02` datetime NOT NULL,
  `dt03` datetime NOT NULL,
  `dt04` datetime NOT NULL,
  `dt05` datetime NOT NULL,
  `dt06` datetime NOT NULL,
  `dt07` datetime NOT NULL,
  `dt08` datetime NOT NULL,
  `dt09` datetime NOT NULL,
  `dt10` datetime NOT NULL,
  `g_id1` varchar(100) NOT NULL,
  `g_id2` varchar(100) NOT NULL,
  `g_id3` varchar(100) NOT NULL,
  `g_id4` varchar(100) NOT NULL,
  `g_id5` varchar(100) NOT NULL,
  `g_id6` varchar(100) NOT NULL,
  `g_id7` varchar(100) NOT NULL,
  `g_id8` varchar(100) NOT NULL,
  `g_id9` varchar(100) NOT NULL,
  `g_id10` varchar(100) NOT NULL,
  `g_id11` varchar(200) NOT NULL,
  `g_id12` varchar(200) NOT NULL,
  `g_id13` varchar(200) NOT NULL,
  `g_id14` varchar(200) NOT NULL,
  `g_id15` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ajx_pro_lla`
--

CREATE TABLE `ajx_pro_lla` (
  `id_ori_llamadas` int(10) NOT NULL,
  `age_ip` varchar(20) DEFAULT NULL,
  `age_codigo` varchar(10) DEFAULT NULL,
  `cam_codigo` int(10) DEFAULT NULL,
  `llam_numero` varchar(20) DEFAULT NULL,
  `llam_estado` int(10) DEFAULT NULL,
  `llam_flag` int(10) DEFAULT NULL,
  `llam_uniqueid` varchar(45) DEFAULT NULL,
  `tipo` int(3) DEFAULT '0',
  `f_origen` datetime DEFAULT NULL,
  `canal1` varchar(50) DEFAULT NULL,
  `canal2` varchar(50) DEFAULT NULL,
  `channel` varchar(200) DEFAULT NULL,
  `dstchannel` varchar(200) DEFAULT NULL,
  `flagFIN` int(2) DEFAULT '0',
  `v_tring` int(5) DEFAULT NULL,
  `v_retry` int(5) DEFAULT NULL,
  `ring` int(10) DEFAULT NULL,
  `duration` int(10) DEFAULT '0',
  `bill` int(10) DEFAULT '0',
  `tregistro` int(11) DEFAULT NULL,
  `gestion_editid1` varchar(100) DEFAULT NULL,
  `gestion_editid2` varchar(100) DEFAULT NULL,
  `gestion_editid3` varchar(100) DEFAULT NULL,
  `f_llam_fin` datetime DEFAULT NULL,
  `f_llam_discador` datetime DEFAULT NULL,
  `f_llam_resuelve` datetime DEFAULT NULL,
  `id_ori_campana` int(10) DEFAULT NULL,
  `f_movedor` datetime DEFAULT NULL,
  `ID_Cliente` varchar(20) DEFAULT NULL,
  `CodErr` int(5) DEFAULT NULL,
  `CodErr1` int(5) DEFAULT NULL,
  `audio` varchar(200) DEFAULT NULL,
  `audio2` varchar(200) DEFAULT NULL,
  `sql` int(1) NOT NULL DEFAULT '0',
  `gestion_editid4` varchar(100) DEFAULT NULL,
  `gestion_editid5` varchar(100) DEFAULT NULL,
  `gestion_editid6` varchar(100) DEFAULT NULL,
  `gestion_editid7` varchar(100) DEFAULT NULL,
  `gestion_editid8` varchar(100) DEFAULT NULL,
  `gestion_editid9` varchar(100) DEFAULT NULL,
  `gestion_editid10` varchar(100) NOT NULL,
  `dialstatus` varchar(100) DEFAULT NULL,
  `dialstatus1` varchar(100) DEFAULT NULL,
  `id_ori_seg_cola` int(11) DEFAULT NULL,
  `age_nombre` varchar(100) DEFAULT NULL,
  `anexo` int(10) DEFAULT NULL,
  `espera` int(5) DEFAULT NULL,
  `troncal` varchar(50) DEFAULT NULL,
  `timbrado1` varchar(2) DEFAULT NULL,
  `timbrado2` varchar(2) DEFAULT NULL,
  `prefijo` varchar(20) DEFAULT NULL,
  `grabacion` varchar(2) DEFAULT NULL,
  `IN_ID` varchar(11) DEFAULT NULL,
  `v_tipbusc` varchar(11) DEFAULT NULL,
  `filtro` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 9216 kB';

-- --------------------------------------------------------

--
-- Table structure for table `ajx_pro_lla_all`
--

CREATE TABLE `ajx_pro_lla_all` (
  `id_ori_llamadas` int(10) NOT NULL,
  `age_ip` varchar(20) DEFAULT NULL,
  `age_codigo` varchar(10) DEFAULT NULL,
  `cam_codigo` int(10) DEFAULT NULL,
  `llam_numero` varchar(20) DEFAULT NULL,
  `llam_estado` int(10) DEFAULT NULL,
  `llam_flag` int(10) DEFAULT NULL,
  `llam_uniqueid` varchar(45) DEFAULT NULL,
  `tipo` int(3) DEFAULT '0',
  `f_origen` datetime DEFAULT NULL,
  `canal1` varchar(50) DEFAULT NULL,
  `canal2` varchar(50) DEFAULT NULL,
  `channel` varchar(200) DEFAULT NULL,
  `dstchannel` varchar(200) DEFAULT NULL,
  `flagFIN` int(2) DEFAULT '0',
  `v_tring` int(5) DEFAULT NULL,
  `v_retry` int(5) DEFAULT NULL,
  `ring` int(10) DEFAULT NULL,
  `duration` int(10) DEFAULT '0',
  `bill` int(10) DEFAULT '0',
  `tregistro` int(11) DEFAULT NULL,
  `gestion_editid1` varchar(100) DEFAULT NULL,
  `gestion_editid2` varchar(100) DEFAULT NULL,
  `gestion_editid3` varchar(100) DEFAULT NULL,
  `f_llam_fin` datetime DEFAULT NULL,
  `f_llam_discador` datetime DEFAULT NULL,
  `f_llam_resuelve` datetime DEFAULT NULL,
  `id_ori_campana` int(10) DEFAULT NULL,
  `f_movedor` datetime DEFAULT NULL,
  `ID_Cliente` varchar(20) DEFAULT NULL,
  `CodErr` int(5) DEFAULT NULL,
  `CodErr1` int(5) DEFAULT NULL,
  `audio` varchar(200) DEFAULT NULL,
  `audio2` varchar(200) DEFAULT NULL,
  `sql` int(1) NOT NULL DEFAULT '0',
  `gestion_editid4` varchar(100) DEFAULT NULL,
  `gestion_editid5` varchar(100) DEFAULT NULL,
  `gestion_editid6` varchar(100) DEFAULT NULL,
  `gestion_editid7` varchar(100) DEFAULT NULL,
  `gestion_editid8` varchar(100) DEFAULT NULL,
  `gestion_editid9` varchar(100) DEFAULT NULL,
  `gestion_editid10` varchar(100) NOT NULL,
  `dialstatus` varchar(100) DEFAULT NULL,
  `dialstatus1` varchar(100) DEFAULT NULL,
  `id_ori_seg_cola` int(11) DEFAULT NULL,
  `age_nombre` varchar(100) DEFAULT NULL,
  `anexo` int(10) DEFAULT NULL,
  `espera` int(5) DEFAULT NULL,
  `troncal` varchar(50) DEFAULT NULL,
  `timbrado1` varchar(2) DEFAULT NULL,
  `timbrado2` varchar(2) DEFAULT NULL,
  `prefijo` varchar(20) DEFAULT NULL,
  `grabacion` varchar(2) DEFAULT NULL,
  `IN_ID` varchar(11) DEFAULT NULL,
  `v_tipbusc` varchar(11) DEFAULT NULL,
  `filtro` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `atributo`
--

CREATE TABLE `atributo` (
  `id` int(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) DEFAULT NULL,
  `username` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8_spanish_ci DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `date_joined` datetime DEFAULT NULL,
  `empresa` int(100) DEFAULT NULL,
  `nivel` int(11) NOT NULL DEFAULT '4',
  `telefono` int(100) DEFAULT NULL,
  `anexo` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `empresa`, `nivel`, `telefono`, `anexo`) VALUES
(1, 'pbkdf2_sha256$24000$wPtK8SIUl0JX$OFkv3jY07Xm/rRIaZEawIwU20V/5FwDxV8Ze1D+PQGY=', '2017-05-12 02:20:46', 1, 'root', '', '', '', 1, 1, '2017-05-12 02:11:21', 1, 4, NULL, NULL),
(2, 'pbkdf2_sha256$24000$F1AECyRXOvSN$3nihzakgpcwJIkSWHjqBhFk5MSQraS/jLv/ZX0zQ/nI=', '2017-05-12 02:22:51', 0, 'admin', 'Adminame', '', '', 0, 1, '2017-05-12 02:21:43', 1, 1, 9852652, 499),
(3, 'pbkdf2_sha256$24000$Y07qFZN4zz7d$WTYp/DBbabxygWlxYDmF2l2efC6ggnj85/VcdxvrwM8=', NULL, 0, 'super', 'Joel', '', '', 0, 1, '2017-05-12 02:27:15', 1, 2, 1212, 498),
(4, 'pbkdf2_sha256$24000$SCOkFum6W1s0$DKpI0LAWvah3P535GRHPB0Njn0WtAc+uxl6u/H5LcWg=', NULL, 0, 'agente', '121', '', '', 0, 1, '2017-05-12 02:30:43', 1, 3, 121, 299),
(5, 'pbkdf2_sha256$24000$4Kj2cFW35xZK$fB3PBUXsvCH3SgAEu0ll2GAAbNLydkw5UdVusy20TnY=', NULL, 0, 'agente1', '21', '', '', 0, 1, '2017-05-12 02:31:04', 1, 3, 212, 298);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `base`
--

CREATE TABLE `base` (
  `id` int(100) NOT NULL,
  `telefono` int(100) DEFAULT NULL,
  `orden` int(100) DEFAULT NULL,
  `cliente` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_cliente` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_a` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_b` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_c` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_d` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_e` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_f` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_g` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_h` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `campania` int(100) DEFAULT NULL,
  `resultado` int(100) DEFAULT NULL,
  `flag_resul` tinyint(1) DEFAULT NULL,
  `bloqueocliente` int(1) DEFAULT '0',
  `ProFlag` int(11) DEFAULT NULL,
  `ProEstado` int(11) DEFAULT NULL,
  `FiltroHdeC` int(11) DEFAULT NULL,
  `agente` int(100) DEFAULT '84',
  `duracion` int(100) DEFAULT NULL,
  `audio` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `detalle` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `monto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tiniciogestion` datetime DEFAULT NULL,
  `tfingestion` datetime DEFAULT NULL,
  `tiniciollamada` datetime DEFAULT NULL,
  `tfinllamada` datetime DEFAULT NULL,
  `password` int(100) DEFAULT '0',
  `blacklist` int(100) DEFAULT NULL,
  `telefonomarcado2` int(100) DEFAULT NULL,
  `resultadotxt` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `resultado_asterisk` int(100) DEFAULT NULL,
  `resultadoat` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `base`
--

INSERT INTO `base` (`id`, `telefono`, `orden`, `cliente`, `id_cliente`, `status_a`, `status_b`, `status_c`, `status_d`, `status_e`, `status_f`, `status_g`, `status_h`, `status`, `campania`, `resultado`, `flag_resul`, `bloqueocliente`, `ProFlag`, `ProEstado`, `FiltroHdeC`, `agente`, `duracion`, `audio`, `detalle`, `monto`, `fecha`, `tiniciogestion`, `tfingestion`, `tiniciollamada`, `tfinllamada`, `password`, `blacklist`, `telefonomarcado2`, `resultadotxt`, `resultado_asterisk`, `resultadoat`) VALUES
(1, 998168746, 1, 'PORTUGUEZ NAPOCHE WILSON', '10739560', 'AFP PROFUTURO', '000332502130703', '6127.48', '3370.85', '27/03/2014 ==  701 d\\xedas', 'PENDIENTE', 'ORIENTE', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(2, 991358484, 1, 'MIO TUFINIO MARIA EVANGELINA', '40908814', 'AFP PRIMA', '996579113480', '325.82', '211.74', '18/11/2014 ==  465 d\\xedas', 'VENTA', 'CENTRO', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(3, 980098353, 2, 'MIO TUFINIO MARIA EVANGELINA', '40908814', 'AFP PROFUTURO', '328754411377', '2678.32', '1741.4', '41147.0', 'FAMILIAR', 'CENTRO', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(4, 5457896, 3, 'MIO TUFINIO MARIA EVANGELINA', '40908814', 'AFP PROFUTURO', 'A639517132819', '3305.96', '2479.11', '41390.0', 'PENDIENTE', 'LIMA', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(5, 54687985, 4, 'MIO TUFINIO MARIA EVANGELINA', '40908814', 'AFP PROFUTURO', '35692678661', '3857.39', '2507.84', '41876.0', 'PENDIENTE', 'SUR', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(6, 970485320, 1, 'LEYVA MORE GUILLERMO', '41141922', 'AFP PRIMA', '116964110862', '4779.28', '2628.31', '04/10/2014 ==  510 d\\xedas', 'PENDIENTE', 'CENTRO', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(7, 963628526, 2, 'LEYVA MORE GUILLERMO', '41141922', 'AFP PROFUTURO', 'A41620968117', '4388.63', '2413.65', '41226.0', 'VENTA', 'ORIENTE', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(8, 568749, 3, 'LEYVA MORE GUILLERMO', '41141922', 'AFP PRIMA', '000436691540397', '3111.72', '1711.59', '42179.0', 'FAMILIAR', 'LIMA', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(9, 964626575, 1, 'LISBOA CUICAPUSA JESUS RUBEN', '44279461', 'ENCUESTA MARKING', '000372186392669', '2931.27', '2198.2', '42112.0', 'NO CONTACTO', 'LIMA', 'BASE', '0', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(10, 986911547, 1, 'HEREDIA CAMPOS VILMA VICTORIA', '45326282', 'AFP PROFUTURO', '000442640161716', '4135.89', '2274.4', '41577.0', 'PENDIENTE', 'ORIENTE', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(11, 962857483, 2, 'HEREDIA CAMPOS VILMA VICTORIA', '45326282', 'AFP INTEGRA', '58691344566', '184.92', '101.35', '42237.0', 'PENDIENTE', 'SUR', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(12, 975224611, 1, 'ALVA ROMERO JAVIER', '43258446', 'AFP INTEGRA', '00000547419475022', '3884.63', '2913.94', '30/05/2013 ==  1002 d\\xedas', 'VENTA', 'SUR', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(13, 974688533, 1, 'DONGO PAUCA WILBER', '09006807', 'AFP PROFUTURO', '000513139871956', '958.64', '719.8', '41263.0', 'FAMILIAR', 'SUR', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(14, 972928597, 2, 'DONGO PAUCA WILBER', '09006807', 'VENTA BASE', '00061841630913', '2054.28', '1335.42', '41798.0', 'FAMILIAR', 'ORIENTE', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(15, 4547987, 3, 'DONGO PAUCA WILBER', '09006807', 'ENCUESTA MARKING', '000302550261018', '3597.35', '2338.28', '20/03/2013 ==  1073 d\\xedas', 'NO CONTACTO', 'LIMA', 'BASE', '0', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(16, 968506431, 1, 'CHAVEZ ROSSI ISABEL GISSELA', '43264033', 'AFP PROFUTURO', '945178922227', '5473.14', '3010.89', '21/10/2015 ==  128 d\\xedas', 'FAMILIAR', 'CENTRO', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(17, 967073801, 2, 'CHAVEZ ROSSI ISABEL GISSELA', '43264033', 'AFP PRIMA', 'J298509193047', '1778.86', '1334.86', '40924.0', 'FAMILIAR', 'LIMA', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(18, 7895489, 3, 'CHAVEZ ROSSI ISABEL GISSELA', '43264033', 'AFP PROFUTURO', '000958323196907', '1409.25', '916.3', '42321.0', 'PENDIENTE', 'LIMA', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(19, 968822084, 1, 'RAMIREZ LEON NORA MARISOL', '07161535', 'AFP INTEGRA', '00000930848682406', '6392.46', '4794.78', '41612.0', 'PENDIENTE', 'ORIENTE', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(20, 991760578, 2, 'RAMIREZ LEON NORA MARISOL', '07161535', 'AFP PRIMA', 'J739972247173', '4791.53', '3114.44', '42303.0', 'FAMILIAR', 'SUR', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(21, 963541973, 3, 'RAMIREZ LEON NORA MARISOL', '07161535', 'AFP PRIMA', 'A556734026026', '2570.42', '1414.74', '41386.0', 'PENDIENTE', 'NORTE', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(22, 325489, 4, 'RAMIREZ LEON NORA MARISOL', '07161535', 'AFP PROFUTURO', 'J161487195641', '6355.2', '4766.78', '41610.0', 'CONTACTO', 'LIMA', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(23, 981945111, 1, 'GONZALES QUISPE JORGE LUIS', '25510261', 'AFP INTEGRA', 'A994715442828', '7510.26', '5633.97', '10/07/2012 ==  1326 d\\xedas', 'CONTACTO', 'LIMA', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(24, 989996133, 2, 'GONZALES QUISPE JORGE LUIS', '25510261', 'AFP INTEGRA', 'A678319536710', '5781.69', '3180.76', '15/12/2012 ==  1168 d\\xedas', 'CONTACTO', 'ORIENTE', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(25, 987357925, 1, 'MEDINA OYOLA ROMEO', '46205599', 'VENTA BASE', 'J919824963153', '5574.4', '3623.35', '42161.0', 'FAMILIAR', 'SUR', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(26, 968463004, 2, 'MEDINA OYOLA ROMEO', '46205599', 'ENCUESTA MARKING', '00098483815003', '2860.96', '1859.86', '40964.0', 'VENTA', 'NORTE', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(27, 971406254, 3, 'MEDINA OYOLA ROMEO', '46205599', 'AFP PRIMA', 'J840183129352', '3808.7', '2856.98', '06/02/2013 ==  1115 d\\xedas', 'FAMILIAR', 'ORIENTE', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(28, 963392827, 1, 'LOYOLA EUSTAQUIO EDWIN JORGUEN', '41598097', 'AFP PROFUTURO', '347796831453', '365.91', '237.75', '30/01/2013 ==  1122 d\\xedas', 'NO CONTACTO', 'LIMA', 'BASE', '0', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(29, 999062138, 2, 'LOYOLA EUSTAQUIO EDWIN JORGUEN', '41598097', 'VENTA BASE', 'A672957040995', '5114.35', '2813.55', '40920.0', 'PENDIENTE', 'LIMA', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL),
(30, 973926020, 3, 'LOYOLA EUSTAQUIO EDWIN JORGUEN', '41598097', 'ENCUESTA MARKING', '000898218190687', '4276.7', '2779.48', '26/10/2013 ==  853 d\\xedas', 'VENTA', 'LIMA', 'BASE', '', 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `calificacion`
--

CREATE TABLE `calificacion` (
  `id` int(11) NOT NULL,
  `preg_exam` int(11) DEFAULT NULL,
  `agente` int(11) DEFAULT NULL,
  `campania` int(11) DEFAULT NULL,
  `empresa` int(11) DEFAULT NULL,
  `respuesta` varchar(1000) DEFAULT NULL,
  `llamada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `campania`
--

CREATE TABLE `campania` (
  `id` int(11) NOT NULL,
  `fecha cargada` datetime DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `estado` text COLLATE utf8_spanish_ci,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `discado` int(100) DEFAULT NULL,
  `factor` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `prefijo` int(11) DEFAULT NULL,
  `troncal` int(100) DEFAULT NULL,
  `timbrado1` int(11) DEFAULT NULL,
  `timbrado2` int(11) DEFAULT NULL,
  `grabacion` int(11) DEFAULT NULL,
  `t1` int(11) DEFAULT NULL,
  `t2` int(11) DEFAULT NULL,
  `t3` int(11) DEFAULT NULL,
  `o_error_cnt` int(11) DEFAULT NULL,
  `o_nocontesto_cnt` int(11) DEFAULT NULL,
  `canales` int(100) DEFAULT '2',
  `timbrados` int(100) DEFAULT NULL,
  `htinicio` time DEFAULT NULL,
  `htfin` time DEFAULT NULL,
  `mxllamada` int(100) DEFAULT '2',
  `llamadaxhora` int(100) DEFAULT '25',
  `hombreobjetivo` int(100) DEFAULT '80',
  `archivo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `supervisor` int(100) DEFAULT '1',
  `cartera` int(100) DEFAULT NULL,
  `tgestion` int(100) DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inactividad` int(255) DEFAULT NULL,
  `ACD` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `campania`
--

INSERT INTO `campania` (`id`, `fecha cargada`, `usuario`, `estado`, `nombre`, `tipo`, `discado`, `factor`, `status`, `prefijo`, `troncal`, `timbrado1`, `timbrado2`, `grabacion`, `t1`, `t2`, `t3`, `o_error_cnt`, `o_nocontesto_cnt`, `canales`, `timbrados`, `htinicio`, `htfin`, `mxllamada`, `llamadaxhora`, `hombreobjetivo`, `archivo`, `supervisor`, `cartera`, `tgestion`, `password`, `inactividad`, `ACD`) VALUES
(1, '2017-05-12 02:27:52', 2, '', 'C1', NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, '08:00:00', '19:00:00', NULL, 4, NULL, 'files/Campania__Im1FZDM.xlsx', 1, 1, NULL, '38359', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cartera`
--

CREATE TABLE `cartera` (
  `id` int(100) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `cartera`
--

INSERT INTO `cartera` (`id`, `nombre`) VALUES
(1, 'Cartera A');

-- --------------------------------------------------------

--
-- Table structure for table `carteraempresa`
--

CREATE TABLE `carteraempresa` (
  `id` int(100) NOT NULL,
  `cartera` int(100) NOT NULL,
  `empresa` int(100) NOT NULL,
  `user` int(100) DEFAULT NULL,
  `privilegio` int(11) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `carteraempresa`
--

INSERT INTO `carteraempresa` (`id`, `cartera`, `empresa`, `user`, `privilegio`, `fecha`) VALUES
(1, 1, 1, 2, NULL, '2017-05-12 02:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id` int(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `criterios`
--

CREATE TABLE `criterios` (
  `id` int(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `author` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `text` varchar(11) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disc`
--

CREATE TABLE `disc` (
  `id` int(100) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext COLLATE utf8_spanish_ci,
  `object_repr` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_spanish_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `session_data` longtext COLLATE utf8_spanish_ci NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `id` int(100) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `contacto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `mail` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `licencias` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `mascaras` int(100) DEFAULT NULL,
  `telefono` int(100) DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `licencias_adi` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `contacto`, `mail`, `licencias`, `mascaras`, `telefono`, `url`, `licencias_adi`) VALUES
(1, 'Xiencias', '', '', '20', NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `id` int(100) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `flag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estadocambio`
--

CREATE TABLE `estadocambio` (
  `id` int(100) NOT NULL,
  `user` int(100) NOT NULL,
  `estado` int(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estadocambio`
--

INSERT INTO `estadocambio` (`id`, `user`, `estado`, `fecha`) VALUES
(1, 1, 2, '2017-05-12 02:17:52'),
(2, 1, 2, '2017-05-12 02:18:57'),
(3, 1, 2, '2017-05-12 02:20:05'),
(4, 1, 2, '2017-05-12 02:20:45'),
(5, 2, 2, '2017-05-12 02:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `examen`
--

CREATE TABLE `examen` (
  `id` int(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `excel`
--

CREATE TABLE `excel` (
  `id` int(100) NOT NULL,
  `archivo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `excel`
--

INSERT INTO `excel` (`id`, `archivo`) VALUES
(1, 'files/Campania_.xlsx'),
(2, 'files/Campania__7cpJKu4.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `filtro`
--

CREATE TABLE `filtro` (
  `id` int(100) NOT NULL,
  `campania` int(100) DEFAULT NULL,
  `status_f` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_h` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status_g` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `resultado` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(100) DEFAULT NULL,
  `orden` int(2) DEFAULT NULL,
  `resultadoat` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ACD` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `filtro`
--

INSERT INTO `filtro` (`id`, `campania`, `status_f`, `status_h`, `status_g`, `resultado`, `status`, `orden`, `resultadoat`, `ACD`) VALUES
(1, 1, 'NO CONTACTO/', 'BASE/', 'LIMA/', '', 1, 1, NULL, NULL),
(2, 1, 'NO CONTACTO/', 'BASE/', 'LIMA/', '', 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `header`
--

CREATE TABLE `header` (
  `id` int(100) NOT NULL,
  `campania` int(100) DEFAULT NULL,
  `statusa` varchar(100) DEFAULT NULL,
  `statusb` varchar(100) DEFAULT NULL,
  `statusc` varchar(100) DEFAULT NULL,
  `statusd` varchar(100) DEFAULT NULL,
  `statuse` varchar(100) DEFAULT NULL,
  `statusf` varchar(100) DEFAULT NULL,
  `statusg` varchar(100) DEFAULT NULL,
  `statush` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `header`
--

INSERT INTO `header` (`id`, `campania`, `statusa`, `statusb`, `statusc`, `statusd`, `statuse`, `statusf`, `statusg`, `statush`) VALUES
(1, 1, 'ARTICLE / PRODUCT', 'CARD / ACCOUNT', 'AMOUNT CAMPAIG', 'AMOUNT SALE', 'DATE', 'TIPO CONTACTO', 'CIUDAD', 'ORDEN');

-- --------------------------------------------------------

--
-- Table structure for table `licencias_tmp`
--

CREATE TABLE `licencias_tmp` (
  `id` int(100) NOT NULL,
  `lic_tmp` int(100) DEFAULT NULL,
  `finicio` datetime DEFAULT NULL,
  `ffin` datetime DEFAULT NULL,
  `empresa` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `listanegra`
--

CREATE TABLE `listanegra` (
  `id` int(11) NOT NULL,
  `dni` varchar(100) DEFAULT NULL,
  `campania` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mascara`
--

CREATE TABLE `mascara` (
  `id` int(100) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `monitorserver`
--

CREATE TABLE `monitorserver` (
  `id` int(100) NOT NULL,
  `dsk_use` varchar(100) DEFAULT NULL,
  `total_mem` varchar(100) DEFAULT NULL,
  `use_mem` varchar(100) DEFAULT NULL,
  `total_swap` varchar(100) DEFAULT NULL,
  `use_swap` varchar(100) DEFAULT NULL,
  `s_usada` varchar(100) DEFAULT NULL,
  `CPU` varchar(100) DEFAULT NULL,
  `astCpuUse` varchar(700) DEFAULT NULL,
  `astMemUse` varchar(700) DEFAULT NULL,
  `pytCpuUse` varchar(700) DEFAULT NULL,
  `pytMemUse` varchar(700) DEFAULT NULL,
  `sqlCpuUse` varchar(700) DEFAULT NULL,
  `sqlMemUse` varchar(700) DEFAULT NULL,
  `activeCall` varchar(700) DEFAULT NULL,
  `dsk_tot` varchar(700) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nivel`
--

CREATE TABLE `nivel` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `nivel`
--

INSERT INTO `nivel` (`id`, `nombre`) VALUES
(1, 'Admin'),
(3, 'Agente'),
(4, 'Manager'),
(2, 'Supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `id` int(100) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preg_exam`
--

CREATE TABLE `preg_exam` (
  `id` int(100) NOT NULL,
  `pregunta` varchar(100) DEFAULT NULL,
  `examen` int(11) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resultado`
--

CREATE TABLE `resultado` (
  `id` int(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `flag_call` tinyint(1) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `mascara` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

CREATE TABLE `supervisor` (
  `id` int(100) NOT NULL,
  `user` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `supervisor`
--

INSERT INTO `supervisor` (`id`, `user`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `supervisorcartera`
--

CREATE TABLE `supervisorcartera` (
  `id` int(100) NOT NULL,
  `cartera` int(100) NOT NULL,
  `supervisor` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `supervisorcartera`
--

INSERT INTO `supervisorcartera` (`id`, `cartera`, `supervisor`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `troncales`
--

CREATE TABLE `troncales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `troncalesagentes`
--

CREATE TABLE `troncalesagentes` (
  `id` int(100) NOT NULL,
  `empresa` int(100) NOT NULL,
  `troncal` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flag` (`flag`),
  ADD KEY `accion` (`accion`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `agendados`
--
ALTER TABLE `agendados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base` (`base`),
  ADD KEY `agente` (`agente`),
  ADD KEY `fecha` (`fecha`);

--
-- Indexes for table `agentebase`
--
ALTER TABLE `agentebase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agente` (`agente`),
  ADD KEY `base` (`base`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `agentecalificacion`
--
ALTER TABLE `agentecalificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pregunta` (`pregunta`),
  ADD KEY `nota` (`nota`),
  ADD KEY `agente` (`agente`),
  ADD KEY `atributo` (`atributo`),
  ADD KEY `categoria` (`categoria`),
  ADD KEY `criterio` (`criterio`),
  ADD KEY `campania` (`campania`);

--
-- Indexes for table `agentes`
--
ALTER TABLE `agentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `supervisor` (`supervisor`),
  ADD KEY `estado` (`estado`),
  ADD KEY `id` (`id`),
  ADD KEY `anexo` (`anexo`),
  ADD KEY `fono` (`fono`),
  ADD KEY `tiempo` (`tiempo`),
  ADD KEY `destino` (`destino`),
  ADD KEY `duracion` (`duracion`),
  ADD KEY `atendidas` (`atendidas`),
  ADD KEY `contactadas` (`contactadas`),
  ADD KEY `est_ag_predictivo` (`est_ag_predictivo`),
  ADD KEY `canal` (`canal`),
  ADD KEY `disponible` (`disponible`),
  ADD KEY `estado_llamada` (`estado_llamada`),
  ADD KEY `tinicioespera` (`tinicioespera`);

--
-- Indexes for table `agentescampanias`
--
ALTER TABLE `agentescampanias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agente` (`agente`),
  ADD KEY `campania` (`campania`),
  ADD KEY `anexo` (`anexo`),
  ADD KEY `discado` (`discado`);

--
-- Indexes for table `agentesupervisor`
--
ALTER TABLE `agentesupervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agente` (`agente`),
  ADD KEY `supervisor` (`supervisor`);

--
-- Indexes for table `ajx_pro_acd`
--
ALTER TABLE `ajx_pro_acd`
  ADD PRIMARY KEY (`id_ori_acd`),
  ADD KEY `flag` (`flag`),
  ADD KEY `uniqueid` (`uniqueid`);

--
-- Indexes for table `ajx_pro_bas`
--
ALTER TABLE `ajx_pro_bas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ti01` (`ti01`),
  ADD KEY `ti02` (`ti02`),
  ADD KEY `bi01` (`bi01`),
  ADD KEY `bi02` (`bi02`),
  ADD KEY `ts01` (`ts01`),
  ADD KEY `ts02` (`ts02`),
  ADD KEY `bs01` (`bs01`),
  ADD KEY `bs02` (`bs02`);

--
-- Indexes for table `ajx_pro_lla`
--
ALTER TABLE `ajx_pro_lla`
  ADD PRIMARY KEY (`id_ori_llamadas`),
  ADD KEY `llam_numero` (`llam_numero`),
  ADD KEY `llam_uniqueid` (`llam_uniqueid`),
  ADD KEY `llam_estado` (`llam_estado`),
  ADD KEY `tipo` (`tipo`),
  ADD KEY `gestion_editid1` (`gestion_editid1`),
  ADD KEY `llam_flag` (`llam_flag`),
  ADD KEY `age_codigo` (`age_codigo`),
  ADD KEY `age_ip` (`age_ip`),
  ADD KEY `canal1` (`canal1`),
  ADD KEY `flagFIN` (`flagFIN`),
  ADD KEY `tregistro` (`tregistro`),
  ADD KEY `id_ori_llamadas` (`id_ori_llamadas`),
  ADD KEY `cam_codigo` (`cam_codigo`),
  ADD KEY `f_origen` (`f_origen`),
  ADD KEY `canal2` (`canal2`),
  ADD KEY `channel` (`channel`),
  ADD KEY `dstchannel` (`dstchannel`),
  ADD KEY `v_tring` (`v_tring`),
  ADD KEY `v_retry` (`v_retry`),
  ADD KEY `ring` (`ring`),
  ADD KEY `duration` (`duration`),
  ADD KEY `bill` (`bill`),
  ADD KEY `gestion_editid2` (`gestion_editid2`),
  ADD KEY `gestion_editid3` (`gestion_editid3`),
  ADD KEY `f_llam_fin` (`f_llam_fin`),
  ADD KEY `f_llam_discador` (`f_llam_discador`),
  ADD KEY `f_llam_resuelve` (`f_llam_resuelve`),
  ADD KEY `id_ori_campana` (`id_ori_campana`),
  ADD KEY `f_fingestion` (`f_movedor`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `CodErr` (`CodErr`),
  ADD KEY `CodErr1` (`CodErr1`),
  ADD KEY `audio` (`audio`),
  ADD KEY `audio2` (`audio2`),
  ADD KEY `sql` (`sql`),
  ADD KEY `dialstatus` (`dialstatus`),
  ADD KEY `dialstatus1` (`dialstatus1`),
  ADD KEY `id_ori_seg_cola` (`id_ori_seg_cola`),
  ADD KEY `age_nombre` (`age_nombre`),
  ADD KEY `anexo` (`anexo`),
  ADD KEY `espera` (`espera`),
  ADD KEY `timbrado1` (`timbrado1`),
  ADD KEY `timbrado2` (`timbrado2`),
  ADD KEY `grabacion` (`grabacion`),
  ADD KEY `filtro` (`filtro`);

--
-- Indexes for table `atributo`
--
ALTER TABLE `atributo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id` (`id`,`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissions_0e939a4f` (`group_id`),
  ADD KEY `auth_group_permissions_8373b171` (`permission_id`),
  ADD KEY `id` (`id`,`group_id`,`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  ADD KEY `auth_permission_417f1b1c` (`content_type_id`),
  ADD KEY `id` (`id`,`name`,`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `nivel` (`nivel`),
  ADD KEY `empresa` (`empresa`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_e8701ad4` (`user_id`),
  ADD KEY `auth_user_groups_0e939a4f` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  ADD KEY `auth_user_user_permissions_8373b171` (`permission_id`);

--
-- Indexes for table `base`
--
ALTER TABLE `base`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `duracion` (`duracion`),
  ADD KEY `campania` (`campania`),
  ADD KEY `resultado` (`resultado`),
  ADD KEY `agente` (`agente`),
  ADD KEY `status_h` (`status_h`),
  ADD KEY `flag_resul` (`flag_resul`),
  ADD KEY `orden` (`orden`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `status_f` (`status_f`),
  ADD KEY `status_g` (`status_g`),
  ADD KEY `ProFlag` (`ProFlag`),
  ADD KEY `FiltroHdeC` (`FiltroHdeC`),
  ADD KEY `ProEstado` (`ProEstado`),
  ADD KEY `blacklist` (`blacklist`),
  ADD KEY `resultadotxt` (`resultadotxt`),
  ADD KEY `id` (`id`),
  ADD KEY `telefono` (`telefono`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `status_a` (`status_a`),
  ADD KEY `status_b` (`status_b`),
  ADD KEY `status_c` (`status_c`),
  ADD KEY `status_d` (`status_d`),
  ADD KEY `status_e` (`status_e`),
  ADD KEY `status` (`status`),
  ADD KEY `bloqueocliente` (`bloqueocliente`),
  ADD KEY `audio` (`audio`),
  ADD KEY `detalle` (`detalle`),
  ADD KEY `monto` (`monto`),
  ADD KEY `fecha` (`fecha`),
  ADD KEY `tiniciogestion` (`tiniciogestion`),
  ADD KEY `tfingestion` (`tfingestion`),
  ADD KEY `tiniciollamada` (`tiniciollamada`),
  ADD KEY `tfinllamada` (`tfinllamada`),
  ADD KEY `password` (`password`),
  ADD KEY `telefonomarcado2` (`telefonomarcado2`),
  ADD KEY `resultado_asterisk` (`resultado_asterisk`),
  ADD KEY `resultadoat` (`resultadoat`);

--
-- Indexes for table `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preg_exam` (`preg_exam`),
  ADD KEY `agente` (`agente`),
  ADD KEY `campania` (`campania`),
  ADD KEY `empresa` (`empresa`),
  ADD KEY `llamada` (`llamada`);

--
-- Indexes for table `campania`
--
ALTER TABLE `campania`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `supervisor` (`supervisor`),
  ADD KEY `cartera` (`cartera`),
  ADD KEY `prefijo` (`prefijo`),
  ADD KEY `status` (`status`),
  ADD KEY `discado` (`discado`),
  ADD KEY `factor` (`factor`);

--
-- Indexes for table `cartera`
--
ALTER TABLE `cartera`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carteraempresa`
--
ALTER TABLE `carteraempresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartera` (`cartera`),
  ADD KEY `empresa` (`empresa`),
  ADD KEY `user` (`user`),
  ADD KEY `privilegio` (`privilegio`),
  ADD KEY `fecha` (`fecha`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`name`);

--
-- Indexes for table `criterios`
--
ALTER TABLE `criterios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`name`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disc`
--
ALTER TABLE `disc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discado` (`nombre`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_417f1b1c` (`content_type_id`),
  ADD KEY `django_admin_log_e8701ad4` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`),
  ADD KEY `id` (`id`,`name`,`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`app`,`name`,`applied`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`),
  ADD KEY `session_key` (`session_key`,`expire_date`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascaras` (`mascaras`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`nombre`),
  ADD KEY `flag` (`flag`);

--
-- Indexes for table `estadocambio`
--
ALTER TABLE `estadocambio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `estado` (`estado`),
  ADD KEY `fecha` (`fecha`);

--
-- Indexes for table `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nombre` (`nombre`);

--
-- Indexes for table `excel`
--
ALTER TABLE `excel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `archivo` (`archivo`);

--
-- Indexes for table `filtro`
--
ALTER TABLE `filtro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campania` (`campania`),
  ADD KEY `status` (`status`),
  ADD KEY `orden` (`orden`);

--
-- Indexes for table `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campania` (`campania`);

--
-- Indexes for table `licencias_tmp`
--
ALTER TABLE `licencias_tmp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa` (`empresa`),
  ADD KEY `lic_tmp` (`lic_tmp`),
  ADD KEY `finicio` (`finicio`),
  ADD KEY `ffin` (`ffin`);

--
-- Indexes for table `listanegra`
--
ALTER TABLE `listanegra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campania` (`campania`),
  ADD KEY `dni` (`dni`);

--
-- Indexes for table `mascara`
--
ALTER TABLE `mascara`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo` (`tipo`);

--
-- Indexes for table `monitorserver`
--
ALTER TABLE `monitorserver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dsk_use` (`dsk_use`),
  ADD KEY `total_mem` (`total_mem`),
  ADD KEY `use_mem` (`use_mem`),
  ADD KEY `total_swap` (`total_swap`),
  ADD KEY `CPU` (`CPU`);

--
-- Indexes for table `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`nombre`),
  ADD KEY `nombre` (`nombre`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo` (`tipo`);

--
-- Indexes for table `preg_exam`
--
ALTER TABLE `preg_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `examen` (`examen`),
  ADD KEY `pregunta` (`pregunta`),
  ADD KEY `valor` (`valor`);

--
-- Indexes for table `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mascara` (`mascara`),
  ADD KEY `flag_call` (`flag_call`),
  ADD KEY `codigo` (`codigo`),
  ADD KEY `tipo` (`tipo`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `supervisorcartera`
--
ALTER TABLE `supervisorcartera`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cartera` (`cartera`),
  ADD KEY `supervisor` (`supervisor`);

--
-- Indexes for table `troncales`
--
ALTER TABLE `troncales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`nombre`);

--
-- Indexes for table `troncalesagentes`
--
ALTER TABLE `troncalesagentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa` (`empresa`),
  ADD KEY `troncal` (`troncal`),
  ADD KEY `id` (`id`,`empresa`,`troncal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `agendados`
--
ALTER TABLE `agendados`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `agentebase`
--
ALTER TABLE `agentebase`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `agentecalificacion`
--
ALTER TABLE `agentecalificacion`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `agentes`
--
ALTER TABLE `agentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `agentescampanias`
--
ALTER TABLE `agentescampanias`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `agentesupervisor`
--
ALTER TABLE `agentesupervisor`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ajx_pro_acd`
--
ALTER TABLE `ajx_pro_acd`
  MODIFY `id_ori_acd` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ajx_pro_bas`
--
ALTER TABLE `ajx_pro_bas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ajx_pro_lla`
--
ALTER TABLE `ajx_pro_lla`
  MODIFY `id_ori_llamadas` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `atributo`
--
ALTER TABLE `atributo`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
-- AUTO_INCREMENT for table `base`
--
ALTER TABLE `base`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `campania`
--
ALTER TABLE `campania`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cartera`
--
ALTER TABLE `cartera`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `carteraempresa`
--
ALTER TABLE `carteraempresa`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `criterios`
--
ALTER TABLE `criterios`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disc`
--
ALTER TABLE `disc`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `estadocambio`
--
ALTER TABLE `estadocambio`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `examen`
--
ALTER TABLE `examen`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `excel`
--
ALTER TABLE `excel`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `filtro`
--
ALTER TABLE `filtro`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `licencias_tmp`
--
ALTER TABLE `licencias_tmp`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `listanegra`
--
ALTER TABLE `listanegra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mascara`
--
ALTER TABLE `mascara`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `monitorserver`
--
ALTER TABLE `monitorserver`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nivel`
--
ALTER TABLE `nivel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `nota`
--
ALTER TABLE `nota`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `preg_exam`
--
ALTER TABLE `preg_exam`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `resultado`
--
ALTER TABLE `resultado`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `supervisorcartera`
--
ALTER TABLE `supervisorcartera`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `troncales`
--
ALTER TABLE `troncales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
