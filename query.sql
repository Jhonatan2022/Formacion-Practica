-- Terceros
SELECT
    P.CodigoPersona AS CodigoTercero,
    P.NombrePersona AS NombreTercero,
    CONCAT(P.CodigoPersona, '-', P.NombrePersona) AS Tercero
FROM
    GN_Cliente AS CL
    LEFT JOIN GN_Persona AS P ON CL.CodigoPersona = P.CodigoPersona;

SELECT
    U.CodigoUnidadDeNegocio AS UnidadDeNegocio,
    C.NombreCentroDeCosto AS CentroDeCosto,
    C.NumeroContrato
FROM
    GN_UnidadDeNegocio AS U
    LEFT JOIN GN_CentroDeCosto AS C ON U.CodigoUnidadDeNegocio = C.CodigoUnidadDeNegocio
WHERE
    C.NumeroContrato IS NOT NULL
ORDER BY
    U.CodigoUnidadDeNegocio;

--formato d-m-y
SELECT
    FORMAT(CC.FechaInicial, 'dd-MM-yyyy') AS FechaInicial,
    FORMAT(CC.FechaFinal, 'dd-MM-yyyy') AS FechaFinal,
    UBI.NombreUbicacionCentroDeCosto
FROM
    GN_CentroDeCosto AS CC
    LEFT JOIN GN_UbicacionCentroDeCosto AS UBI ON CC.Ubicacion = UBI.CodigoUbicacionCentroDeCosto;



-- Reguklar
SELECT
    CC.CodigoPersona AS CodigoTercero,
    P.NombrePersona AS NombreTercero,
    CONCAT(CC.CodigoPersona, '-', P.NombrePersona) AS Tercero,
    CC.CodigoCentroDeCosto AS CentroDeCosto,
    CC.NombreCentroDeCosto AS NombreCentroDeCosto,
    CC.NumeroContrato,
    FORMAT(CC.FechaInicial, 'dd/MM/yyyy') AS FechaInicio,
    FORMAT(CC.FechaFinal, 'dd/MM/yyyy') AS FechaFin,
    UBI.NombreUbicacionCentroDeCosto AS Ciudad,
    CONCAT(
        UNN.CodigoUnidadDeNegocio,
        '-',
        UNN.NombreUnidadDeNegocio
    ) AS UnidadDeNegocio,
    CC.CodigoEstado AS Estado
FROM
    GN_CentroDeCosto AS CC
    INNER JOIN GN_Cliente AS C ON CC.CodigoPersona = C.CodigoPersona cambiar por left join
    LEFT JOIN GN_Persona AS P ON C.CodigoPersona = P.CodigoPersona cambiar por inner join
    LEFT JOIN GN_UbicacionCentroDeCosto AS UBI ON CC.Ubicacion = UBI.CodigoUbicacionCentroDeCosto
    LEFT JOIN GN_UnidadDeNegocio AS UNN ON CC.CodigoUnidadDeNegocio = UNN.CodigoUnidadDeNegocio;