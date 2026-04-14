/*
===============================================================================
Q1327. List the Products Ordered in a Period
-------------------------------------------------------------------------------
Problem:
  Find product names and total units ordered in February 2020
    - Only include products with >= 100 units ordered.
    - Return product_name and total units.

Schema:
  Products(product_id INT PRIMARY KEY,
           product_name VARCHAR,
           product_category VARCHAR)
  Orders(product_id INT REFERENCES Products(product_id),
         order_date DATE,
         unit INT)

Constraints:
  - Orders may contain duplicates.
  - Must filter by February 2020 (2020-02-01 to 2020-02-29).
  - Aggregate units per product.

Design Principles:
  - Single Responsibility: Query computes totals per product in Feb 2020.
  - Declarative Style: Use GROUP BY with SUM.
  - Clean Architecture: CTE separates filtering from aggregation.
  - Extensibility: Easy to adjust for other months or thresholds.

Edge Cases:
  - Products with < 100 units → excluded.
  - Products not ordered in Feb 2020 → excluded.
  - Leap year → February has 29 days (covered by BETWEEN).

Pseudocode:
  WITH feb_orders AS (
    SELECT product_id, SUM(unit) AS total_units
    FROM Orders
    WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY product_id
  )
  SELECT p.product_name, f.total_units AS unit
  FROM feb_orders f
  JOIN Products p ON f.product_id = p.product_id
  WHERE f.total_units >= 100;

===============================================================================
*/

-- PostgreSQL query solution
WITH feb_orders AS (
    SELECT product_id, SUM(unit) AS total_units
    FROM Orders
    WHERE order_date BETWEEN DATE '2020-02-01' AND DATE '2020-02-29'
    GROUP BY product_id
)
SELECT p.product_name,
       f.total_units AS unit
FROM feb_orders f
JOIN Products p ON f.product_id = p.product_id
WHERE f.total_units >= 100;
