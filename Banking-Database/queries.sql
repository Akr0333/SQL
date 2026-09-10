USE banking_database;

-- Customer accounts
SELECT c.customer_name, a.account_id, a.account_type, a.opening_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

-- Deposits and withdrawals
SELECT account_id,
       SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE 0 END) AS deposits,
       SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount ELSE 0 END) AS withdrawals
FROM Transactions
GROUP BY account_id;

-- Estimated current balance
SELECT a.account_id, c.customer_name,
       a.opening_balance +
       COALESCE(SUM(CASE WHEN t.transaction_type = 'Deposit' THEN t.amount ELSE -t.amount END), 0) AS current_balance
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id
LEFT JOIN Transactions t ON a.account_id = t.account_id
GROUP BY a.account_id, c.customer_name, a.opening_balance
ORDER BY current_balance DESC;

-- Accounts with balance above 30000
SELECT account_id, opening_balance
FROM Accounts
WHERE opening_balance > 30000;

-- Transactions above average
SELECT *
FROM Transactions
WHERE amount > (SELECT AVG(amount) FROM Transactions);

-- View for account summary
CREATE OR REPLACE VIEW AccountSummary AS
SELECT a.account_id, c.customer_name, a.account_type, a.opening_balance,
       a.opening_balance + COALESCE(SUM(CASE WHEN t.transaction_type = 'Deposit' THEN t.amount ELSE -t.amount END), 0) AS current_balance
FROM Accounts a
JOIN Customers c ON a.customer_id = c.customer_id
LEFT JOIN Transactions t ON a.account_id = t.account_id
GROUP BY a.account_id, c.customer_name, a.account_type, a.opening_balance;

SELECT * FROM AccountSummary;