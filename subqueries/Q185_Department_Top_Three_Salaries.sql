/*
===============================================================================
Q185. Department Top Three Salaries
-------------------------------------------------------------------------------
Problem:
  Find employees who are high earners in each department.
    - High earners = employees whose salary is in the top 3 unique salaries
      for their department.
    - Return Department name, Employee name, and Salary.

Schema:
  Employee(id INT PRIMARY KEY,
           name VARCHAR,
           salary INT,
           departmentId INT REFERENCES Department(id))
  Department(id INT PRIMARY KEY,
             name VARCHAR)

Constraints:
  - Each employee belongs to exactly one department.
  - Salaries may repeat; duplicates count toward the same rank.
  - Need top 3 *unique* salaries per department.

Design Principles:
  - Single Responsibility: Query isolates top 3 salaries per department.
  - Declarative Style: Use window functions for ranking.
  - Clean Architecture: CTEs separate ranking logic from final join.
  - Extensibility: Easy to adjust for top N salaries.

Edge Cases:
  - Departments with fewer than 3 unique salaries → return all available.
  - Multiple employees with same salary → all included.
  - No employees in department → excluded.

Pseudocode:
  1. Join Employee with Department for context.
  2. Use DENSE_RANK() partitioned by departmentId, ordered by salary DESC.
  3. Filter ranks ≤ 3.
  4. Return Department name, Employee name, Salary.

===============================================================================
*/

-- PostgreSQL query solution
WITH ranked AS (
    SELECT e.id,
           e.name AS employee,
           e.salary,
           d.name AS department,
           DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
)
SELECT department,
       employee,
       salary
FROM ranked
WHERE rnk <= 3;
