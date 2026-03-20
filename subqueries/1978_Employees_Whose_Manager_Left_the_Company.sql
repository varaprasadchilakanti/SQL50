/*
===============================================================================
Q1978. Employees Whose Manager Left the Company
-------------------------------------------------------------------------------
Problem:
  Find employees who meet BOTH conditions:
    1. Salary < 30000
    2. Their manager_id does not exist in Employees table (manager left)

Schema:
  Employees(employee_id INT PRIMARY KEY,
            name VARCHAR,
            manager_id INT,
            salary INT)

Constraints:
  - manager_id may be NULL (no manager).
  - If a manager leaves, their row is deleted, but reports still reference them.

Design Principles:
  - Single Responsibility: Query identifies employees with missing managers.
  - Declarative Style: Use LEFT JOIN to detect missing manager rows.
  - Clean Architecture: Filter by salary and missing manager simultaneously.
  - Extensibility: Can adapt to other salary thresholds or conditions.

Edge Cases:
  - Employees with NULL manager_id → excluded (not considered "manager left").
  - Employees with salary ≥ 30000 → excluded.
  - Employees whose manager still exists → excluded.
  - Empty table → returns empty set.

Pseudocode:
  SELECT e.employee_id
  FROM Employees e
  LEFT JOIN Employees m ON e.manager_id = m.employee_id
  WHERE e.salary < 30000
    AND e.manager_id IS NOT NULL
    AND m.employee_id IS NULL
  ORDER BY e.employee_id;

===============================================================================
*/

-- PostgreSQL query solution
SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees m
  ON e.manager_id = m.employee_id
WHERE e.salary < 30000
  AND e.manager_id IS NOT NULL
  AND m.employee_id IS NULL
ORDER BY e.employee_id;
