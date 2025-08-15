# SQL HR Analytics — Employees Database

This project contains SQL queries exploring HR analytics insights using the classic **MySQL Employees Sample Database**.

It demonstrates aggregation, window functions, CTEs, CASE statements, and stored procedures for real-world HR data analysis.

---

## Dataset
- **Source:** [MySQL Employees Sample Database](https://dev.mysql.com/doc/employee/en/)  
- **Tables used:** `employees`, `dept_emp`, `departments`, `salaries`, `titles`
- Simulates a mid-sized company's HR records from 1985–2002.

---

## Queries Overview

| # | Query Name | SQL Features Used |
|---|------------|-------------------|
| 1 | Current Headcount | Aggregation (`COUNT`) |
| 2 | Current Employees by Department | Aggregation + `GROUP BY` |
| 3 | Average Salary by Department | Aggregation + Filtering |
| 4 | Role Distribution Pivot | Conditional Aggregation (`CASE`) |
| 5 | Top Earners by Department | `RANK()` Window Function |
| 6 | Salary Growth: First vs Current | CTE + Date Aggregation + Calculated Column |
| 7 | Current Employees Age Groups | `CASE` + Date Functions |
| 8 | Stored Procedure: Top Earners by Department | Parameters + Sorting + LIMIT |

---

## Tools Used
- MySQL 8.0
- Window functions
- Aggregate functions
- Conditional logic
- Filtering

