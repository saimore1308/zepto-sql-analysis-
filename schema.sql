create database Zepto_Database;
CREATE TABLE Zepto (
    Sku_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(255),
    Product_name VARCHAR(255),
    mrp DECIMAL(8,2),
    discount_percent DECIMAL(5,2),
    Available_quantity INTEGER,
    discounted_selling_price DECIMAL(8,2),
    weight_gms INTEGER,
    Out_of_stock BOOLEAN,
    product_quantity INTEGER
);
