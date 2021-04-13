-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2019 at 07:36 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auto_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `administratori`
--

CREATE TABLE `administratori` (
  `id` int(11) NOT NULL,
  `korisnicko_ime` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `lozinka` varchar(255) COLLATE utf8_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `administratori`
--

INSERT INTO `administratori` (`id`, `korisnicko_ime`, `lozinka`) VALUES
(2, 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `automobili`
--

CREATE TABLE `automobili` (
  `id` int(11) NOT NULL,
  `broj_sasije` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `proizvodjac_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `automobili`
--

INSERT INTO `automobili` (`id`, `broj_sasije`, `proizvodjac_id`, `model_id`) VALUES
(1, 'h3nmdj562h', 1, 1),
(2, 'SADASD12', 2, 2),
(3, 'sdasa', 1, 1),
(7, 'A1S5F4E4', 1, 1),
(8, 'a1b2c3d4', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dijelovi`
--

CREATE TABLE `dijelovi` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `proizvodjac` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `cijena` float NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `dijelovi`
--

INSERT INTO `dijelovi` (`id`, `naziv`, `proizvodjac`, `cijena`, `model_id`) VALUES
(1, 'Filter goriva', 'TPC', 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `evidencije`
--

CREATE TABLE `evidencije` (
  `id` int(11) NOT NULL,
  `automobil_id` int(11) NOT NULL,
  `dio_id` int(11) NOT NULL,
  `zaposlenik_id` int(11) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `evidencije`
--

INSERT INTO `evidencije` (`id`, `automobil_id`, `dio_id`, `zaposlenik_id`, `datum`) VALUES
(1, 1, 1, 2, '2019-09-07'),
(2, 3, 1, 1, '2019-09-08'),
(3, 1, 1, 2, '2019-09-09'),
(4, 1, 1, 2, '2019-09-09'),
(5, 1, 1, 2, '2019-09-10'),
(6, 1, 1, 2, '2019-09-10');

-- --------------------------------------------------------

--
-- Table structure for table `modeli`
--

CREATE TABLE `modeli` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `godiste` int(20) NOT NULL,
  `proizvodjac_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `modeli`
--

INSERT INTO `modeli` (`id`, `naziv`, `godiste`, `proizvodjac_id`) VALUES
(1, 'M3', 2017, 1),
(2, 'C klasa', 2014, 2);

-- --------------------------------------------------------

--
-- Table structure for table `proizvodjaci`
--

CREATE TABLE `proizvodjaci` (
  `id` int(11) NOT NULL,
  `naziv` varchar(255) COLLATE utf8_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `proizvodjaci`
--

INSERT INTO `proizvodjaci` (`id`, `naziv`) VALUES
(1, 'BMW'),
(2, 'Mercedes'),
(3, 'Renault'),
(4, 'Mercedes'),
(5, 'Porsche'),
(6, 'KIA'),
(7, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `zaposlenici`
--

CREATE TABLE `zaposlenici` (
  `id` int(11) NOT NULL,
  `ime` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `prezime` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `korisnicko_ime` varchar(255) COLLATE utf8_croatian_ci NOT NULL,
  `lozinka` varchar(255) COLLATE utf8_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_ci;

--
-- Dumping data for table `zaposlenici`
--

INSERT INTO `zaposlenici` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`) VALUES
(2, 'test', 'test', 'test', 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administratori`
--
ALTER TABLE `administratori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `automobili`
--
ALTER TABLE `automobili`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marka` (`proizvodjac_id`),
  ADD KEY `model` (`model_id`);

--
-- Indexes for table `dijelovi`
--
ALTER TABLE `dijelovi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `evidencije`
--
ALTER TABLE `evidencije`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modeli`
--
ALTER TABLE `modeli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proizvodjac_id` (`proizvodjac_id`);

--
-- Indexes for table `proizvodjaci`
--
ALTER TABLE `proizvodjaci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zaposlenici`
--
ALTER TABLE `zaposlenici`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administratori`
--
ALTER TABLE `administratori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `automobili`
--
ALTER TABLE `automobili`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dijelovi`
--
ALTER TABLE `dijelovi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `evidencije`
--
ALTER TABLE `evidencije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `modeli`
--
ALTER TABLE `modeli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proizvodjaci`
--
ALTER TABLE `proizvodjaci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zaposlenici`
--
ALTER TABLE `zaposlenici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `automobili`
--
ALTER TABLE `automobili`
  ADD CONSTRAINT `automobili_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `modeli` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `automobili_ibfk_2` FOREIGN KEY (`proizvodjac_id`) REFERENCES `proizvodjaci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dijelovi`
--
ALTER TABLE `dijelovi`
  ADD CONSTRAINT `dijelovi_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `modeli` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modeli`
--
ALTER TABLE `modeli`
  ADD CONSTRAINT `modeli_ibfk_1` FOREIGN KEY (`proizvodjac_id`) REFERENCES `proizvodjaci` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
