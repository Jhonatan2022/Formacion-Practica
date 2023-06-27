-- Crear la base de datos
CREATE DATABASE metro_cdmx;

-- Crear las tablas
USE metro_cdmx;

CREATE TABLE `lines` (
    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(10) NOT NULL,
    `color` VARCHAR(15) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Creación de la tabla de stations
CREATE TABLE `stations` (
    `id` BIGINT(20),
    `name` VARCHAR(50) NOT NULL,
    -- `icon` VARCHAR(100) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Creación de la tabla de trains
CREATE TABLE `trains` (
    `serial_number` VARCHAR(10) NOT NULL,
    `line_id` BIGINT(20) UNSIGNED NOT NULL,
    `type` TINYINT(4) NOT NULL,
    `year` INT(4) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (serial_number),
    CONSTRAINT `trains_line_id_foreign` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`)
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- Creación de la tabla de random para un el reto de la clase de DELETE
CREATE TABLE `stations_delete` (
    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    -- `icon` VARCHAR(100) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;



-- Alterar la tabla de stations
USE metro_cdmx;

ALTER TABLE `stations`
MODIFY `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY(id);
-- ADD CONSTRAINT `trains_line_id_foreign`
-- FOREIGN KEY (`line_id`) REFERENCES `lines`(`id`);



-- Insertar las líneas del metro
USE metro_cdmx;

-- Insertar las líneas del metro
INSERT INTO `lines` (name, color) VALUES
("Línea 1", "Rosa"),
("Línea 2", "Azul"),
("Línea 3", "Verde olivo"),
("Línea 4", "Cian"),
("Línea 5", "Amarillo"),
("Línea 6", "Rojo"),
("Línea 7", "Naranja"),
("Línea 8", "Verder"),
("Línea 9", "Café"),
("Línea A", "Morado"),
("Línea B", "Verde y gris"),
("Línea 12", "Oro");



USE metro_cdmx;
-- Insertar trenes
INSERT INTO `trains` (serial_number, line_id, type, year) VALUES
('0JFxafE4q8', 1, 1, 1963),
('2e5v4FHs0T', 3, 2, 1984),
('5xPdsZ1x9L', 3, 2, 1948),
('7csbz2qteT', 1, 1, 1971),
('8PwCI0CC6n', 4, 1, 1990),
('9ilxeEwlnH', 4, 2, 1994),
('aWDpmlRsOG', 4, 2, 1998),
('ax5jrpNIWG', 4, 2, 1952),
('B83fPCVFbH', 1, 1, 1990),
('Bv1MN0DuUm', 2, 2, 1952),
('D9m2gBhBJw', 2, 1, 1969),
('EDUumFCvJl', 2, 1, 1967),
('ejN3a4CsDC', 3, 2, 1997),
('f49Bk0GzBi', 4, 2, 1967),
('Ge92a6hVX8', 3, 2, 1967),
('Huz9yGcao5', 2, 1, 1980),
('Hvhw9vxUaH', 3, 1, 1983),
('JO5UinVh7B', 2, 1, 1956),
('MPbPGQfWxT', 2, 2, 1982),
('mS0SY0eScA', 3, 2, 1986),
('oCut3fDYXE', 3, 2, 1987),
('oRyT0nwjUn', 2, 1, 1988),
('OtmhQxSRpS', 3, 2, 1956),
('Pazz9JGCbJ', 1, 2, 1988),
('pBnf2N5Ncc', 4, 1, 1981),
('pMldxCQ2sS', 3, 1, 1984),
('q92m0d8aWM', 1, 1, 1979),
('QJ22USb3ry', 2, 1, 1949),
('rnpVQQPs5b', 4, 1, 1984),
('S06Q7kXYrP', 1, 1, 1990),
('s0QypBy7cJ', 2, 2, 1958),
('S6R4dX4THI', 2, 2, 1994),
('t8HhPpvYbU', 1, 2, 1996),
('U9xuOQl3kh', 3, 1, 1982),
('uibQ7F5VE7', 4, 1, 1961),
('Uj5G2Bodtk', 4, 2, 1985),
('VjPElNnH29', 3, 2, 1964),
('vOv1sCgHoa', 1, 1, 1947),
('VViBQInzq3', 4, 2, 1959),
('wGweNe36QH', 1, 2, 1987),
('Wh09mwE4yn', 4, 1, 1968),
('XE89MYo0IU', 3, 1, 1986),
('Z5qAgGpFTj', 1, 1, 1971),
('ZbX2yY5Wyz', 1, 2, 1966),
('zeaEgOCuYl', 2, 2, 1997),
('ZHA4kQokXG', 2, 1, 1977),
('zpO3I3tS4e', 1, 2, 1995),
('zpYnPq7vmN', 4, 2, 1976);




USE metro_cdmx;

-- Inserta las estaciones del metro
INSERT INTO `stations` (name) VALUES
("Lázaro Cárdens"), -- Lázaro Cárdenas
("Ferería"), -- Ferrería 
("Pnttlán"), -- Pantitlán
("Tauga"), -- Tacuba
("MartínCrrera"), -- Martín Carrera
("Santa Anita"),
("Villa de Aragón"),
("Tezozómoc"),
("Tecnológico"),
("Colegio Militar"),
("Chapultepec"),
("Calle 11"),
("Constitución de 1917"),
("Copilco"),
("Talismán"),
("Terminal Aérea"),
("Tepito"),
("Hospital 20 de Nov."),
("Eugenia"),
("Lomas Estrella"),
("Tlatelolco"),
("Atlalilco"),
("Blvd. Puerto Aéreo"),
("Chilpancingo"),
("Ciudad Azteca"),
("Niños Héroes"),
("Popotla"),
("San Joaquín"),
("Universidad"),
("Instituto del Petróleo"),
("Escuadrón 201"),
("Iztacalco"),
("Juárez"),
("Chabacano"),
("Azcapotzalco"),
("Bosque de Aragón"),
("Tlaltenco"),
("Jamaica"),
("Oceanía"),
("Iztapalapa"),
("Mixhuca"),
("Centro Médico"),
("Balderas"),
("Salto del Agua"),
("Insurgentes"),
("Guelatao"),
("Morelos"),
("Moctezuma"),
("Normal"),
("Zapata"),
("Zaragoza"),
("La Raza"),
("Constituyentes"),
("Múzquiz"),
("Romero Rubio"),
("San Cosme"),
("Portales"),
("Puebla"),
("Santa Marta"),
("Tasqueña"),
("Xola"),
("Canal del Norte"),
("Buenavista"),
("Balbuena"),
("Ermita"),
("Aragón"),
("Deportivo 18 de Marzo"),
("Auditorio"),
("Culhuacán"),
("El Rosario"),
("Guerrero"),
("Hospital General"),
("Fray Servando"),
("Patriotismo"),
("Observatorio"),
("La Paz"),
("Valle Gómez"),
("Tezonco"),
("Candelaria"),
("Aquiles Serdán"),
("La Viga"),
("Olímpica"),
("Mexicaltzingo"),
("Politécnico"),
("Periférico Ote"),
("San Lázaro"),
("San Antonio"),
("Zapotitlán"),
("Tláhuac"),
("Hidalgo"),
("Etiopía / Plaza de la Transpatencia"),
("Deportivo Oceanía"),
("Impulsora"),
("Consulado"),
("Camarones"),
("Allende"),
("San Juan de Letrán"),
("Viaducto"),
("Vallejo"),
("Doctores"),
("Los Reyes"),
("Bellas Artes"),
("Autobuses del Norte"),
("Acatitla"),
("Revolución"),
("Polanco"),
("San Andrés Tomatlán"),
("Garibaldi"),
("Eduardo Molina"),
("Coyuya"),
("Coyoacán"),
("Norte 45"),
("Lindavista"),
("Tacubaya"),
("Mixcoac"),
("Hangares"),
("Nopalera"),
("UAM-I"),
("Velódromo"),
("Cuauhtémoc"),
("Apatlaco"),
("Aculco"),
("Agrícola Oriental"),
("Eje Central"),
("Pino Suárez"),
("Río de los Remedios"),
("Potrero"),
("Sevilla"),
("General Anaya"),
("Indios Verdes"),
("La Villa - Basílica"),
("Parque de los Venados"),
("Juanacatlán"),
("Nativitas"),
("Misterios"),
("Barranca del Muerto"),
("Miguel Ángel de Quevedo"),
("Lagunilla"),
("Olivos"),
("Tepalcates"),
("Zócalo"),
("Gómez Farías"),
("San Pedro de Los Pinos"),
("Refinería"),
("Villa de Cortés"),
("R. Flores Magón"),
("Insurgentes Sur"),
("Viveros"),
("Cerro de la Estrella"),
("Bondojito"),
("Canal de San Juan"),
("San Antonio Abad"),
("Obrera"),
("Plaza Aragón"),
("Panteones"),
("Peñón Viejo"),
("División del Norte"),
("Cuitláhuac"),
("Ciudad Deportiva"),
("Cuatro Caminos"),
("Isabel la Católica"),
("Nezahualcóyotl"),
("Merced"),
-- A partir de aquí serán retos para eliminar registros
("Merced"),
("Lázaro de Guerrero"),
("Benito Cárdenas");




-- Update stations
USE metro_cdmx;

UPDATE `stations`
SET name = "Lázaro Cárdenas"
WHERE id = 1;

UPDATE `stations`
SET name = "Ferrería"
WHERE id = 2;

UPDATE `stations`
SET name = "Pantitlán" WHERE id = 3;

UPDATE `stations`
SET name = "Tacuba" WHERE id = 4;

UPDATE `stations`
SET name = "Martín Carrera" WHERE id = 5;



-- Delete stations
USE metro_cdmx;

DELETE FROM `stations`
WHERE id = 164;

DELETE FROM `stations`
WHERE id = 165;

DELETE FROM `stations`
WHERE name = "Benito Cárdenas";



USE metro_cdmx;

-- Modo DELETE FROM

DELETE FROM `stations_delete`;

-- Esto es para que vean cómo un delete from NO reestablece los id
INSERT INTO `stations_delete` (name) VALUES
("Lázaro Cárdens"), -- Lázaro Cárdenas
("Ferería"), -- Ferrería 
("Pnttlán"), -- Pantitlán
("Tauga"), -- Tacuba
("MartínCrrera"); -- Martín Carrera




USE metro_cdmx;

-- Modo TRUNCATE

TRUNCATE TABLE `stations_delete`;

-- Esto es para que vean cómo un delete from NO reestablece los id
INSERT INTO `stations_delete` (name) VALUES
("Lázaro Cárdens"), -- Lázaro Cárdenas
("Ferería"), -- Ferrería 
("Pnttlán"), -- Pantitlán
("Tauga"), -- Tacuba
("MartínCrrera"); -- Martín Carrera



-- Delete stations
USE metro_cdmx;

DROP TABLE `stations_delete`;




-- Selects
USE metro_cdmx;

-- Seleccionar todo
SELECT * FROM `lines`;

-- Filtrar por columnas
SELECT id, name, color FROM `lines`;

-- Operaciones matemáticas con SELECT

SELECT (2 + 2);

SELECT (2 + 2) AS resultado;

SELECT AVG(year) FROM `trains`;

SELECT AVG(year) AS year_avg FROM `trains`;

-- Juntar tablas

SELECT
`lines`.`name`,
`trains`.`serial_number`
FROM `lines`
INNER JOIN `trains`
ON `lines`.`id` = `trains`.`line_id`;




USE metro_cdmx;

-- Creación de la tabla lines_stations
CREATE TABLE `lines_stations` (

    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

    `line_id` BIGINT(20) UNSIGNED NOT NULL,
    `station_id` BIGINT(20) UNSIGNED NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    CONSTRAINT `lines_stations_line_id_foreign` 
    FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
    
    CONSTRAINT `lines_stations_station_id_foreign` 
    FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`)
) 
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;




USE metro_cdmx;

INSERT INTO `lines_stations` (`line_id`, `station_id`) VALUES
(9, 1),
(6, 2),
(10, 3),
(2, 4),
(6, 5),
(4, 6),
(11, 7),
(6, 8),
(11, 9),
(2, 10),
(1, 11),
(12, 12),
(8, 13),
(3, 14),
(7, 4),
(4, 15),
(5, 16),
(11, 17),
(12, 18),
(3, 19),
(12, 20),
(3, 21),
(8, 22),
(1, 23),
(9, 24),
(11, 25),
(3, 26),
(2, 27),
(7, 28),
(3, 29),
(6, 30),
(8, 31),
(8, 32),
(3, 33),
(2, 34),
(6, 35),
(11, 36),
(12, 37),
(4, 38),
(11, 39),
(8, 40),
(9, 41),
(3, 42),
(1, 43),
(9, 34),
(8, 44),
(1, 45),
(10, 46),
(11, 47),
(1, 48),
(2, 49),
(3, 50),
(1, 51),
(5, 52),
(9, 38),
(7, 53),
(11, 54),
(11, 55),
(2, 56),
(2, 57),
(9, 58),
(10, 59),
(2, 60),
(2, 61),
(4, 62),
(11, 63),
(1, 64),
(2, 65),
(5, 66),
(6, 67),
(12, 22),
(7, 68),
(12, 69),
(8, 6),
(6, 30),
(7, 70),
(3, 71),
(3, 72),
(4, 73),
(12, 65),
(1, 3),
(9, 74),
(1, 75),
(10, 76),
(5, 77),
(12, 78),
(8, 34),
(4, 79),
(7, 80),
(8, 81),
(11, 82),
(12, 83),
(5, 84),
(12, 85),
(11, 86),
(7, 87),
(12, 88),
(12, 89),
(3, 90),
(2, 90),
(3, 91),
(11, 92),
(11, 93),
(3, 67),
(4, 94),
(7, 95),
(2, 96),
(8, 97),
(2, 98),
(6, 99),
(9, 3),
(4, 47),
(8, 100),
(10, 101),
(8, 102),
(3, 43),
(5, 103),
(10, 104),
(2, 105),
(7, 106),
(12, 107),
(11, 108),
(5, 109),
(8, 110),
(3, 111),
(6, 112),
(6, 113),
(7, 114),
(8, 108),
(7, 115),
(12, 115),
(5, 116),
(6, 70),
(5, 39),
(12, 117),
(2, 102),
(8, 118),
(9, 119),
(1, 120),
(8, 121),
(8, 122),
(10, 123),
(12, 124),
(1, 114),
(2, 125),
(11, 126),
(3, 127),
(1, 128),
(2, 129),
(3, 130),
(6, 131),
(12, 132),
(1, 133),
(2, 134),
(5, 135),
(1, 79),
(7, 136),
(3, 137),
(11, 138),
(12, 139),
(1, 86),
(10, 140),
(2, 141),
(1, 142),
(9, 42),
(5, 94),
(1, 125),
(1, 44),
(7, 143),
(7, 144),
(2, 145),
(11, 146),
(11, 71),
(12, 147),
(12, 50),
(3, 148),
(8, 149),
(4, 150),
(10, 151),
(5, 3),
(2, 152),
(8, 153),
(11, 154),
(2, 155),
(10, 156),
(3, 157),
(2, 158),
(9, 159),
(2, 160),
(4, 5),
(3, 52),
(1, 161),
(11, 162),
(1, 163),
(9, 114);




USE metro_cdmx;

INSERT INTO `lines_stations` (line_id, station_id) VALUES(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Lázaro Cárdenas")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Ferrería")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea A"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Pantitlán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tacuba")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Martín Carrera")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 4"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Santa Anita")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Villa de Aragón")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tezozómoc")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tecnológico")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Colegio Militar")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Chapultepec")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Calle 11")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Constitución de 1917")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Copilco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tacuba")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 4"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Talismán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Terminal Aérea")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tepito")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Hospital 20 de Nov.")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Eugenia")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Lomas Estrella")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tlatelolco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Atlalilco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Blvd. Puerto Aéreo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Chilpancingo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Ciudad Azteca")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Niños Héroes")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Popotla")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "San Joaquín")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Universidad")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Instituto del Petróleo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Escuadrón 201")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Iztacalco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Juárez")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Chabacano")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Azcapotzalco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Bosque de Aragón")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tlaltenco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 4"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Jamaica")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Oceanía")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Iztapalapa")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Mixhuca")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Centro Médico")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Balderas")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Chabacano")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Salto del Agua")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Insurgentes")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea A"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Guelatao")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Morelos")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Moctezuma")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Normal")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Zapata")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Zaragoza")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "La Raza")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Jamaica")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Constituyentes")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Múzquiz")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Romero Rubio")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "San Cosme")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Portales")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Puebla")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea A"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Santa Marta")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tasqueña")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Xola")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 4"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Canal del Norte")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Buenavista")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Balbuena")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Ermita")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Aragón")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Deportivo 18 de Marzo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Atlalilco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Auditorio")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Culhuacán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Santa Anita")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Instituto del Petroleo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "El Rosario")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Guerrero")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Hospital General")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 4"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Fray Servando")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Ermita")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Pantitlán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Patriotismo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Observatorio")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea A"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "La Paz")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Valle Gómez")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tezonco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Chabacano")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 4"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Candelaria")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Aquiles Serdán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "La Viga")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Olímpica")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Mexicaltzingo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Politécnico")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Periférico Ote")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "San Lázaro")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "San Antonio")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Zapotitlán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tláhuac")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Hidalgo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Hidalgo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Etiopía / Plaza de la Transpatencia")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Deportivo Oceanía")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Impulsora")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Deportivo 18 de Marzo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 4"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Consulado")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Camarones")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Allende")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "San Juan de Letrán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Viaducto")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Vallejo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Pantitlán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 4"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Morelos")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Doctores")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea A"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Los Reyes")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Bellas Artes")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Balderas")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Autobuses del Norte")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea A"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Acatitla")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Revolución")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Polanco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "San Andrés Tomatlán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Garibaldi")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Eduardo Molina")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Coyuya")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Coyoacán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Norte 45")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Lindavista")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tacubaya")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Garibaldi")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Mixcoac")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Mixcoac")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Hangares")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "El Rosario")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Oceanía")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Nopalera")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Bellas Artes")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "UAM-I")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Velódromo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Cuauhtémoc")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Apatlaco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Aculco")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea A"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Agrícola Oriental")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Eje Central")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tacubaya")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Pino Suárez")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Río de los Remedios")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Potrero")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Sevilla")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "General Anaya")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Indios Verdes")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 6"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "La Villa - Basílica")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Parque de los Venados")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Juanacatlán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Nativitas")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Misterios")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Candelaria")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Barranca del Muerto")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Miguel Ángel de Quevedo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Lagunilla")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Olivos")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "San Lázaro")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea A"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tepalcates")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Zócalo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Gómez Farías")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Centro Médico")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Consulado")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Pino Suárez")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Salto del Agua")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "San Pedro de Los Pinos")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 7"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Refinería")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Villa de Cortés")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "R. Flores Magón")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Guerrero")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Insurgentes Sur")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 12"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Zapata")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Viveros")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Cerro de la Estrella")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 4"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Bondojito")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea A"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Canal de San Juan")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 5"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Pantitlán")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "San Antonio Abad")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 8"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Obrera")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Plaza Aragón")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Panteones")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea A"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Peñón Viejo")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "División del Norte")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Cuitláhuac")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Ciudad Deportiva")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 2"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Cuatro Caminos")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 4"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Martín Carrera")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 3"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "La Raza")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Isabel la Católica")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea B"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Nezahualcóyotl")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 1"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Merced")
        ),
(
            (SELECT `lines`.`id` FROM `lines` WHERE `lines`.`name` = "Línea 9"),
            (SELECT `stations`.`id` FROM `stations` WHERE `stations`.`name` = "Tacubaya")
        );





        USE metro_cdmx;

-- Creación de la tabla de locations
CREATE TABLE `locations` (

    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

    `station_id` BIGINT(20) UNSIGNED NOT NULL,
    `location` POINT NOT NULL,

    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    CONSTRAINT `locations_station_id_foreign` 
    FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`)

) 
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;






USE metro_cdmx;

-- Acá insertamos los puntos geográficos de cada estación del metro.

-- Lázaro Cárdenas 19.40702104, -99.14433718

INSERT INTO `locations` (station_id, location) VALUES
(1, POINT(-99.14433718, 19.40702104)),
(2, POINT(-99.173702, 19.49039233)),
(3, POINT(-99.07262564, 19.4146103)),
(4, POINT(-99.18803573, 19.45913691)),
(5, POINT(-99.10554171, 19.48231101)),
(6, POINT(-99.12120581, 19.40425847)),
(7, POINT(-99.06114578, 19.4613523)),
(8, POINT(-99.19593215, 19.49448847)),
(9, POINT(-99.03568625, 19.51470467)),
(10, POINT(-99.17122364, 19.44864628)),
(11, POINT(-99.17658806, 19.42025648)),
(12, POINT(-99.08486724, 19.32025578)),
(13, POINT(-99.063367, 19.345135)),
(14, POINT(-99.17657733, 19.33597857)),
(15, POINT(-99.10779476, 19.47415847)),
(16, POINT(-99.08820391, 19.43380448)),
(17, POINT(-99.12323356, 19.44256606)),
(18, POINT(-99.17099833, 19.37192372)),
(19, POINT(-99.15724397, 19.38628539)),
(20, POINT(-99.096696, 19.322002)),
(21, POINT(-99.1430819, 19.45520174)),
(22, POINT(-99.10157204, 19.35570839)),
(23, POINT(-99.09606814, 19.41958866)),
(24, POINT(-99.1683054, 19.40575613)),
(25, POINT(-99.02711391, 19.53444312)),
(26, POINT(-99.15023804, 19.41946724)),
(27, POINT(-99.17546153, 19.45261196)),
(28, POINT(-99.19160843, 19.44553033)),
(29, POINT(-99.17407751, 19.32433595)),
(30, POINT(-99.14455175, 19.48983606)),
(31, POINT(-99.10931826, 19.36449442)),
(32, POINT(-99.112086, 19.388092)),
(33, POINT(-99.14771676, 19.43336942)),
(34, POINT(-99.13542151, 19.40891333)),
(35, POINT(-99.18621182, 19.49067553)),
(36, POINT(-99.06927824, 19.45807473)),
(37, POINT(-99.023829, 19.294555)),
(38, POINT(-99.12203193, 19.41014786)),
(39, POINT(-99.08683062, 19.44572255)),
(40, POINT(-99.09341812, 19.35760127)),
(41, POINT(-99.11285877, 19.40820499)),
(42, POINT(-99.15531278, 19.40749665)),
(43, POINT(-99.14912224, 19.42729875)),
(44, POINT(-99.14207339, 19.42720768)),
(45, POINT(-99.16325212, 19.42359552)),
(46, POINT(-99.03579354, 19.38459525)),
(47, POINT(-99.11933, 19.438426)),
(48, POINT(-99.109803, 19.426271)),
(49, POINT(-99.1671896, 19.44424548)),
(50, POINT(-99.1645503, 19.37073951)),
(51, POINT(-99.08322573, 19.41179726)),
(52, POINT(-99.136176, 19.468965)),
(53, POINT(-99.19138312, 19.41129131)),
(54, POINT(-99.04171586, 19.50096117)),
(55, POINT(-99.09420133, 19.44048194)),
(56, POINT(-99.16094542, 19.44185787)),
(57, POINT(-99.14130092, 19.36976784)),
(58, POINT(-99.08233523, 19.40697045)),
(59, POINT(-98.995894, 19.359804)),
(60, POINT(-99.14105415, 19.34400644)),
(61, POINT(-99.13758874, 19.3950293)),
(62, POINT(-99.11589503, 19.44866652)),
(63, POINT(-99.15289879, 19.44615757)),
(64, POINT(-99.10281658, 19.42288725)),
(65, POINT(-99.14263129, 19.36186271)),
(66, POINT(-99.09598231, 19.45101356)),
(67, POINT(-99.12576556, 19.48358544)),
(68, POINT(-99.19173717, 19.42530549)),
(69, POINT(-99.10894275, 19.33887391)),
(70, POINT(-99.20029879, 19.5039547)),
(71, POINT(-99.14501309, 19.44475133)),
(72, POINT(-99.1531992, 19.41369961)),
(73, POINT(-99.12033677, 19.42149092)),
(74, POINT(-99.1784656, 19.40559422)),
(75, POINT(-99.200669, 19.397486)),
(76, POINT(-98.96061659, 19.35048513)),
(77, POINT(-99.11988616, 19.45868169)),
(78, POINT(-99.065867, 19.306124)),
(79, POINT(-99.11890984, 19.42917056)),
(80, POINT(-99.194511, 19.489367)),
(81, POINT(-99.125973, 19.406106)),
(82, POINT(-99.03298259, 19.52084286)),
(83, POINT(-99.12191391, 19.35744944)),
(84, POINT(-99.148806, 19.499964)),
(85, POINT(-99.074719, 19.317492)),
(86, POINT(-99.114463, 19.431822)),
(87, POINT(-99.18661952, 19.38481791)),
(88, POINT(-99.03402328, 19.29639028)),
(89, POINT(-99.01443243, 19.28680057)),
(90, POINT(-99.14681554, 19.43674867)),
(91, POINT(-99.15617108, 19.39604129)),
(92, POINT(-99.07917023, 19.45077077)),
(93, POINT(-99.048743, 19.484987)),
(94, POINT(-99.11388874, 19.45682033)),
(95, POINT(-99.18894768, 19.47873042)),
(96, POINT(-99.13670897, 19.43547387)),
(97, POINT(-99.14116144, 19.43098165)),
(98, POINT(-99.13663387, 19.40074699)),
(99, POINT(-99.15479779, 19.49031142)),
(100, POINT(-99.14335012, 19.42049932)),
(101, POINT(-98.97670984, 19.35877546)),
(102, POINT(-99.14061427, 19.43649573)),
(103, POINT(-99.140471, 19.478595)),
(104, POINT(-99.00597811, 19.3642515)),
(105, POINT(-99.15389657, 19.43880248)),
(106, POINT(-99.19079304, 19.43337954)),
(107, POINT(-99.10259128, 19.3272315)),
(108, POINT(-99.139954, 19.443376)),
(109, POINT(-99.10544515, 19.45112485)),
(110, POINT(-99.113413, 19.39769)),
(111, POINT(-99.17056918, 19.36142746)),
(112, POINT(-99.16249037, 19.48823803)),
(113, POINT(-99.13434863, 19.4875806)),
(114, POINT(-99.18664098, 19.40223457)),
(115, POINT(-99.18774605, 19.37625563)),
(116, POINT(-99.087095, 19.423251)),
(117, POINT(-99.04621124, 19.29939771)),
(118, POINT(-99.074808, 19.350327)),
(119, POINT(-99.10283804, 19.40811392)),
(120, POINT(-99.15455103, 19.42565962)),
(121, POINT(-99.10934, 19.378298)),
(122, POINT(-99.10739779, 19.37292574)),
(123, POINT(-99.06982541, 19.40404596)),
(124, POINT(-99.15133238, 19.36118453)),
(125, POINT(-99.13303971, 19.42543703)),
(126, POINT(-99.04635072, 19.49024062)),
(127, POINT(-99.131748, 19.476413)),
(128, POINT(-99.17074084, 19.42189565)),
(129, POINT(-99.14478779, 19.35319801)),
(130, POINT(-99.119141, 19.495315)),
(131, POINT(-99.11815882, 19.4814715)),
(132, POINT(-99.15766239, 19.37046623)),
(133, POINT(-99.18207049, 19.41290022)),
(134, POINT(-99.13987398, 19.37938304)),
(135, POINT(-99.13051844, 19.46290002)),
(136, POINT(-99.18895841, 19.3614882)),
(137, POINT(-99.18053627, 19.34651696)),
(138, POINT(-99.13107634, 19.44300109)),
(139, POINT(-99.05831337, 19.30328601)),
(140, POINT(-99.04651165, 19.39072824)),
(141, POINT(-99.131879, 19.432602)),
(142, POINT(-99.09070373, 19.41608763)),
(143, POINT(-99.18572903, 19.39122414)),
(144, POINT(-99.18985963, 19.46911098)),
(145, POINT(-99.13862944, 19.38746949)),
(146, POINT(-99.10342813, 19.43628327)),
(147, POINT(-99.17859435, 19.37360387)),
(148, POINT(-99.17542934, 19.35376487)),
(149, POINT(-99.085872, 19.355601)),
(150, POINT(-99.1117537, 19.46450842)),
(151, POINT(-99.05969739, 19.39821706)),
(152, POINT(-99.13429499, 19.4159055)),
(153, POINT(-99.14392948, 19.41301153)),
(154, POINT(-99.02979612, 19.52822456)),
(155, POINT(-99.20294, 19.458219)),
(156, POINT(-99.0172863, 19.37291562)),
(157, POINT(-99.15950775, 19.3789276)),
(158, POINT(-99.181555, 19.45668)),
(159, POINT(-99.09135818, 19.40811392)),
(160, POINT(-99.214643, 19.458454)),
(161, POINT(-99.13782477, 19.4260947)),
(162, POINT(-99.054375, 19.472534)),
(163, POINT(-99.12541151, 19.42546738));



USE metro_cdmx;

-- Calculamos en metros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) AS distance;


-- Calculamos en kilometros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) / 1000 AS distance;