/*
===============================================================================
Q180. Consecutive Numbers
-------------------------------------------------------------------------------
Problem:
  Find all numbers that appear at least three times consecutively in the Logs table.
    - Consecutive means same num value across three sequential ids.
    - Output column: ConsecutiveNums.

Schema:
  Logs(id INT PRIMARY KEY AUTOINCREMENT,
       num VARCHAR)

Constraints:
  - id is strictly increasing (autoincrement).
  - Need to check consecutive rows by id ordering.

Design Principles:
  - Single Responsibility: Query detects consecutive triples.
  - Declarative Style: Use self-joins or window functions.
  - Clean Architecture: Simple join logic ensures clarity.
  - Extensibility: Can adapt for ≥N consecutive occurrences.

Edge Cases:
  - Numbers appearing twice consecutively → excluded.
  - Numbers appearing ≥3 consecutively → included once.
  - Empty table → returns empty set.

Pseudocode:
  SELECT DISTINCT l1.num AS ConsecutiveNums
  FROM Logs l1
  JOIN Logs l2 ON l1.id = l2.id - 1
  JOIN Logs l3 ON l2.id = l3.id - 1
  WHERE l1.num = l2.num
    AND l2.num = l3.num;

===============================================================================
*/

-- PostgreSQL query solution
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1
JOIN Logs l3 ON l2.id = l3.id - 1
WHERE l1.num = l2.num
  AND l2.num = l3.num;
