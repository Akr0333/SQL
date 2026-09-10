-- ROW_NUMBER
SELECT name, department, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

-- RANK and DENSE_RANK
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_in_department,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_in_department
FROM employees;

-- Running total
SELECT employee_id, name, salary,
       SUM(salary) OVER (ORDER BY employee_id) AS running_salary_total
FROM employees;

-- Department average alongside each employee
SELECT name, department, salary,
       AVG(salary) OVER (PARTITION BY department) AS department_average
FROM employees;

-- Previous and next salary
SELECT name, salary,
       LAG(salary) OVER (ORDER BY salary DESC) AS previous_salary,
       LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
FROM employees;