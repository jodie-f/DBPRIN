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
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    PRIMARY KEY (film_id, category_id)
);

-- MOCK DATA 
INSERT INTO languages (language_id, language_name, language_code) 
VALUES
(1, 'Chinese', 'ZH'),
(2, 'Latvian', 'LV'),
(3, 'Hiri Motu', 'HO'),
(4, 'Tswana', 'TN'),
(5, 'Turkish', 'TR'),
(6, 'Quechua', 'QU'),
(7, 'Dzongkha', 'DZ'),
(8, 'Maltese', 'MT'),
(9, 'Polish', 'PL'),
(10, 'Luxembourgish', 'LB');

INSERT INTO actor (actor_name, actor_lname, actor_dob)
VALUES
('Idelle', 'Ashall', '1983-09-28'),
('Dael', 'Gullick', '1991-09-25'),
('Gerianne', 'Parmby', '1989-07-14'),
('Corrie', 'Riby', '1986-02-15'),
('Fair', 'Southernwood', '1954-06-11'),
('Laird', 'Oakly', '1973-05-31'),
('Thaine', 'Charpin', '1988-01-18'),
('Nealson', 'Bettington', '1966-01-26'),
('Beret', 'Masedon', '1994-04-26'),
('Alisa', 'Anfusso', '1995-01-04'),
('Marjy', 'Bly', '1969-12-24'),
('Kelcie', 'Ferroli', '1954-07-17'),
('Archibald', 'Kemmish', '1998-09-10'),
('Lauren', 'Corke', '1983-09-07'),
('Price', 'Harkin', '1981-10-12'),
('Cooper', 'Hazlehurst', '1959-10-21'),
('Lory', 'Matteacci', '1971-03-08'),
('Antoni', 'Konrad', '1951-10-26'),
('Leon', 'Essame', '1984-08-10'),
('Shepperd', 'Nicklinson', '1959-12-02'),
('Perla', 'Batho', '1969-11-18'),
('Barnabas', 'Gommery', '1961-04-10'),
('Abdul', 'Welburn', '1978-06-01'),
('Lorne', 'Pidgeley', '1980-04-24'),
('Joanne', 'Hallibone', '1996-05-11'),
('Vaclav', 'Lantuffe', '1988-01-27'),
('Charlie', 'Hornig', '1979-09-19'),
('Emilia', 'Messam', '1960-05-27'),
('Marje', 'Phizackarley', '1950-11-30'),
('Joly', 'Shatford', '1958-01-29'),
('Maryl', 'Somner', '1968-10-31');


INSERT INTO film (film_title, release_date, language_id, original_language_id)
VALUES
('Lucky One, The', '4/17/2024', 6, 2),
('39 Steps, The', '2/19/2024', 6, 6),
('Woman in The Septic Tank, The (Ang Babae sa septic tank)', '6/20/2024', 4, 6),
('Superman/Shazam!: The Return of Black Adam (DC Showcase Original Shorts Collection)', '5/17/2024', 7, 2),
('Hangtime - Kein leichtes Spiel', '6/28/2024', 1, 10),
('Rush Hour 2', '7/18/2024', 8, 1),
('They Made Me a Criminal (I Became a Criminal) (They Made Me a Fugitive)', '8/3/2024', 2, 9),
('Knights of the Round Table', '6/25/2024', 6, 3),
('24 Exposures', '6/20/2024', 3, 7),
('Omar Killed Me (Omar m''a tuer)', '6/21/2024', 7, 3),
('Deadfall', '5/11/2024', 8, 6),
('Doors, The', '2/4/2024', 4, 10),
('Professor Layton and the Eternal Diva (Eiga Reiton-kyôju to eien no utahime)', '2/15/2024', 1, 1),
('Animal Kingdom', '10/18/2024', 8, 5),
('Anna', '8/29/2024', 9, 3),
('Far Country, The', '5/2/2024', 1, 4),
('Teen Witch', '11/17/2023', 1, 9),
('Phantom of the Rue Morgue', '12/24/2023', 9, 2),
('Forgotten, The', '9/18/2024', 8, 6),
('The Invitation', '1/23/2024', 5, 7);

INSERT INTO category (category_name)
VALUES
('Romance'),
('Thriller'),
('Sci-Fi'),
('Adventure'),
('Children'),
('Drama'),
('Horror'),
('Documentary'),
('Comedy'),
('Fantasy');

INSERT INTO film_actor (film_id, actor_id)
VALUES
(1, 31),
(17, 13),
(5, 15),
(12, 8),
(4, 19),
(1, 6),
(20, 22),
(15, 1),
(18, 25),
(10, 24),
(9, 1),
(19, 2),
(15, 2),
(15, 20),
(15, 10),
(4, 28),
(11, 9),
(3, 22),
(7, 5),
(5, 6),
(9, 26),
(17, 4),
(7, 11),
(12, 15),
(5, 20),
(5, 30),
(17, 8),
(15, 5),
(17, 15),
(18, 10);

INSERT INTO film_category (film_id, category_id)
VALUES
(13, 7),
(1, 10),
(10, 10),
(7, 9),
(9, 9),
(9, 1),
(4, 5),
(8, 7),
(8, 2),
(11, 1);

-- QUERIES
SELECT
    CONCAT_WS(' ', a.actor_name, a.actor_lname) AS "Actor",
    f.film_title AS "Film Title"
FROM actor a
    JOIN film_actor fa USING (actor_id)
    JOIN film f USING (film_id)
WHERE film_title = 'Anna'
ORDER BY "Actor";

INSERT INTO languages (language_id, language_name, language_code) VALUES 
(11, 'Japanese', 'JP');

UPDATE film_category 
SET category_id = 10 
WHERE film_id = 7 AND category_id = 7;

DELETE FROM film_actor
WHERE film_id = 7 AND actor_id = 11;
