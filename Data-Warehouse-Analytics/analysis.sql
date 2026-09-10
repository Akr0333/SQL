-- Data Warehouse Analytics

-- Total revenue
SELECT SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- Revenue by category
SELECT p.category,
       SUM(p.price * s.quantity) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Top customers
SELECT c.customer_name,
       SUM(p.price * s.quantity) AS customer_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY customer_revenue DESC;

-- Monthly revenue using a CTE
WITH monthly_sales AS (
    SELECT EXTRACT(YEAR FROM s.sale_date) AS sale_year,
           EXTRACT(MONTH FROM s.sale_date) AS sale_month,
           SUM(p.price * s.quantity) AS revenue
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY EXTRACT(YEAR FROM s.sale_date), EXTRACT(MONTH FROM s.sale_date)
)
SELECT *
FROM monthly_sales
ORDER BY sale_year, sale_month;

-- Product revenue ranking
SELECT p.product_name,
       SUM(p.price * s.quantity) AS revenue,
       RANK() OVER (ORDER BY SUM(p.price * s.quantity) DESC) AS revenue_rank
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;
