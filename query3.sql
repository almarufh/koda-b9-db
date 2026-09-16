-- Menampilkan list directors beserta jumlah genres sudah di direct
SELECT concat(d.first_name, ' ', d.last_name) AS director, concat(COUNT(g.id), ' Genre') AS Total
FROM directors d
JOIN genres g ON d.id = g.id
GROUP BY g.id, d.first_name, d.last_name;

-- Menampilkan list actor dengan peran lebih dari 5
SELECT concat(a.first_name, ' ', a.last_name) AS director, concat(COUNT(ma.role), ' ', 'Peran') AS total
FROM actors a 
JOIN movies_actors ma ON a.id = ma.actor_id
GROUP BY ma.actor_id, a.first_name, a.last_name
HAVING COUNT(ma.role) > 5;

-- Menampilkan director ter produktif 
SELECT concat(d.first_name, ' ', d.last_name), concat(MAX(m.id), ' ', 'Movies') AS Total
FROM directors d
JOIN movies m ON d.id = m.director_id
GROUP BY d.first_name, d.last_name
ORDER BY MAX(m.id) DESC
LIMIT 1;

-- Menampilkan tahunn tersibuk BELUM KELAR
SELECT EXTRACT(year FROM release_date) AS Tahun, concat(COUNT(id), ' Movies') AS "Release"
FROM movies
GROUP BY EXTRACT(year FROM release_date)
ORDER BY COUNT(id) DESC
LIMIT 1;

-- Mendapatkan data movies dengan list actors yang disatukan menjadi 1 kolom
SELECT concat(a.first_name, ' ', a.last_name) AS actors, concat(COUNT(m.id), ' Movies') AS Total, string_agg(m.title, ', ') AS Movies
FROM actors a
JOIN movies_actors ma ON ma.actor_id = a.id
JOIN movies m ON m.id = ma.movie_id
GROUP BY a.first_name, a.last_name
ORDER BY a.first_name ASC;
