-- Insert data into Users table
INSERT INTO Users (Name, Email, Password, Role) VALUES
('Alice Johnson', 'alice.johnson@example.com', 'password123', 'User'),
('Bob Smith', 'bob.smith@example.com', 'securepass', 'User'),
('Charlie Brown', 'charlie.brown@example.com', 'mypassword', 'User'),
('Diana Prince', 'diana.prince@example.com', 'amazonpass', 'Admin'),
('Edward Clark', 'edward.clark@example.com', 'qwerty123', 'User');

-- Insert data into Categories table
INSERT INTO Categories (Name, ParentID) VALUES
('Electronics', NULL),
('Clothing', NULL),
('Mobile Phones', 1),
('Laptops', 1),
('Men', 2),
('Women', 2),
('T-Shirts', 5),
('Dresses', 6);

-- Insert data into Products table
INSERT INTO Products (Name, Description, Price, Stock, CategoryID) VALUES
('iPhone 14', 'Latest Apple smartphone', 999.99, 50, 3),
('Samsung Galaxy S22', 'Flagship Samsung smartphone', 799.99, 40, 3),
('MacBook Air', 'Apple laptop with M1 chip', 1199.99, 30, 4),
('Gaming Laptop', 'High-performance gaming laptop', 1499.99, 20, 4),
('Men\'s Cotton T-Shirt', 'Comfortable cotton t-shirt', 19.99, 100, 7),
('Women\'s Summer Dress', 'Light and breezy dress', 49.99, 80, 8),
('Wireless Earbuds', 'High-quality audio experience', 129.99, 60, 1),
('Smartwatch', 'Fitness and lifestyle tracking', 199.99, 35, 1);

-- Insert data into Orders table
INSERT INTO Orders (UserID, Status, TotalPrice) VALUES
(1, 'Pending', 1019.98),
(2, 'Shipped', 849.98),
(3, 'Delivered', 1569.98),
(1, 'Delivered', 29.99),
(4, 'Pending', 1349.98);

-- Insert data into OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 999.99),
(1, 7, 1, 19.99),
(2, 2, 1, 799.99),
(2, 7, 1, 49.99),
(3, 3, 1, 1199.99),
(3, 8, 1, 199.99),
(4, 5, 1, 19.99),
(5, 4, 1, 1499.99);
