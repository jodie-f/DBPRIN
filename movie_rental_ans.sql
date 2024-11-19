-- ----------- LAB 5 -----------
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

-- ----------- LAB 6 -----------
-- Q1
UPDATE address
SET phone = '02392844444'
WHERE address_id = 100;

-- Q2
EXPLAIN
SELECT *
FROM address
WHERE phone = '02392844444';

-- Q3
CREATE INDEX idx_phone on address (phone);

-- Q5
DROP INDEX idx_phone;

-- Q6
CREATE VIEW customer_details AS
SELECT
    CONCAT(cus.first_name, ' ', cus.last_name) AS "Customer",
    CONCAT(cus.email, ' | ', add.phone) AS "Contact Details",
    CONCAT(add.address, ' ', add.address2) AS "Customer Address",
    city.city AS "Customer City",
    cou.country AS "Customer Country"
FROM customer cus
    JOIN address add USING (address_id)
    JOIN city USING (city_id)
    JOIN country cou USING (country_id)
ORDER BY cou.country ASC;

SELECT * 
FROM customer_details;

-- Q7
SELECT
    city.city_id AS "City ID",
    city.city AS "City"
FROM country
    LEFT JOIN city USING (country_id)
WHERE country.country = 'United Kingdom'
ORDER BY city.city ASC;
