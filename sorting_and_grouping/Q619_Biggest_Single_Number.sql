/*
===============================================================================
Q619. Biggest Single Number
-------------------------------------------------------------------------------
Problem:
  Find the largest "single number":
    - A single number is one that appears exactly once in the table.
    - If no single number exists, return NULL.

Schema:
  MyNumbers(num INT)

Constraints:
  - Table may contain duplicates.
  - No primary key defined.

Design Principles:
  - Single Responsibility: Query isolates single numbers and finds max.
  - Declarative Style: Use GROUP BY with HAVING COUNT(*) = 1.
  - Clean Architecture: Wrap aggregation in MAX() for largest single number.
  - Extensibility: Easy to adapt for smallest single number or frequency analysis.

Edge Cases:
  - Multiple single numbers → return the largest.
  - No single numbers → return NULL.
  - Empty table → return NULL.

Pseudocode:
  SELECT MAX(num) AS num
  FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
  ) singles;

===============================================================================
*/

-- PostgreSQL query solution
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) singles;
