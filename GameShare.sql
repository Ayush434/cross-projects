-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2020 at 07:03 AM
-- Server version: 5.5.64-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `GameShare`
--

-- --------------------------------------------------------

--
-- Table structure for table `AccountHolder`
--

CREATE TABLE IF NOT EXISTS `AccountHolder` (
  `AccountHolderID` int(11) NOT NULL,
  `HolderName` varchar(20) DEFAULT NULL,
  `HolderPhone` varchar(15) DEFAULT NULL,
  `HolderEmail` varchar(25) DEFAULT NULL,
  `HolderAddress` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AccountHolder`
--

INSERT INTO `AccountHolder` (`AccountHolderID`, `HolderName`, `HolderPhone`, `HolderEmail`, `HolderAddress`) VALUES
(1, 'Sartaj', '2065523612', NULL, NULL),
(2, 'Fisul', '2563126552', NULL, NULL),
(3, 'Akash', '2562368941', NULL, NULL),
(4, 'Bhavesh', '9065036623', NULL, NULL),
(5, 'Rahul', '8069875627', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Games`
--

CREATE TABLE IF NOT EXISTS `Games` (
  `GamesID` int(11) NOT NULL,
  `GamesTypeID` int(11) DEFAULT NULL,
  `GamesName` varchar(25) DEFAULT NULL,
  `GamesSize` double DEFAULT NULL,
  `GamesLicense` varchar(25) DEFAULT NULL,
  `GamesPrice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Games`
--

INSERT INTO `Games` (`GamesID`, `GamesTypeID`, `GamesName`, `GamesSize`, `GamesLicense`, `GamesPrice`) VALUES
(1, 1, 'Spore', 256, 'Public domain', 300),
(2, 2, 'Jerry and Tom', 100, 'LGPL', 50),
(3, 3, 'Batty Man', 180, 'Public domain', 100),
(4, 4, 'Grand Prix', 200, 'LGPL', 5),
(5, 5, 'Find Me', 150, 'Public domain', 40);

-- --------------------------------------------------------

--
-- Table structure for table `GamesAccount`
--

CREATE TABLE IF NOT EXISTS `GamesAccount` (
  `GamesAccountId` int(11) NOT NULL,
  `GamesID` int(11) DEFAULT NULL,
  `AccountHolderID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `GamesAccount`
--

INSERT INTO `GamesAccount` (`GamesAccountId`, `GamesID`, `AccountHolderID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `GamesType`
--

CREATE TABLE IF NOT EXISTS `GamesType` (
  `GamesTypeID` int(11) NOT NULL,
  `GamesType` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `GamesType`
--

INSERT INTO `GamesType` (`GamesTypeID`, `GamesType`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Sports'),
(4, 'Cards'),
(5, 'Puzzle');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AccountHolder`
--
ALTER TABLE `AccountHolder`
  ADD PRIMARY KEY (`AccountHolderID`);

--
-- Indexes for table `Games`
--
ALTER TABLE `Games`
  ADD PRIMARY KEY (`GamesID`),
  ADD KEY `GamesTypeID` (`GamesTypeID`);

--
-- Indexes for table `GamesAccount`
--
ALTER TABLE `GamesAccount`
  ADD PRIMARY KEY (`GamesAccountId`),
  ADD KEY `GamesID` (`GamesID`),
  ADD KEY `AccountHolderID` (`AccountHolderID`);

--
-- Indexes for table `GamesType`
--
ALTER TABLE `GamesType`
  ADD PRIMARY KEY (`GamesTypeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Games`
--
ALTER TABLE `Games`
  ADD CONSTRAINT `Games_ibfk_1` FOREIGN KEY (`GamesTypeID`) REFERENCES `GamesType` (`GamesTypeID`);

--
-- Constraints for table `GamesAccount`
--
ALTER TABLE `GamesAccount`
  ADD CONSTRAINT `GamesAccount_ibfk_1` FOREIGN KEY (`GamesID`) REFERENCES `Games` (`GamesID`),
  ADD CONSTRAINT `GamesAccount_ibfk_2` FOREIGN KEY (`AccountHolderID`) REFERENCES `AccountHolder` (`AccountHolderID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
