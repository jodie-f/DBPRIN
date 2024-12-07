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
WHERE city.country_id = (
  SELECT country.country_id
  FROM country
  WHERE country.country = 'United Kingdom'
)
ORDER BY city.city ASC;

-- Q8
SELECT
  city.city_id AS "City ID",
  city.city AS "City",
  country.country AS "Country"
FROM country
  LEFT JOIN city USING (country_id)
WHERE city.country_id IN (
  SELECT country.country_id
  FROM country
  WHERE country.country = 'United Kingdom' OR country.country = 'France'
)
ORDER BY country.country, city.city ASC;

-- ----------- LAB 7 -----------
-- Q1
-- a)
CREATE ROLE junior_analyst WITH LOGIN PASSWORD 'password1';

-- b)
psql -h localhost -p 5432 -U junior_analyst -d movie_rental

-- c)
SELECT * FROM staff;
-- ERROR:  permission denied for table staff

-- d)
GRANT SELECT ON staff TO junior_analyst;

-- Q2
-- a)
CREATE ROLE cashier WITH LOGIN PASSWORD 'password1';

-- b)
GRANT INSERT ON payment_p2022_01 TO cashier;
GRANT USAGE, SELECT ON SEQUENCE payment_p2022_01_payment_id_seq TO cashier;

-- c)
psql -h localhost -p 5432 -U cashier -d movie_rental

-- d)
INSERT INTO payment_p2022_01(customer_id, staff_id, rental_id, amount, payment_date) VALUES (1, 1, 1, 5.99, CURRENT_TIMESTAMP);

-- Q3
-- a)
GRANT INSERT ON rental TO cashier;
GRANT SELECT ON rental TO cashier;

-- d)
GRANT DELETE ON rental TO cashier;

-- Q4
-- a)
CREATE ROLE manager WITH LOGIN PASSWORD 'password1';
GRANT UPDATE ON country TO manager WITH GRANT OPTION;

-- b)
CREATE ROLE sales WITH LOGIN;

-- c)
GRANT UPDATE, SELECT ON country TO sales;

-- Q5
-- a)
GRANT SELECT ON customer_view TO sales;

-- Q6
-- a)
CREATE ROLE admin WITH CREATEROLE;

-- b)
CREATE ROLE valadam WITH LOGIN PASSWORD '8cb2237d0679ca88db6464eac60da96345513964';
GRANT admin TO valadam;

-- Q7
CREATE ROLE senior_analyst WITH LOGIN PASSWORD 'password1';
GRANT CREATE ON SCHEMA public TO senior_analyst;
GRANT USAGE ON SCHEMA public TO senior_analyst;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM senior_analyst;
SET ROLE senior_analyst;

CREATE TABLE new_table();
SELECT * FROM customer;