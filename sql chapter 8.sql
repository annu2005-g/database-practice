-- 1 Create customers and accounts tables with primary and foreign keys

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1,'Rahul','rahul@gmail.com','Delhi'),
(2,'Karan','karan@gmail.com','Mumbai'),
(3,'Priya','priya@gmail.com','Pune'),
(4,'Annu','annu@gmail.com','Delhi');

CREATE TABLE accounts1 (
    account_id INT PRIMARY KEY,
    customer_id INT,
    balance DECIMAL(10,2),
    
    CONSTRAINT fk_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    CONSTRAINT chk_balance
    CHECK (balance >= 0)
);

INSERT INTO accounts1 VALUES
(101,1,10000),
(102,2,5000),
(103,3,15000),
(104,4,8000);

-- 4 Design one-to-many relationship between customers and orders
CREATE TABLE orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);
INSERT INTO orders1 VALUES
(1,1,2500),
(2,1,3000),
(3,2,1500),
(4,3,5000),
(5,3,7000);

SELECT
c.customer_id,
c.customer_name,
c.email,
a.account_id,
a.balance
FROM customers c
JOIN accounts1 a
ON c.customer_id = a.customer_id;

DESC customers;
DESC accounts1;

SELECT c.customer_name, o.order_id,o.order_amount
FROM customers c
JOIN orders1 o
ON c.customer_id = o.customer_id;


-- 5 Write SQL to grant read-only access to a reporting user
CREATE USER 'report_user'@'localhost'
IDENTIFIED BY 'report123';

GRANT SELECT ON company_db.* TO 'report_user'@'localhost';

FLUSH PRIVILEGES;

INSERT INTO customers
VALUES
(5,'Amit','rahul23@gmail.com','Mumbai');

-- --3 Add CHECK constraint to prevent negative balance

INSERT INTO accounts1 VALUES
(105,1,-5000);

-- 6 Explain why parameterized queries prevent SQL injection

SELECT * FROM customers
WHERE customer_name = '" + user_input + "';

SELECT * FROM customers
WHERE customer_name = ' OR 1=1 --';

SELECT * FROM customers;

SELECT * FROM accounts;

SELECT * FROM orders;