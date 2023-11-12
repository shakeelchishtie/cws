-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2022 at 11:20 AM
-- Server version: 5.7.33
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `shinewash`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `coworker_id` int(11) NOT NULL,
  `service_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupen_id` int(11) DEFAULT NULL,
  `discount` text COLLATE utf8mb4_unicode_ci,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0 payment not complete\r\n1 payment complete',
  `appointment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_token` text COLLATE utf8mb4_unicode_ci,
  `payment_type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `lat` text COLLATE utf8mb4_unicode_ci,
  `lang` text COLLATE utf8mb4_unicode_ci,
  `service_type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'noimage.jpg',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `iso` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nicename` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263);

-- --------------------------------------------------------

--
-- Table structure for table `coworkers`
--

CREATE TABLE `coworkers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coworker_portfolio`
--

CREATE TABLE `coworker_portfolio` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coworker_id` int(11) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `symbol` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `country`, `currency`, `code`, `symbol`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek'),
(2, 'America', 'Dollars', 'USD', '$'),
(3, 'Afghanistan', 'Afghanis', 'AFN', '؋'),
(4, 'Argentina', 'Pesos', 'ARS', '$'),
(5, 'Aruba', 'Guilders', 'AWG', 'Afl'),
(6, 'Australia', 'Dollars', 'AUD', '$'),
(7, 'Azerbaijan', 'New Manats', 'AZN', '₼'),
(8, 'Bahamas', 'Dollars', 'BSD', '$'),
(9, 'Barbados', 'Dollars', 'BBD', '$'),
(10, 'Belarus', 'Rubles', 'BYR', 'p.'),
(11, 'Belgium', 'Euro', 'EUR', '€'),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$'),
(13, 'Bermuda', 'Dollars', 'BMD', '$'),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM'),
(16, 'Botswana', 'Pula', 'BWP', 'P'),
(17, 'Bulgaria', 'Leva', 'BGN', 'Лв.'),
(18, 'Brazil', 'Reais', 'BRL', 'R$'),
(19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£\r\n'),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$'),
(21, 'Cambodia', 'Riels', 'KHR', '៛'),
(22, 'Canada', 'Dollars', 'CAD', '$'),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$'),
(24, 'Chile', 'Pesos', 'CLP', '$'),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥'),
(26, 'Colombia', 'Pesos', 'COP', '$'),
(27, 'Costa Rica', 'Colón', 'CRC', '₡'),
(28, 'Croatia', 'Kuna', 'HRK', 'kn'),
(29, 'Cuba', 'Pesos', 'CUP', '₱'),
(30, 'Cyprus', 'Euro', 'EUR', '€'),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč'),
(32, 'Denmark', 'Kroner', 'DKK', 'kr'),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$'),
(34, 'East Caribbean', 'Dollars', 'XCD', '$'),
(35, 'Egypt', 'Pounds', 'EGP', '£'),
(36, 'El Salvador', 'Colones', 'SVC', '$'),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£'),
(38, 'Euro', 'Euro', 'EUR', '€'),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£'),
(40, 'Fiji', 'Dollars', 'FJD', '$'),
(41, 'France', 'Euro', 'EUR', '€'),
(42, 'Ghana', 'Cedis', 'GHC', 'GH₵'),
(43, 'Gibraltar', 'Pounds', 'GIP', '£'),
(44, 'Greece', 'Euro', 'EUR', '€'),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q'),
(46, 'Guernsey', 'Pounds', 'GGP', '£'),
(47, 'Guyana', 'Dollars', 'GYD', '$'),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€'),
(49, 'Honduras', 'Lempiras', 'HNL', 'L'),
(50, 'Hong Kong', 'Dollars', 'HKD', '$'),
(51, 'Hungary', 'Forint', 'HUF', 'Ft'),
(52, 'Iceland', 'Kronur', 'ISK', 'kr'),
(53, 'India', 'Rupees', 'INR', '₹'),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp'),
(55, 'Iran', 'Rials', 'IRR', '﷼'),
(56, 'Ireland', 'Euro', 'EUR', '€'),
(57, 'Isle of Man', 'Pounds', 'IMP', '£'),
(58, 'Israel', 'New Shekels', 'ILS', '₪'),
(59, 'Italy', 'Euro', 'EUR', '€'),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$'),
(61, 'Japan', 'Yen', 'JPY', '¥'),
(62, 'Jersey', 'Pounds', 'JEP', '£'),
(63, 'Kazakhstan', 'Tenge', 'KZT', '₸'),
(64, 'Korea (North)', 'Won', 'KPW', '₩'),
(65, 'Korea (South)', 'Won', 'KRW', '₩'),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'Лв'),
(67, 'Laos', 'Kips', 'LAK', '	₭'),
(68, 'Latvia', 'Lati', 'LVL', 'Ls'),
(69, 'Lebanon', 'Pounds', 'LBP', '£'),
(70, 'Liberia', 'Dollars', 'LRD', '$'),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF'),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt'),
(73, 'Luxembourg', 'Euro', 'EUR', '€'),
(74, 'Macedonia', 'Denars', 'MKD', 'Ден\r\n'),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM'),
(76, 'Malta', 'Euro', 'EUR', '€'),
(77, 'Mauritius', 'Rupees', 'MUR', '₹'),
(78, 'Mexico', 'Pesos', 'MXN', '$'),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮'),
(80, 'Mozambique', 'Meticais', 'MZN', 'MT'),
(81, 'Namibia', 'Dollars', 'NAD', '$'),
(82, 'Nepal', 'Rupees', 'NPR', '₹'),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ'),
(84, 'Netherlands', 'Euro', 'EUR', '€'),
(85, 'New Zealand', 'Dollars', 'NZD', '$'),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$'),
(87, 'Nigeria', 'Nairas', 'NGN', '₦'),
(88, 'North Korea', 'Won', 'KPW', '₩'),
(89, 'Norway', 'Krone', 'NOK', 'kr'),
(90, 'Oman', 'Rials', 'OMR', '﷼'),
(91, 'Pakistan', 'Rupees', 'PKR', '₹'),
(92, 'Panama', 'Balboa', 'PAB', 'B/.'),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs'),
(94, 'Peru', 'Nuevos Soles', 'PEN', 'S/.'),
(95, 'Philippines', 'Pesos', 'PHP', 'Php'),
(96, 'Poland', 'Zlotych', 'PLN', 'zł'),
(97, 'Qatar', 'Rials', 'QAR', '﷼'),
(98, 'Romania', 'New Lei', 'RON', 'lei'),
(99, 'Russia', 'Rubles', 'RUB', '₽'),
(100, 'Saint Helena', 'Pounds', 'SHP', '£'),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼'),
(102, 'Serbia', 'Dinars', 'RSD', 'ع.د'),
(103, 'Seychelles', 'Rupees', 'SCR', '₹'),
(104, 'Singapore', 'Dollars', 'SGD', '$'),
(105, 'Slovenia', 'Euro', 'EUR', '€'),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$'),
(107, 'Somalia', 'Shillings', 'SOS', 'S'),
(108, 'South Africa', 'Rand', 'ZAR', 'R'),
(109, 'South Korea', 'Won', 'KRW', '₩'),
(110, 'Spain', 'Euro', 'EUR', '€'),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₹'),
(112, 'Sweden', 'Kronor', 'SEK', 'kr'),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF'),
(114, 'Suriname', 'Dollars', 'SRD', '$'),
(115, 'Syria', 'Pounds', 'SYP', '£'),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$'),
(117, 'Thailand', 'Baht', 'THB', '฿'),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$'),
(119, 'Turkey', 'Lira', 'TRY', 'TL'),
(120, 'Turkey', 'Liras', 'TRL', '₺'),
(121, 'Tuvalu', 'Dollars', 'TVD', '$'),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴'),
(123, 'United Kingdom', 'Pounds', 'GBP', '£'),
(124, 'United States of America', 'Dollars', 'USD', '$'),
(125, 'Uruguay', 'Pesos', 'UYU', '$U'),
(127, 'Vatican City', 'Euro', 'EUR', '€'),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs'),
(129, 'Vietnam', 'Dong', 'VND', '₫\r\n'),
(130, 'Yemen', 'Rials', 'YER', '﷼'),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `for` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `name`, `file`, `image`, `direction`, `status`, `created_at`, `updated_at`) VALUES
(1, 'en', 'en.json', 'usa.png', 'ltr', 1, '2020-10-13 06:51:22', '2022-05-12 13:19:31'),
(2, 'ar', 'ar.json', 'ar.png', 'rtl', 1, '2020-10-13 07:33:05', '2022-07-06 09:31:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2020_09_17_115944_create_category_table', 2),
(11, '2020_09_18_051114_create_service_table', 3),
(12, '2020_09_18_060111_create_coworkers_table', 3),
(13, '2020_09_18_125528_create_service_table', 4),
(14, '2020_09_19_060912_create_offer_table', 5),
(15, '2020_09_19_111235_create_setting_table', 6),
(16, '2020_09_21_064649_create_payment_setting_table', 7),
(17, '2020_09_21_093212_create__notification_template_table', 8),
(18, '2016_06_01_000001_create_oauth_auth_codes_table', 9),
(19, '2016_06_01_000002_create_oauth_access_tokens_table', 9),
(20, '2016_06_01_000003_create_oauth_refresh_tokens_table', 9),
(21, '2016_06_01_000004_create_oauth_clients_table', 9),
(22, '2016_06_01_000005_create_oauth_personal_access_clients_table', 9),
(23, '2020_09_23_105604_create_appointment_table', 10),
(24, '2020_09_25_090127_create_faq_table', 11),
(25, '2020_09_26_122229_create__review_table', 12),
(26, '2020_09_28_040154_create__review_table', 13),
(27, '2020_09_28_042217_create__employee_portfolio_table', 14),
(29, '2020_09_28_062811_create_notification_table', 15),
(30, '2020_10_13_110033_create_language_table', 16),
(31, '2021_01_13_054458_create_permission_tables', 17);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 175),
(2, 'App\\User', 177),
(2, 'App\\User', 179),
(2, 'App\\User', 181),
(2, 'App\\User', 182),
(2, 'App\\User', 183),
(2, 'App\\User', 184),
(2, 'App\\User', 185),
(2, 'App\\User', 186),
(2, 'App\\User', 187),
(2, 'App\\User', 188),
(2, 'App\\User', 190),
(2, 'App\\User', 192),
(2, 'App\\User', 196),
(2, 'App\\User', 197),
(2, 'App\\User', 198),
(2, 'App\\User', 199),
(2, 'App\\User', 216),
(2, 'App\\User', 217),
(2, 'App\\User', 218),
(2, 'App\\User', 220),
(2, 'App\\User', 248),
(2, 'App\\User', 255),
(2, 'App\\User', 258),
(2, 'App\\User', 261),
(2, 'App\\User', 264),
(2, 'App\\User', 268),
(2, 'App\\User', 301),
(2, 'App\\User', 303),
(2, 'App\\User', 318),
(2, 'App\\User', 321),
(2, 'App\\User', 327),
(2, 'App\\User', 335),
(2, 'App\\User', 338),
(2, 'App\\User', 339),
(2, 'App\\User', 352),
(2, 'App\\User', 357),
(2, 'App\\User', 358),
(2, 'App\\User', 359),
(2, 'App\\User', 379),
(2, 'App\\User', 381),
(2, 'App\\User', 382),
(2, 'App\\User', 383),
(2, 'App\\User', 389),
(2, 'App\\User', 393),
(2, 'App\\User', 396),
(2, 'App\\User', 397),
(2, 'App\\User', 398),
(2, 'App\\User', 399),
(2, 'App\\User', 400),
(2, 'App\\User', 401),
(2, 'App\\User', 402),
(2, 'App\\User', 407),
(2, 'App\\User', 408),
(2, 'App\\User', 409),
(2, 'App\\User', 410),
(2, 'App\\User', 411),
(2, 'App\\User', 413),
(2, 'App\\User', 426),
(2, 'App\\User', 430),
(2, 'App\\User', 432),
(2, 'App\\User', 433),
(2, 'App\\User', 444),
(2, 'App\\User', 448),
(2, 'App\\User', 452),
(2, 'App\\User', 456),
(2, 'App\\User', 457),
(2, 'App\\User', 461),
(2, 'App\\User', 475),
(2, 'App\\User', 479),
(2, 'App\\User', 491),
(2, 'App\\User', 493),
(2, 'App\\User', 496),
(2, 'App\\User', 504),
(2, 'App\\User', 518),
(2, 'App\\User', 519),
(2, 'App\\User', 520);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_template`
--

CREATE TABLE `notification_template` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_template`
--

INSERT INTO `notification_template` (`id`, `subject`, `title`, `notification_content`, `mail_content`, `created_at`, `updated_at`) VALUES
(1, 'user appointment book', 'user appointment book', 'Dear {customer_name} , recently booked your appointment Appointment Id is {appointment_id} from {company_name}', 'Dear {customer_name}.<br><br>recently booked your appointment appointment_id is {appointment_id}.<br><br>Thank you for choosing&nbsp;our&nbsp;company.<br><span><br>{company_name}<br>{company_website}</span>', NULL, '2021-12-23 05:33:49'),
(2, 'appointment cancel', 'appointment cancel', 'Dear {customer_name} your service has been cancel', 'Dear {customer_name}.<br><br>You have booked {service_name} service has been cancel.<br><br>Thank you for choosing&nbsp;our&nbsp;company.<br>{company_name}<br>{company_website}', NULL, '2020-09-21 23:51:31'),
(3, 'appointment reject', 'appointment reject', 'Dear {customer_name}.Your appointment has been rejected', 'Dear {customer_name}.<br><span><br>This is a Rejected that you have booked {service_name}.<br><br>{company_name}<br>{company_website}</span>', NULL, '2020-09-21 23:52:11'),
(4, 'user verification', 'user verification', 'Dear {customer_name} your otp is {otp}', '<span>Dear {customer_name} your otp is <b>{otp}</b><br><br><br></span>', NULL, '2020-09-28 03:37:15'),
(5, 'appointment complete', 'appointment complete', 'Dear {customer_name}. Your appointment has been completed.Thank you for choosing our company.', 'Dear {customer_name}. <br><br>Your service has been completed.<br><br>Thank you for choosing our company.<br><br>{company_name}<br>{company_website}<br>', '2020-09-28 06:20:38', '2020-09-28 00:54:52'),
(6, 'forgot password', 'forgot password', 'dear {customer_name} your new password is ; {password}', 'Dear {customer_name}.<br><br>recently booked your appointment appointment_id is {appointment_id}.<br><br>Thank you for choosing&nbsp;our&nbsp;company.<br><span><br>{company_name}<br>{company_website}</span>', '2020-09-29 12:51:16', '2021-04-27 23:47:31'),
(7, 'worker appointment book', 'worker appointment book', 'dear {worker_name} recently booked your appointment {appointment_id} date : {date} time {start_time}', 'dear {worker_name} recently booked your appointment {appointment_id} date : {date} time {start_time}', NULL, '2021-01-29 04:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '1Au56AITLeNg06JkAfjzthkuFlFqQ8oKUCGzlVNA', NULL, 'http://localhost', 1, 0, 0, '2020-09-21 22:07:18', '2020-09-21 22:07:18'),
(2, NULL, 'Laravel Password Grant Client', 'zkWcIhCCPlX3f9blO2OhZAMBdnS7AuRCoPRwspFU', 'users', 'http://localhost', 0, 1, 0, '2020-09-21 22:07:18', '2020-09-21 22:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-09-21 22:07:18', '2020-09-21 22:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE `offer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'noimage.jpg',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` text COLLATE utf8mb4_unicode_ci,
  `category_id` text COLLATE utf8mb4_unicode_ci,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_setting`
--

CREATE TABLE `payment_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cod` tinyint(1) NOT NULL,
  `stripe` tinyint(1) NOT NULL,
  `paypal` tinyint(1) NOT NULL,
  `razorpay` tinyint(1) NOT NULL,
  `paystack` int(11) DEFAULT NULL,
  `flutterwave` tinyint(1) DEFAULT NULL,
  `paypal_sendbox` text COLLATE utf8mb4_unicode_ci,
  `paypal_production` text COLLATE utf8mb4_unicode_ci,
  `stripe_publish_key` text COLLATE utf8mb4_unicode_ci,
  `stripe_secret_key` text COLLATE utf8mb4_unicode_ci,
  `razorpay_key` text COLLATE utf8mb4_unicode_ci,
  `flutterwave_public_key` text COLLATE utf8mb4_unicode_ci,
  `paystack_public_key` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_setting`
--

INSERT INTO `payment_setting` (`id`, `cod`, `stripe`, `paypal`, `razorpay`, `paystack`, `flutterwave`, `paypal_sendbox`, `paypal_production`, `stripe_publish_key`, `stripe_secret_key`, `razorpay_key`, `flutterwave_public_key`, `paystack_public_key`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-17 11:14:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role_access', 'web', '2021-01-13 05:52:46', '2021-01-13 05:52:46'),
(2, 'role_add', 'web', '2021-01-13 06:08:21', '2021-01-13 06:08:21'),
(3, 'category_access', 'web', '2021-01-13 07:46:54', '2021-01-13 07:46:54'),
(4, 'category_add', 'web', '2021-01-13 07:47:46', '2021-01-13 07:47:46'),
(5, 'category_edit', 'web', '2021-01-13 07:47:46', '2021-01-13 07:47:46'),
(6, 'category_delete', 'web', '2021-01-13 07:47:46', '2021-01-13 07:47:46'),
(7, 'offer_access', 'web', '2021-01-13 07:52:50', '2021-01-13 07:52:50'),
(8, 'offer_show', 'web', '2021-01-13 07:52:50', '2021-01-13 07:52:50'),
(9, 'offer_add', 'web', '2021-01-13 07:52:50', '2021-01-13 07:52:50'),
(10, 'offer_edit', 'web', '2021-01-13 07:52:50', '2021-01-13 07:52:50'),
(11, 'offer_delete', 'web', '2021-01-13 07:52:50', '2021-01-13 07:52:50'),
(12, 'coworker_access', 'web', '2021-01-13 07:53:23', '2021-01-13 07:53:23'),
(13, 'coworker_show', 'web', '2021-01-13 07:53:23', '2021-01-13 07:53:23'),
(14, 'coworker_add', 'web', '2021-01-13 07:53:23', '2021-01-13 07:53:23'),
(15, 'coworker_edit', 'web', '2021-01-13 07:53:23', '2021-01-13 07:53:23'),
(16, 'coworker_delete', 'web', '2021-01-13 07:53:24', '2021-01-13 07:53:24'),
(17, 'service_access', 'web', '2021-01-13 07:53:46', '2021-01-13 07:53:46'),
(18, 'service_show', 'web', '2021-01-13 07:53:46', '2021-01-13 07:53:46'),
(19, 'service_add', 'web', '2021-01-13 07:53:46', '2021-01-13 07:53:46'),
(20, 'service_edit', 'web', '2021-01-13 07:53:46', '2021-01-13 07:53:46'),
(21, 'service_delete', 'web', '2021-01-13 07:53:46', '2021-01-13 07:53:46'),
(22, 'admin_appointment_access', 'web', '2021-01-13 07:54:22', '2021-01-13 07:54:22'),
(23, 'admin_appointment_show', 'web', '2021-01-13 07:54:22', '2021-01-13 07:54:22'),
(24, 'admin_appointment_add', 'web', '2021-01-13 07:54:22', '2021-01-13 07:54:22'),
(25, 'admin_appointment_edit', 'web', '2021-01-13 07:54:22', '2021-01-13 07:54:22'),
(26, 'admin_appointment_delete', 'web', '2021-01-13 07:54:22', '2021-01-13 07:54:22'),
(27, 'admin_appointment_calender', 'web', '2021-01-13 07:54:55', '2021-01-13 07:54:55'),
(28, 'notification_access', 'web', '2021-01-13 07:55:13', '2021-01-13 07:55:13'),
(29, 'notification_template', 'web', '2021-01-13 07:55:33', '2021-01-13 07:55:33'),
(30, 'user_access', 'web', '2021-01-13 07:56:49', '2021-01-13 07:56:49'),
(31, 'user_show', 'web', '2021-01-13 07:56:49', '2021-01-13 07:56:49'),
(32, 'user_add', 'web', '2021-01-13 07:56:49', '2021-01-13 07:56:49'),
(33, 'user_edit', 'web', '2021-01-13 07:56:49', '2021-01-13 07:56:49'),
(34, 'user_delete', 'web', '2021-01-13 07:56:49', '2021-01-13 07:56:49'),
(35, 'language_access', 'web', '2021-01-13 07:57:15', '2021-01-13 07:57:15'),
(36, 'language_add', 'web', '2021-01-13 07:57:15', '2021-01-13 07:57:15'),
(37, 'language_edit', 'web', '2021-01-13 07:57:15', '2021-01-13 07:57:15'),
(38, 'language_delete', 'web', '2021-01-13 07:57:15', '2021-01-13 07:57:15'),
(39, 'faq_access', 'web', '2021-01-13 07:57:37', '2021-01-13 07:57:37'),
(40, 'faq_add', 'web', '2021-01-13 07:57:37', '2021-01-13 07:57:37'),
(41, 'faq_edit', 'web', '2021-01-13 07:57:37', '2021-01-13 07:57:37'),
(42, 'faq_delete', 'web', '2021-01-13 07:57:37', '2021-01-13 07:57:37'),
(43, 'setting_access', 'web', '2021-01-13 07:58:18', '2021-01-13 07:58:18'),
(44, 'admin_dashboard', 'web', '2021-01-15 00:08:26', '2021-01-15 00:08:26'),
(45, 'notification_template_access', 'web', '2021-01-15 00:36:58', '2021-01-15 00:36:58'),
(46, 'admin_setting', 'web', '2021-01-15 00:36:59', '2021-01-15 00:36:59'),
(47, 'admin_custom_notification', 'web', '2021-01-15 00:53:49', '2021-01-15 00:53:49'),
(48, 'appointment_invoice', 'web', '2021-01-15 03:30:29', '2021-01-15 03:30:29'),
(49, 'role_edit', 'web', '2021-01-15 03:56:30', '2021-01-15 03:56:30'),
(50, 'coworker_dashboard', 'web', '2021-01-15 06:24:44', '2021-01-15 06:24:44'),
(51, 'coworker_appointment', 'web', '2021-01-15 06:24:44', '2021-01-15 06:24:44'),
(52, 'coworker_review', 'web', '2021-01-15 06:24:44', '2021-01-15 06:24:44'),
(53, 'coworker_profile', 'web', '2021-01-15 06:24:44', '2021-01-15 06:24:44'),
(54, 'coworker_portfolio_access', 'web', '2021-01-15 06:24:44', '2021-01-15 06:24:44'),
(56, 'coworker_portfolio_add', 'web', '2021-01-16 01:53:49', '2021-01-16 01:53:49'),
(57, 'coworker_portfolio_update', 'web', '2021-01-16 01:53:49', '2021-01-16 01:53:49'),
(58, 'coworker_portfolio_delete', 'web', '2021-01-16 01:53:49', '2021-01-16 01:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `coworker_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2021-01-13 07:43:22', '2021-01-13 07:43:22'),
(2, 'employee', 'web', '2021-01-15 00:07:34', '2021-01-15 00:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(56, 2),
(57, 2),
(58, 2);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'noimage.jpg',
  `category_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `coworker_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'in min',
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_verification` tinyint(1) NOT NULL DEFAULT '1',
  `sms_verification` tinyint(1) DEFAULT NULL,
  `mail_verification` tinyint(1) DEFAULT NULL,
  `company_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilio_acc_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilio_auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilio_phone_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` text COLLATE utf8mb4_unicode_ci,
  `longitude` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `push_notification` tinyint(1) NOT NULL DEFAULT '0',
  `onesignal_app_id` text COLLATE utf8mb4_unicode_ci,
  `onesignal_auth_key` text COLLATE utf8mb4_unicode_ci,
  `rest_api_key` text COLLATE utf8mb4_unicode_ci,
  `project_number` text COLLATE utf8mb4_unicode_ci,
  `mail_host` text COLLATE utf8mb4_unicode_ci,
  `mail_notification` tinyint(1) DEFAULT '0',
  `mail_port` text COLLATE utf8mb4_unicode_ci,
  `mail_username` text COLLATE utf8mb4_unicode_ci,
  `mail_password` text COLLATE utf8mb4_unicode_ci,
  `mail_encryption` text COLLATE utf8mb4_unicode_ci,
  `mail_from_address` text COLLATE utf8mb4_unicode_ci,
  `company_logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_favicon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_policy` text COLLATE utf8mb4_unicode_ci,
  `service_at_home` tinyint(1) NOT NULL DEFAULT '0',
  `map_key` text COLLATE utf8mb4_unicode_ci,
  `color` text COLLATE utf8mb4_unicode_ci,
  `license_code` text COLLATE utf8mb4_unicode_ci,
  `client_name` text COLLATE utf8mb4_unicode_ci,
  `license_verify` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coworker_notification` tinyint(1) DEFAULT '0',
  `coworker_app_id` text COLLATE utf8mb4_unicode_ci,
  `coworker_auth_key` text COLLATE utf8mb4_unicode_ci,
  `coworker_rest_api_key` text COLLATE utf8mb4_unicode_ci,
  `coworker_project_number` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `company_name`, `user_verification`, `sms_verification`, `mail_verification`, `company_address`, `phone`, `twilio_acc_id`, `twilio_auth_token`, `twilio_phone_no`, `latitude`, `longitude`, `website`, `push_notification`, `onesignal_app_id`, `onesignal_auth_key`, `rest_api_key`, `project_number`, `mail_host`, `mail_notification`, `mail_port`, `mail_username`, `mail_password`, `mail_encryption`, `mail_from_address`, `company_logo`, `company_favicon`, `currency`, `currency_symbol`, `privacy_policy`, `service_at_home`, `map_key`, `color`, `license_code`, `client_name`, `license_verify`, `created_at`, `updated_at`, `coworker_notification`, `coworker_app_id`, `coworker_auth_key`, `coworker_rest_api_key`, `coworker_project_number`) VALUES
(1, 'shinewash', 0, 0, 0, '321, 3rd Floor, Aakanksha Complex, Gondal Rd, opp. Hero Showroom, Vijay Plot, Bhakti Nagar, Rajkot, Gujarat 360002, India', '1234567890', 'only admin can see', 'only admin can see', 'only admin can see', '22.28685084328479', '70.7997527718544', 'www.shinewash.com', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'shinewash.png', 'Group7027.png', 'INR', '₹', '<div>We agree to offer the you an account on the online assessment platform using a private server.&nbsp; Considering a event of a planned change in the provider network or infrastructure, the provider shall make practical efforts in order to notify the customer in&nbsp;advance. You agree to provide accurate and updated identification information during the account registration. the customer is solely responsible for promptly notify in case of an unauthorized use or breach of the account. we will not be responsible for any loss or damage arising from the failure to provide accurate&nbsp;</div><div>information or impose account security.&nbsp;<br><br>Booking Instruction<br><br><div>The entry in the premises of the properties under the contract, by any person or persons including minor and infant child other than previously booked, is strictly prohibited and shall be said to have made unauthorized entry.</div></div>', 1, 'AIzaSyDOz5oWyuWCeyh-9c1W5gexDzRakcRP-eM', '#6b48ff', '9113-D861-BFAW-5C9B', 'saasmonks', 1, '2020-09-19 07:10:33', '2022-10-17 05:34:38', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

CREATE TABLE `timeslot` (
  `timeslot_id` int(11) NOT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timeslot`
--

INSERT INTO `timeslot` (`timeslot_id`, `createddate`, `time`, `status`) VALUES
(1, '2020-09-17 04:26:15', '12:00 AM', 'enable'),
(2, '2020-09-17 04:26:15', '12:30 AM', 'enable'),
(3, '2020-09-17 04:26:15', '01:00 AM', 'enable'),
(4, '2020-09-17 04:26:15', '01:30 AM', 'enable'),
(5, '2020-09-17 04:26:15', '02:00 AM', 'enable'),
(6, '2020-09-17 04:26:15', '02:30 AM', 'enable'),
(7, '2020-09-17 04:26:15', '03:00 AM', 'enable'),
(8, '2020-09-17 04:26:15', '03:30 AM', 'enable'),
(9, '2020-09-17 04:26:15', '04:00 AM', 'enable'),
(10, '2020-09-17 04:26:15', '04:30 AM', 'enable'),
(11, '2020-09-17 04:26:15', '05:00 AM', 'enable'),
(12, '2020-09-17 04:26:15', '05:30 AM', 'enable'),
(13, '2020-09-17 04:26:15', '06:00 AM', 'enable'),
(14, '2020-09-17 04:26:15', '06:30 AM', 'enable'),
(15, '2020-09-17 04:26:15', '07:00 AM', 'enable'),
(16, '2020-09-17 04:26:15', '07:30 AM', 'enable'),
(17, '2020-09-17 04:26:15', '08:00 AM', 'enable'),
(18, '2020-09-17 04:26:15', '08:30 AM', 'enable'),
(19, '2020-09-17 04:26:15', '09:00 AM', 'enable'),
(20, '2020-09-17 04:26:15', '09:30 AM', 'enable'),
(21, '2020-09-17 04:26:15', '10:00 AM', 'enable'),
(22, '2020-09-17 04:26:15', '10:30 AM', 'enable'),
(23, '2020-09-17 04:26:15', '11:00 AM', 'enable'),
(24, '2020-09-17 04:26:15', '11:30 AM', 'enable'),
(25, '2020-09-17 04:26:15', '12:00 PM', 'enable'),
(26, '2020-09-17 04:26:15', '12:30 PM', 'enable'),
(27, '2020-09-17 04:26:15', '01:00 PM', 'enable'),
(28, '2020-09-17 04:26:15', '01:30 PM', 'enable'),
(29, '2020-09-17 04:26:15', '02:00 PM', 'enable'),
(30, '2020-09-17 04:26:15', '02:30 PM', 'enable'),
(31, '2020-09-17 04:26:15', '03:00 PM', 'enable'),
(32, '2020-09-17 04:26:15', '03:30 PM', 'enable'),
(33, '2020-09-17 04:26:15', '04:00 PM', 'enable'),
(34, '2020-09-17 04:26:15', '04:30 PM', 'enable'),
(35, '2020-09-17 04:26:15', '05:00 PM', 'enable'),
(36, '2020-09-17 04:26:15', '05:30 PM', 'enable'),
(37, '2020-09-17 04:26:15', '06:00 PM', 'enable'),
(38, '2020-09-17 04:26:15', '06:30 PM', 'enable'),
(39, '2020-09-17 04:26:15', '07:00 PM', 'enable'),
(40, '2020-09-17 04:26:15', '07:30 PM', 'enable'),
(41, '2020-09-17 04:26:15', '08:00 PM', 'enable'),
(42, '2020-09-17 04:26:15', '08:30 PM', 'enable'),
(43, '2020-09-17 04:26:15', '09:00 PM', 'enable'),
(44, '2020-09-17 04:26:15', '09:30 PM', 'enable'),
(45, '2020-09-17 04:26:15', '10:00 PM', 'enable'),
(46, '2020-09-17 04:26:15', '10:30 PM', 'enable'),
(47, '2020-09-17 04:26:15', '11:00 PM', 'enable'),
(48, '2020-09-17 04:26:15', '11:30 PM', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_code` text COLLATE utf8mb4_unicode_ci,
  `is_verified` tinyint(1) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `provider` text COLLATE utf8mb4_unicode_ci,
  `provider_token` text COLLATE utf8mb4_unicode_ci,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `image`, `phone`, `phone_code`, `is_verified`, `otp`, `device_token`, `email`, `status`, `provider`, `provider_token`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Shinewash', NULL, NULL, NULL, NULL, NULL, NULL, 'adminshinewash@gmail.com', NULL, NULL, NULL, NULL, '$2y$10$g/L/W4ID9zR6bB6QQPtmhOc6.jeMbT9gZx.Wy9dOMqRhSk6YOW3Qi', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coworkers`
--
ALTER TABLE `coworkers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coworkers_email_unique` (`email`);

--
-- Indexes for table `coworker_portfolio`
--
ALTER TABLE `coworker_portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_template`
--
ALTER TABLE `notification_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_setting`
--
ALTER TABLE `payment_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD PRIMARY KEY (`timeslot_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `coworkers`
--
ALTER TABLE `coworkers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coworker_portfolio`
--
ALTER TABLE `coworker_portfolio`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_template`
--
ALTER TABLE `notification_template`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `offer`
--
ALTER TABLE `offer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_setting`
--
ALTER TABLE `payment_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timeslot`
--
ALTER TABLE `timeslot`
  MODIFY `timeslot_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;
