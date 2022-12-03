-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2022 at 11:50 AM
-- Server version: 10.4.25-MariaDB-log
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendancemsystem`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Backup_Faculty` ()   BEGIN
    	DECLARE done INT DEFAULT 0;
        DECLARE fid INT;
        DECLARE name1, lastName VARCHAR(30);
        DECLARE username1, password1 VARCHAR(40);
		DECLARE phoneno1, classid1, sectionid1 VARCHAR(40);
        DECLARE cur CURSOR FOR SELECT Id, firstName, emailAddress, password, phoneNo, classId, classArmId FROM tblclassteacher;
        
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
        OPEN cur;
        label: LOOP 
        
        FETCH cur INTO fid, name1, username1, password1, phoneno1, classid1, sectionid1;
        
        INSERT INTO backup_faculty VALUES(fid, name1, username1, password1, phoneno1, classid1, sectionid1);
        
        IF done = 1 THEN LEAVE label;
        END IF;
        END LOOP;
        CLOSE cur;
        
        SELECT * FROM backup_faculty;
       END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getFacultyExp` (IN `id` INT)   SELECT TIMESTAMPDIFF(YEAR, dateCreated, CURDATE()) AS exp FROM tblclassteacher WHERE tblclassteacher.Id=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateClassTeacher` (IN `oldid` INT, IN `newid` INT, IN `email` VARCHAR(50))   UPDATE `tblclassteacher_dummy` SET `Id` = '111' WHERE `tblclassteacher_dummy`.`Id` = 12$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `isAttended` (`admissionNumber` VARCHAR(20), `date` DATE) RETURNS VARCHAR(20) CHARSET utf8mb4 DETERMINISTIC BEGIN

IF (SELECT COUNT(*) FROM tblattendance WHERE status=1 AND admissionNo=admissionNumber AND dateTimeTaken=date )>=1 THEN
RETURN (" Student is Attended ");
ELSE
RETURN (" Student Not Attended");
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `backup_faculty`
--

CREATE TABLE `backup_faculty` (
  `fid` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `username1` varchar(60) NOT NULL,
  `password1` varchar(60) NOT NULL,
  `phoneno` varchar(30) NOT NULL,
  `classid` varchar(10) NOT NULL,
  `sectionid` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `backup_faculty`
--

INSERT INTO `backup_faculty` (`fid`, `name`, `username1`, `password1`, `phoneno`, `classid`, `sectionid`) VALUES
(10, 'Teacher', 'teacher@teacher.com', '8d788385431273d11e8b43bb78f3aa41', '1234567890', '5', '13'),
(8, 'Samyukta', 'smyukta@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '8383773876', '6', '9'),
(9, 'Nagesh', 'nagesh@gmail.com', '8dcdc47d1615068325c0188eab8b6e80', '9278367273', '5', '15'),
(7, 'Pavankumar', 'pavankumar@gmail.com', '32250170a0dca92d53ec9624f336ca24', '8310411389', '5', '7'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(10, 'Teacher', 'teacher@teacher.com', '8d788385431273d11e8b43bb78f3aa41', '1234567890', '5', '13'),
(8, 'Samyukta', 'smyukta@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '8383773876', '6', '9'),
(9, 'Nagesh', 'nagesh@gmail.com', '8dcdc47d1615068325c0188eab8b6e80', '9278367273', '5', '15'),
(7, 'Pavankumar', 'pavankumar@gmail.com', '32250170a0dca92d53ec9624f336ca24', '8310411389', '5', '7'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(10, 'Teacher', 'teacher@teacher.com', '8d788385431273d11e8b43bb78f3aa41', '1234567890', '5', '13'),
(8, 'Samyukta', 'smyukta@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '8383773876', '6', '9'),
(9, 'Nagesh', 'nagesh@gmail.com', '8dcdc47d1615068325c0188eab8b6e80', '9278367273', '5', '15'),
(7, 'Pavankumar', 'pavankumar@gmail.com', '8d788385431273d11e8b43bb78f3aa41', '8310411389', '5', '7'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(10, 'Teacher', 'teacher@teacher.com', '8d788385431273d11e8b43bb78f3aa41', '1234567890', '5', '13'),
(8, 'Samyukta', 'smyukta@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', '8383773876', '6', '9'),
(9, 'Nagesh', 'nagesh@gmail.com', '8dcdc47d1615068325c0188eab8b6e80', '9278367273', '5', '15'),
(7, 'Pavankumar', 'pavankumar@gmail.com', '8d788385431273d11e8b43bb78f3aa41', '8310411389', '5', '7'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(10, 'Teacher', 'teacher@teacher.com', '8d788385431273d11e8b43bb78f3aa41', '1234567890', '5', '13'),
(7, 'Pavankumar', 'pavankumar@gmail.com', '8d788385431273d11e8b43bb78f3aa41', '8310411389', '5', '7'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(10, 'Teacher', 'teacher@teacher.com', '8d788385431273d11e8b43bb78f3aa41', '1234567890', '5', '13'),
(7, 'Pavankumar', 'pavankumar@gmail.com', '8d788385431273d11e8b43bb78f3aa41', '8310411389', '5', '7'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(11, 'Sharath', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11'),
(10, 'Teacher', 'teacher@teacher.com', '8d788385431273d11e8b43bb78f3aa41', '1234567890', '5', '13'),
(26, 'Ramana', 'sharath@gmail.com', 'khfjeahjnhfdj', '0987654321', '5', '11'),
(27, 'Ramana', 'sharath@gmail.com', 'khfjeahjnhfdj', '0987654321', '5', '11'),
(7, 'Pavankumar', 'pavankumar@gmail.com', '8d788385431273d11e8b43bb78f3aa41', '8310411389', '5', '7'),
(12, 'Krishna', 'ram@gmail.com', 'ftfygugyvgvj', '34758752925', '5', '11'),
(12, 'Krishna', 'ram@gmail.com', 'ftfygugyvgvj', '34758752925', '5', '11'),
(10, 'Teacher', 'teacher@teacher.com', '8d788385431273d11e8b43bb78f3aa41', '1234567890', '5', '13'),
(26, 'Ramana', 'sharath@gmail.com', 'khfjeahjnhfdj', '0987654321', '5', '11'),
(27, 'Ramana', 'sharath@gmail.com', 'khfjeahjnhfdj', '0987654321', '5', '11'),
(7, 'Pavankumar', 'pavankumar@gmail.com', '8d788385431273d11e8b43bb78f3aa41', '8310411389', '5', '7'),
(12, 'Krishna', 'ram@gmail.com', 'ftfygugyvgvj', '34758752925', '5', '11'),
(12, 'Krishna', 'ram@gmail.com', 'ftfygugyvgvj', '34758752925', '5', '11');

-- --------------------------------------------------------

--
-- Table structure for table `student_details`
--

CREATE TABLE `student_details` (
  `srn` varchar(255) NOT NULL,
  `S_Fname` varchar(255) NOT NULL,
  `S_Lastname` varchar(255) NOT NULL,
  `S_Fullname` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ClassId` varchar(10) NOT NULL,
  `SectionId` varchar(10) NOT NULL,
  `RegisteredDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_details`
--

INSERT INTO `student_details` (`srn`, `S_Fname`, `S_Lastname`, `S_Fullname`, `Password`, `ClassId`, `SectionId`, `RegisteredDate`) VALUES
('PES1UG19CS416', 'Siddarth', 'S', 'Siddarth S', '12345', '6', '18', '2022-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`) VALUES
(1, 'Pavankumar', 'Hegde', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `tblattendance`
--

CREATE TABLE `tblattendance` (
  `Id` int(10) NOT NULL,
  `admissionNo` varchar(255) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `sessionTermId` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `dateTimeTaken` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblattendance`
--

INSERT INTO `tblattendance` (`Id`, `admissionNo`, `classId`, `classArmId`, `sessionTermId`, `status`, `dateTimeTaken`) VALUES
(235, 'PES1UG20CS417', '5', '7', '2', '1', '2022-11-24'),
(234, 'PES1UG20CS416', '5', '7', '1', '0', '2022-11-24'),
(233, 'PES1UG20CS415', '5', '7', '1', '1', '2022-11-24'),
(232, 'PES1UG20CS414', '5', '7', '1', '1', '2022-11-24'),
(231, 'PES1UG20CS413', '5', '7', '1', '0', '2022-11-24'),
(230, 'PES1UG20CS412', '5', '7', '3', '0', '2022-11-24'),
(229, 'PES1UG20CS411', '5', '7', '1', '0', '2022-11-24'),
(228, 'PES1UG20CS409', '5', '7', '1', '0', '2022-11-24'),
(227, 'PES1UG20CS409', '5', '7', '1', '0', '2022-11-24'),
(226, 'PES1UG20CS408', '5', '7', '1', '0', '2022-11-24'),
(225, 'PES1UG20CS407', '5', '7', '1', '0', '2022-11-24'),
(224, 'PES1UG20CS406', '5', '7', '1', '1', '2022-11-24'),
(223, 'PES1UG20CS405', '5', '7', '1', '1', '2022-11-24'),
(222, 'PES1UG20CS404', '5', '7', '1', '1', '2022-11-24'),
(221, 'PES1UG21CS821', '5', '7', '1', '1', '2022-11-24'),
(196, 'PES1UG20CS404', '5', '7', '1', '1', '2022-11-23'),
(197, 'PES1UG20CS405', '5', '7', '1', '1', '2022-11-23'),
(198, 'PES1UG20CS406', '5', '7', '1', '1', '2022-11-23'),
(199, 'PES1UG20CS407', '5', '7', '1', '1', '2022-11-23'),
(200, 'PES1UG20CS408', '5', '7', '1', '1', '2022-11-23'),
(201, 'PES1UG20CS409', '5', '7', '1', '0', '2022-11-23'),
(202, 'PES1UG20CS409', '5', '7', '1', '0', '2022-11-23'),
(203, 'PES1UG20CS411', '5', '7', '1', '0', '2022-11-23'),
(204, 'PES1UG20CS412', '5', '7', '1', '0', '2022-11-23'),
(205, 'PES1UG20CS413', '5', '7', '1', '0', '2022-11-23'),
(206, 'PES1UG20CS414', '5', '7', '1', '1', '2022-11-23'),
(207, 'PES1UG20CS415', '5', '7', '1', '1', '2022-11-23'),
(208, 'PES1UG20CS416', '5', '7', '1', '0', '2022-11-23'),
(209, 'PES1UG20CS417', '5', '7', '1', '1', '2022-11-23'),
(210, 'PES1UG20CS418', '5', '7', '1', '1', '2022-11-23'),
(211, 'PES1UG20CS419', '5', '7', '1', '1', '2022-11-23'),
(212, 'PES1UG20CS420', '5', '7', '1', '1', '2022-11-23'),
(213, 'PES1UG20CS421', '5', '7', '1', '1', '2022-11-23'),
(214, 'PES1UG20CS422', '5', '7', '1', '1', '2022-11-23'),
(215, 'PES1UG20CS423', '5', '7', '1', '0', '2022-11-23'),
(216, 'PES1UG20CS424', '5', '7', '1', '1', '2022-11-23'),
(217, 'PES1UG20CS425', '5', '7', '1', '1', '2022-11-23'),
(218, 'PES1UG20CS426', '5', '11', '1', '1', '2022-11-23'),
(219, 'PES1UG20CS427', '5', '7', '1', '1', '2022-11-23'),
(220, 'PES1UG20CS823', '5', '7', '1', '1', '2022-11-23'),
(236, 'PES1UG20CS418', '5', '7', '1', '1', '2022-11-24'),
(237, 'PES1UG20CS419', '5', '7', '1', '1', '2022-11-24'),
(238, 'PES1UG20CS420', '5', '7', '1', '1', '2022-11-24'),
(239, 'PES1UG20CS421', '5', '7', '1', '1', '2022-11-24'),
(240, 'PES1UG20CS422', '5', '7', '1', '1', '2022-11-24'),
(241, 'PES1UG20CS423', '5', '7', '1', '0', '2022-11-24'),
(242, 'PES1UG20CS424', '5', '7', '1', '0', '2022-11-24'),
(243, 'PES1UG20CS425', '5', '7', '1', '1', '2022-11-24'),
(244, 'PES1UG20CS426', '5', '7', '1', '1', '2022-11-24'),
(245, 'PES1UG20CS427', '5', '7', '1', '1', '2022-11-24'),
(246, 'PES1UG20CS823', '5', '7', '1', '1', '2022-11-24'),
(247, 'PES1UG21CS821', '5', '7', '1', '1', '2022-11-25'),
(248, 'PES1UG20CS404', '5', '7', '1', '1', '2022-11-25'),
(249, 'PES1UG20CS405', '5', '7', '1', '1', '2022-11-25'),
(250, 'PES1UG20CS406', '5', '7', '1', '1', '2022-11-25'),
(251, 'PES1UG20CS407', '5', '7', '1', '0', '2022-11-25'),
(252, 'PES1UG20CS408', '5', '7', '1', '0', '2022-11-25'),
(253, 'PES1UG20CS409', '5', '7', '1', '0', '2022-11-25'),
(254, 'PES1UG20CS409', '5', '7', '1', '0', '2022-11-25'),
(255, 'PES1UG20CS411', '5', '7', '1', '0', '2022-11-25'),
(256, 'PES1UG20CS412', '5', '7', '1', '0', '2022-11-25'),
(257, 'PES1UG20CS413', '5', '7', '1', '0', '2022-11-25'),
(258, 'PES1UG20CS414', '5', '7', '1', '1', '2022-11-25'),
(259, 'PES1UG20CS415', '5', '7', '1', '1', '2022-11-25'),
(260, 'PES1UG20CS416', '5', '7', '1', '0', '2022-11-25'),
(261, 'PES1UG20CS417', '5', '7', '1', '1', '2022-11-25'),
(262, 'PES1UG20CS418', '5', '7', '1', '1', '2022-11-25'),
(263, 'PES1UG20CS419', '5', '7', '1', '1', '2022-11-25'),
(264, 'PES1UG20CS420', '5', '7', '1', '1', '2022-11-25'),
(265, 'PES1UG20CS421', '5', '7', '1', '1', '2022-11-25'),
(266, 'PES1UG20CS422', '5', '7', '1', '1', '2022-11-25'),
(267, 'PES1UG20CS423', '5', '7', '1', '0', '2022-11-25'),
(268, 'PES1UG20CS424', '5', '7', '1', '0', '2022-11-25'),
(269, 'PES1UG20CS425', '5', '7', '1', '1', '2022-11-25'),
(270, 'PES1UG20CS426', '5', '11', '1', '1', '2022-11-25'),
(271, 'PES1UG20CS427', '5', '7', '1', '1', '2022-11-25'),
(272, 'PES1UG20CS823', '5', '7', '1', '1', '2022-11-25'),
(273, 'PES1UG21CS821', '5', '7', '1', '1', '2022-11-26'),
(274, 'PES1UG20CS404', '5', '7', '1', '1', '2022-11-26'),
(275, 'PES1UG20CS405', '5', '7', '1', '1', '2022-11-26'),
(276, 'PES1UG20CS406', '5', '7', '1', '0', '2022-11-26'),
(277, 'PES1UG20CS407', '5', '7', '1', '0', '2022-11-26'),
(278, 'PES1UG20CS408', '5', '7', '1', '0', '2022-11-26'),
(279, 'PES1UG20CS409', '5', '7', '1', '0', '2022-11-26'),
(280, 'PES1UG20CS409', '5', '7', '1', '0', '2022-11-26'),
(281, 'PES1UG20CS411', '5', '7', '1', '0', '2022-11-26'),
(282, 'PES1UG20CS412', '5', '7', '1', '0', '2022-11-26'),
(283, 'PES1UG20CS413', '5', '7', '1', '0', '2022-11-26'),
(284, 'PES1UG20CS414', '5', '7', '1', '1', '2022-11-26'),
(285, 'PES1UG20CS415', '5', '7', '1', '0', '2022-11-26'),
(286, 'PES1UG20CS416', '5', '7', '1', '0', '2022-11-26'),
(287, 'PES1UG20CS417', '5', '7', '1', '1', '2022-11-26'),
(288, 'PES1UG20CS418', '5', '7', '1', '1', '2022-11-26'),
(289, 'PES1UG20CS419', '5', '7', '1', '0', '2022-11-26'),
(290, 'PES1UG20CS420', '5', '7', '1', '0', '2022-11-26'),
(291, 'PES1UG20CS421', '5', '7', '1', '1', '2022-11-26'),
(292, 'PES1UG20CS422', '5', '7', '1', '1', '2022-11-26'),
(293, 'PES1UG20CS423', '5', '7', '1', '0', '2022-11-26'),
(294, 'PES1UG20CS424', '5', '7', '1', '0', '2022-11-26'),
(295, 'PES1UG20CS425', '5', '7', '1', '1', '2022-11-26'),
(296, 'PES1UG20CS426', '5', '11', '1', '1', '2022-11-26'),
(297, 'PES1UG20CS427', '5', '7', '1', '1', '2022-11-26'),
(298, 'PES1UG20CS823', '5', '7', '1', '1', '2022-11-26'),
(299, 'PES1UG21CS821', '5', '7', '1', '1', '2022-11-27'),
(300, 'PES1UG20CS404', '5', '7', '1', '1', '2022-11-27'),
(301, 'PES1UG20CS405', '5', '7', '1', '1', '2022-11-27'),
(302, 'PES1UG20CS406', '5', '7', '1', '0', '2022-11-27'),
(303, 'PES1UG20CS407', '5', '7', '1', '0', '2022-11-27'),
(304, 'PES1UG20CS408', '5', '7', '1', '0', '2022-11-27'),
(305, 'PES1UG20CS409', '5', '7', '1', '0', '2022-11-27'),
(306, 'PES1UG20CS410', '5', '7', '1', '0', '2022-11-27'),
(307, 'PES1UG20CS411', '5', '7', '1', '0', '2022-11-27'),
(308, 'PES1UG20CS412', '5', '7', '1', '0', '2022-11-27'),
(309, 'PES1UG20CS413', '5', '7', '1', '0', '2022-11-27'),
(310, 'PES1UG20CS414', '5', '7', '1', '1', '2022-11-27'),
(311, 'PES1UG20CS415', '5', '7', '1', '0', '2022-11-27'),
(312, 'PES1UG20CS416', '5', '7', '1', '0', '2022-11-27'),
(313, 'PES1UG20CS417', '5', '7', '1', '1', '2022-11-27'),
(314, 'PES1UG20CS418', '5', '7', '1', '1', '2022-11-27'),
(315, 'PES1UG20CS419', '5', '7', '1', '0', '2022-11-27'),
(316, 'PES1UG20CS420', '5', '7', '1', '0', '2022-11-27'),
(317, 'PES1UG20CS421', '5', '7', '1', '1', '2022-11-27'),
(318, 'PES1UG20CS422', '5', '7', '1', '1', '2022-11-27'),
(319, 'PES1UG20CS423', '5', '7', '1', '0', '2022-11-27'),
(320, 'PES1UG20CS424', '5', '7', '1', '0', '2022-11-27'),
(321, 'PES1UG20CS425', '5', '7', '1', '1', '2022-11-27'),
(322, 'PES1UG20CS427', '5', '7', '1', '1', '2022-11-27'),
(323, 'PES1UG20CS823', '5', '7', '1', '1', '2022-11-27'),
(324, 'PES1UG21CS821', '5', '7', '1', '1', '2022-11-28'),
(325, 'PES1UG20CS404', '5', '7', '1', '1', '2022-11-28'),
(326, 'PES1UG20CS405', '5', '7', '1', '1', '2022-11-28'),
(327, 'PES1UG20CS406', '5', '7', '1', '0', '2022-11-28'),
(328, 'PES1UG20CS407', '5', '7', '1', '0', '2022-11-28'),
(329, 'PES1UG20CS408', '5', '7', '1', '0', '2022-11-28'),
(330, 'PES1UG20CS409', '5', '7', '1', '0', '2022-11-28'),
(331, 'PES1UG20CS410', '5', '7', '1', '0', '2022-11-28'),
(332, 'PES1UG20CS411', '5', '7', '1', '0', '2022-11-28'),
(333, 'PES1UG20CS412', '5', '7', '1', '0', '2022-11-28'),
(334, 'PES1UG20CS413', '5', '7', '1', '0', '2022-11-28'),
(335, 'PES1UG20CS414', '5', '7', '1', '1', '2022-11-28'),
(336, 'PES1UG20CS415', '5', '7', '1', '0', '2022-11-28'),
(337, 'PES1UG20CS416', '5', '7', '1', '0', '2022-11-28'),
(338, 'PES1UG20CS417', '5', '7', '1', '1', '2022-11-28'),
(339, 'PES1UG20CS418', '5', '7', '1', '1', '2022-11-28'),
(340, 'PES1UG20CS419', '5', '7', '1', '0', '2022-11-28'),
(341, 'PES1UG20CS420', '5', '7', '1', '0', '2022-11-28'),
(342, 'PES1UG20CS421', '5', '7', '1', '1', '2022-11-28'),
(343, 'PES1UG20CS422', '5', '7', '1', '1', '2022-11-28'),
(344, 'PES1UG20CS423', '5', '7', '1', '0', '2022-11-28'),
(345, 'PES1UG20CS424', '5', '7', '1', '0', '2022-11-28'),
(346, 'PES1UG20CS425', '5', '7', '1', '1', '2022-11-28'),
(347, 'PES1UG20CS427', '5', '7', '1', '1', '2022-11-28'),
(348, 'PES1UG20CS823', '5', '7', '1', '1', '2022-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `tblclass`
--

CREATE TABLE `tblclass` (
  `Id` int(10) NOT NULL,
  `className` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclass`
--

INSERT INTO `tblclass` (`Id`, `className`) VALUES
(5, 'CSE5'),
(6, 'CSE7');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassarms`
--

CREATE TABLE `tblclassarms` (
  `Id` int(10) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmName` varchar(255) NOT NULL,
  `isAssigned` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclassarms`
--

INSERT INTO `tblclassarms` (`Id`, `classId`, `classArmName`, `isAssigned`) VALUES
(7, '5', 'G', '1'),
(8, '5', 'F', '0'),
(9, '6', 'I', '1'),
(10, '5', 'A', '0'),
(11, '5', 'B', '1'),
(12, '5', 'C', '0'),
(13, '5', 'D', '1'),
(14, '5', 'E', '0'),
(15, '5', 'H', '1'),
(16, '5', 'I', '0'),
(17, '6', 'A', '0'),
(18, '6', 'B', '0'),
(19, '6', 'C', '0'),
(20, '6', 'D', '0'),
(21, '6', 'E', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassteacher`
--

CREATE TABLE `tblclassteacher` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclassteacher`
--

INSERT INTO `tblclassteacher` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`, `phoneNo`, `classId`, `classArmId`, `dateCreated`) VALUES
(10, 'Teacher', 'Teacher', 'teacher@teacher.com', '8d788385431273d11e8b43bb78f3aa41', '1234567890', '5', '13', '2020-11-23'),
(26, 'Ramana', 'Naik', 'sharath@gmail.com', 'khfjeahjnhfdj', '0987654321', '5', '11', '2022-11-28'),
(27, 'Ramana', 'Naik', 'sharath@gmail.com', 'khfjeahjnhfdj', '0987654321', '5', '11', '2022-11-28'),
(7, 'Pavankumar', 'Hegde', 'pavankumar@gmail.com', '8d788385431273d11e8b43bb78f3aa41', '8310411389', '5', '7', '2020-11-22');

--
-- Triggers `tblclassteacher`
--
DELIMITER $$
CREATE TRIGGER `classteacher_backup` BEFORE DELETE ON `tblclassteacher` FOR EACH ROW BEGIN  
	INSERT INTO tblclassteacher_backup VALUES(old.Id, old.firstName, old.lastName, old.emailAddress, old.password, old.phoneNo, old.classId, old.classArmId, old.dateCreated, CURRENT_DATE);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblclassteacher_backup`
--

CREATE TABLE `tblclassteacher_backup` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL,
  `dateLeft` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclassteacher_backup`
--

INSERT INTO `tblclassteacher_backup` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`, `phoneNo`, `classId`, `classArmId`, `dateCreated`, `dateLeft`) VALUES
(12, 'Ram', 'Krishna', 'ram@gmail.com', 'dsmnhbchbdsvndbxcjdsf', '34758752925', '5', '11', '2022-11-28', '2022-11-28'),
(11, 'Sharath', 'Krishna', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11', '2022-11-23', '2022-11-29'),
(12, 'Krishna', 'hegde', 'ram@gmail.com', 'ftfygugyvgvj', '34758752925', '5', '11', '2022-11-28', '2022-12-02');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassteacher_dummy`
--

CREATE TABLE `tblclassteacher_dummy` (
  `Id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclassteacher_dummy`
--

INSERT INTO `tblclassteacher_dummy` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`, `phoneNo`, `classId`, `classArmId`, `dateCreated`) VALUES
(10, 'Teacher', 'Teacher', 'teacher@teacher.com', '8d788385431273d11e8b43bb78f3aa41', '1234567890', '5', '13', '2020-11-23'),
(7, 'Pavankumar', 'Hegde', 'pavankumar@gmail.com', '8d788385431273d11e8b43bb78f3aa41', '8310411389', '5', '7', '2020-11-22'),
(12, 'Sharath', 'Krishna', 'sharath@gmail.com', '21232f297a57a5a743894a0e4a801fc3', '0987654321', '5', '11', '2022-11-23'),
(424, 'Suresh', 'Naik', 'ram@gmail.com', 'dhnfjndcd', '45735743', '5', '11', '2022-11-29');

--
-- Triggers `tblclassteacher_dummy`
--
DELIMITER $$
CREATE TRIGGER `chk` BEFORE INSERT ON `tblclassteacher_dummy` FOR EACH ROW BEGIN
    IF (SELECT COUNT(*) FROM backup_faculty WHERE backup_faculty.username1=NEW.emailAddress) > 0
    THEN
        CALL updateClassTeacher(NEW.ID, 298, NEW.emailAddress);
    ELSE
    	CALL updateClassTeacher(NEW.ID, 398, NEW.emailAddress);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblsessionterm`
--

CREATE TABLE `tblsessionterm` (
  `Id` int(10) NOT NULL,
  `sessionName` varchar(50) NOT NULL,
  `termId` varchar(50) NOT NULL,
  `isActive` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsessionterm`
--

INSERT INTO `tblsessionterm` (`Id`, `sessionName`, `termId`, `isActive`, `dateCreated`) VALUES
(1, '10:10AM Machine Intelligence', '1', '1', '2020-10-31'),
(3, '9:10AM Software Engineering', '2', '0', '2020-10-31'),
(4, '8:10AM Database Management', '1', '0', '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `otherName` varchar(255) NOT NULL,
  `admissionNumber` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`Id`, `firstName`, `lastName`, `otherName`, `admissionNumber`, `password`, `classId`, `classArmId`, `dateCreated`) VALUES
(46, 'NAGARATNA', 'MANJUNATH NAIK', 'Nagaratna', 'PES1UG21CS821', '12345', '5', '7', '2022-11-23'),
(19, 'SHREYANSH', 'SRIVASTAVA', 'SHREYANSH', 'PES1UG20CS404', '12345', '5', '7', '2022-11-22'),
(20, 'SHREYAS', 'BATULA', 'SHREYAS', 'PES1UG20CS405', '12345', '5', '7', '2022-11-22'),
(21, 'SHREYAS', 'HIREMATH', 'SHREYAS', 'PES1UG20CS406', '12345', '5', '7', '2022-11-22'),
(22, 'SHREYAS', 'JAISWAL', 'SHREYAS', 'PES1UG20CS407', '12345', '5', '7', '2022-11-22'),
(23, 'SHREYAS', 'S', 'SHREYAS', 'PES1UG20CS408', '12345', '5', '7', '2022-11-22'),
(24, 'SHREYAS S', 'KAUNDINYA', 'SHREYAS', 'PES1UG20CS409', '12345', '5', '7', '2022-11-22'),
(25, 'SHREYAS', 'CHATARJEE', 'SHREYAS', 'PES1UG20CS410', '12345', '5', '7', '2022-11-22'),
(26, 'SHRIYA', 'GUNTUR', 'SHRIYA', 'PES1UG20CS411', '12345', '5', '7', '2022-11-22'),
(27, 'SHRINIDHI', 'K J', 'SHRINIDHI', 'PES1UG20CS412', '12345', '5', '7', '2022-11-22'),
(28, 'SHRINITHI', 'NATARAJAN', 'SHRINITHI', 'PES1UG20CS413', '12345', '5', '7', '2022-11-22'),
(29, 'SHRIYA S', 'SHASTRY', 'SHRIYA', 'PES1UG20CS414', '12345', '5', '7', '2022-11-22'),
(30, 'SHRUJAN', ' ', 'SHRUJAN', 'PES1UG20CS415', '12345', '5', '7', '2022-11-22'),
(31, 'Shruthi', 'Pai', 'Shruthi', 'PES1UG20CS416', '12345', '5', '7', '2022-11-22'),
(32, 'SHRUTHI', 'MANOHAR KARANDE', 'Shruthi', 'PES1UG20CS417', '12345', '5', '7', '2022-11-22'),
(33, 'SHUBHANGI', 'SAXENA', 'SHUBHANGI', 'PES1UG20CS418', '12345', '5', '7', '2022-11-22'),
(34, 'SHUBHA V', 'HEGDE', 'Shubha', 'PES1UG20CS419', '12345', '5', '7', '2022-11-22'),
(35, 'SHUBHAM', 'S', 'Shubham', 'PES1UG20CS420', '12345', '5', '7', '2022-11-22'),
(36, 'SHUCHITH', 'B U', 'Shuchith', 'PES1UG20CS421', '12345', '5', '7', '2022-11-22'),
(37, 'SHYAM KRISHNA', 'KIRTHIVASAN', 'Shyam', 'PES1UG20CS422', '12345', '5', '7', '2022-11-23'),
(38, 'SIDDARTH M', 'P', 'Siddarth', 'PES1UG20CS423', '12345', '5', '7', '2022-11-23'),
(39, 'SIDDARTH', 'KUMAR', 'Siddarth', 'PES1UG20CS424', '12345', '5', '7', '2022-11-23'),
(40, 'Sidharth', 'M', 'Siddharth', 'PES1UG20CS425', '12345', '5', '7', '2022-11-23'),
(41, 'SIDDHARTH G', 'SOORA', 'SIDDHARTH', 'PES1UG20CS426', '12345', '5', '11', '2022-11-23'),
(42, 'SIDDHARTH', 'P', 'Siddharth', 'PES1UG20CS427', '12345', '5', '7', '2022-11-23'),
(43, 'Pavankumar', ' LAXMINARAYAN H K', 'Pavankumar', 'PES1UG20CS823', '12345', '5', '7', '2022-11-23'),
(44, 'R', 'RAHUL', 'Rahul', 'PES1UG20CS316', '12345', '5', '8', '2022-11-23'),
(45, 'RAGHUNANDAN', 'KS', 'Raghu', 'PES1UG20CS317', '12345', '5', '8', '2022-11-23'),
(47, 'Raghava', 'N', 'Raghav', 'PES1UG20CS825', '12345', '5', '14', '2022-11-28'),
(48, 'Nagesh', 'Gowda', 'Nagesh', 'PES1UG20CS818', '12345', '6', '18', '2022-11-28'),
(49, 'Suresh', 'Naik', 'Suresh', 'PES1UG20CS714', '12345', '6', '20', '2022-11-28'),
(50, 'Soumya', 'Shetty', 'Soumya', 'PES1UG20CS816', '1234', '5', '11', '2022-11-28'),
(51, 'Siddarth', 'S', 'Siddarth', 'PES1UG19CS416', '12345', '6', '18', '2022-11-28');

--
-- Triggers `tblstudents`
--
DELIMITER $$
CREATE TRIGGER `student_details` AFTER INSERT ON `tblstudents` FOR EACH ROW BEGIN  
INSERT INTO student_details VALUES(new.admissionNumber, new.firstName, new.lastName, CONCAT(new.firstName," ",new.lastName), new.password, new.classId, new.classArmId, new.dateCreated);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblterm`
--

CREATE TABLE `tblterm` (
  `Id` int(10) NOT NULL,
  `termName` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblterm`
--

INSERT INTO `tblterm` (`Id`, `termName`) VALUES
(1, '8.15AM'),
(2, '9.15AM'),
(3, '10.15AM');

-- --------------------------------------------------------

--
-- Table structure for table `trial`
--

CREATE TABLE `trial` (
  `name` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `midname` varchar(50) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trial`
--

INSERT INTO `trial` (`name`, `firstname`, `lastname`, `midname`, `id`) VALUES
('Ravi', 'Kiran', 'Suhan', 'shyam', 1),
('Ravi', 'Kiran', 'Suhan', 'shyam', 2),
('Charan', 'Gouda', 'Suhan', 'shyam', 3);

--
-- Triggers `trial`
--
DELIMITER $$
CREATE TRIGGER `trial_backup` BEFORE DELETE ON `trial` FOR EACH ROW BEGIN  
	INSERT INTO trial_backup VALUES(old.name , old.firstname, old.lastname, old.midname, CURRENT_DATE, old.id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `trial_backup`
--

CREATE TABLE `trial_backup` (
  `name` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `midname` varchar(50) NOT NULL,
  `deletedon` varchar(50) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trial_backup`
--

INSERT INTO `trial_backup` (`name`, `firstname`, `lastname`, `midname`, `deletedon`, `id`) VALUES
('Ravi', 'Naik', 'Suhan', 'shyam', '2022-11-28', 4),
('Manoj', 'Naik', 'Suhan', 'shyam', '2022-11-29', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `emailAddress` (`emailAddress`);

--
-- Indexes for table `tblattendance`
--
ALTER TABLE `tblattendance`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `classId` (`classId`),
  ADD KEY `classArmId` (`classArmId`),
  ADD KEY `sessionTermId` (`sessionTermId`);

--
-- Indexes for table `tblclass`
--
ALTER TABLE `tblclass`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclassarms`
--
ALTER TABLE `tblclassarms`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `classId` (`classId`);

--
-- Indexes for table `tblclassteacher`
--
ALTER TABLE `tblclassteacher`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `classId` (`classId`),
  ADD KEY `classArmId` (`classArmId`);

--
-- Indexes for table `tblclassteacher_dummy`
--
ALTER TABLE `tblclassteacher_dummy`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblsessionterm`
--
ALTER TABLE `tblsessionterm`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `termId` (`termId`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `admissionNumber` (`admissionNumber`),
  ADD KEY `classId` (`classId`),
  ADD KEY `classArmId` (`classArmId`);

--
-- Indexes for table `tblterm`
--
ALTER TABLE `tblterm`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `trial`
--
ALTER TABLE `trial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trial_backup`
--
ALTER TABLE `trial_backup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblattendance`
--
ALTER TABLE `tblattendance`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT for table `tblclass`
--
ALTER TABLE `tblclass`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblclassarms`
--
ALTER TABLE `tblclassarms`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblclassteacher`
--
ALTER TABLE `tblclassteacher`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tblsessionterm`
--
ALTER TABLE `tblsessionterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tblterm`
--
ALTER TABLE `tblterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trial`
--
ALTER TABLE `trial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
