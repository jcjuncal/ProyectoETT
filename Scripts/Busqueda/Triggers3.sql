DROP TRIGGER IF EXISTS tgr_CuentaFilasBorradas
GO

DROP TABLE IF EXISTS CopiaDemandantes
GO

SELECT *
INTO CopiaDemandantes
FROM Demandantes
GO

CREATE TRIGGER tgr_CuentaFilasBorradas
ON CopiaDemandantes
FOR DELETE
AS
	RAISERROR('%d filas borradas de la tabla CopiaDemandantes',17,3, @@ROWCOUNT)
GO
-- Con %d mostramos el formato de salida de rowcount de distinta manera.

DELETE FROM CopiaDemandantes
GO
/*
(19 rows affected)
Msg 50000, Level 17, State 3, Procedure tgr_CuentaFilasBorradas, Line 5 [Batch Start Line 18]
19 filas borradas de la tabla CopiaDemandantes
*/

DISABLE TRIGGER tgr_CuentaFilasBorradas ON CopiaDemandantes


---------------------------------------------------------------------------



DROP TRIGGER IF EXISTS tgr_CuentaFilasBorradas
GO

DROP TABLE IF EXISTS CopiaDemandantes
GO

SELECT * INTO CopiaDemandantes FROM Demandantes
GO

CREATE TRIGGER tgr_CuentaFilasBorradas ON CopiaDemandantes FOR UPDATE
AS
	RAISERROR('%d filas borradas de la tabla CopiaDemandantes',17,3, @@ROWCOUNT)
GO
-- Con %d mostramos el formato de salida de rowcount de distinta manera.

UPDATE CopiaDemandantes SET Fecha_nacimiento = GETDATE()
GO
/*
(19 rows affected)
Msg 50000, Level 17, State 3, Procedure tgr_CuentaFilasBorradas, Line 5 [Batch Start Line 18]
19 filas borradas de la tabla CopiaDemandantes
*/

DISABLE TRIGGER tgr_CuentaFilasBorradas ON CopiaDemandantes