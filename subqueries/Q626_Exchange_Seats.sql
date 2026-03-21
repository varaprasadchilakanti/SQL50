/*
===============================================================================
Q626. Exchange Seats
-------------------------------------------------------------------------------
Problem:
  Swap the seat id of every two consecutive students.
    - If number of students is odd, last student remains unchanged.
    - Return result ordered by id ascending.

Schema:
  Seat(id INT PRIMARY KEY,
       student VARCHAR)

Constraints:
  - id starts at 1 and increments continuously.
  - Must preserve ordering by id after swap.

Design Principles:
  - Single Responsibility: Query computes swapped seat assignments.
  - Declarative Style: Use CASE logic to adjust ids.
  - Clean Architecture: One SELECT with conditional transformation.
  - Extensibility: Can adapt for different swap sizes (pairs, triplets).

Edge Cases:
  - Odd number of students → last one unchanged.
  - Single student → unchanged.
  - Continuous id assumption is critical; otherwise, logic breaks.

Pseudocode:
  SELECT
    CASE
      WHEN id % 2 = 1 AND id + 1 <= max_id THEN id + 1
      WHEN id % 2 = 0 THEN id - 1
      ELSE id
    END AS id,
    student
  FROM Seat
  ORDER BY id;

===============================================================================
*/

-- PostgreSQL query solution
SELECT
  CASE
    WHEN id % 2 = 1 AND id + 1 <= (SELECT MAX(id) FROM Seat) THEN id + 1
    WHEN id % 2 = 0 THEN id - 1
    ELSE id
  END AS id,
  student
FROM Seat
ORDER BY id;
