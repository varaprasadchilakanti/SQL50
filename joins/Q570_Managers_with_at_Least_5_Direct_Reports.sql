/*
===============================================================================
Q570. Managers with at Least 5 Direct Reports
-------------------------------------------------------------------------------
Problem:
  Find managers who have at least five direct reports.

Schema:
  Employee(id INT PRIMARY KEY,
           name VARCHAR,
           department VARCHAR,
           managerId INT)

Constraints:
  - managerId may be NULL (no manager).
  - No employee manages themselves.
  - Need to count direct reports per manager.

Design Principles:
  - Single Responsibility: Query counts direct reports.
  - Declarative Style: Use GROUP BY on managerId.
  - Clean Architecture: Join back to Employee table to get manager names.
  - Extensibility: Easy to adjust threshold (e.g., ≥10 reports).

Edge Cases:
  - Managers with fewer than 5 reports → excluded.
  - Employees with NULL managerId → not counted as reports.
  - Empty table → returns empty set.

Pseudocode:
  SELECT e.name
  FROM Employee e
  JOIN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
  ) AS mgr
    ON e.id = mgr.managerId;

===============================================================================
*/

-- PostgreSQL query solution
SELECT e.name
FROM Employee e
JOIN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) AS mgr
  ON e.id = mgr.managerId;
