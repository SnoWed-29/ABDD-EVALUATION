DELIMITER $$
CREATE PROCEDURE create_product(IN p_name VARCHAR(255), IN p_description TEXT, IN p_price DECIMAL(10,2), IN p_stock INT, IN p_category_id INT)
BEGIN
    INSERT INTO Products (Name, Description, Price, Stock, CategoryID)
    VALUES (p_name, p_description, p_price, p_stock, p_category_id);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_product(IN p_id INT)
BEGIN
    SELECT * FROM Products WHERE ID = p_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_product(IN p_id INT, IN p_name VARCHAR(255), IN p_description TEXT, IN p_price DECIMAL(10,2), IN p_stock INT, IN p_category_id INT)
BEGIN
    UPDATE Products
    SET Name = p_name, Description = p_description, Price = p_price, Stock = p_stock, CategoryID = p_category_id
    WHERE ID = p_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_product(IN p_id INT)
BEGIN
    DELETE FROM Products WHERE ID = p_id;
END $$
DELIMITER ;
