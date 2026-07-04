
-- Quanto o negócio faturou no total?
SELECT 
    SUM(total) AS total_revenue
FROM sales;

-- Produto mais vendido 

SELECT 
    p.name AS product_name,
    SUM(si.quantity) AS total_quantity_sold
FROM sale_items si
INNER JOIN products p
    ON si.product_id = p.id
GROUP BY p.name
ORDER BY total_quantity_sold DESC;


-- Clientes mais ativos 
SELECT 
    c.name AS customer_name,
    COUNT(s.id) AS total_orders,
    SUM(s.total) AS total_spent
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.id
GROUP BY c.name
ORDER BY total_spent DESC;


-- Ticket médio

SELECT 
    AVG(total) AS average_ticket
FROM sales;