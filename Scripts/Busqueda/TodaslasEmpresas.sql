SELECT Nombre
FROM Empresa
WHERE Nombre IS NOT NULL
	UNION
SELECT Empresa
FROM Ofertas
WHERE Empresa IS NOT NULL
-- Sacamos todas las empresas que hay registradas en la ETT.

--------------------------------------------------------------------------

SELECT Nombre
FROM Empresa
WHERE Nombre IS NOT NULL
	UNION ALL
SELECT Empresa
FROM Ofertas
WHERE Empresa IS NOT NULL
-- Sacamos todas las empresas que hay registradas en la ETT aunque se repitan.