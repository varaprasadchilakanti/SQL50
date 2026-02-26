/*
===============================================================================
Q1633. Percentage of Users Attended a Contest
-------------------------------------------------------------------------------
Problem:
  Compute the percentage of users registered in each contest:
    - percentage = (distinct users registered / total users) * 100.
    - Round to 2 decimal places.
    - Order by percentage DESC, then contest_id ASC.

Schema:
  Users(user_id INT PRIMARY KEY,
        user_name VARCHAR)

  Register(contest_id INT,
           user_id INT,
           PRIMARY KEY(contest_id, user_id))

Constraints:
  - Each contest may have multiple users.
  - Each user may register for multiple contests.
  - Need distinct user counts per contest.
  - Total users = COUNT(*) from Users.

Design Principles:
  - Single Responsibility: Query calculates contest participation percentage.
  - Declarative Style: Use COUNT(DISTINCT user_id) for registrations.
  - Clean Architecture: Divide by total users, round result.
  - Extensibility: Easy to adapt if weighting or filtering needed.

Edge Cases:
  - Contest with no registrations → percentage = 0.
  - Contest with all users registered → percentage = 100.
  - Empty tables → returns empty set.

Pseudocode:
  SELECT r.contest_id,
         ROUND(
           COUNT(DISTINCT r.user_id)::numeric * 100.0 / (SELECT COUNT(*) FROM Users),
           2
         ) AS percentage
  FROM Register r
  GROUP BY r.contest_id
  ORDER BY percentage DESC, contest_id ASC;

===============================================================================
*/

-- PostgreSQL query solution
SELECT r.contest_id,
       ROUND(
         COUNT(DISTINCT r.user_id)::numeric * 100.0 / (SELECT COUNT(*) FROM Users),
         2
       ) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC;
