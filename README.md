
# Crack SQL Interview in 50 Qs — Problem Solving Principles & Architecture Guidelines

This repository contains solutions to the **SQL 50 Interview Prep** problems, organized by category. It is both a study resource and a demonstration of clean, production‑grade SQL practices.  

The goal is not just to solve problems, but to **codify principles, design philosophies, and architectural guidelines** that make SQL queries elegant, efficient, and extensible.

---

## 1. SQL Design Principles

- **Single Responsibility**: Each query solves one well‑defined problem.  
- **Readability First**: Queries are intention‑revealing, with clear aliases and indentation.  
- **Declarative Style**: Focus on *what* data is needed, not *how* to compute it procedurally.  
- **Set‑Based Thinking**: Favor set operations over row‑by‑row logic.  
- **Portability**: Use ANSI SQL where possible; note dialect‑specific features explicitly.  

---

## 2. Clean Architecture for SQL

- Use **CTEs (Common Table Expressions)** for modularity and readability.  
- Separate **core query logic** from orchestration (scripts, pipelines).  
- Keep queries **composable** and **swappable** (e.g., replace aggregation strategy without breaking schema).  
- Favor **joins and subqueries** over procedural constructs.  

---

## 3. Efficiency & Elegance

- Prioritize **indexed joins** and **filtered scans**.  
- Use **aggregations** and **window functions** for concise solutions.  
- Avoid redundant subqueries and repeated computations.  
- Ensure queries scale with realistic data volumes.  

---

## 4. Extensibility & Testability

- Handle **edge cases** gracefully (NULLs, duplicates, boundary values).  
- Use **parameterization** for dynamic filtering.  
- Structure queries for **unit testing** against sample datasets.  
- Ensure transformations are **traceable** and **auditable**.  

---

## 5. Developer Experience

- Treat each SQL problem as a **mini‑system**, not a throwaway snippet.  
- Use **comments** to document intent and assumptions.  
- Structure files and folders for **discoverability** and **reuse**.  
- Follow **DRY**, **KISS**, and **YAGNI** principles.  
- Focus on clarity and correctness first; optimize later.  

---

## 6. Query Structure Template

```sql
-- Problem: <Problem Title>
-- Description: <Concise explanation of the task>
-- Assumptions: <Schema notes, edge cases>
-- Strategy: <Step-by-step approach>

WITH base AS (
    SELECT ...
    FROM ...
    WHERE ...
)
SELECT
    ...
FROM base
JOIN ...
ON ...
GROUP BY ...
ORDER BY ...;
```

---

## 7. Pseudocode Convention

- Use **step‑by‑step logic** for query design.  
- Highlight **joins, filters, aggregations, window functions**.  
- Reflect modularity and clarity as in final SQL.  

---

## 8. File Naming & Organization

- File format: `Q<question_number>_<problem_slug>.sql`  
- Organized by LeetCode SQL 50 categories:  
  - `basic_select/`  
  - `joins/`  
  - `basic_aggregate_functions/`  
  - `sorting_and_grouping/`  
  - `subqueries/`  
  - `advanced_select_and_joins/`  
  - `advanced_string_functions_regex_clause/`  

#### Example Project Structure

```bash
SQL50/
├── basic_select/
│   ├── Q1757_recyclable_low_fat_products.sql
│   ├── Q584_find_customer_referee.sql
│   └── README.md
├── joins/
│   ├── Q1068_product_sales_analysis_I.sql
│   ├── Q1378_replace_employee_id.sql
│   └── README.md
├── basic_aggregate_functions/
│   ├── Q251_average_selling_price.sql
│   ├── Q1075_project_employees_I.sql
│   └── README.md
├── sorting_and_grouping/
│   ├── Q2356_number_of_unique_subjects.sql
│   ├── Q596_classes_with_at_least_5_students.sql
│   └── README.md
├── subqueries/
│   ├── Q030_employees_whose_manager_left.sql
│   ├── Q626_exchange_seats.sql
│   └── README.md
├── advanced_select_and_joins/
│   ├── Q1204_last_person_to_fit_in_the_bus.sql
│   ├── Q1789_primary_department_for_each_employee.sql
│   └── README.md
├── advanced_string_functions_regex_clause/
│   ├── Q1667_fix_names_in_a_table.sql
│   ├── Q196_delete_duplicate_emails.sql
│   └── README.md
└── README.md
```

---

## 9. Philosophy

We build SQL workflows that are:

- **Modular**: Each query is replaceable and independently testable.  
- **Resilient**: Handles edge cases and messy data gracefully.  
- **Elegant**: Minimal, expressive, and intention‑driven.  
- **Extensible**: Designed to evolve without breaking existing behavior.  

---

## 10. Contribution Guidelines

- Follow the naming convention strictly.  
- Add a short **problem summary** at the top of each `.sql` file.  
- Keep commits atomic: one problem per commit.  
- Use commit messages like:  
  - `feat: add Q1204 last person to fit in the bus`  
  - `chore: restructure SQL50 folders`  

---

This document is the **grounding reference** for all SQL problem‑solving workflows in the **SQL 50 Interview Prep** module. Any developer or LLM using this guide is expected to produce solutions that are **production‑grade**, **architecturally sound**, and **developer‑friendly**.  
