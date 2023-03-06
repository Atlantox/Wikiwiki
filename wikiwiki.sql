-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2023 a las 23:26:35
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wikiwiki`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_article`
--

CREATE TABLE `articles_article` (
  `id` bigint(20) NOT NULL,
  `title` varchar(40) NOT NULL,
  `other_names` longtext DEFAULT NULL,
  `main` longtext NOT NULL,
  `views` bigint(20) UNSIGNED DEFAULT NULL,
  `created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_article`
--

INSERT INTO `articles_article` (`id`, `title`, `other_names`, `main`, `views`, `created`) VALUES
(1, 'Stefannie Kyoi', 'Stefannie', 'Stefannie is a dark elf and the most powerful member in the stealth branch of the Hinotori academy. She is very serious, direct and intimidating and rarely she talk about herself', 0, '2023-03-06 21:58:39.555962'),
(2, 'Dark elves', '', 'The dark elves are one of the 5 races in Venslla, they are intelligent but over all their are very skullfuls, they have a powerfull feel of justice and often their are very strict', 0, '2023-02-27 17:05:07.990609');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_article_category`
--

CREATE TABLE `articles_article_category` (
  `id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_article_category`
--

INSERT INTO `articles_article_category` (`id`, `article_id`, `category_id`) VALUES
(1, 1, 1),
(2, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_article_images`
--

CREATE TABLE `articles_article_images` (
  `id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_article_images`
--

INSERT INTO `articles_article_images` (`id`, `article_id`, `image_id`) VALUES
(1, 1, 1),
(3, 1, 5),
(2, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_category`
--

CREATE TABLE `articles_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_category`
--

INSERT INTO `articles_category` (`id`, `name`) VALUES
(1, 'Characters'),
(4, 'Festivities'),
(3, 'Heroes'),
(2, 'Places'),
(5, 'Races');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_image`
--

CREATE TABLE `articles_image` (
  `id` bigint(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `img` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_image`
--

INSERT INTO `articles_image` (`id`, `title`, `img`, `description`) VALUES
(1, 'Stefannie', 'article_imgs/Stefannie2.jpg', ''),
(2, 'Ámber', 'article_imgs/Amber2.jpg', ''),
(3, 'Liz\'Amar', 'article_imgs/Liz_Amar2.jpg', ''),
(4, 'Dark elves', 'article_imgs/dark_elfs.png', 'The dark elves crest, is a knife with a contract reflecting their big justice feel'),
(5, 'Stealth Stefannie', 'article_imgs/stefannie.jpg', 'Stefannie with stleath uniform and tools');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_relatedarticles`
--

CREATE TABLE `articles_relatedarticles` (
  `id` bigint(20) NOT NULL,
  `article_title` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_relatedarticles`
--

INSERT INTO `articles_relatedarticles` (`id`, `article_title`) VALUES
(1, 'Stefannie Kyoi'),
(2, 'Dark elves');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_relatedarticles_related`
--

CREATE TABLE `articles_relatedarticles_related` (
  `id` bigint(20) NOT NULL,
  `relatedarticles_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_relatedarticles_related`
--

INSERT INTO `articles_relatedarticles_related` (`id`, `relatedarticles_id`, `article_id`) VALUES
(1, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_section`
--

CREATE TABLE `articles_section` (
  `id` bigint(20) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` longtext DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL CHECK (`order` >= 0),
  `visible` tinyint(1) NOT NULL,
  `collapse` tinyint(1) NOT NULL,
  `sectionType_id` bigint(20) DEFAULT NULL,
  `targetArticle_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_section`
--

INSERT INTO `articles_section` (`id`, `title`, `content`, `order`, `visible`, `collapse`, `sectionType_id`, `targetArticle_id`) VALUES
(1, 'Personality', 'Stefannie is very independent, logical and solitaire,  always search the self benefit and never helps others without gain something, she is very direct and in many cases cruel.', 1, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_sectiontype`
--

CREATE TABLE `articles_sectiontype` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_sectiontype`
--

INSERT INTO `articles_sectiontype` (`id`, `name`) VALUES
(4, 'Ordened list'),
(1, 'Pure text'),
(2, 'Text with L image'),
(3, 'Text with R image'),
(5, 'Unordened list');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_section_images`
--

CREATE TABLE `articles_section_images` (
  `id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_summary`
--

CREATE TABLE `articles_summary` (
  `id` bigint(20) NOT NULL,
  `article_id` bigint(20) DEFAULT NULL,
  `content` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_summary`
--

INSERT INTO `articles_summary` (`id`, `article_id`, `content`) VALUES
(1, 1, 'Gender:female;Birthplace:Quimol;Status:alive'),
(2, 2, 'Skin:grey;District:Neburia;Speciality:Self control');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Article', 7, 'add_article'),
(26, 'Can change Article', 7, 'change_article'),
(27, 'Can delete Article', 7, 'delete_article'),
(28, 'Can view Article', 7, 'view_article'),
(29, 'Can add Article category', 8, 'add_category'),
(30, 'Can change Article category', 8, 'change_category'),
(31, 'Can delete Article category', 8, 'delete_category'),
(32, 'Can view Article category', 8, 'view_category'),
(33, 'Can add Article image', 9, 'add_image'),
(34, 'Can change Article image', 9, 'change_image'),
(35, 'Can delete Article image', 9, 'delete_image'),
(36, 'Can view Article image', 9, 'view_image'),
(37, 'Can add Section type', 10, 'add_sectiontype'),
(38, 'Can change Section type', 10, 'change_sectiontype'),
(39, 'Can delete Section type', 10, 'delete_sectiontype'),
(40, 'Can view Section type', 10, 'view_sectiontype'),
(41, 'Can add Article summary', 11, 'add_summary'),
(42, 'Can change Article summary', 11, 'change_summary'),
(43, 'Can delete Article summary', 11, 'delete_summary'),
(44, 'Can view Article summary', 11, 'view_summary'),
(45, 'Can add Article section', 12, 'add_section'),
(46, 'Can change Article section', 12, 'change_section'),
(47, 'Can delete Article section', 12, 'delete_section'),
(48, 'Can view Article section', 12, 'view_section'),
(49, 'Can add Related articles', 13, 'add_relatedarticles'),
(50, 'Can change Related articles', 13, 'change_relatedarticles'),
(51, 'Can delete Related articles', 13, 'delete_relatedarticles'),
(52, 'Can view Related articles', 13, 'view_relatedarticles'),
(53, 'Can add contact', 14, 'add_contact'),
(54, 'Can change contact', 14, 'change_contact'),
(55, 'Can delete contact', 14, 'delete_contact'),
(56, 'Can view contact', 14, 'view_contact');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$54PpeMFigfsMgcelEO2TFR$FaDKQh4NYA9g8ruT3mH1QZXz1TEX50LSPXZNy4T8zUw=', '2023-02-27 16:36:05.052489', 1, 'atlantox', '', '', 'atlantox7@gmail.com', 1, 1, '2023-02-27 16:35:51.076947');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-02-27 16:36:21.060478', '1', 'Characters', 1, '[{\"added\": {}}]', 8, 1),
(2, '2023-02-27 16:36:27.604574', '2', 'Places', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-02-27 16:36:56.864480', '3', 'Heroes', 1, '[{\"added\": {}}]', 8, 1),
(4, '2023-02-27 16:37:28.542258', '4', 'Festivities', 1, '[{\"added\": {}}]', 8, 1),
(5, '2023-02-27 16:37:32.660210', '5', 'Races', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-02-27 16:37:47.568155', '1', 'Pure text', 1, '[{\"added\": {}}]', 10, 1),
(7, '2023-02-27 16:37:50.796711', '2', 'Text with L image', 1, '[{\"added\": {}}]', 10, 1),
(8, '2023-02-27 16:37:53.404116', '3', 'Text with R image', 1, '[{\"added\": {}}]', 10, 1),
(9, '2023-02-27 16:37:57.052088', '4', 'Ordened list', 1, '[{\"added\": {}}]', 10, 1),
(10, '2023-02-27 16:38:00.542972', '5', 'Unordened list', 1, '[{\"added\": {}}]', 10, 1),
(11, '2023-02-27 16:38:46.274750', '1', 'Stefannie', 1, '[{\"added\": {}}]', 9, 1),
(12, '2023-02-27 16:39:12.481701', '2', 'Ámber', 1, '[{\"added\": {}}]', 9, 1),
(13, '2023-02-27 16:39:23.482771', '3', 'Liz\'Amar', 1, '[{\"added\": {}}]', 9, 1),
(14, '2023-02-27 16:47:00.540900', '1', 'Stefannie Kyoi', 1, '[{\"added\": {}}]', 7, 1),
(15, '2023-02-27 16:50:46.197720', '4', 'Dark elves', 1, '[{\"added\": {}}]', 9, 1),
(16, '2023-02-27 17:04:58.161273', '2', 'Dark elfs', 1, '[{\"added\": {}}]', 7, 1),
(17, '2023-02-27 17:05:07.997732', '2', 'Dark elves', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 7, 1),
(18, '2023-03-05 21:06:12.838878', '1', 'Stefannie Kyoi\'s summary', 1, '[{\"added\": {}}]', 11, 1),
(19, '2023-03-05 21:19:49.615538', '1', 'Stefannie Kyoi\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(20, '2023-03-05 21:20:18.912431', '1', 'Stefannie Kyoi\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(21, '2023-03-05 21:21:05.352309', '1', 'Stefannie Kyoi\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(22, '2023-03-05 21:24:04.833771', '1', 'Stefannie Kyoi\'s summary', 2, '[{\"changed\": {\"fields\": [\"Article\'s summary content\"]}}]', 11, 1),
(23, '2023-03-05 22:00:46.626950', '1', 'Stefannie Kyoi', 1, '[{\"added\": {}}]', 13, 1),
(24, '2023-03-05 22:10:06.260339', '2', 'Dark elves\'s summary', 1, '[{\"added\": {}}]', 11, 1),
(25, '2023-03-05 22:10:57.061201', '2', 'Dark elves', 1, '[{\"added\": {}}]', 13, 1),
(26, '2023-03-05 22:24:43.032589', '1', 'Personality: Stefannie Kyoi', 1, '[{\"added\": {}}]', 12, 1),
(27, '2023-03-06 21:58:26.007968', '5', 'Stealth Stefannie', 1, '[{\"added\": {}}]', 9, 1),
(28, '2023-03-06 21:58:39.614085', '1', 'Stefannie Kyoi', 2, '[{\"changed\": {\"fields\": [\"Article main image(s)\"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'articles', 'article'),
(8, 'articles', 'category'),
(9, 'articles', 'image'),
(13, 'articles', 'relatedarticles'),
(12, 'articles', 'section'),
(10, 'articles', 'sectiontype'),
(11, 'articles', 'summary'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(14, 'WebApp', 'contact');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'WebApp', '0001_initial', '2023-02-27 16:31:20.519363'),
(2, 'contenttypes', '0001_initial', '2023-02-27 16:31:21.070167'),
(3, 'auth', '0001_initial', '2023-02-27 16:31:29.029238'),
(4, 'admin', '0001_initial', '2023-02-27 16:31:31.278139'),
(5, 'admin', '0002_logentry_remove_auto_add', '2023-02-27 16:31:31.352046'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-27 16:31:31.453383'),
(7, 'articles', '0001_initial', '2023-02-27 16:31:45.883881'),
(8, 'contenttypes', '0002_remove_content_type_name', '2023-02-27 16:31:46.531596'),
(9, 'auth', '0002_alter_permission_name_max_length', '2023-02-27 16:31:47.336875'),
(10, 'auth', '0003_alter_user_email_max_length', '2023-02-27 16:31:47.493571'),
(11, 'auth', '0004_alter_user_username_opts', '2023-02-27 16:31:47.531605'),
(12, 'auth', '0005_alter_user_last_login_null', '2023-02-27 16:31:47.934559'),
(13, 'auth', '0006_require_contenttypes_0002', '2023-02-27 16:31:47.983685'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2023-02-27 16:31:48.037393'),
(15, 'auth', '0008_alter_user_username_max_length', '2023-02-27 16:31:48.165722'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2023-02-27 16:31:48.870739'),
(17, 'auth', '0010_alter_group_name_max_length', '2023-02-27 16:31:49.288819'),
(18, 'auth', '0011_update_proxy_permissions', '2023-02-27 16:31:49.321014'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2023-02-27 16:31:49.491703'),
(20, 'sessions', '0001_initial', '2023-02-27 16:31:49.889991'),
(21, 'articles', '0002_remove_relatedarticles_related_and_more', '2023-02-27 16:32:53.115776'),
(22, 'articles', '0003_initial', '2023-02-27 16:33:42.663710'),
(23, 'articles', '0004_alter_article_views', '2023-02-27 16:46:53.946327'),
(24, 'articles', '0005_alter_article_other_names', '2023-02-27 17:04:50.587814'),
(25, 'articles', '0006_alter_article_views', '2023-02-27 17:05:45.442232'),
(26, 'articles', '0007_remove_summary_summary_summary_content', '2023-03-05 21:19:23.514649'),
(27, 'articles', '0008_rename_articletype_section_sectiontype', '2023-03-06 21:07:16.965857');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('lyv9sqtvjb69vsb48fczdp02vv3x9015', '.eJxVjEEOgjAQRe_StWkobZmOS_ecoZnOjIIaSCisjHdXEha6_e-9_zKZtnXIW9Ulj2LOxpnT71aIHzrtQO403WbL87QuY7G7Yg9abT-LPi-H-3cwUB2-NSJ5lYjAAogSGqYGuQCmzgeNVBTa0iVghyGCiwwt-SAhOfVtuIp5fwDhcTeS:1pWgTt:1vYdSAl2c65cvQVTtWQuEKvsG1Rg7oVMjTdNb5F1rNk', '2023-03-13 16:36:05.060484');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `webapp_contact`
--

CREATE TABLE `webapp_contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articles_article`
--
ALTER TABLE `articles_article`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `articles_article_category`
--
ALTER TABLE `articles_article_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_article_category_article_id_category_id_7566d206_uniq` (`article_id`,`category_id`),
  ADD KEY `articles_article_cat_category_id_998f131e_fk_articles_` (`category_id`);

--
-- Indices de la tabla `articles_article_images`
--
ALTER TABLE `articles_article_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_article_images_article_id_image_id_a64d93f0_uniq` (`article_id`,`image_id`),
  ADD KEY `articles_article_images_image_id_8a24e451_fk_articles_image_id` (`image_id`);

--
-- Indices de la tabla `articles_category`
--
ALTER TABLE `articles_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `articles_image`
--
ALTER TABLE `articles_image`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `articles_relatedarticles`
--
ALTER TABLE `articles_relatedarticles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `articles_relatedarticles_related`
--
ALTER TABLE `articles_relatedarticles_related`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_relatedarticles_relatedarticles_id_artic_d60aa93c_uniq` (`relatedarticles_id`,`article_id`),
  ADD KEY `articles_relatedarti_article_id_bf815cf4_fk_articles_` (`article_id`);

--
-- Indices de la tabla `articles_section`
--
ALTER TABLE `articles_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_section_targetArticle_id_8c33ec9e_fk_articles_` (`targetArticle_id`),
  ADD KEY `articles_section_sectionType_id_ce36371b_fk_articles_` (`sectionType_id`);

--
-- Indices de la tabla `articles_sectiontype`
--
ALTER TABLE `articles_sectiontype`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `articles_section_images`
--
ALTER TABLE `articles_section_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_section_images_section_id_image_id_09001b15_uniq` (`section_id`,`image_id`),
  ADD KEY `articles_section_images_image_id_d9dd3e7a_fk_articles_image_id` (`image_id`);

--
-- Indices de la tabla `articles_summary`
--
ALTER TABLE `articles_summary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `article_id` (`article_id`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `webapp_contact`
--
ALTER TABLE `webapp_contact`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articles_article`
--
ALTER TABLE `articles_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `articles_article_category`
--
ALTER TABLE `articles_article_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `articles_article_images`
--
ALTER TABLE `articles_article_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `articles_category`
--
ALTER TABLE `articles_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `articles_image`
--
ALTER TABLE `articles_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `articles_relatedarticles`
--
ALTER TABLE `articles_relatedarticles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `articles_relatedarticles_related`
--
ALTER TABLE `articles_relatedarticles_related`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `articles_section`
--
ALTER TABLE `articles_section`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `articles_sectiontype`
--
ALTER TABLE `articles_sectiontype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `articles_section_images`
--
ALTER TABLE `articles_section_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `articles_summary`
--
ALTER TABLE `articles_summary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `webapp_contact`
--
ALTER TABLE `webapp_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articles_article_category`
--
ALTER TABLE `articles_article_category`
  ADD CONSTRAINT `articles_article_cat_article_id_5dd39dbe_fk_articles_` FOREIGN KEY (`article_id`) REFERENCES `articles_article` (`id`),
  ADD CONSTRAINT `articles_article_cat_category_id_998f131e_fk_articles_` FOREIGN KEY (`category_id`) REFERENCES `articles_category` (`id`);

--
-- Filtros para la tabla `articles_article_images`
--
ALTER TABLE `articles_article_images`
  ADD CONSTRAINT `articles_article_ima_article_id_0b6cb70f_fk_articles_` FOREIGN KEY (`article_id`) REFERENCES `articles_article` (`id`),
  ADD CONSTRAINT `articles_article_images_image_id_8a24e451_fk_articles_image_id` FOREIGN KEY (`image_id`) REFERENCES `articles_image` (`id`);

--
-- Filtros para la tabla `articles_relatedarticles_related`
--
ALTER TABLE `articles_relatedarticles_related`
  ADD CONSTRAINT `articles_relatedarti_article_id_bf815cf4_fk_articles_` FOREIGN KEY (`article_id`) REFERENCES `articles_article` (`id`),
  ADD CONSTRAINT `articles_relatedarti_relatedarticles_id_20158bde_fk_articles_` FOREIGN KEY (`relatedarticles_id`) REFERENCES `articles_relatedarticles` (`id`);

--
-- Filtros para la tabla `articles_section`
--
ALTER TABLE `articles_section`
  ADD CONSTRAINT `articles_section_sectionType_id_ce36371b_fk_articles_` FOREIGN KEY (`sectionType_id`) REFERENCES `articles_sectiontype` (`id`),
  ADD CONSTRAINT `articles_section_targetArticle_id_8c33ec9e_fk_articles_` FOREIGN KEY (`targetArticle_id`) REFERENCES `articles_article` (`id`);

--
-- Filtros para la tabla `articles_section_images`
--
ALTER TABLE `articles_section_images`
  ADD CONSTRAINT `articles_section_ima_section_id_8bba6a4a_fk_articles_` FOREIGN KEY (`section_id`) REFERENCES `articles_section` (`id`),
  ADD CONSTRAINT `articles_section_images_image_id_d9dd3e7a_fk_articles_image_id` FOREIGN KEY (`image_id`) REFERENCES `articles_image` (`id`);

--
-- Filtros para la tabla `articles_summary`
--
ALTER TABLE `articles_summary`
  ADD CONSTRAINT `articles_summary_article_id_09ebd80a_fk_articles_article_id` FOREIGN KEY (`article_id`) REFERENCES `articles_article` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
