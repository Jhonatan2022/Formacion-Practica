-- DML trata del contenido de la base de datos. Son las siglas de Data Manipulation Language y sus comandos son:

-- Insert: Inserta o agrega nuevos registros a la tabla.
-- Update: Actualiza o modifica los datos que ya existen.
-- Delete: Esta sentencia es riesgosa porque puede borrar el contenido de una tabla.
-- Select: Trae información de la base de datos.




--Insertamos datos en person
INSERT INTO person (last_name, first_name, address, city)
VALUES ('Ruben', 'Diaz', 'r@gmail.com', 'Ciudad de México');




--Actualizamos datos en person
UPDATE person
SET first_name = 'Actualizado', city = 'No me Acuerdo :('
WHERE person_id = 5;

-- Actualizamos a todos los que vivan en bogotá (Mala practica)
UPDATE person
SET first_name = 'Actualizado'
WHERE city = 'Bogotá';




-- Eliminamos datos en person
DELETE FROM person
WHERE person_id = 5;




-- Seleccionamos datos en person
SELECT * FROM person;
SELECT first_name, last_name FROM person;
SELECT first_name, last_name FROM person WHERE city = 'Bogotá';