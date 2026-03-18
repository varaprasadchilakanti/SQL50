/*
===============================================================================
Q1204. Last Person to Fit in the Bus
-------------------------------------------------------------------------------
Problem:
  Find the last person who can board the bus without exceeding the total weight
  limit of 1000 kg.
    - People board in ascending order of `turn`.
    - Each person adds their weight to the cumulative total.
    - Stop when adding the next person would exceed 1000.
    - Return the person_name of the last valid boarder.

Schema:
  Queue(person_id INT PRIMARY KEY,
        person_name VARCHAR,
        weight INT,
        turn INT)

Constraints:
  - turn is unique and sequential from 1 to n.
  - First person always fits (guaranteed).
  - Only one person boards per turn.

Design Principles:
  - Single Responsibility: Query computes cumulative boarding weight.
  - Declarative Style: Use window function SUM() OVER (ORDER BY turn).
  - Clean Architecture: Filter rows where cumulative weight ≤ 1000, then take max turn.
  - Extensibility: Easy to adapt for different weight limits.

Edge Cases:
  - Exactly 1000 kg → last person included.
  - Exceeds 1000 → stop at previous person.
  - All people fit → last person overall.
  - Empty table → returns empty set.

Pseudocode:
  WITH boarding AS (
    SELECT person_id,
           person_name,
           turn,
           SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
    FROM Queue
  )
  SELECT person_name
  FROM boarding
  WHERE cumulative_weight <= 1000
  ORDER BY turn DESC
  LIMIT 1;

===============================================================================
*/

-- PostgreSQL query solution
WITH boarding AS (
    SELECT person_id,
           person_name,
           turn,
           SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
    FROM Queue
)
SELECT person_name
FROM boarding
WHERE cumulative_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
