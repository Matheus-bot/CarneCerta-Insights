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