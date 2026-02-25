/*
===============================================================================
Q1075. Project Employees I
-------------------------------------------------------------------------------
Problem:
  Report the average experience years of employees working on each project.
  - average_years = AVG(experience_years) per project.
  - Round to 2 decimal places.

Schema:
  Project(project_id INT,
          employee_id INT,
          PRIMARY KEY(project_id, employee_id))

  Employee(employee_id INT PRIMARY KEY,
           name VARCHAR,
           experience_years INT NOT NULL)

Constraints:
  - Each project has one or more employees.
  - experience_years is guaranteed not NULL.
  - Need to join Project with Employee to access experience_years.

Design Principles:
  - Single Responsibility: Query computes average experience per project.
  - Declarative Style: Use JOIN and GROUP BY.
  - Clean Architecture: No unnecessary subqueries.
  - Extensibility: Easy to add more metrics (e.g., min/max experience).

Edge Cases:
  - Projects with only one employee → average = that employee’s experience.
  - Projects with multiple employees → average across all.
  - Empty tables → returns empty set.

Pseudocode:
  SELECT p.project_id,
         ROUND(AVG(e.experience_years)::numeric, 2) AS average_years
  FROM Project p
  JOIN Employee e
    ON p.employee_id = e.employee_id
  GROUP BY p.project_id;

===============================================================================
*/

-- PostgreSQL query solution
SELECT p.project_id,
       ROUND(AVG(e.experience_years)::numeric, 2) AS average_years
FROM Project p
JOIN Employee e
  ON p.employee_id = e.employee_id
GROUP BY p.project_id;
