-- HR Analytics: PostgreSQL-style SQL

WITH employee_metrics AS (
    SELECT
        e.employee_id,
        e.department,
        e.role,
        e.salary,
        e.join_date,
        e.left_date,
        CASE WHEN e.left_date IS NULL THEN 0 ELSE 1 END AS attrited,
        EXTRACT(YEAR FROM AGE(COALESCE(e.left_date, CURRENT_DATE), e.join_date)) AS tenure_years
    FROM employees e
),
department_summary AS (
    SELECT
        department,
        COUNT(*) AS headcount,
        ROUND(AVG(salary), 2) AS avg_salary,
        ROUND(100.0 * AVG(attrited), 2) AS attrition_rate
    FROM employee_metrics
    GROUP BY department
)
SELECT *
FROM department_summary
ORDER BY avg_salary DESC;

-- Top earners inside each department
SELECT employee_id, department, role, salary,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employee_metrics;

-- Tenure segmentation
SELECT
    CASE
        WHEN tenure_years < 1 THEN '0-1 years'
        WHEN tenure_years < 3 THEN '1-3 years'
        WHEN tenure_years < 5 THEN '3-5 years'
        ELSE '5+ years'
    END AS tenure_group,
    COUNT(*) AS employees
FROM employee_metrics
GROUP BY 1
ORDER BY 1;
