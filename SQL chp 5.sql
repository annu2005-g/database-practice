-- Aggregation and Reporting

CREATE TABLE employee (
id INT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
department VARCHAR(100) NOT NULL, 
city VARCHAR(50),
is_active BOOLEAN DEFAULT TRUE,
salary INT
);

INSERT INTO employee
VALUES ( 1, 'ANNU', 'IT', 'MUMBAI', TRUE, 25000);

SELECT * FROM employee;

INSERT INTO employee
VALUES ( 2, 'ram', 'IT', 'delhi', TRUE, 87000),
( 3, 'radha', 'HR', 'MUMBAI', FALSE, 5400),
( 4, 'KAVYA', 'ACCOUNT', 'UP', TRUE, 90000),
( 5, 'ANANYA', 'ACCOUNT', 'MUMBAI', TRUE, 49000);