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
WHERE INT4RANGE(1, 4) @> TUTOR_ID;
-- Minimo y maximo de tutor_id y carrera_id
SELECT NUMRANGE( 
    (SELECT MIN(TUTOR_ID)
        FROM PLATZI.ALUMNOS), 
        (SELECT MAX(TUTOR_ID)
            FROM PLATZI.ALUMNOS) ) * NUMRANGE( 
            (SELECT MIN(CARRERA_ID)
                FROM PLATZI.ALUMNOS), 
                (SELECT MAX(CARRERA_ID)
                    FROM PLATZI.ALUMNOS) );
---------------------------------------------




-- Consulta con min y max
SELECT CARRERA_ID,
        MAX(FECHA_INCORPORACION)
    FROM PLATZI.ALUMNOS
    GROUP BY  CARRERA_ID
ORDER BY  CARRERA_ID;
-- Otra solución
SELECT TUTOR_ID,
        MIN(NOMBRE)
    FROM PLATZI.ALUMNOS
    GROUP BY  TUTOR_ID
ORDER BY  TUTOR_ID ;
---------------------------------------------





-- Consulta con SELFISH JOIN (Nos sirve para hacer una consulta a la misma tabla)
SELECT CONCAT(A.NOMBRE, " ", A.APELLIDO) AS ALUMNO,
        CONCAT(T.NOMBRE, " ", T.APELLIDO) AS TUTOR
    FROM PLATZI.ALUMNOS AS A
INNER JOIN PLATZI.ALUMNOS AS T
    ON A.TUTOR_ID = T.ID
    WHERE A.TUTOR_ID IS NOT NULL;
-- Consultamos cual tutor tiene mas alumnos 
SELECT CONCAT(T.NOMBRE,
        " " ,
        T.APELLIDO) AS TUTOR,
        COUNT(*) AS "Total de alumnos"
    FROM PLATZI.ALUMNOS AS A
INNER JOIN PLATZI.ALUMNOS AS T
    ON A.TUTOR_ID = T.ID
    GROUP BY  TUTOR
ORDER BY  "Total de alumnos" DESC LIMIT 3;
---------------------------------------------






-- Consulta con avg (nos sirve para sacar el promedio)
SELECT AVG ("Total de alumnos") AS PROMEDIO
    FROM 
    (SELECT CONCAT(T.NOMBRE,
        " ",
        T.APELLIDO) AS TUTOR,
        COUNT(*) AS "Total de alumnos"
        FROM PLATZI.ALUMNOS AS A
    INNER JOIN PLATZI.ALUMNOS AS T
        ON A.TUTOR_ID = T.ID
        GROUP BY  TUTOR) AS prmedio_de_alumnos ;

---------------------------------------------






-- Consulta con FULL OUTER JOIN (nos sirve para traer todos los registros de ambas tablas)
SELECT CONCAT(A.NOMBRE,
        " ",
        A.APELLIDO),
        A.CARRERA_ID,
        C.ID,
        C.CARRERA
    FROM PLATZI.ALUMNOS AS A FULL OUTER
JOIN PLATZI.CARRERAS AS C
    ON A.CARRERA_ID = C.ID
ORDER BY  A.CARRERA_ID;
-- Traemos los alumnos que no tienen una carrera asignada
SELECT CONCAT(A.NOMBRE,
        " ",
        A.APELLIDO),
        A.CARRERA_ID,
        C.ID,
        C.CARRERA
    FROM PLATZI.ALUMNOS AS A
LEFT JOIN PLATZI.CARRERAS AS C
    ON A.CARRERA_ID = C.ID
    WHERE C.ID IS NULL
ORDER BY  A.CARRERA_ID;
-- Traemos las carreras que no tienen alumnos
SELECT CONCAT(A.NOMBRE,
        " ",
        A.APELLIDO),
        A.CARRERA_ID,
        C.ID,
        C.CARRERA
    FROM PLATZI.ALUMNOS AS A
RIGHT JOIN PLATZI.CARRERAS AS C
    ON A.CARRERA_ID = C.ID
    WHERE A.ID IS NULL
ORDER BY  C.ID DESC ;
-- Traemos solo los datos que coinciden en ambas tablas
SELECT CONCAT(A.NOMBRE,
        " ",
        A.APELLIDO),
        A.CARRERA_ID,
        C.ID,
        C.CARRERA
    FROM PLATZI.ALUMNOS AS A
INNER JOIN PLATZI.CARRERAS AS C
    ON A.CARRERA_ID = C.ID
ORDER BY  C.ID DESC ;
-- Traemos los datos que no coinciden en ambas tablas
SELECT CONCAT(A.NOMBRE,
        " " ,
        A.APELLIDO) AS NOMBRE_COMPLETO,
        A.CARRERA_ID,
        C.ID,
        C.CARRERA
    FROM PLATZI.ALUMNOS AS A FULL OUTER
JOIN PLATZI.CARRERAS AS C
    ON A.CARRERA_ID = C.ID
    WHERE A.ID IS NULL
        OR C.ID IS NULL
ORDER BY  A.CARRERA_ID DESC, C.ID DESC;
---------------------------------------------





-- Consulta usando lpad (nos sirve para rellenar con ceros a la izquierda)
-- Consulta usando rpad (nos sirve para rellenar con ceros a la derecha)
SELECT LPAD('HOLA', '12', 'P');
-- Triangulo
SELECT LPAD("^", ID, "^")
    FROM PLATZI.ALUMNOS
    WHERE ID < 10;
-- Otra solución
SELECT LPAD("^",
        CAST(ROW_ID AS INT),
        "^")
    FROM 
    (SELECT ROW_NUMBER() OVER(ORDER BY CARRERA_ID) AS ROW_ID,
        *
        FROM PLATZI.ALUMNOS ) AS ALUMNOS_ID
    WHERE ROW_ID <= 5
ORDER BY  CARRERA_ID;
---------------------------------------------





-- Consulta usando GENERATE_SERIES (nos sirve para generar series de numeros)
SELECT * FROM GENERATE_SERIES(1.2, 7, 1.1)
-- De forma practica
SELECT A.ID,
        A.NOMBRE,
        A.APELLIDO,
        A.CARRERA_ID,
        S.A
    FROM PLATZI.ALUMNOS AS A
INNER JOIN GENERATE_SERIES(0, 10) AS S(A)
    ON S.A = A.CARRERA_ID
ORDER BY  A.CARRERA_ID;
-- Triangulo generado por medio de GENERATE_SERIES
-- ORDINALITY (son los numeros que se generan por medio de GENERATE_SERIES)) 
SELECT LPAD("^",
        CAST(ORDINALITY AS INT),
        "^")
    FROM GENERATE_SERIES(10, 2, -2)
WITH ORDINALITY;
---------------------------------------------





-- Consultas con expresiones regulares (nos sirve para buscar patrones en los datos)
-- ~ (nos sirve para buscar patrones en los datos)
-- '^[a-z0-9._%+-]+@google[a-z0-9.-]+\.[a-z]{2,4}$' (patron para buscar correos de google)
SELECT EMAIL
    FROM PLATZI.ALUMNOS
    WHERE EMAIL ~ '^[a-z0-9._%+-]+@google[a-z0-9.-]+\.[a-z]{2,4}$';
---------------------------------------------





-- Promedio de colegiatura por carrera usando window functions
SELECT *, 
        AVG(COLEGIATURA) OVER(PARTITION BY CARRERA_ID) AS PROMEDIO
    FROM PLATZI.ALUMNOS
	ORDER BY PROMEDIO ASC;
-- Sumamos las colegiaturas
SELECT *,
        SUM(COLEGIATURA) OVER(PARTITION BY CARRERA_ID
ORDER BY  COLEGIATURA)
    FROM PLATZI.ALUMNOS;
-- Traemos el top de colegiaturas
SELECT *
    FROM 
    (SELECT *,
        RANK()
        OVER (PARTITION BY CARRERA_ID
    ORDER BY  COLEGIATURA DESC) AS BRAND_RANK
        FROM PLATZI.ALUMNOS) AS TOP_COLEGIATURA
    WHERE BRAND_RANK < 3
ORDER BY  BRAND_RANK;
---------------------------------------------







-- ROW_NUMBER(): nos da el numero de la tupla que estamos utilizando en ese momento.
-- OVER([PARTITION BY column] [ORDER BY column DIR]): nos deja Particionar y Ordenar la window function.
-- PARTITION BY(column/s): es un group by para la window function, se coloca dentro de OVER.
-- FIRST_VALUE(column): devuelve el primer valor de una serie de datos.
-- LAST_VALUE(column): Devuelve el ultimo valor de una serie de datos.
-- NTH_VALUE(column, row_number): Recibe la columna y el numero de row que queremos devolver de una serie de datos
-- RANK(): nos dice el lugar que ocupa de acuerdo a el orden de cada tupla, deja gaps entre los valores.
-- DENSE_RANK(): Es un rango mas denso que trata de eliminar los gaps que nos deja RANK.
-- PERCENT_RANK(): Categoriza de acuerdo a lugar que ocupa igual que los anteriores pero por porcentajes.

SELECT *, DENSE_RANK() OVER(PARTITION BY CARRERA_ID ORDER BY COLEGIATURA DESC) AS RANK
FROM PLATZI.ALUMNOS
ORDER BY CARRERA_ID, RANK;