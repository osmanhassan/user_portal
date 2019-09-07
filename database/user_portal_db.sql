-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2019 at 01:24 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_portal_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(100) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cell_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(20) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `role_id` int(100) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `cell_phone`, `address`, `age`, `date_of_birth`, `role_id`, `password`, `created_at`) VALUES
(1, 'Bit', 'Mascot', 'admin@localhost.local', '', '', 0, '2019-09-02', 1, 'F/PZtTgA4k5q/9o6Jzik6w==', '2019-09-01 20:40:10'),
(31, 'Osman', 'Hassan', 'hassanmdosman@gmail.com', '+8801752458644', 'Dhaka', 24, '1995-02-10', 2, 'WL5WmOkB5u/m1JiMkJWZaA==', '2019-09-07 11:05:01'),
(32, 'Shikohor', 'Roy', 'shikhor@gmail.com', '+8801767558644', 'Pabna', 26, '1992-09-09', 2, 'hX6IEP57L8wxfMccIZMQgg==', '2019-09-07 11:07:40'),
(33, 'Nadim', 'Haque', 'nadim@gmail.com', '+8801552478644', 'Gazipur', 29, '1990-09-06', 2, 'JjapU6SZqzerwqpED9fZhg==', '2019-09-07 11:09:01'),
(34, 'Fatema', 'Farhana', 'fatema@gmail.com', '01778458644', 'Dhaka', 41, '1977-09-13', 2, 'HSo6C5eF403iyVwkI9Ml/w==', '2019-09-07 11:11:15'),
(35, 'Iqbal', 'Ahmed', 'iqbal@gmail.com', '+8801752657434', 'Dhaka', 41, '1977-09-13', 2, '94Y/xvL5YlOBzK81kIdqvg==', '2019-09-07 11:12:28'),
(36, 'Ishtiaq', 'Abir', 'istiaq@gamil.com', '+8801982458644', 'Dhaka', 33, '1986-05-08', 2, 'IXaQU7ogSQcTEXTodQfpEQ==', '2019-09-07 11:13:49'),
(37, 'Zubair', 'Hossain', 'zubair@gmail.com', '+8801974358644', 'Dhaka', 31, '1987-09-23', 2, '97ZCn/GzxO25JRakbxdycw==', '2019-09-07 11:15:05'),
(38, 'Anisul', 'Haque', 'anis@gmail.com', '+8801884458644', 'Dhaka', 53, '1966-09-01', 2, 'ZVcYZt7n9w2+P4Df5hsq+g==', '2019-09-07 11:17:48'),
(39, 'Rokon', 'Ahmed', 'rokon@gmail.com', '+8801852458644', 'Dhaka', 25, '1994-08-15', 2, '2AzW8iNMDNFAKpmNYw7m0w==', '2019-09-07 11:19:08'),
(40, 'Bushra ', 'Sarkar', 'bushra@gmail.com', '+8801943458644', 'Bogura', 15, '2003-09-11', 2, '+dtAqFIVZt+3XQIfKFHU2g==', '2019-09-07 11:20:04'),
(41, 'Jibon', 'Kanai', 'jibon@gmail.com', '+8801952448644', 'Dhaka', 22, '1996-09-18', 2, 'FIx+ELkMkgAxzJTM3L1rug==', '2019-09-07 11:21:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_role` (`role_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
