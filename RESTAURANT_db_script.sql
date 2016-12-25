-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2015 at 06:17 AM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `Coupon_code` int(11) NOT NULL,
  `R_id` int(11) NOT NULL,
  `E_id` varchar(20) NOT NULL,
  `Date` date NOT NULL,
  `Discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`Coupon_code`, `R_id`, `E_id`, `Date`, `Discount`) VALUES
(1, 2, 'vsreelasya@gmail.com', '2013-03-03', 20),
(2, 3, 'sekharchallapilla@gm', '2014-02-04', 12),
(3, 5, 'mvaishist', '2015-01-09', 30),
(4, 1, 'chiatanyapochampalli', '2014-05-05', 40),
(5, 7, 'tadael@yahoo.com', '2013-07-01', 67),
(6, 9, 'soumyamedapati1@gmai', '2014-03-06', 30),
(7, 8, 'vishnupriya@gmail.co', '2011-02-04', 25),
(8, 10, 'vishnupriya@gmail.co', '2012-01-04', 35),
(9, 4, 'sandeep@gmail.com', '2012-03-04', 33),
(10, 3, 'sandeep@gmail.com', '2010-05-06', 20),
(11, 3, 'sandeep@gmail.com', '2010-01-04', 30),
(12, 4, 'sandeep@gmail.com', '2009-01-03', 20),
(13, 9, 'vishnupriya@gmail.co', '2008-09-10', 15),
(14, 8, 'vishnupriya@gmail.co', '2005-05-06', 59),
(15, 7, 'mvaishist', '2004-02-01', 40),
(16, 7, 'chiatanyapochampalli', '2004-05-06', 34),
(17, 4, 'chiatanyapochampalli', '2004-01-02', 23),
(18, 5, 'chiatanyapochampalli', '2001-01-03', 25),
(19, 7, 'chiatanyapochampalli', '2001-09-08', 65),
(20, 8, 'chiatanyapochampalli', '2010-01-01', 70),
(21, 9, 'chiatanyapochampalli', '2010-09-09', 30),
(22, 9, 'vsreelasya@gmail.com', '2010-03-07', 20),
(23, 9, 'vsreelasya@gmail.com', '2010-03-04', 15),
(24, 7, 'soumyamedapati1@gmai', '2010-03-04', 13),
(25, 8, 'soumyamedapati1@gmai', '2010-03-04', 10),
(26, 2, 'soumyamedapati1@gmai', '2004-01-03', 11),
(27, 3, 'soumyamedapati1@gmai', '2005-03-04', 15),
(28, 4, 'soumyamedapati1@gmai', '2004-01-03', 20),
(29, 5, 'vishnupriya@gmail.co', '2003-02-01', 25),
(30, 6, 'vishnupriya@gmail.co', '2002-03-04', 30);

-- --------------------------------------------------------

--
-- Table structure for table `cuisine`
--

CREATE TABLE `cuisine` (
  `Cuisine_id` int(11) NOT NULL,
  `Name` enum('American','chinese','French','Indian','Italian','Mediterranean','Mexican','Thai','Vietnamese') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuisine`
--

INSERT INTO `cuisine` (`Cuisine_id`, `Name`) VALUES
(1, 'French'),
(2, 'Italian'),
(3, 'American'),
(4, 'chinese'),
(5, 'Indian'),
(6, 'French'),
(7, 'American'),
(8, 'chinese'),
(9, 'Indian'),
(10, 'Mexican'),
(11, 'Thai'),
(12, 'Italian'),
(13, 'Mediterranean'),
(14, 'Mediterranean'),
(15, 'Mexican'),
(16, 'Thai'),
(17, 'Vietnamese');

-- --------------------------------------------------------

--
-- Table structure for table `cuisine_preference`
--

CREATE TABLE `cuisine_preference` (
  `cuis_id` int(11) NOT NULL,
  `eid` varchar(45) NOT NULL,
  `preference` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cuisine_preference`
--

INSERT INTO `cuisine_preference` (`cuis_id`, `eid`, `preference`) VALUES
(2, 'mvaishist', 2),
(2, 'sandeep@gmail.com', 3),
(5, 'anushasudhini@yahoo.', 3),
(5, 'sindhuja@gmail.com', 2),
(6, 'tadael@yahoo.com', 4),
(14, 'chiatanyapochampalli', 3),
(14, 'soumyamedapati1@gmai', 5),
(1, 'vidyataketpalli@gmai', 3),
(8, 'vishnupriya@gmail.co', 1),
(8, 'vsreelasya@gmail.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `Dish_id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `cuisine_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`Dish_id`, `Name`, `cuisine_id`) VALUES
(1, 'Sausage', 3),
(2, 'Barbeque', 7),
(3, 'Biryani', 5),
(4, 'Dal makhni', 9),
(5, 'Hakka noodles', 4),
(6, 'Manchurian', 8),
(7, 'Baguette', 1),
(8, 'Flute', 6),
(9, 'Mossaka', 13),
(10, 'Casserole', 14),
(11, 'olive ', 2),
(12, 'Bread stick', 12),
(13, 'Burrito', 10),
(14, 'Choriza', 15),
(15, 'Shrimp', 11),
(16, 'Omlet and rice', 16),
(17, 'Spring roles', 17);

-- --------------------------------------------------------

--
-- Table structure for table `dish_preference`
--

CREATE TABLE `dish_preference` (
  `Did` int(11) NOT NULL,
  `ema_id` varchar(45) NOT NULL,
  `preference` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dish_preference`
--

INSERT INTO `dish_preference` (`Did`, `ema_id`, `preference`) VALUES
(1, 'vsreelasya@gmail.com', '3'),
(2, 'mvaishist', '5');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `user_email` varchar(20) NOT NULL,
  `follower_email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`user_email`, `follower_email`) VALUES
('soumyamedapati1@gmai', 'vsreelasya@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_address`
--

CREATE TABLE `restaurant_address` (
  `Address_id` int(11) NOT NULL,
  `Restaurant_id` int(11) NOT NULL,
  `Rest_Address` varchar(45) NOT NULL,
  `Longitude` float NOT NULL,
  `Lattitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_address`
--

INSERT INTO `restaurant_address` (`Address_id`, `Restaurant_id`, `Rest_Address`, `Longitude`, `Lattitude`) VALUES
(1, 1, 'memphis', 59.8, 87.92),
(2, 2, 'Arlington', 54.32, 23.78),
(3, 3, 'Arlington', 45.97, 90.67),
(4, 4, 'dallas', 50.9, 40.35),
(5, 5, 'California', 67.8, 89),
(6, 6, 'memphis', 89.9, 90.08),
(7, 7, 'Dallas', 87.5, 89.7),
(8, 8, 'memphis', 67.8, 66.8),
(9, 9, 'ohio', 56.4, 23.34),
(10, 10, 'memphis', 89.8, 70.78);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_cuisine`
--

CREATE TABLE `restaurant_cuisine` (
  `id_cus` int(11) NOT NULL,
  `id_res` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_cuisine`
--

INSERT INTO `restaurant_cuisine` (`id_cus`, `id_res`) VALUES
(1, 3),
(3, 9),
(4, 4),
(5, 5),
(7, 10),
(8, 6),
(10, 2),
(12, 1),
(14, 7),
(16, 8);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_dish`
--

CREATE TABLE `restaurant_dish` (
  `id_rest` int(11) NOT NULL,
  `id_dish` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_dish`
--

INSERT INTO `restaurant_dish` (`id_rest`, `id_dish`) VALUES
(1, 16),
(2, 9),
(3, 8),
(4, 1),
(5, 3),
(6, 2),
(7, 11),
(8, 4),
(9, 14),
(10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_table`
--

CREATE TABLE `restaurant_table` (
  `Restaurant_id` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Type_of_restaurant` enum('Ethnic','Fast_Food','Fast_Casual','Casual_Dinning','Family_Style','Fine_Dinning') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_table`
--

INSERT INTO `restaurant_table` (`Restaurant_id`, `Name`, `Type_of_restaurant`) VALUES
(1, 'Carrabba', 'Ethnic'),
(2, 'Andrew Michael', 'Fast_Food'),
(3, 'Hyderabad house', 'Fast_Casual'),
(4, 'The farmer', 'Fast_Casual'),
(5, 'Omni dallas restaura', 'Ethnic'),
(6, 'Mangolia', 'Ethnic'),
(7, 'Joule restaurant', 'Fast_Food'),
(8, 'Madison', 'Casual_Dinning'),
(9, 'Hampton Inn', 'Ethnic'),
(10, 'Mayuri', 'Ethnic'),
(11, 'Maple', 'Family_Style');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Review_id` int(11) NOT NULL,
  `em_id` varchar(20) NOT NULL,
  `Rest_id` int(11) NOT NULL,
  `price` enum('1','2','3','4','5') NOT NULL,
  `Service` enum('1','2','3','4','5') NOT NULL,
  `Food_quality` enum('1','2','3','4','5') NOT NULL,
  `Ambience` enum('1','2','3','4','5') NOT NULL,
  `Overall_experience` enum('1','2','3','4','5') NOT NULL,
  `Coment` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Review_id`, `em_id`, `Rest_id`, `price`, `Service`, `Food_quality`, `Ambience`, `Overall_experience`, `Coment`) VALUES
(1, 'soumyamedapati1@gmai', 1, '3', '4', '3', '5', '5', 'Its good for visiting once'),
(2, 'vsreelasya@gmail.com', 4, '4', '4', '3', '4', '4', NULL),
(3, 'sekharchallapilla@gm', 2, '4', '5', '4', '5', '5', NULL),
(4, 'chiatanyapochampalli', 10, '3', '5', '5', '3', '3', NULL),
(5, 'mvaishist', 8, '3', '1', '5', '3', '2', NULL),
(6, 'vidyataketpalli@gmai', 5, '3', '2', '4', '2', '5', NULL),
(7, 'anushasudhini@yahoo.', 6, '3', '3', '5', '1', '5', NULL),
(8, 'vishnupriya@gmail.co', 9, '3', '4', '3', '1', '5', 'Ambience needs to be worked upon well');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Email_id` varchar(20) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `DOB` date NOT NULL,
  `Address_Street` varchar(45) NOT NULL,
  `Address_State` varchar(45) NOT NULL,
  `Address_Zipcode` int(11) NOT NULL,
  `Longitude` float DEFAULT NULL,
  `Lattitude` float DEFAULT NULL,
  `Trustworthyness` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='User could be anyone visting the restaurant';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Email_id`, `Name`, `DOB`, `Address_Street`, `Address_State`, `Address_Zipcode`, `Longitude`, `Lattitude`, `Trustworthyness`) VALUES
('anushasudhini@yahoo.', 'anusha', '1990-03-03', 'Malcova', 'New jersey', 19934, 30.78, 54.9, 3),
('chiatanyapochampalli', 'Chaitanya', '1980-01-03', 'Patterson', 'Arlington', 32111, 90.23, 67.98, 2),
('mvaishist', 'Megha', '1970-09-03', 'Spots wood', 'Tennessee', 38212, 20.31, 34.41, 1),
('sandeep@gmail.com', 'sandeep', '1970-03-04', 'brister', 'Texas', 38989, 89.9, 30.9, 4),
('sekharchallapilla@gm', 'Chandra', '1980-05-08', 'Windower', 'Texas', 38291, 40.43, 56.53, 5),
('sindhuja@gmail.com', 'sindhuja', '1990-02-03', 'liva', 'africa', 98098, 90.9, 76.98, 4),
('soumyamedapati1@gmai', 'Soumya', '1980-03-04', 'Patterson', 'Tennesse', 38111, 67.5, 78.78, 4),
('tadael@yahoo.com', 'tadael', '1990-01-02', 'Mynders', 'ethopia', 67887, 78.78, 90.9, 2),
('vidyataketpalli@gmai', 'vidya', '2000-01-01', 'Paradise', 'Newyork', 23980, 29.9, 78.78, 2),
('vishnupriya@gmail.co', 'vishnu', '1960-01-04', 'Brister', 'Mexico', 29878, 40.56, 89.9, 3),
('vsreelasya@gmail.com', 'Lasya', '1960-03-04', 'Patterson', 'Tennessee', 38111, 50.52, 48.82, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`Coupon_code`,`R_id`),
  ADD UNIQUE KEY `Coupon_code_UNIQUE` (`Coupon_code`),
  ADD KEY `em_id_idx` (`E_id`),
  ADD KEY `Rest_id_idx` (`R_id`);

--
-- Indexes for table `cuisine`
--
ALTER TABLE `cuisine`
  ADD PRIMARY KEY (`Cuisine_id`);

--
-- Indexes for table `cuisine_preference`
--
ALTER TABLE `cuisine_preference`
  ADD KEY `eid_idx` (`eid`),
  ADD KEY `cuis_id` (`cuis_id`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`Dish_id`),
  ADD UNIQUE KEY `Dish_id_UNIQUE` (`Dish_id`),
  ADD UNIQUE KEY `cuisine_id_UNIQUE` (`cuisine_id`);

--
-- Indexes for table `dish_preference`
--
ALTER TABLE `dish_preference`
  ADD PRIMARY KEY (`Did`,`ema_id`),
  ADD UNIQUE KEY `Did_UNIQUE` (`Did`),
  ADD UNIQUE KEY `ema_id_UNIQUE` (`ema_id`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`user_email`,`follower_email`),
  ADD UNIQUE KEY `user_email_UNIQUE` (`user_email`),
  ADD UNIQUE KEY `follower_email_UNIQUE` (`follower_email`);

--
-- Indexes for table `restaurant_address`
--
ALTER TABLE `restaurant_address`
  ADD PRIMARY KEY (`Address_id`),
  ADD UNIQUE KEY `Restaurant_id_UNIQUE` (`Restaurant_id`),
  ADD UNIQUE KEY `Address_id_UNIQUE` (`Address_id`);

--
-- Indexes for table `restaurant_cuisine`
--
ALTER TABLE `restaurant_cuisine`
  ADD PRIMARY KEY (`id_cus`,`id_res`),
  ADD UNIQUE KEY `id_cus_UNIQUE` (`id_cus`),
  ADD UNIQUE KEY `id_res_UNIQUE` (`id_res`);

--
-- Indexes for table `restaurant_dish`
--
ALTER TABLE `restaurant_dish`
  ADD PRIMARY KEY (`id_rest`,`id_dish`),
  ADD UNIQUE KEY `id_rest_UNIQUE` (`id_rest`),
  ADD UNIQUE KEY `id_email_UNIQUE` (`id_dish`);

--
-- Indexes for table `restaurant_table`
--
ALTER TABLE `restaurant_table`
  ADD PRIMARY KEY (`Restaurant_id`),
  ADD UNIQUE KEY `Restaurant_id_UNIQUE` (`Restaurant_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_id`),
  ADD UNIQUE KEY `Review_id_UNIQUE` (`Review_id`),
  ADD UNIQUE KEY `email_id_UNIQUE` (`em_id`),
  ADD KEY `Rest_id_idx` (`Rest_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Email_id`),
  ADD UNIQUE KEY `email_id_UNIQUE` (`Email_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `Coupon_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `cuisine`
--
ALTER TABLE `cuisine`
  MODIFY `Cuisine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `Dish_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `restaurant_address`
--
ALTER TABLE `restaurant_address`
  MODIFY `Address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `restaurant_table`
--
ALTER TABLE `restaurant_table`
  MODIFY `Restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `E_id` FOREIGN KEY (`E_id`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `R_id` FOREIGN KEY (`R_id`) REFERENCES `restaurant_table` (`Restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cuisine_preference`
--
ALTER TABLE `cuisine_preference`
  ADD CONSTRAINT `cuis_id` FOREIGN KEY (`cuis_id`) REFERENCES `cuisine` (`Cuisine_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eid` FOREIGN KEY (`eid`) REFERENCES `user` (`Email_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `cuisine_id` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisine` (`Cuisine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dish_preference`
--
ALTER TABLE `dish_preference`
  ADD CONSTRAINT `Did` FOREIGN KEY (`Did`) REFERENCES `dish` (`Dish_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `emai_id` FOREIGN KEY (`ema_id`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follower_email` FOREIGN KEY (`follower_email`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_email` FOREIGN KEY (`user_email`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_address`
--
ALTER TABLE `restaurant_address`
  ADD CONSTRAINT `Restaurant_id` FOREIGN KEY (`Restaurant_id`) REFERENCES `restaurant_table` (`Restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_cuisine`
--
ALTER TABLE `restaurant_cuisine`
  ADD CONSTRAINT `id_cus` FOREIGN KEY (`id_cus`) REFERENCES `cuisine` (`Cuisine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_res` FOREIGN KEY (`id_res`) REFERENCES `restaurant_table` (`Restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_dish`
--
ALTER TABLE `restaurant_dish`
  ADD CONSTRAINT `id_dish` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`Dish_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_rest` FOREIGN KEY (`id_rest`) REFERENCES `restaurant_table` (`Restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `Rest_id` FOREIGN KEY (`Rest_id`) REFERENCES `restaurant_table` (`Restaurant_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `em_id` FOREIGN KEY (`em_id`) REFERENCES `user` (`Email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
