-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 12, 2019 at 06:51 PM
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `archive_sellings` ()  NO SQL
BEGIN
  INSERT INTO `sellings_zip` (`id`, `car_id`, `selling_date`) SELECT * FROM `sellings` WHERE DATE(`selling_date`) < DATE_SUB(CURDATE(), INTERVAL 1000 DAY);
  DELETE FROM `sellings` WHERE DATE(`selling_date`) < DATE_SUB(CURDATE(), INTERVAL 1000 DAY);
  OPTIMIZE TABLE `sellings`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_sellings` ()  NO SQL
BEGIN
  DECLARE i INT DEFAULT 0;
  SELECT @lid:=LAST_INSERT_ID();
  SET @seed = rand(round(rand(@lid)*4294967296))*36+1;
  CREATE TEMPORARY TABLE new_tbl ENGINE=MEMORY SELECT `car_id`,`selling_date` FROM `sellings` LIMIT 0;
  WHILE i < 100000 DO
    INSERT IGNORE INTO new_tbl (`car_id`,`selling_date`) VALUES (
      round(rand(@seed:=round(rand(@seed)*4294967296))*15)+1,
      NOW() - INTERVAL round(rand(@seed:=round(rand(@seed)*4294967296))*100000) DAY
    );
    SET i = i + 1;
  END WHILE;
  INSERT IGNORE INTO `sellings` (`car_id`,`selling_date`) SELECT * FROM new_tbl;
  DROP TABLE new_tbl;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`id`, `name`) VALUES
(1, 'car 1'),
(2, 'car 2'),
(3, 'car 3'),
(4, 'car 4'),
(5, 'car 5'),
(6, 'car 6'),
(7, 'car 7'),
(8, 'car 8'),
(9, 'car 9'),
(10, 'car 10'),
(11, 'car 11'),
(12, 'car 12'),
(13, 'car 13'),
(14, 'car 14'),
(15, 'car 15'),
(16, 'car 16');

-- --------------------------------------------------------

--
-- Table structure for table `sellings`
--

CREATE TABLE `sellings` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `selling_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellings_zip`
--

CREATE TABLE `sellings_zip` (
  `id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `selling_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci KEY_BLOCK_SIZE=4 ROW_FORMAT=COMPRESSED;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellings`
--
ALTER TABLE `sellings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`car_id`);

--
-- Indexes for table `sellings_zip`
--
ALTER TABLE `sellings_zip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`car_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sellings`
--
ALTER TABLE `sellings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sellings_zip`
--
ALTER TABLE `sellings_zip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sellings`
--
ALTER TABLE `sellings`
  ADD CONSTRAINT `sellings_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`);

--
-- Constraints for table `sellings_zip`
--
ALTER TABLE `sellings_zip`
  ADD CONSTRAINT `sellings_zip_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
