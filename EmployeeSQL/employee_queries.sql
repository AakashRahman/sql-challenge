--Data Analysis and Queries

--select all table to see the data
SELECT * from departments;
SELECT * from dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no as "employee number", employees.last_name as "last name", employees.first_name as "first name", employees.sex, salaries.salary
from employees
inner join salaries on
employees.emp_no=salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date 
from employees where hire_date between '01/01/1986' and '01/01/1987';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select departments.dept_no as "department number", departments.dept_name as "department name", 
dept_manager.emp_no as "employee number",
employees.last_name as "last name", employees.first_name as "first name"
from departments 
inner join dept_manager on
departments.dept_no=dept_manager.dept_no
inner join employees on
dept_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_emp.emp_no as "employee number", 
		employees.last_name as "last name", employees.first_name as "first name",
		departments.dept_name as "department name"
	from dept_emp
	inner join employees on
	dept_emp.emp_no=employees.emp_no
	inner join departments on
	dept_emp.dept_no=departments.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name ='Hercules' and last_name like 'B%' ;

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_emp.emp_no as "employee number", 
		employees.last_name as "last name", employees.first_name as "first name",
		departments.dept_name as "department name"
	from dept_emp
	inner join employees on
	dept_emp.emp_no=employees.emp_no
	inner join departments on
	dept_emp.dept_no=departments.dept_no
	where departments.dept_name ='Sales';


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dept_emp.emp_no as "employee number", 
		employees.last_name as "last name", employees.first_name as "first name",
		departments.dept_name as "department name"
	from dept_emp
	inner join employees on
	dept_emp.emp_no=employees.emp_no
	inner join departments on
	dept_emp.dept_no=departments.dept_no
	where departments.dept_name='Sales'
	or departments.dept_name='Development'; 

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select employees.last_name, 
count(last_name) as "frequency"
from employees
group by last_name 
order by last_name desc;


