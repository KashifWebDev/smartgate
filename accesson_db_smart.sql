-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 15, 2021 at 06:16 AM
-- Server version: 5.7.23-23
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accesson_db_smart`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `id` int(20) NOT NULL,
  `alert_name` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `app_push` varchar(20) NOT NULL,
  `machine_mac` varchar(50) NOT NULL,
  `user_id` int(20) NOT NULL,
  `relay` varchar(20) NOT NULL,
  `positions` varchar(20) NOT NULL,
  `weekday` varchar(20) NOT NULL,
  `alert_sent` tinyint(1) NOT NULL,
  `delta_time_alert` varchar(5) NOT NULL,
  `delta_time_alert_sent` tinyint(1) NOT NULL,
  `relay_pos_alert_sent` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alive_status`
--

CREATE TABLE `alive_status` (
  `id` int(11) NOT NULL,
  `mac` varchar(20) NOT NULL,
  `device_status` text NOT NULL,
  `date_time` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL,
  `api_input` text NOT NULL,
  `api_output` text NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_logs`
--

INSERT INTO `api_logs` (`id`, `api_input`, `api_output`, `date_time`) VALUES
(1, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"dY0GH5QfnUKqrPSet7CzIt:APA91bEwMpMgrWN2cCi0EDYvOe_UQk9X_mB1zRR7tX-zzwExg8U-4iG3rtd1cB8i6g7oPpWdOuM-IYjmOEhqEOwd9YmmKRud4YG4lhZxfbY33Rh6cqDuzfchzlZg4OwkXlP-ZhEvGPb-\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":4326086310993107734,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-10-14 05:45:25'),
(2, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"dY0GH5QfnUKqrPSet7CzIt:APA91bEwMpMgrWN2cCi0EDYvOe_UQk9X_mB1zRR7tX-zzwExg8U-4iG3rtd1cB8i6g7oPpWdOuM-IYjmOEhqEOwd9YmmKRud4YG4lhZxfbY33Rh6cqDuzfchzlZg4OwkXlP-ZhEvGPb-\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":6077125479110597370,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-10-14 10:26:42'),
(3, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"dY0GH5QfnUKqrPSet7CzIt:APA91bEwMpMgrWN2cCi0EDYvOe_UQk9X_mB1zRR7tX-zzwExg8U-4iG3rtd1cB8i6g7oPpWdOuM-IYjmOEhqEOwd9YmmKRud4YG4lhZxfbY33Rh6cqDuzfchzlZg4OwkXlP-ZhEvGPb-\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":2918551157360401462,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-10-14 10:26:54');

-- --------------------------------------------------------

--
-- Table structure for table `app_requests`
--

CREATE TABLE `app_requests` (
  `id` int(20) NOT NULL,
  `mobile_mac` varchar(20) NOT NULL,
  `machine_mac` varchar(20) NOT NULL,
  `request` text NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_requests`
--

INSERT INTO `app_requests` (`id`, `mobile_mac`, `machine_mac`, `request`, `date_time`) VALUES
(1, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 08:27:32'),
(2, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:15:45'),
(3, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:15:52'),
(4, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:15:58'),
(5, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:16:05'),
(6, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:16:10'),
(7, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:16:15'),
(8, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:37:40'),
(9, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:37:43'),
(10, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:37:51'),
(11, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:37:57'),
(12, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:38:00'),
(13, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:38:22'),
(14, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:38:29'),
(15, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:39:31'),
(16, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:40:06'),
(17, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:40:12'),
(18, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:40:15'),
(19, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:40:33'),
(20, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:40:35'),
(21, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:41:01'),
(22, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:6C:C0', 'Open', '2021-10-14 09:41:37'),
(23, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:41:50'),
(24, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:42:12'),
(25, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:42:18'),
(26, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:43:23'),
(27, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:43:38'),
(28, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 09:43:48'),
(29, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 14:52:32'),
(30, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 15:17:05'),
(31, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 15:17:10'),
(32, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 15:17:14'),
(33, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-10-14 15:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(20) NOT NULL,
  `name` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`) VALUES
(1, 'Access 1 Tech'),
(2, 'Test Company'),
(3, 'Google');

-- --------------------------------------------------------

--
-- Table structure for table `guest_users`
--

CREATE TABLE `guest_users` (
  `id` int(50) NOT NULL,
  `parent_id` int(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `picture` varchar(100) NOT NULL DEFAULT 'default.png',
  `machine_mac` varchar(50) NOT NULL,
  `mobile_mac` varchar(50) NOT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest_users`
--

INSERT INTO `guest_users` (`id`, `parent_id`, `fullname`, `email`, `password`, `picture`, `machine_mac`, `mobile_mac`, `is_restricted`) VALUES
(5, 59, 'Andrew Kim', 'kim@kim.com', 'user', '54_user-avatar.png', '24:6F:AA:BB:CC:77', '20:30:40:50:60:70', 0),
(6, 59, 'Andrew Kim', 'andrew@mail.com', 'abcdefghijklmn', 'default.png', '24:6F:28:F1:6B:48', '00:11:22:33:44:55', 0),
(7, 74, 'Guest 1', 'guest@guest.com', 'Guest', '67_man-1.jpg', '1212121212', '1122334455', 0),
(8, 59, 'New Guest', 'newguest@mail.com', '', 'default.png', '24:6F:28:F1:6B:48', '02344444', 0),
(11, 58, 'Gardener', 'gardener@gardener.com', 'gardener', 'default.png', '1234567890', '3333333333', 0),
(12, 74, 'Guest 2', 'Guest2@Guest2.com', 'Guest2', '81_DBeeding.png', '1234567890', '3333333333', 0),
(13, 59, 'Inst Guest', 'guest1@guest.com', 'guest1', 'default.png', '24:6F:28:F1:6B:48', 'AA:BB:CC:DD:EE:FK', 0);

-- --------------------------------------------------------

--
-- Table structure for table `machine_req_completeack`
--

CREATE TABLE `machine_req_completeack` (
  `id` int(20) NOT NULL,
  `action` text NOT NULL,
  `mobile_mac` varchar(20) NOT NULL,
  `machine_mac` varchar(20) NOT NULL,
  `Event` varchar(10) NOT NULL,
  `Pos` varchar(10) NOT NULL,
  `Exitt` varchar(10) NOT NULL,
  `Buzz` varchar(10) NOT NULL,
  `relay` varchar(5) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `machine_req_completeack`
--

INSERT INTO `machine_req_completeack` (`id`, `action`, `mobile_mac`, `machine_mac`, `Event`, `Pos`, `Exitt`, `Buzz`, `relay`, `date_time`) VALUES
(1, 'Nack', 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Lo', 'Lo', 'Lo', 'Lo.', 'Lo', '2021-10-15 06:16:09'),
(2, 'Nack', 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Lo', 'Lo', 'Lo', 'Lo.', 'Lo', '2021-10-15 06:16:11'),
(3, 'Nack', 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Lo', 'Lo', 'Lo', 'Lo.', 'Lo', '2021-10-15 06:16:13'),
(4, 'Nack', 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Lo', 'Lo', 'Lo', 'Lo.', 'Lo', '2021-10-15 06:16:15'),
(5, 'Nack', 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Lo', 'Lo', 'Lo', 'Lo.', 'Lo', '2021-10-15 06:16:17'),
(6, 'Nack', 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Lo', 'Lo', 'Lo', 'Lo.', 'Lo', '2021-10-15 06:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `machine_req_recievedack`
--

CREATE TABLE `machine_req_recievedack` (
  `id` int(20) NOT NULL,
  `response` text NOT NULL,
  `mobile_mac` varchar(20) NOT NULL,
  `machine_mac` varchar(20) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `machine_req_recievedack`
--

INSERT INTO `machine_req_recievedack` (`id`, `response`, `mobile_mac`, `machine_mac`, `date_time`) VALUES
(1, 'ACK', 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', '2021-10-15 06:16:13'),
(2, 'ACK', 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', '2021-10-15 06:16:14'),
(3, 'ACK', 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', '2021-10-15 06:16:17'),
(4, 'ACK', 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', '2021-10-15 06:16:19');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `request` text NOT NULL,
  `mobile_mac` varchar(20) NOT NULL,
  `machine_mac` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `request`, `mobile_mac`, `machine_mac`) VALUES
(1, 'open', 't4t4t4t4', '3f2323ff23f2'),
(2, 'open', 'abcd1234', '2232332323'),
(3, 'abcc', 'aaaabbbb', 'aksdfjlaf'),
(4, 'abcc', 'aaaabbbb', 'aksdfjlaf'),
(5, 'Close', 'aaaabbbb', 'aksdfjlaf'),
(6, 'Open', 'abcd3e3r', 'asdjkfladj'),
(7, 'Open', '2234EE432', '1233343334'),
(8, 'Open', '2234EE432', '1233343334'),
(9, 'Open', '2223344', '4343332'),
(10, 'Open', '2233433', '34555444'),
(11, 'Close', 'aaaabbbb', 'aksdfjlaf'),
(12, 'Open', 'asdffd', '4444444'),
(13, 'Open', 'asdffd', '4444444'),
(14, 'Open', 'asdffd', '4444444'),
(15, 'Open', '1223344', '3434343'),
(16, 'Open', '123456', '554321'),
(17, 'Open', '123456', '554321'),
(18, 'Open', '123456', '554321'),
(19, 'Open', '123456', '554321'),
(20, 'Open', '123456', '554321'),
(21, 'Open', '123456', '554321'),
(22, 'Open', '123456', '554321'),
(23, 'Open', '123456', '554321'),
(24, 'Open', '123456', '554321'),
(25, 'Open', '123456', '554321'),
(26, 'Open', '123456', '554321'),
(27, 'Open', '123456', '554321'),
(28, 'Open', '123456', '554321'),
(29, 'Open', '123456', '554321'),
(30, 'Open', '123456', '554321'),
(31, 'Open', '123456', '554321'),
(32, 'Open', '123456', '554321'),
(33, 'Open', '123456', '554321'),
(34, 'Open', '123456', '554321'),
(35, 'Open', '123456', '554321'),
(36, 'Open', '123456', '554321'),
(37, 'Open', '123456', '554321'),
(38, 'Open', '123456', '554321'),
(39, 'Open', '123456', '554321'),
(40, 'Open', '123456', '554321'),
(41, 'Open', '123456', '554321'),
(42, 'Open', '123456', '554321'),
(43, 'Open', '123456', '554321'),
(44, 'Open', '123456', '554321'),
(45, 'Open', '123456', '554321'),
(46, 'Open', '123456', '554321'),
(47, 'Open', '123456', '554321'),
(48, 'Open', '123456', '554321'),
(49, 'Open', '123456', '554321'),
(50, 'Open', '123456', '554321'),
(51, 'Open', '123456', '554321'),
(52, 'Open', '123456', '554321');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(20) NOT NULL,
  `sch_name` varchar(30) NOT NULL,
  `relay` text NOT NULL,
  `user_id` int(20) NOT NULL,
  `mobile_mac` varchar(20) NOT NULL,
  `machine_mac` varchar(20) NOT NULL,
  `event` varchar(5) NOT NULL DEFAULT 'off',
  `holiday` varchar(5) NOT NULL DEFAULT 'off',
  `positions` varchar(5) NOT NULL DEFAULT 'off',
  `schedule_nature` varchar(20) NOT NULL DEFAULT 'open',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `weekday` text NOT NULL,
  `request_send_open` tinyint(1) NOT NULL DEFAULT '0',
  `request_send_close` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `sch_name`, `relay`, `user_id`, `mobile_mac`, `machine_mac`, `event`, `holiday`, `positions`, `schedule_nature`, `start_date`, `end_date`, `start_time`, `end_time`, `weekday`, `request_send_open`, `request_send_close`) VALUES
(1, 'ASJDFKLAFJK ADKJF', 'Momentary', 59, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hi', 'off', 'on', 'open', '2021-06-09', '2021-06-09', '16:03:00.000000', '16:04:00.000000', 'sun,sat,fri,thu,wed,tue,mon,', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_guest`
--

CREATE TABLE `schedule_guest` (
  `id` int(20) NOT NULL,
  `sch_name` varchar(30) NOT NULL,
  `relay` varchar(10) NOT NULL,
  `user_id` int(20) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `mobile_mac` varchar(20) NOT NULL,
  `machine_mac` varchar(20) NOT NULL,
  `event` varchar(5) NOT NULL DEFAULT 'off',
  `holiday` varchar(5) NOT NULL DEFAULT 'off',
  `positions` varchar(5) NOT NULL DEFAULT 'off',
  `schedule_nature` varchar(20) NOT NULL DEFAULT 'open',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `weekday` text NOT NULL,
  `request_send_open` tinyint(1) NOT NULL,
  `request_send_close` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule_guest`
--

INSERT INTO `schedule_guest` (`id`, `sch_name`, `relay`, `user_id`, `parent_id`, `mobile_mac`, `machine_mac`, `event`, `holiday`, `positions`, `schedule_nature`, `start_date`, `end_date`, `start_time`, `end_time`, `weekday`, `request_send_open`, `request_send_close`) VALUES
(2, 'ASJDFKLAFJK ADKJF', 'Momentary', 137, 59, '', '24:6F:28:F1:6B:48', 'on', 'off', 'Open', '', '2021-06-01', '2021-06-02', '19:44:00.000000', '23:45:00.000000', 'sun,sat,fri,thu,wed,tue,mon,', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `server_requests`
--

CREATE TABLE `server_requests` (
  `id` int(11) NOT NULL,
  `machine_mac` varchar(50) NOT NULL,
  `request` varchar(11) NOT NULL,
  `user_id` int(50) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `server_requests`
--

INSERT INTO `server_requests` (`id`, `machine_mac`, `request`, `user_id`, `date_time`) VALUES
(1, 'C8:2B:96:B3:EE:00', 'Open', 107, '2021-03-25 09:56:53'),
(2, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Close', 107, '2021-03-25 09:57:27'),
(3, 'C8:2B:96:B3:EE:00', 'Open', 107, '2021-03-25 09:57:50'),
(4, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 09:57:58'),
(5, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 09:58:25'),
(6, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 09:58:51'),
(7, 'C8:2B:96:B3:EE:00', 'Open', 107, '2021-03-25 09:59:26'),
(8, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Close', 107, '2021-03-25 09:59:33'),
(9, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 09:59:59'),
(10, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:00:23'),
(11, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:00:47'),
(12, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:01:12'),
(13, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:02:27'),
(14, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:02:50'),
(15, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:03:12'),
(16, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:03:34'),
(17, 'C8:2B:96:B3:EE:00', 'Open', 107, '2021-03-25 10:09:38'),
(18, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:09:48'),
(19, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:10:07'),
(20, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Close', 107, '2021-03-25 10:10:29'),
(21, 'C8:2B:96:B3:EE:00', 'Open', 107, '2021-03-25 10:11:13'),
(22, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:11:23'),
(23, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:11:40'),
(24, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Close', 107, '2021-03-25 10:11:56'),
(25, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Close', 107, '2021-03-25 10:12:12'),
(26, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Close', 107, '2021-03-25 10:12:27'),
(27, 'C8:2B:96:B3:EE:00', 'Open', 107, '2021-03-25 10:18:43'),
(28, 'C8:2B:96:B3:EE:00', 'Open', 107, '2021-03-25 10:18:49'),
(29, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:18:54'),
(30, 'C8:2B:96:B3:EE:00d_name=Scott Test Unit 1', 'Hold', 107, '2021-03-25 10:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `value` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `title`, `value`) VALUES
(1, 'Eastern Standard Time (UTC-5)', 'Pacific/Easter'),
(2, 'Central Standard Time (UTC-6)', 'US/Central'),
(3, 'Mountain Standard Time (UTC-7)', 'US/Mountain'),
(4, 'Pacific Standard Time (UTC-8)', 'US/Pacific'),
(5, 'Alaska Standard Time (UTC-9)', 'US/Alaska'),
(6, 'Hawaii-Aleutian Standard Time (UTC-10)', 'US/Hawaii'),
(7, 'Pakistan (UTC+5)', 'Asia/Karachi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_type` text NOT NULL,
  `parent_id` int(10) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `company` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT 'default.png',
  `mac` varchar(40) NOT NULL,
  `mobile_mac` varchar(40) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `app_token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `parent_id`, `first_name`, `last_name`, `company`, `email`, `password`, `is_restricted`, `image`, `mac`, `mobile_mac`, `is_admin`, `app_token`) VALUES
(4, '', 0, 'Web', 'Administrator', 1, 'admin@admin.com', 'admin', 0, 'default.png', '', '', 1, 'sdfdsfsdfsdfmjsidf iuasufuew78r78238rey23uiwhjdn'),
(59, '', 0, 'Andrew', 'James', 1, 'esp32@esp32.com', 'user', 0, '818923982user.png', '24:6F:28:F1:6B:48', 'AA:BB:CC:DD:EE:FF', 0, 'dyEu0h7pXUePm70wTmsbFZ:APA91bEy_4J_loNYbz4S6yRn3xaG4SnHMfWfELrzYKAqVgwwQJlLLuVbuM3n1h29Fp_YFb88pcERO4WzxiC9siTkUHS-23vU-LeHXsf6tK0mYRHJ4dVqpkhhJtOXwnsMzoE8Z7Ar-c56'),
(107, '', 0, 'Sample', 'Account', 1, 'sample@sample.com', 'Sample', 0, 'default.png', '22224444', '55556666', 0, 'dY0GH5QfnUKqrPSet7CzIt:APA91bEwMpMgrWN2cCi0EDYvOe_UQk9X_mB1zRR7tX-zzwExg8U-4iG3rtd1cB8i6g7oPpWdOuM-IYjmOEhqEOwd9YmmKRud4YG4lhZxfbY33Rh6cqDuzfchzlZg4OwkXlP-ZhEvGPb-'),
(109, '', 0, 'ASJDFKLAFJK', 'ADKJF', 2, 'kashifkhan@loketa.com', '24:6F:28:F1:6B:48', 0, 'default.png', '24:6F:28:F1:6B:48', '3232232', 0, ''),
(112, '', 0, 'Swaminathan', 'Narayanan', 1, 'narain1971@gmail.com', 'Varshini09!', 0, 'default.png', '', 'f8:87:F1:D0:DE:F7', 0, ''),
(113, '', 0, '', '', 0, '', '', 0, 'default.png', '', '', 0, ''),
(114, '', 0, 'fname', 'lname', 2, 'mmmail@me.com', 'pass@1234', 0, 'default.png', '', '', 0, ''),
(115, '', 0, 'amir', 'amir', 1, 'amir@yahoo.com', 'amir', 0, 'default.png', '', '', 0, ''),
(116, '', 0, 'fname', 'lname', 1, 'tes@test.com', 'test', 0, 'default.png', '', '', 0, ''),
(117, '', 0, 'fname', 'lname', 1, 'test@test.com', 'test', 0, 'default.png', '', '', 0, ''),
(118, '', 0, 'fname', 'lname', 1, 'tesst@test.com', 'test', 0, 'default.png', '', '', 0, ''),
(119, '', 0, 'fname', 'lname', 1, 'test@qwtest.com', 'test', 0, 'default.png', '', '', 0, ''),
(120, '', 0, 'Amir', 'Khan', 2, 'Qtest@test.com', '1', 0, 'default.png', '', '', 0, ''),
(121, '', 0, 'Amir', 'Khan', 2, 'A test@test.com', '1', 0, 'default.png', '', '', 0, ''),
(122, '', 0, 'Uyuiyy', 'Uuy', 2, 'Yuiyui', 'u', 0, 'default.png', '', '', 0, ''),
(123, '', 0, 'kJjkljk', 'Kljljkl', 2, 'Kljkjkl', 'j', 0, 'default.png', '', '', 0, ''),
(124, '', 0, 'Jkjk', 'hkhj', 2, 'jkj', 'j', 0, 'default.png', '', '', 0, ''),
(125, '', 0, 'Uyy', 'Uiy', 2, 'U', 'y', 0, 'default.png', '', '', 0, ''),
(126, '', 0, 'KLkk', 'jKkjk', 2, 'Jk', 'k', 0, 'default.png', '', '', 0, ''),
(127, '', 0, 'Scott', 'Holmes', 1, 'testunit@testunit.com', 'testunit', 0, 'default.png', 'C8:2B:96:B4:3E:28', 'B0:72:BF:EF:50:C7', 0, ''),
(128, '', 0, 'Zach', 'Eichenberger', 1, 'zeichenberger@controlledproducts.com', 'Reagan22', 0, 'default.png', '', '4082302662', 0, ''),
(130, '', 0, 'John', 'Smith', 2, 'John@yahoo.com', 'password', 0, 'default.png', '', '', 0, ''),
(131, '', 0, 'John', 'Smith', 2, 'Johnsmith@yahoo.com', 'password', 0, 'default.png', '', '', 0, ''),
(132, 'guest', 59, 'Guest', 'User', 1, 'guest@user.com', 'guest@user.com', 0, 'default.png', '', '', 0, ''),
(133, '', 0, 'Demetrius ', 'Carr', 2, 'd71carr@gmail.com', 'Wife1971$', 0, 'default.png', '', '', 0, ''),
(134, '', 0, 'Mohammed ', 'Thouseef ', 2, 'thousibadyar33@gmail.com', 'India@21', 0, 'default.png', '', '', 0, ''),
(135, '', 0, 'Max', 'Abrokwah ', 2, 'abrokwahewusi0@gmail.com', 'abrokwah331', 0, 'default.png', '', '', 0, ''),
(136, '', 0, 'Matt', 'Foster', 2, 'foster.matthew81@gmail.com', 'Bradyn1981', 0, 'default.png', '', '', 0, ''),
(137, '', 0, 'Michael', 'Lum', 2, 'quamen72.ml@gmail.com', 'Connect>123', 0, 'default.png', '', '', 0, ''),
(138, '', 0, 'Naseema ', 'Begum ', 2, 'mba.naseema@gmail.com', 'b@diha2012', 0, 'default.png', '', '', 0, ''),
(139, '', 0, 'Noah', 'Lekhuleng', 2, 'noah8990@gmail.com', '0815718038', 0, 'default.png', '', '', 0, ''),
(140, '', 0, 'Aditi ', 'Reddy ', 2, 'adipreddy@gmail.com', '12345678', 0, 'default.png', '', '', 0, ''),
(141, '', 0, 'Nasir', 'Zain', 2, 'nasirzain@yahoo.com ', '@Nz1234', 0, 'default.png', '', '', 0, ''),
(142, '', 0, 'Srinivasan', 'Jayaraman', 2, 'Srinij27@gmail.com', 'Cheenuj@27', 0, 'default.png', '', '', 0, ''),
(143, '', 0, 'Nkululeko ', 'Zama ', 2, 'nkule.zama@gmail.com', 'NKule8433NB', 0, 'default.png', '', '', 0, ''),
(144, '', 0, 'Amandeep ', 'Singh', 2, 'mk9978225@gmail.com', '09sda625', 0, 'default.png', '', '', 0, ''),
(145, '', 0, 'Ali', 'Joudeh', 2, 'alihawk72@gmail.com', 'hawk6982', 0, 'default.png', '', '', 0, ''),
(146, 'guest', 107, 'Scott', 'Holmes', 1, 'scott@access1tech.com', 'Ronnie1!', 0, 'default.png', '', '', 0, 'dY0GH5QfnUKqrPSet7CzIt:APA91bEwMpMgrWN2cCi0EDYvOe_UQk9X_mB1zRR7tX-zzwExg8U-4iG3rtd1cB8i6g7oPpWdOuM-IYjmOEhqEOwd9YmmKRud4YG4lhZxfbY33Rh6cqDuzfchzlZg4OwkXlP-ZhEvGPb-'),
(147, 'guest', 107, '', 'Gardener', 1, 'gardener@gardener.com', 'gardener', 0, 'default.png', '', '', 0, ''),
(148, '', 0, 'Harshit ', 'Wadhwa ', 2, 'wadhwa.220189@gmail.com', 'kramnicc', 0, 'default.png', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user_and_devices`
--

CREATE TABLE `user_and_devices` (
  `id` int(10) NOT NULL,
  `device_name` varchar(30) NOT NULL,
  `timezone` int(10) NOT NULL,
  `daylight_saving` tinyint(1) NOT NULL,
  `user_id` int(30) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `machine_mac` varchar(64) NOT NULL,
  `mobile_mac` varchar(20) NOT NULL,
  `device_img` varchar(100) NOT NULL DEFAULT 'gate.jfif',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `guest_name` varchar(20) NOT NULL,
  `action` text NOT NULL,
  `server_request` varchar(100) NOT NULL,
  `alarm` varchar(50) NOT NULL DEFAULT 'none',
  `device_status` text NOT NULL,
  `wifi_lan_ip` varchar(30) NOT NULL,
  `wifi_server_ip` varchar(30) NOT NULL,
  `date_time` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `position_input` varchar(10) NOT NULL,
  `relay` varchar(10) NOT NULL,
  `momentary_time` int(10) NOT NULL,
  `open_btn` tinyint(1) NOT NULL DEFAULT '1',
  `hold_btn` tinyint(1) NOT NULL DEFAULT '1',
  `close_btn` tinyint(1) NOT NULL DEFAULT '1',
  `event` varchar(10) NOT NULL,
  `event_server` varchar(5) DEFAULT 'Lo',
  `position` varchar(10) NOT NULL,
  `relay_from_api` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_and_devices`
--

INSERT INTO `user_and_devices` (`id`, `device_name`, `timezone`, `daylight_saving`, `user_id`, `parent_id`, `machine_mac`, `mobile_mac`, `device_img`, `is_guest`, `guest_name`, `action`, `server_request`, `alarm`, `device_status`, `wifi_lan_ip`, `wifi_server_ip`, `date_time`, `active`, `position_input`, `relay`, `momentary_time`, `open_btn`, `hold_btn`, `close_btn`, `event`, `event_server`, `position`, `relay_from_api`) VALUES
(97, 'ESP33', 6, 0, 59, 0, '24:6F:28:F1:6B:48', '00:11:22:33:44:55', 'gate.jfif', 0, '', '', 'Open', '1', 'Alive', 'XXXX', 'bbbbb', '05-01-2021 22:36:30', 1, 'none', 'Momentary', 10, 1, 1, 1, 'Hi', 'Hi', 'Lo', 'Hi'),
(106, 'Test device', 7, 0, 59, 0, 'C8:2B:96:B2:71:A4', 'AA:00:FF:CC:50:77', 'gate.jfif', 0, '', '', 'Hold', '5', 'Alive', '1711319232', '67414208', '05-03-2021 02:57:46', 1, 'Hi', 'Momentary', 2, 1, 1, 1, 'Lo', 'Hi', 'Hi', 'Lo'),
(126, 'Scott Test Unit 1', 4, 1, 107, 0, 'C8:2B:96:B3:EE:00', 'b0:72:bf:ef:50:c7', '58_Gate-Entry-001.jpg', 0, '', '', '', 'none', 'Alive', '36350144', '67414208', '22-03-2021 11:34:32', 1, 'Lo', 'Momentary', 2, 1, 1, 1, 'Lo', 'Lo', 'Lo', 'Lo'),
(132, 'Test', 1, 0, 107, 0, 'c8:2b:96:b4:3e:28', 'b0:72:bf:fe:50:c7', 'gate.jfif', 0, '', '', 'Open', 'none', '', '', '', '18-03-2021 23:32:28', 1, '', '', 0, 1, 1, 1, 'Lo', 'Lo', 'Hi', 'Lo'),
(134, 'Main gate', 0, 0, 130, 0, '9E:0C:03:E4:30:AF', '9E:0C:03:E4:30:AF', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '19-04-2021 22:25:23', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(135, 'Gate', 0, 0, 131, 0, '9E:0C:03:E4:30:AF', '9E:0C:03:E4:30:AF', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '19-04-2021 22:30:24', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(137, 'ESP33', 0, 0, 132, 59, '24:6F:28:F1:6B:48', 'my:moobile', 'gate.jfif', 1, '', '', 'Open', 'none', '', '', '', '', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(138, 'Gate', 0, 0, 133, 0, '000351597', 'dlcarr31', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '22-06-2021 15:54:50', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(139, 'gate', 0, 0, 134, 0, '7619442217', '7619442217', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '25-06-2021 11:10:01', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(140, '1', 0, 0, 135, 0, '9:46', '9:46', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '02-07-2021 15:46:41', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(141, 'Liftmaster', 0, 0, 136, 0, 'Liftmaster', 'Iphone', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '04-07-2021 11:41:06', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(142, 'Test Unit A', 4, 1, 107, 0, 'C8:2B:96:B3:6C:C0', 'b0:72:bf:ef:50:c7', '16_Gate Icon - Closed.png', 0, '', '', 'Open', 'none', '', '', '', '09-07-2021 09:34:45', 1, 'none', 'Momentary', 2, 1, 1, 1, 'Lo', 'Lo', 'Hi', 'Lo'),
(143, 'Main gate', 0, 0, 137, 0, 'Rear gate', 'Spare', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '09-08-2021 01:28:07', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(144, 'Shell North Gate', 0, 0, 138, 0, 'Hennur', '8328440980', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '01-09-2021 01:32:44', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(145, 'Emmanuel ', 0, 0, 139, 0, '11223344', '11223344', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '02-09-2021 01:40:47', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(146, 'Entry', 0, 0, 140, 0, '7', '10', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '03-09-2021 18:30:19', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(147, 'IOS ', 0, 0, 141, 0, 'IOS ', 'IOS', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '03-09-2021 23:08:05', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(148, 'iPhone ', 0, 0, 142, 0, 'Mac', 'IOS', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '04-09-2021 21:15:44', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(149, 'Iphone XR', 0, 0, 143, 0, '74:B5:87:24:85:C4', '0738892898', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '12-09-2021 09:34:52', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(150, '8607684832', 0, 0, 144, 0, '8607684832', '8607684832', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '15-09-2021 07:22:10', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(151, 'Home window', 0, 0, 145, 0, '11:22', '11:22', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '15-09-2021 09:21:19', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(152, 'Scott Test Unit 1', 0, 0, 146, 107, 'C8:2B:96:B3:EE:00', 'c0:a6:00:0a:d3:06', 'gate.jfif', 1, '', '', '', 'none', '', '', '', '', 1, 'Lo', '', 0, 1, 1, 1, 'Lo', 'Lo', 'Lo', 'Lo'),
(154, 'Scott Test Unit 1', 0, 0, 147, 107, 'C8:2B:96:B3:EE:00', '12:34:56:78:90', 'gate.jfif', 1, '', '', '', 'none', '', '', '', '', 1, '', '', 0, 1, 1, 1, 'Lo', 'Lo', 'Lo', 'Lo'),
(155, 'Iphone', 0, 0, 148, 0, 'Hwadhwa', 'Hwadhwa', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '14-10-2021 09:24:21', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alive_status`
--
ALTER TABLE `alive_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_requests`
--
ALTER TABLE `app_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guest_users`
--
ALTER TABLE `guest_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `machine_req_completeack`
--
ALTER TABLE `machine_req_completeack`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `machine_req_recievedack`
--
ALTER TABLE `machine_req_recievedack`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_guest`
--
ALTER TABLE `schedule_guest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `server_requests`
--
ALTER TABLE `server_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`,`email`) USING BTREE;

--
-- Indexes for table `user_and_devices`
--
ALTER TABLE `user_and_devices`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alive_status`
--
ALTER TABLE `alive_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_requests`
--
ALTER TABLE `app_requests`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guest_users`
--
ALTER TABLE `guest_users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `machine_req_completeack`
--
ALTER TABLE `machine_req_completeack`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `machine_req_recievedack`
--
ALTER TABLE `machine_req_recievedack`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule_guest`
--
ALTER TABLE `schedule_guest`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `server_requests`
--
ALTER TABLE `server_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `user_and_devices`
--
ALTER TABLE `user_and_devices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
