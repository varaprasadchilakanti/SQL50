/*
===============================================================================
Q1484. Group Sold Products By The Date
-------------------------------------------------------------------------------
Problem:
  For each sell_date:
    - Count distinct products sold.
    - Return product names sorted lexicographically, concatenated with commas.
    - Output ordered by sell_date.

Schema:
  Activities(sell_date DATE,
             product VARCHAR)

Constraints:
  - Table may contain duplicates.
  - No primary key.
  - Product names must be distinct per date.

Design Principles:
  - Single Responsibility: Query aggregates products per date.
  - Declarative Style: Use COUNT(DISTINCT) and STRING_AGG with ORDER BY.
  - Clean Architecture: One GROUP BY with clear aggregation.
  - Extensibility: Can adapt for other grouping dimensions (e.g., by month).

Edge Cases:
  - Duplicate product entries → counted once per date.
  - Single product per date → returned as is.
  - Multiple products → sorted lexicographically.

Pseudocode:
  SELECT sell_date,
         COUNT(DISTINCT product) AS num_sold,
         STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
  FROM Activities
  GROUP BY sell_date
  ORDER BY sell_date;

===============================================================================
*/

-- PostgreSQL query solution
SELECT sell_date,
       COUNT(DISTINCT product) AS num_sold,
       STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
