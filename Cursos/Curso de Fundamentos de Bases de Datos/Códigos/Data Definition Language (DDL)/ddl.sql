-- SQL tiene dos grandes sublenguajes:
-- DDL o Data Definition Language que nos ayuda a crear la estructura de una base de datos. Existen 3 grandes comandos:
-- Create: Nos ayuda a crear bases de datos, tablas, vistas, índices, etc.
-- Alter: Ayuda a alterar o modificar entidades.
-- Drop: Nos ayuda a borrar. Hay que tener cuidado al utilizarlo.


-- 3 objetos que manipularemos con el lenguaje DDL:
-- Database o bases de datos
-- Table o tablas. Son la traducción a SQL de las entidades
-- View o vistas: Se ofrece la proyección de los datos de la base de datos de forma entendible.

-- Creamos la base de datos con el metodo utf8 para que acepte caracteres especiales
CREATE SCHEMA `platziblog` DEFAULT CHARACTER SET utf8 ;




-- Creamos la tabla de people
CREATE TABLE `platziblog`.`people` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(255) NULL,
  `first_name` VARCHAR(255) NULL,
  `adress` VARCHAR(255) NULL,
  `city` VARCHAR(255) NULL,
  PRIMARY KEY (`person_id`));




-- Alteramos la tabla people y le agregamos el campo email
ALTER TABLE `platziblog`.`people`
ADD COLUMN `email` VARCHAR(255) NULL AFTER `city`;




-- Eliminamos la tabla people
DROP TABLE `platziblog`.`people`;




-- Eliminamos la base de datos
DROP SCHEMA `platziblog`;