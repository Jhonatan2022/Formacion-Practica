SELECT A.ID,
        A.NOMBRE,
        A.CARRERA_ID,
        C.CARRERA
    FROM PLATZI.ALUMNOS AS A
LEFT JOIN PLATZI.CARRERAS AS C
    ON A.ID = C.ID;
---------------------------------------------



SELECT CARRERA,
        COUNT(ALUMNOS.ID) AS "Total de alumnos",
        VIGENTE
    FROM PLATZI.ALUMNOS
JOIN PLATZI.CARRERAS AS CARR
    ON PLATZI.ALUMNOS.CARRERA_ID = CARR.ID
    WHERE VIGENTE = TRUE
    GROUP BY  CARRERA, VIGENTE
ORDER BY  "Total de alumnos" DESC LIMIT 10;
---------------------------------------------



-- Consulta a bases de datos externas
SELECT *
    FROM HOLA ( dbname=prueba,
        host=localhost,
        port=5432,
        user=postgres,
        password=123456,
        SELECT nombre,
        edad,
        apellido
    FROM pruebas.users) AS CONSULTA_EXTERNA;
---------------------------------------------



-- Hacemos un right y traemos los usuarios que no tienen apellido
SELECT *
    FROM PLATZI.ALUMNOS AS A
RIGHT JOIN PLATZI.CARRERAS AS C
    ON A.ID = C.ID
    WHERE A.APELLIDO IS NULL;
---------------------------------------------



SELECT ID,
	NOMBRE,
	APELLIDO,
	EMAIL,
	COLEGIATURA
FROM PLATZI.ALUMNOS
WHERE NOMBRE = 'Wanda'
	AND (APELLIDO = 'Stoffer'
						OR APELLIDO = 'Billington');
---------------------------------------------




-- Consulta  con like el guion bajo es un caracter especial que representa un caracter cualquiera
-- '%n' representa cualquier caracter que termine en n
-- 'n%' representa cualquier caracter que empiece en n
-- '%n%' representa cualquier caracter que contenga n
SELECT *
    FROM PLATZI.ALUMNOS
    WHERE NOMBRE LIKE "Be_va";

-- Traemos los usuarios que en su nombre tengan v minuscula y V mayuscula
-- También lo podemos negar con NOT LIKE
SELECT *
    FROM PLATZI.ALUMNOS
    WHERE NOMBRE LIKE "%V%"
        AND NOMBRE LIKE "%V%";
---------------------------------------------




-- Consulta con IN
SELECT *
    FROM PLATZI.ALUMNOS
    WHERE NOMBRE IN ("Coletta", "Doria", "Sharona");