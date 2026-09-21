# 📐 KPI Definitions

| KPI | Definition | SQL logic |
|---|---|---|
| Revenue | Sum of quantity × product price | SUM(quantity * price) |
| Orders | Number of unique orders | COUNT(DISTINCT order_id) |
| Customers | Number of unique purchasing customers | COUNT(DISTINCT customer_id) |
| Average Order Value | Revenue divided by unique orders | Revenue / COUNT(DISTINCT order_id) |
| Customer Lifetime Spend | Total revenue attributed to a customer | SUM(quantity * price) by customer |
| Monthly Revenue | Revenue grouped by calendar month | GROUP BY month |
| MoM Growth | Percentage change from previous month | (current - previous) / previous |
| Product Rank | Revenue rank within a category | RANK() OVER(PARTITION BY category ...) |

## Important assumptions
- Revenue is calculated from `OrderItems.quantity × Products.price`.
- Each order belongs to one customer.
- The demonstration dataset does not model refunds, discounts, tax or shipping.
- Payment amount is stored separately and is not used as the primary revenue measure.
