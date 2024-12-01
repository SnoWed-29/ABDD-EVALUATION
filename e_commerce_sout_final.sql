-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2024 at 02:18 PM
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
-- Database: `e_commerce_sout_final`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_category` (IN `p_name` VARCHAR(255), IN `p_parent_id` INT)   BEGIN
    INSERT INTO Categories (Name, ParentID)
    VALUES (p_name, p_parent_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_order` (IN `p_user_id` INT, IN `p_status` ENUM('Pending','Shipped','Delivered'), IN `p_total_price` DECIMAL(10,2))   BEGIN
    INSERT INTO Orders (UserID, Status, TotalPrice)
    VALUES (p_user_id, p_status, p_total_price);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_order_detail` (IN `p_order_id` INT, IN `p_product_id` INT, IN `p_quantity` INT, IN `p_price` DECIMAL(10,2))   BEGIN
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
    VALUES (p_order_id, p_product_id, p_quantity, p_price);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_product` (IN `p_name` VARCHAR(255), IN `p_description` TEXT, IN `p_price` DECIMAL(10,2), IN `p_stock` INT, IN `p_category_id` INT)   BEGIN
    INSERT INTO Products (Name, Description, Price, Stock, CategoryID)
    VALUES (p_name, p_description, p_price, p_stock, p_category_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_user` (IN `p_name` VARCHAR(255), IN `p_email` VARCHAR(255), IN `p_password` VARCHAR(255), IN `p_role` ENUM('Admin','User'))   BEGIN
    INSERT INTO Users (Name, Email, Password, Role)
    VALUES (p_name, p_email, p_password, p_role);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_category` (IN `p_id` INT)   BEGIN
    DELETE FROM Categories WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_order` (IN `p_id` INT)   BEGIN
    DELETE FROM Orders WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_order_detail` (IN `p_id` INT)   BEGIN
    DELETE FROM OrderDetails WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_product` (IN `p_id` INT)   BEGIN
    DELETE FROM Products WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user` (IN `p_id` INT)   BEGIN
    DELETE FROM Users WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_avg_order_value` (IN `start_date` DATE, IN `end_date` DATE)   BEGIN
    SELECT AVG(TotalPrice) AS avg_order_value
    FROM Orders
    WHERE CreatedAt BETWEEN start_date AND end_date;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_category` (IN `p_id` INT)   BEGIN
    SELECT * FROM Categories WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_low_stock_products` ()   BEGIN
    SELECT ID, Name, Stock
    FROM Products
    WHERE Stock < 5;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_order` (IN `p_id` INT)   BEGIN
    SELECT * FROM Orders WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_orders_by_user` (IN `p_user_id` INT)   BEGIN
    SELECT O.ID, O.Status, O.TotalPrice, O.CreatedAt
    FROM Orders O
    WHERE O.UserID = p_user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_order_detail` (IN `p_id` INT)   BEGIN
    SELECT * FROM OrderDetails WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_product` (IN `p_id` INT)   BEGIN
    SELECT * FROM Products WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_product_count_by_category` ()   BEGIN
    SELECT C.Name AS category_name, COUNT(P.ID) AS product_count
    FROM Categories C
    LEFT JOIN Products P ON C.ID = P.CategoryID
    GROUP BY C.ID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_sales` (IN `start_date` DATE, IN `end_date` DATE)   BEGIN
    SELECT SUM(TotalPrice) AS total_sales
    FROM Orders
    WHERE CreatedAt BETWEEN start_date AND end_date;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user` (IN `p_id` INT)   BEGIN
    SELECT * FROM Users WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_category` (IN `p_id` INT, IN `p_name` VARCHAR(255), IN `p_parent_id` INT)   BEGIN
    UPDATE Categories
    SET Name = p_name, ParentID = p_parent_id
    WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_order` (IN `p_id` INT, IN `p_user_id` INT, IN `p_status` ENUM('Pending','Shipped','Delivered'), IN `p_total_price` DECIMAL(10,2))   BEGIN
    UPDATE Orders
    SET UserID = p_user_id, Status = p_status, TotalPrice = p_total_price
    WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_order_detail` (IN `p_id` INT, IN `p_order_id` INT, IN `p_product_id` INT, IN `p_quantity` INT, IN `p_price` DECIMAL(10,2))   BEGIN
    UPDATE OrderDetails
    SET OrderID = p_order_id, ProductID = p_product_id, Quantity = p_quantity, Price = p_price
    WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_product` (IN `p_id` INT, IN `p_name` VARCHAR(255), IN `p_description` TEXT, IN `p_price` DECIMAL(10,2), IN `p_stock` INT, IN `p_category_id` INT)   BEGIN
    UPDATE Products
    SET Name = p_name, Description = p_description, Price = p_price, Stock = p_stock, CategoryID = p_category_id
    WHERE ID = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user` (IN `p_id` INT, IN `p_name` VARCHAR(255), IN `p_email` VARCHAR(255), IN `p_password` VARCHAR(255), IN `p_role` ENUM('Admin','User'))   BEGIN
    UPDATE Users
    SET Name = p_name, Email = p_email, Password = p_password, Role = p_role
    WHERE ID = p_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `operation` varchar(10) DEFAULT NULL,
  `old_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
PARTITION BY RANGE (to_days(`timestamp`))
(
PARTITION p202401 VALUES LESS THAN (739282) ENGINE=InnoDB,
PARTITION p202402 VALUES LESS THAN (739311) ENGINE=InnoDB,
PARTITION p202403 VALUES LESS THAN (739342) ENGINE=InnoDB,
PARTITION p202404 VALUES LESS THAN (739372) ENGINE=InnoDB,
PARTITION p202405 VALUES LESS THAN (739403) ENGINE=InnoDB,
PARTITION p202406 VALUES LESS THAN (739433) ENGINE=InnoDB,
PARTITION p202407 VALUES LESS THAN (739464) ENGINE=InnoDB,
PARTITION p202408 VALUES LESS THAN (739495) ENGINE=InnoDB,
PARTITION p202409 VALUES LESS THAN (739525) ENGINE=InnoDB,
PARTITION p202410 VALUES LESS THAN (739556) ENGINE=InnoDB,
PARTITION p202411 VALUES LESS THAN (739586) ENGINE=InnoDB,
PARTITION p202412 VALUES LESS THAN (739617) ENGINE=InnoDB,
PARTITION p_max VALUES LESS THAN MAXVALUE ENGINE=InnoDB
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ParentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `Name`, `ParentID`) VALUES
(1, 'Electronics', NULL),
(2, 'Home Appliances', NULL),
(3, 'Furniture', NULL),
(4, 'Clothing', NULL),
(5, 'Toys', NULL),
(6, 'Books', NULL),
(7, 'Sports', NULL),
(8, 'Beauty', NULL),
(9, 'Food & Beverages', NULL),
(10, 'Health', NULL);

--
-- Triggers `categories`
--
DELIMITER $$
CREATE TRIGGER `log_delete_categories` BEFORE DELETE ON `categories` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Categories', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'parent_id', OLD.ParentID));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_update_categories` AFTER UPDATE ON `categories` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Categories', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'parent_id', OLD.ParentID),
            JSON_OBJECT('id', NEW.ID, 'name', NEW.Name, 'parent_id', NEW.ParentID));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`ID`, `OrderID`, `ProductID`, `Quantity`, `Price`) VALUES
(1, 1, 1, 1, 199.99),
(2, 2, 2, 1, 1299.99),
(3, 3, 3, 1, 399.99),
(4, 4, 4, 1, 499.99),
(5, 5, 5, 2, 19.99),
(6, 6, 6, 1, 29.99),
(7, 7, 7, 1, 15.99),
(8, 8, 8, 1, 29.99),
(9, 9, 9, 1, 12.99),
(10, 10, 10, 1, 9.99),
(11, 11, 11, 1, 24.99),
(12, 12, 12, 1, 19.99);

--
-- Triggers `orderdetails`
--
DELIMITER $$
CREATE TRIGGER `log_delete_orderdetails` BEFORE DELETE ON `orderdetails` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('OrderDetails', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'order_id', OLD.OrderID, 'product_id', OLD.ProductID, 'quantity', OLD.Quantity, 'price', OLD.Price));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_update_orderdetails` AFTER UPDATE ON `orderdetails` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('OrderDetails', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'order_id', OLD.OrderID, 'product_id', OLD.ProductID, 'quantity', OLD.Quantity, 'price', OLD.Price),
            JSON_OBJECT('id', NEW.ID, 'order_id', NEW.OrderID, 'product_id', NEW.ProductID, 'quantity', NEW.Quantity, 'price', NEW.Price));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Status` enum('Pending','Shipped','Delivered') NOT NULL DEFAULT 'Pending',
  `TotalPrice` decimal(10,2) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `UserID`, `Status`, `TotalPrice`, `CreatedAt`) VALUES
(1, 1, 'Shipped', 199.99, '2024-01-01 09:00:00'),
(2, 2, 'Delivered', 1299.99, '2024-02-01 10:00:00'),
(3, 3, 'Pending', 399.99, '2024-03-01 11:00:00'),
(4, 4, 'Shipped', 499.99, '2024-04-01 13:00:00'),
(5, 5, 'Delivered', 39.99, '2024-05-01 13:00:00'),
(6, 6, 'Pending', 29.99, '2024-06-01 14:00:00'),
(7, 7, 'Shipped', 15.99, '2024-07-01 15:00:00'),
(8, 8, 'Delivered', 29.99, '2024-08-01 16:00:00'),
(9, 9, 'Pending', 12.99, '2024-09-01 17:00:00'),
(10, 10, 'Shipped', 9.99, '2024-10-01 18:00:00'),
(11, 11, 'Delivered', 24.99, '2024-11-01 19:00:00'),
(12, 12, 'Pending', 19.99, '2024-12-01 20:00:00');

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `log_delete_orders` BEFORE DELETE ON `orders` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Orders', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'user_id', OLD.UserID, 'status', OLD.Status, 'total_price', OLD.TotalPrice, 'created_at', OLD.CreatedAt));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_update_orders` AFTER UPDATE ON `orders` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Orders', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'user_id', OLD.UserID, 'status', OLD.Status, 'total_price', OLD.TotalPrice, 'created_at', OLD.CreatedAt),
            JSON_OBJECT('id', NEW.ID, 'user_id', NEW.UserID, 'status', NEW.Status, 'total_price', NEW.TotalPrice, 'created_at', NEW.CreatedAt));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `Name`, `Description`, `Price`, `Stock`, `CategoryID`, `CreatedAt`) VALUES
(1, 'Smartphone', 'Latest model smartphone', 699.99, 100, 1, '2024-01-01 09:00:00'),
(2, 'Laptop', 'High-performance laptop', 1299.99, 50, 1, '2024-02-01 10:00:00'),
(3, 'Air Conditioner', 'Energy-efficient AC unit', 399.99, 30, 2, '2024-03-01 11:00:00'),
(4, 'Sofa', 'Comfortable 3-seater sofa', 499.99, 20, 3, '2024-04-01 13:00:00'),
(5, 'T-shirt', 'Cotton T-shirt', 19.99, 200, 4, '2024-05-01 13:00:00'),
(6, 'Toy Car', 'Remote-controlled toy car', 29.99, 150, 5, '2024-06-01 14:00:00'),
(7, 'Novel', 'Bestselling novel', 15.99, 300, 6, '2024-07-01 15:00:00'),
(8, 'Soccer Ball', 'Size 5 soccer ball', 29.99, 50, 7, '2024-08-01 16:00:00'),
(9, 'Lipstick', 'Long-lasting lipstick', 12.99, 100, 8, '2024-09-01 17:00:00'),
(10, 'Coffee', 'Premium ground coffee', 9.99, 200, 9, '2024-10-01 18:00:00'),
(11, 'Vitamins', 'Daily vitamin supplements', 19.99, 100, 10, '2024-11-01 19:00:00'),
(12, 'Face Cream', 'Anti-aging face cream', 24.99, 50, 8, '2024-12-01 20:00:00');

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `log_delete_products` BEFORE DELETE ON `products` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Products', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'description', OLD.Description, 'price', OLD.Price, 'stock', OLD.Stock, 'category_id', OLD.CategoryID));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_update_products` AFTER UPDATE ON `products` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Products', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'description', OLD.Description, 'price', OLD.Price, 'stock', OLD.Stock, 'category_id', OLD.CategoryID),
            JSON_OBJECT('id', NEW.ID, 'name', NEW.Name, 'description', NEW.Description, 'price', NEW.Price, 'stock', NEW.Stock, 'category_id', NEW.CategoryID));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` enum('Admin','User') NOT NULL DEFAULT 'User',
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Name`, `Email`, `Password`, `Role`, `CreatedAt`) VALUES
(1, 'John Doe', 'johndoe1@example.com', 'password123', 'User', '2024-01-01 09:00:00'),
(2, 'Jane Smith', 'janesmith@example.com', 'password123', 'Admin', '2024-02-01 10:00:00'),
(3, 'Alice Johnson', 'alicej@example.com', 'password123', 'User', '2024-03-01 11:00:00'),
(4, 'Bob Brown', 'bobbrown@example.com', 'password123', 'Admin', '2024-04-01 13:00:00'),
(5, 'Charlie Green', 'charlieg@example.com', 'password123', 'User', '2024-05-01 13:00:00'),
(6, 'Diana White', 'dianaw@example.com', 'password123', 'User', '2024-06-01 14:00:00'),
(7, 'Eve Black', 'eveb@example.com', 'password123', 'Admin', '2024-07-01 15:00:00'),
(8, 'Frank Blue', 'frankb@example.com', 'password123', 'User', '2024-08-01 16:00:00'),
(9, 'Grace Red', 'gracer@example.com', 'password123', 'User', '2024-09-01 17:00:00'),
(10, 'Harry Yellow', 'harryy@example.com', 'password123', 'Admin', '2024-10-01 18:00:00'),
(11, 'Ivy Purple', 'ivyp@example.com', 'password123', 'User', '2024-11-01 19:00:00'),
(12, 'Jack Gray', 'jackg@example.com', 'password123', 'Admin', '2024-12-01 20:00:00');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `log_delete_users` BEFORE DELETE ON `users` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Users', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'email', OLD.Email, 'role', OLD.Role, 'created_at', OLD.CreatedAt));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_update_users` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Users', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'email', OLD.Email, 'role', OLD.Role, 'created_at', OLD.CreatedAt),
            JSON_OBJECT('id', NEW.ID, 'name', NEW.Name, 'email', NEW.Email, 'role', NEW.Role, 'created_at', NEW.CreatedAt));
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`,`timestamp`),
  ADD KEY `idx_audit_log_timestamp` (`timestamp`),
  ADD KEY `idx_audit_log_table_name` (`table_name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_categories_parentid` (`ParentID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `idx_orderdetails_orderid_productid` (`OrderID`,`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_orders_userid` (`UserID`),
  ADD KEY `idx_orders_status` (`Status`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_products_categoryid` (`CategoryID`),
  ADD KEY `idx_products_price_stock` (`Price`,`Stock`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `idx_users_email` (`Email`),
  ADD KEY `idx_users_role` (`Role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`ParentID`) REFERENCES `categories` (`ID`) ON DELETE SET NULL;

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
