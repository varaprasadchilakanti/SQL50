/*
===============================================================================
Q1667. Fix Names in a Table
-------------------------------------------------------------------------------
Problem:
  Normalize user names so that:
    - First character is uppercase.
    - Remaining characters are lowercase.
  Return results ordered by user_id.

Schema:
  Users(user_id INT PRIMARY KEY,
        name VARCHAR)

Constraints:
  - Names consist only of alphabetic characters.
  - Case may be inconsistent (e.g., "aLice", "bOB").

Design Principles:
  - Single Responsibility: Query transforms names into proper case.
  - Declarative Style: Use string functions for transformation.
  - Clean Architecture: One SELECT with clear transformation logic.
  - Extensibility: Can adapt for multi‑word names with INITCAP if needed.

Edge Cases:
  - Single‑character names → still uppercase.
  - Already normalized names → remain unchanged.
  - Mixed case inputs → corrected.

Pseudocode:
  SELECT user_id,
         CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name FROM 2))) AS name
  FROM Users
  ORDER BY user_id;

===============================================================================
*/

-- PostgreSQL query solution
SELECT user_id,
       CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name FROM 2))) AS name
FROM Users
ORDER BY user_id;
