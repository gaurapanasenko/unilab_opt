-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 14, 2019 at 08:44 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sem5dblab2`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `archive_deliveries` ()  NO SQL
BEGIN
  INSERT INTO `deliveries_zip` (`id`, `resource_id`, `delivery_date`) SELECT * FROM `deliveries` WHERE DATE(`delivery_date`) < DATE_SUB(CURDATE(), INTERVAL 1000 DAY);
  DELETE FROM `deliveries` WHERE DATE(`delivery_date`) < DATE_SUB(CURDATE(), INTERVAL 1000 DAY);
  OPTIMIZE TABLE `deliveries`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_deliveries` ()  NO SQL
BEGIN
  DECLARE i INT DEFAULT 0;
  SELECT @lid:=LAST_INSERT_ID();
  SET @seed = rand(round(rand(@lid)*4294967296))*36+1;
  CREATE TEMPORARY TABLE new_tbl ENGINE=MEMORY SELECT `resource_id`,`delivery_date` FROM `deliveries` LIMIT 0;
  WHILE i < 100000 DO
    INSERT IGNORE INTO new_tbl (`resource_id`,`delivery_date`) VALUES (
      round(rand(@seed:=round(rand(@seed)*4294967296))*15)+1,
      NOW() - INTERVAL round(rand(@seed:=round(rand(@seed)*4294967296))*100000) DAY
    );
    SET i = i + 1;
  END WHILE;
  INSERT IGNORE INTO `deliveries` (`resource_id`,`delivery_date`) SELECT * FROM new_tbl;
  DROP TABLE new_tbl;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `delivery_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries_zip`
--

CREATE TABLE `deliveries_zip` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `delivery_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci KEY_BLOCK_SIZE=4 ROW_FORMAT=COMPRESSED;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`id`, `name`) VALUES
(1, 'resource 1'),
(2, 'resource 2'),
(3, 'resource 3'),
(4, 'resource 4'),
(5, 'resource 5'),
(6, 'resource 6'),
(7, 'resource 7'),
(8, 'resource 8'),
(9, 'resource 9'),
(10, 'resource 10'),
(11, 'resource 11'),
(12, 'resource 12'),
(13, 'resource 13'),
(14, 'resource 14'),
(15, 'resource 15'),
(16, 'resource 16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`resource_id`);

--
-- Indexes for table `deliveries_zip`
--
ALTER TABLE `deliveries_zip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`resource_id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveries_zip`
--
ALTER TABLE `deliveries_zip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`);

--
-- Constraints for table `deliveries_zip`
--
ALTER TABLE `deliveries_zip`
  ADD CONSTRAINT `deliveries_zip_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
