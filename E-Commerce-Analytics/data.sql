USE ecommerce_analytics;

INSERT INTO Customers VALUES
(1, 'Aarav Sharma', 'aarav@example.com', 'North'),
(2, 'Priya Singh', 'priya@example.com', 'East'),
(3, 'Rahul Kumar', 'rahul@example.com', 'South'),
(4, 'Ananya Verma', 'ananya@example.com', 'West'),
(5, 'Rohan Gupta', 'rohan@example.com', 'North');

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 75000.00),
(102, 'Smartphone', 'Electronics', 45000.00),
(103, 'Headphones', 'Accessories', 5000.00),
(104, 'Office Chair', 'Furniture', 12000.00),
(105, 'Keyboard', 'Accessories', 2500.00);

INSERT INTO Orders VALUES
(1001, 1, '2026-01-05'),
(1002, 2, '2026-01-12'),
(1003, 1, '2026-02-03'),
(1004, 3, '2026-02-18'),
(1005, 4, '2026-03-02'),
(1006, 5, '2026-03-15');

INSERT INTO OrderItems VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 105, 2),
(5, 1003, 104, 1),
(6, 1004, 103, 3),
(7, 1005, 101, 1),
(8, 1006, 102, 2);

INSERT INTO Payments VALUES
(1, 1001, '2026-01-05', 85000, 'UPI'),
(2, 1002, '2026-01-12', 45000, 'Card'),
(3, 1003, '2026-02-03', 17000, 'UPI'),
(4, 1004, '2026-02-18', 15000, 'Card'),
(5, 1005, '2026-03-02', 75000, 'Net Banking'),
(6, 1006, '2026-03-15', 90000, 'Card');
