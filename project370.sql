-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2025 at 06:00 PM
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
-- Database: `project370`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `username` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `home_address` varchar(255) DEFAULT NULL,
  `program` varchar(100) DEFAULT NULL,
  `session` varchar(50) DEFAULT NULL,
  `cgpa` decimal(3,2) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `job_location` varchar(100) DEFAULT NULL,
  `approve` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`username`, `name`, `gender`, `dob`, `email`, `phone`, `home_address`, `program`, `session`, `cgpa`, `designation`, `company_name`, `job_location`, `approve`) VALUES
('rafi69', 'Rafi', 'Male', '2222-12-14', 'rafi@gmail.com', '0058101058051', 'CTG', 'MIC', '2022', 4.00, 'Software Engineer', 'Meta', 'USA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `alumni_verification`
--

CREATE TABLE `alumni_verification` (
  `admin_username` varchar(50) NOT NULL,
  `alumni_username` varchar(50) NOT NULL,
  `verification_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_history`
--

CREATE TABLE `chat_history` (
  `id` int(11) NOT NULL,
  `sender_username` varchar(50) DEFAULT NULL,
  `receiver_username` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `time_sent` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `event_description` text DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `event_creator` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_verification`
--

CREATE TABLE `event_verification` (
  `admin_username` varchar(50) NOT NULL,
  `event_id` int(11) NOT NULL,
  `verification_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `gsuite_email` varchar(100) DEFAULT NULL,
  `approve` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `username`, `name`, `department`, `gsuite_email`, `approve`) VALUES
(2216154, 'anupam', 'anupam', 'cse', 'anupam.sen@g.bracu.ac.bd', 1),
(22203333, 'nahid22', 'Nahid', 'CSE', 'nahid@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_verification`
--

CREATE TABLE `student_verification` (
  `admin_username` varchar(50) NOT NULL,
  `student_username` varchar(50) NOT NULL,
  `verification_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('student','alumni') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `type`) VALUES
('anupam', '1234', 'student'),
('nahid22', '54321', 'student'),
('rafi69', '1234', 'alumni');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `alumni_verification`
--
ALTER TABLE `alumni_verification`
  ADD PRIMARY KEY (`admin_username`,`alumni_username`),
  ADD KEY `alumni_username` (`alumni_username`);

--
-- Indexes for table `chat_history`
--
ALTER TABLE `chat_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_username` (`sender_username`),
  ADD KEY `receiver_username` (`receiver_username`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_creator` (`event_creator`);

--
-- Indexes for table `event_verification`
--
ALTER TABLE `event_verification`
  ADD PRIMARY KEY (`admin_username`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `student_verification`
--
ALTER TABLE `student_verification`
  ADD PRIMARY KEY (`admin_username`,`student_username`),
  ADD KEY `student_username` (`student_username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_history`
--
ALTER TABLE `chat_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `alumni`
--
ALTER TABLE `alumni`
  ADD CONSTRAINT `alumni_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `alumni_verification`
--
ALTER TABLE `alumni_verification`
  ADD CONSTRAINT `alumni_verification_ibfk_1` FOREIGN KEY (`admin_username`) REFERENCES `admin` (`username`),
  ADD CONSTRAINT `alumni_verification_ibfk_2` FOREIGN KEY (`alumni_username`) REFERENCES `alumni` (`username`);

--
-- Constraints for table `chat_history`
--
ALTER TABLE `chat_history`
  ADD CONSTRAINT `chat_history_ibfk_1` FOREIGN KEY (`sender_username`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `chat_history_ibfk_2` FOREIGN KEY (`receiver_username`) REFERENCES `user` (`username`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_creator`) REFERENCES `user` (`username`);

--
-- Constraints for table `event_verification`
--
ALTER TABLE `event_verification`
  ADD CONSTRAINT `event_verification_ibfk_1` FOREIGN KEY (`admin_username`) REFERENCES `admin` (`username`),
  ADD CONSTRAINT `event_verification_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `student_verification`
--
ALTER TABLE `student_verification`
  ADD CONSTRAINT `student_verification_ibfk_1` FOREIGN KEY (`admin_username`) REFERENCES `admin` (`username`),
  ADD CONSTRAINT `student_verification_ibfk_2` FOREIGN KEY (`student_username`) REFERENCES `student` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
