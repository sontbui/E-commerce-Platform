-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql8-container
-- Generation Time: May 13, 2024 at 08:31 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ShopApp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(11, 'Accessories'),
(12, 'Iphone'),
(9, 'Laptop'),
(10, 'PC'),
(8, 'TV');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_conditions`
--

CREATE TABLE `coupon_conditions` (
  `id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `operator` varchar(10) NOT NULL,
  `value` varchar(255) NOT NULL,
  `discount_amount` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flyway_schema_history`
--

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `flyway_schema_history`
--

INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(2, '1', 'alter some tables', 'SQL', 'V1__alter_some_tables.sql', 670188877, 'root', '2023-12-01 10:05:58', 605, 1),
(3, '2', 'change tokens', 'SQL', 'V2__change_tokens.sql', 1468721430, 'root', '2023-12-01 10:05:58', 27, 1),
(4, '3', 'refresh tokens', 'SQL', 'V3__refresh_tokens.sql', 1847335528, 'root', '2023-12-03 04:50:25', 36, 1),
(5, '4', 'create comments table', 'SQL', 'V4__create_comments_table.sql', -16394321, 'root', '2024-04-01 15:28:05', 31, 1),
(6, '5', 'create coupon table', 'SQL', 'V5__create_coupon_table.sql', 1588630482, 'root', '2024-04-01 15:28:05', 182, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','processing','shipped','delivered','cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT NULL,
  `shipping_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `coupon_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `note`, `order_date`, `status`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `active`, `coupon_id`) VALUES
(48, 13, 'buithanh son', 'sonbui@gmail.com', '0363079576', 'dadasda', '', '2024-05-13 00:00:00', 'pending', 1827.5, 'express', NULL, '2024-05-13', NULL, 'cod', 0, NULL),
(49, 13, 'Bùi Thanh Sơn', 'sonbuithanh306@gmail.com', '0363079576', '926 nguyễn văn cừ', '', NULL, 'pending', 1827.5, 'express', NULL, NULL, NULL, 'cod', 1, NULL),
(50, 13, 'Bùi Thanh Sơn', 'sonbuithanh306@gmail.com', '0363079576', '926 nguyễn văn cừ', '', '2024-05-13 00:00:00', 'pending', 0, 'express', NULL, '2024-05-13', NULL, 'cod', 0, NULL),
(51, 13, 'Bùi Thanh Sơn', 'sonbuithanh306@gmail.com', '0363079576', '926 nguyễn văn cừ', '', '2024-05-13 00:00:00', 'pending', 0, 'express', NULL, '2024-05-13', NULL, 'cod', 0, NULL),
(52, 13, 'Bùi Thanh Sơn', 'sonbuithanh306@gmail.com', '0363079576', '926 nguyễn văn cừ', '', '2024-05-13 00:00:00', 'pending', 0, 'express', NULL, '2024-05-13', NULL, 'cod', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `number_of_products` int DEFAULT '1',
  `total_money` decimal(10,2) DEFAULT '0.00',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `coupon_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `number_of_products`, `total_money`, `color`, `coupon_id`) VALUES
(82, 48, 5812, 2150.00, 1, NULL, NULL, NULL),
(83, 49, 5812, 2150.00, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` decimal(10,2) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(5812, 'Tivi samsung ', 2150.00, '892e4517-b8b1-4b45-a299-5a26264492c4_39093849137041', 'Smart Tivi Samsung 4K 43 Inch UA43AU7700KXXV Chính Hãng', '2024-05-13 03:33:01', '2024-05-13 03:33:22', 8),
(5813, 'PC Gaming ', 3525.00, 'c3879893-d31f-4c55-a583-be8021862a22_39255299456125', 'PC Gaming iBUYPOWER - Intel Core i7-9700F, GTX 1660 Ti, DDR4 16 GB, SSD 240 GB', '2024-05-13 03:35:42', '2024-05-13 03:35:42', 10),
(5814, 'Macbook Air 13.6 inch 2022 ', 12000.00, 'afd39dce-c317-4e40-a468-dd46e0a89101_39401801168916', 'Macbook Air 13.6 inch 2022 Midnight (MLY33) - M2/ 8G/ 256G -', '2024-05-13 03:38:09', '2024-05-13 03:38:09', 9),
(5815, 'Airpods Max - Apple(IN)', 1250.00, '746a15b7-10ff-4e88-a2dd-27182b2420b3_46887637923375', 'Weight	384.8g\nBattery Life	Up to 20 hours with ANC on\nQuick Charging	Five minutes of charging provides around an hour and a half of listening time\nCharging Port	Lightning port\nDrivers	Custom drivers, material not specified\nWater Resistance	No official water resistance rating\n', '2024-05-13 07:48:15', '2024-05-13 07:48:15', 11),
(5816, 'Logitech - Mouse Gaming G102', 59.00, '60922f2e-5ef3-4c6b-a5bf-310ae47b359c_46976285006541', 'Logitech - Mouse Gaming G102', '2024-05-13 07:49:44', '2024-05-13 07:49:44', 11),
(5817, 'Laptop DELL Mobile Workstation Precision 7680 (71024676) ', 2580.00, '14a634d1-eea2-4c27-a836-5d25aac063bb_47153425552083', 'Laptop DELL Mobile Workstation Precision 7680 (71024676) - I9-13950HX/RAM 32GB/1TB SSD', '2024-05-13 07:52:41', '2024-05-13 07:52:41', 9),
(5818, 'Airpods Max - Apple(IN) MINT', 1250.00, '50c3e2e9-1760-48fb-81d2-8d50100b6cf6_48071235295375', 'Weight:	                        384.8g\nBattery Life:	                Up to 20 hours with ANC on\nQuick Charging:	Five minutes of charging provides around an hour and a half of listening time\nCharging Port:  	Lightning port\nDrivers:            	        Custom drivers, material not specified\nWater Resistance:  	No official water resistance rating\n', '2024-05-13 08:07:59', '2024-05-13 08:10:24', 11),
(5819, 'Airpods Max - Apple(IN) BLACK', 1250.00, 'c4e115b6-ee32-44b9-b136-13a121dbc791_48209660112083', 'Weight:	                        384.8g\nBattery Life:	                Up to 20 hours with ANC on\nQuick Charging:	Five minutes of charging provides around an hour and a half of listening time\nCharging Port:  	Lightning port\nDrivers:            	        Custom drivers, material not specified\nWater Resistance:  	No official water resistance rating\n', '2024-05-13 08:10:17', '2024-05-13 08:10:17', 11),
(5820, 'Airpods Max - Apple(IN) MINT', 1250.00, '2212dce9-1dda-40b4-8500-f9ee0392feda_48282683559833', 'Weight:	                        384.8g\nBattery Life:	                Up to 20 hours with ANC on\nQuick Charging:	Five minutes of charging provides around an hour and a half of listening time\nCharging Port:  	Lightning port\nDrivers:            	        Custom drivers, material not specified\nWater Resistance:  	No official water resistance rating\n', '2024-05-13 08:11:30', '2024-05-13 08:11:37', 11),
(5822, 'Airpods Max - Apple(IN) WHITE', 1250.00, 'ad82221c-388b-4f38-9a8b-4e749622211d_48536967571041', 'Weight:	                        384.8g\nBattery Life:	                Up to 20 hours with ANC on\nQuick Charging:	Five minutes of charging provides around an hour and a half of listening time\nCharging Port:  	Lightning port\nDrivers:            	        Custom drivers, material not specified\nWater Resistance:  	No official water resistance rating\n', '2024-05-13 08:15:44', '2024-05-13 08:15:44', 11),
(5823, 'Magic Mouse - Apple', 800.00, '6ddf2c66-fe8b-4c03-a710-b12c1dd1b1b3_48647681483500', 'Magic Mouse - White Multi-Touch Surface', '2024-05-13 08:17:35', '2024-05-13 08:17:35', 11),
(5824, 'Iphone 15 Pro - Titan 256gb', 3500.00, 'ff1e59e3-016f-426f-a417-cb1cc77018bb_48799464572750', 'APPLE IPHONE 15 PRO MAX 256GB HONG KONG SET DUAL SIM', '2024-05-13 08:20:07', '2024-05-13 08:20:07', 12),
(5825, 'Iphone 15 Pro Max - Titan 256gb', 4250.00, 'eac9e328-d026-4461-8174-a3252d787a68_48912736523208', 'iPhone 15 Pro Max 256GB Natural Titanium (MU793VN/A)', '2024-05-13 08:22:00', '2024-05-13 08:22:00', 12),
(5826, 'iPhone 14 Pro Max 1TB', 2750.00, 'bd427a85-7ffb-4a8c-962e-90762152bdba_49000304973500', 'iPhone 14 Pro Max 1TB - Genuine VN A', '2024-05-13 08:23:28', '2024-05-13 08:23:36', 12),
(5827, 'IPhone 13 Pro Max Moss Green 128GB (Like new 99%)', 1750.00, '0fa74481-a88d-4d2a-ba79-2c7d02f88506_49089725231583', 'IPhone 13 Pro Max Moss Green 128GB (Like new 99%)', '2024-05-13 08:24:57', '2024-05-13 08:24:57', 12);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `image_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
(702, 5812, '892e4517-b8b1-4b45-a299-5a26264492c4_39093849137041'),
(703, 5812, '751e7875-b513-4ed0-bda5-d3886cde3196_39093869214333'),
(704, 5812, '931191ee-16cf-49b5-8faa-7233f0b06e62_39093883708666'),
(705, 5813, 'c3879893-d31f-4c55-a583-be8021862a22_39255299456125'),
(706, 5813, '559509e4-ffaf-4bfc-b22c-3902663d7fcb_39255313495208'),
(707, 5813, '5d7a35c7-b109-442a-851e-e1d2099c6e7a_39255321687458'),
(708, 5814, 'afd39dce-c317-4e40-a468-dd46e0a89101_39401801168916'),
(709, 5814, 'aabd416a-4a27-4b2a-afd9-c43f90eb807f_39401810817083'),
(710, 5814, '6088d57a-d2af-4762-9023-e3f857872400_39401823090041'),
(711, 5814, '3e27de74-a7a0-4018-80af-dff3632beed1_39401833841083'),
(712, 5815, '746a15b7-10ff-4e88-a2dd-27182b2420b3_46887637923375'),
(713, 5815, '1432e0cb-8eac-4437-af28-09d9054cfb04_46887660863625'),
(714, 5815, '74f4b484-48de-44c3-afe4-a965515750f1_46887666112000'),
(715, 5815, '2aabdc2b-9fdf-4333-8949-ed9c4330f635_46887674881666'),
(716, 5816, '60922f2e-5ef3-4c6b-a5bf-310ae47b359c_46976285006541'),
(717, 5816, '614632ee-79a0-40c1-a36d-924b6ad1a4de_46976302940875'),
(718, 5816, 'a97744bc-4c24-4405-8541-a67ce870b8f2_46976317082416'),
(719, 5817, '14a634d1-eea2-4c27-a836-5d25aac063bb_47153425552083'),
(720, 5817, '8d580045-c6fc-409d-bb50-8a6ae5bd7e69_47153443277625'),
(721, 5817, '0ce16861-3141-46ea-88c4-90fcd03b22b2_47153452715625'),
(722, 5817, '12de86d1-d09d-4905-9554-ff166a970357_47153457136375'),
(723, 5818, '50c3e2e9-1760-48fb-81d2-8d50100b6cf6_48071235295375'),
(724, 5818, 'ec1869fb-9417-4e30-9d72-79da9d5a3e69_48071263122041'),
(725, 5818, '968404b1-148f-4d49-ad4e-17cc0d81d593_48071274755875'),
(726, 5818, '8671c088-53d2-4bf6-9412-c38ce37a70c1_48071279281291'),
(727, 5819, 'c4e115b6-ee32-44b9-b136-13a121dbc791_48209660112083'),
(728, 5819, '24beb5b7-2825-4a56-aa93-0a61e91f43fd_48209683655541'),
(729, 5819, 'f0fdd4bd-b213-456b-92a0-28ea3027cc93_48209709325791'),
(730, 5820, '2212dce9-1dda-40b4-8500-f9ee0392feda_48282683559833'),
(731, 5820, '9084c3d3-9fd1-4efd-9322-38ee897daa57_48282704520875'),
(732, 5820, 'b9229307-1a54-44c2-9f90-ccd4b09f228c_48282713038875'),
(741, 5822, 'ad82221c-388b-4f38-9a8b-4e749622211d_48536967571041'),
(742, 5822, 'ab0ce857-aeea-4a75-8726-5ecb1db4771d_48536987376666'),
(743, 5822, '6d1116dc-9067-405b-8c70-60121ea954c8_48536992530208'),
(744, 5823, '6ddf2c66-fe8b-4c03-a710-b12c1dd1b1b3_48647681483500'),
(745, 5823, 'c7109de1-f38b-423a-9ed5-58cf7d057edd_48647724491916'),
(746, 5823, '2b5b172e-3e15-4acc-95df-8e8eaddf8db1_48647736900500'),
(747, 5824, 'ff1e59e3-016f-426f-a417-cb1cc77018bb_48799464572750'),
(748, 5825, 'eac9e328-d026-4461-8174-a3252d787a68_48912736523208'),
(749, 5825, '5b67f65e-1eb8-4234-9b75-f966c4cd9658_48912751393250'),
(750, 5825, 'ec2a1111-9b3c-476c-93bb-9f4422586e18_48912757264708'),
(751, 5826, 'bd427a85-7ffb-4a8c-962e-90762152bdba_49000304973500'),
(752, 5826, '0f149e4b-8430-4ac9-9f0a-17be36d6f7db_49000314623375'),
(753, 5826, 'e66def25-c8d3-41bb-b10d-1e242ec42d0e_49000319984958'),
(754, 5827, '0fa74481-a88d-4d2a-ba79-2c7d02f88506_49089725231583'),
(755, 5827, '56fbe133-51d1-4077-998f-7a232530204b_49089736173291'),
(756, 5827, '4d95f101-dd24-4739-a15d-5efdc2142b0b_49089740267208');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int NOT NULL,
  `provider` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tên người dùng',
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  `is_mobile` tinyint(1) DEFAULT '0',
  `refresh_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `refresh_expiration_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `token_type`, `expiration_date`, `revoked`, `expired`, `user_id`, `is_mobile`, `refresh_token`, `refresh_expiration_date`) VALUES
(78, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTAiLCJ1c2VySWQiOjEzLCJzdWIiOiIxMjM0NTY3ODkwIiwiZXhwIjoxNzE4MTEzMTkxfQ.D2NpfOoLbk2U1LrN6cef7PcCffpVS9OUdHZQVgCGxZA', 'Bearer', '2024-06-11 13:39:52', 0, 0, 13, 0, 'a0a7dc39-c8ab-4e6c-8405-506d4471b6d3', '2024-07-11 13:39:52'),
(80, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTAiLCJ1c2VySWQiOjEzLCJzdWIiOiIxMjM0NTY3ODkwIiwiZXhwIjoxNzE4MTczNTA1fQ.r1s0Pneka491Eu83ogyFWDWFzx4MpdNgRjLPl1vYKGk', 'Bearer', '2024-06-12 06:25:06', 0, 0, 13, 0, '05a1c26d-40af-4f45-bfa4-e08f8a46ab48', '2024-07-12 06:25:06'),
(81, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTAiLCJ1c2VySWQiOjEzLCJzdWIiOiIxMjM0NTY3ODkwIiwiZXhwIjoxNzE4MTczNzU0fQ.84NJ3gtXgOw_37iCaI9MtkQa_xlhKCyMnPWIWSQARhY', 'Bearer', '2024-06-12 06:29:14', 0, 0, 13, 0, '0f2cfffb-eddb-4d4e-a80d-a34db99ee41a', '2024-07-12 06:29:14'),
(83, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTEwIiwidXNlcklkIjoxMiwic3ViIjoiMTIzNDU2Nzg5MTAiLCJleHAiOjE3MTgxNzcyODN9.KMBZjxVeNKqRS28Z3sHyWeqd_0fq0pdtUJIUjYh3muc', 'Bearer', '2024-06-12 07:28:03', 0, 0, 12, 0, '19b17dc3-371f-41fa-aa86-9ffd841fd01c', '2024-07-12 07:28:03'),
(84, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTEwIiwidXNlcklkIjoxMiwic3ViIjoiMTIzNDU2Nzg5MTAiLCJleHAiOjE3MTgxNzk2MTd9.wAYmI8oJLKVGAMOjyBGfxDWtNoJ48xRlJSqR56Pm9gw', 'Bearer', '2024-06-12 08:06:58', 0, 0, 12, 0, 'efe62c9f-2e44-49c7-a8b4-ab90ed1c0c83', '2024-07-12 08:06:58'),
(85, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTEwIiwidXNlcklkIjoxMiwic3ViIjoiMTIzNDU2Nzg5MTAiLCJleHAiOjE3MTgxODA5Mzh9.TsCrl-JXi1sPHgtm4DvxSz0me3YdO1uNh3j8W4tBGds', 'Bearer', '2024-06-12 08:28:58', 0, 0, 12, 0, 'dc002c6c-6e88-49e1-bad5-f24cb12d2f9c', '2024-07-12 08:28:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `password` char(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `date_of_birth` date DEFAULT NULL,
  `facebook_account_id` int DEFAULT '0',
  `google_account_id` int DEFAULT '0',
  `role_id` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone_number`, `address`, `password`, `created_at`, `updated_at`, `is_active`, `date_of_birth`, `facebook_account_id`, `google_account_id`, `role_id`) VALUES
(12, 'admin', '12345678910', 'asa', '$2a$10$8Qz5hC5buxb83mXl6/uKjuODomZ.Kc5V0do5kldTLteStNxzanqVq', '2024-05-11 13:27:15', '2024-05-11 13:27:15', 1, '2000-01-02', 0, 0, 2),
(13, 'users', '1234567890', 'ủe', '$2a$10$sRb7AApckTuuCyyRYySrluq0Ubo2vp66JW..cdx8IdY8DNXRPEMoi', '2024-05-11 13:40:52', '2024-05-11 13:40:52', 1, '2000-01-12', 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `flyway_schema_history`
--
ALTER TABLE `flyway_schema_history`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `flyway_schema_history_s_idx` (`success`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_orders_coupon` (`coupon_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `fk_order_details_coupon` (`coupon_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product_id` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5828;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=757;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  ADD CONSTRAINT `coupon_conditions_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
