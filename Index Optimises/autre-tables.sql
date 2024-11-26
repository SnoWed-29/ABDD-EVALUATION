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
