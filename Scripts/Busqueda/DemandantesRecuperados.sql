DROP TABLE IF EXISTS DemandantesRecuperados
GO
-- Como siempre comprobamos la existencia de la tabla que crearemos.

SELECT *
INTO DemandantesRecuperados
FROM Demandantes
GO
-- Creo un clon de la tabla demandantes para no tocar la original.

BEGIN TRANSACTION
TRUNCATE TABLE DemandantesRecuperados
SELECT * FROM DemandantesRecuperados
-- Borro el contenido de dicha tabla.

ROLLBACK TRANSACTION
SELECT * FROM DemandantesRecuperados
-- Y comprobamos que ya tenemos todo recuperado.


------ CON DELETE AHORA

BEGIN TRANSACTION
DELETE FROM DemandantesRecuperados
SELECT * FROM DemandantesRecuperados
-- Borro el contenido con delete ahora de dicha tabla.

ROLLBACK TRANSACTION
SELECT * FROM DemandantesRecuperados
-- Y comprobamos que ya tenemos todo recuperado.