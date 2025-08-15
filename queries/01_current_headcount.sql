/*
------------------------------------------------------------
Query: Current Headcount
Author: Zakaria
Description:
Counts the total number of employees currently working 
in the company based on `to_date` being '9999-01-01' 
in the `dept_emp` table.
------------------------------------------------------------
*/
SELECT COUNT(*) AS current_headcount
FROM dept_emp
WHERE to_date = '9999-01-01';
