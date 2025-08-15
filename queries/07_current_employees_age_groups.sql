/*
------------------------------------------------------------
Query: Current Employees Age and Age Groups
Author: zakaria
Description:
Groups current employees into predefined age ranges.
Age is calculated from birth_date using YEAR() difference.
------------------------------------------------------------
*/
WITH active_employees AS (
    SELECT emp_no
    FROM dept_emp
    WHERE to_date = '9999-01-01'
)
SELECT e.emp_no, e.first_name, e.last_name, 
		timestampdiff(YEAR, e.birth_date , '2003-01-01') age,
		CASE
			WHEN timestampdiff(YEAR, e.birth_date , '2003-01-01') < 25 THEN 'Under 25'
			WHEN timestampdiff(YEAR, e.birth_date , '2003-01-01') BETWEEN 25 AND 34 THEN '25-34' 
			WHEN timestampdiff(YEAR, e.birth_date , '2003-01-01') BETWEEN 35 AND 44 THEN '35-44' 
			WHEN timestampdiff(YEAR, e.birth_date , '2003-01-01') BETWEEN 45 AND 54 THEN '45-54'
			ELSE '+55'
		END age_group
FROM employees e 
JOIN active_employees ae ON ae.emp_no = e.emp_no
