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