-- Llamamos todos los datos de la tabla posts
SELECT * FROM posts;


-- Fecha de publicación mayor a 2020
SELECT * FROM posts WHERE fecha_publicacion > '2020-01-01';
SELECT * FROM posts WHERE fecha_publicacion < '2020-01-01';


-- AS nos permite darle un alias a una columna
SELECT titulo, fecha_publicacion AS fecha, estatus FROM estado;

-- COUNT nos permite contar el número de registros
SELECT COUNT(*) FROM posts;




------------------------------------------
-- LEFT JOIN (Izquierda) - Tabla principal
SELECT * FROM usuarios LEFT JOIN posts ON usuarios.id = posts.usuario_id;
-- Traemos los usuarios que no tienen posts
SELECT 
    *
FROM
    usuarios
        LEFT JOIN
    posts ON usuarios.id = posts.usuario_id
WHERE
    posts.usuario_id IS NULL;




------------------------------------------
-- RIGHT JOIN (Derecha) - Tabla principal
SELECT 
    *
FROM
    usuarios
        RIGHT JOIN
    posts ON usuarios.id = posts.usuario_id;
-- Traemos los posts que no tienen usuarios
SELECT 
    *
FROM
    usuarios
        RIGHT JOIN
    posts ON usuarios.id = posts.usuario_id
WHERE
    posts.usuario_id IS NULL;




------------------------------------------
-- INNER JOIN (Izquierda y derecha) - Tabla principal (No trae los que no tienen relación (NULL))
SELECT * FROM usuarios INNER JOIN posts ON usuarios.id = posts.usuario_id;




------------------------------------------
-- FULL JOIN (Izquierda y derecha) - La tabla principal y las que no tienen relación (NULL)
SELECT 
    *
FROM
    usuarios FULL
        JOIN
    posts ON usuarios.id = posts.usuario_id;


-- Traemos los campos que tienen null
SELECT 
    *
FROM
    usuarios FULL
        JOIN
    posts ON usuarios.id = posts.usuario_id
WHERE
    posts.usuario_id IS NULL
        OR usuarios.id IS NULL;


-- Traemos los campos que no tienen null
SELECT 
    *
FROM
    usuarios FULL
        JOIN
    posts ON usuarios.id = posts.usuario_id
WHERE
    posts.usuario_id IS NOT NULL
        AND usuarios.id IS NOT NULL;



-- Simulación de FULL JOIN
SELECT 
    *
FROM
    usuarios
        LEFT JOIN
    posts ON usuarios.id = posts.usuario_id 
UNION SELECT 
    *
FROM
    usuarios
        RIGHT JOIN
    posts ON usuarios.id = posts.usuario_id;


-- Traemos los campos que tienen null
SELECT 
    *
FROM
    usuarios
        LEFT JOIN
    posts ON usuarios.id = posts.usuario_id
WHERE
    posts.usuario_id IS NULL 
UNION SELECT 
    *
FROM
    usuarios
        RIGHT JOIN
    posts ON usuarios.id = posts.usuario_id
WHERE
    posts.usuario_id IS NULL;


-- Traemos los campos que no tienen null
SELECT 
    *
FROM
    usuarios
        LEFT JOIN
    posts ON usuarios.id = posts.usuario_id
WHERE
    posts.usuario_id IS NOT NULL 
UNION SELECT 
    *
FROM
    usuarios
        RIGHT JOIN
    posts ON usuarios.id = posts.usuario_id
WHERE
    posts.usuario_id IS NOT NULL;




------------------------------------------
-- LIKE - Buscar coincidencias
-- creacion% - Buscar que empiecen con creacion
-- %creacion - Buscar que terminen con creacion
SELECT * FROM posts WHERE titulo LIKE '%creacion%';
-- NOT LIKE - Buscar que no coincidan
SELECT * FROM posts WHERE titulo NOT LIKE '%creacion%';




------------------------------------------
-- BETWEEN - Buscar entre un rango
SELECT * FROM posts WHERE fecha_publicacion BETWEEN '2020-01-01' AND '2020-12-31';
-- NOT BETWEEN - Buscar que no estén entre un rango
SELECT * FROM posts WHERE fecha_publicacion NOT BETWEEN '2020-01-01' AND '2020-12-31';
-- YEAR - Buscar por año
SELECT * FROM posts WHERE YEAR(fecha_publicacion) BETWEEN '2020' AND '2021';
-- Traemos solo el mes
SELECT * FROM posts WHERE MONTH(fecha_publicacion) BETWEEN '01' AND '12';




------------------------------------------
-- Consulta propia
-- id que no esten nulos
-- estatus activo
-- id mayor a 50
-- categoria_id = 2
-- año 2028
SELECT 
    *
FROM
    posts
WHERE
    usuario_id IS NOT NULL
        AND estatus = 'activo'
        AND id > 50
        AND categoria_id = 2
        AND YEAR(fecha_publicacion) = '2028';





------------------------------------------
-- GROUP BY - Agrupar por un campo
-- Hacemos un conteo de los estatus de los posts
SELECT 
    estatus, COUNT(*) AS posts_number
FROM
    posts
GROUP BY estatus;


-- Consulta propia
-- Filtramos año
-- Contamos los posts por año
-- Mostramos los que sean diferentes a 2018
SELECT 
    YEAR(fecha_publicacion) AS año, COUNT(*) AS num_post
FROM
    posts
WHERE
    YEAR(fecha_publicacion) != 2018
GROUP BY YEAR(fecha_publicacion);


-- Consulta propia
-- Filtramos mes
-- Contamos los posts por mes
-- Mostramos los que sean diferentes a December
-- Mostramos los que sean mayores a 5
SELECT MONTHNAME(fecha_publicacion) AS mes_post, COUNT(*) AS cantidad_post FROM posts  WHERE monthname(fecha_publicacion) != 'December' GROUP BY mes_post HAVING COUNT(*) > 5; 





------------------------------------------
-- ORDER BY - Ordenar por un campo
-- Ordenamos las fechas de los posts de manera acendente 
SELECT * FROM posts ORDER BY fecha_publicacion ASC;
-- Descendente
SELECT * FROM posts ORDER BY fecha_publicacion DESC;
-- por cadena
SELECT * FROM posts ORDER BY titulo ASC;
-- por cadena descendente
SELECT * FROM posts ORDER BY titulo DESC;
-- LIMIT - Limitar la cantidad de registros
SELECT * FROM posts ORDER BY fecha_publicacion DESC LIMIT 2;





------------------------------------------
-- HAVING - Filtrar por un campo
-- Filtramos el mes de publicación
-- Contamos los posts por mes
-- Agrupamos por estatus y mes
-- Mostramos los que sean mayores a 3
-- Ordenamos de manera ascendente
SELECT 
    MONTHNAME(fecha_publicacion) AS Mes_De_Publicacion,
    estatus,
    COUNT(*) AS Posts_Count
FROM
    posts
GROUP BY estatus , Mes_De_Publicacion
HAVING COUNT(*) >= 3
ORDER BY COUNT(*) ASC; 




------------------------------------------
-- Querys anidados - Subconsultas - Consultas anidadas
SELECT 
    new_table_projection.date, COUNT(*) AS posts_count
FROM
    (SELECT 
        DATE(MIN(fecha_publicacion)) AS DATE,
            YEAR(fecha_publicacion) AS post_year
    FROM
        posts
    GROUP BY post_year) AS new_table_projection
GROUP BY new_table_projection.date
ORDER BY new_table_projection.date;