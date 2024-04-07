-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql8-container
-- Generation Time: Apr 06, 2024 at 10:18 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.8

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
(45, 10, 'Bùi Thanh Sơn', 'sonbuithanh306@gmail.com', '0363079576', '926 nguyễn văn cừ', '', '2024-04-07 00:00:00', 'pending', 1111, 'express', NULL, '2024-04-07', NULL, 'cod', 1, NULL),
(46, 10, 'Bui ', 's@gmail.com', '1111111', 'sadada', 'as', '2024-04-07 00:00:00', 'pending', 1111, 'express', NULL, '2024-04-07', NULL, 'cod', 1, NULL),
(47, 9, 'adasd', 's@gmail.com', '1212121', 'asdasda', 'asdad', '2024-04-07 00:00:00', 'pending', 3893, 'express', NULL, '2024-04-07', NULL, 'cod', 1, NULL);

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
(78, 45, 5782, 1111.00, 1, NULL, NULL, NULL),
(79, 46, 5792, 1111.00, 1, NULL, NULL, NULL),
(80, 47, 5783, 112.00, 5, NULL, NULL, NULL),
(81, 47, 5782, 1111.00, 3, NULL, NULL, NULL);

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
(5782, 'aaaa', 1111.00, '4ec7a56d-99ae-421f-889c-a10b7c2bbd71_56628982926083', 'asa', '2024-04-06 18:11:34', '2024-04-06 18:11:34', 9),
(5783, ' eeee', 112.00, '6d99dd53-bee9-4c6e-8270-1234d6ecd08e_57823638557291', 'asd', '2024-04-06 18:31:28', '2024-04-06 18:31:28', 9),
(5784, 'jjjjj', 121121.00, 'c32e946b-ea68-400c-8554-105ec81d68f4_58056883063541', 'sdasda', '2024-04-06 18:35:22', '2024-04-06 18:35:22', 10),
(5785, 'ewerwr', 1211.00, '6b8a6c3c-012c-4887-82a4-6c48c21a2b4e_59209321641916', 'dsda', '2024-04-06 18:54:34', '2024-04-06 18:54:34', 9),
(5786, 'ggff', 121.00, 'd87c9a30-21fe-45d5-9250-821cb04a7d74_59221353779458', 'asdasd', '2024-04-06 18:54:46', '2024-04-06 18:54:46', 8),
(5787, 'sdasd', 1212.00, '43eae6e8-4424-4f01-b494-2aba0d1775ee_59241945420375', 'dasda', '2024-04-06 18:55:07', '2024-04-06 18:55:07', 8),
(5788, 'qweqw', 1111.00, '7f7371b7-d00e-43f6-900f-73bf4e141610_59260799839250', 'wdwqe', '2024-04-06 18:55:26', '2024-04-06 18:55:26', 9),
(5789, 'asda', 111.00, '54816e8a-d1e8-4edb-b7f3-9f0e766d9185_59276255320625', 'asda', '2024-04-06 18:55:41', '2024-04-06 18:55:41', 9),
(5790, 'asdad', 121.00, 'cc37b778-4631-450d-9abd-8b000b6e3f14_59313283646250', 'dasd', '2024-04-06 18:56:18', '2024-04-06 18:56:18', 9),
(5791, 'asdasd', 12121.00, '65129249-e3d6-4bb5-86c4-ebafda2a1f19_59334123398583', 'aasda', '2024-04-06 18:56:39', '2024-04-06 18:56:39', 8),
(5792, 'asdad', 1111.00, '40c73d90-0004-4de2-8a50-a484efadf779_59347857905041', 'sdasd', '2024-04-06 18:56:53', '2024-04-06 18:56:53', 9),
(5793, 'fsdsdas', 1111.00, 'ae5240bd-b4b7-410e-a1ae-16d053bfc399_59359846083500', 'asdad', '2024-04-06 18:57:05', '2024-04-06 18:57:05', 10),
(5794, 'asdad', 121.00, '58b1e797-7385-4a81-bc03-52726c4bc767_59377707937625', 'dfd', '2024-04-06 18:57:22', '2024-04-06 18:57:23', 8),
(5795, 'asas', 12121.00, 'bd064ae7-539c-466a-8514-91f05df969ca_60766705844833', 'qwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjsqwertyuiokndhjs', '2024-04-06 19:20:31', '2024-04-06 19:20:32', 10),
(5796, 'dsadsadawdsadsadawdsadsadawdsadsadawdsadsadawdsadsadawdsadsadawdsadsadawdsadsadawdsadsadaw', 121.00, 'b3a3b82e-ebb8-4217-9dc2-8677046cc6bc_60979872693208', 'asadasadasadasadasadasadasadasadasadasadasadasadasadasadasadasadasadasadasadasadasadasadasadasad', '2024-04-06 19:24:05', '2024-04-06 19:24:05', 10);

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
(641, 5782, '4ec7a56d-99ae-421f-889c-a10b7c2bbd71_56628982926083'),
(642, 5782, '0de453af-3451-4924-93ae-e165a38b67dc_56628998284750'),
(643, 5782, 'e508d612-e80e-4d41-b28a-308cd2d45802_56629005132541'),
(644, 5783, '6d99dd53-bee9-4c6e-8270-1234d6ecd08e_57823638557291'),
(645, 5783, '6b673916-25ee-4a12-b33d-f9188ebd9d64_57823657127875'),
(646, 5784, 'c32e946b-ea68-400c-8554-105ec81d68f4_58056883063541'),
(647, 5784, '63fc4bad-4d4f-48d7-ba2d-851d7b6df05d_58056899029625'),
(648, 5784, 'f4154f75-06b2-4203-be91-daafe867b63a_58056904024833'),
(649, 5785, '6b8a6c3c-012c-4887-82a4-6c48c21a2b4e_59209321641916'),
(650, 5785, '70356340-f74b-43fb-86f1-fc797d597b03_59209343181750'),
(651, 5786, 'd87c9a30-21fe-45d5-9250-821cb04a7d74_59221353779458'),
(652, 5786, '484b0111-57e5-4a1f-934c-f316ffc2b34f_59221371177333'),
(653, 5786, '0884182b-dff6-4d30-8d4a-0899859a9f5a_59221386405500'),
(654, 5786, '4ba0032e-ed96-4f8f-9c17-814601cc210a_59221394677083'),
(655, 5787, '43eae6e8-4424-4f01-b494-2aba0d1775ee_59241945420375'),
(656, 5787, '1e8254b1-b301-40a7-94f1-10a60d4a261b_59241967835500'),
(657, 5787, 'c356f2dd-1239-46eb-b7b7-daf750f69a98_59241974980583'),
(658, 5788, '7f7371b7-d00e-43f6-900f-73bf4e141610_59260799839250'),
(659, 5788, 'c3a05f7a-7e90-4677-81e2-0f87fca647ec_59260820342083'),
(660, 5788, '4637fb56-17ff-4743-9bf7-70077357c674_59260831227041'),
(661, 5789, '54816e8a-d1e8-4edb-b7f3-9f0e766d9185_59276255320625'),
(662, 5789, 'd272f647-69d6-48a1-80e7-e55e2e300051_59276272259333'),
(663, 5789, 'ce96846d-04cb-4fe3-b14e-ccba7ab9a70d_59276283206916'),
(664, 5790, 'cc37b778-4631-450d-9abd-8b000b6e3f14_59313283646250'),
(665, 5790, '7390ba31-73e2-42f5-a00c-9c67d8708b91_59313296053958'),
(666, 5791, '65129249-e3d6-4bb5-86c4-ebafda2a1f19_59334123398583'),
(667, 5792, '40c73d90-0004-4de2-8a50-a484efadf779_59347857905041'),
(668, 5792, 'e795a001-ac1a-4ca6-ba73-1dbc04349fdb_59347872180625'),
(669, 5792, 'a37f2222-35df-43ea-9546-f4c2df2cd7a4_59347879258458'),
(670, 5792, 'd136221d-cc06-4ac9-bed5-fb7e3fa78b5d_59347885428375'),
(671, 5793, 'ae5240bd-b4b7-410e-a1ae-16d053bfc399_59359846083500'),
(672, 5793, '061ff0f9-0f7b-4bdc-88b4-acc2fb2eb8af_59359856533791'),
(673, 5793, '97b9553d-f953-4fce-85f4-1904d171422c_59359872199208'),
(674, 5794, '58b1e797-7385-4a81-bc03-52726c4bc767_59377707937625'),
(675, 5794, '9312b5c9-f4e2-411f-b9e4-0798b36187a1_59377719215000'),
(676, 5795, 'bd064ae7-539c-466a-8514-91f05df969ca_60766705844833'),
(677, 5795, '5ef1e585-25c7-4070-843f-0684a6230028_60766723845750'),
(678, 5795, 'f82590c5-f2ed-4a0c-b2d1-0dcd3424c29d_60766738665291'),
(679, 5796, 'b3a3b82e-ebb8-4217-9dc2-8677046cc6bc_60979872693208');

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
(7, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMzNDQ1NTY2IiwidXNlcklkIjo1LCJzdWIiOiIzMzQ0NTU2NiIsImV4cCI6MTcwNDAxODIzMX0.mA1bofNECAkMWbZqK0h_WJgVqlTOjfd5XoAiDAqAy7w', 'Bearer', '2023-12-31 10:23:51', 0, 0, 5, 1, '', NULL),
(16, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMjIzMzQ0IiwidXNlcklkIjozLCJzdWIiOiIxMTIyMzM0NCIsImV4cCI6MTcwNDI1NjM2MH0.U6A4ed5dxRAzMxwHluiR0-_Rxm0ngXfZ1RN-VaW_OpY', 'Bearer', '2024-01-03 04:32:40', 0, 0, 3, 0, '8caf32df-69e8-4489-9716-4e2a2944a1a8', '2024-02-02 04:32:40'),
(29, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjA5NjQ4OTYyMzkiLCJ1c2VySWQiOjgsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3MDQ3MDc1MTR9.B3iHckT44zN8zG3clXsURaemqWvfz7HJkR-e9b9VCo0', 'Bearer', '2024-01-08 09:51:55', 0, 0, 8, 0, '9cd17548-6634-43c4-a0a6-376266413e68', '2024-02-07 09:51:55'),
(32, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjA5NjQ4OTYyMzkiLCJ1c2VySWQiOjgsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3MDQ3MDc2MTV9.CkOUQe1k7XFjLfiMJgB7VLvVnZnEfkASP0cc7eVAJtQ', 'Bearer', '2024-01-08 09:53:35', 0, 0, 8, 0, '94ac5e7b-abaa-40d7-90df-0a044b7c705c', '2024-02-07 09:53:35'),
(34, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjA5NjQ4OTYyMzkiLCJ1c2VySWQiOjgsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3MDQ3MDc4NzN9.NzGHRwdw9f1mK6OTe4a8Jsg6xdedeqoAQRb1FZO19Vo', 'Bearer', '2024-01-08 09:57:53', 0, 0, 8, 0, 'c9544702-4ea7-403a-9914-4159f952287a', '2024-02-07 09:57:53'),
(36, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMjIzMzQ0IiwidXNlcklkIjozLCJzdWIiOiIxMTIyMzM0NCIsImV4cCI6MTcxNDU3NzAzOX0.kUc3YxjaqapBxQPkkIypt1Gf7bXPtdSzDxgXm8eChAk', 'Bearer', '2024-05-01 15:23:59', 0, 0, 3, 0, '5f2b69da-c916-4996-8076-d4ccce4d4e47', '2024-05-31 15:23:59'),
(41, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMjIzMzQ0IiwidXNlcklkIjozLCJzdWIiOiIxMTIyMzM0NCIsImV4cCI6MTcxNDc5MjMzNn0.dH98q5AEWZ7O1Q1SwyJuoh0a_j8WUBODNjsx8YZJLwY', 'Bearer', '2024-05-04 03:12:17', 0, 0, 3, 0, 'fe8496c5-ac15-4e36-ae8c-b073d12440b7', '2024-06-03 03:12:17'),
(45, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1NiIsInVzZXJJZCI6MTAsInN1YiI6IjEyMzQ1NiIsImV4cCI6MTcxNTAxODk1M30.bnhdQuuxZiaDz-GgRmP5lOxNAZRPamserYrd8FDwEm4', 'Bearer', '2024-05-06 18:09:14', 0, 0, 10, 0, '541dcacc-4b2d-4866-8e82-da92e365d4df', '2024-06-05 18:09:14'),
(47, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1NiIsInVzZXJJZCI6MTAsInN1YiI6IjEyMzQ1NiIsImV4cCI6MTcxNTAyMDQ3MX0.WTFq6X_oY6neEH0CKmNtnYaSpVrVvZk6mQJpFYNz-iY', 'Bearer', '2024-05-06 18:34:31', 0, 0, 10, 0, 'c7f487d3-99f8-4b04-a2e1-679915d186de', '2024-06-05 18:34:31'),
(49, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1NiIsInVzZXJJZCI6MTAsInN1YiI6IjEyMzQ1NiIsImV4cCI6MTcxNTAyMTY1MX0.E1pWVIaYuoJmLqOlrbPC5aX-gKXzX0kRtny-7kovQt8', 'Bearer', '2024-05-06 18:54:12', 0, 0, 10, 0, '5816f84f-f9dc-4fad-ae34-e1d22ca2a34d', '2024-06-05 18:54:12'),
(50, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMTExMSIsInVzZXJJZCI6OSwic3ViIjoiMTExMTExIiwiZXhwIjoxNzE1MDI4MjM1fQ.zWLrf--z9aMxH_qQ1oft4hSvCEOngcoMT4XsRCqV5F0', 'Bearer', '2024-05-06 20:43:55', 0, 0, 9, 0, '1affde0f-58a2-41f4-975a-4134d9528726', '2024-06-05 20:43:55'),
(58, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMzNDQ1NTY2IiwidXNlcklkIjo1LCJzdWIiOiIzMzQ0NTU2NiIsImV4cCI6MTcxNTAyODMxOH0.sbt0INwqRQfHoe0NLa_dphAN9yZLWvM11fRt02lzFYQ', 'Bearer', '2024-05-06 20:45:19', 0, 0, 5, 0, '9f30f775-7d1e-46d0-a12b-0ee02f5735a2', '2024-06-05 20:45:19'),
(59, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMzNDQ1NTY2IiwidXNlcklkIjo1LCJzdWIiOiIzMzQ0NTU2NiIsImV4cCI6MTcxNTAyODM3MX0.YnZ0zoZunEyvRTIZ4GGbX8mKTwcFCpmfjt-oFFO5lFU', 'Bearer', '2024-05-06 20:46:11', 0, 0, 5, 0, 'aa29f813-ba44-4d2c-8c10-f2b9d0fba7aa', '2024-06-05 20:46:11'),
(60, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMTExMSIsInVzZXJJZCI6OSwic3ViIjoiMTExMTExIiwiZXhwIjoxNzE1MDI4NDM2fQ.SZ3TulK5LLDHTRK5waBOACTPBU-9bK31AND52hVJYFU', 'Bearer', '2024-05-06 20:47:17', 0, 0, 9, 0, '82c7965a-73d6-4613-982d-b894bf97bd90', '2024-06-05 20:47:17'),
(61, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjExMTExMSIsInVzZXJJZCI6OSwic3ViIjoiMTExMTExIiwiZXhwIjoxNzE1MDI5ODY1fQ.fz9Y2l0B9d2or5O-BhoSREiYzFhBQIjeqX4A4N1arKY', 'Bearer', '2024-05-06 21:11:05', 0, 0, 9, 0, 'c09300a9-7992-416f-8cb8-6fb1d5d12014', '2024-06-05 21:11:05');

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
(2, 'Nguyễn Văn A', '012456878', 'Nhà a ngõ b', '$2a$10$WdSf5UuyxQMAHcO502qXredzcc8OZQo4XQZNp3UxeT6/bKbuJx/6y', '2023-08-03 05:36:11', '2023-08-03 05:36:11', 1, '1999-10-25', 0, 0, 2),
(3, 'Tài khoản admin 1', '11223344', 'Đây là admin nhé', '$2a$10$JFQT3HeFUKDl7c/l.iNFAeybFr7Wi3krwgVVR7ieif.2De5p9LGAG', '2023-08-06 00:34:35', '2023-08-06 00:34:35', 1, '1993-10-25', 0, 0, 2),
(5, 'Nguyễn Văn test 11', '33445566', 'Nhà a ngõ b 11', '$2a$10$e95NOMrOFFpfhWibOpAw/uJrqfsBuJ9O3xNgZAP6vnHTh5QHvgliu', '2023-08-08 03:02:48', '2023-11-16 01:05:34', 1, '2000-10-25', 2, 3, 1),
(7, 'Nguyen Van Y', '123456789', 'Đây là user', '$2a$10$oZwu2RA2iiNVIaQZgdi7bueKc5YNWr39yu.gXdsavBzo5AOb1kP5e', '2023-11-16 00:52:29', '2023-11-16 00:52:29', 1, '2000-10-25', 0, 0, 1),
(8, 'Nguyen Duc Hoang-user', '0964896239', 'Bach mai, hanoi, vietnam', '$2a$10$cGkVz4/65tDn2M33Gx3GYOC3DKrRni4SK/m1So0rpIXQFiG/ltM5G', '2023-12-09 08:27:38', '2023-12-09 08:27:38', 1, '1979-10-25', 0, 0, 1),
(9, 'Bùi Thanh Sơn', '111111', '926 nguyễn văn cừ', '$2a$10$lF5t3N4mBq32bDa/F5F95e.o9bAasCVlS1K/EylrL8xZWdtKhzfhC', '2024-04-06 17:49:30', '2024-04-06 17:49:30', 1, '2003-08-27', 0, 0, 1),
(10, 'Bui Thanh Son', '123456', 'Đây là user', '$2a$10$WtKqqMb9AdRfbHvNiFKW1ezITL7srCiE6oWxZCEZ82TfsLBcG5Z2e', '2024-04-06 18:02:59', '2024-04-06 18:02:59', 1, '2000-10-25', 0, 0, 2);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5797;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=680;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
