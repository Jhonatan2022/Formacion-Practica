-- Creando usuarios para mariadb
CREATE USER
    -- Indicamos el nombre del usuario
    'soporte'@'localhost'
IDENTIFIED BY
    -- Indicamos la contraseña del usuario
    'soporte';



-- Eliminando usuarios para mariadb
DROP USER
    -- Indicamos el nombre del usuario
    'soporte'@'localhost';


-- Asignamos todos los privilegios al usuario que creamos 
GRANT ALL PRIVILEGES ON * . * TO 'soporte'@'localhost';



---- Actualizamos los privilegios
FLUSH PRIVILEGES;