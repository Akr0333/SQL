# 🛒 E-Commerce Analytics — Business Case

## Business problem
An e-commerce team needs a reporting layer to understand revenue, customer value, product performance and month-over-month growth.

## Questions answered
1. Which products generate the most revenue?
2. Which regions generate the most revenue?
3. Who are the highest-value customers?
4. What is the average order value?
5. How is monthly revenue changing?
6. Which products rank highest within each category?

## Data model

```text
Customers ──< Orders ──< OrderItems >── Products
                 │
                 └──── Payments
```

## SQL techniques demonstrated
- Multi-table JOINs
- GROUP BY and aggregations
- CTEs
- CASE / NULLIF
- Date functions
- Window functions
- LAG for period-over-period analysis
- RANK with PARTITION BY
- KPI calculations

## Portfolio workflow
**Business Question → SQL Query → KPI → Comparison → Insight**

## Key outputs
- Revenue by product and category
- Revenue by region
- Customer lifetime spend
- Average order value
- Monthly revenue and growth
- Product ranking within category

## Run
Use MySQL 8+:
1. Run `schema.sql`
2. Run `data.sql`
3. Run `analysis.sql`
4. Run `queries.sql`

The dataset is intentionally small so the complete workflow is easy to inspect and reproduce.
