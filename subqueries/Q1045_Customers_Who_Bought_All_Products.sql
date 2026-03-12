/*
===============================================================================
Q1045. Customers Who Bought All Products
-------------------------------------------------------------------------------
Problem:
  Identify customers who bought *all* products listed in the Product table.
    - Customer table may contain duplicates.
    - product_key is a foreign key to Product table.
    - Output: customer_id.

Schema:
  Customer(customer_id INT,
           product_key INT)

  Product(product_key INT PRIMARY KEY)

Constraints:
  - Each product_key in Product must be purchased by the customer.
  - Need to compare distinct product counts per customer against total products.

Design Principles:
  - Single Responsibility: Query checks completeness of product purchases.
  - Declarative Style: Use GROUP BY with HAVING.
  - Clean Architecture: Compare COUNT(DISTINCT product_key) per customer to total products.
  - Extensibility: Easy to adapt for “customers who bought ≥N% of products.”

Edge Cases:
  - Customer buys duplicates → DISTINCT ensures correctness.
  - Customer buys subset → excluded.
  - Empty Product table → all customers trivially qualify (though unrealistic).
  - Empty Customer table → returns empty set.

Pseudocode:
  SELECT customer_id
  FROM Customer
  GROUP BY customer_id
  HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

===============================================================================
*/

-- PostgreSQL query solution
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
