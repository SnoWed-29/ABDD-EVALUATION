-- Admin user
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
GRANT ALL PRIVILEGES ON e_commerce_sout_final.* TO 'admin_user'@'localhost';
FLUSH PRIVILEGES;
-- Utilisateur (normal)
CREATE USER 'regular_user'@'localhost' IDENTIFIED BY 'user_password';
GRANT SELECT, INSERT, UPDATE ON e_commerce_sout_final.* TO 'regular_user'@'localhost';
REVOKE INSERT, DELETE, SELECT ON e_commerce_sout_final.audit_log FROM 'regular_user'@'localhost';
REVOKE INSERT, DELETE ON e_commerce_sout_final.Products FROM 'regular_user'@'localhost';
REVOKE INSERT, DELETE ON e_commerce_sout_final.Categories FROM 'regular_user'@'localhost';
FLUSH PRIVILEGES;
