USE ecommerce_analytics;

-- 1. Revenue by product
SELECT p.product_name,
       SUM(oi.quantity * p.price) AS revenue
FROM OrderItems oi
JOIN Products p ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- 2. Revenue by region
SELECT c.region,
       SUM(oi.quantity * p.price) AS revenue
FROM Orders o
JOIN Customers c ON c.customer_id = o.customer_id
JOIN OrderItems oi ON oi.order_id = o.order_id
JOIN Products p ON p.product_id = oi.product_id
GROUP BY c.region
ORDER BY revenue DESC;

-- 3. Top customers by lifetime spend
SELECT c.customer_name,
       SUM(oi.quantity * p.price) AS lifetime_spend
FROM Customers c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN OrderItems oi ON oi.order_id = o.order_id
JOIN Products p ON p.product_id = oi.product_id
GROUP BY c.customer_name
ORDER BY lifetime_spend DESC;

-- 4. Average order value
SELECT ROUND(SUM(oi.quantity * p.price) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM Orders o
JOIN OrderItems oi ON oi.order_id = o.order_id
JOIN Products p ON p.product_id = oi.product_id;

-- 5. Monthly revenue with a CTE
WITH monthly_revenue AS (
    SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
           SUM(oi.quantity * p.price) AS revenue
    FROM Orders o
    JOIN OrderItems oi ON oi.order_id = o.order_id
    JOIN Products p ON p.product_id = oi.product_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT month, revenue,
       LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
       ROUND(100 * (revenue - LAG(revenue) OVER (ORDER BY month)) /
             NULLIF(LAG(revenue) OVER (ORDER BY month), 0), 2) AS growth_pct
FROM monthly_revenue
ORDER BY month;

-- 6. Product ranking within category
SELECT p.category, p.product_name,
       SUM(oi.quantity * p.price) AS revenue,
       RANK() OVER (
           PARTITION BY p.category
           ORDER BY SUM(oi.quantity * p.price) DESC
       ) AS category_rank
FROM Products p
JOIN OrderItems oi ON oi.product_id = p.product_id
GROUP BY p.category, p.product_name;
