-- =========================
-- DIMENSION: CUSTOMERS
-- =========================

IF OBJECT_ID('dim_customers', 'U') IS NOT NULL
    DROP TABLE dim_customers;

CREATE TABLE dim_customers (
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO dim_customers (customer_id, customer_name, email)
SELECT 
    id,
    name,
    email
FROM customers;

-- =========================
-- DIMENSION: PRODUCTS
-- =========================

IF OBJECT_ID('dim_products', 'U') IS NOT NULL
    DROP TABLE dim_products;

CREATE TABLE dim_products (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    fat_level VARCHAR(20),
    tenderness_level TINYINT,
    flavor_intensity TINYINT,
    cooking_method VARCHAR(50),
    price_range VARCHAR(20),
    is_premium BIT
);

INSERT INTO dim_products (
    product_id,
    product_name,
    category,
    fat_level,
    tenderness_level,
    flavor_intensity,
    cooking_method,
    price_range,
    is_premium
)
SELECT 
    id,
    name,
    category,
    fat_level,
    tenderness_level,
    flavor_intensity,
    cooking_method,
    price_range,
    is_premium
FROM products;
-- =========================
-- DIMENSION: DATE
-- =========================

IF OBJECT_ID('dim_date', 'U') IS NOT NULL
    DROP TABLE dim_date;

CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    month_name VARCHAR(20),
    day_of_week VARCHAR(20)
);

INSERT INTO dim_date (date_id, year, month, day, month_name, day_of_week)
SELECT 
    DISTINCT CAST(created_at AS DATE) AS date_id,
    YEAR(created_at),
    MONTH(created_at),
    DAY(created_at),
    DATENAME(MONTH, created_at),
    DATENAME(WEEKDAY, created_at)
FROM sales;

