-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 18, 2020 at 01:48 PM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Sux7Sc8dpV`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `Address_id` int(11) NOT NULL,
  `City_idCity` int(11) NOT NULL,
  `Plot_No` int(11) NOT NULL,
  `Street_No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`Address_id`, `City_idCity`, `Plot_No`, `Street_No`) VALUES
(39, 1, 73, 1),
(40, 1, 2, 1),
(41, 2, 3, 6),
(42, 5, 9, 9),
(43, 8, 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `City`
--

CREATE TABLE `City` (
  `idCity` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `City`
--

INSERT INTO `City` (`idCity`, `Name`) VALUES
(1, 'Islamabad'),
(2, 'Lahore'),
(3, 'Karachi'),
(4, 'Peshawar'),
(5, 'Multan'),
(6, 'Rawalpindi'),
(7, 'Faisalabad'),
(8, 'Quetta'),
(9, 'Hyderabad'),
(10, 'Sialkot'),
(11, 'Bahawalpur'),
(12, 'Sargodha'),
(13, 'Gujrat');

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Customer_id` int(11) NOT NULL,
  `First_Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Last_Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Contact_No` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `DOB` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Address_Address_id` int(11) NOT NULL,
  `IBAN` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Customer_id`, `First_Name`, `Last_Name`, `Username`, `Email`, `Password`, `Contact_No`, `DOB`, `Address_Address_id`, `IBAN`) VALUES
(1, 'Khadija', 'Aman', 'khadija', 'khadija22@gmail.com', 'khadija', '033152269662', '15 July 1999', 39, '312312312123'),
(2, 'Abdul', 'Moeed', 'msamoeed', 'msamoeed@gmail.com', 'khadija', '03314557225', '12/02/1998', 42, '1232432523');

-- --------------------------------------------------------

--
-- Table structure for table `Customer_reserves_DiningTable`
--

CREATE TABLE `Customer_reserves_DiningTable` (
  `Customer_Customer_id` int(11) NOT NULL,
  `DiningTable_idDiningTable` int(11) NOT NULL,
  `Date` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `DiningTable`
--

CREATE TABLE `DiningTable` (
  `idDiningTable` int(11) NOT NULL,
  `no_of_chairs` int(11) NOT NULL,
  `Restaurant_Restaurant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `DiningTable`
--

INSERT INTO `DiningTable` (`idDiningTable`, `no_of_chairs`, `Restaurant_Restaurant_id`) VALUES
(1, 4, 28),
(2, 4, 27),
(4, 8, 30),
(5, 2, 27),
(8, 9, 29);

-- --------------------------------------------------------

--
-- Table structure for table `Employees`
--

CREATE TABLE `Employees` (
  `idEmployees` int(11) NOT NULL,
  `Restaurant_Restaurant_id` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `designation` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Salary` double NOT NULL,
  `Contact_No` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Join_Date` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FoodItem`
--

CREATE TABLE `FoodItem` (
  `FoodItem_id` int(11) NOT NULL,
  `FoodItemCategory_Category_id` int(11) NOT NULL,
  `Food_Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FoodItemCategory`
--

CREATE TABLE `FoodItemCategory` (
  `Category_id` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FoodItemCategory`
--

INSERT INTO `FoodItemCategory` (`Category_id`, `Name`) VALUES
(1, 'Appetizer'),
(2, 'Main Dish'),
(3, 'Seafood'),
(4, 'Dessert'),
(5, 'Beverage'),
(6, 'Salad'),
(7, 'Sandwich'),
(8, 'Pizza');

-- --------------------------------------------------------

--
-- Table structure for table `FoodItem_has_Ingredients`
--

CREATE TABLE `FoodItem_has_Ingredients` (
  `FoodItem_FoodItem_id` int(11) NOT NULL,
  `Ingredients_Ingredient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Ingredients`
--

CREATE TABLE `Ingredients` (
  `Ingredient_id` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Ingredients`
--

INSERT INTO `Ingredients` (`Ingredient_id`, `Name`) VALUES
(15, 'cheese'),
(16, 'water'),
(17, 'onioin'),
(18, 'cook'),
(19, 'lop'),
(20, 'haseeb'),
(21, 'a'),
(22, 'd'),
(23, 'choco'),
(24, 'cream'),
(25, 'rice'),
(26, ' masala'),
(27, ' mint'),
(28, 'leaf'),
(29, 'chicken');

-- --------------------------------------------------------

--
-- Table structure for table `Menu`
--

CREATE TABLE `Menu` (
  `Restaurant_Restaurant_id` int(11) NOT NULL,
  `FoodItem_FoodItem_id` int(11) NOT NULL,
  `Price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `Customer_Customer_id` int(11) NOT NULL,
  `FoodItem_FoodItem_id` int(11) NOT NULL,
  `Order_id` int(11) NOT NULL,
  `Order_Date` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `DeliveryCharges` double NOT NULL,
  `Employees_idEmployees` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Restaurant`
--

CREATE TABLE `Restaurant` (
  `Restaurant_id` int(11) NOT NULL,
  `Address_Address_id` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Reservation` tinyint(4) NOT NULL,
  `Online_Order` tinyint(4) NOT NULL,
  `RestaurantManager_Manager_id` int(11) NOT NULL,
  `IBAN` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Restaurant`
--

INSERT INTO `Restaurant` (`Restaurant_id`, `Address_Address_id`, `Name`, `Reservation`, `Online_Order`, `RestaurantManager_Manager_id`, `IBAN`) VALUES
(26, 39, 'KFC', 1, 1, 55, '090078601'),
(27, 40, 'KFC', 1, 0, 56, '12312312'),
(28, 41, 'MacDonlads', 1, 1, 57, '0900098775'),
(29, 42, 'BOB', 0, 1, 58, '29472837282'),
(30, 43, 'Gobble', 1, 1, 59, '022932938291');

-- --------------------------------------------------------

--
-- Table structure for table `RestaurantManager`
--

CREATE TABLE `RestaurantManager` (
  `Manager_id` int(11) NOT NULL,
  `First_Name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Last_Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Contact_No` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `RestaurantManager`
--

INSERT INTO `RestaurantManager` (`Manager_id`, `First_Name`, `Last_Name`, `Username`, `email`, `password`, `Contact_No`) VALUES
(55, 'Khan', 'Aman', 'khadija@gmail.com', 'msamoeed@gmail.com', 'panasonic', 3315992886),
(56, 'Khan', 'Aman', 'khadija@gmail.com', 'msamoeed@gmail.com', 'panasonic', 3315992886),
(57, 'Khan', 'Aman', 'khadija@gmail.com', 'msamoeed@gmail.com', 'panasonic', 3315992886),
(58, 'Khan', 'Aman', 'khadija@gmail.com', 'msamoeed@gmail.com', 'khadija', 3315992886),
(59, 'Noor', 'Sarah', 'serahhhhhh', 'sarah@gmail.com', 'sarah', 2423112324);

-- --------------------------------------------------------

--
-- Table structure for table `Reviews`
--

CREATE TABLE `Reviews` (
  `Restaurant_Restaurant_id` int(11) NOT NULL,
  `Customer_Customer_id` int(11) NOT NULL,
  `Review` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Reviews`
--

INSERT INTO `Reviews` (`Restaurant_Restaurant_id`, `Customer_Customer_id`, `Review`, `Rating`) VALUES
(26, 1, 'Yummy yummy, filled my tumy', 5),
(27, 1, 'Baddd', 2),
(29, 1, 'oof damn', 3),
(29, 2, 'oof damn', 5),
(30, 1, 'lol what even', 3),
(30, 2, 'noice', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`Address_id`),
  ADD KEY `fk_Address_City1_idx` (`City_idCity`);

--
-- Indexes for table `City`
--
ALTER TABLE `City`
  ADD PRIMARY KEY (`idCity`),
  ADD UNIQUE KEY `idCity_UNIQUE` (`idCity`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Customer_id`),
  ADD UNIQUE KEY `Customer_id_UNIQUE` (`Customer_id`),
  ADD KEY `fk_Customer_Address1_idx` (`Address_Address_id`);

--
-- Indexes for table `Customer_reserves_DiningTable`
--
ALTER TABLE `Customer_reserves_DiningTable`
  ADD PRIMARY KEY (`Customer_Customer_id`,`DiningTable_idDiningTable`),
  ADD KEY `fk_Customer_has_DiningTable_DiningTable1_idx` (`DiningTable_idDiningTable`),
  ADD KEY `fk_Customer_has_DiningTable_Customer1_idx` (`Customer_Customer_id`);

--
-- Indexes for table `DiningTable`
--
ALTER TABLE `DiningTable`
  ADD UNIQUE KEY `idDiningTable_UNIQUE` (`idDiningTable`),
  ADD KEY `fk_DiningTable_Restaurant1_idx` (`Restaurant_Restaurant_id`),
  ADD KEY `idDiningTable` (`idDiningTable`);

--
-- Indexes for table `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`idEmployees`),
  ADD KEY `fk_Employees_Restaurant1_idx` (`Restaurant_Restaurant_id`);

--
-- Indexes for table `FoodItem`
--
ALTER TABLE `FoodItem`
  ADD PRIMARY KEY (`FoodItem_id`),
  ADD UNIQUE KEY `FoodItem_id_UNIQUE` (`FoodItem_id`),
  ADD KEY `fk_FoodItem_FoodItemCategory1_idx` (`FoodItemCategory_Category_id`);

--
-- Indexes for table `FoodItemCategory`
--
ALTER TABLE `FoodItemCategory`
  ADD PRIMARY KEY (`Category_id`),
  ADD UNIQUE KEY `Category_id_UNIQUE` (`Category_id`);

--
-- Indexes for table `FoodItem_has_Ingredients`
--
ALTER TABLE `FoodItem_has_Ingredients`
  ADD PRIMARY KEY (`FoodItem_FoodItem_id`,`Ingredients_Ingredient_id`),
  ADD KEY `fk_FoodItem_has_Ingredients_Ingredients1_idx` (`Ingredients_Ingredient_id`),
  ADD KEY `fk_FoodItem_has_Ingredients_FoodItem1_idx` (`FoodItem_FoodItem_id`);

--
-- Indexes for table `Ingredients`
--
ALTER TABLE `Ingredients`
  ADD PRIMARY KEY (`Ingredient_id`),
  ADD UNIQUE KEY `Ingredient_id_UNIQUE` (`Ingredient_id`);

--
-- Indexes for table `Menu`
--
ALTER TABLE `Menu`
  ADD KEY `fk_Restaurant_has_FoodItem_FoodItem1_idx` (`FoodItem_FoodItem_id`),
  ADD KEY `fk_Restaurant_has_FoodItem_Restaurant1_idx` (`Restaurant_Restaurant_id`),
  ADD KEY `Restaurant_Restaurant_id` (`Restaurant_Restaurant_id`,`FoodItem_FoodItem_id`) USING BTREE;

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`Customer_Customer_id`,`FoodItem_FoodItem_id`),
  ADD UNIQUE KEY `Order_id_UNIQUE` (`Order_id`),
  ADD KEY `fk_Customer_has_FoodItem_FoodItem1_idx` (`FoodItem_FoodItem_id`),
  ADD KEY `fk_Customer_has_FoodItem_Customer1_idx` (`Customer_Customer_id`),
  ADD KEY `fk_Orders_Employees1_idx` (`Employees_idEmployees`);

--
-- Indexes for table `Restaurant`
--
ALTER TABLE `Restaurant`
  ADD PRIMARY KEY (`Restaurant_id`),
  ADD UNIQUE KEY `Restaurant_id_UNIQUE` (`Restaurant_id`),
  ADD KEY `fk_Restaurant_Address1_idx` (`Address_Address_id`),
  ADD KEY `fk_Restaurant_RestaurantManager1_idx` (`RestaurantManager_Manager_id`);

--
-- Indexes for table `RestaurantManager`
--
ALTER TABLE `RestaurantManager`
  ADD PRIMARY KEY (`Manager_id`),
  ADD UNIQUE KEY `Manager_id_UNIQUE` (`Manager_id`);

--
-- Indexes for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`Restaurant_Restaurant_id`,`Customer_Customer_id`),
  ADD KEY `fk_Restaurant_has_Customer_Customer1_idx` (`Customer_Customer_id`),
  ADD KEY `fk_Restaurant_has_Customer_Restaurant1_idx` (`Restaurant_Restaurant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `Address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `City`
--
ALTER TABLE `City`
  MODIFY `idCity` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `Customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `idEmployees` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `FoodItem`
--
ALTER TABLE `FoodItem`
  MODIFY `FoodItem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `FoodItemCategory`
--
ALTER TABLE `FoodItemCategory`
  MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Ingredients`
--
ALTER TABLE `Ingredients`
  MODIFY `Ingredient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `Order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Restaurant`
--
ALTER TABLE `Restaurant`
  MODIFY `Restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `RestaurantManager`
--
ALTER TABLE `RestaurantManager`
  MODIFY `Manager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `fk_Address_City1` FOREIGN KEY (`City_idCity`) REFERENCES `City` (`idcity`);

--
-- Constraints for table `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `fk_Customer_Address1` FOREIGN KEY (`Address_Address_id`) REFERENCES `Address` (`Address_id`);

--
-- Constraints for table `Customer_reserves_DiningTable`
--
ALTER TABLE `Customer_reserves_DiningTable`
  ADD CONSTRAINT `fk_Customer_has_DiningTable_Customer1` FOREIGN KEY (`Customer_Customer_id`) REFERENCES `Customer` (`customer_id`),
  ADD CONSTRAINT `fk_Customer_has_DiningTable_DiningTable1` FOREIGN KEY (`DiningTable_idDiningTable`) REFERENCES `DiningTable` (`iddiningtable`);

--
-- Constraints for table `DiningTable`
--
ALTER TABLE `DiningTable`
  ADD CONSTRAINT `fk_DiningTable_Restaurant1` FOREIGN KEY (`Restaurant_Restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`);

--
-- Constraints for table `Employees`
--
ALTER TABLE `Employees`
  ADD CONSTRAINT `fk_Employees_Restaurant1` FOREIGN KEY (`Restaurant_Restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `fk_Customer_has_FoodItem_Customer1` FOREIGN KEY (`Customer_Customer_id`) REFERENCES `Customer` (`customer_id`),
  ADD CONSTRAINT `fk_Customer_has_FoodItem_FoodItem1` FOREIGN KEY (`FoodItem_FoodItem_id`) REFERENCES `FoodItem` (`fooditem_id`),
  ADD CONSTRAINT `fk_Orders_Employees1` FOREIGN KEY (`Employees_idEmployees`) REFERENCES `Employees` (`idemployees`);

--
-- Constraints for table `Restaurant`
--
ALTER TABLE `Restaurant`
  ADD CONSTRAINT `fk_Restaurant_Address1` FOREIGN KEY (`Address_Address_id`) REFERENCES `Address` (`Address_id`),
  ADD CONSTRAINT `fk_Restaurant_RestaurantManager1` FOREIGN KEY (`RestaurantManager_Manager_id`) REFERENCES `RestaurantManager` (`manager_id`);

--
-- Constraints for table `Reviews`
--
ALTER TABLE `Reviews`
  ADD CONSTRAINT `fk_Restaurant_has_Customer_Customer1` FOREIGN KEY (`Customer_Customer_id`) REFERENCES `Customer` (`customer_id`),
  ADD CONSTRAINT `fk_Restaurant_has_Customer_Restaurant1` FOREIGN KEY (`Restaurant_Restaurant_id`) REFERENCES `Restaurant` (`restaurant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
