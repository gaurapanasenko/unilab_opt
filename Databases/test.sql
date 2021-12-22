CREATE TABLE `Специализации_1` (
  `код_спец` int(11) NOT NULL AUTO_INCREMENT,
  `название` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `код_внешней_спец` int(11) NOT NULL,
  PRIMARY KEY (`код_спец`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Специализации` (
  `код_спец` int(11) NOT NULL AUTO_INCREMENT,
  `название` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `код_внешней_спец` int(11) NOT NULL,
  PRIMARY KEY (`код_спец`),
  KEY `код_внешней_спец` (`код_внешней_спец`),
  CONSTRAINT `Специализации_ibfk_1` FOREIGN KEY (`код_внешней_спец`) REFERENCES `Специализации_1` (`код_спец`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `Фирмы` (
  `код_фирмы` int(11) NOT NULL AUTO_INCREMENT,
  `название` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `страна` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `адрес` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_сайт` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_mail` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `телефон` int(11) NOT NULL,
  PRIMARY KEY (`код_фирмы`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ФирмыСпециализации` (
  `код_фирмы` int(11) NOT NULL,
  `код_спец` int(11) NOT NULL,
  KEY `код_спец` (`код_спец`),
  KEY `код_фирмы` (`код_фирмы`),
  CONSTRAINT `ФирмыСпециализации_ibfk_1` FOREIGN KEY (`код_спец`) REFERENCES `Специализации` (`код_спец`),
  CONSTRAINT `ФирмыСпециализации_ibfk_2` FOREIGN KEY (`код_фирмы`) REFERENCES `Фирмы` (`код_фирмы`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Товары` (
  `код_товара` int(11) NOT NULL AUTO_INCREMENT,
  `ед_изм` smallint(6) NOT NULL,
  `название` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `характеристрика` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `код_спец` int(11) NOT NULL,
  `код_фирмы` int(11) NOT NULL,
  `цена` int(11) NOT NULL,
  PRIMARY KEY (`код_товара`),
  KEY `код_спец` (`код_спец`),
  KEY `код_фирмы` (`код_фирмы`),
  CONSTRAINT `Товары_ibfk_1` FOREIGN KEY (`код_спец`) REFERENCES `ФирмыСпециализации` (`код_спец`),
  CONSTRAINT `Товары_ibfk_2` FOREIGN KEY (`код_фирмы`) REFERENCES `ФирмыСпециализации` (`код_фирмы`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
