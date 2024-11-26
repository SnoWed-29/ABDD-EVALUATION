-- Total Sales by Date Range
DELIMITER $$
CREATE PROCEDURE get_total_sales(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT SUM(TotalPrice) AS total_sales
    FROM Orders
    WHERE CreatedAt BETWEEN start_date AND end_date;
END $$
DELIMITER ;

-- --------------------------------------
-- Products with Low Stock 
DELIMITER $$
CREATE PROCEDURE get_low_stock_products()
BEGIN
    SELECT ID, Name, Stock
    FROM Products
    WHERE Stock < 5;
END $$
DELIMITER ;

-- --------------------------------------
--  Orders by User
DELIMITER $$
CREATE PROCEDURE get_orders_by_user(IN p_user_id INT)
BEGIN
    SELECT O.ID, O.Status, O.TotalPrice, O.CreatedAt
    FROM Orders O
    WHERE O.UserID = p_user_id;
END $$
DELIMITER ;

-- --------------------------------------
-- Category-wise Product Count
DELIMITER $$
CREATE PROCEDURE get_product_count_by_category()
BEGIN
    SELECT C.Name AS category_name, COUNT(P.ID) AS product_count
    FROM Categories C
    LEFT JOIN Products P ON C.ID = P.CategoryID
    GROUP BY C.ID;
END $$
DELIMITER ;

-- --------------------------------------
-- Average Order Value by Date Range
DELIMITER $$
CREATE PROCEDURE get_avg_order_value(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT AVG(TotalPrice) AS avg_order_value
    FROM Orders
    WHERE CreatedAt BETWEEN start_date AND end_date;
END $$
DELIMITER ;