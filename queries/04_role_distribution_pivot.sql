/*
------------------------------------------------------------
Query: Role Distribution Pivot
Author: Zakaria
Description:
Counts the number of current employees in each title 
(role) per department, using CASE for pivot-like output.
------------------------------------------------------------
*/
WITH current_employees_titles AS(
	SELECT emp_no, title
	FROM employees.titles
	WHERE to_date = '9999-01-01'
)
SELECT 
	d.dept_name,
	SUM(CASE WHEN cet.title = 'Staff' THEN 1 ELSE 0 END) Staff,
    SUM(CASE WHEN cet.title = 'Senior Staff' THEN 1 ELSE 0 END) Senior_Staff,
    SUM(CASE WHEN cet.title = 'Assistant Engineer' THEN 1 ELSE 0 END) Assistant_Engineer,
    SUM(CASE WHEN cet.title = 'Engineer' THEN 1 ELSE 0 END) Engineer,
    SUM(CASE WHEN cet.title = 'Senior Engineer' THEN 1 ELSE 0 END) Senior_Engineer,
    SUM(CASE WHEN cet.title = 'Technique Leader' THEN 1 ELSE 0 END) Technique_Leader,
    SUM(CASE WHEN cet.title = 'Manager' THEN 1 ELSE 0 END) Manager
FROM current_employees_titles cet
JOIN employees.dept_emp de ON cet.emp_no = de.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY d.dept_name ;
