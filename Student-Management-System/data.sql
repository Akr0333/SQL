USE student_management;

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Business Administration');

INSERT INTO Students VALUES
(101, 'Aarav Sharma', 'aarav@example.com', 20, 1),
(102, 'Priya Singh', 'priya@example.com', 21, 1),
(103, 'Rahul Kumar', 'rahul@example.com', 20, 2),
(104, 'Ananya Verma', 'ananya@example.com', 22, 2),
(105, 'Rohan Gupta', 'rohan@example.com', 21, 3);

INSERT INTO Courses VALUES
(201, 'Database Systems', 4, 1),
(202, 'Data Structures', 4, 1),
(203, 'Web Technology', 3, 2),
(204, 'Business Analytics', 4, 3);

INSERT INTO Enrolments VALUES
(1, 101, 201, '2026-01-10', 88),
(2, 101, 202, '2026-01-11', 91),
(3, 102, 201, '2026-01-10', 84),
(4, 102, 202, '2026-01-11', 89),
(5, 103, 203, '2026-01-12', 78),
(6, 104, 203, '2026-01-12', 92),
(7, 105, 204, '2026-01-13', 86);