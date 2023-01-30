-- In your script, use DISTINCT to find the unique titles in the titles table. 
-- How many unique titles have there ever been? Answer that in a 
-- comment in your SQL file.

USE employees;

select distinct title from titles;

-- there are 7 distinct titles

-- Write a query to to find a list of all unique
-- last names of all employees that start and end with 'E' using GROUP BY.
select distinct last_name from employees where last_name like 'e%e' group by last_name;

-- Write a query to to find all unique combinations of first and 
-- last names of all employees whose last names start and end with 'E'.

select distinct last_name, first_name from employees where last_name like 'e%e' group by last_name, first_name;

-- Write a query to find the unique last names with a 'q' but not 'qu'.
-- Include those names in a comment in your sql code.

SELECT distinct last_name FROM employees WHERE last_name LIKE '%Q%' AND last_name NOT LIKE '%QU%';

-- the names are chleq, lindqvist, and qiwen

-- Add a COUNT() to your results (the query above) to find the number of 
-- employees with the same last name.

SELECT count(distinct last_name) FROM employees WHERE last_name LIKE '%Q%' AND last_name NOT LIKE '%QU%';

-- count is 3

-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and 
-- GROUP BY to find the number of employees for each gender with those names.

SELECT * FROM employees WHERE first_name = 'IRENA' OR first_name = 'Vidya' OR first_name = 'Maya';


select gender, count(gender) FROM employees WHERE first_name = 'IRENA' OR first_name = 'Vidya' OR first_name = 'Maya' group by gender;

-- Using your query that generates a username for all of the employees,
-- generate a count employees for each unique username.


select count(concat(left(lower(first_name), 1),left(lower(last_name), 4), '_', DATE_FORMAT(birth_date, "%m"), DATE_FORMAT(birth_date, "%y"))) as usernames from employees;
-- there are 300,024 usernames
select count(distinct concat(left(lower(first_name), 1),left(lower(last_name), 4), '_', DATE_FORMAT(birth_date, "%m"), DATE_FORMAT(birth_date, "%y"))) as distinct_usernames from employees;
-- there are 285,872 unique usernames. 

select concat(left(lower(first_name), 1),left(lower(last_name), 4), '_', DATE_FORMAT(birth_date, "%m"), DATE_FORMAT(birth_date, "%y"))as usernames, count(*) from employees group by usernames having count(*) > 1;

-- if you subtract total usernames from unique usernames, the total of duplixates is 13251 duplicate usernames


-- BONUS --



-- Determine the historic average salary for each employee. 
-- When you hear, read, or think "for each" with regard to SQL, 
-- you'll probably be grouping by that exact column.

select * from salaries; 

select emp_no, avg(salary) from salaries group by emp_no;

-- Using the dept_emp table, count how many current employees work in each department.
-- The query result should show 9 rows, one for each department and the employee count.


select dept_no, count(emp_no) from dept_emp group by dept_no having count(*) > 0;



select emp_no, count(salary) from salaries group by emp_no having count(*) > 0;

-- Find the maximum salary for each employee.

select emp_no, max(salary) from salaries group by emp_no;

-- Find the minimum salary for each employee.

select emp_no, min(salary) from salaries group by emp_no;

-- Find the standard deviation of salaries for each employee.

select emp_no, stddev(salary) from salaries group by emp_no;

-- Now find the max salary for each employee 
-- where that max salary is greater than $150,000.

SELECT 
    emp_no, MAX(salary)
FROM
    salaries
WHERE
    salary > 150000
GROUP BY emp_no;


-- Find the average salary for each employee where that average salary is between $80k and $90k.

