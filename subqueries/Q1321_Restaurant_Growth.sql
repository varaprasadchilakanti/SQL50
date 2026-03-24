/*
===============================================================================
Q1321. Restaurant Growth
-------------------------------------------------------------------------------
Problem:
  Compute the 7‑day moving average of customer spending.
    - Window: current day + 6 days before.
    - Output: visited_on, total amount in window, average_amount (rounded to 2 decimals).
    - Ordered by visited_on ascending.

Schema:
  Customer(customer_id INT,
           name VARCHAR,
           visited_on DATE,
           amount INT,
           PRIMARY KEY(customer_id, visited_on))

Constraints:
  - At least one customer every day.
  - Multiple customers may visit on the same day.
  - Moving average starts only when 7 days of data are available.

Design Principles:
  - Single Responsibility: Query computes rolling sums and averages.
  - Declarative Style: Use window functions for clarity.
  - Clean Architecture: CTEs separate daily totals from rolling aggregates.
  - Extensibility: Easy to adjust window size (e.g., 14 days).

Edge Cases:
  - Less than 7 days of data → excluded.
  - Multiple customers on same day → aggregated before rolling.
  - Continuous daily data assumption is critical.

Pseudocode:
  1. Aggregate daily totals:
       SELECT visited_on, SUM(amount) AS amount
       FROM Customer
       GROUP BY visited_on
  2. Apply rolling window:
       SUM(amount) OVER (ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
       AVG(amount) OVER (ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
  3. Filter only rows with 7 days in window.
  4. Round average_amount to 2 decimals.

===============================================================================
*/

-- PostgreSQL query solution
WITH daily AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
rolling AS (
    SELECT visited_on,
           SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS total_amount,
           ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount,
           COUNT(*) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS day_count
    FROM daily
)
SELECT visited_on,
       total_amount AS amount,
       average_amount
FROM rolling
WHERE day_count = 7
ORDER BY visited_on;
