/*
===============================================================================
Q610. Triangle Judgement
-------------------------------------------------------------------------------
Problem:
  For each row (x, y, z), determine if the three line segments can form a valid triangle.
    - Triangle inequality: sum of any two sides > third side.
    - Output: x, y, z, triangle ('Yes' or 'No').

Schema:
  Triangle(x INT,
           y INT,
           z INT,
           PRIMARY KEY(x, y, z))

Constraints:
  - Each row is unique.
  - Need to apply triangle inequality checks.

Design Principles:
  - Single Responsibility: Query evaluates triangle validity.
  - Declarative Style: Use CASE expression for conditional output.
  - Clean Architecture: No joins or subqueries needed.
  - Extensibility: Can adapt to classify triangle type (equilateral, isosceles, scalene).

Edge Cases:
  - Degenerate triangle (sum of two sides = third) → 'No'.
  - Negative or zero values → always 'No'.
  - Empty table → returns empty set.

Pseudocode:
  SELECT x, y, z,
         CASE WHEN x + y > z
               AND x + z > y
               AND y + z > x
              THEN 'Yes'
              ELSE 'No'
         END AS triangle
  FROM Triangle;

===============================================================================
*/

-- PostgreSQL query solution
SELECT x,
       y,
       z,
       CASE
         WHEN x + y > z
          AND x + z > y
          AND y + z > x
         THEN 'Yes'
         ELSE 'No'
       END AS triangle
FROM Triangle;
