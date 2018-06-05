DROP TABLE IF EXISTS DemandantesCopia, OfertasCopia
GO

SELECT *
INTO DemandantesCopia
FROM Demandantes
GO

SELECT *
INTO OfertasCopia
FROM Ofertas
GO

DELETE 
FROM OfertasCopia
WHERE Candidato IN (SELECT Nombre FROM DemandantesCopia)

SELECT * FROM OfertasCopia WHERE Candidato IS NOT NULL
-- Muestro que realmente no hay candidatos en esa tabla.


--------------------------------------------------------------------------


DROP TABLE IF EXISTS DemandantesCopia, OfertasCopia, CandidatosBorrados

SELECT *
INTO DemandantesCopia
FROM Demandantes
GO

SELECT *
INTO OfertasCopia
FROM Ofertas

SELECT *
INTO CandidatosBorrados
FROM Ofertas
WHERE 1=0

DELETE OfertasCopia
OUTPUT deleted.*
INTO CandidatosBorrados
WHERE Candidato IN (SELECT Nombre FROM DemandantesCopia)

SELECT * FROM CandidatosBorrados
-- Muestro los candidatos que han sido borrados de la tabla Ofertas (Copia).