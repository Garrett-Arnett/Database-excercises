USE employees;

-- Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.

select first_name,last_name, concat(first_name,last_name) as full_name from employees where last_name like '%E%';

-- Convert the names produced in your last query to all uppercase.

select upper(first_name),upper(last_name), upper(concat(first_name,last_name)) as full_name from employees where last_name like '%E%';

-- Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),

SELECT *, datediff(now(), hire_date) as days_worked FROM employees where hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%-12-25';

-- Find the smallest and largest current salary from the salaries table.

select min(salary), max(salary) from salaries; 

-- Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

select concat(left(lower(first_name), 1),left(lower(last_name), 4), '_', DATE_FORMAT(birth_date, "%m"), DATE_FORMAT(birth_date, "%y")) as username, first_name, last_name, birth_date from employees;
