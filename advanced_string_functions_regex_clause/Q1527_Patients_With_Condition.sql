/*
===============================================================================
Q1527. Patients With a Condition
-------------------------------------------------------------------------------
Problem:
  Find patients who have Type I Diabetes.
    - Condition codes are space‑separated strings in column `conditions`.
    - Type I Diabetes codes always start with prefix 'DIAB1'.

Schema:
  Patients(patient_id INT PRIMARY KEY,
           patient_name VARCHAR,
           conditions VARCHAR)

Constraints:
  - conditions may be empty string.
  - Multiple codes may appear, separated by spaces.
  - Must match prefix 'DIAB1' anywhere in conditions.

Design Principles:
  - Single Responsibility: Query isolates patients with DIAB1 prefix.
  - Declarative Style: Use pattern matching with LIKE.
  - Clean Architecture: One SELECT with clear filter condition.
  - Extensibility: Can adapt for other condition prefixes.

Edge Cases:
  - Empty conditions → excluded.
  - Multiple conditions → included if any starts with DIAB1.
  - Case sensitivity → assume codes are uppercase.

Pseudocode:
  SELECT patient_id, patient_name, conditions
  FROM Patients
  WHERE conditions LIKE 'DIAB1%'
     OR conditions LIKE '% DIAB1%';

===============================================================================
*/

-- PostgreSQL query solution
SELECT patient_id,
       patient_name,
       conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'      -- prefix at start
   OR conditions LIKE '% DIAB1%';   -- prefix after space
