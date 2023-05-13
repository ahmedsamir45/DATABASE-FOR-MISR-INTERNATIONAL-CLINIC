-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2022 at 03:25 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `misr_international_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `ID` int(255) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Salary` decimal(18,2) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Job` char(50) NOT NULL,
  `Age` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`ID`, `Fname`, `Lname`, `Salary`, `Address`, `Job`, `Age`) VALUES
(10804, 'Abdalla', 'El masry', '10000.00', 'faisal,haram', 'Neurosurgeon Doctor', 40),
(12345, 'Ahmed', 'Mohamed', '2500.00', 'nasr city', 'Nurse', 31),
(16384, 'Omar', 'Tarek', '10000.00', 'giza,faisal', 'Anesthetization Doctor', 46),
(18340, 'Khaled', 'Afify', '6000.00', 'giza,haram street', 'Chief Financial Officer', 49),
(18936, 'Kareem', 'Emad', '2300.00', 'faisal,maryotia', 'Accountant', 30),
(23456, 'wael', 'said', '2000.00', 'faisal', 'Accountant', 28),
(56010, 'Mohamed', 'Tarek', '1900.00', 'giza,faisal', 'Clean Worker', 36),
(67015, 'Ahmed', 'Yasser', '8000.00', 'giza,haram', 'Dentist', 37),
(80104, 'wael', 'ahmed', '1500.00', 'giza', 'Accountant', 24),
(80901, 'Mohamed', 'El Sayed', '7000.00', 'giza,doki', 'Internal Doctor', 53),
(87230, 'Ahmed', 'Ali', '2300.00', 'giza,twabik', 'Accountant', 33),
(87391, 'Omar', 'Alaa', '4500.00', 'giza,faisal', 'Nurse', 29),
(89010, 'Mohamed', 'Gareeb', '11000.00', 'giaza,faisal', 'Anesthetization Doctor', 50),
(89014, 'Omar', 'Attia', '7500.00', 'giza,haram', 'Dentist', 49),
(89015, 'Ahmed', 'Tarek', '9000.00', 'giza,talbya', 'Internal Doctor', 57),
(89104, 'wael', 'ahmed', '1500.00', 'giza', 'Accountant', 50),
(90130, 'wael', 'Ahmed', '15000.00', 'giza,twabik', 'Surgeon', 51),
(90701, 'Mohamed', 'Mahmoud', '2350.00', 'giza,doky', 'Accountant', 30),
(90901, 'Yossef', 'Magdy', '2200.00', 'Giza,matbaa', 'Accountant', 28),
(98090, 'Mohamed', 'Magdy', '2000.00', 'giza,haram', 'Nurse', 26),
(98120, 'Ali', 'Alaa', '3000.00', 'giza,hadayk el ahram', 'Pharmacist', 30),
(98201, 'Mohamed', 'khaled', '8500.00', 'faisal', 'Surgeon', 37);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `Patient_ID` int(11) NOT NULL,
  `Doctor_ID` int(11) NOT NULL,
  `Doctor_examination_days` varchar(255) DEFAULT NULL,
  `date_examination` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`Patient_ID`, `Doctor_ID`, `Doctor_examination_days`, `date_examination`) VALUES
(198, 90130, 'Friday', '2022-12-09'),
(234, 67015, 'Monday', '2022-12-05'),
(235, 90130, 'Wednesday', '2022-12-07'),
(398, 98201, 'Tuesday', '2022-12-06'),
(456, 98201, 'Friday', '2022-12-09'),
(601, 89015, 'Sunday', '2022-12-04'),
(657, 10804, 'Sunday', '2022-12-04'),
(671, 16384, 'Monday', '2022-12-05'),
(687, 80901, 'Wednesday', '2022-12-07'),
(763, 23456, 'Sunday', '2022-12-04'),
(785, 67015, 'Thursday', '2022-12-08'),
(789, 10804, 'Monday', '2022-12-05'),
(809, 16384, 'Wednesday', '2022-12-07'),
(863, 10804, 'Wednesday', '2022-12-07'),
(875, 98201, 'Monday', '2022-12-05'),
(903, 16384, 'Friday', '2022-12-09'),
(906, 89015, 'Saturday', '2022-12-03'),
(907, 89014, 'Thursday', '2022-12-08'),
(937, 89010, 'Sunday', '2022-12-04'),
(984, 67015, 'Tuesday', '2022-12-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`Patient_ID`),
  ADD KEY `Doctor_ID` (`Doctor_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `employees` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
