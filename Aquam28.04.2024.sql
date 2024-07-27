-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.17 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para aquapp
CREATE DATABASE IF NOT EXISTS `aquapp` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aquapp`;

-- Volcando estructura para tabla aquapp.asistencia
DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE IF NOT EXISTS `asistencia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `T_Manana` int(11) DEFAULT '0',
  `TM_Ingreso` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `TM_Salida` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `T_Tarde` int(11) DEFAULT '0',
  `TT_Ingreso` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `TT_Salida` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=725 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.cierre
DROP TABLE IF EXISTS `cierre`;
CREATE TABLE IF NOT EXISTS `cierre` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL COMMENT 'fecha en que se hace el cierre',
  `Hora` time DEFAULT NULL COMMENT 'hora en la que se hace el cierre',
  `IdUsuario` int(11) DEFAULT NULL COMMENT 'El ususario ue está trabajando como asistente de control',
  `p200` decimal(10,2) DEFAULT NULL COMMENT 'cuanto conteó el asistente de control',
  `p100` decimal(10,2) DEFAULT NULL,
  `p50` decimal(10,2) DEFAULT NULL,
  `p20` decimal(10,2) DEFAULT NULL,
  `p10` decimal(10,2) DEFAULT NULL,
  `p5` decimal(10,2) DEFAULT NULL,
  `p2` decimal(10,2) DEFAULT NULL,
  `p1` decimal(10,2) DEFAULT NULL,
  `p050` decimal(10,2) DEFAULT NULL,
  `p020` decimal(10,2) DEFAULT NULL,
  `p010` decimal(10,2) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DNI` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telefono` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Direccion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Referencia` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Latitud` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Longitud` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TipoCliente` int(11) DEFAULT '0' COMMENT '0 bodegas, 1 casas',
  `IdUsuario` int(11) DEFAULT NULL,
  `Botellones` int(11) NOT NULL DEFAULT '0',
  `Precio` decimal(10,2) NOT NULL DEFAULT '2.50',
  `PrecioPaq` decimal(10,2) DEFAULT '9.50',
  `TipoContacto` int(11) DEFAULT '1' COMMENT '1 Visita, 2 Telefono, 3 Whatsapp, 4 no llamar',
  `Vale` int(11) DEFAULT '1' COMMENT '1 sí, 0 no',
  `Estado` int(11) DEFAULT '1',
  `FechaInicio` date DEFAULT NULL COMMENT 'Primer Pedido',
  `FechaFin` date DEFAULT NULL COMMENT 'ultimo pedido',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=491 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.constantes
DROP TABLE IF EXISTS `constantes`;
CREATE TABLE IF NOT EXISTS `constantes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL COMMENT '0 debe (salida), 1 haber (ingreso)',
  `Otros` int(11) DEFAULT '1' COMMENT '1 si puede ser utilizado en "otros", 0 no, porque tiene su propio modulo',
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Item` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Link` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Icono` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TipoMenu` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `uRoot` int(11) NOT NULL DEFAULT '0',
  `uAdmin` int(11) NOT NULL DEFAULT '0',
  `uVendedor` int(11) NOT NULL DEFAULT '0',
  `uRepartidor` int(11) NOT NULL DEFAULT '0',
  `uControl` int(11) NOT NULL DEFAULT '0',
  `uOperador` int(11) NOT NULL DEFAULT '0',
  `Estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.metas
DROP TABLE IF EXISTS `metas`;
CREATE TABLE IF NOT EXISTS `metas` (
  `Periodo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Desde` date DEFAULT NULL,
  `Hasta` date DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `MetaBot` decimal(10,2) DEFAULT NULL,
  `MetaPaq` decimal(10,2) DEFAULT NULL,
  `MetaMinBot` decimal(10,2) DEFAULT NULL,
  `MetaMinPaq` decimal(10,2) DEFAULT NULL,
  `BonoBot` decimal(10,2) DEFAULT NULL,
  `BonoPaq` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='metas mensuales por cada trabajador';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.metasvendedores
DROP TABLE IF EXISTS `metasvendedores`;
CREATE TABLE IF NOT EXISTS `metasvendedores` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Mes` int(11) DEFAULT NULL,
  `Ano` int(11) DEFAULT NULL,
  `IdVendedor` int(11) DEFAULT NULL,
  `MetaClientes` int(11) DEFAULT NULL,
  `BonoClientes` decimal(20,2) DEFAULT NULL,
  `MetaVentas` int(11) DEFAULT NULL,
  `BonoVentas` decimal(20,2) DEFAULT NULL,
  `BonoPlus` decimal(20,2) DEFAULT NULL COMMENT 'en porcentajes',
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.movimientos
DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE IF NOT EXISTS `movimientos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `IdCategoria` int(11) DEFAULT NULL,
  `IdReferencia` int(11) DEFAULT '0' COMMENT 'si esta asociado a un pago se incluye',
  `Glosa` text COLLATE utf8_unicode_ci,
  `Monto` decimal(10,2) DEFAULT NULL,
  `CajaGeneral` int(11) DEFAULT '0',
  `Saldo` decimal(20,6) DEFAULT '0.000000',
  `Transferencia` int(11) DEFAULT '0' COMMENT 'si es 1 quiere decir que el monto es por transferencia',
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=26472 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.pedidos
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) DEFAULT NULL,
  `IdUsuarioPide` int(11) DEFAULT NULL,
  `FechaRegistra` date DEFAULT NULL COMMENT 'fecha en que se registra el pedido',
  `HoraRegistra` time DEFAULT NULL COMMENT 'hora en que se registra el pedido',
  `FechaPide` date DEFAULT NULL COMMENT 'Que fecha quiere que le entreguen',
  `HoraPide` time DEFAULT NULL COMMENT 'que hora quiere que le entregen',
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `CantidadPaq` int(11) DEFAULT NULL,
  `PrecioPaq` decimal(10,2) DEFAULT NULL,
  `IdUsuarioEnvio` int(11) DEFAULT NULL,
  `FechaEnvio` date DEFAULT NULL COMMENT 'Que fecha sale el repartidor',
  `HoraEnvio` time DEFAULT NULL COMMENT 'Que hora está saliendo el repartidor',
  `CantidadEnvio` int(11) DEFAULT NULL,
  `CantidadPaqEnvio` int(11) DEFAULT NULL,
  `IdUsuarioEntrega` int(11) DEFAULT NULL,
  `FechaEntrega` date DEFAULT NULL COMMENT 'Que fecha entregó el repartidor',
  `HoraEntrega` time DEFAULT NULL COMMENT 'Que hora entregó el repartidor',
  `LatEntrega` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Latitud donde se hace la entrega - Por defecto en casa',
  `LngEntrega` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Longitud donde se hace la entrega - Por defecto en casa',
  `IdUsuarioRecibe` int(11) DEFAULT NULL,
  `FechaRecibe` date DEFAULT NULL COMMENT 'Que fecha se rinde',
  `HoraRecibe` time DEFAULT NULL COMMENT 'Que hora se rinde',
  `Facturado` int(11) DEFAULT '0',
  `Comentario` text COLLATE utf8_unicode_ci,
  `EstadoPedido` int(11) DEFAULT '0' COMMENT '0 pedido, 1 entregado y rendido, 2 rechazado confirmado, 3 en transito, 4 entregdo pendiente de rendir, 5 rechazado pendiente de rendir',
  `TipoPago` int(11) DEFAULT NULL COMMENT '0 efectivo, 1 tansferencia',
  `EstadoPago` int(11) DEFAULT NULL COMMENT '1 pagado, 0 pendiente',
  `Vales` int(11) DEFAULT '0',
  `Garantia` decimal(10,2) DEFAULT '0.00',
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=19899 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.pista_audit
DROP TABLE IF EXISTS `pista_audit`;
CREATE TABLE IF NOT EXISTS `pista_audit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Operacion` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IdReferencia` int(11) DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.planilla
DROP TABLE IF EXISTS `planilla`;
CREATE TABLE IF NOT EXISTS `planilla` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) DEFAULT NULL,
  `Basico` decimal(10,2) DEFAULT NULL,
  `Otros` decimal(10,2) DEFAULT NULL,
  `Desde` date DEFAULT NULL,
  `Hasta` date DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.posicion
DROP TABLE IF EXISTS `posicion`;
CREATE TABLE IF NOT EXISTS `posicion` (
  `IdVendedor` int(11) DEFAULT NULL,
  `Lat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Lng` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  UNIQUE KEY `Lat_Lng_Fecha_Hora` (`Lat`,`Lng`,`Fecha`,`Hora`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='debe destruirse después de 10 días';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.tarifariobot
DROP TABLE IF EXISTS `tarifariobot`;
CREATE TABLE IF NOT EXISTS `tarifariobot` (
  `Valor` decimal(10,2) DEFAULT NULL,
  `Texto` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.tarifariopaq
DROP TABLE IF EXISTS `tarifariopaq`;
CREATE TABLE IF NOT EXISTS `tarifariopaq` (
  `Min` int(11) DEFAULT NULL,
  `Max` int(11) DEFAULT NULL,
  `Precio` decimal(20,2) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.tarifariopaqclientes
DROP TABLE IF EXISTS `tarifariopaqclientes`;
CREATE TABLE IF NOT EXISTS `tarifariopaqclientes` (
  `IdCliente` int(11) DEFAULT NULL,
  `IdUsuarioRegistra` int(11) DEFAULT NULL,
  `Min` int(11) DEFAULT NULL,
  `Max` int(11) DEFAULT NULL,
  `Valor` decimal(10,2) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.transferenciacartera
DROP TABLE IF EXISTS `transferenciacartera`;
CREATE TABLE IF NOT EXISTS `transferenciacartera` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuarioOrigen` int(11) DEFAULT NULL,
  `IdVendedorRecibe` int(11) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `FechaTransferencia` date DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Clave` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL COMMENT '0 Root, 1 Admin, 2 Representante de Ventas, 3 Repartidor, 4 asistente de control, 5 operador de planta',
  `Nombre` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FechaNac` date DEFAULT NULL,
  `Telefono` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Direccion` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `FechaBaja` date DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.vehiculos
DROP TABLE IF EXISTS `vehiculos`;
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Placa` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `FechaBaja` date DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla aquapp.visitas
DROP TABLE IF EXISTS `visitas`;
CREATE TABLE IF NOT EXISTS `visitas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL COMMENT 'El usuario que tiene la asignación (quien visitará)',
  `FechaAsignacion` date DEFAULT NULL,
  `HoraAsignacion` time DEFAULT NULL,
  `FechaProgramacion` date DEFAULT NULL,
  `FechaVisita` date DEFAULT NULL,
  `HoraVisita` time DEFAULT NULL,
  `TipoContacto` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Visita, Telefono, Whatsapp',
  `Glosa` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Resultado` int(11) DEFAULT '0' COMMENT '0 pendiente, 1 visitado pero no encontrado, 2 visitado reacio, 3 visitado pedido realizado',
  `Latitud` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Longitud` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='falta';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para vista aquapp.v_proy_clientes
DROP VIEW IF EXISTS `v_proy_clientes`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_proy_clientes` (
	`Id` INT(11) NOT NULL,
	`Nombre` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`n_pedidos` BIGINT(21) NOT NULL,
	`n_botellones` DECIMAL(32,0) NOT NULL,
	`ultimo_pedido` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`frecuencia_pedido` VARCHAR(8) NOT NULL COLLATE 'utf8_general_ci',
	`Prox_pedido` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`Estado` VARCHAR(7) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista aquapp.v_segmentacion
DROP VIEW IF EXISTS `v_segmentacion`;
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_segmentacion` (
	`IdCliente` INT(11) NOT NULL,
	`Nombre` VARCHAR(50) NULL COLLATE 'utf8_unicode_ci',
	`FrecuenciaCompra` BIGINT(21) NOT NULL,
	`TotalBotellones` DECIMAL(32,0) NULL,
	`TotalPaquetes` DECIMAL(32,0) NULL,
	`MontoTotalCompra` DECIMAL(43,2) NULL,
	`PrimeraCompra` DATE NULL COMMENT 'Que fecha entregó el repartidor',
	`UltimaCompra` DATE NULL COMMENT 'Que fecha entregó el repartidor',
	`tiempototal` INT(7) NULL,
	`DiasDesdeUltimaCompra` INT(7) NULL,
	`TiempoMaxEntreCompras` BIGINT(7) NULL,
	`TiempoPromedioEntreCompras` DECIMAL(9,2) NULL,
	`MaxBot` INT(11) NULL,
	`MaxPaq` INT(11) NULL,
	`PromedioBotellones` DECIMAL(14,4) NOT NULL,
	`PromedioPaquetes` DECIMAL(14,4) NOT NULL,
	`MontoPromedioMensual` DECIMAL(47,6) NULL,
	`TipoCliente` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Segmento` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_general_ci',
	`EstadoRecencia` VARCHAR(7) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para procedimiento aquapp.rpt_flujo_caja
DROP PROCEDURE IF EXISTS `rpt_flujo_caja`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpt_flujo_caja`()
BEGIN
#INGRESOS SUMA
	(select
		"INGRESOS" Conceptos,
		SUM(IF( MONTH(m.Fecha)=08 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Ago-20",
		SUM(IF( MONTH(m.Fecha)=09 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Set-20",
		SUM(IF( MONTH(m.Fecha)=10 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Oct-20",
		SUM(IF( MONTH(m.Fecha)=11 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Nov-20",
		SUM(IF( MONTH(m.Fecha)=12 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Dic-20",
		SUM(IF( MONTH(m.Fecha)=01 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Ene-21",
		SUM(IF( MONTH(m.Fecha)=02 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Feb-21",
		SUM(IF( MONTH(m.Fecha)=03 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Mar-21",
		SUM(IF( MONTH(m.Fecha)=04 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Abr-21",
		SUM(IF( MONTH(m.Fecha)=05 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "May-21",
		SUM(IF( MONTH(m.Fecha)=06 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Jun-21",
		SUM(IF( MONTH(m.Fecha)=07 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Jul-21",
		SUM(IF( MONTH(m.Fecha)=08 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Ago-21",
		SUM(IF( MONTH(m.Fecha)=09 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Set-21",
		SUM(IF( MONTH(m.Fecha)=10 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Oct-21",
		SUM(IF( MONTH(m.Fecha)=11 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Nov-21",
 		SUM(IF( MONTH(m.Fecha)=12 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Dic-21",
 		SUM(IF( MONTH(m.Fecha)=01 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Ene-22",
 		SUM(IF( MONTH(m.Fecha)=02 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Feb-22",
 		SUM(IF( MONTH(m.Fecha)=03 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Mar-22",
 		SUM(IF( MONTH(m.Fecha)=04 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Abr-22",
 		SUM(IF( MONTH(m.Fecha)=05 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "May-22",
 		SUM(IF( MONTH(m.Fecha)=06 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Jun-22"
	from 
	 movimientos m
	inner join constantes c on m.IdCategoria = c.Id
	where 
		m.Estado = 1 and
		c.Estado = 1 and
		c.Id not in (25,26,29) and
		c.Tipo = 1)

union

	#INGRESOS DETALLE
	(select
		c.Descripcion,
		SUM(IF( MONTH(m.Fecha)=08 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Ago-20",
		SUM(IF( MONTH(m.Fecha)=09 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Set-20",
		SUM(IF( MONTH(m.Fecha)=10 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Oct-20",
		SUM(IF( MONTH(m.Fecha)=11 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Nov-20",
		SUM(IF( MONTH(m.Fecha)=12 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Dic-20",
		SUM(IF( MONTH(m.Fecha)=01 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Ene-21",
		SUM(IF( MONTH(m.Fecha)=02 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Feb-21",
		SUM(IF( MONTH(m.Fecha)=03 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Mar-21",
		SUM(IF( MONTH(m.Fecha)=04 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Abr-21",
		SUM(IF( MONTH(m.Fecha)=05 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "May-21",
		SUM(IF( MONTH(m.Fecha)=06 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Jun-21",
		SUM(IF( MONTH(m.Fecha)=07 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Jul-21",
		SUM(IF( MONTH(m.Fecha)=08 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Ago-21",
		SUM(IF( MONTH(m.Fecha)=09 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Set-21",
		SUM(IF( MONTH(m.Fecha)=10 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Oct-21",
		SUM(IF( MONTH(m.Fecha)=11 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Nov-21",
 		SUM(IF( MONTH(m.Fecha)=12 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Dic-21",
 		SUM(IF( MONTH(m.Fecha)=01 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Ene-22",
 		SUM(IF( MONTH(m.Fecha)=02 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Feb-22",
 		SUM(IF( MONTH(m.Fecha)=03 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Mar-22",
		SUM(IF( MONTH(m.Fecha)=04 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Abr-22",
 		SUM(IF( MONTH(m.Fecha)=05 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "May-22",
 		SUM(IF( MONTH(m.Fecha)=06 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Jun-22"
	from 
	 movimientos m
	inner join constantes c on m.IdCategoria = c.Id
	where 
		m.Estado = 1 and
		c.Estado = 1 and
		c.Id not in (25,26,29) and
		c.Tipo = 1
	group by c.Descripcion)

union 
	#espacio
	(SELECT "--", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "","","","","","")

UNION
	#GASTOS SUMA
	(select
		"GASTOS",
		SUM(IF( MONTH(m.Fecha)=08 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Ago-20",
		SUM(IF( MONTH(m.Fecha)=09 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Set-20",
		SUM(IF( MONTH(m.Fecha)=10 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Oct-20",
		SUM(IF( MONTH(m.Fecha)=11 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Nov-20",
		SUM(IF( MONTH(m.Fecha)=12 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Dic-20",
		SUM(IF( MONTH(m.Fecha)=01 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Ene-21",
		SUM(IF( MONTH(m.Fecha)=02 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Feb-21",
		SUM(IF( MONTH(m.Fecha)=03 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Mar-21",
		SUM(IF( MONTH(m.Fecha)=04 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Abr-21",
		SUM(IF( MONTH(m.Fecha)=05 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "May-21",
		SUM(IF( MONTH(m.Fecha)=06 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Jun-21",
		SUM(IF( MONTH(m.Fecha)=07 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Jul-21",
		SUM(IF( MONTH(m.Fecha)=08 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Ago-21",
		SUM(IF( MONTH(m.Fecha)=09 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Set-21",
		SUM(IF( MONTH(m.Fecha)=10 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Oct-21",
		SUM(IF( MONTH(m.Fecha)=11 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Nov-21",
 		SUM(IF( MONTH(m.Fecha)=12 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Dic-21",
 		SUM(IF( MONTH(m.Fecha)=01 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Ene-22",
 		SUM(IF( MONTH(m.Fecha)=02 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Feb-22",
 		SUM(IF( MONTH(m.Fecha)=03 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Mar-22",
		SUM(IF( MONTH(m.Fecha)=04 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Abr-22",
 		SUM(IF( MONTH(m.Fecha)=05 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "May-22",
 		SUM(IF( MONTH(m.Fecha)=06 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Jun-22"		
	from 
	 movimientos m
	inner join constantes c on m.IdCategoria = c.Id
	where 
		m.Estado = 1 and
		c.Estado = 1 and
		c.Id not in (25,26,29) and
		c.Tipo = 0)

UNION
	#gastos detalle
	(select
	c.Descripcion,
	#CASE WHEN c.Tipo= 0 THEN 'Egreso' ELSE 'Ingresos' END Tipo,
		 SUM(IF( MONTH(m.Fecha)=08 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Ago-20",
		 SUM(IF( MONTH(m.Fecha)=09 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Set-20",
		 SUM(IF( MONTH(m.Fecha)=10 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Oct-20",
		 SUM(IF( MONTH(m.Fecha)=11 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Nov-20",
		 SUM(IF( MONTH(m.Fecha)=12 and Year(m.Fecha)=2020, m.Monto, 0 )) AS "Dic-20",
		 SUM(IF( MONTH(m.Fecha)=01 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Ene-21",
		 SUM(IF( MONTH(m.Fecha)=02 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Feb-21",
		 SUM(IF( MONTH(m.Fecha)=03 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Mar-21",
		 SUM(IF( MONTH(m.Fecha)=04 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Abr-21",
		 SUM(IF( MONTH(m.Fecha)=05 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "May-21",
		 SUM(IF( MONTH(m.Fecha)=06 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Jun-21",
		 SUM(IF( MONTH(m.Fecha)=07 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Jul-21",
		 SUM(IF( MONTH(m.Fecha)=08 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Ago-21",
		 SUM(IF( MONTH(m.Fecha)=09 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Set-21",
		 SUM(IF( MONTH(m.Fecha)=10 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Oct-21",
		 SUM(IF( MONTH(m.Fecha)=11 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Nov-21",
 		 SUM(IF( MONTH(m.Fecha)=12 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Dic-21",
 		 SUM(IF( MONTH(m.Fecha)=01 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Ene-22",
 		SUM(IF( MONTH(m.Fecha)=02 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Feb-22",
 		SUM(IF( MONTH(m.Fecha)=03 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Mar-22",
		SUM(IF( MONTH(m.Fecha)=04 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "Abr-22",
 		SUM(IF( MONTH(m.Fecha)=05 and Year(m.Fecha)=2021, m.Monto, 0 )) AS "May-22",
 		SUM(IF( MONTH(m.Fecha)=06 and Year(m.Fecha)=2022, m.Monto, 0 )) AS "Jun-22"
	from 
	 movimientos m
	inner join constantes c on m.IdCategoria = c.Id
	where 
		m.Estado = 1 and
		c.Estado = 1 and
		c.Id not in (25,26,29) and
		c.Tipo = 0
	group by c.Descripcion)


union 
	#espacio
#	(SELECT "--", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
	(SELECT "--", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "","","","","")
union 
	(select
	"TOTAL",
		 SUM(IF( MONTH(m.Fecha)=08 and Year(m.Fecha)=2020, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Ago-20",
 		 SUM(IF( MONTH(m.Fecha)=09 and Year(m.Fecha)=2020, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Set-20",
 		 SUM(IF( MONTH(m.Fecha)=10 and Year(m.Fecha)=2020, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Oct-20",
 		 SUM(IF( MONTH(m.Fecha)=11 and Year(m.Fecha)=2020, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Nov-20",
 		 SUM(IF( MONTH(m.Fecha)=12 and Year(m.Fecha)=2020, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Dic-20",
 		 SUM(IF( MONTH(m.Fecha)=01 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Ene-21",
 		 SUM(IF( MONTH(m.Fecha)=02 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Feb-21",
 		 SUM(IF( MONTH(m.Fecha)=03 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Mar-21",
 		 SUM(IF( MONTH(m.Fecha)=04 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Abr-21",
 		 SUM(IF( MONTH(m.Fecha)=05 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "May-21",
 		 SUM(IF( MONTH(m.Fecha)=06 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Jun-21",
 		 SUM(IF( MONTH(m.Fecha)=07 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Jul-21",
 		 SUM(IF( MONTH(m.Fecha)=08 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Ago-21",
 		 SUM(IF( MONTH(m.Fecha)=09 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Set-21",
 		 SUM(IF( MONTH(m.Fecha)=10 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Oct-21",
 		 SUM(IF( MONTH(m.Fecha)=11 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Nov-21",
 		 SUM(IF( MONTH(m.Fecha)=12 and Year(m.Fecha)=2021, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Dic-21",
 		 SUM(IF( MONTH(m.Fecha)=01 and Year(m.Fecha)=2022, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Ene-22", 
 		 SUM(IF( MONTH(m.Fecha)=02 and Year(m.Fecha)=2022, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Feb-22",
 		 SUM(IF( MONTH(m.Fecha)=03 and Year(m.Fecha)=2022, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Mar-22",
 		 SUM(IF( MONTH(m.Fecha)=04 and Year(m.Fecha)=2022, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Abr-22",
 		 SUM(IF( MONTH(m.Fecha)=05 and Year(m.Fecha)=2022, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "May-22", 
 		 SUM(IF( MONTH(m.Fecha)=06 and Year(m.Fecha)=2022, CASE when c.Tipo = 0 then  m.Monto * -1 else m.Monto end , 0 )) AS "Jun-22" 
	from
	 movimientos m
	inner join constantes c on m.IdCategoria = c.Id
	where 
		m.Estado = 1 and
		c.Estado = 1 and
		c.Id not in (25,26,29));
/* select 
m.id, 
fecha_b2n(m.Fecha) Fecha,
m.IdUsuario,
m.IdCategoria,
c.Descripcion Categoria,
c.Tipo,
m.IdReferencia,
m.Glosa,
m.Monto,
m.Estado
 from movimientos m
 inner join constantes c on m.IdCategoria = c.Id
 where m.Estado = 1
 and m.IdCategoria not in (25,26);*/
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.rpt_generarFlujoDeCaja
DROP PROCEDURE IF EXISTS `rpt_generarFlujoDeCaja`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpt_generarFlujoDeCaja`()
BEGIN
    -- Variables para generar los meses dinámicamente
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    DECLARE sql_query TEXT DEFAULT '';

    -- Calcular la fecha de inicio (24 meses atrás desde la fecha actual)
    SET end_date = CURDATE();
    SET start_date = DATE_SUB(end_date, INTERVAL 23 MONTH);

    -- Generar dinámicamente las columnas de los últimos 24 meses
    WHILE start_date <= end_date DO
        SET sql_query = CONCAT(sql_query,
            'SUM(IF(MONTH(m.Fecha) = ', MONTH(start_date), 
            ' AND YEAR(m.Fecha) = ', YEAR(start_date), 
            ', CASE WHEN c.Tipo = 0 THEN m.Monto * -1 ELSE m.Monto END, 0)) AS "', DATE_FORMAT(start_date, '%b-%y'), '", ');

        SET start_date = DATE_ADD(start_date, INTERVAL 1 MONTH);
    END WHILE;

    -- Remover la última coma y espacio
    SET sql_query = LEFT(sql_query, LENGTH(sql_query) - 2);

    -- Construir la consulta principal usando las columnas generadas
    SET @main_query = CONCAT('
    SELECT "INGRESOS" AS Conceptos, ', sql_query, '
    FROM movimientos m
    INNER JOIN constantes c ON m.IdCategoria = c.Id
    WHERE m.Estado = 1 AND c.Estado = 1 AND c.Id NOT IN (25,26,29) AND c.Tipo = 1
    UNION
    SELECT c.Descripcion, ', sql_query, '
    FROM movimientos m
    INNER JOIN constantes c ON m.IdCategoria = c.Id
    WHERE m.Estado = 1 AND c.Estado = 1 AND c.Id NOT IN (25,26,29) AND c.Tipo = 1
    GROUP BY c.Descripcion
    UNION
    SELECT "--", ', REPEAT('"" AS "", ', 23), ' ""
    UNION
    SELECT "GASTOS", ', sql_query, '
    FROM movimientos m
    INNER JOIN constantes c ON m.IdCategoria = c.Id
    WHERE m.Estado = 1 AND c.Estado = 1 AND c.Id NOT IN (25,26,29) AND c.Tipo = 0
    UNION
    SELECT c.Descripcion, ', sql_query, '
    FROM movimientos m
    INNER JOIN constantes c ON m.IdCategoria = c.Id
    WHERE m.Estado = 1 AND c.Estado = 1 AND c.Id NOT IN (25,26,29) AND c.Tipo = 0
    GROUP BY c.Descripcion
    UNION
    SELECT "--", ', REPEAT('"" AS "", ', 23), ' ""
    UNION
    SELECT "TOTAL", ', sql_query, '
    FROM movimientos m
    INNER JOIN constantes c ON m.IdCategoria = c.Id
    WHERE m.Estado = 1 AND c.Estado = 1 AND c.Id NOT IN (25,26,29)');

    -- Ejecutar la consulta principal
    PREPARE stmt FROM @main_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.rpt_proyeccion_cliente
DROP PROCEDURE IF EXISTS `rpt_proyeccion_cliente`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpt_proyeccion_cliente`()
BEGIN
select 
c.Id,
c.Nombre,
count(p.Id) n_pedidos,
ifnull(sum(p.Cantidad),0) n_botellones,
IFNULL(fecha_b2n(max(p.FechaEntrega)),"") ultimo_pedido,

IFNULL(round((datediff(max(p.FechaEntrega), min(p.FechaEntrega)))/(count(p.id)-1),0),"" ) frecuencia_pedido,
IFNULL(fecha_b2n(DATE_ADD(max(p.FechaEntrega), INTERVAL round((datediff(max(p.FechaEntrega), min(p.FechaEntrega)))/(count(p.id)-1),0 ) DAY)),"")  Prox_pedido,
case
	when
		DATE_ADD(max(p.FechaEntrega), INTERVAL round((datediff(max(p.FechaEntrega), min(p.FechaEntrega)))/(count(p.id)-1),0 ) DAY)
		< date(now()) 
	then
		"Vencido"
	when
		count(p.Id) <= 1 then
		"Vencido"
	else
		"Vigente"
end Estado
from clientes c
left join pedidos p on p.Idcliente =  c.Id and p.EstadoPedido = 1 and p.Estado = 1
where 
	c.Id <>0 and 
	c.Estado = 1 and
	c.TipoCliente = 0
group by 
	c.Id
order by 	
max(p.FechaEntrega);
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.rpt_RFM
DROP PROCEDURE IF EXISTS `rpt_RFM`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpt_RFM`()
WITH RFM_Calculations AS (
    SELECT
        IdCliente,
        c.Nombre,
        MAX(FechaEntrega) AS UltimaCompra,
        COUNT(p.Id) AS Frecuencia,
        COALESCE(SUM(p.Cantidad * p.Precio + p.CantidadPaq * p.PrecioPaq),0) AS ValorMonetario,
        DATEDIFF(CURDATE(), MAX(FechaEntrega)) AS DiasSinCompras
    FROM pedidos p
	     INNER JOIN clientes c ON p.IdCliente = c.id
	 WHERE 
	 	p.EstadoPedido = 1 AND p.Estado = 1 AND Idcliente IN (SELECT id FROM clientes WHERE estado = 1 AND id <> 0) and
	 	FechaEntrega >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)

    GROUP BY IdCliente
),
-- Paso 2: Calcular los cuartiles para Recency, Frequency y Monetary
Recency_Cuartiles AS (
    SELECT
        IdCliente,
        Nombre,
        DiasSinCompras,
        UltimaCompra,
        Frecuencia,
        ValorMonetario,
        NTILE(5) OVER (ORDER BY DiasSinCompras DESC) AS RecencyQuartile
    FROM RFM_Calculations
),
Frequency_Cuartiles AS (
    SELECT
        IdCliente,
        Frecuencia,
        NTILE(5) OVER (ORDER BY Frecuencia ASC) AS FrequencyQuartile
    FROM RFM_Calculations
),
Monetary_Cuartiles AS (
    SELECT
        IdCliente,
        ValorMonetario,
        NTILE(5) OVER (ORDER BY ValorMonetario asc) AS MonetaryQuartile
    FROM RFM_Calculations
)
-- Paso 3: Unir las tablas de cuartiles y generar el segmento RFM
SELECT
   
	  r.IdCliente,
	  r.Nombre,
	  r.DiasSinCompras,
     r.RecencyQuartile AS Recency,
     f.FrequencyQuartile AS Frequency,
     m.MonetaryQuartile AS Monetary,
     CONCAT(r.RecencyQuartile, f.FrequencyQuartile, m.MonetaryQuartile) AS RFM_Segment,
    -- Agregar columnas adicionales: UltimaCompra, ValorMonetario, Frecuencia
     r.UltimaCompra AS UltimaFechaCompra,
     r.ValorMonetario AS TotalCompra,
     r.Frecuencia AS FrecuenciaCompra,
    ((r.RecencyQuartile * 0.45) + (f.FrequencyQuartile * 0.35) + (m.MonetaryQuartile * 0.2))  puntaje,
    -- Calcular el puntaje promedio y asignar categoría
    CASE
        	WHEN ((r.RecencyQuartile * 0.45) + (f.FrequencyQuartile * 0.35) + (m.MonetaryQuartile * 0.2))  >= 3.6 THEN 'Bueno'
        	WHEN ((r.RecencyQuartile * 0.45) + (f.FrequencyQuartile * 0.35) + (m.MonetaryQuartile * 0.2)) >= 2.3 THEN 'Regular'
        ELSE 'Malo'
    END AS Categoria
FROM
    Recency_Cuartiles r
JOIN
    Frequency_Cuartiles f ON r.IdCliente = f.IdCliente
JOIN
    Monetary_Cuartiles m ON r.IdCliente = m.IdCliente//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.rpt_SegmentarClientes
DROP PROCEDURE IF EXISTS `rpt_SegmentarClientes`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpt_SegmentarClientes`()
BEGIN
    -- Paso 1: Crear una tabla temporal para almacenar los cálculos intermedios
    CREATE TEMPORARY TABLE TempCustomerMetrics AS
    SELECT 
        p.IdCliente,
        c.Nombre AS NombreCliente,
        MAX(p.FechaEntrega) AS LastPurchaseDate,
        COUNT(*) AS TotalPurchases,
        AVG(IFNULL(p.Cantidad * p.Precio + p.CantidadPaq * p.PrecioPaq, 0)) AS AveragePurchaseAmount
    FROM 
        pedidos p
        INNER JOIN clientes c ON p.IdCliente = c.Id
    WHERE
        p.Estado = 1 AND p.EstadoPedido = 1 AND c.Estado = 1 AND p.IdCliente != 0  -- Considerando solo los registros válidos y clientes activos, excluyendo IdCliente = 0
        AND p.FechaEntrega >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)  -- Filtrar ventas de los últimos 12 meses
    GROUP BY 
        p.IdCliente;

    -- Paso 2: Calcular la fecha mínima para el cálculo del DateRange
    SELECT 
        DATE_SUB(MAX(LastPurchaseDate), INTERVAL 1 YEAR) INTO @MinDate
    FROM 
        TempCustomerMetrics;

    -- Paso 3: Calcular los valores máximos y mínimos para cada métrica
    SELECT 
        MAX(LastPurchaseDate) AS MaxDate,
        MIN(TotalPurchases) AS MinPurchases,
        MAX(TotalPurchases) AS MaxPurchases,
        MIN(AveragePurchaseAmount) AS MinAvgPurchaseAmount,
        MAX(AveragePurchaseAmount) AS MaxAvgPurchaseAmount
    INTO 
        @MaxDate, @MinPurchases, @MaxPurchases, @MinAvgPurchaseAmount, @MaxAvgPurchaseAmount
    FROM 
        TempCustomerMetrics;

    -- Paso 4: Calcular los puntajes ponderados y almacenarlos en una nueva tabla temporal
    CREATE TEMPORARY TABLE TempCustomerScores AS
    SELECT 
        IdCliente,
        NombreCliente,
        LastPurchaseDate,
        TotalPurchases,
        AveragePurchaseAmount,
        CASE 
            WHEN TIMESTAMPDIFF(DAY, LastPurchaseDate, @MaxDate) <= 45 THEN 3
            WHEN TIMESTAMPDIFF(DAY, LastPurchaseDate, @MaxDate) > 45 AND TIMESTAMPDIFF(DAY, LastPurchaseDate, @MaxDate) <= 120 THEN 2
            ELSE 1
        END AS LastPurchaseValue,
        CASE 
            WHEN TotalPurchases <= @MinPurchases + (@MaxPurchases - @MinPurchases) / 3 THEN 1
            WHEN TotalPurchases <= @MinPurchases + 2 * (@MaxPurchases - @MinPurchases) / 3 THEN 2
            ELSE 3
        END AS PurchaseFrequencyValue,
        CASE 
            WHEN AveragePurchaseAmount <= @MinAvgPurchaseAmount + (@MaxAvgPurchaseAmount - @MinAvgPurchaseAmount) / 3 THEN 1
            WHEN AveragePurchaseAmount <= @MinAvgPurchaseAmount + 2 * (@MaxAvgPurchaseAmount - @MinAvgPurchaseAmount) / 3 THEN 2
            ELSE 3
        END AS AveragePurchaseValue,
        ROUND(
            (CASE 
                WHEN TIMESTAMPDIFF(DAY, LastPurchaseDate, @MaxDate) <= 45 THEN 3
                WHEN TIMESTAMPDIFF(DAY, LastPurchaseDate, @MaxDate) > 45 AND TIMESTAMPDIFF(DAY, LastPurchaseDate, @MaxDate) <= 120 THEN 2
                ELSE 1
             END * 0.45)
             +
            (CASE 
                WHEN TotalPurchases <= @MinPurchases + (@MaxPurchases - @MinPurchases) / 3 THEN 1
                WHEN TotalPurchases <= @MinPurchases + 2 * (@MaxPurchases - @MinPurchases) / 3 THEN 2
                ELSE 3
             END * 0.35)
             +
            (CASE 
                WHEN AveragePurchaseAmount <= @MinAvgPurchaseAmount + (@MaxAvgPurchaseAmount - @MinAvgPurchaseAmount) / 3 THEN 1
                WHEN AveragePurchaseAmount <= @MinAvgPurchaseAmount + 2 * (@MaxAvgPurchaseAmount - @MinAvgPurchaseAmount) / 3 THEN 2
                ELSE 3
             END * 0.20)
        , 2) AS Score
    FROM 
        TempCustomerMetrics;

    -- Paso 5: Calcular los valores mínimos y máximos de Score
    SELECT 
        MIN(Score) AS MinScore,
        MAX(Score) AS MaxScore
    INTO 
        @MinScore, @MaxScore
    FROM 
        TempCustomerScores;

    -- Paso 6: Calcular el rango de Score
    SET @ScoreRange = (@MaxScore - @MinScore) / 3;

    -- Paso 7: Asignar etiquetas de ScoreLabel basadas en el Score
    SELECT 
        IdCliente,
        NombreCliente,
        LastPurchaseDate,
        TotalPurchases,
        AveragePurchaseAmount,
        LastPurchaseValue,
        PurchaseFrequencyValue,
        AveragePurchaseValue,
        Score,
        CASE 
            WHEN Score >= @MinScore + @ScoreRange * 2 THEN 'Bueno'
            WHEN Score >= @MinScore + @ScoreRange THEN 'Regular'
            ELSE 'Malo'
        END AS ScoreLabel
    FROM 
        TempCustomerScores
    ORDER BY 
        LastPurchaseDate DESC, TotalPurchases DESC, AveragePurchaseAmount DESC;

    -- Eliminar las tablas temporales (opcional)
    DROP TEMPORARY TABLE IF EXISTS TempCustomerMetrics;
    DROP TEMPORARY TABLE IF EXISTS TempCustomerScores;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.rpt_ventas_mensual
DROP PROCEDURE IF EXISTS `rpt_ventas_mensual`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpt_ventas_mensual`()
BEGIN

set @numero = 0;

SELECT

	 day(FechaEntrega) Fecha,
	 SUM(IF( MONTH(FechaEntrega)=08 and Year(FechaEntrega)=2020, p.Cantidad, 0 )) AS "Ago-20",
    SUM(IF( MONTH(FechaEntrega)=09 and Year(FechaEntrega)=2020, p.Cantidad, 0 )) AS "Set-20",
    SUM(IF( MONTH(FechaEntrega)=10 and Year(FechaEntrega)=2020, p.Cantidad, 0 )) AS "Oct-20",
    SUM(IF( MONTH(FechaEntrega)=11 and Year(FechaEntrega)=2020, p.Cantidad, 0 )) AS "Nov-20",
    SUM(IF( MONTH(FechaEntrega)=12 and Year(FechaEntrega)=2020, p.Cantidad, 0 )) AS "Dic-20",
    SUM(IF( MONTH(FechaEntrega)=01 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Ene-21",
    SUM(IF( MONTH(FechaEntrega)=02 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Feb-21",
    SUM(IF( MONTH(FechaEntrega)=03 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Mar-21",
    SUM(IF( MONTH(FechaEntrega)=04 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Abr-21",
    SUM(IF( MONTH(FechaEntrega)=05 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "May-21",
    SUM(IF( MONTH(FechaEntrega)=06 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Jun-21",
    SUM(IF( MONTH(FechaEntrega)=07 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Jul-21",
    SUM(IF( MONTH(FechaEntrega)=08 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Ago-21",
    SUM(IF( MONTH(FechaEntrega)=09 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Set-21",
    SUM(IF( MONTH(FechaEntrega)=10 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Oct-21",
    SUM(IF( MONTH(FechaEntrega)=11 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Nov-21",
    SUM(IF( MONTH(FechaEntrega)=12 and Year(FechaEntrega)=2021, p.Cantidad, 0 )) AS "Dic-21", 
    SUM(IF( MONTH(FechaEntrega)=01 and Year(FechaEntrega)=2022, p.Cantidad, 0 )) AS "Ene-22",
    SUM(IF( MONTH(FechaEntrega)=02 and Year(FechaEntrega)=2022, p.Cantidad, 0 )) AS "Feb-22",
    SUM(IF( MONTH(FechaEntrega)=03 and Year(FechaEntrega)=2022, p.Cantidad, 0 )) AS "Mar-22",
    SUM(IF( MONTH(FechaEntrega)=01 and Year(FechaEntrega)=2022, p.Cantidad, 0 )) AS "Abr-22",
    SUM(IF( MONTH(FechaEntrega)=02 and Year(FechaEntrega)=2022, p.Cantidad, 0 )) AS "May-22",
    SUM(IF( MONTH(FechaEntrega)=03 and Year(FechaEntrega)=2022, p.Cantidad, 0 )) AS "Jun-22"
    FROM pedidos  p
    inner join clientes c on p.IdCliente = c.Id
    where p.estado = 1 and FechaEntrega is not null and p.IdCliente !=0 and c.TipoCliente = 0
    GROUP BY 	 day(FechaEntrega)
	 order by 	 day(FechaEntrega)
	 ;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.rpt_venta_x_cliente
DROP PROCEDURE IF EXISTS `rpt_venta_x_cliente`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `rpt_venta_x_cliente`()
BEGIN
SELECT
    c.Id Id,
	 c.Nombre,
    SUM(IF( MONTH(FechaEntrega)=01 and Year(FechaEntrega)=2023, p.CantidadPaq , 0 )) AS "ene-23 Paq",
    SUM(IF( MONTH(FechaEntrega)=02 and Year(FechaEntrega)=2023, p.CantidadPaq, 0 )) AS "feb-23 Paq",
    SUM(IF( MONTH(FechaEntrega)=03 and Year(FechaEntrega)=2023, p.CantidadPaq, 0 )) AS "mar-23 Paq",
    SUM(IF( MONTH(FechaEntrega)=04 and Year(FechaEntrega)=2023, p.CantidadPaq, 0 )) AS "abr-23 Paq",
    SUM(IF( MONTH(FechaEntrega)=05 and Year(FechaEntrega)=2023, p.CantidadPaq, 0 )) AS "may-23 Paq",
    SUM(IF( MONTH(FechaEntrega)=06 and Year(FechaEntrega)=2023, p.CantidadPaq, 0 )) AS "jun-23 Paq",
    SUM(IF( MONTH(FechaEntrega)=07 and Year(FechaEntrega)=2023, p.CantidadPaq, 0 )) AS "jul-23 Paq",
    SUM(IF( MONTH(FechaEntrega)=08 and Year(FechaEntrega)=2023, p.CantidadPaq, 0 )) AS "ago-23 Paq",
	 SUM(IF( MONTH(FechaEntrega)=09 and Year(FechaEntrega)=2023, p.CantidadPaq, 0 )) AS "set-23 Paq",
    SUM(IF( MONTH(FechaEntrega)=10 and Year(FechaEntrega)=2023, p.CantidadPaq, 0 )) AS "oct-23 Paq",
    SUM(IF( MONTH(FechaEntrega)=01 and Year(FechaEntrega)=2023, p.Cantidad , 0 )) AS "ene-23 Bot",
    SUM(IF( MONTH(FechaEntrega)=02 and Year(FechaEntrega)=2023, p.Cantidad , 0 )) AS "feb-23 Bot",
    SUM(IF( MONTH(FechaEntrega)=03 and Year(FechaEntrega)=2023, p.Cantidad , 0 )) AS "mar-23 Bot",
    SUM(IF( MONTH(FechaEntrega)=04 and Year(FechaEntrega)=2023, p.Cantidad , 0 )) AS "abr-23 Bot",
    SUM(IF( MONTH(FechaEntrega)=05 and Year(FechaEntrega)=2023, p.Cantidad , 0 )) AS "may-23 Bot",    
    SUM(IF( MONTH(FechaEntrega)=06 and Year(FechaEntrega)=2023, p.Cantidad , 0 )) AS "jun-23 Bot",
    SUM(IF( MONTH(FechaEntrega)=07 and Year(FechaEntrega)=2023, p.Cantidad , 0 )) AS "jul-23 Bot",
    SUM(IF( MONTH(FechaEntrega)=08 and Year(FechaEntrega)=2023, p.Cantidad , 0 )) AS "ago-23 Bot",
    SUM(IF( MONTH(FechaEntrega)=09 and Year(FechaEntrega)=2023, p.Cantidad , 0 )) AS "set-23 Bot",	
    SUM(IF( MONTH(FechaEntrega)=10 and Year(FechaEntrega)=2023, p.Cantidad , 0 )) AS "oct-23 Bot",
    SUM(IF( MONTH(FechaEntrega)=11 and Year(FechaEntrega)=2023, p.Cantidad, 0 )) AS "nov-23"  
    FROM pedidos  p
    inner join clientes c on p.IdCliente = c.Id
    where p.estado = 1 and FechaEntrega is not null and c.Estado = 1 and p.IdCliente !=0 and c.TipoCliente = 0
    GROUP BY p.IdCliente
	   	 order by c.Nombre
	 ;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_actualizarcampo
DROP PROCEDURE IF EXISTS `sp_actualizarcampo`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarcampo`(
	IN `pTabla` VARCHAR(500),
	IN `pCampo` VARCHAR(500),
	IN `pValor` VARCHAR(500),
	IN `pCondicion` VARCHAR(500)
)
BEGIN

DECLARE instruccionSql varchar(20) ;

set @instruccionSql =CONCAT( "UPDATE ",pTabla," set ",pCampo," = '", pValor, "' WHERE ", pCondicion);
PREPARE ejecutarSql FROM @instruccionSql;
EXECUTE ejecutarSql;
SELECT @instruccionSql;
DEALLOCATE PREPARE ejecutarSql;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_asignaciones_devolver
DROP PROCEDURE IF EXISTS `sp_asignaciones_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_asignaciones_devolver`(IN `pIdVendedor` INT)
BEGIN

set @numero = 0;
#SET @numero=(select count(*)+1 from visitas v where v.Estado = 1 and v.Resultado = 0 and v.IdUsuario = pIdVendedor order by FechaAsignacion);


select 
	@numero:=@numero+1 Nro,
	v.Id IdVisita,
	c.Nombre Cliente,
	c.Direccion, 
	c.Referencia,
	c.Telefono,
	c.Latitud,
	c.Longitud,
	c.Precio,
	c.Botellones,
	case c.TipoContacto
		when 1 then "Visita"
		when 2 then "Telefono"
		when 3 then "WhatsApp" 
		when 4 then "No contactar"
		else
	"No Asignado" end TipoContacto,
		
	fecha_b2n(v.FechaAsignacion) FechaAsignacion,
	fecha_b2n(v.FechaProgramacion) FechaProg
from visitas v
inner join clientes c on v.IdCliente = c.Id
where v.Estado = 1 and v.Resultado = 0 and v.IdUsuario = pIdVendedor
order by FechaProg;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_asistencia_devolver
DROP PROCEDURE IF EXISTS `sp_asistencia_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_asistencia_devolver`(
	IN `pFecha` VARCHAR(50)
)
BEGIN
DECLARE existe INT;
SET existe = (SELECT COUNT(*) FROM asistencia a WHERE a.Fecha =pFecha );

if existe = 0 then
	begin
		INSERT INTO asistencia (Fecha, IdUsuario)
		SELECT 
			pFecha Fecha,
			u.id IdUsuario
 		FROM usuarios u
		WHERE u.Estado = 1 AND u.Tipo <> 0 AND u.Tipo <> 1 AND u.Tipo <> 2;
	END;
END if;

SELECT 
a.Id,
#fecha_b2n(a.Fecha) Fecha,
a.IdUsuario,
u.Usuario,
a.T_Manana,
a.TM_Ingreso,
a.TM_Salida,
a.TM_Extra,
a.T_Tarde,
a.TT_Ingreso,
a.TT_Salida,
a.TT_Extra
FROM asistencia a
INNER JOIN usuarios u ON a.IdUsuario = u.Id
WHERE a.Fecha =pFecha ;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_cartera_cliente_devolver
DROP PROCEDURE IF EXISTS `sp_cartera_cliente_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cartera_cliente_devolver`(
	IN `pIdCliente` INT,
	IN `pMes` INT,
	IN `pAno` INT
)
BEGIN

SELECT 
fecha_b2n(p.FechaEntrega) Fecha,
p.Cantidad,
p.Precio,
p.CantidadPaq,
p.PrecioPaq
 FROM pedidos p
WHERE 
p.idcliente = pIdCliente AND 
month(p.FechaEntrega) = pMes AND 
YEAR(p.Fechaentrega)= pAno AND
p.EstadoPedido = 1 AND
p.Estado = 1
;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_cartera_devolver
DROP PROCEDURE IF EXISTS `sp_cartera_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cartera_devolver`(
	IN `pIdVendedor` INT,
	IN `pMes` INT,
	IN `pAno` INT
)
SELECT 
    c.Id AS Id, 
    c.Nombre,
    c.DNI,
    c.Telefono,
    c.Direccion,
    c.Referencia,
    c.Id AS Idcliente,
    DATE_FORMAT(ult_pedido.fecha_b2n, '%d/%m/%Y') AS ult_pedido,
    COUNT(p.Id) AS Pedidos
FROM clientes c
LEFT JOIN (
    SELECT 
        IdCliente, 
        MAX(FechaEntrega) AS fecha_b2n 
    FROM 
        pedidos 
    WHERE 
        Estado = 1 AND 
        EstadoPedido = 1 
    GROUP BY IdCliente
) ult_pedido ON c.Id = ult_pedido.IdCliente
LEFT JOIN pedidos p ON c.Id = p.IdCliente 
                   AND p.FechaEntrega BETWEEN DATE_FORMAT(NOW(), '%Y-%m-01') AND LAST_DAY(NOW())
                   AND p.EstadoPedido = 1
                   AND p.Estado = 1
WHERE 
    c.IdUsuario = pIdVendedor
    AND c.Estado = 1
GROUP BY c.Id, c.Nombre
ORDER BY c.Nombre//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_clientes_devolver
DROP PROCEDURE IF EXISTS `sp_clientes_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clientes_devolver`(
	IN `pId` INT
)
begin
DECLARE pIdTipo INT;
SET pIdTipo = (SELECT Tipo FROM usuarios WHERE id = pId LIMIT 1);

if pId = 0 OR pIdTipo <> 2 then
	begin
		SELECT c.*, 
		ifnull(v.TipoCliente,'Minorista') TipoCliente, 
		ifnull(v.Segmento,"A") Segmento, 
		ifnull(v.EstadoRecencia, "Normal") EstadoRecencia
	 	
		FROM clientes c
	 		left JOIN v_segmentacion v ON c.Id = v.IdCliente
			WHERE c.Estado = 1;
	END;
ELSE
	begin
		SELECT c.*, 
		ifnull(v.TipoCliente,'Minorista') TipoCliente, 
		ifnull(v.Segmento,"A") Segmento, 
		ifnull(v.EstadoRecencia, "Normal") EstadoRecencia
	 	
		FROM clientes c
	 		left JOIN v_segmentacion v ON c.Id = v.IdCliente
			WHERE c.Estado = 1 AND c.IdUsuario = pId;
	END;
END if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_clientes_devolver_pos
DROP PROCEDURE IF EXISTS `sp_clientes_devolver_pos`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clientes_devolver_pos`()
BEGIN
select c.Nombre,c.Direccion,c.Referencia, c.Latitud,c.Longitud from clientes c where estado = 1 and c.TipoCliente = 0;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_cliente_delete
DROP PROCEDURE IF EXISTS `sp_cliente_delete`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cliente_delete`(IN `pId` INT)
BEGIN
update clientes set estado = 0 where id = pId and Id <> 0;
		select 
			"Cliente eliminado" message,
			"1" Estado;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_cliente_devolver
DROP PROCEDURE IF EXISTS `sp_cliente_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cliente_devolver`(IN `pId` INT)
BEGIN
select * from clientes where id = pId and Id <> 0;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_cliente_registrar
DROP PROCEDURE IF EXISTS `sp_cliente_registrar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cliente_registrar`(
	IN `pNombre` VARCHAR(50),
	IN `pDNI` VARCHAR(15),
	IN `pDireccion` VARCHAR(50),
	IN `pReferencia` VARCHAR(50),
	IN `pTelefono` VARCHAR(50),
	IN `pLat` VARCHAR(50),
	IN `pLng` VARCHAR(50),
	IN `pIdUsuario` INT,
	IN `pTipoCliente` INT,
	IN `pBotellones` INT,
	IN `pPrecio` varCHAR(50),
	IN `pTipoContacto` INT
)
BEGIN

declare ex int;
#verificamos si existe el cliente
set ex = (select count(*) from clientes 
			where 
				(nombre = pNombre ) 
			and Estado = 1);

if ex =0 then
	begin
		insert into clientes (nombre, DNI, direccion, referencia, telefono, latitud, longitud, idUsuario, TipoCliente, Botellones, Precio, TipoContacto ) values
		(pNombre, pDNI, pDireccion, pReferencia, pTelefono, pLat, pLng, pIdUsuario, pTipoCliente, pBotellones, pPrecio, pTipoContacto);
		
		#registrar tarifario de paquetes
		INSERT INTO tarifariopaqclientes (Idcliente, IdUsuarioRegistra, Min, Max, Valor, FechaInicio)
  		SELECT LAST_INSERT_ID(), pIdUsuario, Min, Max,Precio, DATE(NOW())
  		FROM tarifariopaq WHERE estado=1;
  
		select 
			"Cliente registrado con éxito" message,
			last_insert_id() Id,
			"1" Estado;
	end;
else
	begin
		select 
			"Cliente duplicado, verifique que el nombre, el DNI o el RUC no se encuentre registrado e inténtelo nuevamente" message,
			"0" Estado;
	end;
end if;
#insert into Nombre, RUC, Direccion, Refrencia, Telefono
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_cliente_update
DROP PROCEDURE IF EXISTS `sp_cliente_update`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cliente_update`(
	IN `pId` INT,
	IN `pNombre` vARCHAR(50),
	IN `pDNI` vARCHAR(50),
	IN `pDireccion` vARCHAR(50),
	IN `pReferencia` vARCHAR(50),
	IN `pTelefono` vARCHAR(50),
	IN `pLatitud` vARCHAR(50),
	IN `pLongitud` vARCHAR(50),
	IN `pTipoCliente` INT,
	IN `pBotellones` INT,
	IN `pPrecio` VARCHAR(50),
	IN `pPrecioPaq` VARCHAR(50),
	IN `pTipoContacto` INT,
	IN `pIdUsuario` INT
)
BEGIN

declare ex int;
declare exc int;
#verificamos si existe el cliente
set ex = (
		select count(*) from clientes 
		where 
			(
			nombre = pNombre or (DNI =pDNI and DNI <>"")
			)
			and Estado = 1 and Id <> pId);

if ex =0 then
	begin
		update clientes set 
		Nombre = pNombre,
		DNI = pDNI,
		Direccion = pDireccion,
		Referencia = pReferencia,
		Telefono = pTelefono,
		Latitud = pLatitud,
		Longitud = pLongitud,
		TipoCliente = pTipoCliente,
		Botellones = pBotellones,
		Precio = pPrecio,
		PrecioPaq = pPrecioPaq,
		TipoContacto = pTipoContacto,
		IdUsuario = pIdUsuario
		where id = pId;
	
		select 
		"Cliente actualizado con éxito" message,
		"1" Estado;
	end;
else
	begin
		select 
			"Cliente no puede ser actualziado, verifique que el nombre o el DNI no se encuentre registrado e inténtelo nuevamente" message,
			"0" Estado;
	end;
end if;


END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_cred_delete
DROP PROCEDURE IF EXISTS `sp_cred_delete`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cred_delete`(
	IN `pId` INT
)
BEGIN
declare pIdCategoria int;
declare pIdRef int;

set pIdCategoria  = (select idCategoria from movimientos where id = pId limit 1);

set pIdRef = (select m.IdReferencia from movimientos m where id = pId limit 1);

#si no está enlazado a un pedido
if pIdRef = 0 then 
	begin
	
		select 
			"Sólo se puede pasar a créditos los Movimiento relacionados a ventas" message,
			"0" Estado;
	end;

#si sí esta enlazado a un movimento, y este movimiento es de venta de bodega o delivery
elseif pIdCategoria = 1 or pIdCategoria = 2 then
	begin
		#desactivar todos los que tengan la misma referencia
		update movimientos 
		set Estado = 0 
		where IdReferencia = pIdRef;
		
		#actualizar el estado de pago de pedido a no pagado
		update pedidos p
		set EstadoPago = 0 
		where
		Id = pIdRef;

		select 
			"Movimiento fue pasado a crédito" message,
			"1" Estado;			
			
	end;
else
	#en cualquier otro caso, se entiende que sí tiene referencia pero no es una venta de bodega 
	begin
			select 
			"Sólo se puede pasar a créditos los Movimiento relacionados a ventas" message,
			"0" Estado;
	end;
end if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_cuadre_existe_devolver
DROP PROCEDURE IF EXISTS `sp_cuadre_existe_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cuadre_existe_devolver`()
BEGIN

DECLARE pFecha VARCHAR(10);

SET pFecha = (select DATE(NOW()));

SELECT 
	fecha_b2n(c.Fecha) Fecha,
	
	hora_b2n(c.Hora) Hora,
	
	(
		(
			SELECT IFNULL(SUM(Monto),0) 
	 		FROM movimientos m1 
	 		INNER JOIN constantes c1 ON m1.IdCategoria = c1.Id
	 		WHERE m1.Fecha = pFecha AND m1.Estado = 1 AND c1.Tipo = 1) -
		(
			SELECT IFNULL(SUM(Monto),0) 
	 		FROM movimientos m2 
	 		INNER JOIN constantes c2 ON m2.IdCategoria = c2.Id
	 		WHERE m2.Fecha = pFecha AND m2.Estado = 1 AND c2.Tipo = 0)
	) Operaciones, 	
	
	round(
		(c.p200 * 200) + 
		(c.p100 * 100) + 
		(c.p50 * 50) + 
		(c.p20 * 20) + 
		(c.p10 * 10) + 
		(c.p5 * 5) + 
		(c.p2 * 2) + 
		(c.p1 * 1) + 
		(c.p050 * 0.5) + 
		(c.p020 * 0.2) + 
		(c.p010 * 0.1)
	,2) Conteo,

	u.Usuario,
		round(
		 
		 (c.p200 * 200) + 
		(c.p100 * 100) + 
		(c.p50 * 50) + 
		(c.p20 * 20) + 
		(c.p10 * 10) + 
		(c.p5 * 5) + 
		(c.p2 * 2) + 
		(c.p1 * 1) + 
		(c.p050 * 0.5) + 
		(c.p020 * 0.2) + 
		(c.p010 * 0.1)
		
		 ,2)-
	(
		(
			SELECT IFNULL(SUM(Monto),0) 
	 		FROM movimientos m1 
	 		INNER JOIN constantes c1 ON m1.IdCategoria = c1.Id
	 		WHERE m1.Fecha = pFecha AND m1.Estado = 1 AND c1.Tipo = 1) -
		(
			SELECT IFNULL(SUM(Monto),0) 
	 		FROM movimientos m2 
	 		INNER JOIN constantes c2 ON m2.IdCategoria = c2.Id
	 		WHERE m2.Fecha = pFecha AND m2.Estado = 1 AND c2.Tipo = 0)
	)
	  
	  Diferencia

FROM 
	cierre c
	INNER JOIN usuarios u ON c.IdUsuario = u.Id
WHERE 
	c.Fecha = pFecha AND c.Estado = 1;


END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_cuadre_resumen_devolver
DROP PROCEDURE IF EXISTS `sp_cuadre_resumen_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cuadre_resumen_devolver`(
	IN `pIdUsuario` VARCHAR(10),
	IN `pp200` INT,
	IN `pp100` INT,
	IN `pp50` INT,
	IN `pp20` INT,
	IN `pp10` INT,
	IN `pp5` INT,
	IN `pp2` INT,
	IN `pp1` INT,
	IN `pp050` INT,
	IN `pp020` INT,
	IN `pp010` INT
)
BEGIN

#registrar el conteo ingresado:

INSERT INTO cierre 
set Fecha = DATE(NOW()),
Hora = TIME(NOW()),
IdUsuario = pIdUsuario,
p200 = pp200,
p100 = pp100,
p50 = pp50,
p20 = pp20,
p10 = pp10,
p5 = pp5,
p2 = pp2,
p1 = pp1,
p050 = pp050,
p020 = pp020,
p010 = pp010
;

##resumen

(SELECT 
	c.Descripcion,
	sum(m.Monto) Monto,
	if(min(c.Tipo)="1", "Ingresos", "Gastos") Tipo
FROM 
	movimientos m 
	INNER JOIN constantes c ON m.IdCategoria = c.Id
WHERE 
	m.Fecha = date(NOW()) AND m.Estado = 1
GROUP BY m.IdCategoria
ORDER BY c.tipo DESC);

/*
UNION 
	select
		"Total Operaciones",
		IFNULL((SELECT sum(m.Monto)
			FROM movimientos m
			INNER join constantes c ON m.IdCategoria = c.Id
			WHERE m.Fecha = date(NOW()) AND m.Estado = 1 AND c.Tipo = 1),0) - 
			IFNULL((SELECT sum(m.Monto)
			FROM movimientos m
			INNER join constantes c ON m.IdCategoria = c.Id
			WHERE m.Fecha = date(NOW()) AND m.Estado = 1 AND c.Tipo = 0),0),
		""
		
UNION
	select
		"Total Conteo",
		(
		(pp200 * 200) + 
		(pp100 *100)+ 
		(pp50 * 50) + 
		(pp20 * 20) + 
		(pp10 * 10) + 
		(pp5 * 5) + 
		(pp2 * 2) + 
		(pp1 * 1) + 
		(pp050 *0.5) + 
		(pp020 * 0.2) + 
		(pp010 * 0.1)
	
		),
*/		
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_cuadre_revertir
DROP PROCEDURE IF EXISTS `sp_cuadre_revertir`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cuadre_revertir`()
BEGIN

UPDATE cierre
SET Estado = 0 WHERE fecha = DATE(NOW());


END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_detalle_clientes_vendedor
DROP PROCEDURE IF EXISTS `sp_detalle_clientes_vendedor`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detalle_clientes_vendedor`(
	IN `pIdVendedor` INT,
	IN `pMes` INT,
	IN `pAno` INT
)
BEGIN
SELECT 
	c.Id,
	c.Nombre Cliente,
	ifnull(sum(p.Cantidad),0) Bot,
	ifnull(SUM(p.CantidadPaq),0) Paq,
	case 
		when SUM(p.Cantidad) >= 20 OR SUM(p.CantidadPaq) >= 30 then 1 ELSE 0  end Estado 
FROM clientes c
left JOIN pedidos p 
ON  
	c.Id = p.IdCliente AND 
	month(p.FechaEntrega) = pMes AND 
	YEAR(p.FechaEntrega) = pAno AND p.EstadoPedido = 1 AND p.Estado = 1
WHERE c.IdUsuario = pIdVendedor AND
c.Estado = 1
group BY c.Nombre 
ORDER BY c.nombre;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_detalle_venta_cliente
DROP PROCEDURE IF EXISTS `sp_detalle_venta_cliente`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_detalle_venta_cliente`(
	IN `pIdVendedor` INT,
	IN `pMes` INT,
	IN `pAno` INT
)
BEGIN
SELECT 
	c.Id,
	c.Nombre Cliente,
	ifnull(sum(p.Cantidad * p.Precio) + SUM(p.CantidadPaq * p.PrecioPaq),0) Venta
FROM clientes c
left JOIN pedidos p 
ON  
	c.Id = p.IdCliente AND 
	month(p.FechaEntrega) = pMes AND 
	YEAR(p.FechaEntrega) = pAno AND p.EstadoPedido = 1 AND p.Estado = 1
WHERE c.IdUsuario = pIdVendedor AND
c.Estado = 1
group BY c.Nombre 
ORDER BY c.nombre;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_menu_devolver
DROP PROCEDURE IF EXISTS `sp_menu_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_menu_devolver`(
	IN `pIdUsuario` INT
)
BEGIN

DECLARE pTipoUsuario INT;

SET pTipoUsuario = (SELECT Tipo FROM usuarios WHERE id = pIdUsuario AND estado = 1 LIMIT 1);

#root
if pTipoUsuario = 0 then
	BEGIN
		SELECT 
		m.Link,
		m.Icono,
		m.Item,
		m.TipoMenu
		FROM menu m
		WHERE 
		m.uRoot = 1 and
		m.Estado = 1;
	END;
ELSEIF pTipoUsuario = 1 then
	begin
		SELECT 
		m.Link,
		m.Icono,
		m.Item,
		m.TipoMenu
		FROM menu m
		WHERE 
		m.uAdmin = 1 and
		m.Estado = 1;
	END;
ELSEIF pTipoUsuario = 2 then
	begin
			SELECT 
		m.Link,
		m.Icono,
		m.Item,
		m.TipoMenu
		FROM menu m
		WHERE 
		m.uVendedor = 1 and
		m.Estado = 1;
	END;
ELSEIF pTipoUsuario = 3 then
	begin
			SELECT 
		m.Link,
		m.Icono,
		m.Item,
		m.TipoMenu
		FROM menu m
		WHERE 
		m.uRepartidor = 1 and
		m.Estado = 1;
	END;
ELSEIF pTipoUsuario = 4 then
	BEGIN
			SELECT 
		m.Link,
		m.Icono,
		m.Item,
		m.TipoMenu
		FROM menu m
		WHERE 
		m.uControl = 1 and
		m.Estado = 1;
	END;
ELSEIF pTipoUsuario =5 then
	begin
			SELECT 
		m.Link,
		m.Icono,
		m.Item,
		m.TipoMenu
		FROM menu m
		WHERE 
		m.uOperador = 1 and
		m.Estado = 1;
	END;
ENd if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_metas_devolver_diario
DROP PROCEDURE IF EXISTS `sp_metas_devolver_diario`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_metas_devolver_diario`(
	IN `pIdUsuario` INT,
	IN `pPeriodo` VARCHAR(50)
)
BEGIN

DECLARE pMetaBot DECIMAL(10,2);
DECLARE pMetaPaq DECIMAL(10,2);
DECLARE pTotalBot DECIMAL(10,2);
DECLARE pTotalPaq DECIMAL(10,2);
DECLARE pMetaBotPor DECIMAL(10,2);
DECLARE pMetaPaqPor DECIMAL(10,2);
DECLARE pMes VARCHAR(500);
DECLARE pAno VARCHAR(500);

SET pMes = (SELECT month(m.Desde) FROM metas m WHERE m.IdUsuario = pIdUsuario AND m.Periodo = pPeriodo LIMIT 1);
SET pAno = (SELECT year(m.Desde) FROM metas m WHERE m.IdUsuario = pIdUsuario AND m.Periodo = pPeriodo LIMIT 1);


SET pTotalBot = (
	SELECT SUM(p.Precio * p.Cantidad) FROM pedidos p 
	inner join clientes c ON p.IdCliente = c.Id 
	WHERE c.IdUsuario = pIdUsuario AND p.EstadoPedido = 1 AND p.Estado = 1 AND  
	YEAR(p.FechaEntrega) = pAno AND 
	MONTH(p.FechaEntrega) =pMes
	);

SET pTotalPaq = (
	SELECT SUM(p.PrecioPaq * p.CantidadPaq) FROM pedidos p 
	inner join clientes c ON p.IdCliente = c.Id 
	WHERE c.IdUsuario = pIdUsuario AND p.EstadoPedido = 1 AND p.Estado = 1 AND  
	YEAR(p.FechaEntrega) = pAno AND 
	MONTH(p.FechaEntrega) =pMes
	);

SET pMetaBot = (SELECT m.MetaBot FROM metas m WHERE m.IdUsuario = pIdUsuario AND month(m.Desde) = pMes AND YEAR(m.Desde) = pAno LIMIT 1);
SET pMetaPaq = (SELECT m.MetaPaq FROM metas m WHERE m.IdUsuario = pIdUsuario AND month(m.Desde) = pMes AND YEAR(m.Desde) = pAno LIMIT 1);
SET pMetaBotPor= (SELECT m.BonoBot FROM metas m WHERE m.IdUsuario = pIdUsuario AND month(m.Desde) = pMes AND YEAR(m.Desde) = pAno LIMIT 1);
SET pMetaPaqPor =(SELECT m.BonoPaq FROM metas m WHERE m.IdUsuario = pIdUsuario AND month(m.Desde) = pMes AND YEAR(m.Desde) = pAno LIMIT 1);
#SELECT pMetaBot;

SELECT 
	DAY(p.FechaEntrega) Fecha,
 	sum(p.Precio * p.Cantidad) TotalBotDia, 
 	sum(p.PrecioPaq * p.CantidadPaq) TotalPaqDia,
 	(
	 	SELECT SUM(p2.Precio * p2.Cantidad) FROM pedidos p2 
		INNER JOIN clientes c2 ON p2.IdCliente = c2.id 
		WHERE 
			c2.IdUsuario = pIdUsuario AND
			p2.EstadoPedido = 1 AND
			p2.Estado = 1 AND 
			p2.FechaEntrega BETWEEN CONCAT(pAno, "-",pMes,"-01") AND CONCAT(pAno, "-",pMes,"-",Fecha) LIMIT 1
	) TotalBotAcum,
	(
	 	SELECT SUM(p2.PrecioPaq * p2.CantidadPaq) FROM pedidos p2 
		INNER JOIN clientes c2 ON p2.IdCliente = c2.id 
		WHERE 
			c2.IdUsuario = pIdUsuario AND
			p2.EstadoPedido = 1 AND
			p2.Estado = 1 AND 
			p2.FechaEntrega BETWEEN CONCAT(pAno, "-",pMes,"-01") AND CONCAT(pAno, "-",pMes,"-",Fecha) LIMIT 1
	) TotalPaqAcum,
	(select TotalBotAcum / pMetaBot) CumBot,
  	(select TotalPaqAcum / pMetaPaq) CumPaq,
  	(
	  SELECT 
	  	(if (TotalBotAcum > pMetaBot,(TotalBotAcum - pMetaBot) * pMetaBotPor, 0) +
		 if (TotalPaqAcum > pMetaPaq,(TotalPaqAcum - pMetaPaq) * pMetaPaqPor, 0)  
	  )
	) Bono

 FROM pedidos p
INNER JOIN clientes c ON p.IdCliente = c.id 
WHERE c.IdUsuario = pIdUsuario AND
p.EstadoPedido = 1 AND
p.Estado = 1 AND
YEAR(p.FechaEntrega) = pAno AND 
MONTH(p.FechaEntrega) =pMes
    GROUP BY 	 day(FechaEntrega)
	 order by 	 day(FechaEntrega);
	 
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_metas_devolver_idusuario
DROP PROCEDURE IF EXISTS `sp_metas_devolver_idusuario`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_metas_devolver_idusuario`(
	IN `pIdUsuario` INT
)
BEGIN
SELECT 
m.Periodo,
m.Desde,
m.Hasta,
m.MetaBot,
m.MetaPaq,
m.MetaMinBot,
m.MetaMinPaq,
m.BonoBot,
m.BonoPaq,
(SELECT SUM(p.Cantidad * p.Precio) FROM pedidos p
INNER JOIN clientes c ON p.IdCliente = c.Id AND c.IdUsuario = pIdUsuario
WHERE p.EstadoPedido = 1 AND p.Estado = 1 AND c.IdUsuario = pIdUsuario
AND p.FechaEntrega BETWEEN m.Desde AND m.Hasta
) VentaBot,
(SELECT SUM(p.CantidadPaq * p.PrecioPaq) FROM pedidos p
INNER JOIN clientes c ON p.IdCliente = c.Id AND c.IdUsuario = pIdUsuario
WHERE p.EstadoPedido = 1 AND p.Estado = 1 AND c.IdUsuario = pIdUsuario
AND p.FechaEntrega BETWEEN m.Desde AND m.Hasta
) VentaPaq
FROM metas m 
WHERE m.idusuario = pIdUsuario;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_mov_cat_devolver
DROP PROCEDURE IF EXISTS `sp_mov_cat_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mov_cat_devolver`(IN `pTipo` INT)
BEGIN
#tipo 2, todos, sino el tipo que se requiere, 1 ingresos, 0 gastos
if pTipo = 2 then
	begin
		select c.Id, c.Descripcion Categoria, c.Tipo Filtro from constantes c where c.Otros = 1 and  Estado = 1 order by Filtro, Categoria;
	end;
else
	begin
		select c.Id, c.Descripcion Categoria, c.Tipo Filtro from constantes c where c.Otros = 1 and c.Tipo = pTipo and Estado = 1 order by Filtro, Categoria;
	end;
end if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_mov_delete
DROP PROCEDURE IF EXISTS `sp_mov_delete`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mov_delete`(
	IN `pId` INT,
	IN `pIdUsuario` INT
)
BEGIN
declare pIdCategoria int;
declare pIdRef int;

set pIdCategoria  = (select idCategoria from movimientos where id = pId limit 1);

set pIdRef = (select m.IdReferencia from movimientos m where id = pId limit 1);

#si no está enlazado a un pedido
if pIdRef = 0 then 
	begin
		#actualizado estado de movimiento a desactivado
		update movimientos 
		set Estado = 0 
		where Id= pId;
		CALL sp_pista_registrar("sp_mov_delete", pId, pIdUsuario);
	
		select 
			"Movimiento eliminado" message,
			"1" Estado;			
	end;

#si sí esta enlazado a un movimento, y este movimiento es de venta de bodega o delivery
elseif pIdCategoria = 1 or pIdCategoria = 2 then
	begin
		#desactivar todos los que tengan la misma referencia
		update movimientos 
		set Estado = 0 
		where IdReferencia = pIdRef;
		
		#desactivar el pedido
		update pedidos p
		set Estado = 0 
		where
		Id = pIdRef;
		
		#registrar pista
		CALL sp_pista_registrar("sp_mov_delete", pId, pIdUsuario);

		select 
			"Movimiento eliminado" message,
			"1" Estado;			
			
	end;
else
	#en cualquier otro caso, se entiende que sí tiene referencia pero no es una venta de bodega 
	begin
		update movimientos 
		set Estado = 0 
		where id = pId;		

		#registrar pista
		CALL sp_pista_registrar("sp_mov_delete", pId, pIdUsuario);
		
		select 
			"Movimiento eliminado" message,
			"1" Estado;		
	end;
end if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_mov_devolver
DROP PROCEDURE IF EXISTS `sp_mov_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mov_devolver`(
	IN `pDesde` daTE,
	IN `pHasta` daTE,
	IN `pIncluyeCaja` vARCHAR(50)
)
BEGIN
#Id, Fecha, Usuario, Categoria, IdCat, Glosa, Tipo, Monto

if pIncluyeCaja = "false" then
	begin
		select 
			m.Id,
			fecha_b2n(m.Fecha) Fecha,
			m.IdUsuario,
			u.Usuario,
			m.IdCategoria IdCat,
			c.Descripcion Categoria,
			m.IdReferencia IdRef,
			m.Glosa Glosa,
			case c.Tipo when 0 then 'Gastos' else 'Ingresos' end Tipo,
			m.Monto,
			m.CajaGeneral,
			m.Transferencia
		from movimientos m
		inner join usuarios u on m.IdUsuario = u.Id
		inner join constantes c on m.IdCategoria = c.Id
		where 
			m.Estado = 1 and 
			(m.Fecha Between pDesde and pHasta) and
			m.CajaGeneral = 0
			#27 y 28 son salida e ingreso a caja general, respetivamente
			#m.IdCategoria not in (27, 28)
		order by m.Fecha desc;
	end;
else
	begin
		select 
			m.Id,
			fecha_b2n(m.Fecha) Fecha,
			m.IdUsuario,
			u.Usuario,
			m.IdCategoria IdCat,
			c.Descripcion Categoria,
			m.IdReferencia IdRef,
			m.Glosa Glosa,
			case c.Tipo when 0 then 'Gastos' else 'Ingresos' end Tipo,
			m.Monto,
			m.CajaGeneral,
			m.Transferencia
		from movimientos m
		inner join usuarios u on m.IdUsuario = u.Id
		inner join constantes c on m.IdCategoria = c.Id
		where 
			m.Estado = 1 and 
			m.Fecha Between pDesde and pHasta
		order by m.Fecha desc;
	end;
end if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_mov_registrar
DROP PROCEDURE IF EXISTS `sp_mov_registrar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mov_registrar`(
	IN `pFecha` vARCHAR(10),
	IN `pIdCat` INT,
	IN `pGlosa` vARCHAR(500),
	IN `pMonto` deCIMAL(10,2),
	IN `pIdUsu` INT,
	IN `pIdOperacion` VARCHAR(10),
	IN `pCajaGeneral` INT
)
BEGIN

DECLARE pUsuario VARCHAR(500);
DECLARE pVehiculo VARCHAR(500);
DECLARE pSaldoAnt DECIMAL(10,2);
DECLARE pSaldoNew DECIMAL(10,2);
DECLARE TipoMov INT; -- 0 es gasto y 1 es ingreso; 

#si pCajaGeneral = 1 entonces necesitamos sacar el saldo anterior 
#y determinar si se suma o se resta para suamar o restar el monto y con eso 
#determinar el nuevo saldo
set pSaldoNew  = 0;
if pCajaGeneral = 1 then
	SET pSaldoAnt = IFNULL((SELECT saldo FROM movimientos WHERE estado=1 and cajageneral = 1 ORDER BY id DESC LIMIT 1),0); 
	SET TipoMov = (SELECT tipo FROM constantes WHERE id = pIdCat LIMIT 1);
	
	if TipoMov = 0 then
		set pSaldoNew  = pSaldoAnt - pMonto;
	else
		set pSaldoNew  = pSaldoAnt + pMonto;
	END if;
END if;


#la pIdOperacion es el idferencia

#si NO tiene referencia solo es un movimiento sin mas 
if pIdOperacion = "" then
	insert into movimientos 
	(Fecha, 	IdUsuario, 	IdCategoria, 	Glosa, 	Monto,	CajaGeneral, Saldo) values
	(pFecha, pIdUsu, 		pIdCat, 			pGlosa, 	pMonto,	pCajaGeneral, pSaldoNew);
		
	select 
		"Movimiento registrado" as Message,
		"1" as Estado;

#su la referencia es 5, es un pago a personal y se incluye al nombre del trabajador en la glosa
elseif pIdCat = 5 then
	begin
		
		SELECT u.Usuario INTO pUsuario FROM usuarios u WHERE u.Id = pIdOperacion;
		
		insert into movimientos 
		(Fecha, 	IdUsuario, 	IdCategoria, 	Glosa, 		Monto, 	Idreferencia, 	CajaGeneral, 	Saldo) values 
		(pFecha, pIdUsu, 		pIdCat, 			pUsuario,	pMonto, 	pIdOperacion,	pCajaGeneral,	pSaldoNew);
		
		select 
			"Adelanto registrado" Message,
			"1" Estado;
	end;
ELSE
	#actualmente, la unica otra opción es que sea por un vehiculo, en estos casos 
	#se busca el vehiculo y se pone eso, si en el futuro hay otra referencia para movimientos, 
	#se debe incluir 
	BEGIN
	
		SET pVehiculo = (SELECT u.Descripcion FROM vehiculos u WHERE u.Id = pIdOperacion);
		insert into movimientos 
		(Fecha, 	IdUsuario, 	IdCategoria,	Glosa, 		Monto, 	Idreferencia,	CajaGeneral, 	Saldo) values 
		(pFecha,	pIdUsu, 		pIdCat, 			pVehiculo, 	pMonto, 	pIdOperacion, 	pCajaGeneral, 	pSaldoNew);
		select 
			"Gasto de vehiculo registrado" Message,
			"1" Estado;
	END;
end if;




END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_mov_update
DROP PROCEDURE IF EXISTS `sp_mov_update`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mov_update`(
	IN `pId` INT,
	IN `pFecha` varCHAR(10),
	IN `pMonto` deCIMAL(10,2),
	IN `pGlosa` varCHAR(500)
)
BEGIN

#Si es un movimiento que corresponde a una venta entonces no solo debemos actualizar la tabla movimiento
#sino que tambien tenemos que actualizar el movimiento en pedidos

DECLARE pEsVenta INT;
declare pIdRef INT;

#cuenta si el modmiento id pertenece a una categoria de venta
set pEsVenta = (SELECT count(*) FROM movimientos m WHERE m.Id = pId AND m.IdCategoria IN (1,2,31,32));
set pIdRef = (select m.IdReferencia from movimientos m where m.Id = pId);

#si no es venta 
if pEsVenta = 0 then
	update 
			movimientos
	 	set 
	 		Fecha = pFecha,
	 		Glosa = pGlosa,
	 		Monto = pMonto
		where
			Id = pId;
	
	select 
		"Movimiento actualizado" Message,
		"1" Estado;
ELSE
#si si fue una venta
	update 
			movimientos m
	 	set 
	 		Fecha = pFecha,
	 		Glosa = pGlosa,
	 		Monto = pMonto
		where
			Id = pId;
		
		update pedidos
		set FechaEntrega = pFecha
		where Id = pIdRef;	
		

		select 
		"Movimiento actualizado" Message,
		"1" Estado;
END if;

/*
set pIdRef = (select m.IdReferencia from movimientos m where m.Id = pId);

if pIdRef = 0 then
	begin
		update 
			movimientos
	 	set 
	 		Fecha = pFecha,
	 		Glosa = pGlosa,
	 		Monto = pMonto
		where
			Id = pId;
	
	select 
		"Movimiento actualizado" Message,
		"1" Estado;
	end;
ELSE
	#idref = 14, que es el id del colaborador
	begin
		update 
			movimientos m
	 	set 
	 		Fecha = pFecha,
	 		Glosa = pGlosa,
	 		Monto = pMonto
		where
			IdReferencia = pIdRef;
		
		update pedidos
		set FechaEntrega = pFecha
		where Id = pIdRef;	
		

		select 
		"Movimiento actualizado" Message,
		"1" Estado;
	end;
end if;

*/
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedidodirecto_registrar
DROP PROCEDURE IF EXISTS `sp_pedidodirecto_registrar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedidodirecto_registrar`(
	IN `pIdCliente` INT,
	IN `pIdUsuario` INT,
	IN `pCantidad` INT,
	IN `pPrecio` DECIMAL(10,2),
	IN `pCantidadPaq` INT,
	IN `pPrecioPaq` DECIMAL(10,2),
	IN `pComentarios` TEXT
)
BEGIN
declare PedidosPendientes INT;
DECLARE pTipoCliente INT;
DECLARE pIdPedido INT;
declare pGlosa VARCHAR(5000);
DECLARE pCliente VARCHAR(500);


SET pTipoCliente = (SELECT TipoCliente FROM clientes WHERE id = pIdCliente LIMIT 1);
SET pCliente = (SELECT nombre FROM clientes WHERE id = pIdCliente LIMIT 1);
SET pGlosa = 	CONCAT("Venta en planta: ", pCliente, " ", pComentarios);

set PedidosPendientes = (select count(*) from pedidos p where p.IdCliente = pIdCliente and p.EstadoPedido  in (0,3,4) and p.Estado = 1);

if PedidosPendientes > 0 and pIdCliente <> 0 then
	begin
		select
			"No se puede registrar el pedido, el cliente tiene un pedido pendiente" message,
			"0" Estado;

	end;
else
#verificar que no existan pedidos pendientes de entregar
	begin
	 	
		insert into pedidos ( 
		IdCliente, 
		IdUsuarioPide, 
		FechaRegistra, 
		HoraRegistra, 
		FechaPide, 
		HoraPide, 
		Cantidad, 
		Precio,
  		CantidadPaq,
  		PrecioPaq,
		IdUsuarioEntrega,
  		FechaEnvio,
  		CantidadEnvio,
  		CantidadPaqEnvio,
  		HoraEnvio,
		FechaEntrega,
  		HoraEntrega,
  		Comentario,
  		EstadoPedido
  		
		) values (
		pIdCliente, 
		pIdUsuario, 
		curdate(), 
		now(), 
		curdate(), 
		now(), 
		pCantidad, 
		pPrecio,
  		pCantidadPaq,
  		pPrecioPaq,
		pIdUsuario,
  		curdate(),
  		CantidadEnvio,
  		CantidadPaqEnvio,
  		now(),
		curdate(),
  		now(),
  		pGlosa,
  		"1"
		);
		
		SET pIdPedido = LAST_INSERT_ID();
		#registrar movimiento
		
		#si tipo de cliente es bodega (0) entonces
		if pTipoCliente = 0 then
		
			BEGIN
				#si compro botellones 
				if pCantidad > 0 then
					begin
					insert into movimientos 
						(Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto) VALUES
						(CURDATE(), pIdUsuario, 1, pIdPedido,pGlosa, pCantidad * pPrecio);
					END;
				END if;
				
				#si compro paquetes
				if pCantidadPaq > 0 then
					begin
					insert into movimientos 
						(Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto) VALUES
						(CURDATE(), pIdUsuario, 31, pIdPedido,pGlosa, pCantidadPaq * pPrecioPaq);
					END;
				END if;
			END;
		else
			#si no es bodega
			BEGIN
				#si compro botellones
				if pCantidad > 0 then
					begin
						insert into movimientos 
						(Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto) VALUES
						(CURDATE(), pIdUsuario, 2, pIdPedido,pGlosa, pCantidad * pPrecio);
					END;
				END if;
				
				#si compro paquetes
				if pCantidadPaq > 0 then
					begin
					insert into movimientos 
						(Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto) VALUES
						(CURDATE(), pIdUsuario, 32, pIdPedido,pGlosa, pCantidadPaq * pPrecioPaq);
					END;
				END if;
			END;
		END if;	
		
		
		select 
			"Pedido registrado con éxito" message,
			"1" Estado;
	
	
	end;
end if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedidoparcial_enviar
DROP PROCEDURE IF EXISTS `sp_pedidoparcial_enviar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedidoparcial_enviar`(
	IN `pIdUsuarioEnvia` INT,
	IN `pIdRepartidor` INT,
	IN `pIdPedido` INT,
	IN `pCantidadBot` INT,
	IN `pCantidadPaq` INT
)
BEGIN

DECLARE pIdCliente INT;
DECLArE pIdUsuarioPide INT;
DECLARE pFechaRegistra VARCHAR(50);
DECLARE pHoraRegistra VARCHAR(50);
DECLARE pFechaPide VARCHAR(50);
DECLARE pHoraPide VARCHAR(50);
DECLARE pPrecio DECIMAL(10,2);
DECLARE pPrecioPaq DECIMAL(10,2);
	
SET pIdcliente = (SELECT p.IdCliente FROM pedidos p WHERE p.Id = pIdPedido LIMIT 1);
SET pIdUsuarioPide = (SELECT p.IdUsuarioPide FROM pedidos p WHERE p.Id = pIdPedido LIMIT 1);
SET pFechaRegistra = (SELECT p.FechaRegistra FROM pedidos p WHERE p.Id = pIdPedido LIMIT 1);
SET pHoraRegistra = (SELECT p.HoraRegistra FROM pedidos p WHERE p.Id = pIdPedido LIMIT 1);
SET pFechaPide = (SELECT p.FechaPide FROM pedidos p WHERE p.Id = pIdPedido LIMIT 1);
SET pHoraPide = (SELECT p.HoraPide FROM pedidos p WHERE p.Id = pIdPedido LIMIT 1);
SET pPrecio = (SELECT p.Precio FROM pedidos p WHERE p.Id = pIdPedido LIMIT 1);
SET pPrecioPaq = (SELECT p.PrecioPaq FROM pedidos p WHERE p.Id = pIdPedido LIMIT 1);

#necesito el pedido original para actualizar con lo sobrante
#y registrar un nuevo pedido con el mismo numero de item


#registrar el envio parcial
		insert into pedidos (
			IdCliente,
			IdUsuarioEntrega,
			IdUsuarioPide,
			FechaRegistra,
			HoraRegistra,
			FechaPide,
			HoraPide,
			Cantidad,
			CantidadEnvio,
			Precio,
			CantidadPaq,			#agregado
			CantidadPaqEnvio,		#agregado
			PrecioPaq,				#agregado
			Comentario,
			IdUsuarioEnvio,
			FechaEnvio,
			HoraEnvio,
	 		EstadoPedido 
		) values (
			pIdCliente,
			pIdRepartidor,
			pIdUsuarioPide,
			pFechaRegistra,
			pHoraRegistra,
			pFechaPide,
			pHoraPide,
			pCantidadBot,
			pCantidadBot,
			pPrecio,
			pCantidadPaq,	#agregado
			pCantidadPaq,	#agregado
			pPrecioPaq,	#agregado
			"envío parcial",
			pIdUsuarioEnvia,
			CURDATE(),
			time(NOW()),
			'3'
		);

update pedidos p SET 
			Cantidad = Cantidad - pCantidadBot,
			CantidadEnvio = CantidadEnvio - pCantidadBot,
			CantidadPaq = CantidadPaq - pCantidadPaq,			#agregado
			CantidadPaqEnvio = CantidadPaqEnvio - pCantidadPaq			
WHERE id = pIdPedido;

UPDATE pedidos SET estado = 0 WHERE cantidad = 0 AND cantidadPaq = 0;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedidos_cliente
DROP PROCEDURE IF EXISTS `sp_pedidos_cliente`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedidos_cliente`(
	IN `pIdCliente` INT
)
BEGIN
SET @numero=(select count(*)+1 from pedidos p where idcliente=pIdcliente and estado='1' and  p.EstadoPedido=1 order by p.FechaEntrega);

select 
	@numero:=@numero-1 Nro,
	fecha_b2n(p.FechaEntrega) Fecha, 
	Cantidad Bot,
	precio "S_Bot",
	CantidadPaq Paq,
	precioPaq "S_Paq",
	(Cantidad * Precio) + (CantidadPaq * PrecioPaq) Total

from pedidos p 
WHERE 
	idcliente=pIdcliente and 
	estado='1' and  
	p.EstadoPedido=1 

order by p.FechaEntrega desc;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedidos_entregar
DROP PROCEDURE IF EXISTS `sp_pedidos_entregar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedidos_entregar`(
	IN `pIdRepartidor` INT
)
BEGIN

SET @numero=0;

select 
@numero:=@numero+1 Nro,
p.Id,
p.IdCliente,
c.Nombre Cliente,
ifnull(c.Telefono,"") Telefono,
ifnull(c.Direccion,"") Direccion,
ifnull(c.Referencia,"") Referencia,
ifnull(c.Latitud,"") Latitud,
ifnull(c.Longitud,"") Longitud,
fecha_b2n(p.FechaPide) FechaPide,
hora_b2n(p.HoraPide) HoraPide,
p.Cantidad,
p.Precio,
p.CantidadPaq,
p.PrecioPaq,
ifnull(p.Comentario,"") Comentario
from pedidos p
inner join clientes c on p.IdCliente = c.Id
where p.EstadoPedido=3 and p.Estado=1 and p.IdUsuarioEntrega = pIdRepartidor order by p.fechaPide, p.Id;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedidos_enviados_no_reportados
DROP PROCEDURE IF EXISTS `sp_pedidos_enviados_no_reportados`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedidos_enviados_no_reportados`(
	IN `pIdUsuario` INT
)
BEGIN
SELECT 
	p.Id,
	p.IdCliente,
	c.Nombre Cliente,
	c.Direccion,
	c.Referencia,
	c.Latitud,
	c.Longitud,
	p.Cantidad,
	p.CantidadPaq,
	p.FechaPide,
	p.HoraEnvio,
	p.EstadoPedido EstadoPedido
	
FROM clientes c
INNER JOIN pedidos p ON p.IdCliente =  c.Id
WHERE 
	p.IdUsuarioEntrega = pIdUsuario AND 
	p.EstadoPedido IN (3, 4, 5) AND /*3: en tránsito, 4: entregado pendiente de rendir cuenta Y 5: rechazado */ 
	p.Estado = 1
ORDER BY id desc
	;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedidos_enviar
DROP PROCEDURE IF EXISTS `sp_pedidos_enviar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedidos_enviar`(
	IN `pIdUsuarioEnvia` INT,
	IN `pIdVendedor` INT,
	IN `pIdPedidoArray` VARCHAR(500)
)
BEGIN
DECLARE itemArray TEXT;
DECLARE i INT;
#loque llega es el ide del Vendedor y un array de 

SET i = 1;
 	WHILE i > 0 DO
	SET i = INSTR(pIdPedidoArray,"-"); 
	SET itemArray = SUBSTRING(pIdPedidoArray,1,i-1); 
   
	IF i > 0 THEN      
   	SET pIdPedidoArray = SUBSTRING(pIdPedidoArray,i+CHAR_LENGTH("-"),CHAR_LENGTH(pIdPedidoArray)); 
   ELSE
   	SET itemArray = pIdPedidoArray;        
   END IF;
        
 	update pedidos p set 
 		IdUsuarioEnvio = pIdUsuarioEnvia,
 		IdUsuarioEntrega = pIdVendedor,
	 	FechaEnvio = curdate(),
	 	HoraEnvio = now(),
	 	EstadoPedido= 3 
	where 
		Id = itemArray;
	
    END WHILE;

select 
	"Pedido enviado" message,
	"1" Estado;
    
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedidos_pendientes_devolver
DROP PROCEDURE IF EXISTS `sp_pedidos_pendientes_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedidos_pendientes_devolver`(
	IN `pEstado` INT
)
BEGIN
SET @numero=0;

select 
@numero:=@numero+1 Nro,
p.Id,
u.Usuario,
p.IdCliente,
c.Nombre Cliente,
ifnull(c.Telefono,"") Telefono,
ifnull(c.Direccion,"") Direccion,
ifnull(c.Referencia,"") Referencia,
ifnull(c.Latitud,"") Latitud,
ifnull(c.Longitud,"") Longitud,
fecha_b2n(p.FechaPide) FechaPide,
hora_b2n(p.HoraPide) HoraPide,
p.Cantidad,
p.Precio,
p.CantidadPaq,
p.PrecioPaq,
ifnull(p.Comentario,"") Comentario
from pedidos p
inner join clientes c on p.IdCliente = c.Id
inner join usuarios u on p.IdUsuarioPide = u.Id
where p.EstadoPedido=pEstado and p.Estado=1 order by p.fechaPide, p.Id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedidos_pendientes_rendir
DROP PROCEDURE IF EXISTS `sp_pedidos_pendientes_rendir`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedidos_pendientes_rendir`(
	IN `pIdUsuario` INT
)
BEGIN
	select 
		p.Id,
		c.Nombre Cliente,
		case p.EstadoPedido when 4 then "Entregado" else "Rechazado" end Estado,
		p.Precio,
		p.Cantidad,
		p.CantidadEnvio,
		p.PrecioPaq,
		p.CantidadPaq,
		p.CantidadPaqEnvio,
		p.Vales,
		p.EstadoPago,
		p.TipoPago,
		p.Garantia,
		ifnull(p.Comentario,"") Comentario
		from pedidos p
	inner join clientes c on p.IdCliente = c.Id
	inner join usuarios u on p.IdUsuarioEntrega = u.Id
	where p.EstadoPedido in (4, 5) and 
	p.Estado=1 and 
	p.IdUsuarioEntrega = pIdUsuario
	order by p.fechaPide, p.Id;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedidos_rendir
DROP PROCEDURE IF EXISTS `sp_pedidos_rendir`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedidos_rendir`(
	IN `pIdUsuarioEntrega` INT,
	IN `pIdUsuarioRegistra` INT
)
BEGIN

#registrar movimiento

	#registrar venta de botellones de agua de clientes bodega que se pagaron
	insert into movimientos (Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto, Transferencia)
	select 
		date(now()),
		pIdUsuarioRegistra,
		"1",
		p.Id,
		c.Nombre,
		(p.Cantidad - p.Vales) * p.Precio,
		p.TipoPago
	from pedidos p 
	inner join clientes c on p.IdCliente = c.Id
 	where 
		c.TipoCliente = 0 and 
		p.EstadoPedido = 4 and 
		p.EstadoPago = 1 and
		p.IdUsuarioEntrega = pIdUsuarioEntrega and 
		p.Cantidad > 0 and
		p.Estado = 1;

	#registrar venta de paquetes de agua de clientes bodega que estan pagados
	insert into movimientos (Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto, Transferencia)
	select 
		date(now()),
		pIdUsuarioRegistra,
		"31",
		p.Id,
		c.Nombre,
		p.CantidadPaq * p.PrecioPaq,
		p.TipoPago
	from pedidos p 
	inner join clientes c on p.IdCliente = c.Id
 	where 
		c.TipoCliente = 0 and 
		p.EstadoPedido = 4 and 
		p.EstadoPago = 1 and
		p.IdUsuarioEntrega = pIdUsuarioEntrega and 
		p.CantidadPaq > 0 and
		p.Estado = 1;
		
	#registrar venta de botellones de agua de clientes delivery pagados
	insert into movimientos (Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto, Transferencia)
	select 
		date(now()),
		pIdUsuarioRegistra,
		"2",
		p.Id,
		concat(c.Nombre, " - ", p.Comentario),
		(p.Cantidad - p.Vales) * p.Precio,
		p.TipoPago
	from pedidos p 
	inner join clientes c on p.IdCliente = c.Id
 	where 
		c.TipoCliente = 1 and 
		p.EstadoPedido = 4 and 
		p.EstadoPago = 1 AND #agregado
		p.IdUsuarioEntrega = pIdUsuarioEntrega and 
		p.Cantidad > 0 and
		p.Estado = 1;
	
	#registrar venta de paquetes de agua de clientes delivery pagados
	insert into movimientos (Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto, Transferencia)
	select 
		date(now()),
		pIdUsuarioRegistra,
		"32",
		p.Id,
		concat(c.Nombre, " - ", p.Comentario),
		(p.CantidadPaq) * p.PrecioPaq,
		p.TipoPago
	from pedidos p 
	inner join clientes c on p.IdCliente = c.Id
 	where 
		c.TipoCliente = 1 and 
		p.EstadoPedido = 4 and
		p.EstadoPago = 1 and 
		p.IdUsuarioEntrega = pIdUsuarioEntrega and 
		p.CantidadPaq > 0 and
		p.Estado = 1;
			
	#registrar pago de garantia de clientes bodegas
	insert into movimientos (Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto, Transferencia)
	select 
		date(now()),
		pIdUsuarioRegistra,
		"4",
		p.Id,
		c.Nombre,
		p.Garantia,
		p.TipoPago
	from pedidos p 
	inner join clientes c on p.IdCliente = c.Id
 	where 
		c.TipoCliente = 0 and 
		p.EstadoPedido = 4 and 
		p.Garantia <> "0.00" and
		p.IdUsuarioEntrega = pIdUsuarioEntrega and 
		p.Estado = 1;	

#actualizar estados

	#actualizar estado de los que fueron entregados
	 update pedidos p
	 	set 
			p.EstadoPedido = 1, 
			p.IdUsuarioRecibe = pIdUsuarioRegistra,
			p.FechaRecibe = DATE(NOW()),
			p.HoraRecibe = TIME(NOW())
	 	where p.EstadoPedido = 4 and p.IdUsuarioEntrega = pIdUsuarioEntrega and p.Estado = 1;
	
	#actualizar estado de los que no fueron entregados
	 update pedidos p
	 	set p.EstadoPedido = 2,
	 	p.IdUsuarioRecibe = pIdUsuarioRegistra,
			p.FechaRecibe = DATE(NOW()),
			p.HoraRecibe = TIME(NOW())
	 	where p.EstadoPedido = 5 and p.IdUsuarioEntrega = pIdUsuarioEntrega and p.Estado = 1;


	select 
		"Entrega rendida" message,
		"1" Estado;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedido_actualizar
DROP PROCEDURE IF EXISTS `sp_pedido_actualizar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_actualizar`(
	IN `pIdPedido` INT,
	IN `pCantidadBot` INT,
	IN `pPrecioBot` DECIMAL(10,2),
	IN `pCantidadPaq` INT,
	IN `pPrecioPaq` DECIMAL(10,2),
	IN `pComentario` VARCHAR(5000)
)
BEGIN
UPDATE pedidos 
SET 
	Cantidad = pCantidadBot,
	Precio = pPrecioBot,
	CantidadPaq = pCantidadPaq,
	PrecioPaq = pPrecioPaq,
	CantidadEnvio = pCantidadBot,
	CantidadPaqEnvio = pCantidadPaq,
	Comentario = pComentario
WHERE Id = pIdPedido;

		select 
		"Pedido actualizado con éxito" message,
		"1" Estado;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedido_delete
DROP PROCEDURE IF EXISTS `sp_pedido_delete`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_delete`(IN `pId` INT)
BEGIN
update pedidos set estado = 0 where id = pId;
		select 
			"Pedido eliminado" message,
			"1" Estado;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedido_devolver
DROP PROCEDURE IF EXISTS `sp_pedido_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_devolver`(
	IN `pId` INT
)
BEGIN
select 
p.Id,
p.IdCliente,
c.Nombre Cliente,
ifnull(c.Telefono,"") Telefono,
ifnull(c.Direccion,"") Direccion,
ifnull(c.Referencia,"") Referencia,
ifnull(c.Latitud,"") Latitud,
ifnull(c.Longitud,"") Longitud,
fecha_b2n(p.FechaPide) FechaPide,
hora_b2n(p.HoraPide) HoraPide,
p.Cantidad,
p.Precio,
p.CantidadPaq,
p.PrecioPaq,
ifnull(p.Comentario,"") Comentario
from pedidos p
inner join clientes c on p.IdCliente = c.Id
where p.Id=pId;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedido_rechazar
DROP PROCEDURE IF EXISTS `sp_pedido_rechazar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_rechazar`(IN `pIdPedido` INT, IN `pComent` vARCHAR(500))
BEGIN
update pedidos p 

##falta regresar los botellones que serechazaron a almacen
set
	p.FechaEntrega = curdate(),
	p.HoraEntrega = now(),
	p.EstadoPedido = 5,
	p.Comentario = pComent 
where
	id = pIdPedido;

select 
	"Rechazo registrado" message,
	"1" Estado;
			
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedido_registrar
DROP PROCEDURE IF EXISTS `sp_pedido_registrar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_registrar`(
	IN `pIdCliente` INT,
	IN `pIdUsuarioPide` INT,
	IN `pCantidad` INT,
	IN `pPrecio` deCIMAL(10,2),
	IN `pCantidadPaq` INT,
	IN `pPrecioPaq` DECIMAL(10,2),
	IN `pComentarios` teXT,
	IN `pFechaPide` vARCHAR(50),
	IN `pHoraPide` vARCHAR(50)
)
BEGIN
declare PedidosPendientes int;

set PedidosPendientes = (select count(*) from pedidos p where p.IdCliente = pIdCliente and p.EstadoPedido  in (0,3,4) and p.Estado = 1);

if PedidosPendientes > 0 and pIdCliente <> 0 then
	begin
		select
			"No se puede registrar el pedido, el cliente tiene un pedido pendiente" message,
			"0" Estado;

	end;
else
#verificar que no existan pedidos pendientes de entregar
	begin
	
		insert into pedidos (
			IdCliente,
			IdUsuarioPide,
			FechaRegistra,
			HoraRegistra,
			FechaPide,
			HoraPide,
			Cantidad,
			CantidadEnvio,
			Precio,
			CantidadPaq,			#agregado
			CantidadPaqEnvio,		#agregado
			PrecioPaq,				#agregado
			Comentario
		) values (
			pIdCliente,
			pIdUsuarioPide,
			curdate(),
			now(),
			pFechaPide,
			pHoraPide,
			pCantidad,
			pCantidad,
			pPrecio,
			pCantidadPaq,	#agregado
			pCantidadPaq,	#agregado
			pPrecioPaq,	#agregado
			pComentarios
		);
		select 
			"Pedido registrado con éxito" message,
			"1" Estado;
	end;
end if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedido_registrar_entrega
DROP PROCEDURE IF EXISTS `sp_pedido_registrar_entrega`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_registrar_entrega`(
	IN `pIdPedido` INT,
	IN `pCantidad` INT,
	IN `pCantidadPaq` INT,
	IN `pEstadoPago` INT,
	IN `pVales` INT,
	IN `pGarantia` vARCHAR(50),
	IN `pLatEntrega` vARCHAR(50),
	IN `pLngEntrega` vARCHAR(50)
)
BEGIN
declare EstadoMov int;
declare valor decimal(10,2);	
declare pCliente varchar(500);
declare pTipoCliente INT;
DECLARE pTipoPago INT; #0 efectivo, 1: transferencia

#si estadopago es 0, entonces es crédito, no hay tipopago.
if pEstadoPago=0 then
	begin
		update pedidos p
		set 
			Cantidad = pCantidad,
			CantidadPaq = pCantidadPaq,
			FechaEntrega = curdate(),
			HoraEntrega = time(now()),
			LatEntrega = pLatEntrega,
			LngEntrega = pLngEntrega,
			EstadoPedido= 4,
			EstadoPago = pEstadoPago,
			Vales = pVales,
			Garantia = pGarantia
		where 
			id = pIdPedido;
		
		select 
			"Entrega registrada" message,
			"1" Estado;
	end;
else
	begin
		SET pTipoPago = pEstadoPago-1;
		update pedidos 
		set 
			Cantidad = pCantidad,
			CantidadPaq = pCantidadPaq,
			FechaEntrega = date(now()),
			HoraEntrega = time(now()),
			EstadoPedido= 4,
			LatEntrega = pLatEntrega,
			LngEntrega = pLngEntrega,
			TipoPago = pTipoPago,
			EstadoPago = 1,
			Vales = pVales,
			Garantia = pGarantia
		where 
			id = pIdPedido;

		/*	
		
		#registra el movimiento		
		set valor = (pCantidad * (select precio from pedidos where id =pIdPedido limit 1) - pVales * (select precio from pedidos where id =pIdPedido limit 1));
		set pCliente = (select c.Nombre from pedidos p inner join clientes c on p.IdCliente = c.Id where p.Id = pIdPedido limit 1);
		set pTipoCliente = (select c.TipoCliente from pedidos p inner join clientes c on p.IdCliente = c.Id where p.Id = pIdPedido limit 1);
		#registrar ingreso por venta, descontando el vale
		
		if pTipoCliente = 0 then
			begin
				set EstadoMov = fn_movimientos_registrar(date(now()), pIdUsuario, 1, pIdPEdido, valor, pCliente);
			end;
		else
			begin
				set EstadoMov = fn_movimientos_registrar(date(now()), pIdUsuario, 2, pIdPEdido, valor, pCliente);
			end;
		end if;


		#registrar ingreso por garantia
		if pGarantia <>"0" then
			begin
				set EstadoMov = fn_movimientos_registrar(date(now()), pIdUsuario, 4, pIdPEdido, pGarantia, pCliente);
			end;
		end if;
		*/

		select 
			"Entrega registrada" message,
			"1" Estado;
		
	end;
end if;

	
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pedido_rendir
DROP PROCEDURE IF EXISTS `sp_pedido_rendir`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_rendir`(IN `pIdPedido` INT, IN `pIdUsuario` INT)
BEGIN
declare EstadoMov int;
declare valor decimal(10,2);
declare pCliente varchar(500);
declare pTipoCliente int;
declare pGarantia decimal(10,2);

#actualizar estado de pedidos
	update pedidos set EstadoPedido= 1 where id = pIdPedido;
	
	set valor = 			(select (p.Cantidad - p.Vales) * p.Precio from pedidos p where id =pIdPedido limit 1);
	set pCliente =			(select case p.IdCliente when 0 then p.Comentario else c.Nombre end from pedidos p inner join clientes c on p.IdCliente = c.Id where p.Id = pIdPedido limit 1);
	set pTipoCliente = 	(select c.TipoCliente from pedidos p inner join clientes c on p.IdCliente = c.Id where p.Id = pIdPedido limit 1);
	set pGarantia = 		(select Garantia from pedidos p  where id = pIdPedido limit 1);
	

	#registrar ingreso por venta, descontando el vale
		
	if pTipoCliente = 0 then
		begin
			set EstadoMov = fn_movimientos_registrar(date(now()), pIdUsuario, 1, pIdPEdido, valor, pCliente);
		end;
	else
		begin
			set EstadoMov = fn_movimientos_registrar(date(now()), pIdUsuario, 2, pIdPEdido, valor, pCliente);
		end;
	end if;

	#registrar ingreso por garantia
	if pGarantia <>0.00 then
		begin
			set EstadoMov = fn_movimientos_registrar(date(now()), pIdUsuario, 4, pIdPEdido, pGarantia, pCliente);
		end;
	end if;

	select 
		"Entrega rendida" message,
		"1" Estado;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_periodosvendedor_devolver
DROP PROCEDURE IF EXISTS `sp_periodosvendedor_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_periodosvendedor_devolver`(
	IN `pIdVendedor` INT
)
BEGIN


SELECT 
c.Id,  
c.Mes,
c.Ano
 FROM metasvendedores c
WHERE c.IdVendedor = pIdVendedor AND
c.Estado = 1
ORDER BY ano, mes desc
;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_pista_registrar
DROP PROCEDURE IF EXISTS `sp_pista_registrar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pista_registrar`(
	IN `pOperacion` VARCHAR(50),
	IN `pIdreferencia` INT,
	IN `pIdUsuario` INT
)
BEGIN
INSERT INTO pista_audit (Fecha,Hora,Operacion,IdReferencia, IdUsuario)
VALUES
(DATE(NOW()), TIME(NOW()), pOperacion, pIdreferencia, pIdUsuario);
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_planilla_devolver
DROP PROCEDURE IF EXISTS `sp_planilla_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_planilla_devolver`(
	IN `pMes` INT,
	IN `pAno` INT
)
BEGIN

SELECT 
u.Id,
u.Usuario, 
p.Basico,
p.Otros,
ifnull(fn_descuentos(pMes, pAno, u.Id),0) Descuentos,
ifnull(fn_adelantos(pMes, pAno, u.Id),0) Adelantos,
Basico + 
Otros - 
(
	ifnull(fn_descuentos(pMes, pAno, u.Id),0) + 
	ifnull(fn_adelantos(pMes, pAno, u.Id),0)
) Total

 

FROM usuarios u
INNER JOIN planilla p ON p.IdUsuario = u.id

WHERE 
	last_day(DATE(CONCAT(pAno,"-",pMes,"-01"))) BETWEEN u.FechaAlta AND ifnull(u.FechaBaja, LAST_DAY((DATE(NOW())))) and
	last_day(DATE(CONCAT(pAno,"-",pMes,"-01"))) BETWEEN p.Desde AND IFNULL(p.Hasta, last_day(DATE(NOW())))
;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_porcobrar_detalle_devolver
DROP PROCEDURE IF EXISTS `sp_porcobrar_detalle_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_porcobrar_detalle_devolver`(
	IN `pIdCliente` INT
)
BEGIN
SELECT 
p.Id,
fecha_b2n(
p.FechaEntrega) Fecha,
p.Cantidad Bot,
p.Precio PrecioBot,
p.CantidadPaq Paq,
p.PrecioPaq PrecioPaq,
(p.Cantidad * p.Precio) + (p.CantidadPaq * p.PrecioPaq) Total

FROM 
	pedidos p 
WHERE 
	p.idcliente = pIdCliente AND 
	p.EstadoPago = 0 and
	p.EstadoPedido = 1 and
	p.Estado = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_porcobrar_general_devolver
DROP PROCEDURE IF EXISTS `sp_porcobrar_general_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_porcobrar_general_devolver`()
BEGIN
SELECT 
p.IdCliente,  
c.Nombre,
SUM((p.Cantidad * p.Precio) + (p.CantidadPaq * p.PrecioPaq)) Total
FROM 
pedidos p
INNER JOIN clientes c ON p.IdCliente = c.Id
WHERE 
p.EstadoPedido = 1 AND
p.estadopago = 0 AND
p.Estado = 1

GROUP BY p.Idcliente;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_porcobrar_pagar
DROP PROCEDURE IF EXISTS `sp_porcobrar_pagar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_porcobrar_pagar`(
	IN `pIdPedido` INT,
	IN `pIdUsuario` INT
)
BEGIN

DECLARE pTipoCliente INT;
DECLARE pCantidad INT;
DECLARE pGlosa VARCHAR(500);
DECLARE pPrecio DECIMAL(10,2);
DECLARE pCantidadPaq INT;
DECLARE pPrecioPaq DECIMAL(10,2);
DECLARE pCliente VARCHAR(500);

SET pTipoCliente = (SELECT c.TipoCliente FROM clientes c WHERE id = (SELECT IdCliente from pedidos WHERE Id = pIdPedido) LIMIT 1);
SET pCliente = (SELECT c.Nombre FROM clientes c WHERE id = (SELECT IdCliente from pedidos WHERE Id = pIdPedido) LIMIT 1);
SET pCantidad = (SELECT p.Cantidad FROM pedidos p WHERE Id = pIdPedido LIMIT 1);
SET pPrecio = (SELECT p.Precio FROM pedidos p WHERE Id = pIdPedido LIMIT 1);
SET pCantidadPaq = (SELECT p.CantidadPaq FROM pedidos p WHERE Id = pIdPedido LIMIT 1);
SET pPrecioPaq = (SELECT p.PrecioPaq FROM pedidos p WHERE Id = pIdPedido LIMIT 1);
SET pGlosa = (SELECT concat(p.Comentario, "- Pago de crédito - ", pCliente) FROM pedidos p WHERE Id = pIdPedido LIMIT 1);


#actualizar pedido

UPDATE pedidos p 
SET p.EstadoPago = 1 
WHERE id = pIdPedido;

#registrar movimiento
	if pTipoCliente = 0 then
		
			BEGIN
				#si compro botellones 
				if pCantidad > 0 then
					begin
					insert into movimientos 
						(Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto) VALUES
						(CURDATE(), pIdUsuario, 1, pIdPedido,pGlosa, pCantidad * pPrecio);
					END;
				END if;
				
				#si compro paquetes
				if pCantidadPaq > 0 then
					begin
					insert into movimientos 
						(Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto) VALUES
						(CURDATE(), pIdUsuario, 31, pIdPedido,pGlosa, pCantidadPaq * pPrecioPaq);
					END;
				END if;
			END;
		else
			#si no es bodega
			BEGIN
				#si compro botellones
				if pCantidad > 0 then
					begin
						insert into movimientos 
						(Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto) VALUES
						(CURDATE(), pIdUsuario, 2, pIdPedido,pGlosa, pCantidad * pPrecio);
					END;
				END if;
				
				#si compro paquetes
				if pCantidadPaq > 0 then
					begin
					insert into movimientos 
						(Fecha,IdUsuario, IdCategoria, Idreferencia, Glosa, Monto) VALUES
						(CURDATE(), pIdUsuario, 32, pIdPedido,pGlosa, pCantidadPaq * pPrecioPaq);
					END;
				END if;
			END;
		END if;	


END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_porcobrar_pagartodo
DROP PROCEDURE IF EXISTS `sp_porcobrar_pagartodo`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_porcobrar_pagartodo`(
	IN `pIdCliente` INT,
	IN `pIdUsuario` INT
)
BEGIN

DECLARE idPedido int;

WHILE 
	(SELECT COUNT(*) FROM pedidos p WHERE IdCliente = pIdCliente AND EstadoPago = 0 AND EstadoPedido = 1 and Estado = 1) > 0 
	DO
	SET IdPedido = (SELECT id FROM pedidos WHERE IdCliente = pIdCliente AND EstadoPago = 0 and EstadoPedido = 1 AND Estado = 1 LIMIT 1);
	
	CALL sp_porcobrar_pagar(IdPedido, pIdUsuario);
        
    END WHILE;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_posicion_registrar
DROP PROCEDURE IF EXISTS `sp_posicion_registrar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_posicion_registrar`(IN `pIdUsuario` INT, IN `pLat` VARCHAR(50), IN `pLng` vARCHAR(50))
BEGIN
insert into posicion (IdVendedor, Lat,Lng, Fecha, Hora)
values
(pIdUsuario, pLat, pLng, date(now()), time(now()));
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_proyecciones_devolver
DROP PROCEDURE IF EXISTS `sp_proyecciones_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proyecciones_devolver`(IN `pDias` INT)
BEGIN
#CALL `sp_proyecciones_devolver`('10')

select 
v.Id,
v.Nombre Cliente,
case  
	when round(sum(p.Cantidad) / (TIMESTAMPDIFF(MONTH, min(p.FechaEntrega) , max(p.FechaEntrega))+1)) <= 15 then "1"
	when round(sum(p.Cantidad) / (TIMESTAMPDIFF(MONTH, min(p.FechaEntrega) , max(p.FechaEntrega))+1)) < 40 then "2"
	when round(sum(p.Cantidad) / (TIMESTAMPDIFF(MONTH, min(p.FechaEntrega) , max(p.FechaEntrega))+1)) < 60 then "3"	
	when round(sum(p.Cantidad) / (TIMESTAMPDIFF(MONTH, min(p.FechaEntrega) , max(p.FechaEntrega))+1)) < 80 then "4"	
	else "5"
end Segmento,
v.n_pedidos "Pedidos",
v.n_botellones Botellones,
v.ultimo_pedido Ult_Pedido,
v.frecuencia_pedido Frecuencia,
round(
	sum(p.Cantidad) / 
	(TIMESTAMPDIFF(MONTH, min(p.FechaEntrega) , max(p.FechaEntrega))+1)
) Promedio,
v.Prox_pedido Prox_pedido,
v.Estado
 from v_proy_clientes v
 inner join pedidos p on p.IdCliente = v.Id
where fecha_n2b(Prox_pedido) between "2020-01-01" and ADDDATE(date(now()), INTERVAL pDias DAY)
and v.Id not in (
select IdCliente from pedidos p where 
p.Estado = 1 and EstadoPedido in (0,3) 
)
and v.Id not in (
select IdCliente from visitas
where Resultado= 0 and Estado = 1 

)
group by v.Id
order by fecha_n2b(Prox_pedido);
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_repartidores_devolver
DROP PROCEDURE IF EXISTS `sp_repartidores_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_repartidores_devolver`()
BEGIN
select Id, Usuario from usuarios u where u.Tipo = 3 and u.Estado = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_repartidores_rendir_devolver
DROP PROCEDURE IF EXISTS `sp_repartidores_rendir_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_repartidores_rendir_devolver`()
BEGIN

	select 
		
		p.IdUsuarioEntrega Id,
		u.Usuario,
		count(p.IdUsuarioEntrega) Cant
		from pedidos p
	inner join usuarios u on p.IdUsuarioEntrega = u.Id
	where p.EstadoPedido in (4, 5) and 
	p.Estado=1
	GROUP BY p.IdUsuarioEntrega, u.Usuario
	order BY u.Usuario;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_seguimiento_devolver
DROP PROCEDURE IF EXISTS `sp_seguimiento_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_seguimiento_devolver`(
	IN `pPendientes` INT,
	IN `pDesde` VARCHAR(50),
	IN `pHasta` VARCHAR(50)
)
BEGIN

if pPendientes = 1 then
	begin
		select 
			p.*,
			fecha_b2n(p.FechaRegistra) Registro,
			c.Nombre Cliente,
			up.Usuario UsuarioPide,
			ue.Usuario UsuarioEntrega,
			uen.Usuario UsuarioEnvia,
			case p.EstadoPedido 
				when 0 then "phone_callback"
				when 1 then "dns"
				when 2 then "dangerous"
				when 3 then "local_shipping"
				when 4 then "store"
				when 5 then "phonelink_erase"
			END EstadoIcon,
			
			case p.EstadoPedido 
				when 0 then "Pedido sin enviar"
				when 1 then "Entregado y rendido"
				when 2 then "Rechazado y rendido"
				when 3 then "En tránsito"
				when 4 then "Entregado pendiente de rendir"
				when 5 then "Rechazado pendiente de rendir"
				
			END Estado
		from pedidos p
		inner join clientes c on p.IdCliente =c.Id 
		inner join usuarios up on p.IdUsuarioPide = up.Id
		inner join usuarios ue ON p.IdUsuarioEntrega=  ue.Id
		INNER JOIN usuarios uen ON p.IdUsuarioPide = ue.Id
		where 
			p.EstadoPedido NOT IN (1,2) AND 
			p.Estado = 1 and
			p.FechaRegistra between pDesde and pHasta;
			
	END;
ELSE
	begin
		select 
			p.*,
			fecha_b2n(p.FechaRegistra) Registro,
			c.Nombre Cliente,
			up.Usuario UsuarioPide,
			ue.Usuario UsuarioEntrega,
			uen.Usuario UsuarioEnvia,
			case p.EstadoPedido 
				when 0 then "phone_callback"
				when 1 then "dns"
				when 2 then "dangerous"
				when 3 then "local_shipping"
				when 4 then "store"
				when 5 then "phonelink_erase"
			END EstadoIcon,
			
			case p.EstadoPedido 
				when 0 then "Pedido sin enviar"
				when 1 then "Entregado y rendido"
				when 2 then "Rechazado y rendido"
				when 3 then "En tránsito"
				when 4 then "Entregado pendiente de rendir"
				when 5 then "Rechazado pendiente de rendir"
				
			END Estado
		from pedidos p
		inner join clientes c on p.IdCliente =c.Id 
		inner join usuarios up on p.IdUsuarioPide = up.Id
		inner join usuarios ue ON p.IdUsuarioEntrega=  ue.Id
		INNER JOIN usuarios uen ON p.IdUsuarioPide = ue.Id
		where 
			 
			p.Estado = 1 and
			p.FechaRegistra between pDesde and pHasta;
	END;
END if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_tarifariobot_devolver
DROP PROCEDURE IF EXISTS `sp_tarifariobot_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tarifariobot_devolver`()
BEGIN
SELECT Valor,Texto FROM tarifariobot WHERE estado = 1 ORDER BY valor asc;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_tarifariopaqcliente_devolver
DROP PROCEDURE IF EXISTS `sp_tarifariopaqcliente_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tarifariopaqcliente_devolver`(
	IN `pIdCliente` INT
)
BEGIN

DECLARE existe INT;

SET existe = (SELECT COUNT(*) FROM tarifariopaqclientes WHERE idcliente = pIdCliente AND estado = 1);

if existe > 0 then
	begin
		SELECT Min, Max, Valor Precio FROM tarifariopaqclientes WHERE idcliente = pIdCliente AND estado = 1;
	end;
ELSE
	begin
		SELECT  Min,Max,Precio FROM tarifariopaq WHERE estado = 1;
	END;
END if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_tarifariopaq_devolver
DROP PROCEDURE IF EXISTS `sp_tarifariopaq_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tarifariopaq_devolver`()
BEGIN
SELECT t.Min, t.Max, t.Precio FROM tarifariopaq t WHERE t.Estado = 1 ORDER BY t.Min;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_usuarios_devolver
DROP PROCEDURE IF EXISTS `sp_usuarios_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuarios_devolver`()
BEGIN
SELECT 
u.Id,
u.Usuario,
u.Tipo,
IFNULL(u.Nombre,"") Nombre,
ifnull(fecha_b2n(u.FechaNac),"") FechaNac,
IFNULL(u.Telefono,"") Telefono,
IFNULL(u.Direccion,"") Direccion,
IFNULL(fecha_b2n(u.FechaAlta),"") FechaInicio
FROM usuarios u
WHERE u.Estado = 1
;END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_usuarios_login
DROP PROCEDURE IF EXISTS `sp_usuarios_login`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuarios_login`(IN `pId` INT, IN `pClave` INT)
BEGIN

#existe el usuario?
declare existe int;

#si existe el usuario y la clave es correcta
set existe = (select count(*) from usuarios u where id = pId and u.Clave = pClave and u.Estado = 1);

if existe <> 0 then
	begin
	select
		Id, 
		Usuario, 
		CASE Tipo 
			WHEN 0 THEN "Root del Sistema"
			WHEN 1 THEN "Administrador"
			WHEN 2 THEN "Representante de Ventas"
			WHEN 3 THEN "Repartidor"
			WHEN 4 THEN "Asistente de Control"
			WHEN 5 THEN "Operador de Planta"
		end Tipo,
        Tipo CodTipo, 
		"Acceso exitoso" Message,
		"1" Estado
		from usuarios where id = pId limit 1;
	end;
else 
	begin
				select 
					"Clave incorrecta" Message,
					"-1" Estado;
	end;
end if;

END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_usuario_delete
DROP PROCEDURE IF EXISTS `sp_usuario_delete`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_delete`(
	IN `pIdUsuario` INT
)
BEGIN
UPDATE usuarios 
SET 
	estado = 0 and 
	FechaBaja = date(NOW()) 
WHERE Id = pIdUsuario;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_usuario_update
DROP PROCEDURE IF EXISTS `sp_usuario_update`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_update`(
	IN `pId` INT,
	IN `pUsuario` VARCHAR(50),
	IN `pTipo` INT,
	IN `pNombre` VARCHAR(5000),
	IN `pFechaNac` VARCHAR(50),
	IN `pTelefono` VARCHAR(50),
	IN `pDireccion` VARCHAR(500),
	IN `pFechaInicio` VARCHAR(50)
)
BEGIN
UPDATE usuarios SET 
	Usuario = pUsuario,
	Tipo = pTipo,
	Nombre = pNombre,
	FechaNac= pFechaNac,
	Telefono = pTelefono,
	Direccion = pDireccion,
	FechaAlta = pFechaInicio
	
WHERE 
Id = pId;

		select 
		"Usuario actualizado" Message,
		"1" Estado;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_vehiculos_devolver
DROP PROCEDURE IF EXISTS `sp_vehiculos_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vehiculos_devolver`()
BEGIN
SELECT Id, Descripcion FROM vehiculos WHERE estado = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_vendedores_devolver
DROP PROCEDURE IF EXISTS `sp_vendedores_devolver`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vendedores_devolver`()
BEGIN
select Id, Usuario from usuarios u where u.Tipo = 2 and u.Estado = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_vendedores_seguimiento
DROP PROCEDURE IF EXISTS `sp_vendedores_seguimiento`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vendedores_seguimiento`(
	IN `pIdVendedor` INT,
	IN `pMes` VARCHAR(50),
	IN `pAno` VARCHAR(50)
)
SELECT 
	m.MetaClientes,
	
	(select ifnull(COUNT(*),0) FROM 
		(	SELECT c.Nombre FROM  pedidos p
		 	INNER JOIN clientes c ON p.IdCliente = c.Id 
			WHERE 
				month(p.FechaEntrega) = pMes AND YEAR(p.FechaEntrega) = pAno AND 
				p.EstadoPedido = 1 AND p.Estado = 1 and c.IdUsuario = pIdVendedor
			group BY c.nombre
			HAVING sum(p.Cantidad) > 20 OR SUM(p.CantidadPaq) > 30) AS tabla) ClientesActivos,
	
	m.BonoClientes,
	
	m.MetaVentas,
	
	(SELECT 
	ifnull(SUM((p.Cantidad * p.Precio) + (p.CantidadPaq * p.PrecioPaq)),0)
	from pedidos p where 
	idcliente IN (SELECT Id FROM clientes WHERE IdUsuario =pIdVendedor) AND 
	month(p.FechaEntrega) = pMes AND 
	YEAR(p.FechaEntrega) = pAno AND 
	p.EstadoPedido = 1 AND 
	p.Estado = 1) VentasTotales,
	
	m.BonoVentas,
	
	m.BonoPlus
FROM
	metasvendedores m
WHERE
	m.Mes = pMes AND m.Ano = pAno AND m.IdVendedor = pIdVendedor//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_visitas_asignar
DROP PROCEDURE IF EXISTS `sp_visitas_asignar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_visitas_asignar`(IN `pIdUsuario` INT, IN `pFechaProg` VARCHAR(50), IN `pIdClienteArray` TEXT)
BEGIN
DECLARE pIdCliente TEXT;
DECLARE i INT;
declare ExisteVisitaPendiente int;

#loque llega es el ide del Vendedor y un array de 

SET i = 1;
 	WHILE i > 0 DO
	SET i = INSTR(pIdClienteArray,"-"); 
	SET pIdCliente = SUBSTRING(pIdClienteArray,1,i-1); 
   
	IF i > 0 THEN      
   	SET pIdClienteArray = SUBSTRING(pIdClienteArray,i+CHAR_LENGTH("-"),CHAR_LENGTH(pIdClienteArray)); 
   ELSE
   	SET pIdCliente = pIdClienteArray;        
   END IF;
  
 	set ExisteVisitaPendiente = (Select count(*) from visitas where IdCliente = pIdCliente and Estado=1 and Resultado = 0);
	
	if ExisteVisitaPendiente = 0 then
		begin
			insert into visitas 
			(IdCliente, IdUsuario,FechaAsignacion, HoraAsignacion, FechaProgramacion) 
			values (pIdCliente, pIdUsuario,date(now()), time(now()), pFechaProg);
		end;
	end if;

    END WHILE;

	select 
				"1" Estado,
				"visita asignada" Message;    
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento aquapp.sp_visitas_registrar
DROP PROCEDURE IF EXISTS `sp_visitas_registrar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_visitas_registrar`(IN `pIdVisita` INT, IN `pResultado` INT, IN `pGlosa` vARCHAR(500), IN `pLatitud` vARCHAR(50), IN `pLongitud` vARCHAR(50), IN `pCantidadBotellones` INT, IN `pFecha` vARCHAR(50))
BEGIN
	declare pIdCliente int;
	declare pIdUsuariopide int;
	declare pPrecio decimal (10,2);

	Set pIdCliente = (select IdCliente from visitas c where c.Id = pIdVisita limit 1);
	Set pIdUsuarioPide = (select IdUsuario from visitas c where c.Id = pIdVisita limit 1);
		
update visitas 
set
	FechaVisita	= date(now()),
	HoraVisita 	= time(now()),
	Glosa 		= pGlosa,
	Resultado	= pResultado,
	Latitud 		= pLatitud,
	Longitud 	= pLongitud
where 
	Id = pIdVisita;


if pResultado = 3 then
	begin
		#registrar nuevo pedido
		#cargar los datos requeridos
		Set pPrecio = (select c.Precio from clientes c where c.Id = pIdCliente limit 1);
		call sp_pedido_registrar(pIdCliente, pIdUsuarioPide,pCantidadBotellones, pPrecio, "Pedido registrado desde visita", pFecha, "08:00:00");
		
		select 
			"1" Estado,
			"Visita registrada" message;			
		end;
elseif pResultado = 1 then
	begin
		insert into visitas 
		(IdCliente, IdUsuario,FechaAsignacion, HoraAsignacion, FechaProgramacion) 
		values (pIdCliente, pIdUsuariopide,date(now()), time(now()), DATE(DATE_ADD(NOW(), INTERVAL 1 DAY)));
		
		select 
			"1" Estado,
			"Visita registrada" message;
		
	end;
elseif pResultado = 2 then
	begin
		insert into visitas 
		(IdCliente, IdUsuario,FechaAsignacion, HoraAsignacion, FechaProgramacion) 
		values (pIdCliente, pIdUsuariopide,date(now()), time(now()), pFecha);
		
		select 
			"1" Estado,
			"Visita registrada" message;
	end;
end if;


END//
DELIMITER ;

-- Volcando estructura para función aquapp.fecha_b2n
DROP FUNCTION IF EXISTS `fecha_b2n`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fecha_b2n`(`pFecha` vARCHAR(10)) RETURNS varchar(10) CHARSET utf8
BEGIN
return (select 
	concat(
	substring(pFecha,9,2),"/",
	substring(pFecha,6,2),"/",
	substring(pFecha,1,4)
	));
END//
DELIMITER ;

-- Volcando estructura para función aquapp.fecha_n2b
DROP FUNCTION IF EXISTS `fecha_n2b`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fecha_n2b`(`pFecha` VARCHAR(10)) RETURNS date
BEGIN
return (
select 
	concat(
	substring(pFecha,7,4),"-",
	substring(pFecha,4,2),"-",
	substring(pFecha,1,2)
	));

END//
DELIMITER ;

-- Volcando estructura para función aquapp.fn_adelantos
DROP FUNCTION IF EXISTS `fn_adelantos`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_adelantos`(
	`pMes` INT,
	`pAno` INT,
	`pIdUsuario` INT
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN

RETURN (SELECT SUM(m.Monto) FROM movimientos m 
WHERE 
	m.IdCategoria = 5 AND 
	Fecha BETWEEN CONCAT(pAno, "-", pMes, "-01") AND LAST_DAY(CONCAT(pAno, "-", pMes, "-01")) and
	m.Estado = 1 and
	m.IdReferencia = pIdUsuario);
END//
DELIMITER ;

-- Volcando estructura para función aquapp.fn_cuadre_cerrado
DROP FUNCTION IF EXISTS `fn_cuadre_cerrado`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_cuadre_cerrado`() RETURNS int(11)
    DETERMINISTIC
BEGIN
RETURN (select COUNT(*) FROM cierre c WHERE c.Fecha = DATE(NOW()) AND c.Estado = 1 LIMIT 1);

END//
DELIMITER ;

-- Volcando estructura para función aquapp.fn_descuentos
DROP FUNCTION IF EXISTS `fn_descuentos`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_descuentos`(
	`pMes` INT,
	`pAno` INT,
	`pIdUsuario` INT
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
 DECLARE sueldo INT;
 
 SET sueldo = (
 	SELECT p.Basico FROM planilla p 
	 where p.IdUsuario = pIdUsuario and
	 	((CONCAT(pAno,"-",pMes,"-01")) between p.Desde AND ifnull(p.Hasta,DATE(NOW())))   ORDER BY Id ASC  LIMIT 1);


#return fn_diasnolaborados_usuario(pMes,PAno, pIdUsuario) ;
# RETURN sueldo/fn_diaslaborales(pMes, pAno);
 
RETURN round(sueldo/fn_diaslaborales(pMes, pAno) * fn_diasnolaborados_usuario(pMes,PAno, pIdUsuario),1);
END//
DELIMITER ;

-- Volcando estructura para función aquapp.fn_diaslaborales
DROP FUNCTION IF EXISTS `fn_diaslaborales`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_diaslaborales`(
	`pMes` INT,
	`pAno` INT
) RETURNS int(11)
    DETERMINISTIC
BEGIN

DECLARE fInicio DATE;
DECLARE fFin  DATE;
DECLARE diaActual  DATE;
DECLARE Domingos INT;
SET Domingos = 0;

SET fInicio = 	DATE(CONCAT(pAno, "-", pMes, "-01"));
set diaActual = 	DATE(CONCAT(pAno, "-", pMes, "-01"));
SET fFin = 		last_day(DATE(CONCAT(pAno, "-", pMes, "-01")));

 	WHILE fFin >= diaActual DO
 	if DAYOFWEEK(diaActual)=1 then
 		begin
 			set Domingos = Domingos + 1;
 		END;
 	END if;
 	
 	SET diaActual = DATE_ADD(diaActual,INTERVAL 1 DAY);
	
   END WHILE;

RETURN DATEDIFF(fFin,fInicio) +1 - Domingos;
END//
DELIMITER ;

-- Volcando estructura para función aquapp.fn_diasnolaborados_usuario
DROP FUNCTION IF EXISTS `fn_diasnolaborados_usuario`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_diasnolaborados_usuario`(
	`pMes` INT,
	`pAno` INT,
	`pIdUsuario` INT
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN

DECLARE totalfaltas DECIMAL(10,2);
DECLARE mediosdias INT;
DECLARE dias INT;
DECLARE fInicio DATE;
DECLARE fFin  DATE;

SET fInicio = 	DATE(CONCAT(pAno, "-", pMes, "-01"));
SET fFin = 		last_day(DATE(CONCAT(pAno, "-", pMes, "-01")));

SET dias = (SELECT COUNT(*) FROM asistencia a WHERE a.T_Manana = 0 AND a.T_Tarde = 0 AND IdUsuario = pIdUsuario AND (a.Fecha BETWEEN fInicio AND fFin) LIMIT 1); 
SET mediosdias = (SELECT COUNT(*) FROM asistencia a WHERE (T_Manana + T_Tarde = 1) AND IdUsuario = pIdUsuario AND (a.Fecha BETWEEN fInicio AND fFin) LIMIT 1); 

SET totalfaltas = dias + (mediosdias /2);

RETURN totalfaltas;

END//
DELIMITER ;

-- Volcando estructura para función aquapp.fn_movimientos_registrar
DROP FUNCTION IF EXISTS `fn_movimientos_registrar`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_movimientos_registrar`(`pFecha` vARCHAR(50), `pIdUsu` INT, `pIdCat` INT, `pIdRef` INT, `pMonto` decIMAL(10,2), `pComent` teXT) RETURNS int(11)
BEGIN
insert into 
	movimientos 
		(fecha, IdUsuario, idcategoria, idreferencia, glosa, monto) 
	values
		(pFecha, pIdUsu, pIdCat, pIdRef, pComent, pMonto);
	
	return 1;
END//
DELIMITER ;

-- Volcando estructura para función aquapp.hora_b2n
DROP FUNCTION IF EXISTS `hora_b2n`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `hora_b2n`(`pHora` varCHAR(50)) RETURNS varchar(15) CHARSET utf8
BEGIN
declare hora varchar(50);
declare minuto varchar(50);
declare meridiano varchar(50);
set hora = substring(pHora,1,2);
set minuto = substring(pHora,4,2);
set meridiano = " am";

if CONVERT(hora, UNSIGNED INTEGER) > 12 then
	begin
		set hora = CONVERT(hora, UNSIGNED INTEGER)-12;
		set meridiano = " pm";
	end;
end if;
return (select 
	concat(
	hora,":",minuto, meridiano
	));
END//
DELIMITER ;

-- Volcando estructura para función aquapp.usuario_i2n
DROP FUNCTION IF EXISTS `usuario_i2n`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `usuario_i2n`(
	`pId` INT
) RETURNS varchar(500) CHARSET utf8 COLLATE utf8_unicode_ci
    DETERMINISTIC
BEGIN
RETURN (

 SELECT u.Usuario FROM usuarios u WHERE id = pId LIMIT 1
 );
END//
DELIMITER ;

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_proy_clientes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_proy_clientes` AS select `c`.`Id` AS `Id`,`c`.`Nombre` AS `Nombre`,count(`p`.`Id`) AS `n_pedidos`,ifnull(sum(`p`.`Cantidad`),0) AS `n_botellones`,ifnull(`fecha_b2n`(max(`p`.`FechaEntrega`)),_utf8mb3'') AS `ultimo_pedido`,ifnull(round(((to_days(max(`p`.`FechaEntrega`)) - to_days(min(`p`.`FechaEntrega`))) / (count(`p`.`Id`) - 1)),0),_utf8mb3'') AS `frecuencia_pedido`,ifnull(`fecha_b2n`((max(`p`.`FechaEntrega`) + interval round(((to_days(max(`p`.`FechaEntrega`)) - to_days(min(`p`.`FechaEntrega`))) / (count(`p`.`Id`) - 1)),0) day)),_utf8mb3'') AS `Prox_pedido`,(case when ((max(`p`.`FechaEntrega`) + interval round(((to_days(max(`p`.`FechaEntrega`)) - to_days(min(`p`.`FechaEntrega`))) / (count(`p`.`Id`) - 1)),0) day) < cast(now() as date)) then _utf8mb3'Vencido' when (count(`p`.`Id`) <= 1) then _utf8mb3'Vencido' else _utf8mb3'Vigente' end) AS `Estado` from (`clientes` `c` left join `pedidos` `p` on(((`p`.`IdCliente` = `c`.`Id`) and (`p`.`EstadoPedido` = 1) and (`p`.`Estado` = 1)))) where ((`c`.`Id` <> 0) and (`c`.`Estado` = 1) and (`c`.`TipoCliente` = 0)) group by `c`.`Id` order by max(`p`.`FechaEntrega`);

-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_segmentacion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_segmentacion` AS with `clienteconsumopromedio` as (select `cc`.`Id` AS `IdCliente`,avg(`consumosmensuales`.`MontoTotal`) AS `MontoPromedioMensual`,(case when ((max(`consumosmensuales`.`Cantidad`) >= 5) and (max(`consumosmensuales`.`CantidadPaq`) < 20)) then 'Minorista' when ((max(`consumosmensuales`.`Cantidad`) < 5) and (max(`consumosmensuales`.`CantidadPaq`) <= 10)) then 'Consumidor' else 'Mayorista' end) AS `TipoCliente` from ((select `pp`.`IdCliente` AS `Idcliente`,year(`pp`.`FechaPide`) AS `Anio`,`pp`.`Cantidad` AS `Cantidad`,`pp`.`CantidadPaq` AS `CantidadPaq`,month(`pp`.`FechaPide`) AS `Mes`,sum(((coalesce(`pp`.`Cantidad`,0) * coalesce(`pp`.`Precio`,0)) + (coalesce(`pp`.`CantidadPaq`,0) * coalesce(`pp`.`PrecioPaq`,0)))) AS `MontoTotal` from (`pedidos` `pp` join `clientes` `cc` on((`pp`.`IdCliente` = `cc`.`Id`))) where ((`pp`.`IdCliente` <> 0) and (`pp`.`EstadoPedido` = 1) and (`pp`.`FechaPide` < date_format(now(),'%Y-%m-01')) and (`pp`.`FechaPide` >= date_format((now() - interval 2 year),'%Y-%m-01')) and (`cc`.`Estado` = 1) and (`pp`.`Estado` = 1)) group by `pp`.`IdCliente`,`Anio`,`Mes`) `consumosmensuales` join `clientes` `cc` on((`consumosmensuales`.`Idcliente` = `cc`.`Id`))) group by `consumosmensuales`.`Idcliente` order by `IdCliente`), `clientemetricas` as (select `subquery`.`IdCliente` AS `IdCliente`,`subquery`.`Nombre` AS `Nombre`,count(`p`.`Id`) AS `FrecuenciaCompra`,sum(ifnull(`p`.`Cantidad`,0)) AS `TotalBotellones`,sum(ifnull(`p`.`CantidadPaq`,0)) AS `TotalPaquetes`,(sum((ifnull(`p`.`Cantidad`,0) * ifnull(`p`.`Precio`,0))) + sum((ifnull(`p`.`CantidadPaq`,0) * ifnull(`p`.`PrecioPaq`,0)))) AS `MontoTotalCompra`,min(`p`.`FechaEntrega`) AS `PrimeraCompra`,max(`p`.`FechaEntrega`) AS `UltimaCompra`,(to_days(curdate()) - to_days(max(`p`.`FechaEntrega`))) AS `DiasDesdeUltimaCompra`,max((to_days(`p`.`FechaEntrega`) - to_days(`subquery`.`lag_fecha`))) AS `TiempoMaxEntreCompras`,avg((to_days(`p`.`FechaEntrega`) - to_days(`subquery`.`lag_fecha`))) AS `TiempoPromedioEntreCompras`,max(`p`.`Cantidad`) AS `MaxBot`,max(`p`.`CantidadPaq`) AS `MaxPaq`,ifnull(avg((case when (ifnull(`p`.`Cantidad`,0) > 0) then `p`.`Cantidad` else NULL end)),0) AS `PromedioBotellones`,ifnull(avg((case when (ifnull(`p`.`CantidadPaq`,0) > 0) then `p`.`CantidadPaq` else NULL end)),0) AS `PromedioPaquetes`,`prom`.`MontoPromedioMensual` AS `MontoPromedioMensual`,`prom`.`TipoCliente` AS `TipoCliente`,ntile(5) OVER (PARTITION BY `prom`.`TipoCliente` ORDER BY `prom`.`MontoPromedioMensual` )  AS `percentile` from (((select `c`.`Id` AS `IdCliente`,`c`.`Nombre` AS `Nombre`,`p`.`Id` AS `PedidoId`,`p`.`FechaEntrega` AS `FechaEntrega`,lag(`p`.`FechaEntrega`) OVER (PARTITION BY `c`.`Id` ORDER BY `p`.`FechaEntrega` )  AS `lag_fecha` from (`clientes` `c` join `pedidos` `p` on((`c`.`Id` = `p`.`IdCliente`))) where ((`c`.`Estado` = 1) and (`c`.`Id` <> 0) and (`p`.`FechaEntrega` >= (curdate() - interval 2 year)))) `subquery` join `pedidos` `p` on((`subquery`.`PedidoId` = `p`.`Id`))) join `clienteconsumopromedio` `prom` on((`prom`.`IdCliente` = `subquery`.`IdCliente`))) group by `subquery`.`IdCliente`,`subquery`.`Nombre` having (`FrecuenciaCompra` > 1)) select `cm`.`IdCliente` AS `IdCliente`,`cm`.`Nombre` AS `Nombre`,`cm`.`FrecuenciaCompra` AS `FrecuenciaCompra`,`cm`.`TotalBotellones` AS `TotalBotellones`,`cm`.`TotalPaquetes` AS `TotalPaquetes`,`cm`.`MontoTotalCompra` AS `MontoTotalCompra`,`cm`.`PrimeraCompra` AS `PrimeraCompra`,`cm`.`UltimaCompra` AS `UltimaCompra`,(to_days(`cm`.`UltimaCompra`) - to_days(`cm`.`PrimeraCompra`)) AS `tiempototal`,`cm`.`DiasDesdeUltimaCompra` AS `DiasDesdeUltimaCompra`,`cm`.`TiempoMaxEntreCompras` AS `TiempoMaxEntreCompras`,round(`cm`.`TiempoPromedioEntreCompras`,2) AS `TiempoPromedioEntreCompras`,`cm`.`MaxBot` AS `MaxBot`,`cm`.`MaxPaq` AS `MaxPaq`,`cm`.`PromedioBotellones` AS `PromedioBotellones`,`cm`.`PromedioPaquetes` AS `PromedioPaquetes`,`cm`.`MontoPromedioMensual` AS `MontoPromedioMensual`,`cm`.`TipoCliente` AS `TipoCliente`,(case `cm`.`percentile` when 1 then 'E' when 2 then 'D' when 3 then 'C' when 4 then 'B' else 'A' end) AS `Segmento`,(case when (`cm`.`DiasDesdeUltimaCompra` < `cm`.`TiempoPromedioEntreCompras`) then 'Normal' when ((`cm`.`DiasDesdeUltimaCompra` > `cm`.`TiempoPromedioEntreCompras`) and (`cm`.`DiasDesdeUltimaCompra` < `cm`.`TiempoMaxEntreCompras`)) then 'Dudoso' when ((`cm`.`DiasDesdeUltimaCompra` > `cm`.`TiempoMaxEntreCompras`) and (`cm`.`DiasDesdeUltimaCompra` < (`cm`.`TiempoMaxEntreCompras` * 2)) and (`cm`.`DiasDesdeUltimaCompra` > 20)) then 'Riesgo' when ((`cm`.`DiasDesdeUltimaCompra` > (`cm`.`TiempoMaxEntreCompras` * 2)) and (`cm`.`DiasDesdeUltimaCompra` > 30)) then 'Perdida' when (`cm`.`DiasDesdeUltimaCompra` < 30) then 'Dudoso' else 'Riesgo' end) AS `EstadoRecencia` from `clientemetricas` `cm`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
