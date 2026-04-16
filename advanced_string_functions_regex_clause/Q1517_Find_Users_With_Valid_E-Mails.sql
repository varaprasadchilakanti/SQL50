/*
===============================================================================
Q1517. Find Users With Valid E-Mails
-------------------------------------------------------------------------------
Problem:
  Identify users whose email addresses are valid.
    - Prefix must start with a letter.
    - Prefix may contain letters, digits, underscore '_', period '.', or dash '-'.
    - Domain must be exactly '@leetcode.com'.

Schema:
  Users(user_id INT PRIMARY KEY,
        name VARCHAR,
        mail VARCHAR)

Constraints:
  - Emails may be invalid (wrong domain, invalid characters, wrong prefix).
  - Must return user_id, name, mail for valid emails.

Design Principles:
  - Single Responsibility: Query validates email format.
  - Declarative Style: Use regular expressions for pattern matching.
  - Clean Architecture: One SELECT with clear regex condition.
  - Extensibility: Regex can be adapted for other domains or rules.

Edge Cases:
  - Prefix starting with non-letter → invalid.
  - Invalid characters (#, spaces, etc.) → invalid.
  - Wrong domain (e.g., gmail.com) → invalid.
  - Empty mail → excluded.

Pseudocode:
  SELECT user_id, name, mail
  FROM Users
  WHERE mail ~ '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$';

===============================================================================
*/

-- PostgreSQL query solution
SELECT user_id,
       name,
       mail
FROM Users
WHERE mail ~ '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$';
