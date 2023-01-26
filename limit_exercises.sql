USE employees;
SELECT * FROM employees;
-- Listed the first last names in descending order
SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;
-- Find the first 5 people hired in the 90s and born on chistmas limit by 5
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%-12-25' ORDER BY hire_date ASC LIMIT 5; 
-- The names of the employees are Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, and Petter Stroustrup. 
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%-12-25' ORDER BY hire_date ASC LIMIT 5 OFFSET 55; 
-- Limit is the number of rows you will see in a table. Offset is the number of rows skipped in the table before it gives the user the data.
