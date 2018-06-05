DROP VIEW IF EXISTS VistaDemandantes
GO
-- Como siempre comprobamos la existencia de la vista.

CREATE VIEW VistaDemandantes
AS
	SELECT * FROM Demandantes
GO
-- Creamos la vista de la tabla demandantes.

SELECT * FROM VistaDemandantes
GO


----------------------------------------------------

DROP VIEW IF EXISTS VistaCombinacion
GO

CREATE VIEW VistaCombinacion
AS
	SELECT O.Oferta_ID, O.Empresa, E.CIF_NIF, E.Nombre
	FROM Ofertas O
	INNER JOIN Empresas E
	ON O.Empresa = E.Nombre
GO

SELECT * FROM VistaCombinacion