/*
===============================================================================
Q1211. Queries Quality and Percentage
-------------------------------------------------------------------------------
Problem:
  For each query_name, compute:
    - quality = AVG(rating / position).
    - poor_query_percentage = (# queries with rating < 3 / total queries) * 100.
    - Round both to 2 decimal places.

Schema:
  Queries(query_name VARCHAR,
          result VARCHAR,
          position INT,
          rating INT)

Constraints:
  - position ∈ [1, 500].
  - rating ∈ [1, 5].
  - Duplicate rows possible.
  - Poor query defined as rating < 3.

Design Principles:
  - Single Responsibility: Query computes quality and poor percentage per query_name.
  - Declarative Style: Use conditional aggregation for poor queries.
  - Clean Architecture: GROUP BY query_name, aggregate metrics.
  - Extensibility: Easy to add more KPIs (e.g., max rating, median position).

Edge Cases:
  - Query_name with all poor queries → poor_query_percentage = 100.
  - Query_name with no poor queries → poor_query_percentage = 0.
  - Empty table → returns empty set.

Pseudocode:
  SELECT query_name,
         ROUND(AVG(rating::numeric / position), 2) AS quality,
         ROUND(
           SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)::numeric * 100.0 / COUNT(*),
           2
         ) AS poor_query_percentage
  FROM Queries
  GROUP BY query_name;

===============================================================================
*/

-- PostgreSQL query solution
SELECT query_name,
       ROUND(AVG(rating::numeric / position), 2) AS quality,
       ROUND(
         SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)::numeric * 100.0 / COUNT(*),
         2
       ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
