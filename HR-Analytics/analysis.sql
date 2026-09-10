USE hr_analytics;

-- Average salary by department
SELECT d.department_name, ROUND(AVG(s.salary), 2) AS average_salary
FROM Departments d
JOIN Employees e ON d.department_id = e.department_id
JOIN Salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_id, d.department_name
ORDER BY average_salary DESC;

-- Highest paid employees
SELECT e.employee_name, d.department_name, s.salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Salaries s ON e.employee_id = s.employee_id
ORDER BY s.salary DESC;

-- Rank employees by salary within department
SELECT e.employee_name, d.department_name, s.salary,
       RANK() OVER (PARTITION BY e.department_id ORDER BY s.salary DESC) AS salary_rank
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Salaries s ON e.employee_id = s.employee_id;

-- Company-wide salary ranking
SELECT e.employee_name, s.salary,
       DENSE_RANK() OVER (ORDER BY s.salary DESC) AS company_rank
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id;

-- Compare salary with previous employee in salary order
SELECT e.employee_name, s.salary,
       LAG(s.salary) OVER (ORDER BY s.salary DESC) AS previous_salary,
       LEAD(s.salary) OVER (ORDER BY s.salary DESC) AS next_salary
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id;

-- CTE: employees earning above company average
WITH AverageSalary AS (
    SELECT AVG(salary) AS avg_salary FROM Salaries
)
SELECT e.employee_name, s.salary
FROM Employees e
JOIN Salaries s ON e.employee_id = s.employee_id
CROSS JOIN AverageSalary a
WHERE s.salary > a.avg_salary
ORDER BY s.salary DESC;