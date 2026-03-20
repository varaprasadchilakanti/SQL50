/*
===============================================================================
Q550. Game Play Analysis IV
-------------------------------------------------------------------------------
Problem:
  Compute the fraction of players who logged in again on the day immediately
  after their first login date.
    - First login date = MIN(event_date) per player.
    - Immediate next login = event_date = first_login_date + 1 day.
    - Fraction = (# players with next-day login) / (total players).
    - Round to 2 decimals.

Schema:
  Activity(player_id INT,
           device_id INT,
           event_date DATE,
           games_played INT,
           PRIMARY KEY(player_id, event_date))

Constraints:
  - Each player has at least one login.
  - Dates are valid and comparable.

Design Principles:
  - Single Responsibility: Query isolates first login, checks next-day login.
  - Declarative Style: Use subquery or CTE for first login dates.
  - Clean Architecture: Conditional aggregation for numerator/denominator.
  - Extensibility: Easy to adapt for other retention metrics (e.g., day 7).

Edge Cases:
  - Player with only one login → not counted in numerator.
  - Player with multiple logins but not next day → excluded from numerator.
  - Empty table → returns empty set.

Pseudocode:
  WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
  )
  SELECT ROUND(
           COUNT(DISTINCT CASE WHEN a.event_date = f.first_date + INTERVAL '1 day'
                               THEN a.player_id END)::numeric
           / COUNT(DISTINCT f.player_id),
           2
         ) AS fraction
  FROM first_login f
  LEFT JOIN Activity a
    ON f.player_id = a.player_id;

===============================================================================
*/

-- PostgreSQL query solution
WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(
           COUNT(DISTINCT CASE
                            WHEN a.event_date = f.first_date + INTERVAL '1 day'
                            THEN a.player_id END)::numeric
           / COUNT(DISTINCT f.player_id),
           2
       ) AS fraction
FROM first_login f
LEFT JOIN Activity a
  ON f.player_id = a.player_id;
