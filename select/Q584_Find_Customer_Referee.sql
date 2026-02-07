/*
===============================================================================
Q584. Find Customer Referee
-------------------------------------------------------------------------------
Problem:
  Return names of customers who are either:
    - Not referred by anyone (referee_id IS NULL).
    - Referred by a customer whose id != 2.

Schema:
  Customer(id INT PRIMARY KEY,
           name VARCHAR,
           referee_id INT)

Constraints:
  - id is unique.
  - referee_id may be NULL.

Design Principles:
  - Single Responsibility: Query filters only on referee_id conditions.
  - Declarative Style: Express intent clearly with WHERE clause.
  - Clean Architecture: No unnecessary joins or subqueries.
  - Extensibility: Easy to adapt if more exclusion rules are added.

Edge Cases:
  - Customers with referee_id = 2 → excluded.
  - Customers with referee_id IS NULL → included.
  - Empty table → returns empty set.
  - Multiple customers with same referee_id → all valid rows included.

Pseudocode:
  SELECT name
  FROM Customer
  WHERE referee_id IS NULL OR referee_id != 2;

===============================================================================
*/

-- PostgreSQL query solution
SELECT name
FROM Customer
WHERE referee_id IS NULL
   OR referee_id != 2;

