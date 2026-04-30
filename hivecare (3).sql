-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 30, 2026 at 12:27 PM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hivecare`
--

-- --------------------------------------------------------

--
-- Table structure for table `apiary`
--

CREATE TABLE `apiary` (
  `apiaryID` int(11) NOT NULL,
  `name` varchar(26) DEFAULT NULL,
  `location` varchar(26) DEFAULT NULL,
  `beekeeperID` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apiary`
--

INSERT INTO `apiary` (`apiaryID`, `name`, `location`, `beekeeperID`, `image`, `description`) VALUES
(654123, 'Apiary A', 'Riyadh', 123457, '', ''),
(654124, 'Apiary B', 'Jeddah', 123458, '', ''),
(654125, 'Apiary C', 'Dammam', 123457, '', ''),
(654131, 'alsidr', 'Al-Qassim', 304180, '1777493377_alsidr.jpg', 'a delicious honey, from the unique trees of sidr in Al-Qassim'),
(654132, 'Talah honey', 'Riyadh ', 304180, '1777498829_Screenshot 2026-04-29 232241.png', 'fancy honey from the great land of najd');

-- --------------------------------------------------------

--
-- Table structure for table `beehive`
--

CREATE TABLE `beehive` (
  `hiveID` int(11) NOT NULL,
  `apiaryID` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `health` varchar(50) DEFAULT NULL,
  `production` int(11) DEFAULT NULL,
  `lastInspection` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beehive`
--

INSERT INTO `beehive` (`hiveID`, `apiaryID`, `name`, `health`, `production`, `lastInspection`) VALUES
(654325, 654123, 'hive2', 'weak', 1, '2026-01-15'),
(654326, 654125, 'hive2', 'excellent ', 5, '2025-04-24'),
(654327, 654132, 'hive101', 'good', 2, '2025-01-15'),
(654328, 654132, 'hive3', 'weak', 1, '2026-04-18'),
(654329, 654131, 'hive1', 'excellent ', 6, '2026-02-22'),
(654330, 654131, 'hive3', 'good', 3, '2025-12-24'),
(654331, 654132, 'hive4', 'weak', 1, '2026-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `beekeeper`
--

CREATE TABLE `beekeeper` (
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beekeeper`
--

INSERT INTO `beekeeper` (`userID`) VALUES
(123457),
(123458);

-- --------------------------------------------------------

--
-- Table structure for table `hivehealthrecord`
--

CREATE TABLE `hivehealthrecord` (
  `recordID` int(11) NOT NULL,
  `hiveID` int(11) DEFAULT NULL,
  `health_status` varchar(26) DEFAULT NULL,
  `notes` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hivehealthrecord`
--

INSERT INTO `hivehealthrecord` (`recordID`, `hiveID`, `health_status`, `notes`) VALUES
(3, 654326, 'Diseased', 'High honey production'),
(4, 654327, 'Good', 'Stable condition'),
(5, 654328, 'Weak', 'Needs immediate attention'),
(6, 654329, 'Excellent', 'Ready for harvest'),
(7, 654330, 'Good', 'Queen laying well'),
(8, 654331, 'Weak', 'Mite infestation'),
(13, 654325, 'Healthy', 'very healthey');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `name` varchar(26) DEFAULT NULL,
  `email` varchar(36) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) NOT NULL,
  `status` varchar(20) DEFAULT 'active',
  `joined` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `name`, `email`, `location`, `password`, `role`, `status`, `joined`) VALUES
(123456, 'Sadeem', 'sadeem@gmail.com', 'Riyadh, Saudi Arabia', '$2y$10$w5GuvyrwH9XpRnMKVzGYWOPhrvB55v2leW8hdz9JCG2ImS.G8OsC.', 'user', 'active', '2026-04-30 13:35:28'),
(123457, 'sara', 'najla@gmail.com', 'Jeddah , Saudi Arabia', '$2y$10$w5GuvyrwH9XpRnMKVzGYWOPhrvB55v2leW8hdz9JCG2ImS.G8OsC.', 'user', 'active', '2026-04-30 13:35:28'),
(123458, 'nora', 'nora@gmail.com', 'Riyadh, Saudi Arabia', '$2y$10$w5GuvyrwH9XpRnMKVzGYWOPhrvB55v2leW8hdz9JCG2ImS.G8OsC.', 'admin', 'active', '2026-04-30 13:35:28'),
(304180, 'juri', 'jt@gmail.com', 'Riyadh', '$2y$10$rXCz0pWio5L/AKaWv32S6eIGA8M8v/LWdBXS08qS5X8d2d4xkYG4e', 'user', 'active', '2026-04-30 13:35:28'),
(320890, 's', 's@w.com', 'riyadh', '$2y$10$1oWFn3RWun/6dFFm2.5sZ.lzsmUgP8MeoOwnh/ibBAkPQIeheV686', 'user', 'active', '2026-04-30 13:35:28'),
(384567, 'nono', 'nono@no.com', 'riyadh', '$2y$10$spU45oMnjkhzdpU6dK.jjO30IeRqV/NjebZANbq/IrjE1FOq5igW2', 'user', 'active', '2026-04-30 13:35:28'),
(567688, 'z', 'z@z.com', 'riyadh', '$2y$10$H8b9BoFRRCCZ8TFPYkL5gOALbELNcERpPwOr89OABtd.4pEKvr7a6', 'user', 'active', '2026-04-30 13:35:28'),
(882889, 'soso', 'soso@m.com', 'riyadh', '$2y$10$bv7Jcg.8Ng6f3Pmfl4M3s.L6LsTrTm/WZ0pH2HIucUMuWd5sFELCu', 'user', 'active', '2026-04-30 13:35:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apiary`
--
ALTER TABLE `apiary`
  ADD PRIMARY KEY (`apiaryID`),
  ADD KEY `beekeeperID` (`beekeeperID`);

--
-- Indexes for table `beehive`
--
ALTER TABLE `beehive`
  ADD PRIMARY KEY (`hiveID`),
  ADD KEY `apiaryID` (`apiaryID`);

--
-- Indexes for table `beekeeper`
--
ALTER TABLE `beekeeper`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `hivehealthrecord`
--
ALTER TABLE `hivehealthrecord`
  ADD PRIMARY KEY (`recordID`),
  ADD KEY `hiveID` (`hiveID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apiary`
--
ALTER TABLE `apiary`
  MODIFY `apiaryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=654133;

--
-- AUTO_INCREMENT for table `beehive`
--
ALTER TABLE `beehive`
  MODIFY `hiveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=654332;

--
-- AUTO_INCREMENT for table `hivehealthrecord`
--
ALTER TABLE `hivehealthrecord`
  MODIFY `recordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apiary`
--
ALTER TABLE `apiary`
  ADD CONSTRAINT `apiary_ibfk_1` FOREIGN KEY (`beekeeperID`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `beehive`
--
ALTER TABLE `beehive`
  ADD CONSTRAINT `beehive_ibfk_1` FOREIGN KEY (`apiaryID`) REFERENCES `apiary` (`apiaryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `beekeeper`
--
ALTER TABLE `beekeeper`
  ADD CONSTRAINT `beekeeper_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE;

--
-- Constraints for table `hivehealthrecord`
--
ALTER TABLE `hivehealthrecord`
  ADD CONSTRAINT `hivehealthrecord_ibfk_1` FOREIGN KEY (`hiveID`) REFERENCES `beehive` (`hiveID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
