/*
------------------------------------------------------------
Query: Current Employees by Department
Author: Zakaria
Description:
Shows the number of current employees in each department.
Uses INNER JOIN between `dept_emp` and `departments`.
------------------------------------------------------------
*/
SELECT d.dept_name,
       COUNT(*) AS num_employees
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY num_employees DESC;
