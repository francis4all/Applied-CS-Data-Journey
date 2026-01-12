-- Consultas

-- 1) Edad promedio de los alumnos
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()))) AS edad_promedio FROM alumnos;

-- 2) Mostrar la película más antigua
SELECT * FROM peliculas WHERE anio_estreno = (SELECT MIN(anio_estreno) FROM peliculas);

-- 3) Mostrar la película que dura más
SELECT * FROM peliculas WHERE duracion = (SELECT MAX(duracion) FROM peliculas);

-- 4) Listar solo los nombres de películas ordenados alfabéticamente
SELECT titulo FROM peliculas ORDER BY titulo;

-- 5) Mostrar los géneros que tienen más de 10 películas en el catálogo
SELECT genero, COUNT(*) AS cantidad_peliculas FROM peliculas GROUP BY(genero) HAVING COUNT(*) >= 10;

-- 6) Calcular la antigüedad promedio en años desde que se estrenaron las películas del catálogo
SELECT AVG(YEAR(CURDATE()) - anio_estreno) AS anio_promedio FROM peliculas;

-- 7) Mostrar el nombre de los dueños y el nombre de la(s) mascota(s) que tiene cada dueño
SELECT propietario.nombre AS duenio, mascotas.nombre AS mascota FROM propietario JOIN mascotas ON propietario.id = mascotas.propietario_id;

-- 8) Mostrar un listado de las mascotas sin dueño
SELECT * FROM mascotas WHERE propietario_id IS NULL;

-- 9) Mostrar las mascotas sin dueño y los dueños sin mascota en una única tabla como resultado de la consulta
SELECT 
mascotas.nombre AS mascota 
FROM mascotas 
WHERE propietario_id IS NULL

UNION

SELECT 
propietario.nombre AS duenio
FROM propietario 
LEFT JOIN mascotas ON propietario.id = mascotas.propietario_id
WHERE mascotas.propietario_id IS NULL;

-- 10) Mostrar el nombre de los dueños de dos o más mascota y el número de mascotas que tiene cada dueño
SELECT propietario.nombre AS propietario, COUNT(mascotas.id) AS numero_mascotas 
FROM propietario 
JOIN mascotas ON propietario.id = mascotas.propietario_id GROUP BY propietario.nombre
HAVING COUNT(mascotas.id) >= 2;