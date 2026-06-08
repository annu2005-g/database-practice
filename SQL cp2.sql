CREATE TABLE user1 (
id INT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
email VARCHAR(50) UNIQUE,
is_active BOOLEAN DEFAULT TRUE,
created_at DATE
);

SELECT * FROM user1;

INSERT INTO user1(id, name, email, is_active, created_at)
VALUES ( 1, 'Annu', 'annug23@email.com', TRUE, '2005-05-08');


INSERT INTO user1(id, name, email, is_active, created_at)
VALUES 
( 2, 'tanu', 'tanu24@email.com', FALSE, '2003-11-17'),
( 3, 'saniya', 'saniya87@email.com', TRUE, '2010-06-13');


SELECT * FROM user1;
SELECT is_active  FROM user1;       

UPDATE user1
SET email = 'tanuja08@email.com'
Where id = 2;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM user1
WHERE name = 'saniya';

INSERT INTO user1(id, name, email, is_active, created_at)
VALUES ( 4, 'ANKUR', 'ag26@email.com', TRUE, '2024-08-12');

SELECT * FROM user1
WHERE created_at > '2024-01-01';

SELECT * FROM user1
WHERE age IS NULL;

DESC user1;


ALTER TABLE user1
ADD age INT;


SELECT * FROM users
WHERE age IS NULL;