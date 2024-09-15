-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2024 at 06:31 AM
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
-- Database: `edoctor`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`) VALUES
('admin@cuea.edu', '123');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appid` int(11) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `pid` int(20) NOT NULL,
  `did` int(20) NOT NULL,
  `checked_out` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appid`, `appdate`, `apptime`, `pid`, `did`, `checked_out`) VALUES
(27, '2024-04-29', '15:00:00', 3, 3, 1),
(31, '2024-04-29', '12:45:00', 3, 4, 1),
(35, '2024-05-22', '14:00:00', 1, 4, 0),
(38, '2024-09-02', '09:04:00', 8, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `did` int(11) NOT NULL,
  `demail` varchar(50) NOT NULL,
  `dpassword` varchar(255) NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `dtel` varchar(15) NOT NULL,
  `dname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`did`, `demail`, `dpassword`, `specialization`, `dtel`, `dname`) VALUES
(4, 'davison@cuea.edu', '123', '3', '0701609263', 'Davison'),
(5, 'john@cuea.edu', '123', '6', '0712345678', 'John'),
(6, 'doctorM@cuea.edu', '123', '5', '0712345678', 'Maina');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `pid`, `message`, `status`, `created_at`) VALUES
(1, 3, 'Your appointment on 2024-05-06 at 04:23:00 has been rescheduled to 2024-04-29 at 15:00.', 'unread', '2024-05-24 20:00:14'),
(2, 3, 'Your appointment on 2024-05-21 at 09:40:00 has been rescheduled to 2024-04-29 at 12:45.', 'unread', '2024-05-27 12:45:18'),
(3, 3, 'Your appointment with ID 34 has been checked out.', 'unread', '2024-05-28 16:10:08'),
(4, 4, 'Your appointment with ID 34 has been checked out.', 'unread', '2024-05-28 16:10:08'),
(5, 3, 'Your appointment on 2024-05-05 at 10:10:00 has been canceled.', 'unread', '2024-05-28 16:15:19'),
(6, 3, 'Your appointment with ID 33 has been removed.', 'unread', '2024-05-28 16:20:45'),
(7, 4, 'Your appointment with ID 33 has been removed.', 'unread', '2024-05-28 16:20:45');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `admission_number` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `first_name`, `last_name`, `dob`, `email`, `password`, `mobile_number`, `admission_number`) VALUES
(1, 'Helga', 'Bwari', '2024-05-14', 'helga@cuea.edu', '123', '0701609262', '1040529'),
(3, 'Christine', 'Mirimba', '2024-05-16', 'chrismirimba@cuea.edu', '123', '0712345678', '1040527'),
(4, 'Angela', 'Nyanchama', '2024-05-15', 'angela@cuea.edu', '123', '0712387654', '1040522'),
(5, 'Mazingira', 'Mazingira', '2001-01-01', 'mazingira@cuea.edu', '123', '0712387654', '1040522'),
(7, 'Cynthia', 'Omwenga', '2024-09-01', 'omwengacynthia@cuea.edu', '12345', '0710020030', '1037527'),
(9, 'Cynthia', 'Sagini', '2024-09-01', 'saginicynthia@cuea.edu', '1234', '0712345678', '10000');

-- --------------------------------------------------------

--
-- Table structure for table `specialization`
--

CREATE TABLE `specialization` (
  `sid` int(11) NOT NULL,
  `sname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specialization`
--

INSERT INTO `specialization` (`sid`, `sname`) VALUES
(1, 'dentist'),
(2, 'General doctor'),
(3, 'optician'),
(4, 'gynecologist'),
(5, 'psychiatrist'),
(6, 'surgeon');

-- --------------------------------------------------------

--
-- Table structure for table `webuser`
--

CREATE TABLE `webuser` (
  `email` varchar(255) NOT NULL,
  `usertype` char(1) NOT NULL CHECK (`usertype` in ('a','p','d'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `webuser`
--

INSERT INTO `webuser` (`email`, `usertype`) VALUES
('admin@cuea.edu', 'a'),
('angela@cuea.edu', 'p'),
('chrismirimba@cuea.edu', 'p'),
('davison@cuea.edu', 'd'),
('doctor@cuea.edu', 'd'),
('doctorM@cuea.edu', 'd'),
('helga@cua.edu', 'p'),
('john@cuea.edu', 'd'),
('mazingira@cuea.edu', 'p'),
('saginicynthia@cuea.edu', 'p');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialization`
--
ALTER TABLE `specialization`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `webuser`
--
ALTER TABLE `webuser`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `specialization`
--
ALTER TABLE `specialization`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
