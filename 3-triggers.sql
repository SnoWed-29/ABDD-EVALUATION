-- Users Update Trigger
DELIMITER $$
CREATE TRIGGER log_update_users
AFTER UPDATE ON Users
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Users', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'email', OLD.Email, 'role', OLD.Role, 'created_at', OLD.CreatedAt),
            JSON_OBJECT('id', NEW.ID, 'name', NEW.Name, 'email', NEW.Email, 'role', NEW.Role, 'created_at', NEW.CreatedAt));
END $$
DELIMITER ;

-- Users Delete Trigger
DELIMITER $$
CREATE TRIGGER log_delete_users
BEFORE DELETE ON Users
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Users', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'email', OLD.Email, 'role', OLD.Role, 'created_at', OLD.CreatedAt));
END $$
DELIMITER ;

-- Categories Update Trigger
DELIMITER $$
CREATE TRIGGER log_update_categories
AFTER UPDATE ON Categories
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Categories', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'parent_id', OLD.ParentID),
            JSON_OBJECT('id', NEW.ID, 'name', NEW.Name, 'parent_id', NEW.ParentID));
END $$
DELIMITER ;

-- Categories Delete Trigger
DELIMITER $$
CREATE TRIGGER log_delete_categories
BEFORE DELETE ON Categories
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Categories', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'parent_id', OLD.ParentID));
END $$
DELIMITER ;
-- Products Update Trigger
DELIMITER $$
CREATE TRIGGER log_update_products
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Products', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'description', OLD.Description, 'price', OLD.Price, 'stock', OLD.Stock, 'category_id', OLD.CategoryID),
            JSON_OBJECT('id', NEW.ID, 'name', NEW.Name, 'description', NEW.Description, 'price', NEW.Price, 'stock', NEW.Stock, 'category_id', NEW.CategoryID));
END $$
DELIMITER ;

-- Products Delete Trigger
DELIMITER $$
CREATE TRIGGER log_delete_products
BEFORE DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Products', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'description', OLD.Description, 'price', OLD.Price, 'stock', OLD.Stock, 'category_id', OLD.CategoryID));
END $$
DELIMITER ;

-- Orders Update Trigger
DELIMITER $$
CREATE TRIGGER log_update_orders
AFTER UPDATE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Orders', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'user_id', OLD.UserID, 'status', OLD.Status, 'total_price', OLD.TotalPrice, 'created_at', OLD.CreatedAt),
            JSON_OBJECT('id', NEW.ID, 'user_id', NEW.UserID, 'status', NEW.Status, 'total_price', NEW.TotalPrice, 'created_at', NEW.CreatedAt));
END $$
DELIMITER ;

-- Orders Delete Trigger
DELIMITER $$
CREATE TRIGGER log_delete_orders
BEFORE DELETE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Orders', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'user_id', OLD.UserID, 'status', OLD.Status, 'total_price', OLD.TotalPrice, 'created_at', OLD.CreatedAt));
END $$
DELIMITER ;

-- OrderDetails Update Trigger
DELIMITER $$
CREATE TRIGGER log_update_orderdetails
AFTER UPDATE ON OrderDetails
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('OrderDetails', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'order_id', OLD.OrderID, 'product_id', OLD.ProductID, 'quantity', OLD.Quantity, 'price', OLD.Price),
            JSON_OBJECT('id', NEW.ID, 'order_id', NEW.OrderID, 'product_id', NEW.ProductID, 'quantity', NEW.Quantity, 'price', NEW.Price));
END $$
DELIMITER ;

-- OrderDetails Delete Trigger
DELIMITER $$
CREATE TRIGGER log_delete_orderdetails
BEFORE DELETE ON OrderDetails
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('OrderDetails', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'order_id', OLD.OrderID, 'product_id', OLD.ProductID, 'quantity', OLD.Quantity, 'price', OLD.Price));
END $$
DELIMITER ;
