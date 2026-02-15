/*
===============================================================================
Q1581. Customer Who Visited but Did Not Make Any Transactions
-------------------------------------------------------------------------------
Problem:
  Identify customers who visited the mall but did not make any transactions.
  For each such customer, count the number of visits without transactions.

Schema:
  Visits(visit_id INT PRIMARY KEY,
         customer_id INT)

  Transactions(transaction_id INT PRIMARY KEY,
               visit_id INT,
               amount INT)

Constraints:
  - visit_id is unique in Visits.
  - Transactions may contain multiple rows per visit_id.
  - Need to count visits with no matching transaction.

Design Principles:
  - Single Responsibility: Query isolates visits without transactions.
  - Declarative Style: Use LEFT JOIN and NULL check for unmatched rows.
  - Clean Architecture: Aggregate counts per customer_id.
  - Extensibility: Easy to adapt if more filters (date, amount thresholds) are added.

Edge Cases:
  - Customers with all visits having transactions → excluded.
  - Customers with mixed visits → only non‑transaction visits counted.
  - Empty tables → returns empty set.
  - Multiple transactions per visit → still considered “transaction made,” excluded.

Pseudocode:
  SELECT v.customer_id, COUNT(*) AS count_no_trans
  FROM Visits v
  LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
  WHERE t.transaction_id IS NULL
  GROUP BY v.customer_id;

===============================================================================
*/

-- PostgreSQL query solution
SELECT v.customer_id, COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
  ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;
