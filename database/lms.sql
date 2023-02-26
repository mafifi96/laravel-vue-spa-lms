-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 26, 2023 at 02:57 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'learn php 8 for beginners', '2023-352944', 'Harum ex amet sed tempora ipsa corrupti in. Voluptatem magnam ullam aliquid aut est sint ut. Ratione consequatur eaque amet.', '2023-02-22 17:06:27', '2023-02-24 11:16:56'),
(2, 'learn laravel 10x from scratch', '2023-135632', 'Alias commodi cumque omnis ipsam. Laborum et nostrum sunt praesentium adipisci. Quod ullam laborum quia et. Quod iure non voluptas dolorem suscipit quam nobis. Nemo numquam dignissimos aut consequatur dolorem est blanditiis.', '2023-02-22 17:06:27', '2023-02-24 17:58:35'),
(3, 'learn vuejs', '2023-166820', 'Omnis itaque nihil eum repudiandae quia. Nisi porro eveniet quae et blanditiis. Distinctio laboriosam impedit facere mollitia.', '2023-02-22 17:06:27', '2023-02-22 17:06:27'),
(4, 'learn javascript', '2023-550351', 'Sit sint pariatur et unde. Blanditiis perferendis omnis aperiam consectetur ut. Facere veniam est iusto optio dolore pariatur. Est cupiditate asperiores sit laborum. Quo et quia maxime eaque vitae alias.', '2023-02-22 17:06:27', '2023-02-22 17:06:27'),
(5, 'learn mongoDB', '2023-679762', 'Est aut aut repellat ex. Quod a ea voluptatem qui. Qui enim nihil voluptatum id ut aperiam. Ut sit temporibus voluptates est aspernatur laudantium. Et quia non qui dicta.', '2023-02-22 17:06:27', '2023-02-22 17:06:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maxDegree` tinyint(3) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `name`, `maxDegree`, `course_id`, `created_at`, `updated_at`) VALUES
(32, 'quize', 10, 1, '2023-02-24 16:58:20', '2023-02-24 17:53:51'),
(33, 'midterm', 50, 1, '2023-02-24 16:58:20', '2023-02-24 17:53:51'),
(34, 'final', 100, 1, '2023-02-24 17:53:01', '2023-02-24 17:53:51'),
(35, 'quize', 20, 2, '2023-02-24 17:58:35', '2023-02-24 17:58:35'),
(36, 'task', 20, 2, '2023-02-24 17:58:35', '2023-02-24 17:58:35'),
(37, 'final', 60, 2, '2023-02-24 17:58:35', '2023-02-24 17:58:35'),
(38, 'quize', 10, 3, '2023-02-24 22:51:58', '2023-02-24 22:51:58'),
(39, 'midterm', 50, 3, '2023-02-24 22:51:58', '2023-02-24 22:51:58'),
(40, 'final', 100, 3, '2023-02-24 22:51:58', '2023-02-24 22:51:58'),
(41, 'quize', 20, 4, '2023-02-25 22:02:16', '2023-02-25 22:02:16'),
(42, 'midterm', 50, 4, '2023-02-25 22:02:16', '2023-02-25 22:02:16'),
(43, 'final', 100, 4, '2023-02-25 22:02:16', '2023-02-25 22:02:16');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `code`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, '2023-802798', 'level 1', 'Porro pariatur voluptate ullam eos. A natus nihil suscipit dolor qui ullam qui incidunt. Nihil temporibus quia itaque neque sit. Aperiam molestiae veniam minima vel nihil et.', '2023-02-22 17:06:27', '2023-02-22 17:06:27'),
(2, '2023-278655', 'level 2', 'Laboriosam quis minus soluta repellat consequatur. Nihil et dolor quis quis veritatis. In magnam dolor nemo aut est.', '2023-02-22 17:06:27', '2023-02-22 17:06:27'),
(3, '2023-900618', 'level 3', 'Non sit eligendi odit et. Qui fugit nisi assumenda.', '2023-02-22 17:06:27', '2023-02-22 17:06:27'),
(4, '2023-594899', 'level 4', 'Consectetur quidem sint aut eum labore esse optio. Alias voluptas repellendus delectus est sint. Hic nisi quia ad veritatis.', '2023-02-22 17:06:27', '2023-02-22 17:06:27'),
(5, '2023-242706', 'level 5', 'level 5 description for top studentslevel 5 description for top studentslevel 5 description for top studentslevel 5 description for top studentslevel 5', '2023-02-25 23:39:55', '2023-02-25 23:56:26');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_02_22_084357_create_levels_table', 1),
(5, '2023_02_22_084715_create_courses_table', 1),
(6, '2023_02_22_085024_create_grades_table', 1),
(7, '2023_02_22_085041_create_students_table', 1),
(8, '2023_02_22_085112_create_students_courses_table', 1),
(9, '2023_02_22_095651_create_students_grades_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 2),
(11, '2023_02_23_215953_create_cylce_table', 3);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'Token', '14540a000a879f91fc0ce808da6a893e9da7e47c6a137a88b2ca51d62d4f100e', '[\"*\"]', '2023-02-23 09:08:16', NULL, '2023-02-23 08:09:52', '2023-02-23 09:08:16'),
(2, 'App\\Models\\User', 1, 'Token', 'bf03ac0d25d197bafd048ac8c752a4bac537875f0b0ca12ed7f1b6885465891e', '[\"*\"]', NULL, NULL, '2023-02-23 21:59:21', '2023-02-23 21:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date NOT NULL,
  `level_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `code`, `name`, `email`, `birth`, `level_id`, `created_at`, `updated_at`) VALUES
(1, '2023-200822', 'Felipe Ryan', 'devyn.larson@example.org', '2006-03-13', 2, '2023-02-22 17:06:28', '2023-02-25 23:21:50'),
(2, '2023-935706', 'Trace Schulist', 'beahan.jerald@example.com', '1973-02-04', 2, '2023-02-22 17:06:28', '2023-02-22 17:06:28'),
(3, '2023-759039', 'Joyce Kuphal', 'jess.abernathy@example.org', '1983-02-15', 3, '2023-02-22 17:06:28', '2023-02-22 17:06:28'),
(4, '2023-463687', 'Milo Murray III', 'dsipes@example.net', '2004-08-22', 4, '2023-02-22 17:06:28', '2023-02-22 17:06:28'),
(6, '2023-843499', 'Mohamed Afifi', 'm@a.com', '2023-02-23', 1, '2023-02-24 19:06:00', '2023-02-24 19:06:00'),
(7, '2023-710025', 'Ahmed Ali', 'a@a.com', '2023-02-16', 1, '2023-02-24 19:08:03', '2023-02-24 19:08:03'),
(9, '2023-583888', 'Ahmed Ali', 'a@aa.com', '2023-02-16', 2, '2023-02-24 19:23:23', '2023-02-24 19:23:23'),
(12, '2023-477554', 'Ali Sayed', 'ali@gmail.com', '2023-02-01', 2, '2023-02-25 21:29:48', '2023-02-25 21:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `students_courses`
--

CREATE TABLE `students_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students_courses`
--

INSERT INTO `students_courses` (`id`, `student_id`, `course_id`, `created_at`, `updated_at`) VALUES
(50, 6, 3, '2023-02-25 18:14:59', '2023-02-25 18:14:59'),
(51, 1, 3, '2023-02-25 18:15:07', '2023-02-25 18:15:07'),
(52, 3, 3, '2023-02-25 18:15:17', '2023-02-25 18:15:17'),
(53, 2, 3, '2023-02-25 18:15:33', '2023-02-25 18:15:33'),
(54, 12, 3, '2023-02-25 21:52:41', '2023-02-25 21:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `students_grades`
--

CREATE TABLE `students_grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `grade_id` bigint(20) UNSIGNED NOT NULL,
  `degree` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students_grades`
--

INSERT INTO `students_grades` (`id`, `student_id`, `grade_id`, `degree`, `created_at`, `updated_at`) VALUES
(96, 1, 38, 9, '2023-02-24 23:37:06', '2023-02-25 15:03:17'),
(97, 1, 39, 49, '2023-02-24 23:37:06', '2023-02-25 15:03:17'),
(98, 1, 40, 99, '2023-02-24 23:37:06', '2023-02-25 15:03:17'),
(99, 3, 38, 8, '2023-02-25 00:28:53', '2023-02-25 00:28:53'),
(100, 3, 39, 45, '2023-02-25 00:28:53', '2023-02-25 00:28:53'),
(101, 3, 40, 90, '2023-02-25 00:28:53', '2023-02-25 00:28:53'),
(102, 2, 38, 10, '2023-02-25 09:17:34', '2023-02-25 09:17:34'),
(103, 2, 39, 40, '2023-02-25 09:17:34', '2023-02-25 09:17:34'),
(104, 2, 40, 90, '2023-02-25 09:17:34', '2023-02-25 09:17:34'),
(105, 6, 38, 10, '2023-02-25 15:33:57', '2023-02-25 15:33:57'),
(106, 6, 39, 20, '2023-02-25 15:33:58', '2023-02-25 15:33:58'),
(107, 6, 40, 80, '2023-02-25 15:33:58', '2023-02-25 15:33:58'),
(108, 12, 38, 10, '2023-02-25 21:52:48', '2023-02-25 21:52:48'),
(109, 12, 39, 50, '2023-02-25 21:52:49', '2023-02-25 21:52:49'),
(110, 12, 40, 100, '2023-02-25 21:52:49', '2023-02-25 21:52:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courses_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grades_course_id_foreign` (`course_id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `levels_code_unique` (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD KEY `students_level_id_foreign` (`level_id`);

--
-- Indexes for table `students_courses`
--
ALTER TABLE `students_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_courses_student_id_foreign` (`student_id`),
  ADD KEY `students_courses_course_id_foreign` (`course_id`);

--
-- Indexes for table `students_grades`
--
ALTER TABLE `students_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_grades_student_id_foreign` (`student_id`),
  ADD KEY `students_grades_grade_id_foreign` (`grade_id`);

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
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `students_courses`
--
ALTER TABLE `students_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `students_grades`
--
ALTER TABLE `students_grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `students_courses`
--
ALTER TABLE `students_courses`
  ADD CONSTRAINT `students_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `students_courses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students_grades`
--
ALTER TABLE `students_grades`
  ADD CONSTRAINT `students_grades_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `students_grades_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
