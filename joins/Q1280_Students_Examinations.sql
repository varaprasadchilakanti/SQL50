/*
===============================================================================
Q1280. Students and Examinations
-------------------------------------------------------------------------------
Problem:
  Report the number of times each student attended each exam.
  - Every student should appear with every subject.
  - Attendance count is derived from Examinations table (may contain duplicates).
  - Result ordered by student_id, subject_name.

Schema:
  Students(student_id INT PRIMARY KEY,
           student_name VARCHAR)

  Subjects(subject_name VARCHAR PRIMARY KEY)

  Examinations(student_id INT,
               subject_name VARCHAR)

Constraints:
  - Students × Subjects = full Cartesian product.
  - Examinations may contain duplicates → COUNT needed.
  - Students with no attendance for a subject → count = 0.

Design Principles:
  - Single Responsibility: Query maps students to subjects, counts attendance.
  - Declarative Style: Use CROSS JOIN to generate all pairs.
  - Clean Architecture: LEFT JOIN Examinations to preserve zero counts.
  - Extensibility: Easy to adapt if more attributes (exam_date, score) are added.

Edge Cases:
  - Students with no exams → still listed with count = 0.
  - Subjects with no exams → still listed with count = 0.
  - Duplicate exam rows → COUNT ensures correct frequency.
  - Empty tables → returns empty set.

Pseudocode:
  SELECT s.student_id, s.student_name, subj.subject_name,
         COUNT(e.subject_name) AS attended_exams
  FROM Students s
  CROSS JOIN Subjects subj
  LEFT JOIN Examinations e
    ON s.student_id = e.student_id
   AND subj.subject_name = e.subject_name
  GROUP BY s.student_id, s.student_name, subj.subject_name
  ORDER BY s.student_id, subj.subject_name;

===============================================================================
*/

-- PostgreSQL query solution
SELECT s.student_id,
       s.student_name,
       subj.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects subj
LEFT JOIN Examinations e
  ON s.student_id = e.student_id
 AND subj.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, subj.subject_name
ORDER BY s.student_id, subj.subject_name;
