-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2017 at 09:36 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chelsea`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `eff_value_player` ()  NO SQL
    COMMENT 'eff_value'
update player_vote set eff_value = vote_yes - vote_no$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bplayers`
--

CREATE TABLE `bplayers` (
  `b_no` int(11) UNSIGNED NOT NULL,
  `b_name` varchar(55) NOT NULL,
  `b_age` int(11) NOT NULL,
  `b_pos` varchar(30) NOT NULL,
  `b_dob` varchar(12) NOT NULL,
  `m_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bplayers`
--

INSERT INTO `bplayers` (`b_no`, `b_name`, `b_age`, `b_pos`, `b_dob`, `m_id`) VALUES
(1, 'WILLY CABALLERO', 36, 'Goalkeeper', '28-09-1981', 1),
(4, 'CESC FABREGAS', 30, 'Midfielder', '04-05-1987', 1),
(9, 'ALVARO MORATA', 25, 'Striker', '23-10-1992', 1),
(10, 'EDEN HAZARD', 26, 'Midfielder', '07-01-1991', 1),
(13, 'THIBAUT COURTOIS', 25, 'Goalkeeper', '11-05-1992', 1),
(22, 'WILLIAN', 29, 'Midfielder', '09-08-1988', 1),
(23, 'MICHY BATSHUAYI', 24, 'Striker', '02-10-1993', 1),
(24, 'GARY CAHILL', 31, 'Defender', '19-12-1985', 1),
(28, 'CESAR AZPILICUETA', 28, 'Defender', '28-08-1989', 1),
(30, 'DAVID LUIZ', 30, 'Defender', '22-04-1987', 1),
(37, 'EDUARDO', 35, 'Goalkeeper', '19-09-1982', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gplayers`
--

CREATE TABLE `gplayers` (
  `g_no` int(11) UNSIGNED NOT NULL,
  `g_name` varchar(55) NOT NULL,
  `g_age` int(11) NOT NULL,
  `g_pos` varchar(30) NOT NULL,
  `g_dob` varchar(30) NOT NULL,
  `m_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gplayers`
--

INSERT INTO `gplayers` (`g_no`, `g_name`, `g_age`, `g_pos`, `g_dob`, `m_id`) VALUES
(1, 'Hadvig Lindahi', 34, 'Goalkeeper', '29-04-1983', 2),
(3, 'Hannah Blundell', 23, 'Defender', '25-05-1994', 2),
(4, 'Millie Bright', 24, 'Defender', '21-08-1993', 2),
(5, 'Gilly Flaherty', 26, 'Defender', '24-08-1991', 2),
(7, 'Gemma Davison', 30, 'Striker', '17-04-1987', 2),
(8, 'Karen Carney', 30, 'Midfielder', '01-08-1987', 2),
(9, 'Eniola Akulo', 30, 'Striker', '21-02-1987', 2),
(10, 'Ji So Yun', 26, 'Midfielder', '21-02-1991', 2),
(12, 'Rebecca Spencer', 26, 'Goalkeeper', '02-03-1991', 2),
(14, 'Fransesca Kirby', 24, 'Striker', '29-06-1993', 2),
(17, 'Katie Chapman', 35, 'Midfielder', '15-06-1982', 2),
(40, 'Frances Kitching', 19, 'Goalkeeper', '17-02-1998', 2);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `m_id` int(11) UNSIGNED NOT NULL,
  `m_name` varchar(50) NOT NULL,
  `m_age` int(11) NOT NULL,
  `m_pos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`m_id`, `m_name`, `m_age`, `m_pos`) VALUES
(1, 'Antonio Conte', 48, 'Head Coach'),
(2, 'Emma Hayes', 41, 'Head Coach');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `username` varchar(55) NOT NULL,
  `fname` varchar(55) NOT NULL,
  `lname` varchar(55) NOT NULL,
  `pswd` varchar(20) NOT NULL,
  `email` varchar(55) NOT NULL,
  `dob` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`username`, `fname`, `lname`, `pswd`, `email`, `dob`) VALUES
('praneta17', 'praneta', 'agrawal', 'pran123', 'pran@cypress.com', '1991-01-17');

--
-- Triggers `members`
--
DELIMITER $$
CREATE TRIGGER `upper_bplayers` AFTER INSERT ON `members` FOR EACH ROW update bplayers set b_name = UPPER(b_name)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `player_vote`
--

CREATE TABLE `player_vote` (
  `name` varchar(50) NOT NULL,
  `vote_yes` int(11) NOT NULL,
  `vote_no` int(11) NOT NULL,
  `eff_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_vote`
--

INSERT INTO `player_vote` (`name`, `vote_yes`, `vote_no`, `eff_value`) VALUES
('David Silva', 4, 1, 3),
('Club', 0, 1, -1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bplayers`
--
ALTER TABLE `bplayers`
  ADD PRIMARY KEY (`b_no`),
  ADD KEY `bplayers_ibfk_1` (`m_id`);

--
-- Indexes for table `gplayers`
--
ALTER TABLE `gplayers`
  ADD PRIMARY KEY (`g_no`),
  ADD KEY `gplayers_ibfk_1` (`m_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`m_id`),
  ADD KEY `m_id` (`m_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bplayers`
--
ALTER TABLE `bplayers`
  ADD CONSTRAINT `bplayers_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `manager` (`m_id`);

--
-- Constraints for table `gplayers`
--
ALTER TABLE `gplayers`
  ADD CONSTRAINT `gplayers_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `manager` (`m_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
