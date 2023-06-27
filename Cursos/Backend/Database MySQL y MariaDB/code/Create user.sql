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