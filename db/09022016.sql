-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.32 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for ads
CREATE DATABASE IF NOT EXISTS `ads` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ads`;


-- Dumping structure for table ads.oc_t_admin
CREATE TABLE IF NOT EXISTS `oc_t_admin` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(40) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_moderator` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pk_i_id`),
  UNIQUE KEY `s_username` (`s_username`),
  UNIQUE KEY `s_email` (`s_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_admin: ~1 rows (approximately)
DELETE FROM `oc_t_admin`;
/*!40000 ALTER TABLE `oc_t_admin` DISABLE KEYS */;
INSERT INTO `oc_t_admin` (`pk_i_id`, `s_name`, `s_username`, `s_password`, `s_email`, `s_secret`, `b_moderator`) VALUES
	(1, 'Administrator', 'admin', '$2y$15$ntvRBcedNNSLE1kZ6NVXy.Vy4fTpm1U3o0qQeB1oGZnUBkoOCeRFe', 'info@digitalsense.in', NULL, 0);
/*!40000 ALTER TABLE `oc_t_admin` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_alerts
CREATE TABLE IF NOT EXISTS `oc_t_alerts` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_email` varchar(100) DEFAULT NULL,
  `fk_i_user_id` int(10) unsigned DEFAULT NULL,
  `s_search` longtext,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `dt_date` datetime DEFAULT NULL,
  `dt_unsub_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_alerts: ~0 rows (approximately)
DELETE FROM `oc_t_alerts`;
/*!40000 ALTER TABLE `oc_t_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_alerts` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_alerts_sent
CREATE TABLE IF NOT EXISTS `oc_t_alerts_sent` (
  `d_date` date NOT NULL,
  `i_num_alerts_sent` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`d_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_alerts_sent: ~0 rows (approximately)
DELETE FROM `oc_t_alerts_sent`;
/*!40000 ALTER TABLE `oc_t_alerts_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_alerts_sent` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_ban_rule
CREATE TABLE IF NOT EXISTS `oc_t_ban_rule` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(250) NOT NULL DEFAULT '',
  `s_ip` varchar(50) NOT NULL DEFAULT '',
  `s_email` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_ban_rule: ~0 rows (approximately)
DELETE FROM `oc_t_ban_rule`;
/*!40000 ALTER TABLE `oc_t_ban_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_ban_rule` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_category
CREATE TABLE IF NOT EXISTS `oc_t_category` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_parent_id` int(10) unsigned DEFAULT NULL,
  `i_expiration_days` int(3) unsigned NOT NULL DEFAULT '0',
  `i_position` int(2) unsigned NOT NULL DEFAULT '0',
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_price_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `s_icon` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_parent_id` (`fk_i_parent_id`),
  KEY `i_position` (`i_position`),
  CONSTRAINT `oc_t_category_ibfk_1` FOREIGN KEY (`fk_i_parent_id`) REFERENCES `oc_t_category` (`pk_i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_category: ~95 rows (approximately)
DELETE FROM `oc_t_category`;
/*!40000 ALTER TABLE `oc_t_category` DISABLE KEYS */;
INSERT INTO `oc_t_category` (`pk_i_id`, `fk_i_parent_id`, `i_expiration_days`, `i_position`, `b_enabled`, `b_price_enabled`, `s_icon`) VALUES
	(1, NULL, 0, 1, 1, 1, NULL),
	(2, NULL, 0, 2, 1, 1, NULL),
	(3, NULL, 0, 3, 1, 1, NULL),
	(4, NULL, 0, 4, 1, 1, NULL),
	(5, NULL, 0, 5, 1, 1, NULL),
	(6, NULL, 0, 6, 1, 1, NULL),
	(7, NULL, 0, 7, 1, 1, NULL),
	(8, NULL, 0, 8, 1, 1, NULL),
	(9, 1, 0, 1, 1, 1, NULL),
	(10, 1, 0, 2, 1, 1, NULL),
	(11, 1, 0, 3, 1, 1, NULL),
	(12, 1, 0, 4, 1, 1, NULL),
	(13, 1, 0, 5, 1, 1, NULL),
	(14, 1, 0, 6, 1, 1, NULL),
	(15, 1, 0, 7, 1, 1, NULL),
	(16, 1, 0, 8, 1, 1, NULL),
	(17, 1, 0, 9, 1, 1, NULL),
	(18, 1, 0, 10, 1, 1, NULL),
	(19, 1, 0, 11, 1, 1, NULL),
	(20, 1, 0, 12, 1, 1, NULL),
	(21, 1, 0, 13, 1, 1, NULL),
	(22, 1, 0, 14, 1, 1, NULL),
	(23, 1, 0, 15, 1, 1, NULL),
	(24, 1, 0, 16, 1, 1, NULL),
	(25, 1, 0, 17, 1, 1, NULL),
	(26, 1, 0, 18, 1, 1, NULL),
	(27, 1, 0, 19, 1, 1, NULL),
	(28, 1, 0, 20, 1, 1, NULL),
	(29, 1, 0, 21, 1, 1, NULL),
	(30, 1, 0, 22, 1, 1, NULL),
	(31, 2, 0, 1, 1, 1, NULL),
	(32, 2, 0, 2, 1, 1, NULL),
	(33, 2, 0, 3, 1, 1, NULL),
	(34, 2, 0, 4, 1, 1, NULL),
	(35, 2, 0, 5, 1, 1, NULL),
	(36, 2, 0, 6, 1, 1, NULL),
	(37, 2, 0, 7, 1, 1, NULL),
	(38, 3, 0, 1, 1, 1, NULL),
	(39, 3, 0, 2, 1, 1, NULL),
	(40, 3, 0, 3, 1, 1, NULL),
	(41, 3, 0, 4, 1, 1, NULL),
	(42, 3, 0, 5, 1, 1, NULL),
	(43, 4, 0, 1, 1, 1, NULL),
	(44, 4, 0, 2, 1, 1, NULL),
	(45, 4, 0, 3, 1, 1, NULL),
	(46, 4, 0, 4, 1, 1, NULL),
	(47, 4, 0, 5, 1, 1, NULL),
	(48, 4, 0, 6, 1, 1, NULL),
	(49, 4, 0, 7, 1, 1, NULL),
	(50, 4, 0, 8, 1, 1, NULL),
	(51, 4, 0, 9, 1, 1, NULL),
	(52, 5, 0, 1, 1, 1, NULL),
	(53, 5, 0, 2, 1, 1, NULL),
	(54, 5, 0, 3, 1, 1, NULL),
	(55, 5, 0, 4, 1, 1, NULL),
	(56, 5, 0, 5, 1, 1, NULL),
	(57, 5, 0, 6, 1, 1, NULL),
	(58, 5, 0, 7, 1, 1, NULL),
	(59, 5, 0, 8, 1, 1, NULL),
	(60, 5, 0, 9, 1, 1, NULL),
	(61, 5, 0, 10, 1, 1, NULL),
	(62, 5, 0, 11, 1, 1, NULL),
	(63, 6, 0, 1, 1, 1, NULL),
	(64, 6, 0, 2, 1, 1, NULL),
	(65, 6, 0, 3, 1, 1, NULL),
	(66, 6, 0, 4, 1, 1, NULL),
	(67, 6, 0, 5, 1, 1, NULL),
	(68, 6, 0, 6, 1, 1, NULL),
	(69, 7, 0, 1, 1, 1, NULL),
	(70, 7, 0, 2, 1, 1, NULL),
	(71, 7, 0, 3, 1, 1, NULL),
	(72, 7, 0, 4, 1, 1, NULL),
	(73, 7, 0, 5, 1, 1, NULL),
	(74, 7, 0, 6, 1, 1, NULL),
	(75, 8, 0, 1, 1, 1, NULL),
	(76, 8, 0, 2, 1, 1, NULL),
	(77, 8, 0, 3, 1, 1, NULL),
	(78, 8, 0, 4, 1, 1, NULL),
	(79, 8, 0, 5, 1, 1, NULL),
	(80, 8, 0, 6, 1, 1, NULL),
	(81, 8, 0, 7, 1, 1, NULL),
	(82, 8, 0, 8, 1, 1, NULL),
	(83, 8, 0, 9, 1, 1, NULL),
	(84, 8, 0, 10, 1, 1, NULL),
	(85, 8, 0, 11, 1, 1, NULL),
	(86, 8, 0, 12, 1, 1, NULL),
	(87, 8, 0, 13, 1, 1, NULL),
	(88, 8, 0, 14, 1, 1, NULL),
	(89, 8, 0, 15, 1, 1, NULL),
	(90, 8, 0, 16, 1, 1, NULL),
	(91, 8, 0, 17, 1, 1, NULL),
	(92, 8, 0, 18, 1, 1, NULL),
	(93, 8, 0, 19, 1, 1, NULL),
	(94, 8, 0, 20, 1, 1, NULL),
	(95, 8, 0, 21, 1, 1, NULL);
/*!40000 ALTER TABLE `oc_t_category` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_category_description
CREATE TABLE IF NOT EXISTS `oc_t_category_description` (
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  `s_description` text,
  `s_slug` varchar(100) NOT NULL,
  PRIMARY KEY (`fk_i_category_id`,`fk_c_locale_code`),
  KEY `idx_s_slug` (`s_slug`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`),
  CONSTRAINT `oc_t_category_description_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  CONSTRAINT `oc_t_category_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_category_description: ~95 rows (approximately)
DELETE FROM `oc_t_category_description`;
/*!40000 ALTER TABLE `oc_t_category_description` DISABLE KEYS */;
INSERT INTO `oc_t_category_description` (`fk_i_category_id`, `fk_c_locale_code`, `s_name`, `s_description`, `s_slug`) VALUES
	(1, 'en_US', 'For sale', NULL, 'for-sale'),
	(2, 'en_US', 'Vehicles', NULL, 'vehicles'),
	(3, 'en_US', 'Classes', NULL, 'classes'),
	(4, 'en_US', 'Real estate', NULL, 'real-estate'),
	(5, 'en_US', 'Services', NULL, 'services'),
	(6, 'en_US', 'Community', NULL, 'community'),
	(7, 'en_US', 'Personals', NULL, 'personals'),
	(8, 'en_US', 'Jobs', NULL, 'jobs'),
	(9, 'en_US', 'Animals', NULL, 'animals'),
	(10, 'en_US', 'Art - Collectibles', NULL, 'art-collectibles'),
	(11, 'en_US', 'Barter', NULL, 'barter'),
	(12, 'en_US', 'Books - Magazines', NULL, 'books-magazines'),
	(13, 'en_US', 'Cameras - Camera Accessories', NULL, 'cameras-camera-accessories'),
	(14, 'en_US', 'CDs - Records', NULL, 'cds-records'),
	(15, 'en_US', 'Cell Phones - Accessories', NULL, 'cell-phones-accessories'),
	(16, 'en_US', 'Clothing', NULL, 'clothing'),
	(17, 'en_US', 'Computers - Hardware', NULL, 'computers-hardware'),
	(18, 'en_US', 'DVD', NULL, 'dvd'),
	(19, 'en_US', 'Electronics', NULL, 'electronics'),
	(20, 'en_US', 'For Babies - Infants', NULL, 'for-babies-infants'),
	(21, 'en_US', 'Garage Sale', NULL, 'garage-sale'),
	(22, 'en_US', 'Health - Beauty', NULL, 'health-beauty'),
	(23, 'en_US', 'Home - Furniture - Garden Supplies', NULL, 'home-furniture-garden-supplies'),
	(24, 'en_US', 'Jewelry - Watches', NULL, 'jewelry-watches'),
	(25, 'en_US', 'Musical Instruments', NULL, 'musical-instruments'),
	(26, 'en_US', 'Sporting Goods - Bicycles', NULL, 'sporting-goods-bicycles'),
	(27, 'en_US', 'Tickets', NULL, 'tickets'),
	(28, 'en_US', 'Toys - Games - Hobbies', NULL, 'toys-games-hobbies'),
	(29, 'en_US', 'Video Games - Consoles', NULL, 'video-games-consoles'),
	(30, 'en_US', 'Everything Else', NULL, 'everything-else'),
	(31, 'en_US', 'Cars', NULL, 'cars'),
	(32, 'en_US', 'Car Parts', NULL, 'car-parts'),
	(33, 'en_US', 'Motorcycles', NULL, 'motorcycles'),
	(34, 'en_US', 'Boats - Ships', NULL, 'boats-ships'),
	(35, 'en_US', 'RVs - Campers - Caravans', NULL, 'rvs-campers-caravans'),
	(36, 'en_US', 'Trucks - Commercial Vehicles', NULL, 'trucks-commercial-vehicles'),
	(37, 'en_US', 'Other Vehicles', NULL, 'other-vehicles'),
	(38, 'en_US', 'Computer - Multimedia Classes', NULL, 'computer-multimedia-classes'),
	(39, 'en_US', 'Language Classes', NULL, 'language-classes'),
	(40, 'en_US', 'Music - Theatre - Dance Classes', NULL, 'music-theatre-dance-classes'),
	(41, 'en_US', 'Tutoring - Private Lessons', NULL, 'tutoring-private-lessons'),
	(42, 'en_US', 'Other Classes', NULL, 'other-classes'),
	(43, 'en_US', 'Houses - Apartments for Sale', NULL, 'houses-apartments-for-sale'),
	(44, 'en_US', 'Houses - Apartments for Rent', NULL, 'houses-apartments-for-rent'),
	(45, 'en_US', 'Rooms for Rent - Shared', NULL, 'rooms-for-rent-shared'),
	(46, 'en_US', 'Housing Swap', NULL, 'housing-swap'),
	(47, 'en_US', 'Vacation Rentals', NULL, 'vacation-rentals'),
	(48, 'en_US', 'Parking Spots', NULL, 'parking-spots'),
	(49, 'en_US', 'Land', NULL, 'land'),
	(50, 'en_US', 'Office - Commercial Space', NULL, 'office-commercial-space'),
	(51, 'en_US', 'Shops for Rent - Sale', NULL, 'shops-for-rent-sale'),
	(52, 'en_US', 'Babysitter - Nanny', NULL, 'babysitter-nanny'),
	(53, 'en_US', 'Casting - Auditions', NULL, 'casting-auditions'),
	(54, 'en_US', 'Computer', NULL, 'computer'),
	(55, 'en_US', 'Event Services', NULL, 'event-services'),
	(56, 'en_US', 'Health - Beauty - Fitness', NULL, 'health-beauty-fitness'),
	(57, 'en_US', 'Horoscopes - Tarot', NULL, 'horoscopes-tarot'),
	(58, 'en_US', 'Household - Domestic Help', NULL, 'household-domestic-help'),
	(59, 'en_US', 'Moving - Storage', NULL, 'moving-storage'),
	(60, 'en_US', 'Repair', NULL, 'repair'),
	(61, 'en_US', 'Writing - Editing - Translating', NULL, 'writing-editing-translating'),
	(62, 'en_US', 'Other Services', NULL, 'other-services'),
	(63, 'en_US', 'Carpool', NULL, 'carpool'),
	(64, 'en_US', 'Community Activities', NULL, 'community-activities'),
	(65, 'en_US', 'Events', NULL, 'events'),
	(66, 'en_US', 'Musicians - Artists - Bands', NULL, 'musicians-artists-bands'),
	(67, 'en_US', 'Volunteers', NULL, 'volunteers'),
	(68, 'en_US', 'Lost And Found', NULL, 'lost-and-found'),
	(69, 'en_US', 'Women looking for Men', NULL, 'women-looking-for-men'),
	(70, 'en_US', 'Men looking for Women', NULL, 'men-looking-for-women'),
	(71, 'en_US', 'Men looking for Men', NULL, 'men-looking-for-men'),
	(72, 'en_US', 'Women looking for Women', NULL, 'women-looking-for-women'),
	(73, 'en_US', 'Friendship - Activity Partners', NULL, 'friendship-activity-partners'),
	(74, 'en_US', 'Missed Connections', NULL, 'missed-connections'),
	(75, 'en_US', 'Accounting - Finance', NULL, 'accounting-finance'),
	(76, 'en_US', 'Advertising - Public Relations', NULL, 'advertising-public-relations'),
	(77, 'en_US', 'Arts - Entertainment - Publishing', NULL, 'arts-entertainment-publishing'),
	(78, 'en_US', 'Clerical - Administrative', NULL, 'clerical-administrative'),
	(79, 'en_US', 'Customer Service', NULL, 'customer-service'),
	(80, 'en_US', 'Education - Training', NULL, 'education-training'),
	(81, 'en_US', 'Engineering - Architecture', NULL, 'engineering-architecture'),
	(82, 'en_US', 'Healthcare', NULL, 'healthcare'),
	(83, 'en_US', 'Human Resource', NULL, 'human-resource'),
	(84, 'en_US', 'Internet', NULL, 'internet'),
	(85, 'en_US', 'Legal', NULL, 'legal'),
	(86, 'en_US', 'Manual Labor', NULL, 'manual-labor'),
	(87, 'en_US', 'Manufacturing - Operations', NULL, 'manufacturing-operations'),
	(88, 'en_US', 'Marketing', NULL, 'marketing'),
	(89, 'en_US', 'Non-profit - Volunteer', NULL, 'non-profit-volunteer'),
	(90, 'en_US', 'Real Estate', NULL, 'real-estate_1'),
	(91, 'en_US', 'Restaurant - Food Service', NULL, 'restaurant-food-service'),
	(92, 'en_US', 'Retail', NULL, 'retail'),
	(93, 'en_US', 'Sales', NULL, 'sales'),
	(94, 'en_US', 'Technology', NULL, 'technology'),
	(95, 'en_US', 'Other Jobs', NULL, 'other-jobs');
/*!40000 ALTER TABLE `oc_t_category_description` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_category_stats
CREATE TABLE IF NOT EXISTS `oc_t_category_stats` (
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_i_category_id`),
  CONSTRAINT `oc_t_category_stats_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_category_stats: ~95 rows (approximately)
DELETE FROM `oc_t_category_stats`;
/*!40000 ALTER TABLE `oc_t_category_stats` DISABLE KEYS */;
INSERT INTO `oc_t_category_stats` (`fk_i_category_id`, `i_num_items`) VALUES
	(1, 1),
	(2, 0),
	(3, 0),
	(4, 0),
	(5, 0),
	(6, 0),
	(7, 0),
	(8, 0),
	(9, 1),
	(10, 0),
	(11, 0),
	(12, 0),
	(13, 0),
	(14, 0),
	(15, 0),
	(16, 0),
	(17, 0),
	(18, 0),
	(19, 0),
	(20, 0),
	(21, 0),
	(22, 0),
	(23, 0),
	(24, 0),
	(25, 0),
	(26, 0),
	(27, 0),
	(28, 0),
	(29, 0),
	(30, 0),
	(31, 0),
	(32, 0),
	(33, 0),
	(34, 0),
	(35, 0),
	(36, 0),
	(37, 0),
	(38, 0),
	(39, 0),
	(40, 0),
	(41, 0),
	(42, 0),
	(43, 0),
	(44, 0),
	(45, 0),
	(46, 0),
	(47, 0),
	(48, 0),
	(49, 0),
	(50, 0),
	(51, 0),
	(52, 0),
	(53, 0),
	(54, 0),
	(55, 0),
	(56, 0),
	(57, 0),
	(58, 0),
	(59, 0),
	(60, 0),
	(61, 0),
	(62, 0),
	(63, 0),
	(64, 0),
	(65, 0),
	(66, 0),
	(67, 0),
	(68, 0),
	(69, 0),
	(70, 0),
	(71, 0),
	(72, 0),
	(73, 0),
	(74, 0),
	(75, 0),
	(76, 0),
	(77, 0),
	(78, 0),
	(79, 0),
	(80, 0),
	(81, 0),
	(82, 0),
	(83, 0),
	(84, 0),
	(85, 0),
	(86, 0),
	(87, 0),
	(88, 0),
	(89, 0),
	(90, 0),
	(91, 0),
	(92, 0),
	(93, 0),
	(94, 0),
	(95, 0);
/*!40000 ALTER TABLE `oc_t_category_stats` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_city
CREATE TABLE IF NOT EXISTS `oc_t_city` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_region_id` int(10) unsigned NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `fk_c_country_code` char(2) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_region_id` (`fk_i_region_id`),
  KEY `idx_s_name` (`s_name`),
  KEY `idx_s_slug` (`s_slug`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  CONSTRAINT `oc_t_city_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  CONSTRAINT `oc_t_city_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30885 DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_city: ~277 rows (approximately)
DELETE FROM `oc_t_city`;
/*!40000 ALTER TABLE `oc_t_city` DISABLE KEYS */;
INSERT INTO `oc_t_city` (`pk_i_id`, `fk_i_region_id`, `s_name`, `s_slug`, `fk_c_country_code`, `b_active`) VALUES
	(30582, 706634, 'Arizona', 'arizona', 'hn', 1),
	(30583, 706634, 'El Porvenir', 'el-porvenir', 'hn', 1),
	(30584, 706634, 'Esparta', 'esparta', 'hn', 1),
	(30585, 706634, 'Jutiapa', 'jutiapa', 'hn', 1),
	(30586, 706634, 'La Ceiba', 'la-ceiba', 'hn', 1),
	(30587, 706634, 'La Masica', 'la-masica', 'hn', 1),
	(30588, 706634, 'San Francisco', 'san-francisco', 'hn', 1),
	(30589, 706634, 'Tela', 'tela', 'hn', 1),
	(30590, 706635, 'Apacilagua', 'apacilagua', 'hn', 1),
	(30591, 706635, 'Choluteca', 'choluteca', 'hn', 1),
	(30592, 706635, 'Concepción de María', 'concepcion-de-maria', 'hn', 1),
	(30593, 706635, 'Duyure', 'duyure', 'hn', 1),
	(30594, 706635, 'El Corpus', 'el-corpus', 'hn', 1),
	(30595, 706635, 'El Triunfo', 'el-triunfo', 'hn', 1),
	(30596, 706635, 'Marcovia', 'marcovia', 'hn', 1),
	(30597, 706635, 'Morolica', 'morolica', 'hn', 1),
	(30598, 706635, 'Namasigue', 'namasigue', 'hn', 1),
	(30599, 706635, 'Orocuina', 'orocuina', 'hn', 1),
	(30600, 706635, 'Pespire', 'pespire', 'hn', 1),
	(30601, 706635, 'San Antonio de Flores', 'san-antonio-de-flores', 'hn', 1),
	(30602, 706635, 'San Isidro', 'san-isidro', 'hn', 1),
	(30603, 706635, 'San José', 'san-jose', 'hn', 1),
	(30604, 706635, 'San Marcos de Colón', 'san-marcos-de-colon', 'hn', 1),
	(30605, 706635, 'Santa Ana de Yusguare', 'santa-ana-de-yusguare', 'hn', 1),
	(30606, 716646, 'Balfate', 'balfate', 'hn', 1),
	(30607, 716646, 'Bonito Oriental', 'bonito-oriental', 'hn', 1),
	(30608, 716646, 'Iriona', 'iriona', 'hn', 1),
	(30609, 716646, 'Limón', 'limon', 'hn', 1),
	(30610, 716646, 'Sabá', 'saba', 'hn', 1),
	(30611, 716646, 'Santa Fé', 'santa-fe', 'hn', 1),
	(30612, 716646, 'Santa Rosa de Aguán', 'santa-rosa-de-aguan', 'hn', 1),
	(30613, 716646, 'Sonaguera', 'sonaguera', 'hn', 1),
	(30614, 716646, 'Tocoa', 'tocoa', 'hn', 1),
	(30615, 716646, 'Trujillo', 'trujillo', 'hn', 1),
	(30616, 716646, 'Colón', 'colon', 'hn', 1),
	(30617, 716646, 'Chagres', 'chagres', 'hn', 1),
	(30618, 716646, 'Donoso', 'donoso', 'hn', 1),
	(30619, 716646, 'Portobelo', 'portobelo', 'hn', 1),
	(30620, 716646, 'Santa Isabel', 'santa-isabel', 'hn', 1),
	(30621, 706637, 'Ajuterique', 'ajuterique', 'hn', 1),
	(30622, 706637, 'Comayagua', 'comayagua', 'hn', 1),
	(30623, 706637, 'El Rosario', 'el-rosario', 'hn', 1),
	(30624, 706637, 'Esquías', 'esquias', 'hn', 1),
	(30625, 706637, 'Humuya', 'humuya', 'hn', 1),
	(30626, 706637, 'La Libertad', 'la-libertad', 'hn', 1),
	(30627, 706637, 'Lamaní', 'lamani', 'hn', 1),
	(30628, 706637, 'Las Lajas', 'las-lajas', 'hn', 1),
	(30629, 706637, 'La Trinidad', 'la-trinidad', 'hn', 1),
	(30630, 706637, 'Lejamaní', 'lejamani', 'hn', 1),
	(30631, 706637, 'Meámbar', 'meambar', 'hn', 1),
	(30632, 706637, 'Minas de Oro', 'minas-de-oro', 'hn', 1),
	(30633, 706637, 'Ojo de Agua', 'ojo-de-agua', 'hn', 1),
	(30634, 706637, 'San Jerónimo', 'san-jeronimo', 'hn', 1),
	(30635, 706637, 'San José de Comayagua', 'san-jose-de-comayagua', 'hn', 1),
	(30636, 706637, 'San José del Potrero', 'san-jose-del-potrero', 'hn', 1),
	(30637, 706637, 'San Luis', 'san-luis', 'hn', 1),
	(30638, 706637, 'San Sebastián', 'san-sebastian', 'hn', 1),
	(30639, 706637, 'Siguatepeque', 'siguatepeque', 'hn', 1),
	(30640, 706637, 'Taulabe', 'taulabe', 'hn', 1),
	(30641, 706637, 'Villa de San Antonio', 'villa-de-san-antonio', 'hn', 1),
	(30642, 706638, 'Cabañas', 'cabanas', 'hn', 1),
	(30643, 706638, 'Concepción', 'concepcion', 'hn', 1),
	(30644, 706638, 'Copán Ruinas', 'copan-ruinas', 'hn', 1),
	(30645, 706638, 'Corquín', 'corquin', 'hn', 1),
	(30646, 706638, 'Cucuyagua', 'cucuyagua', 'hn', 1),
	(30647, 706638, 'Dolores', 'dolores', 'hn', 1),
	(30648, 706638, 'Dulce Nombre', 'dulce-nombre', 'hn', 1),
	(30649, 706638, 'El Paraíso', 'el-paraiso', 'hn', 1),
	(30650, 706638, 'Florida', 'florida', 'hn', 1),
	(30651, 706638, 'La Jigua', 'la-jigua', 'hn', 1),
	(30652, 706638, 'La Unión', 'la-union', 'hn', 1),
	(30653, 706638, 'Nueva Arcadia', 'nueva-arcadia', 'hn', 1),
	(30654, 706638, 'San Agustín', 'san-agustin', 'hn', 1),
	(30655, 706638, 'San Antonio', 'san-antonio', 'hn', 1),
	(30656, 706638, 'San Jerónimo', 'san-jeronimo', 'hn', 1),
	(30657, 706638, 'San José', 'san-jose', 'hn', 1),
	(30658, 706638, 'San Juan de Opoa', 'san-juan-de-opoa', 'hn', 1),
	(30659, 706638, 'San Nicolás', 'san-nicolas', 'hn', 1),
	(30660, 706638, 'San Pedro de Copán', 'san-pedro-de-copan', 'hn', 1),
	(30661, 706638, 'Santa Rita', 'santa-rita', 'hn', 1),
	(30662, 706638, 'Santa Rosa de Copán', 'santa-rosa-de-copan', 'hn', 1),
	(30663, 706638, 'Trinidad de Copán', 'trinidad-de-copan', 'hn', 1),
	(30664, 706638, 'Veracruz', 'veracruz', 'hn', 1),
	(30665, 716708, 'Choloma', 'choloma', 'hn', 1),
	(30666, 716708, 'La Lima', 'la-lima', 'hn', 1),
	(30667, 716708, 'Omoa', 'omoa', 'hn', 1),
	(30668, 716708, 'Pimienta', 'pimienta', 'hn', 1),
	(30669, 716708, 'Potrerillos', 'potrerillos', 'hn', 1),
	(30670, 716708, 'Puerto Cortés', 'puerto-cortes', 'hn', 1),
	(30671, 716708, 'San Antonio de Cortés', 'san-antonio-de-cortes', 'hn', 1),
	(30672, 716708, 'San Francisco de Yojoa', 'san-francisco-de-yojoa', 'hn', 1),
	(30673, 716708, 'San Manuel', 'san-manuel', 'hn', 1),
	(30674, 716708, 'San Pedro Sula, Cortés', 'san-pedro-sula-cortes', 'hn', 1),
	(30675, 716708, 'Santa Cruz de Yojoa', 'santa-cruz-de-yojoa', 'hn', 1),
	(30676, 716708, 'Villanueva', 'villanueva', 'hn', 1),
	(30677, 706640, 'Alauca', 'alauca', 'hn', 1),
	(30678, 706640, 'Danlí', 'danli', 'hn', 1),
	(30679, 706640, 'El Paraíso', 'el-paraiso', 'hn', 1),
	(30680, 706640, 'Guinope', 'guinope', 'hn', 1),
	(30681, 706640, 'Jacaleapa', 'jacaleapa', 'hn', 1),
	(30682, 706640, 'Liure', 'liure', 'hn', 1),
	(30683, 706640, 'Morocelí', 'moroceli', 'hn', 1),
	(30684, 706640, 'Oropolí', 'oropoli', 'hn', 1),
	(30685, 706640, 'Potrerillos', 'potrerillos', 'hn', 1),
	(30686, 706640, 'San Antonio de Flores', 'san-antonio-de-flores', 'hn', 1),
	(30687, 706640, 'San Lucas', 'san-lucas', 'hn', 1),
	(30688, 706640, 'San Matías', 'san-matias', 'hn', 1),
	(30689, 706640, 'Soledad', 'soledad', 'hn', 1),
	(30690, 706640, 'Teupasenti', 'teupasenti', 'hn', 1),
	(30691, 706640, 'Texiguat', 'texiguat', 'hn', 1),
	(30692, 706640, 'Trojes', 'trojes', 'hn', 1),
	(30693, 706640, 'Vado Ancho', 'vado-ancho', 'hn', 1),
	(30694, 706640, 'Yauyupe', 'yauyupe', 'hn', 1),
	(30695, 706640, 'Yuscarán', 'yuscaran', 'hn', 1),
	(30696, 706641, 'Alubarén', 'alubaren', 'hn', 1),
	(30697, 706641, 'Cedros', 'cedros', 'hn', 1),
	(30698, 706641, 'Curarén', 'curaren', 'hn', 1),
	(30699, 706641, 'Distrito Central', 'distrito-central', 'hn', 1),
	(30700, 706641, 'El Porvenir', 'el-porvenir', 'hn', 1),
	(30701, 706641, 'Guaimaca', 'guaimaca', 'hn', 1),
	(30702, 706641, 'La Libertad', 'la-libertad', 'hn', 1),
	(30703, 706641, 'La Venta', 'la-venta', 'hn', 1),
	(30704, 706641, 'Lepaterique', 'lepaterique', 'hn', 1),
	(30705, 706641, 'Maraita', 'maraita', 'hn', 1),
	(30706, 706641, 'Marale', 'marale', 'hn', 1),
	(30707, 706641, 'Nueva Armenia', 'nueva-armenia', 'hn', 1),
	(30708, 706641, 'Ojojona', 'ojojona', 'hn', 1),
	(30709, 706641, 'Orica', 'orica', 'hn', 1),
	(30710, 706641, 'Reitoca', 'reitoca', 'hn', 1),
	(30711, 706641, 'Sabanagrande', 'sabanagrande', 'hn', 1),
	(30712, 706641, 'San Antonio de Oriente', 'san-antonio-de-oriente', 'hn', 1),
	(30713, 706641, 'San Buenaventura', 'san-buenaventura', 'hn', 1),
	(30714, 706641, 'San Ignacio', 'san-ignacio', 'hn', 1),
	(30715, 706641, 'San Juan de Flores', 'san-juan-de-flores', 'hn', 1),
	(30716, 706641, 'San Miguelito', 'san-miguelito', 'hn', 1),
	(30717, 706641, 'Santa Ana', 'santa-ana', 'hn', 1),
	(30718, 706641, 'Santa Lucía', 'santa-lucia', 'hn', 1),
	(30719, 706641, 'Talanga', 'talanga', 'hn', 1),
	(30720, 706641, 'Tatumbla', 'tatumbla', 'hn', 1),
	(30721, 706641, 'Valle deÁngeles', 'valle-deangeles', 'hn', 1),
	(30722, 706641, 'Vallecillo', 'vallecillo', 'hn', 1),
	(30723, 706641, 'Villa de San Francisco', 'villa-de-san-francisco', 'hn', 1),
	(30724, 706642, 'Ahuas', 'ahuas', 'hn', 1),
	(30725, 706642, 'Brus Laguna', 'brus-laguna', 'hn', 1),
	(30726, 706642, 'Juan Francisco Bulnes', 'juan-francisco-bulnes', 'hn', 1),
	(30727, 706642, 'Puerto Lempira', 'puerto-lempira', 'hn', 1),
	(30728, 706642, 'Ramón Villeda Morales', 'ramon-villeda-morales', 'hn', 1),
	(30729, 706642, 'Wampusirpi', 'wampusirpi', 'hn', 1),
	(30730, 706625, 'Camasca', 'camasca', 'hn', 1),
	(30731, 706625, 'Colomoncagua', 'colomoncagua', 'hn', 1),
	(30732, 706625, 'Concepción', 'concepcion', 'hn', 1),
	(30733, 706625, 'Dolores', 'dolores', 'hn', 1),
	(30734, 706625, 'Intibucá', 'intibuca', 'hn', 1),
	(30735, 706625, 'Jesús de Otoro', 'jesus-de-otoro', 'hn', 1),
	(30736, 706625, 'La Esperanza', 'la-esperanza', 'hn', 1),
	(30737, 706625, 'Magdalena', 'magdalena', 'hn', 1),
	(30738, 706625, 'Masaguara', 'masaguara', 'hn', 1),
	(30739, 706625, 'San Antonio', 'san-antonio', 'hn', 1),
	(30740, 706625, 'San Francisco de Opalaca', 'san-francisco-de-opalaca', 'hn', 1),
	(30741, 706625, 'San Isidro', 'san-isidro', 'hn', 1),
	(30742, 706625, 'San Juan', 'san-juan', 'hn', 1),
	(30743, 706625, 'San Marco de Sierra', 'san-marco-de-sierra', 'hn', 1),
	(30744, 706625, 'San Miguelito', 'san-miguelito', 'hn', 1),
	(30745, 706625, 'Santa Lucía', 'santa-lucia', 'hn', 1),
	(30746, 706625, 'Yamaranguila', 'yamaranguila', 'hn', 1),
	(30747, 706626, 'Guanaja', 'guanaja', 'hn', 1),
	(30748, 706626, 'José Santos Guardiola', 'jose-santos-guardiola', 'hn', 1),
	(30749, 706626, 'Roatán', 'roatan', 'hn', 1),
	(30750, 706626, 'Útila', 'utila', 'hn', 1),
	(30751, 716800, 'Aguaqueterique', 'aguaqueterique', 'hn', 1),
	(30752, 716800, 'Cabañas', 'cabanas', 'hn', 1),
	(30753, 716800, 'Cane', 'cane', 'hn', 1),
	(30754, 716800, 'Chinacla', 'chinacla', 'hn', 1),
	(30755, 716800, 'Guajiquiro', 'guajiquiro', 'hn', 1),
	(30756, 716800, 'La Paz', 'la-paz', 'hn', 1),
	(30757, 716800, 'Lauterique', 'lauterique', 'hn', 1),
	(30758, 716800, 'Marcala', 'marcala', 'hn', 1),
	(30759, 716800, 'Mercedes de Oriente', 'mercedes-de-oriente', 'hn', 1),
	(30760, 716800, 'Opatoro', 'opatoro', 'hn', 1),
	(30761, 716800, 'San Antonio del Norte', 'san-antonio-del-norte', 'hn', 1),
	(30762, 716800, 'San José', 'san-jose', 'hn', 1),
	(30763, 716800, 'San Juan', 'san-juan', 'hn', 1),
	(30764, 716800, 'San Pedro de Tutule', 'san-pedro-de-tutule', 'hn', 1),
	(30765, 716800, 'Santa Ana', 'santa-ana', 'hn', 1),
	(30766, 716800, 'Santa Elena', 'santa-elena', 'hn', 1),
	(30767, 716800, 'Santa María', 'santa-maria', 'hn', 1),
	(30768, 716800, 'Santiago de Puringla', 'santiago-de-puringla', 'hn', 1),
	(30769, 716800, 'Yarula', 'yarula', 'hn', 1),
	(30770, 706628, 'Belén', 'belen', 'hn', 1),
	(30771, 706628, 'Candelaria', 'candelaria', 'hn', 1),
	(30772, 706628, 'Cololaca', 'cololaca', 'hn', 1),
	(30773, 706628, 'Erandique', 'erandique', 'hn', 1),
	(30774, 706628, 'Gracias', 'gracias', 'hn', 1),
	(30775, 706628, 'Gualcince', 'gualcince', 'hn', 1),
	(30776, 706628, 'Guarita', 'guarita', 'hn', 1),
	(30777, 706628, 'La Campa', 'la-campa', 'hn', 1),
	(30778, 706628, 'La Iguala', 'la-iguala', 'hn', 1),
	(30779, 706628, 'Las Flores', 'las-flores', 'hn', 1),
	(30780, 706628, 'La Unión', 'la-union', 'hn', 1),
	(30781, 706628, 'La Virtud', 'la-virtud', 'hn', 1),
	(30782, 706628, 'Lepaera', 'lepaera', 'hn', 1),
	(30783, 706628, 'Mapulaca', 'mapulaca', 'hn', 1),
	(30784, 706628, 'Piraera', 'piraera', 'hn', 1),
	(30785, 706628, 'San Andrés', 'san-andres', 'hn', 1),
	(30786, 706628, 'San Francisco', 'san-francisco', 'hn', 1),
	(30787, 706628, 'San Juan Guarita', 'san-juan-guarita', 'hn', 1),
	(30788, 706628, 'San Manuel Colohete', 'san-manuel-colohete', 'hn', 1),
	(30789, 706628, 'San Marcos de Caiquín', 'san-marcos-de-caiquin', 'hn', 1),
	(30790, 706628, 'San Rafael', 'san-rafael', 'hn', 1),
	(30791, 706628, 'San Sebastian', 'san-sebastian', 'hn', 1),
	(30792, 706628, 'Santa Cruz', 'santa-cruz', 'hn', 1),
	(30793, 706628, 'Talgua', 'talgua', 'hn', 1),
	(30794, 706628, 'Tambla', 'tambla', 'hn', 1),
	(30795, 706628, 'Tomalá', 'tomala', 'hn', 1),
	(30796, 706628, 'Valladolid', 'valladolid', 'hn', 1),
	(30797, 706628, 'Virginia', 'virginia', 'hn', 1),
	(30798, 706629, 'Belén Gualcho', 'belen-gualcho', 'hn', 1),
	(30799, 706629, 'Concepción', 'concepcion', 'hn', 1),
	(30800, 706629, 'Dolores Merendon', 'dolores-merendon', 'hn', 1),
	(30801, 706629, 'Fraternidad', 'fraternidad', 'hn', 1),
	(30802, 706629, 'La Encarnación', 'la-encarnacion', 'hn', 1),
	(30803, 706629, 'La Labor', 'la-labor', 'hn', 1),
	(30804, 706629, 'Lucerna', 'lucerna', 'hn', 1),
	(30805, 706629, 'Mercedes', 'mercedes', 'hn', 1),
	(30806, 706629, 'Ocotepeque', 'ocotepeque', 'hn', 1),
	(30807, 706629, 'San Fernando', 'san-fernando', 'hn', 1),
	(30808, 706629, 'San Francisco del Valle', 'san-francisco-del-valle', 'hn', 1),
	(30809, 706629, 'San Jorge', 'san-jorge', 'hn', 1),
	(30810, 706629, 'San Marcos', 'san-marcos', 'hn', 1),
	(30811, 706629, 'Santa Fé', 'santa-fe', 'hn', 1),
	(30812, 706629, 'Sensenti', 'sensenti', 'hn', 1),
	(30813, 706629, 'Sinuapa', 'sinuapa', 'hn', 1),
	(30814, 706630, 'Catacamas', 'catacamas', 'hn', 1),
	(30815, 706630, 'Campamento', 'campamento', 'hn', 1),
	(30816, 706630, 'Concordia', 'concordia', 'hn', 1),
	(30817, 706630, 'Dulce Nombre de Culmí', 'dulce-nombre-de-culmi', 'hn', 1),
	(30818, 706630, 'El Rosario', 'el-rosario', 'hn', 1),
	(30819, 706630, 'Esquipulas del Norte', 'esquipulas-del-norte', 'hn', 1),
	(30820, 706630, 'Gualaco', 'gualaco', 'hn', 1),
	(30821, 706630, 'Guarizama', 'guarizama', 'hn', 1),
	(30822, 706630, 'Guata', 'guata', 'hn', 1),
	(30823, 706630, 'Guayape', 'guayape', 'hn', 1),
	(30824, 706630, 'Jano', 'jano', 'hn', 1),
	(30825, 706630, 'Juticalpa', 'juticalpa', 'hn', 1),
	(30826, 706630, 'La Unión', 'la-union', 'hn', 1),
	(30827, 706630, 'Mangulile', 'mangulile', 'hn', 1),
	(30828, 706630, 'Manto', 'manto', 'hn', 1),
	(30829, 706630, 'Patuca', 'patuca', 'hn', 1),
	(30830, 706630, 'Salamá', 'salama', 'hn', 1),
	(30831, 706630, 'San Esteban', 'san-esteban', 'hn', 1),
	(30832, 706630, 'San Francisco de Becerra', 'san-francisco-de-becerra', 'hn', 1),
	(30833, 706630, 'San Francisco de la Paz', 'san-francisco-de-la-paz', 'hn', 1),
	(30834, 706630, 'Santa Maria del Real', 'santa-maria-del-real', 'hn', 1),
	(30835, 706630, 'Silca', 'silca', 'hn', 1),
	(30836, 706630, 'Yocón', 'yocon', 'hn', 1),
	(30837, 706631, 'Arada', 'arada', 'hn', 1),
	(30838, 706631, 'Atima', 'atima', 'hn', 1),
	(30839, 706631, 'Azacualpa', 'azacualpa', 'hn', 1),
	(30840, 706631, 'Ceguaca', 'ceguaca', 'hn', 1),
	(30841, 706631, 'Chinda', 'chinda', 'hn', 1),
	(30842, 706631, 'Concepción del Norte', 'concepcion-del-norte', 'hn', 1),
	(30843, 706631, 'Concepción del Sur', 'concepcion-del-sur', 'hn', 1),
	(30844, 706631, 'El Nispero', 'el-nispero', 'hn', 1),
	(30845, 706631, 'Gualala', 'gualala', 'hn', 1),
	(30846, 706631, 'Ilama', 'ilama', 'hn', 1),
	(30847, 706631, 'Las Vegas', 'las-vegas', 'hn', 1),
	(30848, 706631, 'Macuelizo', 'macuelizo', 'hn', 1),
	(30849, 706631, 'Naranjito', 'naranjito', 'hn', 1),
	(30850, 706631, 'Nueva Frontera', 'nueva-frontera', 'hn', 1),
	(30851, 706631, 'Nuevo Celilac', 'nuevo-celilac', 'hn', 1),
	(30852, 706631, 'Petoa', 'petoa', 'hn', 1),
	(30853, 706631, 'Protección', 'proteccion', 'hn', 1),
	(30854, 706631, 'Quimistán', 'quimistan', 'hn', 1),
	(30855, 706631, 'San Francisco de Ojuera', 'san-francisco-de-ojuera', 'hn', 1),
	(30856, 706631, 'San José de Colinas', 'san-jose-de-colinas', 'hn', 1),
	(30857, 706631, 'San Luis', 'san-luis', 'hn', 1),
	(30858, 706631, 'San Marcos', 'san-marcos', 'hn', 1),
	(30859, 706631, 'San Nicolás', 'san-nicolas', 'hn', 1),
	(30860, 706631, 'San Pedro Zacapa', 'san-pedro-zacapa', 'hn', 1),
	(30861, 706631, 'Santa Bárbara', 'santa-barbara', 'hn', 1),
	(30862, 706631, 'Santa Rita', 'santa-rita', 'hn', 1),
	(30863, 706631, 'San Vicente Centenario', 'san-vicente-centenario', 'hn', 1),
	(30864, 706631, 'Trinidad', 'trinidad', 'hn', 1),
	(30865, 706632, 'Alianza', 'alianza', 'hn', 1),
	(30866, 706632, 'Amapala', 'amapala', 'hn', 1),
	(30867, 706632, 'Aramecina', 'aramecina', 'hn', 1),
	(30868, 706632, 'Caridad', 'caridad', 'hn', 1),
	(30869, 706632, 'Goascorán', 'goascoran', 'hn', 1),
	(30870, 706632, 'Langue', 'langue', 'hn', 1),
	(30871, 706632, 'Nacaome', 'nacaome', 'hn', 1),
	(30872, 706632, 'San Francisco de Coray', 'san-francisco-de-coray', 'hn', 1),
	(30873, 706632, 'San Lorenzo', 'san-lorenzo', 'hn', 1),
	(30874, 706633, 'Arenal', 'arenal', 'hn', 1),
	(30875, 706633, 'El Negrito', 'el-negrito', 'hn', 1),
	(30876, 706633, 'El Progreso,', 'el-progreso', 'hn', 1),
	(30877, 706633, 'Jocón', 'jocon', 'hn', 1),
	(30878, 706633, 'Morazán', 'morazan', 'hn', 1),
	(30879, 706633, 'Olanchito', 'olanchito', 'hn', 1),
	(30880, 706633, 'Santa Rita', 'santa-rita', 'hn', 1),
	(30881, 706633, 'Sulaco, Yoro', 'sulaco-yoro', 'hn', 1),
	(30882, 706633, 'Victoria', 'victoria', 'hn', 1),
	(30883, 706633, 'Yorito', 'yorito', 'hn', 1),
	(30884, 706633, 'Yoro', 'yoro', 'hn', 1);
/*!40000 ALTER TABLE `oc_t_city` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_city_area
CREATE TABLE IF NOT EXISTS `oc_t_city_area` (
  `pk_i_id` int(10) unsigned NOT NULL,
  `fk_i_city_id` int(10) unsigned NOT NULL,
  `s_name` varchar(255) NOT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `idx_s_name` (`s_name`),
  CONSTRAINT `oc_t_city_area_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_city_area: ~0 rows (approximately)
DELETE FROM `oc_t_city_area`;
/*!40000 ALTER TABLE `oc_t_city_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_city_area` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_city_stats
CREATE TABLE IF NOT EXISTS `oc_t_city_stats` (
  `fk_i_city_id` int(10) unsigned NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_i_city_id`),
  KEY `idx_num_items` (`i_num_items`),
  CONSTRAINT `oc_t_city_stats_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_city_stats: ~303 rows (approximately)
DELETE FROM `oc_t_city_stats`;
/*!40000 ALTER TABLE `oc_t_city_stats` DISABLE KEYS */;
INSERT INTO `oc_t_city_stats` (`fk_i_city_id`, `i_num_items`) VALUES
	(30582, 0),
	(30583, 0),
	(30584, 0),
	(30585, 0),
	(30586, 0),
	(30587, 0),
	(30588, 0),
	(30589, 0),
	(30590, 0),
	(30591, 0),
	(30592, 0),
	(30593, 0),
	(30594, 0),
	(30595, 0),
	(30596, 0),
	(30597, 0),
	(30598, 0),
	(30599, 0),
	(30600, 0),
	(30601, 0),
	(30602, 0),
	(30603, 0),
	(30604, 0),
	(30605, 0),
	(30606, 0),
	(30607, 0),
	(30608, 0),
	(30609, 0),
	(30610, 0),
	(30611, 0),
	(30612, 0),
	(30613, 0),
	(30614, 0),
	(30615, 0),
	(30616, 0),
	(30617, 0),
	(30618, 0),
	(30619, 0),
	(30620, 0),
	(30621, 0),
	(30622, 0),
	(30623, 0),
	(30624, 0),
	(30625, 0),
	(30626, 0),
	(30627, 0),
	(30628, 0),
	(30629, 0),
	(30630, 0),
	(30631, 0),
	(30632, 0),
	(30633, 0),
	(30634, 0),
	(30635, 0),
	(30636, 0),
	(30637, 0),
	(30638, 0),
	(30639, 0),
	(30640, 0),
	(30641, 0),
	(30642, 0),
	(30643, 0),
	(30644, 0),
	(30645, 0),
	(30646, 0),
	(30647, 0),
	(30648, 0),
	(30649, 0),
	(30650, 0),
	(30651, 0),
	(30652, 0),
	(30653, 0),
	(30654, 0),
	(30655, 0),
	(30656, 0),
	(30657, 0),
	(30658, 0),
	(30659, 0),
	(30660, 0),
	(30661, 0),
	(30662, 0),
	(30663, 0),
	(30664, 0),
	(30665, 0),
	(30666, 0),
	(30667, 0),
	(30668, 0),
	(30669, 0),
	(30670, 0),
	(30671, 0),
	(30672, 0),
	(30673, 0),
	(30674, 0),
	(30675, 0),
	(30676, 0),
	(30677, 0),
	(30678, 0),
	(30679, 0),
	(30680, 0),
	(30681, 0),
	(30682, 0),
	(30683, 0),
	(30684, 0),
	(30685, 0),
	(30686, 0),
	(30687, 0),
	(30688, 0),
	(30689, 0),
	(30690, 0),
	(30691, 0),
	(30692, 0),
	(30693, 0),
	(30694, 0),
	(30695, 0),
	(30696, 0),
	(30697, 0),
	(30698, 0),
	(30699, 0),
	(30700, 0),
	(30701, 0),
	(30702, 0),
	(30703, 0),
	(30704, 0),
	(30705, 0),
	(30706, 0),
	(30707, 0),
	(30708, 0),
	(30709, 0),
	(30710, 0),
	(30711, 0),
	(30712, 0),
	(30713, 0),
	(30714, 0),
	(30715, 0),
	(30716, 0),
	(30717, 0),
	(30718, 0),
	(30719, 0),
	(30720, 0),
	(30721, 0),
	(30722, 0),
	(30723, 0),
	(30724, 0),
	(30725, 0),
	(30726, 0),
	(30727, 0),
	(30728, 0),
	(30729, 0),
	(30730, 0),
	(30731, 0),
	(30732, 0),
	(30733, 0),
	(30734, 0),
	(30735, 0),
	(30736, 0),
	(30737, 0),
	(30738, 0),
	(30739, 0),
	(30740, 0),
	(30741, 0),
	(30742, 0),
	(30743, 0),
	(30744, 0),
	(30745, 0),
	(30746, 0),
	(30747, 0),
	(30748, 0),
	(30749, 0),
	(30750, 0),
	(30751, 0),
	(30752, 0),
	(30753, 0),
	(30754, 0),
	(30755, 0),
	(30756, 0),
	(30757, 0),
	(30758, 0),
	(30759, 0),
	(30760, 0),
	(30761, 0),
	(30762, 0),
	(30763, 0),
	(30764, 0),
	(30765, 0),
	(30766, 0),
	(30767, 0),
	(30768, 0),
	(30769, 0),
	(30770, 0),
	(30771, 0),
	(30772, 0),
	(30773, 0),
	(30774, 0),
	(30775, 0),
	(30776, 0),
	(30777, 0),
	(30778, 0),
	(30779, 0),
	(30780, 0),
	(30781, 0),
	(30782, 0),
	(30783, 0),
	(30784, 0),
	(30785, 0),
	(30786, 0),
	(30787, 0),
	(30788, 0),
	(30789, 0),
	(30790, 0),
	(30791, 0),
	(30792, 0),
	(30793, 0),
	(30794, 0),
	(30795, 0),
	(30796, 0),
	(30797, 0),
	(30798, 0),
	(30799, 0),
	(30800, 0),
	(30801, 0),
	(30802, 0),
	(30803, 0),
	(30804, 0),
	(30805, 0),
	(30806, 0),
	(30807, 0),
	(30808, 0),
	(30809, 0),
	(30810, 0),
	(30811, 0),
	(30812, 0),
	(30813, 0),
	(30814, 0),
	(30815, 0),
	(30816, 0),
	(30817, 0),
	(30818, 0),
	(30819, 0),
	(30820, 0),
	(30821, 0),
	(30822, 0),
	(30823, 0),
	(30824, 0),
	(30825, 0),
	(30826, 0),
	(30827, 0),
	(30828, 0),
	(30829, 0),
	(30830, 0),
	(30831, 0),
	(30832, 0),
	(30833, 0),
	(30834, 0),
	(30835, 0),
	(30836, 0),
	(30837, 0),
	(30838, 0),
	(30839, 0),
	(30840, 0),
	(30841, 0),
	(30842, 0),
	(30843, 0),
	(30844, 0),
	(30845, 0),
	(30846, 0),
	(30847, 0),
	(30848, 0),
	(30849, 0),
	(30850, 0),
	(30851, 0),
	(30852, 0),
	(30853, 0),
	(30854, 0),
	(30855, 0),
	(30856, 0),
	(30857, 0),
	(30858, 0),
	(30859, 0),
	(30860, 0),
	(30861, 0),
	(30862, 0),
	(30863, 0),
	(30864, 0),
	(30865, 0),
	(30866, 0),
	(30867, 0),
	(30868, 0),
	(30869, 0),
	(30870, 0),
	(30871, 0),
	(30872, 0),
	(30873, 0),
	(30874, 0),
	(30875, 0),
	(30876, 0),
	(30877, 0),
	(30878, 0),
	(30879, 0),
	(30880, 0),
	(30881, 0),
	(30882, 0),
	(30883, 0),
	(30884, 0);
/*!40000 ALTER TABLE `oc_t_city_stats` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_country
CREATE TABLE IF NOT EXISTS `oc_t_country` (
  `pk_c_code` char(2) NOT NULL,
  `s_name` varchar(80) NOT NULL,
  `s_slug` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_c_code`),
  KEY `idx_s_slug` (`s_slug`),
  KEY `idx_s_name` (`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_country: ~1 rows (approximately)
DELETE FROM `oc_t_country`;
/*!40000 ALTER TABLE `oc_t_country` DISABLE KEYS */;
INSERT INTO `oc_t_country` (`pk_c_code`, `s_name`, `s_slug`) VALUES
	('HN', 'Honduras', 'honduras');
/*!40000 ALTER TABLE `oc_t_country` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_country_stats
CREATE TABLE IF NOT EXISTS `oc_t_country_stats` (
  `fk_c_country_code` char(2) NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_c_country_code`),
  KEY `idx_num_items` (`i_num_items`),
  CONSTRAINT `oc_t_country_stats_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_country_stats: ~1 rows (approximately)
DELETE FROM `oc_t_country_stats`;
/*!40000 ALTER TABLE `oc_t_country_stats` DISABLE KEYS */;
INSERT INTO `oc_t_country_stats` (`fk_c_country_code`, `i_num_items`) VALUES
	('HN', 0);
/*!40000 ALTER TABLE `oc_t_country_stats` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_cron
CREATE TABLE IF NOT EXISTS `oc_t_cron` (
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `d_last_exec` datetime NOT NULL,
  `d_next_exec` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_cron: ~3 rows (approximately)
DELETE FROM `oc_t_cron`;
/*!40000 ALTER TABLE `oc_t_cron` DISABLE KEYS */;
INSERT INTO `oc_t_cron` (`e_type`, `d_last_exec`, `d_next_exec`) VALUES
	('HOURLY', '2016-02-09 10:53:30', '2016-02-09 11:53:30'),
	('DAILY', '2016-02-09 09:53:12', '2016-02-10 09:53:12'),
	('WEEKLY', '2016-02-09 09:53:12', '2016-02-16 09:53:12');
/*!40000 ALTER TABLE `oc_t_cron` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_currency
CREATE TABLE IF NOT EXISTS `oc_t_currency` (
  `pk_c_code` char(3) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_description` varchar(80) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pk_c_code`),
  UNIQUE KEY `s_name` (`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_currency: ~3 rows (approximately)
DELETE FROM `oc_t_currency`;
/*!40000 ALTER TABLE `oc_t_currency` DISABLE KEYS */;
INSERT INTO `oc_t_currency` (`pk_c_code`, `s_name`, `s_description`, `b_enabled`) VALUES
	('EUR', 'European Union euro', 'Euro €', 1),
	('GBP', 'United Kingdom pound', 'Pound £', 1),
	('USD', 'United States dollar', 'Dollar US$', 1);
/*!40000 ALTER TABLE `oc_t_currency` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_facebook_connect
CREATE TABLE IF NOT EXISTS `oc_t_facebook_connect` (
  `fk_i_user_id` int(10) unsigned NOT NULL,
  `i_facebook_uid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`fk_i_user_id`),
  CONSTRAINT `oc_t_facebook_connect_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_facebook_connect: ~0 rows (approximately)
DELETE FROM `oc_t_facebook_connect`;
/*!40000 ALTER TABLE `oc_t_facebook_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_facebook_connect` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_item
CREATE TABLE IF NOT EXISTS `oc_t_item` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_user_id` int(10) unsigned DEFAULT NULL,
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `f_price` float DEFAULT NULL,
  `i_price` bigint(20) DEFAULT NULL,
  `fk_c_currency_code` char(3) DEFAULT NULL,
  `s_contact_name` varchar(100) DEFAULT NULL,
  `s_contact_email` varchar(140) NOT NULL,
  `s_ip` varchar(64) NOT NULL DEFAULT '',
  `b_premium` tinyint(1) NOT NULL DEFAULT '0',
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `b_spam` tinyint(1) NOT NULL DEFAULT '0',
  `s_secret` varchar(40) DEFAULT NULL,
  `b_show_email` tinyint(1) DEFAULT NULL,
  `dt_expiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_user_id` (`fk_i_user_id`),
  KEY `idx_b_premium` (`b_premium`),
  KEY `idx_s_contact_email` (`s_contact_email`(10)),
  KEY `fk_i_category_id` (`fk_i_category_id`),
  KEY `fk_c_currency_code` (`fk_c_currency_code`),
  KEY `idx_pub_date` (`dt_pub_date`),
  KEY `idx_price` (`i_price`),
  CONSTRAINT `oc_t_item_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  CONSTRAINT `oc_t_item_ibfk_2` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  CONSTRAINT `oc_t_item_ibfk_3` FOREIGN KEY (`fk_c_currency_code`) REFERENCES `oc_t_currency` (`pk_c_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_item: ~1 rows (approximately)
DELETE FROM `oc_t_item`;
/*!40000 ALTER TABLE `oc_t_item` DISABLE KEYS */;
INSERT INTO `oc_t_item` (`pk_i_id`, `fk_i_user_id`, `fk_i_category_id`, `dt_pub_date`, `dt_mod_date`, `f_price`, `i_price`, `fk_c_currency_code`, `s_contact_name`, `s_contact_email`, `s_ip`, `b_premium`, `b_enabled`, `b_active`, `b_spam`, `s_secret`, `b_show_email`, `dt_expiration`) VALUES
	(1, NULL, 9, '2016-02-09 09:48:01', NULL, NULL, NULL, NULL, 'Example author', 'osclass@example.com', '::1', 0, 1, 1, 0, 'dRYFschf', 0, '9999-12-31 23:59:59');
/*!40000 ALTER TABLE `oc_t_item` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_item_comment
CREATE TABLE IF NOT EXISTS `oc_t_item_comment` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `s_title` varchar(200) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_email` varchar(100) NOT NULL,
  `s_body` text NOT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `b_spam` tinyint(1) NOT NULL DEFAULT '0',
  `fk_i_user_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_item_id` (`fk_i_item_id`),
  KEY `fk_i_user_id` (`fk_i_user_id`),
  CONSTRAINT `oc_t_item_comment_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  CONSTRAINT `oc_t_item_comment_ibfk_2` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_item_comment: ~0 rows (approximately)
DELETE FROM `oc_t_item_comment`;
/*!40000 ALTER TABLE `oc_t_item_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_item_comment` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_item_description
CREATE TABLE IF NOT EXISTS `oc_t_item_description` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(100) NOT NULL,
  `s_description` mediumtext NOT NULL,
  PRIMARY KEY (`fk_i_item_id`,`fk_c_locale_code`),
  FULLTEXT KEY `s_description` (`s_description`,`s_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_item_description: 1 rows
DELETE FROM `oc_t_item_description`;
/*!40000 ALTER TABLE `oc_t_item_description` DISABLE KEYS */;
INSERT INTO `oc_t_item_description` (`fk_i_item_id`, `fk_c_locale_code`, `s_title`, `s_description`) VALUES
	(1, 'en_US', 'Example Ad', 'Description of the example ad. Insert here some usefull description of your ad.');
/*!40000 ALTER TABLE `oc_t_item_description` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_item_location
CREATE TABLE IF NOT EXISTS `oc_t_item_location` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) unsigned DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) unsigned DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) unsigned DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`fk_i_item_id`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  KEY `fk_i_region_id` (`fk_i_region_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `fk_i_city_area_id` (`fk_i_city_area_id`),
  CONSTRAINT `oc_t_item_location_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  CONSTRAINT `oc_t_item_location_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  CONSTRAINT `oc_t_item_location_ibfk_3` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  CONSTRAINT `oc_t_item_location_ibfk_4` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  CONSTRAINT `oc_t_item_location_ibfk_5` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_item_location: ~1 rows (approximately)
DELETE FROM `oc_t_item_location`;
/*!40000 ALTER TABLE `oc_t_item_location` DISABLE KEYS */;
INSERT INTO `oc_t_item_location` (`fk_i_item_id`, `fk_c_country_code`, `s_country`, `s_address`, `s_zip`, `fk_i_region_id`, `s_region`, `fk_i_city_id`, `s_city`, `fk_i_city_area_id`, `s_city_area`, `d_coord_lat`, `d_coord_long`) VALUES
	(1, NULL, 'Example country', '', NULL, NULL, 'Example region', NULL, 'Example city', NULL, '', NULL, NULL);
/*!40000 ALTER TABLE `oc_t_item_location` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_item_meta
CREATE TABLE IF NOT EXISTS `oc_t_item_meta` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `fk_i_field_id` int(10) unsigned NOT NULL,
  `s_value` text,
  `s_multi` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`fk_i_item_id`,`fk_i_field_id`,`s_multi`),
  KEY `s_value` (`s_value`(255)),
  KEY `fk_i_field_id` (`fk_i_field_id`),
  CONSTRAINT `oc_t_item_meta_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  CONSTRAINT `oc_t_item_meta_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_item_meta: ~0 rows (approximately)
DELETE FROM `oc_t_item_meta`;
/*!40000 ALTER TABLE `oc_t_item_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_item_meta` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_item_resource
CREATE TABLE IF NOT EXISTS `oc_t_item_resource` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `s_name` varchar(60) DEFAULT NULL,
  `s_extension` varchar(10) DEFAULT NULL,
  `s_content_type` varchar(40) DEFAULT NULL,
  `s_path` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_i_item_id` (`fk_i_item_id`),
  KEY `idx_s_content_type` (`pk_i_id`,`s_content_type`(10)),
  CONSTRAINT `oc_t_item_resource_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_item_resource: ~0 rows (approximately)
DELETE FROM `oc_t_item_resource`;
/*!40000 ALTER TABLE `oc_t_item_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_item_resource` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_item_stats
CREATE TABLE IF NOT EXISTS `oc_t_item_stats` (
  `fk_i_item_id` int(10) unsigned NOT NULL,
  `i_num_views` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_spam` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_repeated` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_bad_classified` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_offensive` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_expired` int(10) unsigned NOT NULL DEFAULT '0',
  `i_num_premium_views` int(10) unsigned NOT NULL DEFAULT '0',
  `dt_date` date NOT NULL,
  PRIMARY KEY (`fk_i_item_id`,`dt_date`),
  KEY `dt_date` (`dt_date`,`fk_i_item_id`),
  CONSTRAINT `oc_t_item_stats_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_item_stats: ~1 rows (approximately)
DELETE FROM `oc_t_item_stats`;
/*!40000 ALTER TABLE `oc_t_item_stats` DISABLE KEYS */;
INSERT INTO `oc_t_item_stats` (`fk_i_item_id`, `i_num_views`, `i_num_spam`, `i_num_repeated`, `i_num_bad_classified`, `i_num_offensive`, `i_num_expired`, `i_num_premium_views`, `dt_date`) VALUES
	(1, 0, 0, 0, 0, 0, 0, 0, '2016-02-09');
/*!40000 ALTER TABLE `oc_t_item_stats` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_keywords
CREATE TABLE IF NOT EXISTS `oc_t_keywords` (
  `s_md5` varchar(32) NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_original_text` varchar(255) NOT NULL,
  `s_anchor_text` varchar(255) NOT NULL,
  `s_normalized_text` varchar(255) NOT NULL,
  `fk_i_category_id` int(10) unsigned DEFAULT NULL,
  `fk_i_city_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`s_md5`,`fk_c_locale_code`),
  KEY `fk_i_category_id` (`fk_i_category_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`),
  CONSTRAINT `oc_t_keywords_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  CONSTRAINT `oc_t_keywords_ibfk_2` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  CONSTRAINT `oc_t_keywords_ibfk_3` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_keywords: ~0 rows (approximately)
DELETE FROM `oc_t_keywords`;
/*!40000 ALTER TABLE `oc_t_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_keywords` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_latest_searches
CREATE TABLE IF NOT EXISTS `oc_t_latest_searches` (
  `d_date` datetime NOT NULL,
  `s_search` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_latest_searches: ~0 rows (approximately)
DELETE FROM `oc_t_latest_searches`;
/*!40000 ALTER TABLE `oc_t_latest_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_latest_searches` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_locale
CREATE TABLE IF NOT EXISTS `oc_t_locale` (
  `pk_c_code` char(5) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_short_name` varchar(40) NOT NULL,
  `s_description` varchar(100) NOT NULL,
  `s_version` varchar(20) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_url` varchar(100) NOT NULL,
  `s_currency_format` varchar(50) NOT NULL,
  `s_dec_point` varchar(2) DEFAULT '.',
  `s_thousands_sep` varchar(2) DEFAULT '',
  `i_num_dec` tinyint(4) DEFAULT '2',
  `s_date_format` varchar(20) NOT NULL,
  `s_stop_words` text,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_enabled_bo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pk_c_code`),
  UNIQUE KEY `s_short_name` (`s_short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_locale: ~1 rows (approximately)
DELETE FROM `oc_t_locale`;
/*!40000 ALTER TABLE `oc_t_locale` DISABLE KEYS */;
INSERT INTO `oc_t_locale` (`pk_c_code`, `s_name`, `s_short_name`, `s_description`, `s_version`, `s_author_name`, `s_author_url`, `s_currency_format`, `s_dec_point`, `s_thousands_sep`, `i_num_dec`, `s_date_format`, `s_stop_words`, `b_enabled`, `b_enabled_bo`) VALUES
	('en_US', 'English (US)', 'English', 'American english translation', '2.3', 'Osclass', 'http://osclass.org/', '{NUMBER} {CURRENCY}', '.', '', 2, 'm/d/Y', 'i,a,about,an,are,as,at,be,by,com,for,from,how,in,is,it,of,on,or,that,the,this,to,was,what,when,where,who,will,with,the', 1, 1);
/*!40000 ALTER TABLE `oc_t_locale` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_locations_tmp
CREATE TABLE IF NOT EXISTS `oc_t_locations_tmp` (
  `id_location` varchar(10) NOT NULL,
  `e_type` enum('COUNTRY','REGION','CITY') NOT NULL,
  PRIMARY KEY (`id_location`,`e_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_locations_tmp: ~0 rows (approximately)
DELETE FROM `oc_t_locations_tmp`;
/*!40000 ALTER TABLE `oc_t_locations_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_locations_tmp` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_log
CREATE TABLE IF NOT EXISTS `oc_t_log` (
  `dt_date` datetime NOT NULL,
  `s_section` varchar(50) NOT NULL,
  `s_action` varchar(50) NOT NULL,
  `fk_i_id` int(10) unsigned NOT NULL,
  `s_data` varchar(250) NOT NULL,
  `s_ip` varchar(50) NOT NULL,
  `s_who` varchar(50) NOT NULL,
  `fk_i_who_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_log: ~8 rows (approximately)
DELETE FROM `oc_t_log`;
/*!40000 ALTER TABLE `oc_t_log` DISABLE KEYS */;
INSERT INTO `oc_t_log` (`dt_date`, `s_section`, `s_action`, `fk_i_id`, `s_data`, `s_ip`, `s_who`, `fk_i_who_id`) VALUES
	('2016-02-09 09:48:01', 'item', 'add', 1, 'Example Ad', '::1', 'admin', 0),
	('2016-02-09 10:37:05', 'user', 'add', 1, 'aayushijain26@gmail.com', '::1', 'user', 1),
	('2016-02-09 10:37:14', 'user', 'activate', 1, 'aayushijain26@gmail.com', '::1', 'admin', 1),
	('2016-02-09 10:54:18', 'user', 'delete', 1, 'aayushijain26@gmail.com', '::1', 'admin', 1),
	('2016-02-09 10:55:00', 'user', 'add', 2, 'aayushijain26@gmail.com', '::1', 'user', 2),
	('2016-02-09 10:56:55', 'user', 'activate', 2, 'aayushijain26@gmail.com', '::1', 'admin', 1),
	('2016-02-09 10:59:02', 'user', 'edit', 2, 'aayushijain26@gmail.com', '::1', 'user', 2),
	('2016-02-09 10:59:12', 'user', 'edit', 2, 'aayushijain26@gmail.com', '::1', 'user', 2);
/*!40000 ALTER TABLE `oc_t_log` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_meta_categories
CREATE TABLE IF NOT EXISTS `oc_t_meta_categories` (
  `fk_i_category_id` int(10) unsigned NOT NULL,
  `fk_i_field_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fk_i_category_id`,`fk_i_field_id`),
  KEY `fk_i_field_id` (`fk_i_field_id`),
  CONSTRAINT `oc_t_meta_categories_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  CONSTRAINT `oc_t_meta_categories_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_meta_categories: ~0 rows (approximately)
DELETE FROM `oc_t_meta_categories`;
/*!40000 ALTER TABLE `oc_t_meta_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_meta_categories` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_meta_fields
CREATE TABLE IF NOT EXISTS `oc_t_meta_fields` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) NOT NULL,
  `s_slug` varchar(255) NOT NULL,
  `e_type` enum('TEXT','TEXTAREA','DROPDOWN','RADIO','CHECKBOX','URL','DATE','DATEINTERVAL') NOT NULL DEFAULT 'TEXT',
  `s_options` varchar(2048) DEFAULT NULL,
  `b_required` tinyint(1) NOT NULL DEFAULT '0',
  `b_searchable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_meta_fields: ~0 rows (approximately)
DELETE FROM `oc_t_meta_fields`;
/*!40000 ALTER TABLE `oc_t_meta_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_meta_fields` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_pages
CREATE TABLE IF NOT EXISTS `oc_t_pages` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_internal_name` varchar(50) DEFAULT NULL,
  `b_indelible` tinyint(1) NOT NULL DEFAULT '0',
  `b_link` tinyint(1) NOT NULL DEFAULT '1',
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `i_order` int(3) NOT NULL DEFAULT '0',
  `s_meta` text,
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_pages: ~23 rows (approximately)
DELETE FROM `oc_t_pages`;
/*!40000 ALTER TABLE `oc_t_pages` DISABLE KEYS */;
INSERT INTO `oc_t_pages` (`pk_i_id`, `s_internal_name`, `b_indelible`, `b_link`, `dt_pub_date`, `dt_mod_date`, `i_order`, `s_meta`) VALUES
	(1, 'email_item_inquiry', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(2, 'email_user_validation', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(3, 'email_user_registration', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(4, 'email_send_friend', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(5, 'alert_email_hourly', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(6, 'alert_email_daily', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(7, 'alert_email_weekly', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(8, 'alert_email_instant', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(9, 'email_new_comment_admin', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(10, 'email_new_item_non_register_user', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(11, 'email_item_validation', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(12, 'email_admin_new_item', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(13, 'email_user_forgot_password', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(14, 'email_new_email', 1, 1, '2016-02-09 14:17:43', NULL, 0, NULL),
	(15, 'email_alert_validation', 1, 1, '2016-02-09 14:17:44', NULL, 0, NULL),
	(16, 'email_comment_validated', 1, 1, '2016-02-09 14:17:44', NULL, 0, NULL),
	(17, 'email_item_validation_non_register_user', 1, 1, '2016-02-09 14:17:44', NULL, 0, NULL),
	(18, 'email_admin_new_user', 1, 1, '2016-02-09 14:17:44', NULL, 0, NULL),
	(19, 'email_contact_user', 1, 1, '2016-02-09 14:17:44', NULL, 0, NULL),
	(20, 'email_new_comment_user', 1, 1, '2016-02-09 14:17:44', NULL, 0, NULL),
	(21, 'email_new_admin', 1, 1, '2016-02-09 14:17:44', NULL, 0, NULL),
	(22, 'email_warn_expiration', 1, 1, '2016-02-09 14:17:44', NULL, 0, NULL),
	(23, 'example_page', 0, 0, '2016-02-09 09:48:02', '2016-02-09 09:48:02', 1, '""');
/*!40000 ALTER TABLE `oc_t_pages` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_pages_description
CREATE TABLE IF NOT EXISTS `oc_t_pages_description` (
  `fk_i_pages_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(255) NOT NULL,
  `s_text` text,
  PRIMARY KEY (`fk_i_pages_id`,`fk_c_locale_code`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`),
  CONSTRAINT `oc_t_pages_description_ibfk_1` FOREIGN KEY (`fk_i_pages_id`) REFERENCES `oc_t_pages` (`pk_i_id`),
  CONSTRAINT `oc_t_pages_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_pages_description: ~23 rows (approximately)
DELETE FROM `oc_t_pages_description`;
/*!40000 ALTER TABLE `oc_t_pages_description` DISABLE KEYS */;
INSERT INTO `oc_t_pages_description` (`fk_i_pages_id`, `fk_c_locale_code`, `s_title`, `s_text`) VALUES
	(1, 'en_US', '{WEB_TITLE} - Someone has a question about your listing', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message about your listing <a href="{ITEM_URL}">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(2, 'en_US', 'Please validate your {WEB_TITLE} account', '<p>Hi {USER_NAME},</p><p>Please validate your registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(3, 'en_US', '{WEB_TITLE} - Registration successful!', '<p>Hi {USER_NAME},</p><p>You\'ve successfully registered for {WEB_LINK}.</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(4, 'en_US', 'Look at what I discovered on {WEB_TITLE}', '<p>Hi {FRIEND_NAME},</p><p>Your friend {USER_NAME} wants to share this listing with you <a href="{ITEM_URL}">{ITEM_TITLE}</a>.</p><p>Message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_TITLE}</p>'),
	(5, 'en_US', '{WEB_TITLE} - New listings in the last hour', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last hour. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
	(6, 'en_US', '{WEB_TITLE} - New listings in the last day', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last day. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
	(7, 'en_US', '{WEB_TITLE} - New listings in the last week', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last week. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
	(8, 'en_US', '{WEB_TITLE} - New listings', '<p>Hi {USER_NAME},</p><p>A new listing has been published, check it out!</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
	(9, 'en_US', '{WEB_TITLE} - New comment', '<p>Someone commented on the listing <a href="{ITEM_URL}">{ITEM_TITLE}</a>.</p><p>Commenter: {COMMENT_AUTHOR}<br />Commenter\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p>'),
	(10, 'en_US', '{WEB_TITLE} - Edit options for the listing {ITEM_TITLE}', '<p>Hi {USER_NAME},</p><p>You\'re not registered at {WEB_LINK}, but you can still edit or delete the listing <a href="{ITEM_URL}">{ITEM_TITLE}</a> for a short period of time.</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>If you register as a user, you will have full access to editing options.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(11, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because a listing has been published at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this email.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(12, 'en_US', '{WEB_TITLE} - A new listing has been published', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a listing has been published at {WEB_LINK}.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact email: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>You can edit this listing by clicking on the following link: {EDIT_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(13, 'en_US', '{WEB_TITLE} - Recover your password', '<p>Hi {USER_NAME},</p><p>We\'ve sent you this e-mail because you\'ve requested a password reminder. Follow this link to recover it: {PASSWORD_LINK}</p><p>The link will be deactivated in 24 hours.</p><p>If you didn\'t request a password reminder, please ignore this message. This request was made from IP {IP_ADDRESS} on {DATE_TIME}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(14, 'en_US', '{WEB_TITLE} - You requested an email change', '<p>Hi {USER_NAME}</p><p>You\'re receiving this e-mail because you requested an e-mail change. Please confirm this new e-mail address by clicking on the following validation link: {VALIDATION_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(15, 'en_US', '{WEB_TITLE} - Please validate your alert', '<p>Hi {USER_NAME},</p><p>Please validate your alert registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(16, 'en_US', '{WEB_TITLE} - Your comment has been approved', '<p>Hi {COMMENT_AUTHOR},</p><p>Your comment on <a href="{ITEM_URL}">{ITEM_TITLE}</a> has been approved.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(17, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because you’ve published a listing at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this e-mail.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Even if you\'re not registered at {WEB_LINK}, you can still edit or delete your listing:</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(18, 'en_US', '{WEB_TITLE} - A new user has registered', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(19, 'en_US', '{WEB_TITLE} - Someone has a question for you', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
	(20, 'en_US', '{WEB_TITLE} - Someone has commented on your listing', '<p>There\'s a new comment on the listing: <a href="{ITEM_URL}">{ITEM_TITLE}</a>.</p><p>Author: {COMMENT_AUTHOR}<br />Author\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
	(21, 'en_US', '{WEB_TITLE} - Success creating admin account!', '<p>Hi {ADMIN_NAME},</p><p>The admin of {WEB_LINK} has created an account for you,</p><ul><li>Username: {USERNAME}</li><li>Password: {PASSWORD}</li></ul><p>You can access the admin panel here {WEB_ADMIN_LINK}.</p><p>Thank you!</p><p>Regards,</p>'),
	(22, 'en_US', '{WEB_TITLE} - Your ad is about to expire', '<p>Hi {USER_NAME},</p><p>Your listing <a href="{ITEM_URL}">{ITEM_TITLE}</a> is about to expire at {WEB_LINK}.'),
	(23, 'en_US', 'Example page title', 'This is an example page description. This is a good place to put your Terms of Service or any other help information.');
/*!40000 ALTER TABLE `oc_t_pages_description` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_plugin_category
CREATE TABLE IF NOT EXISTS `oc_t_plugin_category` (
  `s_plugin_name` varchar(40) NOT NULL,
  `fk_i_category_id` int(10) unsigned NOT NULL,
  KEY `fk_i_category_id` (`fk_i_category_id`),
  CONSTRAINT `oc_t_plugin_category_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_plugin_category: ~0 rows (approximately)
DELETE FROM `oc_t_plugin_category`;
/*!40000 ALTER TABLE `oc_t_plugin_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_plugin_category` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_preference
CREATE TABLE IF NOT EXISTS `oc_t_preference` (
  `s_section` varchar(40) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_value` longtext NOT NULL,
  `e_type` enum('STRING','INTEGER','BOOLEAN') NOT NULL,
  UNIQUE KEY `s_section` (`s_section`,`s_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_preference: ~240 rows (approximately)
DELETE FROM `oc_t_preference`;
/*!40000 ALTER TABLE `oc_t_preference` DISABLE KEYS */;
INSERT INTO `oc_t_preference` (`s_section`, `s_name`, `s_value`, `e_type`) VALUES
	('0', 'custom_css', '', 'STRING'),
	('0', 'landing_pop', '', 'STRING'),
	('0', 'pop_heading', '', 'STRING'),
	('0', 'position10_content', '', 'STRING'),
	('0', 'position1_content', '', 'STRING'),
	('0', 'position2_content', '', 'STRING'),
	('0', 'position3_content', '', 'STRING'),
	('0', 'position4_content', '', 'STRING'),
	('0', 'position5_content', '', 'STRING'),
	('0', 'position6_content', '', 'STRING'),
	('0', 'position7_content', '', 'STRING'),
	('0', 'position8_content', '', 'STRING'),
	('0', 'position9_content', '', 'STRING'),
	('bender', 'defaultLocationShowAs', 'dropdown', 'STRING'),
	('bender', 'defaultShowAs@all', 'list', 'STRING'),
	('bender', 'donation', '0', 'STRING'),
	('bender', 'footer_link', '1', 'STRING'),
	('bender', 'keyword_placeholder', 'ie. PHP Programmer', 'STRING'),
	('bender', 'version', '314', 'STRING'),
	('facebook_connect', 'fbc_appId', '', 'STRING'),
	('facebook_connect', 'fbc_secret', '', 'STRING'),
	('flatter_theme', 'address_map', 'Disneyland, Anaheim, CA, United States', 'STRING'),
	('flatter_theme', 'ads_pubid', 'ca-pub-9187648588853292', 'STRING'),
	('flatter_theme', 'ads_slotid', '3098786166', 'STRING'),
	('flatter_theme', 'anim', '1', 'STRING'),
	('flatter_theme', 'cat_icon_1', 'fa fa-star', 'STRING'),
	('flatter_theme', 'cat_icon_2', 'fa fa-star', 'STRING'),
	('flatter_theme', 'cat_icon_3', 'fa fa-star', 'STRING'),
	('flatter_theme', 'cat_icon_4', 'fa fa-star', 'STRING'),
	('flatter_theme', 'cat_icon_5', 'fa fa-star', 'STRING'),
	('flatter_theme', 'cat_icon_6', 'fa fa-star', 'STRING'),
	('flatter_theme', 'cat_icon_7', 'fa fa-star', 'STRING'),
	('flatter_theme', 'cat_icon_8', 'fa fa-star', 'STRING'),
	('flatter_theme', 'contact_address', 'Enter your address', 'STRING'),
	('flatter_theme', 'contact_enable', '1', 'STRING'),
	('flatter_theme', 'custom_css', '', 'STRING'),
	('flatter_theme', 'defaultColor@all', 'blue', 'STRING'),
	('flatter_theme', 'defaultShowAs@all', 'list', 'STRING'),
	('flatter_theme', 'facebook_likebox', '1', 'STRING'),
	('flatter_theme', 'facebook_page', 'drizzledesign', 'STRING'),
	('flatter_theme', 'footer_link', '1', 'STRING'),
	('flatter_theme', 'fpromo_text', 'Post your ad Today. It’s totally free!', 'STRING'),
	('flatter_theme', 'geo_ads', '0', 'STRING'),
	('flatter_theme', 'google_adsense', '1', 'STRING'),
	('flatter_theme', 'google_analytics', '1', 'STRING'),
	('flatter_theme', 'google_webmaster', '1', 'STRING'),
	('flatter_theme', 'gplus_page', '+DrizzledesignsInOfficial', 'STRING'),
	('flatter_theme', 'g_analytics', 'Enter Tracking ID', 'STRING'),
	('flatter_theme', 'g_webmaster', 'Enter Meta Content', 'STRING'),
	('flatter_theme', 'keyword_placeholder', 'What are you looking for?', 'STRING'),
	('flatter_theme', 'landing_pop', 'Sample content for popup', 'STRING'),
	('flatter_theme', 'location_input', '1', 'STRING'),
	('flatter_theme', 'pinterest_page', 'drizzledesign', 'STRING'),
	('flatter_theme', 'pop_enable', '0', 'STRING'),
	('flatter_theme', 'pop_heading', 'Welcome', 'STRING'),
	('flatter_theme', 'position10_content', 'Widget Position #10', 'STRING'),
	('flatter_theme', 'position10_enable', '0', 'STRING'),
	('flatter_theme', 'position10_hide', '1', 'STRING'),
	('flatter_theme', 'position1_content', 'Widget Position #1', 'STRING'),
	('flatter_theme', 'position1_enable', '0', 'STRING'),
	('flatter_theme', 'position1_hide', '1', 'STRING'),
	('flatter_theme', 'position2_content', 'Widget Position #2', 'STRING'),
	('flatter_theme', 'position2_enable', '0', 'STRING'),
	('flatter_theme', 'position2_hide', '1', 'STRING'),
	('flatter_theme', 'position3_content', 'Widget Position #3', 'STRING'),
	('flatter_theme', 'position3_enable', '0', 'STRING'),
	('flatter_theme', 'position3_hide', '1', 'STRING'),
	('flatter_theme', 'position4_content', 'Widget Position #4', 'STRING'),
	('flatter_theme', 'position4_enable', '0', 'STRING'),
	('flatter_theme', 'position4_hide', '1', 'STRING'),
	('flatter_theme', 'position5_content', 'Widget Position #5', 'STRING'),
	('flatter_theme', 'position5_enable', '0', 'STRING'),
	('flatter_theme', 'position5_hide', '1', 'STRING'),
	('flatter_theme', 'position6_content', 'Widget Position #6', 'STRING'),
	('flatter_theme', 'position6_enable', '0', 'STRING'),
	('flatter_theme', 'position6_hide', '1', 'STRING'),
	('flatter_theme', 'position7_content', 'Widget Position #7', 'STRING'),
	('flatter_theme', 'position7_enable', '0', 'STRING'),
	('flatter_theme', 'position7_hide', '1', 'STRING'),
	('flatter_theme', 'position8_content', 'Widget Position #8', 'STRING'),
	('flatter_theme', 'position8_enable', '0', 'STRING'),
	('flatter_theme', 'position8_hide', '1', 'STRING'),
	('flatter_theme', 'position9_content', 'Widget Position #9', 'STRING'),
	('flatter_theme', 'position9_enable', '0', 'STRING'),
	('flatter_theme', 'position9_hide', '1', 'STRING'),
	('flatter_theme', 'premium_count', '5', 'STRING'),
	('flatter_theme', 'privacy_link', 'Link to Privacy policy page', 'STRING'),
	('flatter_theme', 'subscribe_show', '1', 'STRING'),
	('flatter_theme', 'terms_link', 'Link to Terms and conditions page', 'STRING'),
	('flatter_theme', 'twitter_page', 'DesignsDrizzle', 'STRING'),
	('flatter_theme', 'usefulinfo_msg', '<ul><li>Avoid scams by acting locally or paying with PayPal</li><li>Never pay with Western Union, Moneygram or other anonymous payment services</li><li>Don\'t buy or sell outside of your country. Don\'t accept cashier cheques from outside your country</li><li>This site is never involved in any transaction, and does not handle payments, shipping, guarantee transactions, provide escrow services, or offer "buyer protection" or "seller certification"</li></ul>', 'STRING'),
	('flatter_theme', 'usefulinfo_show', '1', 'STRING'),
	('flatter_theme', 'version', '1.3.7', 'STRING'),
	('osclass', 'active_plugins', 'a:1:{i:0;s:18:"facebook/index.php";}', 'STRING'),
	('osclass', 'admin_language', 'en_US', 'STRING'),
	('osclass', 'admin_theme', 'modern', 'STRING'),
	('osclass', 'akismetKey', '', 'STRING'),
	('osclass', 'allowedExt', 'png,gif,jpg,jpeg', 'STRING'),
	('osclass', 'allow_report_osclass', '1', 'BOOLEAN'),
	('osclass', 'auto_cron', '1', 'BOOLEAN'),
	('osclass', 'auto_update', 'disabled', 'STRING'),
	('osclass', 'comments_per_page', '10', 'INTEGER'),
	('osclass', 'contactEmail', 'info@digitalsense.in', 'STRING'),
	('osclass', 'contact_attachment', '0', 'BOOLEAN'),
	('osclass', 'csrf_name', 'CSRF525498424', 'STRING'),
	('osclass', 'currency', 'USD', 'STRING'),
	('osclass', 'dateFormat', 'F j, Y', 'STRING'),
	('osclass', 'defaultOrderField@search', 'dt_pub_date', 'STRING'),
	('osclass', 'defaultOrderType@search', '1', 'BOOLEAN'),
	('osclass', 'defaultResultsPerPage@search', '12', 'INTEGER'),
	('osclass', 'defaultShowAs@search', 'list', 'STRING'),
	('osclass', 'description_character_length', '5000', 'STRING'),
	('osclass', 'dimNormal', '640x480', 'STRING'),
	('osclass', 'dimPreview', '480x340', 'STRING'),
	('osclass', 'dimThumbnail', '240x200', 'STRING'),
	('osclass', 'enabled_comments', '1', 'BOOLEAN'),
	('osclass', 'enabled_recaptcha_items', '0', 'STRING'),
	('osclass', 'enabled_users', '1', 'BOOLEAN'),
	('osclass', 'enabled_user_registration', '1', 'BOOLEAN'),
	('osclass', 'enabled_user_validation', '1', 'BOOLEAN'),
	('osclass', 'enableField#f_price@items', '1', 'STRING'),
	('osclass', 'enableField#images@items', '1', 'STRING'),
	('osclass', 'force_aspect_image', '0', 'BOOLEAN'),
	('osclass', 'installed_plugins', 'a:1:{i:0;s:18:"facebook/index.php";}', 'STRING'),
	('osclass', 'items_wait_time', '0', 'STRING'),
	('osclass', 'item_attachment', '0', 'STRING'),
	('osclass', 'keep_original_image', '1', 'BOOLEAN'),
	('osclass', 'language', 'en_US', 'STRING'),
	('osclass', 'languages_downloaded', '["en_US"]', 'STRING'),
	('osclass', 'languages_last_version_check', '1455007875', 'STRING'),
	('osclass', 'languages_to_update', '[]', 'STRING'),
	('osclass', 'languages_update_count', '0', 'STRING'),
	('osclass', 'last_version_check', '1455010549', 'STRING'),
	('osclass', 'location_todo', '322', 'STRING'),
	('osclass', 'logged_user_item_validation', '1', 'STRING'),
	('osclass', 'mailserver_auth', '', 'BOOLEAN'),
	('osclass', 'mailserver_host', 'localhost', 'STRING'),
	('osclass', 'mailserver_mail_from', '', 'STRING'),
	('osclass', 'mailserver_name_from', '', 'STRING'),
	('osclass', 'mailserver_password', '', 'STRING'),
	('osclass', 'mailserver_pop', '', 'BOOLEAN'),
	('osclass', 'mailserver_port', '', 'INTEGER'),
	('osclass', 'mailserver_ssl', '', 'STRING'),
	('osclass', 'mailserver_type', 'custom', 'STRING'),
	('osclass', 'mailserver_username', '', 'STRING'),
	('osclass', 'marketAllowExternalSources', '0', 'BOOLEAN'),
	('osclass', 'marketAPIConnect', '', 'STRING'),
	('osclass', 'marketCategories', '', 'STRING'),
	('osclass', 'marketDataUpdate', '0', 'INTEGER'),
	('osclass', 'marketURL', 'http://market.osclass.org/api/v2/', 'STRING'),
	('osclass', 'maxLatestItems@home', '12', 'INTEGER'),
	('osclass', 'maxResultsPerPage@search', '50', 'INTEGER'),
	('osclass', 'maxSizeKb', '2048', 'INTEGER'),
	('osclass', 'moderate_comments', '0', 'INTEGER'),
	('osclass', 'moderate_items', '-1', 'STRING'),
	('osclass', 'mod_rewrite_loaded', '0', 'BOOLEAN'),
	('osclass', 'notify_contact_friends', '1', 'STRING'),
	('osclass', 'notify_contact_item', '1', 'STRING'),
	('osclass', 'notify_new_comment', '1', 'BOOLEAN'),
	('osclass', 'notify_new_comment_user', '0', 'BOOLEAN'),
	('osclass', 'notify_new_item', '1', 'STRING'),
	('osclass', 'notify_new_user', '1', 'BOOLEAN'),
	('osclass', 'numImages@items', '4', 'STRING'),
	('osclass', 'num_rss_items', '50', 'INTEGER'),
	('osclass', 'osclass_installed', '1', 'BOOLEAN'),
	('osclass', 'pageDesc', '', 'STRING'),
	('osclass', 'pageTitle', 'Ads', 'STRING'),
	('osclass', 'ping_search_engines', '1', 'BOOLEAN'),
	('osclass', 'plugins_downloaded', '["http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_analytics\\/update.php","http:\\/\\/www.osclass.org\\/files\\/plugins\\/google_maps\\/update.php"]', 'STRING'),
	('osclass', 'plugins_last_version_check', '1455007872', 'STRING'),
	('osclass', 'plugins_to_update', '[]', 'STRING'),
	('osclass', 'plugins_update_count', '0', 'STRING'),
	('osclass', 'purge_latest_searches', '1000', 'STRING'),
	('osclass', 'recaptchaPrivKey', '', 'STRING'),
	('osclass', 'recaptchaPubKey', '', 'STRING'),
	('osclass', 'reg_user_can_contact', '0', 'STRING'),
	('osclass', 'reg_user_post', '0', 'STRING'),
	('osclass', 'reg_user_post_comments', '0', 'BOOLEAN'),
	('osclass', 'rewriteEnabled', '0', 'BOOLEAN'),
	('osclass', 'rewrite_cat_url', '{CATEGORIES}', 'STRING'),
	('osclass', 'rewrite_contact', 'contact', 'STRING'),
	('osclass', 'rewrite_feed', 'feed', 'STRING'),
	('osclass', 'rewrite_item_activate', 'item/activate', 'STRING'),
	('osclass', 'rewrite_item_contact', 'item/contact', 'STRING'),
	('osclass', 'rewrite_item_delete', 'item/delete', 'STRING'),
	('osclass', 'rewrite_item_edit', 'item/edit', 'STRING'),
	('osclass', 'rewrite_item_mark', 'item/mark', 'STRING'),
	('osclass', 'rewrite_item_new', 'item/new', 'STRING'),
	('osclass', 'rewrite_item_resource_delete', 'resource/delete', 'STRING'),
	('osclass', 'rewrite_item_send_friend', 'item/send-friend', 'STRING'),
	('osclass', 'rewrite_item_url', '{CATEGORIES}/{ITEM_TITLE}_i{ITEM_ID}', 'STRING'),
	('osclass', 'rewrite_language', 'language', 'STRING'),
	('osclass', 'rewrite_page_url', '{PAGE_SLUG}-p{PAGE_ID}', 'STRING'),
	('osclass', 'rewrite_rules', '', 'STRING'),
	('osclass', 'rewrite_search_category', 'category', 'STRING'),
	('osclass', 'rewrite_search_city', 'city', 'STRING'),
	('osclass', 'rewrite_search_city_area', 'cityarea', 'STRING'),
	('osclass', 'rewrite_search_country', 'country', 'STRING'),
	('osclass', 'rewrite_search_pattern', 'pattern', 'STRING'),
	('osclass', 'rewrite_search_region', 'region', 'STRING'),
	('osclass', 'rewrite_search_url', 'search', 'STRING'),
	('osclass', 'rewrite_search_user', 'user', 'STRING'),
	('osclass', 'rewrite_user_activate', 'user/activate', 'STRING'),
	('osclass', 'rewrite_user_activate_alert', 'alert/confirm', 'STRING'),
	('osclass', 'rewrite_user_alerts', 'user/alerts', 'STRING'),
	('osclass', 'rewrite_user_change_email', 'email/change', 'STRING'),
	('osclass', 'rewrite_user_change_email_confirm', 'email/confirm', 'STRING'),
	('osclass', 'rewrite_user_change_password', 'password/change', 'STRING'),
	('osclass', 'rewrite_user_change_username', 'username/change', 'STRING'),
	('osclass', 'rewrite_user_dashboard', 'user/dashboard', 'STRING'),
	('osclass', 'rewrite_user_forgot', 'user/forgot', 'STRING'),
	('osclass', 'rewrite_user_items', 'user/items', 'STRING'),
	('osclass', 'rewrite_user_login', 'user/login', 'STRING'),
	('osclass', 'rewrite_user_logout', 'user/logout', 'STRING'),
	('osclass', 'rewrite_user_profile', 'user/profile', 'STRING'),
	('osclass', 'rewrite_user_recover', 'user/recover', 'STRING'),
	('osclass', 'rewrite_user_register', 'user/register', 'STRING'),
	('osclass', 'save_latest_searches', '0', 'BOOLEAN'),
	('osclass', 'selectable_parent_categories', '0', 'BOOLEAN'),
	('osclass', 'seo_url_search_prefix', '', 'STRING'),
	('osclass', 'subdomain_host', '', 'STRING'),
	('osclass', 'subdomain_type', '', 'STRING'),
	('osclass', 'theme', 'flatter', 'STRING'),
	('osclass', 'themes_downloaded', '["bender"]', 'STRING'),
	('osclass', 'themes_last_version_check', '1455007876', 'STRING'),
	('osclass', 'themes_to_update', '[]', 'STRING'),
	('osclass', 'themes_update_count', '0', 'STRING'),
	('osclass', 'timeFormat', 'g:i a', 'STRING'),
	('osclass', 'timezone', 'Europe/Madrid', 'STRING'),
	('osclass', 'title_character_length', '100', 'STRING'),
	('osclass', 'update_core_json', '', 'STRING'),
	('osclass', 'username_blacklist', 'admin,user', 'STRING'),
	('osclass', 'use_imagick', '0', 'BOOLEAN'),
	('osclass', 'version', '361', 'INTEGER'),
	('osclass', 'warn_expiration', '3', 'STRING'),
	('osclass', 'watermark_image', '', 'STRING'),
	('osclass', 'watermark_place', 'centre', 'STRING'),
	('osclass', 'watermark_text', '', 'STRING'),
	('osclass', 'watermark_text_color', '', 'STRING'),
	('osclass', 'weekStart', '0', 'STRING');
/*!40000 ALTER TABLE `oc_t_preference` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_region
CREATE TABLE IF NOT EXISTS `oc_t_region` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_c_country_code` char(2) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `b_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pk_i_id`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  KEY `idx_s_name` (`s_name`),
  KEY `idx_s_slug` (`s_slug`),
  CONSTRAINT `oc_t_region_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`)
) ENGINE=InnoDB AUTO_INCREMENT=716801 DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_region: ~18 rows (approximately)
DELETE FROM `oc_t_region`;
/*!40000 ALTER TABLE `oc_t_region` DISABLE KEYS */;
INSERT INTO `oc_t_region` (`pk_i_id`, `fk_c_country_code`, `s_name`, `s_slug`, `b_active`) VALUES
	(706625, 'hn', 'Intibucá', 'intibuca', 1),
	(706626, 'hn', 'Islas de la Bahía', 'islas-de-la-bahia', 1),
	(706628, 'hn', 'Lempira', 'lempira', 1),
	(706629, 'hn', 'Ocotepeque', 'ocotepeque', 1),
	(706630, 'hn', 'Olancho', 'olancho', 1),
	(706631, 'hn', 'Santa Bárbara', 'santa-barbara', 1),
	(706632, 'hn', 'Valle', 'valle', 1),
	(706633, 'hn', 'Yoro', 'yoro', 1),
	(706634, 'hn', 'Atlántida', 'atlantida', 1),
	(706635, 'hn', 'Choluteca', 'choluteca', 1),
	(706637, 'hn', 'Comayagua', 'comayagua', 1),
	(706638, 'hn', 'Copán', 'copan', 1),
	(706640, 'hn', 'El Paraíso', 'el-paraiso', 1),
	(706641, 'hn', 'Francisco Morazán', 'francisco-morazan', 1),
	(706642, 'hn', 'Gracias a Dios', 'gracias-a-dios', 1),
	(716646, 'hn', 'Colón', 'colon', 1),
	(716708, 'hn', 'Cortés', 'cortes', 1),
	(716800, 'hn', 'La Paz', 'la-paz', 1);
/*!40000 ALTER TABLE `oc_t_region` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_region_stats
CREATE TABLE IF NOT EXISTS `oc_t_region_stats` (
  `fk_i_region_id` int(10) unsigned NOT NULL,
  `i_num_items` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fk_i_region_id`),
  KEY `idx_num_items` (`i_num_items`),
  CONSTRAINT `oc_t_region_stats_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_region_stats: ~18 rows (approximately)
DELETE FROM `oc_t_region_stats`;
/*!40000 ALTER TABLE `oc_t_region_stats` DISABLE KEYS */;
INSERT INTO `oc_t_region_stats` (`fk_i_region_id`, `i_num_items`) VALUES
	(706625, 0),
	(706626, 0),
	(706628, 0),
	(706629, 0),
	(706630, 0),
	(706631, 0),
	(706632, 0),
	(706633, 0),
	(706634, 0),
	(706635, 0),
	(706637, 0),
	(706638, 0),
	(706640, 0),
	(706641, 0),
	(706642, 0),
	(716646, 0),
	(716708, 0),
	(716800, 0);
/*!40000 ALTER TABLE `oc_t_region_stats` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_user
CREATE TABLE IF NOT EXISTS `oc_t_user` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dt_reg_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(100) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `s_email` varchar(100) NOT NULL,
  `s_website` varchar(100) DEFAULT NULL,
  `s_phone_land` varchar(45) DEFAULT NULL,
  `s_phone_mobile` varchar(45) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `s_pass_code` varchar(100) DEFAULT NULL,
  `s_pass_date` datetime DEFAULT NULL,
  `s_pass_ip` varchar(15) DEFAULT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) unsigned DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) unsigned DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) unsigned DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL,
  `b_company` tinyint(1) NOT NULL DEFAULT '0',
  `i_items` int(10) unsigned DEFAULT '0',
  `i_comments` int(10) unsigned DEFAULT '0',
  `dt_access_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `s_access_ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`pk_i_id`),
  UNIQUE KEY `s_email` (`s_email`),
  KEY `idx_s_name` (`s_name`(6)),
  KEY `idx_s_username` (`s_username`),
  KEY `fk_c_country_code` (`fk_c_country_code`),
  KEY `fk_i_region_id` (`fk_i_region_id`),
  KEY `fk_i_city_id` (`fk_i_city_id`),
  KEY `fk_i_city_area_id` (`fk_i_city_area_id`),
  CONSTRAINT `oc_t_user_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  CONSTRAINT `oc_t_user_ibfk_2` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  CONSTRAINT `oc_t_user_ibfk_3` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  CONSTRAINT `oc_t_user_ibfk_4` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_user: ~1 rows (approximately)
DELETE FROM `oc_t_user`;
/*!40000 ALTER TABLE `oc_t_user` DISABLE KEYS */;
INSERT INTO `oc_t_user` (`pk_i_id`, `dt_reg_date`, `dt_mod_date`, `s_name`, `s_username`, `s_password`, `s_secret`, `s_email`, `s_website`, `s_phone_land`, `s_phone_mobile`, `b_enabled`, `b_active`, `s_pass_code`, `s_pass_date`, `s_pass_ip`, `fk_c_country_code`, `s_country`, `s_address`, `s_zip`, `fk_i_region_id`, `s_region`, `fk_i_city_id`, `s_city`, `fk_i_city_area_id`, `s_city_area`, `d_coord_lat`, `d_coord_long`, `b_company`, `i_items`, `i_comments`, `dt_access_date`, `s_access_ip`) VALUES
	(2, '2016-02-09 10:54:59', '2016-02-09 10:59:12', 'Aayu', '2', '$2y$15$yLIK6/EOnxgkJ4dJEP3ozufY2Cp29PgRqkXOTdJZrSPJWx5mHz2aq', 'slKGNHII', 'aayushijain26@gmail.com', '', '', '', 1, 1, NULL, NULL, NULL, NULL, 'Honduras', '', '', 706634, 'Atlántida', 30582, 'Arizona', NULL, '', NULL, NULL, 0, 0, 0, '2016-02-09 10:57:08', '::1');
/*!40000 ALTER TABLE `oc_t_user` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_user_description
CREATE TABLE IF NOT EXISTS `oc_t_user_description` (
  `fk_i_user_id` int(10) unsigned NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_info` text,
  PRIMARY KEY (`fk_i_user_id`,`fk_c_locale_code`),
  KEY `fk_c_locale_code` (`fk_c_locale_code`),
  CONSTRAINT `oc_t_user_description_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  CONSTRAINT `oc_t_user_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_user_description: ~1 rows (approximately)
DELETE FROM `oc_t_user_description`;
/*!40000 ALTER TABLE `oc_t_user_description` DISABLE KEYS */;
INSERT INTO `oc_t_user_description` (`fk_i_user_id`, `fk_c_locale_code`, `s_info`) VALUES
	(2, 'en_US', '');
/*!40000 ALTER TABLE `oc_t_user_description` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_user_email_tmp
CREATE TABLE IF NOT EXISTS `oc_t_user_email_tmp` (
  `fk_i_user_id` int(10) unsigned NOT NULL,
  `s_new_email` varchar(100) NOT NULL,
  `dt_date` datetime NOT NULL,
  PRIMARY KEY (`fk_i_user_id`),
  CONSTRAINT `oc_t_user_email_tmp_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_user_email_tmp: ~0 rows (approximately)
DELETE FROM `oc_t_user_email_tmp`;
/*!40000 ALTER TABLE `oc_t_user_email_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_user_email_tmp` ENABLE KEYS */;


-- Dumping structure for table ads.oc_t_widget
CREATE TABLE IF NOT EXISTS `oc_t_widget` (
  `pk_i_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `s_description` varchar(40) NOT NULL,
  `s_location` varchar(40) NOT NULL,
  `e_kind` enum('TEXT','HTML') NOT NULL,
  `s_content` mediumtext NOT NULL,
  PRIMARY KEY (`pk_i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ads.oc_t_widget: ~0 rows (approximately)
DELETE FROM `oc_t_widget`;
/*!40000 ALTER TABLE `oc_t_widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_t_widget` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
