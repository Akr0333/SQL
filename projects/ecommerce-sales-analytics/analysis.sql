-- E-commerce Sales Analytics

WITH order_totals AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_date,
        SUM(oi.quantity * oi.unit_price) AS order_value
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    GROUP BY o.order_id, o.customer_id, o.order_date
),
customer_value AS (
    SELECT
        customer_id,
        COUNT(*) AS orders,
        SUM(order_value) AS lifetime_value,
        AVG(order_value) AS average_order_value
    FROM order_totals
    GROUP BY customer_id
)
SELECT
    customer_id,
    orders,
    ROUND(lifetime_value, 2) AS lifetime_value,
    ROUND(average_order_value, 2) AS average_order_value,
    DENSE_RANK() OVER (ORDER BY lifetime_value DESC) AS customer_rank
FROM customer_value
ORDER BY lifetime_value DESC;

-- Monthly revenue trend
SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    SUM(order_value) AS revenue,
    SUM(SUM(order_value)) OVER (
        ORDER BY DATE_TRUNC('month', order_date)
    ) AS running_revenue
FROM order_totals
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;
