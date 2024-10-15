-- DATABASE IMPLEMENTATION
CREATE DATABASE dbprin_lab3;

CREATE TABLE languages (
    language_id SERIAL PRIMARY KEY,
    language_name VARCHAR(50) UNIQUE NOT NULL,
    language_code CHAR(2) UNIQUE NOT NULL
);

CREATE TABLE actor (
    actor_id SERIAL PRIMARY KEY,
    actor_name VARCHAR(100) NOT NULL,
    actor_lname VARCHAR(100) NOT NULL,
    actor_dob DATE NOT NULL
);

CREATE TABLE film (
    film_id SERIAL PRIMARY KEY,
    film_title VARCHAR(100) NOT NULL,
    release_date DATE NOT NULL,
    language_id INT NOT NULL,
    original_language_id INT NOT NULL,

    FOREIGN KEY (language_id) REFERENCES languages (language_id),
    FOREIGN KEY (original_language_id) REFERENCES languages (language_id)
);

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE film_actor (
    film_id INT NOT NULL,
    actor_id INT NOT NULL,

    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
    PRIMARY KEY (film_id, actor_id)
);

CREATE TABLE film_category (
    film_id INT NOT NULL,
    category_id INT NOT NULL,

    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (category) REFERENCES category(category_id),
    PRIMARY KEY (film_id, category_id)
);

-- MOCK DATA 
INSERT INTO languages (language_id, language_name, language_code) 
VALUES
(1, 'Chinese', 'ZH'),
(2, 'Latvian', ''),
(3, 'Hiri Motu', ''),
(4, 'Tswana', ''),
(5, 'Tswana', ''),
(6, 'Quechua', ''),
(7, 'Dzongkha', ''),
(8, 'Maltese', ''),
(9, 'Papiamento', ''),
(10, 'Luxembourgish', '');

-- QUERIES
SELECT
FROM
WHERE
;


SELECT
FROM
WHERE
;


SELECT
FROM
WHERE
;


SELECT
FROM
WHERE
;