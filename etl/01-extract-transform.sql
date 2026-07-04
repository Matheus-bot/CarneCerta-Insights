-- =========================
-- ETL STEP 1 - SALES ANALYTICS TABLE
-- CarneCerta Insights
-- =========================

-- Remove tabela se já existir
IF OBJECT_ID('fact_sales_analytics', 'U') IS NOT NULL
    DROP TABLE fact_sales_analytics;

-- Criação da tabela analítica
CREATE TABLE fact_sales_analytics (
    sale_id INT,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_value DECIMAL(10,2),
    sale_date DATETIME
);


-- =========================
-- LOAD (dados transformados)
-- =========================

INSERT INTO fact_sales_analytics
(
    sale_id,
    customer_name,
    product_name,
    category,
    quantity,
    unit_price,
    total_value,
    sale_date
)
SELECT 
    s.id AS sale_id,
    c.name AS customer_name,
    p.name AS product_name,
    p.category,
    si.quantity,
    si.price AS unit_price,
    (si.quantity * si.price) AS total_value,
    s.created_at AS sale_date
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.id
INNER JOIN sale_items si
    ON s.id = si.sale_id
INNER JOIN products p
    ON si.product_id = p.id;