USE employees;
SELECT * FROM employees;
SELECT Count(*) FROM employees WHERE first_name IN ('IRENA','Vidya','Maya');
-- There are 709 people with those first names
SELECT Count(*) FROM employees WHERE first_name = 'IRENA' OR first_name = 'Vidya' OR first_name = 'Maya';
-- When using OR. 709 employees pop up.alter
SELECT Count(*) FROM employees WHERE gender = 'M' AND (first_name = 'IRENA' OR first_name = 'Vidya' OR first_name = 'Maya');
-- There are 441 employees that match the statement above.
SELECT Count(*) FROM employees WHERE last_name LIKE 'E%';
-- There are 7330 current/previous employees that have a last name staring with the letter e;
SELECT Count(*) FROM employees WHERE last_name LIKE '%E' and last_name NOT LIKE 'E%';
SELECT Count(*) FROM employees WHERE last_name LIKE '%E' or last_name LIKE 'E%';
-- There are 30723 employees with a last name that starts or ends with e. THere are 23390 with employees name who do not start with e and but end with an e;
SELECT Count(*) FROM employees WHERE last_name LIKE '%E' AND last_name LIKE 'E%';
SELECT Count(*) FROM employees WHERE last_name LIKE '%E';
-- There are 899 employees who start and end with an e. There are 24292 employees whose last names end with the letter execute
SELECT Count(*) FROM employees where hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- There are 135214 employees that where hired in the 90s.
Select Count(*) FROM employees where birth_date LIKE '%-12-25';
-- There are 842 employees who were born on Christmas
SELECT count(*) FROM employees WHERE last_name LIKE '%Q%';
-- There are 1873 poeple with a q in thier last name
SELECT count(*) FROM employees WHERE last_name LIKE '%Q%' AND last_name NOT LIKE '%QU%';
-- There are 547 employees with a q in there name and with a u not imediatly following the q
