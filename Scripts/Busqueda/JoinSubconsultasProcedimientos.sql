SELECT E.Actividades_CNAE, E.Nombre, E.Ciudad
FROM Empresas E
WHERE Ciudad = 'A Coruña' AND EXISTS (
								SELECT Ciudad 
								FROM Ofertas
								WHERE Ciudad = 'A Coruña'
								)
GO
-- Sacamos todas las empresas registradas en la web con ofertas en A Coruña.


SELECT DISTINCT O.Empresa, E.Nombre, E.Actividades_CNAE, E.Ciudad
FROM Empresas E
JOIN Ofertas O
ON E.Nombre = O.Empresa
WHERE E.Ciudad = 'A Coruña'
GO
-- Sacamos todas las empresas registradas en la web con ofertas en A Coruña con DISTINCT.


DROP PROC IF EXISTS OfertasEmpresa 
GO

CREATE PROC OfertasEmpresa
 @Ciudad VARCHAR(25)
AS
	SELECT DISTINCT O.Empresa, E.Nombre, E.Actividades_CNAE, E.Ciudad
	FROM Empresas E
	JOIN Ofertas O
	ON E.Nombre = O.Empresa
	WHERE E.Ciudad = @Ciudad
GO
-- Sacamos todas las empresas registradas en la web de la ciudad que le pasemos.

EXEC OfertasEmpresa Pontevedra
-- Pasamos una ciudad y ya nos saca sus ofertas.