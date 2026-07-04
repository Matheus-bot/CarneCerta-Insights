CREATE DATABASE CarneCertaInsights;

GO

USE CarneCertaInsights;
GO 
CREATE TABLE customers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    created_at DATETIME DEFAULT GETDATE()
);
CREATE TABLE products (
    id INT IDENTITY(1,1) PRIMARY KEY,

    -- Basic Information
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    active BIT DEFAULT 1,

    -- Product Characteristics
    fat_level VARCHAR(20) NOT NULL,
    tenderness_level TINYINT NOT NULL,
    flavor_intensity TINYINT NOT NULL,

    -- Preparation
    cooking_method VARCHAR(50) NOT NULL,

    -- Business
    cost_benefit VARCHAR(20) NOT NULL,
    price_range VARCHAR(20) NOT NULL,
    is_premium BIT DEFAULT 0
);
CREATE TABLE sales (
    id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_name VARCHAR(100),
    total DECIMAL(10,2),
    created_at DATETIME DEFAULT GETDATE()
);
CREATE TABLE sale_items (
    id INT IDENTITY(1,1) PRIMARY KEY,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
-- SALES RELATIONSHIPS
ALTER TABLE sales
ADD CONSTRAINT fk_sales_customer
FOREIGN KEY (customer_id) REFERENCES customers(id);

-- SALE ITEMS RELATIONSHIPS
ALTER TABLE sale_items
ADD CONSTRAINT fk_saleitems_sale
FOREIGN KEY (sale_id) REFERENCES sales(id);

ALTER TABLE sale_items
ADD CONSTRAINT fk_saleitems_product
FOREIGN KEY (product_id) REFERENCES products(id);