USE CarneCertaInsights;
GO

/*=========================================================
  REMOVE A VIEW CASO EXISTA
=========================================================*/

IF OBJECT_ID('vw_sales_full_analysis', 'V') IS NOT NULL
    DROP VIEW vw_sales_full_analysis;

GO

/*=========================================================
  VIEW ANALÍTICA FINAL
=========================================================*/

CREATE VIEW vw_sales_full_analysis
AS

SELECT

    f.sale_id,

    c.customer_key,
    c.customer_name,

    p.product_key,
    p.product_name,
    p.category,
    p.fat_level,
    p.tenderness_level,
    p.flavor_intensity,
    p.cooking_method,
    p.cost_benefit,
    p.price_range,
    p.is_premium,

    d.date_key,
    d.date_id,
    d.year,
    d.month,
    d.day,
    d.month_name,
    d.day_of_week,

    f.quantity,
    f.unit_price,
    f.total_value

FROM fact_sales_analytics f

INNER JOIN dim_customers c
    ON f.customer_name = c.customer_name

INNER JOIN dim_products p
    ON f.product_name = p.product_name

INNER JOIN dim_date d
    ON CAST(f.sale_date AS DATE) = d.date_id;
GO



SELECT COUNT(*) AS TotalView
FROM vw_sales_full_analysis;

SELECT *
FROM vw_sales_full_analysis;