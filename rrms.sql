-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2021 at 03:59 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Cus_ID` int(11) NOT NULL,
  `Role_No` int(10) NOT NULL,
  `Cus_Name` varchar(50) NOT NULL,
  `Cus_PhoneNo` varchar(50) NOT NULL,
  `Cus_Address` varchar(255) NOT NULL,
  `Cus_Email` varchar(255) NOT NULL,
  `Cus_Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cus_ID`, `Role_No`, `Cus_Name`, `Cus_PhoneNo`, `Cus_Address`, `Cus_Email`, `Cus_Password`) VALUES
(5, 1, 'hazwan', '0119737333', 'LOT 16280 KAMPUNG JATI GONG BADAK', 'hazwan@gmail.com', '1234'),
(9, 1, 'Muhamad Amar', '0129855223', 'PT 137 TAMAN FAHIM SHAH, 16250 KOTA BHARU, KELANTAN', 'amar@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `foodservices`
--

CREATE TABLE `foodservices` (
  `Food_ID` int(11) NOT NULL,
  `ServiceP_ID` int(11) NOT NULL,
  `F_Name` varchar(50) NOT NULL,
  `F_Description` varchar(255) NOT NULL,
  `F_Price` decimal(10,0) NOT NULL,
  `F_Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `foodservices`
--

INSERT INTO `foodservices` (`Food_ID`, `ServiceP_ID`, `F_Name`, `F_Description`, `F_Price`, `F_Image`) VALUES
(8, 3, 'Bucket Berbaloi', 'Ayam -8pcs, Nugget-6pcs, Mash Potato -1, Pepsi -2', '25', '/RRMS/Images/Food/kfc bucket berbaloi.png'),
(9, 3, 'KFC 2-pc combo', 'Ayam set- 2pcs, pepsi-2, ', '14', '/RRMS/Images/Food/KFC-2-pc-combo-300x187.jpg'),
(10, 4, 'McChicken', 'Burger -1pcs, Fries-1pcs, Coca-cola -1pcs', '13', '/RRMS/Images/Food/chicken-grilled-mcdonalds-burger-delivery-700x700.jpg'),
(11, 4, 'Thai Curry Chicken Burger', 'Thai Curry Chicken Burger -1pcs, Fries-1pcs, Coca-cola -1pcs', '19', '/RRMS/Images/Food/Harga-Burger-Syok-Mcd-mcdonald.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `goodsservices`
--

CREATE TABLE `goodsservices` (
  `GoodS_ID` int(11) NOT NULL,
  `ServiceP_ID` int(11) NOT NULL,
  `G_DistanceCost` decimal(10,0) NOT NULL,
  `G_WeightCost` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `goodsservices`
--

INSERT INTO `goodsservices` (`GoodS_ID`, `ServiceP_ID`, `G_DistanceCost`, `G_WeightCost`) VALUES
(1, 6, '2', '1'),
(4, 8, '3', '2');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `Order_ID` int(11) NOT NULL,
  `OrderF_ID` int(11) DEFAULT NULL,
  `OrderP_ID` int(11) DEFAULT NULL,
  `OrderG_ID` int(11) DEFAULT NULL,
  `OrderPA_ID` int(11) DEFAULT NULL,
  `Cus_ID` int(11) NOT NULL,
  `ServiceP_ID` int(11) NOT NULL,
  `OD_Details` varchar(255) NOT NULL,
  `OD_TotalPrice` decimal(10,0) NOT NULL,
  `OD_Date` date NOT NULL DEFAULT current_timestamp(),
  `OD_Status` enum('Check Out','Paid') NOT NULL DEFAULT 'Check Out',
  `DeliveryAddress` varchar(255) NOT NULL,
  `ready` varchar(50) NOT NULL DEFAULT 'Not Ready'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`Order_ID`, `OrderF_ID`, `OrderP_ID`, `OrderG_ID`, `OrderPA_ID`, `Cus_ID`, `ServiceP_ID`, `OD_Details`, `OD_TotalPrice`, `OD_Date`, `OD_Status`, `DeliveryAddress`, `ready`) VALUES
(301, 103, NULL, NULL, NULL, 9, 4, 'Food Delivery: McChicken - [Burger -1pcs, Fries-1pcs, Coca-cola -1pcs] x (2)', '26', '2021-01-18', 'Paid', 'PT 137 TAMAN FAHIM SHAH, 16250 KOTA BHARU, KELANTAN', 'Not Ready'),
(302, NULL, 16, NULL, NULL, 9, 7, 'Pharmacy Delivery: Panadol x (1)', '15', '2021-01-18', 'Paid', 'PT 137 TAMAN FAHIM SHAH, 16250 KOTA BHARU, KELANTAN', 'Not Ready'),
(303, NULL, NULL, 85, NULL, 9, 8, 'Goods Delivery: (Envelope) Kelantan To Perak [2021-01-21 To 2021-01-20] - (Motorcycle)', '638', '2021-01-18', 'Paid', 'Kelantan To Perak', 'Ready');

-- --------------------------------------------------------

--
-- Table structure for table `orderfood`
--

CREATE TABLE `orderfood` (
  `OrderF_ID` int(11) NOT NULL,
  `Cus_ID` int(11) NOT NULL,
  `Food_ID` int(11) NOT NULL,
  `ServiceP_ID` int(11) NOT NULL,
  `OF_Details` varchar(255) NOT NULL,
  `OF_TotalPrice` decimal(10,0) NOT NULL,
  `OF_Date` date NOT NULL DEFAULT current_timestamp(),
  `OF_DeliveryAdd` varchar(255) NOT NULL,
  `OF_Status` enum('Check Out','Paid') NOT NULL DEFAULT 'Check Out'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderfood`
--

INSERT INTO `orderfood` (`OrderF_ID`, `Cus_ID`, `Food_ID`, `ServiceP_ID`, `OF_Details`, `OF_TotalPrice`, `OF_Date`, `OF_DeliveryAdd`, `OF_Status`) VALUES
(103, 9, 10, 4, 'Food Delivery: McChicken - [Burger -1pcs, Fries-1pcs, Coca-cola -1pcs] x (2)', '26', '2021-01-18', 'PT 137 TAMAN FAHIM SHAH, 16250 KOTA BHARU, KELANTAN', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `ordergoods`
--

CREATE TABLE `ordergoods` (
  `OrderG_ID` int(11) NOT NULL,
  `Cus_ID` int(11) NOT NULL,
  `GoodS_ID` int(11) NOT NULL,
  `R_ID` int(11) DEFAULT NULL,
  `ServiceP_ID` int(11) NOT NULL,
  `OG_PickUpAdd` varchar(255) NOT NULL,
  `OG_DeliveryAdd` varchar(255) NOT NULL,
  `OG_recipient` varchar(255) NOT NULL,
  `OG_recipientPhoneNum` varchar(15) NOT NULL,
  `OG_itemType` varchar(50) NOT NULL,
  `OG_itemWeight` decimal(10,2) NOT NULL,
  `OG_itemSize` varchar(10) NOT NULL,
  `OG_DeliveryDate` date NOT NULL,
  `OG_ReceiveDate` date NOT NULL,
  `OG_RunnerType` varchar(50) NOT NULL,
  `OG_Price` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordergoods`
--

INSERT INTO `ordergoods` (`OrderG_ID`, `Cus_ID`, `GoodS_ID`, `R_ID`, `ServiceP_ID`, `OG_PickUpAdd`, `OG_DeliveryAdd`, `OG_recipient`, `OG_recipientPhoneNum`, `OG_itemType`, `OG_itemWeight`, `OG_itemSize`, `OG_DeliveryDate`, `OG_ReceiveDate`, `OG_RunnerType`, `OG_Price`, `status`) VALUES
(85, 9, 0, NULL, 8, 'Kelantan', 'Perak', 'Hazwan', '0106251245', 'Envelope', '0.01', 'Small', '2021-01-21', '2021-01-20', 'Motorcycle', '637.94', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `orderpetassist`
--

CREATE TABLE `orderpetassist` (
  `OrderPA_ID` int(11) NOT NULL,
  `Cus_ID` int(11) NOT NULL,
  `PA_ID` int(11) NOT NULL,
  `ServiceP_ID` int(11) NOT NULL,
  `OPA_AssistType` varchar(50) NOT NULL,
  `OPA_Date` date NOT NULL,
  `OPA_TimeStart` time NOT NULL,
  `OPATimeEnd` time NOT NULL,
  `OPA_TotalPrice` decimal(10,0) NOT NULL,
  `OPA_Address` varchar(255) NOT NULL,
  `status` enum('Check Out','Paid') NOT NULL DEFAULT 'Check Out'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderpharmacy`
--

CREATE TABLE `orderpharmacy` (
  `OrderP_ID` int(11) NOT NULL,
  `Cus_ID` int(11) NOT NULL,
  `I_ID` int(11) NOT NULL,
  `ServiceP_ID` int(11) NOT NULL,
  `OP_Details` varchar(255) NOT NULL,
  `OP_TotalPrice` decimal(10,0) NOT NULL,
  `OP_Time` date NOT NULL DEFAULT current_timestamp(),
  `OP_DeliveryAdd` varchar(255) NOT NULL,
  `status` enum('Check Out','Paid') NOT NULL DEFAULT 'Check Out'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderpharmacy`
--

INSERT INTO `orderpharmacy` (`OrderP_ID`, `Cus_ID`, `I_ID`, `ServiceP_ID`, `OP_Details`, `OP_TotalPrice`, `OP_Time`, `OP_DeliveryAdd`, `status`) VALUES
(16, 9, 2, 7, 'Pharmacy Delivery: Panadol x (1)', '15', '2021-01-18', 'PT 137 TAMAN FAHIM SHAH, 16250 KOTA BHARU, KELANTAN', 'Check Out');

-- --------------------------------------------------------

--
-- Table structure for table `paymentorder`
--

CREATE TABLE `paymentorder` (
  `Payment_ID` int(11) NOT NULL,
  `Cus_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `ServiceP_ID` int(11) NOT NULL,
  `Payment_Amount` decimal(10,0) NOT NULL,
  `Payment_Time` datetime NOT NULL DEFAULT current_timestamp(),
  `Payment_Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paymentorder`
--

INSERT INTO `paymentorder` (`Payment_ID`, `Cus_ID`, `Order_ID`, `ServiceP_ID`, `Payment_Amount`, `Payment_Time`, `Payment_Status`) VALUES
(52, 9, 301, 4, '26', '2021-01-18 22:53:58', 'Success'),
(53, 9, 302, 7, '15', '2021-01-18 22:54:53', 'Success'),
(54, 9, 303, 8, '638', '2021-01-18 22:57:14', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `pethotel`
--

CREATE TABLE `pethotel` (
  `pethotel_id` int(11) NOT NULL,
  `pethotel_name` varchar(50) NOT NULL,
  `pethotel_details` varchar(2556) NOT NULL,
  `pethotel_quantity` int(11) NOT NULL,
  `pethotel_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pethotel`
--

INSERT INTO `pethotel` (`pethotel_id`, `pethotel_name`, `pethotel_details`, `pethotel_quantity`, `pethotel_price`) VALUES
(5, 'Lexi petshop', 'This is extraodinary place to bring care for your pet,feed and walk .', 1, 500),
(701, 'rocky sanctuary', 'rocky place is a private house with an outdoors space for dogs', 1, 50),
(703, 'Pet Playground', ' keeping the pets comfortable and allowing the pets to build trust towards them.', 1, 510),
(704, 'Vet king', ' in the place we make sure your pet feel comfortable ', 1, 600),
(705, 'Snow vet', ' to provide your dog with some free basic training.  Dogs will enjoy ', 1, 650);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacyservices`
--

CREATE TABLE `pharmacyservices` (
  `Item_ID` int(11) NOT NULL,
  `ServiceP_ID` int(11) NOT NULL,
  `I_Name` varchar(50) NOT NULL,
  `I_Description` varchar(255) NOT NULL,
  `I_Price` decimal(10,0) NOT NULL,
  `I_Image` varchar(255) NOT NULL,
  `I_Qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pharmacyservices`
--

INSERT INTO `pharmacyservices` (`Item_ID`, `ServiceP_ID`, `I_Name`, `I_Description`, `I_Price`, `I_Image`, `I_Qty`) VALUES
(1, 7, 'Gaviscon', 'gaviscon ', '152', '/RRMS/Images/Pharmacy/gaviscon.jpg', 0),
(2, 7, 'Panadol', 'Panadol Bagus', '15', '/RRMS/Images/Pharmacy/panadol.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `runner`
--

CREATE TABLE `runner` (
  `Runner_ID` int(11) NOT NULL,
  `ServiceP_ID` int(11) DEFAULT NULL,
  `Role_No` int(10) NOT NULL,
  `Run_Name` varchar(50) NOT NULL,
  `Run_PhoneNo` varchar(50) NOT NULL,
  `Run_ICNum` varchar(50) NOT NULL,
  `Run_License` int(20) NOT NULL,
  `Run_Address` varchar(255) NOT NULL,
  `Run_Email` varchar(50) NOT NULL,
  `Run_Password` varchar(50) NOT NULL,
  `Run_BankType` varchar(50) NOT NULL,
  `Run_AccNum` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `runner`
--

INSERT INTO `runner` (`Runner_ID`, `ServiceP_ID`, `Role_No`, `Run_Name`, `Run_PhoneNo`, `Run_ICNum`, `Run_License`, `Run_Address`, `Run_Email`, `Run_Password`, `Run_BankType`, `Run_AccNum`) VALUES
(3, NULL, 2, 'Cheng', '123', '32', 123, '123', 'cheng@gmail.com', '123', '123', '213'),
(4, 6, 2, 'Jnt', '123', '123', 123, '12', 'jnt', '123', '123', '12');

-- --------------------------------------------------------

--
-- Table structure for table `serviceprovider`
--

CREATE TABLE `serviceprovider` (
  `ServiceP_ID` int(11) NOT NULL,
  `Role_No` int(10) NOT NULL,
  `SP_Type` varchar(50) NOT NULL,
  `SP_Name` varchar(50) NOT NULL,
  `SP_BussRegNo` varchar(50) NOT NULL,
  `SP_Address` varchar(255) NOT NULL,
  `SP_PhoneNo` varchar(50) NOT NULL,
  `SP_Email` varchar(50) NOT NULL,
  `SP_Password` varchar(50) NOT NULL,
  `SP_BankType` varchar(50) NOT NULL,
  `SP_AccNo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `serviceprovider`
--

INSERT INTO `serviceprovider` (`ServiceP_ID`, `Role_No`, `SP_Type`, `SP_Name`, `SP_BussRegNo`, `SP_Address`, `SP_PhoneNo`, `SP_Email`, `SP_Password`, `SP_BankType`, `SP_AccNo`) VALUES
(2, 3, 'Food', 'Ayu Restaurant', 'm12312123my', 'Kemaman', '0111938846', 'ayu@gmail.com', '222', 'bank islam', '9223567313'),
(3, 3, 'Food', 'KFC', '13543552MY', 'Dataran Austin', '029297731', 'kfc@gmail.com', 'kfc', 'bank islam', '74637238293'),
(4, 3, 'Food', 'Mcdonald\'s', '213122MY', 'Gong Badak', '1111223334', 'mcd@gmail.com', 'mcd', 'Maybank', '223452775'),
(6, 3, 'Goods', 'JNT', '2132021', 'PT 152 Tingkat Bawah, Jalan Pintu Pong', '010231224', 'jnt@gmail.com', 'jnt', 'Bank Islam', '6232125521'),
(7, 3, 'Pharmacy', 'Al Hijrah', '8554721', 'Lot 8006, Bandar Satelit Islam, Jalan Pondok Pasir Tumboh', '0123357789', 'al@gmail.com', 'al', 'Bank Islam', '623222524154'),
(8, 3, 'Goods', 'Ninja Van', '55212412', 'PT 180 Lorong Nyior Chabang, Jalan Hospital', '0149547412', 'ninja@gmail.com', 'ninja', 'MayBank', '23154214412'),
(9, 3, 'Pet', 'Doggy Style', '55212412', 'PT 267-C, Jalan Kuala Krai', '0142213254', 'dog@gmail.com', '123', 'BSN', '2455216632');

-- --------------------------------------------------------

--
-- Table structure for table `tracking`
--

CREATE TABLE `tracking` (
  `Tracking_ID` int(11) NOT NULL,
  `Cus_ID` int(11) NOT NULL,
  `ServiceP_ID` int(11) NOT NULL,
  `Runner_ID` int(11) NOT NULL DEFAULT 0,
  `Order_ID` int(11) NOT NULL,
  `DeliveryStatus` varchar(50) NOT NULL DEFAULT 'ready for delivery',
  `ReceiveStatus` varchar(50) NOT NULL DEFAULT 'not received yet',
  `Salary` double NOT NULL DEFAULT 5,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `Assignation` varchar(50) NOT NULL DEFAULT 'Not Ready'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tracking`
--

INSERT INTO `tracking` (`Tracking_ID`, `Cus_ID`, `ServiceP_ID`, `Runner_ID`, `Order_ID`, `DeliveryStatus`, `ReceiveStatus`, `Salary`, `date`, `Assignation`) VALUES
(42, 9, 4, 0, 301, 'ready for delivery', 'not received yet', 5, '2021-01-18', 'Not Ready'),
(43, 9, 7, 0, 302, 'ready for delivery', 'not received yet', 5, '2021-01-18', 'Not Ready'),
(44, 9, 8, 0, 303, 'ready for delivery', 'not received yet', 5, '2021-01-18', 'Not Ready');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cus_ID`);

--
-- Indexes for table `foodservices`
--
ALTER TABLE `foodservices`
  ADD PRIMARY KEY (`Food_ID`);

--
-- Indexes for table `goodsservices`
--
ALTER TABLE `goodsservices`
  ADD PRIMARY KEY (`GoodS_ID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`Order_ID`);

--
-- Indexes for table `orderfood`
--
ALTER TABLE `orderfood`
  ADD PRIMARY KEY (`OrderF_ID`);

--
-- Indexes for table `ordergoods`
--
ALTER TABLE `ordergoods`
  ADD PRIMARY KEY (`OrderG_ID`);

--
-- Indexes for table `orderpetassist`
--
ALTER TABLE `orderpetassist`
  ADD PRIMARY KEY (`OrderPA_ID`);

--
-- Indexes for table `orderpharmacy`
--
ALTER TABLE `orderpharmacy`
  ADD PRIMARY KEY (`OrderP_ID`);

--
-- Indexes for table `paymentorder`
--
ALTER TABLE `paymentorder`
  ADD PRIMARY KEY (`Payment_ID`);

--
-- Indexes for table `pethotel`
--
ALTER TABLE `pethotel`
  ADD PRIMARY KEY (`pethotel_id`);

--
-- Indexes for table `pharmacyservices`
--
ALTER TABLE `pharmacyservices`
  ADD PRIMARY KEY (`Item_ID`);

--
-- Indexes for table `runner`
--
ALTER TABLE `runner`
  ADD PRIMARY KEY (`Runner_ID`);

--
-- Indexes for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  ADD PRIMARY KEY (`ServiceP_ID`);

--
-- Indexes for table `tracking`
--
ALTER TABLE `tracking`
  ADD PRIMARY KEY (`Tracking_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Cus_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `foodservices`
--
ALTER TABLE `foodservices`
  MODIFY `Food_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `goodsservices`
--
ALTER TABLE `goodsservices`
  MODIFY `GoodS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT for table `orderfood`
--
ALTER TABLE `orderfood`
  MODIFY `OrderF_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `ordergoods`
--
ALTER TABLE `ordergoods`
  MODIFY `OrderG_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `orderpetassist`
--
ALTER TABLE `orderpetassist`
  MODIFY `OrderPA_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderpharmacy`
--
ALTER TABLE `orderpharmacy`
  MODIFY `OrderP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `paymentorder`
--
ALTER TABLE `paymentorder`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `pethotel`
--
ALTER TABLE `pethotel`
  MODIFY `pethotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=706;

--
-- AUTO_INCREMENT for table `pharmacyservices`
--
ALTER TABLE `pharmacyservices`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `runner`
--
ALTER TABLE `runner`
  MODIFY `Runner_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  MODIFY `ServiceP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tracking`
--
ALTER TABLE `tracking`
  MODIFY `Tracking_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
