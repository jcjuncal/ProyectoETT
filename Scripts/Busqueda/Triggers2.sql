DROP TRIGGER IF EXISTS Tablasintocables
GO

CREATE TRIGGER Tablasintocables
ON DATABASE
FOR DROP_TABLE, ALTER_TABLE
AS
	RAISERROR('No se puede editar ni borrar las tablas de la ETT', 19, 6)
	ROLLBACK TRAN
GO
-- Creamos un trigger que se dispare cuando alguien borre o modifique tablas.

SELECT *
INTO CopiaEmpresas
FROM Empresas
GO
-- Creamos una tabla y comprobamos.

DROP TABLE CopiaEmpresas
GO
-- Aquí salta el trigger que anula el borrado.


DISABLE TRIGGER Tablasintocables ON DATABASE
-- Lo deshabilito para evitar problemas y ya podemos borrar tranquilamente.



------------------------------------------------------



DROP TRIGGER IF EXISTS RegistrosIntocables
GO

DROP TABLE IF EXISTS LogCopia
GO

SELECT *
INTO LogCopia
FROM Log
GO

CREATE TRIGGER RegistrosIntocables
ON LogCopia
FOR UPDATE, INSERT, DELETE
AS
	RAISERROR ('Los registros de log no se pueden tocar', 9, 2)
	ROLLBACK TRAN
GO

UPDATE LogCopia SET Log_ID = '5' WHERE Log_ID = '9'
GO
-- Áhí tenemos el error.

DISABLE TRIGGER RegistrosIntocables ON LogCopia
-- Como antes borro el trigger por si acaso.




------------------------------------------------------



DROP TRIGGER IF EXISTS Tgr_Borravistas
GO

DROP VIEW IF EXISTS VistaDemandantes
GO

CREATE VIEW VistaDemandantes
AS
	SELECT *
	FROM Demandantes
GO

CREATE TRIGGER Tgr_Borravistas
ON VistaDemandantes
INSTEAD OF DELETE
	AS
		RAISERROR('No puedes borrar datos de esta vista',9,17)
		ROLLBACK TRAN
GO

DELETE FROM VistaDemandantes
GO

DISABLE TRIGGER Tgr_Borravistas ON VistaDemandantes
GO