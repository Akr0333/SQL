USE banking_database;

INSERT INTO Customers VALUES
(1, 'Amit Sharma', 'amit@example.com', 'Patna'),
(2, 'Pooja Singh', 'pooja@example.com', 'Delhi'),
(3, 'Ravi Kumar', 'ravi@example.com', 'Mumbai'),
(4, 'Meera Gupta', 'meera@example.com', 'Bengaluru');

INSERT INTO Accounts VALUES
(10001, 1, 'Savings', 25000),
(10002, 2, 'Savings', 40000),
(10003, 3, 'Current', 75000),
(10004, 4, 'Savings', 30000);

INSERT INTO Transactions VALUES
(1, 10001, '2026-01-02', 'Deposit', 10000),
(2, 10001, '2026-01-10', 'Withdrawal', 5000),
(3, 10002, '2026-01-04', 'Deposit', 15000),
(4, 10002, '2026-01-14', 'Withdrawal', 7000),
(5, 10003, '2026-02-01', 'Deposit', 25000),
(6, 10003, '2026-02-11', 'Withdrawal', 12000),
(7, 10004, '2026-02-06', 'Deposit', 8000);