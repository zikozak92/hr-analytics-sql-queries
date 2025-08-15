/*
------------------------------------------------------------
Stored Procedure: Get Top N Earners by Department
Author: Zakaria
Description:
Creates a stored procedure that accepts a department name 
and a number N, returning the top N highest-paid employees 
in that department.
------------------------------------------------------------
*/
DELIMITER $$

CREATE PROCEDURE get_top_earners_by_department(
    IN deptName VARCHAR(40),
    IN topN INT
)
BEGIN
    SELECT e.emp_no,
           e.first_name,
           e.last_name,
           s.salary
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
    WHERE d.dept_name = deptName
      AND s.to_date = '9999-01-01'
      AND de.to_date = '9999-01-01'
    ORDER BY s.salary DESC
    LIMIT topN;
END$$

DELIMITER ;

# CALL get_top_earners_by_department('Customer Service', 10);