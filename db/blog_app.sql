-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 05, 2025 at 11:05 AM
-- Server version: 5.7.36
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Technology', 'technology', 1, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(2, 'Science', 'science', 1, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(3, 'Health', 'health', 1, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(4, 'Business', 'business', 1, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(5, 'Lifestyle', 'lifestyle', 1, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(6, 'Jitesh Gavel', 'jitesh-gavel', 4, NULL, '2025-04-05 05:20:38', '2025-04-05 05:20:38'),
(7, 'digital assets', 'digital-assets', 4, NULL, '2025-04-05 05:21:40', '2025-04-05 05:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_04_05_055214_create_categories_table', 1),
(6, '2025_04_05_055226_create_posts_table', 1),
(7, '2025_04_05_055236_create_tags_table', 1),
(8, '2025_04_05_055254_create_post__tags_table', 1),
(9, '2025_04_05_100135_add_user_id_to_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'auth_token', 'ca657595f4a3d3f2f17a63f688f66722219928f206515de0699c35e763013edd', '[\"*\"]', '2025-04-05 05:31:12', NULL, '2025-04-05 05:19:41', '2025-04-05 05:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_category_id_foreign` (`category_id`),
  KEY `posts_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `category_id`, `user_id`, `status`, `published_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'vnr digital assets', 'vnr-digital-assets', 'This is the content of post 1', 5, 3, 'approved', '2025-04-05 05:07:40', NULL, '2025-04-05 05:07:40', '2025-04-05 05:31:12'),
(2, 'Sample Post Title 2', 'sample-post-title-2', 'This is the content of post 2', 3, 2, 'approved', '2025-04-05 05:07:40', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(3, 'Sample Post Title 3', 'sample-post-title-3', 'This is the content of post 3', 1, 3, 'approved', '2025-04-05 05:07:40', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(4, 'Sample Post Title 4', 'sample-post-title-4', 'This is the content of post 4', 2, 3, 'approved', '2025-04-05 05:07:40', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(5, 'Sample Post Title 5', 'sample-post-title-5', 'This is the content of post 5', 2, 2, 'approved', '2025-04-05 05:07:40', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(6, 'Sample Post Title 6', 'sample-post-title-6', 'This is the content of post 6', 5, 2, 'approved', '2025-04-05 05:07:40', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(7, 'Sample Post Title 7', 'sample-post-title-7', 'This is the content of post 7', 5, 3, 'approved', '2025-04-05 05:07:40', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(8, 'Sample Post Title 8', 'sample-post-title-8', 'This is the content of post 8', 3, 3, 'approved', '2025-04-05 05:07:40', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(9, 'Sample Post Title 9', 'sample-post-title-9', 'This is the content of post 9', 2, 3, 'approved', '2025-04-05 05:07:40', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(10, 'Sample Post Title 10', 'sample-post-title-10', 'This is the content of post 10', 5, 2, 'approved', '2025-04-05 05:07:40', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE IF NOT EXISTS `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_post_id_foreign` (`post_id`),
  KEY `post_tag_tag_id_foreign` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(2, 1, 12, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(3, 1, 13, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(4, 2, 6, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(5, 2, 10, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(6, 2, 15, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(7, 3, 5, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(8, 3, 7, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(9, 3, 10, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(10, 3, 11, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(11, 4, 3, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(12, 4, 5, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(13, 4, 8, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(14, 4, 14, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(15, 4, 15, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(16, 5, 3, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(17, 5, 4, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(18, 5, 9, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(19, 5, 14, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(20, 6, 1, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(21, 6, 5, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(22, 6, 14, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(23, 6, 15, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(24, 7, 2, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(25, 7, 12, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(26, 7, 13, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(27, 7, 14, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(28, 8, 7, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(29, 8, 9, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(30, 8, 13, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(31, 9, 6, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(32, 9, 9, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(33, 10, 3, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(34, 10, 5, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(35, 10, 13, NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Laravel', 'laravel', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(2, 'PHP', 'php', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(3, 'JavaScript', 'javascript', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(4, 'VueJS', 'vuejs', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(5, 'React', 'react', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(6, 'MySQL', 'mysql', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(7, 'API', 'api', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(8, 'Backend', 'backend', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(9, 'Frontend', 'frontend', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(10, 'Web', 'web', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(11, 'Security', 'security', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(12, 'Testing', 'testing', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(13, 'DevOps', 'devops', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(14, 'Cloud', 'cloud', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(15, 'Docker', 'docker', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','author','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@example.com', 'admin', NULL, '$2y$12$ttlWz.ye0aQ2nNCZF2vqoOkoOIHUDUrOSyeA9gggeGlXQLoS4lG52', NULL, '2025-04-05 05:07:39', '2025-04-05 05:07:39'),
(2, 'Author One', 'author1@example.com', 'author', NULL, '$2y$12$gEFOh3c/slBhfBP40uRRj.t4YQrB3BOYPGiWeh559D9eCJlIiogTq', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(3, 'Author Two', 'author2@example.com', 'author', NULL, '$2y$12$3lzoKTe7lfBVi5tXvn4cc.jc2nRnCg.4aYxpegBeJzrCCzk0.ShOO', NULL, '2025-04-05 05:07:40', '2025-04-05 05:07:40'),
(4, 'Jitesh Gavel', 'Jitesh@example.com', 'admin', NULL, '$2y$12$.4AKcVEKU8dKNAiR6yfUu.DEI/4XzypDgdNq9yqKLrAWzjORcld1S', NULL, '2025-04-05 05:19:41', '2025-04-05 05:19:41');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
