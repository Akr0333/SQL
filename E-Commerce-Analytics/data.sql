USE ecommerce_analytics;

INSERT INTO Customers VALUES
(1, 'Aditya', 'aditya@example.com', 'North'),
(2, 'Neha', 'neha@example.com', 'South'),
(3, 'Vikram', 'vikram@example.com', 'East'),
(4, 'Sneha', 'sneha@example.com', 'West'),
(5, 'Karan', 'karan@example.com', 'North');

INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 65000),
(102, 'Headphones', 'Electronics', 2500),
(103, 'Office Chair', 'Furniture', 8500),
(104, 'Keyboard', 'Electronics', 1800),
(105, 'Backpack', 'Accessories', 2200);

INSERT INTO Orders VALUES
(1001, 1, '2026-01-05'),
(1002, 2, '2026-01-12'),
(1003, 1, '2026-02-03'),
(1004, 3, '2026-02-17'),
(1005, 4, '2026-03-02'),
(1006, 5, '2026-03-18');

INSERT INTO OrderItems VALUES
(1, 1001, 101, 1),
(2, 1001, 102, 2),
(3, 1002, 103, 1),
(4, 1003, 104, 2),
(5, 1003, 105, 1),
(6, 1004, 102, 3),
(7, 1005, 103, 2),
(8, 1006, 101, 1);

INSERT INTO Payments VALUES
(1, 1001, '2026-01-05', 70000, 'UPI'),
(2, 1002, '2026-01-12', 8500, 'Card'),
(3, 1003, '2026-02-03', 5800, 'UPI'),
(4, 1004, '2026-02-17', 7500, 'Card'),
(5, 1005, '2026-03-02', 17000, 'Net Banking'),
(6, 1006, '2026-03-18', 65000, 'UPI');