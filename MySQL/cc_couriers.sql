-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 09:40 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cc_couriers`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `arrived`
-- (See below for the actual view)
--
CREATE TABLE `arrived` (
`TrackingID` int(11)
,`StaffID` varchar(30)
,`S_Name` varchar(30)
,`S_Add` varchar(50)
,`S_City` varchar(20)
,`S_State` varchar(20)
,`S_Contact` bigint(20)
,`R_Name` varchar(30)
,`R_Add` varchar(50)
,`R_City` varchar(20)
,`R_State` varchar(20)
,`R_Contact` bigint(20)
,`Weight_Kg` decimal(10,2)
,`Price` decimal(10,2)
,`Dispatched_Time` timestamp
,`Shipped` timestamp
,`Out_for_delivery` timestamp
,`Delivered` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `Branch_id` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Contact` bigint(20) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Manager_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`Branch_id`, `Address`, `Contact`, `Email`, `Manager_id`) VALUES
(1, '11, St.Joseph Church Campus, Dindigul - 624001', 4512424892, 'cccourierdgl@xyz.com', 'CC3511'),
(2, 'B-211, 11th Avenue, Ashok Nagar, Chennai - 600083', 4443147782, 'cccourierschennai@xyz.com', 'CC0246'),
(3, '5E, Municipal Office Street, Tiruppur - 641604', 4214956251, 'cccourierstiruppur@xyz.com', 'CC1234'),
(4, '72, Arun complex, Brough Road, Erode - 638001', 4245276485, 'cccourierserode@xyz.com', 'CC1212'),
(5, '207, Abirami Nagar, Mettupalayam Road, Koundapalayam, Coimbatore - 641030', 3563343593, 'cccourierscbe@xyz.com', 'CC3503');

-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE `credentials` (
  `StaffID` varchar(30) NOT NULL,
  `Pwd` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credentials`
--

INSERT INTO `credentials` (`StaffID`, `Pwd`) VALUES
('CC0101', '0101'),
('CC0246', '0246'),
('CC0369', '0369'),
('CC1212', '1212'),
('CC1234', '1234'),
('CC3267', '3267'),
('CC3503', '14-07'),
('CC3511', '3511'),
('CC4567', '4567'),
('CC5555', '5555'),
('CC9876', '9876');

-- --------------------------------------------------------

--
-- Stand-in structure for view `delivered`
-- (See below for the actual view)
--
CREATE TABLE `delivered` (
`TrackingID` int(11)
,`StaffID` varchar(30)
,`S_Name` varchar(30)
,`S_Add` varchar(50)
,`S_City` varchar(20)
,`S_State` varchar(20)
,`S_Contact` bigint(20)
,`R_Name` varchar(30)
,`R_Add` varchar(50)
,`R_City` varchar(20)
,`R_State` varchar(20)
,`R_Contact` bigint(20)
,`Weight_Kg` decimal(10,2)
,`Price` decimal(10,2)
,`Dispatched_Time` timestamp
,`Shipped` timestamp
,`Out_for_delivery` timestamp
,`Delivered` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `F.No` int(11) NOT NULL,
  `Cust_name` varchar(30) NOT NULL,
  `Cust_mail` varchar(50) NOT NULL,
  `Cust_msg` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`F.No`, `Cust_name`, `Cust_mail`, `Cust_msg`) VALUES
(1, 'Ajitesh Mahalingam', 'ajitesh.mahalingam2@gmail.com', 'Test'),
(2, 'Torvus', 'tovus@gmail.com', 'I will be glad to know about the job opportunities open in Udumalpet branch '),
(3, 'Ajitesh M', 'ajitesh.mahalingam@gmail.com', 'Track ID = 10812. Faced an issue of damaged package.'),
(4, 'Madhu', 'madhumitha@gmail.com', 'Great service. Thank You Ma\'am.'),
(5, 'Madhu', 'madhumitha@gmail.com', 'Great service. Thank You Ma\'am.'),
(6, 'Vinay', 'vinay1324@gmail.com', 'Sir/Mam,\r\nTracking ID : 10812\r\nReceived damaged package.'),
(7, 'Ajitesh', 'ajitesh@gmail.com', 'Great service.');

-- --------------------------------------------------------

--
-- Table structure for table `parcel`
--

CREATE TABLE `parcel` (
  `TrackingID` int(11) NOT NULL,
  `StaffID` varchar(30) NOT NULL,
  `S_Name` varchar(30) NOT NULL,
  `S_Add` varchar(50) NOT NULL,
  `S_City` varchar(20) NOT NULL,
  `S_State` varchar(20) NOT NULL,
  `S_Contact` bigint(20) NOT NULL,
  `R_Name` varchar(30) NOT NULL,
  `R_Add` varchar(50) NOT NULL,
  `R_City` varchar(20) NOT NULL,
  `R_State` varchar(20) NOT NULL,
  `R_Contact` bigint(20) NOT NULL,
  `Weight_Kg` decimal(10,2) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Dispatched_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parcel`
--

INSERT INTO `parcel` (`TrackingID`, `StaffID`, `S_Name`, `S_Add`, `S_City`, `S_State`, `S_Contact`, `R_Name`, `R_Add`, `R_City`, `R_State`, `R_Contact`, `Weight_Kg`, `Price`, `Dispatched_Time`) VALUES
(10806, 'CC3503', 'Landon', '5, Greenpark Residency', 'Trichy', 'Tamil Nadu', 9944557860, 'Sanjuktha', '15, Eden palace', 'Chennai', 'Tamil Nadu', 9912365407, '5.50', '275.00', '2021-05-06 06:40:29'),
(10807, 'CC0246', 'Lizzie', '5, Salvatore Boarding House', 'Coimbatore', 'Tamil Nadu', 9487512036, 'Jossie', '8, French quarters', 'Agra', 'Uttar Pradesh', 941212360, '2.75', '962.50', '2021-05-06 10:34:38'),
(10808, 'CC0246', 'Lizzie', '5, Salvatore Boarding House', 'Coimbatore', 'Tamil Nadu', 9487512036, 'Jossie', '8, French quarters', 'Agra', 'Uttar Pradesh', 941212360, '2.75', '962.50', '2021-05-06 11:01:43'),
(10809, 'CC0246', 'Lizzie', '5, Salvatore Boarding House', 'Coimbatore', 'Tamil Nadu', 9487512036, 'Jossie', '8, French quarters', 'Agra', 'Uttar Pradesh', 941212360, '2.75', '962.50', '2021-05-06 11:03:57'),
(10810, 'CC0246', 'Karthick', '1, TRN Gardens', 'Udumalpet', 'Tamil Nadu', 9417417410, 'Dhamini', '7/8, Arun excelo, Avadi', 'Chennai', 'Tamil Nadu', 9412365870, '2.00', '100.00', '2021-05-06 13:25:54'),
(10811, 'CC0246', 'Karthick', '1, TRN Gardens', 'Udumalpet', 'Tamil Nadu', 9417417410, 'Dhamini', '7/8, Arun excelo, Avadi', 'Chennai', 'Tamil Nadu', 9412365870, '2.00', '100.00', '2021-05-06 13:29:40'),
(10812, 'CC0246', 'Karthick', '1, TRN Gardens', 'Udumalpet', 'Tamil Nadu', 9417417410, 'Dhamini', '7/8, Arun excelo, Avadi', 'Chennai', 'Tamil Nadu', 9412365870, '2.00', '100.00', '2021-05-06 13:30:20'),
(10813, 'CC0246', 'Karthick', '1, TRN Gardens', 'Udumalpet', 'Tamil Nadu', 9417417410, 'Dhamini', '7/8, Arun excelo, Avadi', 'Chennai', 'Tamil Nadu', 9412365870, '2.00', '100.00', '2021-05-06 13:35:01'),
(10814, 'CC1234', 'Rajesh', '6, Angel Residency', 'Theni', 'Tamil Nadu', 9955487612, 'Sanjuktha', '15, Eden palace', 'Kochi', 'Kerala', 9912365407, '1.00', '100.00', '2021-05-10 09:30:29'),
(10815, 'CC3267', 'Rishi', '78, Tatabad', 'Coimbatore', 'Tamil Nadu', 9633652140, 'Celine', '34, Cheta gardens', 'Palakkad', 'Kerala', 9514236870, '2.75', '275.00', '2021-05-10 17:17:00'),
(10816, 'CC3267', 'Rishi', '78, Tatabad', 'Coimbatore', 'Tamil Nadu', 9852630147, 'Celine', '34, Cheta gardens', 'Palakkad', 'Kerala', 9514273680, '2.00', '200.00', '2021-05-10 17:24:23'),
(10817, 'CC3267', 'Jai', '6, Angel Residency', 'Trichy', 'Tamil Nadu', 9178542036, 'Arya', '75, Main cross street', 'Alapuzha', 'Kerala', 9514236870, '2.00', '200.00', '2021-05-10 17:26:39'),
(10818, 'CC3267', 'Jai', '6, Angel Residency', 'Trichy', 'Tamil Nadu', 9178542036, 'Arya', '75, Main cross street', 'Alapuzha', 'Kerala', 9514236870, '2.00', '200.00', '2021-05-10 17:41:38'),
(10819, 'CC4567', 'Karthick', '1, TRN Gardens', 'Udumalpet', 'Tamil Nadu', 9417417410, 'Dhamini', '75, Main cross street', 'Chennai', 'Tamil Nadu', 9412365870, '1.25', '62.50', '2021-05-10 19:00:37'),
(10820, 'CC4567', 'Eswar', '12, MJ Gardens', 'Erode', 'Tamil Nadu', 9922663300, 'Chanya', '45, BB street', 'Theni', 'Tamil Nadu', 9956823147, '1.00', '50.00', '2021-05-10 19:15:00'),
(10821, 'CC1212', 'Aathmika', '1, TRN Gardens', 'Udumalpet', 'Tamil Nadu', 9512034687, 'Sanjuktha', '15, Eden palace', 'Theni', 'Tamil Nadu', 9912365407, '7.00', '350.00', '2021-05-13 14:12:10'),
(10822, 'CC5555', 'Sudharshan', '1, Greenpark layout', 'Udumalpet', 'Tamil Nadu', 9485760123, 'Shariq', '27, CB Street', 'Coimbatore', 'Tamil Nadu', 9514200368, '10.00', '500.00', '2021-05-17 05:22:00'),
(10823, 'CC5555', 'Sudharshan', '1, Greenpark layout', 'Udumalpet', 'Tamil Nadu', 9485760123, 'Shariq', '27, CB Street', 'Coimbatore', 'Tamil Nadu', 9514200368, '10.00', '500.00', '2021-05-17 05:23:18'),
(10824, 'CC3503', 'Ajitesh M', '1, TRN Gardens', 'Udumalpet', 'Tamil Nadu', 9488393922, 'Dorain', '10, KK Residency', 'Theni', 'Tamil Nadu', 9966332211, '2.50', '125.00', '2021-05-28 16:07:57'),
(10825, 'CC3503', 'Alaric', '10, Salvatore Printing House', 'Chennai', 'Tamil Nadu', 9633221108, 'Dorian', '15, Amazon School bookstore', 'Hyderabad', 'Andhra Pradhesh', 9956823147, '23.00', '2875.00', '2021-05-29 09:45:53'),
(10826, 'CC3503', 'Karthick', '78, Tatabad', 'Coimbatore', 'Tamil Nadu', 9417417410, 'Celine', '34, Cheta gardens', 'Alapuzha', 'Kerala', 9514236870, '3.50', '350.00', '2021-05-29 09:56:35'),
(10827, 'CC3503', 'Karthick', '10, Jos Residency', 'Coimbatore', 'Tamil Nadu', 9485760123, 'Celine', '7/8, Arun excelo, Avadi', 'Chennai', 'Tamil Nadu', 9514236870, '3.00', '150.00', '2021-05-30 11:54:23'),
(10828, 'CC3503', 'Jai', '6, Angel Residency', 'Trichy', 'Tamil Nadu', 9633221108, 'Arya', '34, Cheta gardens', 'Palakkad', 'Kerala', 9412365870, '5.00', '500.00', '2021-05-31 06:46:56');

--
-- Triggers `parcel`
--
DELIMITER $$
CREATE TRIGGER `placeParcel` AFTER INSERT ON `parcel` FOR EACH ROW BEGIN
	UPDATE staff SET Credits=Credits+5 WHERE StaffID=NEW.StaffID;
    
    INSERT INTO status (TrackingID, StaffID, Dispatched)
    VALUES ( NEW.TrackingID, NEW.StaffID, NEW.Dispatched_Time);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `S.No` int(11) NOT NULL,
  `State_1` varchar(30) NOT NULL,
  `State_2` varchar(30) NOT NULL,
  `Cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`S.No`, `State_1`, `State_2`, `Cost`) VALUES
(0, 'Tamil Nadu', 'Tamil Nadu', 50),
(1, 'Tamil Nadu', 'Kerala', 100),
(2, 'Tamil Nadu', 'Andhra Pradhesh', 125),
(3, 'Tamil Nadu', 'Karnataka', 130),
(4, 'Tamil Nadu', 'Maharashtra', 200),
(5, 'Tamil Nadu', 'Delhi', 300),
(6, 'Tamil Nadu', 'Uttar Pradesh', 350),
(7, 'Tamil Nadu', 'West Bengal', 275);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Designation` varchar(30) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `DOJ` date NOT NULL,
  `Salary` int(11) NOT NULL,
  `Mobile` bigint(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Credits` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `Name`, `Designation`, `Gender`, `DOB`, `DOJ`, `Salary`, `Mobile`, `Email`, `Credits`) VALUES
('CC3503', 'Stefan Salvatore', 'Branch Manager', 'Male', '1991-06-08', '2015-07-14', 55000, 1597324860, 'abc@xyz.com', 35),
('CC9876', 'Arjun', 'Staff', 'Male', '1990-02-17', '2016-08-12', 35000, 9563287410, 'arjun@xyz.com', 0),
('CC4567', 'Alaric Saltzman', 'Staff', 'Male', '1992-09-13', '2019-03-23', 38000, 8526459190, 'asaltzman@xyz.com', 10),
('CC3511', 'Bonnie Bennet', 'Branch Manager', 'Female', '1998-07-24', '2019-04-09', 38000, 9487512306, 'bbennet@xyz.com', 0),
('CC0246', 'Caroline Forbes', 'Branch Manager', 'Female', '1995-09-27', '2018-02-06', 40000, 9571368420, 'careforbes@xyz.com', 35),
('CC1234', 'Hayley Marshal', 'Branch Manager', 'Female', '1996-07-12', '2017-06-08', 42000, 9658741230, 'haymarsh@xyz.com', 5),
('CC5555', 'Josette', 'Staff', 'Female', '1989-05-09', '2019-05-15', 32000, 9856321470, 'jossie@xyz.com', 10),
('CC0369', 'Kai Parker', 'Staff', 'Male', '1994-08-08', '2021-04-15', 25000, 9630258741, 'meetkai@xyz.com', 0),
('CC0101', 'Millie B', 'Staff', 'Female', '1998-03-12', '2020-12-12', 30000, 9871234560, 'milliebrown@xyz.com', 0),
('CC1212', 'Klaus Mikelson', 'Branch Manager', 'Male', '1985-07-23', '2012-09-16', 55000, 9514782036, 'niklausmike@xyz.com', 5),
('CC3267', 'Tyler Lockwood', 'Staff', 'Male', '2000-05-13', '2021-05-03', 23000, 9546287130, 'tylerwood@xyz.com', 20);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `TrackingID` int(11) NOT NULL,
  `StaffID` varchar(30) NOT NULL,
  `Dispatched` timestamp NULL DEFAULT NULL,
  `Shipped` timestamp NULL DEFAULT NULL,
  `Out_for_delivery` timestamp NULL DEFAULT NULL,
  `Delivered` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`TrackingID`, `StaffID`, `Dispatched`, `Shipped`, `Out_for_delivery`, `Delivered`) VALUES
(10807, 'CC0246', '2021-05-06 13:41:20', '2021-05-09 16:24:42', NULL, NULL),
(10808, 'CC0246', '2021-05-06 13:41:20', '2021-05-06 12:59:19', '2021-05-29 09:37:28', '2021-05-29 09:40:31'),
(10809, 'CC0246', '2021-05-06 13:41:20', '2021-05-29 10:55:15', '2021-05-29 10:55:28', NULL),
(10812, 'CC0246', '2021-05-06 13:41:20', '2021-05-06 13:35:31', NULL, NULL),
(10813, 'CC0246', '2021-05-06 13:41:20', '2021-05-06 13:43:22', '2021-05-06 13:47:41', '2021-05-06 13:48:05'),
(10814, 'CC1234', '2021-05-10 09:30:29', '2021-05-29 09:38:05', NULL, NULL),
(10815, 'CC3267', '2021-05-10 17:17:00', '2021-05-29 09:38:18', NULL, NULL),
(10816, 'CC3267', '2021-05-10 17:24:23', '2021-05-29 09:38:27', NULL, NULL),
(10817, 'CC3267', '2021-05-10 17:26:39', '2021-05-29 09:38:38', NULL, NULL),
(10818, 'CC3267', '2021-05-10 17:41:38', '2021-05-10 19:05:47', '2021-05-10 19:06:25', '2021-05-10 19:06:37'),
(10820, 'CC4567', '2021-05-10 19:15:00', NULL, NULL, NULL),
(10821, 'CC1212', '2021-05-13 14:12:10', '2021-05-13 14:12:58', NULL, NULL),
(10822, 'CC5555', '2021-05-17 05:22:00', '2021-05-29 09:39:51', NULL, NULL),
(10823, 'CC5555', '2021-05-17 05:23:18', '2021-05-29 09:40:00', NULL, NULL),
(10824, 'CC3503', '2021-05-28 16:07:57', '2021-05-29 09:40:12', NULL, NULL),
(10825, 'CC3503', '2021-05-29 09:45:53', '2021-05-29 09:51:16', NULL, NULL),
(10826, 'CC3503', '2021-05-29 09:56:35', NULL, NULL, NULL),
(10827, 'CC3503', '2021-05-30 11:54:23', NULL, NULL, NULL),
(10828, 'CC3503', '2021-05-31 06:46:56', '2021-05-31 06:51:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure for view `arrived`
--
DROP TABLE IF EXISTS `arrived`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `arrived`  AS  select `p`.`TrackingID` AS `TrackingID`,`p`.`StaffID` AS `StaffID`,`p`.`S_Name` AS `S_Name`,`p`.`S_Add` AS `S_Add`,`p`.`S_City` AS `S_City`,`p`.`S_State` AS `S_State`,`p`.`S_Contact` AS `S_Contact`,`p`.`R_Name` AS `R_Name`,`p`.`R_Add` AS `R_Add`,`p`.`R_City` AS `R_City`,`p`.`R_State` AS `R_State`,`p`.`R_Contact` AS `R_Contact`,`p`.`Weight_Kg` AS `Weight_Kg`,`p`.`Price` AS `Price`,`p`.`Dispatched_Time` AS `Dispatched_Time`,`s`.`Shipped` AS `Shipped`,`s`.`Out_for_delivery` AS `Out_for_delivery`,`s`.`Delivered` AS `Delivered` from (`parcel` `p` join `status` `s`) where ((`p`.`TrackingID` = `s`.`TrackingID`) and isnull(`s`.`Delivered`)) ;

-- --------------------------------------------------------

--
-- Structure for view `delivered`
--
DROP TABLE IF EXISTS `delivered`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `delivered`  AS  select `p`.`TrackingID` AS `TrackingID`,`p`.`StaffID` AS `StaffID`,`p`.`S_Name` AS `S_Name`,`p`.`S_Add` AS `S_Add`,`p`.`S_City` AS `S_City`,`p`.`S_State` AS `S_State`,`p`.`S_Contact` AS `S_Contact`,`p`.`R_Name` AS `R_Name`,`p`.`R_Add` AS `R_Add`,`p`.`R_City` AS `R_City`,`p`.`R_State` AS `R_State`,`p`.`R_Contact` AS `R_Contact`,`p`.`Weight_Kg` AS `Weight_Kg`,`p`.`Price` AS `Price`,`p`.`Dispatched_Time` AS `Dispatched_Time`,`s`.`Shipped` AS `Shipped`,`s`.`Out_for_delivery` AS `Out_for_delivery`,`s`.`Delivered` AS `Delivered` from (`parcel` `p` join `status` `s`) where ((`p`.`TrackingID` = `s`.`TrackingID`) and (`s`.`Delivered` is not null)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`Branch_id`),
  ADD KEY `Manager` (`Manager_id`);

--
-- Indexes for table `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD UNIQUE KEY `Feedback` (`F.No`);

--
-- Indexes for table `parcel`
--
ALTER TABLE `parcel`
  ADD PRIMARY KEY (`TrackingID`),
  ADD UNIQUE KEY `TrackID` (`TrackingID`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`S.No`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `FKey` (`StaffID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD UNIQUE KEY `TrackID` (`TrackingID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `Branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `F.No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `parcel`
--
ALTER TABLE `parcel`
  MODIFY `TrackingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10829;

--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `S.No` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `Manager` FOREIGN KEY (`Manager_id`) REFERENCES `staff` (`StaffID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `FKey` FOREIGN KEY (`StaffID`) REFERENCES `credentials` (`StaffID`);

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `delivery_status` FOREIGN KEY (`TrackingID`) REFERENCES `parcel` (`TrackingID`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `resetCredits` ON SCHEDULE EVERY 1 MONTH STARTS '2021-05-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
 update staff set Credits=0;
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
