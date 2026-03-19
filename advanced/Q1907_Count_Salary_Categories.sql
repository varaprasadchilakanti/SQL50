/*
===============================================================================
Q1907. Count Salary Categories
-------------------------------------------------------------------------------
Problem:
  Count the number of accounts in each salary category:
    - "Low Salary": income < 20000
    - "Average Salary": 20000 ≤ income ≤ 50000
    - "High Salary": income > 50000
  Must return all three categories, even if count = 0.

Schema:
  Accounts(account_id INT PRIMARY KEY,
           income INT)

Constraints:
  - Each account_id is unique.
  - Must include categories with zero accounts.

Design Principles:
  - Single Responsibility: Query computes counts per category.
  - Declarative Style: Use CASE expressions for classification.
  - Clean Architecture: Wrap in UNION ALL to guarantee all categories.
  - Extensibility: Easy to adjust thresholds or add categories.

Edge Cases:
  - No accounts in one or more categories → still return with count = 0.
  - Empty table → all categories return 0.
  - Boundary values (20000, 50000) → correctly classified as "Average Salary".

Pseudocode:
  SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
  FROM Accounts
  WHERE income < 20000
  UNION ALL
  SELECT 'Average Salary', COUNT(*)
  FROM Accounts
  WHERE income BETWEEN 20000 AND 50000
  UNION ALL
  SELECT 'High Salary', COUNT(*)
  FROM Accounts
  WHERE income > 50000;

===============================================================================
*/

-- PostgreSQL query solution
SELECT 'Low Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000
UNION ALL
SELECT 'Average Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000
UNION ALL
SELECT 'High Salary' AS category,
       COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000;
