<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a id="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://sso.ynov.com/images/logo_ynov_campus_blanc.svg" alt="Logo" width="150" height="80">
  </a>

  <h3 align="center">Comment Installer/Utiliser</h3>

</div>







<!-- ABOUT THE PROJECT -->
# Installation
## Le moyen le plus simple
Importez ce fichier dans votre base de données <b><i>e_commerce_sout_final.sql</i></b>.
## Étape 1


Créer une base de données avec le nom suivant :
```sh
  e_commerce_sout_final
  ```



##   Étape 2 (Creation des Tables et Données factices et Données factices)

Copiez le contenu du fichier <b><i>1-creation-des-tables.sql</i></b> et exécutez-le Après cela, exécutez le contenu du fichier <b><i>2-mock-data.sql</i></b> pour ajouter des données factices dans la base de données.

##   Étape 3 (Création d'utilisateurs et attribution de privilèges)

```sh
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
```
##   Étape 4 (Procedure et triggers)
### Procedure
Voici la procédure  des Rapports et agrégations , les autres procédures se trouvent dans le dossier : <b><i>Crud Procedures </i></b> : 
```sh 
-- Total Sales by Date Range
DELIMITER $$
CREATE PROCEDURE get_total_sales(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT SUM(TotalPrice) AS total_sales
    FROM Orders
    WHERE CreatedAt BETWEEN start_date AND end_date;
END $$


-- --------------------------------------
-- Products with Low Stock 

CREATE PROCEDURE get_low_stock_products()
BEGIN
    SELECT ID, Name, Stock
    FROM Products
    WHERE Stock < 5;
END $$


-- --------------------------------------
--  Orders by User

CREATE PROCEDURE get_orders_by_user(IN p_user_id INT)
BEGIN
    SELECT O.ID, O.Status, O.TotalPrice, O.CreatedAt
    FROM Orders O
    WHERE O.UserID = p_user_id;
END $$


-- --------------------------------------
-- Category-wise Product Count

CREATE PROCEDURE get_product_count_by_category()
BEGIN
    SELECT C.Name AS category_name, COUNT(P.ID) AS product_count
    FROM Categories C
    LEFT JOIN Products P ON C.ID = P.CategoryID
    GROUP BY C.ID;
END $$


-- --------------------------------------
-- Average Order Value by Date Range

CREATE PROCEDURE get_avg_order_value(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT AVG(TotalPrice) AS avg_order_value
    FROM Orders
    WHERE CreatedAt BETWEEN start_date AND end_date;
END $$
DELIMITER ;

```
### Triggers
Triggers pour l'historique de changement des données : 
```sh
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

-- Users Delete Trigger
CREATE TRIGGER log_delete_users
BEFORE DELETE ON Users
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Users', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'email', OLD.Email, 'role', OLD.Role, 'created_at', OLD.CreatedAt));
END $$

-- Categories Update Trigger
CREATE TRIGGER log_update_categories
AFTER UPDATE ON Categories
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Categories', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'parent_id', OLD.ParentID),
            JSON_OBJECT('id', NEW.ID, 'name', NEW.Name, 'parent_id', NEW.ParentID));
END $$

-- Categories Delete 
CREATE TRIGGER log_delete_categories
BEFORE DELETE ON Categories
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Categories', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'parent_id', OLD.ParentID));
END $$

-- Products Update Trigger
CREATE TRIGGER log_update_products
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Products', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'description', OLD.Description, 'price', OLD.Price, 'stock', OLD.Stock, 'category_id', OLD.CategoryID),
            JSON_OBJECT('id', NEW.ID, 'name', NEW.Name, 'description', NEW.Description, 'price', NEW.Price, 'stock', NEW.Stock, 'category_id', NEW.CategoryID));
END $$

-- Products Delete Trigger
CREATE TRIGGER log_delete_products
BEFORE DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Products', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'name', OLD.Name, 'description', OLD.Description, 'price', OLD.Price, 'stock', OLD.Stock, 'category_id', OLD.CategoryID));
END $$

-- Orders Update Trigger
CREATE TRIGGER log_update_orders
AFTER UPDATE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('Orders', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'user_id', OLD.UserID, 'status', OLD.Status, 'total_price', OLD.TotalPrice, 'created_at', OLD.CreatedAt),
            JSON_OBJECT('id', NEW.ID, 'user_id', NEW.UserID, 'status', NEW.Status, 'total_price', NEW.TotalPrice, 'created_at', NEW.CreatedAt));
END $$

-- Orders Delete Trigger
CREATE TRIGGER log_delete_orders
BEFORE DELETE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('Orders', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'user_id', OLD.UserID, 'status', OLD.Status, 'total_price', OLD.TotalPrice, 'created_at', OLD.CreatedAt));
END $$

-- OrderDetails Update Trigger
CREATE TRIGGER log_update_orderdetails
AFTER UPDATE ON OrderDetails
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data, new_data)
    VALUES ('OrderDetails', 'UPDATE', 
            JSON_OBJECT('id', OLD.ID, 'order_id', OLD.OrderID, 'product_id', OLD.ProductID, 'quantity', OLD.Quantity, 'price', OLD.Price),
            JSON_OBJECT('id', NEW.ID, 'order_id', NEW.OrderID, 'product_id', NEW.ProductID, 'quantity', NEW.Quantity, 'price', NEW.Price));
END $$

-- OrderDetails Delete Trigger
CREATE TRIGGER log_delete_orderdetails
BEFORE DELETE ON OrderDetails
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, operation, old_data)
    VALUES ('OrderDetails', 'DELETE', 
            JSON_OBJECT('id', OLD.ID, 'order_id', OLD.OrderID, 'product_id', OLD.ProductID, 'quantity', OLD.Quantity, 'price', OLD.Price));
END $$
DELIMITER ;

```
## Étape 5 (Index optimisés)
```sh 
-- Users 
CREATE INDEX idx_users_email ON Users(Email);
CREATE INDEX idx_users_role ON Users(Role);
-- Categories
CREATE INDEX idx_categories_parentid ON Categories(ParentID);
-- Products
CREATE INDEX idx_products_categoryid ON Products(CategoryID);
CREATE INDEX idx_products_price_stock ON Products(Price, Stock);
-- Orders
CREATE INDEX idx_orders_userid ON Orders(UserID);
CREATE INDEX idx_orders_status ON Orders(Status);
-- OrderDetails
CREATE INDEX idx_orderdetails_orderid_productid ON OrderDetails(OrderID, ProductID);
```

# Comment utiliser
## Procedure Rapports et agrégations

| **Procedure**                              | **Comment utiliser**                                                                 | **Description **                                                                 |
|--------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| `get_total_sales`                          | `CALL get_total_sales('2024-01-01', '2024-12-31');`                             | Cette procédure calcule la somme totale des ventes entre deux dates spécifiées.              |
| `get_low_stock_products`                   | `CALL get_low_stock_products();`                                                | Cette procédure renvoie la liste des produits dont le stock est inférieur à 5.              |
| `get_orders_by_user`                       | `CALL get_orders_by_user(1);`                                                  | Cette procédure affiche toutes les commandes d'un utilisateur donné par son ID.             |
| `get_product_count_by_category`            | `CALL get_product_count_by_category();`                                         | Cette procédure renvoie le nombre de produits par catégorie.                               |
| `get_avg_order_value`                      | `CALL get_avg_order_value('2024-01-01', '2024-12-31');`                        | Cette procédure calcule la valeur moyenne des commandes entre deux dates spécifiées.        |


## Procédures  pour les Opérations CRUD : 
Remplacez le nom de la table dans la procédure afin d'appeler l'autre procédure similaire dans l'autre table. Par exemple, Appeler une procédure sur la table product : <b><i>create_category</i></b> -> <b><i>create_product</i></b>
| **Procedure**                              | **How to Call**                                                                 | **Description (Français)**                                                                 |
|--------------------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| **`create_category`**                       | `CALL create_category('Electronics', 1);`                                        | Cette procédure permet de créer une nouvelle catégorie en insérant un nom (`p_name`) et un identifiant de parent (`p_parent_id`) dans la table `Categories`.               |
| **`get_category`**                          | `CALL get_category(3);`                                                        | Cette procédure récupère les informations d'une catégorie spécifique en utilisant son `ID` (`p_id`).              |
| **`update_category`**                       | `CALL update_category(3, 'Home Appliances', 1);`                               | Cette procédure met à jour les informations d'une catégorie existante en modifiant son `Name` et son `ParentID` en fonction de l'`ID` (`p_id`).               |
| **`delete_category`**                       | `CALL delete_category(3);`                                                     | Cette procédure supprime une catégorie de la table `Categories` en fonction de son `ID` (`p_id`).        |
