USE student_management;

-- Basic filtering
SELECT * FROM Students;
SELECT student_name, age FROM Students WHERE age >= 21;
SELECT * FROM Students WHERE student_name LIKE 'A%';
SELECT DISTINCT department_id FROM Students;
SELECT * FROM Enrolments WHERE grade BETWEEN 80 AND 90 ORDER BY grade DESC;

-- Joins
SELECT s.student_name, d.department_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id;

SELECT s.student_name, c.course_name, e.grade
FROM Enrolments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- GROUP BY and HAVING
SELECT department_id, COUNT(*) AS student_count
FROM Students
GROUP BY department_id
HAVING COUNT(*) >= 2;

SELECT c.course_name, AVG(e.grade) AS average_grade
FROM Courses c
JOIN Enrolments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY average_grade DESC;

-- CASE expression
SELECT student_name, age,
       CASE
           WHEN age < 21 THEN 'Junior'
           WHEN age <= 22 THEN 'Senior'
           ELSE 'Graduate'
       END AS student_level
FROM Students;

-- Subquery: students above average grade
SELECT s.student_name, e.grade
FROM Students s
JOIN Enrolments e ON s.student_id = e.student_id
WHERE e.grade > (SELECT AVG(grade) FROM Enrolments);

-- UNION
SELECT student_name AS name FROM Students WHERE department_id = 1
UNION
SELECT student_name FROM Students WHERE department_id = 2;