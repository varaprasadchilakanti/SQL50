/*
===============================================================================
Q1378. Replace Employee ID With The Unique Identifier
-------------------------------------------------------------------------------
Problem:
  Return each employee’s unique_id (if available) alongside their name.
  If an employee does not have a unique_id, return NULL.

Schema:
  Employees(id INT PRIMARY KEY,
            name VARCHAR)

  EmployeeUNI(id INT,
              unique_id INT,
              PRIMARY KEY(id, unique_id))

Constraints:
  - Employees.id is unique.
  - EmployeeUNI may not contain all employee IDs.
  - Need LEFT JOIN to preserve all employees.

Design Principles:
  - Single Responsibility: Query maps employee IDs to unique IDs.
  - Declarative Style: Express intent clearly with JOIN.
  - Clean Architecture: Use LEFT JOIN to handle missing mappings.
  - Extensibility: Easy to adapt if more attributes are needed.

Edge Cases:
  - Employees without entry in EmployeeUNI → unique_id = NULL.
  - Employees with multiple unique_ids → all valid rows returned.
  - Empty tables → returns empty set.

Pseudocode:
  SELECT unique_id, name
  FROM Employees e
  LEFT JOIN EmployeeUNI u
    ON e.id = u.id;

===============================================================================
*/

-- PostgreSQL query solution
SELECT u.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI u
  ON e.id = u.id;
