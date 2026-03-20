/*
===============================================================================
Q1174. Immediate Food Delivery II
-------------------------------------------------------------------------------
Problem:
  Compute the percentage of immediate orders among the first orders of all customers.
    - Immediate order: customer_pref_delivery_date = order_date.
    - First order: earliest order_date per customer.
    - Result: (immediate_first_orders / total_customers) * 100, rounded to 2 decimals.

Schema:
  Delivery(delivery_id INT PRIMARY KEY,
           customer_id INT,
           order_date DATE,
           customer_pref_delivery_date DATE)

Constraints:
  - Each customer has exactly one first order.
  - Dates are valid and comparable.

Design Principles:
  - Single Responsibility: Query isolates first orders, then computes immediate percentage.
  - Declarative Style: Use window functions or MIN(order_date) grouping.
  - Clean Architecture: Subquery for first orders, outer aggregation for percentage.
  - Extensibility: Easy to adapt if more order types are introduced.

Edge Cases:
  - All customers immediate → percentage = 100.
  - No customers immediate → percentage = 0.
  - Empty table → returns empty set.

Pseudocode:
  WITH first_orders AS (
    SELECT d.customer_id,
           d.order_date,
           d.customer_pref_delivery_date
    FROM Delivery d
    WHERE d.order_date = (
      SELECT MIN(order_date)
      FROM Delivery
      WHERE customer_id = d.customer_id
    )
  )
  SELECT ROUND(
           SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)::numeric
           * 100.0 / COUNT(*),
           2
         ) AS immediate_percentage
  FROM first_orders;

===============================================================================
*/

-- PostgreSQL query solution
WITH first_orders AS (
    SELECT d.customer_id,
           d.order_date,
           d.customer_pref_delivery_date
    FROM Delivery d
    WHERE d.order_date = (
        SELECT MIN(order_date)
        FROM Delivery
        WHERE customer_id = d.customer_id
    )
)
SELECT ROUND(
           SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)::numeric
           * 100.0 / COUNT(*),
           2
       ) AS immediate_percentage
FROM first_orders;
