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


# Comando para ver las tablas que tenemos en la base de datos
show tables;


# Comando para ver la estructura de una tabla
describe nombre_tabla;


# Comando para crear una base de datos
create database nombre_base_de_datos;
# Si la base de datos ya existe nos dará un error
create database if not exists nombre_base_de_datos;


# Comando para crear una tabla en una base de datos
# UNSIGNED: No permite valores negativos
CREATE TABLE IF NOT EXISTS books (
    book_id INTEGER UNSIGNED PRIMARY AUTO_INCREMENT,
    author ,
    title VARCHAR(100) NOT NULL,
    year INTEGER UNSIGNED NOT NULL DEFAUL 1900,
    language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
    cover_url VARCHAR(500),
    price DOUBLE(6, 2) NOT NULL DEFAULT 10.00,
    sellable TINYINT(1) DEFAULT 1,
    copies INTEGER UNSIGNED NOT NULL DEFAULT 1,
    description TEXT
);


# Comando para ver los errores que tenemos
show warnings;