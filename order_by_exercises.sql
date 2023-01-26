USE employees;
SELECT * FROM employees;
SELECT first_name, last_name FROM employees WHERE first_name IN ('IRENA','Vidya','Maya') ORDER BY first_name; 
-- The first person in the rows was Irena Reutenauer. The last person is Vidya Simmen
SELECT first_name, last_name FROM employees WHERE first_name IN ('IRENA','Vidya','Maya') ORDER BY first_name ASC, last_name ASC; 
-- The first person in the row was Irena Action. THe last person is Vidya Zweizig.
SELECT first_name, last_name FROM employees WHERE first_name IN ('IRENA','Vidya','Maya') ORDER BY last_name ASC, first_name ASC;
-- The first person was Irena Action. The last was Maya Zyda. 
SELECT * FROM employees WHERE last_name LIKE '%E' AND last_name LIKE 'E%' ORDER BY emp_no ASC;
-- The first employee is Ramzi Erde. The last person is Tadahiro Erde. 
SELECT * FROM employees WHERE last_name LIKE '%E' AND last_name LIKE 'E%' ORDER BY hire_date DESC;
-- The first peron is Teiji Eldridge. The last is Sergi Erde
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%-12-25' ORDER BY hire_date DESC; 
SELECT count(*) FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '%-12-25' ORDER BY hire_date DESC; 
-- There are 362 employees who have been hired in the 90s who also have a birthday on Christmas. The newest employee is Khun Bernini. The oldest is Alselm Cappello

