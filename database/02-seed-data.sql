USE CarneCertaInsights;
GO

-- CUSTOMERS
INSERT INTO customers (name, email)
VALUES 
('João Silva', 'joao@email.com'),
('Maria Souza', 'maria@email.com'),
('Carlos Oliveira', 'carlos@email.com'),
('Ana Lima', 'ana@email.com'),
('Pedro Santos', 'pedro@email.com');

-- PRODUCTS
INSERT INTO products (name, category, price, active)
VALUES 
('Picanha', 'Bovino Premium', 79.90, 1),
('Acém', 'Bovino Econômico', 29.90, 1),
('Alcatra', 'Bovino Médio', 49.90, 1),
('Maminha', 'Bovino Premium', 69.90, 1),
('Fraldinha', 'Bovino Médio', 44.90, 1),
('Patinho', 'Bovino Magro', 39.90, 1),
('Costela', 'Bovino Tradicional', 34.90, 1),
('Cupim', 'Bovino Gorduroso', 42.90, 1);

-- SALES
INSERT INTO sales (customer_id, employee_name, total)
VALUES 
(1, 'Carlos (Açougueiro)', 129.80),
(2, 'Carlos (Açougueiro)', 79.90),
(3, 'Ana (Açougueira)', 99.80),
(4, 'João (Açougueiro)', 44.90),
(5, 'Ana (Açougueira)', 169.70);


INSERT INTO sale_items (sale_id, product_id, quantity, price)
VALUES
(17, 1, 1, 79.90),
(17, 2, 1, 29.90),

(18, 3, 1, 49.90),

(19, 4, 1, 69.90),
(19, 5, 1, 29.90),

(20, 6, 1, 39.90),

(21, 1, 2, 79.90),
(21, 7, 1, 34.90);