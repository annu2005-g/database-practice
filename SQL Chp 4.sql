SELECT
    u.name,
    o.amount
FROM user3 u
INNER JOIN orders o
ON u.id = o.user_id;

SELECT
    u.name,
    o.amount
FROM users u
LEFT JOIN orders o
ON u.id = o.user_id;


SELECT
    u.name,
    o.amount
FROM user3 u
RIGHT JOIN orders o
ON u.id = o.user_id;

SELECT
    u.name,
    o.amount
FROM user3 u
LEFT OUTER JOIN orders o
ON u.id = o.user_id;


SELECT * FROM user3;

SELECT
    u.name,
    o.amount,
    p.status
FROM users u
INNER JOIN orders o
ON u.id = o.user_id
INNER JOIN payments p
ON o.id = p.order_id;

SELECT
    u.name,
    o.amount
FROM user3 u
LEFT JOIN orders o
ON u.id = o.user_id
WHERE u.city = 'Mumbai';

SELECT
    u.name,
    COUNT(o.id) AS total_orders
FROM users u
LEFT JOIN orders o
ON u.id = o.user_id
GROUP BY u.name;   

SELECT
    u.name,
    SUM(o.amount) AS total_spent
FROM users u
LEFT JOIN orders o
ON u.id = o.user_id
GROUP BY u.name;  



-- 1. List all users and their total number of orders

DESC user3;
DESC orders;

SELECT u.id, u.name, COUNT(o.id) AS total_orders
FROM user3 u
LEFT JOIN orders o
ON u.id = o.user_id
GROUP BY u.id, u.name;  

--  question2 Find users who have never placed an order

SELECT u.id, u.name
FROM user3 u
LEFT JOIN orders o
ON u.id = o.user_id
WHERE o.id IS NULL;  

-- 3. Get all orders with user city

SELECT o.id, o.amount, u.name, u.city
FROM orders o
JOIN user3 u
ON o.id = u.id;

-- 4. Show users from Delhi with their order amounts

SELECT u.name, u.city, o.amount
FROM user3 u
JOIN orders o
ON u.id = o.user_id
WHERE u.city = 'Delhi';

-- 5. Find orders without a valid user

SELECT o.* FROM orders o
LEFT JOIN users u
ON o.id = u.id
WHERE u.id IS NULL;

-- 6. Count total orders placed by each user

SELECT u.name, COUNT(o.id) AS total_orders
FROM users u
LEFT JOIN orders o
ON u.id = o.id
GROUP BY u.id, u.name;

-- 7. Calculate total spending per user

SELECT u.name, SUM(o.amount) AS total_spending
FROM users u
JOIN orders o
ON u.id = o.id
GROUP BY u.id, u.name;

-- 8. Find users with more than one order

SELECT u.name, COUNT(o.id) AS total_orders
FROM users u
JOIN orders o
ON u.id = o.user_id
GROUP BY u.id, u.name
HAVING COUNT(o.id) > 1;

-- 9. Show all successful payments with customer names

SELECT u.name, p.id, p.status
FROM payments p
JOIN orders o
ON p.id = o.id
JOIN user3 u
ON o.id = u.id
WHERE p.status = 'Success';

-- 10. Build a report showing user name, order amount and payment status

SELECT u.name, o.amount, p.status
FROM user3 u
JOIN orders o
ON u.id = o.id
LEFT JOIN payments p
ON o.id = p.id;