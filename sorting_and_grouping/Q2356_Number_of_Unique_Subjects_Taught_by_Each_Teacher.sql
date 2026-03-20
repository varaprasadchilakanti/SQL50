/*
===============================================================================
Q2356. Number of Unique Subjects Taught by Each Teacher
-------------------------------------------------------------------------------
Problem:
  For each teacher, compute the number of unique subjects they teach.
    - A subject may be taught in multiple departments.
    - Count distinct subject_id per teacher_id.

Schema:
  Teacher(teacher_id INT,
          subject_id INT,
          dept_id INT,
          PRIMARY KEY(subject_id, dept_id))

Constraints:
  - subject_id + dept_id uniquely identifies a teaching assignment.
  - Teachers may teach the same subject in multiple departments.
  - Need DISTINCT subject_id count per teacher.

Design Principles:
  - Single Responsibility: Query computes unique subject count per teacher.
  - Declarative Style: Use COUNT(DISTINCT subject_id).
  - Clean Architecture: Group by teacher_id.
  - Extensibility: Easy to add department-level breakdown if needed.

Edge Cases:
  - Teacher teaches same subject in multiple departments → counted once.
  - Teacher teaches no subjects → excluded (no rows).
  - Empty table → returns empty set.

Pseudocode:
  SELECT teacher_id,
         COUNT(DISTINCT subject_id) AS cnt
  FROM Teacher
  GROUP BY teacher_id;

===============================================================================
*/

-- PostgreSQL query solution
SELECT teacher_id,
       COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
