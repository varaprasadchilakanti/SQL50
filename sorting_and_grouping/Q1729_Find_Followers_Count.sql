/*
===============================================================================
Q1729. Find Followers Count
-------------------------------------------------------------------------------
Problem:
  For each user, compute the number of followers.
    - follower_id represents a user who follows another user.
    - Output: user_id, followers_count.
    - Order by user_id ascending.

Schema:
  Followers(user_id INT,
            follower_id INT,
            PRIMARY KEY(user_id, follower_id))

Constraints:
  - Each (user_id, follower_id) pair is unique.
  - A user may have zero or more followers.
  - Need to count distinct follower_id per user_id.

Design Principles:
  - Single Responsibility: Query computes follower count per user.
  - Declarative Style: Use COUNT(follower_id).
  - Clean Architecture: Group by user_id, order ascending.
  - Extensibility: Easy to add following count if needed.

Edge Cases:
  - User with no followers → excluded unless explicitly required.
  - Multiple followers → counted correctly.
  - Empty table → returns empty set.

Pseudocode:
  SELECT user_id,
         COUNT(follower_id) AS followers_count
  FROM Followers
  GROUP BY user_id
  ORDER BY user_id ASC;

===============================================================================
*/

-- PostgreSQL query solution
SELECT user_id,
       COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;
