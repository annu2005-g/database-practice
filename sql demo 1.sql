CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  age INT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at DATE
);