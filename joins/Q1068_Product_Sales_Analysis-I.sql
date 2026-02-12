/*
===============================================================================
Q1068. Product Sales Analysis I
-------------------------------------------------------------------------------
Problem:
  Report product_name, year, and price for each sale_id in the Sales table.

Schema:
  Sales(sale_id INT,
        product_id INT,
        year INT,
        quantity INT,
        price INT,
        PRIMARY KEY(sale_id, year))

  Product(product_id INT PRIMARY KEY,
          product_name VARCHAR)

Constraints:
  - Sales.product_id references Product.product_id.
  - Need to join Sales with Product to retrieve product_name.
  - Return product_name, year, price.

Design Principles:
  - Single Responsibility: Query maps sales to product names.
  - Declarative Style: Express intent clearly with JOIN.
  - Clean Architecture: Use INNER JOIN since every sale must have a product.
  - Extensibility: Easy to add more attributes (e.g., quantity, gdp) if needed.

Edge Cases:
  - Sales with product_id not in Product → excluded (INNER JOIN).
  - Multiple sales for same product/year → all rows included.
  - Empty tables → returns empty set.

Pseudocode:
  SELECT p.product_name, s.year, s.price
  FROM Sales s
  JOIN Product p
    ON s.product_id = p.product_id;

===============================================================================
*/

-- PostgreSQL query solution
SELECT p.product_name, s.year, s.price
FROM Sales s
JOIN Product p
  ON s.product_id = p.product_id;
