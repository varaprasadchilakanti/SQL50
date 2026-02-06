
# Crack SQL Interview in 50 Qs — Problem Solving Principles & Architecture Guidelines

This document defines the foundational principles, design philosophies, and coding standards for solving SQL problems in the **SQL 50 Interview Prep** module. It is intended to guide developers and LLMs toward producing elegant, efficient, and extensible SQL solutions in the context of interview preparation and enterprise data systems.

---

## 1. SQL Design Principles

- **Single Responsibility**: Each query must solve one well‑defined problem (e.g., filtering, aggregation, join).  
- **Readability First**: Queries should be intention‑revealing, with clear aliases and indentation.  
- **Declarative Style**: Focus on *what* data is needed, not *how* to compute it procedurally.  
- **Set‑Based Thinking**: Favor set operations over row‑by‑row logic.  
- **Portability**: Use ANSI SQL where possible; note dialect‑specific features explicitly.  

---

## 2. Clean Architecture for SQL

- Separate **core query logic** from orchestration (scripts, pipelines).  
- Use **CTEs (Common Table Expressions)** for modularity and readability.  
- Keep queries **composable** and **swappable** (e.g., replace aggregation strategy without breaking schema).  
- Favor **joins and subqueries** over nested procedural constructs.  

---

## 3. Efficiency & Elegance

- Prioritize **indexed joins** and **filtered scans**.  
- Use **aggregations** and **window functions** for concise solutions.  
- Avoid redundant subqueries and repeated computations.  
- Ensure queries scale with realistic data volumes.  

---

## 4. Extensibility & Testability

- Design queries to handle **edge cases** gracefully (e.g., NULLs, duplicates).  
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

- Use format: `Q<question_number>_<problem_slug>.sql`  
- Organize by topic: `select/`, `joins/`, `aggregates/`, `subqueries/`, `advanced/`.  
- Include `README.md` in each folder with problem summaries and strategy notes.  

#### Example Project Structure

```bash
SQL50/
├── select/
│   ├── Q001_recyclable_low_fat_products.sql
│   ├── Q002_find_customer_referee.sql
│   └── README.md
├── joins/
│   ├── Q010_basic_joins.sql
│   ├── Q011_replace_employee_id.sql
│   └── README.md
├── aggregates/
│   ├── Q020_average_selling_price.sql
│   ├── Q021_project_employees.sql
│   └── README.md
├── subqueries/
│   ├── Q030_employees_whose_manager_left.sql
│   └── README.md
├── advanced/
│   ├── Q040_department_top_three_salaries.sql
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

This document is the grounding reference for all SQL problem‑solving workflows in the **SQL 50 Interview Prep** module. Any developer or LLM using this guide is expected to produce solutions that are **production‑grade**, **architecturally sound**, and **developer‑friendly**.  
