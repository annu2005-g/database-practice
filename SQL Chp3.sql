CREATE TABLE user2 (
id INT PRIMARY KEY,
name VARCHAR(40) NOT NULL,
city VARCHAR(20),
age INT,
is_active BOOLEAN DEFAULT TRUE
);

SELECT * FROM user2;

INSERT INTO user2( id, name, city, age, is_active)
VALUES
( 1, 'ram', 'Mumbai', 26, TRUE),
( 2, 'Shyam', 'delhi', 34, FALSE),
( 3, 'Anup', 'Mumabi', 15, TRUE),
( 4, 'Karisma', 'lucknow', 22, TRUE),


INSERT INTO user2( id, name, city, age, is_active)
VALUES( 5, 'annu', 'mumbai', 12, TRUE);


-- question 1 Find all inactive users
SELECT * FROM user2
WHERE is_active = FALSE;

-- question2 Get users older than 25 from Mumbai
SELECT * FROM user2
WHERE age > 25
AND city = 'Mumbai';

-- question3 List all users sorted by name (A–Z)
SELECT * FROM user2
ORDER BY name ASC;

-- question4 Get first 3 active users
SELECT * FROM user2
WHERE is_active = TRUE
LIMIT 3;

-- question 5 Find users whose name contains 'an'
SELECT * FROM user2
WHERE name LIKE '%an%';

-- question 6 Get users aged between 22 and 26 from Delhi
SELECT * FROM user2
WHERE age BETWEEN 22 AND 26
AND city = 'Delhi';




 