DELIMITER $$
CREATE PROCEDURE create_order(IN p_user_id INT, IN p_status ENUM('Pending', 'Shipped', 'Delivered'), IN p_total_price DECIMAL(10,2))
BEGIN
    INSERT INTO Orders (UserID, Status, TotalPrice)
    VALUES (p_user_id, p_status, p_total_price);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_order(IN p_id INT)
BEGIN
    SELECT * FROM Orders WHERE ID = p_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_order(IN p_id INT, IN p_user_id INT, IN p_status ENUM('Pending', 'Shipped', 'Delivered'), IN p_total_price DECIMAL(10,2))
BEGIN
    UPDATE Orders
    SET UserID = p_user_id, Status = p_status, TotalPrice = p_total_price
    WHERE ID = p_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_order(IN p_id INT)
BEGIN
    DELETE FROM Orders WHERE ID = p_id;
END $$
DELIMITER ;
