/*
===============================================================================
Q1757. Recyclable and Low Fat Products
-------------------------------------------------------------------------------
Problem:
  Identify product IDs from the Products table where:
    - low_fats = 'Y'
    - recyclable = 'Y'

Schema:
  Products(product_id INT PRIMARY KEY,
           low_fats ENUM('Y','N'),
           recyclable ENUM('Y','N'))

Constraints:
  - product_id is unique.
  - low_fats and recyclable are categorical flags.

Design Principles:
  - Single Responsibility: Query filters only on required attributes.
  - Declarative Style: Express intent clearly with WHERE clause.
  - Clean Architecture: No unnecessary joins or subqueries.
  - Extensibility: Easy to adapt if more flags are added.

Edge Cases:
  - No products meeting criteria → returns empty set.
  - All products meeting criteria → returns all product_ids.
  - ENUM values strictly 'Y'/'N'; no need for NULL handling here.

Pseudocode:
  SELECT product_id
  FROM Products
  WHERE low_fats = 'Y' AND recyclable = 'Y';

===============================================================================
*/

-- PostgreSQL query solution
SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
