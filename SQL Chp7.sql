CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    balance DECIMAL(10,2)
);

INSERT INTO accounts VALUES
(1, 'Rahul', 10000),
(2, 'Karan', 5000),
(3, 'Annu', 15000),
(4, 'Priya', 8000);

-- 1. Transfer ₹2000 from Rahul to Karan using Transaction

SET SQL_SAFE_UPDATES = 0;
START TRANSACTION;

UPDATE accounts
SET balance = balance - 2000
WHERE customer_name = 'Rahul';

UPDATE accounts
SET balance = balance + 2000
WHERE customer_name = 'Karan';

COMMIT;

SELECT * FROM accounts;
DESC accounts;


-- . 2 Rollback a Failed Transaction

START TRANSACTION;

UPDATE accounts
SET balance = balance - 2000
WHERE customer_name = 'Rahul';

ROLLBACK;

-- 3. Create an Index on customer_name

CREATE INDEX idx_customer_name
ON accounts(customer_name);

-- 4. Fetch Only Customer Names and Balances

SELECT customer_name, balance
FROM accounts;

-- 5. Get Top 2 Highest Balance Accounts

SELECT * FROM accounts
ORDER BY balance DESC
LIMIT 2;

-- 6. Transaction History Table

CREATE TABLE transaction_history (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    from_customer VARCHAR(50),
    to_customer VARCHAR(50),
    amount DECIMAL(10,2),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 7. Money Transfer + Insert Transaction History

START TRANSACTION;

UPDATE accounts
SET balance = balance - 2000
WHERE customer_name = 'Rahul';

UPDATE accounts
SET balance = balance + 2000
WHERE customer_name = 'Karan';

INSERT INTO transaction_history
(from_customer, to_customer, amount)
VALUES
('Rahul', 'Karan', 2000);

COMMIT;


SELECT * FROM accounts;

SELECT * FROM transaction_history;