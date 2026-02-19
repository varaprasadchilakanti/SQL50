/*
===============================================================================
Q577. Employee Bonus
-------------------------------------------------------------------------------
Problem:
  Report the name and bonus of each employee who satisfies either:
    - Bonus < 1000
    - No bonus assigned (NULL)

Schema:
  Employee(empId INT PRIMARY KEY,
           name VARCHAR,
           supervisor INT,
           salary INT)

  Bonus(empId INT PRIMARY KEY,
        bonus INT,
        FOREIGN KEY(empId) REFERENCES Employee(empId))

Constraints:
  - Every employee may or may not have a bonus record.
  - Need to include employees without bonus (NULL).

Design Principles:
  - Single Responsibility: Query maps employees to bonuses.
  - Declarative Style: Use LEFT JOIN to preserve all employees.
  - Clean Architecture: Filter with NULL check or threshold.
  - Extensibility: Easy to adapt if bonus rules change.

Edge Cases:
  - Employees with no bonus → included with NULL.
  - Employees with bonus exactly 1000 → excluded.
  - Employees with multiple bonus records → not possible (empId unique).
  - Empty tables → returns empty set.

Pseudocode:
  SELECT e.name, b.bonus
  FROM Employee e
  LEFT JOIN Bonus b
    ON e.empId = b.empId
  WHERE b.bonus < 1000 OR b.bonus IS NULL;

===============================================================================
*/

-- PostgreSQL query solution
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
  ON e.empId = b.empId
WHERE b.bonus < 1000
   OR b.bonus IS NULL;
