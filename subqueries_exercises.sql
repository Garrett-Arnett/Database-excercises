USE employees;

-- Find all the current employees with the same hire 
-- date as employee 101010 using a subquery.

-- 1. Find all the current employees with the same hire date as employee 101010 using a subquery.

select hire_date from employees
where emp_no = '101010';

select * from employees	
	join dept_emp
		using(emp_no)
        where to_date > now()
        and hire_date = (select hire_date from employees
where emp_no = '101010');



-- 2. Find all the titles ever held by all current employees with the first name Aamod.

Select first_name, title
from employees
	join dept_emp 
		using(emp_no)
	join titles 
		using(emp_no)
where first_name in ( 
		select first_name 
		from employees
        join dept_emp
			using(emp_no)
		where first_name = "Aamod"
		AND dept_emp.to_date > curdate())
group by title;

-- review

select emp_no 
from employees 
where first_name = 'aamod';



select distinct title from dept_emp
	join titles
	using(emp_no)
where dept_emp.to_date > now()
and emp_no in (
	select emp_no 
	from employees 
	where first_name = 'aamod');



-- 3. How many people in the employees table are no longer working for the company? 
-- Give the answer in a comment in your code.


select * from dept_emp
where to_date > now();

select count(emp_no) 
from employees 
where emp_no not in 
	(
	select emp_no from dept_emp
	where to_date > now())	
;







-- 4. Find all the current department managers that are female.
--  List their names in a comment in your code.


select first_name, last_name, emp_no from employees
	join dept_manager
		using(emp_no)
	where gender = 'f';
	
SELECT departments.dept_name, 
CONCAT(employees.first_name, ' ', employees.last_name) AS full_name
FROM departments
	JOIN dept_manager 
		USING (dept_no)
	JOIN employees
		USING (emp_no)
WHERE to_date > NOW()
AND gender = 'F';


-- review

select *
from dept_manager
where to_date > now();

select * from employees
where gender = 'f'
and emp_no in (select emp_no
from dept_manager
where to_date > now())
;

-- results are Isamu Legleitner, Karsten Stigstam, Leon DasSarma, and Hilary Kambil


-- 5. Find all the employees who currently have a higher salary 
-- than the companies overall, historical average salary.

select avg(salary) from salaries; -- first query

select first_name, last_name, salary from employees -- first two queried combines
	join salaries
		using(emp_no)
where salary > (select avg(salary) from salaries)
and to_date > now()
order by salary;

select count(salary) 
from 
	(select first_name, last_name, salary from employees -- three queries combined 
		join salaries
			using(emp_no)
where salary > (select avg(salary) from salaries)
and to_date > now()
order by salary) as High_salary;
-- there are 154543 employees with a higher salary than average.


-- review

select avg(salary) 
from salaries;


select count(*)
from salaries
	join employees
		using(emp_no)
where to_date > now()
and salary > (select avg(salary) 
	from salaries)
    order by salary;








-- 6. How many current salaries are within 1 standard deviation 
-- of the current highest salary? (Hint: you can use a built in. 
-- function to calculate the standard deviation.) 
-- What percentage of all salaries is this?

Select max(salary) - STDDEV(salary)
from salaries
Where to_date > curdate();

 Select count(salary)
 from salaries
 where salary > (
 		Select 
 		max(salary) - STDDEV(salary)
 		from salaries
 	    Where to_date > curdate())
 AND salaries.to_date > curdate();
 
 
 -- review--
 
 
 
 
 
 -- there are 83 salaries within the standard deviation of the highest salary
 
 
 
 select
 (Select count(salary)
 from salaries 
 where salary > (
 		Select 
 		max(salary) - STDDEV(salary)
 		from salaries
 	    Where to_date > curdate())
 AND to_date > curdate())
 /
 (select
 count(salary)
 from salaries
 Where to_date > curdate())
 *100;
 
 -- this is .0346 % of the salaries
 
 
 
 
 -- BONUS --
 
-- 1. Find all the department names that currently have female managers.

SELECT departments.dept_name, gender,
CONCAT(employees.first_name, ' ', employees.last_name) AS full_name
FROM departments
	JOIN dept_manager 
		USING (dept_no)
	JOIN employees
		USING (emp_no)
WHERE to_date > NOW()
AND gender = 'F';

-- the departments are finance, human recources, development, and research



select first_name, last_name, salary from employees 
	join salaries
		using(emp_no)
where to_date > now()
order by salary desc
limit 1;

-- Tokuyasu Pesch has the highest salary of $158,220


-- 3. Find the department name that the employee with the highest salary works in







select Max(salary) from salaries; 


select emp_no
			from salaries
			where salary in (
					select Max(salary)
					from salaries);

select dept_no
	from dept_emp
	where dept_emp.to_date > curdate() 
	and emp_no in (
			select emp_no
			from salaries
			where salary in (
					select Max(salary)
					from salaries
					where salaries.to_date > curdate()));


select dept_name, first_name, last_name, salary
from departments
	join dept_emp 
		using(dept_no)
	join employees
		using(emp_no)
	join salaries 
		using (emp_no)
where dept_no in (
	select dept_no
	from dept_emp
	where dept_emp.to_date > curdate() 
	and emp_no in (
			select emp_no
			from salaries
			where salary in (
					select Max(salary)
					from salaries
					where salaries.to_date > curdate())))
Order by salary DESC
limit 1;
