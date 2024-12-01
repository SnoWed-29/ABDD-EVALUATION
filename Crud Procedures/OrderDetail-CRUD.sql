DELIMITER $$
CREATE PROCEDURE create_order_detail(IN p_order_id INT, IN p_product_id INT, IN p_quantity INT, IN p_price DECIMAL(10,2))
BEGIN
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
    VALUES (p_order_id, p_product_id, p_quantity, p_price);
END $$

CREATE PROCEDURE get_order_detail(IN p_id INT)
BEGIN
    SELECT * FROM OrderDetails WHERE ID = p_id;
END $$

CREATE PROCEDURE update_order_detail(IN p_id INT, IN p_order_id INT, IN p_product_id INT, IN p_quantity INT, IN p_price DECIMAL(10,2))
BEGIN
    UPDATE OrderDetails
    SET OrderID = p_order_id, ProductID = p_product_id, Quantity = p_quantity, Price = p_price
    WHERE ID = p_id;
END $$

CREATE PROCEDURE delete_order_detail(IN p_id INT)
BEGIN
    DELETE FROM OrderDetails WHERE ID = p_id;
END $$
DELIMITER ;
