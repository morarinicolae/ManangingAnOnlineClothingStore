-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for haine
CREATE DATABASE IF NOT EXISTS `haine` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `haine`;

-- Dumping structure for table haine.bluze
CREATE TABLE IF NOT EXISTS `bluze` (
  `ID_Bluze` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Marca` set('H&M','Nike','Addidas','Ionel','Puma') DEFAULT NULL,
  `Marimea` set('S','M','L','XL','XXL') DEFAULT NULL,
  `Culoarea` set('ALB','ALBASTRU','NEGRU','ROSU') DEFAULT NULL,
  `Gen` set('Femei','Barbati','Copii') DEFAULT NULL,
  PRIMARY KEY (`ID_Bluze`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table haine.cparinte
CREATE TABLE IF NOT EXISTS `cparinte` (
  `IDCPARINTE` smallint(6) NOT NULL,
  `DENC` tinytext DEFAULT NULL,
  `ZONA` tinytext DEFAULT NULL,
  PRIMARY KEY (`IDCPARINTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table haine.cprodus
CREATE TABLE IF NOT EXISTS `cprodus` (
  `IDCPRODUS` smallint(6) NOT NULL,
  `DENCP` tinytext DEFAULT NULL,
  `IDCPARINTE` smallint(6) NOT NULL,
  PRIMARY KEY (`IDCPRODUS`),
  KEY `IDCPARINTE_FK` (`IDCPARINTE`),
  CONSTRAINT `IDCPARINTE_FK` FOREIGN KEY (`IDCPARINTE`) REFERENCES `cparinte` (`IDCPARINTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table haine.cspec
CREATE TABLE IF NOT EXISTS `cspec` (
  `IDCSPEC` smallint(6) NOT NULL,
  `DENCSPEC` tinytext DEFAULT NULL,
  PRIMARY KEY (`IDCSPEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table haine.hanorac
CREATE TABLE IF NOT EXISTS `hanorac` (
  `ID_Hanorac` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Marca` set('H&M','Nike','Addidas','Ionel','Puma') DEFAULT NULL,
  `Marimea` set('S','M','L','XL','XXL') DEFAULT NULL,
  `Culoarea` set('ALB','ALBASTRU','NEGRU','ROSU') DEFAULT NULL,
  `Gen` set('Femei','Barbati','Copii') DEFAULT NULL,
  PRIMARY KEY (`ID_Hanorac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table haine.parinte
CREATE TABLE IF NOT EXISTS `parinte` (
  `ID_Parinte` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Femei` varchar(50) DEFAULT NULL,
  `Barbati` varchar(50) DEFAULT NULL,
  `Copii` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Parinte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table haine.produs
CREATE TABLE IF NOT EXISTS `produs` (
  `IDPRODUS` smallint(6) NOT NULL,
  `DENPR` text DEFAULT NULL,
  `STOC` int(11) DEFAULT NULL,
  `PRET` int(11) DEFAULT NULL,
  `BRAND` tinytext DEFAULT NULL,
  `IDCPRODUS` smallint(6) NOT NULL,
  PRIMARY KEY (`IDPRODUS`),
  KEY `IDCPRODUS_FK` (`IDCPRODUS`),
  CONSTRAINT `IDCPRODUS_FK` FOREIGN KEY (`IDCPRODUS`) REFERENCES `cprodus` (`IDCPRODUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table haine.specif
CREATE TABLE IF NOT EXISTS `specif` (
  `IDSPECIF` smallint(6) NOT NULL,
  `DENSPECIFIC` tinytext DEFAULT NULL,
  `IDCSPEC` smallint(6) NOT NULL,
  `IDPRODUS` smallint(6) NOT NULL,
  `CARACT` text DEFAULT NULL,
  PRIMARY KEY (`IDSPECIF`),
  KEY `IDCSPEC_FK` (`IDCSPEC`),
  KEY `IDPRODUS_FK` (`IDPRODUS`),
  CONSTRAINT `IDCSPEC_FK` FOREIGN KEY (`IDCSPEC`) REFERENCES `cspec` (`IDCSPEC`),
  CONSTRAINT `IDPRODUS_FK` FOREIGN KEY (`IDPRODUS`) REFERENCES `produs` (`IDPRODUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table haine.tricou
CREATE TABLE IF NOT EXISTS `tricou` (
  `ID_Tricou` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Marca` set('H&M','Nike','Addidas','Ionel','Puma') DEFAULT NULL,
  `Marimea` set('S','M','L','XL','XXL') DEFAULT NULL,
  `Culoarea` set('ALB','ALBASTRU','NEGRU','ROSU') DEFAULT NULL,
  `Gen` set('Femei','Barbati','Copii') DEFAULT NULL,
  PRIMARY KEY (`ID_Tricou`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table haine.utilizatori
CREATE TABLE IF NOT EXISTS `utilizatori` (
  `UTILIZNO` smallint(6) NOT NULL,
  `USERNAME` tinytext DEFAULT NULL,
  `PAROLE` tinytext DEFAULT NULL,
  `PRIVILEGIU` tinytext DEFAULT NULL,
  PRIMARY KEY (`UTILIZNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
