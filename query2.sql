-- Menampilkan data gabungan directors dengan genres limit 50

SELECT d.id, concat(d.first_name, ' ', d.last_name) AS director, g.name AS genre
FROM directors d
JOIN genres g ON d.id = g.id
LIMIT 50;

-- Menampilkan data gabungan movies dengan actor berdasarkan table asosiasi
SELECT m.title, m.release_date, m.rating, concat(a.first_name, ' ', a.last_name) AS actor
FROM movies m
JOIN movies_actors ma ON m.id = ma.movie_id
JOIN actors a ON a.id = ma.actor_id;
