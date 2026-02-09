/*
===============================================================================
Q1148. Article Views I
-------------------------------------------------------------------------------
Problem:
  Find all authors who viewed at least one of their own articles.
  Condition: author_id = viewer_id.

Schema:
  Views(article_id INT,
        author_id INT,
        viewer_id INT,
        view_date DATE)

Constraints:
  - No primary key; duplicates possible.
  - author_id and viewer_id may be equal (self‑view).
  - Need distinct author IDs in ascending order.

Design Principles:
  - Single Responsibility: Query filters only on self‑view condition.
  - Declarative Style: Express intent clearly with WHERE clause.
  - Clean Architecture: Use DISTINCT to eliminate duplicates.
  - Extensibility: Easy to adapt if additional filters (date ranges, article sets) are required.

Edge Cases:
  - Multiple duplicate rows → DISTINCT ensures uniqueness.
  - No self‑views → returns empty set.
  - Large dataset → efficient with index on (author_id, viewer_id).

Pseudocode:
  SELECT DISTINCT author_id AS id
  FROM Views
  WHERE author_id = viewer_id
  ORDER BY id ASC;

===============================================================================
*/

-- PostgreSQL query solution
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
