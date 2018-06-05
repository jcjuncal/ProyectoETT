DROP PROC IF EXISTS BorradorDemandantes	GO

CREATE PROC BorradorDemandantes
AS
BEGIN
	
	DROP TABLE IF EXISTS DemandantesBorrados
	-- Borra la tabla si existe como sabemos pero ENTERA.

	SELECT *
	INTO DemandantesBorrados
	FROM Demandantes

	SELECT * FROM Demandantes

	DELETE FROM DemandantesBorrados
	-- Borra todas las filas pero no la tabla como estructura.

	SELECT * FROM DemandantesBorrados

END

EXEC BorradorDemandantes


--------------------------------------------------------------------------


DROP TABLE IF EXISTS DemandantesBye

SELECT *
INTO DemandantesBye
FROM Demandantes


TRUNCATE TABLE DemandantesBye

SELECT * FROM DemandantesBye
-- Borramos los demandantes igual que antes con truncate.