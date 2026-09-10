USE ecommerce_analytics;

-- Revenue by order
SELECT o.order_id, o.order_date,
       SUM(oi.quantity * p.price) AS order_value
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY o.order_id, o.order_date
ORDER BY order_value DESC;

-- Revenue by category
SELECT p.category,
       SUM(oi.quantity * p.price) AS revenue
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Customer spending using a CTE
WITH CustomerSpend AS (
    SELECT c.customer_id, c.customer_name,
           SUM(oi.quantity * p.price) AS total_spend
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN OrderItems oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT * FROM CustomerSpend
ORDER BY total_spend DESC;

-- Rank products by revenue
WITH ProductRevenue AS (
    SELECT p.product_id, p.product_name,
           SUM(oi.quantity * p.price) AS revenue
    FROM Products p
    JOIN OrderItems oi ON p.product_id = oi.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT product_name, revenue,
       RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM ProductRevenue;

-- Monthly sales
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
       SUM(oi.quantity * p.price) AS monthly_revenue
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;