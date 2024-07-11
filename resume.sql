-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 09, 2024 lúc 01:23 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `resume`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Entertainment', 'entertainment', '2024-07-06 00:51:27', '2024-07-08 03:20:53'),
(2, NULL, 1, 'AI', 'ai', '2024-07-06 00:51:27', '2024-07-08 03:21:06'),
(3, NULL, 1, 'Developer', 'developer', '2024-07-08 03:21:39', '2024-07-08 03:21:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `number`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(6, 'Minh Admin', 'admin@admin.com', '0398435434', 'deploying take too much time', 'Final Test', '2024-07-08 02:56:51', '2024-07-08 02:56:51'),
(7, 'Minh Admin', 'admin@admin.com', '0398435434', 'deploying take too much time', 'FINAL', '2024-07-08 02:57:29', '2024-07-08 02:57:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(59, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(74, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(75, 9, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(76, 9, 'img', 'image', 'Img', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 3),
(77, 9, 'shortDes', 'text', 'ShortDes', 0, 0, 1, 1, 1, 1, '{}', 4),
(78, 9, 'des', 'text_area', 'Des', 0, 0, 1, 1, 1, 1, '{}', 5),
(79, 9, 'birthday', 'date', 'Birthday', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 6),
(80, 9, 'degree', 'text', 'Degree', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(81, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 8),
(82, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(83, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(85, 10, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 3),
(86, 10, 'des', 'text_area', 'Des', 0, 1, 1, 1, 1, 1, '{}', 4),
(87, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 5),
(88, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(89, 10, 'icon', 'text', 'Icon', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 2),
(90, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(91, 11, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 2),
(92, 11, 'year', 'text', 'Year', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 3),
(93, 11, 'des', 'text_area', 'Des', 0, 1, 1, 1, 1, 1, '{}', 5),
(94, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 6),
(95, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(96, 11, 'type', 'select_dropdown', 'Type', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"},\"default\":\"1\",\"options\":{\"1\":\"EDUCATION\",\"2\":\"EXPERIENCE\"}}', 4),
(97, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(98, 12, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 2),
(99, 12, 'point', 'number', 'Point', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"},\"step\":1,\"min\":1,\"max\":10,\"default\":1}', 3),
(100, 12, 'type', 'select_dropdown', 'Type', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"},\"default\":\"1\",\"options\":{\"1\":\"LANGUAGE\",\"2\":\"CODING\"}}', 4),
(101, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(102, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(103, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(104, 13, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 2),
(105, 13, 'img', 'image', 'Img', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"}}', 4),
(106, 13, 'des', 'rich_text_box', 'Des', 0, 0, 1, 1, 1, 1, '{}', 5),
(107, 13, 'client', 'text', 'Client', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 6),
(108, 13, 'skill', 'text', 'Skill', 0, 0, 1, 1, 1, 1, '{\"display\":{\"width\":\"6\"}}', 7),
(109, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 8),
(110, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(111, 13, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\"},\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}', 3),
(112, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(113, 14, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(114, 14, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 3),
(115, 14, 'number', 'text', 'Number', 0, 1, 1, 1, 1, 1, '{}', 4),
(116, 14, 'subject', 'text', 'Subject', 0, 1, 1, 1, 1, 1, '{}', 5),
(117, 14, 'message', 'text_area', 'Message', 0, 1, 1, 1, 1, 1, '{}', 6),
(118, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(119, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(7, 'jobs', 'jobs', 'Job', 'Jobs', 'voyager-medal-rank-star', 'App\\Job', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-07-06 01:59:34', '2024-07-06 01:59:34'),
(9, 'infos', 'infos', 'Info', 'Infos', 'voyager-diamond', 'App\\Info', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-07-06 04:38:47', '2024-07-06 23:29:31'),
(10, 'services', 'services', 'Service', 'Services', 'voyager-anchor', 'App\\Service', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-07-06 05:29:21', '2024-07-06 05:33:50'),
(11, 'resumes', 'resumes', 'Resume', 'Resumes', 'voyager-company', 'App\\Resume', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-07-06 23:43:56', '2024-07-06 23:48:54'),
(12, 'skills', 'skills', 'Skill', 'Skills', 'voyager-medal-rank-star', 'App\\Skill', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-07-07 00:39:04', '2024-07-07 00:41:43'),
(13, 'projects', 'projects', 'Project', 'Projects', 'voyager-info-circled', 'App\\Project', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-07-08 00:28:00', '2024-07-08 01:17:21'),
(14, 'contacts', 'contacts', 'Contact', 'Contacts', 'voyager-telephone', 'App\\Contact', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-07-08 01:59:05', '2024-07-08 01:59:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `infos`
--

CREATE TABLE `infos` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortDes` text COLLATE utf8mb4_unicode_ci,
  `des` text COLLATE utf8mb4_unicode_ci,
  `birthday` date DEFAULT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `img` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `infos`
--

INSERT INTO `infos` (`id`, `name`, `shortDes`, `des`, `birthday`, `degree`, `created_at`, `updated_at`, `img`) VALUES
(1, 'Hoang Nhat Minh', 'Welcome to my website, I\'m Minh, a normal guy with good enough sence of hurmor to be friend with, I\'m also a web designer, coder and a gamer, right now I\'m a second year at ICTU.', 'Welcome to my website! I\'m Minh, a normal guy with a good enough sense of humor to be friends with. I\'m also a web designer, coder, and gamer. Right now, I\'m in my second year at ICTU. If you want to be my friend or hire me for some jobs, you can contact me. I\'m always free ;)', '2004-04-10', 'Bachelor', '2024-07-06 02:50:00', '2024-07-06 23:28:57', 'infos\\July2024\\i3KIqyfV4kMitMypvYu3.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `jobs`
--

INSERT INTO `jobs` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Web Designer', '2024-07-06 02:02:09', '2024-07-06 02:02:09'),
(2, 'Web Developer', '2024-07-06 02:02:00', '2024-07-06 02:33:47'),
(3, 'Coder', '2024-07-06 02:33:54', '2024-07-06 02:33:54'),
(4, 'Gamer', '2024-07-06 02:34:52', '2024-07-06 02:34:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(2, 'homepage', '2024-07-06 01:21:02', '2024-07-06 01:21:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2024-07-06 00:51:27', '2024-07-06 00:51:27', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 20, 2, '2024-07-06 00:51:27', '2024-07-06 01:56:38', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 22, 2, '2024-07-06 00:51:27', '2024-07-06 02:00:26', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 22, 1, '2024-07-06 00:51:27', '2024-07-06 02:00:16', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2024-07-06 00:51:27', '2024-07-08 01:59:34', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2024-07-06 00:51:27', '2024-07-06 01:55:54', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2024-07-06 00:51:27', '2024-07-06 01:55:54', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2024-07-06 00:51:27', '2024-07-06 01:55:54', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2024-07-06 00:51:27', '2024-07-06 01:55:54', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2024-07-06 00:51:27', '2024-07-08 01:59:34', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 20, 3, '2024-07-06 00:51:27', '2024-07-06 01:56:40', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 20, 1, '2024-07-06 00:51:27', '2024-07-06 01:56:34', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 27, 1, '2024-07-06 00:51:27', '2024-07-06 23:45:08', 'voyager.pages.index', NULL),
(14, 2, 'Home', '/', '_self', NULL, '#000000', NULL, 1, '2024-07-06 01:21:53', '2024-07-06 01:51:13', NULL, ''),
(15, 2, 'Resume', '/resume', '_self', NULL, '#000000', NULL, 2, '2024-07-06 01:22:17', '2024-07-08 01:59:25', NULL, ''),
(16, 2, 'Portfolio', '/portfolio', '_self', NULL, '#000000', NULL, 3, '2024-07-06 01:22:46', '2024-07-08 01:59:25', NULL, ''),
(17, 2, 'Blog', '/blog', '_self', NULL, '#000000', NULL, 4, '2024-07-06 01:23:17', '2024-07-08 01:59:25', NULL, ''),
(18, 2, 'Contact', '/contact', '_self', NULL, '#000000', NULL, 5, '2024-07-06 01:35:46', '2024-07-08 01:59:25', NULL, ''),
(20, 1, 'CMS', '', '_self', 'voyager-images', '#000000', NULL, 5, '2024-07-06 01:56:29', '2024-07-08 01:59:34', NULL, ''),
(21, 1, 'Jobs', '', '_self', 'voyager-medal-rank-star', NULL, 27, 4, '2024-07-06 01:59:34', '2024-07-06 23:45:11', 'voyager.jobs.index', NULL),
(22, 1, 'Auth', '', '_self', 'voyager-people', '#000000', NULL, 4, '2024-07-06 02:00:05', '2024-07-08 01:59:34', NULL, ''),
(24, 1, 'Infos', '', '_self', 'voyager-diamond', NULL, 27, 2, '2024-07-06 04:38:47', '2024-07-06 23:45:09', 'voyager.infos.index', NULL),
(25, 1, 'Services', '', '_self', 'voyager-anchor', NULL, 27, 3, '2024-07-06 05:29:21', '2024-07-06 23:45:11', 'voyager.services.index', NULL),
(26, 1, 'Resumes', '', '_self', 'voyager-company', NULL, 27, 7, '2024-07-06 23:43:57', '2024-07-08 00:28:34', 'voyager.resumes.index', NULL),
(27, 1, 'Page Management', '', '_self', 'voyager-file-text', '#000000', NULL, 3, '2024-07-06 23:45:01', '2024-07-08 01:59:34', NULL, ''),
(28, 1, 'Skills', '', '_self', 'voyager-medal-rank-star', NULL, 27, 5, '2024-07-07 00:39:04', '2024-07-07 00:39:21', 'voyager.skills.index', NULL),
(29, 1, 'Projects', '', '_self', 'voyager-info-circled', NULL, 27, 6, '2024-07-08 00:28:00', '2024-07-08 00:28:34', 'voyager.projects.index', NULL),
(30, 1, 'Contacts', '', '_self', 'voyager-telephone', NULL, NULL, 2, '2024-07-08 01:59:05', '2024-07-08 01:59:34', 'voyager.contacts.index', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2024-07-06 00:51:27', '2024-07-06 00:51:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(2, 'browse_bread', NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(3, 'browse_database', NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(4, 'browse_media', NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(5, 'browse_compass', NULL, '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(6, 'browse_menus', 'menus', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(7, 'read_menus', 'menus', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(8, 'edit_menus', 'menus', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(9, 'add_menus', 'menus', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(10, 'delete_menus', 'menus', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(11, 'browse_roles', 'roles', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(12, 'read_roles', 'roles', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(13, 'edit_roles', 'roles', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(14, 'add_roles', 'roles', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(15, 'delete_roles', 'roles', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(16, 'browse_users', 'users', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(17, 'read_users', 'users', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(18, 'edit_users', 'users', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(19, 'add_users', 'users', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(20, 'delete_users', 'users', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(21, 'browse_settings', 'settings', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(22, 'read_settings', 'settings', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(23, 'edit_settings', 'settings', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(24, 'add_settings', 'settings', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(25, 'delete_settings', 'settings', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(26, 'browse_categories', 'categories', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(27, 'read_categories', 'categories', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(28, 'edit_categories', 'categories', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(29, 'add_categories', 'categories', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(30, 'delete_categories', 'categories', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(31, 'browse_posts', 'posts', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(32, 'read_posts', 'posts', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(33, 'edit_posts', 'posts', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(34, 'add_posts', 'posts', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(35, 'delete_posts', 'posts', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(36, 'browse_pages', 'pages', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(37, 'read_pages', 'pages', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(38, 'edit_pages', 'pages', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(39, 'add_pages', 'pages', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(40, 'delete_pages', 'pages', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(41, 'browse_jobs', 'jobs', '2024-07-06 01:59:34', '2024-07-06 01:59:34'),
(42, 'read_jobs', 'jobs', '2024-07-06 01:59:34', '2024-07-06 01:59:34'),
(43, 'edit_jobs', 'jobs', '2024-07-06 01:59:34', '2024-07-06 01:59:34'),
(44, 'add_jobs', 'jobs', '2024-07-06 01:59:34', '2024-07-06 01:59:34'),
(45, 'delete_jobs', 'jobs', '2024-07-06 01:59:34', '2024-07-06 01:59:34'),
(51, 'browse_infos', 'infos', '2024-07-06 04:38:47', '2024-07-06 04:38:47'),
(52, 'read_infos', 'infos', '2024-07-06 04:38:47', '2024-07-06 04:38:47'),
(53, 'edit_infos', 'infos', '2024-07-06 04:38:47', '2024-07-06 04:38:47'),
(54, 'add_infos', 'infos', '2024-07-06 04:38:47', '2024-07-06 04:38:47'),
(55, 'delete_infos', 'infos', '2024-07-06 04:38:47', '2024-07-06 04:38:47'),
(56, 'browse_services', 'services', '2024-07-06 05:29:21', '2024-07-06 05:29:21'),
(57, 'read_services', 'services', '2024-07-06 05:29:21', '2024-07-06 05:29:21'),
(58, 'edit_services', 'services', '2024-07-06 05:29:21', '2024-07-06 05:29:21'),
(59, 'add_services', 'services', '2024-07-06 05:29:21', '2024-07-06 05:29:21'),
(60, 'delete_services', 'services', '2024-07-06 05:29:21', '2024-07-06 05:29:21'),
(61, 'browse_resumes', 'resumes', '2024-07-06 23:43:56', '2024-07-06 23:43:56'),
(62, 'read_resumes', 'resumes', '2024-07-06 23:43:56', '2024-07-06 23:43:56'),
(63, 'edit_resumes', 'resumes', '2024-07-06 23:43:56', '2024-07-06 23:43:56'),
(64, 'add_resumes', 'resumes', '2024-07-06 23:43:56', '2024-07-06 23:43:56'),
(65, 'delete_resumes', 'resumes', '2024-07-06 23:43:56', '2024-07-06 23:43:56'),
(66, 'browse_skills', 'skills', '2024-07-07 00:39:04', '2024-07-07 00:39:04'),
(67, 'read_skills', 'skills', '2024-07-07 00:39:04', '2024-07-07 00:39:04'),
(68, 'edit_skills', 'skills', '2024-07-07 00:39:04', '2024-07-07 00:39:04'),
(69, 'add_skills', 'skills', '2024-07-07 00:39:04', '2024-07-07 00:39:04'),
(70, 'delete_skills', 'skills', '2024-07-07 00:39:04', '2024-07-07 00:39:04'),
(71, 'browse_projects', 'projects', '2024-07-08 00:28:00', '2024-07-08 00:28:00'),
(72, 'read_projects', 'projects', '2024-07-08 00:28:00', '2024-07-08 00:28:00'),
(73, 'edit_projects', 'projects', '2024-07-08 00:28:00', '2024-07-08 00:28:00'),
(74, 'add_projects', 'projects', '2024-07-08 00:28:00', '2024-07-08 00:28:00'),
(75, 'delete_projects', 'projects', '2024-07-08 00:28:00', '2024-07-08 00:28:00'),
(76, 'browse_contacts', 'contacts', '2024-07-08 01:59:05', '2024-07-08 01:59:05'),
(77, 'read_contacts', 'contacts', '2024-07-08 01:59:05', '2024-07-08 01:59:05'),
(78, 'edit_contacts', 'contacts', '2024-07-08 01:59:05', '2024-07-08 01:59:05'),
(79, 'add_contacts', 'contacts', '2024-07-08 01:59:05', '2024-07-08 01:59:05'),
(80, 'delete_contacts', 'contacts', '2024-07-08 01:59:05', '2024-07-08 01:59:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
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
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 1, '2024-07-06 00:51:27', '2024-07-08 03:23:29'),
(2, 1, 3, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n<h2>We can use all kinds of format!</h2>\r\n<p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 1, '2024-07-06 00:51:27', '2024-07-08 03:23:36'),
(3, 1, 3, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 1, '2024-07-06 00:51:27', '2024-07-08 03:23:42'),
(4, 1, 3, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 1, '2024-07-06 00:51:27', '2024-07-08 03:23:47'),
(5, 1, 2, 'My Thought On AI', 'AI', 'Artificial intelligence (AI), in its broadest sense, is intelligence exhibited by machines, particularly computer systems. It is a field of research in computer science that develops and studies methods and software that enable machines to perceive their environment and use learning and intelligence to take actions that maximize their chances of achieving defined goals.[1] Such machines may be called AIs.', '<p><strong>Artificial intelligence</strong>&nbsp;(<strong>AI</strong>), in its broadest sense, is&nbsp;<a title=\"Intelligence\" href=\"https://en.wikipedia.org/wiki/Intelligence\">intelligence</a>&nbsp;exhibited by&nbsp;<a title=\"Machine\" href=\"https://en.wikipedia.org/wiki/Machine\">machines</a>, particularly&nbsp;<a class=\"mw-redirect\" title=\"Computer systems\" href=\"https://en.wikipedia.org/wiki/Computer_systems\">computer systems</a>. It is a&nbsp;<a class=\"mw-redirect\" title=\"Field of research\" href=\"https://en.wikipedia.org/wiki/Field_of_research\">field of research</a>&nbsp;in&nbsp;<a title=\"Computer science\" href=\"https://en.wikipedia.org/wiki/Computer_science\">computer science</a>&nbsp;that develops and studies methods and&nbsp;<a title=\"Software\" href=\"https://en.wikipedia.org/wiki/Software\">software</a>&nbsp;that enable machines to&nbsp;<a title=\"Machine perception\" href=\"https://en.wikipedia.org/wiki/Machine_perception\">perceive their environment</a>&nbsp;and use&nbsp;<a title=\"Machine learning\" href=\"https://en.wikipedia.org/wiki/Machine_learning\">learning</a>&nbsp;and intelligence to take actions that maximize their chances of achieving defined goals.<sup id=\"cite_ref-FOOTNOTERussellNorvig20211&ndash;4_1-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-FOOTNOTERussellNorvig20211%E2%80%934-1\">[1]</a></sup>&nbsp;Such machines may be called AIs.</p>\r\n<p>Some high-profile&nbsp;<a class=\"mw-redirect\" title=\"Applications of AI\" href=\"https://en.wikipedia.org/wiki/Applications_of_AI\">applications of AI</a>&nbsp;include advanced&nbsp;<a class=\"mw-redirect\" title=\"Web search engine\" href=\"https://en.wikipedia.org/wiki/Web_search_engine\">web search engines</a>&nbsp;(e.g.,&nbsp;<a title=\"Google Search\" href=\"https://en.wikipedia.org/wiki/Google_Search\">Google Search</a>);&nbsp;<a title=\"Recommender system\" href=\"https://en.wikipedia.org/wiki/Recommender_system\">recommendation systems</a>&nbsp;(used by&nbsp;<a title=\"YouTube\" href=\"https://en.wikipedia.org/wiki/YouTube\">YouTube</a>,&nbsp;<a title=\"Amazon (company)\" href=\"https://en.wikipedia.org/wiki/Amazon_(company)\">Amazon</a>, and&nbsp;<a title=\"Netflix\" href=\"https://en.wikipedia.org/wiki/Netflix\">Netflix</a>); interacting&nbsp;<a class=\"mw-redirect\" title=\"Natural-language understanding\" href=\"https://en.wikipedia.org/wiki/Natural-language_understanding\">via human speech</a>&nbsp;(e.g.,&nbsp;<a title=\"Google Assistant\" href=\"https://en.wikipedia.org/wiki/Google_Assistant\">Google Assistant</a>,&nbsp;<a title=\"Siri\" href=\"https://en.wikipedia.org/wiki/Siri\">Siri</a>, and&nbsp;<a title=\"Amazon Alexa\" href=\"https://en.wikipedia.org/wiki/Amazon_Alexa\">Alexa</a>);&nbsp;<a class=\"mw-redirect\" title=\"Autonomous vehicles\" href=\"https://en.wikipedia.org/wiki/Autonomous_vehicles\">autonomous vehicles</a>&nbsp;(e.g.,&nbsp;<a title=\"Waymo\" href=\"https://en.wikipedia.org/wiki/Waymo\">Waymo</a>);&nbsp;<a title=\"Generative artificial intelligence\" href=\"https://en.wikipedia.org/wiki/Generative_artificial_intelligence\">generative</a>&nbsp;and&nbsp;<a title=\"Computational creativity\" href=\"https://en.wikipedia.org/wiki/Computational_creativity\">creative</a>&nbsp;tools (e.g.,&nbsp;<a title=\"ChatGPT\" href=\"https://en.wikipedia.org/wiki/ChatGPT\">ChatGPT</a>,&nbsp;<a title=\"Apple Intelligence\" href=\"https://en.wikipedia.org/wiki/Apple_Intelligence\">Apple Intelligence</a>, and&nbsp;<a class=\"mw-redirect\" title=\"AI art\" href=\"https://en.wikipedia.org/wiki/AI_art\">AI art</a>); and&nbsp;<a title=\"Superintelligence\" href=\"https://en.wikipedia.org/wiki/Superintelligence\">superhuman</a>&nbsp;play and analysis in&nbsp;<a title=\"Strategy game\" href=\"https://en.wikipedia.org/wiki/Strategy_game\">strategy games</a>&nbsp;(e.g.,&nbsp;<a title=\"Chess\" href=\"https://en.wikipedia.org/wiki/Chess\">chess</a>&nbsp;and&nbsp;<a title=\"Go (game)\" href=\"https://en.wikipedia.org/wiki/Go_(game)\">Go</a>).<sup id=\"cite_ref-FOOTNOTEGoogle2016_2-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-FOOTNOTEGoogle2016-2\">[2]</a></sup>&nbsp;However, many AI applications are not perceived as AI: \"A lot of cutting edge AI has filtered into general applications, often without being called AI because once something becomes useful enough and common enough it\'s&nbsp;<a title=\"AI effect\" href=\"https://en.wikipedia.org/wiki/AI_effect\">not labeled AI anymore</a>.\"<sup id=\"cite_ref-3\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-3\">[3]</a></sup><sup id=\"cite_ref-andreas_4-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-andreas-4\">[4]</a></sup></p>\r\n<p><a title=\"Alan Turing\" href=\"https://en.wikipedia.org/wiki/Alan_Turing\">Alan Turing</a>&nbsp;was the first person to conduct substantial research in the field that he called machine intelligence.<sup id=\"cite_ref-turing_5-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-turing-5\">[5]</a></sup>&nbsp;Artificial intelligence was founded as an academic discipline in 1956,<sup id=\"cite_ref-Dartmouth_workshop_6-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-Dartmouth_workshop-6\">[6]</a></sup>&nbsp;by those now considered the founding fathers of AI,&nbsp;<a title=\"John McCarthy (computer scientist)\" href=\"https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)\">John McCarthy</a>,&nbsp;<a title=\"Marvin Minsky\" href=\"https://en.wikipedia.org/wiki/Marvin_Minsky\">Marvin Minksy</a>,&nbsp;<a title=\"Nathaniel Rochester (computer scientist)\" href=\"https://en.wikipedia.org/wiki/Nathaniel_Rochester_(computer_scientist)\">Nathaniel Rochester</a>, and&nbsp;<a title=\"Claude Shannon\" href=\"https://en.wikipedia.org/wiki/Claude_Shannon\">Claude Shannon</a>.<sup id=\"cite_ref-7\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-7\">[7]</a></sup><sup id=\"cite_ref-8\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-8\">[8]</a></sup>&nbsp;The field went through multiple cycles of optimism,<sup id=\"cite_ref-AI_in_the_60s_9-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-AI_in_the_60s-9\">[9]</a></sup><sup id=\"cite_ref-AI_in_the_80s_10-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-AI_in_the_80s-10\">[10]</a></sup>&nbsp;followed by periods of disappointment and loss of funding, known as&nbsp;<a title=\"AI winter\" href=\"https://en.wikipedia.org/wiki/AI_winter\">AI winter</a>.<sup id=\"cite_ref-First_AI_winter_11-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-First_AI_winter-11\">[11]</a></sup><sup id=\"cite_ref-Second_AI_winter_12-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-Second_AI_winter-12\">[12]</a></sup>&nbsp;Funding and interest vastly increased after 2012 when&nbsp;<a title=\"Deep learning\" href=\"https://en.wikipedia.org/wiki/Deep_learning\">deep learning</a>&nbsp;surpassed all previous AI techniques,<sup id=\"cite_ref-Deep_learning_revolution_13-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-Deep_learning_revolution-13\">[13]</a></sup>&nbsp;and after 2017 with the&nbsp;<a class=\"mw-redirect\" title=\"Transformer (machine learning model)\" href=\"https://en.wikipedia.org/wiki/Transformer_(machine_learning_model)\">transformer architecture</a>.<sup id=\"cite_ref-FOOTNOTEToews2023_14-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-FOOTNOTEToews2023-14\">[14]</a></sup>&nbsp;This led to the&nbsp;<a title=\"AI boom\" href=\"https://en.wikipedia.org/wiki/AI_boom\">AI boom</a>&nbsp;of the early 2020s, with companies, universities, and laboratories overwhelmingly based in the United States pioneering significant&nbsp;<a class=\"mw-redirect\" title=\"Advances in artificial intelligence\" href=\"https://en.wikipedia.org/wiki/Advances_in_artificial_intelligence\">advances in artificial intelligence</a>.<sup id=\"cite_ref-FOOTNOTEFrank2023_15-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-FOOTNOTEFrank2023-15\">[15]</a></sup></p>\r\n<p>The growing use of artificial intelligence in the 21st century is influencing a societal and economic shift towards increased&nbsp;<a title=\"Automation\" href=\"https://en.wikipedia.org/wiki/Automation\">automation</a>,&nbsp;<a class=\"mw-redirect\" title=\"Data-driven decision-making\" href=\"https://en.wikipedia.org/wiki/Data-driven_decision-making\">data-driven decision-making</a>, and the&nbsp;<a title=\"Artificial intelligence systems integration\" href=\"https://en.wikipedia.org/wiki/Artificial_intelligence_systems_integration\">integration of AI systems</a>&nbsp;into various economic sectors and areas of life,&nbsp;<a title=\"Workplace impact of artificial intelligence\" href=\"https://en.wikipedia.org/wiki/Workplace_impact_of_artificial_intelligence\">impacting job markets</a>,&nbsp;<a title=\"Artificial intelligence in healthcare\" href=\"https://en.wikipedia.org/wiki/Artificial_intelligence_in_healthcare\">healthcare</a>,&nbsp;<a title=\"Artificial intelligence in government\" href=\"https://en.wikipedia.org/wiki/Artificial_intelligence_in_government\">government</a>,&nbsp;<a title=\"Artificial intelligence in industry\" href=\"https://en.wikipedia.org/wiki/Artificial_intelligence_in_industry\">industry</a>,&nbsp;<a title=\"Artificial intelligence in education\" href=\"https://en.wikipedia.org/wiki/Artificial_intelligence_in_education\">education</a>,&nbsp;<a title=\"Propaganda\" href=\"https://en.wikipedia.org/wiki/Propaganda\">propaganda</a>, and&nbsp;<a title=\"Disinformation\" href=\"https://en.wikipedia.org/wiki/Disinformation\">disinformation</a>. This raises questions about&nbsp;<a title=\"AI aftermath scenarios\" href=\"https://en.wikipedia.org/wiki/AI_aftermath_scenarios\">the long-term effects</a>,&nbsp;<a title=\"Ethics of artificial intelligence\" href=\"https://en.wikipedia.org/wiki/Ethics_of_artificial_intelligence\">ethical implications</a>, and&nbsp;<a class=\"mw-redirect\" title=\"AI risk\" href=\"https://en.wikipedia.org/wiki/AI_risk\">risks of AI</a>, prompting discussions about&nbsp;<a title=\"Regulation of artificial intelligence\" href=\"https://en.wikipedia.org/wiki/Regulation_of_artificial_intelligence\">regulatory policies</a>&nbsp;to ensure the&nbsp;<a title=\"AI safety\" href=\"https://en.wikipedia.org/wiki/AI_safety\">safety and benefits of the technology</a>.</p>\r\n<p>The various subfields of AI research are centered around particular goals and the use of particular tools. The traditional goals of AI research include&nbsp;<a title=\"Automated reasoning\" href=\"https://en.wikipedia.org/wiki/Automated_reasoning\">reasoning</a>,&nbsp;<a class=\"mw-redirect\" title=\"Knowledge representation\" href=\"https://en.wikipedia.org/wiki/Knowledge_representation\">knowledge representation</a>,&nbsp;<a title=\"Automated planning and scheduling\" href=\"https://en.wikipedia.org/wiki/Automated_planning_and_scheduling\">planning</a>,&nbsp;<a title=\"Machine learning\" href=\"https://en.wikipedia.org/wiki/Machine_learning\">learning</a>,&nbsp;<a title=\"Natural language processing\" href=\"https://en.wikipedia.org/wiki/Natural_language_processing\">natural language processing</a>, perception, and support for&nbsp;<a title=\"Robotics\" href=\"https://en.wikipedia.org/wiki/Robotics\">robotics</a>.<sup id=\"cite_ref-Problems_of_AI_16-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-Problems_of_AI-16\">[a]</a></sup>&nbsp;<a title=\"Artificial general intelligence\" href=\"https://en.wikipedia.org/wiki/Artificial_general_intelligence\">General intelligence</a>&mdash;the ability to complete any task performable by a human on an at least equal level&mdash;is among the field\'s long-term goals.<sup id=\"cite_ref-AGI_17-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-AGI-17\">[16]</a></sup></p>\r\n<p>To reach these goals, AI researchers have adapted and integrated a wide range of techniques, including&nbsp;<a title=\"State space search\" href=\"https://en.wikipedia.org/wiki/State_space_search\">search</a>&nbsp;and&nbsp;<a title=\"Mathematical optimization\" href=\"https://en.wikipedia.org/wiki/Mathematical_optimization\">mathematical optimization</a>,&nbsp;<a title=\"Logic\" href=\"https://en.wikipedia.org/wiki/Logic#Formal_logic\">formal logic</a>,&nbsp;<a class=\"mw-redirect\" title=\"Artificial neural network\" href=\"https://en.wikipedia.org/wiki/Artificial_neural_network\">artificial neural networks</a>, and methods based on&nbsp;<a title=\"Statistics\" href=\"https://en.wikipedia.org/wiki/Statistics\">statistics</a>,&nbsp;<a title=\"Operations research\" href=\"https://en.wikipedia.org/wiki/Operations_research\">operations research</a>, and&nbsp;<a title=\"Economics\" href=\"https://en.wikipedia.org/wiki/Economics\">economics</a>.<sup id=\"cite_ref-Tools_of_AI_18-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-Tools_of_AI-18\">[b]</a></sup>&nbsp;AI also draws upon&nbsp;<a title=\"Psychology\" href=\"https://en.wikipedia.org/wiki/Psychology\">psychology</a>,&nbsp;<a title=\"Linguistics\" href=\"https://en.wikipedia.org/wiki/Linguistics\">linguistics</a>,&nbsp;<a title=\"Philosophy of artificial intelligence\" href=\"https://en.wikipedia.org/wiki/Philosophy_of_artificial_intelligence\">philosophy</a>,&nbsp;<a title=\"Neuroscience\" href=\"https://en.wikipedia.org/wiki/Neuroscience\">neuroscience</a>, and other fields.<sup id=\"cite_ref-AI_influences_19-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Artificial_intelligence#cite_note-AI_influences-19\">[17]</a></sup></p>', 'posts\\July2024\\FbXJqKLafYWENia5y8dm.jpg', 'my-thought-on-ai', 'AI', 'AI', 'PUBLISHED', 1, '2024-07-08 03:25:51', '2024-07-08 03:25:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `projects`
--

CREATE TABLE `projects` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` text COLLATE utf8mb4_unicode_ci,
  `des` text COLLATE utf8mb4_unicode_ci,
  `client` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skill` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `projects`
--

INSERT INTO `projects` (`id`, `title`, `img`, `des`, `client`, `skill`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'Thai Nguyen Bus Station', 'projects\\July2024\\HVeetkXNnxjM9Moa40Fr.jfif', '<p>A local project I made in my freetime</p>\r\n<p>Frontend view:</p>\r\n<p><img src=\"http://resume.test/storage/projects/July2024/Ảnh chụp màn hình 2024-07-08 142937.jfif\" alt=\"\" width=\"100%\"></p>\r\n<p>Backend view:</p>\r\n<p><img src=\"http://resume.test/storage/projects/July2024/Ảnh chụp màn hình 2024-07-08 143556.jfif\" alt=\"\" width=\"100%\"></p>', 'Me', 'Frontend, Backend', '2024-07-08 00:35:00', '2024-07-08 01:26:10', 'thai-nguyen-bus-station'),
(2, 'Basic E-comercie', 'projects\\July2024\\JzcQ233MOgnyMoo2KUdz.jfif', '<p><video controls=\"controls\" width=\"100%\">\r\n              <source src=\"http://resume.test/storage/video/project.mp4\" type=\"video/mp4\">\r\n</video></p>', 'Me', 'Frontend, Backend', '2024-07-08 00:52:00', '2024-07-08 01:17:34', 'basic-e-comercie'),
(3, 'Portfolio', 'projects\\July2024\\5CbAKggY4tNwUr6h3Qsg.jfif', '<p>My first Portfolio :)</p>', 'Me', 'Frontend, Backend', '2024-07-08 02:38:42', '2024-07-08 02:38:42', 'portfolio'),
(4, 'ChatBot API', 'projects\\July2024\\xnmWix1wWyV9Lbks1T87.jfif', '<p>Working with ChatGPT:</p>\r\n<p><video controls=\"controls\" width=\"100%\">\r\n              <source src=\"http://resume.test/storage/video/project2.mp4\" type=\"video/mp4\">\r\n</video></p>', 'Me', 'Frontend, Backend', '2024-07-08 02:40:00', '2024-07-08 02:47:34', 'chatbot-api');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `resumes`
--

CREATE TABLE `resumes` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `des` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `resumes`
--

INSERT INTO `resumes` (`id`, `title`, `year`, `des`, `created_at`, `updated_at`, `type`) VALUES
(1, 'Laravel', '+1 years', 'Specializing in Laravel, I excel in developing dynamic web applications, integrating databases flawlessly, and optimizing backend solutions for scalability and efficiency. My focus ensures robust performance, delivering user-centric experiences across diverse projects.', '2024-07-06 23:53:00', '2024-07-07 00:20:21', 2),
(2, 'Bootstrap', '+1 years', 'With more than a year of Bootstrap expertise, I\'ve adeptly designed responsive web pages, crafted sleek user interfaces, and optimized mobile-first development. My skills ensure efficient, user-centric designs that seamlessly adapt across diverse platforms, enhancing overall user experiences.', '2024-07-06 23:54:00', '2024-07-07 00:21:19', 2),
(3, 'Alpine', '2 month', 'In just two months of Alpine.js experience, I\'ve adeptly crafted interactive web components, streamlined frontend functionality, and significantly enhanced user experience with minimal JavaScript. Moreover, I\'ve contributed to developing a basic E-commerce website, showcasing practical applications of Alpine.js capabilities in real-world scenarios.', '2024-07-06 23:55:00', '2024-07-07 00:21:56', 2),
(4, 'Livewire', '1 month', 'In my initial month of exploring Livewire, I\'ve rapidly grasped its real-time capabilities, effectively streamlining backend interactions and significantly enhancing application responsiveness. This newfound expertise has empowered me to create dynamic interfaces that not only elevate user engagement but also enhance overall functionality and user experience.', '2024-07-06 23:56:00', '2024-07-07 00:23:32', 2),
(5, 'ICTU', '2022 - Now', 'Since 2022, studying at ICTU has been transformative, enriching my knowledge base, expanding my skill set, and fostering valuable connections to diverse academic opportunities. This experience has deeply enhanced my educational journey, preparing me comprehensively for future challenges and successes.', '2024-07-07 00:03:00', '2024-07-07 00:24:05', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(2, 'user', 'Normal User', '2024-07-06 00:51:27', '2024-07-06 00:51:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `des` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`id`, `title`, `des`, `created_at`, `updated_at`, `icon`) VALUES
(1, 'Student', 'Currently, I am a student at ICTU, majoring in Information Technology. Feel free to reach out to me if you need further assistance.', '2024-07-06 05:41:32', '2024-07-06 05:41:32', 'ti-user'),
(2, 'Web Designer', 'I’m passionate about web design, creating beautiful layouts, selecting color schemes, and optimizing user experiences.', '2024-07-06 05:49:34', '2024-07-06 05:49:34', 'ti-pencil-alt'),
(3, 'Web Developer', 'Coding is like solving puzzles to create functional software and website. Debugging and endless possibilities keep me hooked!', '2024-07-06 05:52:00', '2024-07-06 05:58:11', 'ti-shift-left-alt'),
(4, 'Gamer', 'Gaming fuels my passion! Whether it\'s intense League of Legends matches, strategic Teamfight Tactics, or epic Clash of Clans raids, I\'m all in!', '2024-07-06 05:57:41', '2024-07-06 05:57:41', 'ti-game');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Hoang Minh', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Hoang Minh Website', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\July2024\\dkocRLnoHG7ZwAV4f3M4.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 6, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\July2024\\WU6EX9peg94cPqrr4Jwo.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Resume', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome back Minh', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\July2024\\C9qYp4NXiEjWSFUJhvMU.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\July2024\\YNuFol4WsmBUaKAYlBmC.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.facebook', 'Facebook', 'https://www.facebook.com/profile.php?id=100010285871208', NULL, 'text', 7, 'Site'),
(12, 'site.website', 'Website', 'http://resume.test/', NULL, 'text', 8, 'Site'),
(13, 'site.email', 'Email', 'hoangnhatminh10042004@gmail.com', NULL, 'text', 9, 'Site'),
(14, 'site.address', 'Address', 'Tan Lap - Thai Nguyen - Viet Nam', NULL, 'text', 10, 'Site'),
(15, 'site.telephone', 'Telephone', '0398435434', NULL, 'text', 11, 'Site'),
(16, 'site.background', 'Background', 'settings\\July2024\\2fxGS9mrObgYaiPiKetJ.jpg', NULL, 'image', 4, 'Site'),
(17, 'site.map', 'Google Map', 'https://maps.app.goo.gl/mEPDs5ARZtM1w1Tt6', NULL, 'text', 12, 'Site'),
(18, 'site.mapiframe', 'Google Map Frame', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2206.141179000671!2d105.82896560499101!3d21.57528700835147!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135273d024bd2b3%3A0xe80981201d7dd242!2zQuG6v24geGUgVGjDoWkgTmd1ecOqbg!5e0!3m2!1svi!2s!4v1720427500987!5m2!1svi!2s\" width=\"100%\" height=\"400px\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', NULL, 'text', 13, 'Site'),
(20, 'site.github', 'GitHub', 'https://github.com/Hoang-Nhat-Minh', NULL, 'text', 14, 'Site');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `skills`
--

CREATE TABLE `skills` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` int DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `skills`
--

INSERT INTO `skills` (`id`, `name`, `point`, `type`, `created_at`, `updated_at`) VALUES
(1, 'HTML', 8, 2, '2024-07-07 00:42:20', '2024-07-07 00:42:20'),
(2, 'CSS', 7, 2, '2024-07-07 00:42:29', '2024-07-07 00:42:29'),
(3, 'JS', 6, 2, '2024-07-07 00:42:41', '2024-07-07 00:42:41'),
(4, 'PHP', 8, 2, '2024-07-07 00:42:51', '2024-07-07 00:42:51'),
(5, 'Vietnamese', 9, 1, '2024-07-07 00:43:04', '2024-07-07 00:43:04'),
(6, 'English', 7, 1, '2024-07-07 00:43:16', '2024-07-07 00:43:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2024-07-06 00:51:27', '2024-07-06 00:51:27'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2024-07-06 00:51:27', '2024-07-06 00:51:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Minh Admin', 'admin@admin.com', 'users\\July2024\\T9kqr6hHz1bGjFZ3xFCZ.jpg', NULL, '$2y$10$2/w52s9x4mGiOqlYTHFzr.Ljf33t/xG47/CnRdKyKYhFcyqlidQuC', 'kW65fhW777l6cqs9mvkHoKrQ4oM4vMh12m1K9EDsvJpllcC8kMm8uXLqOY96', '{\"locale\":\"en\"}', '2024-07-06 00:51:27', '2024-07-06 23:35:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Chỉ mục cho bảng `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `infos`
--
ALTER TABLE `infos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Chỉ mục cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Chỉ mục cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `resumes`
--
ALTER TABLE `resumes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Chỉ mục cho bảng `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT cho bảng `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `infos`
--
ALTER TABLE `infos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `resumes`
--
ALTER TABLE `resumes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
