-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2025 at 02:01 PM
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
-- Database: `retseptiraamattsikvasvili`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `koostislisa` (IN `kogus` INT, IN `retsept_id` INT, IN `toiduaine_id` INT, IN `yhik_id` INT)   BEGIN
INSERT INTO koostis (kogus, retsept_retsept_id, toiduaine_id, yhik_id)
VALUES 
(kogus, retsept_id, toiduaine_id, yhik_id);
SELECT * FROM koostis;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `poodlisa` (IN `poodnimi` VARCHAR(100), IN `aadress` VARCHAR(300), IN `toidu_id` INT)   BEGIN
INSERT INTO pood
VALUES 
(poodnimi, aadress, toidu_id);
SELECT * FROM pood;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `retseptlisa` (IN `nimi` VARCHAR(100), IN `kirj` VARCHAR(200), IN `juh` VARCHAR(500), IN `kasutaja` INT, IN `kategooria` INT)   BEGIN
INSERT INTO retsept (retsepti_nimi, kirjeldus, juhend, sisestatud_kp, kasutaja_id, kategooria_id)
VALUES 
(nimi, kirj, juh, NOW(), kasutaja, kategooria);
SELECT * FROM retsept;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tehtudlisa` (IN `tehtud_kp` DATE, IN `retsept_id` INT)   BEGIN
INSERT INTO tehtud
VALUES 
(tehtud_kp, retsept_id);
SELECT * FROM tehtud;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kasutaja`
--

CREATE TABLE `kasutaja` (
  `kasutaja_id` int(11) NOT NULL,
  `eesNimi` varchar(50) DEFAULT NULL,
  `pereNimi` varchar(50) NOT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kasutaja`
--

INSERT INTO `kasutaja` (`kasutaja_id`, `eesNimi`, `pereNimi`, `email`) VALUES
(1, 'Maksim', 'Ts', 'maksimtsitkool@gmail.com'),
(2, 'Maksim2', 'Ts2', 'maksimtsitkool2@gmail.com'),
(3, 'Maksim3', 'Ts3', 'maksimtsitkool3@gmail.com'),
(4, 'Maksim4', 'Ts4', 'maksimtsitkool4@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `kategooria`
--

CREATE TABLE `kategooria` (
  `kategooria_id` int(11) NOT NULL,
  `kategooria_nimi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategooria`
--

INSERT INTO `kategooria` (`kategooria_id`, `kategooria_nimi`) VALUES
(1, 'Lihatooted'),
(2, 'Toiduained'),
(3, 'Joogid'),
(4, 'Piimatooded');

-- --------------------------------------------------------

--
-- Table structure for table `koostis`
--

CREATE TABLE `koostis` (
  `koostis_id` int(11) NOT NULL,
  `kogus` int(11) DEFAULT NULL,
  `retsept_retsept_id` int(11) DEFAULT NULL,
  `toiduaine_id` int(11) DEFAULT NULL,
  `yhik_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koostis`
--

INSERT INTO `koostis` (`koostis_id`, `kogus`, `retsept_retsept_id`, `toiduaine_id`, `yhik_id`) VALUES
(1, 120, 1, 2, 5),
(2, 300, 2, 1, 5),
(3, 200, 3, 3, 1),
(4, 1, 4, 4, 6),
(5, 100, 5, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pood`
--

CREATE TABLE `pood` (
  `pood_id` int(11) NOT NULL,
  `poodNimi` varchar(50) DEFAULT NULL,
  `aadress` varchar(300) DEFAULT NULL,
  `toiduaine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pood`
--

INSERT INTO `pood` (`pood_id`, `poodNimi`, `aadress`, `toiduaine_id`) VALUES
(1, 'Rimi', 'Sõpruse pst 20', 1),
(2, 'Maxima', 'E.Vilde tee 60', 2),
(3, 'Maxima', 'Õismäe tee 10', 3),
(4, 'Prisma', 'Endla 45', 4),
(5, 'Selver', 'Kopli tn 1', 5);

-- --------------------------------------------------------

--
-- Table structure for table `retsept`
--

CREATE TABLE `retsept` (
  `retsept_id` int(11) NOT NULL,
  `retsepti_nimi` varchar(100) DEFAULT NULL,
  `kirjeldus` varchar(200) DEFAULT NULL,
  `juhend` varchar(500) DEFAULT NULL,
  `sisestatud_kp` date DEFAULT NULL,
  `kasutaja_id` int(11) DEFAULT NULL,
  `kategooria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `retsept`
--

INSERT INTO `retsept` (`retsept_id`, `retsepti_nimi`, `kirjeldus`, `juhend`, `sisestatud_kp`, `kasutaja_id`, `kategooria_id`) VALUES
(1, 'Pasta', 'Väga magus', 'Kasuta elektripliit', '2025-02-14', 1, 2),
(2, 'Pannkook', 'Pehme', 'Kasuta pannil küpsetamiseks', '2025-02-14', 2, 4),
(3, 'Smuuti', 'Värskendav', 'Sega kõik koostisosad mikseris', '2025-02-14', 3, 3),
(4, 'Praetud kana', 'Krõbe kana', 'Prae kana pannil', '2025-02-14', 4, 1),
(5, 'Salat', 'Tervislik', 'Sega puuviljad', '2025-02-14', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tehtud`
--

CREATE TABLE `tehtud` (
  `tehtud_id` int(11) NOT NULL,
  `tehtud_kp` date DEFAULT NULL,
  `retsept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tehtud`
--

INSERT INTO `tehtud` (`tehtud_id`, `tehtud_kp`, `retsept_id`) VALUES
(1, '2025-02-14', 1),
(2, '2025-01-01', 2),
(3, '2024-05-06', 3),
(4, '2024-09-24', 4),
(5, '2024-12-31', 5);

-- --------------------------------------------------------

--
-- Table structure for table `toiduaine`
--

CREATE TABLE `toiduaine` (
  `toiduaine_id` int(11) NOT NULL,
  `toiduaine_nimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `toiduaine`
--

INSERT INTO `toiduaine` (`toiduaine_id`, `toiduaine_nimi`) VALUES
(1, 'munad'),
(2, 'juust'),
(3, 'õlu'),
(4, 'vorst'),
(5, 'vesi');

-- --------------------------------------------------------

--
-- Table structure for table `yhik`
--

CREATE TABLE `yhik` (
  `yhik_id` int(11) NOT NULL,
  `yhik_nimi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `yhik`
--

INSERT INTO `yhik` (`yhik_id`, `yhik_nimi`) VALUES
(1, 'ml'),
(2, 'tl'),
(3, 'sl'),
(4, 'l'),
(5, 'g'),
(6, 'kg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kasutaja`
--
ALTER TABLE `kasutaja`
  ADD PRIMARY KEY (`kasutaja_id`);

--
-- Indexes for table `kategooria`
--
ALTER TABLE `kategooria`
  ADD PRIMARY KEY (`kategooria_id`);

--
-- Indexes for table `koostis`
--
ALTER TABLE `koostis`
  ADD PRIMARY KEY (`koostis_id`),
  ADD KEY `retsept_retsept_id` (`retsept_retsept_id`),
  ADD KEY `toiduaine_id` (`toiduaine_id`),
  ADD KEY `yhik_id` (`yhik_id`);

--
-- Indexes for table `pood`
--
ALTER TABLE `pood`
  ADD PRIMARY KEY (`pood_id`),
  ADD KEY `toiduaine_id` (`toiduaine_id`);

--
-- Indexes for table `retsept`
--
ALTER TABLE `retsept`
  ADD PRIMARY KEY (`retsept_id`),
  ADD KEY `kasutaja_id` (`kasutaja_id`),
  ADD KEY `kategooria_id` (`kategooria_id`);

--
-- Indexes for table `tehtud`
--
ALTER TABLE `tehtud`
  ADD PRIMARY KEY (`tehtud_id`),
  ADD KEY `retsept_id` (`retsept_id`);

--
-- Indexes for table `toiduaine`
--
ALTER TABLE `toiduaine`
  ADD PRIMARY KEY (`toiduaine_id`);

--
-- Indexes for table `yhik`
--
ALTER TABLE `yhik`
  ADD PRIMARY KEY (`yhik_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kasutaja`
--
ALTER TABLE `kasutaja`
  MODIFY `kasutaja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategooria`
--
ALTER TABLE `kategooria`
  MODIFY `kategooria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `koostis`
--
ALTER TABLE `koostis`
  MODIFY `koostis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pood`
--
ALTER TABLE `pood`
  MODIFY `pood_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `retsept`
--
ALTER TABLE `retsept`
  MODIFY `retsept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tehtud`
--
ALTER TABLE `tehtud`
  MODIFY `tehtud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `toiduaine`
--
ALTER TABLE `toiduaine`
  MODIFY `toiduaine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `yhik`
--
ALTER TABLE `yhik`
  MODIFY `yhik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `koostis`
--
ALTER TABLE `koostis`
  ADD CONSTRAINT `koostis_ibfk_1` FOREIGN KEY (`retsept_retsept_id`) REFERENCES `retsept` (`retsept_id`),
  ADD CONSTRAINT `koostis_ibfk_2` FOREIGN KEY (`toiduaine_id`) REFERENCES `toiduaine` (`toiduaine_id`),
  ADD CONSTRAINT `koostis_ibfk_3` FOREIGN KEY (`yhik_id`) REFERENCES `yhik` (`yhik_id`);

--
-- Constraints for table `pood`
--
ALTER TABLE `pood`
  ADD CONSTRAINT `pood_ibfk_1` FOREIGN KEY (`toiduaine_id`) REFERENCES `toiduaine` (`toiduaine_id`);

--
-- Constraints for table `retsept`
--
ALTER TABLE `retsept`
  ADD CONSTRAINT `retsept_ibfk_1` FOREIGN KEY (`kasutaja_id`) REFERENCES `kasutaja` (`kasutaja_id`),
  ADD CONSTRAINT `retsept_ibfk_2` FOREIGN KEY (`kategooria_id`) REFERENCES `kategooria` (`kategooria_id`);

--
-- Constraints for table `tehtud`
--
ALTER TABLE `tehtud`
  ADD CONSTRAINT `tehtud_ibfk_1` FOREIGN KEY (`retsept_id`) REFERENCES `retsept` (`retsept_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
