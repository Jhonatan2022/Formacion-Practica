# Accedemos a la siguiente ruta por medio de la terminal
cd C:\Program Files\MySQL\MySQL Workbench 8.0


# Para limpiar la pantalla de la terminal en mysql
system cls


# Accedemos al servicio de bases de datos con el siguiente comando
mysql -u root -h localhost -p # Nos pedirá la contraseña


# Comando para ver las bases de datos que tenemos
show databases;


# Comando para usar una base de datos
use nombre_base_de_datos;


# Comando para saber en que base de datos estamos
select database();

# Comando para crear una base de datos
create database nombre_base_de_datos;
# Si la base de datos ya existe nos dará un error
create database if not exists nombre_base_de_datos;



# 🚫Nunca usa ON DUPLICATE KEY IGNORE ALL⛔ PROHIBIDISIMOOOOOOOOOOOOOOOOOOOO */
INSERT INTO clients(name, email, birthdate, gender, active) VALUES("Royer G", "royjuni3431@gmail.com", "2002-02-16", "M", 0)
    ON DUPLICATE KEY IGNORE All;



# Forma de actualizar datos de un registro
INSERT INTO clients(name, email, birthdate, gender, active) VALUES ("Jose Hidalgo", "Jose.05903641R@random.names", "1973-08-13 00:00:00", "M", 1)
    ON DUPLICATE KEYUPDATE active = VALUES(active);


# Comando para insertar datos con subconsultas
INSERT INTO books (title, author_id, `year`) VALUES ("Bien hecho amigo", 
    (SELECT author_id
        FROM authors
        WHERE name = "Charles Dickens" ), 1999 );


# Comando para ver las tablas que tenemos en la base de datos
show tables;


# Comando para ver la estructura de una tabla
describe nombre_tabla; # O también se puede usar desc nombre_tabla;


# Comando para ver toda la descripción de una tabla
show full columns from nombre_tabla;


# Comando para ver los datos de una tabla
SELECT * FROM nombre_tabla;


# Comando para ver los datos de manera más legible
SELECT * FROM nombre_tabla\G # El \G es para que nos muestre los datos de manera vertical

# Comando para eliminar una tabla
drop table nombre_tabla;

# Comando para ver los errores que tenemos
show warnings;


# Comando para eliminar el contenido de una tabla
truncate nombre_tabla;


# Calculamos la edad de las personas
SELECT CONCAT("AGE:",
        YEAR(NOW()) - YEAR(birthdate),
        " NAME: ",
        name) AS information
    FROM clients LIMIT 10;



SELECT * FROM authors WHERE author_id > 0 AND author_id <= 5;


SELECT b.book_id,
        a.name AS author_name,
        a.author_id,
        b.title
    FROM books AS b
INNER JOIN authors AS a
    ON a.author_id = b.author_id
    WHERE a.author_id
    BETWEEN 1
        AND 5;



SELECT c.name,
        b.title,
        a.name AS author_name,
        t.type
    FROM transactions AS t
INNER JOIN books AS b
    ON t.book_id = b.book_id
INNER JOIN clients AS c
    ON t.client_id = c.client_id
INNER JOIN authors AS a
    ON b.author_id = a.author_id
    WHERE c.gender = "M"
        AND t.type IN ("sell","lend");




SELECT a.author_id,
        a.name,
        a.nationality,
        b.title
    FROM authors AS a
LEFT JOIN books AS b
    ON b.author_id = a.author_id
    WHERE a.author_id
    BETWEEN 1
        AND 5
ORDER BY  a.author_id;




SELECT a.author_id,
        a.name,
        a.nationality,
        COUNT(b.book_id)
    FROM authors AS a
LEFT JOIN books AS b
    ON b.author_id = a.author_id
    WHERE a.author_id
    BETWEEN 1
        AND 5
    GROUP BY  a.author_id
ORDER BY  a.author_id;





# TRANSFORMANDO PREGUNTAS EN CONSULTAS
# 1. ¿Qué nacionalidades hay?
# Mediante la clausula DISTINCT trae solo los elementos distintos
SELECT DISTINCT nationality 
FROM authors
ORDER BY 1;




# 2. ¿Cuántos escritores hay de cada nacionalidad?
#  IS NOT NULL para traer solo los valores diferentes de nulo
#  NOT IN para traer valores que no sean los declarados (RUS y AUT)
SELECT nationality,
        COUNT(author_id) AS c_authors
    FROM authors
    WHERE nationality IS NOT NULL
        AND nationality NOT IN ("RUS")
    GROUP BY  nationality
ORDER BY  c_authors DESC, nationality ASC;



# 4. ¿Cuál es el promedio/desviación standard del precio de libros?
SELECT a.nationality,
        AVG(b.price) AS promedio,
        STDDEV(b.price) AS std
    FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
    GROUP BY  a.nationality
ORDER BY  promedio DESC;



# 5. ¿Cuál es el promedio/desviación standard del precio de libros por nacionalidad?
# Agrupar por la columna pivot
SELECT a.nationality,
        COUNT(b.book_id) AS libros,
        AVG(b.price) AS promedio,
        STDDEV(b.price) AS std
    FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
    GROUP BY  a.nationality
ORDER BY  libros DESC;



# 6. ¿Cuál es el precio máximo/mínimo de un libro?
SELECT nationality,
        MAX(price),
        MIN(price)
    FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
    GROUP BY  nationality;



# 7. ¿cómo quedaría el reporte de préstamos?
# CONCAT: para concatenar en cadenas de texto.
# TO_DAYS: recibe un timestamp ó un datetime
SELECT c.name,
        t.type,
        b.title,
        CONCAT(a.name,
        " (",
        a.nationality,
        ")") AS autor,
        TO_DAYS(NOW()) - TO_DAYS(t.created_at)
    FROM transactions AS t
LEFT JOIN clients AS c
    ON c.client_id = t.client_id
LEFT JOIN books AS b
    ON b.book_id = t.book_id
LEFT JOIN authors AS a
    ON b.author_id = a.author_id;




# eLIMINAR CON LIMITE
DELETE
    FROM authors
    WHERE author_id = 161 LIMIT 1;



# UPDATE basico
UPDATE clients SET active = 0
    WHERE client_id = 80 LIMIT 1;



# 
SELECT  sellable, SUM(price*copies) FROM books GROUP BY sellable;


# Usanso condicionales
SELECT COUNT(book_id),
        SUM(IF(year < 1950,
        1,
        0)) AS old_books,
        SUM(IF(year >= 1950
        AND year < 1990, 1, 0)) AS new_books, SUM(IF(year >= 1990
        AND year < 2000, 1, 0)) AS new_books_2000, SUM(IF(year >= 2000, 1, 0)) AS "new_books_>2000"
    FROM books;




# Agrupar el query anterior y mostrar su nacionalidad
SELECT nationality,
        COUNT(book_id),
        SUM(IF(year < 1950,
        1,
        0)) AS `<1950`,
        SUM(IF(year >= 1950
        AND year < 1990, 1, 0)) AS `<1990`, SUM(IF(year >= 1990
        AND year < 2000, 1, 0)) AS `<2000`, SUM(IF(year >= 2000, 1, 0)) AS `<hoy`
    FROM books AS b
JOIN authors AS a
    ON a.author_id = b.author_id
    WHERE a.nationality IS NOT NULL
    GROUP BY  nationality;


# Comando para alterar una tabla
# AFTER para indicar que columna va despues de la columna indicada
ALTER TABLE authors ADD COLUMN birthyear INTEGER DEFAULT 1930 AFTER name;


# Comando para modificar una tabla
ALTER TABLE authors MODIFY COLUMN birthyear year(4) DEFAULT 1920;


# Comando para eliminar una columna de una tabla
ALTER TABLE authors DROP COLUMN birthyear;


# MYSQLUMP para hacer un backup de la base de datos en un archivo sql (solo estructura)
mysqldump -u root -p database_name 


# MYSQLUMP para hacer un backup de la base de datos pero sin los datos
mysqldump -u root -p -d database_name


# MYSQLUMP para hacer un backup de la base de datos pero sin los datos y insertarlo en un archivo sql
mysqldump -u root -p -d database_name > database_name.sql