/*
===============================================================================
Q1341. Movie Rating
-------------------------------------------------------------------------------
Problem:
  Two tasks:
    1. Find the user who rated the greatest number of movies.
       - Tie → lexicographically smaller user name.
    2. Find the movie with the highest average rating in February 2020.
       - Tie → lexicographically smaller movie title.

Schema:
  Movies(movie_id INT PRIMARY KEY, title VARCHAR UNIQUE)
  Users(user_id INT PRIMARY KEY, name VARCHAR UNIQUE)
  MovieRating(movie_id INT, user_id INT, rating INT, created_at DATE,
              PRIMARY KEY(movie_id, user_id))

Constraints:
  - Each movie has unique title.
  - Each user has unique name.
  - Ratings are integers.
  - created_at is DATE.

Design Principles:
  - Single Responsibility: Separate queries for user and movie tasks.
  - Declarative Style: Use GROUP BY and ORDER BY with tie‑breaking.
  - Clean Architecture: CTEs for modularity.
  - Extensibility: Easy to adapt for other time ranges or metrics.

Edge Cases:
  - Multiple users with same count → lexicographically smallest.
  - Multiple movies with same average rating → lexicographically smallest.
  - No ratings in February 2020 → query returns empty for movie part.

Pseudocode:
  WITH user_counts AS (
    SELECT u.name, COUNT(*) AS cnt
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY u.name
    ORDER BY cnt DESC, u.name ASC
    LIMIT 1
  ),
  feb_avg AS (
    SELECT m.title, AVG(mr.rating) AS avg_rating
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
    ORDER BY avg_rating DESC, m.title ASC
    LIMIT 1
  )
  SELECT name AS results FROM user_counts
  UNION ALL
  SELECT title FROM feb_avg;

===============================================================================
*/

-- PostgreSQL query solution
WITH user_counts AS (
    SELECT u.name, COUNT(*) AS cnt
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY u.name
    ORDER BY cnt DESC, u.name ASC
    LIMIT 1
),
feb_avg AS (
    SELECT m.title, AVG(mr.rating) AS avg_rating
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    WHERE mr.created_at BETWEEN DATE '2020-02-01' AND DATE '2020-02-29'
    GROUP BY m.title
    ORDER BY avg_rating DESC, m.title ASC
    LIMIT 1
)
SELECT name AS results FROM user_counts
UNION ALL
SELECT title FROM feb_avg;
