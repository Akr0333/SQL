-- Basic SQL practice
SELECT * FROM employees;
SELECT name, salary FROM employees WHERE salary > 50000;
SELECT * FROM employees WHERE name LIKE 'A%';
SELECT DISTINCT department FROM employees;
SELECT * FROM employees WHERE salary BETWEEN 30000 AND 80000;
SELECT * FROM employees ORDER BY salary DESC;
SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department;
SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department HAVING AVG(salary) > 50000;

-- Data modification examples
INSERT INTO employees (employee_id, name, department, salary)
VALUES (999, 'Demo Employee', 'Testing', 40000);

UPDATE employees SET salary = salary * 1.10 WHERE department = 'Testing';
DELETE FROM employees WHERE employee_id = 999;

-- CASE expression
SELECT name, salary,
       CASE WHEN salary >= 80000 THEN 'High'
            WHEN salary >= 50000 THEN 'Medium'
            ELSE 'Entry'
       END AS salary_band
FROM employees;