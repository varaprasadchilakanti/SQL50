/*
===============================================================================
Q196. Delete Duplicate Emails
-------------------------------------------------------------------------------
Problem:
  Delete duplicate email rows, keeping only the one with the smallest id.

Schema:
  Person(id INT PRIMARY KEY,
         email VARCHAR)

Constraints:
  - Emails are lowercase only.
  - Multiple rows may share the same email.
  - Must retain only the row with the smallest id for each email.

Design Principles:
  - Single Responsibility: Query deletes duplicates, preserving smallest id.
  - Declarative Style: Use subquery to identify rows to keep.
  - Clean Architecture: DELETE with WHERE condition referencing subquery.
  - Extensibility: Can adapt for other uniqueness rules (e.g., keep latest id).

Edge Cases:
  - Unique emails → no deletion.
  - Multiple duplicates → all but smallest id removed.
  - Empty table → no effect.

Pseudocode:
  DELETE FROM Person
  WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
  );

===============================================================================
*/

-- PostgreSQL query solution
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);
