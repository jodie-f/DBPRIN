SELECT
  movie_id AS "Movie ID",
  movie_title AS "Movie_Title",
  movie_lang AS "LANGUAGE",
  cat_name AS "Category"
FROM
  movie
  INNER JOIN category ON movie.movie_id = category.movie_id
WHERE
  movie_title = ALADDIN CALENDAR;
  
-- ----------- movie_rental db questions -----------
-- Q3
\dv

-- Q4
EXPLAIN ANALYZE
SELECT m.title
FROM movie m
  JOIN movie_category mc USING (movie_id)
  JOIN category c USING (category_id)
WHERE c.name = 'Documentary'; -- 68 rows

EXPLAIN ANALYZE
SELECT m.title
FROM movie m
  JOIN movie_category mc USING (movie_id)
  JOIN category c USING (category_id)
WHERE c.category_id = 6; -- 68 rows

-- Q4
SELECT
  m.title,
  m.release_year
FROM movie m
  JOIN language l USING (language_id)  --ON (m.original_language_id = l.language_id)
WHERE m.original_language_id = 2
ORDER BY m.release_year ASC;

-- Q5
SELECT
  c.name AS "Category",
  l.name AS "Original Language",
  COUNT(m.movie_id) AS "Number of Movies"
FROM language l
  LEFT JOIN movie m ON (l.language_id = m.original_language_id)
  LEFT JOIN movie_category mc USING (movie_id)
  LEFT JOIN category c USING (category_id)
GROUP BY c.name, l.name
ORDER BY c.name ASC;
