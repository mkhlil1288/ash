-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 22, 2021 at 07:38 AM
-- Server version: 10.3.32-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deloony_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertising`
--

CREATE TABLE `advertising` (
  `id` int(10) UNSIGNED NOT NULL,
  `integration` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'unitSlot or autoFit',
  `is_responsive` tinyint(1) DEFAULT 0,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Translated in the languages files',
  `tracking_code_large` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_code_medium` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_code_small` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertising`
--

INSERT INTO `advertising` (`id`, `integration`, `is_responsive`, `slug`, `provider_name`, `description`, `tracking_code_large`, `tracking_code_medium`, `tracking_code_small`, `active`) VALUES
(1, 'unitSlot', 0, 'top', 'Google AdSense', 'advertising_unitSlot_hint', '', '', '', 0),
(2, 'unitSlot', 0, 'bottom', 'Google AdSense', 'advertising_unitSlot_hint', '', '', '', 0),
(3, 'autoFit', 1, 'auto', 'Google AdSense', 'advertising_autoFit_hint', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('domain','email','ip','word') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entry` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('classified','job-offer','job-search','not-salable') COLLATE utf8mb4_unicode_ci DEFAULT 'classified' COMMENT 'Only select this for parent categories',
  `is_for_permanent` tinyint(1) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `slug`, `description`, `picture`, `icon_class`, `lft`, `rgt`, `depth`, `type`, `is_for_permanent`, `active`) VALUES
(1, NULL, '{\"ar\": \"سيارات ومركبات\"}', 'automobiles', '{\"ar\":null}', 'app/categories/skin-blue/car.png', NULL, 20, 47, 0, 'classified', 0, 1),
(3, 1, '{\"ar\":\"سيارات للإيجار\"}', 'buses-and-minibus', '{\"ar\":null}', NULL, NULL, 23, 24, 1, 'classified', 0, 1),
(4, 1, '{\"ar\": \"دراجات نارية - دبابات\"}', 'heavy-equipment', '{\"ar\":null}', NULL, NULL, 25, 26, 1, 'classified', 0, 1),
(5, 1, '{\"ar\": \"لوحات سيارات مميزة\"}', 'motorcycles-and-scooters', '{\"ar\":null}', NULL, NULL, 27, 28, 1, 'classified', 0, 0),
(6, 1, '{\"ar\": \"قطع غيار السيارات واكسسواراتها\"}', 'trucks-and-trailers', '{\"ar\":null}', NULL, NULL, 29, 30, 1, 'classified', 0, 1),
(7, 1, '{\"ar\": \"قطع غيار وإكسسوارات الدراجات\"}', 'car-parts-and-accessories', '{\"ar\":null}', NULL, NULL, 31, 32, 1, 'classified', 0, 0),
(8, 1, '{\"ar\": \"اطارات\"}', 'watercraft-and-boats', '{\"ar\":null}', NULL, NULL, 33, 34, 1, 'classified', 0, 0),
(9, NULL, '{\"ar\": \"الهواتف والأجهزة اللوحية\"}', 'phones-and-tablets', NULL, 'app/categories/skin-blue/mobile-alt.png', 'icon-laptop', 86, 99, 0, 'classified', 0, 1),
(10, 9, '{\"ar\": \"هواتف\"}', 'mobile-phones', '{\"ar\":null}', NULL, NULL, 87, 88, 1, 'classified', 0, 1),
(11, 9, '{\"ar\": \"تابلت\"}', 'mobile-phones-tablets-accessories', '{\"ar\":null}', NULL, NULL, 89, 90, 1, 'classified', 0, 1),
(12, 9, '{\"ar\":\"ارقام هواتف\"}', 'smart-watches-and-trackers', '{\"ar\":null}', NULL, NULL, 91, 92, 1, 'classified', 0, 0),
(13, 9, '{\"ar\": \"صيانة الهواتف - تابلت\"}', 'tablets', '{\"ar\":null}', NULL, NULL, 93, 94, 1, 'classified', 0, 0),
(14, NULL, '{\"ar\":\"العاب فيديو وملحقاتها\"}', 'electronics', '{\"ar\":null}', 'app/categories/skin-blue/fa-laptop.png', 'icon-theatre', 140, 153, 0, 'classified', 0, 1),
(30, NULL, '{\"ar\":\"اجهزة - الكترونيات\"}', 'furniture-appliances', '{\"ar\":null}', 'app/categories/custom/48e3d82e38e2598e9adad0530af7ff25.png', 'icon-basket-1', 100, 139, 0, 'classified', 0, 1),
(37, NULL, '{\"ar\":\"عقارات للبيع\"}', 'real-estate', '{\"ar\":null}', 'app/categories/skin-blue/fa-home.png', 'icon-home', 48, 59, 0, 'classified', 0, 1),
(54, NULL, '{\"ar\":\"موضه - ملابس\"}', 'fashion', '{\"ar\":null}', 'app/categories/skin-blue/tshirt.png', 'icon-heart', 178, 193, 0, 'classified', 0, 1),
(62, NULL, '{\"ar\":\"أثاث وأدوات منزلية\"}', 'beauty-well-being', '{\"ar\":null}', 'app/categories/skin-blue/spa.png', 'icon-search', 154, 177, 0, 'classified', 0, 1),
(73, NULL, '{\"ar\": \"وظائف\"}', 'jobs', NULL, 'app/categories/skin-blue/mfglabs-users.png', 'icon-megaphone-1', 194, 213, 0, 'job-offer', 0, 1),
(97, NULL, '{\"ar\": \"خدمات\"}', 'services', NULL, 'app/categories/skin-blue/ion-clipboard.png', 'fa fa-briefcase', 214, 241, 0, 'classified', 0, 1),
(114, NULL, '{\"ar\":\"طعام - غذاء\"}', 'learning', '{\"ar\":null}', 'app/categories/custom/d3ecc2fecdaab8610c89f26df4984b20.png', 'icon-food-1', 244, 251, 0, 'classified', 0, 1),
(135, 1, '{\"ar\":\"إصلاح وصيانة السيارات\"}', 'sl-h-osy-n-ls-r-t', '{\"ar\":null}', 'app/categories/custom/448c1f72e5b2156bf11302978b688f27.png', NULL, 35, 36, 1, 'classified', 0, 0),
(136, 1, '{\"ar\":\"خدمات توصيل\"}', 'khdm-t-tosyl', '{\"ar\":null}', 'app/categories/custom/01e72303f4201303e67e6280d60cfa64.png', NULL, 37, 38, 1, 'classified', 0, 0),
(137, 1, '{\"ar\":\"قوارب - جت سكي سكراب\"}', 'ko-rb-gt-sky-skr-b', '{\"ar\":null}', 'app/categories/custom/149b4973bb1e54c05f6ec3d4d6af87d6.png', NULL, 39, 40, 1, 'classified', 0, 0),
(138, 1, '{\"ar\":\"دراجات هوائية - اكسسوارات\"}', 'dr-g-t-ho-y-ksso-r-t', '{\"ar\":null}', 'app/categories/custom/2f89bd35397399a0f29eae6a10c4a509.png', NULL, 41, 42, 1, 'classified', 0, 0),
(139, 1, '{\"ar\":\"شاحنات - اليات ثقيلة\"}', 'sh-hn-t-ly-t-thkyl', '{\"ar\":null}', 'app/categories/custom/e5da97e01ab00db5a2ada1d0e76946cc.png', NULL, 43, 44, 1, 'classified', 0, 0),
(140, 1, '{\"ar\":\"سيارات ومركبات أخرى\"}', 'sy-r-t-omrkb-t-akhr', '{\"ar\":null}', 'app/categories/custom/c6be4d5156ada84b1e3dcd74d1b576ce.png', NULL, 45, 46, 1, 'classified', 0, 1),
(141, 9, '{\"ar\":\"اكسسوارات هواتف وتابلت\"}', 'ksso-r-t-ho-tf-ot-blt', '{\"ar\":null}', NULL, NULL, 95, 96, 1, 'classified', 0, 1),
(142, 9, '{\"ar\":\"قطع غيار الهواتف - تابلت\"}', 'ktaa-ghy-r-lho-tf-t-blt', '{\"ar\":null}', 'app/categories/custom/95b723fb784f9955b5b2b89d7e1e3a8c.png', NULL, 97, 98, 1, 'classified', 0, 1),
(143, NULL, '{\"ar\":\"عقارات للايجار\"}', 'aak-r-t-ll-yg-r', '{\"ar\":null}', 'app/categories/custom/35aaeb762b522610ca9d4881cf1f055c.png', NULL, 60, 71, 0, 'classified', 0, 1),
(144, 14, '{\"ar\":\"اجهزة\"}', 'ghz', '{\"ar\":null}', 'app/categories/custom/3fe1e099a431e6850b6956cfe7ba7457.png', NULL, 141, 142, 1, 'classified', 0, 1),
(145, 14, '{\"ar\":\"العاب فيديو\"}', 'laa-b-fydyo', '{\"ar\":null}', 'app/categories/custom/0acc321bc1ae5a0fd46e4bc3d93667c6.png', NULL, 143, 144, 1, 'classified', 0, 1),
(146, 14, '{\"ar\":\"اكسسوارات وقطع غيار\"}', 'ksso-r-t-oktaa-ghy-r', '{\"ar\":null}', 'app/categories/custom/9e20dd6820eeca7c251a2ed425294160.png', NULL, 145, 146, 1, 'classified', 0, 1),
(147, 14, '{\"ar\":\"بطاقات شراء\"}', 'bt-k-t-shr', '{\"ar\":null}', 'app/categories/custom/d4d6a865aa680310d9324fcc18fc7815.png', NULL, 147, 148, 1, 'classified', 0, 1),
(148, 14, '{\"ar\":\"بيع حسابات وشخصيات\"}', 'byaa-hs-b-t-oshkhsy-t', '{\"ar\":null}', 'app/categories/custom/1cc605efe1b67467229e22e54616ef23.png', NULL, 149, 150, 1, 'classified', 0, 1),
(150, 14, '{\"ar\":\"العاب  اخرئ\"}', 'laa-b-fydyo-khr', '{\"ar\":null}', 'app/categories/custom/1e43d4f6105920db4cb77d730b114031.png', NULL, 151, 152, 1, 'classified', 0, 1),
(151, 30, '{\"ar\":\"لابتوب\"}', 'l-btob-kmbyotr', '{\"ar\":null}', 'app/categories/custom/629a53f033a1c7574e74e5ca4636435f.png', NULL, 101, 102, 1, 'classified', 0, 1),
(152, 30, '{\"ar\":\"تلفيزيون - شاشات\"}', 'tlfyzyon-sh-sh-t', '{\"ar\":null}', 'app/categories/custom/cca847bd0332e814aa108bb48fd08bfe.png', NULL, 103, 104, 1, 'classified', 0, 1),
(153, 30, '{\"ar\":\"سماعات - مكبرات صوت\"}', 'sm-aa-t-mkbr-t-sot', '{\"ar\":null}', 'app/categories/custom/9da81376d5134082cd8c2795cb800ff1.png', NULL, 105, 106, 1, 'classified', 0, 1),
(154, 30, '{\"ar\":\"ستريو - مكبرات صوت - راديو\"}', 'stryo-mkbr-t-sot-r-dyo', '{\"ar\":null}', 'app/categories/custom/f2e94a737bc40877cdfeb1205c38e27b.png', NULL, 107, 108, 1, 'classified', 0, 1),
(155, 30, '{\"ar\":\"ريسيفر - دي في دي\"}', 'rysyfr-dy-fy-dy', '{\"ar\":null}', 'app/categories/custom/0bcd413d61d05da19e1ac032c606d686.png', NULL, 109, 110, 1, 'classified', 0, 1),
(156, 30, '{\"ar\":\"مودم - راوتر\"}', 'modm-r-otr', '{\"ar\":null}', 'app/categories/custom/58d4cfb420787c894a0412fdfe1b3337.png', NULL, 111, 112, 1, 'classified', 0, 1),
(157, 30, '{\"ar\":\"كاميرات - تصوير\"}', 'k-myr-t-tsoyr', '{\"ar\":null}', 'app/categories/custom/5d2a927dfe4d0304064bc02361ff4449.png', NULL, 113, 114, 1, 'classified', 0, 1),
(158, 30, '{\"ar\":\"انظمة حماية ومراقبة\"}', 'nthm-hm-y-omr-kb', '{\"ar\":null}', 'app/categories/custom/01f053f1fad8993d75aa66776e918afe.png', NULL, 115, 116, 1, 'classified', 0, 1),
(159, 30, '{\"ar\":\"مكيفات - مراوح\"}', 'mkyf-t-mr-oh', '{\"ar\":null}', 'app/categories/custom/28f557eec92d8eb0b7eddf08e7aec05e.png', NULL, 117, 118, 1, 'classified', 0, 1),
(160, 30, '{\"ar\":\"ثلاجات - فريزر\"}', 'thl-g-t-fryzr', '{\"ar\":null}', 'app/categories/custom/8300c5201a386d01272bb7fbded43370.png', NULL, 119, 120, 1, 'classified', 0, 1),
(161, 30, '{\"ar\":\"غسالات - نشافات - جلايات صحون\"}', 'ghs-l-t-nsh-f-t-gl-y-t-shon', '{\"ar\":null}', 'app/categories/custom/1bc71624aa8601839b19f3bbd7ea33fc.png', NULL, 121, 122, 1, 'classified', 0, 1),
(162, 30, '{\"ar\":\"افران - ميكرويف\"}', 'fr-n-mykroyf', '{\"ar\":null}', 'app/categories/custom/41413f78c3bae14ac2ec3356e48a4415.png', NULL, 123, 124, 1, 'classified', 0, 1),
(163, 30, '{\"ar\":\"كولر - فلاتر ماء\"}', 'kolr-fl-tr-m', '{\"ar\":null}', 'app/categories/custom/1cba807b6fd4cf10ef7246c94ae3bdaa.png', NULL, 125, 126, 1, 'classified', 0, 1),
(164, 30, '{\"ar\":\"اجهزة صغيرة\"}', 'ghz-sghyr', '{\"ar\":null}', 'app/categories/custom/4433763a5ad15edde4176cae94e54afe.png', NULL, 127, 128, 1, 'classified', 0, 1),
(165, 30, '{\"ar\":\"سخانات\"}', 'skh-n-t', '{\"ar\":null}', 'app/categories/custom/b5bc0633eeeace6a0d8c189039c9c254.png', NULL, 129, 130, 1, 'classified', 0, 1),
(166, 30, '{\"ar\":\"دفايات\"}', 'df-y-t', '{\"ar\":null}', 'app/categories/custom/c434fe5aebe8812678458aaad23e830f.png', NULL, 131, 132, 1, 'classified', 0, 1),
(167, 30, '{\"ar\":\"طابعة  - فاكس -  بروجيكتر\"}', 't-baa-f-ks-brogyktr', '{\"ar\":null}', 'app/categories/custom/7048fab645ce42d7d0f8cfdb6bf819d1.png', NULL, 133, 134, 1, 'classified', 0, 1),
(168, 30, '{\"ar\":\"تلفونات ارضي - لاسلكي\"}', 'tlfon-t-rdy-l-slky', '{\"ar\":null}', 'app/categories/custom/97a10b1a18abd2a8fd2179805df970e4.png', NULL, 135, 136, 1, 'classified', 0, 1),
(169, 30, '{\"ar\":\"اجهزة - الكترونيات اخرئ\"}', 'ghz-lktrony-t-khr', '{\"ar\":null}', 'app/categories/custom/603c2d5d4cedabdb149f31d14689a030.png', NULL, 137, 138, 1, 'classified', 0, 1),
(170, 37, '{\"ar\":\"شقق للبيع\"}', 'shkk-llbyaa', '{\"ar\":null}', 'app/categories/custom/3ccd9f60277c58465f8129ea268369ed.png', NULL, 49, 50, 1, 'classified', 0, 1),
(171, 37, '{\"ar\":\"اراضي - مزارع للبيع\"}', 'r-dy-mz-raa-llbyaa', '{\"ar\":null}', 'app/categories/custom/902233b93e47a92706c0aa3d08cd1d9c.png', NULL, 51, 52, 1, 'classified', 0, 1),
(172, 37, '{\"ar\":\"عمارات - مباني للبيع\"}', 'aam-r-t-llbyaa', '{\"ar\":null}', 'app/categories/custom/5a9806c477a11a7584f9f9a6872324be.png', NULL, 53, 54, 1, 'classified', 0, 1),
(173, 37, '{\"ar\":\"فنادق للبيع\"}', 'shrk-t-llbyaa', '{\"ar\":null}', 'app/categories/custom/3d31cd4d2aa27a99cb0003206bb3cf12.png', NULL, 55, 56, 1, 'classified', 0, 1),
(174, 143, '{\"ar\":\"شقق للايجار\"}', 'shkk-ll-yg-r', '{\"ar\":null}', 'app/categories/custom/d41bcb57767991ad7e1f5eb34ca00402.png', NULL, 61, 62, 1, 'classified', 0, 1),
(175, 143, '{\"ar\":\"غرف سكن للايجار\"}', 'ghrf-skn', '{\"ar\":null}', 'app/categories/custom/8acd6e8a08ebd09014da62e24b200e15.png', NULL, 63, 64, 1, 'classified', 0, 1),
(176, 143, '{\"ar\":\"عمارات - مباني للايجار\"}', 'aam-r-t-ll-yg-r', '{\"ar\":null}', 'app/categories/custom/cde6c43f9215aa4d8385ec6af525863a.png', NULL, 65, 66, 1, 'classified', 0, 1),
(177, 143, '{\"ar\":\"اراضي - مزارع للايجار\"}', 'r-dy-mz-raa-ll-yg-r', '{\"ar\":null}', 'app/categories/custom/0d05da8c5a193ee4b5d68873025f108d.png', NULL, 67, 68, 1, 'classified', 0, 1),
(178, 62, '{\"ar\":\"اثاث غرف نوم\"}', 'th-th-ghrf-nom', '{\"ar\":null}', 'app/categories/custom/bc292d0f5c0b0ebc4da53d0c822d28e0.png', NULL, 155, 156, 1, 'classified', 0, 1),
(179, 62, '{\"ar\":\"اثاث غرف جلوس\"}', 'th-th-ghrf-glos', '{\"ar\":null}', 'app/categories/custom/205d3fd9adc27c7856c7c1e573159519.png', NULL, 157, 158, 1, 'classified', 0, 1),
(180, 62, '{\"ar\":\"اثاث مكتبي\"}', 'th-th-mktby', '{\"ar\":null}', 'app/categories/custom/edd2cb45768c959545642db537ae250e.png', NULL, 159, 160, 1, 'classified', 0, 1),
(181, 62, '{\"ar\":\"اثاث خارجي\"}', 'th-th-kh-rgy', '{\"ar\":null}', 'app/categories/custom/fd11002bf26cae49ec3e57647d39f47f.png', NULL, 161, 162, 1, 'classified', 0, 1),
(182, 62, '{\"ar\":\"ديكور\"}', 'dykor', '{\"ar\":null}', 'app/categories/custom/93d04504f5e05121dcd2be9e2e5dedb4.png', NULL, 163, 164, 1, 'classified', 0, 1),
(183, 62, '{\"ar\":\"نباتات\"}', 'nb-t-t', '{\"ar\":null}', 'app/categories/custom/50f0f245dd6491bfa70e00b0eab19755.png', NULL, 165, 166, 1, 'classified', 0, 1),
(184, 62, '{\"ar\":\"مطابخ\"}', 'mt-bkh', '{\"ar\":null}', 'app/categories/custom/cfe955b79842fd0d0f8a46b19258cb79.png', NULL, 167, 168, 1, 'classified', 0, 1),
(185, 62, '{\"ar\":\"ادوات المطبخ\"}', 'do-t-lmtbkh', '{\"ar\":null}', 'app/categories/custom/a195921b2756cfbc8170b309ddbeae08.png', NULL, 169, 170, 1, 'classified', 0, 1),
(186, 62, '{\"ar\":\"حمامات\"}', 'hm-m-t', '{\"ar\":null}', 'app/categories/custom/c00707083e6b3d217e7e2677cde9146f.png', NULL, 171, 172, 1, 'classified', 0, 1),
(187, 62, '{\"ar\":\"بلاط\"}', 'bl-t', '{\"ar\":null}', 'app/categories/custom/29dee2737728a4e59a4dcc1782933969.png', NULL, 173, 174, 1, 'classified', 0, 1),
(188, 62, '{\"ar\":\"سجاد\"}', 'sg-d', '{\"ar\":null}', 'app/categories/custom/4157bc1915fdf2b7f27e9a9a828c2366.png', NULL, 175, 176, 1, 'classified', 0, 1),
(189, 54, '{\"ar\":\"ملابس رجالي\"}', 'ml-bs-rg-ly', '{\"ar\":null}', 'app/categories/custom/3c2bf84cd58c942aa443db1c97d14b54.png', NULL, 179, 180, 1, 'classified', 0, 1),
(190, 54, '{\"ar\":\"ملابس نسائي\"}', 'ml-bs-ns-y', '{\"ar\":null}', 'app/categories/custom/8fb49dbe42d8937a2cdc6db6c7af9994.png', NULL, 181, 182, 1, 'classified', 0, 1),
(191, 54, '{\"ar\":\"ملابس اطفال\"}', 'tf-l', '{\"ar\":null}', 'app/categories/custom/61ead65f41ef3b006c92782dd3212991.png', NULL, 183, 184, 1, 'classified', 0, 1),
(192, 54, '{\"ar\":\"احذية\"}', 'hthy', '{\"ar\":null}', 'app/categories/custom/165e03a400d0fbce252f8046ded17f0f.png', NULL, 185, 186, 1, 'classified', 0, 1),
(193, 54, '{\"ar\":\"عطور\"}', 'aator', '{\"ar\":null}', 'app/categories/custom/991e2faee0491596beb047118004573c.png', NULL, 187, 188, 1, 'classified', 0, 1),
(194, 54, '{\"ar\":\"اداوات تجميل\"}', 'aan-y-shkhsy', '{\"ar\":null}', 'app/categories/custom/9ddc8ab63bb45cda0eea17c35315ea51.png', NULL, 189, 190, 1, 'classified', 0, 1),
(195, 97, '{\"ar\":\"خدمات طبية\"}', 'khdm-t-tby', '{\"ar\":null}', 'app/categories/custom/62b069011e29ff053be553699798351c.png', NULL, 215, 216, 1, 'classified', 0, 1),
(196, 97, '{\"ar\":\"خدمات توصيل\"}', 'khdm-t-tosyl-1', '{\"ar\":null}', 'app/categories/custom/6047ddd869a5b2c13e937a625a89c888.png', NULL, 217, 218, 1, 'classified', 0, 1),
(197, 97, '{\"ar\":\"خدمات كهربائية\"}', 'khdm-t-khrb-y', '{\"ar\":null}', 'app/categories/custom/dfd9aeb0bf41e3aa5fadad186e17aac0.png', NULL, 219, 220, 1, 'classified', 0, 1),
(198, 97, '{\"ar\":\"إصلاح وصيانة السيارات\"}', 'sl-h-osy-n-lsy-r-t', '{\"ar\":null}', 'app/categories/custom/2a3957e66159b1f52140213ed3a0ce16.png', NULL, 221, 222, 1, 'classified', 0, 1),
(199, 97, '{\"ar\":\"خدمات مناسبات\"}', 'khdm-t-mn-sb-t', '{\"ar\":null}', 'app/categories/custom/b3dcdf425e48bb8368c712b10785108f.png', NULL, 223, 224, 1, 'classified', 0, 1),
(200, 97, '{\"ar\":\"السفر والسياحة\"}', 'lsfr-o-lsy-h', '{\"ar\":null}', 'app/categories/custom/6d85fb1080d32e4ef866cbd2d91ad3fb.png', NULL, 225, 226, 1, 'classified', 0, 1),
(201, 97, '{\"ar\":\"خدمات نقل وشحن\"}', 'khdm-t-nkl-oshhn', '{\"ar\":null}', 'app/categories/custom/7fcb188ddd6f9621485b5883d0d34f75.png', NULL, 227, 228, 1, 'classified', 0, 1),
(202, 97, '{\"ar\":\"بناء ومقاولات\"}', 'bn-omk-ol-t', '{\"ar\":null}', 'app/categories/custom/c03b0908ae11b1d880f158e26a621457.png', NULL, 229, 230, 1, 'classified', 0, 1),
(203, 97, '{\"ar\":\"خدمات نقل المياه\"}', 'khdm-t-nkl-lmy-h', '{\"ar\":null}', 'app/categories/custom/2cae662565ed7769320b75bc6c9cf315.png', NULL, 231, 232, 1, 'classified', 0, 1),
(204, 97, '{\"ar\":\"خدمات تنظيف\"}', 'khdm-t-tnthyf', '{\"ar\":null}', 'app/categories/custom/41ae86835dfb5ceb2fcef0adee0de411.png', NULL, 233, 234, 1, 'classified', 0, 1),
(205, 97, '{\"ar\":\"خدمات قانونية\"}', 'khdm-t-k-nony', '{\"ar\":null}', 'app/categories/custom/8f7b107b621ebde6d0b80ae68dbfbc62.png', NULL, 235, 236, 1, 'classified', 0, 1),
(206, 97, '{\"ar\":\"خدمات دهان\"}', 'khdm-t-dh-n', '{\"ar\":null}', 'app/categories/custom/310ba0c6d7369c6a931d82ad19797ff7.png', NULL, 237, 238, 1, 'classified', 0, 1),
(207, 97, '{\"ar\":\"اخرئ\"}', 'khr', '{\"ar\":null}', 'app/categories/custom/861acd5138c2eeef07c3912e29b4298f.png', NULL, 239, 240, 1, 'classified', 0, 1),
(208, 73, '{\"ar\":\"وظائف فنيين وحرفيين\"}', 'oth-f-fnyyn-ohrfyyn', '{\"ar\":null}', 'app/categories/custom/6f78da0d9a5630f2dfaaf7b063336ea8.png', NULL, 195, 196, 1, 'classified', 0, 1),
(209, 73, '{\"ar\":\"وظائف فندقة - مطاعم\"}', 'oth-f-fndk-mt-aam', '{\"ar\":null}', 'app/categories/custom/01281444c5efa9f4b99cd39faf08541a.png', NULL, 197, 198, 1, 'classified', 0, 1),
(210, 73, '{\"ar\":\"وظائف تدريس\"}', 'oth-f-tdrys', '{\"ar\":null}', 'app/categories/custom/7a17ed1405868ff4af8889413531a628.png', NULL, 199, 200, 1, 'classified', 0, 1),
(211, 73, '{\"ar\":\"وظائف مبيعات\"}', 'oth-f-mbyaa-t', '{\"ar\":null}', 'app/categories/custom/9f9697cd087062ea4737ec85476e1e66.png', NULL, 201, 202, 1, 'classified', 0, 1),
(212, 73, '{\"ar\":\"وظائف تسويق\"}', 'oth-f-tsoyk', '{\"ar\":null}', 'app/categories/custom/eca3b877a16898329a4c921ff9d4bc67.png', NULL, 203, 204, 1, 'classified', 0, 1),
(213, 73, '{\"ar\":\"وظائف صحة\"}', 'oth-f-sh', '{\"ar\":null}', 'app/categories/custom/de3e58aaf93f0c81eeb4105e234ee986.png', NULL, 205, 206, 1, 'classified', 0, 1),
(214, 73, '{\"ar\":\"وظائف هندسة\"}', 'oth-f-hnds', '{\"ar\":null}', 'app/categories/custom/c6db249b392da14874ddada58db3a791.png', NULL, 207, 208, 1, 'classified', 0, 1),
(215, 73, '{\"ar\":\"وظائف حراسة\"}', 'oth-f-hr-s', '{\"ar\":null}', 'app/categories/custom/8de7c7c942c4bbd19f4fabee0973b321.png', NULL, 209, 210, 1, 'classified', 0, 1),
(216, 114, '{\"ar\":\"عسل\"}', 'aasl', '{\"ar\":null}', 'app/categories/custom/7b142021f90541f740a963f858fe1a39.png', NULL, 245, 246, 1, 'classified', 0, 1),
(217, 114, '{\"ar\":\"زيوت\"}', 'zyot', '{\"ar\":null}', 'app/categories/custom/647938bb3ad2f96a18101a272873a557.png', NULL, 247, 248, 1, 'classified', 0, 1),
(218, 114, '{\"ar\":\"تمور\"}', 'tmor', '{\"ar\":null}', 'app/categories/custom/f206fb228e7567bbadb6c69bef99ccb1.png', NULL, 249, 250, 1, 'classified', 0, 1),
(222, 1, '{\"ar\":\"سيارات للبيع\"}', 'sy-r-t-llbyaa', '{\"ar\":null}', 'app/categories/custom/945b10673d2dee4283bff5a306c99cc5.png', NULL, 21, 22, 1, 'classified', 0, 1),
(223, NULL, '{\"ar\":\"أسلحه خفيفة\"}', 'aslhh-khfyf', '{\"ar\":null}', 'app/categories/custom/fc32d623099a5aaee7bb36c61d712c2a.png', NULL, 242, 243, 0, 'classified', 0, 1),
(224, NULL, '{\"ar\":\"عروض وتخفيضات\"}', 'aarod-otkhfyd-t', '{\"ar\":null}', 'app/categories/custom/23e3b86e36c0e0fa40fb7678ed481462.png', NULL, 2, 19, 0, 'classified', 0, 1),
(225, 224, '{\"ar\":\"عروض بقالات\"}', 'aarod-bk-l-t', '{\"ar\":null}', NULL, NULL, 3, 4, 1, 'classified', 0, 1),
(226, 224, '{\"ar\":\"عروض مراكز تجاريه\"}', 'aarod-mr-kz-tg-ryh', '{\"ar\":null}', NULL, NULL, 5, 6, 1, 'classified', 0, 1),
(227, 224, '{\"ar\":\"عروض فندقيه\"}', 'aarod-fndkyh', '{\"ar\":null}', NULL, NULL, 7, 8, 1, 'classified', 0, 1),
(228, 224, '{\"ar\":\"عروض منتجعات سياحيه\"}', 'aarod-mntgaa-t-sy-hyh', '{\"ar\":null}', NULL, NULL, 9, 10, 1, 'classified', 0, 1),
(229, 224, '{\"ar\":\"عروض ادوات واثاث منزليه\"}', 'aarod-do-t-o-th-th-mnzlyh', '{\"ar\":null}', NULL, NULL, 11, 12, 1, 'classified', 0, 1),
(230, 224, '{\"ar\":\"عروض طبيه\"}', 'aarod-tbyh', '{\"ar\":null}', NULL, NULL, 13, 14, 1, 'classified', 0, 1),
(231, 224, '{\"ar\":\"عروض موضه وملابس\"}', 'aarod-modh-oml-bs', '{\"ar\":null}', NULL, NULL, 15, 16, 1, 'classified', 0, 1),
(232, 224, '{\"ar\":\"عروض اخرى\"}', 'aarod-khr', '{\"ar\":null}', NULL, NULL, 17, 18, 1, 'classified', 0, 1),
(233, 37, '{\"ar\":\"فلل للبيع\"}', 'fll-llbyaa', '{\"ar\":null}', 'app/categories/custom/7b548d5832008caceb358cceb745c257.png', NULL, 57, 58, 1, 'classified', 0, 1),
(234, 54, '{\"ar\":\"اكسسوارات\"}', 'ksso-r-t', '{\"ar\":null}', 'app/categories/custom/4af4ce112caf640d570a4da1de0718ab.png', NULL, 191, 192, 1, 'classified', 0, 1),
(235, 143, '{\"ar\":\"فلل للايجار\"}', 'fll-ll-yg-r', '{\"ar\":null}', 'app/categories/custom/c9026597becb6c78db8085b7431158b3.png', NULL, 69, 70, 1, 'classified', 0, 1),
(236, 73, '{\"ar\":\"وظائف اخرى\"}', 'oth-f-khr', '{\"ar\":null}', 'app/categories/custom/c84b5b81fa7807adf38be3b0395f1268.png', NULL, 211, 212, 1, 'classified', 0, 1),
(237, NULL, '{\"ar\":\"محلات - متاجر\"}', 'mhl-t-mt-gr', '{\"ar\":null}', 'app/categories/custom/6b6089292fab80f67d2649e6126aae6d.png', NULL, 80, 81, 0, 'classified', 0, 1),
(238, NULL, '{\"ar\":\"محلات - متاجر للبيع\"}', 'mhl-t-llbyaa', '{\"ar\":null}', 'app/categories/custom/093f881d9a8e995942393b9d8a6c4ab3.png', NULL, 82, 83, 0, 'classified', 0, 1),
(239, NULL, '{\"ar\":\"محلات - متاجر للايجار\"}', 'mhl-t-ll-yg-r', '{\"ar\":null}', 'app/categories/custom/569b9ce1e81c32271f5a0c386da09e96.png', NULL, 84, 85, 0, 'classified', 0, 1),
(240, NULL, '{\"ar\":\"فنادق ومنتجعات سياحية\"}', 'fn-dk-omntgaa-t-sy-hy', '{\"ar\":null}', 'app/categories/custom/97776d182bb02d3eeb383ebd1d0f9057.jpeg', NULL, 72, 79, 0, 'classified', 0, 1),
(241, 240, '{\"ar\":\"فنادق\"}', 'fn-dk', '{\"ar\":null}', 'app/categories/custom/dcc44e7f70316506da46b38da5eefdd6.png', NULL, 73, 74, 1, 'classified', 0, 1),
(242, 240, '{\"ar\":\"منتجعات سياحية\"}', 'mntgaa-t-sy-hy', '{\"ar\":null}', 'app/categories/custom/64bf5b1e1f90b0e1fba2dd39ace32d24.png', NULL, 75, 76, 1, 'classified', 0, 1),
(243, 240, '{\"ar\":\"استراحة\"}', 'str-h', '{\"ar\":null}', 'app/categories/custom/fc06ab73f2cac3da94bf79a435aac47e.png', NULL, 77, 78, 1, 'classified', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_field`
--

CREATE TABLE `category_field` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `disabled_in_subcategories` tinyint(1) UNSIGNED DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_field`
--

INSERT INTO `category_field` (`id`, `category_id`, `field_id`, `disabled_in_subcategories`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(19, 54, 8, 0, NULL, NULL, NULL, NULL),
(34, 3, 1, 0, NULL, NULL, NULL, NULL),
(35, 3, 3, 0, NULL, NULL, NULL, NULL),
(36, 3, 8, 0, NULL, NULL, NULL, NULL),
(37, 3, 4, 0, NULL, NULL, NULL, NULL),
(38, 3, 6, 0, NULL, NULL, NULL, NULL),
(39, 3, 27, 0, NULL, NULL, NULL, NULL),
(40, 3, 2, 0, NULL, NULL, NULL, NULL),
(41, 3, 5, 0, NULL, NULL, NULL, NULL),
(42, 3, 7, 0, NULL, NULL, NULL, NULL),
(44, 3, 28, 0, NULL, NULL, NULL, NULL),
(45, 4, 29, 0, NULL, NULL, NULL, NULL),
(46, 4, 8, 0, NULL, NULL, NULL, NULL),
(47, 4, 4, 0, NULL, NULL, NULL, NULL),
(48, 4, 30, 0, NULL, NULL, NULL, NULL),
(49, 4, 3, 0, NULL, NULL, NULL, NULL),
(50, 4, 5, 0, NULL, NULL, NULL, NULL),
(51, 6, 8, 0, NULL, NULL, NULL, NULL),
(52, 6, 31, 0, NULL, NULL, NULL, NULL),
(53, 7, 32, 0, NULL, NULL, NULL, NULL),
(54, 8, 8, 0, NULL, NULL, NULL, NULL),
(55, 135, 33, 0, NULL, NULL, NULL, NULL),
(56, 138, 8, 0, NULL, NULL, NULL, NULL),
(57, 138, 35, 0, NULL, NULL, NULL, NULL),
(58, 138, 34, 0, NULL, NULL, NULL, NULL),
(59, 139, 8, 0, NULL, NULL, NULL, NULL),
(60, 139, 36, 0, NULL, NULL, NULL, NULL),
(61, 137, 8, 0, NULL, NULL, NULL, NULL),
(62, 137, 37, 0, NULL, NULL, NULL, NULL),
(63, 10, 8, 0, NULL, NULL, NULL, NULL),
(64, 10, 28, 0, NULL, NULL, NULL, NULL),
(65, 10, 40, 0, NULL, NULL, NULL, NULL),
(66, 10, 38, 0, NULL, NULL, NULL, NULL),
(67, 10, 39, 0, NULL, NULL, NULL, NULL),
(68, 11, 8, 0, NULL, NULL, NULL, NULL),
(69, 11, 39, 0, NULL, NULL, NULL, NULL),
(70, 11, 41, 0, NULL, NULL, NULL, NULL),
(71, 11, 28, 0, NULL, NULL, NULL, NULL),
(72, 11, 40, 0, NULL, NULL, NULL, NULL),
(73, 12, 42, 0, NULL, NULL, NULL, NULL),
(74, 141, 8, 0, NULL, NULL, NULL, NULL),
(75, 141, 43, 0, NULL, NULL, NULL, NULL),
(76, 144, 8, 0, NULL, NULL, NULL, NULL),
(77, 144, 44, 0, NULL, NULL, NULL, NULL),
(78, 145, 8, 0, NULL, NULL, NULL, NULL),
(79, 146, 45, 0, NULL, NULL, NULL, NULL),
(80, 146, 8, 0, NULL, NULL, NULL, NULL),
(81, 147, 46, 0, NULL, NULL, NULL, NULL),
(82, 150, 8, 0, NULL, NULL, NULL, NULL),
(83, 151, 47, 0, NULL, NULL, NULL, NULL),
(84, 152, 48, 0, NULL, NULL, NULL, NULL),
(85, 152, 49, 0, NULL, NULL, NULL, NULL),
(86, 152, 50, 0, NULL, NULL, NULL, NULL),
(87, 152, 8, 0, NULL, NULL, NULL, NULL),
(88, 151, 8, 0, NULL, NULL, NULL, NULL),
(89, 222, 8, 0, NULL, NULL, NULL, NULL),
(90, 222, 4, 0, NULL, NULL, NULL, NULL),
(91, 222, 28, 0, NULL, NULL, NULL, NULL),
(92, 222, 6, 0, NULL, NULL, NULL, NULL),
(93, 222, 2, 0, NULL, NULL, NULL, NULL),
(94, 222, 5, 0, NULL, NULL, NULL, NULL),
(95, 222, 7, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` double(8,2) DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `latitude` double(8,2) DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `feature_class` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subadmin2_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `population` bigint(20) DEFAULT NULL,
  `time_zone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_code`, `name`, `longitude`, `latitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(1, 'YE', '{\"en\":\"Zinjibār\",\"ar\":\"ريمة\"}', 45.38, 13.13, 'P', 'PPLA', 'YE.01', 'YE.01.1210', 19879, 'Asia/Aden', 1, '2020-06-09 23:00:00', '2021-06-05 14:48:04'),
(3, 'YE', '{\"en\":\"Yarīm\",\"ar\":\"صعدة\"}', 44.38, 14.30, 'P', 'PPLA2', 'YE.23', 'YE.23.1102', 33050, 'Asia/Aden', 1, '2020-06-09 23:00:00', '2021-06-05 14:48:21'),
(4, 'YE', '{\"en\":\"Taiz\",\"ar\":\"تعز المدينة\"}', 44.02, 13.58, 'P', 'PPLA', 'YE.05', 'YE.25.1520', 615222, 'Asia/Aden', 1, '2020-07-27 23:00:00', '2021-10-23 09:38:51'),
(6, 'YE', '{\"en\":\"Sanaa\",\"ar\":\"صنعاء\"}', 44.21, 15.35, 'P', 'PPLC', 'YE.16', NULL, 1937451, 'Asia/Aden', 1, '2020-06-28 23:00:00', '2021-05-03 12:34:01'),
(9, 'YE', '{\"en\":\"Ma\'rib\",\"ar\":\"مارب\"}', 45.33, 15.46, 'P', 'PPLA', 'YE.14', 'YE.14.2612', 16794, 'Asia/Aden', 1, '2017-02-09 23:00:00', '2021-05-03 12:34:52'),
(10, 'YE', '{\"en\":\"Laḩij\",\"ar\":\"لحج\"}', 44.88, 13.06, 'P', 'PPLA', 'YE.24', 'YE.24.2514', 23375, 'Asia/Aden', 1, '2020-06-09 23:00:00', '2021-05-03 12:35:24'),
(11, 'YE', '{\"en\":\"Jawf al Maqbābah\",\"ar\":\"الجوف\"}', 45.83, 13.84, 'P', 'PPL', 'YE.01', 'YE.01.1204', 14175, 'Asia/Aden', 1, '2020-06-09 23:00:00', '2021-05-03 12:35:07'),
(12, 'YE', '{\"en\":\"Ibb\",\"ar\":\"اب\"}', 44.18, 13.97, 'P', 'PPLA', 'YE.23', 'YE.23.1118', 234837, 'Asia/Aden', 1, '2020-06-10 23:00:00', '2021-05-03 12:36:59'),
(13, 'YE', '{\"en\":\"Ḩajjah\",\"ar\":\"حجة\"}', 43.61, 15.69, 'P', 'PPLA', 'YE.22', 'YE.22.1728', 43549, 'Asia/Aden', 1, '2020-06-09 23:00:00', '2021-05-03 12:37:34'),
(14, 'YE', '{\"en\":\"Hadibu\",\"ar\":\"ابين\"}', 54.02, 12.65, 'P', 'PPLA2', 'YE.28', 'YE.28.1926', 8545, 'Asia/Aden', 1, '2015-12-10 23:00:00', '2021-06-05 14:49:01'),
(16, 'YE', '{\"en\":\"Dhamār\",\"ar\":\"ذمار\"}', 44.41, 14.54, 'P', 'PPLA', 'YE.11', 'YE.11.2008', 160114, 'Asia/Aden', 1, '2020-06-09 23:00:00', '2021-06-20 17:56:43'),
(18, 'YE', '{\"en\":\"Bājil\",\"ar\":\"حضرموت\"}', 43.29, 15.06, 'P', 'PPLA2', 'YE.08', 'YE.08.1810', 48218, 'Asia/Aden', 1, '2016-01-06 23:00:00', '2021-06-05 14:49:39'),
(19, 'YE', '{\"en\":\"Ataq\",\"ar\":\"عتق\"}', 46.83, 14.54, 'P', 'PPLA', 'YE.05', 'YE.05.2113', 37315, 'Asia/Aden', 1, '2013-08-07 23:00:00', '2021-05-03 12:40:11'),
(20, 'YE', '{\"en\":\"‘Amrān\",\"ar\":\"عمران\"}', 43.94, 15.66, 'P', 'PPLA', 'YE.19', 'YE.19.2915', 90792, 'Asia/Aden', 1, '2020-06-10 23:00:00', '2021-05-03 12:39:30'),
(21, 'YE', '{\"en\":\"Mukalla\",\"ar\":\"المكلا\"}', 49.12, 14.54, 'P', 'PPLA', 'YE.04', 'YE.04.1929', 258132, 'Asia/Aden', 1, '2018-08-19 23:00:00', '2021-05-03 12:39:53'),
(22, 'YE', '{\"en\":\"Al Maḩwīt\",\"ar\":\"المحويت\"}', 43.54, 15.47, 'P', 'PPLA', 'YE.10', 'YE.10.2708', 10593, 'Asia/Aden', 1, '2020-06-09 23:00:00', '2021-05-03 12:40:26'),
(23, 'YE', '{\"en\":\"Al Ḩudaydah\",\"ar\":\"الحديده\"}', 42.95, 14.80, 'P', 'PPLA', 'YE.08', 'YE.08.1821', 617871, 'Asia/Aden', 1, '2020-07-07 23:00:00', '2021-05-03 12:40:42'),
(24, 'YE', '{\"en\":\"Al Ḩazm\",\"ar\":\"المهرة\"}', 44.78, 16.16, 'P', 'PPLA', 'YE.21', 'YE.21.1605', 18241, 'Asia/Aden', 1, '2020-06-09 23:00:00', '2021-06-05 14:49:22'),
(25, 'YE', '{\"en\":\"Al Ghayz̧ah\",\"ar\":\"شبوة\"}', 52.18, 16.21, 'P', 'PPLA', 'YE.03', 'YE.03.2804', 10948, 'Asia/Aden', 1, '2020-06-09 23:00:00', '2021-06-05 14:50:56'),
(26, 'YE', '{\"en\":\"Al Bayda\",\"ar\":\"البيضاء\"}', 45.57, 13.99, 'P', 'PPLA', 'YE.20', 'YE.20.1409', 37821, 'Asia/Aden', 1, '2017-04-23 23:00:00', '2021-05-03 12:42:23'),
(27, 'YE', '{\"en\":\"Aḑ Ḑāli‘\",\"ar\":\"الضالع\"}', 44.73, 13.70, 'P', 'PPLA', 'YE.18', 'YE.18.3006', 14760, 'Asia/Aden', 1, '2020-07-31 23:00:00', '2021-05-03 12:43:56'),
(29, 'YE', '{\"en\":\"Aden\",\"ar\":\"عدن\"}', 45.04, 12.78, 'P', 'PPLA', 'YE.02', 'YE.02.2407', 550602, 'Asia/Aden', 1, '2020-06-10 23:00:00', '2021-05-03 12:42:39'),
(15000000, 'YE', '{\"ar\":\"تعز الحوبان\"}', 999999.99, 345345.00, NULL, NULL, 'YE.24', NULL, 5353, 'Asia/Aden', 1, '2021-10-23 09:39:54', '2021-10-23 09:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `coins`
--

CREATE TABLE `coins` (
  `id` int(3) NOT NULL,
  `coin_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coins`
--

INSERT INTO `coins` (`id`, `coin_name`) VALUES
(0, 'ريال'),
(1, 'ٍSAR'),
(2, '$');

-- --------------------------------------------------------

--
-- Table structure for table `continents`
--

CREATE TABLE `continents` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `continents`
--

INSERT INTO `continents` (`id`, `code`, `name`, `active`) VALUES
(1, 'AF', 'Africa', 1),
(2, 'AN', 'Antarctica', 1),
(3, 'AS', 'Asia', 1),
(4, 'EU', 'Europe', 1),
(5, 'NA', 'North America', 1),
(6, 'OC', 'Oceania', 1),
(7, 'SA', 'South America', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_numeric` int(10) UNSIGNED DEFAULT NULL,
  `fips` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` int(10) UNSIGNED DEFAULT NULL,
  `population` int(10) UNSIGNED DEFAULT NULL,
  `continent_code` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tld` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code_format` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code_regex` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighbours` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equivalent_fips_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime_format` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_type` enum('0','1','2') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `admin_field_active` tinyint(1) UNSIGNED DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `time_zone`, `date_format`, `datetime_format`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(55, 'CX', 'CXR', 162, 'KT', '{\"ar\": \"جزيرة الكريسماس\"}', 'Flying Fish Cove', 135, 1500, 'AS', '.cx', 'AUD', '61', '####', '^(d{4})$', 'en,zh,ms-CC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(56, 'CY', 'CYP', 196, 'CY', '{\"ar\": \"قبرص\"}', 'Nicosia', 9250, 1102677, 'EU', '.cy', 'EUR', '357', '####', '^(d{4})$', 'el-CY,tr-CY,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(57, 'CZ', 'CZE', 203, 'EZ', '{\"ar\": \"جمهورية التشيك\"}', 'Prague', 78866, 10476000, 'EU', '.cz', 'CZK', '420', '### ##', '^(d{5})$', 'cs,sk', 'PL,DE,SK,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(58, 'DE', 'DEU', 276, 'GM', '{\"ar\": \"ألمانيا\"}', 'Berlin', 357021, 81802257, 'EU', '.de', 'EUR', '49', '#####', '^(d{5})$', 'de', 'CH,PL,NL,DK,BE,CZ,LU,FR,AT', '', 'UTC', NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-06-29 16:17:35'),
(59, 'DJ', 'DJI', 262, 'DJ', '{\"ar\": \"جيبوتي\"}', 'Djibouti', 23000, 740528, 'AF', '.dj', 'DJF', '253', '', '', 'fr-DJ,ar,so-DJ,aa', 'ER,ET,SO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(60, 'DK', 'DNK', 208, 'DA', '{\"ar\": \"الدانمرك\"}', 'Copenhagen', 43094, 5484000, 'EU', '.dk', 'DKK', '45', '####', '^(d{4})$', 'da-DK,en,fo,de-DK', 'DE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(61, 'DM', 'DMA', 212, 'DO', '{\"ar\": \"دومينيكا\"}', 'Roseau', 754, 72813, 'NA', '.dm', 'XCD', '+1-767', '', '', 'en-DM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(62, 'DO', 'DOM', 214, 'DR', '{\"ar\": \"جمهورية الدومينيك\"}', 'Santo Domingo', 48730, 9823821, 'NA', '.do', 'DOP', '+809/829/849', '#####', '^(d{5})$', 'es-DO', 'HT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(63, 'DZ', 'DZA', 12, 'AG', '{\"ar\": \"الجزائر\"}', 'Algiers', 2381740, 34586184, 'AF', '.dz', 'DZD', '213', '#####', '^(d{5})$', 'ar-DZ,fr', 'NE,EH,LY,MR,TN,MA,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(64, 'EC', 'ECU', 218, 'EC', '{\"ar\": \"الإكوادور\"}', 'Quito', 283560, 14790608, 'SA', '.ec', 'USD', '593', '@####@', '^([a-zA-Z]d{4}[a-zA-Z])$', 'es-EC', 'PE,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(65, 'EE', 'EST', 233, 'EN', '{\"ar\": \"أستونيا\"}', 'Tallinn', 45226, 1291170, 'EU', '.ee', 'EUR', '372', '#####', '^(d{5})$', 'et,ru', 'RU,LV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(66, 'EG', 'EGY', 818, 'EG', '{\"ar\": \"مصر\"}', 'Cairo', 1001450, 80471869, 'AF', '.eg', 'EGP', '20', '#####', '^(d{5})$', 'ar-EG,en,fr', 'LY,SD,IL,PS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(67, 'EH', 'ESH', 732, 'WI', '{\"ar\": \"الصحراء الغربية\"}', 'El-Aaiun', 266000, 273008, 'AF', '.eh', 'MAD', '212', '', '', 'ar,mey', 'DZ,MR,MA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(68, 'ER', 'ERI', 232, 'ER', '{\"ar\": \"أريتريا\"}', 'Asmara', 121320, 5792984, 'AF', '.er', 'ERN', '291', '', '', 'aa-ER,ar,tig,kun,ti-ER', 'ET,SD,DJ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(69, 'ES', 'ESP', 724, 'SP', '{\"ar\": \"إسبانيا\"}', 'Madrid', 504782, 46505963, 'EU', '.es', 'EUR', '34', '#####', '^(d{5})$', 'es-ES,ca,gl,eu,oc', 'AD,PT,GI,FR,MA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(70, 'ET', 'ETH', 231, 'ET', '{\"ar\": \"إثيوبيا\"}', 'Addis Ababa', 1127127, 88013491, 'AF', '.et', 'ETB', '251', '####', '^(d{4})$', 'am,en-ET,om-ET,ti-ET,so-ET,sid', 'ER,KE,SD,SS,SO,DJ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(71, 'FI', 'FIN', 246, 'FI', '{\"ar\": \"فنلندا\"}', 'Helsinki', 337030, 5244000, 'EU', '.fi', 'EUR', '358', '#####', '^(?:FI)*(d{5})$', 'fi-FI,sv-FI,smn', 'NO,RU,SE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(72, 'FJ', 'FJI', 242, 'FJ', '{\"ar\": \"فيجي\"}', 'Suva', 18270, 875983, 'OC', '.fj', 'FJD', '679', '', '', 'en-FJ,fj', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(73, 'FK', 'FLK', 238, 'FK', '{\"ar\": \"جزر فوكلاند\"}', 'Stanley', 12173, 2638, 'SA', '.fk', 'FKP', '500', '', '', 'en-FK', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(74, 'FM', 'FSM', 583, 'FM', '{\"ar\": \"ميكرونيزيا\"}', 'Palikir', 702, 107708, 'OC', '.fm', 'USD', '691', '#####', '^(d{5})$', 'en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(75, 'FO', 'FRO', 234, 'FO', '{\"ar\": \"جزر فارو\"}', 'Torshavn', 1399, 48228, 'EU', '.fo', 'DKK', '298', 'FO-###', '^(?:FO)*(d{3})$', 'fo,da-FO', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(76, 'FR', 'FRA', 250, 'FR', '{\"ar\": \"فرنسا\"}', 'Paris', 547030, 64768389, 'EU', '.fr', 'EUR', '33', '#####', '^(d{5})$', 'fr-FR,frp,br,co,ca,eu,oc', 'CH,DE,BE,LU,IT,AD,MC,ES', '', 'UTC', NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-07 14:39:43'),
(77, 'GA', 'GAB', 266, 'GB', '{\"ar\": \"الجابون\"}', 'Libreville', 267667, 1545255, 'AF', '.ga', 'XAF', '241', '', '', 'fr-GA', 'CM,GQ,CG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(78, 'GD', 'GRD', 308, 'GJ', '{\"ar\": \"غرينادا\"}', 'St. George\'s', 344, 107818, 'NA', '.gd', 'XCD', '+1-473', '', '', 'en-GD', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(79, 'GE', 'GEO', 268, 'GG', '{\"ar\": \"جورجيا\"}', 'Tbilisi', 69700, 4630000, 'AS', '.ge', 'GEL', '995', '####', '^(d{4})$', 'ka,ru,hy,az', 'AM,AZ,TR,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(80, 'GF', 'GUF', 254, 'FG', '{\"ar\": \"غويانا الفرنسية\"}', 'Cayenne', 91000, 195506, 'SA', '.gf', 'EUR', '594', '#####', '^((97|98)3d{2})$', 'fr-GF', 'SR,BR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(81, 'GG', 'GGY', 831, 'GK', '{\"ar\": \"غيرنزي\"}', 'St Peter Port', 78, 65228, 'EU', '.gg', 'GBP', '+44-1481', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(82, 'GH', 'GHA', 288, 'GH', '{\"ar\": \"غانا\"}', 'Accra', 239460, 24339838, 'AF', '.gh', 'GHS', '233', '', '', 'en-GH,ak,ee,tw', 'CI,TG,BF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(83, 'GI', 'GIB', 292, 'GI', '{\"ar\": \"جبل طارق\"}', 'Gibraltar', 7, 27884, 'EU', '.gi', 'GIP', '350', '', '', 'en-GI,es,it,pt', 'ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(84, 'GL', 'GRL', 304, 'GL', '{\"ar\": \"غرينلاند\"}', 'Nuuk', 2166086, 56375, 'NA', '.gl', 'DKK', '299', '####', '^(d{4})$', 'kl,da-GL,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(85, 'GM', 'GMB', 270, 'GA', '{\"ar\": \"غامبيا\"}', 'Banjul', 11300, 1593256, 'AF', '.gm', 'GMD', '220', '', '', 'en-GM,mnk,wof,wo,ff', 'SN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(86, 'GN', 'GIN', 324, 'GV', '{\"ar\": \"غينيا\"}', 'Conakry', 245857, 10324025, 'AF', '.gn', 'GNF', '224', '', '', 'fr-GN', 'LR,SN,SL,CI,GW,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(87, 'GP', 'GLP', 312, 'GP', '{\"ar\": \"جوادلوب\"}', 'Basse-Terre', 1780, 443000, 'NA', '.gp', 'EUR', '590', '#####', '^((97|98)d{3})$', 'fr-GP', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(88, 'GQ', 'GNQ', 226, 'EK', '{\"ar\": \"غينيا الاستوائية\"}', 'Malabo', 28051, 1014999, 'AF', '.gq', 'XAF', '240', '', '', 'es-GQ,fr', 'GA,CM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(89, 'GR', 'GRC', 300, 'GR', '{\"ar\": \"اليونان\"}', 'Athens', 131940, 11000000, 'EU', '.gr', 'EUR', '30', '### ##', '^(d{5})$', 'el-GR,en,fr', 'AL,MK,TR,BG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(90, 'GS', 'SGS', 239, 'SX', '{\"ar\": \"جورجيا الجنوبية وجزر ساندويتش الجنوبية\"}', 'Grytviken', 3903, 30, 'AN', '.gs', 'GBP', '', '', '', 'en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(91, 'GT', 'GTM', 320, 'GT', '{\"ar\": \"غواتيمالا\"}', 'Guatemala City', 108890, 13550440, 'NA', '.gt', 'GTQ', '502', '#####', '^(d{5})$', 'es-GT', 'MX,HN,BZ,SV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(92, 'GU', 'GUM', 316, 'GQ', '{\"ar\": \"غوام\"}', 'Hagatna', 549, 159358, 'OC', '.gu', 'USD', '+1-671', '969##', '^(969d{2})$', 'en-GU,ch-GU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(93, 'GW', 'GNB', 624, 'PU', '{\"ar\": \"غينيا بيساو\"}', 'Bissau', 36120, 1565126, 'AF', '.gw', 'XOF', '245', '####', '^(d{4})$', 'pt-GW,pov', 'SN,GN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(94, 'GY', 'GUY', 328, 'GY', '{\"ar\": \"غيانا\"}', 'Georgetown', 214970, 748486, 'SA', '.gy', 'GYD', '592', '', '', 'en-GY', 'SR,BR,VE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(95, 'HK', 'HKG', 344, 'HK', '{\"ar\": \"هونغ كونغ الصينية\"}', 'Hong Kong', 1092, 6898686, 'AS', '.hk', 'HKD', '852', '', '', 'zh-HK,yue,zh,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(96, 'HM', 'HMD', 334, 'HM', '{\"ar\": \"جزيرة هيرد وجزر ماكدونالد\"}', '', 412, 0, 'AN', '.hm', 'AUD', ' ', '', '', '', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(97, 'HN', 'HND', 340, 'HO', '{\"ar\": \"هندوراس\"}', 'Tegucigalpa', 112090, 7989415, 'NA', '.hn', 'HNL', '504', '@@####', '^([A-Z]{2}d{4})$', 'es-HN', 'GT,NI,SV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(98, 'HR', 'HRV', 191, 'HR', '{\"ar\": \"كرواتيا\"}', 'Zagreb', 56542, 4491000, 'EU', '.hr', 'HRK', '385', '#####', '^(?:HR)*(d{5})$', 'hr-HR,sr', 'HU,SI,BA,ME,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(99, 'HT', 'HTI', 332, 'HA', '{\"ar\": \"هايتي\"}', 'Port-au-Prince', 27750, 9648924, 'NA', '.ht', 'HTG', '509', 'HT####', '^(?:HT)*(d{4})$', 'ht,fr-HT', 'DO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(100, 'HU', 'HUN', 348, 'HU', '{\"ar\": \"هنغاريا\"}', 'Budapest', 93030, 9982000, 'EU', '.hu', 'HUF', '36', '####', '^(d{4})$', 'hu-HU', 'SK,SI,RO,UA,HR,AT,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(101, 'ID', 'IDN', 360, 'ID', '{\"ar\": \"اندونيسيا\"}', 'Jakarta', 1919440, 242968342, 'AS', '.id', 'IDR', '62', '#####', '^(d{5})$', 'id,en,nl,jv', 'PG,TL,MY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(102, 'IE', 'IRL', 372, 'EI', '{\"ar\": \"أيرلندا\"}', 'Dublin', 70280, 4622917, 'EU', '.ie', 'EUR', '353', '', '', 'en-IE,ga-IE', 'GB', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(103, 'IL', 'ISR', 376, 'IS', '{\"ar\": \"إسرائيل\"}', 'Jerusalem', 20770, 7353985, 'AS', '.il', 'ILS', '972', '#####', '^(d{5})$', 'he,ar-IL,en-IL,', 'SY,JO,LB,EG,PS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(104, 'IM', 'IMN', 833, 'IM', '{\"ar\": \"جزيرة مان\"}', 'Douglas, Isle of Man', 572, 75049, 'EU', '.im', 'GBP', '+44-1624', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,gv', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(105, 'IN', 'IND', 356, 'IN', '{\"ar\": \"الهند\"}', 'New Delhi', 3287590, 1173108018, 'AS', '.in', 'INR', '91', '######', '^(d{6})$', 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,k', 'CN,NP,MM,BT,PK,BD', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(106, 'IO', 'IOT', 86, 'IO', '{\"ar\": \"الإقليم البريطاني في المحيط الهندي\"}', 'Diego Garcia', 60, 4000, 'AS', '.io', 'USD', '246', '', '', 'en-IO', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(107, 'IQ', 'IRQ', 368, 'IZ', '{\"ar\": \"العراق\"}', 'Baghdad', 437072, 29671605, 'AS', '.iq', 'IQD', '964', '#####', '^(d{5})$', 'ar-IQ,ku,hy', 'SY,SA,IR,JO,TR,KW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(108, 'IR', 'IRN', 364, 'IR', '{\"ar\": \"إيران\"}', 'Tehran', 1648000, 76923300, 'AS', '.ir', 'IRR', '98', '##########', '^(d{10})$', 'fa-IR,ku', 'TM,AF,IQ,AM,PK,AZ,TR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(109, 'IS', 'ISL', 352, 'IC', '{\"ar\": \"أيسلندا\"}', 'Reykjavik', 103000, 308910, 'EU', '.is', 'ISK', '354', '###', '^(d{3})$', 'is,en,de,da,sv,no', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(110, 'IT', 'ITA', 380, 'IT', '{\"ar\": \"إيطاليا\"}', 'Rome', 301230, 60340328, 'EU', '.it', 'EUR', '39', '#####', '^(d{5})$', 'it-IT,en,de-IT,fr-IT,sc,ca,co,sl', 'CH,VA,SI,SM,FR,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(111, 'JE', 'JEY', 832, 'JE', '{\"ar\": \"جيرسي\"}', 'Saint Helier', 116, 90812, 'EU', '.je', 'GBP', '+44-1534', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,pt', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(112, 'JM', 'JAM', 388, 'JM', '{\"ar\": \"جامايكا\"}', 'Kingston', 10991, 2847232, 'NA', '.jm', 'JMD', '+1-876', '', '', 'en-JM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(113, 'JO', 'JOR', 400, 'JO', '{\"ar\": \"الأردن\"}', 'Amman', 92300, 6407085, 'AS', '.jo', 'JOD', '962', '#####', '^(d{5})$', 'ar-JO,en', 'SY,SA,IQ,IL,PS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(114, 'JP', 'JPN', 392, 'JA', '{\"ar\": \"اليابان\"}', 'Tokyo', 377835, 127288000, 'AS', '.jp', 'JPY', '81', '###-####', '^(d{7})$', 'ja', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(115, 'KE', 'KEN', 404, 'KE', '{\"ar\": \"كينيا\"}', 'Nairobi', 582650, 40046566, 'AF', '.ke', 'KES', '254', '#####', '^(d{5})$', 'en-KE,sw-KE', 'ET,TZ,SS,SO,UG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(116, 'KG', 'KGZ', 417, 'KG', '{\"ar\": \"قرغيزستان\"}', 'Bishkek', 198500, 5508626, 'AS', '.kg', 'KGS', '996', '######', '^(d{6})$', 'ky,uz,ru', 'CN,TJ,UZ,KZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(117, 'KH', 'KHM', 116, 'CB', '{\"ar\": \"كمبوديا\"}', 'Phnom Penh', 181040, 14453680, 'AS', '.kh', 'KHR', '855', '#####', '^(d{5})$', 'km,fr,en', 'LA,TH,VN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(118, 'KI', 'KIR', 296, 'KR', '{\"ar\": \"كيريباتي\"}', 'Tarawa', 811, 92533, 'OC', '.ki', 'AUD', '686', '', '', 'en-KI,gil', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(119, 'KM', 'COM', 174, 'CN', '{\"ar\": \"جزر القمر\"}', 'Moroni', 2170, 773407, 'AF', '.km', 'KMF', '269', '', '', 'ar,fr-KM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(120, 'KN', 'KNA', 659, 'SC', '{\"ar\": \"سانت كيتس ونيفيس\"}', 'Basseterre', 261, 51134, 'NA', '.kn', 'XCD', '+1-869', '', '', 'en-KN', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(121, 'KP', 'PRK', 408, 'KN', '{\"ar\": \"كوريا الشمالية\"}', 'Pyongyang', 120540, 22912177, 'AS', '.kp', 'KPW', '850', '###-###', '^(d{6})$', 'ko-KP', 'CN,KR,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(122, 'KR', 'KOR', 410, 'KS', '{\"ar\": \"كوريا الجنوبية\"}', 'Seoul', 98480, 48422644, 'AS', '.kr', 'KRW', '82', 'SEOUL ###-###', '^(?:SEOUL)*(d{6})$', 'ko-KR,en', 'KP', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(123, 'KW', 'KWT', 414, 'KU', '{\"ar\": \"الكويت\"}', 'Kuwait City', 17820, 2789132, 'AS', '.kw', 'KWD', '965', '#####', '^(d{5})$', 'ar-KW,en', 'SA,IQ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(124, 'KY', 'CYM', 136, 'CJ', '{\"ar\": \"جزر الكايمن\"}', 'George Town', 262, 44270, 'NA', '.ky', 'KYD', '+1-345', '', '', 'en-KY', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(125, 'KZ', 'KAZ', 398, 'KZ', '{\"ar\": \"كازاخستان\"}', 'Astana', 2717300, 15340000, 'AS', '.kz', 'KZT', '7', '######', '^(d{6})$', 'kk,ru', 'TM,CN,KG,UZ,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(126, 'LA', 'LAO', 418, 'LA', '{\"ar\": \"لاوس\"}', 'Vientiane', 236800, 6368162, 'AS', '.la', 'LAK', '856', '#####', '^(d{5})$', 'lo,fr,en', 'CN,MM,KH,TH,VN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(127, 'LB', 'LBN', 422, 'LE', '{\"ar\": \"لبنان\"}', 'Beirut', 10400, 4125247, 'AS', '.lb', 'LBP', '961', '#### ####|####', '^(d{4}(d{4})?)$', 'ar-LB,fr-LB,en,hy', 'SY,IL', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(128, 'LC', 'LCA', 662, 'ST', '{\"ar\": \"سانت لوسيا\"}', 'Castries', 616, 160922, 'NA', '.lc', 'XCD', '+1-758', '', '', 'en-LC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(129, 'LI', 'LIE', 438, 'LS', '{\"ar\": \"ليختنشتاين\"}', 'Vaduz', 160, 35000, 'EU', '.li', 'CHF', '423', '####', '^(d{4})$', 'de-LI', 'CH,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(130, 'LK', 'LKA', 144, 'CE', '{\"ar\": \"سريلانكا\"}', 'Colombo', 65610, 21513990, 'AS', '.lk', 'LKR', '94', '#####', '^(d{5})$', 'si,ta,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(131, 'LR', 'LBR', 430, 'LI', '{\"ar\": \"ليبيريا\"}', 'Monrovia', 111370, 3685076, 'AF', '.lr', 'LRD', '231', '####', '^(d{4})$', 'en-LR', 'SL,CI,GN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(132, 'LS', 'LSO', 426, 'LT', '{\"ar\": \"ليسوتو\"}', 'Maseru', 30355, 1919552, 'AF', '.ls', 'LSL', '266', '###', '^(d{3})$', 'en-LS,st,zu,xh', 'ZA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(133, 'LT', 'LTU', 440, 'LH', '{\"ar\": \"ليتوانيا\"}', 'Vilnius', 65200, 2944459, 'EU', '.lt', 'EUR', '370', 'LT-#####', '^(?:LT)*(d{5})$', 'lt,ru,pl', 'PL,BY,RU,LV', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(134, 'LU', 'LUX', 442, 'LU', '{\"ar\": \"لوكسمبورغ\"}', 'Luxembourg', 2586, 497538, 'EU', '.lu', 'EUR', '352', 'L-####', '^(d{4})$', 'lb,de-LU,fr-LU', 'DE,BE,FR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(135, 'LV', 'LVA', 428, 'LG', '{\"ar\": \"لاتفيا\"}', 'Riga', 64589, 2217969, 'EU', '.lv', 'EUR', '371', 'LV-####', '^(?:LV)*(d{4})$', 'lv,ru,lt', 'LT,EE,BY,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(136, 'LY', 'LBY', 434, 'LY', '{\"ar\": \"ليبيا\"}', 'Tripolis', 1759540, 6461454, 'AF', '.ly', 'LYD', '218', '', '', 'ar-LY,it,en', 'TD,NE,DZ,SD,TN,EG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(137, 'MA', 'MAR', 504, 'MO', '{\"ar\": \"المغرب\"}', 'Rabat', 446550, 31627428, 'AF', '.ma', 'MAD', '212', '#####', '^(d{5})$', 'ar-MA,fr', 'DZ,EH,ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(138, 'MC', 'MCO', 492, 'MN', '{\"ar\": \"موناكو\"}', 'Monaco', 2, 32965, 'EU', '.mc', 'EUR', '377', '#####', '^(d{5})$', 'fr-MC,en,it', 'FR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(139, 'MD', 'MDA', 498, 'MD', '{\"ar\": \"مولدافيا\"}', 'Chisinau', 33843, 4324000, 'EU', '.md', 'MDL', '373', 'MD-####', '^(?:MD)*(d{4})$', 'ro,ru,gag,tr', 'RO,UA', '', 'UTC', NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-06-30 13:53:17'),
(140, 'ME', 'MNE', 499, 'MJ', '{\"ar\": \"الجبل الأسود\"}', 'Podgorica', 14026, 666730, 'EU', '.me', 'EUR', '382', '#####', '^(d{5})$', 'sr,hu,bs,sq,hr,rom', 'AL,HR,BA,RS,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(141, 'MF', 'MAF', 663, 'RN', '{\"ar\": \"سانت مارتين\"}', 'Marigot', 53, 35925, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', 'SX', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(142, 'MG', 'MDG', 450, 'MA', '{\"ar\": \"مدغشقر\"}', 'Antananarivo', 587040, 21281844, 'AF', '.mg', 'MGA', '261', '###', '^(d{3})$', 'fr-MG,mg', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(143, 'MH', 'MHL', 584, 'RM', '{\"ar\": \"جزر المارشال\"}', 'Majuro', 181, 65859, 'OC', '.mh', 'USD', '692', '', '', 'mh,en-MH', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(144, 'MK', 'MKD', 807, 'MK', '{\"ar\": \"مقدونيا\"}', 'Skopje', 25333, 2062294, 'EU', '.mk', 'MKD', '389', '####', '^(d{4})$', 'mk,sq,tr,rmm,sr', 'AL,GR,BG,RS,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(145, 'ML', 'MLI', 466, 'ML', '{\"ar\": \"مالي\"}', 'Bamako', 1240000, 13796354, 'AF', '.ml', 'XOF', '223', '', '', 'fr-ML,bm', 'SN,NE,DZ,CI,GN,MR,BF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(146, 'MM', 'MMR', 104, 'BM', '{\"ar\": \"ميانمار -بورما\"}', 'Nay Pyi Taw', 678500, 53414374, 'AS', '.mm', 'MMK', '95', '#####', '^(d{5})$', 'my', 'CN,LA,TH,BD,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(147, 'MN', 'MNG', 496, 'MG', '{\"ar\": \"منغوليا\"}', 'Ulan Bator', 1565000, 3086918, 'AS', '.mn', 'MNT', '976', '######', '^(d{6})$', 'mn,ru', 'CN,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(148, 'MO', 'MAC', 446, 'MC', '{\"ar\": \"مكاو الصينية [منطقة إدارية خاصة]\"}', 'Macao', 254, 449198, 'AS', '.mo', 'MOP', '853', '', '', 'zh,zh-MO,pt', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(149, 'MP', 'MNP', 580, 'CQ', '{\"ar\": \"جزر ماريانا الشمالية\"}', 'Saipan', 477, 53883, 'OC', '.mp', 'USD', '+1-670', '', '', 'fil,tl,zh,ch-MP,en-MP', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(150, 'MQ', 'MTQ', 474, 'MB', '{\"ar\": \"مارتينيك\"}', 'Fort-de-France', 1100, 432900, 'NA', '.mq', 'EUR', '596', '#####', '^(d{5})$', 'fr-MQ', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(151, 'MR', 'MRT', 478, 'MR', '{\"ar\": \"موريتانيا\"}', 'Nouakchott', 1030700, 3205060, 'AF', '.mr', 'MRO', '222', '', '', 'ar-MR,fuc,snk,fr,mey,wo', 'SN,DZ,EH,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(152, 'MS', 'MSR', 500, 'MH', '{\"ar\": \"مونتسرات\"}', 'Plymouth', 102, 9341, 'NA', '.ms', 'XCD', '+1-664', '', '', 'en-MS', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(153, 'MT', 'MLT', 470, 'MT', '{\"ar\": \"مالطا\"}', 'Valletta', 316, 403000, 'EU', '.mt', 'EUR', '356', '@@@ ###|@@@ ##', '^([A-Z]{3}d{2}d?)$', 'mt,en-MT', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(154, 'MU', 'MUS', 480, 'MP', '{\"ar\": \"موريشيوس\"}', 'Port Louis', 2040, 1294104, 'AF', '.mu', 'MUR', '230', '', '', 'en-MU,bho,fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(155, 'MV', 'MDV', 462, 'MV', '{\"ar\": \"جزر المالديف\"}', 'Male', 300, 395650, 'AS', '.mv', 'MVR', '960', '#####', '^(d{5})$', 'dv,en', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(156, 'MW', 'MWI', 454, 'MI', '{\"ar\": \"ملاوي\"}', 'Lilongwe', 118480, 15447500, 'AF', '.mw', 'MWK', '265', '', '', 'ny,yao,tum,swk', 'TZ,MZ,ZM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(157, 'MX', 'MEX', 484, 'MX', '{\"ar\": \"المكسيك\"}', 'Mexico City', 1972550, 112468855, 'NA', '.mx', 'MXN', '52', '#####', '^(d{5})$', 'es-MX', 'GT,US,BZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(158, 'MY', 'MYS', 458, 'MY', '{\"ar\": \"ماليزيا\"}', 'Kuala Lumpur', 329750, 28274729, 'AS', '.my', 'MYR', '60', '#####', '^(d{5})$', 'ms-MY,en,zh,ta,te,ml,pa,th', 'BN,TH,ID', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(159, 'MZ', 'MOZ', 508, 'MZ', '{\"ar\": \"موزمبيق\"}', 'Maputo', 801590, 22061451, 'AF', '.mz', 'MZN', '258', '####', '^(d{4})$', 'pt-MZ,vmw', 'ZW,TZ,SZ,ZA,ZM,MW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(160, 'NA', 'NAM', 516, 'WA', '{\"ar\": \"ناميبيا\"}', 'Windhoek', 825418, 2128471, 'AF', '.na', 'NAD', '264', '', '', 'en-NA,af,de,hz,naq', 'ZA,BW,ZM,AO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(161, 'NC', 'NCL', 540, 'NC', '{\"ar\": \"كاليدونيا الجديدة\"}', 'Noumea', 19060, 216494, 'OC', '.nc', 'XPF', '687', '#####', '^(d{5})$', 'fr-NC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(162, 'NE', 'NER', 562, 'NG', '{\"ar\": \"النيجر\"}', 'Niamey', 1267000, 15878271, 'AF', '.ne', 'XOF', '227', '####', '^(d{4})$', 'fr-NE,ha,kr,dje', 'TD,BJ,DZ,LY,BF,NG,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(163, 'NF', 'NFK', 574, 'NF', '{\"ar\": \"جزيرة نورفوك\"}', 'Kingston', 35, 1828, 'OC', '.nf', 'AUD', '672', '####', '^(d{4})$', 'en-NF', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(164, 'NG', 'NGA', 566, 'NI', '{\"ar\": \"نيجيريا\"}', 'Abuja', 923768, 154000000, 'AF', '.ng', 'NGN', '234', '######', '^(d{6})$', 'en-NG,ha,yo,ig,ff', 'TD,NE,BJ,CM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(165, 'NI', 'NIC', 558, 'NU', '{\"ar\": \"نيكاراغوا\"}', 'Managua', 129494, 5995928, 'NA', '.ni', 'NIO', '505', '###-###-#', '^(d{7})$', 'es-NI,en', 'CR,HN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(166, 'NL', 'NLD', 528, 'NL', '{\"ar\": \"هولندا\"}', 'Amsterdam', 41526, 16645000, 'EU', '.nl', 'EUR', '31', '#### @@', '^(d{4}[A-Z]{2})$', 'nl-NL,fy-NL', 'DE,BE', '', 'UTC', NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-06-21 08:42:46'),
(167, 'NO', 'NOR', 578, 'NO', '{\"ar\": \"النرويج\"}', 'Oslo', 324220, 5009150, 'EU', '.no', 'NOK', '47', '####', '^(d{4})$', 'no,nb,nn,se,fi', 'FI,RU,SE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(168, 'NP', 'NPL', 524, 'NP', '{\"ar\": \"نيبال\"}', 'Kathmandu', 140800, 28951852, 'AS', '.np', 'NPR', '977', '#####', '^(d{5})$', 'ne,en', 'CN,IN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(169, 'NR', 'NRU', 520, 'NR', '{\"ar\": \"ناورو\"}', 'Yaren', 21, 10065, 'OC', '.nr', 'AUD', '674', '', '', 'na,en-NR', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(170, 'NU', 'NIU', 570, 'NE', '{\"ar\": \"نيوي\"}', 'Alofi', 260, 2166, 'OC', '.nu', 'NZD', '683', '', '', 'niu,en-NU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(171, 'NZ', 'NZL', 554, 'NZ', '{\"ar\": \"نيوزيلاندا\"}', 'Wellington', 268680, 4252277, 'OC', '.nz', 'NZD', '64', '####', '^(d{4})$', 'en-NZ,mi', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(172, 'OM', 'OMN', 512, 'MU', '{\"ar\": \"عُمان\"}', 'Muscat', 212460, 2967717, 'AS', '.om', 'OMR', '968', '###', '^(d{3})$', 'ar-OM,en,bal,ur', 'SA,YE,AE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(173, 'PA', 'PAN', 591, 'PM', '{\"ar\": \"بنما\"}', 'Panama City', 78200, 3410676, 'NA', '.pa', 'PAB', '507', '', '', 'es-PA,en', 'CR,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(174, 'PE', 'PER', 604, 'PE', '{\"ar\": \"بيرو\"}', 'Lima', 1285220, 29907003, 'SA', '.pe', 'PEN', '51', '', '', 'es-PE,qu,ay', 'EC,CL,BO,BR,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(175, 'PF', 'PYF', 258, 'FP', '{\"ar\": \"بولينيزيا الفرنسية\"}', 'Papeete', 4167, 270485, 'OC', '.pf', 'XPF', '689', '#####', '^((97|98)7d{2})$', 'fr-PF,ty', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(176, 'PG', 'PNG', 598, 'PP', '{\"ar\": \"بابوا غينيا الجديدة\"}', 'Port Moresby', 462840, 6064515, 'OC', '.pg', 'PGK', '675', '###', '^(d{3})$', 'en-PG,ho,meu,tpi', 'ID', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(177, 'PH', 'PHL', 608, 'RP', '{\"ar\": \"الفيلبين\"}', 'Manila', 300000, 99900177, 'AS', '.ph', 'PHP', '63', '####', '^(d{4})$', 'tl,en-PH,fil', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(178, 'PK', 'PAK', 586, 'PK', '{\"ar\": \"باكستان\"}', 'Islamabad', 803940, 184404791, 'AS', '.pk', 'PKR', '92', '#####', '^(d{5})$', 'ur-PK,en-PK,pa,sd,ps,brh', 'CN,AF,IR,IN', '', 'UTC', NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-18 21:03:50'),
(179, 'PL', 'POL', 616, 'PL', '{\"ar\": \"بولندا\"}', 'Warsaw', 312685, 38500000, 'EU', '.pl', 'PLN', '48', '##-###', '^(d{5})$', 'pl', 'DE,LT,SK,CZ,BY,UA,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(180, 'PM', 'SPM', 666, 'SB', '{\"ar\": \"سانت بيير وميكولون\"}', 'Saint-Pierre', 242, 7012, 'NA', '.pm', 'EUR', '508', '#####', '^(97500)$', 'fr-PM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(181, 'PN', 'PCN', 612, 'PC', '{\"ar\": \"جزر بيتكيرن\"}', 'Adamstown', 47, 46, 'OC', '.pn', 'NZD', '870', '', '', 'en-PN', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(182, 'PR', 'PRI', 630, 'RQ', '{\"ar\": \"بورتوريكو\"}', 'San Juan', 9104, 3916632, 'NA', '.pr', 'USD', '+1-787/1-939', '#####-####', '^(d{9})$', 'en-PR,es-PR', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(183, 'PS', 'PSE', 275, 'WE', '{\"ar\": \"فلسطين\"}', 'East Jerusalem', 5970, 3800000, 'AS', '.ps', 'ILS', '970', '', '', 'ar-PS', 'JO,IL,EG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(184, 'PT', 'PRT', 620, 'PO', '{\"ar\": \"البرتغال\"}', 'Lisbon', 92391, 10676000, 'EU', '.pt', 'EUR', '351', '####-###', '^(d{7})$', 'pt-PT,mwl', 'ES', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(185, 'PW', 'PLW', 585, 'PS', '{\"ar\": \"بالاو\"}', 'Melekeok', 458, 19907, 'OC', '.pw', 'USD', '680', '96940', '^(96940)$', 'pau,sov,en-PW,tox,ja,fil,zh', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(186, 'PY', 'PRY', 600, 'PA', '{\"ar\": \"باراغواي\"}', 'Asuncion', 406750, 6375830, 'SA', '.py', 'PYG', '595', '####', '^(d{4})$', 'es-PY,gn', 'BO,BR,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(187, 'QA', 'QAT', 634, 'QA', '{\"ar\": \"قطر\"}', 'Doha', 11437, 840926, 'AS', '.qa', 'QAR', '974', '', '', 'ar-QA,en', 'SA', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(188, 'RE', 'REU', 638, 'RE', '{\"ar\": \"روينيون\"}', 'Saint-Denis', 2517, 776948, 'AF', '.re', 'EUR', '262', '#####', '^((97|98)(4|7|8)d{2})$', 'fr-RE', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(189, 'RO', 'ROU', 642, 'RO', '{\"ar\": \"رومانيا\"}', 'Bucharest', 237500, 21959278, 'EU', '.ro', 'RON', '40', '######', '^(d{6})$', 'ro,hu,rom', 'MD,HU,UA,BG,RS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(190, 'RS', 'SRB', 688, 'RI', '{\"ar\": \"صربيا\"}', 'Belgrade', 88361, 7344847, 'EU', '.rs', 'RSD', '381', '######', '^(d{6})$', 'sr,hu,bs,rom', 'AL,HU,MK,RO,HR,BA,BG,ME,XK', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(191, 'RU', 'RUS', 643, 'RS', '{\"ar\": \"روسيا\"}', 'Moscow', 17100000, 140702000, 'EU', '.ru', 'RUB', '7', '######', '^(d{6})$', 'ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv', 'GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP', '', 'UTC', NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-05-06 19:38:11'),
(192, 'RW', 'RWA', 646, 'RW', '{\"ar\": \"رواندا\"}', 'Kigali', 26338, 11055976, 'AF', '.rw', 'RWF', '250', '', '', 'rw,en-RW,fr-RW,sw', 'TZ,CD,BI,UG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(193, 'SA', 'SAU', 682, 'SA', '{\"ar\": \"المملكة العربية السعودية\"}', 'Riyadh', 1960582, 25731776, 'AS', '.sa', 'SAR', '966', '#####', '^(d{5})$', 'ar-SA', 'QA,OM,IQ,YE,JO,AE,KW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(194, 'SB', 'SLB', 90, 'BP', '{\"ar\": \"جزر سليمان\"}', 'Honiara', 28450, 559198, 'OC', '.sb', 'SBD', '677', '', '', 'en-SB,tpi', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(195, 'SC', 'SYC', 690, 'SE', '{\"ar\": \"سيشل\"}', 'Victoria', 455, 88340, 'AF', '.sc', 'SCR', '248', '', '', 'en-SC,fr-SC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(196, 'SD', 'SDN', 729, 'SU', '{\"ar\": \"السودان\"}', 'Khartoum', 1861484, 35000000, 'AF', '.sd', 'SDG', '249', '#####', '^(d{5})$', 'ar-SD,en,fia', 'SS,TD,EG,ET,ER,LY,CF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(197, 'SE', 'SWE', 752, 'SW', '{\"ar\": \"السويد\"}', 'Stockholm', 449964, 9555893, 'EU', '.se', 'SEK', '46', '### ##', '^(?:SE)*(d{5})$', 'sv-SE,se,sma,fi-SE', 'NO,FI', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(198, 'SG', 'SGP', 702, 'SN', '{\"ar\": \"سنغافورة\"}', 'Singapur', 693, 4701069, 'AS', '.sg', 'SGD', '65', '######', '^(d{6})$', 'cmn,en-SG,ms-SG,ta-SG,zh-SG', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(199, 'SH', 'SHN', 654, 'SH', '{\"ar\": \"سانت هيلنا\"}', 'Jamestown', 410, 7460, 'AF', '.sh', 'SHP', '290', 'STHL 1ZZ', '^(STHL1ZZ)$', 'en-SH', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(200, 'SI', 'SVN', 705, 'SI', '{\"ar\": \"سلوفينيا\"}', 'Ljubljana', 20273, 2007000, 'EU', '.si', 'EUR', '386', '####', '^(?:SI)*(d{4})$', 'sl,sh', 'HU,IT,HR,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(201, 'SJ', 'SJM', 744, 'SV', '{\"ar\": \"سفالبارد وجان مايان\"}', 'Longyearbyen', 62049, 2550, 'EU', '.sj', 'NOK', '47', '', '', 'no,ru', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(202, 'SK', 'SVK', 703, 'LO', '{\"ar\": \"سلوفاكيا\"}', 'Bratislava', 48845, 5455000, 'EU', '.sk', 'EUR', '421', '### ##', '^(d{5})$', 'sk,hu', 'PL,HU,CZ,UA,AT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(203, 'SL', 'SLE', 694, 'SL', '{\"ar\": \"سيراليون\"}', 'Freetown', 71740, 5245695, 'AF', '.sl', 'SLL', '232', '', '', 'en-SL,men,tem', 'LR,GN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(204, 'SM', 'SMR', 674, 'SM', '{\"ar\": \"سان مارينو\"}', 'San Marino', 61, 31477, 'EU', '.sm', 'EUR', '378', '4789#', '^(4789d)$', 'it-SM', 'IT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(205, 'SN', 'SEN', 686, 'SG', '{\"ar\": \"السنغال\"}', 'Dakar', 196190, 12323252, 'AF', '.sn', 'XOF', '221', '#####', '^(d{5})$', 'fr-SN,wo,fuc,mnk', 'GN,MR,GW,GM,ML', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(206, 'SO', 'SOM', 706, 'SO', '{\"ar\": \"الصومال\"}', 'Mogadishu', 637657, 10112453, 'AF', '.so', 'SOS', '252', '@@  #####', '^([A-Z]{2}d{5})$', 'so-SO,ar-SO,it,en-SO', 'ET,KE,DJ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(207, 'SR', 'SUR', 740, 'NS', '{\"ar\": \"سورينام\"}', 'Paramaribo', 163270, 492829, 'SA', '.sr', 'SRD', '597', '', '', 'nl-SR,en,srn,hns,jv', 'GY,BR,GF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(208, 'SS', 'SSD', 728, 'OD', '{\"ar\": \"جنوب السودان\"}', 'Juba', 644329, 8260490, 'AF', '', 'SSP', '211', '', '', 'en', 'CD,CF,ET,KE,SD,UG,', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(209, 'ST', 'STP', 678, 'TP', '{\"ar\": \"ساو تومي وبرينسيبي\"}', 'Sao Tome', 1001, 175808, 'AF', '.st', 'STD', '239', '', '', 'pt-ST', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(210, 'SV', 'SLV', 222, 'ES', '{\"ar\": \"السلفادور\"}', 'San Salvador', 21040, 6052064, 'NA', '.sv', 'USD', '503', 'CP ####', '^(?:CP)*(d{4})$', 'es-SV', 'GT,HN', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(211, 'SX', 'SXM', 534, 'NN', '{\"ar\": \"سانت مارتن\"}', 'Philipsburg', 21, 37429, 'NA', '.sx', 'ANG', '599', '', '', 'nl,en', 'MF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(212, 'SY', 'SYR', 760, 'SY', '{\"ar\": \"سوريا\"}', 'Damascus', 185180, 22198110, 'AS', '.sy', 'SYP', '963', '', '', 'ar-SY,ku,hy,arc,fr,en', 'IQ,JO,IL,TR,LB', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(213, 'SZ', 'SWZ', 748, 'WZ', '{\"ar\": \"سوازيلاند\"}', 'Mbabane', 17363, 1354051, 'AF', '.sz', 'SZL', '268', '@###', '^([A-Z]d{3})$', 'en-SZ,ss-SZ', 'ZA,MZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(214, 'TC', 'TCA', 796, 'TK', '{\"ar\": \"جزر الترك وجايكوس\"}', 'Cockburn Town', 430, 20556, 'NA', '.tc', 'USD', '+1-649', 'TKCA 1ZZ', '^(TKCA 1ZZ)$', 'en-TC', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(215, 'TD', 'TCD', 148, 'CD', '{\"ar\": \"تشاد\"}', 'N\'Djamena', 1284000, 10543464, 'AF', '.td', 'XAF', '235', '', '', 'fr-TD,ar-TD,sre', 'NE,LY,CF,SD,CM,NG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(216, 'TF', 'ATF', 260, 'FS', '{\"ar\": \"المقاطعات الجنوبية الفرنسية\"}', 'Port-aux-Francais', 7829, 140, 'AN', '.tf', 'EUR', '', '', '', 'fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(217, 'TG', 'TGO', 768, 'TO', '{\"ar\": \"توجو\"}', 'Lome', 56785, 6587239, 'AF', '.tg', 'XOF', '228', '', '', 'fr-TG,ee,hna,kbp,dag,ha', 'BJ,GH,BF', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(218, 'TH', 'THA', 764, 'TH', '{\"ar\": \"تايلند\"}', 'Bangkok', 514000, 67089500, 'AS', '.th', 'THB', '66', '#####', '^(d{5})$', 'th,en', 'LA,MM,KH,MY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(219, 'TJ', 'TJK', 762, 'TI', '{\"ar\": \"طاجكستان\"}', 'Dushanbe', 143100, 7487489, 'AS', '.tj', 'TJS', '992', '######', '^(d{6})$', 'tg,ru', 'CN,AF,KG,UZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(220, 'TK', 'TKL', 772, 'TL', '{\"ar\": \"توكيلو\"}', '', 10, 1466, 'OC', '.tk', 'NZD', '690', '', '', 'tkl,en-TK', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(221, 'TL', 'TLS', 626, 'TT', '{\"ar\": \"تيمور الشرقية\"}', 'Dili', 15007, 1154625, 'OC', '.tl', 'USD', '670', '', '', 'tet,pt-TL,id,en', 'ID', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(222, 'TM', 'TKM', 795, 'TX', '{\"ar\": \"تركمانستان\"}', 'Ashgabat', 488100, 4940916, 'AS', '.tm', 'TMT', '993', '######', '^(d{6})$', 'tk,ru,uz', 'AF,IR,UZ,KZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(223, 'TN', 'TUN', 788, 'TS', '{\"ar\": \"تونس\"}', 'Tunis', 163610, 10589025, 'AF', '.tn', 'TND', '216', '####', '^(d{4})$', 'ar-TN,fr', 'DZ,LY', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(224, 'TO', 'TON', 776, 'TN', '{\"ar\": \"تونغا\"}', 'Nuku\'alofa', 748, 122580, 'OC', '.to', 'TOP', '676', '', '', 'to,en-TO', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(225, 'TR', 'TUR', 792, 'TU', '{\"ar\": \"تركيا\"}', 'Ankara', 780580, 77804122, 'AS', '.tr', 'TRY', '90', '#####', '^(d{5})$', 'tr-TR,ku,diq,az,av', 'SY,GE,IQ,IR,GR,AM,AZ,BG', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(226, 'TT', 'TTO', 780, 'TD', '{\"ar\": \"ترينيداد وتوباغو\"}', 'Port of Spain', 5128, 1228691, 'NA', '.tt', 'TTD', '+1-868', '', '', 'en-TT,hns,fr,es,zh', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(227, 'TV', 'TUV', 798, 'TV', '{\"ar\": \"توفالو\"}', 'Funafuti', 26, 10472, 'OC', '.tv', 'AUD', '688', '', '', 'tvl,en,sm,gil', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(228, 'TW', 'TWN', 158, 'TW', '{\"ar\": \"تايوان\"}', 'Taipei', 35980, 22894384, 'AS', '.tw', 'TWD', '886', '#####', '^(d{5})$', 'zh-TW,zh,nan,hak', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(229, 'TZ', 'TZA', 834, 'TZ', '{\"ar\": \"تانزانيا\"}', 'Dodoma', 945087, 41892895, 'AF', '.tz', 'TZS', '255', '', '', 'sw-TZ,en,ar', 'MZ,KE,CD,RW,ZM,BI,UG,MW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(230, 'UA', 'UKR', 804, 'UP', '{\"ar\": \"أوكرانيا\"}', 'Kiev', 603700, 45415596, 'EU', '.ua', 'UAH', '380', '#####', '^(d{5})$', 'uk,ru-UA,rom,pl,hu', 'PL,MD,HU,SK,BY,RO,RU', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(231, 'UG', 'UGA', 800, 'UG', '{\"ar\": \"أوغندا\"}', 'Kampala', 236040, 33398682, 'AF', '.ug', 'UGX', '256', '', '', 'en-UG,lg,sw,ar', 'TZ,KE,SS,CD,RW', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(232, 'UK', 'GBR', 826, 'UK', '{\"ar\": \"المملكة المتحدة\"}', 'London', 244820, 62348447, 'EU', '.uk', 'GBP', '44', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en-GB,cy-GB,gd', 'IE', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(233, 'UM', 'UMI', 581, '', '{\"ar\": \"جزر الولايات المتحدة البعيدة الصغيرة\"}', '', 0, 0, 'OC', '.um', 'USD', '1', '', '', 'en-UM', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(234, 'US', 'USA', 840, 'US', '{\"ar\": \"الولايات المتحدة الأمريكية\"}', 'Washington', 9629091, 310232863, 'NA', '.us', 'USD', '1', '#####-####', '^d{5}(-d{4})?$', 'en-US,es-US,haw,fr', 'CA,MX,CU', '', 'UTC', NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-06-09 13:07:31'),
(235, 'UY', 'URY', 858, 'UY', '{\"ar\": \"أورغواي\"}', 'Montevideo', 176220, 3477000, 'SA', '.uy', 'UYU', '598', '#####', '^(d{5})$', 'es-UY', 'BR,AR', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(236, 'UZ', 'UZB', 860, 'UZ', '{\"ar\": \"أوزبكستان\"}', 'Tashkent', 447400, 27865738, 'AS', '.uz', 'UZS', '998', '######', '^(d{6})$', 'uz,ru,tg', 'TM,AF,KG,TJ,KZ', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(237, 'VA', 'VAT', 336, 'VT', '{\"ar\": \"الفاتيكان\"}', 'Vatican City', 0, 921, 'EU', '.va', 'EUR', '379', '#####', '^(d{5})$', 'la,it,fr', 'IT', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(238, 'VC', 'VCT', 670, 'VC', '{\"ar\": \"سانت فنسنت وغرنادين\"}', 'Kingstown', 389, 104217, 'NA', '.vc', 'XCD', '+1-784', '', '', 'en-VC,fr', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(239, 'VE', 'VEN', 862, 'VE', '{\"ar\": \"فنزويلا\"}', 'Caracas', 912050, 27223228, 'SA', '.ve', 'VEF', '58', '####', '^(d{4})$', 'es-VE', 'GY,BR,CO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(240, 'VG', 'VGB', 92, 'VI', '{\"ar\": \"جزر فرجين البريطانية\"}', 'Road Town', 153, 21730, 'NA', '.vg', 'USD', '+1-284', '', '', 'en-VG', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(241, 'VI', 'VIR', 850, 'VQ', '{\"ar\": \"جزر فرجين الأمريكية\"}', 'Charlotte Amalie', 352, 108708, 'NA', '.vi', 'USD', '+1-340', '#####-####', '^d{5}(-d{4})?$', 'en-VI', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(242, 'VN', 'VNM', 704, 'VM', '{\"ar\": \"فيتنام\"}', 'Hanoi', 329560, 89571130, 'AS', '.vn', 'VND', '84', '######', '^(d{6})$', 'vi,en,fr,zh,km', 'CN,LA,KH', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(243, 'VU', 'VUT', 548, 'NH', '{\"ar\": \"فانواتو\"}', 'Port Vila', 12200, 221552, 'OC', '.vu', 'VUV', '678', '', '', 'bi,en-VU,fr-VU', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(244, 'WF', 'WLF', 876, 'WF', '{\"ar\": \"جزر والس وفوتونا\"}', 'Mata Utu', 274, 16025, 'OC', '.wf', 'XPF', '681', '#####', '^(986d{2})$', 'wls,fud,fr-WF', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(245, 'WS', 'WSM', 882, 'WS', '{\"ar\": \"ساموا\"}', 'Apia', 2944, 192001, 'OC', '.ws', 'WST', '685', '', '', 'sm,en-WS', '', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(246, 'XK', 'XKX', 0, 'KV', '{\"ar\": \"Kosovo\"}', 'Pristina', 10908, 1800000, 'EU', '', 'EUR', '', '', '', 'sq,sr', 'RS,AL,MK,ME', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(247, 'YE', 'YEM', 887, 'YM', '{\"ar\": \"اليمن\"}', 'صنعاء', 527970, 23495361, 'AS', '.ye', 'YER', '967', '', '', 'ar-YE', 'SA,OM', '', 'Asia/Aden', NULL, NULL, 'app/logohttps://lara.doorianclothing.net', '0', 0, 1, '2021-04-03 08:39:39', '2021-04-28 20:13:24'),
(248, 'YT', 'MYT', 175, 'MF', '{\"ar\": \"مايوت\"}', 'Mamoudzou', 374, 159042, 'AF', '.yt', 'EUR', '262', '#####', '^(d{5})$', 'fr-YT', '', '', 'Indian/Mayotte', NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-28 20:09:50'),
(249, 'ZA', 'ZAF', 710, 'SF', '{\"ar\": \"جنوب أفريقيا\"}', 'Pretoria', 1219912, 49000000, 'AF', '.za', 'ZAR', '27', '####', '^(d{4})$', 'zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr', 'ZW,SZ,MZ,BW,NA,LS', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(250, 'ZM', 'ZMB', 894, 'ZA', '{\"ar\": \"زامبيا\"}', 'Lusaka', 752614, 13460305, 'AF', '.zm', 'ZMW', '260', '#####', '^(d{5})$', 'en-ZM,bem,loz,lun,lue,ny,toi', 'ZW,TZ,MZ,CD,NA,MW,AO', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39'),
(251, 'ZW', 'ZWE', 716, 'ZI', '{\"ar\": \"زيمبابوي\"}', 'Harare', 390580, 11651858, 'AF', '.zw', 'ZWL', '263', '', '', 'en-ZW,sn,nr,nd', 'ZA,MZ,BW,ZM', '', NULL, NULL, NULL, NULL, '0', 0, 0, '2021-04-03 08:39:39', '2021-04-03 08:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `html_entities` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'HTML Entities of Symbols: https://gist.github.com/Gibbs/3920259',
  `in_left` tinyint(1) UNSIGNED DEFAULT 0,
  `decimal_places` int(10) UNSIGNED DEFAULT 0 COMMENT 'Currency Decimal Places - ISO 4217',
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '.',
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT ',',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `html_entities`, `in_left`, `decimal_places`, `decimal_separator`, `thousand_separator`, `created_at`, `updated_at`) VALUES
(1, 'AED', 'United Arab Emirates Dirham', 'د.إ', '&#1583;.&#1573;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(2, 'AFN', 'Afghanistan Afghani', '؋', '&#65;&#102;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(3, 'ALL', 'Albania Lek', 'Lek', '&#76;&#101;&#107;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(4, 'AMD', 'Armenia Dram', NULL, '', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(5, 'ANG', 'Netherlands Antilles Guilder', 'ƒ', '&#402;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(6, 'AOA', 'Angola Kwanza', 'Kz', '&#75;&#122;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(7, 'ARS', 'Argentina Peso', '$', '&#36;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(8, 'AUD', 'Australia Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(9, 'AWG', 'Aruba Guilder', 'ƒ', '&#402;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(10, 'AZN', 'Azerbaijan New Manat', 'ман', '&#1084;&#1072;&#1085;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(11, 'BAM', 'Bosnia and Herzegovina Convertible Marka', 'KM', '&#75;&#77;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(12, 'BBD', 'Barbados Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(13, 'BDT', 'Bangladesh Taka', '৳', '&#2547;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(14, 'BGN', 'Bulgaria Lev', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(15, 'BHD', 'Bahrain Dinar', NULL, '.&#1583;.&#1576;', 0, 3, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(16, 'BIF', 'Burundi Franc', 'FBu', '&#70;&#66;&#117;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(17, 'BMD', 'Bermuda Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(18, 'BND', 'Brunei Darussalam Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(19, 'BOB', 'Bolivia Boliviano', '$b', '&#36;&#98;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(20, 'BRL', 'Brazil Real', 'R$', '&#82;&#36;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(21, 'BSD', 'Bahamas Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(22, 'BTN', 'Bhutan Ngultrum', NULL, '&#78;&#117;&#46;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(23, 'BWP', 'Botswana Pula', 'P', '&#80;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(24, 'BYR', 'Belarus Ruble', 'p.', '&#112;&#46;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(25, 'BZD', 'Belize Dollar', 'BZ$', '&#66;&#90;&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(26, 'CAD', 'Canada Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(27, 'CDF', 'Congo/Kinshasa Franc', 'Fr', '&#70;&#67;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(28, 'CHF', 'Switzerland Franc', 'Fr', '&#67;&#72;&#70;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(29, 'CLP', 'Chile Peso', '$', '&#36;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(30, 'CNY', 'China Yuan Renminbi', '¥', '&#165;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(31, 'COP', 'Colombia Peso', '$', '&#36;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(32, 'CRC', 'Costa Rica Colon', '₡', '&#8353;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(33, 'CUC', 'Cuba Convertible Peso', NULL, NULL, 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(34, 'CUP', 'Cuba Peso', '₱', '&#8396;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(35, 'CVE', 'Cape Verde Escudo', '$', '&#x24;', 1, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(36, 'CZK', 'Czech Republic Koruna', 'Kč', '&#75;&#269;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(37, 'DJF', 'Djibouti Franc', 'Fr', '&#70;&#100;&#106;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(38, 'DKK', 'Denmark Krone', 'kr', '&#107;&#114;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(39, 'DOP', 'Dominican Republic Peso', 'RD$', '&#82;&#68;&#36;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(40, 'DZD', 'Algeria Dinar', 'DA', '&#1583;&#1580;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(41, 'EEK', 'Estonia Kroon', 'kr', NULL, 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(42, 'EGP', 'Egypt Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(43, 'ERN', 'Eritrea Nakfa', 'Nfk', '&#x4E;&#x66;&#x6B;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(44, 'ETB', 'Ethiopia Birr', 'Br', '&#66;&#114;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(45, 'EUR', 'Euro Member Countries', '€', '€', 0, 2, ',', ' ', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(46, 'FJD', 'Fiji Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(47, 'FKP', 'Falkland Islands (Malvinas) Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(48, 'GBP', 'United Kingdom Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(49, 'GEL', 'Georgia Lari', NULL, '&#4314;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(50, 'GGP', 'Guernsey Pound', '£', NULL, 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(51, 'GHC', 'Ghana Cedi', 'GH¢', '&#x47;&#x48;&#xA2;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(52, 'GHS', 'Ghana Cedi', 'GH¢', '&#x47;&#x48;&#xA2;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(53, 'GIP', 'Gibraltar Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(54, 'GMD', 'Gambia Dalasi', 'D', '&#68;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(55, 'GNF', 'Guinea Franc', 'Fr', '&#70;&#71;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(56, 'GTQ', 'Guatemala Quetzal', 'Q', '&#81;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(57, 'GYD', 'Guyana Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(58, 'HKD', 'Hong Kong Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(59, 'HNL', 'Honduras Lempira', 'L', '&#76;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(60, 'HRK', 'Croatia Kuna', 'kn', '&#107;&#110;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(61, 'HTG', 'Haiti Gourde', NULL, '&#71;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(62, 'HUF', 'Hungary Forint', 'Ft', '&#70;&#116;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(63, 'IDR', 'Indonesia Rupiah', 'Rp', '&#82;&#112;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(64, 'ILS', 'Israel Shekel', '₪', '&#8362;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(65, 'IMP', 'Isle of Man Pound', '£', NULL, 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(66, 'INR', 'India Rupee', '₹', '&#8377;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(67, 'IQD', 'Iraq Dinar', 'د.ع;', '&#1593;.&#1583;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(68, 'IRR', 'Iran Rial', '﷼', '&#65020;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(69, 'ISK', 'Iceland Krona', 'kr', '&#107;&#114;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(70, 'JEP', 'Jersey Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(71, 'JMD', 'Jamaica Dollar', 'J$', '&#74;&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(72, 'JOD', 'Jordan Dinar', NULL, '&#74;&#68;', 0, 3, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(73, 'JPY', 'Japan Yen', '¥', '&#165;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(74, 'KES', 'Kenya Shilling', 'KSh', '&#x4B;&#x53;&#x68;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(75, 'KGS', 'Kyrgyzstan Som', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(76, 'KHR', 'Cambodia Riel', '៛', '&#6107;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(77, 'KMF', 'Comoros Franc', 'Fr', '&#67;&#70;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(78, 'KPW', 'Korea (North) Won', '₩', '&#8361;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(79, 'KRW', 'Korea (South) Won', '₩', '&#8361;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(80, 'KWD', 'Kuwait Dinar', 'د.ك', '&#1583;.&#1603;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(81, 'KYD', 'Cayman Islands Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(82, 'KZT', 'Kazakhstan Tenge', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(83, 'LAK', 'Laos Kip', '₭', '&#8365;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(84, 'LBP', 'Lebanon Pound', '£', '&#163;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(85, 'LKR', 'Sri Lanka Rupee', '₨', '&#8360;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(86, 'LRD', 'Liberia Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(87, 'LSL', 'Lesotho Loti', 'M', '&#76;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(88, 'LTL', 'Lithuania Litas', 'Lt', '&#76;&#116;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(89, 'LVL', 'Latvia Lat', 'Ls', '&#76;&#115;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(90, 'LYD', 'Libya Dinar', 'DL', '&#1604;.&#1583;', 0, 3, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(91, 'MAD', 'Morocco Dirham', 'Dhs', '&#1583;.&#1605;.', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(92, 'MDL', 'Moldova Leu', NULL, '&#76;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(93, 'MGA', 'Madagascar Ariary', 'Ar', '&#65;&#114;', 0, 5, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(94, 'MKD', 'Macedonia Denar', 'ден', '&#1076;&#1077;&#1085;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(95, 'MMK', 'Myanmar (Burma) Kyat', NULL, '&#75;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(96, 'MNT', 'Mongolia Tughrik', '₮', '&#8366;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(97, 'MOP', 'Macau Pataca', NULL, '&#77;&#79;&#80;&#36;', 0, 1, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(98, 'MRO', 'Mauritania Ouguiya', 'UM', '&#85;&#77;', 0, 5, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(99, 'MUR', 'Mauritius Rupee', '₨', '&#8360;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(100, 'MVR', 'Maldives (Maldive Islands) Rufiyaa', NULL, '.&#1923;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(101, 'MWK', 'Malawi Kwacha', 'MK', '&#77;&#75;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(102, 'MXN', 'Mexico Peso', '$', '&#36;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(103, 'MYR', 'Malaysia Ringgit', 'RM', '&#82;&#77;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(104, 'MZN', 'Mozambique Metical', 'MT', '&#77;&#84;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(105, 'NAD', 'Namibia Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(106, 'NGN', 'Nigeria Naira', '₦', '&#8358;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(107, 'NIO', 'Nicaragua Cordoba', 'C$', '&#67;&#36;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(108, 'NOK', 'Norway Krone', 'kr', '&#107;&#114;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(109, 'NPR', 'Nepal Rupee', '₨', '&#8360;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(110, 'NZD', 'New Zealand Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(111, 'OMR', 'Omani Rial', 'ر.ع.', '', 0, 3, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(112, 'PAB', 'Panama Balboa', 'B/.', '&#66;&#47;&#46;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(113, 'PEN', 'Peru Nuevo Sol', 'S/.', '&#83;&#47;&#46;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(114, 'PGK', 'Papua New Guinea Kina', NULL, '&#75;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(115, 'PHP', 'Philippines Peso', '₱', '&#8369;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(116, 'PKR', 'Pakistan Rupee', '₨', '&#8360;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(117, 'PLN', 'Poland Zloty', 'zł', '&#122;&#322;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(118, 'PYG', 'Paraguay Guarani', 'Gs', '&#71;&#115;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(119, 'QAR', 'Qatar Riyal', '﷼', '&#65020;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(120, 'RON', 'Romania New Leu', 'lei', '&#108;&#101;&#105;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(121, 'RSD', 'Serbia Dinar', 'Дин.', '&#1044;&#1080;&#1085;&#46;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(122, 'RUB', 'Russia Ruble', '₽', '&#8381;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(123, 'RWF', 'Rwanda Franc', 'FRw', '&#1585;.&#1587;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(124, 'SAR', 'Saudi Arabia Riyal', '﷼', '&#65020;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(125, 'SBD', 'Solomon Islands Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(126, 'SCR', 'Seychelles Rupee', '₨', '&#8360;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(127, 'SDG', 'Sudan Pound', 'DS', '&#163;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(128, 'SEK', 'Sweden Krona', 'kr', '&#107;&#114;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(129, 'SGD', 'Singapore Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(130, 'SHP', 'Saint Helena Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(131, 'SLL', 'Sierra Leone Leone', 'Le', '&#76;&#101;', 1, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(132, 'SOS', 'Somalia Shilling', 'S', '&#83;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(133, 'SPL', 'Seborga Luigino', NULL, NULL, 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(134, 'SRD', 'Suriname Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(135, 'SSP', 'South Sudanese Pound', '£', '&#xA3;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(136, 'STD', 'São Tomé and Príncipe Dobra', 'Db', '&#68;&#98;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(137, 'SVC', 'El Salvador Colon', '$', '&#36;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(138, 'SYP', 'Syria Pound', '£', '&#163;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(139, 'SZL', 'Swaziland Lilangeni', 'E', '&#76;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(140, 'THB', 'Thailand Baht', '฿', '&#3647;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(141, 'TJS', 'Tajikistan Somoni', NULL, '&#84;&#74;&#83;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(142, 'TMT', 'Turkmenistan Manat', NULL, '&#109;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(143, 'TND', 'Tunisia Dinar', 'DT', '&#1583;.&#1578;', 1, 3, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(144, 'TOP', 'Tonga Pa\'anga', NULL, '&#84;&#36;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(145, 'TRL', 'Turkey Lira', '₤', NULL, 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(146, 'TRY', 'Turkey Lira', '₺', '&#x20BA;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(147, 'TTD', 'Trinidad and Tobago Dollar', 'TT$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(148, 'TVD', 'Tuvalu Dollar', '$', NULL, 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(149, 'TWD', 'Taiwan New Dollar', 'NT$', '&#78;&#84;&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(150, 'TZS', 'Tanzania Shilling', 'TSh', '&#x54;&#x53;&#x68;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(151, 'UAH', 'Ukraine Hryvnia', '₴', '&#8372;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(152, 'UGX', 'Uganda Shilling', 'USh', '&#85;&#83;&#104;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(153, 'USD', 'United States Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(154, 'UYU', 'Uruguay Peso', '$U', '&#36;&#85;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(155, 'UZS', 'Uzbekistan Som', 'лв', '&#1083;&#1074;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(156, 'VEF', 'Venezuela Bolivar', 'Bs', '&#66;&#115;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(157, 'VND', 'Viet Nam Dong', '₫', '&#8363;', 1, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(158, 'VUV', 'Vanuatu Vatu', NULL, '&#86;&#84;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(159, 'WST', 'Samoa Tala', NULL, '&#87;&#83;&#36;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(160, 'XAF', 'Communauté Financière Africaine (BEAC) CFA Franc B', 'F', '&#70;&#67;&#70;&#65;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(161, 'XCD', 'East Caribbean Dollar', '$', '&#36;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(162, 'XDR', 'International Monetary Fund (IMF) Special Drawing ', NULL, '', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(163, 'XOF', 'Communauté Financière Africaine (BCEAO) Franc', 'F', '&#70;&#67;&#70;&#65;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(164, 'XPF', 'Comptoirs Français du Pacifique (CFP) Franc', 'F', '&#70;', 0, 0, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(165, 'YER', 'Yemen Rial', '﷼', '&#65020;', 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(166, 'ZAR', 'South Africa Rand', 'R', '&#82;', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(167, 'ZMW', 'Zambia Kwacha', 'ZK', NULL, 0, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(168, 'ZWD', 'Zimbabwe Dollar', 'Z$', NULL, 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(169, 'ZWL', 'Zimbabwe Dollar', 'Z$', NULL, 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38'),
(170, 'XBT', 'Bitcoin', '฿', '฿', 1, 2, '.', ',', '2021-04-03 08:39:38', '2021-04-03 08:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `belongs_to` enum('posts','users') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `max` int(10) UNSIGNED DEFAULT 255,
  `default_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required` tinyint(1) UNSIGNED DEFAULT NULL,
  `use_as_filter` tinyint(1) DEFAULT 0,
  `help` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `belongs_to`, `name`, `type`, `max`, `default_value`, `required`, `use_as_filter`, `help`, `active`) VALUES
(1, 'posts', '{\"ar\": \"النوع\"}', 'select', NULL, '{\"ar\":null}', 1, 1, '{\"ar\":null}', 1),
(2, 'posts', '{\"ar\": \"موديل السيارة\"}', 'text', NULL, '{\"ar\":null}', 0, 0, '{\"ar\":null}', 1),
(3, 'posts', '{\"ar\": \"سنة الصنع\"}', 'number', NULL, '{\"ar\":null}', 0, 0, '{\"ar\":null}', 1),
(4, 'posts', '{\"ar\": \"الكيلومترات\"}', 'text', NULL, '{\"ar\":null}', 0, 0, '{\"ar\":null}', 1),
(5, 'posts', '{\"ar\": \"نوع الوقود\"}', 'select', NULL, '{\"ar\":null}', 0, 1, '{\"ar\":null}', 1),
(6, 'posts', '{\"ar\": \"المميزات\"}', 'checkbox_multiple', NULL, '{\"ar\":null}', 0, 1, '{\"ar\":null}', 1),
(7, 'posts', '{\"ar\": \"نوع ناقل الحركة\"}', 'radio', NULL, '{\"ar\":null}', 0, 1, '{\"ar\":null}', 1),
(8, 'posts', '{\"ar\": \"الحالة\"}', 'select', NULL, '{\"ar\":null}', 0, 1, '{\"ar\":null}', 1),
(27, 'posts', '{\"ar\":\"مدة الايجار\"}', 'radio', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(28, 'posts', '{\"ar\":\"اللون\"}', 'text', NULL, '{\"ar\":null}', 0, 0, '{\"ar\":null}', 1),
(29, 'posts', '{\"ar\":\"النوع\"}', 'select', NULL, '{\"ar\":null}', 0, 0, '{\"ar\":null}', 1),
(30, 'posts', '{\"ar\":\"المحرك (سي سي)\"}', 'select', NULL, '{\"ar\":null}', 0, 0, '{\"ar\":null}', 1),
(31, 'posts', '{\"ar\":\"النوع\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(32, 'posts', '{\"ar\":\"النوع\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(33, 'posts', '{\"ar\":\"نوع الخدمة\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(34, 'posts', '{\"ar\":\"قابل للبدل\"}', 'radio', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(35, 'posts', '{\"ar\":\"النوع\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(36, 'posts', '{\"ar\":\"النوع\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(37, 'posts', '{\"ar\":\"النوع\"}', 'select', NULL, '{\"ar\":null}', 0, 0, '{\"ar\":null}', 1),
(38, 'posts', '{\"ar\":\"الماركة\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(39, 'posts', '{\"ar\":\"الفئة\"}', 'text', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(40, 'posts', '{\"ar\":\"سعة التخزين\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(41, 'posts', '{\"ar\":\"الماركة\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(42, 'posts', '{\"ar\":\"مزود الخدمة\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(43, 'posts', '{\"ar\":\"النوع\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(44, 'posts', '{\"ar\":\"النوع\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(45, 'posts', '{\"ar\":\"النوع\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(46, 'posts', '{\"ar\":\"النوع\"}', 'radio', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(47, 'posts', '{\"ar\":\"النوع\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(48, 'posts', '{\"ar\":\"الماركة\"}', 'select', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(49, 'posts', '{\"ar\":\"النوع\"}', 'radio', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1),
(50, 'posts', '{\"ar\":\"حجم الشاشة\"}', 'text', NULL, '{\"ar\":null}', 1, 0, '{\"ar\":null}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fields_options`
--

CREATE TABLE `fields_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fields_options`
--

INSERT INTO `fields_options` (`id`, `field_id`, `value`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, '{\"ar\": \"تويوتا\"}', NULL, 1, 2, NULL),
(2, 1, '{\"ar\": \"هيونداي\"}', NULL, 3, 4, NULL),
(3, 1, '{\"ar\": \"كيا\"}', NULL, 5, 6, NULL),
(4, 1, '{\"ar\": \"بي ام دبليو\"}', NULL, 7, 8, NULL),
(5, 1, '{\"ar\": \"مرسيدس\"}', NULL, 9, 10, NULL),
(6, 1, '{\"ar\": \"استون مارتن\"}', NULL, 11, 12, NULL),
(7, 1, '{\"ar\": \"الفا روميو\"}', NULL, 13, 14, NULL),
(8, 1, '{\"ar\": \"أودي\"}', NULL, 15, 16, NULL),
(9, 1, '{\"ar\": \"ايسوزو\"}', NULL, 17, 18, NULL),
(10, 1, '{\"ar\": \"إنفينيتي\"}', NULL, 19, 20, NULL),
(11, 1, '{\"ar\": \"اوبل\"}', NULL, 21, 22, NULL),
(12, 1, '{\"ar\": \"جيب\"}', NULL, 23, 24, NULL),
(13, 1, '{\"ar\": \"لكزز\"}', NULL, 25, 26, NULL),
(14, 1, '{\"ar\": \"بونتياك\"}', NULL, 27, 28, NULL),
(15, 1, '{\"ar\": \"بيجو\"}', NULL, 29, 30, NULL),
(16, 1, '{\"ar\": \"جاكوار\"}', NULL, 31, 32, NULL),
(17, 1, '{\"ar\": \"جريت وول\"}', NULL, 33, 34, NULL),
(18, 1, '{\"ar\": \"جي ام سي\"}', NULL, 35, 36, NULL),
(19, 1, '{\"ar\": \"ديهاتسو\"}', NULL, 37, 38, NULL),
(20, 1, '{\"ar\": \"دايو\"}', NULL, 39, 40, NULL),
(21, 1, '{\"ar\": \"دودج\"}', NULL, 41, 42, NULL),
(22, 1, '{\"ar\": \"روفر\"}', NULL, 43, 44, NULL),
(23, 1, '{\"ar\": \"رولز رويس\"}', NULL, 45, 46, NULL),
(24, 1, '{\"ar\": \"رينو\"}', NULL, 47, 48, NULL),
(25, 1, '{\"ar\": \"ساب\"}', NULL, 49, 50, NULL),
(26, 1, '{\"ar\": \"ساتورن\"}', NULL, 51, 52, NULL),
(27, 1, '{\"ar\": \"سانغ يونغ\"}', NULL, 53, 54, NULL),
(28, 1, '{\"ar\": \"سكودا\"}', NULL, 55, 56, NULL),
(29, 1, '{\"ar\": \"ستيروين\"}', NULL, 57, 58, NULL),
(30, 1, '{\"ar\": \"سوبارو\"}', NULL, 59, 60, NULL),
(31, 1, '{\"ar\": \"سوزوكي\"}', NULL, 61, 62, NULL),
(32, 1, '{\"ar\": \"سيات\"}', NULL, 63, 64, NULL),
(33, 1, '{\"ar\": \"شيري\"}', NULL, 65, 66, NULL),
(34, 1, '{\"ar\": \"شيفروليه\"}', NULL, 67, 68, NULL),
(35, 1, '{\"ar\": \"فورد\"}', NULL, 69, 70, NULL),
(36, 1, '{\"ar\": \"فولو\"}', NULL, 71, 72, NULL),
(37, 1, '{\"ar\": \"فلوكسفاغن\"}', NULL, 73, 74, NULL),
(38, 1, '{\"ar\": \"فيات\"}', NULL, 75, 76, NULL),
(39, 1, '{\"ar\": \"فيراري\"}', NULL, 77, 78, NULL),
(40, 1, '{\"ar\": \"كاديلاك\"}', NULL, 79, 80, NULL),
(41, 1, '{\"ar\": \"كرايسلر\"}', NULL, 81, 82, NULL),
(42, 1, '{\"ar\": \"لادا\"}', NULL, 83, 84, NULL),
(43, 1, '{\"ar\": \"لامبورغيني\"}', NULL, 85, 86, NULL),
(44, 1, '{\"ar\": \"لاند روفر\"}', NULL, 87, 88, NULL),
(45, 1, '{\"ar\": \"لوتس\"}', NULL, 89, 90, NULL),
(46, 1, '{\"ar\": \"لينكولن\"}', NULL, 91, 92, NULL),
(47, 1, '{\"ar\": \"مازدا\"}', NULL, 93, 94, NULL),
(48, 1, '{\"ar\": \"مازيراتي\"}', NULL, 95, 96, NULL),
(49, 1, '{\"ar\": \"مورغان\"}', NULL, 97, 98, NULL),
(50, 1, '{\"ar\": \"ميتسوبيشي\"}', NULL, 99, 100, NULL),
(51, 1, '{\"ar\": \"مير كوري\"}', NULL, 101, 102, NULL),
(52, 1, '{\"ar\": \"ميني\"}', NULL, 103, 104, NULL),
(53, 1, '{\"ar\": \"نيسان\"}', NULL, 105, 106, NULL),
(54, 1, '{\"ar\": \"هامر\"}', NULL, 107, 108, NULL),
(55, 1, '{\"ar\": \"هوندا\"}', NULL, 109, 110, NULL),
(56, 1, '{\"ar\": \"جيلي\"}', NULL, 111, 112, NULL),
(57, 5, '{\"ar\": \"بترول\"}', NULL, 113, 114, NULL),
(58, 5, '{\"ar\": \"ديزل\"}', NULL, 115, 116, NULL),
(59, 6, '{\"ar\": \"مكيف هواء\"}', NULL, 117, 118, NULL),
(60, 6, '{\"ar\": \"كاميرا خلفية\"}', NULL, 119, 120, NULL),
(61, 6, '{\"ar\": \"فتحة\"}', NULL, 121, 122, NULL),
(62, 6, '{\"ar\": \"مرايا كهربائية\"}', NULL, 123, 124, NULL),
(63, 7, '{\"ar\": \"اوتماتيك\"}', NULL, 125, 126, NULL),
(64, 7, '{\"ar\": \"يدوي- عادي\"}', NULL, 127, 128, NULL),
(65, 8, '{\"ar\": \"جديد\"}', NULL, 129, 130, NULL),
(66, 8, '{\"ar\": \"مستعمل\"}', NULL, 131, 132, NULL),
(164, 1, '{\"ar\":\"زد إكس أوتو\"}', NULL, NULL, NULL, NULL),
(165, 1, '{\"ar\":\"ام جي\"}', NULL, NULL, NULL, NULL),
(166, 1, '{\"ar\":\"بروتون\"}', NULL, NULL, NULL, NULL),
(167, 1, '{\"ar\":\"بريليانس\"}', NULL, NULL, NULL, NULL),
(168, 1, '{\"ar\":\"بي واي دي\"}', NULL, NULL, NULL, NULL),
(169, 1, '{\"ar\":\"سامسونج\"}', NULL, NULL, NULL, NULL),
(170, 1, '{\"ar\":\"تيسلا\"}', NULL, NULL, NULL, NULL),
(171, 1, '{\"ar\":\"ايران خودرو\"}', NULL, NULL, NULL, NULL),
(172, 1, '{\"ar\":\"تاتا\"}', NULL, NULL, NULL, NULL),
(173, 1, '{\"ar\":\"بوغاتي\"}', NULL, NULL, NULL, NULL),
(174, 1, '{\"ar\":\"بويك\"}', NULL, NULL, NULL, NULL),
(175, 1, '{\"ar\":\"اكيورا\"}', NULL, NULL, NULL, NULL),
(176, 1, '{\"ar\":\"سيون\"}', NULL, NULL, NULL, NULL),
(177, 1, '{\"ar\":\"مكلارين\"}', NULL, NULL, NULL, NULL),
(178, 1, '{\"ar\":\"باجاني\"}', NULL, NULL, NULL, NULL),
(179, 1, '{\"ar\":\"لانسيا\"}', NULL, NULL, NULL, NULL),
(180, 1, '{\"ar\":\"جيه إيه سي\"}', NULL, NULL, NULL, NULL),
(181, 1, '{\"ar\":\"ليفان\"}', NULL, NULL, NULL, NULL),
(182, 1, '{\"ar\":\"فاو\"}', NULL, NULL, NULL, NULL),
(183, 1, '{\"ar\":\"ماروتي سوزوكي\"}', NULL, NULL, NULL, NULL),
(184, 1, '{\"ar\":\"سايبا\"}', NULL, NULL, NULL, NULL),
(185, 1, '{\"ar\":\"برايفت\"}', NULL, NULL, NULL, NULL),
(186, 1, '{\"ar\":\"بايك\"}', NULL, NULL, NULL, NULL),
(187, 1, '{\"ar\":\"شانجان\"}', NULL, NULL, NULL, NULL),
(188, 1, '{\"ar\":\"هونغهاي\"}', NULL, NULL, NULL, NULL),
(189, 1, '{\"ar\":\"دي اف ام\"}', NULL, NULL, NULL, NULL),
(190, 1, '{\"ar\":\"بورجوارد\"}', NULL, NULL, NULL, NULL),
(191, 1, '{\"ar\":\"ايفيكو\"}', NULL, NULL, NULL, NULL),
(192, 1, '{\"ar\":\"يو أي زي\"}', NULL, NULL, NULL, NULL),
(193, 1, '{\"ar\":\"ساوايست\"}', NULL, NULL, NULL, NULL),
(194, 1, '{\"ar\":\"سي ام سي\"}', NULL, NULL, NULL, NULL),
(195, 1, '{\"ar\":\"فورس\"}', NULL, NULL, NULL, NULL),
(196, 1, '{\"ar\":\"فيسكر\"}', NULL, NULL, NULL, NULL),
(197, 1, '{\"ar\":\"فيسكر\"}', NULL, NULL, NULL, NULL),
(198, 1, '{\"ar\":\"هافي\"}', NULL, NULL, NULL, NULL),
(199, 1, '{\"ar\":\"سايك\"}', NULL, NULL, NULL, NULL),
(200, 1, '{\"ar\":\"ماهيندرا\"}', NULL, NULL, NULL, NULL),
(201, 1, '{\"ar\":\"أخرئ\"}', NULL, NULL, NULL, NULL),
(202, 6, '{\"ar\":\"شاشة لمس\"}', NULL, NULL, NULL, NULL),
(203, 6, '{\"ar\":\"نظام ملاحة\"}', NULL, NULL, NULL, NULL),
(204, 6, '{\"ar\":\"مثبت سرعة\"}', NULL, NULL, NULL, NULL),
(205, 6, '{\"ar\":\"دخول بدون مفتاح\"}', NULL, NULL, NULL, NULL),
(206, 6, '{\"ar\":\"حساسات اصطفاف\"}', NULL, NULL, NULL, NULL),
(207, 6, '{\"ar\":\"كراسي جلد\"}', NULL, NULL, NULL, NULL),
(208, 6, '{\"ar\":\"كراسي مدفأة\"}', NULL, NULL, NULL, NULL),
(209, 6, '{\"ar\":\"أكياس هوائية\"}', NULL, NULL, NULL, NULL),
(210, 6, '{\"ar\":\"أضوية LED\"}', NULL, NULL, NULL, NULL),
(211, 6, '{\"ar\":\"مدخل اوكس ومدخل يو اس بي\"}', NULL, NULL, NULL, NULL),
(212, 6, '{\"ar\":\"بلوتوث\"}', NULL, NULL, NULL, NULL),
(213, 6, '{\"ar\":\"ABS\"}', NULL, NULL, NULL, NULL),
(214, 6, '{\"ar\":\"سنتر لوك\"}', NULL, NULL, NULL, NULL),
(215, 5, '{\"ar\":\"هايبرد\"}', NULL, NULL, NULL, NULL),
(216, 5, '{\"ar\":\"كهربائي\"}', NULL, NULL, NULL, NULL),
(217, 5, '{\"ar\":\"هايبرد - Plug-in\"}', NULL, NULL, NULL, NULL),
(218, 27, '{\"ar\":\"يومي\"}', NULL, NULL, NULL, NULL),
(219, 27, '{\"ar\":\"أسبوعي\"}', NULL, NULL, NULL, NULL),
(220, 27, '{\"ar\":\"شهري\"}', NULL, NULL, NULL, NULL),
(221, 27, '{\"ar\":\"سنوي\"}', NULL, NULL, NULL, NULL),
(222, 29, '{\"ar\":\"ابريليا\"}', NULL, NULL, NULL, NULL),
(223, 29, '{\"ar\":\"بي ام دبليو\"}', NULL, NULL, NULL, NULL),
(224, 29, '{\"ar\":\"بوجي\"}', NULL, NULL, NULL, NULL),
(225, 29, '{\"ar\":\"كان ام\"}', NULL, NULL, NULL, NULL),
(226, 29, '{\"ar\":\"دوكاتي\"}', NULL, NULL, NULL, NULL),
(227, 29, '{\"ar\":\"هارلي ديفيدسون\"}', NULL, NULL, NULL, NULL),
(228, 29, '{\"ar\":\"هوندا\"}', NULL, NULL, NULL, NULL),
(229, 29, '{\"ar\":\"هايوسنج\"}', NULL, NULL, NULL, NULL),
(230, 29, '{\"ar\":\"كاواساكي\"}', NULL, NULL, NULL, NULL),
(231, 29, '{\"ar\":\"كاي تي ام\"}', NULL, NULL, NULL, NULL),
(232, 29, '{\"ar\":\"موتو جوزي\"}', NULL, NULL, NULL, NULL),
(233, 29, '{\"ar\":\"بياجيو\"}', NULL, NULL, NULL, NULL),
(234, 29, '{\"ar\":\"سوزوكي\"}', NULL, NULL, NULL, NULL),
(235, 29, '{\"ar\":\"تريمف\"}', NULL, NULL, NULL, NULL),
(236, 29, '{\"ar\":\"فيسبا\"}', NULL, NULL, NULL, NULL),
(237, 29, '{\"ar\":\"ياماها\"}', NULL, NULL, NULL, NULL),
(238, 29, '{\"ar\":\"سي اف موتو\"}', NULL, NULL, NULL, NULL),
(239, 29, '{\"ar\":\"إم في أجوستا\"}', NULL, NULL, NULL, NULL),
(240, 29, '{\"ar\":\"إس واي ام\"}', NULL, NULL, NULL, NULL),
(241, 29, '{\"ar\":\"فيكتوري\"}', NULL, NULL, NULL, NULL),
(242, 29, '{\"ar\":\"بينيلي\"}', NULL, NULL, NULL, NULL),
(243, 29, '{\"ar\":\"تي في اس\"}', NULL, NULL, NULL, NULL),
(244, 29, '{\"ar\":\"دايليم\"}', NULL, NULL, NULL, NULL),
(245, 29, '{\"ar\":\"جيانشي\"}', NULL, NULL, NULL, NULL),
(246, 29, '{\"ar\":\"إنديان\"}', NULL, NULL, NULL, NULL),
(247, 29, '{\"ar\":\"رويال انفيلد\"}', NULL, NULL, NULL, NULL),
(248, 29, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(249, 30, '{\"ar\":\"اقل من 250 سي سي\"}', NULL, NULL, NULL, NULL),
(250, 30, '{\"ar\":\"250 -499 سي سي\"}', NULL, NULL, NULL, NULL),
(251, 30, '{\"ar\":\"500 - 599 سي سي\"}', NULL, NULL, NULL, NULL),
(252, 30, '{\"ar\":\"600 - 749 سي سي\"}', NULL, NULL, NULL, NULL),
(253, 30, '{\"ar\":\"750 - 999 سي سي\"}', NULL, NULL, NULL, NULL),
(254, 30, '{\"ar\":\"1000سي سي او اكثر\"}', NULL, NULL, NULL, NULL),
(255, 31, '{\"ar\":\"إكسسوارات\"}', NULL, NULL, NULL, NULL),
(256, 31, '{\"ar\":\"قطع ميكانيك\"}', NULL, NULL, NULL, NULL),
(257, 31, '{\"ar\":\"قطع الهيكل\"}', NULL, NULL, NULL, NULL),
(258, 31, '{\"ar\":\"بطاريات\"}', NULL, NULL, NULL, NULL),
(259, 31, '{\"ar\":\"قطع تعديل\"}', NULL, NULL, NULL, NULL),
(260, 31, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(261, 32, '{\"ar\":\"خوذ\"}', NULL, NULL, NULL, NULL),
(262, 32, '{\"ar\":\"مستلزمات وإكسسوارات\"}', NULL, NULL, NULL, NULL),
(263, 32, '{\"ar\":\"قطع غيار\"}', NULL, NULL, NULL, NULL),
(264, 32, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(265, 33, '{\"ar\":\"ونشات\"}', NULL, NULL, NULL, NULL),
(266, 33, '{\"ar\":\"تنظيف سيارات\"}', NULL, NULL, NULL, NULL),
(267, 33, '{\"ar\":\"صيانة وإصلاح\"}', NULL, NULL, NULL, NULL),
(268, 33, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(269, 34, '{\"ar\":\"نعم\"}', NULL, NULL, NULL, NULL),
(270, 34, '{\"ar\":\"لا\"}', NULL, NULL, NULL, NULL),
(271, 35, '{\"ar\":\"بي ام اكس\"}', NULL, NULL, NULL, NULL),
(272, 35, '{\"ar\":\"دراجات جبلية\"}', NULL, NULL, NULL, NULL),
(273, 35, '{\"ar\":\"دراجات الاطفال\"}', NULL, NULL, NULL, NULL),
(274, 35, '{\"ar\":\"دراجات علئ الطرق\"}', NULL, NULL, NULL, NULL),
(275, 35, '{\"ar\":\"قطع غيار واكسسوارات\"}', NULL, NULL, NULL, NULL),
(276, 35, '{\"ar\":\"دراجات كهربائية\"}', NULL, NULL, NULL, NULL),
(277, 35, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(278, 36, '{\"ar\":\"اليات زراعية\"}', NULL, NULL, NULL, NULL),
(279, 36, '{\"ar\":\"اليات ثقيلة\"}', NULL, NULL, NULL, NULL),
(280, 36, '{\"ar\":\"شاحنات ونقل\"}', NULL, NULL, NULL, NULL),
(281, 36, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(282, 37, '{\"ar\":\"قوارب مع محرك\"}', NULL, NULL, NULL, NULL),
(283, 37, '{\"ar\":\"جيت سكي\"}', NULL, NULL, NULL, NULL),
(284, 37, '{\"ar\":\"قوارب التجديف\"}', NULL, NULL, NULL, NULL),
(285, 37, '{\"ar\":\"المراكب الشراعية\"}', NULL, NULL, NULL, NULL),
(286, 37, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(287, 38, '{\"ar\":\"أبل\"}', NULL, NULL, NULL, NULL),
(288, 38, '{\"ar\":\"سامسونج\"}', NULL, NULL, NULL, NULL),
(289, 38, '{\"ar\":\"هواوي\"}', NULL, NULL, NULL, NULL),
(290, 38, '{\"ar\":\"هونور\"}', NULL, NULL, NULL, NULL),
(291, 38, '{\"ar\":\"اتش تي سي\"}', NULL, NULL, NULL, NULL),
(292, 38, '{\"ar\":\"ال جي\"}', NULL, NULL, NULL, NULL),
(293, 38, '{\"ar\":\"الكاتيل\"}', NULL, NULL, NULL, NULL),
(294, 38, '{\"ar\":\"اسوس\"}', NULL, NULL, NULL, NULL),
(295, 38, '{\"ar\":\"نوكيا\"}', NULL, NULL, NULL, NULL),
(296, 38, '{\"ar\":\"شاومي\"}', NULL, NULL, NULL, NULL),
(297, 38, '{\"ar\":\"اوبو\"}', NULL, NULL, NULL, NULL),
(298, 38, '{\"ar\":\"لينوفو\"}', NULL, NULL, NULL, NULL),
(299, 38, '{\"ar\":\"بلاك بيري\"}', NULL, NULL, NULL, NULL),
(300, 38, '{\"ar\":\"موتورلا\"}', NULL, NULL, NULL, NULL),
(301, 38, '{\"ar\":\"بلاك فيو\"}', NULL, NULL, NULL, NULL),
(302, 38, '{\"ar\":\"بلو\"}', NULL, NULL, NULL, NULL),
(303, 38, '{\"ar\":\"كات\"}', NULL, NULL, NULL, NULL),
(304, 38, '{\"ar\":\"دوجي\"}', NULL, NULL, NULL, NULL),
(305, 38, '{\"ar\":\"ايليفون\"}', NULL, NULL, NULL, NULL),
(306, 38, '{\"ar\":\"جوجل\"}', NULL, NULL, NULL, NULL),
(307, 38, '{\"ar\":\"L8 ستار\"}', NULL, NULL, NULL, NULL),
(308, 38, '{\"ar\":\"ابريت\"}', NULL, NULL, NULL, NULL),
(309, 38, '{\"ar\":\"لياجو\"}', NULL, NULL, NULL, NULL),
(310, 38, '{\"ar\":\"ميزو\"}', NULL, NULL, NULL, NULL),
(311, 38, '{\"ar\":\"ميكروماكس\"}', NULL, NULL, NULL, NULL),
(312, 38, '{\"ar\":\"أوكيتيل\"}', NULL, NULL, NULL, NULL),
(313, 38, '{\"ar\":\"بوش\"}', NULL, NULL, NULL, NULL),
(314, 38, '{\"ar\":\"تكنو\"}', NULL, NULL, NULL, NULL),
(315, 38, '{\"ar\":\"فيفو\"}', NULL, NULL, NULL, NULL),
(316, 38, '{\"ar\":\"زي تي اي\"}', NULL, NULL, NULL, NULL),
(317, 38, '{\"ar\":\"فيرتو\"}', NULL, NULL, NULL, NULL),
(318, 38, '{\"ar\":\"ون بلس\"}', NULL, NULL, NULL, NULL),
(319, 38, '{\"ar\":\"إنفينيكس\"}', NULL, NULL, NULL, NULL),
(320, 38, '{\"ar\":\"ريلمي\"}', NULL, NULL, NULL, NULL),
(321, 38, '{\"ar\":\"ايتل\"}', NULL, NULL, NULL, NULL),
(322, 38, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(323, 40, '{\"ar\":\"4 جيجا بايت\"}', 0, 2, 3, NULL),
(324, 40, '{\"ar\":\"8 جيجا بايت\"}', 0, 4, 5, NULL),
(325, 40, '{\"ar\":\"16 جيجا بايت\"}', 0, 6, 7, NULL),
(326, 40, '{\"ar\":\"32 جيجا بايت\"}', 0, 8, 9, NULL),
(327, 40, '{\"ar\":\"64 جيجا بايت\"}', 0, 10, 11, NULL),
(328, 40, '{\"ar\":\"128 جيجا بايت\"}', 0, 12, 13, NULL),
(329, 40, '{\"ar\":\"512 جيجا بايت\"}', 0, 14, 15, NULL),
(330, 40, '{\"ar\":\"1024 جيجا بايت\"}', 0, 16, 17, NULL),
(331, 41, '{\"ar\":\"ابل\"}', NULL, NULL, NULL, NULL),
(332, 41, '{\"ar\":\"سامسونج\"}', NULL, NULL, NULL, NULL),
(333, 41, '{\"ar\":\"سوني\"}', NULL, NULL, NULL, NULL),
(334, 41, '{\"ar\":\"مايكروسوفت\"}', NULL, NULL, NULL, NULL),
(335, 41, '{\"ar\":\"إيسر\"}', NULL, NULL, NULL, NULL),
(336, 41, '{\"ar\":\"لينوفو\"}', NULL, NULL, NULL, NULL),
(337, 41, '{\"ar\":\"اسوس\"}', NULL, NULL, NULL, NULL),
(338, 41, '{\"ar\":\"امازون\"}', NULL, NULL, NULL, NULL),
(339, 41, '{\"ar\":\"أركوس\"}', NULL, NULL, NULL, NULL),
(340, 41, '{\"ar\":\"بلاك بيري\"}', NULL, NULL, NULL, NULL),
(341, 41, '{\"ar\":\"ديل\"}', NULL, NULL, NULL, NULL),
(342, 41, '{\"ar\":\"اي نت\"}', NULL, NULL, NULL, NULL),
(343, 41, '{\"ar\":\"جوجل\"}', NULL, NULL, NULL, NULL),
(344, 41, '{\"ar\":\"اتش بي\"}', NULL, NULL, NULL, NULL),
(345, 41, '{\"ar\":\"هواوي\"}', NULL, NULL, NULL, NULL),
(346, 41, '{\"ar\":\"توشيبا\"}', NULL, NULL, NULL, NULL),
(347, 41, '{\"ar\":\"الكاتيل\"}', NULL, NULL, NULL, NULL),
(348, 41, '{\"ar\":\"تكنو\"}', NULL, NULL, NULL, NULL),
(349, 41, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(350, 42, '{\"ar\":\"ام تي ان\"}', NULL, NULL, NULL, NULL),
(351, 42, '{\"ar\":\"يمن موبايل\"}', NULL, NULL, NULL, NULL),
(352, 42, '{\"ar\":\"سبا فون\"}', NULL, NULL, NULL, NULL),
(353, 42, '{\"ar\":\"واي\"}', NULL, NULL, NULL, NULL),
(354, 43, '{\"ar\":\"اكسسوارات العاب\"}', NULL, NULL, NULL, NULL),
(355, 43, '{\"ar\":\"شواحن وكوابل\"}', NULL, NULL, NULL, NULL),
(356, 43, '{\"ar\":\"سماعات\"}', NULL, NULL, NULL, NULL),
(357, 43, '{\"ar\":\"كفرات وحقائب - واقي شاشات\"}', NULL, NULL, NULL, NULL),
(358, 43, '{\"ar\":\"اكسسوارات التصوير\"}', NULL, NULL, NULL, NULL),
(359, 43, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(360, 44, '{\"ar\":\"بلايستيشن 5\"}', NULL, NULL, NULL, NULL),
(361, 44, '{\"ar\":\"بلايستيشن 4\"}', NULL, NULL, NULL, NULL),
(362, 44, '{\"ar\":\"بلايستيشن 3\"}', NULL, NULL, NULL, NULL),
(363, 44, '{\"ar\":\"بلايستيشن 2\"}', NULL, NULL, NULL, NULL),
(364, 44, '{\"ar\":\"بلايستيشن 1\"}', NULL, NULL, NULL, NULL),
(365, 44, '{\"ar\":\"بي اس بي - فيتا\"}', NULL, NULL, NULL, NULL),
(366, 44, '{\"ar\":\"بلايستيشن 4 برو\"}', NULL, NULL, NULL, NULL),
(367, 44, '{\"ar\":\"اكس بوكس سيريس اكس\"}', NULL, NULL, NULL, NULL),
(368, 44, '{\"ar\":\"اكس بوكس سيريس اس\"}', NULL, NULL, NULL, NULL),
(369, 44, '{\"ar\":\"اكس بوكس ون\"}', NULL, NULL, NULL, NULL),
(370, 44, '{\"ar\":\"اكس بوكس360\"}', NULL, NULL, NULL, NULL),
(371, 44, '{\"ar\":\"اكس بوكس ون اكس\"}', NULL, NULL, NULL, NULL),
(372, 44, '{\"ar\":\"اكس بوكس ون اس\"}', NULL, NULL, NULL, NULL),
(373, 44, '{\"ar\":\"نينتندو وي\"}', NULL, NULL, NULL, NULL),
(374, 44, '{\"ar\":\"نينتندو وي يو\"}', NULL, NULL, NULL, NULL),
(375, 44, '{\"ar\":\"نينتندو 3DS\"}', NULL, NULL, NULL, NULL),
(376, 44, '{\"ar\":\"نينتندو سويتش\"}', NULL, NULL, NULL, NULL),
(377, 44, '{\"ar\":\"كمبيوتر العاب\"}', NULL, NULL, NULL, NULL),
(378, 44, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(379, 45, '{\"ar\":\"هارد ديسك وميموري\"}', NULL, NULL, NULL, NULL),
(380, 45, '{\"ar\":\"اسلاك - وصلات - محولات\"}', NULL, NULL, NULL, NULL),
(381, 45, '{\"ar\":\"اجهزة استشعار الحركة - كاميرات\"}', NULL, NULL, NULL, NULL),
(382, 45, '{\"ar\":\"عجلات قيادة\"}', NULL, NULL, NULL, NULL),
(383, 45, '{\"ar\":\"يد تحكم\"}', NULL, NULL, NULL, NULL),
(384, 45, '{\"ar\":\"سماعات\"}', NULL, NULL, NULL, NULL),
(385, 45, '{\"ar\":\"لوحات مفاتيح - ماوس\"}', NULL, NULL, NULL, NULL),
(386, 45, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(387, 46, '{\"ar\":\"سوق بلاي\"}', NULL, NULL, NULL, NULL),
(388, 46, '{\"ar\":\"اي تيونز\"}', NULL, NULL, NULL, NULL),
(389, 46, '{\"ar\":\"بلايستيشن\"}', NULL, NULL, NULL, NULL),
(390, 46, '{\"ar\":\"اكس بوكس\"}', NULL, NULL, NULL, NULL),
(391, 46, '{\"ar\":\"ستيم\"}', NULL, NULL, NULL, NULL),
(392, 46, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(393, 47, '{\"ar\":\"كمبيوتر مكتبي\"}', NULL, NULL, NULL, NULL),
(394, 47, '{\"ar\":\"لابتوب\"}', NULL, NULL, NULL, NULL),
(395, 47, '{\"ar\":\"اكسسوارات - قطع غيار\"}', NULL, NULL, NULL, NULL),
(396, 48, '{\"ar\":\"ال جي\"}', NULL, NULL, NULL, NULL),
(397, 48, '{\"ar\":\"سامسونج\"}', NULL, NULL, NULL, NULL),
(398, 48, '{\"ar\":\"سوني\"}', NULL, NULL, NULL, NULL),
(399, 48, '{\"ar\":\"توشيبا\"}', NULL, NULL, NULL, NULL),
(400, 48, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL),
(401, 49, '{\"ar\":\"LCD\"}', NULL, NULL, NULL, NULL),
(402, 49, '{\"ar\":\"LED\"}', NULL, NULL, NULL, NULL),
(403, 49, '{\"ar\":\"OLD\"}', NULL, NULL, NULL, NULL),
(404, 49, '{\"ar\":\"QLED\"}', NULL, NULL, NULL, NULL),
(405, 49, '{\"ar\":\"سمارت\"}', NULL, NULL, NULL, NULL),
(406, 49, '{\"ar\":\"بلازما\"}', NULL, NULL, NULL, NULL),
(407, 49, '{\"ar\":\"اخرئ\"}', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, '{\"ar\": \"السيد\"}'),
(2, '{\"ar\": \"السيدة\"}');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `method`, `name`, `value`, `view`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'getSearchForm', 'Search Form Area', '{\"enable_form_area_customization\":\"1\",\"background_color\":\"#040404\",\"background_image\":\"app\\/logo\\/header-615dde7be28e1.jpeg\",\"height\":null,\"parallax\":\"1\",\"hide_form\":\"0\",\"form_border_color\":\"#F9D7A7\",\"form_border_width\":null,\"form_btn_background_color\":null,\"form_btn_text_color\":null,\"hide_titles\":\"0\",\"title_ar\":\"\\u0628\\u064a\\u0639 \\u0628\\u0644\\u0627 \\u062d\\u062f\\u0648\\u062f \\u0648\\u0627\\u0634\\u062a\\u0631\\u064a \\u0628\\u0644\\u0627 \\u0642\\u064a\\u0648\\u062f\",\"sub_title_ar\":\"\\u0627\\u0633\\u0647\\u0644-\\u0627\\u0633\\u0631\\u0639-\\u0627\\u0648\\u0641\\u0631\",\"big_title_color\":null,\"sub_title_color\":null,\"hide_on_mobile\":\"0\",\"active\":\"1\"}', 'home.inc.search', NULL, NULL, 0, 1, 1, 1),
(2, 'getLocations', 'Locations & Country Map', '{\"show_cities\":\"1\",\"show_post_btn\":\"1\",\"background_color\":null,\"border_width\":null,\"border_color\":null,\"text_color\":null,\"link_color\":null,\"link_color_hover\":null,\"max_items\":\"22\",\"items_cols\":\"3\",\"cache_expiration\":null,\"show_map\":\"1\",\"map_background_color\":null,\"map_border\":null,\"map_hover_border\":null,\"map_border_width\":null,\"map_color\":null,\"map_hover\":null,\"map_width\":null,\"map_height\":null,\"hide_on_mobile\":\"0\",\"active\":\"1\"}', 'home.inc.locations', NULL, NULL, 2, 3, 1, 1),
(3, 'getSponsoredPosts', 'Sponsored Ads', NULL, 'home.inc.featured', NULL, NULL, 4, 5, 1, 1),
(4, 'getCategories', 'Categories', '{\"type_of_display\":\"c_picture_icon\",\"max_items\":null,\"show_icon\":\"1\",\"max_sub_cats\":\"3\",\"cache_expiration\":null,\"hide_on_mobile\":\"0\",\"active\":\"1\"}', 'home.inc.categories', NULL, NULL, 6, 7, 1, 1),
(5, 'getLatestPosts', 'Latest Ads', '{\"max_items\":\"8\",\"order_by\":\"date\",\"show_view_more_btn\":\"1\",\"cache_expiration\":null,\"hide_on_mobile\":\"0\",\"active\":\"1\"}', 'home.inc.latest', NULL, NULL, 8, 9, 1, 1),
(6, 'getStats', 'Mini Stats', NULL, 'home.inc.stats', NULL, NULL, 10, 11, 1, 1),
(7, 'getTopAdvertising', 'Advertising #1', '{\"active\":0}', 'layouts.inc.advertising.top', NULL, NULL, 12, 13, 1, 0),
(8, 'getBottomAdvertising', 'Advertising #2', '{\"active\":0}', 'layouts.inc.advertising.bottom', NULL, NULL, 14, 15, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `abbr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `native` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci DEFAULT 'ltr',
  `russian_pluralization` tinyint(1) UNSIGNED DEFAULT 0,
  `date_format` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime_format` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `default` tinyint(1) DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `locale`, `name`, `native`, `flag`, `app_name`, `script`, `direction`, `russian_pluralization`, `date_format`, `datetime_format`, `active`, `default`, `parent_id`, `lft`, `rgt`, `depth`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 'ar', 'ar_YE', 'Arabic', 'العربية', NULL, 'arabic', 'Arab', 'rtl', 0, 'DD/MMMM/YYYY', 'DD/MMMM/YYYY HH:mm', 1, 1, NULL, 8, 9, 1, NULL, '2021-04-03 08:39:38', '2021-04-03 08:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `page` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `page`, `title`, `description`, `keywords`, `active`) VALUES
(1, 'home', '{\"ar\":\"موقع دلوني\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', 1),
(2, 'register', '{\"ar\":\"التسجبل بموقع دلوني\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', 1),
(3, 'login', '{\"ar\":\"تسجيل دخول\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', 1),
(4, 'create', '{\"ar\":\"اضافة اعلان مجاني\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', 1),
(5, 'countries', '{\"ar\":\"البلدان\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', 1),
(6, 'contact', '{\"ar\":\"اتصل بنا {app_name}\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', 1),
(7, 'sitemap', '{\"ar\":\"التصنيفات\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', 1),
(8, 'password', '{\"ar\":\"كلمة المرور\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', 1),
(9, 'pricing', '{\"ar\":\"التسعير\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', '{\"ar\":\"هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_10_12_160714_create_languages_table', 1),
(2, '2020_10_12_160715_create_advertising_table', 1),
(3, '2020_10_12_160715_create_blacklist_table', 1),
(4, '2020_10_12_160715_create_cache_table', 1),
(5, '2020_10_12_160715_create_categories_table', 1),
(6, '2020_10_12_160715_create_continents_table', 1),
(7, '2020_10_12_160715_create_currencies_table', 1),
(8, '2020_10_12_160715_create_fields_table', 1),
(9, '2020_10_12_160715_create_gender_table', 1),
(10, '2020_10_12_160715_create_home_sections_table', 1),
(11, '2020_10_12_160715_create_meta_tags_table', 1),
(12, '2020_10_12_160715_create_packages_table', 1),
(13, '2020_10_12_160715_create_pages_table', 1),
(14, '2020_10_12_160715_create_password_resets_table', 1),
(15, '2020_10_12_160715_create_payment_methods_table', 1),
(16, '2020_10_12_160715_create_permission_tables', 1),
(17, '2020_10_12_160715_create_post_types_table', 1),
(18, '2020_10_12_160715_create_report_types_table', 1),
(19, '2020_10_12_160715_create_sessions_table', 1),
(20, '2020_10_12_160715_create_settings_table', 1),
(21, '2020_10_12_160715_create_user_types_table', 1),
(22, '2020_10_12_160716_create_category_field_table', 1),
(23, '2020_10_12_160716_create_countries_table', 1),
(24, '2020_10_12_160716_create_fields_options_table', 1),
(25, '2020_10_12_160716_create_subadmin1_table', 1),
(26, '2020_10_12_160716_create_subadmin2_table', 1),
(27, '2020_10_12_160716_create_users_table', 1),
(28, '2020_10_12_160717_create_cities_table', 1),
(29, '2020_10_12_160717_create_posts_table', 1),
(30, '2020_10_12_160717_create_saved_posts_table', 1),
(31, '2020_10_12_160717_create_saved_search_table', 1),
(32, '2020_10_12_160717_create_threads_table', 1),
(33, '2020_10_12_160718_create_threads_messages_table', 1),
(34, '2020_10_12_160718_create_threads_participants_table', 1),
(35, '2020_10_12_160719_create_payments_table', 1),
(36, '2020_10_12_160719_create_pictures_table', 1),
(37, '2020_10_12_160719_create_post_values_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 101);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `short_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `ribbon` enum('red','orange','green') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_badge` tinyint(1) UNSIGNED DEFAULT 0,
  `price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo_duration` int(11) DEFAULT 30 COMMENT 'In days',
  `duration` int(10) UNSIGNED DEFAULT 30 COMMENT 'In days',
  `pictures_limit` int(11) DEFAULT 5,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `facebook_ads_duration` int(10) UNSIGNED DEFAULT 0,
  `google_ads_duration` int(10) UNSIGNED DEFAULT 0,
  `twitter_ads_duration` int(10) UNSIGNED DEFAULT 0,
  `linkedin_ads_duration` int(10) UNSIGNED DEFAULT 0,
  `recommended` tinyint(1) DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `short_name`, `ribbon`, `has_badge`, `price`, `currency_code`, `promo_duration`, `duration`, `pictures_limit`, `description`, `facebook_ads_duration`, `google_ads_duration`, `twitter_ads_duration`, `linkedin_ads_duration`, `recommended`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, '{\"ar\":\"عروض وتخفيضات\"}', '{\"ar\":\"عروض وتخفيضات\"}', NULL, 1, 0.00, 'USD', NULL, NULL, NULL, '{\"ar\":null}', 0, 0, 0, 0, 0, 0, 2, 3, 0, 1),
(5, '{\"ar\":\"عروض وتخفيضات\"}', '{\"ar\":\"عروض وتخفيضات\"}', 'red', 1, 1.00, 'USD', NULL, 30, 15, '{\"ar\":null}', NULL, NULL, NULL, NULL, 1, 0, 4, 5, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `type` enum('standard','terms','privacy','tips') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `name_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_blank` tinyint(1) UNSIGNED DEFAULT 0,
  `excluded_from_footer` tinyint(1) UNSIGNED DEFAULT 0,
  `active` tinyint(1) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `parent_id`, `type`, `name`, `slug`, `title`, `picture`, `content`, `external_link`, `lft`, `rgt`, `depth`, `name_color`, `title_color`, `target_blank`, `excluded_from_footer`, `active`, `created_at`, `updated_at`) VALUES
(1, NULL, 'terms', '{\"ar\":\"الشروط والأحكام\"}', 'terms', '{\"ar\":\"الشروط والأحكام\"}', NULL, '{\"ar\":\"<p style=\\\"text-align: right;\\\"><span style=\\\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\\\">شروط الاستخدام<\\/span><\\/p>\\r\\n<p style=\\\"text-align: right;\\\"><span style=\\\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\\\">عدم المخالفة لأي قانون أو لائحة تكون محمية بحقوق الطبع والنشر أو براءة اختراع أو محمية بسر تجاري أو علامة تجارية، أوع<\\/span><span style=\\\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\\\">&nbsp;تخضع بخلاف ذلك حقوق ملكية فكرية أو حقوق ملكية أخرى لطرف ثالث ، بما في ذلك حقوق الخصوصية والدعاية، ما لم تكن مالكا لهذه الحقوق أو لديك إذن أو ترخيص من مالكها الشرعي لنشر المواد ومنح موقع دلوني<\\/span><span style=\\\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\\\"> جميع حقوق الترخيص الممنوحة بموجب ذلك؛ <\\/span><span style=\\\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\\\">تنتهك أي من حقوق الملكية الفكرية السابقة لأي طرف، أو هي محتوى ليس لديك الحق في تقديمه&nbsp; بموجب أي قانون أو لائحة أو علاقة تعاقدية أو ائتمانية؛ أن يكون ضارا أو مسيئا أو غير قانوني أو يحمل طابع التهديد أو التحرش أو تكفيري أو تشهيري أو يظهر الفواحش أو إباحي أو يمثل أي نوع من أنواع الإعتدائات الجنسية للأطفال أو تشهيري أو متطفل على خصوصية الغير أو حقوق الغير أو يشيع الكراهية أو العنصرية أو مرفوض عرقيا أو مذموم\\/ او استخفاف بالآخرين أو يتعلق بغسل الأموال أو القمار أو مؤذي أو ضار بالأطفال القصّر بأي شكل من الأشكال أو غير قانوني بأي شكل من الأشكال؛ محتوى يزعج أو يحط من قدر أو يرعب أي فرد أو مجموعة من الأفراد على أساس الدين أو الجنس أو التوجه الجنسي أو العرق أو الانتماء العرقي أو السن أو الإعاقة؛ ينتهك أي قوانين (محلية) العدل في التوظيف، بما في ذلك على سبيل المثال لا الحصر، تلك التي يتم حظرها بسبب ذكر في الإعلان عن توظيف، تفضيل أو متطلب للعمل يقوم على أساس العرق أو اللون أو الدين أو الجنس أو الأصل القومي أو العمر أو الإعاقة لمقدم الطلب؛&nbsp; تلك التي تتضمن المعلومات الشخصية أو المحددة عن شخص آخر دون الحصول على الموافقة الصريحة من ذاك الشخص؛ انتحال شخصية أو شخص أو كيان، بما في ذلك على سبيل المثال لا الحصر، موظف دلوني أو يصرح زورا أو يحرف انتماء شخص أو كيان؛ يخدع أو يضلل المرسل إليه حول مصدر هذه الرسائل أو ينقل أي معلومات مسيئة أو تهديدية في طبيعتها؛ &nbsp;محتوى زائف أو خادع أو مضلل أو عروض الإحتيال من خلال إغراء الزبائن ؛&nbsp; &nbsp;محتويات تشكل أو تحتوي على \\\" التسويق الشبكي\\\" ، \\\"التسويق متعدد المستويات\\\" ، \\\"مخططات بونزي Ponzi ومخططات الهرم\\\" ، \\\"تسويق شركة تابعة\\\" ، \\\"ربط رمز الإحالة\\\" ، \\\"البريد غير المرغوب فيه\\\" ، \\\"البريد المزعج\\\" ، \\\"سلسلة الرسائل\\\" ، أو الإعلانات غير المرغوب فيها ذات الطابع التجاري ؛ تلك التي تشكل أو تتضمن أي شكل من أشكال الإعلان أو التماس العطاء إذا (1) كانت منشورة في مناطق أو فئات من المنصة غير محددة لهذه الأغراض؛ أو (2) إرسال بريد إلكتروني إلى مستخدمي موقع دلوني الذين طلبوا عدم الاتصال بهم بشأن الخدمات أو المنتجات أو المصالح التجارية الأخرى؛&nbsp;&nbsp; التي تتضمن روابط لخدمات تجارية أو منصات لطرف ثالث باستثناء ما يسمح به بشكل محدد من قبل موقع دلوني. تلك التي تعلن عن أي خدمات غير قانونية أو بيع أي سلع يحظر بيعها أو يقيدها القانون المعمول به، بما في ذلك على سبيل المثال لا الحصر، المواد التي يحظر بيعها أو ينظمها القانون المعمول به في الولاية القضائية المحلية؛ يحتوي على فيروسات برمجية أو أي رمز كمبيوتر أو ملفات أو برامج أخرى مصممة لمقاطعة أو تدمير أو تقييد وظائف أي برامج كمبيوتر أو أجهزة أو معدات اتصالات أو أي مورد كمبيوتر آخر؛:&nbsp;<\\/span><br style=\\\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\\\" \\/><br style=\\\"margin: 0px; padding: 0px; box-sizing: border-box; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\\\" \\/><br \\/><\\/p>\"}', NULL, 6, 7, 1, NULL, NULL, 0, 0, 1, '2021-04-03 08:39:39', '2021-07-06 16:22:00'),
(2, NULL, 'privacy', '{\"ar\":\"سياسة الخصوصية\"}', 'سياسة الخصوصية', '{\"ar\":\"سياسة الخصوصية\"}', 'app/page/9861899c155a6dd320704f14628ebe3c.png', '{\"ar\":\"<p style=\\\"text-align: right;\\\"><span style=\\\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; text-align: right; background-color: #ffffff;\\\">سياسة الخصوصية يرجى قراءة سياسة الخصوصية هذه بعناية قبل استخدام خدماتنا. يجب أن تكون للكلمات والتعابير التالية المعاني في سياسة الخصوصية المعينة لها.&nbsp; الخدمات تعني أي من المنتجات أو الخدمات أو المحتويات أو الميزات أو التقنيات أو الوظائف وجميع المواقع والتطبيقات والخدمات ذات الصلة المقدمة من قبلنا.&nbsp; المنصة تعني المواقع الإلكترونية أو تطبيقات الهاتف الجوال أو المواقع الإلكترونية المخصصة للهواتف الذكية أو غيرها من الخصائص عبر الإنترنت التي نقدم من خلالها خدماتنا. باستخدام دلوني والخدمات ذات الصلة، فإنك تمنح موافقة صريحة لجمع واستخدام والكشف عن والاحتفاظ بالمعلومات الشخصية الخاصة بك من قبلنا، كما هو موضح في سياسة الخصوصية هذه وشروط الاستخدام الخاصة بنا. يجوز لموقع دلوني&nbsp; تغيير سياسة الخصوصية هذه من حين لآخر كما هو موضح أدناه. ننصحك بقراءة هذه السياسة بصورة منتظمة للتأكد من التغييرات. تعتبر أي سياسة خصوصية معدلة سارية المفعول فور نشرها على موقعنا الإلكتروني.&nbsp; 1-&nbsp; ما هي البيانات التي نجمعها عنك؟ معلومات التسجيل والحسابات الأخرى: عندما&nbsp; تقوم بالتسجيل لاستخدام منصاتنا، فإنه يجوز لنا أن نجمع المعلومات التالية عنك بناءً على كيفية التسجيل على منصتنا والتي يمكن أن تتضمن رقم الهاتف المحمول والاسم من بين المعلومات أساسية أخرى. البيانات التي نجمعها تلقائياً عند استخدامك لخدماتنا: عندما تتفاعل مع منصتنا أو تستخدم خدماتنا، نقوم تلقائياً بجمع معلومات مختلفة تتضمن، على سبيل المثال لا الحصر، معلومات عن الجهاز ومعلومات الموقع وبيانات السجل وبيانات تصفح الإنترنت وملفات تعريف الارتباط والتقنيات المشابهة.&nbsp; البيانات من أطراف ثالثة أو من مصادر متاحة للجمهور: قد نتلقى بيانات شخصية عنك من أطراف ثالثة ومصادر عامة مختلفة.&nbsp; &nbsp; 2. لماذا نقوم بمعالجة معلوماتك الشخصية؟ نحن نستخدم بياناتك الشخصية عندما يسمح القانون لنا بذلك. الأكثر شيوعا دون الحصر، سوف نستخدم البيانات التي نحتاج اليها لتنفيذ العقد المزمع إبرامه معكم أو قد تم إبرامه معكم، لتحسين وتخصيص وتقديم خدماتنا و منصاتنا الحالية والقادمة ولنبذل قصارى جهدنا لاكتشاف حالات الغش والاحتيال ولتقديم ميزات الخدمات والمنصة لتقديم خدمة أفضل لكم عن طريق أدوات المساعدة ، والامتثال لالتزام قانوني أو تنظيمي مع السلطات حسب الاقتضاء.&nbsp; 3- كيف سنطلعكم على التغييرات في سياسة الخصوصية؟ يحق لنا إجراء تعديلات على سياسة الخصوصية هذه من وقت لآخر. سنقوم بنشر هذه التغييرات على هذه الصفحة لأي تغيير نقوم به. وفي حالة عدم موافقتك أو موافقة ولي أمرك (حسب الحال) على التغييرات، يرجى التوقف عن استخدام الخدمات والمنصة. 4. حقوقك قد يكون لديك حقوق قانونية معينة فيما يتعلق ببياناتك الشخصية استنادا إلى البلد الذي تقيم فيه أو كيفية تعاملنا&nbsp; معك. لن تضطر لدفع رسوم للوصول إلى بياناتك الشخصية (أو لممارسة أي من الحقوق الأخرى). ومع ذلك، يجوز لنا أن نتقاضى رسوماً معقولة إذا كان طلبك لا يستند إلى أساس واضح أو متكرر أو مفرط أو لأي سبب آخر. وبدلا من ذلك، ربما نرفض الموافقة على طلبك في هذه الظروف. ونحاول الاستجابة لجميع الطلبات المشروعة في غضون ثلاثة أشهر. وربما يستغرق الأمر منا أحيانا وقتاً أطول إذا كان طلبك معقدا بشكل خاص أو كان لديك عدة طلبات. وفي هذه الحالة، سوف نقوم بإبلاغك ونبقيك على اطلاع بآخر التطورات.&nbsp; 5- الاتصال والتسويق سوف نتواصل معك عن طريق البريد الإلكتروني أو الرسائل القصيرة SMS أو استعمال إشعارات التطبيقات للهواتف الذكية فيما يتعلق بخدماتنا أو منصتنا لتأكيد تسجيلك&nbsp; وإبلاغك في حال أصبحت إعلاناتك فعالة أو منتهية الصلاحية, والمراسلة بغرض رسائل المعاملات الأخرى المتعلقة بخدماتنا. ونظرا لأنه من الضروري بالنسبة لنا أن نقدم لك رسائل المعاملات هذه ، فربما لا تتمكن من عدم قبول هذه الرسائل. من الممكن أن تتلقى بعض الاتصالات التسويقية منا إذا كنت تستخدم منصتنا أو خدماتنا أو قمت بتزويدنا ببياناتك التفصيلية عند الاشتراك في مسابقة ؛ أو كنت مسجلا في ترويج أو عرض معين. &nbsp; 6- مع من نشارك بياناتك؟ قد نضطر إلى تبادل بياناتكم الشخصية مع الأطراف المبينة أدناه للأغراض المبينة أعلاه. إننا نستخدم مزودي خدمات من طرف ثالث لمساعدتنا في تقديم جانب معين من خدماتنا، على سبيل المثال، مرافق التخزين السحابية مثل خدمات الويب الخاصة بشركة أمازون أو غيرها. ربما يكون مزودو الخدمات موجودين داخل أو خارج البلد الذي تقيم فيه حالياً.&nbsp; ما لم ينص صراحة على خلاف ذلك في سياسة الخصوصية هذه، فعندئذ تطبق سياسة الخصوصية هذه على استعمال ونقل المعلومات التي نجمعها منك. لا يملك موقع دلوني أي سيطرة على سياسات الخصوصية الخاصة بالأطراف الأخرى التي ربما تنطبق عليك. ولذا فإننا نشجعك على طرح الأسئلة قبل الإفصاح عن معلوماتكم الشخصية للآخرين. من أجل تحسين خدماتنا، سنقوم أحيانا بمشاركة معلوماتك الغير محددة للهوية مع مزودي التحليلات الذين يساعدوننا في تحليل كيفية استخدام الأشخاص لمنصتنا\\/ خدمتنا. نحن نشارك المعلومات الخاصة بك معهم في شكل غير محدد للهوية لأغراض المراقبة والإبلاغ عن فعالية تسليم الحملات لشركائنا في الأعمال التجارية وتحليل الأعمال الداخلية. يجوز لنا أن الكشف عن بياناتك الشخصية لسلطات تنفيذ القانون والهيئات التنظيمية والهيئات الحكومية أو العامة والأطراف الثالثة الأخرى ذات الصلة للامتثال لأي متطلبات قانونية أو تنظيمية. يجوز لنا أن نختار بيع أو نقل أو دمج أجزاء من أعمالنا أو أصولنا. وعوضا عن ذلك، يجوز لنا السعي للإستحواذ على أعمال أخرى أو الاندماج معهم. وفي حالة حدوث تغيير لأعمالنا، عندئذ يجوز للمالكين الجدد استخدام بياناتك الشخصية بالطريقة نفسها المنصوص عليها في سياسة الخصوصية هذه. عند قيامك بنشر إعلان باستخدام خدماتنا، فإنه بإمكانك التصريح&nbsp; عن بعض المعلومات الشخصية والتي من الممكن أن تكون متاحة لمستخدمي موقع دلوني . وربما يتضمن ذلك، على سبيل المثال لا الحصر، اسمك وعنوان بريدك الإلكتروني وموقعك ورقم الاتصال بك وصورتك. يرجى ملاحظة أن أي معلومات تقدمها للمستخدمين الآخرين يمكن دائماً مشاركتها مع الآخرين، لذا يرجى ممارسة تقديراتك الخاصة بهذا الصدد. 7-&nbsp; عمليات التحويل&nbsp; الدولية أنت توافق على أنه يجوز لنا نقل بياناتك الشخصية إلى أطراف ثالثة داخل وخارج بلدك.&nbsp; لذلك، بينما نسعى جاهدين لحماية هذه المعلومات، إلا أنه لا يمكننا ضمان أو أن نكفل أمن أي من المعلومات التي ترسلها إلينا وبذلك فإنك تفعل ذلك على مسؤوليتك الخاصة. &nbsp; 8- أين نقوم بتخزين بياناتك وإلى متى؟ يجوز أن يتم تخزين البيانات التي نجمعها عنك ومعالجتها داخل أو خارج البلد الذي تقيم فيه على سيرفرات (خوادم) آمنة من أجل توفير أفضل تجربة للمستخدم للخدمة و\\/أو المنصة، الحالية أو القادمة. على سبيل المثال، لبناء موقع ويب سريع أو تطبيق الهواتف الذكية. سوف نحتفظ ببياناتك الشخصية فقط طالما كان ذلك ضرورياً للوفاء بالأغراض التي جمعت من أجلها، بما في ذلك لأغراض تلبية أي متطلبات قانونية أو محاسبية أو متطلبات الإبلاغ.&nbsp; ولتحديد فترة الاحتفاظ المناسبة للبيانات الشخصية، فإننا نراعي كمية وطبيعة وحساسية البيانات الشخصية، والخطر المحتمل للضرر الناجم عن الاستخدام غير المصرح به أو الكشف عن بياناتك الشخصية، والأغراض التي نعالج بياناتك الشخصية من أجلها، وما إذا كان بإمكاننا تحقيق تلك الأغراض من خلال وسائل أخرى والمتطلبات القانونية المعمول بها. 9-&nbsp; التدابير التقنية والتنظيمية و المعالجة الأمنية يتم تخزين جميع المعلومات التي نتلقاها عنك على خوادم آمنة ولدينا إجراءات أساسية مناسبة لحماية بياناتك الشخصية. يقوم موقع دلوني بتقييم الأمان بشكل مستمر على شبكته وكفاءة برنامج أمن المعلومات الداخلي المصمم من أجل (أ) المساعدة في تأمين بياناتك ضد الفقدان العرضي أو الوصول غير القانوني اليها أو الكشف غير القانوني عنها، (ب) تحديد المخاطر المتوقعة إلى حد معقول على أمن شبكة دلوني، (ج) تقليل المخاطر الأمنية إلى الحد الأدنى، بما في ذلك من خلال تقييم المخاطر والاختبارات المنتظمة. بالإضافة إلى ذلك، نضمن تشفير جميع بيانات الدفع باستخدام تقنية SSL (تكنولوجيا الوصلات المؤمنة).&nbsp; يرجى ملاحظة أنه على الرغم من التدابير التي قمنا بتنفيذها لحماية بياناتك، فإن عملية نقل البيانات عبر الإنترنت أو الشبكات المفتوحة الأخرى ليست آمنة تماماً وهناك خطر من إمكانية الوصول إلى بياناتك الشخصية من قبل أطراف ثالثة غير مصرح لها. &nbsp; 10-&nbsp; الاتصال&nbsp; للحصول على أي مزيد من المعلومات الإضافية أو لممارسة حقوقك، يرجى الاتصال بفريقنا على admin@deloony.com، أو الانتقال إلى قسم المساعدة على منصاتنا. &nbsp; 11-&nbsp; التغييرات في هذه السياسة قد نقوم بتحديث سياسة الخصوصية هذه أو ترقيتها أو تعديلها (جزئيا و \\/أو كلياً) من حين لآخر لإبقائها مواكبة للمتطلبات القانونية والطريقة التي ندير بها أعمالنا. يرجى مراجعة هذه الصفحة بانتظام للحصول على أحدث إصدار من سياسة الخصوصية. يشير استمرار استخدامك لخدماتنا بعد إجراء تعديل إلى قبولك أو موافقة ولي الأمر (حسب الحالة) على أي تغييرات. 12-&nbsp; قبول هذه السياسة&nbsp; أنت تقر بأنك قرأت هذه السياسة وتوافق على جميع أحكامها وشروطها. من خلال الوصول إليها واستخدام الأنظمة الأساسية والخدمات، فإنك توافق على الالتزام بهذه السياسة وبشروط الاستخدام. في حالة عدم الموافقة على الالتزام بشروط هذه السياسة وسياساتنا الأخرى، فأنك غير مخول بالوصول إلى واستخدام المنصة (المنصات) والخدمات. شاهد المزيد على<\\/span><\\/p>\"}', NULL, 8, 9, 1, NULL, NULL, 1, 0, 1, '2021-04-03 08:39:39', '2021-07-08 16:05:27'),
(3, NULL, 'standard', '{\"ar\":\"من نحن\"}', 'من نحن', '{\"ar\":\"من نحن\"}', 'app/page/2cf733779eed208df8283847d32bfac1.png', '{\"ar\":\"<p><span style=\\\"color: #444444; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; text-align: right; background-color: #ffffff;\\\">موقع دلوني&nbsp; هو واحد من أهم روّاد المواقع الإلكترونية المتخصصة في مجال الإعلانات المبوبة والتي تمكّن المستخدمين سواء كانوا بائعين أم مشترين من بيع وشراء مختلف السلع والمنتجات والخدمات خلال أقصر وقت ممكن وبأقل جهد يُذكر، وسواء كانت حالة تلك المنتجات جديدة أم مستعملة. وحتى يسهل على المستخدم إيجاد ما يبحث عنه أو الإعلان عمّا يريد بيعه يوجد أقسام رئيسية وفرعية لعرض وتصفّح مختلف أنواع السلع والخدمات المتداولة بينهم وإتاحة التواصل المباشر فيما بينهم بكل سهولة. :<\\/span><br style=\\\"margin: 0px; padding: 0px; box-sizing: border-box; color: #444444; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; text-align: right; background-color: #ffffff;\\\" \\/><br style=\\\"margin: 0px; padding: 0px; box-sizing: border-box; color: #444444; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; text-align: right; background-color: #ffffff;\\\" \\/><\\/p>\"}', NULL, 4, 5, 1, NULL, NULL, 0, 0, 1, '2021-04-03 08:39:39', '2021-07-06 16:34:43'),
(4, NULL, 'standard', '{}', 'faq', '{}', NULL, '{}', NULL, 2, 3, 1, NULL, NULL, 0, 0, 1, '2021-04-03 08:39:39', '2021-04-03 08:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `phone`, `token`, `created_at`, `updated_at`) VALUES
('mustsaidi@yahoo.com', '', '$2y$10$stuRNwtg0iRGAp35LobYA.L5uBcmuTWRI9/og/nMMemKVx8b3vjcS', '2021-06-13 07:52:45', NULL),
('Ayman.bassied321@gmail.com', '', '$2y$10$YvpYYA5hq1IcNnTtRQNLr.IyLe9h3AIm7LYLXi/CuIj6gqJWI1/hS', '2021-08-26 18:20:29', NULL),
('mhmdalbly689@gmail.com', '', '$2y$10$VFZRz5TrOmctuk/tIVyQS.vb/jnGm0lTLdYOz9peVugctpz0CpMt.', '2021-10-09 17:40:36', NULL),
('mhmdalbd689@gmail.com', '', '$2y$10$uNM90ME8y4ygHMFQ6551q.lyoicXN5rEYCceoE/DxoAUFsQDsaCqG', '2021-10-09 17:47:51', NULL),
('bdalrhmnaljwdt32@gmail.com', '', '$2y$10$InRK.mxi6LrwiMV.K4ONK.lJSyKcU1DzZnxBkxos80.MMPa.8/RXG', '2021-10-19 16:39:23', NULL),
('marketing@unitedtoys-eg.com', '', '$2y$10$H2ObQ5y4mrqTaHvsXKJA8.IYiaNeDI9NJOK8F.IJWViRN8Qrxs0Y.', '2021-11-02 10:51:07', NULL),
('mobawabat@unitedtoys-eg.com', '', '$2y$10$QFd4.kILhOc9Umyw40Is2ea9KPPoI6JOoO0rUieACQwJS9tA66hGS', '2021-11-04 11:23:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Transaction''s ID at the Provider',
  `amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `active` tinyint(1) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `post_id`, `package_id`, `payment_method_id`, `transaction_id`, `amount`, `active`, `created_at`, `updated_at`) VALUES
(49, 125, 5, 5, NULL, 1.00, 1, '2021-10-08 15:24:32', '2021-10-09 18:32:27'),
(52, 132, 5, 5, NULL, 1.00, 0, '2021-10-11 15:23:01', '2021-10-11 15:23:01'),
(53, 136, 5, 5, NULL, 1.00, 0, '2021-10-14 09:21:58', '2021-10-14 09:21:58'),
(54, 139, 5, 5, NULL, 1.00, 0, '2021-10-22 17:44:37', '2021-10-22 17:44:37'),
(55, 139, 5, 5, NULL, 1.00, 0, '2021-10-22 17:54:02', '2021-10-22 17:54:02'),
(62, 148, 5, 5, NULL, 1.00, 0, '2021-10-27 16:29:29', '2021-10-27 16:29:29'),
(63, 149, 5, 5, NULL, 1.00, 1, '2021-10-27 20:44:20', '2021-10-31 14:17:35'),
(64, 149, 5, 5, NULL, 1.00, 0, '2021-10-27 20:49:51', '2021-10-27 20:49:51'),
(65, 149, 5, 5, NULL, 1.00, 0, '2021-10-27 20:51:48', '2021-10-27 20:51:48'),
(66, 149, 5, 5, NULL, 1.00, 1, '2021-10-27 20:52:47', '2021-11-02 15:31:37'),
(67, 150, 5, 5, NULL, 1.00, 0, '2021-10-27 23:26:40', '2021-10-27 23:26:40'),
(68, 150, 5, 5, NULL, 1.00, 0, '2021-10-27 23:37:30', '2021-10-27 23:37:30'),
(69, 150, 5, 5, NULL, 1.00, 0, '2021-10-28 00:13:24', '2021-10-28 00:13:24'),
(70, 150, 5, 5, NULL, 1.00, 0, '2021-10-28 00:13:46', '2021-10-28 00:13:46'),
(71, 152, 5, 5, NULL, 1.00, 1, '2021-10-31 08:15:02', '2021-10-31 14:19:54'),
(72, 151, 5, 5, NULL, 1.00, 0, '2021-11-01 08:55:39', '2021-11-01 08:57:33'),
(73, 161, 5, 5, NULL, 1.00, 0, '2021-11-01 16:38:27', '2021-11-01 16:38:27'),
(74, 161, 5, 5, NULL, 1.00, 1, '2021-11-01 16:39:05', '2021-11-02 15:26:47'),
(75, 167, 5, 5, NULL, 1.00, 0, '2021-11-03 15:01:38', '2021-11-03 15:01:38'),
(76, 167, 5, 5, NULL, 1.00, 0, '2021-11-03 15:07:15', '2021-11-03 15:07:15'),
(77, 167, 5, 5, NULL, 1.00, 1, '2021-11-03 15:07:36', '2021-11-03 16:46:29'),
(78, 169, 5, 5, NULL, 1.00, 1, '2021-11-04 01:42:08', '2021-11-04 08:02:37'),
(80, 171, 1, 5, 'featured', 0.00, 1, '2021-11-07 16:10:26', '2021-11-07 16:10:26'),
(81, 171, 5, 5, NULL, 1.00, 1, '2021-11-07 16:10:35', '2021-11-07 18:47:44'),
(82, 180, 5, 5, NULL, 1.00, 1, '2021-11-14 22:28:44', '2021-11-17 16:59:11'),
(83, 180, 5, 5, NULL, 1.00, 1, '2021-11-14 22:29:17', '2021-11-17 19:22:55'),
(85, 195, 5, 5, NULL, 1.00, 1, '2021-11-20 19:21:53', '2021-11-20 19:36:57');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_ccbox` tinyint(1) UNSIGNED DEFAULT 0,
  `is_compatible_api` tinyint(1) DEFAULT 0,
  `countries` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Countries codes separated by comma.',
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT 0,
  `active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `display_name`, `description`, `has_ccbox`, `is_compatible_api`, `countries`, `lft`, `rgt`, `depth`, `parent_id`, `active`) VALUES
(1, 'paypal', 'PayPal', 'Payment with PayPal', 0, 0, NULL, 0, 0, 1, 0, 0),
(5, 'offlinepayment', 'حوالة بنكية او صرافة', NULL, 0, 1, 'ye', 5, 5, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'permission-list', 'web', '2021-04-03 08:39:44', '2021-04-03 08:39:44'),
(2, 'permission-create', 'web', '2021-04-03 08:39:44', '2021-04-03 08:39:44'),
(3, 'permission-update', 'web', '2021-04-03 08:39:44', '2021-04-03 08:39:44'),
(4, 'permission-delete', 'web', '2021-04-03 08:39:44', '2021-04-03 08:39:44'),
(5, 'role-list', 'web', '2021-04-03 08:39:44', '2021-04-03 08:39:44'),
(6, 'role-create', 'web', '2021-04-03 08:39:44', '2021-04-03 08:39:44'),
(7, 'role-update', 'web', '2021-04-03 08:39:44', '2021-04-03 08:39:44'),
(8, 'role-delete', 'web', '2021-04-03 08:39:44', '2021-04-03 08:39:44'),
(9, 'dashboard-access', 'web', '2021-04-03 08:39:44', '2021-04-03 08:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(1) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `post_id`, `filename`, `position`, `active`, `created_at`, `updated_at`) VALUES
(71, 66, 'files/ye/66/a7ba6aa6867042e8629bc2bb64c0afb0.jpg', 2, 1, '2021-07-25 14:58:16', '2021-07-25 14:58:16'),
(72, 66, 'files/ye/66/f57c2150f38dccce4e2e10a00e65cbdb.jpg', 3, 1, '2021-07-25 14:58:39', '2021-07-25 14:58:39'),
(131, 103, 'files/ye/103/23116ad609ddb949fb935b75761dc228.png', 1, 1, '2021-09-24 21:27:03', '2021-09-24 21:27:03'),
(132, 104, 'files/ye/104/46c6b7b6bc17df894d32f7303ac8712f.png', 1, 1, '2021-09-24 21:31:57', '2021-09-24 21:31:57'),
(133, 104, 'files/ye/104/14a7eaa28f30db707d34e8175829d649.png', 2, 1, '2021-09-24 21:31:57', '2021-09-24 21:31:57'),
(134, 105, 'files/ye/105/e971ff23b8020977730e358b9b2cdf43.jpg', 1, 1, '2021-09-24 21:43:55', '2021-09-24 21:43:55'),
(135, 105, 'files/ye/105/38a89f7720e68a87c0fbac31dd4aa2b7.jpg', 2, 1, '2021-09-24 21:43:55', '2021-09-24 21:43:55'),
(136, 105, 'files/ye/105/352b42ef8187d1d540d5fd442067c94b.jpg', 3, 1, '2021-09-24 21:43:56', '2021-09-24 21:43:56'),
(137, 105, 'files/ye/105/c0437e6bf564be8770746eb1e65a5ed9.jpg', 4, 1, '2021-09-24 21:46:19', '2021-09-24 21:46:19'),
(138, 105, 'files/ye/105/ea0d6c87d16bdeb4563eb0ce8ba32b13.jpg', 5, 1, '2021-09-24 21:46:20', '2021-09-24 21:46:20'),
(149, 114, 'files/ye/114/3d0b09aeae017edfe8391766736870e8.jpg', 2, 1, '2021-09-27 01:33:26', '2021-09-27 01:33:26'),
(151, 120, 'files/ye/120/a4308a4cd42d5b99c88293bdbca2cc55.jpg', 1, 1, '2021-10-04 13:28:49', '2021-10-04 13:28:49'),
(152, 120, 'files/ye/120/76c46b27182055e88ee6459b8d5a12fd.jpg', 2, 1, '2021-10-04 13:28:49', '2021-10-04 13:28:49'),
(153, 120, 'files/ye/120/d9e93737105189129ed601850421dfe7.jpg', 3, 1, '2021-10-04 13:28:49', '2021-10-04 13:28:49'),
(154, 120, 'files/ye/120/225d4209c7311f9abf9b0dce90a68811.jpg', 4, 1, '2021-10-04 13:28:49', '2021-10-04 13:28:49'),
(155, 121, 'files/ye/121/53de932546a7dc0a2fa0bc80430487b3.jpg', 1, 1, '2021-10-05 16:05:50', '2021-10-05 16:05:50'),
(157, 125, 'files/ye/125/7adce87e2c102276a933e6bf5b95c449.jpg', 1, 1, '2021-10-08 15:22:17', '2021-10-08 15:22:17'),
(158, 125, 'files/ye/125/1a351b35bcc3de56fc385e98cf182388.jpg', 2, 1, '2021-10-08 15:22:33', '2021-10-08 15:22:33'),
(159, 125, 'files/ye/125/c4a6210bf8d2a218dcc19057846d73a0.jpg', 3, 1, '2021-10-08 15:22:48', '2021-10-08 15:22:48'),
(160, 125, 'files/ye/125/73eff23c68e69498d7fd9297e16642dc.jpg', 4, 1, '2021-10-08 15:23:41', '2021-10-08 15:23:41'),
(161, 125, 'files/ye/125/39494af10fc12508e0838f1658a7458e.jpg', 5, 1, '2021-10-08 15:23:55', '2021-10-08 15:23:55'),
(162, 128, 'files/ye/128/613b38dbf2cf6656fcb45c38a942b18f.jpg', 1, 1, '2021-10-09 18:05:28', '2021-10-09 18:05:28'),
(163, 128, 'files/ye/128/74b6f015470e560dd3d4731b836ef867.jpg', 2, 1, '2021-10-09 18:05:49', '2021-10-09 18:05:49'),
(164, 128, 'files/ye/128/98cb975f82051e9095376e837c9fe0b1.jpg', 3, 1, '2021-10-09 18:06:07', '2021-10-09 18:06:07'),
(165, 128, 'files/ye/128/b1f011185225cd3b751ec8b47271a333.jpg', 4, 1, '2021-10-09 18:06:24', '2021-10-09 18:06:24'),
(166, 128, 'files/ye/128/64fadd16b9cc0fd376236b597f642003.jpg', 5, 1, '2021-10-09 18:06:40', '2021-10-09 18:06:40'),
(167, 130, 'files/ye/130/204bfe8d383094696738c7fc71c13840.jpg', 1, 1, '2021-10-10 13:25:02', '2021-10-10 13:25:02'),
(168, 130, 'files/ye/130/af85826b5fbb367a9f9ed260ac64f628.jpg', 2, 1, '2021-10-10 13:25:03', '2021-10-10 13:25:03'),
(169, 130, 'files/ye/130/0ee0286d4e793cc0f470800396ef7f61.jpg', 3, 1, '2021-10-10 13:25:03', '2021-10-10 13:25:03'),
(170, 130, 'files/ye/130/d3e60e2061234a8970c6e3e8f44820fe.jpg', 4, 1, '2021-10-10 13:25:03', '2021-10-10 13:25:03'),
(171, 132, 'files/ye/132/f39e50070b3b29199107a2b2c70aba5f.jpg', 1, 1, '2021-10-11 15:21:23', '2021-10-11 15:21:23'),
(172, 133, 'files/ye/133/812399ece9a3bd7bbe8bcb3c3aceaa8e.jpg', 1, 1, '2021-10-11 15:40:27', '2021-10-11 15:40:27'),
(173, 134, 'files/ye/134/82dff743e4a42e83eff6d7e1a78bbf99.jpg', 1, 1, '2021-10-11 15:47:55', '2021-10-11 15:47:55'),
(174, 135, 'files/ye/135/5b475aac26b23efdbe4c75301acb63b0.jpg', 1, 1, '2021-10-11 16:34:23', '2021-10-11 16:34:23'),
(175, 135, 'files/ye/135/b0e871a412a2170bc51d6c14b048bfdb.jpg', 2, 1, '2021-10-11 16:34:23', '2021-10-11 16:34:23'),
(176, 135, 'files/ye/135/a245b39a6f549185eeeaf500b97b5a33.jpg', 3, 1, '2021-10-11 16:34:24', '2021-10-11 16:34:24'),
(177, 135, 'files/ye/135/1a8d6bca70dae125f38202bc860732a9.jpg', 4, 1, '2021-10-11 16:34:24', '2021-10-11 16:34:24'),
(178, 136, 'files/ye/136/238e7a573d75d40019f35161e05bd697.jpg', 1, 1, '2021-10-14 09:21:03', '2021-10-14 09:21:03'),
(179, 138, 'files/ye/138/9ee73f5876462d05b17286dd6dcc9d49.jpg', 1, 1, '2021-10-19 16:52:58', '2021-10-19 16:52:58'),
(180, 138, 'files/ye/138/e85a679da7ee67011cf050d0b6370f93.jpg', 2, 1, '2021-10-19 16:53:08', '2021-10-19 16:53:08'),
(181, 138, 'files/ye/138/93b969d53b9a30b2050d61b7a6eb153a.jpg', 3, 1, '2021-10-19 16:53:18', '2021-10-19 16:53:18'),
(183, 139, 'files/ye/139/0cc4d9edd858fb59f568713d9049ee42.jpg', 2, 1, '2021-10-22 17:35:55', '2021-10-22 17:35:55'),
(184, 139, 'files/ye/139/d7605d649a6673bbab70de13486cf238.jpg', 3, 1, '2021-10-22 17:39:31', '2021-10-22 17:39:31'),
(186, 139, 'files/ye/139/36399aea5590db94280aa576dce07b26.jpg', 4, 1, '2021-10-22 17:40:36', '2021-10-22 17:40:36'),
(188, 139, 'files/ye/139/1bb749d1a3c2827400a2e6e587f43274.jpg', 5, 1, '2021-10-22 17:43:08', '2021-10-22 17:43:08'),
(189, 139, 'files/ye/139/47f0b391eea8471926a87bb3ea980617.jpg', 6, 1, '2021-10-22 17:43:27', '2021-10-22 17:43:27'),
(195, 141, 'files/ye/141/b38db6fef676264c1a45bc24bd888cfb.jpg', 1, 1, '2021-10-23 09:17:37', '2021-10-23 09:17:37'),
(196, 141, 'files/ye/141/943f619ae3d80ac9c470cdee12df9fc6.jpg', 2, 1, '2021-10-23 09:18:03', '2021-10-23 09:18:03'),
(197, 141, 'files/ye/141/9f1f74618e556fd1b2af2c158e80a47c.jpg', 3, 1, '2021-10-23 09:18:15', '2021-10-23 09:18:15'),
(198, 141, 'files/ye/141/8796ae1280f8d64df7ee93f58e8063bf.jpg', 4, 1, '2021-10-23 09:18:27', '2021-10-23 09:18:27'),
(199, 141, 'files/ye/141/4bbcb4221e74ca6ee744c67fb2f75d1e.jpg', 5, 1, '2021-10-23 09:18:58', '2021-10-23 09:18:58'),
(214, 148, 'files/ye/148/dd359d10578125211ef7f30870f4a369.jpg', 2, 1, '2021-10-27 16:17:23', '2021-10-27 16:17:23'),
(216, 148, 'files/ye/148/a815dc30fd7dad006f2021be2ac134e1.jpg', 4, 1, '2021-10-27 16:25:51', '2021-10-27 16:25:51'),
(224, 149, 'files/ye/149/51389f1aa5755c8ff925b78c246a75f4.jpg', 1, 1, '2021-10-27 20:42:17', '2021-10-27 20:42:17'),
(226, 149, 'files/ye/149/545fbf18a57e13379245095119e9598d.jpg', 2, 1, '2021-10-27 20:43:26', '2021-10-27 20:43:26'),
(227, 149, 'files/ye/149/152660a7e0bbc7ae5a1285727c468860.jpg', 3, 1, '2021-10-27 20:43:45', '2021-10-27 20:43:45'),
(228, 149, 'files/ye/149/2f47cb9b871ca06ce5652481d7f1149b.jpg', 4, 1, '2021-10-27 20:44:07', '2021-10-27 20:44:07'),
(231, 150, 'files/ye/150/936239d0f30c2a4af72ac3ed1cf1aa86.jpg', 2, 1, '2021-10-27 23:24:08', '2021-10-27 23:24:08'),
(235, 151, 'files/ye/151/805a5ebed2511a07b817013a8e8373e0.jpg', 1, 1, '2021-10-30 14:36:51', '2021-10-30 14:36:51'),
(236, 152, 'files/ye/152/f7b9d7233e162c8ae13dda0e20ae0a40.jpg', 1, 1, '2021-10-31 08:13:38', '2021-10-31 08:13:38'),
(237, 152, 'files/ye/152/1d9429b41a83347d1488fbaa4c71ea4b.jpg', 2, 1, '2021-10-31 08:13:55', '2021-10-31 08:13:55'),
(238, 152, 'files/ye/152/76ec1c942777dcc67fc611f4b8996962.jpg', 3, 1, '2021-10-31 08:14:07', '2021-10-31 08:14:07'),
(239, 152, 'files/ye/152/46dda5967715408604846eb344aa247b.jpg', 4, 1, '2021-10-31 08:14:27', '2021-10-31 08:14:27'),
(240, 153, 'files/ye/153/a35607738bf222d9fdd89a27e974f613.jpg', 1, 1, '2021-10-31 10:59:35', '2021-10-31 10:59:35'),
(241, 154, 'files/ye/154/8de873d62503ae76b3c970431c81650a.jpg', 1, 1, '2021-11-01 15:35:50', '2021-11-01 15:35:50'),
(242, 154, 'files/ye/154/46d88b64110ab8fa065a7d1ffc11a502.jpg', 2, 1, '2021-11-01 15:36:16', '2021-11-01 15:36:16'),
(255, 161, 'files/ye/161/3b4945ded838b280e48a969c96d32946.jpg', 2, 1, '2021-11-01 16:31:47', '2021-11-01 16:31:47'),
(256, 161, 'files/ye/161/dcd0ec47fba8ddea854a9b852667a1cc.jpg', 3, 1, '2021-11-01 16:32:34', '2021-11-01 16:32:34'),
(262, 161, 'files/ye/161/ee3faa8b25750dac5fe6ed147de72836.jpg', 4, 1, '2021-11-01 16:33:37', '2021-11-01 16:33:37'),
(263, 161, 'files/ye/161/f6bfc3742f5949a7474fa0ab401b909b.jpg', 5, 1, '2021-11-01 16:34:09', '2021-11-01 16:34:09'),
(265, 161, 'files/ye/161/94b28e598fd5e5054e5bd80633847287.jpg', 6, 1, '2021-11-01 16:34:40', '2021-11-01 16:34:40'),
(266, 155, 'files/ye/155/8196902c18b344f7447c785ef6beb0f7.jpg', 1, 1, '2021-11-01 17:12:20', '2021-11-01 17:12:20'),
(271, 155, 'files/ye/155/0b146cdabffbf31857f3ae9419b3e800.jpg', 2, 1, '2021-11-01 17:16:25', '2021-11-01 17:16:25'),
(272, 155, 'files/ye/155/4731769cf5a68653d9e29cd36aebc16d.jpg', 3, 1, '2021-11-01 17:23:44', '2021-11-01 17:23:44'),
(273, 155, 'files/ye/155/3999d5bafa71082622e93dbc11a8ef90.jpg', 4, 1, '2021-11-01 17:55:31', '2021-11-01 17:55:31'),
(274, 165, 'files/ye/165/5523a726fdd39f41808ebcaf650ecf2a.jpg', 1, 1, '2021-11-02 10:54:32', '2021-11-02 10:54:32'),
(275, 165, 'files/ye/165/8bb44677593dc535a5e94cd095384c90.jpg', 2, 1, '2021-11-02 10:54:32', '2021-11-02 10:54:32'),
(276, 165, 'files/ye/165/02f1258956156b3d9f6778f7484ce9b9.jpg', 3, 1, '2021-11-02 10:54:32', '2021-11-02 10:54:32'),
(285, 167, 'files/ye/167/81a7872e3ce504808dd20e00d20f06ff.jpg', 1, 1, '2021-11-03 14:51:09', '2021-11-03 14:51:09'),
(286, 167, 'files/ye/167/289878d45461c85b0a942bd24971f935.jpg', 2, 1, '2021-11-03 14:51:49', '2021-11-03 14:51:49'),
(287, 167, 'files/ye/167/e4a84df590e8d32f3562104d89c8a107.jpg', 3, 1, '2021-11-03 14:52:20', '2021-11-03 14:52:20'),
(288, 167, 'files/ye/167/a0370fc82604e19081a05ce0e65cc2a1.jpg', 4, 1, '2021-11-03 14:52:30', '2021-11-03 14:52:30'),
(289, 167, 'files/ye/167/210b7391025c81f0463fc2c1b2fbc8e9.jpg', 5, 1, '2021-11-03 14:53:46', '2021-11-03 14:53:46'),
(290, 168, 'files/ye/168/03765ffcb305db6a13745fc5484422f8.jpg', 1, 1, '2021-11-03 17:34:08', '2021-11-03 17:34:08'),
(291, 169, 'files/ye/169/34ae8b2940e0b15b8dd7a7af712d93b3.jpg', 1, 1, '2021-11-04 01:41:43', '2021-11-04 01:41:43'),
(292, 170, 'files/ye/170/7285cdf5ffa11f9db919a694cd5a55f4.jpg', 1, 1, '2021-11-04 11:29:12', '2021-11-04 11:29:12'),
(293, 170, 'files/ye/170/7837d6a677c6273d6e5e690aa11f8755.jpg', 2, 1, '2021-11-04 11:29:12', '2021-11-04 11:29:12'),
(294, 170, 'files/ye/170/65d2b1db2a3ccfbfa93448704a67b71e.jpg', 3, 1, '2021-11-04 11:29:12', '2021-11-04 11:29:12'),
(307, 171, 'files/ye/171/f91dfdbd5a2e9dda805f9ed9cdc8ea38.jpg', 1, 1, '2021-11-07 16:02:37', '2021-11-07 16:02:37'),
(308, 171, 'files/ye/171/8134bd52247c47b6ee2dcc4e71a42a8f.jpg', 2, 1, '2021-11-07 16:03:46', '2021-11-07 16:03:46'),
(309, 171, 'files/ye/171/f52f2e8b299e20af3653d32128d8c262.jpg', 3, 1, '2021-11-07 16:04:19', '2021-11-07 16:04:19'),
(311, 171, 'files/ye/171/349a99b7c14ef6dcad7d93dd4876d244.jpg', 4, 1, '2021-11-07 16:05:37', '2021-11-07 16:05:37'),
(312, 171, 'files/ye/171/a1b0d7e51bbcf87eb2ba62cd9f08b5c1.jpg', 5, 1, '2021-11-07 16:06:28', '2021-11-07 16:06:28'),
(313, 172, 'files/ye/172/007f0e1e14f4905c297d5347e67af297.jpg', 1, 1, '2021-11-08 09:19:07', '2021-11-08 09:19:07'),
(314, 173, 'files/ye/173/bde81cb055abc955ea66be2df2e57614.jpg', 1, 1, '2021-11-09 09:20:46', '2021-11-09 09:20:46'),
(315, 174, 'files/ye/174/90d300b9f713c1c3dadf25046e15fe1b.jpg', 1, 1, '2021-11-09 15:10:15', '2021-11-09 15:10:15'),
(316, 174, 'files/ye/174/134a6d81a1442bb7338328b721b6ffde.jpg', 2, 1, '2021-11-09 15:10:15', '2021-11-09 15:10:15'),
(317, 174, 'files/ye/174/c0f001ff2297bf4d0b3a75808f096c1f.jpg', 3, 1, '2021-11-09 15:10:16', '2021-11-09 15:10:16'),
(318, 174, 'files/ye/174/d4bb75baa5b88b23b73fba9529449868.jpg', 4, 1, '2021-11-09 15:10:16', '2021-11-09 15:10:16'),
(319, 175, 'files/ye/175/dc186aca0358a8b3cba5ab70ade3b74f.jpeg', 1, 1, '2021-11-10 14:29:19', '2021-11-10 14:29:19'),
(320, 175, 'files/ye/175/17bfb2c3d077eb0b0776004462b6c8f8.jpeg', 2, 1, '2021-11-10 14:29:24', '2021-11-10 14:29:24'),
(321, 175, 'files/ye/175/df3f44b66fbd2a8489ba4b524e0df5f6.jpeg', 3, 1, '2021-11-10 14:29:29', '2021-11-10 14:29:29'),
(322, 176, 'files/ye/176/0a50b202390342782c578340f3b5e941.jpg', 1, 1, '2021-11-11 12:00:07', '2021-11-11 12:00:07'),
(323, 176, 'files/ye/176/bc0dd81ca8307050bfccfe74dbbae13c.jpg', 2, 1, '2021-11-11 12:00:08', '2021-11-11 12:00:08'),
(324, 176, 'files/ye/176/ec1bdbed37bef39b976137f4c963ee62.jpg', 3, 1, '2021-11-11 12:00:08', '2021-11-11 12:00:08'),
(325, 176, 'files/ye/176/9068e6bec7bc3547dfa11dd4819cfd82.jpg', 4, 1, '2021-11-11 12:00:08', '2021-11-11 12:00:08'),
(326, 177, 'files/ye/177/2bb933c1e1bf11ebf0d03cb90f66def2.jpeg', 1, 1, '2021-11-13 08:31:12', '2021-11-13 08:31:12'),
(327, 179, 'files/ye/179/c7ce1b1e43cc51946db7c2fabe8a7534.jpeg', 1, 1, '2021-11-14 10:58:41', '2021-11-14 10:58:41'),
(332, 183, 'files/ye/183/6252015ec19258ea296fe5ee5b5b3573.jpg', 1, 1, '2021-11-15 17:31:55', '2021-11-15 17:31:55'),
(333, 183, 'files/ye/183/5e99b4a3474eab72b05f34b6626d891f.jpg', 2, 1, '2021-11-15 17:32:11', '2021-11-15 17:32:11'),
(334, 183, 'files/ye/183/ee58def53a1856c078445c89ee45d9be.jpg', 3, 1, '2021-11-15 17:32:31', '2021-11-15 17:32:31'),
(335, 183, 'files/ye/183/58707a18edc0c86a38943f51b20a4cc4.jpg', 4, 1, '2021-11-15 17:32:46', '2021-11-15 17:32:46'),
(336, 183, 'files/ye/183/2c78a26aa0387dcfe2f6b9b3268f656c.jpg', 5, 1, '2021-11-15 17:33:06', '2021-11-15 17:33:06'),
(337, 180, 'files/ye/180/6aec57987a84eaf7b961dd3a17ae5678.jpg', 4, 1, '2021-11-15 20:49:46', '2021-11-15 20:49:46'),
(339, 180, 'files/ye/180/7e9166de4f3afb54733733d391b6d274.jpg', 5, 1, '2021-11-15 20:51:22', '2021-11-15 20:51:22'),
(340, 180, 'files/ye/180/ac8eb1368a9bfd35b15976c0252711c0.jpg', 6, 1, '2021-11-15 20:52:00', '2021-11-15 20:52:00'),
(341, 180, 'files/ye/180/bcc8845c4dec6b15b9b8d609fc88f33c.jpg', 7, 1, '2021-11-15 20:52:44', '2021-11-15 20:52:44'),
(342, 184, 'files/ye/184/ce8dff72f11f166d51ad2355cc405e10.jpeg', 1, 1, '2021-11-16 08:49:15', '2021-11-16 08:49:15'),
(343, 185, 'files/ye/185/22be49a5b2a62d5fd7ae44e4510f2672.jpg', 1, 1, '2021-11-16 11:31:48', '2021-11-16 11:31:48'),
(344, 185, 'files/ye/185/43a7ce223513f0e10ff7efef4bd69464.jpg', 2, 1, '2021-11-16 11:31:48', '2021-11-16 11:31:48'),
(345, 185, 'files/ye/185/2621a109f09aabda025b77fd9aa1ec26.jpg', 3, 1, '2021-11-16 11:31:48', '2021-11-16 11:31:48'),
(346, 186, 'files/ye/186/1481a2c84dc485511a292210a77854b5.jpg', 1, 1, '2021-11-17 11:02:37', '2021-11-17 11:02:37'),
(347, 187, 'files/ye/187/68788a910d24344359acfcad9010f4a8.jpg', 1, 1, '2021-11-17 15:16:40', '2021-11-17 15:16:40'),
(348, 187, 'files/ye/187/2646e76a886c7d64d3c834501b50fd85.jpg', 2, 1, '2021-11-17 15:16:40', '2021-11-17 15:16:40'),
(349, 187, 'files/ye/187/990f1a214bb058199ce84cd9ba97b51f.jpg', 3, 1, '2021-11-17 15:16:40', '2021-11-17 15:16:40'),
(350, 187, 'files/ye/187/c503d9d85d16518fc338b99be0dbc1ac.jpg', 4, 1, '2021-11-17 15:16:41', '2021-11-17 15:16:41'),
(351, 190, 'files/ye/190/fced85df92f5720770040e843abdb221.jpg', 1, 1, '2021-11-18 13:26:57', '2021-11-18 13:26:57'),
(352, 190, 'files/ye/190/17f3e9f03361756310afbd49e5475729.jpg', 2, 1, '2021-11-18 13:26:57', '2021-11-18 13:26:57'),
(353, 190, 'files/ye/190/c8198c6a8eea863f93a16c0826f11341.jpg', 3, 1, '2021-11-18 13:26:58', '2021-11-18 13:26:58'),
(354, 191, 'files/ye/191/b095a9ae99002b7c51cc59af191b44c8.jpg', 1, 1, '2021-11-20 08:44:55', '2021-11-20 08:44:55'),
(355, 191, 'files/ye/191/60f3cd888fd6fc8c04521bb538c2952c.jpg', 2, 1, '2021-11-20 08:45:10', '2021-11-20 08:45:10'),
(356, 191, 'files/ye/191/0601c2668fbf65eb630d126988d2103f.jpg', 3, 1, '2021-11-20 08:45:35', '2021-11-20 08:45:35'),
(357, 191, 'files/ye/191/3060d6238153528e151c356d0c013cfc.jpg', 4, 1, '2021-11-20 08:45:54', '2021-11-20 08:45:54'),
(358, 191, 'files/ye/191/bfa25da5763c140bc84388761b7e52d4.jpg', 5, 1, '2021-11-20 08:46:34', '2021-11-20 08:46:34'),
(359, 195, 'files/ye/195/0b02fb14f761c3a3c908de03089af2f5.jpg', 1, 1, '2021-11-20 19:20:50', '2021-11-20 19:20:50'),
(360, 195, 'files/ye/195/546f11fc8f3553a0997262488131fb98.jpg', 2, 1, '2021-11-20 19:21:18', '2021-11-20 19:21:18'),
(361, 195, 'files/ye/195/2d507065fc78e61ff506ae989af886fb.jpg', 3, 1, '2021-11-20 19:21:18', '2021-11-20 19:21:18'),
(362, 195, 'files/ye/195/e11ee3e2e2e67054766564828e3c2080.jpg', 4, 1, '2021-11-20 19:21:18', '2021-11-20 19:21:18'),
(363, 195, 'files/ye/195/d8fe54e47690e84b602671e60c463f9d.jpg', 5, 1, '2021-11-20 19:21:18', '2021-11-20 19:21:18'),
(364, 197, 'files/ye/197/27fc732fe545cc4e25004c7d3600aeb9.jpg', 1, 1, '2021-11-20 21:15:40', '2021-11-20 21:15:40'),
(365, 196, 'files/ye/196/ab643bb3200f6b92c1f1f0d9860e97d9.jpg', 1, 1, '2021-11-20 21:37:42', '2021-11-20 21:37:42'),
(366, 178, 'files/ye/178/d0eb9317eb2083254b7809499629f150.png', 1, 1, '2021-11-21 07:08:10', '2021-11-21 07:08:10'),
(367, 188, 'files/ye/188/7513f93ceb19e66dcef0f01049977260.png', 1, 1, '2021-11-21 07:09:51', '2021-11-21 07:09:51'),
(368, 193, 'files/ye/193/22d5f8794c342d97e0197fe1f8a61602.png', 1, 1, '2021-11-21 07:11:30', '2021-11-21 07:11:30'),
(369, 198, 'files/ye/198/288b448527b0a0586259ee50297efbc3.jpg', 1, 1, '2021-11-21 10:59:11', '2021-11-21 10:59:11'),
(370, 198, 'files/ye/198/baee0d6476755ec215964d6e2b7ebea3.jpg', 2, 1, '2021-11-21 10:59:11', '2021-11-21 10:59:11'),
(371, 198, 'files/ye/198/f34f7d16ee0d58512c8a6e2c8ae5b12e.jpg', 3, 1, '2021-11-21 10:59:11', '2021-11-21 10:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `post_type_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `negotiable` tinyint(1) DEFAULT 0,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) DEFAULT 0,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coin_id` int(3) NOT NULL,
  `lon` double(8,2) DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `lat` double(8,2) DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `ip_addr` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visits` int(10) UNSIGNED DEFAULT 0,
  `email_token` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tmp_token` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT 0,
  `verified_phone` tinyint(1) UNSIGNED DEFAULT 1,
  `accept_terms` tinyint(1) DEFAULT 0,
  `accept_marketing_offers` tinyint(1) DEFAULT 0,
  `is_permanent` tinyint(1) DEFAULT 0,
  `reviewed` tinyint(1) DEFAULT 0,
  `featured` tinyint(1) UNSIGNED DEFAULT 0,
  `archived` tinyint(1) DEFAULT 0,
  `archived_at` timestamp NULL DEFAULT NULL,
  `archived_manually` tinyint(1) UNSIGNED DEFAULT 0,
  `deletion_mail_sent_at` timestamp NULL DEFAULT NULL,
  `fb_profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partner` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `country_code`, `user_id`, `category_id`, `post_type_id`, `title`, `description`, `tags`, `price`, `negotiable`, `contact_name`, `email`, `phone`, `phone_hidden`, `address`, `city_id`, `coin_id`, `lon`, `lat`, `ip_addr`, `visits`, `email_token`, `phone_token`, `tmp_token`, `verified_email`, `verified_phone`, `accept_terms`, `accept_marketing_offers`, `is_permanent`, `reviewed`, `featured`, `archived`, `archived_at`, `archived_manually`, `deletion_mail_sent_at`, `fb_profile`, `partner`, `deleted_at`, `created_at`, `updated_at`) VALUES
(66, 'YE', 33, 223, 2, 'ابو نبراس للأسلحه', '<p>يوجد لدينا جميع انواع الاسلحه الخفيفه وبأسعار مغريه</p>\r\n<p>للأستفسار يرجى الاتصال على الارقام التاليه :</p>\r\n<p>سبأفون 717445552</p>\r\n<p>يمن موبايل 773288126</p>\r\n<p>سلاح للبيع_اسلحه للبيع_مسدس للبيع_بندق للبيع&nbsp;</p>', 'اسلحه,مسدس,بندق,الي,جيفري,روسي,صيني,تركي,سلاح,للبيع', '0', 0, 'ابو نبراس للأسلحه', 'nebrasabo5@gmail.com', '+967775110030', 0, NULL, 6, 0, 44.21, 15.35, '188.240.99.110', 62, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-07-25 14:52:53', '2021-11-05 19:02:25'),
(97, 'YE', 37, 189, 2, 'التركي لأرقى الملابس الرجالية', '<p>ارقى انواع الاقمشة التركية والبريطانية&nbsp;</p>', 'ملابس,رجالي,تركي,بريطاني,اقمشة', '0', 0, 'جمال التركي', 'alturki24@yahoo.com', '+10013137725057', 0, NULL, 29, 0, 45.04, 12.78, '68.40.173.68', 11, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-09-23 19:54:19', '2021-11-02 14:53:10'),
(103, 'YE', 36, 207, 1, 'خدمات عامة وخاصة وتجارية', '<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\">في صنعاء كل ذلك وأكثر.. خدمات عامة وخاصة وتجارية شاهد المزيد على: https://ye.opensooq.com/ar/post/update/158731567 هل ضجرت من البحث عن عقار في صنعاء وتريد من يكفيك هم البحث عنه وهم السماسرة الذين قد لا يفهمون مُرادك؟ Are you tired of searching for a residence in Sana&rsquo;a, and you want someone who is sufficient for you to find it, and for brokers who may not understand what you target? هل لديك محتوىً تريد صياغته أو تعديله بإحتراف؟ Do you have a content you would to draft or edit professionally? هل لديك مواضيع مراسلات تريد إنشاءها بصياغات في منتهى الدقة لإقامة الحُجة؟ Do you have correspondence topics you would to create with absolutely correct to establish argument? هل لديك بحثٌ لم تتمكن منه ولم تتفرغ له؟ Do you have a research you were unable to conduct or you couldn\'t devote yourself to? هل تعتقد أن سيرتك الذاتية بحاجة إلى بعض المراجعة وإدخال بعض اللمسات عليها؟ Do you think your resume needs some review and some touches on it? هل انت بحاجة إلى طباعة سريعة وتنسيقات قشيبة؟ Do you need fast typing &amp; creative formats? هل أنت بحاجة إلى تدريب خاص أو دورة خاصة؟ Do you need a special training or a special course? هل لديك من هو بحاجة إلى مُرافق خاص تأمنه عليه ويسهر على راحته ذكراً كان أم أنثى، سياحةً كانت أم تطبيب؟ Do you have someone who needs a special escort to secure him and watch over his comfort, whether male or female, tourism or medical treatment? هل تريد جهة إشرافية لمتابعة إنشاءاتك وعقاراتك؟ Do you want a supervisory body to follow up on your construction and real estate? هل تبحث عن أفضل مكان للتطبيب وبأقل التكاليف؟ Are you looking for the best place for medical treatment at the lowest cost? هل تبحث عن من يكفيك هم المتابعات ويُخلص لك الإجراءات اللازمة؟ Are you looking for someone who is sufficient for you to follow up and concludes necessary measures? هل تريد شخصاً إعتبارياً ينوب عنك في صنعاء وفي بعض المحافظات؟ Do you want a legal person to represent you in Sana&rsquo;a and in some other governorates? هل تريد لأوراقك الثبوتية ومستنداتك الأصلية التعميد والمُصادقة؟ Do you want your identity papers and original documents to be legalized and certified? هل لديك قطع غيار وتبحث عن من ينوبك في شرائها وإرسالها؟ Do you have spare parts and are looking for someone to buy and send them for you? هل تبحث عن وظيفة أم عن موظفين؟ Are you looking for a job or looking for employees? هل انت خارج الوطن وتبحث عن من يربطك بداخله لأي سبب كان؟ Are you abroad and looking for someone who ties you inside for any reason? هل أنت بحاجة إلى دهانين مهرة ومُبلطين مُحترفين ولديهم نماذج من أعمالهم في مناطق شتى من العاصمة صنعاء؟ Do you need skilled painters &amp; tilers who have sample works in various areas of the capital, Sana\'a? هل لديك كياناً تجارياً وتريد أن تؤصل للوائحه وقوانينه؟ Do you have a commercial entity and want to establish its regulations and rules? E.MAIL: omaryahyaomar@gmail.com TEL: +967-1-478363 Mobile: +967-772306230</span><br /><br /><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\">شاهد المزيد على: https://ye.opensooq.com/ar/post/update/158731567</span></p>', NULL, NULL, 0, 'عمر يحيى عمر الدُمامي', 'omaryahyaomar@gmail.com', '+967772306230', 0, NULL, 6, 0, 44.21, 15.35, '63.168.169.109', 10, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 1, NULL, 0, NULL, NULL, NULL, NULL, '2021-09-24 21:26:42', '2021-11-02 08:45:04'),
(104, 'YE', 36, 196, 1, 'توصيل طلاب/طالبات/أشخاص/عائلات/موظفين/عمال..الخ', '<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\">لدينا سيارة فوكسي 2009 بحالة ممتازة ولدينا الإستعداد في توصيل طلاب/طالبات/أشخاص/عائلات/موظفين/عمال.. الخ </span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\">بتعاقد شهري/اسبوعي/ يومي..الخ </span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\">776 529 974</span></p>\r\n<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\"> ياسر داوود</span></p>\r\n<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\"> 776 168 740⁩</span></p>\r\n<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\">أمجد داوود</span></p>', NULL, NULL, 0, 'عمر يحيى عمر الدُمامي', 'omaryahyaomar@gmail.com', '+967772306230', 0, NULL, 6, 0, 44.21, 15.35, '63.168.169.109', 12, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-09-24 21:31:30', '2021-11-14 21:38:00'),
(105, 'YE', 36, 206, 1, 'دهانات عادية وديكورية', '<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\">هل أنت بحاجة إلى دهانين مهرة ومُبلطين مُحترفين ولديهم نماذج من أعمالهم في مناطق شتى من العاصمة صنعاء؟</span></p>\r\n<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\"> Do you need skilled painters &amp; tilers who have sample works in various areas of the capital, Sana\'a? </span></p>\r\n<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\">للتواصل: </span></p>\r\n<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\">777236991</span></p>\r\n<p><span style=\"font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; background-color: #ffffff;\"> 772306230</span></p>', NULL, NULL, 0, 'عمر يحيى عمر الدُمامي', 'omaryahyaomar@gmail.com', '+967772306230', 0, NULL, 6, 0, 44.21, 15.35, '63.168.169.109', 11, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-09-24 21:34:52', '2021-11-10 17:09:30'),
(114, 'YE', 41, 172, 2, 'مبنى للبيع', '<p><em><strong>في 👈الحوبان تعز </strong></em></p>\r\n<p><em><strong>على شارع👈 ١٦ قريب من الشارع العام</strong></em></p>\r\n<p><em><strong>عدد القصب👈 8 قصب</strong></em></p>\r\n<p><em><strong>&nbsp; مكون👈من دورين&nbsp;</strong></em></p>\r\n<p><em><strong>كل دور👈خمس غرف وحمامين ومطبخ</strong></em></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', 'للتواصل,والاستفسار', '40000000', 1, 'HAMDI KHALID SAIF', 'hamdikhalid43@gmail.com', '+967774253506', 0, NULL, 4, 0, 44.02, 13.58, '185.80.141.127', 33, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-09-27 01:28:53', '2021-11-19 07:47:20'),
(115, 'YE', 42, 144, 1, 'للبيع بلياردو +جيم مستعمل.اليمن  صنعاء .مديرية آزال', '<p>للبيع بلياردو +جيم مستعمل&nbsp;</p>', 'جيم-بلياردو', '100000', 0, 'شمسان', 'amjan268@gmail.com', '+967773788555', 0, NULL, 6, 0, 44.21, 15.35, '185.80.140.151', 33, NULL, NULL, '49c71fb51fe212bba7c687f106e64212', 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-09-28 16:22:08', '2021-11-19 04:08:31'),
(120, 'YE', 26, 222, 1, 'سياره سوناتا زيرووووو للبيع', '<p>سياره سوناتا&nbsp; للبيع زيرووووو اصفار ماشيه 16 ميل امريكي مجمرك مرقم مرتين السعر 13000 دولار امريكي قابل للتفاوض بالمعقول المشتري جاد يتواصل على الارقام التاليه :</p>\r\n<p>777744603</p>\r\n<p>770792111</p>\r\n<p>( SONATA )</p>', 'سياره,للبيع,هيواندي,سوناتا,زيرووووو,هيوندا,سيارة,هيونداى', '13000', 1, 'عبد الكريم الماخذي', 'abood345w@gmail.com', '+967777744603', 0, NULL, 6, 2, 44.21, 15.35, '109.200.181.117', 20, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-04 13:28:02', '2021-11-10 06:09:11'),
(121, 'YE', 26, 222, 2, 'معرض التوفيق لجميع انواع السيارات الفخمه', '<p>معرض التوفيق لبيع وشراء جميع انواع السيارات 2020 &amp; 2021 متواجد كل انواع السيارات : سيارات جديده زيروووو + سيارات مستعمل نظيف&nbsp;</p>\r\n<p>للتواصل على الارقام التالية:&nbsp;</p>\r\n<p>770792111</p>\r\n<p>777744603&nbsp;</p>', 'تويوتا_هيوندا_كيا_لكسزز_صالون_مونيكا_مرسيدس_هايلوكس_باص,حبه_شاص_طقم', '0', 1, 'عبد الكريم الماخذي', 'abood345w@gmail.com', '+967777744603', 0, NULL, 6, 2, 44.21, 15.35, '134.35.179.211', 24, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-05 16:02:31', '2021-11-14 19:58:50'),
(125, 'YE', 45, 237, 2, 'ساعات يدوية ابو خالد', '<p>ساعة رولكس طبق الوكالة رجالي ونسائي ضد الماء ضمان صيانه من الماء ولبطارية ضمان صيانة فقط لا غير سعر الحبه دولار 17،</p>\r\n<p>ساعة اديدا سراميك رجالي ضد الماء رجالي ونسائي ضمانه صيانةمن الماء ولبطارية سعر الحبه جمله 8 دولار.</p>', 'ساعات,يد,رجالي,نسائي,ماركات,رولكس,يدوية,ساعه,يدويه', '8', 0, 'ابو خالد لساعات اليدوية', 'abukhaleddwyt4@gmail.com', '+967773701975', 0, NULL, 29, 2, 45.04, 12.78, '46.161.255.131', 41, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-08 15:20:49', '2021-11-07 17:55:44'),
(128, 'YE', 48, 243, 2, 'استراحة الاحبة', '<p><span style=\"color: #e03e2d;\">*استراحة الاحبة*</span></p>\r\n<p><span style=\"color: #e03e2d;\">الاستراحة مصممه لجميع افراد الاسره ولجميع الاعمار</span></p>\r\n<p><span style=\"color: #e03e2d;\">&nbsp;</span></p>\r\n<p><span style=\"color: #e03e2d;\">الاستراحة عبارة عن :</span></p>\r\n<p><span style=\"color: #e03e2d;\">موقف سيارات ويتسع لعدد 2 سيارات بالراحة داخل الاستراحة نفسها وهناك مواقف اخرئ بجانب الإستراحة</span></p>\r\n<p><span style=\"color: #e03e2d;\">وثم \" حديقةأطفال عليها شبك حديد بحيث بإمكانك إدخال أطفالك الحديقة والإقفال عليهم</span></p>\r\n<p><span style=\"color: #e03e2d;\">بعدها يأتي مسبح للكبار وامامه غرفة مجلس عربي مكيفة مع شاشة مع تلفون للتواصل بالمكتب إن احتجت لاي شي&nbsp;</span></p>\r\n<p><span style=\"color: #e03e2d;\">وخلف الغرفة ملعب كرة قدم مع غرفة مجلس عربي مكيفة مع الشاشة منعزله&nbsp;</span></p>\r\n<p><span style=\"color: #e03e2d;\">غرفة المجلس كل غرفة لها حمامها الخاص</span></p>\r\n<p><span style=\"color: #e03e2d;\">وهناك استراحة مصغره داخل الاستراحة مغلقة بالكامل عبارة عن مسبح للاطفال و حمام و مطبخ مجهز بكل شي؛ وغرفتين نوم&nbsp;</span></p>\r\n<p><span style=\"color: #e03e2d;\">غرفة نوم ذات سرير عائلي وغرفة اخرئ ذات 6 اسره للاطفال</span></p>\r\n<p><span style=\"color: #e03e2d;\">وهناك ايضا&nbsp;</span></p>\r\n<p><span style=\"color: #e03e2d;\">شواية + موفا</span></p>\r\n<p><span style=\"color: #e03e2d;\">&nbsp;</span></p>\r\n<p><span style=\"color: #e03e2d;\">يوجد خارج الاستراحة غرفة حراسة + مكتب. يمكن التواصل معهم عبر الجرس لاي امر تحتاجه</span></p>\r\n<p><span style=\"color: #e03e2d;\">&nbsp;</span></p>\r\n<p><span style=\"color: #e03e2d;\">العنوان - لحج - صبر - مغرس ناجي</span></p>\r\n<p><span style=\"color: #e03e2d;\">770805625-737060491-777146138</span></p>\r\n<p><span style=\"color: #e03e2d;\">&nbsp;</span></p>\r\n<p><span style=\"color: #e03e2d;\">#استراحة_الاحبة</span></p>', 'منتجع,سياحي,عائلي,استراحة,الاحبة,ملكي,حفلات,زوجية,شبابية', '0', 0, 'محمد العبدلي الاحبة', 'mhmdalbdly689@gmail.com', '+967770805625', 0, NULL, 29, 1, 45.04, 12.78, '46.161.225.121', 51, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-09 18:04:38', '2021-11-14 21:38:10'),
(129, 'YE', 50, 216, 1, 'عسل يمني', '<p>عسل يمني اصلي.. علب درجه اولى. دبه خمسه لتر</p>', 'اب', '150000', 0, 'عبدالباسط محمد مرشد العرومه', 'Abohalal871@gmail.com', '+967777760754', 0, NULL, 12, 0, 44.18, 13.97, '110.238.35.72', 8, NULL, NULL, '78e0350e021a52e156ad3febee3809e4', 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-10 13:16:30', '2021-11-02 14:51:12'),
(130, 'YE', 50, 216, 1, 'عسل يمني', '<p>عسل سدر علب... درجه اولى دبه خمسه لتر&nbsp;</p>', NULL, '150000', 0, 'عبدالباسط محمد مرشد العرومه', 'Abohalal871@gmail.com', '+967777760754', 0, NULL, 12, 0, 44.18, 13.97, '110.238.35.72', 12, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-10 13:24:40', '2021-11-14 21:38:02'),
(131, 'YE', 51, 10, 2, 'هواتف شاومي', '<p><em><strong>شاومي ردمي نوت ٩&nbsp;</strong></em></p>\r\n<p><em><strong>جهاز قوي في صناعتة من حيث المعالج والشاشة والبطارية والذاكرة والرام والكاميرا&nbsp;</strong></em></p>\r\n<p><em><strong>حيث ان بطاريتة 6000 am</strong></em></p>\r\n<p><em><strong>والذاكرة 128/8..... 256/8</strong></em></p>\r\n<p><em><strong>والكاميرا الخلفية 48.12.8.2.2</strong></em></p>\r\n<p><em><strong>الكاميرا الامامية 18</strong></em></p>', 'جوال,شاومي', '150000', 1, 'عبدالباسط محمد مرشد العرومه', 'alrwmyabwhlal@gmail.com', '0967777760754', 0, NULL, 12, 0, 44.18, 13.97, '63.168.168.85', 10, NULL, NULL, 'fbce5f55a5edb4ba1cd376f93923e019', 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-11 14:54:19', '2021-11-02 14:51:02'),
(132, 'YE', 51, 10, 1, 'هاتف للبيع شاومي', '<p><strong>يمتاز هاتف ردمي نوت ٩ بسطوع ودقة 1080&times;2340</strong></p>\r\n<p><em><strong>ويزن ١٩٨ز</strong></em></p>\r\n<p><em><strong>البطارية قوة 6000 am</strong></em></p>\r\n<p><em><strong>الكاميرا الخلفية 48.12.8.2.2</strong></em></p>\r\n<p><em><strong>الكاميرا الامامية &nbsp;18&nbsp;</strong></em></p>\r\n<p><strong><em>وذاكرة بتخزين 256/.. &nbsp;الذاكرة التخزينة الرام &nbsp;8</em></strong></p>\r\n<p>&nbsp;</p>', 'شاومي,ردمي,نوت', '150000', 1, 'عبدالباسط محمد مرشد العرومه', 'alrwmyabwhlal@gmail.com', '0967777760754', 0, NULL, 12, 0, 44.18, 13.97, '63.168.169.9', 19, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-11 15:21:11', '2021-11-21 01:27:12'),
(133, 'YE', 54, 222, 1, 'سيارة لكسز', '<p><strong><em>سيارة لكسز 2007</em></strong></p>', 'سيارة,لكسز', '75000', 1, 'خالد وليد علي يحى الجبري', 'aljbryk833@gmail.com', '+967778446953', 0, NULL, 12, 1, 44.18, 13.97, '63.168.169.137', 9, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-11 15:40:04', '2021-11-22 06:55:06'),
(134, 'YE', 51, 216, 1, 'عسل يمني علب اصلي', '<p>عسل علب درجه اولى ممتاز ومظموم &nbsp;دبه خمسه لتر &nbsp;١٥٠.٠٠٠ الف ريال يمني&nbsp;</p>', 'عسل', '150000', 0, 'عبدالباسط محمد مرشد العرومه', 'alrwmyabwhlal@gmail.com', '0967777760754', 0, NULL, 12, 0, 44.18, 13.97, '63.168.169.9', 9, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-11 15:47:35', '2021-11-07 00:28:38'),
(135, 'YE', 51, 207, 1, 'مدارس رواد الصداره الاهليه', '<p>كادر تعليمي مؤهل&nbsp;</p>\r\n<p>مبنى حديث&nbsp;</p>\r\n<p>فصول متميزه</p>\r\n<p>تمهيدي.. اساسي.. ثانوي&nbsp;</p>\r\n<p>استطاعت مدارس رواد الصداره ان تتميز وان تنافس غيرها وتنال ثقة الاهالي &nbsp;بوقت قياسي &nbsp; تبدأ الرسوم بمائة الف فمافوق حسب المرحله هناك عروض جيده لمن لديه اكثر من طالب &nbsp;</p>', NULL, '1000000', 1, 'عبدالباسط محمد مرشد العرومه', 'alrwmyabwhlal@gmail.com', '0967777760754', 0, NULL, 12, 0, 44.18, 13.97, '63.168.169.146', 33, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-11 16:23:39', '2021-11-19 22:24:50'),
(136, 'YE', 57, 237, 2, 'الزاهي', '<p>يوجد لدينا احدث واروع المجالس الحديثه&nbsp;</p>', 'اثاث,مجالس,حديثه,كنب,انتريهات,ستائر', '0', 0, 'ابراهيم الزاهي', 'ibrahimhamood75@gmail.com', '+967777399101', 0, NULL, 6, 0, 44.21, 15.35, '46.161.249.161', 23, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-14 09:15:57', '2021-11-20 08:48:44'),
(138, 'YE', 58, 237, 2, 'الجودة للديكور والتجارة', '<p>محل بيع الديكورات انواع واشكال</p>\r\n<p>بضاعة وجودة الاحسن في السوق</p>\r\n<p>نقشات منحوتة مع جميع التشكيلات</p>\r\n<p>والزوايه متوفر لدينا لواصق3D</p>\r\n<p>مميزة محلنا الجودة والاسعار المنافسة في السوق</p>\r\n<p>وسمعتنا سبقت عملنا</p>\r\n<p>&nbsp;</p>', 'ديكورات,ديكور,لواصق,اسقف,مستعارة,نقاشات,ادوات,منزلية,متكاملة', '0', 0, 'عبدالرحمن الجودة', 'bdalrhmnaljwdt32@gmail.com', '+967777579316', 0, NULL, 29, 1, 45.04, 12.78, '175.110.43.4', 2, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-19 16:52:46', '2021-11-02 14:50:24'),
(139, 'YE', 41, 222, 2, 'سياره توسااان تجدوها في (معرض الوفاء_الحوبان تعز)', '<p><a href=\"%D8%B3%D9%8A%D8%A7%D8%B1%D9%87%20%D9%84%D9%84%D8%A8%D9%8A%D8%B9\">ستة بستون, دبل,</a></p>\r\n<p><a href=\"%D8%B3%D9%8A%D8%A7%D8%B1%D9%87%20%D9%84%D9%84%D8%A8%D9%8A%D8%B9\"> فتحة سقف,</a></p>\r\n<p><a href=\"%D8%B3%D9%8A%D8%A7%D8%B1%D9%87%20%D9%84%D9%84%D8%A8%D9%8A%D8%B9\"> مجمرك مره,</a></p>', 'امجدالمحيا,السيارات,تعزالحوبان,سيارة,سياره,سيارات,لليبع,توسان,توسا,car,sale,بيع,سيا', '5800', 0, 'امجد المحيا - معرض الوفاء للسيارات', 'amgadalmhia@gmail.com', '+967775294937', 0, NULL, 15000000, 2, 999999.99, 345345.00, '185.80.141.91', 18, 'ad6428b95783f8fa7334f660142765ea', NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-22 17:34:45', '2021-11-02 20:10:53'),
(141, 'YE', 39, 222, 1, 'سيارة للبيع', '<p>تبحث عن سيارة اقتصاديه وعائليه بنفس الوقت الحل عندي</p>\r\n<p>متوفر سياره يارس أمريكي 2008&nbsp;</p>', 'سيارة,للبيع,سياره,مستعمل,نظيف,يارس,اقتصاديه,اقتصادية', '5000', 0, 'محمد الجنيد', 'aljunaidmohammed2002@gmail.com', '+967777878950', 0, NULL, 6, 2, 44.21, 15.35, '175.110.9.42', 11, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-23 09:17:15', '2021-11-02 14:50:13'),
(148, 'YE', 41, 172, 2, 'عمارة للبيع في حي راقي على ثلاثه شوارع وقريب من الشارع العام, جوار مستشفى الخليج تعزالحوبان', '<p>&nbsp;</p>\r\n<p>👈 عماره للبيع من ١٢ قصبه</p>\r\n<p>&nbsp;👈مكونه من اربعه أدوار</p>\r\n<p>&nbsp;👈في كل دور ثلاث شقق</p>\r\n<p>&nbsp;👈 تقع في حي راقي على ثلاثه شوارع</p>\r\n<p>&nbsp; &nbsp; وقريب من الشارع العام بمسافه ٢٤٠ متر</p>', 'عمارة,عماره,عمار,مبنى,بيت,ادوار,أدوار,منزل,للبيع,بيع,اربعه,شقق,شقه,شقة,تعزالحوبان', '1200000', 1, 'اونلاين للاستشارات الهندسيه والانشائيه والمعماريه', 'rayanx55@hotmail.com', '+967770764699', 0, NULL, 15000000, 1, 999999.99, 345345.00, '185.80.141.86', 7, 'f14a4c551a5cbb60808c93032a350ffb', NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-27 16:14:42', '2021-11-07 10:18:26'),
(149, 'YE', 41, 232, 2, 'احجز مقعدك الان في مركز هيومن توب للتنمية والتدريب_ العنوان (العنوان مبنى يمن تيك - الخشبه تعزالحوبان)', '<p>&nbsp;<a href=\"%D8%A7%D8%AD%D8%AC%D8%B2%20%D9%85%D9%82%D8%B9%D8%AF%D9%83%20%D8%A7%D9%84%D8%A7%D9%86%20%D9%81%D9%82%D8%B7%20%D8%A81000%20%D8%B1%D9%8A%D8%A7%D9%84\">HUMAN TOP</a></p>\r\n<p><a href=\"%D8%A7%D8%AD%D8%AC%D8%B2%20%D9%85%D9%82%D8%B9%D8%AF%D9%83%20%D8%A7%D9%84%D8%A7%D9%86%20%D9%81%D9%82%D8%B7%20%D8%A81000%20%D8%B1%D9%8A%D8%A7%D9%84\">يعلن مركز هيومن توب للتنمية والتدريب 1 عن إقامه برنامج كيف تختار تخصصك الجامعي مع المدرب / مختار عبدالله مدرب مختص بالمهارات القياديه, مؤلف وباحث بالتنمية الذاتية, مدرب مدربين معتمد من البرد البريطاني, خبره 12 عاما المحاور 1 - صناعة المستقبل إحجز مقعدك الآن فقط ب 1000 ريال 2 - كيف تعرف ميولك د - قانون الاختيار الأنسب. - كيف تحدد الموهبه والتخصص. 5 - اخطاء في اختيار التخصص 6 - مقياس التخصص +</a></p>', 'هيومن,توب,احجز,مقعدك,الان,دورة,تدريب,تنميه,بشريه,كيف,تختار,تخصصك', '1000', 0, 'مركز هيومن توب للتنمية والتدريب - فريد عبدالرقيب منسق المركز', 'hamdikhalid43@gmail.com', '+967773478364', 0, NULL, 15000000, 0, 999999.99, 345345.00, '185.80.141.11', 22, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-27 20:29:16', '2021-11-09 06:12:46'),
(150, 'YE', 41, 207, 2, 'الآن برنامج الرخصة الإدارية الدولية لإعداد الموظف المحترف', '<p><strong><a href=\"%D8%AE%D8%B5%D9%85%2030%25%20%D9%84%D8%A3%D9%88%D9%84%20%D8%AE%D9%85%D8%B3%D9%87%20%D9%85%D8%B3%D8%AC%D9%84%D9%8A%D9%86\">يعـلن</a> </strong><strong><a href=\"%D8%AE%D8%B5%D9%85%2030%25%20%D9%84%D8%A3%D9%88%D9%84%20%D8%AE%D9%85%D8%B3%D9%87%20%D9%85%D8%B3%D8%AC%D9%84%D9%8A%D9%86\">مركز هيومن توب للتنمية</a></strong></p>\r\n<p><strong><a href=\"%D8%AE%D8%B5%D9%85%2030%25%20%D9%84%D8%A3%D9%88%D9%84%20%D8%AE%D9%85%D8%B3%D9%87%20%D9%85%D8%B3%D8%AC%D9%84%D9%8A%D9%86\"> عن فتح باب التسجيل, وللدفعة العاشرة على التوالي, في برنامج الرخصة الإدارية الدولية لإعداد الموظف المحترف, </a></strong></p>\r\n<p><strong><a href=\"%D8%AE%D8%B5%D9%85%2030%25%20%D9%84%D8%A3%D9%88%D9%84%20%D8%AE%D9%85%D8%B3%D9%87%20%D9%85%D8%B3%D8%AC%D9%84%D9%8A%D9%86\">محاور البرنامج:-</a></strong></p>\r\n<p><strong><a href=\"%D8%AE%D8%B5%D9%85%2030%25%20%D9%84%D8%A3%D9%88%D9%84%20%D8%AE%D9%85%D8%B3%D9%87%20%D9%85%D8%B3%D8%AC%D9%84%D9%8A%D9%86\">[ إدارة أعمال - إدارة مكاتب وسكرتارية تنفيذية - إدارة الجودة - إدارة الموارد البشرية - مهارات الإتصال والتواصل - مهارات القيادة تسويق إحترافي وخدمة العملاء - علاقات عامة مراسلات تجارية ]</a></strong></p>\r\n<p><strong>سجل الان فالمقاعد محدوده:</strong></p>\r\n<p><strong>&nbsp;خصم 30% للخمسه الأوائل المسجلين</strong></p>\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;(مركز هيومن توب للتدريب والتنمية)&nbsp;</strong></p>', 'برنامج,تدريب,تدرب,سجل,تسجيل,احجز,حجز,مركز,تنميه,تنمية,مقعد,مقعدك,خصم', '5000', 0, 'مركز هيومن توب للتدريب والتنميه _ فريد عبدالرقيب', 'hamdikhalid43@gmail.com', '+967773478364', 0, NULL, 15000000, 0, 999999.99, 345345.00, '185.80.141.53', 12, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-27 23:14:18', '2021-11-07 07:30:30'),
(151, 'YE', 63, 172, 2, 'عقارات للبيع', '<p>للإستثمارات ...أراضي.. عقارات ..مواقع متميزه ..</p>', 'عقار,للبيع,منزلية', NULL, 1, 'حميد مرشد حميد', 'alslmyhmyd382@gmail.com', '0541176949', 0, NULL, 6, 0, 44.21, 15.35, '131.117.164.149', 13, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-30 14:22:55', '2021-11-08 01:23:15'),
(152, 'YE', 64, 232, 2, 'سِوَاحُلُ قًلُنَسِيَةِ', '<p>سواحل قلنسية للسفريات والشحن والإستيراد والتصدير وخدمات الحج والعمره</p>\r\n<p>تخفيضات تصل الى10% لجميع الخدمات</p>\r\n<p>تخفيضات تصل الى %25 VIP</p>', 'خدمات,سفر,وسياحة,فيز,تٲمين,صحي,تامين,نقل,بري,جوي,شحن,استيراد,تصدير,جوازات', '0', 0, 'سواحل قلنسية', 'mohalimoh723@gmail.com', '+967778374993', 0, NULL, 6, 2, 44.21, 15.35, '110.238.34.5', 11, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-31 08:12:51', '2021-11-11 11:41:42'),
(153, 'YE', 63, 223, 1, 'أسلحة خفيفة', '<p>لبيع كل ما هو مضمون هنا لك حق الإختيار ونحن نتبعك به إستثمار&nbsp;</p>', 'اسلحة,خفيفة', '6000', 0, 'حميد مرشد حميد', 'alslmyhmyd382@gmail.com', '0541176949', 0, NULL, 6, 2, 44.21, 15.35, '109.74.39.42', 8, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-10-31 10:58:32', '2021-11-02 14:49:20'),
(154, 'YE', 41, 172, 2, 'عماره للبيع في حي راقي على شارعين (تعزالحوبان)', '<p><strong><span style=\"color: #000000;\"><a href=\"%D8%B9%D9%85%D8%A7%D8%B1%D8%A9%20%D8%AD%D8%AF%D9%8A%D8%AB%20%D9%84%D9%84%D8%A8%D9%8A%D8%B9,%20%D9%85%D8%A8%D9%86%D9%8A%D9%87%2015%D9%82%D8%B5%D8%A8%D9%87,%20%D8%AA%D9%82%D8%B9%20%D8%B9%D9%84%D9%89%20%D8%B4%D8%A7%D8%B1%D8%B9%D9%8A%D9%86(%D8%B4%D8%A7%D8%B1%D8%B9%2018%D9%88%D8%B4%D8%A7%D8%B1%D8%B9%2012),%20%D8%A7%D9%84%D8%B9%D9%85%D8%A7%D8%B1%D9%87%20%D9%81%D9%8A%D9%87%D8%A7%207%D8%B4%D9%82%D9%82%20%D8%AC%D8%A7%D9%87%D8%B2%D8%A7%D8%AA%20%D9%88%D8%AD%D9%88%D8%B4%20%D9%885%D9%81%D8%AA%D8%AD%D8%A7%D8%AA%20%D8%B9%D9%84%D9%89%20%D8%B4%D8%A7%D8%B1%D8%B9%20%D9%85%D8%B2%D9%81%D9%84%D8%AA,%20%D8%B3%D8%B9%D8%B1%D9%87%D8%A7%202%20%D9%85%D9%84%D9%8A%D9%88%D9%86%20%D9%88%D9%85%D8%A7%D8%A6%D8%AA%D9%8A%D9%86\'%D8%A7%D9%84%D9%81%20%D8%B1%D9%8A%D8%A7%D9%84%20%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%20%D9%82%D8%A7%D8%A8%D9%84\'%D9%84%D8%AA%D9%81%D8%A7%D9%88%D8%B6\'\">عمارة حديثة للبيع,</a></span></strong><strong><a href=\"%D8%B9%D9%85%D8%A7%D8%B1%D8%A9%20%D8%AD%D8%AF%D9%8A%D8%AB%20%D9%84%D9%84%D8%A8%D9%8A%D8%B9,%20%D9%85%D8%A8%D9%86%D9%8A%D9%87%2015%D9%82%D8%B5%D8%A8%D9%87,%20%D8%AA%D9%82%D8%B9%20%D8%B9%D9%84%D9%89%20%D8%B4%D8%A7%D8%B1%D8%B9%D9%8A%D9%86(%D8%B4%D8%A7%D8%B1%D8%B9%2018%D9%88%D8%B4%D8%A7%D8%B1%D8%B9%2012),%20%D8%A7%D9%84%D8%B9%D9%85%D8%A7%D8%B1%D9%87%20%D9%81%D9%8A%D9%87%D8%A7%207%D8%B4%D9%82%D9%82%20%D8%AC%D8%A7%D9%87%D8%B2%D8%A7%D8%AA%20%D9%88%D8%AD%D9%88%D8%B4%20%D9%885%D9%81%D8%AA%D8%AD%D8%A7%D8%AA%20%D8%B9%D9%84%D9%89%20%D8%B4%D8%A7%D8%B1%D8%B9%20%D9%85%D8%B2%D9%81%D9%84%D8%AA,%20%D8%B3%D8%B9%D8%B1%D9%87%D8%A7%202%20%D9%85%D9%84%D9%8A%D9%88%D9%86%20%D9%88%D9%85%D8%A7%D8%A6%D8%AA%D9%8A%D9%86\'%D8%A7%D9%84%D9%81%20%D8%B1%D9%8A%D8%A7%D9%84%20%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%20%D9%82%D8%A7%D8%A8%D9%84\'%D9%84%D8%AA%D9%81%D8%A7%D9%88%D8%B6\'\">من 15قصبه,</a></strong><strong><a href=\"%D8%B9%D9%85%D8%A7%D8%B1%D8%A9%20%D8%AD%D8%AF%D9%8A%D8%AB%20%D9%84%D9%84%D8%A8%D9%8A%D8%B9,%20%D9%85%D8%A8%D9%86%D9%8A%D9%87%2015%D9%82%D8%B5%D8%A8%D9%87,%20%D8%AA%D9%82%D8%B9%20%D8%B9%D9%84%D9%89%20%D8%B4%D8%A7%D8%B1%D8%B9%D9%8A%D9%86(%D8%B4%D8%A7%D8%B1%D8%B9%2018%D9%88%D8%B4%D8%A7%D8%B1%D8%B9%2012),%20%D8%A7%D9%84%D8%B9%D9%85%D8%A7%D8%B1%D9%87%20%D9%81%D9%8A%D9%87%D8%A7%207%D8%B4%D9%82%D9%82%20%D8%AC%D8%A7%D9%87%D8%B2%D8%A7%D8%AA%20%D9%88%D8%AD%D9%88%D8%B4%20%D9%885%D9%81%D8%AA%D8%AD%D8%A7%D8%AA%20%D8%B9%D9%84%D9%89%20%D8%B4%D8%A7%D8%B1%D8%B9%20%D9%85%D8%B2%D9%81%D9%84%D8%AA,%20%D8%B3%D8%B9%D8%B1%D9%87%D8%A7%202%20%D9%85%D9%84%D9%8A%D9%88%D9%86%20%D9%88%D9%85%D8%A7%D8%A6%D8%AA%D9%8A%D9%86\'%D8%A7%D9%84%D9%81%20%D8%B1%D9%8A%D8%A7%D9%84%20%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%20%D9%82%D8%A7%D8%A8%D9%84\'%D9%84%D8%AA%D9%81%D8%A7%D9%88%D8%B6\'\">تقع على شارعين(شارع 18وشارع 12), العماره مكون من 4 ادوار فيها 7شقق وحوش و5فتحات على شارع مزفلت</a>,</strong><strong><span style=\"color: #000000;\"><a href=\"%D8%B9%D9%85%D8%A7%D8%B1%D8%A9%20%D8%AD%D8%AF%D9%8A%D8%AB%20%D9%84%D9%84%D8%A8%D9%8A%D8%B9,%20%D9%85%D8%A8%D9%86%D9%8A%D9%87%2015%D9%82%D8%B5%D8%A8%D9%87,%20%D8%AA%D9%82%D8%B9%20%D8%B9%D9%84%D9%89%20%D8%B4%D8%A7%D8%B1%D8%B9%D9%8A%D9%86(%D8%B4%D8%A7%D8%B1%D8%B9%2018%D9%88%D8%B4%D8%A7%D8%B1%D8%B9%2012),%20%D8%A7%D9%84%D8%B9%D9%85%D8%A7%D8%B1%D9%87%20%D9%81%D9%8A%D9%87%D8%A7%207%D8%B4%D9%82%D9%82%20%D8%AC%D8%A7%D9%87%D8%B2%D8%A7%D8%AA%20%D9%88%D8%AD%D9%88%D8%B4%20%D9%885%D9%81%D8%AA%D8%AD%D8%A7%D8%AA%20%D8%B9%D9%84%D9%89%20%D8%B4%D8%A7%D8%B1%D8%B9%20%D9%85%D8%B2%D9%81%D9%84%D8%AA,%20%D8%B3%D8%B9%D8%B1%D9%87%D8%A7%202%20%D9%85%D9%84%D9%8A%D9%88%D9%86%20%D9%88%D9%85%D8%A7%D8%A6%D8%AA%D9%8A%D9%86\'%D8%A7%D9%84%D9%81%20%D8%B1%D9%8A%D8%A7%D9%84%20%D8%B3%D8%B9%D9%88%D8%AF%D9%8A%20%D9%82%D8%A7%D8%A8%D9%84\'%D9%84%D8%AA%D9%81%D8%A7%D9%88%D8%B6\'\">سعرها 2 مليون ومائتين\'الف ريال سعودي قابل\'لتفاوض</a></span></strong></p>\r\n<p><span style=\"text-decoration: underline;\"><strong><span style=\"color: #000000; text-decoration: underline;\">العنوان تعزالحوبان.جولةسوفتيل</span></strong></span></p>', 'عماره,عمارة,عمار,بيع,للبيع,مبنى,منزل,بيت,يبيع,تبيع,عقارات,عقار,الحوبان,في,sale', '0', 1, 'اونلاين للاستشارات الهندسيه والتصاميم الانشائيه والمعماريه,م/ريان', 'rayanx55@hotmail.com', '+967770764699', 0, NULL, 15000000, 1, 999999.99, 345345.00, '185.80.141.124', 19, '7b41c4a15d510e417c87121deac7febe', NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-01 15:34:57', '2021-11-13 19:11:44'),
(155, 'YE', 66, 171, 1, 'ارضيه عرطه للبيع', '<p>ارض 15 لبنه على شارع 16وشارع 6حر معمدة&nbsp;</p>\r\n<p>تقرب من الخط 50متر...</p>\r\n<p>الموقع بني مطر الصباحه.</p>\r\n<p>البايع راساً بدون وسطاء</p>\r\n<p>للتواصل عبر الرقم 770882027</p>\r\n<p>&nbsp;</p>', 'عقار,اراضي,ارضيه,للبيع,عرطه,بسعر,مغري', '6000000', 1, 'الحاصبي للعقارات', 'alhaspe234@gmail.com', '+967777522920', 0, NULL, 6, 0, 44.21, 15.35, '185.80.140.174', 9, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-01 15:45:45', '2021-11-03 16:46:04'),
(161, 'YE', 41, 232, 2, 'مخزون مواد بناء متكامل للبيع', '<p>يوجد لدينا مخزون مواد بناء للبيع,House Materials Stock لجميع أصناف مواد البناء جديده بكراتينها ومعروض للبيع كاملة بسعر جمله وتخفيض كبير جدا يصل ل30% مقارنة بسعربيع جمله..</p>\r\n<p>للراغبين في شراء الكميه كامله من أصحاب مواد البناء - تجزئة أو جمله..</p>\r\n<p>&nbsp;التواصل برقم 734131960</p>', 'مواد,بناء,البناء,بنا,بنأ,بنى,مخزن,مخزون,بيع,للبيع,تخفيض,سعر,عرطه,جمله,جملة', '0', 0, 'ريان الصليحي _ لمواد البناء والنجاره', 'hamdikhalid43@gmail.com', '+967734131960', 0, NULL, 15000000, 2, 999999.99, 345345.00, '185.80.141.106', 14, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-01 16:30:40', '2021-11-22 04:51:35'),
(165, 'YE', 55, 207, 2, 'تصميم كيدز اريا', '<p>كيدزإريا دوت كوم أول موقع متخصص في تصميمم مشروعات الكيدزإريا</p>\r\n<p>دلوقتي تقدرتبدأ مشروعك الترفيهي بتصميمات داخلية وديكورات &ndash; أرضيات السيفتي</p>\r\n<p>الفيديو جيم - ألعاب السوفت هاوس - الترامبولين.</p>\r\n<p>على أي مساحة مناسبة لمشروعك الترفيهي . كيدزإريا دوت كوم هتعملك مشروعك متكامل</p>\r\n<p>كلمنا على الخط الساخن 19810</p>\r\n<p>لمزيد من المعلومات زور موقعنا</p>\r\n<p>www.unitedtoys-eg.com</p>\r\n<p>أوصفحتنا على الفيسبوك</p>\r\n<p>https://www.facebook.com/unitedtoysco/</p>\r\n<p>#العابملاهى #مناطقالعاب #العابترفيهيه&nbsp; #الكيدزإريا</p>', 'kids,area', '0', 0, 'Kids Area', 'mobawabat@unitedtoys-eg.com', '19810', 0, NULL, 23, 0, 42.95, 14.80, '156.193.185.199', 7, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-02 10:54:21', '2021-11-04 14:17:04'),
(167, 'YE', 41, 226, 2, 'مجمع ريفان الدولي الحوبان مصلحة الطرقات', '<p>مجمع ريفان الدولي التخفيضات والتسوق</p>\r\n<p><a title=\"https://www.facebook.com/107280361228850/posts/306705241286360/\" href=\"%D9%85%D9%86%D8%AA%D8%B4%D8%B1%D9%8A%D9%86%20%D9%81%D9%8A%20%D9%83%D9%84%20%D9%85%D9%83%D8%A7%D9%86%20%D9%88%D8%A7%D9%86%D8%AA%D8%B4%D8%A7%D8%B1%D9%86%D8%A7%20%D9%84%D9%86%20%D9%8A%D8%AA%D9%88%D9%82%D9%81...%20%D9%8A%D9%85%D9%83%D9%86%D9%83%D9%85%20%D8%A7%D9%84%D8%A7%D9%86%20%D8%AF%D9%81%D8%B9%20%D9%82%D9%8A%D9%85%D8%A9%20%D9%85%D8%B4%D8%AA%D8%B1%D9%8A%D8%A7%D8%AA%D9%83%20%D9%85%D9%86%20%20%D8%B3%D9%88%D9%82%20%D8%B1%D9%8A%D9%81%D8%A7%D9%86%20%D8%A7%D9%84%D8%AF%D9%88%D9%84%D9%8A.%20%D9%88%D8%B9%D9%86%D9%88%D8%A7%D9%86%D9%87%20%20%D8%A7%D9%84%D8%AD%D9%88%D8%A8%D8%A7%D9%86%20%D9%85%D8%B5%D9%84%D8%AD%D8%A9%20%D8%A7%D9%84%D8%B7%D8%B1%D9%82%D8%A7%D8%AA.%20%20%D9%88%20%D8%B9%D8%A8%D8%B1%20%D8%AE%D8%AF%D9%85%D8%A9%20%D8%A8%D9%8A%D8%B3%20%D9%85%D9%86%20%D8%A8%D9%86%D9%83%20%D8%A7%D9%84%D8%A7%D9%85%D9%84%20#%D8%A8%D9%8A%D8%B3%20%D8%AA%D8%B3%D9%88%D9%82%20%D9%88%D8%A7%D8%B4%D8%AA%D8%B1%D9%8A%20%D9%83%D9%84%20%D9%85%D8%AA%D8%B7%D9%84%D8%A8%D8%A7%D8%AA%D9%83%20%D9%88%D8%AD%D8%A7%D8%B3%D8%A8%D9%87%D8%A7%20%D9%85%D9%86%20%D8%AC%D9%88%D8%A7%D9%84%D9%83%20%D9%88%D8%A7%D9%86%D8%AA%20%D9%85%D8%B1%D8%AA%D8%A7%D8%AD%20%D9%84%D8%AA%D8%B4%D9%8A%D9%84%20%D9%87%D9%85%20%D8%A7%D9%84%D9%81%D9%84%D9%88%D8%B3%20%D8%A8%D9%8A%D8%B3%20%D8%AA%D8%BA%D9%86%D9%8A%D9%83%20%D8%B9%D9%86%20%D8%A7%D9%84%D9%83%D8%A7%D8%B4%20%20%20%23%D8%A8%D9%8A%D8%B3%20%20%23%D9%85%D8%AC%D9%85%D8%B9%20%D8%B1%D9%8A%D9%81%D8%A7%D9%86.%20%D8%A7%D9%84%D8%AF%D9%88%D9%84%D9%8A\">منتشرين في كل مكان وإنتشارنا لن يتوقف... يمكنكم الآن دفع قيمة مشترياتك من سوق ريفان الدولي. وعنوانه الحوبان مصلحة الطرقات. و عبر خدمة بيس من بنك الامل #بيس تسوق واشتري كل متطلباتك وحاسبها من جوالك وانت مرتاح لتشيل هم الفلوس بيس تغنيك عن الكاش #بيس #مجمع ريفان. الدولي</a></p>\r\n<p>نرحب بزيارتكم وستجدون مايسركم</p>\r\n<p>تخفيضات هائله منتجات ذات جودة عاليه</p>\r\n<p><a href=\"https://www.facebook.com/107280361228850/posts/306705241286360/\">https://www.facebook.com/107280361228850/posts/306705241286360/</a></p>', 'تسوق,تسويق,تخفيض,تخفيضات,اشتري,يشتري,سوق,ريفان,مجمع,مركز,دولي,الدولي,الحوبان,تعز,ملابس', '0', 1, 'مجمع ريفان الدولي للتسوق والتخفيضات', 'hamdikhalid43@gmail.com', NULL, 1, NULL, 15000000, 0, 999999.99, 345345.00, '185.80.141.203', 10, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-03 14:49:53', '2021-11-17 17:04:08'),
(168, 'YE', 41, 172, 2, 'عماره للبيع على شارعين في تعز الحوبان', '<p><strong><a href=\"%D8%B9%D9%85%D8%A7%D8%B1%D9%87.%D9%84%D9%84%D8%A8%D9%8A%D8%B9%20%D8%AA%D9%82%D8%B9%20%D8%B9%D9%84%D9%89%20%D8%B4%D8%A7%D8%B1%D8%B9%D9%8A%D9%86%20.%20%D9%85%D9%83%D9%88%D9%86%D9%87%20%D9%85%D9%86%2012%D9%82%D8%B5%D8%A8%D9%87.%20%D8%B9%D9%84%D9%89%20%D8%B4%D8%A7%D8%B1%D8%B916%D9%88%D8%A7%D8%B4%D8%A7%D8%B1%D8%B914.%20%D8%AC%D8%A7%D9%87%D8%B2%20%D9%88%D9%81%D9%8A%D9%87%D8%A7%206%D8%B4%D9%82%D9%82.%20%D9%88%204%D9%81%D8%AA%D8%AD%D8%A7%D8%AA%20%D8%B9%D9%84%D9%89%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B1%D8%B9.%20%D8%A7%D9%84%D8%B9%D9%85%D8%A7%D8%B1%D9%87%20%D8%AA%D9%82%D8%B9%20%D9%81%D9%8A%20%D8%AD%D9%8A%20%D8%B1%D8%A7%D9%82%D9%8A%20%D9%88%D9%82%D8%B1%D9%8A%D8%A8%20%D9%85%D9%86%20%D8%A7%D9%84%D8%B4%D8%A7%D8%B1%D8%B9\">عماره.للبيع تقع على شارعين . مكونه من 12قصبه. على شارع 16و شارع14 . جاهزه وفيها 6شقق. و 4فتحات على الشارع. العماره تقع في حي راقي وقريب من الشارع</a></strong></p>', 'عماره,عمارة,عما,بيع,يبيع,للبيع,مبنى,مبني,مباني,مبان,عمارات,عقارات,ارض,أرض,أراضي', '370', 1, 'اونلاين للاستشارات الهندسيه والتصاميم الانشائيه والمعماريه', 'ryian@gmail.com', '+967770764699', 0, NULL, 15000000, 0, 999999.99, 345345.00, '185.80.141.127', 22, '217db1e798ffe576ae6d9fcbc4548150', NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-03 17:33:27', '2021-11-14 21:37:39'),
(169, 'YE', 26, 232, 2, 'مطاعم قرية الباشا 3', '<p>قرية الباشا متعة التذوق&nbsp;</p>\r\n<p>بمناسبة افتتاح فرعنا الثالث في حده نهاية جسر المدينه_خلف البنك اليمني الدولي يوم الخميس بتاريخ 4/5/2021 بأذن الله&nbsp;</p>\r\n<p>خصم 20% على جميع الوجبات&nbsp;</p>\r\n<p>بكافة فروعنا لمدة ثلاثه ايام&nbsp;</p>\r\n<p>الدجاج المحشي بالخضار&nbsp;</p>\r\n<p>الدجاج المحشي بالرز</p>\r\n<p>الخروف المشوي عالفحم مع الرز والمكسرات&nbsp;</p>\r\n<p>المشويات بكافة انواعها&nbsp;</p>\r\n<p>المقبلات الشاميه والكبه&nbsp;</p>\r\n<p>الشاورما الفلافل&nbsp;</p>\r\n<p>قرية الباشا مذاق طعامنا يتحدث عن خبرتنا&nbsp;</p>\r\n<p>الاصبحي جولة الثقافه - هاتف 774055509</p>\r\n<p>حده هاتف - 773525999</p>', 'عروض,وتخفيضات,مطاعم,مطعم,اكلات,شعبيه,ماكولات,مأكولات,شاميه', '0', 0, 'عبد الكريم الماخذي', 'abood345w@gmail.com', '+967770792111', 0, NULL, 6, 0, 44.21, 15.35, '109.74.47.224', 12, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-04 01:41:15', '2021-11-14 21:37:43'),
(170, 'YE', 102, 207, 2, 'متاهات العاب للاطفال', '<p>يونايتدتويز متخصصون في تنفيذ مشروعات الكيدزإريا&nbsp;</p>\r\n<p>هنصمملك متاهات &ndash;سوفت هاوس على أي مساحة تصميمات جديدة بفكر جديد لمشروعك الترفيهي.&nbsp;</p>\r\n<p>مشروعك مع يونايتد تويز هيفرق كتير!</p>\r\n<p>يونايتد تويز هنعملك مشروع متكامل&nbsp;</p>\r\n<p>لمزيد من المعلومات زور موقعنا:</p>\r\n<p>www.unitedtoys-eg.com</p>\r\n<p>أوصفحتنا على الفيسبوك</p>\r\n<p>https://www.facebook.com/unitedtoysco/</p>\r\n<p>كلمنا على الخط الساخن 19810</p>\r\n<p>#العابملاهى #مناطقالعاب #العابترفيهيه&nbsp; #الكيدزإريا&nbsp; #ألعاب _اطفال</p>\r\n<p>#سوفت هاوس #متاهات</p>', 'united,toys', '1', 1, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 23, 1, 42.95, 14.80, '156.193.185.199', 8, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-04 11:29:03', '2021-11-14 21:37:46'),
(171, 'YE', 41, 226, 2, 'يعلن مركز ايفور للتسوق عن تخفيضات تصل إلى 50% (المركز الرئيسي دبي ستار مفرق ماويه + وفرعه في مركز الاسدي -الخشبه الحوبان)', '<p>يعلن مركز 4 ايفر عن عروضه الشتويه وتخفيضات تصل إلى 50%&nbsp;</p>\r\n<p><span style=\"color: #e03e2d;\">كل ماتحتاجه الاسره تحت سقف واحد وبأقل الأسعار..</span></p>\r\n<p><span style=\"color: #000000;\">تسوق الان ووفر 50%</span></p>\r\n<p>زورونا تجدوا الفرق وستجدون مايسركم</p>\r\n<p><em><strong>&nbsp;</strong></em><strong><em>مركز فور ايفر للتسوق </em>..<em>نحن معكم</em></strong></p>\r\n<p><span style=\"color: #e03e2d;\"><em><strong>المركز الرئيسي مركز ستار مفرق ماويه,</strong></em></span></p>\r\n<p><span style=\"color: #e03e2d;\"><em><strong>فرع المركز الخشبه الحوبان مركز الاسدي الدور الرابع</strong></em></span></p>\r\n<p>&nbsp;</p>', 'تخفيضات,تخفيض,عرض,عروض,تسوق,سوق,العروض,التخفيضات,العرض,التخفيض,تسويق,مركز,فور,ايفر', '50', 1, 'مركز فور ايفر للتسوق تعز الحوبان - مصطفى عبدالله', 'mostafaabdlh717@gmail.com', NULL, 1, NULL, 15000000, 0, 999999.99, 345345.00, '185.80.141.34', 17, 'ba4de4f830a3b786a562d3e7362f9dbe', NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-07 15:50:24', '2021-11-18 20:29:27'),
(172, 'YE', 102, 207, 2, 'معدات الحدائق الترفيهية', '<p>معدات الحدائق الترفيهيه بأعلى معايير الجوده</p>\r\n<p>في يونيتد تويز بنقدم لك حلول ذكيه لمناطق الألعاب&nbsp;</p>\r\n<p>وبجوده عاليه مع أطول فترة ضمان ٥ سنوات&nbsp;&nbsp;</p>\r\n<p>&nbsp;متخصصون فى تصميم وتنفيذ المشروعات الترفيهية..</p>\r\n<p>لمزيد من المعلومات زور موقعنا&nbsp;</p>\r\n<p>www.unitedtoys-eg.com</p>\r\n<p>أوصفحتنا على الفيسبوك</p>\r\n<p>https://www.facebook.com/unitedtoysco/</p>\r\n<p>أو كلمنا على الخط الساخن 19810</p>\r\n<p>العاب_ ملاهى #مناطق العاب #&nbsp; &nbsp;#العابترفيهيه</p>\r\n<p>&nbsp;</p>\r\n<p>يونيتد تويز ... وجهتك الجديدة للترفيه !</p>', 'العاب,ترفيهية', NULL, 1, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 21, 2, 49.12, 14.54, '156.193.187.158', 7, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-08 09:18:59', '2021-11-19 03:41:25'),
(173, 'YE', 102, 207, 2, 'مشروعك الترفيهي معانا على أي مساحة', '<p>مشروع الكيدز ايريا على أى مساحه&nbsp;</p>\r\n<p>مهما كانت مساحتك هننفذلك أجمل كيدز ايريا</p>\r\n<p>حلول ذكيه لمناطق ألعاب الأطفال&nbsp;</p>\r\n<p>مع تنفيذ جميع التصميمات الفنيه والهندسية</p>\r\n<p>مشروعك مع يونيتد تويز هيفرق كتير&nbsp;</p>\r\n<p>لمزيد من المعلومات زور موقعنا&nbsp;&nbsp;</p>\r\n<p>www.unitedtoys-eg.com</p>\r\n<p>أو صفحتنا الرسمية على الفيسبوك</p>\r\n<p>https://www.facebook.com/unitedtoysco/</p>\r\n<p>أو كلمنا على الخط الساخن 19810</p>\r\n<p>#العاب ملاهى&nbsp; #مناطق العاب&nbsp; #العاب_ترفيهيه</p>', 'العاب,ترفيهية', NULL, 1, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 23, 1, 42.95, 14.80, '156.193.187.158', 5, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-09 09:20:39', '2021-11-18 21:19:25'),
(174, 'YE', 102, 207, 2, 'مشروع تجهيز كيدز اريا', '<p>إحترافية التصميم أكتر شئ بيميزنا .</p>\r\n<p>في يونيتد تويز بنقدملك حلول ذكيه لمناطق الألعاب .</p>\r\n<p>مشروعك مع يونيتد تويز ..حيفرق كتير ..</p>\r\n<p>متخصصون فى تصميم وتنغيذ المشروعات الترفيهية..</p>\r\n<p>لمزيد من المعلومات زور موقعنا</p>\r\n<p>www.unitedtoys-eg.com</p>\r\n<p>أو كلمنا على الخط الساخن 19810</p>\r\n<p>#العابملاهى #مناطقالعاب #العاب_ترفيهيه</p>\r\n<p>&nbsp;</p>', 'العاب,ترفيهية', NULL, 1, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 26, 0, 45.57, 13.99, '156.193.187.158', 8, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-09 15:08:59', '2021-11-21 22:15:14'),
(175, 'YE', 102, 207, 2, 'وحدات تجهيز مناطق العاب خارجيه', '<p>ماتقبلش بأقل من رقم واحد !&nbsp;</p>\r\n<p>Gottardo ألعاب الحدائق الإيطالية دلوقتى فى مصر طبقا للمواصفات القياسية العالميه وبضمان ١٠ سنوات&nbsp;</p>\r\n<p>متخصصون في تجهيز مناطق الالعاب الترفيهيه الوكيل الوحيد فى مصر والشرق الأوسط&nbsp;</p>\r\n<p>يونيتد تويز لتجهيز الكيدز اريا&nbsp;</p>\r\n<p>متخصصون فى تصميم وتنفيذ المشروعات الترفيهية..</p>\r\n<p>لمزيد من المعلومات زور موقعنا</p>\r\n<p>www.unitedtoys-eg.com</p>\r\n<p>أوصفحتنا على الفيسبوك</p>\r\n<p>https://www.facebook.com/unitedtoysco/</p>\r\n<p>أو كلمنا على الخط الساخن 19810</p>\r\n<p>#العابملاهى #مناطقالعاب #العابترفيهيه&nbsp; #الكيدزإريا</p>', 'كيدز,اريا,العاب,اطفال,ملاهي', '1', 1, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 26, 0, 45.57, 13.99, '156.193.187.158', 6, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-10 14:29:12', '2021-11-19 02:58:55'),
(176, 'YE', 102, 207, 2, 'مشرروع بارك ترامبولين', '<p>يونايتدتويز متخصصون في تنفيذ مشروعات الكيدزإريا&nbsp;</p>\r\n<p>هنصمملك أكبر بارك ترامبولين على أي مساحة تصميمات جديدة بفكر جديد لمشروعك الترفيهي.&nbsp;</p>\r\n<p>مشروعك مع يونايتد تويز هيفرق كتير!</p>\r\n<p>يونايتد تويز هنعملك مشروع متكامل&nbsp;</p>\r\n<p>لمزيد من المعلومات زور موقعنا:</p>\r\n<p>www.unitedtoys-eg.com</p>\r\n<p>أوصفحتنا على الفيسبوك</p>\r\n<p>https://www.facebook.com/unitedtoysco/</p>\r\n<p>#العاب ملاهي #مناطق العاب #العاب ترفيهيه&nbsp; #الكيدز إريا&nbsp; #ألعاب _اطفال</p>\r\n<p>#بارك_ترامبولين</p>', 'العاب,ترفيهية', NULL, 1, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 23, 2, 42.95, 14.80, '156.193.187.158', 8, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-11 11:59:53', '2021-11-18 19:00:18'),
(177, 'YE', 103, 232, 1, 'فرصة استثمارية', '<p>استثمر معنا&nbsp;</p>\r\n<p>بمبلغ الف دولار</p>\r\n<p>عدد الاسهم عشرة</p>\r\n<p>سيتم البدء في توزيع الارباح بعد الشهر الثالث</p>\r\n<p>للتفاصيل</p>\r\n<p>تواصل</p>\r\n<p>711035576</p>\r\n<p>&nbsp;</p>', 'استثمار,اسهم,ارباخ', '1000', 0, 'عبدالعزيز الاهدل', 'alahdalabdulaziz7@gmail.com', '+967711035576', 0, NULL, 6, 2, 44.21, 15.35, '213.246.15.221', 8, NULL, NULL, '37807845884680c160a514076476056e', 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-13 08:28:52', '2021-11-21 15:46:02'),
(178, 'YE', 103, 207, 1, 'فرصة استثمارية', '<p>استثمر معنا&nbsp;</p>\r\n<p>بمبلغ الف دولار</p>\r\n<p>عدد الاسهم عشرة</p>\r\n<p>سيتم البدء في توزيع الارباح بعد الشهر الثالث</p>\r\n<p>للتفاصيل</p>\r\n<p>تواصل عبر الهاتف</p>', 'إستثمار,اسهم,أرباح', '1000', 0, 'عبدالعزيز الاهدل', 'alahdalabdulaziz7@gmail.com', '+967711035576', 0, NULL, 6, 2, 44.21, 15.35, '110.238.52.20', 6, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-13 08:33:02', '2021-11-21 15:45:19'),
(179, 'YE', 102, 207, 2, 'معدات الحدائق الترفيهية بشكل جديد', '<p>معدات الحدائق الترفيهيه بأعلى معايير الجوده</p>\r\n<p>في يونيتد تويز بنقدملك حلول ذكيه لمناطق الألعاب&nbsp;</p>\r\n<p>وبجودة عاليه مع أطول فترة ضمان ٥ سنوات&nbsp;&nbsp;</p>\r\n<p>&nbsp;متخصصون فى تصميم وتنفيذ المشروعات الترفيهية..</p>\r\n<p>لمزيد من المعلومات زور موقعنا&nbsp;</p>\r\n<p>www.unitedtoys-eg.com</p>\r\n<p>أوصفحتنا على الفيسبوك</p>\r\n<p>https://www.facebook.com/unitedtoysco/</p>\r\n<p>أو كلمنا على الخط الساخن 19810</p>\r\n<p>العاب_ ملاهى #مناطق العاب #&nbsp; &nbsp;#العابترفيهيه</p>\r\n<p>&nbsp;</p>\r\n<p>يونيتد تويز ... وجهتك الجديدة للترفيه !</p>', 'العاب,ترفيهية', '0', 1, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 21, 0, 49.12, 14.54, '156.193.176.182', 10, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-14 10:58:35', '2021-11-19 13:37:41'),
(180, 'YE', 41, 232, 2, 'يعلن مركز الصخر تكنولوجي عن تخفيضات وأسعار مناسبه للجميع تصل%30|  تعز - الحوبان - واحة المستهلك - امام الجامع', '<p><a href=\"%D9%8A%D8%B9%D9%84%D9%86%20%D9%85%D8%B1%D9%83%D8%B2%20%D8%A7%D9%84%D8%B5%D8%AE%D8%B1%D9%87%20%D8%AA%D9%83%D9%86%D9%88%D9%84%D9%88%D8%AC%D9%8A%20%D8%B9%D9%86%20%D8%AA%D8%AE%D9%81%D9%8A%D8%B6%D8%A7%D8%AA%20%D9%88%D8%A7%D8%B3%D8%B9%D8%A7%D8%B1%20%D9%85%D9%86%D8%A7%D8%B3%D8%A8%D8%A9%20%D9%84%D9%84%D8%AC%D9%85%D9%8A%D8%B9%7C%20%D9%84%D8%A7%D8%A8%D8%AA%D9%88%D8%A8%D8%A7%D8%AA%20%D8%8C%20%D8%B7%D8%A7%D8%A8%D8%B9%D8%A7%D8%AA%D8%8C%20%D9%85%D9%86%D8%B6%D9%88%D9%85%D8%A7%D8%AA%20%D9%85%D8%B1%D8%A7%D9%82%D8%A8%D8%A9%20%D8%8C%D9%83%D8%A7%D9%85%D9%8A%D8%B1%D8%A7%D8%AA%20%D8%AA%D8%B5%D9%88%D9%8A%D8%B1%20%D8%A7%D8%AD%D8%AA%D8%B1%D8%A7%D9%81%D9%8A%20%D8%8C%D8%B3%D9%85%D8%A7%D8%B9%D8%A7%D8%AA%20%D9%88%D8%AC%D9%85%D9%8A%D8%B9%20%D9%85%D8%B3%D8%AA%D9%84%D8%B2%D9%85%D8%A7%D8%AA%20%D8%A7%D9%84%D8%B5%D9%88%D8%AA%D9%8A%D8%A7%D8%AA%D8%8C%20%D8%A8%D8%B1%D8%A7%D9%85%D8%AC%20%D9%88%D8%A7%D9%86%D8%B6%D9%85%D8%A9%20%D9%85%D8%AD%D8%A7%D8%B3%D8%A8%D9%8A%D8%A9%20%D9%88%D8%AC%D9%85%D9%8A%D8%B9%20%D8%A8%D8%B1%D8%A7%D9%85%D8%AC%20%D8%A7%D9%84%D9%88%D9%8A%D9%86%D8%AF%D9%88%D8%B2%20%D9%83%D9%85%D8%A7%20%D9%8A%D8%B9%D9%84%D9%86%20%D8%B9%D9%86%20%D8%AA%D8%AE%D9%81%D9%8A%D8%B6%D8%A7%D8%AA%D9%87%20%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%20%D9%81%D9%8A%20%D8%AD%D9%82%D8%A7%D8%A6%D8%A8%20%D8%A7%D9%84%D8%A7%D8%A8%D8%AA%D9%88%D8%A8%D8%A7%D8%AA\"><strong>يعلن مركز الصخرة تكنولوجي عن</strong></a></p>\r\n<p><span style=\"color: #e03e2d;\"><strong><span style=\"background-color: #ffffff;\"><a style=\"background-color: #ffffff; color: #e03e2d;\" href=\"%D8%AA%D8%AE%D9%81%D9%8A%D8%B6%D8%A7%D8%AA%20%D9%88%D8%A7%D8%B3%D8%B9%D8%A7%D8%B1%20%D9%85%D9%86%D8%A7%D8%B3%D8%A8%D8%A9%20%D9%84%D9%84%D8%AC%D9%85%D9%8A%D8%B9%7C%20%D9%84%D8%A7%D8%A8%D8%AA%D9%88%D8%A8%D8%A7%D8%AA%20%D8%8C%20%D8%B7%D8%A7%D8%A8%D8%B9%D8%A7%D8%AA%D8%8C%20%D9%85%D9%86%D8%B6%D9%88%D9%85%D8%A7%D8%AA%20%D9%85%D8%B1%D8%A7%D9%82%D8%A8%D8%A9%20%D8%8C%D9%83%D8%A7%D9%85%D9%8A%D8%B1%D8%A7%D8%AA%20%D8%AA%D8%B5%D9%88%D9%8A%D8%B1%20%D8%A7%D8%AD%D8%AA%D8%B1%D8%A7%D9%81%D9%8A%20%D8%8C%D8%B3%D9%85%D8%A7%D8%B9%D8%A7%D8%AA%20%D9%88%D8%AC%D9%85%D9%8A%D8%B9%20%D9%85%D8%B3%D8%AA%D9%84%D8%B2%D9%85%D8%A7%D8%AA%20%D8%A7%D9%84%D8%B5%D9%88%D8%AA%D9%8A%D8%A7%D8%AA%D8%8C%20%D8%A8%D8%B1%D8%A7%D9%85%D8%AC%20%D9%88%D8%A7%D9%86%D8%B6%D9%85%D8%A9%20%D9%85%D8%AD%D8%A7%D8%B3%D8%A8%D9%8A%D8%A9%20%D9%88%D8%AC%D9%85%D9%8A%D8%B9%20%D8%A8%D8%B1%D8%A7%D9%85%D8%AC%20%D8%A7%D9%84%D9%88%D9%8A%D9%86%D8%AF%D9%88%D8%B2%20%D9%83%D9%85%D8%A7%20%D9%8A%D8%B9%D9%84%D9%86%20%D8%B9%D9%86%20%D8%AA%D8%AE%D9%81%D9%8A%D8%B6%D8%A7%D8%AA%D9%87%20%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%20%D9%81%D9%8A%20%D8%AD%D9%82%D8%A7%D8%A6%D8%A8%20%D8%A7%D9%84%D8%A7%D8%A8%D8%AA%D9%88%D8%A8%D8%A7%D8%AA\">تخفيضات واسعار مناسبة للجميع تصل الى 30%</a></span></strong></span></p>\r\n<p><span style=\"color: #e03e2d;\"><strong><span style=\"background-color: #ffffff;\"><a style=\"background-color: #ffffff; color: #e03e2d;\" href=\"%D8%AA%D8%AE%D9%81%D9%8A%D8%B6%D8%A7%D8%AA%20%D9%88%D8%A7%D8%B3%D8%B9%D8%A7%D8%B1%20%D9%85%D9%86%D8%A7%D8%B3%D8%A8%D8%A9%20%D9%84%D9%84%D8%AC%D9%85%D9%8A%D8%B9%7C%20%D9%84%D8%A7%D8%A8%D8%AA%D9%88%D8%A8%D8%A7%D8%AA%20%D8%8C%20%D8%B7%D8%A7%D8%A8%D8%B9%D8%A7%D8%AA%D8%8C%20%D9%85%D9%86%D8%B6%D9%88%D9%85%D8%A7%D8%AA%20%D9%85%D8%B1%D8%A7%D9%82%D8%A8%D8%A9%20%D8%8C%D9%83%D8%A7%D9%85%D9%8A%D8%B1%D8%A7%D8%AA%20%D8%AA%D8%B5%D9%88%D9%8A%D8%B1%20%D8%A7%D8%AD%D8%AA%D8%B1%D8%A7%D9%81%D9%8A%20%D8%8C%D8%B3%D9%85%D8%A7%D8%B9%D8%A7%D8%AA%20%D9%88%D8%AC%D9%85%D9%8A%D8%B9%20%D9%85%D8%B3%D8%AA%D9%84%D8%B2%D9%85%D8%A7%D8%AA%20%D8%A7%D9%84%D8%B5%D9%88%D8%AA%D9%8A%D8%A7%D8%AA%D8%8C%20%D8%A8%D8%B1%D8%A7%D9%85%D8%AC%20%D9%88%D8%A7%D9%86%D8%B6%D9%85%D8%A9%20%D9%85%D8%AD%D8%A7%D8%B3%D8%A8%D9%8A%D8%A9%20%D9%88%D8%AC%D9%85%D9%8A%D8%B9%20%D8%A8%D8%B1%D8%A7%D9%85%D8%AC%20%D8%A7%D9%84%D9%88%D9%8A%D9%86%D8%AF%D9%88%D8%B2%20%D9%83%D9%85%D8%A7%20%D9%8A%D8%B9%D9%84%D9%86%20%D8%B9%D9%86%20%D8%AA%D8%AE%D9%81%D9%8A%D8%B6%D8%A7%D8%AA%D9%87%20%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%20%D9%81%D9%8A%20%D8%AD%D9%82%D8%A7%D8%A6%D8%A8%20%D8%A7%D9%84%D8%A7%D8%A8%D8%AA%D9%88%D8%A8%D8%A7%D8%AA\">لابتوبات ، طابعات، منضومات مراقبة ،كاميرات تصوير احترافي ،سماعات وجميع مستلزمات الصوتيات، برامج وانضمة محاسبية وجميع برامج الويندوز كما يعلن عن تخفيضاته الكبيره في حقائب الابتوبات</a></span></strong></span></p>\r\n<p><span style=\"color: #000000;\"><strong><span style=\"background-color: #ffffff;\">زورونا تجدوا مايسركم</span></strong></span></p>\r\n<p><span style=\"color: #000000;\"><strong><span style=\"background-color: #ffffff;\"><a href=\"%D8%AA%D8%B9%D8%B2%20-%20%D8%A7%D9%84%D8%AD%D9%88%D8%A8%D8%A7%D9%86%20-%20%D9%88%D8%A7%D8%AD%D8%A9%20%D8%A7%D9%84%D9%85%D8%B3%D8%AA%D9%87%D9%84%D9%83%20-%20%D8%A7%D9%85%D8%A7%D9%85%20%D8%A7%D9%84%D8%AC%D8%A7%D9%85%D8%B9\">تعز - الحوبان - واحة المستهلك - امام الجامع</a></span></strong></span></p>', 'تخفيض,تخفيضات,سعر,اسعار,تسعير,تكنولوجي,تكنولوجى,تكنولوجيا,برامج,برنامج,برمج,برمجيات,صخره,الصخره,الصخرة', '30', 0, 'الصخره تكنولوجي', 'abdalla2alameer2@gmil.com', '+967777741230', 0, NULL, 15000000, 0, 999999.99, 345345.00, '185.80.141.91', 26, 'd06d8ec92fd4a10cb94452b98b964286', NULL, NULL, 0, 1, 0, 0, 1, 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-14 22:23:30', '2021-11-21 15:52:55'),
(183, 'YE', 39, 222, 2, 'كيا برايد', '<p>😍😍😍😍😍</p>\r\n<p>للبيع سيارة كيا برايد 2006،بترول،لون بحري،ماشية 90 الف، جير تماتيك،أربعة بسطون،حجم المكينه 14،اقتصاديه جدا،وارد كوريا،مجمرك عدن،طاوات كروم دلع،دفايات كراسي، فريمات كهرباء،مرايا كهرباء،وغيره الكثير........</p>', 'سيارات,للبيع,سيارة,سياره,كيا', '3200', 0, 'محمد الجنيد', 'aljunaidmohammed2002@gmail.com', '+967777878950', 0, NULL, 6, 2, 44.21, 15.35, '178.130.105.63', 2, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-15 17:31:19', '2021-11-16 03:31:58');
INSERT INTO `posts` (`id`, `country_code`, `user_id`, `category_id`, `post_type_id`, `title`, `description`, `tags`, `price`, `negotiable`, `contact_name`, `email`, `phone`, `phone_hidden`, `address`, `city_id`, `coin_id`, `lon`, `lat`, `ip_addr`, `visits`, `email_token`, `phone_token`, `tmp_token`, `verified_email`, `verified_phone`, `accept_terms`, `accept_marketing_offers`, `is_permanent`, `reviewed`, `featured`, `archived`, `archived_at`, `archived_manually`, `deletion_mail_sent_at`, `fb_profile`, `partner`, `deleted_at`, `created_at`, `updated_at`) VALUES
(184, 'YE', 102, 207, 2, 'صالات التزحلق علي الجليد', '<p style=\"text-align: right;\"><span style=\"font-family: Arial, \'sans-serif\';\">ثورة في عالم الترفيه لراغبي المشاريع الترفيهية</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-family: Arial, \'sans-serif\';\">يوينتد تويز بتقدم أحدث مشروعاتها الترفيهيه</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-family: Arial, \'sans-serif\';\">صالات التزحلق على الجليد على أى مساحه وبأفضل تكلفه</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-family: Arial, \'sans-serif\';\">لو مشرعك ترفيهى ... كلم يونيتد تويز</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-family: Arial, \'sans-serif\';\">لمزيد من المعلومات زور موقعنا</span></p>\r\n<p style=\"text-align: right;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<a href=\"http://www.unitedtoys-eg.com/\">www.unitedtoys-eg.com</a></p>\r\n<p style=\"text-align: right;\"><span style=\"font-family: Arial, \'sans-serif\';\">أوصفحتنا على الفيسبوك</span></p>\r\n<p style=\"text-align: right;\"><a href=\"https://www.facebook.com/unitedtoysco/\">https://www.facebook.com/unitedtoysco/</a></p>\r\n<p style=\"text-align: right;\"><span style=\"font-family: Arial, \'sans-serif\';\">أو كلمنا على الخط الساخن 19810</span></p>\r\n<p style=\"text-align: right;\">#<span style=\"font-family: Arial, \'sans-serif\';\">العاب _ملاهى #مناطق_العاب #العاب_ترفيهيه</span></p>\r\n<p style=\"text-align: right;\"><span style=\"font-family: Arial, \'sans-serif\';\">يونيتد تويز ... وجهتك الجديدة للترفيه</span> !</p>', NULL, '0', 1, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 26, 2, 45.57, 13.99, '156.193.145.138', 3, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-16 08:49:08', '2021-11-16 09:56:48'),
(185, 'YE', 102, 150, 2, 'كيدز اريا جميع الاشكال و الاحجام', '<p>مشروع الكيدز ايريا على أى مساحه مهما كانت مساحتك هننفذلك أجمل كيدز ايريا</p>\r\n<p>&nbsp;متخصصون في تجهيز مناطق العاب الاطفال حلول ذكيه لمناطق ألعاب الأطفال مع تنفيذ جميع التصميمات الفنيه والهندسية مشروعك مع يونيتد تويز هيفرق كتير....</p>\r\n<p>&nbsp;لمزيد من المعلومات زور موقعنا</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; www.unitedtoys-eg.com</p>\r\n<p>أوصفحتنا على الفيسبوك</p>\r\n<p>https://www.facebook.com/unitedtoysco/</p>\r\n<p>&nbsp;او كلمنا على الخط الساخن 19810</p>\r\n<p>&nbsp;#سوفت هاوس#ترامبولين#العاب فيديو جيم #مجمعات العاب&nbsp; #العاب_ملاهى #مناطق_العاب&nbsp;</p>\r\n<p>&nbsp;العاب_ترفيهيه #VR</p>\r\n<p>facebook.comfacebook.com</p>', 'العاب,ترفيهيه', '0', 0, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 26, 2, 45.57, 13.99, '156.193.145.138', 1, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-16 11:31:01', '2021-11-19 16:55:44'),
(186, 'YE', 102, 207, 2, 'مشروعك الترفيهي معانا على أي مساحة', '<div><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">مشروع الكيدز ايريا على أى مساحه</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">مهما كانت مساحتك هننفذلك أجمل كيدز ايريا</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">حلول ذكيه لمناطق ألعاب الأطفال</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">مع تنفيذ جميع التصميمات الفنيه والهندسية</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">مشروعك مع يونيتد تويز هيفرق كتير</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">لمزيد من المعلومات زور موقعنا&nbsp;</span><br /><a style=\"font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\" href=\"http://www.unitedtoys-eg.com/\" target=\"_blank\" rel=\"noreferrer noopener\">www.unitedtoys-eg.com</a><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">أو صفحتنا الرسمية على الفيسبوك</span><br /><a style=\"font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\" href=\"https://www.facebook.com/unitedtoysco/\" target=\"_blank\" rel=\"noreferrer noopener\">https://www.facebook.com/unitedtoysco/</a><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">أو كلمنا على الخط الساخن 19810</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">#العاب _ملاهى&nbsp;#مناطق_العاب&nbsp;#العاب_ترفيهيه</span></div>\r\n<div>&nbsp;</div>', 'العاب,ترفيهية', NULL, 1, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 24, 0, 44.78, 16.16, '156.193.145.138', 0, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-17 11:02:19', '2021-11-17 14:11:20'),
(187, 'YE', 102, 207, 2, 'تجهيز مناطق كيدز اريا', '<div><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">الكيدز إيريا بمفهوم جديد</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">&nbsp;مع يوينتد تويز هتعمل مشروعك</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">&nbsp;بأجمل تصميم</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">مشروعك مع يونيتد تويز ..هيفرق كتير !</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">متخصصون فى تصميم وتنفيذ المشروعات الترفيهية..</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">لمزيد من المعلومات زور موقعنا</span><br /><a style=\"font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\" href=\"http://www.unitedtoys-eg.com/\" target=\"_blank\" rel=\"noreferrer noopener\">www.unitedtoys-eg.com</a><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">أو صفحتنا الرسمية على الفيسبوك</span><br /><a style=\"font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\" href=\"https://www.facebook.com/unitedtoysco/\" target=\"_blank\" rel=\"noreferrer noopener\">https://www.facebook.com/unitedtoysco/</a><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">أو كلمنا على الخط الساخن 19810</span><br /><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">#العاب_ملاهى #مناطق_العاب #العاب_ترفيهيه #كيدز_إريا</span></div>\r\n<div>&nbsp;</div>', 'العاب,ترفيهية', '0', 1, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 23, 0, 42.95, 14.80, '156.193.145.138', 0, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-17 15:16:13', '2021-11-17 18:23:40'),
(188, 'YE', 103, 207, 1, 'فرصة استثمارية', '<p>فرصة استثمارية</p>\r\n<p>استثمر في سوق الفوركس</p>\r\n<p>قيمة الاستثمار 1000 للسهم</p>\r\n<p>عدد الاسهم 10</p>\r\n<p>التراصل</p>\r\n<p>والاستفسار</p>\r\n<p>711035576</p>', 'استثمار,فوركس,فرصة', '1000', 0, 'عبدالعزيز الاهدل', 'alahdalabdulaziz7@gmail.com', '+967711035576', 0, NULL, 6, 0, 44.21, 15.35, '175.110.40.153', 1, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-17 16:28:49', '2021-11-17 21:27:16'),
(189, 'YE', 103, 207, 1, 'مدرس لغة انجليزية خصوصي', '<p>هل تحفظ بعض الكلمات الإنجليزية البسيطة</p>\r\n<p>&nbsp;</p>\r\n<p>لكنك لا تستطيع التحدث</p>\r\n<p>&nbsp;</p>\r\n<p>ابدأ معنا مع افضل برنامج لتعلم اللغة الانجليزية</p>\r\n<p>وستلاحظ الفرق من الدروس الاولى</p>', 'انجليزي,دروس,مدرس,معلم,خصوصي', '10000', 1, 'عبدالعزيز الاهدل', 'alahdalabdulaziz7@gmail.com', '+967711035576', 0, NULL, 6, 0, 44.21, 15.35, '110.238.33.137', 2, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-17 16:38:43', '2021-11-20 08:23:09'),
(190, 'YE', 102, 207, 2, 'العاب الواقع الافتراضي', '<p><span style=\"font-family: \'Segoe Print\'; font-size: 12px; background-color: #ffffff;\">عيش تجربة الواقع الافتراضى مع يونيتد تويزهنفذلك اكتر من 100 لعبة واقع افتراضي مثير هتعيش الواقع بشكل جديد نحن </span><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif; font-size: 15px; background-color: #f8f8f8;\">متخصصون في تجهيز مناطق الالعاب الترفيهيه بحلول ذكية لمناطق العاب الاطفال مع تنفيذ جميع التصميمات الفنية و الهندسية و نحن الوكيل الوحيد فى مصر والشرق الاوسط&nbsp;</span></p>\r\n<div><span style=\"color: #1d1c1d; font-family: \'Slack-Lato\', appleLogo, sans-serif;\"><span style=\"font-size: 15px; background-color: #f8f8f8;\">مشروعك مع يونيتد تويز هيفرق كتير...</span></span>\r\n<div>و للمزيد من المعلومات زور موقعنا www.unitedtoys-eg.com أو صفحتنا الرسمية على الفيسبوك https://www.facebook.com/unitedtoysco/ أو كلمنا على الخط الساخن 19810</div>\r\n<div><span style=\"color: #444444; font-family: Nunito, sans-serif; font-size: 17px;\">#سوفت_هاوس#العاب_ فيديو_جيم #مجمعات_العاب #العاب_ملاهى #مناطق_العاب</span><br /><span style=\"color: #444444; font-family: Nunito, sans-serif; font-size: 17px;\">العاب_ترفيهيه #VR #كيدز_اريا</span></div>\r\n</div>', 'العاب_,ترفيهية', '0', 0, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 21, 1, 49.12, 14.54, '156.193.7.160', 0, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-18 13:26:46', '2021-11-20 19:40:27'),
(191, 'YE', 39, 222, 2, 'صالون لاندكروزر', '<p>الموديل/2010.&nbsp; المشي/80 كيلو.&nbsp; اللون/فضي.&nbsp; &nbsp;محركات على الشرط.&nbsp; &nbsp;سليمه صدمه.&nbsp; سليمه ذحل.&nbsp; فل كامل.&nbsp;</p>\r\n<p>مجمرك مرقم جاهز&nbsp;</p>', 'سيارات,للبيع,سياره,صالون,سيارة', '85000', 0, 'محمد الجنيد', 'aljunaidmohammed2002@gmail.com', '+967777878950', 0, NULL, 6, 1, 44.21, 15.35, '175.110.3.13', 7, NULL, NULL, NULL, 1, 1, 0, 0, 0, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-20 08:43:01', '2021-11-20 09:48:07'),
(192, 'YE', 105, 176, 1, 'بدروم كبير للايجار بالجرف الشرقي بجانب محطه العاصمه للايجار', '<p>بدروم للايجار واسع بالجراف الشرقي خلف محطة العاصمة&nbsp;</p>', 'صنعاء,بدروم,الجراف', NULL, 1, 'ماجد الوادعي', 'myq733@gmail.com', '+967738354922', 0, NULL, 6, 0, 44.21, 15.35, '31.31.182.128', 5, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-20 09:33:10', '2021-11-20 21:34:10'),
(193, 'YE', 103, 207, 1, 'استثمر في سوق الفوركس', '<p>استثمر معنا في سوق الفوركس</p>\r\n<p>الهدف&nbsp;</p>\r\n<p>إنشاء محفظة بقيمة</p>\r\n<p>عشرة آلاف دولار</p>\r\n<p>يمكن الإستثمار بحد ادنى</p>\r\n<p>الف دولار</p>\r\n<p>لمزيد من المعلومات&nbsp;</p>\r\n<p>711035576</p>', 'فوركس,استثمار,ارباح,اسهم,عملات,فرصة', '1000', 0, 'عبدالعزيز الاهدل', 'alahdalabdulaziz7@gmail.com', '+967711035576', 0, NULL, 6, 2, 44.21, 15.35, '175.110.40.127', 0, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-20 13:21:42', '2021-11-20 19:42:18'),
(194, 'YE', 103, 207, 1, 'تعلم لغة انجليزية بسهولة', '<p>طريقة جديدة ورائعة لتعلم اللغة الانجليزية</p>\r\n<p>سجل معي في منهج روزيتا ستون العالمي</p>\r\n<p>ستلاحظ الفرق من الاسبوع الاول</p>\r\n<p>&nbsp;</p>\r\n<p>لمزيد من المعلومات</p>\r\n<p>71103576</p>', 'لغة,انجليزي,معلم,مدرس,انجليزية,تعلم,ادرس', '10000', 1, 'عبدالعزيز الاهدل', 'alahdalabdulaziz7@gmail.com', '+967711035576', 0, NULL, 6, 0, 44.21, 15.35, '175.110.40.127', 0, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-20 13:27:26', '2021-11-20 19:39:25'),
(195, 'YE', 106, 182, 2, 'موبيليات ابوعبدالرحمن', '<p>*ابو عبدالرحمن للموبيليا والديكور* </p>\n<p> _غرف نوم_</p>\n<p> _مكاتب_</p>\n<p> _مطابخ_</p>\n<p> _ديكورات محلات_</p>\n<p> _طاولات_</p>\n<p> _مجالس مغربي_</p>\n<p> _وجميع اعمال النجاره_</p>\n<p>*صنعاء جوله النصر بإتجاه شارع الاربعين جوار مدينه العمال* </p>\n<p>ت/773194387</p>\n<p>ت/779110115</p>\n<p>ت/779110119</p>', NULL, NULL, NULL, 'AY-Store', 'aymenadelalghaili@gmail.com', '+967712328869', 1, NULL, 6, 0, 44.21, 15.35, '46.161.232.254', 4, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 1, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-20 19:19:53', '2021-11-21 20:00:43'),
(196, 'YE', 104, 239, 2, 'جنابي صيفاني', '<p>جنبيه صيفاني من أروع الجنابي&nbsp;</p>', 'جنابي,جنبيه,صيفاني,وحيد,القرن', '40000', 1, 'ابراهيم بن القديمي', 'alqdymyabrahym8@gmail.com', '+967771709771', 0, NULL, 6, 1, 44.21, 15.35, '134.35.149.70', 4, NULL, NULL, '403d5bdaa55d7f26714a3c5002fa3cfb', 1, 1, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-20 21:07:39', '2021-11-21 19:48:21'),
(197, 'YE', 104, 238, 2, 'جنابي صيفاني', '<p>جنبيه صيفاني&nbsp;&nbsp;</p>', 'جنبيه,جنابي,صيفاني,وحيد,القرن', '40000', 1, 'ابراهيم بن القديمي', 'alqdymyabrahym8@gmail.com', '+967771709771', 0, NULL, 6, 1, 44.21, 15.35, '134.35.149.70', 1, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-20 21:13:01', '2021-11-21 16:17:24'),
(198, 'YE', 102, 150, 2, 'وحدات تجهيز مناطق العاب خارجيه', '<p>ماتقبلش بأقل من رقم واحد !</p>\r\n<p>Gottardo ألعاب الحدائق الإيطالية دلوقتى فى مصر طبقا للمواصفات القياسية العالميه وبضمان ١٠ سنوات</p>\r\n<p>متخصصون في تجهيز مناطق الالعاب الترفيهيه الوكيل الوحيد فى مصر والشرق الأوسط</p>\r\n<p>يونيتد تويز لتجهيز الكيدز اريا</p>\r\n<p>متخصصون فى تصميم وتنفيذ المشروعات الترفيهية..</p>\r\n<p>لمزيد من المعلومات زور موقعنا</p>\r\n<p>www.unitedtoys-eg.com</p>\r\n<p>أوصفحتنا على الفيسبوك</p>\r\n<p>https://www.facebook.com/unitedtoysco/</p>\r\n<p>أو كلمنا على الخط الساخن 19810</p>\r\n<p>#العاب ملاهى #مناطق العاب #العاب ترفيهيه&nbsp; #الكيدزإريا</p>', 'الالعاب,الترفيهيه', '0', 0, 'Unitedtoys', 'aismail@unitedtoys-eg.com', '01015559900', 0, NULL, 26, 0, 45.57, 13.99, '156.193.7.160', 4, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, '2021-11-21 10:59:00', '2021-11-21 19:48:37');

-- --------------------------------------------------------

--
-- Table structure for table `post_types`
--

CREATE TABLE `post_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_types`
--

INSERT INTO `post_types` (`id`, `name`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, '{\"ar\":\"شخصي\"}', NULL, NULL, NULL, 1),
(2, '{\"ar\":\"تجاري\"}', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_values`
--

CREATE TABLE `post_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `option_id` int(10) UNSIGNED DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_values`
--

INSERT INTO `post_values` (`id`, `post_id`, `field_id`, `option_id`, `value`) VALUES
(492, 97, 8, NULL, '65'),
(539, 115, 8, NULL, '66'),
(540, 115, 44, NULL, '378'),
(588, 121, 2, NULL, '2021_2020_2019_2018'),
(589, 121, 4, NULL, 'زيروووو'),
(590, 121, 5, NULL, '57'),
(591, 121, 6, 213, '213'),
(592, 121, 6, 210, '210'),
(593, 121, 6, 209, '209'),
(594, 121, 6, 212, '212'),
(595, 121, 6, 206, '206'),
(596, 121, 6, 205, '205'),
(597, 121, 6, 214, '214'),
(598, 121, 6, 202, '202'),
(599, 121, 6, 207, '207'),
(600, 121, 6, 208, '208'),
(601, 121, 6, 204, '204'),
(602, 121, 6, 211, '211'),
(603, 121, 6, 203, '203'),
(604, 121, 6, 59, '59'),
(605, 121, 6, 60, '60'),
(606, 121, 6, 61, '61'),
(607, 121, 6, 62, '62'),
(608, 121, 7, NULL, '63'),
(609, 121, 8, NULL, '65'),
(610, 121, 28, NULL, 'جميع الالوان'),
(614, 125, 8, NULL, '65'),
(615, 125, 28, NULL, 'متعدد اللوان'),
(616, 125, 39, NULL, 'جملة'),
(617, 125, 40, NULL, '330'),
(618, 125, 41, NULL, '349'),
(619, 120, 2, NULL, '2018'),
(620, 120, 4, NULL, '16 الف ميل'),
(621, 120, 5, NULL, '57'),
(622, 120, 6, 213, '213'),
(623, 120, 6, 210, '210'),
(624, 120, 6, 209, '209'),
(625, 120, 6, 212, '212'),
(626, 120, 6, 202, '202'),
(627, 120, 6, 207, '207'),
(628, 120, 7, NULL, '63'),
(629, 120, 8, NULL, '65'),
(630, 120, 28, NULL, 'رصاصي'),
(631, 131, 8, NULL, '65'),
(632, 131, 28, NULL, 'اخضر'),
(633, 131, 38, NULL, '296'),
(634, 131, 39, NULL, 'متوسط'),
(635, 131, 40, NULL, '327'),
(636, 132, 8, NULL, '65'),
(637, 132, 28, NULL, 'اخضر'),
(638, 132, 38, NULL, '296'),
(639, 132, 39, NULL, 'متوسط'),
(640, 132, 40, NULL, '329'),
(654, 133, 2, NULL, '2008'),
(655, 133, 4, NULL, '190000'),
(656, 133, 5, NULL, '57'),
(657, 133, 6, 210, '210'),
(658, 133, 6, 209, '209'),
(659, 133, 6, 212, '212'),
(660, 133, 6, 206, '206'),
(661, 133, 6, 214, '214'),
(662, 133, 6, 202, '202'),
(663, 133, 6, 207, '207'),
(664, 133, 7, NULL, '63'),
(665, 133, 8, NULL, '66'),
(666, 133, 28, NULL, 'بيج'),
(725, 141, 2, NULL, '2008'),
(726, 141, 4, NULL, '138 الف كيلومتر'),
(727, 141, 5, NULL, '57'),
(728, 141, 7, NULL, '63'),
(729, 141, 8, NULL, '66'),
(730, 141, 28, NULL, 'بحري'),
(742, 139, 2, NULL, '2006'),
(743, 139, 4, NULL, '80'),
(744, 139, 5, NULL, '57'),
(745, 139, 6, 212, '212'),
(746, 139, 6, 206, '206'),
(747, 139, 6, 202, '202'),
(748, 139, 6, 211, '211'),
(749, 139, 6, 61, '61'),
(750, 139, 7, NULL, '63'),
(751, 139, 8, NULL, '66'),
(752, 139, 28, NULL, 'مدادي'),
(757, 183, 2, NULL, '2006'),
(758, 183, 4, NULL, '90 الف'),
(759, 183, 5, NULL, '57'),
(760, 183, 7, NULL, '63'),
(761, 183, 8, NULL, '66'),
(762, 183, 28, NULL, 'بحري'),
(763, 185, 8, NULL, '65'),
(764, 191, 2, NULL, '2010'),
(765, 191, 4, NULL, '80'),
(766, 191, 5, NULL, '57'),
(767, 191, 6, 209, '209'),
(768, 191, 6, 206, '206'),
(769, 191, 6, 205, '205'),
(770, 191, 6, 202, '202'),
(771, 191, 6, 59, '59'),
(772, 191, 6, 60, '60'),
(773, 191, 6, 61, '61'),
(774, 191, 7, NULL, '64'),
(775, 191, 8, NULL, '66'),
(776, 191, 28, NULL, 'فضي'),
(777, 198, 8, NULL, '65');

-- --------------------------------------------------------

--
-- Table structure for table `report_types`
--

CREATE TABLE `report_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_types`
--

INSERT INTO `report_types` (`id`, `name`) VALUES
(1, '{\"ar\": \"تزوير\"}'),
(2, '{\"ar\": \"مكرر\"}'),
(3, '{\"ar\": \"بريد مؤذي\"}'),
(4, '{\"ar\": \"فئة خاطئة\"}'),
(5, '{\"ar\": \"آخر\"}');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'web', '2021-04-03 08:39:44', '2021-04-03 08:39:44');

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
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saved_posts`
--

INSERT INTO `saved_posts` (`id`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(9, 1, NULL, '2021-08-01 14:12:51', '2021-08-01 14:12:51'),
(14, 54, 129, '2021-10-11 15:50:25', '2021-10-11 15:50:25'),
(15, 54, 130, '2021-10-11 15:50:29', '2021-10-11 15:50:29'),
(16, 1, 128, '2021-10-16 09:47:43', '2021-10-16 09:47:43'),
(18, 41, NULL, '2021-11-17 02:52:07', '2021-11-17 02:52:07');

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE `saved_search` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'To show',
  `query` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(10) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saved_search`
--

INSERT INTO `saved_search` (`id`, `country_code`, `user_id`, `keyword`, `query`, `count`, `created_at`, `updated_at`) VALUES
(1, 'YE', 1, 'تلفون', 'q=%D8%AA%D9%84%D9%81%D9%88%D9%86', 19, '2021-10-16 09:45:09', '2021-10-16 09:45:09');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `payload` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_agent` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `lft` int(10) UNSIGNED DEFAULT NULL,
  `rgt` int(10) UNSIGNED DEFAULT NULL,
  `depth` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `name`, `value`, `description`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`, `created_at`, `updated_at`) VALUES
(1, 'app', 'Application', '{\"purchase_code\":\"192f0c39-c604-4033-a850-84f918d0b5b3\",\"app_name\":\"\\u062f\\u0644\\u0640\\u0640\\u0640\\u0648\\u0646\\u0640\\u0640\\u064a\",\"slogan\":\"\\u062f \\u0644\\u0640\\u0640\\u0640\\u0648\\u0646\\u0640\\u0640\\u064a\",\"logo\":\"app\\/logo\\/logo-616320a6de88f.png\",\"favicon\":\"app\\/ico\\/ico-61096be171b44.png\",\"email\":\"engbyq@gmail.com\",\"phone_number\":null,\"auto_detect_language\":\"1\",\"php_specific_date_format\":\"0\",\"date_format\":\"YYYY-MM-DD\",\"datetime_format\":\"YYYY-MM-DD HH:mm\",\"date_force_utf8\":\"1\",\"logo_dark\":\"app\\/backend\\/logo-dark-61096be17de0a.png\",\"logo_light\":\"app\\/backend\\/logo-light-61096be182e29.png\",\"vector_charts_type\":\"morris_bar\",\"latest_entries_limit\":\"5\",\"show_countries_charts\":\"1\",\"general_settings_as_submenu_in_sidebar\":\"1\"}', 'Application Setup', NULL, NULL, 2, 3, 1, 1, NULL, NULL),
(2, 'style', 'Style', '{\"app_skin\":\"skin-blue\",\"body_background_color\":null,\"body_text_color\":null,\"body_background_image\":null,\"body_background_image_fixed\":\"0\",\"page_width\":null,\"title_color\":null,\"progress_background_color\":null,\"link_color\":null,\"link_color_hover\":null,\"header_sticky\":\"1\",\"header_height\":null,\"header_background_color\":null,\"header_bottom_border_width\":null,\"header_bottom_border_color\":\"#E8E8E8\",\"header_link_color\":null,\"header_link_color_hover\":null,\"footer_background_color\":null,\"footer_text_color\":null,\"footer_title_color\":null,\"footer_link_color\":null,\"footer_link_color_hover\":null,\"payment_icon_top_border_width\":null,\"payment_icon_top_border_color\":null,\"payment_icon_bottom_border_width\":null,\"payment_icon_bottom_border_color\":null,\"btn_post_bg_top_color\":null,\"btn_post_bg_bottom_color\":null,\"btn_post_border_color\":null,\"btn_post_text_color\":null,\"btn_post_bg_top_color_hover\":null,\"btn_post_bg_bottom_color_hover\":null,\"btn_post_border_color_hover\":null,\"btn_post_text_color_hover\":null,\"custom_css\":null,\"login_bg_image\":null,\"admin_logo_bg\":\"skin3\",\"admin_navbar_bg\":\"skin6\",\"admin_sidebar_type\":\"full\",\"admin_sidebar_bg\":\"skin5\",\"admin_sidebar_position\":\"1\",\"admin_header_position\":\"1\",\"admin_boxed_layout\":\"0\",\"admin_dark_theme\":\"0\"}', 'Style Customization', NULL, NULL, 4, 5, 1, 1, NULL, NULL),
(3, 'listing', 'Listing & Search', '{\"display_mode\":\".grid-view\",\"grid_view_cols\":\"4\",\"items_per_page\":\"12\",\"left_sidebar\":\"1\",\"fake_locations_results\":\"1\",\"count_categories_posts\":\"0\",\"count_cities_posts\":\"0\",\"elapsed_time_from_now\":\"1\",\"hide_dates\":\"0\",\"cities_extended_searches\":\"1\",\"distance_calculation_formula\":\"haversine\",\"search_distance_default\":\"50\",\"search_distance_max\":\"500\",\"search_distance_interval\":\"100\"}', 'Listing & Search Options', NULL, NULL, 6, 7, 1, 1, NULL, NULL),
(4, 'single', 'Ads (Form & Page)', '{\"publication_form_type\":\"1\",\"picture_mandatory\":\"1\",\"pictures_limit\":\"5\",\"tags_limit\":\"15\",\"guests_can_post_ads\":\"0\",\"posts_review_activation\":\"1\",\"permanent_posts_enabled\":\"4\",\"pricing_page_enabled\":\"0\",\"allow_emojis\":\"1\",\"show_post_types\":\"1\",\"auto_registration\":\"1\",\"wysiwyg_editor\":\"tinymce\",\"remove_url_before\":\"0\",\"remove_url_after\":\"0\",\"remove_email_before\":\"0\",\"remove_email_after\":\"0\",\"remove_phone_before\":\"0\",\"remove_phone_after\":\"0\",\"convert_phone_number_to_img\":\"0\",\"hide_phone_number\":\"0\",\"show_security_tips\":\"1\",\"enable_whatsapp_btn\":\"1\",\"pre_filled_whatsapp_message\":\"1\",\"elapsed_time_from_now\":\"1\",\"hide_dates\":\"0\",\"pictures_slider\":\"horizontal-thumb\",\"similar_posts\":\"1\",\"guests_can_contact_ads_authors\":\"1\",\"show_post_on_googlemap\":\"0\",\"activation_facebook_comments\":\"0\"}', 'Ads (Form & Single Page) Options', NULL, NULL, 8, 9, 1, 1, NULL, NULL),
(5, 'mail', 'Mail', '{\"driver\":\"smtp\",\"host\":\"mail.deloony.com\",\"port\":\"465\",\"username\":\"admin@deloony.com\",\"password\":\"deloony_2021\",\"encryption\":\"ssl\",\"mailgun_domain\":null,\"mailgun_secret\":null,\"mailgun_endpoint\":\"api.mailgun.net\",\"postmark_token\":null,\"ses_key\":null,\"ses_secret\":null,\"ses_region\":null,\"mandrill_secret\":null,\"sparkpost_secret\":null,\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\",\"email_sender\":\"admin@deloony.com\",\"email_verification\":\"1\",\"confirmation\":\"1\",\"admin_notification\":\"1\",\"payment_notification\":\"1\"}', 'Mail Sending Configuration', NULL, NULL, 10, 11, 1, 1, NULL, NULL),
(6, 'sms', 'SMS', '{\"driver\":\"twilio\",\"nexmo_key\":\"790f5e4c\",\"nexmo_secret\":\"3JSVarBevWNv9o7p\",\"nexmo_from\":\"yemensight\",\"twilio_username\":\"dev.yemensight@gmail.com\",\"twilio_password\":\"9YpW^y4wn?P2YU_\",\"twilio_auth_token\":\"31aa422266b8740562e3f0b9abd27264\",\"twilio_account_sid\":\"AC6cd1966bd41777bf24d810ffdd3cffd6\",\"twilio_from\":\"yemensight\",\"twilio_alpha_sender\":\"yemensight\",\"twilio_sms_service_sid\":null,\"twilio_debug_to\":\"770006791\",\"phone_verification\":\"0\",\"message_activation\":\"0\"}', 'SMS Sending Configuration', NULL, NULL, 12, 13, 1, 1, NULL, NULL),
(7, 'upload', 'Upload', '{\"file_types\":\"pdf,doc,docx,word,rtf,rtx,ppt,pptx,odt,odp,wps,jpeg,jpg,bmp,png\",\"min_file_size\":\"0\",\"max_file_size\":\"64000\",\"image_types\":\"jpg,jpeg,gif,png\",\"image_quality\":\"90\",\"min_image_size\":\"0\",\"max_image_size\":\"256000\",\"img_resize_width\":\"1500\",\"img_resize_height\":\"1500\",\"img_resize_ratio\":\"1\",\"img_resize_upsize\":\"1\",\"img_resize_logo_width\":\"420\",\"img_resize_logo_height\":\"594\",\"img_resize_logo_ratio\":\"1\",\"img_resize_logo_upsize\":\"0\",\"img_resize_cat_width\":\"70\",\"img_resize_cat_height\":\"70\",\"img_resize_cat_ratio\":\"1\",\"img_resize_cat_upsize\":\"0\",\"img_resize_small_resize_type\":\"2\",\"img_resize_small_width\":\"120\",\"img_resize_small_height\":\"90\",\"img_resize_small_ratio\":\"1\",\"img_resize_small_upsize\":\"0\",\"img_resize_small_position\":\"center\",\"img_resize_small_relative\":\"0\",\"img_resize_small_bg_color\":\"#FFFFFF\",\"img_resize_medium_resize_type\":\"2\",\"img_resize_medium_width\":\"320\",\"img_resize_medium_height\":\"240\",\"img_resize_medium_ratio\":\"1\",\"img_resize_medium_upsize\":\"0\",\"img_resize_medium_position\":\"center\",\"img_resize_medium_relative\":\"0\",\"img_resize_medium_bg_color\":\"#FFFFFF\",\"img_resize_big_resize_type\":\"0\",\"img_resize_big_width\":\"816\",\"img_resize_big_height\":\"460\",\"img_resize_big_ratio\":\"1\",\"img_resize_big_upsize\":\"0\",\"img_resize_big_position\":\"center\",\"img_resize_big_relative\":\"0\",\"img_resize_big_bg_color\":\"#FFFFFF\"}', 'Upload Settings', NULL, NULL, 14, 15, 1, 1, NULL, NULL),
(8, 'geo_location', 'Geo Location', '{\"default_country_code\":\"YE\"}', 'Geo Location Configuration', NULL, NULL, 16, 17, 1, 1, NULL, NULL),
(9, 'security', 'Security', '{\"csrf_protection\":\"0\",\"login_open_in_modal\":\"1\",\"login_max_attempts\":\"30\",\"login_decay_minutes\":\"1\",\"recaptcha_activation\":\"0\",\"recaptcha_site_key\":null,\"recaptcha_secret_key\":null,\"recaptcha_version\":\"v2\",\"recaptcha_skip_ips\":null}', 'Security Options', NULL, NULL, 18, 19, 1, 1, NULL, NULL),
(10, 'social_auth', 'Social Login', '{\"social_login_activation\":\"0\",\"facebook_client_id\":null,\"facebook_client_secret\":null,\"linkedin_client_id\":null,\"linkedin_client_secret\":null,\"twitter_client_id\":null,\"twitter_client_secret\":null,\"google_client_id\":\"52106178842-9h2ovup09o10pjb30btupa9rt4dm89lp.apps.googleusercontent.com\",\"google_client_secret\":\"8p4IKpsDojbqfH51Qhf58pJv\"}', 'Social Network Login', NULL, NULL, 20, 21, 1, 1, NULL, NULL),
(11, 'social_link', 'Social Network', NULL, 'Social Network Profiles', NULL, NULL, 22, 23, 1, 1, NULL, NULL),
(12, 'optimization', 'Optimization', NULL, 'Optimization Tools', NULL, NULL, 24, 25, 1, 1, NULL, NULL),
(13, 'seo', 'SEO', NULL, 'SEO Tools', NULL, NULL, 26, 27, 1, 1, NULL, NULL),
(14, 'other', 'Others', '{\"cookie_consent_enabled\":\"0\",\"show_tips_messages\":\"1\",\"googlemaps_key\":null,\"timer_new_messages_checking\":\"60000\",\"wysiwyg_editor\":\"tinymce\",\"ios_app_url\":null,\"android_app_url\":null,\"decimals_superscript\":\"0\",\"cookie_expiration\":\"86400\",\"js_code\":\"<!-- Global site tag (gtag.js) - Google Analytics -->\\r\\n<script async src=\\\"https:\\/\\/www.googletagmanager.com\\/gtag\\/js?id=G-1Q606ZW3PH\\\"><\\/script>\\r\\n<script>\\r\\n  window.dataLayer = window.dataLayer || [];\\r\\n  function gtag(){dataLayer.push(arguments);}\\r\\n  gtag(\'js\', new Date());\\r\\n\\r\\n  gtag(\'config\', \'G-1Q606ZW3PH\');\\r\\n<\\/script>\"}', 'Other Options', NULL, NULL, 28, 29, 1, 1, NULL, NULL),
(15, 'cron', 'Cron', '{\"unactivated_posts_expiration\":\"150\",\"activated_posts_expiration\":\"150\",\"archived_posts_expiration\":\"150\",\"manually_archived_posts_expiration\":\"150\"}', 'Cron Job', NULL, NULL, 30, 31, 1, 1, NULL, NULL),
(16, 'footer', 'Footer', '{\"hide_links\":\"0\",\"hide_payment_plugins_logos\":\"0\",\"hide_powered_by\":\"1\",\"powered_by_info\":\"yemen sight\",\"tracking_code\":null}', 'Pages Footer', NULL, NULL, 32, 33, 1, 1, NULL, NULL),
(17, 'backup', 'Backup', NULL, 'Backup Configuration', NULL, NULL, 34, 35, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin1`
--

CREATE TABLE `subadmin1` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subadmin1`
--

INSERT INTO `subadmin1` (`id`, `code`, `country_code`, `name`, `active`) VALUES
(1, 'YE.25', 'YE', '{\"ar\":\"صنعاء\"}', 1),
(2, 'YE.05', 'YE', '{}', 1),
(3, 'YE.16', 'YE', '{}', 1),
(4, 'YE.15', 'YE', '{}', 1),
(5, 'YE.27', 'YE', '{}', 1),
(6, 'YE.14', 'YE', '{}', 1),
(7, 'YE.10', 'YE', '{}', 1),
(8, 'YE.21', 'YE', '{}', 1),
(9, 'YE.04', 'YE', '{}', 1),
(10, 'YE.11', 'YE', '{}', 1),
(11, 'YE.03', 'YE', '{}', 1),
(12, 'YE.08', 'YE', '{}', 1),
(13, 'YE.20', 'YE', '{}', 1),
(14, 'YE.02', 'YE', '{}', 1),
(15, 'YE.01', 'YE', '{}', 1),
(16, 'YE.18', 'YE', '{}', 1),
(17, 'YE.19', 'YE', '{}', 1),
(18, 'YE.22', 'YE', '{}', 1),
(19, 'YE.23', 'YE', '{}', 1),
(20, 'YE.24', 'YE', '{}', 1),
(21, 'YE.26', 'YE', '{}', 1),
(22, 'YE.28', 'YE', '{}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin2`
--

CREATE TABLE `subadmin2` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subadmin2`
--

INSERT INTO `subadmin2` (`id`, `code`, `country_code`, `subadmin1_code`, `name`, `active`) VALUES
(1, 'YE.08.1807', 'YE', 'YE.08', '{}', 1),
(2, 'YE.08.1824', 'YE', 'YE.08', '{}', 1),
(3, 'YE.23.1102', 'YE', 'YE.23', '{}', 1),
(4, 'YE.22.1730', 'YE', 'YE.22', '{}', 1),
(5, 'YE.23.1111', 'YE', 'YE.23', '{}', 1),
(6, 'YE.10.2702', 'YE', 'YE.10', '{}', 1),
(7, 'YE.25.1502', 'YE', 'YE.25', '{}', 1),
(8, 'YE.20.1419', 'YE', 'YE.20', '{}', 1),
(9, 'YE.19.2905', 'YE', 'YE.19', '{}', 1),
(10, 'YE.16.2305', 'YE', 'YE.16', '{}', 1),
(11, 'YE.15.2211', 'YE', 'YE.15', '{}', 1),
(12, 'YE.15.2215', 'YE', 'YE.15', '{}', 1),
(13, 'YE.20.1413', 'YE', 'YE.20', '{}', 1),
(14, 'YE.15.2205', 'YE', 'YE.15', '{}', 1),
(15, 'YE.23.1104', 'YE', 'YE.23', '{}', 1),
(16, 'YE.25.1506', 'YE', 'YE.25', '{}', 1),
(17, 'YE.25.1501', 'YE', 'YE.25', '{}', 1),
(18, 'YE.14.2612', 'YE', 'YE.14', '{}', 1),
(19, 'YE.23.1107', 'YE', 'YE.23', '{}', 1),
(20, 'YE.08.1820', 'YE', 'YE.08', '{}', 1),
(21, 'YE.19.2919', 'YE', 'YE.19', '{}', 1),
(22, 'YE.10.2701', 'YE', 'YE.10', '{}', 1),
(23, 'YE.23.1120', 'YE', 'YE.23', '{}', 1),
(24, 'YE.19.2902', 'YE', 'YE.19', '{}', 1),
(25, 'YE.04.1928', 'YE', 'YE.04', '{}', 1),
(26, 'YE.14.2609', 'YE', 'YE.14', '{}', 1),
(27, 'YE.22.1702', 'YE', 'YE.22', '{}', 1),
(28, 'YE.16.2301', 'YE', 'YE.16', '{}', 1),
(29, 'YE.22.1728', 'YE', 'YE.22', '{}', 1),
(30, 'YE.23.1116', 'YE', 'YE.23', '{}', 1),
(31, 'YE.11.2008', 'YE', 'YE.11', '{}', 1),
(32, 'YE.08.1817', 'YE', 'YE.08', '{}', 1),
(33, 'YE.20.1410', 'YE', 'YE.20', '{}', 1),
(34, 'YE.21.1610', 'YE', 'YE.21', '{}', 1),
(35, 'YE.08.1810', 'YE', 'YE.08', '{}', 1),
(36, 'YE.11.2010', 'YE', 'YE.11', '{}', 1),
(37, 'YE.19.2915', 'YE', 'YE.19', '{}', 1),
(38, 'YE.15.2208', 'YE', 'YE.15', '{}', 1),
(39, 'YE.22.1704', 'YE', 'YE.22', '{}', 1),
(40, 'YE.22.1713', 'YE', 'YE.22', '{}', 1),
(41, 'YE.22.1724', 'YE', 'YE.22', '{}', 1),
(42, 'YE.23.1109', 'YE', 'YE.23', '{}', 1),
(43, 'YE.23.1101', 'YE', 'YE.23', '{}', 1),
(44, 'YE.22.1717', 'YE', 'YE.22', '{}', 1),
(45, 'YE.26.1310', 'YE', 'YE.26', '{}', 1),
(46, 'YE.25.1523', 'YE', 'YE.25', '{}', 1),
(47, 'YE.25.1512', 'YE', 'YE.25', '{}', 1),
(48, 'YE.25.1511', 'YE', 'YE.25', '{}', 1),
(49, 'YE.25.1513', 'YE', 'YE.25', '{}', 1),
(50, 'YE.25.1515', 'YE', 'YE.25', '{}', 1),
(51, 'YE.25.1509', 'YE', 'YE.25', '{}', 1),
(52, 'YE.21.1604', 'YE', 'YE.21', '{}', 1),
(53, 'YE.21.1612', 'YE', 'YE.21', '{}', 1),
(54, 'YE.22.1715', 'YE', 'YE.22', '{}', 1),
(55, 'YE.22.1703', 'YE', 'YE.22', '{}', 1),
(56, 'YE.22.1705', 'YE', 'YE.22', '{}', 1),
(57, 'YE.22.1727', 'YE', 'YE.22', '{}', 1),
(58, 'YE.22.1729', 'YE', 'YE.22', '{}', 1),
(59, 'YE.08.1805', 'YE', 'YE.08', '{}', 1),
(60, 'YE.08.1814', 'YE', 'YE.08', '{}', 1),
(61, 'YE.08.1813', 'YE', 'YE.08', '{}', 1),
(62, 'YE.08.1821', 'YE', 'YE.08', '{}', 1),
(63, 'YE.08.1804', 'YE', 'YE.08', '{}', 1),
(64, 'YE.08.1818', 'YE', 'YE.08', '{}', 1),
(65, 'YE.04.1920', 'YE', 'YE.04', '{}', 1),
(66, 'YE.11.2011', 'YE', 'YE.11', '{}', 1),
(67, 'YE.05.2105', 'YE', 'YE.05', '{}', 1),
(68, 'YE.15.2213', 'YE', 'YE.15', '{}', 1),
(69, 'YE.15.2204', 'YE', 'YE.15', '{}', 1),
(70, 'YE.15.2202', 'YE', 'YE.15', '{}', 1),
(71, 'YE.15.2203', 'YE', 'YE.15', '{}', 1),
(72, 'YE.16.2302', 'YE', 'YE.16', '{}', 1),
(73, 'YE.24.2515', 'YE', 'YE.24', '{}', 1),
(74, 'YE.24.2510', 'YE', 'YE.24', '{}', 1),
(75, 'YE.14.2604', 'YE', 'YE.14', '{}', 1),
(76, 'YE.19.2901', 'YE', 'YE.19', '{}', 1),
(77, 'YE.19.2911', 'YE', 'YE.19', '{}', 1),
(78, 'YE.23.1105', 'YE', 'YE.23', '{}', 1),
(79, 'YE.23.1103', 'YE', 'YE.23', '{}', 1),
(80, 'YE.23.1106', 'YE', 'YE.23', '{}', 1),
(81, 'YE.23.1117', 'YE', 'YE.23', '{}', 1),
(82, 'YE.23.1110', 'YE', 'YE.23', '{}', 1),
(83, 'YE.18.3009', 'YE', 'YE.18', '{}', 1),
(84, 'YE.18.3003', 'YE', 'YE.18', '{}', 1),
(85, 'YE.27.3102', 'YE', 'YE.27', '{}', 1),
(86, 'YE.27.3105', 'YE', 'YE.27', '{}', 1),
(87, 'YE.27.3104', 'YE', 'YE.27', '{}', 1),
(88, 'YE.27.3103', 'YE', 'YE.27', '{}', 1),
(89, 'YE.23.1119', 'YE', 'YE.23', '{}', 1),
(90, 'YE.23.1115', 'YE', 'YE.23', '{}', 1),
(91, 'YE.23.1118', 'YE', 'YE.23', '{}', 1),
(92, 'YE.23.1114', 'YE', 'YE.23', '{}', 1),
(93, 'YE.23.1108', 'YE', 'YE.23', '{}', 1),
(94, 'YE.23.1112', 'YE', 'YE.23', '{}', 1),
(95, 'YE.23.1113', 'YE', 'YE.23', '{}', 1),
(96, 'YE.01.1209', 'YE', 'YE.01', '{}', 1),
(97, 'YE.01.1202', 'YE', 'YE.01', '{}', 1),
(98, 'YE.01.1201', 'YE', 'YE.01', '{}', 1),
(99, 'YE.01.1206', 'YE', 'YE.01', '{}', 1),
(100, 'YE.01.1203', 'YE', 'YE.01', '{}', 1),
(101, 'YE.01.1205', 'YE', 'YE.01', '{}', 1),
(102, 'YE.01.1204', 'YE', 'YE.01', '{}', 1),
(103, 'YE.01.1208', 'YE', 'YE.01', '{}', 1),
(104, 'YE.01.1211', 'YE', 'YE.01', '{}', 1),
(105, 'YE.01.1207', 'YE', 'YE.01', '{}', 1),
(106, 'YE.01.1210', 'YE', 'YE.01', '{}', 1),
(107, 'YE.26.1306', 'YE', 'YE.26', '{}', 1),
(108, 'YE.26.1301', 'YE', 'YE.26', '{}', 1),
(109, 'YE.26.1309', 'YE', 'YE.26', '{}', 1),
(110, 'YE.26.1304', 'YE', 'YE.26', '{}', 1),
(111, 'YE.26.1308', 'YE', 'YE.26', '{}', 1),
(112, 'YE.26.1305', 'YE', 'YE.26', '{}', 1),
(113, 'YE.26.1302', 'YE', 'YE.26', '{}', 1),
(114, 'YE.26.1303', 'YE', 'YE.26', '{}', 1),
(115, 'YE.26.1307', 'YE', 'YE.26', '{}', 1),
(116, 'YE.20.1417', 'YE', 'YE.20', '{}', 1),
(117, 'YE.20.1415', 'YE', 'YE.20', '{}', 1),
(118, 'YE.20.1414', 'YE', 'YE.20', '{}', 1),
(119, 'YE.20.1418', 'YE', 'YE.20', '{}', 1),
(120, 'YE.20.1401', 'YE', 'YE.20', '{}', 1),
(121, 'YE.20.1408', 'YE', 'YE.20', '{}', 1),
(122, 'YE.20.1402', 'YE', 'YE.20', '{}', 1),
(123, 'YE.20.1411', 'YE', 'YE.20', '{}', 1),
(124, 'YE.20.1407', 'YE', 'YE.20', '{}', 1),
(125, 'YE.20.1412', 'YE', 'YE.20', '{}', 1),
(126, 'YE.20.1406', 'YE', 'YE.20', '{}', 1),
(127, 'YE.20.1409', 'YE', 'YE.20', '{}', 1),
(128, 'YE.20.1420', 'YE', 'YE.20', '{}', 1),
(129, 'YE.20.1403', 'YE', 'YE.20', '{}', 1),
(130, 'YE.20.1416', 'YE', 'YE.20', '{}', 1),
(131, 'YE.20.1404', 'YE', 'YE.20', '{}', 1),
(132, 'YE.20.1405', 'YE', 'YE.20', '{}', 1),
(133, 'YE.25.1510', 'YE', 'YE.25', '{}', 1),
(134, 'YE.25.1516', 'YE', 'YE.25', '{}', 1),
(135, 'YE.25.1514', 'YE', 'YE.25', '{}', 1),
(136, 'YE.25.1517', 'YE', 'YE.25', '{}', 1),
(137, 'YE.25.1521', 'YE', 'YE.25', '{}', 1),
(138, 'YE.25.1522', 'YE', 'YE.25', '{}', 1),
(139, 'YE.25.1507', 'YE', 'YE.25', '{}', 1),
(140, 'YE.25.1519', 'YE', 'YE.25', '{}', 1),
(141, 'YE.25.1520', 'YE', 'YE.25', '{}', 1),
(142, 'YE.25.1518', 'YE', 'YE.25', '{}', 1),
(143, 'YE.25.1508', 'YE', 'YE.25', '{}', 1),
(144, 'YE.25.1504', 'YE', 'YE.25', '{}', 1),
(145, 'YE.25.1505', 'YE', 'YE.25', '{}', 1),
(146, 'YE.25.1503', 'YE', 'YE.25', '{}', 1),
(147, 'YE.21.1605', 'YE', 'YE.21', '{}', 1),
(148, 'YE.21.1609', 'YE', 'YE.21', '{}', 1),
(149, 'YE.21.1606', 'YE', 'YE.21', '{}', 1),
(150, 'YE.21.1603', 'YE', 'YE.21', '{}', 1),
(151, 'YE.21.1607', 'YE', 'YE.21', '{}', 1),
(152, 'YE.21.1608', 'YE', 'YE.21', '{}', 1),
(153, 'YE.21.1601', 'YE', 'YE.21', '{}', 1),
(154, 'YE.21.1602', 'YE', 'YE.21', '{}', 1),
(155, 'YE.21.1611', 'YE', 'YE.21', '{}', 1),
(156, 'YE.22.1722', 'YE', 'YE.22', '{}', 1),
(157, 'YE.22.1706', 'YE', 'YE.22', '{}', 1),
(158, 'YE.22.1731', 'YE', 'YE.22', '{}', 1),
(159, 'YE.22.1723', 'YE', 'YE.22', '{}', 1),
(160, 'YE.22.1718', 'YE', 'YE.22', '{}', 1),
(161, 'YE.22.1709', 'YE', 'YE.22', '{}', 1),
(162, 'YE.22.1719', 'YE', 'YE.22', '{}', 1),
(163, 'YE.22.1711', 'YE', 'YE.22', '{}', 1),
(164, 'YE.22.1721', 'YE', 'YE.22', '{}', 1),
(165, 'YE.22.1726', 'YE', 'YE.22', '{}', 1),
(166, 'YE.22.1725', 'YE', 'YE.22', '{}', 1),
(167, 'YE.22.1710', 'YE', 'YE.22', '{}', 1),
(168, 'YE.22.1720', 'YE', 'YE.22', '{}', 1),
(169, 'YE.22.1716', 'YE', 'YE.22', '{}', 1),
(170, 'YE.22.1714', 'YE', 'YE.22', '{}', 1),
(171, 'YE.22.1708', 'YE', 'YE.22', '{}', 1),
(172, 'YE.22.1712', 'YE', 'YE.22', '{}', 1),
(173, 'YE.22.1701', 'YE', 'YE.22', '{}', 1),
(174, 'YE.22.1707', 'YE', 'YE.22', '{}', 1),
(175, 'YE.08.1822', 'YE', 'YE.08', '{}', 1),
(176, 'YE.08.1815', 'YE', 'YE.08', '{}', 1),
(177, 'YE.08.1825', 'YE', 'YE.08', '{}', 1),
(178, 'YE.08.1812', 'YE', 'YE.08', '{}', 1),
(179, 'YE.08.1803', 'YE', 'YE.08', '{}', 1),
(180, 'YE.08.1816', 'YE', 'YE.08', '{}', 1),
(181, 'YE.08.1801', 'YE', 'YE.08', '{}', 1),
(182, 'YE.08.1809', 'YE', 'YE.08', '{}', 1),
(183, 'YE.08.1819', 'YE', 'YE.08', '{}', 1),
(184, 'YE.08.1826', 'YE', 'YE.08', '{}', 1),
(185, 'YE.08.1823', 'YE', 'YE.08', '{}', 1),
(186, 'YE.08.1811', 'YE', 'YE.08', '{}', 1),
(187, 'YE.08.1808', 'YE', 'YE.08', '{}', 1),
(188, 'YE.08.1806', 'YE', 'YE.08', '{}', 1),
(189, 'YE.08.1802', 'YE', 'YE.08', '{}', 1),
(190, 'YE.04.1922', 'YE', 'YE.04', '{}', 1),
(191, 'YE.04.1930', 'YE', 'YE.04', '{}', 1),
(192, 'YE.04.1923', 'YE', 'YE.04', '{}', 1),
(193, 'YE.04.1924', 'YE', 'YE.04', '{}', 1),
(194, 'YE.04.1908', 'YE', 'YE.04', '{}', 1),
(195, 'YE.04.1909', 'YE', 'YE.04', '{}', 1),
(196, 'YE.04.1916', 'YE', 'YE.04', '{}', 1),
(197, 'YE.04.1919', 'YE', 'YE.04', '{}', 1),
(198, 'YE.04.1921', 'YE', 'YE.04', '{}', 1),
(199, 'YE.04.1913', 'YE', 'YE.04', '{}', 1),
(200, 'YE.04.1918', 'YE', 'YE.04', '{}', 1),
(201, 'YE.04.1914', 'YE', 'YE.04', '{}', 1),
(202, 'YE.04.1915', 'YE', 'YE.04', '{}', 1),
(203, 'YE.04.1917', 'YE', 'YE.04', '{}', 1),
(204, 'YE.28.1927', 'YE', 'YE.28', '{}', 1),
(205, 'YE.04.1925', 'YE', 'YE.04', '{}', 1),
(206, 'YE.04.1929', 'YE', 'YE.04', '{}', 1),
(207, 'YE.04.1910', 'YE', 'YE.04', '{}', 1),
(208, 'YE.28.1926', 'YE', 'YE.28', '{}', 1),
(209, 'YE.04.1902', 'YE', 'YE.04', '{}', 1),
(210, 'YE.04.1903', 'YE', 'YE.04', '{}', 1),
(211, 'YE.04.1904', 'YE', 'YE.04', '{}', 1),
(212, 'YE.04.1912', 'YE', 'YE.04', '{}', 1),
(213, 'YE.04.1905', 'YE', 'YE.04', '{}', 1),
(214, 'YE.04.1911', 'YE', 'YE.04', '{}', 1),
(215, 'YE.04.1901', 'YE', 'YE.04', '{}', 1),
(216, 'YE.04.1907', 'YE', 'YE.04', '{}', 1),
(217, 'YE.04.1906', 'YE', 'YE.04', '{}', 1),
(218, 'YE.11.2009', 'YE', 'YE.11', '{}', 1),
(219, 'YE.11.2001', 'YE', 'YE.11', '{}', 1),
(220, 'YE.11.2006', 'YE', 'YE.11', '{}', 1),
(221, 'YE.11.2004', 'YE', 'YE.11', '{}', 1),
(222, 'YE.11.2002', 'YE', 'YE.11', '{}', 1),
(223, 'YE.11.2012', 'YE', 'YE.11', '{}', 1),
(224, 'YE.11.2003', 'YE', 'YE.11', '{}', 1),
(225, 'YE.11.2007', 'YE', 'YE.11', '{}', 1),
(226, 'YE.11.2005', 'YE', 'YE.11', '{}', 1),
(227, 'YE.05.2113', 'YE', 'YE.05', '{}', 1),
(228, 'YE.05.2117', 'YE', 'YE.05', '{}', 1),
(229, 'YE.05.2110', 'YE', 'YE.05', '{}', 1),
(230, 'YE.05.2107', 'YE', 'YE.05', '{}', 1),
(231, 'YE.05.2114', 'YE', 'YE.05', '{}', 1),
(232, 'YE.05.2111', 'YE', 'YE.05', '{}', 1),
(233, 'YE.05.2116', 'YE', 'YE.05', '{}', 1),
(234, 'YE.05.2108', 'YE', 'YE.05', '{}', 1),
(235, 'YE.05.2109', 'YE', 'YE.05', '{}', 1),
(236, 'YE.05.2112', 'YE', 'YE.05', '{}', 1),
(237, 'YE.05.2101', 'YE', 'YE.05', '{}', 1),
(238, 'YE.05.2104', 'YE', 'YE.05', '{}', 1),
(239, 'YE.05.2103', 'YE', 'YE.05', '{}', 1),
(240, 'YE.05.2106', 'YE', 'YE.05', '{}', 1),
(241, 'YE.05.2102', 'YE', 'YE.05', '{}', 1),
(242, 'YE.05.2115', 'YE', 'YE.05', '{}', 1),
(243, 'YE.15.2207', 'YE', 'YE.15', '{}', 1),
(244, 'YE.15.2206', 'YE', 'YE.15', '{}', 1),
(245, 'YE.15.2209', 'YE', 'YE.15', '{}', 1),
(246, 'YE.15.2201', 'YE', 'YE.15', '{}', 1),
(247, 'YE.15.2212', 'YE', 'YE.15', '{}', 1),
(248, 'YE.15.2210', 'YE', 'YE.15', '{}', 1),
(249, 'YE.15.2214', 'YE', 'YE.15', '{}', 1),
(250, 'YE.16.2303', 'YE', 'YE.16', '{}', 1),
(251, 'YE.16.2307', 'YE', 'YE.16', '{}', 1),
(252, 'YE.16.2313', 'YE', 'YE.16', '{}', 1),
(253, 'YE.16.2315', 'YE', 'YE.16', '{}', 1),
(254, 'YE.16.2306', 'YE', 'YE.16', '{}', 1),
(255, 'YE.16.2309', 'YE', 'YE.16', '{}', 1),
(256, 'YE.16.2310', 'YE', 'YE.16', '{}', 1),
(257, 'YE.16.2316', 'YE', 'YE.16', '{}', 1),
(258, 'YE.16.2314', 'YE', 'YE.16', '{}', 1),
(259, 'YE.16.2312', 'YE', 'YE.16', '{}', 1),
(260, 'YE.16.2304', 'YE', 'YE.16', '{}', 1),
(261, 'YE.16.2308', 'YE', 'YE.16', '{}', 1),
(262, 'YE.16.2311', 'YE', 'YE.16', '{}', 1),
(263, 'YE.02.2405', 'YE', 'YE.02', '{}', 1),
(264, 'YE.02.2407', 'YE', 'YE.02', '{}', 1),
(265, 'YE.02.2404', 'YE', 'YE.02', '{}', 1),
(266, 'YE.02.2408', 'YE', 'YE.02', '{}', 1),
(267, 'YE.02.2401', 'YE', 'YE.02', '{}', 1),
(268, 'YE.02.2403', 'YE', 'YE.02', '{}', 1),
(269, 'YE.02.2402', 'YE', 'YE.02', '{}', 1),
(270, 'YE.02.2406', 'YE', 'YE.02', '{}', 1),
(271, 'YE.24.2511', 'YE', 'YE.24', '{}', 1),
(272, 'YE.24.2514', 'YE', 'YE.24', '{}', 1),
(273, 'YE.24.2505', 'YE', 'YE.24', '{}', 1),
(274, 'YE.24.2504', 'YE', 'YE.24', '{}', 1),
(275, 'YE.24.2506', 'YE', 'YE.24', '{}', 1),
(276, 'YE.24.2508', 'YE', 'YE.24', '{}', 1),
(277, 'YE.24.2507', 'YE', 'YE.24', '{}', 1),
(278, 'YE.24.2503', 'YE', 'YE.24', '{}', 1),
(279, 'YE.24.2502', 'YE', 'YE.24', '{}', 1),
(280, 'YE.24.2509', 'YE', 'YE.24', '{}', 1),
(281, 'YE.24.2501', 'YE', 'YE.24', '{}', 1),
(282, 'YE.24.2512', 'YE', 'YE.24', '{}', 1),
(283, 'YE.24.2513', 'YE', 'YE.24', '{}', 1),
(284, 'YE.14.2605', 'YE', 'YE.14', '{}', 1),
(285, 'YE.14.2613', 'YE', 'YE.14', '{}', 1),
(286, 'YE.14.2601', 'YE', 'YE.14', '{}', 1),
(287, 'YE.14.2603', 'YE', 'YE.14', '{}', 1),
(288, 'YE.14.2602', 'YE', 'YE.14', '{}', 1),
(289, 'YE.14.2606', 'YE', 'YE.14', '{}', 1),
(290, 'YE.14.2611', 'YE', 'YE.14', '{}', 1),
(291, 'YE.14.2610', 'YE', 'YE.14', '{}', 1),
(292, 'YE.14.2614', 'YE', 'YE.14', '{}', 1),
(293, 'YE.14.2608', 'YE', 'YE.14', '{}', 1),
(294, 'YE.14.2607', 'YE', 'YE.14', '{}', 1),
(295, 'YE.10.2709', 'YE', 'YE.10', '{}', 1),
(296, 'YE.10.2707', 'YE', 'YE.10', '{}', 1),
(297, 'YE.10.2704', 'YE', 'YE.10', '{}', 1),
(298, 'YE.10.2703', 'YE', 'YE.10', '{}', 1),
(299, 'YE.10.2708', 'YE', 'YE.10', '{}', 1),
(300, 'YE.10.2706', 'YE', 'YE.10', '{}', 1),
(301, 'YE.10.2705', 'YE', 'YE.10', '{}', 1),
(302, 'YE.03.2801', 'YE', 'YE.03', '{}', 1),
(303, 'YE.03.2807', 'YE', 'YE.03', '{}', 1),
(304, 'YE.03.2802', 'YE', 'YE.03', '{}', 1),
(305, 'YE.03.2804', 'YE', 'YE.03', '{}', 1),
(306, 'YE.03.2803', 'YE', 'YE.03', '{}', 1),
(307, 'YE.03.2809', 'YE', 'YE.03', '{}', 1),
(308, 'YE.03.2808', 'YE', 'YE.03', '{}', 1),
(309, 'YE.03.2805', 'YE', 'YE.03', '{}', 1),
(310, 'YE.03.2806', 'YE', 'YE.03', '{}', 1),
(311, 'YE.19.2912', 'YE', 'YE.19', '{}', 1),
(312, 'YE.19.2903', 'YE', 'YE.19', '{}', 1),
(313, 'YE.19.2907', 'YE', 'YE.19', '{}', 1),
(314, 'YE.19.2920', 'YE', 'YE.19', '{}', 1),
(315, 'YE.19.2906', 'YE', 'YE.19', '{}', 1),
(316, 'YE.19.2917', 'YE', 'YE.19', '{}', 1),
(317, 'YE.19.2913', 'YE', 'YE.19', '{}', 1),
(318, 'YE.19.2908', 'YE', 'YE.19', '{}', 1),
(319, 'YE.19.2904', 'YE', 'YE.19', '{}', 1),
(320, 'YE.19.2916', 'YE', 'YE.19', '{}', 1),
(321, 'YE.19.2914', 'YE', 'YE.19', '{}', 1),
(322, 'YE.19.2910', 'YE', 'YE.19', '{}', 1),
(323, 'YE.19.2918', 'YE', 'YE.19', '{}', 1),
(324, 'YE.19.2909', 'YE', 'YE.19', '{}', 1),
(325, 'YE.18.3006', 'YE', 'YE.18', '{}', 1),
(326, 'YE.18.3005', 'YE', 'YE.18', '{}', 1),
(327, 'YE.18.3007', 'YE', 'YE.18', '{}', 1),
(328, 'YE.18.3002', 'YE', 'YE.18', '{}', 1),
(329, 'YE.18.3008', 'YE', 'YE.18', '{}', 1),
(330, 'YE.18.3001', 'YE', 'YE.18', '{}', 1),
(331, 'YE.18.3004', 'YE', 'YE.18', '{}', 1),
(332, 'YE.27.3101', 'YE', 'YE.27', '{}', 1),
(333, 'YE.27.3106', 'YE', 'YE.27', '{}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`id`, `post_id`, `subject`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(8, 114, 'مبنى للبيع', NULL, NULL, '2021-10-25 01:55:43', '2021-10-25 02:07:53'),
(9, 114, 'مبنى للبيع', NULL, NULL, '2021-10-25 02:05:04', '2021-10-27 16:39:47');

-- --------------------------------------------------------

--
-- Table structure for table `threads_messages`
--

CREATE TABLE `threads_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thread_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threads_messages`
--

INSERT INTO `threads_messages` (`id`, `thread_id`, `user_id`, `body`, `filename`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(17, 8, 20, 'السلام عليكم كيف حالك قد نمت ولا عادك', NULL, NULL, NULL, '2021-10-25 01:55:43', '2021-10-25 01:55:43'),
(18, 8, 41, '🙃 لا عاده الان اصلي وانام', NULL, NULL, NULL, '2021-10-25 02:04:20', '2021-10-25 02:04:20'),
(19, 9, 20, 'السلام عليكم قد نمت ولا عادك', NULL, NULL, NULL, '2021-10-25 02:05:04', '2021-10-25 02:05:04'),
(20, 8, 41, 'تسلم ياعم مصطفى استفدت منك كثير وتشرفت فيك وسعيد جدا اليوم ومنور بنورك  وطلتك امامي.', NULL, NULL, NULL, '2021-10-25 02:07:53', '2021-10-25 02:07:53'),
(21, 9, 41, 'السلام عليكم ياعم مصطفى', NULL, NULL, NULL, '2021-10-27 16:37:56', '2021-10-27 16:37:56'),
(22, 9, 41, 'كيف الحال', NULL, NULL, NULL, '2021-10-27 16:38:04', '2021-10-27 16:38:04'),
(23, 9, 41, 'كنت باسألك على الاعلانات التي نشرتها4\r\n لازالت قيد الانتظار', NULL, NULL, NULL, '2021-10-27 16:39:47', '2021-10-27 16:39:47');

-- --------------------------------------------------------

--
-- Table structure for table `threads_participants`
--

CREATE TABLE `threads_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `thread_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `is_important` tinyint(1) DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threads_participants`
--

INSERT INTO `threads_participants` (`id`, `thread_id`, `user_id`, `last_read`, `is_important`, `deleted_at`, `created_at`, `updated_at`) VALUES
(15, 8, 20, '2021-10-25 01:55:43', 0, NULL, '2021-10-25 01:55:43', '2021-10-25 01:55:43'),
(16, 8, 41, '2021-10-27 16:36:38', 0, NULL, '2021-10-25 01:55:43', '2021-10-27 16:36:38'),
(17, 9, 20, '2021-10-25 02:05:04', 0, NULL, '2021-10-25 02:05:04', '2021-10-25 02:05:04'),
(18, 9, 41, '2021-10-27 16:39:48', 0, NULL, '2021-10-25 02:05:04', '2021-10-27 16:39:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `gender_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) UNSIGNED DEFAULT 0,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) UNSIGNED DEFAULT 0,
  `can_be_impersonated` tinyint(1) UNSIGNED DEFAULT 1,
  `disable_comments` tinyint(1) UNSIGNED DEFAULT 0,
  `ip_addr` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'facebook, google, twitter, linkedin, ...',
  `provider_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Provider User ID',
  `email_token` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_email` tinyint(1) UNSIGNED DEFAULT 1,
  `verified_phone` tinyint(1) UNSIGNED DEFAULT 1,
  `accept_terms` tinyint(1) DEFAULT 0,
  `accept_marketing_offers` tinyint(1) DEFAULT 0,
  `time_zone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blocked` tinyint(1) UNSIGNED DEFAULT 0,
  `closed` tinyint(1) UNSIGNED DEFAULT 0,
  `last_activity` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `country_code`, `language_code`, `user_type_id`, `gender_id`, `name`, `photo`, `about`, `phone`, `phone_hidden`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `can_be_impersonated`, `disable_comments`, `ip_addr`, `provider`, `provider_id`, `email_token`, `phone_token`, `verified_email`, `verified_phone`, `accept_terms`, `accept_marketing_offers`, `time_zone`, `blocked`, `closed`, `last_activity`, `last_login_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'YE', NULL, 1, 2, 'AFNAN', 'avatars/ye/1/0f518ae59250d0765d67975ce9a8125f.png', 'Administrator', '+967770504385', 0, 'Deloony', 'afnanabdalsalam2@gmail.com', NULL, '$2y$10$TARynGgFnRwL9lfRlioaDudop28zXiSjcFbTaV.oiSf02/DlfLTVK', NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 'Asia/Aden', 0, 0, NULL, '2021-11-21 22:46:48', NULL, '2021-04-03 08:39:44', '2021-11-21 19:46:48'),
(7, 'YE', 'ar', NULL, NULL, 'mohammed alhakeem', NULL, NULL, '+967777646433', NULL, NULL, 'gm@ymensight.com', NULL, '$2y$10$kTebacxR.7BriBrJVai34ejl0Ek2BNY9EOmHZUgBZM6RSleEAXuZe', NULL, 0, 1, 0, '46.161.253.17', NULL, NULL, '0b0bae16cd4a9acb5ad856cc56cedf53', '991166', 0, 0, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-04-10 13:20:40', '2021-04-10 13:20:40'),
(8, 'YE', 'ar', NULL, NULL, 'محمد', NULL, NULL, '+967777442717', NULL, NULL, 'yemensight.com@gmail.com', NULL, '$2y$10$J0uB.7jFJ7uofCUneggj1ePa42RJdtAA76FynC6LcJ2Gn1ZPsJwM.', NULL, 0, 1, 0, '110.238.58.156', NULL, NULL, 'ac18c91caad60a31acb3bf6c4de5e481', '922855', 1, 0, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-04-10 13:26:24', '2021-04-10 13:26:59'),
(13, 'YE', 'ar', NULL, NULL, 'Mohammed Alhakeem', NULL, NULL, '+967777442717', 0, NULL, 'mohammedfadel81@gmail.com', NULL, '$2y$10$bJoLjd63DE3WWj3gBUCT4e9afAd6bfMBsSFfjDMSM4YZ2KbTavLvK', 'reFEJR4yxJeygc8B86r2N8gjVaKFlViBxfgl17JiShQ8Am8hkQj4kxmVrAw3', 0, 1, 0, '175.110.41.214', NULL, NULL, '7df0fba359b6eb3b929ed15744b0dae2', NULL, 1, 1, 0, 0, NULL, 0, 0, NULL, '2021-10-08 20:05:31', NULL, '2021-04-28 23:22:18', '2021-10-08 17:05:31'),
(17, 'YE', 'ar', NULL, NULL, 'محمد', NULL, NULL, '+967775908866', NULL, NULL, 'edutechs.com@gmail.com', NULL, '$2y$10$l0TRMfSuQTYvP16QKVPZEe0CeOpov0z8YuZ8K08FTZ7Q3xt4O8HXm', NULL, 0, 1, 0, '46.161.245.3', NULL, NULL, '5bff161328f22031e5d5df3ebb598671', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-05-06 19:01:15', '2021-05-06 19:01:35'),
(19, 'YE', 'ar', NULL, NULL, 'مصطفى الصايدي', NULL, NULL, '+967771515338', 0, NULL, 'mustsaidi@yahoo.com', NULL, '$2y$10$Nvu8ro6yoEKnO6lQu0C.j.zNEYNZBrut9fdV4KcRzj13nKkMKfZvO', NULL, 0, 1, 0, '175.110.42.243', NULL, NULL, '06903093648f38f9c8c0676d39a69917', NULL, 0, 1, 0, 0, NULL, 0, 0, NULL, NULL, NULL, '2021-05-09 23:03:40', '2021-05-09 23:03:40'),
(20, 'YE', 'ar', NULL, 1, 'مصطفى الصايدي', 'avatars/ye/20/1ad7fbed5b08b7d4f95f5ed7446bd281.jpg', NULL, '+967775718338', NULL, 'DLOONEY', 'mustsaidi@yahoo.com', NULL, '$2y$10$fwv3WulyO9MaonNhSjZXA.xWPXIo7qHEBdnYywtDpQ/Gs/x2o58qe', NULL, 0, 1, 0, '175.110.42.243', NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-10-25 14:39:47', NULL, '2021-05-10 01:36:31', '2021-10-25 11:39:47'),
(21, 'YE', 'ar', NULL, 1, 'Aiman Basaid', NULL, NULL, '+967777907779', 1, 'YemeniLad', 'Ayman.bassied321@gmail.com', NULL, '$2y$10$ukI2xo94vnmkSbPqjY9Qr.yXRbhEgPFNcJ01jYggJEfcuPIU3MOhi', NULL, 0, 1, 0, '134.35.169.15', NULL, NULL, '03617acfa6fee42f95a274512b57a993', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-05-16 08:27:21', '2021-05-16 08:29:17'),
(24, 'YE', 'ar', NULL, 1, 'ناصر الجساري', NULL, NULL, '+967737557429', 1, 'Nasres07', 'nasres7429@gmail.com', NULL, '$2y$10$vUmaxYPmDliXtJ181fyWjeainQfyies1LAu.QiPezdY.olpnA8W/6', NULL, 0, 1, 0, '5.255.10.13', NULL, NULL, 'ac7e69fe2c747a3ad28dd04871c42f3c', NULL, 1, 1, 1, 0, NULL, 0, 0, NULL, NULL, NULL, '2021-05-22 11:17:07', '2021-05-22 11:21:47'),
(25, 'YE', 'ar', NULL, NULL, 'محمد الكينعي', NULL, NULL, '+967774563828', NULL, NULL, 'abod7334462@gmail.com', NULL, '$2y$10$d4NXRrcPExPgiQhv/XfqyOxttvPftff.6isrSMKRQHSeq.tgt54M2', NULL, 0, 1, 0, '31.31.189.68', NULL, NULL, '46e1241572979e3d123d9d10de105c96', NULL, 1, 1, 1, 0, NULL, 0, 0, NULL, NULL, NULL, '2021-06-07 15:28:29', '2021-06-07 15:31:01'),
(26, 'YE', 'ar', NULL, NULL, 'عبد الكريم الماخذي', NULL, NULL, '+967770792111', NULL, NULL, 'abood345w@gmail.com', NULL, '$2y$10$U32pq0AFM7LR1ltjHtBpc.IY/bEisFOriyjqqkBvMuAgjTWGLCmwG', 'saG78TqKUnh4u2OvC7LUJIgNd8Wn3lUb1dCTtWLS8cudhAMuv0BMpWPycING', 0, 1, 0, '46.161.233.116', NULL, NULL, '9d346b383ff7ca2e35c53267c0fa9962', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-11-09 17:18:13', NULL, '2021-06-13 07:59:43', '2021-11-09 14:18:13'),
(27, 'YE', 'ar', NULL, NULL, 'علي محمد المقالح', NULL, NULL, '+967777301177', NULL, NULL, 'almgalih@yahoo.com', NULL, '$2y$10$OkxN7owYoAccZu.Pf2XDa.KjI2RD6wABBTOCbmbe9dWmbrYJhTb9u', 'escfTaYTTskABO4K39OL7GxUKNYRIunqAhWv4q3TuekVVUdDV0tGCrCRJL8g', 0, 1, 0, '185.80.140.190', NULL, NULL, 'c9738cdad51e0c0475b69b13d28981e8', NULL, 1, 1, 1, 0, NULL, 0, 0, NULL, NULL, NULL, '2021-06-18 13:41:02', '2021-07-23 14:42:04'),
(28, 'YE', 'ar', NULL, NULL, 'Himier', NULL, NULL, '+967777466698', 1, NULL, NULL, NULL, '$2y$10$cDSCkElVF3xX4k38oBNK3eKV5gKt9XMgGLWHH4TbwamMvlGVUAEy.', NULL, 0, 1, 0, '109.200.160.56', NULL, NULL, NULL, NULL, 1, 1, 1, 0, NULL, 0, 0, NULL, NULL, NULL, '2021-06-27 12:14:39', '2021-06-27 12:14:39'),
(29, 'YE', 'ar', 1, 1, 'احمد حسن القاضي', NULL, 'Administrator', '+967770006791', 0, NULL, 'gadhy103@gmail.com', NULL, '$2y$10$3IfP.bTRdxP.TBPeGbCF7uwhl/Q1TFz.djc2Dv3CJzVI74KhFicC.', NULL, NULL, 1, 0, '134.35.47.202', NULL, NULL, '8746c41bcbe44d36f239a04a025c56c3', NULL, 1, 1, 1, 1, 'Africa/Abidjan', 0, 0, NULL, '2021-11-02 10:50:56', NULL, '2021-07-03 13:41:02', '2021-11-02 09:17:35'),
(30, 'YE', 'ar', NULL, NULL, 'nawaf asag', NULL, NULL, '+967738270650', 1, NULL, 'nm.nawaf@gmail.com', NULL, '$2y$10$q6w1XCxZvydzzzmvX43znOlla6P9kgVBHhaTrx9s64.Cd0/nRqfwK', NULL, 0, 1, 0, '109.74.38.227', NULL, NULL, 'b41792b42d8a3ca450ccf25facf6c15b', NULL, 0, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-07-20 13:28:11', '2021-07-20 13:28:11'),
(31, 'YE', 'ar', NULL, NULL, 'nawaf asag', NULL, NULL, NULL, 1, NULL, 'nm.nawaf2017@gmail.com', NULL, '$2y$10$.NY4KWtuq3Dzudp5j/NNeOxAzeOJBAa6EOXx5F3mBuYwk5viQtb3K', NULL, 0, 1, 0, '46.161.228.147', NULL, NULL, 'd77161a731d050758195e1affc1ad6d2', NULL, 0, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-07-20 13:50:04', '2021-07-20 13:50:04'),
(32, 'YE', 'ar', NULL, NULL, 'نواف عساج', NULL, NULL, NULL, 1, NULL, '34c4c11ec8@firemailbox.club', NULL, '$2y$10$eYTZjd3x6vJHyPQnIFbAdepoBLb4DF9jbPx8DR0ntMIg33agA/7sK', NULL, 0, 1, 0, '46.161.251.194', NULL, NULL, '4fdb288e6b100e94740ade67b1a0767e', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-10-09 10:01:02', NULL, '2021-07-20 14:12:08', '2021-10-09 07:02:04'),
(33, 'YE', 'ar', NULL, 1, 'ابو نبراس للأسلحه', 'avatars/ye/33/69aeb3fe832b1c17be935dfdca6242b5.jpg', NULL, '+967775110030', NULL, 'Ali', 'nebrasabo5@gmail.com', NULL, '$2y$10$/YbA7M0/8F/EoD1y38b1AOxv1G/mO85VBF4kZ0fCmergsMCtLfBge', NULL, 0, 1, 0, '185.80.140.180', NULL, NULL, 'cb72226eeb5648d663f6ac57008c61c5', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-07-30 20:39:30', NULL, '2021-07-25 14:16:50', '2021-07-30 17:39:30'),
(34, 'YE', 'ar', NULL, NULL, 'guuitfguykif', NULL, NULL, '+967777777777', NULL, NULL, 'admtin@deloony.com', NULL, '$2y$10$tckVs5zx6GUYbMwRYyYZc.TG/erC71gjrJzz/4zXkiWxS3hIRGHHS', NULL, 0, 1, 0, '178.62.6.45', NULL, NULL, '5d007bc97f392ec992354ebd8a3bf69b', NULL, 0, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-07-31 17:03:16', '2021-07-31 17:03:16'),
(35, 'YE', 'ar', NULL, NULL, 'Aiman', NULL, NULL, '+967733418200', NULL, NULL, 'Arh.bassied@gmail.com', NULL, '$2y$10$6gSOGaQKfzSnNAwn65d.4uI5xw.r3gmQYLXx53d8O4ZCkE1oRjVHC', NULL, 0, 1, 0, '185.183.32.48', NULL, NULL, 'ea888f6adaea7ecfd973f2d6b5ee5d34', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-08-30 04:02:37', '2021-08-30 04:03:42'),
(36, 'YE', 'ar', NULL, NULL, 'عمر يحيى عمر الدُمامي', NULL, NULL, '+967772306230', NULL, NULL, 'omaryahyaomar@gmail.com', NULL, '$2y$10$OPCqhWeGl.vpT00IBEaRQe3ZDyPNgR2VJt843skl7gDgVspfgLAuC', NULL, 0, 1, 0, '63.168.169.237', NULL, NULL, '9c65799cb60676cd8f609c24a86c5d11', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-09-25 00:19:35', NULL, '2021-09-09 22:50:07', '2021-09-24 21:19:35'),
(37, 'YE', 'ar', NULL, NULL, 'جمال التركي', NULL, NULL, '+10013137725057', NULL, NULL, 'alturki24@yahoo.com', NULL, '$2y$10$Zpgn9awOn/ZrHDLjmfJouumx6z/GnD9gO0g8zIuVbpdepLMd6uT5m', NULL, 0, 1, 0, '172.58.222.217', NULL, NULL, '80c71a503de2ea0a0abe69eafa82485b', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-09-30 17:56:57', NULL, '2021-09-19 02:29:24', '2021-09-30 14:56:57'),
(38, 'YE', 'ar', NULL, NULL, 'جمال العناني', 'avatars/ye/38/c82a3df8cfa4adf47ef8001dfc4bd607.jpg', NULL, '+967735019233', NULL, NULL, 'alnanyjmal112@gmail.com', NULL, '$2y$10$2KKvSaznn6/a0TkVGphBs.yIoWmr.0YgO4s.LsH4mdbYzpBfG4pGO', NULL, 0, 1, 0, '175.110.43.170', NULL, NULL, '3d44e164d78b1f9b77a1849a72b1e262', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-10-13 17:08:15', NULL, '2021-09-19 17:57:47', '2021-10-13 14:08:15'),
(39, 'YE', 'ar', NULL, NULL, 'محمد الجنيد', NULL, NULL, '+967777878950', NULL, NULL, 'aljunaidmohammed2002@gmail.com', NULL, '$2y$10$dkoFdjTlHNA8WU0iQHVI..MJv3iIMkvWdnepF/nxt.p6a.YsEJb.2', NULL, 0, 1, 0, '178.130.100.61', NULL, NULL, 'b4f1e8e7eb7cd81db92ecb6d6c33b126', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-11-20 21:33:19', NULL, '2021-09-21 17:41:30', '2021-11-20 18:33:19'),
(40, 'YE', 'ar', NULL, NULL, 'جمال المهندس', NULL, NULL, '+967774035471', NULL, NULL, 'alanani774035471@gmail.cmo', NULL, '$2y$10$QCDhQwYlluMDL7DiywZALuQVxt2SBuzSda8KO09r8yNU9zkNv6tq2', NULL, 0, 1, 0, '175.110.40.61', NULL, NULL, '19e0e35a6040d3d91cc4977c682e05b8', NULL, 0, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-09-23 19:50:45', '2021-09-23 19:50:45'),
(41, 'YE', 'ar', NULL, 1, 'HAMDI KHALID', 'avatars/ye/41/a0c57ec345fd68826cbe88f4f87fea38.jpg', NULL, '+967774253506', 1, NULL, 'hamdikhalid43@gmail.com', NULL, '$2y$10$ytMwuV7zluYHuvSCO5ZHJeSC6M5mMoo3f/1fQbB.J4HIICJPCZVX2', 'nsYl055IfAyzAS36zWw1uXSR1hTX1y6JamdGtGgcNu934xd3sueUHmezCgI0', NULL, 1, 0, '185.80.141.199', NULL, NULL, '073ae9d839025276f5e9118c0fb0a1b2', NULL, 1, 1, 1, 1, 'Asia/Aden', 0, 0, NULL, '2021-11-21 11:42:54', NULL, '2021-09-26 15:08:09', '2021-11-21 08:42:54'),
(42, 'YE', 'ar', NULL, NULL, 'شمسان', NULL, NULL, '+967773788555', NULL, NULL, 'amjan268@gmail.com', NULL, '$2y$10$P9G1OSjqfrNrCb0qPOti4O6H/JXvvC37w0zXBQl25SiIVgmzUqCKu', NULL, 0, 1, 0, '185.80.140.151', NULL, NULL, '7c5c72677f18e477f2912aaacb3fffc4', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-09-28 16:09:13', '2021-09-28 16:09:50'),
(43, 'YE', 'ar', NULL, NULL, 'استديو شيلات وزفات فلة', NULL, NULL, '0534299931', 1, NULL, 'fullazafat@gmail.com', NULL, '$2y$10$JWIoa9A92zuO1GG53EzoruRHA1vvphvQ9zCPgTEWZOWi8cz42QrCK', NULL, 0, 1, 0, '134.35.243.109', NULL, NULL, '881f9d177b088ecee63a717438fadb9f', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-02 00:31:12', '2021-10-02 00:31:34'),
(44, 'YE', 'ar', NULL, NULL, 'توب جنرال', NULL, NULL, '+967733672584', NULL, NULL, 'twbjnral9@gmail.com', NULL, '$2y$10$w5wE6yGtYZPhxQhDfBzplOVRahpOOJu6OMJYn071HKqAOhkh/XCYK', 'OrgwLEMTUphTfEubVvMZ9UwFzdVX2v2Odu7Nv6JT9zGGqNohWUwRx03cjzqJ', 0, 1, 0, '46.161.236.72', NULL, NULL, 'dee2d3912bdb8004cf5b404e05f24a1d', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-08 08:00:38', '2021-10-08 08:29:07'),
(45, 'YE', 'ar', NULL, NULL, 'ابو خالد لساعات اليدوية', 'avatars/ye/45/8465a857de42f9bed95c34e8061e7e1e.jpg', NULL, '+967773701975', NULL, NULL, 'abukhaleddwyt4@gmail.com', NULL, '$2y$10$dSlwmC9G5D6X2w6VTuj34ONymy6fWqEi7WUajD9HoYXTMeLbQAkCG', 'HODwSGY9Z1qORvBJR8dKYfkSjUjGVI1UXkMeaoHDus45WgfrWhhS6rXmgRvy', 0, 1, 0, '110.238.61.246', NULL, NULL, 'd8ee559cfee7efccc820ee394bda2df0', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-08 13:09:59', '2021-10-08 13:39:17'),
(46, 'YE', 'ar', NULL, NULL, 'محمد العبدلي', NULL, NULL, '+967737874134', NULL, NULL, 'mhmdalbly689@gmail.com', NULL, '$2y$10$AfJ40KjGF38uazocm3kco.D5vVIB4gKAEXEPkliyIBPBFomfp7EKq', NULL, 0, 1, 0, '46.161.225.121', NULL, NULL, '068315adb05b9772d512fcb8d0ac8ee3', NULL, 0, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-09 17:25:51', '2021-10-09 17:25:51'),
(47, 'YE', 'ar', NULL, NULL, 'منتزه الاحبة', NULL, NULL, '+967777146138', NULL, NULL, 'mhmdalbd689@gmail.com', NULL, '$2y$10$1rUVPUisSfhGTNSy9Fla0u0eGgRkfcQAn1jMwAiVwy086IFsIiTaC', NULL, 0, 1, 0, '46.161.225.121', NULL, NULL, 'f043ce70a97e4466d260bd71dd7189a8', NULL, 0, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-09 17:46:09', '2021-10-09 17:46:09'),
(48, 'YE', 'ar', NULL, NULL, 'محمد العبدلي الاحبة', 'avatars/ye/48/ebdbd1d5dea3d4a4ec2b37ef9809873c.jpg', NULL, '+967770805625', NULL, NULL, 'mhmdalbdly689@gmail.com', NULL, '$2y$10$HyUx59pN2O1Tjxbs/I.58.TeTbcx6dg6BuMTzXjCjhuXHc0H/KInS', 'ib5UOTVdAVectELob2jWhGH9c2rIWs0Sd5n5PEhTZGpQBaSVci07l7h3TPee', 0, 1, 0, '46.161.225.121', NULL, NULL, '00f486d2672c0754bc4cf5c9df6caa6a', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-10-10 18:57:34', NULL, '2021-10-09 17:55:29', '2021-10-10 15:57:34'),
(49, 'YE', 'ar', NULL, NULL, 'الصهيبي للتجارة', 'avatars/ye/49/08164a0b3a67ff5ee7e0f344c0112885.jpg', NULL, '+967775947125', NULL, NULL, 'ammar256669@gmail.com', NULL, '$2y$10$XYZHEwQQM1Kcba.qF4oBk.afi9TMQVRkqHTOVMXtBvG.gBG7l7ZY.', NULL, 0, 1, 0, '134.35.135.42', NULL, NULL, '2ffcd0b7836630d5c1d81a95656fbae2', NULL, 1, 1, 1, 0, NULL, 0, 0, NULL, NULL, NULL, '2021-10-10 06:24:44', '2021-10-10 06:26:31'),
(50, 'YE', 'ar', NULL, NULL, 'عبدالباسط محمد مرشد العرومه', NULL, NULL, '+967777760754', NULL, NULL, 'Abohalal871@gmail.com', NULL, '$2y$10$ikQjklJhDsbLQnqcrFgVEeTwTAhUw2ck87SGZqfNGEZeVorlu.SEy', NULL, 0, 1, 0, '110.238.35.72', NULL, NULL, '691d7941ccb9c828dee187d98407f1d2', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-10 13:00:33', '2021-10-10 13:07:20'),
(51, 'YE', 'ar', NULL, NULL, 'عبدالباسط محمد مرشد العرومه', 'avatars/ye/51/6dd4a5b30583fd707b1f58a3eca7b758.jpg', NULL, '0967777760754', NULL, NULL, 'alrwmyabwhlal@gmail.com', NULL, '$2y$10$4fO4xPIf39NyRlaPbE1gAu6HUr59.EFummwA8BWKo537S1UBOr1BC', NULL, 0, 1, 0, '63.168.168.90', NULL, NULL, 'ee91510a35163c95c077f16a91219164', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-11 14:16:26', '2021-10-11 14:38:01'),
(52, 'YE', 'ar', NULL, NULL, 'يحي صلح', NULL, NULL, '+967771818555', NULL, NULL, 'yfm736561710@gmail.com', NULL, '$2y$10$0CQf2sFcTZ9X8plRFDRF0..MYT.vnOvSC24f0Nhd7OVrJTJeWsDC6', NULL, 0, 1, 0, '134.35.209.99', NULL, NULL, '89fa58566d846d652500117cc205fef8', NULL, 0, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-11 14:36:35', '2021-10-11 14:36:35'),
(53, 'YE', 'ar', NULL, NULL, 'يحي محمد صلح', NULL, NULL, '+967773434111', NULL, NULL, 'yahyasolh1974@gmail.com‏', NULL, '$2y$10$t1ZqThr3B3yuZkoQfNT0JO0OEQ91h4iyAcEVH0Nep58UzSFR3sYOa', NULL, 0, 1, 0, '134.35.215.26', NULL, NULL, '3cff0425c741e93a84fa6b205de047ac', NULL, 0, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-11 14:44:29', '2021-10-11 14:44:29'),
(54, 'YE', 'ar', NULL, NULL, 'خالد وليد علي يحى الجبري', NULL, NULL, '+967778446953', NULL, NULL, 'aljbryk833@gmail.com', NULL, '$2y$10$ioUgXCHWyyxfoCb8kfFuf.Dp2IaoCajC/SUiQE.PCtrB03ZigWx8u', NULL, 0, 1, 0, '63.168.169.253', NULL, NULL, '3f7b8c72e85a077e786a7a8310d12b44', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-11 15:26:02', '2021-10-11 15:26:41'),
(55, 'YE', 'ar', NULL, 1, 'Kids Area', NULL, NULL, '19810', 0, NULL, 'mobawabat@unitedtoys-eg.com', NULL, '$2y$10$w3p8b5ozpUvNt7lITZFkpuTqXr24zrQrBzqFO7XnVHm817wemaTjq', 'LlYGwle94soY4SO6pfXKdUlxINNym4HbTAhCkPganMy1QjJVdy1kZ0TRQx2d', NULL, 1, 0, '156.193.195.10', NULL, NULL, '395d4c1deda58575f1c4758df5156eb4', NULL, 1, 1, 1, 1, 'Africa/Abidjan', 0, 0, NULL, '2021-11-04 11:18:27', NULL, '2021-10-13 13:39:40', '2021-11-04 11:18:27'),
(56, 'YE', 'ar', NULL, NULL, 'الجرادي للديكور', 'avatars/ye/56/7c9636cb3ec44e173f6180480f1fd975.jpg', NULL, '+967775800798', NULL, NULL, 'mhmdaljradylldykwr@gmail.com', NULL, '$2y$10$H4iKqs42gqazGwE1uVcyROf2bxg1Iv8Z7zPHqJIRvypanZqqd6Hga', 'MKSWnaKnyU0OE7fxMKeT5gviRju57xlbLchdqUepDOFSCtY9bs3q77MWMDwS', 0, 1, 0, '110.238.53.76', NULL, NULL, '85f7fc394991b1f53f35438b939aa5de', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-13 15:55:47', '2021-10-13 16:07:17'),
(57, 'YE', 'ar', NULL, NULL, 'ابراهيم الزاهي', 'avatars/ye/57/0cd74c82284038c1f10ee9a842ab8c96.jpg', NULL, '+967777399101', NULL, NULL, 'ibrahimhamood75@gmail.com', NULL, '$2y$10$19urU7cRVvQzGiBeQ7ASoeNGiLmBQNQNRlzAY1U/rgx.5EBG4Or4y', NULL, 0, 1, 0, '46.161.249.161', NULL, NULL, 'b092408f7dbe483a63d091a6e96ad9ad', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-14 09:09:16', '2021-10-14 09:25:29'),
(58, 'YE', 'ar', NULL, NULL, 'عبدالرحمن الجودة', 'avatars/ye/58/698fa7b5f96d57dd06be375d5b38c752.jpg', NULL, '+967777579316', NULL, NULL, 'bdalrhmnaljwdt32@gmail.com', NULL, '$2y$10$JBJHm18wsxzR7HrHu/sUkeHZTTavslJQmqBU3/4BtwZX0y6G2aTYa', NULL, 0, 1, 0, '175.110.43.4', NULL, NULL, 'e142c861c2551dedbb9f87d07285a37b', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-19 16:13:12', '2021-10-19 16:41:39'),
(59, 'YE', 'ar', NULL, NULL, 'مصطفى غازي', NULL, NULL, '+967774209375', NULL, NULL, 'mostafaghazi777@gmail.con', NULL, '$2y$10$3hrOIAY010oc30GiK69Pxe830MMDO0F6Ik6EtZQJmhETEYO7MJcm.', NULL, 0, 1, 0, '175.110.8.174', NULL, NULL, 'bea90b4b41579a63b1e56bc3adee49d4', NULL, 0, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-20 17:55:00', '2021-11-02 15:44:40'),
(60, 'YE', 'ar', NULL, NULL, 'مؤسسة مصطفى بني غازي للعطور العالميه', NULL, NULL, '+967770503402', NULL, NULL, 'moda33317azd@gmail.com', NULL, '$2y$10$XeE98rW1UjkrGrXbXckx0O1F6q2j4XcZ2YvYRawk19rAWGX.LzxpW', NULL, 0, 1, 0, '175.110.8.174', NULL, NULL, 'd212d005d794383a1bab37904ce51f81', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-10-21 22:51:25', NULL, '2021-10-20 18:54:47', '2021-10-21 19:52:07'),
(61, 'YE', 'ar', NULL, NULL, 'kids area', NULL, NULL, '1022192286', NULL, NULL, 'marketing@unitedtoys-eg.com', NULL, '$2y$10$RpysTunws7PSQXf44rtjPuJvYAehb4uWRdurkFqv5LFIxbaYX0WvW', NULL, 0, 1, 0, '156.193.222.25', NULL, NULL, 'b3244024824031a9687f20855ce52a7c', NULL, 0, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-25 12:58:12', '2021-10-25 12:58:12'),
(62, 'YE', 'ar', NULL, 1, 'اونلاين للأستشارات الهندسية والتصاميم المعمارية والإنشائية', NULL, NULL, '+967770764699', 0, NULL, 'rayanx55@hotmail.com', NULL, '$2y$10$r4.WN4DNEbuU0Qv1RWa7H.T7VbbNh2hkYVrZ49UsrNCspiRBS9t7a', NULL, NULL, 1, 0, '185.80.141.98', NULL, NULL, '8e3cda5c7c00a5897e72fdc07fb06170', NULL, 0, 1, 1, 1, 'Africa/Abidjan', 0, 0, NULL, NULL, NULL, '2021-10-26 13:10:23', '2021-11-02 09:15:53'),
(63, 'YE', 'ar', NULL, NULL, 'حميد مرشد حميد', NULL, NULL, '0541176949', NULL, NULL, 'alslmyhmyd382@gmail.com', NULL, '$2y$10$9c.sZkFMMiAzBhAl8Z2piuKnMKeYA.0tRIruh5YBt7a2atZRVu7rG', NULL, 0, 1, 0, '131.117.164.149', NULL, NULL, 'ff2291f1ca907972e33ac367ddb84ddb', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-10-31 13:55:22', NULL, '2021-10-30 14:08:00', '2021-10-31 10:55:22'),
(64, 'YE', 'ar', NULL, NULL, 'سواحل قلنسية', 'avatars/ye/64/8033b267c7a72bef00583ea6e3110b3d.jpg', NULL, '+967778374993', NULL, NULL, 'mohalimoh723@gmail.com', NULL, '$2y$10$k1Z0i7gbFsYEE03zkc/IjuiSGrH3net3BI8qq4HYVEx1nBsIQ.TxS', NULL, 0, 1, 0, '110.238.34.5', NULL, NULL, '12ba46e843bfe9e92c7177e4da0247c5', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-10-31 08:07:16', '2021-10-31 08:17:23'),
(65, 'YE', 'ar', NULL, 1, 'الحاصبي للعقارات', NULL, NULL, '+967770882027', 0, NULL, 'bdalkrymalhasby068@gmali.com', NULL, '$2y$10$5M7xCOXwjtDgkJs0EcyXSuSNplq0XsetksCez//FUSv8qcVg4Ho.6', NULL, NULL, 1, 0, '185.80.140.229', NULL, NULL, '2e5293ff4435e34388317eff6be388e4', NULL, 1, 1, 1, 1, 'Africa/Abidjan', 0, 0, NULL, NULL, NULL, '2021-11-01 14:45:44', '2021-11-02 09:29:30'),
(66, 'YE', 'ar', NULL, NULL, 'الحاصبي للعقارات', NULL, NULL, '+967777522920', NULL, NULL, 'alhaspe234@gmail.com', NULL, '$2y$10$kp1QQDrUYojrlIVujm5xye6h4yZpkHORcTbARilcMWqBDYTnQfi7y', NULL, 0, 1, 0, '185.80.140.174', NULL, NULL, '8c7e302fd18ce20543ed05b3cc0b826c', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, '2021-11-01 19:08:44', NULL, '2021-11-01 15:38:27', '2021-11-01 16:08:44'),
(100, 'YE', 'ar', NULL, 1, 'Ali', NULL, NULL, '+967774518603', 0, NULL, 'engbyq@gmail.com', NULL, '$2y$10$JUZdsTSn3phnwxDfAN67p.4HcHqbzCWnFHGSrPRXT6iHy2nNF9Urm', NULL, NULL, 1, 0, '134.35.20.215', NULL, NULL, '4168d092c1b56892dd98b9a37b75de41', NULL, 1, 1, 1, 1, 'Africa/Abidjan', 0, 0, NULL, '2021-11-02 07:30:23', NULL, '2021-11-01 17:11:33', '2021-11-02 07:30:23'),
(101, 'YE', NULL, NULL, 1, 'Deloony', NULL, NULL, '+967712345678', 1, NULL, 'admin@deloony.com', NULL, '$2y$10$koxObXN/k3S1VMU5uIzl.eljGCTgsyB6SiGSTz2xhiUncytpF4xBS', NULL, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 'Asia/Aden', 0, 0, NULL, NULL, NULL, '2021-11-01 18:58:22', '2021-11-03 09:11:04'),
(102, 'YE', 'ar', NULL, 1, 'Unitedtoys', NULL, NULL, '01015559900', 0, NULL, 'aismail@unitedtoys-eg.com', NULL, '$2y$10$qKgaqZhr1FbcSjFc/qKp8ObXVIsybrrbpiwjlNYoHO..VgV0IT1be', NULL, NULL, 1, 0, '156.193.185.199', NULL, NULL, '10e7529115a7cfacb71db45d8042cd0e', NULL, 1, 1, 1, 1, 'Africa/Abidjan', 0, 0, NULL, '2021-11-21 10:56:36', NULL, '2021-11-04 11:26:06', '2021-11-21 10:56:36'),
(103, 'YE', 'ar', NULL, 1, 'عبدالعزيز الاهدل', NULL, NULL, '+967736778306', 0, NULL, 'alahdalabdulaziz7@gmail.com', NULL, '$2y$10$8c1PBAm3dE7hiAipEXzo1.fCkhU1eE5QSOwGlAr1rckJFbuCqrIei', NULL, NULL, 1, 0, '94.26.221.116', NULL, NULL, '8f952776fd62fc9023fc535e96989aaf', NULL, 1, 1, 1, 0, 'Africa/Abidjan', 0, 0, NULL, '2021-11-22 02:43:35', NULL, '2021-11-13 08:21:07', '2021-11-22 02:43:35'),
(104, 'YE', 'ar', NULL, 1, 'ابراهيم بن القديمي', 'avatars/ye/104/b0536e84328adb4d10bb887f0c0fd5d3.jpg', NULL, '+967771709771', 0, NULL, 'alqdymyabrahym8@gmail.com', NULL, '$2y$10$bkb1tHzCOIxFYWNkKWnX.OdDSQ6wqLmqndNprfY0lFIjkBCBeOg/6', NULL, NULL, 1, 0, '175.110.56.92', NULL, NULL, '7370618efb8306c89da621b958b00931', NULL, 1, 1, 1, 0, 'Africa/Abidjan', 0, 0, NULL, '2021-11-21 18:42:00', NULL, '2021-11-16 12:18:49', '2021-11-21 18:42:00'),
(105, 'YE', 'ar', NULL, NULL, 'ماجد الوادعي', NULL, NULL, NULL, NULL, NULL, 'myq733@gmail.com', NULL, '$2y$10$oCN1hwXF4j4Y1WmE/qXatedRAQmmuob1Axjg9IRrxgbVC6zb8bB5C', NULL, 0, 1, 0, '89.189.86.191', NULL, NULL, '51f35f83e76a2bc3fb9254f5826dd9aa', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-11-20 09:24:59', '2021-11-20 09:26:13'),
(106, 'YE', 'ar', NULL, NULL, 'AY-Store', NULL, NULL, '+967712328869', 1, NULL, 'aymenadelalghaili@gmail.com', NULL, '$2y$10$zjjloGoQYIdM4Y3uxIbPOOJmH8548XrFmLMWO.iO//PfNlMJtEQYi', NULL, 0, 1, 0, '46.161.232.254', NULL, NULL, 'f00eb5c1d73cab9203f7dd7e3a85d16a', NULL, 1, 1, 1, 1, NULL, 0, 0, NULL, NULL, NULL, '2021-11-20 18:24:23', '2021-11-20 18:24:58');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `active`) VALUES
(1, 'Professional', 1),
(2, 'Individual', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertising`
--
ALTER TABLE `advertising`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `advertising_slug_unique` (`slug`),
  ADD KEY `advertising_active_index` (`active`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blacklist_type_entry_index` (`type`,`entry`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_slug_index` (`slug`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_lft_index` (`lft`),
  ADD KEY `categories_rgt_index` (`rgt`),
  ADD KEY `categories_depth_index` (`depth`);

--
-- Indexes for table `category_field`
--
ALTER TABLE `category_field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_field_category_id_field_id_unique` (`category_id`,`field_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_code_index` (`country_code`),
  ADD KEY `cities_subadmin1_code_index` (`subadmin1_code`),
  ADD KEY `cities_subadmin2_code_index` (`subadmin2_code`),
  ADD KEY `cities_active_index` (`active`);

--
-- Indexes for table `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `continents_code_unique` (`code`),
  ADD KEY `continents_active_index` (`active`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_code_unique` (`code`),
  ADD KEY `countries_active_index` (`active`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_belongs_to_index` (`belongs_to`);

--
-- Indexes for table `fields_options`
--
ALTER TABLE `fields_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_options_field_id_index` (`field_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_sections_method_unique` (`method`),
  ADD KEY `home_sections_active_index` (`active`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_abbr_unique` (`abbr`),
  ADD KEY `languages_active_index` (`active`),
  ADD KEY `languages_default_index` (`default`);

--
-- Indexes for table `meta_tags`
--
ALTER TABLE `meta_tags`
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
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_active_index` (`active`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_slug_index` (`slug`),
  ADD KEY `pages_parent_id_index` (`parent_id`),
  ADD KEY `pages_active_index` (`active`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_package_id_index` (`package_id`),
  ADD KEY `payments_payment_method_id_index` (`payment_method_id`),
  ADD KEY `payments_post_id_index` (`post_id`),
  ADD KEY `payments_active_index` (`active`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_has_ccbox_index` (`has_ccbox`),
  ADD KEY `payment_methods_active_index` (`active`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pictures_post_id_index` (`post_id`),
  ADD KEY `pictures_active_index` (`active`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_lon_lat_index` (`lon`,`lat`),
  ADD KEY `posts_country_code_index` (`country_code`),
  ADD KEY `posts_user_id_index` (`user_id`),
  ADD KEY `posts_category_id_index` (`category_id`),
  ADD KEY `posts_title_index` (`title`),
  ADD KEY `posts_address_index` (`address`),
  ADD KEY `posts_city_id_index` (`city_id`),
  ADD KEY `posts_reviewed_index` (`reviewed`),
  ADD KEY `posts_featured_index` (`featured`),
  ADD KEY `posts_post_type_id_index` (`post_type_id`),
  ADD KEY `posts_contact_name_index` (`contact_name`),
  ADD KEY `posts_verified_email_index` (`verified_email`),
  ADD KEY `posts_verified_phone_index` (`verified_phone`),
  ADD KEY `posts_archived_index` (`archived`),
  ADD KEY `posts_tags_index` (`tags`),
  ADD KEY `posts_is_permanent_index` (`is_permanent`),
  ADD KEY `posts_coin_id_index` (`coin_id`);

--
-- Indexes for table `post_types`
--
ALTER TABLE `post_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_types_active_index` (`active`);

--
-- Indexes for table `post_values`
--
ALTER TABLE `post_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_values_post_id_index` (`post_id`),
  ADD KEY `post_values_field_id_index` (`field_id`),
  ADD KEY `post_values_option_id_index` (`option_id`);

--
-- Indexes for table `report_types`
--
ALTER TABLE `report_types`
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
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_posts_user_id_index` (`user_id`),
  ADD KEY `saved_posts_post_id_index` (`post_id`);

--
-- Indexes for table `saved_search`
--
ALTER TABLE `saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_search_user_id_index` (`user_id`),
  ADD KEY `saved_search_country_code_index` (`country_code`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`),
  ADD KEY `settings_active_index` (`active`);

--
-- Indexes for table `subadmin1`
--
ALTER TABLE `subadmin1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subadmin1_code_unique` (`code`),
  ADD KEY `subadmin1_active_index` (`active`),
  ADD KEY `subadmin1_country_code_index` (`country_code`);

--
-- Indexes for table `subadmin2`
--
ALTER TABLE `subadmin2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subadmin2_code_unique` (`code`),
  ADD KEY `subadmin2_active_index` (`active`),
  ADD KEY `subadmin2_country_code_index` (`country_code`),
  ADD KEY `subadmin2_subadmin1_code_index` (`subadmin1_code`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_post_id_index` (`post_id`);

--
-- Indexes for table `threads_messages`
--
ALTER TABLE `threads_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_messages_thread_id_index` (`thread_id`),
  ADD KEY `threads_messages_user_id_index` (`user_id`);

--
-- Indexes for table `threads_participants`
--
ALTER TABLE `threads_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `threads_participants_thread_id_index` (`thread_id`),
  ADD KEY `threads_participants_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_country_code_index` (`country_code`),
  ADD KEY `users_user_type_id_index` (`user_type_id`),
  ADD KEY `users_gender_id_index` (`gender_id`),
  ADD KEY `users_verified_email_index` (`verified_email`),
  ADD KEY `users_verified_phone_index` (`verified_phone`),
  ADD KEY `users_username_index` (`username`),
  ADD KEY `users_phone_index` (`phone`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_is_admin_index` (`is_admin`),
  ADD KEY `users_can_be_impersonated_index` (`can_be_impersonated`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_types_active_index` (`active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertising`
--
ALTER TABLE `advertising`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `category_field`
--
ALTER TABLE `category_field`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15000001;

--
-- AUTO_INCREMENT for table `coins`
--
ALTER TABLE `coins`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `continents`
--
ALTER TABLE `continents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `fields_options`
--
ALTER TABLE `fields_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=408;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=372;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `post_types`
--
ALTER TABLE `post_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post_values`
--
ALTER TABLE `post_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=778;

--
-- AUTO_INCREMENT for table `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `saved_search`
--
ALTER TABLE `saved_search`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subadmin1`
--
ALTER TABLE `subadmin1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `subadmin2`
--
ALTER TABLE `subadmin2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `threads_messages`
--
ALTER TABLE `threads_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `threads_participants`
--
ALTER TABLE `threads_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
