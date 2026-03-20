/*
===============================================================================
Q251. Average Selling Price
-------------------------------------------------------------------------------
Problem:
  Compute the average selling price for each product:
    - average_price = (Σ units * price) / (Σ units).
    - If no units sold → average_price = 0.
    - Round to 2 decimal places.

Schema:
  Prices(product_id INT,
         start_date DATE,
         end_date DATE,
         price INT,
         PRIMARY KEY(product_id, start_date, end_date))

  UnitsSold(product_id INT,
            purchase_date DATE,
            units INT)

Constraints:
  - Prices are valid for non-overlapping periods per product.
  - UnitsSold may contain duplicates.
  - Need to join UnitsSold with Prices by product_id and purchase_date range.

Design Principles:
  - Single Responsibility: Query calculates weighted average price per product.
  - Declarative Style: Use JOIN with date range condition.
  - Clean Architecture: Aggregate per product_id.
  - Extensibility: Easy to adapt if more attributes (discounts, taxes) are added.

Edge Cases:
  - Products with no sales → average_price = 0.
  - Multiple price periods → handled by date range join.
  - Empty tables → returns empty set.

Pseudocode:
  SELECT p.product_id,
         ROUND(
           COALESCE(SUM(u.units * p.price)::numeric / NULLIF(SUM(u.units), 0), 0),
           2
         ) AS average_price
  FROM Prices p
  LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date
  GROUP BY p.product_id;

===============================================================================
*/

-- PostgreSQL query solution
SELECT p.product_id,
       ROUND(
         COALESCE(SUM(u.units * p.price)::numeric / NULLIF(SUM(u.units), 0), 0),
         2
       ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
  ON p.product_id = u.product_id
 AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
