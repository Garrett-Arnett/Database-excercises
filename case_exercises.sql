-- 1. Write a query that returns all employees, their department number,  
-- their start date, their end date, and a new column 
-- 'is_current_employee' that is a 1 if the employee 
-- is still with the company and 0 if not.

use employees;

select 
	concat(first_name,' ', last_name) as 'Full Name', emp_no, dept_no, hire_date, to_date, 
		case when to_date > now() then '1' 
		else '0'
		end as 'is_current_employee'
from employees
join dept_emp using(emp_no)
join departments using(dept_no)
order by emp_no;


-- 2. Write a query that returns all employee names (previous and current), 
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' 
-- depending on the first letter of their last name.

select first_name, last_name, emp_no,
case substr(last_name, 1, 1)
	when 'a' then 'A-H'
    when 'b' then 'A-H'
    when 'c' then 'A-H'
    when 'd' then 'A-H'
    when 'e' then 'A-H'
    when 'f' then 'A-H'
    when 'g' then 'A-H'
    when 'h' then 'A-H'
    when 'i' then 'I-Q'
    when 'j' then 'I-Q'
    when 'k' then 'I-Q'
    when 'l' then 'I-Q'
    when 'm' then 'I-Q'
    when 'n' then 'I-Q'
    when 'o' then 'I-Q'
    when 'p' then 'I-Q'
    else 'R-Z'
    end as 'alpha_group'
from employees;


-- 3. How many employees (current or previous) were born in each decade?
    
    select birth_date from employees where birth_date like '197%';
    
select first_name, last_name, birth_date, 
    case
		when birth_date like '195%' then "50\'s baby"
        when birth_date like '196%' then "60\'s baby"
        else "young"
        end as 'decade_born'
from employees;


-- 4. What is the current average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?



use employees;


select * from departments;

SELECT
	case
		when dept_name in ('Research', 'Developement') then 'R&D'
        when dept_name in ('Sales', 'Marketing') then 'Sales & Marketing'
        when dept_name in ('Production', 'Quality Management') then 'Prod & M'
        when dept_name in ('Finance', 'Human Resourses') then 'Finance & HR'
        else 'Customer Service'
	end as dept_groups,
round(avg(salary), 2) as 'average_salary'
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no  and dept_emp.to_date > curdate()
join salaries on dept_emp.emp_no = salaries.emp_no and salaries.to_dae > curdate()
group by dept_groups;


-- review --


