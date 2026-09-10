-- Assume Customers and Orders tables exist.

-- INNER JOIN
SELECT c.customer_name, o.order_id
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id;

-- LEFT JOIN
SELECT c.customer_name, o.order_id
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN
SELECT c.customer_name, o.order_id
FROM Customers c
RIGHT JOIN Orders o ON c.customer_id = o.customer_id;

-- FULL OUTER JOIN (PostgreSQL)
SELECT c.customer_name, o.order_id
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id = o.customer_id;

-- CROSS JOIN
SELECT c.customer_name, p.product_name
FROM Customers c
CROSS JOIN Products p;

-- SELF JOIN example
SELECT e1.name AS employee, e2.name AS colleague
FROM employees e1
JOIN employees e2 ON e1.department = e2.department
WHERE e1.employee_id <> e2.employee_id;