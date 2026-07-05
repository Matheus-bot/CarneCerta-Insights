USE CarneCertaInsights;
GO

/*=========================================================
  RECRIA A FACT TABLE
=========================================================*/

IF OBJECT_ID('fact_sales_analytics', 'U') IS NOT NULL
    DROP TABLE fact_sales_analytics;

GO

CREATE TABLE fact_sales_analytics
(
    sale_id INT NOT NULL,

    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),

    quantity INT,

    unit_price DECIMAL(10,2),
    total_value DECIMAL(10,2),

    sale_date DATETIME
);

GO

/*=========================================================
  CARREGA A FACT
=========================================================*/

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

    s.id,
    c.name,
    p.name,
    p.category,

    si.quantity,

    si.price,
    si.quantity * si.price,

    s.created_at

FROM sales s

INNER JOIN customers c
    ON s.customer_id = c.id

INNER JOIN sale_items si
    ON s.id = si.sale_id

INNER JOIN products p
    ON si.product_id = p.id;

GO











