-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: dbsvc
-- Generation Time: Mar 07, 2025 at 09:12 AM
-- Server version: 5.7.44
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Bookings`
--

CREATE TABLE `Bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_slot` varchar(255) NOT NULL,
  `note` char(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Bookings`
--

INSERT INTO `Bookings` (`id`, `user_id`, `date`, `time_slot`, `note`, `createdAt`, `updatedAt`) VALUES
(1, 2, '2025-03-15', '08:00-08:30', 'Please arrive on time.', '2025-03-06 15:51:05', '2025-03-06 15:51:05'),
(2, 2, '2025-03-15', '08:30-09:00', 'Urgent Meeting.', '2025-03-07 01:55:37', '2025-03-07 01:55:37'),
(3, 2, '2025-03-07', '12:00-12:30', 'Meeting noon next weekend.', '2025-03-07 02:32:40', '2025-03-07 02:32:40'),
(4, 2, '2025-03-07', '11:30-12:00', 'Meeting next month.', '2025-03-07 02:38:56', '2025-03-07 02:38:56'),
(6, 2, '2025-03-20', '16:00-16:30', 'London meeting.', '2025-03-07 02:55:22', '2025-03-07 02:55:22'),
(8, 2, '2025-03-14', '08:30-09:00', 'New Meeting with my Doctor.', '2025-03-07 03:57:56', '2025-03-07 03:57:56');

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20250305232009-user.js'),
('20250305232630-create-token.js');

-- --------------------------------------------------------

--
-- Table structure for table `Tokens`
--

CREATE TABLE `Tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_uuid` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `blacklisted` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tokens`
--

INSERT INTO `Tokens` (`id`, `token`, `user_uuid`, `type`, `expires`, `blacklisted`, `createdAt`, `updatedAt`) VALUES
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEyNzQxMjYsImV4cCI6MTc0Mzg2NjEyNiwidHlwZSI6InJlZnJlc2gifQ.boqwKPbsMY52F_hIiJ51KuSWOgQfC8kCDbjksJbiDTU', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-05 15:15:26', 0, '2025-03-06 15:15:26', '2025-03-06 15:15:26'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEyNzQxNTMsImV4cCI6MTc0Mzg2NjE1MywidHlwZSI6InJlZnJlc2gifQ.XJaDqYzayn8TNizU7ntx0coDR2yJCbbdmDs7KAJNKWg', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-05 15:15:53', 0, '2025-03-06 15:15:53', '2025-03-06 15:15:53'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEyNzU1MzUsImV4cCI6MTc0Mzg2NzUzNSwidHlwZSI6InJlZnJlc2gifQ._aHXo3IQcPRQ15qWLBdOHiRkbLaodEQqTmNc87roAwc', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-05 15:38:55', 0, '2025-03-06 15:38:55', '2025-03-06 15:38:55'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEyNzYyMjIsImV4cCI6MTc0Mzg2ODIyMiwidHlwZSI6InJlZnJlc2gifQ.p360fZnpySkvHQvz_1ra-wtLLt68sDcOEThjTn1gQMs', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-05 15:50:22', 0, '2025-03-06 15:50:22', '2025-03-06 15:50:22'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEyNzkxMzUsImV4cCI6MTc0Mzg3MTEzNSwidHlwZSI6InJlZnJlc2gifQ.GlIhsRCtWV9tBqTzEEbgMD7Ml2rkHmMEX-P49S6GCjk', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-05 16:38:55', 0, '2025-03-06 16:38:55', '2025-03-06 16:38:55'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEyNzkyNzAsImV4cCI6MTc0Mzg3MTI3MCwidHlwZSI6InJlZnJlc2gifQ.c50jfrvH0PYfKCOptMFIUM3xnF6l_siWuNTg6deYiQY', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-05 16:41:10', 0, '2025-03-06 16:41:10', '2025-03-06 16:41:10'),
(40, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMTc0MTksImV4cCI6MTc0MzkwOTQxOSwidHlwZSI6InJlZnJlc2gifQ.-cCB3cGpC3HU0n1dprr3D4o5JpX9DImAoIi5pT12ET0', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 03:16:59', 0, '2025-03-07 03:16:59', '2025-03-07 03:16:59'),
(42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMTc3MTEsImV4cCI6MTc0MzkwOTcxMSwidHlwZSI6InJlZnJlc2gifQ.BSQ2tPPdrCzlW1PjNfgg93xbA_pp8RLaE0aAB2xX1Hw', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 03:21:51', 0, '2025-03-07 03:21:51', '2025-03-07 03:21:51'),
(44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMTkxMzEsImV4cCI6MTc0MzkxMTEzMSwidHlwZSI6InJlZnJlc2gifQ.Fhnmgn_GoF6Wj70pUsNmrXvrkd0OJyjhlMWIaZPd-0s', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 03:45:31', 0, '2025-03-07 03:45:31', '2025-03-07 03:45:31'),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMTkzMTYsImV4cCI6MTc0MzkxMTMxNiwidHlwZSI6InJlZnJlc2gifQ.37SRF4DNqS9ElBD-qohYzR02a82brkK9lLiqjWKq_cY', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 03:48:36', 0, '2025-03-07 03:48:36', '2025-03-07 03:48:36'),
(48, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMTk3NzMsImV4cCI6MTc0MzkxMTc3MywidHlwZSI6InJlZnJlc2gifQ.W09uCqUjLhL_ycD5oGm5jYs55ATubR3D4YA0AmK9J1g', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-06 03:56:13', 0, '2025-03-07 03:56:13', '2025-03-07 03:56:13'),
(50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMTk4MTcsImV4cCI6MTc0MzkxMTgxNywidHlwZSI6InJlZnJlc2gifQ.bnmV3MEUaZ5jFRI-yvxGiML1NJ-hH4eTvj91253vtWk', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 03:56:57', 0, '2025-03-07 03:56:57', '2025-03-07 03:56:57'),
(51, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMjA1ODMsImV4cCI6MTc0MTQwNjk4MywidHlwZSI6ImFjY2VzcyJ9.bhqneC-GSB5BradLbWtJtqvxp97SEpL0sSRmVcdEF5g', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'access', '2025-03-08 04:09:43', 0, '2025-03-07 04:09:43', '2025-03-07 04:09:43'),
(52, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMjA1ODMsImV4cCI6MTc0MzkxMjU4MywidHlwZSI6InJlZnJlc2gifQ.w2cfXjn6Rac8B8hU-TPFsvxQveA_mjnYHNdeW_uFoxA', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-06 04:09:43', 0, '2025-03-07 04:09:43', '2025-03-07 04:09:43'),
(53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjA2MzMsImV4cCI6MTc0MTQwNzAzMywidHlwZSI6ImFjY2VzcyJ9.KzUDulfOXLrmW_qmIGcdMW4wbpu5SHiyH1cbfszx1hk', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'access', '2025-03-08 04:10:33', 0, '2025-03-07 04:10:33', '2025-03-07 04:10:33'),
(54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjA2MzMsImV4cCI6MTc0MzkxMjYzMywidHlwZSI6InJlZnJlc2gifQ.XKZAkrefLJ9e30XasLr7DN333ID5Cg3rcm-qfVN62Hc', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 04:10:33', 0, '2025-03-07 04:10:33', '2025-03-07 04:10:33'),
(55, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjEwMjIsImV4cCI6MTc0MTQwNzQyMiwidHlwZSI6ImFjY2VzcyJ9.DPbTR40aMp2vIwFP3E2N3Apr1zOihTb8k1C2CLkSYz0', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'access', '2025-03-08 04:17:02', 0, '2025-03-07 04:17:02', '2025-03-07 04:17:02'),
(56, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjEwMjIsImV4cCI6MTc0MzkxMzAyMiwidHlwZSI6InJlZnJlc2gifQ.3oW6BoL6ustdgyI6aLOx25V-49GHBkTgfQWM2Oiu0p8', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 04:17:02', 0, '2025-03-07 04:17:02', '2025-03-07 04:17:02'),
(57, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjEwMzIsImV4cCI6MTc0MTQwNzQzMiwidHlwZSI6ImFjY2VzcyJ9.IxJ1znZ5xK3VmAmD_uU44QIiAnIp2ZxTWJsEU3hWPYo', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'access', '2025-03-08 04:17:12', 0, '2025-03-07 04:17:12', '2025-03-07 04:17:12'),
(58, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjEwMzIsImV4cCI6MTc0MzkxMzAzMiwidHlwZSI6InJlZnJlc2gifQ.ZqWh8siL4zzwp2Ax64zNeuxGjEOhBLawsV5sHAO-9jw', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 04:17:12', 0, '2025-03-07 04:17:12', '2025-03-07 04:17:12'),
(59, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjE2MzUsImV4cCI6MTc0MTQwODAzNSwidHlwZSI6ImFjY2VzcyJ9.p3FxygkbzP3wgUaJhUEbpr8Ki5w9G6_bpjsvSoqVsNg', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'access', '2025-03-08 04:27:15', 0, '2025-03-07 04:27:15', '2025-03-07 04:27:15'),
(60, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjE2MzUsImV4cCI6MTc0MzkxMzYzNSwidHlwZSI6InJlZnJlc2gifQ.drlA9x5giFg7jlly97T3yrpEhp8-IlczusKFSGj9dyw', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 04:27:15', 0, '2025-03-07 04:27:15', '2025-03-07 04:27:15'),
(61, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjI0ODQsImV4cCI6MTc0MTQwODg4NCwidHlwZSI6ImFjY2VzcyJ9.9O1saQOMcYxOsYD7K94DJizohpOS3Ze27USe-8ehJ2U', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'access', '2025-03-08 04:41:24', 0, '2025-03-07 04:41:24', '2025-03-07 04:41:24'),
(62, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjI0ODQsImV4cCI6MTc0MzkxNDQ4NCwidHlwZSI6InJlZnJlc2gifQ.MUODdYOQaYp_3uzxVIhT58RZuBG6E52ZYFWJXrpg3zs', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 04:41:24', 0, '2025-03-07 04:41:24', '2025-03-07 04:41:24'),
(63, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMjkzMTksImV4cCI6MTc0MTQxNTcxOSwidHlwZSI6ImFjY2VzcyJ9.hI-qNvjG1KecBKO4wjTaLiRM96rkOM4WNfJHVgr__8I', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'access', '2025-03-08 06:35:19', 0, '2025-03-07 06:35:19', '2025-03-07 06:35:19'),
(64, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMjkzMTksImV4cCI6MTc0MzkyMTMxOSwidHlwZSI6InJlZnJlc2gifQ.5wNbT0hmjK8yybhThSh5C_XNDcjkqJhmD-bxPPYbkLk', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-06 06:35:19', 0, '2025-03-07 06:35:19', '2025-03-07 06:35:19'),
(65, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMjk0OTIsImV4cCI6MTc0MTQxNTg5MiwidHlwZSI6ImFjY2VzcyJ9.rcSgW4U6uGa5Z3EwnlzebbLy4cF96dGoE7Q9_o2exO4', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'access', '2025-03-08 06:38:12', 0, '2025-03-07 06:38:12', '2025-03-07 06:38:12'),
(66, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMjk0OTIsImV4cCI6MTc0MzkyMTQ5MiwidHlwZSI6InJlZnJlc2gifQ.hHehO_EKQOJz_LPnsfVlc_kHQbyRKoAQG5Eab4ZiLsU', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-06 06:38:12', 0, '2025-03-07 06:38:12', '2025-03-07 06:38:12'),
(67, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjk3MDcsImV4cCI6MTc0MTQxNjEwNywidHlwZSI6ImFjY2VzcyJ9.62kK0oK55PP13Ju3lBPLk1X34ije343aRLNtykC1dxo', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'access', '2025-03-08 06:41:47', 0, '2025-03-07 06:41:47', '2025-03-07 06:41:47'),
(68, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMjk3MDcsImV4cCI6MTc0MzkyMTcwNywidHlwZSI6InJlZnJlc2gifQ.iNn4BI_6zUVfURHB5R3o1lnQaXSp-wcSY80T0z0VpXM', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 06:41:47', 0, '2025-03-07 06:41:47', '2025-03-07 06:41:47'),
(69, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMzEwODYsImV4cCI6MTc0MTQxNzQ4NiwidHlwZSI6ImFjY2VzcyJ9.oWz2qeSOHyvziALnyzqcBmd1LclZZRe_v36wPuSlmWA', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'access', '2025-03-08 07:04:46', 0, '2025-03-07 07:04:46', '2025-03-07 07:04:46'),
(70, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMzEwODYsImV4cCI6MTc0MzkyMzA4NiwidHlwZSI6InJlZnJlc2gifQ.-p_8kX_nrBL6AsH3G9onKWXiDD5qyN9JLQX8V7HeJSs', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-06 07:04:46', 0, '2025-03-07 07:04:46', '2025-03-07 07:04:46'),
(71, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMzQ5ODcsImV4cCI6MTc0MTQyMTM4NywidHlwZSI6ImFjY2VzcyJ9.ZRb5kU98-brzMXxSbrwh--c7USTBl72IOSEs7vG1u0I', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'access', '2025-03-08 08:09:47', 0, '2025-03-07 08:09:47', '2025-03-07 08:09:47'),
(72, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMzQ5ODcsImV4cCI6MTc0MzkyNjk4NywidHlwZSI6InJlZnJlc2gifQ.GCl8RQTxUWfVH_hpX_fNMMCktw_YV0ilw-gs0ootWfA', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 08:09:47', 0, '2025-03-07 08:09:47', '2025-03-07 08:09:47'),
(73, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMzYyNTYsImV4cCI6MTc0MTQyMjY1NiwidHlwZSI6ImFjY2VzcyJ9.8DkTMLTfWcfUoTRzyGz-RTT2DSz0n0u9gKTMIq9NXx4', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'access', '2025-03-08 08:30:56', 0, '2025-03-07 08:30:56', '2025-03-07 08:30:56'),
(74, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMzYyNTYsImV4cCI6MTc0MzkyODI1NiwidHlwZSI6InJlZnJlc2gifQ.xd3EnQNOupeJWtMrpnaAqANMiDQMi-3vTsnWS-g3J0U', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-06 08:30:56', 0, '2025-03-07 08:30:56', '2025-03-07 08:30:56'),
(75, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMzY1NzMsImV4cCI6MTc0MTQyMjk3MywidHlwZSI6ImFjY2VzcyJ9.DEuiv-DeNhbhhPd4CxuGycPkUi8CD856bxYIapmxurg', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'access', '2025-03-08 08:36:13', 0, '2025-03-07 08:36:13', '2025-03-07 08:36:13'),
(76, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZDQ5ZTFmYS1iOGEzLTQ4ZGEtYTczNS1kYjE1MmI3ZjA1ZTkiLCJpYXQiOjE3NDEzMzY1NzMsImV4cCI6MTc0MzkyODU3MywidHlwZSI6InJlZnJlc2gifQ.3qFrtKraFI5Xv-4rG4FNoNW5jUf2M2dn9pBApxkNiAk', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', 'refresh', '2025-04-06 08:36:13', 0, '2025-03-07 08:36:13', '2025-03-07 08:36:13'),
(77, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMzcwODQsImV4cCI6MTc0MTQyMzQ4NCwidHlwZSI6ImFjY2VzcyJ9.geCPcXm372otSgUVPnyvyGdEFpi1uqlxfc0E0Daq69c', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'access', '2025-03-08 08:44:44', 0, '2025-03-07 08:44:44', '2025-03-07 08:44:44'),
(78, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmN2M5NWVkOC0zMjMxLTQxNDgtYjk2My1lMjVlOGQ1M2MxMWIiLCJpYXQiOjE3NDEzMzcwODQsImV4cCI6MTc0MzkyOTA4NCwidHlwZSI6InJlZnJlc2gifQ.1ebQorfXJIVMG0UIHmRj8z9sZjgdE4e4PNPn2otPJHY', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', 'refresh', '2025-04-06 08:44:44', 0, '2025-03-07 08:44:44', '2025-03-07 08:44:44');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `role` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `uuid` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `email_verified` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `firstName`, `lastName`, `role`, `email`, `uuid`, `password`, `status`, `email_verified`, `address`, `phone_number`, `createdAt`, `updatedAt`) VALUES
(2, 'John', 'Doe', 'user', 'chikason362@gmail.com', 'f7c95ed8-3231-4148-b963-e25e8d53c11b', '$2a$08$ZNciCfxypekL.emg1JSn1.pIvYPpuDQJUTMY1vpVC3xRNYKkCWzK6', 1, 1, 'Lagos, Nigeria', '08012455783', '2025-03-06 15:15:26', '2025-03-06 15:15:26'),
(3, 'Jan', 'William', 'admin', 'janwilliam277@gmail.com', 'ad49e1fa-b8a3-48da-a735-db152b7f05e9', '$2a$08$TOoP7jYIEAMppqUfh6gnRunxYPlnFmoWOI2XwUInVvkhMRned7faq', 1, 1, 'London, United Kingdom', '+448012455783', '2025-03-06 16:41:10', '2025-03-06 16:41:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookings_date_time_slot` (`date`,`time_slot`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Tokens`
--
ALTER TABLE `Tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_uuid` (`user_uuid`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Bookings`
--
ALTER TABLE `Bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Tokens`
--
ALTER TABLE `Tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD CONSTRAINT `Bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `Tokens`
--
ALTER TABLE `Tokens`
  ADD CONSTRAINT `Tokens_ibfk_1` FOREIGN KEY (`user_uuid`) REFERENCES `Users` (`uuid`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
