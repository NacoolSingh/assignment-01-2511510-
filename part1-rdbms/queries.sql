-- Q1:
SELECT c.customer_id, c.customer_name, SUM(oi.quantity * oi.price) AS total_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_id, c.customer_name;
-- Q2:
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;
-- Q3:
SELECT sales_rep, COUNT(DISTINCT customer_id) AS unique_customers
FROM orders_flat
GROUP BY sales_rep;
-- Q4:
SELECT o.order_id, SUM(oi.quantity * oi.price) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING SUM(oi.quantity * oi.price) > 10000
ORDER BY total_value DESC;
-- Q5:
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;