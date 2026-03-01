/*
===============================================================================
Q1193. Monthly Transactions I
-------------------------------------------------------------------------------
Problem:
  For each month and country, compute:
    - trans_count: total number of transactions.
    - trans_total_amount: sum of all amounts.
    - approved_count: number of approved transactions.
    - approved_total_amount: sum of amounts for approved transactions.
  Round not required (all integers).
  Month format: YYYY-MM.

Schema:
  Transactions(id INT PRIMARY KEY,
               country VARCHAR,
               state ENUM('approved','declined'),
               amount INT,
               trans_date DATE)

Constraints:
  - Each transaction belongs to one country and one state.
  - trans_date is a valid date.
  - Need grouping by month and country.

Design Principles:
  - Single Responsibility: Query aggregates counts and sums per month/country.
  - Declarative Style: Use DATE_TRUNC or TO_CHAR for month extraction.
  - Clean Architecture: Conditional aggregation for approved metrics.
  - Extensibility: Easy to add declined metrics if needed.

Edge Cases:
  - Months with only declined transactions → approved_count = 0, approved_total_amount = 0.
  - Countries with multiple months → each month reported separately.
  - Empty table → returns empty set.

Pseudocode:
  SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month,
         country,
         COUNT(*) AS trans_count,
         SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
         SUM(amount) AS trans_total_amount,
         SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
  FROM Transactions
  GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country;

===============================================================================
*/

-- PostgreSQL query solution
SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month,
       country,
       COUNT(*) AS trans_count,
       SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
       SUM(amount) AS trans_total_amount,
       SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country;
