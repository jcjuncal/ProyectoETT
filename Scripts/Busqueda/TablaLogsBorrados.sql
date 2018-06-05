DROP TABLE IF EXISTS LogCopia
GO

SELECT *
INTO LogCopia
FROM Log
GO
-- Como voy a eliminar datos de una PK y no quiero problemas creo una copia de log.

DECLARE @OutputRemoveLogs TABLE
	(Log_ID INTEGER NOT NULL , 
     Fecha DATETIME NOT NULL , 
     Resultado BIT NOT NULL)
	 
DELETE FROM LogCopia
OUTPUT deleted.Log_ID, deleted.Fecha, deleted.Resultado
INTO @OutputRemoveLogs
WHERE Log_ID < 174

/* Creamos una tabla temporal, metemos dentro los datos que borramos de la tabla copia
de log y luego hacemos una select para ver que los datos coinciden.*/

SELECT * FROM @OutputRemoveLogs

SELECT * FROM LogCopia WHERE Log_ID BETWEEN 170 AND 176