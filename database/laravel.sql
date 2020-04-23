-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2020-04-23 15:29:13
-- 服务器版本： 8.0.18
-- PHP 版本： 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `laravel`
--

-- --------------------------------------------------------

--
-- 表的结构 `lv_admin_menu`
--

DROP TABLE IF EXISTS `lv_admin_menu`;
CREATE TABLE `lv_admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lv_admin_menu`
--

INSERT INTO `lv_admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, '系统管理', 'fa-cogs', NULL, NULL, NULL, '2020-04-23 07:08:17'),
(3, 2, 3, '用户管理', 'fa-users', 'auth/users', NULL, NULL, '2020-04-23 07:08:33'),
(4, 2, 4, '角色管理', 'fa-user', 'auth/roles', NULL, NULL, '2020-04-23 07:08:41'),
(5, 2, 5, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, '2020-04-23 07:08:48'),
(6, 2, 6, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, '2020-04-23 07:08:56'),
(7, 2, 7, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2020-04-23 07:09:03');

-- --------------------------------------------------------

--
-- 表的结构 `lv_admin_operation_log`
--

DROP TABLE IF EXISTS `lv_admin_operation_log`;
CREATE TABLE `lv_admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lv_admin_operation_log`
--

INSERT INTO `lv_admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'adm', 'GET', '127.0.0.1', '[]', '2020-04-23 07:04:32', '2020-04-23 07:04:32'),
(2, 1, 'adm', 'GET', '127.0.0.1', '[]', '2020-04-23 07:04:39', '2020-04-23 07:04:39'),
(3, 1, 'adm', 'GET', '127.0.0.1', '[]', '2020-04-23 07:07:53', '2020-04-23 07:07:53'),
(4, 1, 'adm', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:07:55', '2020-04-23 07:07:55'),
(5, 1, 'adm/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:07:57', '2020-04-23 07:07:57'),
(6, 1, 'adm/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:07:57', '2020-04-23 07:07:57'),
(7, 1, 'adm/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:07:58', '2020-04-23 07:07:58'),
(8, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:07:59', '2020-04-23 07:07:59'),
(9, 1, 'adm/auth/logs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:07:59', '2020-04-23 07:07:59'),
(10, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:08:00', '2020-04-23 07:08:00'),
(11, 1, 'adm/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:08:04', '2020-04-23 07:08:04'),
(12, 1, 'adm/auth/menu/2', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-cogs\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"XKnLIIegnSg5NZcpMpPqaupbFvZbO5cy3S4jDUK6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/admin.mytest.com\\/adm\\/auth\\/menu\"}', '2020-04-23 07:08:17', '2020-04-23 07:08:17'),
(13, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:08:17', '2020-04-23 07:08:17'),
(14, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:08:19', '2020-04-23 07:08:19'),
(15, 1, 'adm/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:08:21', '2020-04-23 07:08:21'),
(16, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:08:24', '2020-04-23 07:08:24'),
(17, 1, 'adm/auth/menu/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:08:27', '2020-04-23 07:08:27'),
(18, 1, 'adm/auth/menu/3', 'PUT', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"XKnLIIegnSg5NZcpMpPqaupbFvZbO5cy3S4jDUK6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/admin.mytest.com\\/adm\\/auth\\/menu\"}', '2020-04-23 07:08:33', '2020-04-23 07:08:33'),
(19, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:08:33', '2020-04-23 07:08:33'),
(20, 1, 'adm/auth/menu/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:08:35', '2020-04-23 07:08:35'),
(21, 1, 'adm/auth/menu/4', 'PUT', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"XKnLIIegnSg5NZcpMpPqaupbFvZbO5cy3S4jDUK6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/admin.mytest.com\\/adm\\/auth\\/menu\"}', '2020-04-23 07:08:41', '2020-04-23 07:08:41'),
(22, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:08:41', '2020-04-23 07:08:41'),
(23, 1, 'adm/auth/menu/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:08:43', '2020-04-23 07:08:43'),
(24, 1, 'adm/auth/menu/5', 'PUT', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"XKnLIIegnSg5NZcpMpPqaupbFvZbO5cy3S4jDUK6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/admin.mytest.com\\/adm\\/auth\\/menu\"}', '2020-04-23 07:08:48', '2020-04-23 07:08:48'),
(25, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:08:49', '2020-04-23 07:08:49'),
(26, 1, 'adm/auth/menu/6/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:08:50', '2020-04-23 07:08:50'),
(27, 1, 'adm/auth/menu/6', 'PUT', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"XKnLIIegnSg5NZcpMpPqaupbFvZbO5cy3S4jDUK6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/admin.mytest.com\\/adm\\/auth\\/menu\"}', '2020-04-23 07:08:55', '2020-04-23 07:08:55'),
(28, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:08:56', '2020-04-23 07:08:56'),
(29, 1, 'adm/auth/menu/7/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-23 07:08:57', '2020-04-23 07:08:57'),
(30, 1, 'adm/auth/menu/7', 'PUT', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"XKnLIIegnSg5NZcpMpPqaupbFvZbO5cy3S4jDUK6\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/admin.mytest.com\\/adm\\/auth\\/menu\"}', '2020-04-23 07:09:03', '2020-04-23 07:09:03'),
(31, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:09:03', '2020-04-23 07:09:03'),
(32, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:09:05', '2020-04-23 07:09:05'),
(33, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:09:07', '2020-04-23 07:09:07'),
(34, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:13:00', '2020-04-23 07:13:00'),
(35, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:17:23', '2020-04-23 07:17:23'),
(36, 1, 'adm/auth/menu', 'GET', '127.0.0.1', '[]', '2020-04-23 07:25:27', '2020-04-23 07:25:27');

-- --------------------------------------------------------

--
-- 表的结构 `lv_admin_permissions`
--

DROP TABLE IF EXISTS `lv_admin_permissions`;
CREATE TABLE `lv_admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lv_admin_permissions`
--

INSERT INTO `lv_admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `lv_admin_roles`
--

DROP TABLE IF EXISTS `lv_admin_roles`;
CREATE TABLE `lv_admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lv_admin_roles`
--

INSERT INTO `lv_admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2020-04-23 07:04:24', '2020-04-23 07:04:24');

-- --------------------------------------------------------

--
-- 表的结构 `lv_admin_role_menu`
--

DROP TABLE IF EXISTS `lv_admin_role_menu`;
CREATE TABLE `lv_admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lv_admin_role_menu`
--

INSERT INTO `lv_admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `lv_admin_role_permissions`
--

DROP TABLE IF EXISTS `lv_admin_role_permissions`;
CREATE TABLE `lv_admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lv_admin_role_permissions`
--

INSERT INTO `lv_admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `lv_admin_role_users`
--

DROP TABLE IF EXISTS `lv_admin_role_users`;
CREATE TABLE `lv_admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lv_admin_role_users`
--

INSERT INTO `lv_admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `lv_admin_users`
--

DROP TABLE IF EXISTS `lv_admin_users`;
CREATE TABLE `lv_admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lv_admin_users`
--

INSERT INTO `lv_admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$C3bcA/OyCtlcyUsxsaz/vO/lsFjiTcYD9wtUTb8X7BBrRYC5kcXMS', 'Administrator', NULL, NULL, '2020-04-23 07:04:24', '2020-04-23 07:04:24');

-- --------------------------------------------------------

--
-- 表的结构 `lv_admin_user_permissions`
--

DROP TABLE IF EXISTS `lv_admin_user_permissions`;
CREATE TABLE `lv_admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `lv_category`
--

DROP TABLE IF EXISTS `lv_category`;
CREATE TABLE `lv_category` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `py` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort_by` int(3) NOT NULL DEFAULT '999',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `lv_migrations`
--

DROP TABLE IF EXISTS `lv_migrations`;
CREATE TABLE `lv_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `lv_migrations`
--

INSERT INTO `lv_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1);

-- --------------------------------------------------------

--
-- 表的结构 `lv_password_resets`
--

DROP TABLE IF EXISTS `lv_password_resets`;
CREATE TABLE `lv_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `lv_users`
--

DROP TABLE IF EXISTS `lv_users`;
CREATE TABLE `lv_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `lv_admin_menu`
--
ALTER TABLE `lv_admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lv_admin_operation_log`
--
ALTER TABLE `lv_admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lv_admin_operation_log_user_id_index` (`user_id`);

--
-- 表的索引 `lv_admin_permissions`
--
ALTER TABLE `lv_admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lv_admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `lv_admin_permissions_slug_unique` (`slug`);

--
-- 表的索引 `lv_admin_roles`
--
ALTER TABLE `lv_admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lv_admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `lv_admin_roles_slug_unique` (`slug`);

--
-- 表的索引 `lv_admin_role_menu`
--
ALTER TABLE `lv_admin_role_menu`
  ADD KEY `lv_admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- 表的索引 `lv_admin_role_permissions`
--
ALTER TABLE `lv_admin_role_permissions`
  ADD KEY `lv_admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- 表的索引 `lv_admin_role_users`
--
ALTER TABLE `lv_admin_role_users`
  ADD KEY `lv_admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- 表的索引 `lv_admin_users`
--
ALTER TABLE `lv_admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lv_admin_users_username_unique` (`username`);

--
-- 表的索引 `lv_admin_user_permissions`
--
ALTER TABLE `lv_admin_user_permissions`
  ADD KEY `lv_admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- 表的索引 `lv_category`
--
ALTER TABLE `lv_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `py` (`py`);

--
-- 表的索引 `lv_migrations`
--
ALTER TABLE `lv_migrations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `lv_password_resets`
--
ALTER TABLE `lv_password_resets`
  ADD KEY `lv_password_resets_email_index` (`email`);

--
-- 表的索引 `lv_users`
--
ALTER TABLE `lv_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lv_users_email_unique` (`email`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `lv_admin_menu`
--
ALTER TABLE `lv_admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `lv_admin_operation_log`
--
ALTER TABLE `lv_admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- 使用表AUTO_INCREMENT `lv_admin_permissions`
--
ALTER TABLE `lv_admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `lv_admin_roles`
--
ALTER TABLE `lv_admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `lv_admin_users`
--
ALTER TABLE `lv_admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `lv_category`
--
ALTER TABLE `lv_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `lv_migrations`
--
ALTER TABLE `lv_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `lv_users`
--
ALTER TABLE `lv_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
