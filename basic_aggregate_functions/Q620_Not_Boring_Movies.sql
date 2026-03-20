/*
===============================================================================
Q620. Not Boring Movies
-------------------------------------------------------------------------------
Problem:
  Report movies that satisfy:
    - Odd-numbered ID (id % 2 = 1).
    - description != 'boring'.
  Order results by rating descending.

Schema:
  Cinema(id INT PRIMARY KEY,
         movie VARCHAR,
         description VARCHAR,
         rating FLOAT)

Constraints:
  - rating is float with 2 decimals, range [0,10].
  - description may contain arbitrary text.

Design Principles:
  - Single Responsibility: Query filters by odd id and non-boring description.
  - Declarative Style: Use WHERE clause for filtering, ORDER BY for sorting.
  - Clean Architecture: No unnecessary joins or subqueries.
  - Extensibility: Easy to adjust filters (e.g., exclude other genres).

Edge Cases:
  - Movies with even id → excluded.
  - Movies with description exactly 'boring' (case-sensitive) → excluded.
  - No qualifying movies → returns empty set.

Pseudocode:
  SELECT *
  FROM Cinema
  WHERE id % 2 = 1
    AND description <> 'boring'
  ORDER BY rating DESC;

===============================================================================
*/

-- PostgreSQL query solution
SELECT *
FROM Cinema
WHERE id % 2 = 1
  AND description <> 'boring'
ORDER BY rating DESC;
