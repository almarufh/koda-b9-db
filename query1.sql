-- Mengambil data movie > 2020
SELECT id, title, release_date, rating
FROM movies
WHERE EXTRACT(year FROM release_date) = 2020;

-- Mengambil list actor firsname %s
SELECT id, first_name, last_name
FROM actors
WHERE lower(first_name) LIKE lower('%s');

-- Mengambil data movie rating 4 - 8 tahun 2010-2014
SELECT id, title, release_date, rating
FROM movies
WHERE rating BETWEEN 4 and 8 AND EXTRACT(year FROM release_date) BETWEEN 2010 and 2014;