INSERT INTO customers (customer_id, customer_name, country, signup_date) VALUES
(1, 'Aarav Sharma', 'India', '2025-01-10'),
(2, 'Emma Wilson', 'UK', '2025-02-15'),
(3, 'Noah Smith', 'USA', '2025-03-20'),
(4, 'Priya Singh', 'India', '2025-04-05'),
(5, 'Liam Brown', 'Canada', '2025-05-12');

INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 75000.00),
(102, 'Smartphone', 'Electronics', 45000.00),
(103, 'Headphones', 'Accessories', 5000.00),
(104, 'Office Chair', 'Furniture', 12000.00),
(105, 'Keyboard', 'Accessories', 2500.00);

INSERT INTO sales (sale_id, customer_id, product_id, sale_date, quantity) VALUES
(1001, 1, 101, '2025-06-01', 1),
(1002, 2, 102, '2025-06-05', 2),
(1003, 3, 103, '2025-06-12', 3),
(1004, 1, 105, '2025-07-02', 2),
(1005, 4, 104, '2025-07-10', 1),
(1006, 5, 102, '2025-08-03', 1),
(1007, 4, 103, '2025-08-15', 2),
(1008, 2, 101, '2025-09-01', 1);
