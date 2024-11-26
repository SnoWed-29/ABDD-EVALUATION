-- Admin user
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
GRANT ALL PRIVILEGES ON e_commerce_sout_02.* TO 'admin_user'@'localhost';
FLUSH PRIVILEGES;
-- Utilisateur (normal)
CREATE USER 'regular_user'@'localhost' IDENTIFIED BY 'user_password';
GRANT SELECT, INSERT, UPDATE ON e_commerce_sout_02.* TO 'regular_user'@'localhost';
REVOKE INSERT, DELETE, SELECT ON e_commerce_sout_02.audit_log FROM 'regular_user'@'localhost';
REVOKE INSERT, DELETE ON e_commerce_sout_02.Products FROM 'regular_user'@'localhost';
REVOKE INSERT, DELETE ON e_commerce_sout_02.Categories FROM 'regular_user'@'localhost';
FLUSH PRIVILEGES;
