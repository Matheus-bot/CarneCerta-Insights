USE CarneCertaInsights;
GO

/*=========================================================
  REMOVE AS DIMENSÕES CASO EXISTAM
=========================================================*/

IF OBJECT_ID('dim_customers', 'U') IS NOT NULL
    DROP TABLE dim_customers;

IF OBJECT_ID('dim_products', 'U') IS NOT NULL
    DROP TABLE dim_products;

IF OBJECT_ID('dim_date', 'U') IS NOT NULL
    DROP TABLE dim_date;

GO

/*=========================================================
  DIM_CUSTOMERS
=========================================================*/

CREATE TABLE dim_customers
(
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

GO

/*=========================================================
  DIM_PRODUCTS
=========================================================*/

CREATE TABLE dim_products
(
    product_key INT IDENTITY(1,1) PRIMARY KEY,

    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),

    fat_level VARCHAR(20),
    tenderness_level INT,
    flavor_intensity INT,

    cooking_method VARCHAR(50),

    cost_benefit VARCHAR(30),
    price_range VARCHAR(30),

    is_premium BIT
);

GO

/*=========================================================
  DIM_DATE
=========================================================*/

CREATE TABLE dim_date
(
    date_key INT IDENTITY(1,1) PRIMARY KEY,

    date_id DATE UNIQUE,

    year INT,
    month INT,
    day INT,

    month_name VARCHAR(20),

    day_of_week VARCHAR(20)
);

GO