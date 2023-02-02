-- Use the join_example_db. Select all the records 
-- from both the users and roles tables.

USE join_example_db;


-- Use join, left join, and right join to combine results from 
-- the users and roles tables as we did in the lesson. 
-- Before you run each query, guess the expected number of results.

select * from users
join roles on users.role_id = roles.id;

select * from users
left join roles on users.role_id = roles.id;

select * from users
right join roles on users.role_id = roles.id;

-- Although not explicitly covered in the lesson, aggregate functions 
-- like count can be used with join queries. Use count and the 
-- appropriate join type to get a list of roles along with the number 
-- of users that has the role. 
-- Hint: You will also need to use group by in the query.

select roles.name, count(users.name) as number_of_users
from users
right join roles on roles.id = users.role_id
group by name;

-- Use the employees database.

USE employees;

-- Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along with the name of 
-- the current manager for that department.

select dept_name as "Department Name", concat(first_name, " " ,last_name) as "Department Manager"
from departments
join dept_manager on dept_manager.dept_no = departments.dept_no
join employees on employees.emp_no = dept_manager.emp_no
where dept_manager.to_date > curdate()
order by dept_name;

-- review
-- join = inner join

select dept.dept_name, concat(emp.first_name,' ',emp.last_name) as emp_name
from departments as dept
	join dept_manager as dm
		using (dept_no)
	join employees as emp
		using (emp_no)
where to_date > Now();

-- Find the name of all departments managed by women

select dept_name as "Department Name", Concat(first_name," ",last_name) as "Department Manager"
from departments
join dept_manager on dept_manager.dept_no = departments.dept_no
join employees on employees.emp_no = dept_manager.emp_no
where gender like "f"
and dept_manager.to_date > curdate()
order by dept_name;

-- review

select departments.dept_name,
concat(employees.first_name,' ', employees.last_name) as full_name
from departments
	join dept_manager 
		using (dept_no)
	join employees
		using (emp_no)
where to_date > now()
and gender = 'f'
order by dept_name;


-- Find the current titles of employees currently working in the 
-- Customer Service department.

Select title, count(title) as Count
	From titles
		join employees 
			using(emp_no)
		join dept_emp 
			on employees.emp_no = dept_emp.emp_no
		join departments 
			on departments.dept_no = dept_emp.dept_no
Where dept_emp.to_date > curdate()
	AND titles.to_date > curdate()
	AND dept_name Like "customer service"
group by title
order by title;

-- or 

select title, count(*)
from titles
join dept_emp on titles.emp_no = dept_emp.dept_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_emp.to_date > now()
and titles.to_date > now()
and dept_name = 'Customer Service'
group by title;

-- Find the current salary of all current managers.

Select dept_name as "Department Name", concat(first_name," ", last_name) as 'Full Name', salary as Salary
from salaries
	Join employees 
		using(emp_no)
	Join dept_manager 
		using(emp_no)
	Join departments 
		using(dept_no)
Where salaries.to_date > curdate()
And dept_manager.to_date > curdate()
Order By dept_name;

-- review

select first_name, last_name, salary
from dept_manager as dm
	join salaries as s
		using (emp_no)
	join employees
		using (emp_no)
where dm.to_date > now()
and s.to_date > Now();

-- Find the number of current employees in each department.

select dept_no, dept_name, count(emp_no)
from dept_emp
join departments using(dept_no)
where dept_emp.to_date > curdate()
group by dept_no
order by dept_no;

-- review

select dept_no, dept_name, count(*) num_employees
from employees
	join dept_emp de
		using (emp_no)
	join departments
		using (dept_no)
where de.to_date > now()
group by dept_no;

-- Which department has the highest average salary? Hint: Use current not historic information.

Select dept_name, avg(salary) as "average salary"
from salaries
	join dept_emp 
		using(emp_no)
	join departments 
		using(dept_no)
Where salaries.to_date > curdate()
And dept_emp.to_date > curdate()
group by dept_name
Order by avg(salary) DESC
Limit 1;

-- review

select dept_name, avg(salary) as avg_sal
from salaries s
	join dept_emp de
		using (emp_no)
	join departments 
		using (dept_no)
where de.to_date > now()
and s.to_date > now()
group by dept_name
order by avg_sal desc
limit 1;       
-- Who is the highest paid employee in the Marketing department?

Select first_name, last_name, salary
from employees 
	join salaries 
		using(emp_no)
	join dept_emp 
		using(emp_no)
	join departments 
		using(dept_no)
Where dept_name = "marketing"
and salaries.to_date > curdate()
Order by salary DESC
Limit 1;

-- review

select first_name, last_name, salary, dept_name
from employees e
	join dept_emp de
		using (emp_no)
	join departments d
		using (dept_no)
	join salaries s
		using (emp_no)
where dept_name = 'Marketing'
and de.to_date > NOW()
and s.to_date > NOW()
order by salary desc
limit 1;
-- Which current department manager has the highest salary?

Select first_name, last_name, salary, dept_name
from salaries
join employees using(emp_no)
join dept_manager using(emp_no)
join departments using(dept_no)
Where dept_manager.to_date > curdate()
and salaries.to_date > curdate()
Order by salary desc
limit 1;

-- review

select first_name, last_name, salary, dept_name
from dept_manager dm
	join employees
		using (emp_no)
	join salaries s
		using (emp_no)
	join departments
		Using (dept_no)
where dm.to_date > NOW()
and s.to_date > now()
order by salary desc
limit 1;

-- Determine the average salary for each department. Use all salary information and round your results.


Select dept_name, round(avg(salaries.salary)) as "average_salary"
from departments
Join dept_emp on dept_emp.dept_no = departments.dept_no
Join salaries on dept_emp.emp_no = salaries.emp_no
group by dept_name
Order By average_salary desc;

-- review

select dept_name, round(avg(salary), 0) as average_salary
from salaries
	join dept_emp
		using (emp_no)
	join departments
		using (dept_no)
group by dept_name;

-- Bonus Find the names of all current employees, their department name, and their current manager's name.

-- Bonus Who is the highest paid employee within each department.



select * from employees;


