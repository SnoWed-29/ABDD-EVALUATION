DELIMITER $$
CREATE PROCEDURE create_user(IN p_name VARCHAR(255), IN p_email VARCHAR(255), IN p_password VARCHAR(255), IN p_role ENUM('Admin', 'User'))
BEGIN
    INSERT INTO Users (Name, Email, Password, Role)
    VALUES (p_name, p_email, p_password, p_role);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_user(IN p_id INT)
BEGIN
    SELECT * FROM Users WHERE ID = p_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE update_user(IN p_id INT, IN p_name VARCHAR(255), IN p_email VARCHAR(255), IN p_password VARCHAR(255), IN p_role ENUM('Admin', 'User'))
BEGIN
    UPDATE Users
    SET Name = p_name, Email = p_email, Password = p_password, Role = p_role
    WHERE ID = p_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_user(IN p_id INT)
BEGIN
    DELETE FROM Users WHERE ID = p_id;
END $$
DELIMITER ;
