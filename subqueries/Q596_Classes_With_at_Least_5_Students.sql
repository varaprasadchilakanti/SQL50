/*
===============================================================================
Q596. Classes With at Least 5 Students
-------------------------------------------------------------------------------
Problem:
  Identify all classes that have at least five students enrolled.

Schema:
  Courses(student VARCHAR,
          class   VARCHAR,
          PRIMARY KEY(student, class))

Constraints:
  - Each student-class pair is unique.
  - Need to count distinct students per class.

Design Principles:
  - Single Responsibility: Query computes student count per class.
  - Declarative Style: Use GROUP BY with HAVING.
  - Clean Architecture: No unnecessary joins or subqueries.
  - Extensibility: Easy to adjust threshold (e.g., ≥10 students).

Edge Cases:
  - Classes with fewer than 5 students → excluded.
  - Classes with exactly 5 students → included.
  - Empty table → returns empty set.

Pseudocode:
  SELECT class
  FROM Courses
  GROUP BY class
  HAVING COUNT(student) >= 5;

===============================================================================
*/

-- PostgreSQL query solution
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
