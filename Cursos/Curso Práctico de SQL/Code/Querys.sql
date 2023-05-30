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
---------------------------------------------



-- Consulta con ORDER BY
SELECT A.NOMBRE,
        A.COLEGIATURA
    FROM PLATZI.ALUMNOS AS A
    WHERE A.COLEGIATURA < 3000
ORDER BY  A.COLEGIATURA DESC LIMIT 5 ;
---------------------------------------------



-- Consulta con GROUP BY
-- OFSET es para saltar registros
-- LIMIT es para limitar los registros
SELECT A.NOMBRE,
        A.COLEGIATURA
    FROM PLATZI.ALUMNOS AS A
    WHERE A.NOMBRE LIKE "%s"
    GROUP BY  A.NOMBRE, A.COLEGIATURA
ORDER BY  A.COLEGIATURA DESC OFFSET 3 LIMIT 3 ;
---------------------------------------------




-- Consulta con FETCH FIRST ( es lo mismo que LIMIT)
-- Traemos el primer registro 
SELECT *
    FROM PLATZI.ALUMNOS FETCH FIRST 1 ROWS ONLY;
---------------------------------------------



-- Consulta con row_number (nos sirve para paginar los registros) 
-- over (nos sirve para ordenar los registros)
SELECT *
    FROM 
    (SELECT ROW_NUMBER() OVER() AS ID_ROW,
        *
        FROM PLATZI.ALUMNOS ) AS ID_ROW
    WHERE ID_ROW <= 5;
---------------------------------------------



-- Consulta con DISTINCT (nos sirve para traer valores unicos)
SELECT DISTINCT COLEGIATURA
    FROM PLATZI.ALUMNOS AS A1
    WHERE 2 =
    (SELECT COUNT(DISTINCT COLEGIATURA)
        FROM PLATZI.ALUMNOS AS A2
        WHERE A1.COLEGIATURA <= A2.COLEGIATURA );
-- Manera performante de traer el segundo registro
SELECT DISTINCT COLEGIATURA
    FROM PLATZI.ALUMNOS
ORDER BY  COLEGIATURA DESC LIMIT 1 OFFSET 1;
---------------------------------------------




-- Obtenemos la mitad de la tabla
SELECT *
    FROM platzi.alumnos OFFSET 
    (SELECT COUNT(*)/2
        FROM platzi.alumnos );
---------------------------------------------



-- Obtenemos todos los alumnos que tienen al tutor con el id 30
SELECT ID,
	NOMBRE,
	TUTOR_ID
FROM PLATZI.ALUMNOS
WHERE TUTOR_ID = 30
LIMIT 10;
-- Manera performante de traer los alumnos que tienen al tutor con el id 30
SELECT *
    FROM PLATZI.ALUMNOS
    WHERE ID IN 
    (SELECT ID
        FROM PLATZI.ALUMNOS
        WHERE TUTOR_ID = 30
            AND CARRERA_ID = 42 );
-- Caso contrario
SELECT *
    FROM PLATZI.ALUMNOS
    WHERE ID IN 
    (SELECT ID
        FROM PLATZI.ALUMNOS
        WHERE TUTOR_ID != 30 );
-- Otra solución
SELECT *
    FROM PLATZI.ALUMNOS
    WHERE ID NOT IN
    (SELECT ID
        FROM PLATZI.ALUMNOS
        WHERE TUTOR_ID = 30 );
---------------------------------------------



-- Consulta con EXTRACT (nos sirve para extraer datos de una fecha)
SELECT EXTRACT(YEAR
    FROM FECHA_INCORPORACION) AS INCORPORO
    FROM PLATZI.ALUMNOS;
-- Consulta con DATE_PART (nos sirve para extraer datos de una fecha)
SELECT DATE_PART("YEAR",
        FECHA_INCORPORACION) AS anio,
        DATE_PART("MONTH",
        FECHA_INCORPORACION) AS MES,
        DATE_PART("DAY",
        FECHA_INCORPORACION) AS DIA,
        DATE_PART("HOUR",
        FECHA_INCORPORACION) AS HORAS,
        DATE_PART("MINUTE",
        FECHA_INCORPORACION) AS MINUTOS,
        DATE_PART("SECOND",
        FECHA_INCORPORACION) AS SEGUNDOS
    FROM PLATZI.ALUMNOS;
---------------------------------------------




-- 
SELECT *
    FROM PLATZI.ALUMNOS
    WHERE (EXTRACT(YEAR
    FROM FECHA_INCORPORACION)) = 2020;
-- Traemos solo los usuarios que se incorporaron en mayo del 2018
SELECT *
    FROM PLATZI.ALUMNOS
    WHERE (DATE_PART('YEAR', FECHA_INCORPORACION)) = 2018
        AND (DATE_PART('MONTH', FECHA_INCORPORACION)) = 5;
-- Otra solución
SELECT *
    FROM PLATZI.ALUMNOS
    WHERE (EXTRACT(YEAR
    FROM FECHA_INCORPORACION) = 2018) AND( EXTRACT (MONTH
    FROM FECHA_INCORPORACION)= 5 );
-- Otra solución
SELECT *
    FROM 
    (SELECT *,
        DATE_PART("YEAR",
        FECHA_INCORPORACION) AS ANIO,
        DATE_PART("MONTH",
        FECHA_INCORPORACION)AS MES
        FROM PLATZI.ALUMNOS ) AS DATOS_OBTENIDOS
    WHERE ANIO = 2018
        AND MES = 5;
---------------------------------------------



-- Consulta para buscar registros duplicados
SELECT (PLATZI.ALUMNOS.NOMBRE,
        PLATZI.ALUMNOS.APELLIDO,
        PLATZI.ALUMNOS.EMAIL,
        PLATZI.ALUMNOS.COLEGIATURA,
        PLATZI.ALUMNOS.CARRERA_ID,
        PLATZI.ALUMNOS.TUTOR_ID,
        PLATZI.ALUMNOS.FECHA_INCORPORACION)::TEXT,
        COUNT(*)
    FROM PLATZI.ALUMNOS
    GROUP BY  PLATZI.ALUMNOS.NOMBRE, 
              PLATZI.ALUMNOS.APELLIDO, 
              PLATZI.ALUMNOS.EMAIL, 
              PLATZI.ALUMNOS.COLEGIATURA, 
              PLATZI.ALUMNOS.CARRERA_ID, 
              PLATZI.ALUMNOS.TUTOR_ID, 
              PLATZI.ALUMNOS.FECHA_INCORPORACION
HAVING COUNT(*) > 1;
-- Otra solución
SELECT *
    FROM 
    (SELECT ID,
        ROW_NUMBER() OVER(PARTITION BY NOMBRE,
        APELLIDO,
        EMAIL,
        COLEGIATURA,
        CARRERA_ID,
        TUTOR_ID,
        FECHA_INCORPORACION ) AS ROW,
        *
        FROM PLATZI.ALUMNOS ) AS ALUMNOS_DUPLICADOS
    WHERE ALUMNOS_DUPLICADOS.ROW > 1;
-- Eliminamos el resgitro duplicado
DELETE
    FROM PLATZI.ALUMNOS
    WHERE ID IN 
    (SELECT id
        FROM 
        (SELECT ID,
        ROW_NUMBER() OVER(PARTITION BY NOMBRE,
        APELLIDO,
        EMAIL,
        COLEGIATURA,
        CARRERA_ID,
        TUTOR_ID,
        FECHA_INCORPORACION ) AS ROW
            FROM PLATZI.ALUMNOS ) AS ALUMNOS_DUPLICADOS
            WHERE ALUMNOS_DUPLICADOS.ROW > 1);
---------------------------------------------




-- Consulta con rangos 
SELECT *
FROM PLATZI.ALUMNOS
WHERE TUTOR_ID IN (1,2);
-- Otra solución
SELECT *
FROM PLATZI.ALUMNOS
WHERE TUTOR_ID BETWEEN 1 AND 2;
-- Otra solución
SELECT *
FROM PLATZI.ALUMNOS
WHERE TUTOR_ID >= 1 AND TUTOR_ID <= 2;
-- Operaciones enrtre rangos
SELECT numrange(12, 23) AND numrange(15, 20);
SELECT numrange(11, 34) && numrange(15, 22);
SELECT UPPER(INT8RANGE(11, 34));
SELECT LOWER(INT8RANGE(11, 34));
SELECT INT4RANGE(10, 20) * (20, 25);
-- ISEMTY nos sirve para saber si un rango esta vacio
SELECT ISEMPTY(INT4RANGE(10, 20));
-- Mostramos el tutor_id por medio de rango
SELECT * 
FROM PLATZI.ALUMNOS
WHERE INT4RANGE(1, 2) @> TUTOR_ID;
---------------------------------------------
