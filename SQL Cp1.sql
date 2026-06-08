CREATE DATABASE sqldemo;
USE sqldemo
CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  age INT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATE
);

INSERT INTO users (id, name, email, age, created_at)
VALUES (1, 'Rahul', 'rahul@email.com', 25, '2024-01-01');


SELECT * FROM users;
SELECT name, email FROM users;

SELECT * FROM users
WHERE age > 25;

SELECT name FROM users
WHERE is_active = TRUE;

UPDATE users
SET age = 26
WHERE id = 1;

SELECT * FROM users;

SELECT * FROM users
WHERE age IS NULL;


