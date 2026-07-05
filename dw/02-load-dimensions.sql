USE CarneCertaInsights;
GO

/*=========================================================
  LIMPA AS DIMENSÕES
=========================================================*/

DELETE FROM dim_customers;
DELETE FROM dim_products;
DELETE FROM dim_date;

GO

/*=========================================================
  CARREGA DIM_CUSTOMERS
=========================================================*/

INSERT INTO dim_customers
(
    customer_name,
    email
)
SELECT
    name,
    email
FROM customers;

GO

/*=========================================================
  CARREGA DIM_PRODUCTS
=========================================================*/

INSERT INTO dim_products
(
    product_name,
    category,
    fat_level,
    tenderness_level,
    flavor_intensity,
    cooking_method,
    cost_benefit,
    price_range,
    is_premium
)
SELECT
    name,
    category,
    fat_level,
    tenderness_level,
    flavor_intensity,
    cooking_method,
    cost_benefit,
    price_range,
    is_premium
FROM products;

GO

/*=========================================================
  CARREGA DIM_DATE
=========================================================*/

INSERT INTO dim_date
(
    date_id,
    year,
    month,
    day,
    month_name,
    day_of_week
)
SELECT DISTINCT

    CAST(created_at AS DATE),

    YEAR(created_at),
    MONTH(created_at),
    DAY(created_at),

    DATENAME(MONTH, created_at),
    DATENAME(WEEKDAY, created_at)

FROM sales;

GO
