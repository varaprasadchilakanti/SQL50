/*
===============================================================================
Q1683. Invalid Tweets
-------------------------------------------------------------------------------
Problem:
  Identify tweets whose content length exceeds 15 characters.

Schema:
  Tweets(tweet_id INT PRIMARY KEY,
         content VARCHAR)

Constraints:
  - tweet_id is unique.
  - content contains only alphanumeric, '!', and spaces.
  - Invalid if LENGTH(content) > 15.

Design Principles:
  - Single Responsibility: Query filters only on content length.
  - Declarative Style: Express intent clearly with WHERE clause.
  - Clean Architecture: No unnecessary joins or subqueries.
  - Extensibility: Threshold can be parameterized if business rules change.

Edge Cases:
  - Tweets with exactly 15 characters → valid, excluded.
  - Tweets with NULL content → LENGTH(NULL) is NULL, excluded.
  - Empty table → returns empty set.

Pseudocode:
  SELECT tweet_id
  FROM Tweets
  WHERE LENGTH(content) > 15;

===============================================================================
*/

-- PostgreSQL query solution
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
