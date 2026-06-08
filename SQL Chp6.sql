CREATE TABLE user5 (
id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
department VARCHAR(100) NOT NULL,
salary INT,
city varchar(50),
is_active BOOLEAN DEFAULT TRUE
);

INSERT INTO user5 (id, name, department, salary, city, is_active)
VALUE 
(1, 'KARAN', 'IT', 86000, 'MUMBAI', TRUE),
(2, 'MANISH', 'HR', 90000, 'DELHI', TRUE),
(3, 'RAHUL', 'IT', 24000, 'MUMBAI', FALSE),
(4, 'SHIVANK', 'ACCOUNT', 12000, 'UP', TRUE),
(5, 'VIVEK', 'HR', 54000, 'DELHI', TRUE),
(6, 'KAVYA', 'ACCOUNT', 26000, 'MUMBAI', TRUE);

SELECT * FROM user5;

-- VIEW EXAMPLES

CREATE VIEW active_employees AS
SELECT
    id,
    name,
    department,
    salary
FROM user5
WHERE is_active = TRUE;


SELECT *
FROM active_employees;


CREATE VIEW department_salary_report AS
SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary
FROM user5
GROUP BY department;

SELECT *
FROM department_salary_report;

-- FUNCTION EXAMPLES

DELIMITER $$  /* ye ek keyword hai jo batata hai kki same input doge to function hamesha same output dega*/
CREATE FUNCTION yearly_salary(monthly_salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END$$
DELIMITER ;

SELECT
    name,
    salary,
    yearly_salary(salary) AS annual_salary
FROM user5;


DELIMITER $$

CREATE FUNCTION salary_grade(emp_salary INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF emp_salary >= 70000 THEN
        RETURN 'High';
    ELSEIF emp_salary >= 50000 THEN
        RETURN 'Medium';
    ELSE
        RETURN 'Low';
    END IF;
END$$
DELIMITER ;

SELECT
    name,
    salary,
    salary_grade(salary) AS salary_category
FROM user5;

-- Simple Stored Procedure example
DELIMITER $$
CREATE PROCEDURE get_all_employees()
BEGIN
    SELECT *
    FROM user5;
END;

CALL get_all_employees();

DELIMITER $$
CREATE PROCEDURE get_employees_by_department(
    IN dept_name VARCHAR(50)
)
BEGIN
    SELECT
        name,
        salary,
        department
    FROM user5
    WHERE department = dept_name;
END$$
DELIMITER ;

-- DROP PROCEDURE IF EXISTS get_employees_by_department;
CALL get_employees_by_department('IT');

-- SHOW PROCEDURE STATUS
-- WHERE Db = DATABASE();

-- SELECT DATABASE();

-- insert procedure examless

DELIMITER $$
CREATE PROCEDURE add_employee(
    IN emp_name VARCHAR(100),
    IN emp_department VARCHAR(100),
    IN emp_salary INT,
    IN emp_city VARCHAR(50)
)
BEGIN
    INSERT INTO user5(
        name,
        department,
        salary,
        city,
        is_active
    )
    VALUES(
        emp_name,
        emp_department,
        emp_salary,
        emp_city,
        TRUE
    );
END$$

DELIMITER ;

ALTER TABLE user5
MODIFY COLUMN id INT NOT NULL AUTO_INCREMENT;

DROP PROCEDURE IF EXISTS add_employee;
CALL add_employee(
    'Riya',
    'Finance',
    65000,
    'Mumbai'
);

SELECT * FROM user5;

--  Update Procedure examples
DELIMITER $$
CREATE PROCEDURE update_salary(
    IN emp_id INT,
    IN new_salary INT
)
BEGIN
    UPDATE user5
    SET salary = new_salary
    WHERE id = emp_id;
END$$
DELIMITER ;



SHOW PROCEDURE STATUS
WHERE Db = DATABASE();

SHOW CREATE PROCEDURE update_salary;
DROP PROCEDURE IF EXISTS update_salary;
CALL update_salary(1, 85000);




-- MINI PROJECT QUESTION 

CREATE TABLE employee2(
id INT PRIMARY KEY,
name VARCHAR(50),
department VARCHAR(100),
salary INT,
city VARCHAR(50),
is_active BOOLEAN DEFAULT TRUE
);

INSERT INTO employee2 (id, name, department, salary, city, is_active)
VALUE (101, 'ANNU', 'TEACHER', 25000, 'LUCKNOW', TRUE),
 (102, 'SANU', 'DOCTOR', 23400, 'DELHI', TRUE),
(103, 'YASH', 'IPS', 660000, 'LUCKNOW', FALSE),
(104, 'RAVI', 'ASSISTANT', 50000, 'MP', TRUE),
(105, 'HARSH', 'DOCTOR', 89000, 'MP', FALSE);

SELECT * FROM employee2

-- 1. Create a view for active employees only
CREATE VIEW is_active_employees AS
SELECT  id,  
      name,
     department, 
     salary
FROM employee2
WHERE is_active = TRUE;

SELECT * FROM is_active_employees;

-- 2.Create a department-wise salary report using a view
CREATE VIEW department_report_salary AS
SELECT
     department,
     COUNT(*)AS total_employees,
     SUM(salary)AS total_salary
	FROM employee2
    GROUP BY department;
    
    SELECT * FROM department_report_salary ;
    
-- 3.Create a function to calculate bonus amount  
  /*salary INT → input parameter
RETURNS INT → function integer value return karega
salary * 10 / 100 → 10% bonus calculate kar raha hai
RETURN bonus → calculated bonus wapas bhejta hai*/
  
DELIMITER $$
CREATE FUNCTION calculate_bonus(emp_salary INT)
RETURNS INT                                
DETERMINISTIC                              
BEGIN                                      
	RETURN emp_salary * 10 / 100;	       
END $$
DELIMITER ;

SELECT
    id, name, salary, calculate_bonus(salary) AS bonus
FROM user5;


-- Q.3 (EXAPMLE 2)

DELIMITER $$
CREATE FUNCTION BONUS_CALCULATE(dept VARCHAR(20), emp_salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
    IF dept = 'HR' THEN
        RETURN emp_salary * 15 / 100;
    ELSE
        RETURN emp_salary * 10 / 100;
    END IF;
END $$
DELIMITER ;

SELECT
    id,
    name,
    department,
    salary,
    BONUS_CALCULATE(department, salary) AS bonus
FROM user5;

-- question 4 Create a function to classify employee salary levels

DELIMITER $$
CREATE FUNCTION classify_salary(emp_salary INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE salary_level VARCHAR(20);
    IF emp_salary < 30000 THEN
        SET salary_level = 'Low';
    ELSEIF emp_salary >= 30000 AND emp_salary < 70000 THEN
        SET salary_level = 'Medium';
    ELSE
        SET salary_level = 'High';
    END IF;
    RETURN salary_level;
END $$
DELIMITER ;

SELECT id,
       name,
       salary,
       classify_salary(salary) AS salary_level
FROM user5;

-- question5 Create a stored procedure to get employees by city

DELIMITER $$
CREATE PROCEDURE get_employees_by_city(
    IN emp_city VARCHAR(50)
)
BEGIN
    SELECT *
    FROM user5
    WHERE city = emp_city;
END $$
DELIMITER ;

CALL get_employees_by_city('Mumbai');

--  question 6 Create a stored procedure to update employee department

DELIMITER $$
CREATE PROCEDURE update_employee_department(
    IN emp_id INT,
    IN new_department VARCHAR(50)
)
BEGIN
    UPDATE user5
    SET department = new_department
    WHERE id = emp_id;
END $$
DELIMITER ;

CALL update_employee_department(1, 'IT');

SELECT * FROM user5
WHERE id = 1;
