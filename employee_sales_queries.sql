CREATE SCHEMA employee_sales;
CREATE TABLE employee_sales.employees(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL CHECK (gender IN ('Male','Female')),
    department VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

DROP TABLE employee_sales.employees;



INSERT INTO employee_sales.employees(employee_id, first_name, last_name, gender, department, hire_date, salary) VALUES
(1, 'John', 'Doe', 'Male', 'IT', '2018-05-01', 60000.00),
(2, 'Jane', 'Smith', 'Female', 'HR', '2019-06-15', 50000.00),
(3, 'Michael', 'Johnson', 'Male', 'Finance', '2017-03-10', 75000.00),
(4, 'Emily', 'Davis', 'Female', 'IT', '2020-11-20', 70000.00),
(5, 'Sarah', 'Brown', 'Female', 'Marketing', '2016-07-30', 45000.00),
(6, 'David', 'Wilson', 'Male', 'Sales', '2019-01-05', 55000.00),
(7, 'Chris', 'Taylor', 'Male', 'IT', '2022-02-25', 65000.00);




CREATE TABLE employee_sales.products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(40) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    stock INT NOT NULL
);


INSERT INTO employee_sales.products (product_id, product_name, category, price, stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 30),
(2, 'Desk', 'Furniture', 300.00, 50),
(3, 'Chair', 'Furniture', 150.00, 200),
(4, 'Smartphone', 'Electronics', 800.00, 75),
(5, 'Monitor', 'Electronics', 250.00, 40),
(6, 'Bookshelf', 'Furniture', 100.00, 60),
(7, 'Printer', 'Electronics', 200.00, 25)



CREATE TABLE employee_sales.sales (
    sale_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    employee_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    total DECIMAL(8,2) NOT NULL,
    CONSTRAINT fk_product
        FOREIGN KEY (product_id) REFERENCES employee_sales.products(product_id),
    CONSTRAINT fk_employee
        FOREIGN KEY (employee_id) REFERENCES employee_sales.employees(employee_id)
);
DROP TABLE employee_sales.sales;


INSERT INTO employee_sales.sales (sale_id, product_id, employee_id, sale_date, quantity, total) VALUES
(1, 1, 1, '2021-01-15', 2, 2400.00),
(2, 2, 2, '2021-03-22', 1, 300.00),
(3, 3, 3, '2021-05-10', 4, 600.00),
(4, 4, 4, '2021-07-18', 3, 2400.00),
(5, 5, 5, '2021-09-25', 2, 500.00),
(6, 6, 6, '2021-11-30', 1, 100.00),
(7, 7, 1, '2022-02-15', 1, 200.00),
(8, 1, 2, '2022-04-10', 1, 1200.00),
(9, 2, 3, '2022-06-20', 2, 600.00),
(10, 3, 4, '2022-08-05', 3, 450.00),
(11, 4, 5, '2022-10-11', 1, 800.00),
(12, 5, 6, '2022-12-29', 4, 1000.00);


-- 1. Select all columns from the Employees table.

SELECT * FROM employee_sales.employees;


-- 2. Select the first names of all employees.

SELECT first_name AS employees_first_name FROM employee_sales.employees;


-- 3. Select distinct departments from the Employees table.

SELECT DISTINCT department AS unique_department FROM employee_sales.employees;

-- 4.Select the total number of employees.

SELECT COUNT(*) AS total_number_of_employees FROM employee_sales.employees;

-- 5. Select the total salary paid to all employees.

SELECT SUM(salary) AS employees_salary FROM employee_sales.employees;

-- 6. Select the average salary of all employees.

SELECT AVG(salary) FROM employee_sales.employees;

-- 7. Select the highest salary in the Employees table.
SELECT MAX(salary) AS maximum_salary FROM employee_sales.employees;


-- 8. Select the lowest salary in the Employees table.

SELECT MIN(salary) AS minimum_salary FROM employee_sales.employees;

-- 9. Select the total number of male employees.
SELECT COUNT(*) AS male_employees FROM employee_sales.employees WHERE gender='Male';

-- 10. Select the total number of female employees.
SELECT COUNT(*) AS female_employees FROM employee_sales.employees WHERE gender='Female';

-- 11. Select the total number of employees hired in the year 2020.

SELECT   COUNT(employee_id) AS count_employees_in_2020, EXTRACT (YEAR FROM  hire_date) AS hired_in_2020
FROM employee_sales.employees
WHERE EXTRACT (YEAR FROM  hire_date ) = 2020
GROUP BY( hire_date );

-- 12. Select the average salary of employees in the 'IT' department.

SELECT AVG(salary) AS avs_it_department FROM employee_sales.employees WHERE department='IT';

-- 13. Select the number of employees in each department.

SELECT department, COUNT(*)
FROM employee_sales.employees
GROUP BY department;


-- 14. Select the total salary paid to employees in each department.


SELECT department, SUM(salary) 
FROM employee_sales.employees
GROUP BY department;

-- 15. Select the maximum salary in each department.
SELECT
    department,
    MAX(salary) AS max_salary
FROM
    employee_sales.employees
GROUP BY
    department;

-- 16. Select the minimum salary in each department.

SELECT
    department,
    MIN(salary) AS min_salary
FROM
    employee_sales.employees
GROUP BY
    department;

-- 17. Select the total number of employees, grouped by gender.

SELECT gender, COUNT(*) AS total_number_of_employees
FROM employee_sales.employees
GROUP BY gender;

-- 18. Select the average salary of employees, grouped by gender.
SELECT gender, AVG(salary) FROM employee_sales.employees
GROUP BY gender;

-- 19. Select the top 5 highest-paid employees.

SELECT salary
FROM employee_sales.employees
ORDER BY salary DESC
LIMIT 5;

-- 20. Select the total number of unique first names in the Employees table.

SELECT COUNT(DISTINCT "first_name")
FROM employee_sales.employees;

-- 21. Select all employees and their corresponding sales




-- 22. Select the first 10 employees hired, ordered by their HireDate.
SELECT *
FROM employee_sales.employees
ORDER BY hire_date
LIMIT 10;



-- 23. Select the employees who have not made any sales.

SELECT *
FROM employee_sales.employees
WHERE employee_id NOT IN(SELECT employee_id FROM employee_sales.sales);



-- 24. Select the total number of sales made by each employee.




-- 25. Select the employee who made the highest total sales.

-- 26. Select the average quantity of products sold by employees in each department.

-- 27. Select the total sales made by each employee in the year 2021.

-- 28. Select the top 3 employees with the most sales in terms of quantity.

-- 29. Select the total quantity of products sold by each department.

-- 30. Select the total revenue generated by sales of products in each category.


