/*
===============================================================================
Q1789. Primary Department for Each Employee
-------------------------------------------------------------------------------
Problem:
  For each employee, report their primary department.
    - If employee belongs to multiple departments → choose the one with primary_flag = 'Y'.
    - If employee belongs to only one department → report that department (even if primary_flag = 'N').

Schema:
  Employee(employee_id INT,
           department_id INT,
           primary_flag VARCHAR('Y','N'),
           PRIMARY KEY(employee_id, department_id))

Constraints:
  - Employees can belong to multiple departments.
  - primary_flag = 'Y' marks the chosen primary department.
  - If only one department exists for employee, primary_flag is 'N' but that department is still primary.

Design Principles:
  - Single Responsibility: Query isolates primary department per employee.
  - Declarative Style: Use filtering logic with UNION or OR condition.
  - Clean Architecture: Ensure correctness for both single‑department and multi‑department cases.
  - Extensibility: Easy to adapt for secondary departments or department counts.

Edge Cases:
  - Employee with one department → included even if flag = 'N'.
  - Employee with multiple departments but no 'Y' flag → not possible per problem statement.
  - Empty table → returns empty set.

Pseudocode:
  SELECT employee_id, department_id
  FROM Employee
  WHERE primary_flag = 'Y'
     OR employee_id IN (
          SELECT employee_id
          FROM Employee
          GROUP BY employee_id
          HAVING COUNT(*) = 1
     );

===============================================================================
*/

-- PostgreSQL query solution
SELECT employee_id,
       department_id
FROM Employee
WHERE primary_flag = 'Y'
   OR employee_id IN (
        SELECT employee_id
        FROM Employee
        GROUP BY employee_id
        HAVING COUNT(*) = 1
    );
