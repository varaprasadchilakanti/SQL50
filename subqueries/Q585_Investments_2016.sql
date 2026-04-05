/*
===============================================================================
Q585. Investments in 2016
-------------------------------------------------------------------------------
Problem:
  Report the sum of tiv_2016 for policyholders who satisfy BOTH conditions:
    1. Their tiv_2015 value is shared with at least one other policyholder.
    2. Their location (lat, lon) is unique (no other policyholder has same pair).

Schema:
  Insurance(pid INT PRIMARY KEY,
            tiv_2015 FLOAT,
            tiv_2016 FLOAT,
            lat FLOAT NOT NULL,
            lon FLOAT NOT NULL)

Constraints:
  - tiv_2015 may repeat across multiple policyholders.
  - (lat, lon) must be unique for inclusion.
  - Round result to 2 decimal places.

Design Principles:
  - Single Responsibility: Query isolates qualifying policyholders.
  - Declarative Style: Use GROUP BY + HAVING for duplicates, and uniqueness checks.
  - Clean Architecture: CTEs separate duplicate detection and unique location filtering.
  - Extensibility: Easy to adapt for other years or conditions.

Edge Cases:
  - Policyholders with unique tiv_2015 → excluded.
  - Policyholders sharing location → excluded.
  - Empty qualifying set → returns 0.00.

Pseudocode:
  1. Find tiv_2015 values that appear more than once.
  2. Find (lat, lon) pairs that appear exactly once.
  3. Select policyholders whose tiv_2015 is in set (1) AND whose location is in set (2).
  4. Sum tiv_2016, round to 2 decimals.

===============================================================================
*/

-- PostgreSQL query solution
SELECT ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM Insurance i
WHERE i.tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (i.lat, i.lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
