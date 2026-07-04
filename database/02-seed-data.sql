USE CarneCertaInsights;
GO

-- =========================
-- CUSTOMERS
-- =========================
INSERT INTO customers (name, email)
VALUES 
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com'),
('Carlos Oliveira', 'carlos@email.com'),
('Ana Lima', 'ana@email.com'),
('Pedro Santos', 'pedro@email.com');

-- =========================
-- PRODUCTS
-- =========================
INSERT INTO products
(
    name,
    category,
    price,
    active,
    fat_level,
    tenderness_level,
    flavor_intensity,
    cooking_method,
    cost_benefit,
    price_range,
    is_premium
)
VALUES
('Picanha','Bovino',79.90,1,'Alta',10,10,'Churrasco','Premium','Alto',1),
('Acém','Bovino',29.90,1,'Média',4,8,'Panela','Excelente','Baixo',0),
('Alcatra','Bovino',49.90,1,'Baixa',8,8,'Churrasco','Ótimo','Médio',1),
('Maminha','Bovino',69.90,1,'Média',9,9,'Churrasco','Ótimo','Alto',1),
('Fraldinha','Bovino',44.90,1,'Média',8,10,'Churrasco','Excelente','Médio',0),
('Patinho','Bovino',39.90,1,'Baixa',7,6,'Bife','Excelente','Médio',0),
('Costela','Bovino',34.90,1,'Alta',9,10,'Churrasco','Ótimo','Médio',0),
('Cupim','Bovino',42.90,1,'Alta',9,9,'Churrasco','Ótimo','Médio',0);

-- =========================
-- SALES (vamos capturar IDs reais)
-- =========================
DECLARE @sale1 INT, @sale2 INT, @sale3 INT, @sale4 INT, @sale5 INT;

INSERT INTO sales (customer_id, employee_name, total)
VALUES (1, 'Carlos (Açougueiro)', 129.80);
SET @sale1 = SCOPE_IDENTITY();

INSERT INTO sales (customer_id, employee_name, total)
VALUES (2, 'Carlos (Açougueiro)', 79.90);
SET @sale2 = SCOPE_IDENTITY();

INSERT INTO sales (customer_id, employee_name, total)
VALUES (3, 'Ana (Açougueira)', 99.80);
SET @sale3 = SCOPE_IDENTITY();

INSERT INTO sales (customer_id, employee_name, total)
VALUES (4, 'João (Açougueiro)', 44.90);
SET @sale4 = SCOPE_IDENTITY();

INSERT INTO sales (customer_id, employee_name, total)
VALUES (5, 'Ana (Açougueira)', 169.70);
SET @sale5 = SCOPE_IDENTITY();

-- =========================
-- SALE ITEMS (CORRETO E SEGURO)
-- =========================
INSERT INTO sale_items (sale_id, product_id, quantity, price)
VALUES
(@sale1, 1, 1, 79.90),
(@sale1, 2, 1, 29.90),

(@sale2, 3, 1, 49.90),

(@sale3, 4, 1, 69.90),
(@sale3, 5, 1, 29.90),

(@sale4, 6, 1, 39.90),

(@sale5, 1, 2, 79.90),
(@sale5, 7, 1, 34.90);