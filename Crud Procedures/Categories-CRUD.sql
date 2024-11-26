DELIMITER $$
CREATE PROCEDURE create_category(IN p_name VARCHAR(255), IN p_parent_id INT)
BEGIN
    INSERT INTO Categories (Name, ParentID)
    VALUES (p_name, p_parent_id);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_category(IN p_id INT)
BEGIN
    SELECT * FROM Categories WHERE ID = p_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_category(IN p_id INT, IN p_name VARCHAR(255), IN p_parent_id INT)
BEGIN
    UPDATE Categories
    SET Name = p_name, ParentID = p_parent_id
    WHERE ID = p_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_category(IN p_id INT)
BEGIN
    DELETE FROM Categories WHERE ID = p_id;
END $$
DELIMITER ;
