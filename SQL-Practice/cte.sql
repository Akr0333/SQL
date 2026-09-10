-- Simple CTE
WITH HighEarners AS (
    SELECT employee_id, name, salary
    FROM employees
    WHERE salary > 70000
)
SELECT * FROM HighEarners;

-- Multiple CTEs
WITH DepartmentAverage AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
),
EmployeeDetails AS (
    SELECT employee_id, name, department, salary
    FROM employees
)
SELECT e.name, e.department, e.salary, d.avg_salary
FROM EmployeeDetails e
JOIN DepartmentAverage d ON e.department = d.department
WHERE e.salary > d.avg_salary;

-- Recursive CTE example: numbers 1 to 10 (MySQL/PostgreSQL)
WITH RECURSIVE Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < 10
)
SELECT * FROM Numbers;