INSERT INTO Users (Name, Email, Password, Role, CreatedAt) VALUES 
('John Doe', 'johndoe1@example.com', 'password123', 'User', '2024-01-01 10:00:00'),
('Jane Smith', 'janesmith@example.com', 'password123', 'Admin', '2024-02-01 11:00:00'),
('Alice Johnson', 'alicej@example.com', 'password123', 'User', '2024-03-01 12:00:00'),
('Bob Brown', 'bobbrown@example.com', 'password123', 'Admin', '2024-04-01 13:00:00'),
('Charlie Green', 'charlieg@example.com', 'password123', 'User', '2024-05-01 14:00:00'),
('Diana White', 'dianaw@example.com', 'password123', 'User', '2024-06-01 15:00:00'),
('Eve Black', 'eveb@example.com', 'password123', 'Admin', '2024-07-01 16:00:00'),
('Frank Blue', 'frankb@example.com', 'password123', 'User', '2024-08-01 17:00:00'),
('Grace Red', 'gracer@example.com', 'password123', 'User', '2024-09-01 18:00:00'),
('Harry Yellow', 'harryy@example.com', 'password123', 'Admin', '2024-10-01 19:00:00'),
('Ivy Purple', 'ivyp@example.com', 'password123', 'User', '2024-11-01 20:00:00'),
('Jack Gray', 'jackg@example.com', 'password123', 'Admin', '2024-12-01 21:00:00');

INSERT INTO Categories (Name, ParentID) VALUES
('Electronics', NULL),
('Home Appliances', NULL),
('Furniture', NULL),
('Clothing', NULL),
('Toys', NULL),
('Books', NULL),
('Sports', NULL),
('Beauty', NULL),
('Food & Beverages', NULL),
('Health', NULL);

INSERT INTO Products (Name, Description, Price, Stock, CategoryID, CreatedAt) VALUES 
('Smartphone', 'Latest model smartphone', 699.99, 100, 1, '2024-01-01 10:00:00'),
('Laptop', 'High-performance laptop', 1299.99, 50, 1, '2024-02-01 11:00:00'),
('Air Conditioner', 'Energy-efficient AC unit', 399.99, 30, 2, '2024-03-01 12:00:00'),
('Sofa', 'Comfortable 3-seater sofa', 499.99, 20, 3, '2024-04-01 13:00:00'),
('T-shirt', 'Cotton T-shirt', 19.99, 200, 4, '2024-05-01 14:00:00'),
('Toy Car', 'Remote-controlled toy car', 29.99, 150, 5, '2024-06-01 15:00:00'),
('Novel', 'Bestselling novel', 15.99, 300, 6, '2024-07-01 16:00:00'),
('Soccer Ball', 'Size 5 soccer ball', 29.99, 50, 7, '2024-08-01 17:00:00'),
('Lipstick', 'Long-lasting lipstick', 12.99, 100, 8, '2024-09-01 18:00:00'),
('Coffee', 'Premium ground coffee', 9.99, 200, 9, '2024-10-01 19:00:00'),
('Vitamins', 'Daily vitamin supplements', 19.99, 100, 10, '2024-11-01 20:00:00'),
('Face Cream', 'Anti-aging face cream', 24.99, 50, 8, '2024-12-01 21:00:00');

INSERT INTO Orders (UserID, Status, TotalPrice, CreatedAt) VALUES 
(1, 'Shipped', 199.99, '2024-01-01 10:00:00'),
(2, 'Delivered', 1299.99, '2024-02-01 11:00:00'),
(3, 'Pending', 399.99, '2024-03-01 12:00:00'),
(4, 'Shipped', 499.99, '2024-04-01 13:00:00'),
(5, 'Delivered', 39.99, '2024-05-01 14:00:00'),
(6, 'Pending', 29.99, '2024-06-01 15:00:00'),
(7, 'Shipped', 15.99, '2024-07-01 16:00:00'),
(8, 'Delivered', 29.99, '2024-08-01 17:00:00'),
(9, 'Pending', 12.99, '2024-09-01 18:00:00'),
(10, 'Shipped', 9.99, '2024-10-01 19:00:00'),
(11, 'Delivered', 24.99, '2024-11-01 20:00:00'),
(12, 'Pending', 19.99, '2024-12-01 21:00:00');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES 
(1, 1, 1, 199.99),
(2, 2, 1, 1299.99),
(3, 3, 1, 399.99),
(4, 4, 1, 499.99),
(5, 5, 2, 19.99),
(6, 6, 1, 29.99),
(7, 7, 1, 15.99),
(8, 8, 1, 29.99),
(9, 9, 1, 12.99),
(10, 10, 1, 9.99),
(11, 11, 1, 24.99),
(12, 12, 1, 19.99);
