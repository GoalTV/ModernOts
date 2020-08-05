-- --------------------------------------------------------
-- Host:                         192.168.93.129
-- Server version:               10.3.22-MariaDB-1ubuntu1 - Ubuntu 20.04
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ots
CREATE DATABASE IF NOT EXISTS `ots` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ots`;

-- Dumping structure for table ots.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `premdays` int(11) NOT NULL DEFAULT 0,
  `lastday` int(10) unsigned NOT NULL DEFAULT 0,
  `vipdays` int(11) NOT NULL DEFAULT 0,
  `viplastday` int(10) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(20) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT IGNORE INTO `accounts` (`id`, `name`, `password`, `premdays`, `lastday`, `vipdays`, `viplastday`, `email`, `key`, `blocked`, `warnings`, `group_id`) VALUES
	(1, '1', '356a192b7913b04c54574d18c28d46e6395428ab', 65535, 1596654187, 0, 0, '', '0', 0, 0, 1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

-- Dumping structure for table ots.account_viplist
CREATE TABLE IF NOT EXISTS `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  KEY `world_id` (`world_id`),
  CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.account_viplist: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_viplist` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_viplist` ENABLE KEYS */;

-- Dumping structure for table ots.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) unsigned NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) unsigned NOT NULL DEFAULT 4294967295 COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `expires` int(11) NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `reason` int(10) unsigned NOT NULL DEFAULT 0,
  `action` int(10) unsigned NOT NULL DEFAULT 0,
  `statement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`value`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.bans: ~0 rows (approximately)
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;

-- Dumping structure for table ots.environment_killers
CREATE TABLE IF NOT EXISTS `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `kill_id` (`kill_id`),
  CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.environment_killers: ~0 rows (approximately)
/*!40000 ALTER TABLE `environment_killers` DISABLE KEYS */;
/*!40000 ALTER TABLE `environment_killers` ENABLE KEYS */;

-- Dumping structure for table ots.global_storage
CREATE TABLE IF NOT EXISTS `global_storage` (
  `key` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `key` (`key`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.global_storage: ~0 rows (approximately)
/*!40000 ALTER TABLE `global_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_storage` ENABLE KEYS */;

-- Dumping structure for table ots.guilds
CREATE TABLE IF NOT EXISTS `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.guilds: ~0 rows (approximately)
/*!40000 ALTER TABLE `guilds` DISABLE KEYS */;
/*!40000 ALTER TABLE `guilds` ENABLE KEYS */;

-- Dumping structure for table ots.guild_invites
CREATE TABLE IF NOT EXISTS `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.guild_invites: ~0 rows (approximately)
/*!40000 ALTER TABLE `guild_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_invites` ENABLE KEYS */;

-- Dumping structure for table ots.guild_ranks
CREATE TABLE IF NOT EXISTS `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.guild_ranks: ~0 rows (approximately)
/*!40000 ALTER TABLE `guild_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_ranks` ENABLE KEYS */;

-- Dumping structure for table ots.houses
CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `lastwarning` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `town` int(10) unsigned NOT NULL DEFAULT 0,
  `size` int(10) unsigned NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `rent` int(10) unsigned NOT NULL DEFAULT 0,
  `doors` int(10) unsigned NOT NULL DEFAULT 0,
  `beds` int(10) unsigned NOT NULL DEFAULT 0,
  `tiles` int(10) unsigned NOT NULL DEFAULT 0,
  `guild` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `clear` tinyint(1) unsigned NOT NULL DEFAULT 0,
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.houses: ~112 rows (approximately)
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2, 0, 0, 0, 0, 0, 'Modernots.eu #2', 1, 57, 114000, 0, 4, 2, 114, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(3, 0, 0, 0, 0, 0, 'Modernots.eu #3', 1, 58, 86000, 0, 1, 2, 86, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(4, 0, 0, 0, 0, 0, 'Modernots.eu #4', 1, 48, 64000, 0, 1, 2, 64, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(5, 0, 0, 0, 0, 0, 'Modernots.eu #5', 1, 77, 101000, 0, 2, 2, 101, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(6, 0, 0, 0, 0, 0, 'Modernots.eu #6', 1, 78, 109000, 0, 3, 2, 109, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(7, 0, 0, 0, 0, 0, 'Modernots.eu #7', 1, 47, 65000, 0, 2, 0, 65, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(8, 0, 0, 0, 0, 0, 'Modernots.eu #8', 1, 45, 73000, 0, 2, 2, 73, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(9, 0, 0, 0, 0, 0, 'Modernots.eu #9', 1, 82, 104000, 0, 3, 4, 104, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(10, 0, 0, 0, 0, 0, 'Modernots.eu #10', 1, 73, 108000, 0, 2, 2, 108, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(11, 0, 0, 0, 0, 0, 'Modernots.eu #11', 1, 22, 35000, 0, 1, 2, 35, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(12, 0, 0, 0, 0, 0, 'Modernots.eu #12', 1, 21, 35000, 0, 2, 0, 35, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(13, 0, 0, 0, 0, 0, 'Modernots.eu #13', 1, 21, 35000, 0, 2, 0, 35, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(14, 0, 0, 0, 0, 0, 'Modernots.eu #14', 1, 21, 35000, 0, 2, 0, 35, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(15, 0, 0, 0, 0, 0, 'Modernots.eu #15', 1, 20, 46000, 0, 1, 0, 46, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(16, 0, 0, 0, 0, 0, 'Modernots.eu #16', 1, 24, 49000, 0, 1, 0, 49, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(17, 0, 0, 0, 0, 0, 'Modernots.eu #17', 1, 20, 42000, 0, 1, 0, 42, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(18, 0, 0, 0, 0, 0, 'Modernots.eu #18', 1, 38, 53000, 0, 1, 2, 53, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(19, 0, 0, 0, 0, 0, 'Modernots.eu #19', 1, 38, 54000, 0, 1, 2, 54, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(20, 0, 0, 0, 0, 0, 'Modernots.eu #20', 1, 84, 146000, 0, 2, 0, 146, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(21, 0, 0, 0, 0, 0, 'Modernots.eu #21', 1, 22, 48000, 0, 1, 2, 48, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(22, 0, 0, 0, 0, 0, 'Modernots.eu #22', 1, 22, 48000, 0, 1, 2, 48, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(23, 0, 0, 0, 0, 0, 'Modernots.eu #23', 1, 22, 35000, 0, 1, 2, 35, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(24, 0, 0, 0, 0, 0, 'Modernots.eu #24', 1, 69, 140000, 0, 3, 2, 140, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(25, 0, 0, 0, 0, 0, 'Modernots.eu #25', 1, 28, 56000, 0, 1, 2, 56, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(26, 0, 0, 0, 0, 0, 'Modernots.eu #26', 1, 22, 35000, 0, 1, 2, 35, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(27, 0, 0, 0, 0, 0, 'Modernots.eu #27', 1, 24, 48000, 0, 1, 0, 48, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(28, 0, 0, 0, 0, 0, 'Modernots.eu #28', 1, 10, 30000, 0, 1, 2, 30, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(29, 0, 0, 0, 0, 0, 'Modernots.eu #29', 1, 76, 125000, 0, 3, 2, 125, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(30, 0, 0, 0, 0, 0, 'Modernots.eu #30', 1, 121, 172000, 0, 3, 2, 172, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(31, 0, 0, 0, 0, 0, 'Modernots.eu #31', 1, 14, 19000, 0, 1, 2, 19, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(32, 0, 0, 0, 0, 0, 'Modernots.eu #32', 1, 20, 26000, 0, 1, 2, 26, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(33, 0, 0, 0, 0, 0, 'Modernots.eu #33', 1, 14, 21000, 0, 1, 2, 21, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(34, 0, 0, 0, 0, 0, 'Modernots.eu #34', 1, 18, 23000, 0, 1, 2, 23, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(35, 0, 0, 0, 0, 0, 'Modernots.eu #35', 1, 27, 46000, 0, 2, 0, 46, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(36, 0, 0, 0, 0, 0, 'Modernots.eu #36', 1, 27, 42000, 0, 2, 0, 42, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(37, 0, 0, 0, 0, 0, 'Modernots.eu #37', 1, 18, 23000, 0, 1, 2, 23, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(38, 0, 0, 0, 0, 0, 'Modernots.eu #38', 1, 20, 34000, 0, 2, 2, 34, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(39, 0, 0, 0, 0, 0, 'Modernots.eu #39', 1, 44, 55000, 0, 2, 4, 55, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(40, 0, 0, 0, 0, 0, 'Modernots.eu #40', 1, 24, 38000, 0, 2, 2, 38, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(41, 0, 0, 0, 0, 0, 'Modernots.eu #41', 1, 36, 52000, 0, 4, 2, 52, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(42, 0, 0, 0, 0, 0, 'Modernots.eu #42', 1, 33, 43000, 0, 2, 2, 43, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(43, 0, 0, 0, 0, 0, 'Modernots.eu #43', 1, 27, 39000, 0, 2, 4, 39, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(44, 0, 0, 0, 0, 0, 'Modernots.eu #44', 1, 42, 96000, 0, 4, 2, 96, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(45, 0, 0, 0, 0, 0, 'Modernots.eu #45', 1, 43, 75000, 0, 2, 2, 75, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(46, 0, 0, 0, 0, 0, 'Modernots.eu #46', 1, 24, 48000, 0, 1, 0, 48, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(47, 0, 0, 0, 0, 0, 'Modernots.eu #47', 1, 24, 48000, 0, 1, 0, 48, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(48, 0, 0, 0, 0, 0, 'Modernots.eu #48', 1, 28, 33000, 0, 1, 0, 33, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(49, 0, 0, 0, 0, 0, 'Modernots.eu #49', 1, 28, 35000, 0, 2, 0, 35, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(50, 0, 0, 0, 0, 0, 'Modernots.eu #50', 1, 24, 38000, 0, 2, 0, 38, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(51, 0, 0, 0, 0, 0, 'Modernots.eu #51', 1, 32, 41000, 0, 1, 2, 41, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(52, 0, 0, 0, 0, 0, 'Modernots.eu #52', 1, 25, 42000, 0, 2, 2, 42, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(53, 0, 0, 0, 0, 0, 'Modernots.eu #53', 1, 57, 75000, 0, 3, 2, 75, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(54, 0, 0, 0, 0, 0, 'Modernots.eu #54', 1, 75, 95000, 0, 1, 0, 95, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(55, 0, 0, 0, 0, 0, 'Modernots.eu #55', 1, 75, 92000, 0, 1, 0, 92, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(56, 0, 0, 0, 0, 0, 'Modernots.eu #56', 1, 85, 163000, 0, 3, 2, 163, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(71, 0, 0, 0, 0, 0, 'Modernots.eu #71', 1, 90, 150000, 0, 5, 0, 150, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(72, 0, 0, 0, 0, 0, 'Modernots.eu #72', 1, 33, 61000, 0, 2, 0, 61, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(73, 0, 0, 0, 0, 0, 'Modernots.eu #73', 1, 15, 27000, 0, 1, 0, 27, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(74, 0, 0, 0, 0, 0, 'Modernots.eu #74', 1, 51, 102000, 0, 6, 0, 102, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(75, 0, 0, 0, 0, 0, 'Modernots.eu #75', 1, 15, 28000, 0, 2, 0, 28, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(76, 0, 0, 0, 0, 0, 'Modernots.eu #76', 1, 44, 75000, 0, 2, 0, 75, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(77, 0, 0, 0, 0, 0, 'Modernots.eu #77', 1, 6, 15000, 0, 1, 0, 15, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(78, 0, 0, 0, 0, 0, 'Modernots.eu #78', 1, 6, 15000, 0, 1, 0, 15, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(79, 0, 0, 0, 0, 0, 'Modernots.eu #79', 1, 6, 14000, 0, 1, 0, 14, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(80, 0, 0, 0, 0, 0, 'Modernots.eu #80', 1, 66, 114000, 0, 4, 0, 114, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(81, 0, 0, 0, 0, 0, 'Modernots.eu #81', 1, 20, 40000, 0, 3, 0, 40, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(82, 0, 0, 0, 0, 0, 'Modernots.eu #82', 1, 36, 68000, 0, 3, 0, 68, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(83, 0, 0, 0, 0, 0, 'Modernots.eu #83', 1, 50, 80000, 0, 3, 0, 80, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(84, 0, 0, 0, 0, 0, 'Modernots.eu #84', 1, 12, 20000, 0, 1, 0, 20, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(85, 0, 0, 0, 0, 0, 'Modernots.eu #85', 1, 18, 32000, 0, 2, 0, 32, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(86, 0, 0, 0, 0, 0, 'Modernots.eu #86', 1, 56, 101000, 0, 6, 0, 101, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(87, 0, 0, 0, 0, 0, 'Modernots.eu #87', 1, 15, 28000, 0, 1, 0, 28, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(88, 0, 0, 0, 0, 0, 'House Gulid #88', 1, 236, 381000, 10000, 8, 6, 381, 1, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(89, 0, 0, 0, 0, 0, 'House Gulid #89', 1, 223, 431000, 10000, 12, 2, 431, 1, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(90, 0, 0, 0, 0, 0, 'Modernots.eu #90', 1, 134, 227000, 0, 1, 0, 227, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(91, 0, 0, 0, 0, 0, 'Gulid House #91', 1, 160, 335000, 1000, 5, 8, 335, 1, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2060, 0, 0, 0, 0, 0, 'GM House 01', 1, 941, 1387000, 0, 9, 16, 1387, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2061, 0, 0, 0, 0, 0, 'Vip House #91', 1, 35, 71000, 0, 6, 2, 71, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2062, 0, 0, 0, 0, 0, 'Vip House #92', 1, 100, 177000, 0, 13, 4, 177, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2063, 0, 0, 0, 0, 0, 'Vip House #93', 1, 15, 35000, 0, 1, 0, 35, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2064, 0, 0, 0, 0, 0, 'Vip House #94', 1, 23, 49000, 0, 4, 0, 49, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2065, 0, 0, 0, 0, 0, 'Vip House #95', 1, 46, 98000, 0, 3, 4, 98, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2066, 0, 0, 0, 0, 0, 'Vip House #96', 1, 73, 119000, 0, 4, 2, 119, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2067, 0, 0, 0, 0, 0, 'Vip House #97', 1, 73, 133000, 0, 4, 2, 133, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2068, 0, 0, 0, 0, 0, 'Vip House #98', 1, 34, 78000, 0, 2, 0, 78, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2069, 0, 0, 0, 0, 0, 'Vip House #99', 1, 42, 81000, 0, 8, 2, 81, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2070, 0, 0, 0, 0, 0, 'Vip House #100', 1, 22, 48000, 0, 4, 2, 48, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2071, 0, 0, 0, 0, 0, 'Vip House #101', 1, 22, 48000, 0, 5, 2, 48, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2072, 0, 0, 0, 0, 0, 'Vip House #102', 1, 22, 48000, 0, 5, 2, 48, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2073, 0, 0, 0, 0, 0, 'Vip House #103', 1, 22, 40000, 0, 4, 2, 40, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2074, 0, 0, 0, 0, 0, 'Vip House #104', 1, 22, 48000, 0, 2, 2, 48, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2075, 0, 0, 0, 0, 0, 'Vip House #105', 1, 22, 40000, 0, 1, 2, 40, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2076, 0, 0, 0, 0, 0, 'Vip House #106', 1, 22, 48000, 0, 1, 2, 48, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2077, 0, 0, 0, 0, 0, 'Vip House #107', 1, 19, 36000, 0, 2, 2, 36, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2078, 0, 0, 0, 0, 0, 'Vip House #108', 1, 19, 36000, 0, 2, 2, 36, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2079, 0, 0, 0, 0, 0, 'Vip House #109', 1, 19, 45000, 0, 4, 2, 45, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2080, 0, 0, 0, 0, 0, 'Vip House #110', 1, 19, 36000, 0, 1, 2, 36, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2081, 0, 0, 0, 0, 0, 'Vip House #111', 1, 19, 36000, 0, 1, 2, 36, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2082, 0, 0, 0, 0, 0, 'Vip House #112', 1, 19, 45000, 0, 1, 2, 45, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2083, 0, 0, 0, 0, 0, 'Vip House #113', 1, 119, 216000, 0, 12, 4, 216, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2084, 0, 0, 0, 0, 0, 'Vip House #114', 1, 28, 56000, 0, 7, 2, 56, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2085, 0, 0, 0, 0, 0, 'Vip House #115', 1, 28, 56000, 0, 4, 2, 56, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2086, 0, 0, 0, 0, 0, 'Vip House #116', 1, 26, 56000, 0, 5, 4, 56, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2087, 0, 0, 0, 0, 0, 'Vip House #117', 1, 26, 56000, 0, 7, 4, 56, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2088, 0, 0, 0, 0, 0, 'Vip House #118', 1, 28, 56000, 0, 6, 2, 56, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2089, 0, 0, 0, 0, 0, 'Vip House #119', 1, 28, 56000, 0, 6, 2, 56, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2090, 0, 0, 0, 0, 0, 'Vip House #120', 1, 28, 56000, 0, 9, 2, 56, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2091, 0, 0, 0, 0, 0, 'Vip House #121', 1, 28, 56000, 0, 7, 2, 56, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2092, 0, 0, 0, 0, 0, 'Vip House #122', 1, 24, 54000, 0, 4, 0, 54, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2093, 0, 0, 0, 0, 0, 'Vip House #123', 1, 24, 54000, 0, 5, 0, 54, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2094, 0, 0, 0, 0, 0, 'Vip House #124', 1, 26, 54000, 0, 4, 2, 54, 0, 0);
INSERT IGNORE INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
	(2095, 0, 0, 0, 0, 0, 'Vip House #125', 1, 24, 54000, 0, 10, 4, 54, 0, 0);
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;

-- Dumping structure for table ots.house_auctions
CREATE TABLE IF NOT EXISTS `house_auctions` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `bid` int(10) unsigned NOT NULL DEFAULT 0,
  `limit` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` bigint(20) unsigned NOT NULL DEFAULT 0,
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.house_auctions: ~0 rows (approximately)
/*!40000 ALTER TABLE `house_auctions` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_auctions` ENABLE KEYS */;

-- Dumping structure for table ots.house_data
CREATE TABLE IF NOT EXISTS `house_data` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `data` longblob NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.house_data: ~112 rows (approximately)
/*!40000 ALTER TABLE `house_data` DISABLE KEYS */;
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2, 0, _binary 0xE303F2030601000000D3238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313430303020676F6C6420636F696E732E0600646F6F726964020100000000E203F3030701000000D5238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313430303020676F6C6420636F696E732E0600646F6F726964020300000000E303F2030701000000D3238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313430303020676F6C6420636F696E732E0600646F6F726964020200000000E603F0030701000000D5238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313430303020676F6C6420636F696E732E0600646F6F726964020600000000E703F5030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00E703F6030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(3, 0, _binary 0xEE03F5030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00EE03F6030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F003F0030701000000D5238002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202333272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(4, 0, _binary 0xF303EE030701000000D3238002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202334272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363430303020676F6C6420636F696E732E0600646F6F726964020100000000F803F0030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F803F1030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(5, 0, _binary 0xF303E8030701000000D3238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020200000000F403EA030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F403EB030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F803E9030701000000D5238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(6, 0, _binary 0xF403DB030701000000D3238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303930303020676F6C6420636F696E732E0600646F6F726964020300000000F803DA030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F803DB030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F003DE030701000000D5238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303930303020676F6C6420636F696E732E0600646F6F726964020100000000F403DC030601000000D3238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303930303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(7, 0, _binary 0xE603DB030601000000D5238002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363530303020676F6C6420636F696E732E0600646F6F726964020200000000E703DE030701000000D5238002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(8, 0, _binary 0xE203DB030601000000D5238002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373330303020676F6C6420636F696E732E0600646F6F726964020300000000E103D8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00E103D9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00E203DE030701000000D5238002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(9, 0, _binary 0xD703DD030601000000D5238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303430303020676F6C6420636F696E732E0600646F6F726964020300000000D703DD030701000000D5238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303430303020676F6C6420636F696E732E0600646F6F726964020100000000D303E1030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00D303E2030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00D903E1030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00D903E2030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00DA03E0030701000000D3238002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E6575202339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(10, 0, _binary 0xD503E6030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00D503E7030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00D703EA030601000000D5238002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233130272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303830303020676F6C6420636F696E732E0600646F6F726964020200000000DA03EB030701000000D3238002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233130272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(11, 0, _binary 0xC603EE030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C603EF030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00CC03F0030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233131272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(12, 0, _binary 0xD103F80306010000006F188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020200000000D103F90306010000002D1900D303F80307010000002F1900D303F903070100000069188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(13, 0, _binary 0xD103FC0306010000006F188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020200000000D103FD0306010000002D1900D303FC03070100000069188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020100000000D303FD0307010000002F1900);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(14, 0, _binary 0xD303FF03070100000069188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020200000000D003020406010000002C1900D103000406010000006F188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020300000000D303010407010000002F1900);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(15, 0, _binary 0xD4030E04070100000071188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(16, 0, _binary 0xDB030E04070100000071188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343930303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(17, 0, _binary 0xE2030E04070100000071188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(18, 0, _binary 0xD403040407010000002C1900D503040407010000006D188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353330303020676F6C6420636F696E732E0600646F6F726964020100000000D70305040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00D70306040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(19, 0, _binary 0xDA03040407010000002C1900DB03040407010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020200000000DD0305040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00DD0306040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(20, 0, _binary 0xDF03FE030701000000D3238002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343630303020676F6C6420636F696E732E0600646F6F726964020200000000E30300040701000000D5238002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(21, 0, _binary 0xBB03EF030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00BB03F0030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C103F1030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(22, 0, _binary 0xBB03E8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00BB03E9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C103EA030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233232272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(23, 0, _binary 0xBB03E1030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00BB03E2030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C103E3030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233233272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(24, 0, _binary 0xCC03E3030701000000C3048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233234272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343030303020676F6C6420636F696E732E0600646F6F726964020400000000C603E6030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C603E7030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C803E5030601000000C5048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233234272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343030303020676F6C6420636F696E732E0600646F6F726964020200000000C803E5030701000000C5048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233234272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031343030303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(25, 0, _binary 0xC303FB03070100000071188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020300000000C503FB0307010000002C1900C103FD0307010000002D1900C703FC030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C703FD030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C803FD0307010000002D1900C103000407010000002D1900C503010407010000002C1900C803000407010000002D1900);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(26, 0, _binary 0xC603F3030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C603F4030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00CC03F5030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233236272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(27, 0, _binary 0xCC03F0030601000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233237272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(28, 0, _binary 0xBC03F70307010000002D1900BD03F6030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00BD03F7030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00BE03F50307010000002E1900C003F50307010000002E1900C103F7030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233238272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(29, 0, _binary 0xCA03D7030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00CA03D8030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00CD03D8030601000000D3238002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233239272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323530303020676F6C6420636F696E732E0600646F6F726964020200000000CD03D8030701000000D3238002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233239272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323530303020676F6C6420636F696E732E0600646F6F726964020100000000D003DA030701000000D5238002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233239272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031323530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(30, 0, _binary 0xBE03DC030701000000C5048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233330272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373230303020676F6C6420636F696E732E0600646F6F726964020100000000C103DA030601000000C3048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233330272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373230303020676F6C6420636F696E732E0600646F6F726964020600000000C103DA030701000000C3048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233330272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373230303020676F6C6420636F696E732E0600646F6F726964020300000000C503D8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C503D9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(31, 0, _binary 0xC403CF030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C603CC0307010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233331272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313930303020676F6C6420636F696E732E0600646F6F726964020100000000C403D0030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(32, 0, _binary 0xCB03CD030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00CB03CE030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00D103CE0307010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233332272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(33, 0, _binary 0xD403C6030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00D403C7030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00D003C80307010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233333272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(34, 0, _binary 0xDD03C50307010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233334272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020100000000DF03C8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00DF03C9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(35, 0, _binary 0xD903CE0307010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343630303020676F6C6420636F696E732E0600646F6F726964020200000000D903D10306010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233335272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(36, 0, _binary 0xDE03CE0307010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343230303020676F6C6420636F696E732E0600646F6F726964020100000000DE03D10306010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233336272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343230303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(37, 0, _binary 0xE503C50307010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233337272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323330303020676F6C6420636F696E732E0600646F6F726964020100000000E703C8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00E703C9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(38, 0, _binary 0xEB03CE0307010000006C188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333430303020676F6C6420636F696E732E0600646F6F726964020300000000E403D20307010000002F1900E503D1030701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00E603D1030701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00E803D203070100000069188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233338272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333430303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(39, 0, _binary 0xEC03C7030701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00ED03C7030701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00EC03C9030701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00ED03C9030701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00EF03C803070100000069188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353530303020676F6C6420636F696E732E0600646F6F726964020100000000F403CA03070100000069188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233339272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(40, 0, _binary 0xFB03C7030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00FA03C90307010000006D188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233430272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333830303020676F6C6420636F696E732E0600646F6F726964020100000000FB03C8030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00FE03CC03070100000069188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233430272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333830303020676F6C6420636F696E732E0600646F6F726964020400000000FE03CD0307010000002D1900);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(41, 0, _binary 0xF303D1030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F303D2030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F503D30307010000006D188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233431272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353230303020676F6C6420636F696E732E0600646F6F726964020400000000F803D20307010000006A188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233431272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353230303020676F6C6420636F696E732E0600646F6F726964020300000000FA03D30307010000006D188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233431272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353230303020676F6C6420636F696E732E0600646F6F726964020200000000FB03D50307010000006A188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233431272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353230303020676F6C6420636F696E732E0600646F6F726964020100000000FB03D60307010000002D1900);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(42, 0, _binary 0x0504CF0307010000002D19000B04CF0307010000006A188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233432272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343330303020676F6C6420636F696E732E0600646F6F7269640202000000000504D00307010000006A188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233432272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343330303020676F6C6420636F696E732E0600646F6F7269640201000000000C04D1030701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E000D04D1030701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(43, 0, _binary 0x0504C60307010000002F19000504C70307010000006A188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233433272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333930303020676F6C6420636F696E732E0600646F6F7269640202000000000904C4030701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E000A04C4030701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E000A04C90307010000006A188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233433272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333930303020676F6C6420636F696E732E0600646F6F7269640201000000000C04C8030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E000C04C9030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(44, 0, _binary 0x1604C3030601000000E7288002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233434272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393630303020676F6C6420636F696E732E0600646F6F7269640204000000001404C0030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E001404C1030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E001804C1030601000000F0288002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233434272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393630303020676F6C6420636F696E732E0600646F6F7269640204000000001804C1030701000000F0288002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233434272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393630303020676F6C6420636F696E732E0600646F6F7269640203000000001604C6030701000000E7288002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233434272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393630303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(45, 0, _binary 0x1C04C3030601000000E7288002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233435272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F7269640205000000001D04C0030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E001D04C1030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E001C04C6030701000000E7288002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233435272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(46, 0, _binary 0x2304D4030601000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233436272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(47, 0, _binary 0x2304C9030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233437272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(48, 0, _binary 0x1F04D4030601000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233438272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333330303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(49, 0, _binary 0x1D04D6030701000000C5048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233439272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F7269640201000000001F04D4030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233439272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(50, 0, _binary 0x2304D4030701000000C3048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233530272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333830303020676F6C6420636F696E732E0600646F6F7269640202000000002604D6030701000000C5048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233530272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(51, 0, _binary 0x1304EF030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E001404EC0307010000006A188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233531272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343130303020676F6C6420636F696E732E0600646F6F7269640202000000001304F0030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(52, 0, _binary 0x1704F70307010000006A188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233532272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343230303020676F6C6420636F696E732E0600646F6F7269640201000000001A04F6030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E001A04F7030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E001304FB03070100000069188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233532272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343230303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(53, 0, _binary 0x0A04FA0307010000006D188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233533272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F7269640202000000000704FC0306010000006A188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233533272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F7269640204000000000604FC0307010000006A188002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233533272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F7269640201000000000B04FF030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E000B0400040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(54, 0, _binary 0xFD03FE030701000000C5048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233534272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(55, 0, _binary 0xF403FE030701000000C5048002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233535272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393230303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(56, 0, _binary 0xC50316040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C60316040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00C7031A040601000000BC048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233536272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031363330303020676F6C6420636F696E732E0600646F6F726964020300000000C6031A040701000000BC048002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233536272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031363330303020676F6C6420636F696E732E0600646F6F726964020200000000C3031F04070100000071188002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233536272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031363330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(71, 0, _binary 0xDD041B040501000000711B00DF0419040601000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233731272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353030303020676F6C6420636F696E732E0600646F6F726964020400000000DF041A040701000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233731272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353030303020676F6C6420636F696E732E0600646F6F726964020100000000E20417040701000000EB1A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233731272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353030303020676F6C6420636F696E732E0600646F6F726964020600000000E5041B040601000000711B00E7041B040601000000711B00E4041A040701000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233731272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353030303020676F6C6420636F696E732E0600646F6F726964020100000000E7041B040701000000711B00E80419040601000000721B00E80418040701000000721B00E8041A040701000000721B00E1041C040701000000EB1A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233731272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031353030303020676F6C6420636F696E732E0600646F6F726964020200000000E2041D040701000000721B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(72, 0, _binary 0xF10416040701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233732272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020600000000F20416040701000000711B00F10418040701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233732272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363130303020676F6C6420636F696E732E0600646F6F726964020200000000F20418040701000000711B00F6041B040601000000721B00F6041A040701000000721B00F0041C040701000000711B00F3041C040701000000711B00F5041C040601000000711B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(73, 0, _binary 0xFC0417040701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233733272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323730303020676F6C6420636F696E732E0600646F6F726964020200000000FE041A040701000000741B00FC041D040701000000731B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(74, 0, _binary 0xE4040A040601000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233734272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303230303020676F6C6420636F696E732E0600646F6F726964020300000000E60409040701000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233734272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303230303020676F6C6420636F696E732E0600646F6F726964020100000000E8040A040701000000EB1A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233734272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303230303020676F6C6420636F696E732E0600646F6F726964020100000000EA040B040701000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233734272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303230303020676F6C6420636F696E732E0600646F6F726964020200000000EC040B040701000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233734272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303230303020676F6C6420636F696E732E0600646F6F726964020600000000E6040C040501000000711B00E5040E040701000000711B00E6040C040701000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233734272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303230303020676F6C6420636F696E732E0600646F6F726964020100000000E8040E040701000000711B00EC040C040701000000721B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(75, 0, _binary 0x08050A040701000000F41A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233735272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F7269640201000000000B050A040701000000721B0006050C040701000000731B0007050C040701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233735272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F7269640203000000000A050C040701000000711B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(76, 0, _binary 0x0B0502040501000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233736272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F726964020200000000080500040601000000721B00080502040601000000F41A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233736272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373530303020676F6C6420636F696E732E0600646F6F7269640204000000000D0501040501000000721B000D0502040601000000721B000B0505040601000000711B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(77, 0, _binary 0x0705F4030701000000721B000705F5030701000000F41A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233737272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F7269640202000000000B05F5030701000000721B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(78, 0, _binary 0x0705F7030701000000721B000B05F7030701000000721B000705F8030701000000F41A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233738272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313530303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(79, 0, _binary 0x0705FA030701000000721B000705FB030701000000F41A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233739272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320313430303020676F6C6420636F696E732E0600646F6F7269640204000000000B05FA030701000000721B000905FC030701000000711B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(80, 0, _binary 0xFF04EF030701000000711B000005EF030501000000711B000105EF030601000000711B000205EE030601000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233830272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313430303020676F6C6420636F696E732E0600646F6F7269640203000000000105ED030701000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233830272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313430303020676F6C6420636F696E732E0600646F6F7269640201000000000305EF030701000000EB1A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233830272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313430303020676F6C6420636F696E732E0600646F6F7269640201000000000705EF030701000000711B000805EF030601000000711B000905EE030601000000721B000905ED030701000000721B000305F1030701000000EB1A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233830272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313430303020676F6C6420636F696E732E0600646F6F7269640205000000000405F1030701000000711B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(81, 0, _binary 0xF404EC030701000000F41A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233831272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343030303020676F6C6420636F696E732E0600646F6F726964020100000000F604ED030701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233831272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343030303020676F6C6420636F696E732E0600646F6F726964020100000000F604EF030701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233831272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343030303020676F6C6420636F696E732E0600646F6F726964020300000000FA04ED030701000000721B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(82, 0, _binary 0xE304EE030601000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233832272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020300000000E204EE030701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233832272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020100000000E604EE030601000000721B00E704EF030701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233832272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320363830303020676F6C6420636F696E732E0600646F6F726964020500000000E804EF030701000000711B00EA04EE030701000000721B00E204F2030601000000711B00E204F2030701000000711B00E404F1030701000000721B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(83, 0, _binary 0xD404F2030701000000711B00D804F2030701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233833272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020100000000DB04F3030701000000721B00DD04F1030701000000721B00D804F5030701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233833272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020200000000D904F5030701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233833272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383030303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(84, 0, _binary 0xD504FB030701000000F41A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233834272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323030303020676F6C6420636F696E732E0600646F6F726964020100000000D204FD030701000000711B00D504FC030701000000721B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(85, 0, _binary 0xD80407040701000000F41A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233835272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333230303020676F6C6420636F696E732E0600646F6F726964020200000000DA0406040701000000721B00DA0407040701000000F41A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233835272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333230303020676F6C6420636F696E732E0600646F6F726964020200000000D6040A040701000000711B00D90409040701000000711B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(86, 0, _binary 0xE304FB030701000000EB1A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233836272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020100000000E604FB030501000000721B00E504FB030601000000EB1A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233836272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020400000000E704FB030701000000EB1A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233836272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020100000000E804FA030701000000721B00E604FD030501000000721B00E504FE030701000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233836272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020100000000E804FD030701000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233836272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020200000000EA04FF030701000000711B00EB04FD030701000000F41A8002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233836272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031303130303020676F6C6420636F696E732E0600646F6F726964020600000000EB04FE030701000000721B00E30400040701000000711B00E50400040601000000711B00E70400040701000000711B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(87, 0, _binary 0xF304F7030701000000EB1A8002000B006465736372697074696F6E015A00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233837272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320323830303020676F6C6420636F696E732E0600646F6F726964020300000000F504FB030701000000721B00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(88, 0, _binary 0x1E04DE030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E001E04DF030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E002204DE030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E002204DF030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E002204DE030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E002204DF030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E001F04E1030601000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233838272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033383130303020676F6C6420636F696E732E0600646F6F7269640201000000001F04E1030701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233838272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033383130303020676F6C6420636F696E732E0600646F6F7269640202000000001D04E5030701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233838272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033383130303020676F6C6420636F696E732E0600646F6F7269640202000000002104E2030501000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233838272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033383130303020676F6C6420636F696E732E0600646F6F7269640205000000002104E2030701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233838272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033383130303020676F6C6420636F696E732E0600646F6F7269640202000000002404E3030601000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233838272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033383130303020676F6C6420636F696E732E0600646F6F7269640201000000002504E7030601000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233838272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033383130303020676F6C6420636F696E732E0600646F6F7269640204000000002504E7030701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233838272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033383130303020676F6C6420636F696E732E0600646F6F726964020300000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(89, 0, _binary 0xBE0304040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00BE0305040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00BF030A0406010000002F1900C20306040501000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020900000000C20306040601000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020300000000C20306040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020400000000C80306040601000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020300000000C80306040701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020100000000C30309040601000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020600000000C40309040501000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020900000000C50308040501000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020900000000C40309040701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020100000000C8030A040601000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020500000000C8030A040701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020200000000CB0309040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C2027486F7573652047756C696420233839272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732034333130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(90, 0, _binary 0xB003E403060100000035138002000B006465736372697074696F6E015B00000049742062656C6F6E677320746F20686F75736520274D6F6465726E6F74732E657520233930272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032323730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(91, 0, _binary 0xE803B70307010000002E1900EB03B70307010000002E1900EE03B70307010000002E1900E203BA030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00E203BB030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00E303B90306010000002E1900E103BB0307010000002F1900E203BA030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00E203BB030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00E503B90306010000002E1900E603BB030601000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C202747756C696420486F75736520233931272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033333530303020676F6C6420636F696E732E0600646F6F726964020700000000E403B90307010000002E1900EF03BB0306010000006F188002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C202747756C696420486F75736520233931272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033333530303020676F6C6420636F696E732E0600646F6F726964020700000000E103BE0307010000002F1900E603BC030701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C202747756C696420486F75736520233931272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033333530303020676F6C6420636F696E732E0600646F6F726964020200000000EF03BC030701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C202747756C696420486F75736520233931272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033333530303020676F6C6420636F696E732E0600646F6F726964020400000000F303BA030601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F303BB030601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F103B90307010000002E1900F303B90307010000002E1900F303BA030701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00F303BB030701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00EB03C1030701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F2068616C6C202747756C696420486F75736520233931272E204E6F626F6479206F776E7320746869732068616C6C2E20497420636F7374732033333530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2060, 0, _binary 0x260257040501000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00260257040601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00280255040401000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00280256040401000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E002F0257040701000000E1048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027474D20486F757365203031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203133383730303020676F6C6420636F696E732E0600646F6F726964020400000000260258040501000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00260258040601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E002D025B040501000000E1048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027474D20486F757365203031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203133383730303020676F6C6420636F696E732E0600646F6F7269640207000000002E025E040701000000E4048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027474D20486F757365203031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203133383730303020676F6C6420636F696E732E0600646F6F7269640206000000003002520407010000001F0A1700000000003202520407010000001F0A1700000000003402520407010000001F0A1700000000003602520407010000001F0A170000000000380257040701000000E1048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027474D20486F757365203031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203133383730303020676F6C6420636F696E732E0600646F6F7269640202000000003C025B040501000000E1048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027474D20486F757365203031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203133383730303020676F6C6420636F696E732E0600646F6F72696402050000000039025E040701000000E4048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027474D20486F757365203031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203133383730303020676F6C6420636F696E732E0600646F6F7269640201000000002B0263040701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E002B0264040701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E003D0263040701000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00330264040701000000E4048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027474D20486F757365203031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203133383730303020676F6C6420636F696E732E0600646F6F726964020300000000340264040701000000E4048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027474D20486F757365203031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203133383730303020676F6C6420636F696E732E0600646F6F726964020300000000350264040701000000E4048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F7573652027474D20486F757365203031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F737473203133383730303020676F6C6420636F696E732E0600646F6F7269640203000000003D0264040701000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00400255040401000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00400256040401000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00400257040501000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00400257040601000000831E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00400258040501000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00400258040601000000841E8001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2061, 0, _binary 0x7D042A040701000000721B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233931272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F7269640203000000007E042E040701000000741B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233931272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F7269640202000000007F042C040701000000EB1A8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233931272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F7269640202000000007F042E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E007F042F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0087042E040701000000F71A8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233931272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020200000000800430040701000000731B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233931272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020200000000850430040701000000731B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233931272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373130303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2062, 0, _binary 0x95042F040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020400000000A2042A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00A2042B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00A6042C040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020500000000A6042F040701000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020500000000910432040602000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020300000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020300000000910432040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020100000000920431040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00920432040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00970432040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020400000000970431040701000000F71A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020200000000940434040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020400000000940434040701000000EE1A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F7269640201000000009B0434040701000000711B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F7269640201000000009E0434040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020100000000A10431040701000000F71A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233932272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031373730303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2063, 0, _binary 0x93042D040701000000F71A8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233933272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2064, 0, _binary 0xAF0425040701000000731B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343930303020676F6C6420636F696E732E0600646F6F726964020100000000AC0428040701000000741B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343930303020676F6C6420636F696E732E0600646F6F726964020100000000AC042A040701000000C3048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343930303020676F6C6420636F696E732E0600646F6F726964020100000000AC042B040701000000741B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233934272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2065, 0, _binary 0xAD0433040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00AD0434040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00AC0434040701000000C3048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020100000000AC0436040701000000741B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020100000000AD0436040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00AD0437040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00B20434040701000000741B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233935272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320393830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2066, 0, _binary 0x9F043F040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00A1043B040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233936272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313930303020676F6C6420636F696E732E0600646F6F726964020100000000A3043B040701000000EE1A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233936272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313930303020676F6C6420636F696E732E0600646F6F726964020100000000A6043B040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233936272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313930303020676F6C6420636F696E732E0600646F6F7269640201000000009F0440040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00A50441040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233936272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031313930303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2067, 0, _binary 0x98043B040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333330303020676F6C6420636F696E732E0600646F6F7269640201000000009A043B040701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333330303020676F6C6420636F696E732E0600646F6F7269640201000000009D043B040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333330303020676F6C6420636F696E732E0600646F6F726964020100000000970440040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00980440040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E009D0441040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F75736520233937272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732031333330303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2068, 0, _binary 0x91043B040601000000C5048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233938272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373830303020676F6C6420636F696E732E0600646F6F72696402020000000091043B040701000000C5048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233938272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320373830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2069, 0, _binary 0x7F0437040701000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E007E043B040701000000741B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020100000000800437040701000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00850436040701000000731B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020100000000800439040701000000731B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020100000000810438040701000000C3048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020100000000860438040701000000741B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F72696402010000000086043A040701000000C3048002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F72696402010000000082043E040701000000731B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F72696402010000000086043C040701000000741B8002000B006465736372697074696F6E015700000049742062656C6F6E677320746F20686F757365202756697020486F75736520233939272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320383130303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2070, 0, _binary 0x72043A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0072043B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0071043C040701000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313030272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F72696402010000000074043E040701000000711B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313030272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F72696402010000000076043E040701000000711B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313030272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F72696402010000000078043C040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313030272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2071, 0, _binary 0x720433040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00710434040701000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020200000000710435040701000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020200000000720434040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00780434040701000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020200000000780435040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020200000000780436040701000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313031272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2072, 0, _binary 0x73042B040701000000711B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313032272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F72696402010000000071042D040701000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313032272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F72696402010000000072042C040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0072042D040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0078042D040701000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313032272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F72696402010000000078042E040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313032272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F72696402010000000078042F040701000000721B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313032272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2073, 0, _binary 0x64042E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0064042F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00630430040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313033272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343030303020676F6C6420636F696E732E0600646F6F726964020100000000650432040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313033272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343030303020676F6C6420636F696E732E0600646F6F726964020100000000680432040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313033272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343030303020676F6C6420636F696E732E0600646F6F7269640201000000006A0430040701000000F71A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313033272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2074, 0, _binary 0x63042B040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313034272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020100000000640429040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0064042A040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006A042B040701000000F71A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313034272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2075, 0, _binary 0x640429040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0064042A040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006A042B040601000000F71A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313035272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343030303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2076, 0, _binary 0x64042E040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0064042F040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006A0430040601000000F71A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313036272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343830303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2077, 0, _binary 0x6D0422040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333630303020676F6C6420636F696E732E0600646F6F7269640201000000006E0422040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006E0423040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00750422040701000000F71A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313037272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2078, 0, _binary 0x6D041F040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333630303020676F6C6420636F696E732E0600646F6F7269640201000000006E041E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006E041F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0075041E040701000000F71A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313038272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2079, 0, _binary 0x6E041A040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006E041B040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006D041C040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343530303020676F6C6420636F696E732E0600646F6F726964020100000000700419040701000000EE1A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343530303020676F6C6420636F696E732E0600646F6F726964020100000000720419040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343530303020676F6C6420636F696E732E0600646F6F72696402010000000075041B040701000000F71A8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313039272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2080, 0, _binary 0x6E041A040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006E041B040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0075041B040601000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313130272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2081, 0, _binary 0x6E041E040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006E041F040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0075041F040601000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313131272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320333630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2082, 0, _binary 0x6E0422040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006E0423040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00750423040601000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313132272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320343530303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2083, 0, _binary 0x67040F040701000000721B8002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F7269640201000000006B040C040601000000711B8002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F7269640203000000006B040C040701000000711B8002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F7269640201000000006E040E040601000000721B8002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F72696402030000000072040F040701000000711B8002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F726964020200000000670412040701000000721B8002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F7269640201000000006E0412040601000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F7269640204000000006F0410040601000000E0068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E006E0412040701000000C3048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F7269640202000000006B0414040601000000711B8002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F726964020300000000690414040701000000711B8002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F7269640201000000006B0414040701000000C5048002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F726964020100000000700410040601000000E1068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00730410040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00730411040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00700414040701000000711B8002000B006465736372697074696F6E015900000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313133272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F7374732032313630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2084, 0, _binary 0x7C040F040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000007D040E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E007D040F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E007F040D040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000007C0412040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000007F0414040701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000820410040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000820411040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000820412040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313134272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2085, 0, _binary 0x87040E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0087040F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0089040D040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000860411040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000860412040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000890414040701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313135272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2086, 0, _binary 0x8E040E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E008E040F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0091040D040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F72696402010000000092040E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0092040F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00930411040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000930412040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000900414040701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000910414040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313136272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2087, 0, _binary 0x98040E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0098040F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E009A040D040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000009C040E040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E009C040F040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E009D040F040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000970410040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000970411040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000009D0412040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000009A0414040701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000009B0414040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313137272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2088, 0, _binary 0x7C040F040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000007D040E040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E007D040F040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E007F040D040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000007C0412040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000007E0414040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000820410040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000820411040601000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313138272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2089, 0, _binary 0x8A040D040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000008B040E040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E008B040F040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00860410040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000860411040601000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000860412040602000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000008A0414040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313139272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2090, 0, _binary 0x8D040F040602000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000008E040E040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E008E040F040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E0090040D040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F72696402010000000093040F040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000008D0412040602000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640201000000008F0414040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000930411040601000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000930412040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313230272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2091, 0, _binary 0x97040F040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640202000000009B040D040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640202000000009C040E040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E009C040F040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00970411040601000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020200000000970412040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640202000000009D0410040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640202000000009D0413040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F7269640202000000009B0414040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313231272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353630303020676F6C6420636F696E732E0600646F6F726964020200000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2092, 0, _binary 0xA1040E040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313232272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000A1040F040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313232272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000A4040C040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313232272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000A6040E040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313232272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2093, 0, _binary 0xA10412040701000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313233272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000A10413040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313233272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000A40410040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313233272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000A60412040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313233272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000A40414040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313233272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2094, 0, _binary 0xAC0419040701000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313234272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000AE041B040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313234272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000A9041E040701000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313234272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000AA041F040701000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00AA0420040701000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00AC0421040701000000C5048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313234272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000);
INSERT IGNORE INTO `house_data` (`house_id`, `world_id`, `data`) VALUES
	(2095, 0, _binary 0xAA041A040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00AA041B040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00AC0419040602000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000A9041C040602000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000A9041F040602000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000AA041F040601000000DA068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00AE041C040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000AE041F040601000000C3048002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000AA0420040601000000DB068001000B006465736372697074696F6E01190000004E6F626F647920697320736C656570696E672074686572652E00AD0421040601000000731B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000AE0420040601000000741B8002000B006465736372697074696F6E015800000049742062656C6F6E677320746F20686F757365202756697020486F7573652023313235272E204E6F626F6479206F776E73207468697320686F7573652E20497420636F73747320353430303020676F6C6420636F696E732E0600646F6F726964020100000000);
/*!40000 ALTER TABLE `house_data` ENABLE KEYS */;

-- Dumping structure for table ots.house_lists
CREATE TABLE IF NOT EXISTS `house_lists` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`),
  CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.house_lists: ~0 rows (approximately)
/*!40000 ALTER TABLE `house_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_lists` ENABLE KEYS */;

-- Dumping structure for table ots.killers
CREATE TABLE IF NOT EXISTS `killers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `unjustified` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `death_id` (`death_id`),
  CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.killers: ~0 rows (approximately)
/*!40000 ALTER TABLE `killers` DISABLE KEYS */;
/*!40000 ALTER TABLE `killers` ENABLE KEYS */;

-- Dumping structure for table ots.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` int(11) NOT NULL DEFAULT 0,
  `soul` int(10) unsigned NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT 0,
  `lastip` int(10) unsigned NOT NULL DEFAULT 0,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `skull` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `skulltime` int(11) NOT NULL DEFAULT 0,
  `rank_id` int(11) NOT NULL DEFAULT 0,
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT 0,
  `blessings` tinyint(2) NOT NULL DEFAULT 0,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `stamina` bigint(20) NOT NULL DEFAULT 151200000 COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT 2,
  `loss_experience` int(11) NOT NULL DEFAULT 100,
  `loss_mana` int(11) NOT NULL DEFAULT 100,
  `loss_skills` int(11) NOT NULL DEFAULT 100,
  `loss_containers` int(11) NOT NULL DEFAULT 100,
  `loss_items` int(11) NOT NULL DEFAULT 100,
  `premend` int(11) NOT NULL DEFAULT 0 COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT 0,
  `marriage` int(10) unsigned NOT NULL DEFAULT 0,
  `promotion` int(11) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`),
  KEY `account_id` (`account_id`),
  KEY `group_id` (`group_id`),
  KEY `online` (`online`),
  KEY `deleted` (`deleted`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.players: ~0 rows (approximately)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT IGNORE INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `promotion`, `deleted`, `description`) VALUES
	(1, 'Account Manager', 0, 1, 1, 1, 0, 150, 150, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 95, 117, 7, _binary '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '');
INSERT IGNORE INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `promotion`, `deleted`, `description`) VALUES
	(2, 'God', 0, 6, 1, 14, 0, 215, 215, 30000, 0, 0, 0, 0, 302, 0, 0, 65, 65, 0, 0, 0, 999, 997, 7, _binary '', 65, 0, 1596663037, 22915264, 1, 0, 0, 0, '', 1596661230, 0, 0, 151200000, 1, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for table ots.player_deaths
CREATE TABLE IF NOT EXISTS `player_deaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.player_deaths: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_deaths` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_deaths` ENABLE KEYS */;

-- Dumping structure for table ots.player_depotitems
CREATE TABLE IF NOT EXISTS `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.player_depotitems: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_depotitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_depotitems` ENABLE KEYS */;

-- Dumping structure for table ots.player_items
CREATE TABLE IF NOT EXISTS `player_items` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.player_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_items` ENABLE KEYS */;

-- Dumping structure for table ots.player_killers
CREATE TABLE IF NOT EXISTS `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  KEY `kill_id` (`kill_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.player_killers: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_killers` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_killers` ENABLE KEYS */;

-- Dumping structure for table ots.player_namelocks
CREATE TABLE IF NOT EXISTS `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT 0,
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.player_namelocks: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_namelocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_namelocks` ENABLE KEYS */;

-- Dumping structure for table ots.player_skills
CREATE TABLE IF NOT EXISTS `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `skillid` tinyint(2) NOT NULL DEFAULT 0,
  `value` int(10) unsigned NOT NULL DEFAULT 0,
  `count` int(10) unsigned NOT NULL DEFAULT 0,
  UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.player_skills: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_skills` DISABLE KEYS */;
INSERT IGNORE INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
	(2, 0, 20, 278);
INSERT IGNORE INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
	(2, 1, 10, 0);
INSERT IGNORE INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
	(2, 2, 14, 0);
INSERT IGNORE INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
	(2, 3, 10, 0);
INSERT IGNORE INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
	(2, 4, 10, 0);
INSERT IGNORE INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
	(2, 5, 10, 0);
INSERT IGNORE INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
	(2, 6, 10, 0);
/*!40000 ALTER TABLE `player_skills` ENABLE KEYS */;

-- Dumping structure for table ots.player_spells
CREATE TABLE IF NOT EXISTS `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`name`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.player_spells: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_spells` ENABLE KEYS */;

-- Dumping structure for table ots.player_storage
CREATE TABLE IF NOT EXISTS `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) unsigned NOT NULL DEFAULT 0,
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`key`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.player_storage: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_storage` DISABLE KEYS */;
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 13540, '1599253132');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42300, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42301, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42302, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42303, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42304, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42305, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42306, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42307, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42308, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42309, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42310, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42311, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42312, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42313, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42314, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42315, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42316, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42317, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42318, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42319, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42320, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42321, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42322, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42323, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42324, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42325, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42326, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42327, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42328, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42329, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42350, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42352, '0');
INSERT IGNORE INTO `player_storage` (`player_id`, `key`, `value`) VALUES
	(2, 42355, '0');
/*!40000 ALTER TABLE `player_storage` ENABLE KEYS */;

-- Dumping structure for table ots.player_viplist
CREATE TABLE IF NOT EXISTS `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  KEY `player_id` (`player_id`),
  KEY `vip_id` (`vip_id`),
  CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.player_viplist: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_viplist` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_viplist` ENABLE KEYS */;

-- Dumping structure for table ots.server_config
CREATE TABLE IF NOT EXISTS `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` int(11) NOT NULL,
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.server_config: ~2 rows (approximately)
/*!40000 ALTER TABLE `server_config` DISABLE KEYS */;
INSERT IGNORE INTO `server_config` (`config`, `value`) VALUES
	('db_version', 23);
INSERT IGNORE INTO `server_config` (`config`, `value`) VALUES
	('encryption', 2);
/*!40000 ALTER TABLE `server_config` ENABLE KEYS */;

-- Dumping structure for table ots.server_motd
CREATE TABLE IF NOT EXISTS `server_motd` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.server_motd: ~1 rows (approximately)
/*!40000 ALTER TABLE `server_motd` DISABLE KEYS */;
INSERT IGNORE INTO `server_motd` (`id`, `world_id`, `text`) VALUES
	(1, 0, 'Welcome to The Forgotten Server!');
INSERT IGNORE INTO `server_motd` (`id`, `world_id`, `text`) VALUES
	(2, 0, 'Welcome to ModernOts Evo 8.60');
/*!40000 ALTER TABLE `server_motd` ENABLE KEYS */;

-- Dumping structure for table ots.server_record
CREATE TABLE IF NOT EXISTS `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `timestamp` bigint(20) NOT NULL,
  UNIQUE KEY `record` (`record`,`world_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.server_record: ~1 rows (approximately)
/*!40000 ALTER TABLE `server_record` DISABLE KEYS */;
INSERT IGNORE INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
	(0, 0, 0);
INSERT IGNORE INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
	(1, 0, 1596662166);
/*!40000 ALTER TABLE `server_record` ENABLE KEYS */;

-- Dumping structure for table ots.server_reports
CREATE TABLE IF NOT EXISTS `server_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 1,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `timestamp` bigint(20) NOT NULL DEFAULT 0,
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `world_id` (`world_id`),
  KEY `reads` (`reads`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.server_reports: ~0 rows (approximately)
/*!40000 ALTER TABLE `server_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `server_reports` ENABLE KEYS */;

-- Dumping structure for table ots.tiles
CREATE TABLE IF NOT EXISTS `tiles` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `house_id` int(10) unsigned NOT NULL,
  `x` int(5) unsigned NOT NULL,
  `y` int(5) unsigned NOT NULL,
  `z` tinyint(2) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`),
  KEY `x` (`x`,`y`,`z`),
  KEY `house_id` (`house_id`,`world_id`),
  CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.tiles: ~0 rows (approximately)
/*!40000 ALTER TABLE `tiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiles` ENABLE KEYS */;

-- Dumping structure for table ots.tile_items
CREATE TABLE IF NOT EXISTS `tile_items` (
  `tile_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  KEY `sid` (`sid`),
  CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ots.tile_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `tile_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tile_items` ENABLE KEYS */;

-- Dumping structure for trigger ots.oncreate_guilds
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `oncreate_guilds`
AFTER INSERT
ON `guilds`
FOR EACH ROW
BEGIN
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ots.oncreate_players
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `oncreate_players`
AFTER INSERT
ON `players`
FOR EACH ROW
BEGIN
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ots.ondelete_accounts
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ondelete_accounts`
BEFORE DELETE
ON `accounts`
FOR EACH ROW
BEGIN
	DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ots.ondelete_guilds
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ondelete_guilds`
BEFORE DELETE
ON `guilds`
FOR EACH ROW
BEGIN
	UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger ots.ondelete_players
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `ondelete_players`
BEFORE DELETE
ON `players`
FOR EACH ROW
BEGIN
	DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
	UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
