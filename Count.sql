USE DEV_SIF;

SELECT
    COUNT(*) AS Resultado_Consulta
FROM
    (
        SELECT
            CC.CodigoPersona AS CodigoTercero,
            P.NombrePersona AS NombreTercero,
            CONCAT(
                P.NombrePersona,
                CASE
                    WHEN P.PrimerApellido IS NOT NULL THEN CONCAT(' ', P.PrimerApellido)
                    ELSE ''
                END,
                CASE
                    WHEN P.SegundoApellido IS NOT NULL THEN CONCAT(' ', P.SegundoApellido)
                    ELSE ''
                END,
                CASE
                    WHEN CC.CodigoPersona IS NOT NULL THEN CONCAT(' - ', CC.CodigoPersona)
                    ELSE ''
                END
            ) AS Tercero,
            CC.CodigoCentroDeCosto AS CodigoCentroDeCosto,
            CC.NombreCentroDeCosto,
            CONCAT(
                CC.CodigoCentroDeCosto,
                ' - ',
                CC.NombreCentroDeCosto
            ) AS CentroDeCosto,
            CC.NumeroContrato,
            CASE
                WHEN CC.FechaInicial = '1900-01-01' THEN NULL
                ELSE FORMAT(CC.FechaInicial, 'dd/MM/yyyy')
            END AS FechaInicio,
            CASE
                WHEN CC.FechaFinal = '1900-01-01' THEN NULL
                ELSE FORMAT(CC.FechaFinal, 'dd/MM/yyyy')
            END AS FechaFin,
            UBI.NombreUbicacionCentroDeCosto AS Ciudad,
            CONCAT(
                CC.CodigoVendedor,
                CASE
                    WHEN VEN.NombrePersona IS NOT NULL THEN CONCAT(' - ', VEN.NombrePersona)
                    ELSE ''
                END,
                CASE
                    WHEN VEN.PrimerApellido IS NOT NULL THEN CONCAT(' ', VEN.PrimerApellido)
                    ELSE ''
                END,
                CASE
                    WHEN VEN.SegundoApellido IS NOT NULL THEN CONCAT(' ', VEN.SegundoApellido)
                    ELSE ''
                END
            ) AS Vendedor,
            UND.NombreUnidadDeNegocio AS UnidadDeNegocio,
            ST.NombreEstado AS Estado
        FROM
            GN_CentroDeCosto AS CC
            LEFT JOIN GN_Persona AS P ON CC.CodigoPersona = P.CodigoPersona
            INNER JOIN GN_Cliente AS C ON CC.CodigoPersona = C.CodigoPersona
            LEFT JOIN GN_UbicacionCentroDeCosto AS UBI ON CC.Ubicacion = UBI.CodigoUbicacionCentroDeCosto
            LEFT JOIN GN_UnidadDeNegocio AS UND ON CC.CodigoUnidadDeNegocio = UND.CodigoUnidadDeNegocio
            LEFT JOIN ST_Estado AS ST ON CC.CodigoEstado = ST.CodigoEstado
            JOIN GN_Persona AS VEN ON CC.CodigoVendedor = VEN.CodigoPersona
    ) AS subquery;