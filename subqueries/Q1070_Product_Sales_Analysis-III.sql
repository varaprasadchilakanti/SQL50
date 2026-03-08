/*
===============================================================================
Q1070. Product Sales Analysis III
-------------------------------------------------------------------------------
Problem:
  For each product, identify the first year it was sold and return all sales
  entries for that product in that year.
    - first_year = MIN(year) per product_id.
    - Output columns: product_id, first_year, quantity, price.

Schema:
  Sales(sale_id INT,
        product_id INT,
        year INT,
        quantity INT,
        price INT,
        PRIMARY KEY(sale_id, year))

Constraints:
  - Products may have multiple sales in the same year.
  - Need to include all sales rows for the first year.

Design Principles:
  - Single Responsibility: Query isolates earliest year per product.
  - Declarative Style: Use MIN(year) grouping.
  - Clean Architecture: Join back to Sales to fetch full rows.
  - Extensibility: Easy to adapt for “latest year” or multi-year analysis.

Edge Cases:
  - Product with only one year of sales → returns that year’s rows.
  - Product with multiple sales in first year → all rows included.
  - Empty table → returns empty set.

Pseudocode:
  WITH first_years AS (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
  )
  SELECT s.product_id, f.first_year, s.quantity, s.price
  FROM Sales s
  JOIN first_years f
    ON s.product_id = f.product_id
   AND s.year = f.first_year;

===============================================================================
*/

-- PostgreSQL query solution
WITH first_years AS (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)
SELECT s.product_id,
       f.first_year,
       s.quantity,
       s.price
FROM Sales s
JOIN first_years f
  ON s.product_id = f.product_id
 AND s.year = f.first_year;
