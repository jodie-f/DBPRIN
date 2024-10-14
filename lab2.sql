-- QUESTION 7

CREATE DATABASE dbprin_lab2;

CREATE TABLE animal_type(
    animal_type_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) UNIQUE NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);

CREATE TABLE menagerie(
    menagerie_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    date_acquired DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    acquired_from VARCHAR(250) NOT NULL,
    name VARCHAR(50) NOT NULL,
    notes TEXT, 
    FOREIGN KEY (common_name) REFERENCES animal_type (common_name)
);

INSERT INTO animal_type (common_name, scientific_name, conservation_status)
VALUES
('Bengal Tiger', 'Panthera tigris tigris', 'Endangered'),
('Arctic Wolf', 'Canis lupus arctos', 'Least Concern');

INSERT INTO menagerie (common_name, date_acquired, gender, acquired_from, name, notes)
VALUES
('Bengal Tiger', '2011-07-14', 'F', 'Dhaka Zoo', 'Ariel', 'Healthy coat at last exam'),
('Arctic Wolf', '2008-09-30', 'F', 'National Zoo', 'Freddy', 'Strong appetite'),
('Bengal Tiger', '2006-06-01', 'M', 'Scotland Zoo', 'Spark', 'Likes to play'),
('Arctic Wolf', '2007-06-12', 'F', 'Southampton National Park', 'Mia', 'Doesn''t like sun');

SELECT * FROM animal_type;
SELECT * FROM menagerie;

-- QUESTION 8
SELECT
    a.common_name,
    a.scientific_name,
    m.name,
    m.date_acquired 
FROM animal_type a
    LEFT JOIN menagerie m USING (common_name)
WHERE a.conservation_status = 'Endangered';
