/*
===============================================================================
Q1164. Product Price at a Given Date
-------------------------------------------------------------------------------
Problem:
  Find the price of each product on 2019-08-16.
    - Initially, all products have price = 10.
    - Each row in Products records a price change at change_date.
    - Need the latest price change on or before 2019-08-16.
    - If no change before that date → price = 10.

Schema:
  Products(product_id INT,
           new_price INT,
           change_date DATE,
           PRIMARY KEY(product_id, change_date))

Constraints:
  - Multiple changes possible per product.
  - Must handle products with no changes before target date.

Design Principles:
  - Single Responsibility: Query computes effective price at given date.
  - Declarative Style: Use window functions or correlated subquery.
  - Clean Architecture: Default price handled via COALESCE.
  - Extensibility: Easy to adapt for arbitrary target dates.

Edge Cases:
  - Product with no changes → price = 10.
  - Product with changes after target date only → price = 10.
  - Product with multiple changes before target date → take latest.

Pseudocode:
  SELECT DISTINCT p.product_id,
         COALESCE(
           (SELECT new_price
            FROM Products
            WHERE product_id = p.product_id
              AND change_date <= DATE '2019-08-16'
            ORDER BY change_date DESC
            LIMIT 1),
           10
         ) AS price
  FROM Products p;

===============================================================================
*/

-- PostgreSQL query solution
SELECT DISTINCT p.product_id,
       COALESCE(
         (SELECT new_price
          FROM Products
          WHERE product_id = p.product_id
            AND change_date <= DATE '2019-08-16'
          ORDER BY change_date DESC
          LIMIT 1),
         10
       ) AS price
FROM Products p;
