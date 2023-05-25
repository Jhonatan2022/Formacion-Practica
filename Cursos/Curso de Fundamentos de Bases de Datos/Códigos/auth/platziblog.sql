-- Creamos la base de datos
CREATE SCHEMA `platziblog`; 




-- Creamos la tabla de categoria
CREATE TABLE `platziblog`.`categorias` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));




-- Creamos la tabla de etiquetas
CREATE TABLE `platziblog`.`etiquetas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`));




-- Creamos la tabla de usuarios
CREATE TABLE `platziblog`.`usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(30) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `nickname` VARCHAR(40) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);





-- Creamos la tabla de posts
CREATE TABLE `platziblog`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(130) NOT NULL,
  `fecha_publicacion` TIMESTAMP NULL,
  `contenido` TEXT NOT NULL,
  `estatus` CHAR(8) NULL DEFAULT 'activo',
  `usuario_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`));




-- Relacionamos la llave foranea de usuarios con posts
ALTER TABLE `platziblog`.`posts` 
ADD INDEX `posts_usuarios_idx` (`usuario_id` ASC) VISIBLE;
;
ALTER TABLE `platziblog`.`posts` 
ADD CONSTRAINT `posts_usuarios`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `platziblog`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;


-- Relacionamos la llave foranea de categorias con posts
ALTER TABLE `platziblog`.`posts` 
ADD INDEX `posts_categorias_idx` (`categoria_id` ASC) VISIBLE;
;
ALTER TABLE `platziblog`.`posts` 
ADD CONSTRAINT `posts_categorias`
  FOREIGN KEY (`categoria_id`)
  REFERENCES `platziblog`.`categorias` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;





-- Creamos la tabla de comentarios
CREATE TABLE `platziblog`.`comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comentario` TEXT NOT NULL,
  `usuario_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`id`));



-- Relacionamos la llave foranea de usuarios con comentarios
ALTER TABLE `platziblog`.`comentarios` 
ADD INDEX `comentarios_usuario_idx` (`usuario_id` ASC) VISIBLE;
;
ALTER TABLE `platziblog`.`comentarios` 
ADD CONSTRAINT `comentarios_usuario`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `platziblog`.`usuarios` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



-- Relacionamos la llave foranea de posts con comentarios
ALTER TABLE `platziblog`.`comentarios` 
ADD INDEX `comentarios_post_idx` (`post_id` ASC) VISIBLE;
;
ALTER TABLE `platziblog`.`comentarios` 
ADD CONSTRAINT `comentarios_post`
  FOREIGN KEY (`post_id`)
  REFERENCES `platziblog`.`posts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;





-- Creamos la tabla trancitiva de posts_etiquetas
CREATE TABLE `platziblog`.`post_etiquetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `etiqueta_id` INT NOT NULL,
  PRIMARY KEY (`id`));




-- Relacionamos la llave foranea de posts con post_etiquetas
ALTER TABLE `platziblog`.`post_etiquetas` 
ADD INDEX `postetiquetas_post_idx` (`post_id` ASC) VISIBLE;
;
ALTER TABLE `platziblog`.`post_etiquetas` 
ADD CONSTRAINT `postetiquetas_post`
  FOREIGN KEY (`post_id`)
  REFERENCES `platziblog`.`posts` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;



-- Relacionamos la llave foranea de etiquetas con post_etiquetas
ALTER TABLE `platziblog`.`post_etiquetas` 
ADD INDEX `postetiquetas_etiquetas_idx` (`etiqueta_id` ASC) VISIBLE;
;
ALTER TABLE `platziblog`.`post_etiquetas` 
ADD CONSTRAINT `postetiquetas_etiquetas`
  FOREIGN KEY (`etiqueta_id`)
  REFERENCES `platziblog`.`etiquetas` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;