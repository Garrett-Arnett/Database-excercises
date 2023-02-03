-- 1. Using the example from the lesson, create a temporary table called 
-- employees_with_departments that contains first_name, last_name, and dept_name 
-- for employees currently with that department. Be absolutely sure to create this 
-- table on your own database. If you see "Access denied for user ...", it means that 
-- the query was attempting to write a new table to a database that you can only read.

-- a. Add a column named full_name to this table. It should be a VARCHAR 
-- whose length is the sum of the lengths of the first name and last name columns.
-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.


use employees;

SELECT first_name, last_name, dept_name
	FROM employees
	JOIN dept_emp USING(emp_no)
	JOIN departments USING(dept_no);
    
    
CREATE TEMPORARY TABLE oneil_2096.employees_with_departments AS
	(SELECT first_name, last_name, dept_name
	FROM employees
	JOIN dept_emp USING(emp_no)
	JOIN departments USING(dept_no)
);

select * from oneil_2096.employees_with_departments;

use oneil_2096;

alter table employees_with_departments
add full_name varchar(50);

-- b. Update the table so that the full_name column contains the correct data.
update employees_with_departments
set full_name = concat(first_name,' ',last_name);

-- c. Remove the first_name and last_name columns from the table.

alter table employees_with_departments
drop column first_name;

alter table employees_with_departments
drop column last_name;

select * from oneil_2096.employees_with_departments;


-- d. What is another way you could have ended up with this same table?

-- answer: yes there is a why. you have to buld the table the way you want 
-- from the beginning to save you plenty steps



-- 2. Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column such that
-- it is stored as an integer representing the number of cents of the payment.
-- For example, 1.99 should become 199.


use oneil_2096;
show tables;

CREATE TEMPORARY TABLE sakila_payment AS
    (SELECT * 
    FROM sakila.payment);
    
select * from sakila_payment;

alter table sakila_payment
add New_Amount int;

select * from sakila_payment;

update sakila_payment
set New_amount = amount * 100;

select * from sakila_payment;

alter table sakila_payment
drop column amount;

select * from sakila_payment;

-- 3. Find out how the current average pay in each department 
-- compares to the overall current pay for everyone at the company. 
-- For this comparison, you will calculate the z-score for each salary. 
-- In terms of salary, what is the best department right now to work for? The worst?

use employees;

-- current pay for all employees

SELECT
    CONCAT(employees.first_name, ' ', employees.last_name),
    salaries.emp_no, departments.dept_no, departments.dept_name,
    salaries.salary
FROM salaries
	JOIN dept_emp
		ON salaries.emp_no = dept_emp.emp_no
	JOIN employees
		ON salaries.emp_no = employees.emp_no
	JOIN departments
		ON dept_emp.dept_no = departments.dept_no
	where dept_emp.to_date > now()
    and salaries.to_date > now()
;


-- average current salary for the departments
SELECT round(avg(salaries.salary), 2) as "avg_curr_salary", departments.dept_name
FROM employees.salaries
	JOIN employees.dept_emp 
		USING(emp_no)
	join employees.departments 
		using(dept_no)
where employees.salaries.to_date > curdate()
group by dept_name;
        
-- z score
SELECT salary,
        (salary - (SELECT AVG(salary) FROM salaries where to_date > now()))
        /
        (SELECT stddev(salary) FROM salaries where to_date > now()) AS zscore
    FROM salaries
    WHERE to_date > now();
        
        
        -- average history
SELECT round(avg(salaries.salary), 2) as "avg_hist_salary", departments.dept_name
FROM employees.salaries
	JOIN employees.dept_emp
		USING(emp_no)
	join employees.departments 
		using(dept_no)
group by dept_name;