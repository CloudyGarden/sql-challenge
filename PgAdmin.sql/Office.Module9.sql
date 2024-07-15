--1List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex, 
	s.salary
FROM
	employees e
	join salaries s on e.emp_no = s.emp_no
Order by
	e.last_name ASC,
	s.salary DESC;


--2List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	e.first_name,
	e.last_name,
	e.hire_date
FROM
	employees e
WHERE
	EXTRACT(YEAR FROM hire_date) = 1986;



--3List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name,
	t.title
FROM
    employees e
    JOIN dept_manager dm ON e.emp_no = dm.emp_no
    JOIN departments d ON dm.dept_no = d.dept_no
	JOIN titles t ON t.title = t.title
WHERE 
	t.title IN ('Manager');

--4List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	d.dept_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees e
	join departments d on d.dept_no = d.dept_no



--5List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM
	employees e
WHERE
	e.first_name = 'Hercules'
	and e.last_name like 'B%'
ORDER BY
	e.last_name ASC,
	e.first_name ASC;


--6List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees e
	join departments d on d.dept_no = d.dept_no
WHERE
	d.dept_name IN ('Sales');



--7List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees e
	join departments d on d.dept_no = d.dept_no
WHERE
	d.dept_name IN ('Sales', 'Development');

	
--8List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
	e.last_name,
	count(e.emp_no) as num_last_name
FROM
	employees e
GROUP BY
	e.last_name
ORDER BY
	num_last_name DESC;