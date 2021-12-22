-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 13, 2019 at 04:39 PM
-- Server version: 10.1.37-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `person_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 22);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `year` year(4) NOT NULL,
  `isbn` bigint(20) DEFAULT NULL,
  `publisher_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `year`, `isbn`, `publisher_id`, `language_id`) VALUES
(1, 'Сборник задач и упражнений по математическому анализу', 1997, 9785211036451, 1, 1),
(2, 'Математический анализ', 2004, 9789668408441, 4, 1),
(3, 'Основы математического анализа', 2005, 9785922105361, 3, 1),
(4, 'Курс математического анализа', 1981, NULL, 2, 1),
(5, 'Язык программирования C++. Специальное издание', 2017, 9785951804259, 5, 1),
(6, 'C/C++ и MS Visual C++ 2010 для начинающих', 2011, 9785977505994, 6, 1),
(7, 'Язык программирования C. Лекции и упражнения', 2006, 9785845919502, 7, 1),
(8, 'Структуры и алгоритмы обработки данных: Примеры на языке Си', 2004, 9785279027750, 8, 1),
(9, 'C++. Базовый курс', 2010, 9785845907684, 7, 1),
(10, 'Основи чисельних методів', 2009, 9789665512943, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `book_author`
--

CREATE TABLE `book_author` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book_author`
--

INSERT INTO `book_author` (`id`, `book_id`, `author_id`) VALUES
(4, 1, 1),
(5, 2, 2),
(2, 3, 3),
(3, 3, 4),
(1, 4, 5),
(6, 5, 6),
(7, 6, 7),
(8, 7, 8),
(9, 8, 9),
(10, 9, 10),
(11, 10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`) VALUES
(1, 'ПА-17-1');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`) VALUES
(1, 'Русский'),
(2, 'Украинский');

-- --------------------------------------------------------

--
-- Table structure for table `librarians`
--

CREATE TABLE `librarians` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `librarians`
--

INSERT INTO `librarians` (`id`, `person_id`) VALUES
(1, 12),
(2, 13),
(3, 14),
(4, 15),
(5, 16),
(6, 17),
(7, 18),
(8, 19),
(9, 20),
(10, 21);

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `id` int(11) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `middle_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`id`, `last_name`, `first_name`, `middle_name`) VALUES
(1, 'Демидович', 'Борис', 'Павлович'),
(2, 'Дороговцев', 'Анатолий', 'Яковлевич'),
(3, 'Ильин', 'Владимир', 'Александрович'),
(4, 'Позняк', 'Эдуард', 'Генрихович'),
(5, 'Кудрявцев', 'Лев', 'Дмитриевич'),
(6, 'Страуструп', 'Бьёрн', ''),
(7, 'Пахомов', 'Б.', ''),
(8, 'Прата', 'Стивен', ''),
(9, 'Хусаинов', 'Б.', 'С.'),
(10, 'Шилдт', 'Герберт', ''),
(11, 'Панасенко', 'Егор', 'Сергеевич'),
(12, 'Лебедев', 'Азарий', 'Вениаминович'),
(13, 'Фадеев', 'Василий', 'Русланович'),
(14, 'Беляков', 'Аркадий', 'Евсеевич'),
(15, 'Маслов', 'Пантелей', 'Иосифович'),
(16, 'Голубев', 'Глеб', 'Демьянович'),
(17, 'Щукин', 'Богдан', 'Гордеевич'),
(18, 'Быков', 'Мирон', 'Денисович'),
(19, 'Егоров', 'Мечислав', 'Антонович'),
(20, 'Соколов', 'Виссарион', 'Иринеевич'),
(21, 'Ефремов', 'Терентий', 'Юрьевич'),
(22, 'Бойко', 'Лидия', 'Трофимовна'),
(23, 'Верба', 'Ольга', 'Витальевна'),
(24, 'Гук', 'Наталья', 'Анатольевна'),
(25, 'Дзюба', 'Петр', 'Анатольевич'),
(26, 'Казакова', 'Наталья', 'Леонидовна'),
(27, 'Коломоец', 'Елена', 'Юрьевна'),
(28, 'Конарева', 'Светлана', 'Викторовна'),
(29, 'Синкевич', 'Наталья', 'Михайловна'),
(30, 'Сирик', 'Светлана', 'Федоровна'),
(31, 'Степанова', 'Наталья', 'Ивановна'),
(32, 'Ткаченко', 'Марина', 'Евгеньевна'),
(33, 'Алексеев', 'Николай', 'Андреевич'),
(34, 'Багратян', 'Артур', 'Геворкович'),
(35, 'Бойко', 'Виталий', 'Владимирович'),
(36, 'Володарець', 'Николай', 'Васильевич'),
(37, 'Киселева', 'Маргарита', 'Алексеевна'),
(38, 'Коска', 'Максим', 'Владимирович'),
(39, 'Крыгин', 'Михаил', 'Олегович'),
(40, 'Крылова', 'Маргарита', 'Вячеславовна'),
(41, 'Кулацкий', 'Глеб', 'Николаевич'),
(42, 'Махно', 'Артур', 'Вадимович');

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE `publishers` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`id`, `name`) VALUES
(1, 'ЧеРо'),
(2, 'Высшая школа'),
(3, 'Физико-математическая литература'),
(4, 'Факт'),
(5, 'Бином'),
(6, 'БХВ-Петербург'),
(7, 'Вильямс'),
(8, 'Финансы и статистика'),
(9, 'ДНУ');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `person_id`, `group_id`) VALUES
(1, 11, 1),
(13, 33, 1),
(14, 34, 1),
(15, 35, 1),
(16, 36, 1),
(17, 37, 1),
(18, 38, 1),
(19, 39, 1),
(20, 40, 1),
(21, 41, 1),
(22, 42, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_cards`
--

CREATE TABLE `student_cards` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `librarian_id` int(11) NOT NULL,
  `take_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_cards`
--

INSERT INTO `student_cards` (`id`, `book_id`, `student_id`, `librarian_id`, `take_date`, `return_date`) VALUES
(1, 2, 1, 2, '2019-02-10 10:17:11', NULL),
(38, 3, 15, 9, '2019-02-13 14:36:39', NULL),
(39, 3, 20, 5, '2019-02-13 14:36:39', NULL),
(40, 2, 14, 5, '2019-02-13 14:36:39', NULL),
(41, 3, 17, 6, '2019-02-13 14:36:39', NULL),
(42, 4, 1, 9, '2019-02-13 14:36:39', NULL),
(43, 6, 20, 5, '2019-02-13 14:36:39', NULL),
(44, 3, 19, 8, '2019-02-13 14:36:39', NULL),
(45, 8, 21, 5, '2019-02-13 14:36:39', NULL),
(46, 3, 18, 5, '2019-02-13 14:36:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `person_id`) VALUES
(1, 22),
(2, 23),
(3, 24),
(4, 25),
(5, 26),
(6, 27),
(7, 28),
(8, 29),
(9, 30),
(10, 31),
(11, 32);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_cards`
--

CREATE TABLE `teacher_cards` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `librarian_id` int(11) NOT NULL,
  `take_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_cards`
--

INSERT INTO `teacher_cards` (`id`, `book_id`, `teacher_id`, `librarian_id`, `take_date`, `return_date`) VALUES
(11, 10, 9, 6, '2019-02-13 14:38:44', NULL),
(12, 1, 5, 6, '2019-02-13 14:38:44', NULL),
(13, 8, 9, 5, '2019-02-13 14:38:44', NULL),
(14, 10, 3, 3, '2019-02-13 14:38:44', NULL),
(15, 2, 2, 7, '2019-02-13 14:38:44', NULL),
(16, 1, 8, 7, '2019-02-13 14:38:44', NULL),
(17, 1, 9, 2, '2019-02-13 14:38:44', NULL),
(18, 8, 7, 2, '2019-02-13 14:38:44', NULL),
(19, 5, 8, 6, '2019-02-13 14:38:44', NULL),
(20, 3, 7, 8, '2019-02-13 14:38:44', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `person_id` (`person_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `books_ibfk_2` (`language_id`);

--
-- Indexes for table `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_id` (`book_id`,`author_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarians`
--
ALTER TABLE `librarians`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `person_id` (`person_id`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `person_id` (`person_id`),
  ADD KEY `students_ibfk_2` (`group_id`);

--
-- Indexes for table `student_cards`
--
ALTER TABLE `student_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_id` (`book_id`,`student_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `librarian_id` (`librarian_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `person_id` (`person_id`);

--
-- Indexes for table `teacher_cards`
--
ALTER TABLE `teacher_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_id` (`book_id`,`teacher_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `librarian_id` (`librarian_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `book_author`
--
ALTER TABLE `book_author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `librarians`
--
ALTER TABLE `librarians`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `student_cards`
--
ALTER TABLE `student_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `teacher_cards`
--
ALTER TABLE `teacher_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`);

--
-- Constraints for table `librarians`
--
ALTER TABLE `librarians`
  ADD CONSTRAINT `librarians_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Constraints for table `student_cards`
--
ALTER TABLE `student_cards`
  ADD CONSTRAINT `student_cards_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `student_cards_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `student_cards_ibfk_3` FOREIGN KEY (`librarian_id`) REFERENCES `librarians` (`id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`);

--
-- Constraints for table `teacher_cards`
--
ALTER TABLE `teacher_cards`
  ADD CONSTRAINT `teacher_cards_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `teacher_cards_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `teacher_cards_ibfk_3` FOREIGN KEY (`librarian_id`) REFERENCES `librarians` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
