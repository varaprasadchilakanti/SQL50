/*
===============================================================================
Q1731. The Number of Employees Which Report to Each Employee
-------------------------------------------------------------------------------
Problem:
  For each manager (employee with ≥1 direct report), compute:
    - employee_id and name of the manager.
    - reports_count = number of employees who report directly.
    - average_age = average age of those reports, rounded to nearest integer.

Schema:
  Employees(employee_id INT PRIMARY KEY,
            name VARCHAR,
            reports_to INT,
            age INT)

Constraints:
  - reports_to may be NULL (no manager).
  - Need to identify managers as those appearing in reports_to.
  - Round average age to nearest integer.

Design Principles:
  - Single Responsibility: Query computes direct reports count and average age.
  - Declarative Style: Self‑join Employees table.
  - Clean Architecture: GROUP BY manager_id, manager_name.
  - Extensibility: Easy to add min/max age or other metrics.

Edge Cases:
  - Employees with no reports → excluded.
  - Managers with one report → average_age = that report’s age.
  - Empty table → returns empty set.

Pseudocode:
  SELECT m.employee_id,
         m.name,
         COUNT(r.employee_id) AS reports_count,
         ROUND(AVG(r.age)) AS average_age
  FROM Employees m
  JOIN Employees r
    ON r.reports_to = m.employee_id
  GROUP BY m.employee_id, m.name
  ORDER BY m.employee_id;

===============================================================================
*/

-- PostgreSQL query solution
SELECT m.employee_id,
       m.name,
       COUNT(r.employee_id) AS reports_count,
       ROUND(AVG(r.age)) AS average_age
FROM Employees m
JOIN Employees r
  ON r.reports_to = m.employee_id
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;
