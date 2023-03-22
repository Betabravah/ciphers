-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 04, 2022 at 11:48 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brs`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `id` varchar(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `firstname`, `middlename`, `lastname`, `address`, `phonenumber`) VALUES
('admin-01', 'admin', 'adminm', 'adminl', 'akaki, addis ababa, ethiopia, 1000', '2510888523');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
CREATE TABLE IF NOT EXISTS `bus` (
  `id` varchar(10) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `capacity`) VALUES
('bus-01', 50),
('bus-02', 60),
('bus-03', 65),
('bus-04', 45);

-- --------------------------------------------------------

--
-- Table structure for table `busassignment`
--

DROP TABLE IF EXISTS `busassignment`;
CREATE TABLE IF NOT EXISTS `busassignment` (
  `busId` varchar(10) DEFAULT NULL,
  `routeId` varchar(10) DEFAULT NULL,
  KEY `fk_bus` (`busId`),
  KEY `fk_route` (`routeId`)
); 

--
-- Dumping data for table `busassignment`
--

INSERT INTO `busassignment` (`busId`, `routeId`) VALUES
('bus-01', 'route-1'),
('bus-02', 'route-2'),
('bus-03', 'route-3');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` varchar(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `firstname`, `middlename`, `lastname`, `address`, `phonenumber`) VALUES
('cust-01', 'fname', 'mname', 'lname', 'akaki, addis ababa, ethiopia, 1000', '25109743523');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
CREATE TABLE IF NOT EXISTS `driver` (
  `id` varchar(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
); 

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `firstname`, `middlename`, `lastname`, `address`, `phonenumber`) VALUES
('driver-01', 'driver', 'driver', 'driver', 'akaki, addis ababa, ethiopia, 1000', '2510888523'),
('driver-02', 'driver', 'driver', 'driver', 'akaki, addis ababa, ethiopia, 1000', '2510888523'),
('driver-03', 'driver', 'driver', 'driver', 'akaki, addis ababa, ethiopia, 1000', '2510888523');

-- --------------------------------------------------------

--
-- Table structure for table `driverassignment`
--

DROP TABLE IF EXISTS `driverassignment`;
CREATE TABLE IF NOT EXISTS `driverassignment` (
  `driverId` varchar(10) DEFAULT NULL,
  `busId` varchar(10) DEFAULT NULL,
  KEY `fk_bus` (`busId`),
  KEY `fk_driver` (`driverId`)
); 

--
-- Dumping data for table `driverassignment`
--

INSERT INTO `driverassignment` (`driverId`, `busId`) VALUES
('driver-01', 'bus-01'),
('driver-02', 'bus-02'),
('driver-03', 'bus-03');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` varchar(10) NOT NULL,
  `customerId` varchar(10) DEFAULT NULL,
  `busId` varchar(10) DEFAULT NULL,
  `routeId` varchar(10) DEFAULT NULL,
  `seatNumber` int DEFAULT NULL,
  `purchaseDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bus_res` (`busId`),
  KEY `fk_route_res` (`routeId`),
  KEY `fk_customer` (`customerId`)
);
--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `customerId`, `busId`, `routeId`, `seatNumber`, `purchaseDate`) VALUES
('TKT-00000', 'cust-01', 'bus-01', 'route-1', 0, '2022-08-04'),
('TKT-00001', 'cust-01', 'bus-02', 'route-2', 0, '2022-08-04'),
('TKT-00002', 'cust-01', 'bus-02', 'route-2', 1, '2022-08-04'),
('TKT-00003', 'cust-01', 'bus-01', 'route-1', 1, '2022-08-04'),
('TKT-00004', 'cust-01', 'bus-03', 'route-3', 0, '2022-08-04'),
('TKT-00005', 'cust-01', 'bus-03', 'route-3', 1, '2022-08-04');

-- --------------------------------------------------------

--
-- Table structure for table `scheduledroute`
--

DROP TABLE IF EXISTS `scheduledroute`;
CREATE TABLE IF NOT EXISTS `scheduledroute` (
  `id` varchar(10) NOT NULL,
  `source` varchar(30) DEFAULT NULL,
  `destination` varchar(30) DEFAULT NULL,
  `departureTime` datetime DEFAULT NULL,
  `arrivalTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `scheduledroute`
--

INSERT INTO `scheduledroute`  VALUES
('route-0', 'Akaki kality', 'Addis ababa', '2020-01-01 10:20:10', '2020-01-01 11:20:10'),
('route-1', 'Addis Ababa', 'Akakai kality', '2020-01-01 10:20:10', '2020-01-01 11:20:10'),
('route-3', 'Bole', 'Addis ababa', '2020-01-01 08:20:10', '2020-01-01 10:20:10'),
('route-2', 'Bole', 'Addis ababa', '2020-01-01 08:20:10', '2020-01-01 10:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(10) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`, `role`) VALUES
('cust-01', 'l�=R�pȃ��BZ��bM���9%��j���', 'CUSTOMER'),
('admin', '�iv�A���M�߱g��s�K��o*�H�', 'ADMIN');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
