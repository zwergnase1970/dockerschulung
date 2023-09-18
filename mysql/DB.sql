-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für verkauf
DROP DATABASE IF EXISTS `verkauf`;
CREATE DATABASE IF NOT EXISTS `verkauf` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `verkauf`;

-- Exportiere Struktur von Tabelle verkauf.kunden
DROP TABLE IF EXISTS `kunden`;
CREATE TABLE IF NOT EXISTS `kunden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `adresse` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle verkauf.kunden: ~3 rows (ungefähr)
DELETE FROM `kunden`;
/*!40000 ALTER TABLE `kunden` DISABLE KEYS */;
INSERT INTO `kunden` (`id`, `name`, `adresse`) VALUES
	(1, 'Tuttas', 'Ellernbuschfeld 23b'),
	(2, 'Mustermann', 'Hauptstr.'),
	(3, 'Musterfrau', 'Expo Plaza');
/*!40000 ALTER TABLE `kunden` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
