USE employees;
SHOW tables;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE salaries;
DESCRIBE titles;
-- Which table(s) do you think contain a numeric type column?  I believe the employees, salaries table will contain numeric values;
-- Which table(s) do you think contain a string type column? I believe the tables with a string type column will be departments, and titles;
-- Which table(s) do you think contain a date type column? I believe the tables that show date columns are dept_emp, dept_manager_employees, employees, salaries and titles;
-- What is the relationship between the employees and the departments tables? The employees have an employee number. You can use this to track back to see which department they work in the dept_emp table. Once you find the dept number, you can then search it in the departments table.;
DESCRIBE dept_manager;
-- test