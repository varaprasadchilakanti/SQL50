/*
===============================================================================
Q1141. User Activity for the Past 30 Days I
-------------------------------------------------------------------------------
Problem:
  Compute the daily active user count for the 30-day period ending 2019-07-27.
    - A user is active on a day if they have at least one activity.
    - Only include days with ≥1 active user.
    - Round not required (integer counts).

Schema:
  Activity(user_id INT,
           session_id INT,
           activity_date DATE,
           activity_type ENUM('open_session','end_session','scroll_down','send_message'))

Constraints:
  - Each session belongs to exactly one user.
  - Duplicate rows possible → need DISTINCT user_id per day.
  - Valid activity types are all considered.

Design Principles:
  - Single Responsibility: Query counts distinct active users per day.
  - Declarative Style: Use COUNT(DISTINCT user_id).
  - Clean Architecture: Filter by date range, group by activity_date.
  - Extensibility: Easy to adjust date range or add filters.

Edge Cases:
  - Days with no activity → excluded.
  - Multiple activities per user per day → counted once.
  - Empty table → returns empty set.

Pseudocode:
  SELECT activity_date AS day,
         COUNT(DISTINCT user_id) AS active_users
  FROM Activity
  WHERE activity_date BETWEEN DATE '2019-06-28' AND DATE '2019-07-27'
  GROUP BY activity_date;

===============================================================================
*/

-- PostgreSQL query solution
SELECT activity_date AS day,
       COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE '2019-06-28' AND DATE '2019-07-27'
GROUP BY activity_date;
