/*
------------------------------------------------------------
Query: Top  3 Earners by Department
Author: Zakaria
Description:
Lists the top 3 highest-paid employees in each department 
using the RANK() window function.
------------------------------------------------------------
*/
SELECT dept_name, emp_no, salary, rank_in_dept
FROM (
    SELECT d.dept_name,
           s.emp_no,
           s.salary,
           RANK() OVER (PARTITION BY d.dept_name ORDER BY s.salary DESC) AS rank_in_dept
    FROM salaries s
    JOIN dept_emp de ON s.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
    WHERE s.to_date = '9999-01-01'
      AND de.to_date = '9999-01-01'
) ranked
WHERE rank_in_dept <= 3;
