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
  
