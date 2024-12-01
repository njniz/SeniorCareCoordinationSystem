-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2024 at 02:37 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seniorcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `ActivityID` int NOT NULL,
  `ActivityName` varchar(255) NOT NULL,
  `Description` text,
  `Email` varchar(255) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `caregiver`
--

CREATE TABLE `caregiver` (
  `CaregiverID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` text,
  `Specialty` varchar(255) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `Profile_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  `Full_Name` varchar(100) NOT NULL,
  `Address` text,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`Profile_ID`, `User_ID`, `Full_Name`, `Address`, `Gender`, `Date_of_Birth`) VALUES
(1, 1, 'John Doe', '123 Main St, Cityville', 'Male', '1990-01-01'),
(2, 2, 'Jane Doe', '456 Elm St, Townsville', 'Female', '1985-05-15');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Role_ID` int NOT NULL,
  `Role_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Role_ID`, `Role_Name`) VALUES
(1, 'Admin'),
(2, 'Caregiver'),
(4, 'Family Member'),
(5, 'Healthcare Provider'),
(3, 'Senior');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `ScheduleID` int NOT NULL,
  `SeniorID` int DEFAULT NULL,
  `CaregiverID` int DEFAULT NULL,
  `ActivityID` int DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `senior`
--

CREATE TABLE `senior` (
  `SeniorID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address` text,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `MedicalCondition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone_Number` varchar(15) NOT NULL,
  `Role` int NOT NULL,
  `Date_Created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `Username`, `Password`, `Email`, `Phone_Number`, `Role`, `Date_Created`) VALUES
(1, 'johndoe', '$2b$10$hashedpasswordhere', 'john@example.com', '1234567890', 2, '2024-11-28 18:31:41'),
(2, 'janedoe', '$2b$10$hashedpasswordhere', 'jane@example.com', '0987654321', 3, '2024-11-28 18:31:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`ActivityID`);

--
-- Indexes for table `caregiver`
--
ALTER TABLE `caregiver`
  ADD PRIMARY KEY (`CaregiverID`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`Profile_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Role_ID`),
  ADD UNIQUE KEY `Role_Name` (`Role_Name`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`ScheduleID`),
  ADD KEY `SeniorID` (`SeniorID`),
  ADD KEY `CaregiverID` (`CaregiverID`),
  ADD KEY `ActivityID` (`ActivityID`),
  ADD KEY `CreatedBy` (`CreatedBy`);

--
-- Indexes for table `senior`
--
ALTER TABLE `senior`
  ADD PRIMARY KEY (`SeniorID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `Role` (`Role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `ActivityID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `caregiver`
--
ALTER TABLE `caregiver`
  MODIFY `CaregiverID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `Profile_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `Role_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `ScheduleID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `senior`
--
ALTER TABLE `senior`
  MODIFY `SeniorID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`SeniorID`) REFERENCES `senior` (`SeniorID`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`CaregiverID`) REFERENCES `caregiver` (`CaregiverID`),
  ADD CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`ActivityID`) REFERENCES `activity` (`ActivityID`),
  ADD CONSTRAINT `schedule_ibfk_4` FOREIGN KEY (`CreatedBy`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`Role`) REFERENCES `role` (`Role_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
