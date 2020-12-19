-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('caution',	'Caution',	0),
('society_ambulance',	'Ambulance',	1),
('society_cardealer',	'Concessionnaire',	1),
('society_mechanic',	'Mécano',	1),
('society_police',	'Police',	1),
('society_taxi',	'Taxi',	1),
('society_unicorn',	'Unicorn',	1);

DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_ambulance',	'Ambulance',	1),
('society_cardealer',	'Concesionnaire',	1),
('society_mechanic',	'Mécano',	1),
('society_police',	'Police',	1),
('society_taxi',	'Taxi',	1),
('society_unicorn',	'Unicorn',	1),
('society_unicorn_fridge',	'Unicorn (frigo)',	1);

DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `billing`;
CREATE TABLE `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `cardealer_vehicles`;
CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `datastore`;
CREATE TABLE `datastore` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_ambulance',	'Ambulance',	1),
('society_mechanic',	'Mécano',	1),
('society_police',	'Police',	1),
('society_taxi',	'Taxi',	1),
('society_unicorn',	'Unicorn',	1),
('user_ears',	'Ears',	0),
('user_glasses',	'Glasses',	0),
('user_helmet',	'Helmet',	0),
('user_mask',	'Mask',	0);

DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1,	'Usage abusif du klaxon',	30,	0),
(2,	'Franchir une ligne continue',	40,	0),
(3,	'Circulation à contresens',	250,	0),
(4,	'Demi-tour non autorisé',	250,	0),
(5,	'Circulation hors-route',	170,	0),
(6,	'Non-respect des distances de sécurité',	30,	0),
(7,	'Arrêt dangereux / interdit',	150,	0),
(8,	'Stationnement gênant / interdit',	70,	0),
(9,	'Non respect  de la priorité à droite',	70,	0),
(10,	'Non-respect à un véhicule prioritaire',	90,	0),
(11,	'Non-respect d\'un stop',	105,	0),
(12,	'Non-respect d\'un feu rouge',	130,	0),
(13,	'Dépassement dangereux',	100,	0),
(14,	'Véhicule non en état',	100,	0),
(15,	'Conduite sans permis',	1500,	0),
(16,	'Délit de fuite',	800,	0),
(17,	'Excès de vitesse < 5 kmh',	90,	0),
(18,	'Excès de vitesse 5-15 kmh',	120,	0),
(19,	'Excès de vitesse 15-30 kmh',	180,	0),
(20,	'Excès de vitesse > 30 kmh',	300,	0),
(21,	'Entrave de la circulation',	110,	1),
(22,	'Dégradation de la voie publique',	90,	1),
(23,	'Trouble à l\'ordre publique',	90,	1),
(24,	'Entrave opération de police',	130,	1),
(25,	'Insulte envers / entre civils',	75,	1),
(26,	'Outrage à agent de police',	110,	1),
(27,	'Menace verbale ou intimidation envers civil',	90,	1),
(28,	'Menace verbale ou intimidation envers policier',	150,	1),
(29,	'Manifestation illégale',	250,	1),
(30,	'Tentative de corruption',	1500,	1),
(31,	'Arme blanche sortie en ville',	120,	2),
(32,	'Arme léthale sortie en ville',	300,	2),
(33,	'Port d\'arme non autorisé (défaut de license)',	600,	2),
(34,	'Port d\'arme illégal',	700,	2),
(35,	'Pris en flag lockpick',	300,	2),
(36,	'Vol de voiture',	1800,	2),
(37,	'Vente de drogue',	1500,	2),
(38,	'Fabriquation de drogue',	1500,	2),
(39,	'Possession de drogue',	650,	2),
(40,	'Prise d\'ôtage civil',	1500,	2),
(41,	'Prise d\'ôtage agent de l\'état',	2000,	2),
(42,	'Braquage particulier',	650,	2),
(43,	'Braquage magasin',	650,	2),
(44,	'Braquage de banque',	1500,	2),
(45,	'Tir sur civil',	2000,	3),
(46,	'Tir sur agent de l\'état',	2500,	3),
(47,	'Tentative de meurtre sur civil',	3000,	3),
(48,	'Tentative de meurtre sur agent de l\'état',	5000,	3),
(49,	'Meurtre sur civil',	10000,	3),
(50,	'Meurte sur agent de l\'état',	30000,	3),
(51,	'Meurtre involontaire',	1800,	3),
(52,	'Escroquerie à l\'entreprise',	2000,	2);

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('alive_chicken',	'Poulet vivant',	1,	0,	1),
('bandage',	'Bandage',	2,	0,	1),
('beer',	'Beer',	1,	0,	1),
('blowpipe',	'Chalumeaux',	2,	0,	1),
('bolcacahuetes',	'Bol de cacahuètes',	5,	0,	1),
('bolchips',	'Bol de chips',	5,	0,	1),
('bolnoixcajou',	'Bol de noix de cajou',	5,	0,	1),
('bolpistache',	'Bol de pistaches',	5,	0,	1),
('bread',	'Bread',	1,	0,	1),
('carokit',	'Kit carosserie',	3,	0,	1),
('carotool',	'outils carosserie',	2,	0,	1),
('clothe',	'Vêtement',	1,	0,	1),
('copper',	'Cuivre',	1,	0,	1),
('cutted_wood',	'Bois coupé',	1,	0,	1),
('diamond',	'Diamant',	1,	0,	1),
('drpepper',	'Dr. Pepper',	5,	0,	1),
('energy',	'Energy Drink',	5,	0,	1),
('essence',	'Essence',	1,	0,	1),
('fabric',	'Tissu',	1,	0,	1),
('fish',	'Poisson',	1,	0,	1),
('fixkit',	'Kit réparation',	3,	0,	1),
('fixtool',	'outils réparation',	2,	0,	1),
('gazbottle',	'bouteille de gaz',	2,	0,	1),
('gold',	'Or',	1,	0,	1),
('golem',	'Golem',	5,	0,	1),
('grapperaisin',	'Grappe de raisin',	5,	0,	1),
('ice',	'Glaçon',	5,	0,	1),
('icetea',	'Ice Tea',	5,	0,	1),
('iron',	'Fer',	1,	0,	1),
('jager',	'Jägermeister',	5,	0,	1),
('jagerbomb',	'Jägerbomb',	5,	0,	1),
('jagercerbere',	'Jäger Cerbère',	3,	0,	1),
('jusfruit',	'Jus de fruits',	5,	0,	1),
('limonade',	'Limonade',	5,	0,	1),
('martini',	'Martini blanc',	5,	0,	1),
('medikit',	'Medikit',	2,	0,	1),
('menthe',	'Feuille de menthe',	10,	0,	1),
('metreshooter',	'Mètre de shooter',	3,	0,	1),
('mixapero',	'Mix Apéritif',	3,	0,	1),
('mojito',	'Mojito',	5,	0,	1),
('packaged_chicken',	'Poulet en barquette',	1,	0,	1),
('packaged_plank',	'Paquet de planches',	1,	0,	1),
('petrol',	'Pétrole',	1,	0,	1),
('petrol_raffin',	'Pétrole Raffiné',	1,	0,	1),
('rhum',	'Rhum',	5,	0,	1),
('rhumcoca',	'Rhum-coca',	5,	0,	1),
('rhumfruit',	'Rhum-jus de fruits',	5,	0,	1),
('saucisson',	'Saucisson',	5,	0,	1),
('slaughtered_chicken',	'Poulet abattu',	1,	0,	1),
('soda',	'Soda',	5,	0,	1),
('stone',	'Pierre',	1,	0,	1),
('teqpaf',	'Teq\'paf',	5,	0,	1),
('tequila',	'Tequila',	5,	0,	1),
('vodka',	'Vodka',	5,	0,	1),
('vodkaenergy',	'Vodka-energy',	5,	0,	1),
('vodkafruit',	'Vodka-jus de fruits',	5,	0,	1),
('washed_stone',	'Pierre Lavée',	1,	0,	1),
('water',	'Water',	1,	0,	1),
('whisky',	'Whisky',	5,	0,	1),
('whiskycoca',	'Whisky-coca',	5,	0,	1),
('wood',	'Bois',	1,	0,	1),
('wool',	'Laine',	1,	0,	1);

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ambulance',	'Ambulance',	0),
('cardealer',	'Concessionnaire',	0),
('fisherman',	'Pêcheur',	0),
('fueler',	'Raffineur',	0),
('lumberjack',	'Bûcheron',	0),
('mechanic',	'Mécano',	0),
('miner',	'Mineur',	0),
('police',	'LSPD',	0),
('reporter',	'Journaliste',	0),
('slaughterer',	'Abatteur',	0),
('tailor',	'Couturier',	0),
('taxi',	'Taxi',	0),
('unemployed',	'Unemployed',	0),
('unicorn',	'Unicorn',	1);

DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1,	'unemployed',	0,	'unemployed',	'Unemployed',	200,	'{}',	'{}'),
(2,	'lumberjack',	0,	'employee',	'Intérimaire',	0,	'{}',	'{}'),
(3,	'fisherman',	0,	'employee',	'Intérimaire',	0,	'{}',	'{}'),
(4,	'fueler',	0,	'employee',	'Intérimaire',	0,	'{}',	'{}'),
(5,	'reporter',	0,	'employee',	'Intérimaire',	0,	'{}',	'{}'),
(6,	'tailor',	0,	'employee',	'Intérimaire',	0,	'{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}',	'{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),
(7,	'miner',	0,	'employee',	'Intérimaire',	0,	'{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}',	'{}'),
(8,	'slaughterer',	0,	'employee',	'Intérimaire',	0,	'{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}',	'{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),
(9,	'cardealer',	0,	'recruit',	'Recrue',	10,	'{}',	'{}'),
(10,	'cardealer',	1,	'novice',	'Novice',	25,	'{}',	'{}'),
(11,	'cardealer',	2,	'experienced',	'Experimente',	40,	'{}',	'{}'),
(12,	'cardealer',	3,	'boss',	'Patron',	0,	'{}',	'{}'),
(13,	'police',	0,	'recruit',	'Recrue',	20,	'{}',	'{}'),
(14,	'police',	1,	'officer',	'Officier',	40,	'{}',	'{}'),
(15,	'police',	2,	'sergeant',	'Sergent',	60,	'{}',	'{}'),
(16,	'police',	3,	'lieutenant',	'Lieutenant',	85,	'{}',	'{}'),
(17,	'police',	4,	'boss',	'Commandant',	100,	'{}',	'{}'),
(18,	'ambulance',	0,	'ambulance',	'Ambulancier',	20,	'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',	'{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(19,	'ambulance',	1,	'doctor',	'Medecin',	40,	'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',	'{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(20,	'ambulance',	2,	'chief_doctor',	'Medecin-chef',	60,	'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',	'{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(21,	'ambulance',	3,	'boss',	'Chirurgien',	80,	'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}',	'{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(22,	'mechanic',	0,	'recrue',	'Recrue',	12,	'{}',	'{}'),
(23,	'mechanic',	1,	'novice',	'Novice',	24,	'{}',	'{}'),
(24,	'mechanic',	2,	'experimente',	'Experimente',	36,	'{}',	'{}'),
(25,	'mechanic',	3,	'chief',	'Chef d\'équipe',	48,	'{}',	'{}'),
(26,	'mechanic',	4,	'boss',	'Patron',	0,	'{}',	'{}'),
(27,	'taxi',	0,	'recrue',	'Recrue',	12,	'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}',	'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(28,	'taxi',	1,	'novice',	'Novice',	24,	'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}',	'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(29,	'taxi',	2,	'experimente',	'Experimente',	36,	'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}',	'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(30,	'taxi',	3,	'uber',	'Uber',	48,	'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}',	'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(31,	'taxi',	4,	'boss',	'Patron',	0,	'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}',	'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(32,	'unicorn',	0,	'barman',	'Barman',	300,	'{}',	'{}'),
(33,	'unicorn',	1,	'dancer',	'Danseur',	300,	'{}',	'{}'),
(34,	'unicorn',	2,	'viceboss',	'Co-gérant',	500,	'{}',	'{}'),
(35,	'unicorn',	3,	'boss',	'Gérant',	600,	'{}',	'{}');

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE `licenses` (
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE `owned_vehicles` (
  `owner` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
(1,	'TwentyFourSeven',	'bread',	30),
(2,	'TwentyFourSeven',	'water',	15),
(3,	'RobsLiquor',	'bread',	30),
(4,	'RobsLiquor',	'water',	15),
(5,	'LTDgasoline',	'bread',	30),
(6,	'LTDgasoline',	'water',	15),
(7,	'TwentyFourSeven',	'beer',	45),
(8,	'RobsLiquor',	'beer',	45),
(9,	'LTDgasoline',	'beer',	45);

DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `identifier` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accounts` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `inventory` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `skin` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dateofbirth` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Adder',	'adder',	900000,	'super'),
('Akuma',	'AKUMA',	7500,	'motorcycles'),
('Alpha',	'alpha',	60000,	'sports'),
('Ardent',	'ardent',	1150000,	'sportsclassics'),
('Asea',	'asea',	5500,	'sedans'),
('Autarch',	'autarch',	1955000,	'super'),
('Avarus',	'avarus',	18000,	'motorcycles'),
('Bagger',	'bagger',	13500,	'motorcycles'),
('Baller',	'baller2',	40000,	'suvs'),
('Baller Sport',	'baller3',	60000,	'suvs'),
('Banshee',	'banshee',	70000,	'sports'),
('Banshee 900R',	'banshee2',	255000,	'super'),
('Bati 801',	'bati',	12000,	'motorcycles'),
('Bati 801RR',	'bati2',	19000,	'motorcycles'),
('Bestia GTS',	'bestiagts',	55000,	'sports'),
('BF400',	'bf400',	6500,	'motorcycles'),
('Bf Injection',	'bfinjection',	16000,	'offroad'),
('Bifta',	'bifta',	12000,	'offroad'),
('Bison',	'bison',	45000,	'vans'),
('Blade',	'blade',	15000,	'muscle'),
('Blazer',	'blazer',	6500,	'offroad'),
('Blazer Sport',	'blazer4',	8500,	'offroad'),
('blazer5',	'blazer5',	1755600,	'offroad'),
('Blista',	'blista',	8000,	'compacts'),
('BMX (velo)',	'bmx',	160,	'motorcycles'),
('Bobcat XL',	'bobcatxl',	32000,	'vans'),
('Brawler',	'brawler',	45000,	'offroad'),
('Brioso R/A',	'brioso',	18000,	'compacts'),
('Btype',	'btype',	62000,	'sportsclassics'),
('Btype Hotroad',	'btype2',	155000,	'sportsclassics'),
('Btype Luxe',	'btype3',	85000,	'sportsclassics'),
('Buccaneer',	'buccaneer',	18000,	'muscle'),
('Buccaneer Rider',	'buccaneer2',	24000,	'muscle'),
('Buffalo',	'buffalo',	12000,	'sports'),
('Buffalo S',	'buffalo2',	20000,	'sports'),
('Bullet',	'bullet',	90000,	'super'),
('Burrito',	'burrito3',	19000,	'vans'),
('Camper',	'camper',	42000,	'vans'),
('Carbonizzare',	'carbonizzare',	75000,	'sports'),
('Carbon RS',	'carbonrs',	18000,	'motorcycles'),
('Casco',	'casco',	30000,	'sportsclassics'),
('Cavalcade',	'cavalcade2',	55000,	'suvs'),
('Cheetah',	'cheetah',	375000,	'super'),
('Chimera',	'chimera',	38000,	'motorcycles'),
('Chino',	'chino',	15000,	'muscle'),
('Chino Luxe',	'chino2',	19000,	'muscle'),
('Cliffhanger',	'cliffhanger',	9500,	'motorcycles'),
('Cognoscenti Cabrio',	'cogcabrio',	55000,	'coupes'),
('Cognoscenti',	'cognoscenti',	55000,	'sedans'),
('Comet',	'comet2',	65000,	'sports'),
('Comet 5',	'comet5',	1145000,	'sports'),
('Contender',	'contender',	70000,	'suvs'),
('Coquette',	'coquette',	65000,	'sports'),
('Coquette Classic',	'coquette2',	40000,	'sportsclassics'),
('Coquette BlackFin',	'coquette3',	55000,	'muscle'),
('Cruiser (velo)',	'cruiser',	510,	'motorcycles'),
('Cyclone',	'cyclone',	1890000,	'super'),
('Daemon',	'daemon',	11500,	'motorcycles'),
('Daemon High',	'daemon2',	13500,	'motorcycles'),
('Defiler',	'defiler',	9800,	'motorcycles'),
('Deluxo',	'deluxo',	4721500,	'sportsclassics'),
('Dominator',	'dominator',	35000,	'muscle'),
('Double T',	'double',	28000,	'motorcycles'),
('Dubsta',	'dubsta',	45000,	'suvs'),
('Dubsta Luxuary',	'dubsta2',	60000,	'suvs'),
('Bubsta 6x6',	'dubsta3',	120000,	'offroad'),
('Dukes',	'dukes',	28000,	'muscle'),
('Dune Buggy',	'dune',	8000,	'offroad'),
('Elegy',	'elegy2',	38500,	'sports'),
('Emperor',	'emperor',	8500,	'sedans'),
('Enduro',	'enduro',	5500,	'motorcycles'),
('Entity XF',	'entityxf',	425000,	'super'),
('Esskey',	'esskey',	4200,	'motorcycles'),
('Exemplar',	'exemplar',	32000,	'coupes'),
('F620',	'f620',	40000,	'coupes'),
('Faction',	'faction',	20000,	'muscle'),
('Faction Rider',	'faction2',	30000,	'muscle'),
('Faction XL',	'faction3',	40000,	'muscle'),
('Faggio',	'faggio',	1900,	'motorcycles'),
('Vespa',	'faggio2',	2800,	'motorcycles'),
('Felon',	'felon',	42000,	'coupes'),
('Felon GT',	'felon2',	55000,	'coupes'),
('Feltzer',	'feltzer2',	55000,	'sports'),
('Stirling GT',	'feltzer3',	65000,	'sportsclassics'),
('Fixter (velo)',	'fixter',	225,	'motorcycles'),
('FMJ',	'fmj',	185000,	'super'),
('Fhantom',	'fq2',	17000,	'suvs'),
('Fugitive',	'fugitive',	12000,	'sedans'),
('Furore GT',	'furoregt',	45000,	'sports'),
('Fusilade',	'fusilade',	40000,	'sports'),
('Gargoyle',	'gargoyle',	16500,	'motorcycles'),
('Gauntlet',	'gauntlet',	30000,	'muscle'),
('Gang Burrito',	'gburrito',	45000,	'vans'),
('Burrito',	'gburrito2',	29000,	'vans'),
('Glendale',	'glendale',	6500,	'sedans'),
('Grabger',	'granger',	50000,	'suvs'),
('Gresley',	'gresley',	47500,	'suvs'),
('GT 500',	'gt500',	785000,	'sportsclassics'),
('Guardian',	'guardian',	45000,	'offroad'),
('Hakuchou',	'hakuchou',	31000,	'motorcycles'),
('Hakuchou Sport',	'hakuchou2',	55000,	'motorcycles'),
('Hermes',	'hermes',	535000,	'muscle'),
('Hexer',	'hexer',	12000,	'motorcycles'),
('Hotknife',	'hotknife',	125000,	'muscle'),
('Huntley S',	'huntley',	40000,	'suvs'),
('Hustler',	'hustler',	625000,	'muscle'),
('Infernus',	'infernus',	180000,	'super'),
('Innovation',	'innovation',	23500,	'motorcycles'),
('Intruder',	'intruder',	7500,	'sedans'),
('Issi',	'issi2',	10000,	'compacts'),
('Jackal',	'jackal',	38000,	'coupes'),
('Jester',	'jester',	65000,	'sports'),
('Jester(Racecar)',	'jester2',	135000,	'sports'),
('Journey',	'journey',	6500,	'vans'),
('Kamacho',	'kamacho',	345000,	'offroad'),
('Khamelion',	'khamelion',	38000,	'sports'),
('Kuruma',	'kuruma',	30000,	'sports'),
('Landstalker',	'landstalker',	35000,	'suvs'),
('RE-7B',	'le7b',	325000,	'super'),
('Lynx',	'lynx',	40000,	'sports'),
('Mamba',	'mamba',	70000,	'sports'),
('Manana',	'manana',	12800,	'sportsclassics'),
('Manchez',	'manchez',	5300,	'motorcycles'),
('Massacro',	'massacro',	65000,	'sports'),
('Massacro(Racecar)',	'massacro2',	130000,	'sports'),
('Mesa',	'mesa',	16000,	'suvs'),
('Mesa Trail',	'mesa3',	40000,	'suvs'),
('Minivan',	'minivan',	13000,	'vans'),
('Monroe',	'monroe',	55000,	'sportsclassics'),
('The Liberator',	'monster',	210000,	'offroad'),
('Moonbeam',	'moonbeam',	18000,	'vans'),
('Moonbeam Rider',	'moonbeam2',	35000,	'vans'),
('Nemesis',	'nemesis',	5800,	'motorcycles'),
('Neon',	'neon',	1500000,	'sports'),
('Nightblade',	'nightblade',	35000,	'motorcycles'),
('Nightshade',	'nightshade',	65000,	'muscle'),
('9F',	'ninef',	65000,	'sports'),
('9F Cabrio',	'ninef2',	80000,	'sports'),
('Omnis',	'omnis',	35000,	'sports'),
('Oppressor',	'oppressor',	3524500,	'super'),
('Oracle XS',	'oracle2',	35000,	'coupes'),
('Osiris',	'osiris',	160000,	'super'),
('Panto',	'panto',	10000,	'compacts'),
('Paradise',	'paradise',	19000,	'vans'),
('Pariah',	'pariah',	1420000,	'sports'),
('Patriot',	'patriot',	55000,	'suvs'),
('PCJ-600',	'pcj',	6200,	'motorcycles'),
('Penumbra',	'penumbra',	28000,	'sports'),
('Pfister',	'pfister811',	85000,	'super'),
('Phoenix',	'phoenix',	12500,	'muscle'),
('Picador',	'picador',	18000,	'muscle'),
('Pigalle',	'pigalle',	20000,	'sportsclassics'),
('Prairie',	'prairie',	12000,	'compacts'),
('Premier',	'premier',	8000,	'sedans'),
('Primo Custom',	'primo2',	14000,	'sedans'),
('X80 Proto',	'prototipo',	2500000,	'super'),
('Radius',	'radi',	29000,	'suvs'),
('raiden',	'raiden',	1375000,	'sports'),
('Rapid GT',	'rapidgt',	35000,	'sports'),
('Rapid GT Convertible',	'rapidgt2',	45000,	'sports'),
('Rapid GT3',	'rapidgt3',	885000,	'sportsclassics'),
('Reaper',	'reaper',	150000,	'super'),
('Rebel',	'rebel2',	35000,	'offroad'),
('Regina',	'regina',	5000,	'sedans'),
('Retinue',	'retinue',	615000,	'sportsclassics'),
('Revolter',	'revolter',	1610000,	'sports'),
('riata',	'riata',	380000,	'offroad'),
('Rocoto',	'rocoto',	45000,	'suvs'),
('Ruffian',	'ruffian',	6800,	'motorcycles'),
('Ruiner 2',	'ruiner2',	5745600,	'muscle'),
('Rumpo',	'rumpo',	15000,	'vans'),
('Rumpo Trail',	'rumpo3',	19500,	'vans'),
('Sabre Turbo',	'sabregt',	20000,	'muscle'),
('Sabre GT',	'sabregt2',	25000,	'muscle'),
('Sanchez',	'sanchez',	5300,	'motorcycles'),
('Sanchez Sport',	'sanchez2',	5300,	'motorcycles'),
('Sanctus',	'sanctus',	25000,	'motorcycles'),
('Sandking',	'sandking',	55000,	'offroad'),
('Savestra',	'savestra',	990000,	'sportsclassics'),
('SC 1',	'sc1',	1603000,	'super'),
('Schafter',	'schafter2',	25000,	'sedans'),
('Schafter V12',	'schafter3',	50000,	'sports'),
('Scorcher (velo)',	'scorcher',	280,	'motorcycles'),
('Seminole',	'seminole',	25000,	'suvs'),
('Sentinel',	'sentinel',	32000,	'coupes'),
('Sentinel XS',	'sentinel2',	40000,	'coupes'),
('Sentinel3',	'sentinel3',	650000,	'sports'),
('Seven 70',	'seven70',	39500,	'sports'),
('ETR1',	'sheava',	220000,	'super'),
('Shotaro Concept',	'shotaro',	320000,	'motorcycles'),
('Slam Van',	'slamvan3',	11500,	'muscle'),
('Sovereign',	'sovereign',	22000,	'motorcycles'),
('Stinger',	'stinger',	80000,	'sportsclassics'),
('Stinger GT',	'stingergt',	75000,	'sportsclassics'),
('Streiter',	'streiter',	500000,	'sports'),
('Stretch',	'stretch',	90000,	'sedans'),
('Stromberg',	'stromberg',	3185350,	'sports'),
('Sultan',	'sultan',	15000,	'sports'),
('Sultan RS',	'sultanrs',	65000,	'super'),
('Super Diamond',	'superd',	130000,	'sedans'),
('Surano',	'surano',	50000,	'sports'),
('Surfer',	'surfer',	12000,	'vans'),
('T20',	't20',	300000,	'super'),
('Tailgater',	'tailgater',	30000,	'sedans'),
('Tampa',	'tampa',	16000,	'muscle'),
('Drift Tampa',	'tampa2',	80000,	'sports'),
('Thrust',	'thrust',	24000,	'motorcycles'),
('Tri bike (velo)',	'tribike3',	520,	'motorcycles'),
('Trophy Truck',	'trophytruck',	60000,	'offroad'),
('Trophy Truck Limited',	'trophytruck2',	80000,	'offroad'),
('Tropos',	'tropos',	40000,	'sports'),
('Turismo R',	'turismor',	350000,	'super'),
('Tyrus',	'tyrus',	600000,	'super'),
('Vacca',	'vacca',	120000,	'super'),
('Vader',	'vader',	7200,	'motorcycles'),
('Verlierer',	'verlierer2',	70000,	'sports'),
('Vigero',	'vigero',	12500,	'muscle'),
('Virgo',	'virgo',	14000,	'muscle'),
('Viseris',	'viseris',	875000,	'sportsclassics'),
('Visione',	'visione',	2250000,	'super'),
('Voltic',	'voltic',	90000,	'super'),
('Voltic 2',	'voltic2',	3830400,	'super'),
('Voodoo',	'voodoo',	7200,	'muscle'),
('Vortex',	'vortex',	9800,	'motorcycles'),
('Warrener',	'warrener',	4000,	'sedans'),
('Washington',	'washington',	9000,	'sedans'),
('Windsor',	'windsor',	95000,	'coupes'),
('Windsor Drop',	'windsor2',	125000,	'coupes'),
('Woflsbane',	'wolfsbane',	9000,	'motorcycles'),
('XLS',	'xls',	32000,	'suvs'),
('Yosemite',	'yosemite',	485000,	'muscle'),
('Youga',	'youga',	10800,	'vans'),
('Youga Luxuary',	'youga2',	14500,	'vans'),
('Z190',	'z190',	900000,	'sportsclassics'),
('Zentorno',	'zentorno',	1500000,	'super'),
('Zion',	'zion',	36000,	'coupes'),
('Zion Cabrio',	'zion2',	45000,	'coupes'),
('Zombie',	'zombiea',	9500,	'motorcycles'),
('Zombie Luxuary',	'zombieb',	12000,	'motorcycles'),
('Z-Type',	'ztype',	220000,	'sportsclassics');

DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts',	'Compacts'),
('coupes',	'Coupés'),
('motorcycles',	'Motos'),
('muscle',	'Muscle'),
('offroad',	'Off Road'),
('sedans',	'Sedans'),
('sports',	'Sports'),
('sportsclassics',	'Sports Classics'),
('super',	'Super'),
('suvs',	'SUVs'),
('vans',	'Vans');

DROP TABLE IF EXISTS `vehicle_sold`;
CREATE TABLE `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2020-12-19 19:58:20
