/*
===============================================================================
Q197. Rising Temperature
-------------------------------------------------------------------------------
Problem:
  Find all dates' IDs where the temperature is higher than the previous day.

Schema:
  Weather(id INT PRIMARY KEY,
          recordDate DATE,
          temperature INT)

Constraints:
  - id is unique.
  - recordDate is unique (no duplicates).
  - Need to compare each day’s temperature with the prior day.

Design Principles:
  - Single Responsibility: Query compares consecutive days’ temperatures.
  - Declarative Style: Use self‑join on recordDate offset by 1 day.
  - Clean Architecture: No unnecessary subqueries; direct join.
  - Extensibility: Can adapt to other comparisons (e.g., week‑over‑week).

Edge Cases:
  - First record (no prior day) → excluded.
  - Non‑consecutive dates → only exact one‑day differences considered.
  - Empty table → returns empty set.

Pseudocode:
  SELECT w1.id
  FROM Weather w1
  JOIN Weather w2
    ON w1.recordDate = w2.recordDate + INTERVAL '1 day'
  WHERE w1.temperature > w2.temperature;

===============================================================================
*/

-- PostgreSQL query solution
SELECT w1.id
FROM Weather w1
JOIN Weather w2
  ON w1.recordDate = w2.recordDate + INTERVAL '1 day'
WHERE w1.temperature > w2.temperature;
