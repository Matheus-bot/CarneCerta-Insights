
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

-- Quando o negócio vende mais
-- Tendências de crescimento ou queda
-- Base para gráfico de linha no Power BI

SELECT 
    CAST(created_at AS DATE) AS sale_date,
    SUM(total) AS daily_revenue
FROM sales
GROUP BY CAST(created_at AS DATE)
ORDER BY sale_date;

-- Top produtos por receita
-- Quais carnes realmente geram mais lucro

SELECT 
    p.name AS product_name,
    SUM(si.quantity * si.price) AS total_revenue
FROM sale_items si
INNER JOIN products p
    ON si.product_id = p.id
GROUP BY p.name
ORDER BY total_revenue DESC;

-- Produtos pouco vendidos

SELECT 
    p.name AS product_name,
    COALESCE(SUM(si.quantity), 0) AS total_sold
FROM products p
LEFT JOIN sale_items si
    ON p.id = si.product_id
GROUP BY p.name
ORDER BY total_sold ASC;

-- Vendas por funcionário (desempenho)

SELECT 
    employee_name,
    COUNT(id) AS total_sales,
    SUM(total) AS total_revenue
FROM sales
GROUP BY employee_name
ORDER BY total_revenue DESC;

-- Clientes recorrentes

SELECT 
    c.name AS customer_name,
    COUNT(s.id) AS total_purchases,
    SUM(s.total) AS total_spent
FROM customers c
INNER JOIN sales s
    ON c.id = s.customer_id
GROUP BY c.name
HAVING COUNT(s.id) > 1
ORDER BY total_spent DESC;