-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 01, 2021 at 09:13 AM
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
(1, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":955611750396779211,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616687813572228%3baeb4ab3baeb4ab\"}]}', '2021-03-25 09:56:53'),
(2, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":8083902164226125735,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616687847091677%3baeb4ab3baeb4ab\"}]}', '2021-03-25 09:57:27'),
(3, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":2140387216277757338,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616687870797812%3baeb4ab3baeb4ab\"}]}', '2021-03-25 09:57:50'),
(4, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5164855708754003730,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616687878429479%3baeb4ab3baeb4ab\"}]}', '2021-03-25 09:57:58'),
(5, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":4410656191377442519,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616687905507633%3baeb4ab3baeb4ab\"}]}', '2021-03-25 09:58:25'),
(6, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":6766925911634352230,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616687931385294%3baeb4ab3baeb4ab\"}]}', '2021-03-25 09:58:51'),
(7, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":7217479502828591055,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616687966524867%3baeb4ab3baeb4ab\"}]}', '2021-03-25 09:59:26'),
(8, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":8169312207680802112,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616687974050357%3baeb4ab3baeb4ab\"}]}', '2021-03-25 09:59:34'),
(9, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":4213757722892251531,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616687999873962%3baeb4ab3baeb4ab\"}]}', '2021-03-25 09:59:59'),
(10, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":410491199853061382,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688023183540%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:00:23'),
(11, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8470229552018736036,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688047908843%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:00:47'),
(12, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8280010958485404615,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688073040433%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:01:13'),
(13, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5329272000271695417,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688147845797%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:02:27'),
(14, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":356310808948776313,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688170140900%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:02:50'),
(15, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2187629176135404860,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688192265297%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:03:12'),
(16, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7518417690349710004,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688214374194%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:03:34'),
(17, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":8832772865200640849,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688578658262%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:09:38'),
(18, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7028087924637057305,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688589107375%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:09:49'),
(19, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":9085432464753415203,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688607573888%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:10:07'),
(20, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":1026429766083139269,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688629599399%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:10:29'),
(21, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":8198779678780725196,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688674105360%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:11:14'),
(22, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5792282666091355819,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688683927348%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:11:23'),
(23, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8283102063115645944,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688700180105%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:11:40'),
(24, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":4434546113997321033,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688716857103%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:11:56'),
(25, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":804277148103783670,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688732796796%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:12:12'),
(26, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":5931785337066969540,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616688747160090%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:12:27'),
(27, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":9008429012493875095,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689123246874%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:18:43'),
(28, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":2409400939545421584,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689129691993%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:18:49'),
(29, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":3088512691164756134,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689134672801%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:18:54'),
(30, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7267608830041275603,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689148087279%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:19:08'),
(31, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8776223346910432425,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689424682433%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:23:44'),
(32, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":4310139090451978526,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689463871312%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:24:23'),
(33, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":113085955409956450,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689477506358%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:24:37'),
(34, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":1744027668059302378,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689491179656%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:24:51'),
(35, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":1346445613362186974,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689497124907%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:24:57'),
(36, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":2748486384077019723,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689627077423%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:27:07'),
(37, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":8943039309059267535,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689632646949%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:27:12'),
(38, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":7605950497661297095,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689656719326%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:27:36'),
(39, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":4064079503713619119,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689760524528%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:29:20'),
(40, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":4352041605495290810,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689768925055%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:29:28'),
(41, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5478537609713079304,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689773928077%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:29:33'),
(42, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":1180529593119499216,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689809183527%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:30:09'),
(43, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2993400687941867318,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689814429220%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:30:14'),
(44, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7877167021080238637,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689818337602%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:30:18'),
(45, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":4338286516458927687,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689822079229%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:30:22'),
(46, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":1624238718835435100,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689825992235%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:30:26'),
(47, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":4925162265720301298,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689854673350%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:30:54'),
(48, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":1264024259136334035,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689878488175%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:31:18'),
(49, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":9184640351229130816,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689884953482%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:31:24'),
(50, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":3466421327822396930,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616689963181945%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:32:43'),
(51, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":815243797793550107,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690004529116%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:33:24'),
(52, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":1698691301801134670,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690012956743%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:33:33'),
(53, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":885625488071642806,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690023020063%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:33:43'),
(54, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":43873320240203658,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690026259743%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:33:46'),
(55, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8908148837230630732,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690091383640%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:34:51'),
(56, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":550346672203818328,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690098403048%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:34:58'),
(57, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8111565951163788670,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690103037080%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:35:03'),
(58, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2036626655005062638,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690105323467%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:35:05'),
(59, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":1953840375619880020,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690128657106%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:35:28'),
(60, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":8568772138423716100,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690136286172%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:35:36'),
(61, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":5325393774350137391,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690141219878%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:35:41'),
(62, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":500844942686837643,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690193526556%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:36:33'),
(63, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":1628565982853550374,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690200206922%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:36:40'),
(64, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":596371528382204866,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690222387320%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:37:02'),
(65, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":8654383639637992358,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690270944715%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:37:51'),
(66, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7184596508133287293,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690292561457%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:38:12'),
(67, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":363447385544090951,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690438382130%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:40:38'),
(68, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":810992263135682810,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690450770077%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:40:50'),
(69, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":335962548756748483,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690573651751%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:42:53'),
(70, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5218760270499973992,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690578943369%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:42:58'),
(71, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":3378263835146234498,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690594099952%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:14'),
(72, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":3985909360601682463,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690596961941%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:16'),
(73, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":3934253851232509994,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690599239024%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:19'),
(74, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5843866393646974526,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690602999785%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:23');
INSERT INTO `api_logs` (`id`, `api_input`, `api_output`, `date_time`) VALUES
(75, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8277771152444835002,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690605479920%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:25'),
(76, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":221449031725486962,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690609536625%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:29'),
(77, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8772911076359554761,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690611706832%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:31'),
(78, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7019060738860959787,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690613894755%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:33'),
(79, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":4561312784918667865,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690616644144%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:36'),
(80, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":6271297225668547648,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690620361928%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:40'),
(81, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7724418464133803733,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690624100840%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:44'),
(82, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":25684603389520702,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690634764117%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:54'),
(83, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5493401083929421244,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690637516760%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:43:57'),
(84, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8470731627258128379,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690640548602%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:44:00'),
(85, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5292792336553632387,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690645519718%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:44:05'),
(86, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2868088853921994282,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690648790632%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:44:08'),
(87, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5453750890097663868,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690708014738%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:45:08'),
(88, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":6020708054527346288,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690717846758%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:45:17'),
(89, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":4684446007911232657,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690794417606%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:46:34'),
(90, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":6483207561670199296,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690801620079%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:46:41'),
(91, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":9190165786714404066,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690886150074%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:48:06'),
(92, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":6149989774253752352,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616690898776683%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:48:18'),
(93, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Close\"}}]', '{\"multicast_id\":7178123220173524889,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691112155881%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:51:52'),
(94, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":1602201776208802446,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691247312998%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:54:07'),
(95, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":3179902075010251708,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691291950504%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:54:52'),
(96, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8116370469556058108,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691303604534%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:55:03'),
(97, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":728584003681550955,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691314430637%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:55:14'),
(98, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":1266025732189070026,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691340989992%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:55:41'),
(99, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5749526876248754568,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691344549199%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:55:44'),
(100, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":3787830123988910371,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691424371656%3baeb4ab3baeb4ab\"}]}', '2021-03-25 10:57:04'),
(101, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":7609893518442800213,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691649218813%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:00:49'),
(102, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":4973336698091518559,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691673273638%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:13'),
(103, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":6379829615668175442,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691679128071%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:19'),
(104, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7783067265159036856,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691681132508%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:21'),
(105, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":1460539900008819399,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691683114836%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:23'),
(106, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":6602698849395869430,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691685124805%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:25'),
(107, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":448407445725857848,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691686968361%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:27'),
(108, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2173145141367507612,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691688921531%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:28'),
(109, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":525499603725318200,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691691241245%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:31'),
(110, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":4087586317033337119,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691696454904%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:36'),
(111, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":4373518885287811277,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691698362675%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:38'),
(112, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2764848346646751266,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691700157939%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:01:40'),
(113, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5126638258585950418,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691726382510%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:02:06'),
(114, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8540986437496946234,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691728325010%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:02:08'),
(115, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":4661079527179127699,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691732111047%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:02:12'),
(116, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":184769031967663982,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691733955864%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:02:13'),
(117, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2860299909954240529,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691735875756%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:02:15'),
(118, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":4662789575468545367,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691737864845%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:02:17'),
(119, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2922320981597520026,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691739932923%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:02:19'),
(120, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":4523580775418585961,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691815562744%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:03:35'),
(121, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5767966093473237071,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691821364215%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:03:41'),
(122, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":3898131719994366409,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691823285454%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:03:43'),
(123, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":1324886249169266288,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691825122114%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:03:45'),
(124, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5698866793714321676,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691827078997%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:03:47'),
(125, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":798359862375409903,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616691828944895%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:03:48'),
(126, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7438836935588348181,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692138404945%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:08:58'),
(127, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":8094640637752495517,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692140660786%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:00'),
(128, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":3803423118239067978,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692143176171%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:03'),
(129, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7954642185788058451,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692145644376%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:05'),
(130, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":3848060715878506857,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692147751240%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:07'),
(131, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":3924646145229917827,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692150086806%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:10'),
(132, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2368849680294171214,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692152405113%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:12'),
(133, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":1958665138515975560,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692154534819%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:14'),
(134, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":1535756566682231268,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692156711527%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:16'),
(135, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":4536354387808693764,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692158959378%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:18'),
(136, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2997689959541841827,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692161586624%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:21'),
(137, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5955631087756199054,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692163706582%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:23'),
(138, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7832028747598959777,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692166038115%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:26'),
(139, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":7212167988536210692,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692168108946%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:28'),
(140, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":3684446107589745947,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692170205978%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:30'),
(141, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2732092574069097657,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692177650802%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:09:37'),
(142, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":117642340860880880,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692201339326%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:10:01'),
(143, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":5433854517621971170,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692241184460%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:10:41'),
(144, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":6633764022698945389,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692337876452%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:12:17'),
(145, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":4681905281955072152,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692375593149%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:12:55'),
(146, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":3172565576201649780,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692396798533%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:13:16'),
(147, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":252968268459311297,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692402831063%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:13:22'),
(148, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":null,\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', 'to\n', '2021-03-25 11:13:50');
INSERT INTO `api_logs` (`id`, `api_input`, `api_output`, `date_time`) VALUES
(149, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":5316511502918112242,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692430398119%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:13:50'),
(150, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":5360809627907091337,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692439266572%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:13:59'),
(151, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":3111538468978800822,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692443355218%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:14:03'),
(152, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":6281920157994172305,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692454666975%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:14:14'),
(153, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":2361634666684569570,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692462290367%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:14:22'),
(154, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":5956496733606129381,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692468091897%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:14:28'),
(155, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":4714963081408472239,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692469675248%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:14:29'),
(156, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":643384179884320677,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692472611448%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:14:32'),
(157, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Close\"}}]', '{\"multicast_id\":137767250108548154,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692474084365%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:14:34'),
(158, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":6557603021763674881,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692481394411%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:14:41'),
(159, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":1549130636927818216,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692485049550%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:14:45'),
(160, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":5373179900058563772,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692505409581%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:15:05'),
(161, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":3798675032942131727,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692518457453%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:15:18'),
(162, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":946278094946651658,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692524844104%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:15:24'),
(163, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":6262898679217556319,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692691188665%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:18:11'),
(164, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\" is set to Hold\"}}]', '{\"multicast_id\":1190950178431883436,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692696339757%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:18:16'),
(165, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":8862178166123306814,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692721762990%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:18:41'),
(166, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Hold\"}}]', '{\"multicast_id\":5193304775388929385,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692738531811%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:18:58'),
(167, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Close\"}}]', '{\"multicast_id\":3792435598140395653,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692742839445%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:19:02'),
(168, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Close\"}}]', '{\"multicast_id\":5734887094803298171,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692803027709%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:20:03'),
(169, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Hold\"}}]', '{\"multicast_id\":7184590848400127539,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692813117979%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:20:13'),
(170, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":6883040774011649336,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616692819154171%3baeb4ab3baeb4ab\"}]}', '2021-03-25 11:20:19'),
(171, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":4425134631475644674,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616856797578887%3baeb4ab3baeb4ab\"}]}', '2021-03-27 08:53:17'),
(172, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Hold\"}}]', '{\"multicast_id\":8231583340688976122,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616856804235271%3baeb4ab3baeb4ab\"}]}', '2021-03-27 08:53:24'),
(173, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Close\"}}]', '{\"multicast_id\":882130835922662285,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1616856812577760%3baeb4ab3baeb4ab\"}]}', '2021-03-27 08:53:32'),
(174, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":8020296105405886671,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1617046037459006%3baeb4ab3baeb4ab\"}]}', '2021-03-29 13:27:17'),
(175, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":null,\"notification\":{\"title\":\"Notification form server\",\"body\":\"Position Alert! Position is Hi\"}}]', 'to\n', '2021-03-29 13:30:45'),
(176, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":null,\"notification\":{\"title\":\"Notification form server\",\"body\":\"Position Alert! Position is Hi\"}}]', 'to\n', '2021-03-29 13:30:45'),
(177, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":null,\"notification\":{\"title\":\"Notification form server\",\"body\":\"Relay/Position Input is been high from 20 minutes\"}}]', 'to\n', '2021-03-29 14:48:19'),
(178, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":null,\"notification\":{\"title\":\"Notification form server\",\"body\":\"Relay/Position Input is been high from 20 minutes\"}}]', 'to\n', '2021-03-29 14:48:19'),
(179, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":8478444121600285067,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1617123100399294%3baeb4ab3baeb4ab\"}]}', '2021-03-30 10:51:40'),
(180, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":573001499082436100,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1617123101728376%3baeb4ab3baeb4ab\"}]}', '2021-03-30 10:51:41'),
(181, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":8553572139140251638,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1617131146621761%3baeb4ab3baeb4ab\"}]}', '2021-03-30 13:05:46'),
(182, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":921336954232524537,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1617131157562658%3baeb4ab3baeb4ab\"}]}', '2021-03-30 13:05:57'),
(183, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":5775749156244229454,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1617388840933174%3baeb4ab3baeb4ab\"}]}', '2021-04-02 12:40:40'),
(184, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":8356748974455494922,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1617388854129453%3baeb4ab3baeb4ab\"}]}', '2021-04-02 12:40:54'),
(185, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Close\"}}]', '{\"multicast_id\":1058811447805965578,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1617716165827904%3baeb4ab3baeb4ab\"}]}', '2021-04-06 07:36:05'),
(186, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":4850855873657561384,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1618775041511539%3baeb4ab3baeb4ab\"}]}', '2021-04-18 13:44:01'),
(187, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":5500302821746708639,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1619016048111783%3baeb4ab3baeb4ab\"}]}', '2021-04-21 08:40:48'),
(188, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"db08GxAuQ_KP59CXZRj6CH:APA91bGflymrEQNWYT9DvHmgbPnoR_fdmZBHJtg7x7fxWg9abd-Gmu7Rv-hqRm-SjKLnXLYskiQroZmrmZ1KA47kznRdHB_f7-IZHDwLHMJk4gbHnYO9_iBVBQ1QyOIKHmA4sqmtFelo\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":8285186087402411256,\"success\":1,\"failure\":0,\"canonical_ids\":0,\"results\":[{\"message_id\":\"0:1619016051285818%3baeb4ab3baeb4ab\"}]}', '2021-04-21 08:40:51'),
(189, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"dyEu0h7pXUePm70wTmsbFZ:APA91bEy_4J_loNYbz4S6yRn3xaG4SnHMfWfELrzYKAqVgwwQJlLLuVbuM3n1h29Fp_YFb88pcERO4WzxiC9siTkUHS-23vU-LeHXsf6tK0mYRHJ4dVqpkhhJtOXwnsMzoE8Z7Ar-c56\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":224281877798400025,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-05-01 08:42:00'),
(190, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"dyEu0h7pXUePm70wTmsbFZ:APA91bEy_4J_loNYbz4S6yRn3xaG4SnHMfWfELrzYKAqVgwwQJlLLuVbuM3n1h29Fp_YFb88pcERO4WzxiC9siTkUHS-23vU-LeHXsf6tK0mYRHJ4dVqpkhhJtOXwnsMzoE8Z7Ar-c56\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":7407810111755182000,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-05-01 08:42:03'),
(191, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"dyEu0h7pXUePm70wTmsbFZ:APA91bEy_4J_loNYbz4S6yRn3xaG4SnHMfWfELrzYKAqVgwwQJlLLuVbuM3n1h29Fp_YFb88pcERO4WzxiC9siTkUHS-23vU-LeHXsf6tK0mYRHJ4dVqpkhhJtOXwnsMzoE8Z7Ar-c56\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":21043589950130620,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-05-01 08:42:03'),
(192, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"e96tMjiqGkKlhBAl1Krx47:APA91bEO5kFhKi4GiWU4PccEUSyz023eucT-riN-yEiGkRIgJRYs5BKykHMFV9etkZkihC4n3Kd6oaDjt72UQWLJrW-d_zEl9JD2UTP4bE96sbpnL7pu71W9-IUD64aJklylWBspKSdn\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"ESP33 is set to Open\"}}]', '{\"multicast_id\":4838465896813230746,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-05-02 02:20:13'),
(193, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"e96tMjiqGkKlhBAl1Krx47:APA91bEO5kFhKi4GiWU4PccEUSyz023eucT-riN-yEiGkRIgJRYs5BKykHMFV9etkZkihC4n3Kd6oaDjt72UQWLJrW-d_zEl9JD2UTP4bE96sbpnL7pu71W9-IUD64aJklylWBspKSdn\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Test device is set to Open\"}}]', '{\"multicast_id\":6683163712429518351,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-05-02 02:20:17'),
(194, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"dyEu0h7pXUePm70wTmsbFZ:APA91bEy_4J_loNYbz4S6yRn3xaG4SnHMfWfELrzYKAqVgwwQJlLLuVbuM3n1h29Fp_YFb88pcERO4WzxiC9siTkUHS-23vU-LeHXsf6tK0mYRHJ4dVqpkhhJtOXwnsMzoE8Z7Ar-c56\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":3857810598619763369,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-05-02 08:34:48'),
(195, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"dyEu0h7pXUePm70wTmsbFZ:APA91bEy_4J_loNYbz4S6yRn3xaG4SnHMfWfELrzYKAqVgwwQJlLLuVbuM3n1h29Fp_YFb88pcERO4WzxiC9siTkUHS-23vU-LeHXsf6tK0mYRHJ4dVqpkhhJtOXwnsMzoE8Z7Ar-c56\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":488959887222090000,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-05-02 08:34:52'),
(196, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"dyEu0h7pXUePm70wTmsbFZ:APA91bEy_4J_loNYbz4S6yRn3xaG4SnHMfWfELrzYKAqVgwwQJlLLuVbuM3n1h29Fp_YFb88pcERO4WzxiC9siTkUHS-23vU-LeHXsf6tK0mYRHJ4dVqpkhhJtOXwnsMzoE8Z7Ar-c56\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Test Unit 3 is set to Open\"}}]', '{\"multicast_id\":4121548053422795781,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-05-04 15:55:29'),
(197, '[[\"Authorization:key = AAAAJ9TR7wM:APA91bG89Ri7cTBKbBV1w2axSdj3eAgflefPLNprlKEQ1DNh0A4Ylsu3VyovtHr5bmUwns8eaiKF_j65TrTqmCouOE0nm0cpvwMoTyc_OOt0-6hPeh3KmWW4MxuP69I76ev6GO42vUgo\",\"Content-Type: application/json\"],{\"to\":\"dyEu0h7pXUePm70wTmsbFZ:APA91bEy_4J_loNYbz4S6yRn3xaG4SnHMfWfELrzYKAqVgwwQJlLLuVbuM3n1h29Fp_YFb88pcERO4WzxiC9siTkUHS-23vU-LeHXsf6tK0mYRHJ4dVqpkhhJtOXwnsMzoE8Z7Ar-c56\",\"notification\":{\"title\":\"Notification form server\",\"body\":\"Scott Test Unit 1 is set to Open\"}}]', '{\"multicast_id\":5032989510678521630,\"success\":0,\"failure\":1,\"canonical_ids\":0,\"results\":[{\"error\":\"MismatchSenderId\"}]}', '2021-05-05 08:59:22');

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
(1, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-03 09:15:39'),
(2, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-04 13:15:51'),
(3, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-05 13:51:30'),
(4, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-05 14:00:54'),
(5, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-05 14:24:44'),
(6, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-05 19:12:01'),
(7, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 12:54:09'),
(8, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 13:44:29'),
(9, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 13:45:33'),
(10, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 13:46:18'),
(11, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 13:46:38'),
(12, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 13:46:50'),
(13, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 13:48:25'),
(14, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 13:49:05'),
(15, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 13:49:15'),
(16, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 13:49:29'),
(17, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-06 18:09:17'),
(18, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-01-08 09:45:32'),
(19, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-01-08 09:46:01'),
(20, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-01-08 09:46:19'),
(21, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-01-08 09:47:04'),
(22, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-01-08 09:47:52'),
(23, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-01-08 09:48:07'),
(24, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-01-08 09:48:11'),
(25, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-01-08 09:58:51'),
(26, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-01-08 09:59:21'),
(27, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-09 09:16:57'),
(28, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-09 09:20:26'),
(29, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-09 09:20:45'),
(30, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-09 09:37:17'),
(31, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-09 09:37:34'),
(32, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-09 15:07:51'),
(33, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 09:59:02'),
(34, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 09:59:14'),
(35, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:00:09'),
(36, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:00:33'),
(37, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:00:40'),
(38, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:00:48'),
(39, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:01:27'),
(40, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:01:39'),
(41, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:02:15'),
(42, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:04:01'),
(43, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:04:32'),
(44, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:04:41'),
(45, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:09:47'),
(46, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 10:12:59'),
(47, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 11:15:32'),
(48, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 11:17:55'),
(49, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 11:18:19'),
(50, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 11:19:11'),
(51, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 11:23:26'),
(52, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 12:09:27'),
(53, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 12:12:27'),
(54, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-14 12:12:42'),
(55, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-15 11:19:16'),
(56, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 11:58:15'),
(57, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:08:59'),
(58, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:09:29'),
(59, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:09:48'),
(60, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:11:37'),
(61, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:11:54'),
(62, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:14:56'),
(63, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:17:30'),
(64, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:20:10'),
(65, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:58:01'),
(66, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:59:13'),
(67, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-01-18 12:59:43'),
(68, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-01-18 13:00:28'),
(69, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-01-20 08:59:06'),
(70, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-01-20 08:59:08'),
(71, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-01-20 08:59:10'),
(72, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-01-20 08:59:37'),
(73, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:3e:28', 'Open', '2021-02-16 13:12:24'),
(74, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:3e:28', 'Open', '2021-02-16 13:12:29'),
(75, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-02-16 13:14:03'),
(76, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:3e:28', 'Open', '2021-02-16 13:14:31'),
(77, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:3e:28', 'Open', '2021-02-16 13:14:33'),
(78, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-02-16 13:15:14'),
(79, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:3e:28', 'Open', '2021-02-16 13:15:24'),
(80, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:3e:28', 'Close', '2021-02-16 13:18:52'),
(81, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-02-18 09:06:08'),
(82, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-02-18 12:05:18'),
(83, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-02-18 12:05:21'),
(84, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-02-21 21:07:14'),
(85, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-02-21 21:07:16'),
(86, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-02-21 21:07:18'),
(87, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-02-21 21:07:22'),
(88, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-02-21 21:07:23'),
(89, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-02-21 21:07:26'),
(90, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-02-21 21:07:28'),
(91, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-02-21 21:07:39'),
(92, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-02-21 21:07:50'),
(93, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-02-21 21:08:16'),
(94, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-02-21 21:08:31'),
(95, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-02-21 21:12:50'),
(96, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-02-21 21:12:53'),
(97, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-02-21 21:12:54'),
(98, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-02-21 21:12:56'),
(99, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-02-21 21:13:31'),
(100, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-02-21 21:13:33'),
(101, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-02-21 21:13:35'),
(102, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-02-21 21:13:37'),
(103, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-02-21 21:13:39'),
(104, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-02-25 14:30:12'),
(105, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-02-25 14:33:57'),
(106, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-02-25 14:33:59'),
(107, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-02-25 14:34:04'),
(108, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-02-25 14:34:15'),
(109, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-02-25 14:34:23'),
(110, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-02-25 14:43:27'),
(111, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-04 14:37:02'),
(112, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-04 14:37:12'),
(113, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:37:18'),
(114, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:37:23'),
(115, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:37:36'),
(116, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:37:48'),
(117, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:37:54'),
(118, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:38:01'),
(119, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-04 14:38:07'),
(120, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-04 14:38:18'),
(121, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:38:27'),
(122, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-03-04 14:38:38'),
(123, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:38:45'),
(124, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:39:04'),
(125, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:39:33'),
(126, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:40:25'),
(127, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:40:36'),
(128, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-04 14:40:45'),
(129, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-04 14:40:51'),
(130, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:40:57'),
(131, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:41:05'),
(132, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:41:10'),
(133, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:41:15'),
(134, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-04 14:41:21'),
(135, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-03-04 14:41:31'),
(136, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-04 14:41:39'),
(137, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-06 16:06:22'),
(138, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-08 08:53:33'),
(139, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-08 22:46:01'),
(140, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 22:46:04'),
(141, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 22:47:26'),
(142, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-08 22:47:30'),
(143, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-08 22:47:43'),
(144, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-08 23:27:46'),
(145, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-08 23:27:54'),
(146, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-08 23:28:58'),
(147, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 23:29:01'),
(148, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 23:29:03'),
(149, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-08 23:29:05'),
(150, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-08 23:29:07'),
(151, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 23:29:10'),
(152, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 23:29:57'),
(153, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-08 23:30:00'),
(154, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 23:30:03'),
(155, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-08 23:30:07'),
(156, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-08 23:37:57'),
(157, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 23:37:59'),
(158, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-08 23:38:46'),
(159, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-08 23:42:59'),
(160, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-08 23:49:26'),
(161, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-08 23:49:59'),
(162, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 23:50:04'),
(163, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-08 23:51:08'),
(164, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 23:51:15'),
(165, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-08 23:55:20'),
(166, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-08 23:55:22'),
(167, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 00:02:02'),
(168, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 00:02:57'),
(169, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:03:02'),
(170, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 00:03:05'),
(171, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 00:03:14'),
(172, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 00:04:27'),
(173, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:04:29'),
(174, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 00:04:31'),
(175, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 00:04:32'),
(176, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:04:34'),
(177, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:04:37'),
(178, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 00:04:39'),
(179, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 00:06:42'),
(180, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:06:44'),
(181, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 00:06:46'),
(182, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:06:51'),
(183, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 00:06:53'),
(184, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 00:06:55'),
(185, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:06:57'),
(186, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:06:59'),
(187, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 00:07:01'),
(188, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 00:07:03'),
(189, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:07:04'),
(190, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 00:07:44'),
(191, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:07:46'),
(192, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 00:07:48'),
(193, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:07:49'),
(194, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 00:07:51'),
(195, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:07:53'),
(196, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 00:07:56'),
(197, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:07:58'),
(198, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 00:19:46'),
(199, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:19:48'),
(200, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 00:19:50'),
(201, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 00:19:51'),
(202, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 07:20:47'),
(203, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 07:21:05'),
(204, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 07:24:30'),
(205, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 07:32:36'),
(206, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'hold', '2021-03-09 07:41:07'),
(207, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'open', '2021-03-09 07:42:01'),
(208, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'close', '2021-03-09 08:05:17'),
(209, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'open', '2021-03-09 08:05:19'),
(210, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'hold', '2021-03-09 08:05:21'),
(211, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'close', '2021-03-09 08:05:24'),
(212, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'open', '2021-03-09 08:05:30'),
(213, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 08:06:15'),
(214, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 08:06:20'),
(215, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 08:06:30'),
(216, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 08:13:33'),
(217, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 08:13:36'),
(218, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 08:13:38'),
(219, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 08:17:58'),
(220, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 08:18:02'),
(221, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 08:18:04'),
(222, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 08:18:59'),
(223, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 09:20:52'),
(224, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 09:20:57'),
(225, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 09:21:02'),
(226, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 09:21:07'),
(227, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 09:21:31'),
(228, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 09:21:33'),
(229, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 09:21:39'),
(230, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 09:21:43'),
(231, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-09 12:37:58'),
(232, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-09 12:38:01'),
(233, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-03-09 12:38:04'),
(234, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:53:45'),
(235, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:53:56'),
(236, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:54:45'),
(237, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:54:52'),
(238, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:54:59'),
(239, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-15 13:55:04'),
(240, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-03-15 13:55:11'),
(241, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:55:15'),
(242, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:56:14'),
(243, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:56:21'),
(244, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:56:31'),
(245, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-03-15 13:56:38'),
(246, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-15 13:56:44'),
(247, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-03-15 13:56:51'),
(248, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:57:32'),
(249, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:59:01'),
(250, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-15 13:59:10'),
(251, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:59:19'),
(252, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 13:59:47'),
(253, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:00:02'),
(254, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:00:18'),
(255, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-15 14:00:24'),
(256, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:00:33'),
(257, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-15 14:00:41'),
(258, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-03-15 14:00:51'),
(259, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:00:57'),
(260, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:01:03'),
(261, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:01:16'),
(262, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:01:25'),
(263, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-15 14:01:32'),
(264, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:01:40'),
(265, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:01:56'),
(266, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:02:39'),
(267, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:02:47'),
(268, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:03:56'),
(269, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:04:12'),
(270, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:06:33'),
(271, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:07:18'),
(272, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:07:27'),
(273, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:08:12'),
(274, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:08:29'),
(275, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:08:42'),
(276, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:09:02'),
(277, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:17:39'),
(278, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:21:13'),
(279, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:21:45'),
(280, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:21:52'),
(281, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:22:03'),
(282, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:22:38'),
(283, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:28:47'),
(284, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:28:58'),
(285, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:31:25'),
(286, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:34:32'),
(287, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:35:34'),
(288, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:39:52'),
(289, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 14:43:05'),
(290, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 17:12:46'),
(291, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-15 17:12:57'),
(292, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-03-15 23:47:15'),
(293, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-03-15 23:47:22'),
(294, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-15 23:48:11'),
(295, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-03-15 23:48:25'),
(296, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-15 23:49:39'),
(297, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-03-16 00:04:43'),
(298, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-16 00:05:14'),
(299, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-03-16 00:05:21'),
(300, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-16 00:06:18'),
(301, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-16 00:06:28'),
(302, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-03-16 00:06:41'),
(303, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-03-16 00:06:47'),
(304, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-16 00:07:01'),
(305, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-03-16 00:13:39'),
(306, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-03-16 00:13:48'),
(307, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-03-16 00:13:55'),
(308, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-16 00:25:52'),
(309, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-03-16 00:26:01'),
(310, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-03-16 00:26:12'),
(311, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-03-16 00:26:19'),
(312, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-03-16 00:26:25'),
(313, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-16 00:26:37'),
(314, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-03-16 00:27:15'),
(315, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-03-16 00:27:19'),
(316, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-16 00:27:41'),
(317, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-16 00:27:50'),
(318, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-03-16 00:29:18'),
(319, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-03-16 00:29:25'),
(320, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-16 00:30:12'),
(321, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-03-16 04:20:08'),
(322, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 14:41:25'),
(323, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 14:41:32'),
(324, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 14:44:30'),
(325, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-17 14:44:37'),
(326, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-03-17 14:44:49'),
(327, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-17 14:44:55'),
(328, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-17 14:45:01'),
(329, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 14:45:06'),
(330, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 15:26:37'),
(331, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 15:27:18'),
(332, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-03-17 15:27:24'),
(333, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Close', '2021-03-17 15:27:30'),
(334, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 15:28:17'),
(335, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 15:31:37'),
(336, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 15:32:03'),
(337, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-17 15:46:30'),
(338, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 15:46:35'),
(339, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-17 16:18:15'),
(340, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 16:18:23'),
(341, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 16:19:36'),
(342, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 16:23:19'),
(343, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 16:25:07'),
(344, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 16:25:18'),
(345, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 16:25:21'),
(346, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 16:25:26'),
(347, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Hold', '2021-03-17 16:25:32'),
(348, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 16:27:43'),
(349, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-17 16:27:56'),
(350, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 11:16:51'),
(351, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 11:22:02'),
(352, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 11:22:14'),
(353, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-03-18 11:48:32'),
(354, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-03-18 11:49:26'),
(355, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-03-18 11:49:48'),
(356, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:02:15'),
(357, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:04:51'),
(358, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:04:58'),
(359, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:05:01'),
(360, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:05:22'),
(361, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:05:32'),
(362, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:05:40'),
(363, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:08:13'),
(364, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:18:30'),
(365, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:18:32'),
(366, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:18:38'),
(367, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:19:59'),
(368, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:22:19'),
(369, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-18 12:23:24'),
(370, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:3e:28', 'Open', '2021-03-18 23:38:36'),
(371, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-19 12:37:03'),
(372, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-19 12:38:18'),
(373, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-19 12:39:39'),
(374, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-19 12:40:52'),
(375, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-19 12:41:31'),
(376, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-19 12:42:02'),
(377, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-19 12:42:38'),
(378, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-19 12:46:00'),
(379, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-19 12:49:10'),
(380, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-19 14:06:14'),
(381, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-22 11:02:46'),
(382, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-22 11:02:54'),
(383, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-22 11:03:25'),
(384, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-22 11:40:28'),
(385, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-22 12:05:35'),
(386, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-22 12:05:38'),
(387, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-22 12:05:41'),
(388, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-22 12:05:42'),
(389, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-22 12:05:44'),
(390, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-22 12:05:50'),
(391, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-22 15:11:04'),
(392, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-22 15:15:23'),
(393, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-22 15:15:27'),
(394, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-22 15:15:32'),
(395, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-23 09:08:40'),
(396, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-23 09:08:43'),
(397, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-03-23 09:54:19'),
(398, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-23 09:57:22'),
(399, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-03-23 10:39:57'),
(400, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-23 10:40:08'),
(401, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-23 10:42:34'),
(402, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-23 10:42:39'),
(403, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-23 10:42:45'),
(404, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-03-23 10:42:56'),
(405, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-03-23 10:42:58'),
(406, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-23 10:43:10'),
(407, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-23 10:48:34'),
(408, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-23 11:28:20'),
(409, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-23 11:28:33'),
(410, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-23 11:30:01'),
(411, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-23 16:25:15'),
(412, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B4:3E:28', 'Open', '2021-03-23 16:25:25'),
(413, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-23 16:25:31'),
(414, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-23 16:25:34'),
(415, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-23 16:25:39'),
(416, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 09:12:44'),
(417, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 10:42:42'),
(418, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-03-24 10:42:49'),
(419, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 10:44:10'),
(420, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 10:44:26'),
(421, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 10:44:35'),
(422, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 10:49:07'),
(423, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 11:42:57'),
(424, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-03-24 11:55:54'),
(425, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 14:44:24'),
(426, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 14:50:06'),
(427, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 14:50:13'),
(428, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 14:52:10'),
(429, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-24 14:52:49'),
(430, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-24 14:52:55'),
(431, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-24 14:53:02'),
(432, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 14:53:12'),
(433, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 15:04:06'),
(434, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 15:04:16'),
(435, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 15:04:38'),
(436, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 15:04:47'),
(437, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 15:04:55'),
(438, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 15:05:03'),
(439, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 15:05:17'),
(440, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-24 15:40:32'),
(441, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-25 09:42:45'),
(442, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-25 09:43:05'),
(443, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-25 09:43:08'),
(444, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-25 09:43:14'),
(445, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-25 09:43:22'),
(446, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-25 09:43:24'),
(447, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-25 09:44:22'),
(448, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-25 11:12:28'),
(449, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-25 12:15:08'),
(450, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-26 08:23:14'),
(451, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-27 08:53:58'),
(452, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-03-27 08:54:05'),
(453, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-03-27 08:54:12'),
(454, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-03-27 08:54:21'),
(455, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-28 09:57:13'),
(456, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-03-29 14:09:00'),
(457, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-09 21:33:21'),
(458, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-09 21:33:24'),
(459, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-09 22:05:57'),
(460, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-09 22:05:59'),
(461, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-09 22:15:55'),
(462, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-09 22:15:58'),
(463, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-09 22:16:02'),
(464, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-09 22:24:57'),
(465, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-09 22:25:00'),
(466, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-09 22:25:05'),
(467, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-09 22:25:10'),
(468, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-09 22:25:16'),
(469, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-09 22:25:31'),
(470, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-09 22:25:37'),
(471, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-10 09:52:26'),
(472, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-11 05:28:48'),
(473, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-11 05:28:50'),
(474, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-11 05:28:52'),
(475, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-04-11 05:29:32'),
(476, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-11 06:07:55'),
(477, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-11 06:07:56'),
(478, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-11 06:07:57'),
(479, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-11 06:07:59'),
(480, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-11 06:08:00'),
(481, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-11 06:22:15'),
(482, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-11 06:22:18'),
(483, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-11 09:44:09'),
(484, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-11 09:44:11'),
(485, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-11 10:00:02'),
(486, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-11 10:00:04'),
(487, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-11 10:00:05'),
(488, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-11 10:00:08'),
(489, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-11 10:00:10'),
(490, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-11 10:00:10'),
(491, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-11 10:00:12'),
(492, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-11 10:00:12'),
(493, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-11 10:00:17'),
(494, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-11 10:00:20'),
(495, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-11 10:00:22'),
(496, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-11 10:00:25'),
(497, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-11 10:00:28'),
(498, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-11 10:01:39'),
(499, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-12 09:59:39'),
(500, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-12 09:59:42'),
(501, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-12 10:00:06'),
(502, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-14 08:59:54'),
(503, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-14 09:00:00'),
(504, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-14 09:00:08'),
(505, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-14 09:00:25'),
(506, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-14 09:01:47'),
(507, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-14 09:01:51'),
(508, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-14 09:01:56'),
(509, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-14 09:01:59'),
(510, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-14 09:47:43'),
(511, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-15 09:19:29'),
(512, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-15 09:19:40'),
(513, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-15 09:19:47'),
(514, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-15 09:19:49'),
(515, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-17 12:15:00'),
(516, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-17 12:15:00'),
(517, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-17 12:15:01'),
(518, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-17 12:15:01'),
(519, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-17 12:15:02'),
(520, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-17 12:15:03'),
(521, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-17 12:15:05'),
(522, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-17 12:15:06'),
(523, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-17 12:15:06'),
(524, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-17 12:15:07'),
(525, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-17 12:15:07'),
(526, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-17 12:15:08'),
(527, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-17 12:15:13'),
(528, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-17 12:15:15'),
(529, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-17 12:15:18'),
(530, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-17 12:15:18'),
(531, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-17 12:15:19'),
(532, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-17 12:15:20'),
(533, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-04-17 12:15:28'),
(534, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Close', '2021-04-17 12:15:30'),
(535, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-04-17 12:15:32'),
(536, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-04-17 12:15:34'),
(537, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-04-17 12:15:35'),
(538, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-04-17 12:15:38'),
(539, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-04-17 12:15:40'),
(540, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-04-17 12:15:41'),
(541, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-04-17 12:15:44'),
(542, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-04-17 12:15:46'),
(543, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-04-17 12:15:48'),
(544, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Hold', '2021-04-17 12:15:50'),
(545, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-17 17:28:43'),
(546, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-17 17:28:46'),
(547, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-17 17:28:47'),
(548, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-19 00:20:25'),
(549, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-19 00:20:27'),
(550, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-19 00:20:27'),
(551, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-19 22:31:04'),
(552, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-19 22:31:07'),
(553, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-19 22:31:09'),
(554, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-19 23:14:07'),
(555, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-19 23:14:09'),
(556, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-19 23:14:12'),
(557, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-19 23:14:13'),
(558, 'AA:00:FF:CC:50:77', 'C8:2B:96:B2:71:A4', 'Open', '2021-04-19 23:15:09'),
(559, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-04-20 01:30:18'),
(560, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Hold', '2021-04-20 01:30:21'),
(561, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Close', '2021-04-20 01:30:23'),
(562, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-21 10:38:47'),
(563, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-04-21 10:38:57'),
(564, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-21 10:39:00'),
(565, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-21 10:40:23'),
(566, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-21 10:40:27'),
(567, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-21 11:21:41'),
(568, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-21 11:23:47'),
(569, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-21 11:24:35'),
(570, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-21 11:24:47'),
(571, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-21 11:24:58'),
(572, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-04-21 11:25:07'),
(573, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-04-21 11:25:11'),
(574, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-04-21 11:27:02'),
(575, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-22 12:45:46'),
(576, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-26 16:15:58'),
(577, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-04-26 16:16:17'),
(578, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-03 15:36:49'),
(579, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-03 16:21:10'),
(580, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-03 16:21:17'),
(581, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-05-03 16:21:24'),
(582, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-05-03 16:21:32'),
(583, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-05-03 16:21:43'),
(584, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-03 16:21:51'),
(585, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-05-03 16:22:01'),
(586, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-05-03 16:22:04'),
(587, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-05-03 16:22:10'),
(588, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-03 16:22:14'),
(589, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-03 16:22:16'),
(590, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-03 16:22:26'),
(591, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-05-03 16:22:32'),
(592, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-05-03 16:22:36'),
(593, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-05-03 16:22:39'),
(594, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:2c:34', 'Open', '2021-05-04 16:00:15'),
(595, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:2c:34', 'Open', '2021-05-04 16:00:23'),
(596, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:2c:34', 'Close', '2021-05-04 16:00:31'),
(597, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-04 16:03:37'),
(598, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-05-10 06:00:01'),
(599, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-13 09:54:13'),
(600, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-20 15:52:59'),
(601, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-05-20 16:13:57'),
(602, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-20 16:15:13'),
(603, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-20 16:15:21'),
(604, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Close', '2021-05-20 16:15:27'),
(605, '00:11:22:33:44:55', '24:6F:28:F1:6B:48', 'Open', '2021-05-24 11:53:02'),
(606, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:2c:34', 'Open', '2021-05-26 12:24:56'),
(607, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:2c:34', 'Hold', '2021-05-26 12:25:00'),
(608, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:2c:34', 'Hold', '2021-05-26 12:25:04'),
(609, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:2c:34', 'Close', '2021-05-26 12:25:08'),
(610, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:2c:34', 'Close', '2021-05-26 12:25:15'),
(611, 'b0:72:bf:ef:50:c7', 'c8:2b:96:b4:2c:34', 'Open', '2021-05-26 12:25:21'),
(612, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-05-26 12:25:28'),
(613, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-26 12:25:32'),
(614, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Hold', '2021-05-26 12:25:35'),
(615, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-26 12:25:38'),
(616, 'b0:72:bf:ef:50:c7', 'C8:2B:96:B3:EE:00', 'Open', '2021-05-26 12:25:42');

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
(59, '', 0, 'Andrew', 'James', 1, 'esp32@esp32.com', 'user', 0, '818923982user.png', '24:6F:28:F1:6B:48', 'AA:BB:CC:DD:EE:FF', 0, 'e96tMjiqGkKlhBAl1Krx47:APA91bEO5kFhKi4GiWU4PccEUSyz023eucT-riN-yEiGkRIgJRYs5BKykHMFV9etkZkihC4n3Kd6oaDjt72UQWLJrW-d_zEl9JD2UTP4bE96sbpnL7pu71W9-IUD64aJklylWBspKSdn'),
(107, '', 0, 'Sample', 'Account', 1, 'sample@sample.com', 'Sample', 0, 'default.png', '22224444', '55556666', 0, 'crzbIYLDSO6ZdRAHvR1_tw:APA91bEXqoPxtbwvPnT1recKgUhs2IkOk-Sm4G0ssKKotTOYYZR62tBiaZEKFUXAqHikdbL4I_YWN_cAVCAJbRbX8ns9-GOmKxlW9OT_jGeiDpNBUJOqD_8JHQhco1NkBaKjo1IfeUUP'),
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
(132, 'guest', 59, 'Guest', 'User', 1, 'guest@user.com', 'guest@user.com', 0, 'default.png', '', '', 0, '');

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
(106, 'Test device', 7, 0, 59, 0, 'C8:2B:96:B2:71:A4', 'AA:00:FF:CC:50:77', 'gate.jfif', 0, '', '', 'Open', '5', 'Alive', '1711319232', '67414208', '05-03-2021 02:57:46', 1, 'Hi', 'Momentary', 30, 1, 1, 1, 'Lo', 'Hi', 'Hi', 'Lo'),
(126, 'Scott Test Unit 1', 4, 1, 107, 0, 'C8:2B:96:B3:EE:00', 'b0:72:bf:ef:50:c7', 'gate.jfif', 0, '', '', 'Open', 'none', 'Alive', '36350144', '67414208', '22-03-2021 11:34:32', 1, 'none', 'Momentary', 2, 1, 1, 1, 'Lo', 'Lo', 'Lo', 'Lo'),
(132, 'Test', 1, 0, 107, 0, 'c8:2b:96:b4:3e:28', 'b0:72:bf:fe:50:c7', 'gate.jfif', 0, '', '', 'Open', 'none', '', '', '', '18-03-2021 23:32:28', 1, '', '', 0, 1, 1, 1, 'Lo', 'Lo', 'Hi', 'Lo'),
(134, 'Main gate', 0, 0, 130, 0, '9E:0C:03:E4:30:AF', '9E:0C:03:E4:30:AF', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '19-04-2021 22:25:23', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(135, 'Gate', 0, 0, 131, 0, '9E:0C:03:E4:30:AF', '9E:0C:03:E4:30:AF', 'gate.jfif', 0, '', '', '', 'none', '', '', '', '19-04-2021 22:30:24', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', ''),
(136, 'Test Unit 3', 4, 1, 107, 0, 'c8:2b:96:b4:2c:34', 'b0:72:bf:ef:50:c7', 'gate.jfif', 0, '', '', 'Open', 'none', '', '', '', '04-05-2021 15:55:04', 1, '', '', 0, 1, 1, 1, 'Lo', 'Lo', 'Hi', 'Lo'),
(137, 'ESP33', 0, 0, 132, 59, '24:6F:28:F1:6B:48', 'my:moobile', 'gate.jfif', 1, '', '', '', 'none', '', '', '', '', 1, '', '', 0, 1, 1, 1, '', 'Lo', '', '');

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `alive_status`
--
ALTER TABLE `alive_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `app_requests`
--
ALTER TABLE `app_requests`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=617;

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machine_req_recievedack`
--
ALTER TABLE `machine_req_recievedack`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule_guest`
--
ALTER TABLE `schedule_guest`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `user_and_devices`
--
ALTER TABLE `user_and_devices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
