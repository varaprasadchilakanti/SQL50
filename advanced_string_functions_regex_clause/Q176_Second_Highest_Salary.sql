/*
===============================================================================
Q176. Second Highest Salary
-------------------------------------------------------------------------------
Problem:
  Find the second highest distinct salary from Employee table.
    - If no second highest exists, return NULL.

Schema:
  Employee(id INT PRIMARY KEY,
           salary INT)

Constraints:
  - Salaries may repeat.
  - Must consider distinct salaries only.
  - Return column name as "SecondHighestSalary".

Design Principles:
  - Single Responsibility: Query isolates second highest salary.
  - Declarative Style: Use DISTINCT + ORDER BY with LIMIT/OFFSET.
  - Clean Architecture: Subquery for ranking, outer query for result.
  - Extensibility: Can adapt for Nth highest salary.

Edge Cases:
  - Only one distinct salary → return NULL.
  - Empty table → return NULL.
  - Multiple employees with same salary → distinct ensures uniqueness.

Pseudocode:
  SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    OFFSET 1 LIMIT 1
  ) AS SecondHighestSalary;

===============================================================================
*/

-- PostgreSQL query solution
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    OFFSET 1 LIMIT 1
) AS SecondHighestSalary;
