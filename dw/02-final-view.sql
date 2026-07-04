CREATE OR ALTER VIEW vw_sales_full_analysis AS
SELECT
    f.sale_id,
    f.customer_name,
    f.product_name,
    f.category,
    f.quantity,
    f.unit_price,
    f.total_value,
    f.sale_date,

    c.email,

    p.fat_level,
    p.tenderness_level,
    p.flavor_intensity,
    p.cooking_method,
    p.price_range,
    p.is_premium,

    d.year,
    d.month,
    d.day,
    d.month_name,
    d.day_of_week

FROM fact_sales_analytics f
INNER JOIN dim_customers c
    ON f.customer_name = c.customer_name
INNER JOIN dim_products p
    ON f.product_name = p.product_name
INNER JOIN dim_date d
    ON CAST(f.sale_date AS DATE) = d.date_id;