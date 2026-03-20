/*
===============================================================================
Q595. Big Countries
-------------------------------------------------------------------------------
Problem:
  Return the name, population, and area of countries that are considered "big":
    - area >= 3,000,000 km²
    OR
    - population >= 25,000,000

Schema:
  World(name VARCHAR PRIMARY KEY,
        continent VARCHAR,
        area INT,
        population INT,
        gdp BIGINT)

Constraints:
  - name is unique.
  - area and population are integers.
  - gdp is not relevant for this query.

Design Principles:
  - Single Responsibility: Query filters only on area and population thresholds.
  - Declarative Style: Express intent clearly with WHERE clause.
  - Clean Architecture: No unnecessary joins or subqueries.
  - Extensibility: Thresholds can be parameterized if needed.

Edge Cases:
  - Countries meeting both conditions → included once.
  - Countries meeting neither condition → excluded.
  - Empty table → returns empty set.
  - Large dataset → simple predicate scan, efficient with indexes.

Pseudocode:
  SELECT name, population, area
  FROM World
  WHERE area >= 3000000 OR population >= 25000000;

===============================================================================
*/

-- PostgreSQL query solution
SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
