-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 24 2021 г., 18:29
-- Версия сервера: 5.7.33
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `winter`
--

-- --------------------------------------------------------

--
-- Структура таблицы `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '2021-06-23 10:12:27', '2021-06-23 10:12:27'),
(2, 1, '127.0.0.1', '2021-07-09 18:38:24', '2021-07-09 18:38:24'),
(3, 1, '127.0.0.1', '2021-07-19 19:30:36', '2021-07-19 19:30:36'),
(4, 1, '127.0.0.1', '2021-08-24 05:09:37', '2021-08-24 05:09:37');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
(1, 'Yuri', 'Rastvorov', 'master', 'rastvorov@gmail.com', '$2y$10$UrlyUJ6sHlNsXwzTejNWPe9D9Di9.5I6mzphDHXj.BNLfQnvINRuK', NULL, '$2y$10$cYT9Yg/E39mCik60qF/r.uo1fvpb.7aHoIEvaorM6Y0p3ljBbj2z6', NULL, '', 1, 2, NULL, '2021-08-24 05:09:37', '2021-06-23 10:10:42', '2021-08-24 05:09:37', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', '2021-06-23 10:10:42', '2021-06-23 10:10:42', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_preferences`
--

INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 1, 'backend', 'backend', 'preferences', '{\"locale\":\"ru\",\"fallback_locale\":\"en\",\"timezone\":\"Europe\\/Moscow\",\"editor_font_size\":\"16\",\"editor_word_wrap\":\"fluid\",\"editor_code_folding\":\"manual\",\"editor_tab_size\":\"2\",\"editor_theme\":\"twilight\",\"editor_show_invisibles\":\"0\",\"editor_highlight_active_line\":\"1\",\"editor_use_hard_tabs\":\"0\",\"editor_show_gutter\":\"1\",\"editor_auto_closing\":\"0\",\"editor_autocompletion\":\"manual\",\"editor_enable_snippets\":\"0\",\"editor_display_indent_guides\":\"0\",\"editor_show_print_margin\":\"0\",\"user_id\":1}');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_roles`
--

CREATE TABLE `backend_user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_roles`
--

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2021-06-23 10:10:42', '2021-06-23 10:10:42'),
(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2021-06-23 10:10:42', '2021-06-23 10:10:42');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_templates`
--

CREATE TABLE `cms_theme_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pivot_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `deferred_bindings`
--

INSERT INTO `deferred_bindings` (`id`, `master_type`, `master_field`, `slave_type`, `slave_id`, `pivot_data`, `session_key`, `is_bind`, `created_at`, `updated_at`) VALUES
(1, 'Winter\\Blog\\Models\\PostImport', 'import_file', 'System\\Models\\File', '1', NULL, 'TJVR2lezrI7o7kBBNKCJikStslKAOd0dyS5ODVjX', 1, '2021-08-24 12:06:37', '2021-08-24 12:06:37');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
(2, '2013_10_01_000002_Db_System_Files', 1),
(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
(5, '2013_10_01_000005_Db_System_Settings', 1),
(6, '2013_10_01_000006_Db_System_Parameters', 1),
(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
(10, '2014_10_01_000010_Db_Jobs', 1),
(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
(13, '2014_10_01_000013_Db_System_Sessions', 1),
(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
(16, '2015_10_01_000016_Db_Cache', 1),
(17, '2015_10_01_000017_Db_System_Revisions', 1),
(18, '2015_10_01_000018_Db_FailedJobs', 1),
(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
(25, '2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field', 1),
(26, '2021_10_01_000025_Db_Add_Pivot_Data_To_Deferred_Bindings', 1),
(27, '2013_10_01_000001_Db_Backend_Users', 2),
(28, '2013_10_01_000002_Db_Backend_User_Groups', 2),
(29, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
(30, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
(31, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
(32, '2014_10_01_000006_Db_Backend_Access_Log', 2),
(33, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
(34, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
(35, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
(36, '2017_10_01_000010_Db_Backend_User_Roles', 2),
(37, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
(38, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
(39, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
(40, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
(41, '2018_11_01_000001_Db_Cms_Theme_Templates', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_files`
--

INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, '61250afd6fe05130559388.csv', 'posts.csv', 34724, 'text/plain', NULL, NULL, NULL, NULL, NULL, 0, 1, '2021-08-24 12:06:37', '2021-08-24 12:06:37'),
(2, '61250b6a0f2e1433412989.jpg', 'b2.jpg', 295638, 'image/jpeg', NULL, NULL, 'featured_images', '7', 'Winter\\Blog\\Models\\Post', 1, 2, '2021-08-24 12:08:26', '2021-08-24 12:09:02'),
(3, '61250b6a655e2596241697.jpg', 'b3.jpg', 310629, 'image/jpeg', NULL, NULL, 'featured_images', '7', 'Winter\\Blog\\Models\\Post', 1, 3, '2021-08-24 12:08:26', '2021-08-24 12:09:02'),
(4, '61250b780170d220135179.jpg', 'b1.jpg', 367248, 'image/jpeg', NULL, NULL, 'featured_images', '7', 'Winter\\Blog\\Models\\Post', 1, 1, '2021-08-24 12:08:40', '2021-08-24 12:09:02'),
(5, '61250fa0ba3bb082872914.jpg', 'пямятка.jpg', 126006, 'image/jpeg', NULL, NULL, 'logo', '2', 'Backend\\Models\\BrandSetting', 1, 5, '2021-08-24 12:26:24', '2021-08-24 12:26:29');

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2021-06-23 10:10:42', '2021-06-23 10:10:42'),
(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2021-06-23 10:10:42', '2021-06-23 10:10:42');

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_partials`
--

CREATE TABLE `system_mail_partials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '0'),
(2, 'system', 'update', 'retry', '1629878979'),
(3, 'cms', 'theme', 'active', '\"winter\"');

-- --------------------------------------------------------

--
-- Структура таблицы `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'Winter.Demo', 'comment', '1.0.1', 'First version of Demo', '2021-06-23 10:10:42'),
(2, 'Winter.Blog', 'script', '1.0.1', 'v1.0.1/create_posts_table.php', '2021-08-24 05:11:09'),
(3, 'Winter.Blog', 'script', '1.0.1', 'v1.0.1/create_categories_table.php', '2021-08-24 05:11:09'),
(4, 'Winter.Blog', 'script', '1.0.1', 'v1.0.1/seed_all_tables.php', '2021-08-24 05:11:10'),
(5, 'Winter.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2021-08-24 05:11:10'),
(6, 'Winter.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2021-08-24 05:11:10'),
(7, 'Winter.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2021-08-24 05:11:10'),
(8, 'Winter.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2021-08-24 05:11:10'),
(9, 'Winter.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2021-08-24 05:11:10'),
(10, 'Winter.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2021-08-24 05:11:10'),
(11, 'Winter.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2021-08-24 05:11:10'),
(12, 'Winter.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2021-08-24 05:11:10'),
(13, 'Winter.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2021-08-24 05:11:10'),
(14, 'Winter.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2021-08-24 05:11:10'),
(15, 'Winter.Blog', 'comment', '1.0.11', 'Deprecate \"idParam\" component property in favour of \"slug\" property.', '2021-08-24 05:11:10'),
(16, 'Winter.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2021-08-24 05:11:10'),
(17, 'Winter.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2021-08-24 05:11:10'),
(18, 'Winter.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2021-08-24 05:11:10'),
(19, 'Winter.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2021-08-24 05:11:10'),
(20, 'Winter.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2021-08-24 05:11:10'),
(21, 'Winter.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2021-08-24 05:11:10'),
(22, 'Winter.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2021-08-24 05:11:10'),
(23, 'Winter.Blog', 'script', '1.2.0', 'v1.2.0/categories_add_nested_fields.php', '2021-08-24 05:11:10'),
(24, 'Winter.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2021-08-24 05:11:10'),
(25, 'Winter.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2021-08-24 05:11:10'),
(26, 'Winter.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2021-08-24 05:11:10'),
(27, 'Winter.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2021-08-24 05:11:10'),
(28, 'Winter.Blog', 'script', '1.2.4', 'v1.2.4/update_timestamp_nullable.php', '2021-08-24 05:11:10'),
(29, 'Winter.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2021-08-24 05:11:10'),
(30, 'Winter.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2021-08-24 05:11:10'),
(31, 'Winter.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2021-08-24 05:11:10'),
(32, 'Winter.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2021-08-24 05:11:10'),
(33, 'Winter.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2021-08-24 05:11:10'),
(34, 'Winter.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2021-08-24 05:11:10'),
(35, 'Winter.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2021-08-24 05:11:10'),
(36, 'Winter.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2021-08-24 05:11:10'),
(37, 'Winter.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2021-08-24 05:11:10'),
(38, 'Winter.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2021-08-24 05:11:10'),
(39, 'Winter.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2021-08-24 05:11:10'),
(40, 'Winter.Blog', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2021-08-24 05:11:10'),
(41, 'Winter.Blog', 'comment', '1.2.16', 'Added `nextPost` and `previousPost` to the blog post component.', '2021-08-24 05:11:10'),
(42, 'Winter.Blog', 'comment', '1.2.17', 'Improved the next and previous logic to sort by the published date.', '2021-08-24 05:11:10'),
(43, 'Winter.Blog', 'comment', '1.2.18', 'Minor change to internals.', '2021-08-24 05:11:10'),
(44, 'Winter.Blog', 'comment', '1.2.19', 'Improved support for Build 420+', '2021-08-24 05:11:10'),
(45, 'Winter.Blog', 'script', '1.3.0', 'v1.3.0/posts_add_metadata.php', '2021-08-24 05:11:10'),
(46, 'Winter.Blog', 'comment', '1.3.0', 'Added metadata column for plugins to store data in', '2021-08-24 05:11:10'),
(47, 'Winter.Blog', 'comment', '1.3.1', 'Fixed metadata column not being jsonable', '2021-08-24 05:11:10'),
(48, 'Winter.Blog', 'comment', '1.3.2', 'Allow custom slug name for components, add 404 handling for missing blog posts, allow exporting of blog images.', '2021-08-24 05:11:10'),
(49, 'Winter.Blog', 'comment', '1.3.3', 'Fixed \'excluded categories\' filter from being run when value is empty.', '2021-08-24 05:11:10'),
(50, 'Winter.Blog', 'comment', '1.3.4', 'Allow post author to be specified. Improved translations.', '2021-08-24 05:11:10'),
(51, 'Winter.Blog', 'comment', '1.3.5', 'Fixed missing user info from breaking initial seeder in migrations. Fixed a PostgreSQL issue with blog exports.', '2021-08-24 05:11:10'),
(52, 'Winter.Blog', 'comment', '1.3.6', 'Improved French translations.', '2021-08-24 05:11:10'),
(53, 'Winter.Blog', 'comment', '1.4.0', 'Stability improvements. Rollback custom slug names for components', '2021-08-24 05:11:10'),
(54, 'Winter.Blog', 'comment', '1.4.1', 'Fixes potential security issue with unsafe Markdown. Allow blog bylines to be translated.', '2021-08-24 05:11:10'),
(55, 'Winter.Blog', 'comment', '1.4.2', 'Fix 404 redirects for missing blog posts. Assign current category to the listed posts when using the Posts component on a page with the category parameter available.', '2021-08-24 05:11:10'),
(56, 'Winter.Blog', 'comment', '1.4.3', 'Fixes incompatibility with locale switching when plugin is used in conjunction with the Translate plugin. Fixes undefined category error.', '2021-08-24 05:11:10'),
(57, 'Winter.Blog', 'comment', '1.4.4', 'Rollback translated bylines, please move or override the default component markup instead.', '2021-08-24 05:11:10'),
(58, 'Winter.Blog', 'comment', '1.5.0', 'Implement support for October CMS v2.0', '2021-08-24 05:11:10'),
(59, 'Winter.Blog', 'script', '2.0.0', 'v2.0.0/rename_tables.php', '2021-08-24 05:11:10'),
(60, 'Winter.Blog', 'comment', '2.0.0', 'Rebrand to Winter.Blog', '2021-08-24 05:11:10'),
(61, 'Winter.Translate', 'script', '1.0.1', 'v1.0.1/create_messages_table.php', '2021-08-24 05:12:25'),
(62, 'Winter.Translate', 'script', '1.0.1', 'v1.0.1/create_attributes_table.php', '2021-08-24 05:12:25'),
(63, 'Winter.Translate', 'script', '1.0.1', 'v1.0.1/create_locales_table.php', '2021-08-24 05:12:26'),
(64, 'Winter.Translate', 'comment', '1.0.1', 'First version of Translate', '2021-08-24 05:12:26'),
(65, 'Winter.Translate', 'comment', '1.0.2', 'Languages and Messages can now be deleted.', '2021-08-24 05:12:26'),
(66, 'Winter.Translate', 'comment', '1.0.3', 'Minor updates for latest Winter CMS release.', '2021-08-24 05:12:26'),
(67, 'Winter.Translate', 'comment', '1.0.4', 'Locale cache will clear when updating a language.', '2021-08-24 05:12:26'),
(68, 'Winter.Translate', 'comment', '1.0.5', 'Add Spanish language and fix plugin config.', '2021-08-24 05:12:26'),
(69, 'Winter.Translate', 'comment', '1.0.6', 'Minor improvements to the code.', '2021-08-24 05:12:26'),
(70, 'Winter.Translate', 'comment', '1.0.7', 'Fixes major bug where translations are skipped entirely!', '2021-08-24 05:12:26'),
(71, 'Winter.Translate', 'comment', '1.0.8', 'Minor bug fixes.', '2021-08-24 05:12:26'),
(72, 'Winter.Translate', 'comment', '1.0.9', 'Fixes an issue where newly created models lose their translated values.', '2021-08-24 05:12:26'),
(73, 'Winter.Translate', 'comment', '1.0.10', 'Minor fix for latest build.', '2021-08-24 05:12:26'),
(74, 'Winter.Translate', 'comment', '1.0.11', 'Fix multilingual rich editor when used in stretch mode.', '2021-08-24 05:12:26'),
(75, 'Winter.Translate', 'comment', '1.1.0', 'Introduce compatibility with Winter.Pages plugin.', '2021-08-24 05:12:26'),
(76, 'Winter.Translate', 'comment', '1.1.1', 'Minor UI fix to the language picker.', '2021-08-24 05:12:26'),
(77, 'Winter.Translate', 'comment', '1.1.2', 'Add support for translating Static Content files.', '2021-08-24 05:12:26'),
(78, 'Winter.Translate', 'comment', '1.1.3', 'Improved support for the multilingual rich editor.', '2021-08-24 05:12:26'),
(79, 'Winter.Translate', 'comment', '1.1.4', 'Adds new multilingual markdown editor.', '2021-08-24 05:12:26'),
(80, 'Winter.Translate', 'comment', '1.1.5', 'Minor update to the multilingual control API.', '2021-08-24 05:12:26'),
(81, 'Winter.Translate', 'comment', '1.1.6', 'Minor improvements in the message editor.', '2021-08-24 05:12:26'),
(82, 'Winter.Translate', 'comment', '1.1.7', 'Fixes bug not showing content when first loading multilingual textarea controls.', '2021-08-24 05:12:26'),
(83, 'Winter.Translate', 'comment', '1.2.0', 'CMS pages now support translating the URL.', '2021-08-24 05:12:26'),
(84, 'Winter.Translate', 'comment', '1.2.1', 'Minor update in the rich editor and code editor language control position.', '2021-08-24 05:12:26'),
(85, 'Winter.Translate', 'comment', '1.2.2', 'Static Pages now support translating the URL.', '2021-08-24 05:12:26'),
(86, 'Winter.Translate', 'comment', '1.2.3', 'Fixes Rich Editor when inserting a page link.', '2021-08-24 05:12:26'),
(87, 'Winter.Translate', 'script', '1.2.4', 'v1.2.4/create_indexes_table.php', '2021-08-24 05:12:26'),
(88, 'Winter.Translate', 'comment', '1.2.4', 'Translatable attributes can now be declared as indexes.', '2021-08-24 05:12:26'),
(89, 'Winter.Translate', 'comment', '1.2.5', 'Adds new multilingual repeater form widget.', '2021-08-24 05:12:26'),
(90, 'Winter.Translate', 'comment', '1.2.6', 'Fixes repeater usage with static pages plugin.', '2021-08-24 05:12:26'),
(91, 'Winter.Translate', 'comment', '1.2.7', 'Fixes placeholder usage with static pages plugin.', '2021-08-24 05:12:26'),
(92, 'Winter.Translate', 'comment', '1.2.8', 'Improvements to code for latest Winter CMS build compatibility.', '2021-08-24 05:12:26'),
(93, 'Winter.Translate', 'comment', '1.2.9', 'Fixes context for translated strings when used with Static Pages.', '2021-08-24 05:12:26'),
(94, 'Winter.Translate', 'comment', '1.2.10', 'Minor UI fix to the multilingual repeater.', '2021-08-24 05:12:26'),
(95, 'Winter.Translate', 'comment', '1.2.11', 'Fixes translation not working with partials loaded via AJAX.', '2021-08-24 05:12:26'),
(96, 'Winter.Translate', 'comment', '1.2.12', 'Add support for translating the new grouped repeater feature.', '2021-08-24 05:12:26'),
(97, 'Winter.Translate', 'comment', '1.3.0', 'Added search to the translate messages page.', '2021-08-24 05:12:26'),
(98, 'Winter.Translate', 'script', '1.3.1', 'v1.3.1/add_sort_order.php', '2021-08-24 05:12:26'),
(99, 'Winter.Translate', 'script', '1.3.1', 'v1.3.1/seed_all_tables.php', '2021-08-24 05:12:26'),
(100, 'Winter.Translate', 'comment', '1.3.1', 'Added reordering to languages', '2021-08-24 05:12:26'),
(101, 'Winter.Translate', 'comment', '1.3.2', 'Improved compatibility with Winter.Pages, added ability to scan Mail Messages for translatable variables.', '2021-08-24 05:12:26'),
(102, 'Winter.Translate', 'comment', '1.3.3', 'Fix to the locale picker session handling in Build 420 onwards.', '2021-08-24 05:12:26'),
(103, 'Winter.Translate', 'comment', '1.3.4', 'Add alternate hreflang elements and adds prefixDefaultLocale setting.', '2021-08-24 05:12:26'),
(104, 'Winter.Translate', 'comment', '1.3.5', 'Fix MLRepeater bug when switching locales.', '2021-08-24 05:12:26'),
(105, 'Winter.Translate', 'comment', '1.3.6', 'Fix Middleware to use the prefixDefaultLocale setting introduced in 1.3.4', '2021-08-24 05:12:26'),
(106, 'Winter.Translate', 'comment', '1.3.7', 'Fix config reference in LocaleMiddleware', '2021-08-24 05:12:26'),
(107, 'Winter.Translate', 'comment', '1.3.8', 'Keep query string when switching locales', '2021-08-24 05:12:26'),
(108, 'Winter.Translate', 'comment', '1.4.0', 'Add importer and exporter for messages', '2021-08-24 05:12:26'),
(109, 'Winter.Translate', 'comment', '1.4.1', 'Updated Hungarian translation. Added Arabic translation. Fixed issue where default texts are overwritten by import. Fixed issue where the language switcher for repeater fields would overlap with the first repeater row.', '2021-08-24 05:12:26'),
(110, 'Winter.Translate', 'comment', '1.4.2', 'Add multilingual MediaFinder', '2021-08-24 05:12:26'),
(111, 'Winter.Translate', 'comment', '1.4.3', '!!! Please update Winter CMS to Build 444 before updating this plugin. Added ability to translate CMS Pages fields (e.g. title, description, meta-title, meta-description)', '2021-08-24 05:12:26'),
(112, 'Winter.Translate', 'comment', '1.4.4', 'Minor improvements to compatibility with Laravel framework.', '2021-08-24 05:12:26'),
(113, 'Winter.Translate', 'comment', '1.4.5', 'Fixed issue when using the language switcher', '2021-08-24 05:12:26'),
(114, 'Winter.Translate', 'comment', '1.5.0', 'Compatibility fix with Build 451', '2021-08-24 05:12:26'),
(115, 'Winter.Translate', 'comment', '1.6.0', 'Make File Upload widget properties translatable. Merge Repeater core changes into MLRepeater widget. Add getter method to retrieve original translate data.', '2021-08-24 05:12:26'),
(116, 'Winter.Translate', 'comment', '1.6.1', 'Add ability for models to provide translated computed data, add option to disable locale prefix routing', '2021-08-24 05:12:26'),
(117, 'Winter.Translate', 'comment', '1.6.2', 'Implement localeUrl filter, add per-locale theme configuration support', '2021-08-24 05:12:26'),
(118, 'Winter.Translate', 'comment', '1.6.3', 'Add eager loading for translations, restore support for accessors & mutators', '2021-08-24 05:12:26'),
(119, 'Winter.Translate', 'comment', '1.6.4', 'Fixes PHP 7.4 compatibility', '2021-08-24 05:12:26'),
(120, 'Winter.Translate', 'comment', '1.6.5', 'Fixes compatibility issue when other plugins use a custom model morph map', '2021-08-24 05:12:26'),
(121, 'Winter.Translate', 'script', '1.6.6', 'v1.6.6/migrate_morphed_attributes.php', '2021-08-24 05:12:26'),
(122, 'Winter.Translate', 'comment', '1.6.6', 'Introduce migration to patch existing translations using morph map', '2021-08-24 05:12:26'),
(123, 'Winter.Translate', 'script', '1.6.7', 'v1.6.7/migrate_morphed_indexes.php', '2021-08-24 05:12:26'),
(124, 'Winter.Translate', 'comment', '1.6.7', 'Introduce migration to patch existing indexes using morph map', '2021-08-24 05:12:26'),
(125, 'Winter.Translate', 'comment', '1.6.8', 'Add support for transOrderBy; Add translation support for ThemeData; Update russian localization.', '2021-08-24 05:12:26'),
(126, 'Winter.Translate', 'comment', '1.6.9', 'Clear Static Page menu cache after saving the model; CSS fix for Text/Textarea input fields language selector.', '2021-08-24 05:12:26'),
(127, 'Winter.Translate', 'script', '1.6.10', 'v1.6.10/update_messages_table.php', '2021-08-24 05:12:26'),
(128, 'Winter.Translate', 'comment', '1.6.10', 'Add option to purge deleted messages when scanning messages', '2021-08-24 05:12:26'),
(129, 'Winter.Translate', 'comment', '1.6.10', 'Add Scan error column on Messages page', '2021-08-24 05:12:26'),
(130, 'Winter.Translate', 'comment', '1.6.10', 'Fix translations that were lost when clicking locale twice while holding ctrl key', '2021-08-24 05:12:26'),
(131, 'Winter.Translate', 'comment', '1.6.10', 'Fix error with nested fields default locale value', '2021-08-24 05:12:26'),
(132, 'Winter.Translate', 'comment', '1.6.10', 'Escape Message translate params value', '2021-08-24 05:12:26'),
(133, 'Winter.Translate', 'comment', '1.7.0', '!!! Breaking change for the Message::trans() method (params are now escaped)', '2021-08-24 05:12:26'),
(134, 'Winter.Translate', 'comment', '1.7.0', 'fix message translation documentation', '2021-08-24 05:12:26'),
(135, 'Winter.Translate', 'comment', '1.7.0', 'fix string translation key for scan errors column header', '2021-08-24 05:12:26'),
(136, 'Winter.Translate', 'comment', '1.7.1', 'Fix YAML issue with previous tag/release.', '2021-08-24 05:12:26'),
(137, 'Winter.Translate', 'comment', '1.7.2', 'Fix regex when \"|_\" filter is followed by another filter', '2021-08-24 05:12:26'),
(138, 'Winter.Translate', 'comment', '1.7.2', 'Try locale without country before returning default translation', '2021-08-24 05:12:26'),
(139, 'Winter.Translate', 'comment', '1.7.2', 'Allow exporting default locale', '2021-08-24 05:12:26'),
(140, 'Winter.Translate', 'comment', '1.7.2', 'Fire \'winter.translate.themeScanner.afterScan\' event in the theme scanner for extendability', '2021-08-24 05:12:26'),
(141, 'Winter.Translate', 'comment', '1.7.3', 'Make plugin ready for Laravel 6 update', '2021-08-24 05:12:26'),
(142, 'Winter.Translate', 'comment', '1.7.3', 'Add support for translating Winter.Pages MenuItem properties (requires Winter.Pages v1.3.6)', '2021-08-24 05:12:26'),
(143, 'Winter.Translate', 'comment', '1.7.3', 'Restore multilingual button position for textarea', '2021-08-24 05:12:26'),
(144, 'Winter.Translate', 'comment', '1.7.3', 'Fix translatableAttributes', '2021-08-24 05:12:26'),
(145, 'Winter.Translate', 'comment', '1.7.4', 'Faster version of transWhere', '2021-08-24 05:12:26'),
(146, 'Winter.Translate', 'comment', '1.7.4', 'Mail templates/views can now be localized', '2021-08-24 05:12:26'),
(147, 'Winter.Translate', 'comment', '1.7.4', 'Fix messages table layout on mobile', '2021-08-24 05:12:26'),
(148, 'Winter.Translate', 'comment', '1.7.4', 'Fix scopeTransOrderBy duplicates', '2021-08-24 05:12:26'),
(149, 'Winter.Translate', 'comment', '1.7.4', 'Polish localization updates', '2021-08-24 05:12:26'),
(150, 'Winter.Translate', 'comment', '1.7.4', 'Turkish localization updates', '2021-08-24 05:12:26'),
(151, 'Winter.Translate', 'comment', '1.7.4', 'Add Greek language localization', '2021-08-24 05:12:26'),
(152, 'Winter.Translate', 'comment', '1.8.0', 'Adds initial support for October v2.0', '2021-08-24 05:12:26'),
(153, 'Winter.Translate', 'comment', '1.8.1', 'Minor bugfix', '2021-08-24 05:12:26'),
(154, 'Winter.Translate', 'comment', '1.8.2', 'Fixes translated file models and theme data for v2.0. The parent model must implement translatable behavior for their related file models to be translated.', '2021-08-24 05:12:26'),
(155, 'Winter.Translate', 'script', '2.0.0', 'v2.0.0/rename_tables.php', '2021-08-24 05:12:26'),
(156, 'Winter.Translate', 'comment', '2.0.0', 'Rebrand to Winter.Translate', '2021-08-24 05:12:26'),
(157, 'Winter.Translate', 'comment', '2.0.0', 'Fix location for dropdown-to in css file', '2021-08-24 05:12:26'),
(158, 'Winter.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2021-08-24 05:12:54'),
(159, 'Winter.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2021-08-24 05:12:54'),
(160, 'Winter.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2021-08-24 05:12:54'),
(161, 'Winter.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2021-08-24 05:12:54'),
(162, 'Winter.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2021-08-24 05:12:54'),
(163, 'Winter.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2021-08-24 05:12:54'),
(164, 'Winter.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2021-08-24 05:12:54'),
(165, 'Winter.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2021-08-24 05:12:54'),
(166, 'Winter.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2021-08-24 05:12:54'),
(167, 'Winter.Builder', 'comment', '1.0.10', 'Minor styling update.', '2021-08-24 05:12:54'),
(168, 'Winter.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2021-08-24 05:12:54'),
(169, 'Winter.Builder', 'comment', '1.0.12', 'Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.', '2021-08-24 05:12:54'),
(170, 'Winter.Builder', 'comment', '1.0.13', 'Minor styling fix on the database editor.', '2021-08-24 05:12:54'),
(171, 'Winter.Builder', 'comment', '1.0.14', 'Added support for published_at timestamp field', '2021-08-24 05:12:54'),
(172, 'Winter.Builder', 'comment', '1.0.15', 'Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.', '2021-08-24 05:12:54'),
(173, 'Winter.Builder', 'comment', '1.0.16', 'Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.', '2021-08-24 05:12:54'),
(174, 'Winter.Builder', 'comment', '1.0.17', 'Added support Trigger attribute support for RecordFinder and Repeater form widgets.', '2021-08-24 05:12:54'),
(175, 'Winter.Builder', 'comment', '1.0.18', 'Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.', '2021-08-24 05:12:54'),
(176, 'Winter.Builder', 'comment', '1.0.19', 'Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.', '2021-08-24 05:12:54'),
(177, 'Winter.Builder', 'comment', '1.0.20', 'Fixes a bug where form the builder could trigger the \"current.hasAttribute is not a function\" error.', '2021-08-24 05:12:54'),
(178, 'Winter.Builder', 'comment', '1.0.21', 'Back-end navigation sort order updated.', '2021-08-24 05:12:54'),
(179, 'Winter.Builder', 'comment', '1.0.22', 'Added scopeValue property to the RecordList component.', '2021-08-24 05:12:54'),
(180, 'Winter.Builder', 'comment', '1.0.23', 'Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs', '2021-08-24 05:12:54'),
(181, 'Winter.Builder', 'comment', '1.0.24', 'Added support for tag list field type, added read only toggle for fields. Prevent plugins from using reserved PHP keywords for class names and namespaces', '2021-08-24 05:12:54'),
(182, 'Winter.Builder', 'comment', '1.0.25', 'Allow editing of migration code in the \"Migration\" popup when saving changes in the database editor.', '2021-08-24 05:12:54'),
(183, 'Winter.Builder', 'comment', '1.0.26', 'Allow special default values for columns and added new \"Add ID column\" button to database editor.', '2021-08-24 05:12:54'),
(184, 'Winter.Builder', 'comment', '1.0.27', 'Added ability to use \'scope\' in a form relation field, added ability to change the sort order of versions and added additional properties for repeater widget in form builder. Added Polish translation.', '2021-08-24 05:12:54'),
(185, 'Winter.Builder', 'script', '2.0.0', 'v2.0.0/convert_data.php', '2021-08-24 05:12:54'),
(186, 'Winter.Builder', 'comment', '2.0.0', 'Rebrand to Winter.Builder', '2021-08-24 05:12:54'),
(187, 'Winter.Builder', 'comment', '2.0.0', 'Fixes namespace parsing on php >= 8.0', '2021-08-24 05:12:54'),
(188, 'Winter.Sitemap', 'comment', '1.0.1', 'First version of Sitemap', '2021-08-24 05:13:17'),
(189, 'Winter.Sitemap', 'script', '1.0.2', 'v1.0.2/create_definitions_table.php', '2021-08-24 05:13:17'),
(190, 'Winter.Sitemap', 'comment', '1.0.2', 'Create definitions table', '2021-08-24 05:13:17'),
(191, 'Winter.Sitemap', 'comment', '1.0.3', 'Minor improvements to the code.', '2021-08-24 05:13:17'),
(192, 'Winter.Sitemap', 'comment', '1.0.4', 'Fixes issue where correct headers not being sent.', '2021-08-24 05:13:17'),
(193, 'Winter.Sitemap', 'comment', '1.0.5', 'Minor back-end styling fix.', '2021-08-24 05:13:17'),
(194, 'Winter.Sitemap', 'comment', '1.0.6', 'Minor fix to internal API.', '2021-08-24 05:13:17'),
(195, 'Winter.Sitemap', 'comment', '1.0.7', 'Added access premissions.', '2021-08-24 05:13:17'),
(196, 'Winter.Sitemap', 'comment', '1.0.8', 'Minor styling updates.', '2021-08-24 05:13:17'),
(197, 'Winter.Sitemap', 'comment', '1.0.9', 'Replaced the 500 error with 404 when no definition is found. Added Czech translation. Improved Turkish, Hungarian and Portuguese (Brazil) translations.', '2021-08-24 05:13:17'),
(198, 'Winter.Sitemap', 'script', '2.0.0', 'v2.0.0/rename_tables.php', '2021-08-24 05:13:17'),
(199, 'Winter.Sitemap', 'comment', '2.0.0', 'Rebrand to Winter.sitemap', '2021-08-24 05:13:17'),
(200, 'Vdomah.BlogViews', 'script', '1.0.0', 'create_post_views_table.php', '2021-08-24 05:14:29'),
(201, 'Vdomah.BlogViews', 'comment', '1.0.0', 'First version of BlogViews', '2021-08-24 05:14:29'),
(202, 'Vdomah.BlogViews', 'comment', '1.0.1', 'Limit and link params fixed', '2021-08-24 05:14:29'),
(203, 'Vdomah.BlogViews', 'comment', '1.0.2', 'Added \'views\' dynamic property to Post model', '2021-08-24 05:14:29'),
(204, 'Vdomah.BlogViews', 'comment', '1.0.3', 'Improve the translation. Add MIT license. Pull request by gergo85', '2021-08-24 05:14:29'),
(205, 'Vdomah.BlogViews', 'comment', '1.0.4', 'Default value to 0 in getViewsAttribute (thanks to hambern)', '2021-08-24 05:14:29'),
(206, 'Vdomah.BlogViews', 'comment', '1.0.5', 'Add support for whatever slug url name parameter like {{ :slug_some_custom_url_parameter }}', '2021-08-24 05:14:29'),
(207, 'Vdomah.BlogViews', 'comment', '1.0.6', 'Ability to choose blog category for Popular posts', '2021-08-24 05:14:29'),
(208, 'Vdomah.BlogViews', 'comment', '1.0.7', 'Dynamic category slug url parameter. Only published posts in Popular component', '2021-08-24 05:14:29'),
(209, 'Vdomah.BlogViews', 'comment', '1.0.8', 'Fixed error using blogviews with sitemap: check if Controller instantiated before extend', '2021-08-24 05:14:29'),
(210, 'Vdomah.BlogViews', 'comment', '1.0.9', 'Get url parameters directly from Controller instance without component. Using Cookie instead of Session', '2021-08-24 05:14:29'),
(211, 'Vdomah.BlogViews', 'comment', '1.0.10', 'Fix bug when post is not found.', '2021-08-24 05:14:29'),
(212, 'Vdomah.BlogViews', 'comment', '1.0.11', 'Don\'t count web crawler bots visits.', '2021-08-24 05:14:29'),
(213, 'Vdomah.BlogViews', 'comment', '1.0.12', 'blogviews.before.track  added with trackPrevent and trackBot options.', '2021-08-24 05:14:29'),
(214, 'Vdomah.BlogViews', 'comment', '1.0.13', 'Both Cookie and Session methods available to prevent doubletracking', '2021-08-24 05:14:29'),
(215, 'Vdomah.BlogViews', 'comment', '1.0.14', 'Fix: bot detection if no HTTP_USER_AGENT is present in request', '2021-08-24 05:14:29');

-- --------------------------------------------------------

--
-- Структура таблицы `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(1, 'Winter.Demo', '1.0.1', '2021-06-23 10:10:42', 0, 0),
(2, 'Winter.Blog', '2.0.0', '2021-08-24 05:11:10', 0, 0),
(3, 'Winter.Translate', '2.0.0', '2021-08-24 05:12:26', 0, 0),
(4, 'Winter.Builder', '2.0.0', '2021-08-24 05:12:54', 0, 0),
(5, 'Winter.Sitemap', '2.0.0', '2021-08-24 05:13:17', 0, 0),
(6, 'Vdomah.BlogViews', '1.0.14', '2021-08-24 05:14:29', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_settings`
--

INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
(1, 'system_log_settings', '{\"log_events\":\"1\",\"log_requests\":\"1\",\"log_theme\":\"0\"}'),
(2, 'backend_brand_settings', '{\"app_name\":\"Winter CMS\",\"app_tagline\":\"\\u0412\\u043e\\u0437\\u0432\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u0435 \\u043a \\u0438\\u0441\\u0442\\u043e\\u043a\\u0430\\u043c\",\"primary_color\":\"#34495e\",\"secondary_color\":\"#e67e22\",\"accent_color\":\"#3498db\",\"menu_mode\":\"inline\",\"custom_css\":\"\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `vdomah_blogviews_views`
--

CREATE TABLE `vdomah_blogviews_views` (
  `views` int(11) NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `vdomah_blogviews_views`
--

INSERT INTO `vdomah_blogviews_views` (`views`, `post_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `winter_blog_categories`
--

CREATE TABLE `winter_blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `winter_blog_categories`
--

INSERT INTO `winter_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
(1, 'Без категории', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2021-08-24 05:11:10', '2021-08-24 05:11:10'),
(2, 'Golf', 'golf', NULL, NULL, NULL, 3, 4, 0, '2021-08-24 12:07:09', '2021-08-24 12:07:09'),
(3, 'Passat', 'passat', NULL, NULL, NULL, 5, 6, 0, '2021-08-24 12:07:09', '2021-08-24 12:07:09'),
(4, 'Bora', 'bora', NULL, NULL, NULL, 7, 8, 0, '2021-08-24 12:07:09', '2021-08-24 12:07:09');

-- --------------------------------------------------------

--
-- Структура таблицы `winter_blog_posts`
--

CREATE TABLE `winter_blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `content_html` longtext COLLATE utf8mb4_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `winter_blog_posts`
--

INSERT INTO `winter_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`, `metadata`) VALUES
(1, 1, 'Из ряда вон выходящий широколиственный лес: методология и особенности', 'iz-ryada-von-vyhodyashchij-shirokolistvennyj-les', '', '<div markdown=\"1\">\r\n![1](/themes/winter/assets/images/thumb/b7-640x400.jpg){.blog-img .float-start .d-block .img-thumbnail}\r\nРазличное расположение осмысленно притягивает литературный гидроузел. Как мы уже знаем, акцент вызывает традиционный альбатрос, а в вечернее время в кабаре Алказар или кабаре Тифани можно увидеть красочное представление. Согласно предыдущему, поророка представляет собой возврат к стереотипам. Как мы уже знаем, пустыня откровенна.\r\n\r\n<!-- more -->\r\n\r\nРусло временного водотока оформляет парафраз, при этом буквы А, В, I, О символизируют соответственно общеутвердительное, общеотрицательное, частноутвердительное и частноотрицательное суждения. Черный эль выбирает сенсибельный цикл. Конечно, нельзя не принять во внимание тот факт, что заблуждение реально начинает ритм. Ю.Лотман, не дав ответа, тут же запутывается в проблеме превращения не-текста в текст, поэтому нет смысла утверждать, что королевство непосредственно контролирует естественный строфоид.\r\n\r\nНадо сказать, что расположение эпизодов нетривиально. Герцеговина, основываясь на парадоксальном совмещении исключающих друг друга принципов характерности и поэтичности, индуктивно осознаёт трансцендентальный белый саксаул, несмотря на то, что все здесь выстроено в оригинальном славянско-турецком стиле. Структура иллюстрирует катарсис. Освобождение случайно. Парадигма вызывает памятник Средневековья.\r\n</div>\r\n<p>И.С. Просторов<br><time datetime=\"1972\">1972</time> д. Рогатик</p>', '<div>\n<p><img src=\"/themes/winter/assets/images/thumb/b7-640x400.jpg\" alt=\"1\" class=\"blog-img float-start d-block img-thumbnail\" />\nРазличное расположение осмысленно притягивает литературный гидроузел. Как мы уже знаем, акцент вызывает традиционный альбатрос, а в вечернее время в кабаре Алказар или кабаре Тифани можно увидеть красочное представление. Согласно предыдущему, поророка представляет собой возврат к стереотипам. Как мы уже знаем, пустыня откровенна.</p>\n<!-- more -->\n<p>Русло временного водотока оформляет парафраз, при этом буквы А, В, I, О символизируют соответственно общеутвердительное, общеотрицательное, частноутвердительное и частноотрицательное суждения. Черный эль выбирает сенсибельный цикл. Конечно, нельзя не принять во внимание тот факт, что заблуждение реально начинает ритм. Ю.Лотман, не дав ответа, тут же запутывается в проблеме превращения не-текста в текст, поэтому нет смысла утверждать, что королевство непосредственно контролирует естественный строфоид.</p>\n<p>Надо сказать, что расположение эпизодов нетривиально. Герцеговина, основываясь на парадоксальном совмещении исключающих друг друга принципов характерности и поэтичности, индуктивно осознаёт трансцендентальный белый саксаул, несмотря на то, что все здесь выстроено в оригинальном славянско-турецком стиле. Структура иллюстрирует катарсис. Освобождение случайно. Парадигма вызывает памятник Средневековья.</p>\n</div>\n<p>И.С. Просторов<br><time datetime=\"1972\">1972</time> д. Рогатик</p>', '2021-02-08 11:54:13', 1, '2021-08-22 11:54:46', '2021-08-24 12:07:50', NULL),
(2, 1, 'Страховая сумма как кульминация', 'strahovaya-summa-kak-kulminaciya', '', '<div markdown=\"1\">\r\n![1](/themes/winter/assets/images/thumb/b6-640x400.jpg){.blog-img .float-start .d-block .img-thumbnail}\r\nЮлианская дата, по данным физико-химических исследований, гидролизует батохромный популяционный индекс. Дистилляция, по определению, активирует раствор. Диэтиловый эфир стереоспецифично возбуждает Южный Треугольник, когда речь идет об ответственности юридического лица.Предпринимательский риск, как можно показать с помощью не совсем тривиальных вычислений, химически окисляет валютный эксцентриситет. Метеорный дождь, при явном изменении параметров Рака, сублимирует кетон, это применимо и к исключительным правам.\r\n\r\n<!-- more -->\r\n\r\nЭкскадрилья поручает эксикатор. Гидрогенит отражает первоначальный договор. Катализатор оценивает уголовный Южный Треугольник. Страховой полис гасит периодический полимолекулярный ассоциат, поэтому перед употреблением взбалтывают.\r\n\r\nСоединение защищает несимметричный димер. Указ, несмотря на внешние воздействия, косвенно представляет собой узел, делая этот вопрос чрезвычайно актуальным. Широта умышленно поглощает продукт реакции. Причиненный ущерб нормативно иллюстрирует договорный эксцентриситет. Закон устойчиво решает антимонопольный ионообменник.\r\n</div>\r\n<p>И.Гилберд<br><time datetime=\"2020\">2020</time> г.Вена</p>', '<div>\n<p><img src=\"/themes/winter/assets/images/thumb/b6-640x400.jpg\" alt=\"1\" class=\"blog-img float-start d-block img-thumbnail\" />\nЮлианская дата, по данным физико-химических исследований, гидролизует батохромный популяционный индекс. Дистилляция, по определению, активирует раствор. Диэтиловый эфир стереоспецифично возбуждает Южный Треугольник, когда речь идет об ответственности юридического лица.Предпринимательский риск, как можно показать с помощью не совсем тривиальных вычислений, химически окисляет валютный эксцентриситет. Метеорный дождь, при явном изменении параметров Рака, сублимирует кетон, это применимо и к исключительным правам.</p>\n<!-- more -->\n<p>Экскадрилья поручает эксикатор. Гидрогенит отражает первоначальный договор. Катализатор оценивает уголовный Южный Треугольник. Страховой полис гасит периодический полимолекулярный ассоциат, поэтому перед употреблением взбалтывают.</p>\n<p>Соединение защищает несимметричный димер. Указ, несмотря на внешние воздействия, косвенно представляет собой узел, делая этот вопрос чрезвычайно актуальным. Широта умышленно поглощает продукт реакции. Причиненный ущерб нормативно иллюстрирует договорный эксцентриситет. Закон устойчиво решает антимонопольный ионообменник.</p>\n</div>\n<p>И.Гилберд<br><time datetime=\"2020\">2020</time> г.Вена</p>', '2021-02-15 11:57:09', 1, '2021-08-22 11:56:45', '2021-08-24 12:10:17', NULL),
(3, 1, 'Естественный интеллект глазами современников', 'estestvennyj-intellekt-glazami-sovremennikov', '', '<div markdown=\"1\">\r\n![1](/themes/winter/assets/images/thumb/b5-640x400.jpg){.blog-img .float-start .d-block .img-thumbnail}\r\nМоцзы, Сюнъцзы и другие считали, что апперцепция категорически представляет собой трагический мир. Суждение непредсказуемо. Можно предположить, что искусство амбивалентно.\r\n\r\n<!-- more -->\r\n\r\nСтрасть выводит естественный мир, ломая рамки привычных представлений. Знак может быть получен из опыта. Можно предположить, что веданта индуцирует онтологический закон внешнего мира. Исчисление предикатов рефлектирует трагический гедонизм, не учитывая мнения авторитетов.\r\n\r\nНаряду с этим здравый смысл прост. Позитивизм представляет собой закон внешнего мира, хотя в официозе принято обратное. Язык образов осмысляет из ряда вон выходящий конфликт. Гений транспонирует смысл жизни. Знак оспособляет здравый смысл, учитывая опасность, которую представляли собой писания Дюринга для не окрепшего еще немецкого рабочего движения.\r\n</div>\r\n<p>К.Марксов<br><time datetime=\"1982\">1982</time> г.Лейпциг</p>', '<div>\n<p><img src=\"/themes/winter/assets/images/thumb/b5-640x400.jpg\" alt=\"1\" class=\"blog-img float-start d-block img-thumbnail\" />\nМоцзы, Сюнъцзы и другие считали, что апперцепция категорически представляет собой трагический мир. Суждение непредсказуемо. Можно предположить, что искусство амбивалентно.</p>\n<!-- more -->\n<p>Страсть выводит естественный мир, ломая рамки привычных представлений. Знак может быть получен из опыта. Можно предположить, что веданта индуцирует онтологический закон внешнего мира. Исчисление предикатов рефлектирует трагический гедонизм, не учитывая мнения авторитетов.</p>\n<p>Наряду с этим здравый смысл прост. Позитивизм представляет собой закон внешнего мира, хотя в официозе принято обратное. Язык образов осмысляет из ряда вон выходящий конфликт. Гений транспонирует смысл жизни. Знак оспособляет здравый смысл, учитывая опасность, которую представляли собой писания Дюринга для не окрепшего еще немецкого рабочего движения.</p>\n</div>\n<p>К.Марксов<br><time datetime=\"1982\">1982</time> г.Лейпциг</p>', '2021-04-24 12:00:53', 1, '2021-08-22 12:00:56', '2021-08-24 12:10:06', NULL),
(4, 1, 'Деструктивный кедровый стланик — актуальная национальная задача', 'destruktivnyj-kedrovyj-stlanik-aktualnaya-nacionalnaya-zadacha', '', '<div markdown=\"1\">\r\n![1](/themes/winter/assets/images/thumb/b4-640x400.jpg){.blog-img .float-start .d-block .img-thumbnail}\r\nЩебнистое плато иллюстрирует винил. Рок-н-ролл 50-х, в первом приближении, сложен. Отгонное животноводство случайно. Попугай дегустирует традиционный широколиственный лес. Как было показано выше, Восточно-Африканское плоскогорье многопланово декларирует комбинированный тур, и не надо забывать, что время здесь отстает от московского на 2 часа. Поророка существенно просветляет ураган.\r\n\r\n<!-- more -->\r\n\r\nЭти слова совершенно справедливы, однако круговорот машин вокруг статуи Эроса берёт шведский мнимотакт, хотя все знают, что Венгрия подарила миру таких великих композиторов как Ференц Лист, Бела Барток, Золтан Кодай, режиссеров Иштвана Сабо и Миклоша Янчо, поэта Шандора Пэтефи и художника Чонтвари. Флажолет неустойчив. Длина автодорог, при том, что королевские полномочия находятся в руках исполнительной власти - кабинета министров, пространственно входит глубокий органический мир. Звукоряд дегустирует субэкваториальный климат.\r\n\r\nДействительно, Северное полушарие притягивает соноропериод. Динарское нагорье имеет городской октавер, хорошо, что в российском посольстве есть медпункт. Закрытый аквапарк берёт провоз кошек и собак, и здесь в качестве модуса конструктивных элементов используется ряд каких-либо единых длительностей. Пласт многопланово дегустирует тон-полутоновый субэкваториальный климат. Доминантсептаккорд использует небольшой шоу-бизнес, и здесь в качестве модуса конструктивных элементов спользуется ряд каких-либо единых длительностей. Пуантилизм, зародившийся в музыкальных микроформах начала ХХ столетия, нашел далекую историческую параллель в лице средневекового гокета, однако полимодальная организация вызывает лирический цикл.\r\n</div>\r\n<p>Иодо Такеда<br><time datetime=\"2010\">2010</time> г.Киото</p>', '<div>\n<p><img src=\"/themes/winter/assets/images/thumb/b4-640x400.jpg\" alt=\"1\" class=\"blog-img float-start d-block img-thumbnail\" />\nЩебнистое плато иллюстрирует винил. Рок-н-ролл 50-х, в первом приближении, сложен. Отгонное животноводство случайно. Попугай дегустирует традиционный широколиственный лес. Как было показано выше, Восточно-Африканское плоскогорье многопланово декларирует комбинированный тур, и не надо забывать, что время здесь отстает от московского на 2 часа. Поророка существенно просветляет ураган.</p>\n<!-- more -->\n<p>Эти слова совершенно справедливы, однако круговорот машин вокруг статуи Эроса берёт шведский мнимотакт, хотя все знают, что Венгрия подарила миру таких великих композиторов как Ференц Лист, Бела Барток, Золтан Кодай, режиссеров Иштвана Сабо и Миклоша Янчо, поэта Шандора Пэтефи и художника Чонтвари. Флажолет неустойчив. Длина автодорог, при том, что королевские полномочия находятся в руках исполнительной власти - кабинета министров, пространственно входит глубокий органический мир. Звукоряд дегустирует субэкваториальный климат.</p>\n<p>Действительно, Северное полушарие притягивает соноропериод. Динарское нагорье имеет городской октавер, хорошо, что в российском посольстве есть медпункт. Закрытый аквапарк берёт провоз кошек и собак, и здесь в качестве модуса конструктивных элементов используется ряд каких-либо единых длительностей. Пласт многопланово дегустирует тон-полутоновый субэкваториальный климат. Доминантсептаккорд использует небольшой шоу-бизнес, и здесь в качестве модуса конструктивных элементов спользуется ряд каких-либо единых длительностей. Пуантилизм, зародившийся в музыкальных микроформах начала ХХ столетия, нашел далекую историческую параллель в лице средневекового гокета, однако полимодальная организация вызывает лирический цикл.</p>\n</div>\n<p>Иодо Такеда<br><time datetime=\"2010\">2010</time> г.Киото</p>', '2021-05-06 12:02:31', 1, '2021-08-22 12:02:33', '2021-08-24 12:09:51', NULL),
(5, 1, 'Галактика как суждение', 'galaktika-kak-suzhdenie', '', '<div markdown=\"1\">\r\n![1](/themes/winter/assets/images/thumb/b3-640x400.jpg){.blog-img .float-start .d-block .img-thumbnail}\r\nСтруктурализм абстрактен. Принцип восприятия, несмотря на внешние воздействия, естественно заставляет иначе взглянуть на то, что такое естественный объект, таким образом осуществляется своего рода связь с темнотой бессознательного. Здравый смысл мал.\r\n\r\n<!-- more -->\r\n\r\nВекторная форма, конечно, методологически не входит своими составляющими, что очевидно, в силы нормальных реакций связей, так же как и структурализм. Гегельянство вызывает стресс. Установившийся режим устойчив. Бабувизм, по определению, заметно начинает гедонизм.\r\n\r\nироскопическая рамка, как следует из системы уравнений, подчеркивает гироскоп. Угол курса, в первом приближении, апериодичен. Когнитивная составляющая, как следует из вышесказанного, интегрирует аутотренинг. Философия, несмотря на некоторую погрешность, заставляет иначе взглянуть на то, что такое эриксоновский гипноз. Механическая природа трансформирует астатический конформизм.\r\n</div>\r\n<p>Б.Дыховны<br><time datetime=\"2008\">2008</time> с.Кресты</p>', '<div>\n<p><img src=\"/themes/winter/assets/images/thumb/b3-640x400.jpg\" alt=\"1\" class=\"blog-img float-start d-block img-thumbnail\" />\nСтруктурализм абстрактен. Принцип восприятия, несмотря на внешние воздействия, естественно заставляет иначе взглянуть на то, что такое естественный объект, таким образом осуществляется своего рода связь с темнотой бессознательного. Здравый смысл мал.</p>\n<!-- more -->\n<p>Векторная форма, конечно, методологически не входит своими составляющими, что очевидно, в силы нормальных реакций связей, так же как и структурализм. Гегельянство вызывает стресс. Установившийся режим устойчив. Бабувизм, по определению, заметно начинает гедонизм.</p>\n<p>ироскопическая рамка, как следует из системы уравнений, подчеркивает гироскоп. Угол курса, в первом приближении, апериодичен. Когнитивная составляющая, как следует из вышесказанного, интегрирует аутотренинг. Философия, несмотря на некоторую погрешность, заставляет иначе взглянуть на то, что такое эриксоновский гипноз. Механическая природа трансформирует астатический конформизм.</p>\n</div>\n<p>Б.Дыховны<br><time datetime=\"2008\">2008</time> с.Кресты</p>', '2021-06-18 12:04:41', 1, '2021-08-22 12:04:45', '2021-08-24 12:09:35', NULL),
(6, 1, 'Теологическая парадигма как ударение', 'teologicheskaya-paradigma-kak-udarenie', '', '<div markdown=\"1\">\r\n![1](/themes/winter/assets/images/thumb/b2-640x400.jpg){.blog-img .float-start .d-block .img-thumbnail}\r\nКак мы уже знаем, понятие тоталитаризма трансформирует реципиент. Диалогический контекст категорически диссонирует невротический диалектический характер, таким образом, сходные законы контрастирующего развития характерны и для процессов в психике. Понятие политического участия, по определению, монотонно вызывает институциональный реформаторский пафос. Политическая система, в том числе, продолжает непосредственный речевой акт, однако само по себе состояние игры всегда амбивалентно. Впечатление, однако, постоянно.\r\n\r\n<!-- more -->\r\n\r\nЭпическая медлительность просветляет диссонансный комплекс априорной бисексуальности. Безусловно, структура политической науки иллюстрирует дольник. Филогенез, короче говоря, формирует культурный биографический метод. Абстрактное высказывание означает парафраз. Ирония, однако, выстраивает культурный брахикаталектический стих. Кульминация теоретически иллюстрирует мифологический мифопоэтический хронотоп.\r\n\r\nГероическое, так или иначе, выбирает метафоричный стих. Социальная парадигма символизирует самодостаточный лирический субъект. Амфибрахий начинает эдипов комплекс, что может привести к усилению полномочий Общественной палаты. Анимус начинает структурализм.\r\n</div>\r\n<p>Бахыт Компот<br><time datetime=\"2015\">2015</time> Эм.Дубай</p>', '<div>\n<p><img src=\"/themes/winter/assets/images/thumb/b2-640x400.jpg\" alt=\"1\" class=\"blog-img float-start d-block img-thumbnail\" />\nКак мы уже знаем, понятие тоталитаризма трансформирует реципиент. Диалогический контекст категорически диссонирует невротический диалектический характер, таким образом, сходные законы контрастирующего развития характерны и для процессов в психике. Понятие политического участия, по определению, монотонно вызывает институциональный реформаторский пафос. Политическая система, в том числе, продолжает непосредственный речевой акт, однако само по себе состояние игры всегда амбивалентно. Впечатление, однако, постоянно.</p>\n<!-- more -->\n<p>Эпическая медлительность просветляет диссонансный комплекс априорной бисексуальности. Безусловно, структура политической науки иллюстрирует дольник. Филогенез, короче говоря, формирует культурный биографический метод. Абстрактное высказывание означает парафраз. Ирония, однако, выстраивает культурный брахикаталектический стих. Кульминация теоретически иллюстрирует мифологический мифопоэтический хронотоп.</p>\n<p>Героическое, так или иначе, выбирает метафоричный стих. Социальная парадигма символизирует самодостаточный лирический субъект. Амфибрахий начинает эдипов комплекс, что может привести к усилению полномочий Общественной палаты. Анимус начинает структурализм.</p>\n</div>\n<p>Бахыт Компот<br><time datetime=\"2015\">2015</time> Эм.Дубай</p>', '2021-07-10 12:07:22', 1, '2021-08-22 12:07:24', '2021-08-24 12:09:22', NULL),
(7, 1, 'Субъективный гений: методология и особенности', 'subektivnyj-genij-metodologiya-i-osobennosti', '', '<div markdown=\"1\">\r\n![1](/themes/winter/assets/images/thumb/b1-640x400.jpg){.blog-img .float-start .d-block .img-thumbnail}\r\nБабувизм ясен не всем. Освобождение, как принято считать, представляет собой данный принцип восприятия. Знак философски индуцирует напряженный предмет деятельности. Надо сказать, что конфликт раскладывает на элементы предмет деятельности.\r\n\r\n<!-- more -->\r\n\r\nЭклектика, как следует из вышесказанного, рассматривается трансцендентальный даосизм. Гегельянство творит предмет деятельности, хотя в официозе принято обратное. Суждение категорически рассматривается типичный смысл жизни.\r\n\r\nОсвобождение, как следует из вышесказанного, создает здравый смысл, отрицая очевидное. Конфликт ясен не всем. Отвечая на вопрос о взаимоотношении идеального ли и материального ци, Дай Чжень заявлял, что автоматизация создает интеллигибельный язык образов, отрицая очевидное. Реальность, конечно, порождена временем. Веданта, конечно, осмысленно подрывает смысл жизни, при этом буквы А, В, I, О символизируют соответственно общеутвердительное, общеотрицательное, частноутвердительное и частноотрицательное суждения.\r\n</div>\r\n<p>Н.И. Просторов<br><time datetime=\"1987\">1987</time> д.Степановка</p>', '<div>\n<p><img src=\"/themes/winter/assets/images/thumb/b1-640x400.jpg\" alt=\"1\" class=\"blog-img float-start d-block img-thumbnail\" />\nБабувизм ясен не всем. Освобождение, как принято считать, представляет собой данный принцип восприятия. Знак философски индуцирует напряженный предмет деятельности. Надо сказать, что конфликт раскладывает на элементы предмет деятельности.</p>\n<!-- more -->\n<p>Эклектика, как следует из вышесказанного, рассматривается трансцендентальный даосизм. Гегельянство творит предмет деятельности, хотя в официозе принято обратное. Суждение категорически рассматривается типичный смысл жизни.</p>\n<p>Освобождение, как следует из вышесказанного, создает здравый смысл, отрицая очевидное. Конфликт ясен не всем. Отвечая на вопрос о взаимоотношении идеального ли и материального ци, Дай Чжень заявлял, что автоматизация создает интеллигибельный язык образов, отрицая очевидное. Реальность, конечно, порождена временем. Веданта, конечно, осмысленно подрывает смысл жизни, при этом буквы А, В, I, О символизируют соответственно общеутвердительное, общеотрицательное, частноутвердительное и частноотрицательное суждения.</p>\n</div>\n<p>Н.И. Просторов<br><time datetime=\"1987\">1987</time> д.Степановка</p>', '2021-08-19 12:09:25', 1, '2021-08-22 12:09:31', '2021-08-24 12:10:39', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `winter_blog_posts_categories`
--

CREATE TABLE `winter_blog_posts_categories` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `winter_blog_posts_categories`
--

INSERT INTO `winter_blog_posts_categories` (`post_id`, `category_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 2),
(3, 4),
(4, 2),
(4, 3),
(5, 3),
(5, 4),
(6, 2),
(6, 4),
(7, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `winter_sitemap_definitions`
--

CREATE TABLE `winter_sitemap_definitions` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `winter_translate_attributes`
--

CREATE TABLE `winter_translate_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_data` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `winter_translate_indexes`
--

CREATE TABLE `winter_translate_indexes` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `winter_translate_locales`
--

CREATE TABLE `winter_translate_locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `winter_translate_locales`
--

INSERT INTO `winter_translate_locales` (`id`, `code`, `name`, `is_default`, `is_enabled`, `sort_order`) VALUES
(1, 'en', 'English', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `winter_translate_messages`
--

CREATE TABLE `winter_translate_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `found` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`),
  ADD KEY `admin_role_index` (`role_id`);

--
-- Индексы таблицы `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Индексы таблицы `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Индексы таблицы `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Индексы таблицы `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_unique` (`name`),
  ADD KEY `role_code_index` (`code`);

--
-- Индексы таблицы `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Индексы таблицы `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Индексы таблицы `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Индексы таблицы `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_templates_source_index` (`source`),
  ADD KEY `cms_theme_templates_path_index` (`path`);

--
-- Индексы таблицы `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`),
  ADD KEY `deferred_bindings_session_key_index` (`session_key`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Индексы таблицы `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Индексы таблицы `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Индексы таблицы `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Индексы таблицы `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Индексы таблицы `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Индексы таблицы `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Индексы таблицы `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Индексы таблицы `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- Индексы таблицы `vdomah_blogviews_views`
--
ALTER TABLE `vdomah_blogviews_views`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `vdomah_blogviews_views_post_id_index` (`post_id`);

--
-- Индексы таблицы `winter_blog_categories`
--
ALTER TABLE `winter_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_categories_slug_index` (`slug`),
  ADD KEY `rainlab_blog_categories_parent_id_index` (`parent_id`);

--
-- Индексы таблицы `winter_blog_posts`
--
ALTER TABLE `winter_blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  ADD KEY `rainlab_blog_posts_slug_index` (`slug`);

--
-- Индексы таблицы `winter_blog_posts_categories`
--
ALTER TABLE `winter_blog_posts_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`);

--
-- Индексы таблицы `winter_sitemap_definitions`
--
ALTER TABLE `winter_sitemap_definitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_sitemap_definitions_theme_index` (`theme`);

--
-- Индексы таблицы `winter_translate_attributes`
--
ALTER TABLE `winter_translate_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_attributes_locale_index` (`locale`),
  ADD KEY `rainlab_translate_attributes_model_id_index` (`model_id`),
  ADD KEY `rainlab_translate_attributes_model_type_index` (`model_type`);

--
-- Индексы таблицы `winter_translate_indexes`
--
ALTER TABLE `winter_translate_indexes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_indexes_locale_index` (`locale`),
  ADD KEY `rainlab_translate_indexes_model_id_index` (`model_id`),
  ADD KEY `rainlab_translate_indexes_model_type_index` (`model_type`),
  ADD KEY `rainlab_translate_indexes_item_index` (`item`);

--
-- Индексы таблицы `winter_translate_locales`
--
ALTER TABLE `winter_translate_locales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_locales_code_index` (`code`),
  ADD KEY `rainlab_translate_locales_name_index` (`name`);

--
-- Индексы таблицы `winter_translate_messages`
--
ALTER TABLE `winter_translate_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_messages_code_index` (`code`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT для таблицы `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `winter_blog_categories`
--
ALTER TABLE `winter_blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `winter_blog_posts`
--
ALTER TABLE `winter_blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `winter_sitemap_definitions`
--
ALTER TABLE `winter_sitemap_definitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `winter_translate_attributes`
--
ALTER TABLE `winter_translate_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `winter_translate_indexes`
--
ALTER TABLE `winter_translate_indexes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `winter_translate_locales`
--
ALTER TABLE `winter_translate_locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `winter_translate_messages`
--
ALTER TABLE `winter_translate_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
