-- Advanced SQL Practice

-- 1. Employees earning above the company average
SELECT employee_id, employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Customers with more than one order
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 3. UNION example
SELECT city FROM customers
UNION
SELECT city FROM suppliers;

-- 4. CASE expression
SELECT employee_name, salary,
       CASE
           WHEN salary >= 100000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM employees;

-- 5. Correlated subquery
SELECT e.employee_id, e.employee_name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);
