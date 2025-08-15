/*
------------------------------------------------------------
Query: Salary Growth — First vs Current
Author: Zakaria
Description:
Compares each employee's first salary to their current 
salary and calculates the growth percentage.
Uses CTEs for clarity.
------------------------------------------------------------
*/

WITH active_employees AS (
    SELECT emp_no
    FROM dept_emp
    WHERE to_date = '9999-01-01'
),
first_salary_date AS (
    SELECT s.emp_no, MIN(s.from_date) AS min_date
    FROM salaries s
    JOIN active_employees ae ON s.emp_no = ae.emp_no
    GROUP BY s.emp_no
),
first_salary_record AS (
    SELECT s.emp_no, s.salary, s.from_date
    FROM salaries s
    JOIN first_salary_date fsd ON s.emp_no = fsd.emp_no 
                               AND s.from_date = fsd.min_date
),
current_salary_record AS (
    SELECT s.emp_no, s.salary, s.from_date
    FROM salaries s
    JOIN active_employees ae ON s.emp_no = ae.emp_no
    WHERE s.to_date = '9999-01-01'
)
SELECT fsr.emp_no,
       CONCAT(e.first_name, ' ', e.last_name) AS emp_full_name,
       YEAR(fsr.from_date) AS first_year,
       fsr.salary AS first_year_salary,
       YEAR(csr.from_date) AS current_year,
       csr.salary AS current_year_salary,
       ROUND((csr.salary - fsr.salary) / fsr.salary * 100, 2) salary_growth_pct
FROM first_salary_record fsr
JOIN current_salary_record csr ON fsr.emp_no = csr.emp_no
JOIN employees e ON fsr.emp_no = e.emp_no;
