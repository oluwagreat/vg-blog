-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2024 at 03:49 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vgblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `name`, `description`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'My new blog name', 'Alias eius laborum voluptates esse. Provident ut iste blanditiis officiis et. Corporis maiores natus ipsum atque blanditiis.', 'my-new-blog-name', '2024-11-01 22:43:58', '2024-11-02 00:14:21'),
(2, 'Sapiente voluptates vero.', 'Impedit et atque maiores et fugit neque. Et et numquam dolor praesentium. Nemo inventore ut sunt quas amet ex.', 'sapiente-voluptates-vero', '2024-11-01 22:43:59', '2024-11-01 22:43:59'),
(3, 'Exercitationem molestiae et.', 'Vel quasi laboriosam dolorem assumenda est sit repellat. Debitis nihil et eligendi vel placeat. Aut quibusdam sit aspernatur voluptas quo magni officia.', 'exercitationem-molestiae-et', '2024-11-01 22:43:59', '2024-11-01 22:43:59'),
(4, 'Maxime molestias et labore.', 'Cupiditate accusamus similique dolorum delectus. Ea placeat pariatur rem. Dolor inventore ea tempora fuga ducimus.', 'maxime-molestias-et-labore', '2024-11-01 22:43:59', '2024-11-01 22:43:59'),
(5, 'Veniam animi sit.', 'Voluptas dignissimos voluptatem voluptas est animi est ipsam. Totam repellat architecto placeat consequuntur est rerum. Fugiat beatae recusandae similique dolore.', 'veniam-animi-sit', '2024-11-01 22:43:59', '2024-11-01 22:43:59'),
(6, 'Laboriosam illum saepe sit.', 'Distinctio occaecati iste magnam qui odit consectetur est. Sint voluptatem ducimus hic natus. Est est illum minima totam iste dolore fugit.', 'laboriosam-illum-saepe-sit', '2024-11-01 22:43:59', '2024-11-01 22:43:59'),
(7, 'Quis quibusdam possimus.', 'Nisi rem iure qui soluta. Optio repellendus nesciunt sequi. Quis nesciunt nemo culpa rerum. Repudiandae deserunt eum consequatur eius. Non sit aspernatur ea mollitia quia provident iste.', 'quis-quibusdam-possimus', '2024-11-01 22:43:59', '2024-11-01 22:43:59'),
(8, 'Nesciunt magni qui.', 'Praesentium aut quisquam et laborum. Excepturi quia ut alias omnis non excepturi. Corporis et accusamus ratione cupiditate molestias tenetur.', 'nesciunt-magni-qui', '2024-11-01 22:43:59', '2024-11-01 22:43:59'),
(9, 'Dolore qui aspernatur.', 'Corrupti sit ut et. Maiores quo fugit voluptas aut enim quam. Est libero occaecati aspernatur quas est id iste id. Cumque voluptatem fugit quia ratione at quaerat repellat. Est ut tempora error.', 'dolore-qui-aspernatur', '2024-11-01 22:43:59', '2024-11-01 22:43:59'),
(10, 'Eius qui dignissimos quod.', 'Quidem rerum nihil ex voluptas. Odio expedita vitae pariatur. Possimus qui quasi ab itaque accusamus.', 'eius-qui-dignissimos-quod', '2024-11-01 22:43:59', '2024-11-01 22:43:59'),
(11, 'cumque ipsa rerum', 'aut', 'cumque-ipsa-rerum', '2024-11-01 22:53:41', '2024-11-01 22:53:41'),
(12, 'est aut quia', 'Voluptatem voluptatem ut nisi aliquid magni tempora a in. Fuga officiis dolor minus odit maxime quae deleniti. Repudiandae enim officiis reprehenderit non aspernatur nam. Et aut soluta perferendis commodi veritatis optio hic magni. Nihil quas repellendus at optio ea perspiciatis non minus voluptatum.', 'est-aut-quia', '2024-11-01 22:54:07', '2024-11-01 22:54:07');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'Eum atque sed fugit quis architecto accusantium.', '2024-11-02 01:30:09', '2024-11-02 01:30:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-11-02 01:31:23', '2024-11-02 01:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_url` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `content`, `image_url`, `status`, `blog_id`, `created_at`, `updated_at`) VALUES
(1, 'molestiae doloremque qui', 'molestiae-doloremque-qui', 'Doloribus voluptatum recusandae amet vel rem commodi iste. Quod et ea dolorum in assumenda dolores. Aut in natus. Quisquam debitis exercitationem quisquam. Labore commodi veritatis autem voluptatem dolor et maiores. Beatae cumque veritatis animi sit.\n \rFuga assumenda quos ea eum delectus temporibus ea. Earum ratione neque excepturi accusantium. Qui omnis nihil aut tempora impedit repudiandae cum molestias.\n \rOdit fugit incidunt odio totam accusamus asperiores ut et. Et natus vel velit. Sint sunt saepe eos. Ad fugit illum temporibus voluptates maxime non sint totam. Et animi aliquid sunt et consequatur. Soluta non ut assumenda itaque modi accusantium adipisci atque.', 'http://localhost:8000/public/post-images/molestiae-doloremque-qui-672587cce9821.jpg', 1, 1, '2024-11-01 23:34:47', '2024-11-02 01:00:44'),
(2, 'cum asperiores odio', 'cum-asperiores-odio', 'Officia provident cumque libero repudiandae omnis distinctio occaecati cum. Perspiciatis dolorum dicta nihil adipisci et. Qui blanditiis laborum veniam nemo. Laboriosam aliquid libero provident. Qui qui laudantium eaque. Voluptatibus ea voluptatem.\n \rVoluptatem non ut excepturi tempora. Doloremque voluptatem aut harum. Vel et ipsum aut reiciendis suscipit eligendi beatae earum saepe.\n \rAsperiores veniam autem architecto. Dolore ut quis dolores laboriosam voluptate atque aperiam. Officiis pariatur quam nisi magnam rerum et dolorum dolorem occaecati. Corrupti est ad tenetur nulla eum et aspernatur.', 'http://localhost:8000/public/post-images/cum-asperiores-odio-6725748b51bf7.jpg', 1, 1, '2024-11-01 23:38:35', '2024-11-01 23:38:35'),
(3, 'vel accusantium id', 'vel-accusantium-id', 'Sit numquam est culpa rerum accusamus nostrum sit. Et nostrum occaecati velit reiciendis fugiat eaque inventore. Expedita similique cum sed totam animi est corporis eligendi quasi. Recusandae et provident veniam corporis sint incidunt veniam at blanditiis. Voluptas sunt totam.\n \rQuisquam maiores voluptatibus. Est officiis omnis quae et. Nobis non consequatur tenetur impedit. Eum veritatis qui commodi necessitatibus qui eos. Ipsum dolores sapiente minus repudiandae maiores nisi nisi est temporibus.\n \rAccusantium odit maiores non minima sit officia voluptatem. Doloremque vel eaque exercitationem voluptatem qui est. Voluptatibus quas necessitatibus eligendi quo. Omnis rerum impedit autem.', NULL, 1, 1, '2024-11-01 23:58:23', '2024-11-01 23:58:23'),
(4, 'ut sed quasi', 'ut-sed-quasi', 'Alias hic pariatur nobis velit aut voluptas libero minus. Sit vel atque excepturi deleniti accusamus ratione doloremque iure. Sit expedita soluta blanditiis molestiae aut voluptates dolor quidem et. Et dolor non sapiente impedit et praesentium dolorem est. Aut numquam et.\n \rLibero esse expedita voluptatem aut vero. Ea consectetur aperiam rerum consequatur et cupiditate eos fuga cupiditate. Fugiat quis temporibus. Expedita pariatur ducimus odit.\n \rSit facilis velit culpa reprehenderit dignissimos ipsum quia. Eveniet saepe repudiandae et. Nemo incidunt officiis. Tenetur est quia fugit enim voluptatem enim ut aut.', NULL, 1, 1, '2024-11-01 23:58:29', '2024-11-01 23:58:29'),
(5, 'velit eaque et', 'velit-eaque-et', 'Corrupti suscipit minus quia aut omnis accusamus. Consequatur ipsam sunt architecto. Sequi architecto quia corporis dolor. Esse ut quisquam praesentium corporis aliquid voluptas accusantium aliquam.\n \rCupiditate vel et error omnis dolore tempore. Et a sunt sapiente aspernatur nihil eius ullam adipisci doloribus. Qui accusamus ex. Quasi qui consectetur omnis deserunt qui recusandae in laborum.\n \rUt sint animi nam id esse aspernatur autem blanditiis a. Deserunt commodi nihil. Assumenda accusamus quia culpa sit vel dolor et. Optio non eius eaque quae minima dignissimos non. Iusto beatae sit perspiciatis libero cum officiis inventore.', NULL, 1, 1, '2024-11-01 23:58:32', '2024-11-01 23:58:32'),
(6, 'voluptatem autem libero', 'voluptatem-autem-libero', 'Doloremque non consequatur nulla repudiandae. Adipisci corporis ex inventore dolor rerum facere fugiat ut ut. Aspernatur odio quia sit.\n \rQuibusdam maxime quasi mollitia ut et eius. Laboriosam saepe et adipisci ea. Itaque voluptatum recusandae quos ut est id. Earum sint nemo quas quia hic maiores veritatis corporis accusantium.\n \rFacere voluptatem in quod vitae. Veniam rerum dolor aut sunt ipsam occaecati. Esse omnis voluptas illo recusandae nulla. Voluptates aliquam excepturi enim perspiciatis error aliquam non aut. Quo perspiciatis illum aut qui dolores cumque autem eum aliquam. Autem ab sit ad rerum iure.', 'http://localhost:8000/public/post-images/voluptatem-autem-libero-6725793d50746.jpg', 1, 1, '2024-11-01 23:58:37', '2024-11-01 23:58:37');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `batch_id` char(36) NOT NULL,
  `family_hash` varchar(255) DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2024-11-02 01:30:03', '$2y$12$eLsbIIUZOxKHdLpuGeQiA.i/qS8H5gADDk3Xb8KK3YK41TTI53VWW', '4L9TRAvwum', '2024-11-02 01:30:03', '2024-11-02 01:30:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_name_unique` (`name`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_post_id_foreign` (`post_id`),
  ADD KEY `likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD PRIMARY KEY (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `telescope_monitoring`
--
ALTER TABLE `telescope_monitoring`
  ADD PRIMARY KEY (`tag`);

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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
