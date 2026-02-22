/*
===============================================================================
Q1934. Confirmation Rate
-------------------------------------------------------------------------------
Problem:
  Compute the confirmation rate for each user:
    - confirmation_rate = (# confirmed messages) / (total messages requested).
    - If user has no confirmation requests → rate = 0.
    - Round to 2 decimal places.

Schema:
  Signups(user_id INT PRIMARY KEY,
          time_stamp DATETIME)

  Confirmations(user_id INT,
                time_stamp DATETIME,
                action ENUM('confirmed','timeout'),
                PRIMARY KEY(user_id, time_stamp))

===============================================================================
*/

-- PostgreSQL query solution
SELECT s.user_id,
       COALESCE(
         ROUND(
           SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END)::numeric
           / NULLIF(COUNT(c.action), 0),
           2
         ),
         0.00
       ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
  ON s.user_id = c.user_id
GROUP BY s.user_id;
