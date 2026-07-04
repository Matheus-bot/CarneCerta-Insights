-- testes 
--Fato + CLientes 
SELECT 
    f.sale_id,
    c.customer_name,
    f.total_value
FROM fact_sales_analytics f
INNER JOIN dim_customers c
    ON f.customer_name = c.customer_name;

-- Fato + produtos
SELECT 
    f.sale_id,
    p.product_name,
    f.total_value
FROM fact_sales_analytics f
INNER JOIN dim_products p
    ON f.product_name = p.product_name;

-- Fato + data
SELECT 
    f.sale_id,
    d.year,
    d.month,
    f.total_value
FROM fact_sales_analytics f
INNER JOIN dim_date d
    ON CAST(f.sale_date AS DATE) = d.date_id;


