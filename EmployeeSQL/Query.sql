-- 1. List of employee number, last name, first name, sex, and salary.

SELECT employees.emp_no,employees.first_name,employees.last_name,employees.sex,salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no=salaries.emp_no;

-- 2. List of first name, last name, and hire date for employees hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT (year FROM hire_date)=1986;

-- 3. List of each manager's department number, department name, employee number, last name, and first name.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- 4. List by departments, including employee number, last name, first name, and department name.

SELECT dept_emp.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM dept_emp
INNER JOIN departments
ON dept_emp.dept_no=departments.dept_no
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no;

-- 5. First name, last name, and sex for employees with first name "Hercules" and last name beginning with "B".

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List of all employees in the sales department, including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales';

-- 7. List of all employees in sales and development, including employee number, last name, first name, and department name.

SELECT dept_emp.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales' OR departments.dept_name='Development';

-- 8. List the frequency in which employees share a last name, in descending order.

SELECT employees.last_name, COUNT(employees.last_name)
FROM employees 
GROUP BY employees.last_name 
ORDER BY COUNT(employees.last_name) DESC;
