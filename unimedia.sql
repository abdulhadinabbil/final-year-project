-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2024 at 05:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unimedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add bba', 7, 'add_bba'),
(26, 'Can change bba', 7, 'change_bba'),
(27, 'Can delete bba', 7, 'delete_bba'),
(28, 'Can view bba', 7, 'view_bba'),
(29, 'Can add bscincse', 8, 'add_bscincse'),
(30, 'Can change bscincse', 8, 'change_bscincse'),
(31, 'Can delete bscincse', 8, 'delete_bscincse'),
(32, 'Can view bscincse', 8, 'view_bscincse'),
(33, 'Can add bscineee', 9, 'add_bscineee'),
(34, 'Can change bscineee', 9, 'change_bscineee'),
(35, 'Can delete bscineee', 9, 'delete_bscineee'),
(36, 'Can view bscineee', 9, 'view_bscineee'),
(37, 'Can add bscinsoftware', 10, 'add_bscinsoftware'),
(38, 'Can change bscinsoftware', 10, 'change_bscinsoftware'),
(39, 'Can delete bscinsoftware', 10, 'delete_bscinsoftware'),
(40, 'Can view bscinsoftware', 10, 'view_bscinsoftware'),
(41, 'Can add bus schedule', 11, 'add_busschedule'),
(42, 'Can change bus schedule', 11, 'change_busschedule'),
(43, 'Can delete bus schedule', 11, 'delete_busschedule'),
(44, 'Can view bus schedule', 11, 'view_busschedule'),
(45, 'Can add contact', 12, 'add_contact'),
(46, 'Can change contact', 12, 'change_contact'),
(47, 'Can delete contact', 12, 'delete_contact'),
(48, 'Can view contact', 12, 'view_contact'),
(49, 'Can add department', 13, 'add_department'),
(50, 'Can change department', 13, 'change_department'),
(51, 'Can delete department', 13, 'delete_department'),
(52, 'Can view department', 13, 'view_department'),
(53, 'Can add news', 14, 'add_news'),
(54, 'Can change news', 14, 'change_news'),
(55, 'Can delete news', 14, 'delete_news'),
(56, 'Can view news', 14, 'view_news'),
(57, 'Can add notice', 15, 'add_notice'),
(58, 'Can change notice', 15, 'change_notice'),
(59, 'Can delete notice', 15, 'delete_notice'),
(60, 'Can view notice', 15, 'view_notice'),
(61, 'Can add result', 16, 'add_result'),
(62, 'Can change result', 16, 'change_result'),
(63, 'Can delete result', 16, 'delete_result'),
(64, 'Can view result', 16, 'view_result'),
(65, 'Can add faculty_ member', 17, 'add_faculty_member'),
(66, 'Can change faculty_ member', 17, 'change_faculty_member'),
(67, 'Can delete faculty_ member', 17, 'delete_faculty_member'),
(68, 'Can view faculty_ member', 17, 'view_faculty_member'),
(69, 'Can add cources', 18, 'add_cources'),
(70, 'Can change cources', 18, 'change_cources'),
(71, 'Can delete cources', 18, 'delete_cources'),
(72, 'Can view cources', 18, 'view_cources'),
(73, 'Can add cource', 18, 'add_cource'),
(74, 'Can change cource', 18, 'change_cource'),
(75, 'Can delete cource', 18, 'delete_cource'),
(76, 'Can view cource', 18, 'view_cource'),
(77, 'Can add course', 18, 'add_course'),
(78, 'Can change course', 18, 'change_course'),
(79, 'Can delete course', 18, 'delete_course'),
(80, 'Can view course', 18, 'view_course');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-10-18 13:37:28.221389', 'tasdid@gmail.com', 'tasdid@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Address\"]}}]', 6, 'tasdid@gmail.com'),
(2, '2024-10-18 13:37:46.283350', 'CSE', 'CSE', 1, '[{\"added\": {}}]', 13, 'tasdid@gmail.com'),
(3, '2024-10-18 13:37:49.257345', 'BBA', 'BBA', 1, '[{\"added\": {}}]', 13, 'tasdid@gmail.com'),
(4, '2024-10-18 13:37:51.691041', 'EEE', 'EEE', 1, '[{\"added\": {}}]', 13, 'tasdid@gmail.com'),
(5, '2024-10-18 13:37:53.626113', 'Software', 'Software', 1, '[{\"added\": {}}]', 13, 'tasdid@gmail.com'),
(6, '2024-10-18 15:12:27.437069', 'tasdidhasnain036@gmail.com', 'Result object (tasdidhasnain036@gmail.com)', 1, '[{\"added\": {}}]', 16, 'tasdid@gmail.com'),
(7, '2024-10-19 04:09:57.028875', '1', 'cource object (1)', 1, '[{\"added\": {}}]', 18, 'tasdid@gmail.com'),
(8, '2024-10-19 04:10:24.579400', '2', 'cource object (2)', 1, '[{\"added\": {}}]', 18, 'tasdid@gmail.com'),
(9, '2024-10-19 04:10:42.985593', 'tasdidhasnain036@gmail.com', 'Result object (tasdidhasnain036@gmail.com)', 2, '[{\"changed\": {\"fields\": [\"Cource\"]}}]', 16, 'tasdid@gmail.com'),
(10, '2024-10-19 04:11:45.407308', 'tasdidhasnain036@gmail.com', 'Result object (tasdidhasnain036@gmail.com)', 2, '[]', 16, 'tasdid@gmail.com'),
(11, '2024-10-19 04:12:44.851500', 'tasdidhasnain036@gmail.com', 'Result object (tasdidhasnain036@gmail.com)', 2, '[{\"changed\": {\"fields\": [\"Cource\"]}}]', 16, 'tasdid@gmail.com'),
(12, '2024-10-19 04:15:07.659772', 'milon@gmail.com', 'milon@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Address\", \"DepartmentName\", \"Batch\"]}}]', 6, 'tasdid@gmail.com'),
(13, '2024-10-19 04:17:22.387779', 'milon@gmail.com', 'Result object (milon@gmail.com)', 1, '[{\"added\": {}}]', 16, 'tasdid@gmail.com'),
(14, '2024-10-19 04:28:15.285880', '3', 'History of Emergence of Bangladesh', 1, '[{\"added\": {}}]', 18, 'tasdid@gmail.com'),
(15, '2024-10-19 04:28:25.908495', '4', 'Differential & Integral Calculus', 1, '[{\"added\": {}}]', 18, 'tasdid@gmail.com'),
(16, '2024-10-19 04:28:39.332404', '5', 'Structured Programming', 1, '[{\"added\": {}}]', 18, 'tasdid@gmail.com'),
(17, '2024-10-19 04:28:52.780217', '6', 'Structured Programming Lab', 1, '[{\"added\": {}}]', 18, 'tasdid@gmail.com'),
(18, '2024-10-19 04:29:01.191475', '7', 'GED-115 English - II', 1, '[{\"added\": {}}]', 18, 'tasdid@gmail.com'),
(19, '2024-10-19 04:29:10.555605', '8', 'Differential Equation & Laplace Transform', 1, '[{\"added\": {}}]', 18, 'tasdid@gmail.com'),
(20, '2024-10-19 04:29:21.043271', '9', 'Physics-I', 1, '[{\"added\": {}}]', 18, 'tasdid@gmail.com'),
(21, '2024-10-19 04:55:52.786937', 'milon@gmail.com', 'Result object (milon@gmail.com)', 3, '', 16, 'tasdid@gmail.com'),
(22, '2024-10-19 06:56:54.506414', '2', 'Result object (2)', 2, '[{\"changed\": {\"fields\": [\"Course\"]}}]', 16, 'tasdid@gmail.com'),
(23, '2024-10-19 06:56:58.564315', '1', 'Result object (1)', 2, '[{\"changed\": {\"fields\": [\"Course\"]}}]', 16, 'tasdid@gmail.com'),
(24, '2024-10-19 11:15:19.347488', '4', 'Result object (4)', 3, '', 16, 'tasdid@gmail.com'),
(25, '2024-10-19 11:15:23.294679', '3', 'Result object (3)', 3, '', 16, 'tasdid@gmail.com'),
(26, '2024-10-19 11:15:28.654346', '5', 'Result object (5)', 3, '', 16, 'tasdid@gmail.com'),
(27, '2024-10-19 13:40:23.207216', '6', 'Result object (6)', 3, '', 16, 'tasdid@gmail.com'),
(28, '2024-10-19 13:45:39.486162', '7', 'Result object (7)', 3, '', 16, 'tasdid@gmail.com'),
(29, '2024-10-19 15:37:29.609476', '8', 'Result object (8)', 2, '[]', 16, 'tasdid@gmail.com'),
(30, '2024-10-19 15:56:04.077999', '2', 'Result object (2)', 2, '[{\"changed\": {\"fields\": [\"Course\"]}}]', 16, 'tasdid@gmail.com'),
(31, '2024-10-19 16:43:47.009871', '7', 'English - II', 2, '[{\"changed\": {\"fields\": [\"Coursetitle\"]}}]', 18, 'tasdid@gmail.com'),
(32, '2024-10-20 04:25:06.203952', '10', 'Result object (10)', 1, '[{\"added\": {}}]', 16, 'tasdid@gmail.com'),
(33, '2024-10-20 05:40:59.180333', 'milon@gmail.com', 'milon@gmail.com', 2, '[{\"changed\": {\"fields\": [\"DepartmentName\"]}}]', 6, 'tasdid@gmail.com'),
(34, '2024-10-20 05:41:17.361874', 'milon@gmail.com', 'milon@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Batch\"]}}]', 6, 'tasdid@gmail.com'),
(35, '2024-10-20 05:41:56.174792', 'milon@gmail.com', 'milon@gmail.com', 2, '[{\"changed\": {\"fields\": [\"DepartmentName\", \"Batch\"]}}]', 6, 'tasdid@gmail.com'),
(36, '2024-10-20 09:02:47.158887', '11', 'Result object (11)', 3, '', 16, 'tasdid@gmail.com'),
(37, '2024-10-20 16:51:26.057998', '14', 'Result object (14)', 3, '', 16, 'tasdid@gmail.com'),
(38, '2024-10-20 16:51:26.073703', '13', 'Result object (13)', 3, '', 16, 'tasdid@gmail.com'),
(39, '2024-10-20 16:51:26.073703', '10', 'Result object (10)', 3, '', 16, 'tasdid@gmail.com'),
(40, '2024-10-21 02:50:54.109311', '10', 'English - I', 1, '[{\"added\": {}}]', 18, 'tasdid@gmail.com'),
(41, '2024-10-21 02:52:07.913819', '16', 'Result object (16)', 3, '', 16, 'tasdid@gmail.com'),
(42, '2024-10-21 02:52:07.915790', '15', 'Result object (15)', 3, '', 16, 'tasdid@gmail.com'),
(43, '2024-10-21 03:03:44.275819', '9', 'Physics-I', 2, '[{\"changed\": {\"fields\": [\"Department\"]}}]', 18, 'tasdid@gmail.com'),
(44, '2024-10-21 03:03:50.806458', '1', 'Microprocessor & Assembly Language Lab', 2, '[{\"changed\": {\"fields\": [\"Department\"]}}]', 18, 'tasdid@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'home', 'bba'),
(8, 'home', 'bscincse'),
(9, 'home', 'bscineee'),
(10, 'home', 'bscinsoftware'),
(11, 'home', 'busschedule'),
(12, 'home', 'contact'),
(18, 'home', 'course'),
(13, 'home', 'department'),
(17, 'home', 'faculty_member'),
(14, 'home', 'news'),
(15, 'home', 'notice'),
(16, 'home', 'result'),
(6, 'home', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-10-18 13:36:36.141722'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-10-18 13:36:36.165289'),
(3, 'auth', '0001_initial', '2024-10-18 13:36:36.269423'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-10-18 13:36:36.290213'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-10-18 13:36:36.297068'),
(6, 'auth', '0004_alter_user_username_opts', '2024-10-18 13:36:36.301012'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-10-18 13:36:36.306909'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-10-18 13:36:36.309902'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-10-18 13:36:36.315483'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-10-18 13:36:36.319711'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-10-18 13:36:36.324072'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-10-18 13:36:36.346152'),
(13, 'auth', '0011_update_proxy_permissions', '2024-10-18 13:36:36.347177'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-10-18 13:36:36.356048'),
(15, 'home', '0001_initial', '2024-10-18 13:36:36.591944'),
(16, 'admin', '0001_initial', '2024-10-18 13:36:36.663350'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-10-18 13:36:36.670493'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-18 13:36:36.681469'),
(19, 'sessions', '0001_initial', '2024-10-18 13:36:36.696632'),
(20, 'home', '0002_remove_result_courcecode_remove_result_courcetitle_and_more', '2024-10-19 04:08:30.059354'),
(21, 'home', '0003_rename_cources_cource', '2024-10-19 04:09:30.041394'),
(22, 'home', '0004_rename_cource_course_and_more', '2024-10-19 04:33:32.086474'),
(23, 'home', '0002_result', '2024-10-19 06:49:30.029804');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9l7tfm9xbapamtp1gy6xho22igxno3c0', '.eJxVzEsOgjAUheG9dGyaPik4Ms5dA7ntvUAVSkLLyLh3S8JAx-f7z5v1sJep3zNtfUR2ZQUyRryNC8SZh3Vhl1_iIbwoHQ6fkMa1ilS26PlB-Llm_liR5vtp_w4myFOtrUGrWqWE9oEG7xzUVjijScshaNeRb6V1IKnTTWPRCqmrIdMBKKMC-3wBBW09vw:1t1nAI:vuX0gTazwmtIxIdy7yjbAPt1liF0kZ0JxPNbbW8kuzc', '2024-11-01 13:37:14.945373');

-- --------------------------------------------------------

--
-- Table structure for table `home_bba`
--

CREATE TABLE `home_bba` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_bscincse`
--

CREATE TABLE `home_bscincse` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_bscineee`
--

CREATE TABLE `home_bscineee` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_bscinsoftware`
--

CREATE TABLE `home_bscinsoftware` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_busschedule`
--

CREATE TABLE `home_busschedule` (
  `id` bigint(20) NOT NULL,
  `route` varchar(255) NOT NULL,
  `arrival` time(6) DEFAULT NULL,
  `departure` time(6) DEFAULT NULL,
  `number_of_Bus` int(11) NOT NULL,
  `audience` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_contact`
--

CREATE TABLE `home_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_course`
--

CREATE TABLE `home_course` (
  `id` int(11) NOT NULL,
  `coursecode` varchar(8) NOT NULL,
  `coursetitle` varchar(300) NOT NULL,
  `department_id` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_course`
--

INSERT INTO `home_course` (`id`, `coursecode`, `coursetitle`, `department_id`) VALUES
(1, 'CSE-236', 'Microprocessor & Assembly Language Lab', 'Software'),
(2, 'GED-114', 'English I', 'CSE'),
(3, 'GED-202', 'History of Emergence of Bangladesh', 'CSE'),
(4, 'MAT-112', 'Differential & Integral Calculus', 'CSE'),
(5, 'CSE-121', 'Structured Programming', 'CSE'),
(6, 'CSE-122', 'Structured Programming Lab', 'CSE'),
(7, 'GED-115', 'English - II', 'CSE'),
(8, 'MAT-123', 'Differential Equation & Laplace Transform', 'CSE'),
(9, 'PHY-111', 'Physics-I', 'BBA'),
(10, 'GED-113', 'English - I', 'EEE');

-- --------------------------------------------------------

--
-- Table structure for table `home_department`
--

CREATE TABLE `home_department` (
  `Department_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_department`
--

INSERT INTO `home_department` (`Department_name`) VALUES
('BBA'),
('CSE'),
('EEE'),
('Software');

-- --------------------------------------------------------

--
-- Table structure for table `home_faculty_member`
--

CREATE TABLE `home_faculty_member` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `designation` varchar(300) NOT NULL,
  `department_id` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_news`
--

CREATE TABLE `home_news` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_notice`
--

CREATE TABLE `home_notice` (
  `id` int(11) NOT NULL,
  `title` varchar(1000) NOT NULL,
  `date` date NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_result`
--

CREATE TABLE `home_result` (
  `id` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `credit` double NOT NULL,
  `letterGrade` varchar(20) NOT NULL,
  `GradePoint` double NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_result`
--

INSERT INTO `home_result` (`id`, `status`, `credit`, `letterGrade`, `GradePoint`, `course_id`, `student_id`) VALUES
(1, 'Regular', 1.5, 'A+', 4, 1, 'tasdidhasnain036@gmail.com'),
(2, 'Regular', 3, 'A+', 4, 4, 'tasdidhasnain036@gmail.com'),
(8, 'Regular', 3, 'A+', 4, 3, 'tasdidhasnain036@gmail.com'),
(9, 'Regular', 3, 'A+', 4, 8, 'tasdidhasnain036@gmail.com'),
(12, 'Regular', 3, 'A+', 4, 7, 'tasdidhasnain036@gmail.com'),
(17, 'Regular', 3, 'A+', 4, 10, 'milon@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `home_user`
--

CREATE TABLE `home_user` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_Number` varchar(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `studentID` varchar(11) DEFAULT NULL,
  `Bio` longtext NOT NULL,
  `batch` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `departmentName_id` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_user`
--

INSERT INTO `home_user` (`password`, `last_login`, `is_superuser`, `email`, `image`, `name`, `phone_Number`, `address`, `studentID`, `Bio`, `batch`, `is_active`, `is_admin`, `create_date`, `update_date`, `departmentName_id`) VALUES
('pbkdf2_sha256$600000$AvF80CmCEgMmrykYX8FfwL$Vfi6dEOYGKqX6gJuv8D7r7Otqb1pALu900yrf3Yl8+8=', NULL, 0, 'milon@gmail.com', 'media/userimage/team_yOX4qtx.jpg', 'Milon', '01613961561', 'Sylhet', '201-115-101', '', '5th', 1, 0, '2024-10-19 04:14:32.022680', '2024-10-20 05:41:56.174792', 'EEE'),
('pbkdf2_sha256$600000$TT6U5JvqezgHXZNQksd3GA$bvs+EwcY+mMrCmK+UuK4kTLREOkiE/X8xGSq+91kHoQ=', '2024-10-18 13:37:14.945373', 0, 'tasdid@gmail.com', 'media/userimage/team_BsyaWoB.jpg', 'Tasdid', '01709882474', 'Sylhet', NULL, '', '', 1, 1, '2024-10-18 13:37:02.341410', '2024-10-18 13:38:14.281956', NULL),
('pbkdf2_sha256$600000$8KaM5M9JX7g4E8EA6E8baX$G8z5jtY6iS0Y7It+hiCuiWV2jMSUzdT+JJbwiIVjI/A=', NULL, 0, 'tasdidhasnain036@gmail.com', 'media/userimage/team_W7NUixa.jpg', 'Tasdid Hasnain', '01709882474', 'Sylhet', '201-115-133', '', '50th', 1, 0, '2024-10-18 13:42:57.619501', '2024-10-18 14:10:05.173646', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `home_user_groups`
--

CREATE TABLE `home_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_user_user_permissions`
--

CREATE TABLE `home_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_home_user_email` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `home_bba`
--
ALTER TABLE `home_bba`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_bscincse`
--
ALTER TABLE `home_bscincse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_bscineee`
--
ALTER TABLE `home_bscineee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_bscinsoftware`
--
ALTER TABLE `home_bscinsoftware`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_busschedule`
--
ALTER TABLE `home_busschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_contact`
--
ALTER TABLE `home_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_course`
--
ALTER TABLE `home_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courcecode` (`coursecode`),
  ADD UNIQUE KEY `courcetitle` (`coursetitle`),
  ADD KEY `home_cources_department_id_9e4448ee_fk_home_depa` (`department_id`);

--
-- Indexes for table `home_department`
--
ALTER TABLE `home_department`
  ADD PRIMARY KEY (`Department_name`);

--
-- Indexes for table `home_faculty_member`
--
ALTER TABLE `home_faculty_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_faculty_member_department_id_e87e652c_fk_home_depa` (`department_id`);

--
-- Indexes for table `home_news`
--
ALTER TABLE `home_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_notice`
--
ALTER TABLE `home_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_result`
--
ALTER TABLE `home_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_result_course_id_a530efae_fk_home_course_id` (`course_id`),
  ADD KEY `home_result_student_id_0f13249f_fk_home_user_email` (`student_id`);

--
-- Indexes for table `home_user`
--
ALTER TABLE `home_user`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `studentID` (`studentID`),
  ADD KEY `home_user_departmentName_id_f5520f0d_fk_home_depa` (`departmentName_id`);

--
-- Indexes for table `home_user_groups`
--
ALTER TABLE `home_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_user_groups_user_id_group_id_b0f141dd_uniq` (`user_id`,`group_id`),
  ADD KEY `home_user_groups_group_id_87aa9e3d_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `home_user_user_permissions`
--
ALTER TABLE `home_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_user_user_permissions_user_id_permission_id_98b37912_uniq` (`user_id`,`permission_id`),
  ADD KEY `home_user_user_permi_permission_id_ccfbb3e4_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `home_bba`
--
ALTER TABLE `home_bba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_bscincse`
--
ALTER TABLE `home_bscincse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_bscineee`
--
ALTER TABLE `home_bscineee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_bscinsoftware`
--
ALTER TABLE `home_bscinsoftware`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_busschedule`
--
ALTER TABLE `home_busschedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_contact`
--
ALTER TABLE `home_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_course`
--
ALTER TABLE `home_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `home_faculty_member`
--
ALTER TABLE `home_faculty_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_news`
--
ALTER TABLE `home_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_notice`
--
ALTER TABLE `home_notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_result`
--
ALTER TABLE `home_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `home_user_groups`
--
ALTER TABLE `home_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_user_user_permissions`
--
ALTER TABLE `home_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_home_user_email` FOREIGN KEY (`user_id`) REFERENCES `home_user` (`email`);

--
-- Constraints for table `home_course`
--
ALTER TABLE `home_course`
  ADD CONSTRAINT `home_cources_department_id_9e4448ee_fk_home_depa` FOREIGN KEY (`department_id`) REFERENCES `home_department` (`Department_name`);

--
-- Constraints for table `home_faculty_member`
--
ALTER TABLE `home_faculty_member`
  ADD CONSTRAINT `home_faculty_member_department_id_e87e652c_fk_home_depa` FOREIGN KEY (`department_id`) REFERENCES `home_department` (`Department_name`);

--
-- Constraints for table `home_result`
--
ALTER TABLE `home_result`
  ADD CONSTRAINT `home_result_course_id_a530efae_fk_home_course_id` FOREIGN KEY (`course_id`) REFERENCES `home_course` (`id`),
  ADD CONSTRAINT `home_result_student_id_0f13249f_fk_home_user_email` FOREIGN KEY (`student_id`) REFERENCES `home_user` (`email`);

--
-- Constraints for table `home_user`
--
ALTER TABLE `home_user`
  ADD CONSTRAINT `home_user_departmentName_id_f5520f0d_fk_home_depa` FOREIGN KEY (`departmentName_id`) REFERENCES `home_department` (`Department_name`);

--
-- Constraints for table `home_user_groups`
--
ALTER TABLE `home_user_groups`
  ADD CONSTRAINT `home_user_groups_group_id_87aa9e3d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `home_user_groups_user_id_28bf3710_fk_home_user_email` FOREIGN KEY (`user_id`) REFERENCES `home_user` (`email`);

--
-- Constraints for table `home_user_user_permissions`
--
ALTER TABLE `home_user_user_permissions`
  ADD CONSTRAINT `home_user_user_permi_permission_id_ccfbb3e4_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `home_user_user_permissions_user_id_28c4b0a2_fk_home_user_email` FOREIGN KEY (`user_id`) REFERENCES `home_user` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
