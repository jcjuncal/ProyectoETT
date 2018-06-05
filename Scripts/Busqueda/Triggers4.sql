DROP TRIGGER IF EXISTS tgr_EmpresasActualizadas
GO

DROP TABLE IF EXISTS CopiaEmpresas
GO

SELECT * INTO CopiaEmpresas FROM Empresas
GO

CREATE TRIGGER tgr_EmpresasActualizadas ON CopiaEmpresas INSTEAD OF UPDATE
AS
	RAISERROR('No puede actualizar las empresas',14,8)
GO
-- Con instead of le decimos que haga algo en lugar de borrar es decir el raiserror.

UPDATE CopiaEmpresas SET Ciudad = 'A Coruña'
GO
-- Mandamos todas las empresas de galicia para Coruña.
-- Aunque nos devuelve 20 filas afectadas eso no es cierto vemos.

SELECT * FROM CopiaEmpresas
GO

DISABLE TRIGGER tgr_EmpresasActualizadas ON CopiaEmpresas


-----------------------------------------------


DROP TRIGGER IF EXISTS tgr_OfertasModificadas
GO

DROP TABLE IF EXISTS Copiaofertas
GO

SELECT * INTO Copiaofertas FROM Ofertas
GO

CREATE TRIGGER tgr_OfertasModificadas ON Copiaofertas FOR UPDATE
AS
	PRINT ('Mostrando Tabla inserted')
	SELECT * FROM inserted
	PRINT ('Mostrando tabla deleted')
	SELECT * FROM deleted
GO
-- El trigger nos muestra las dos tablas temporales.

UPDATE Copiaofertas SET Fec_cierre = GETDATE()
GO
-- Actualizamos todas las fechas.

SELECT * FROM Copiaofertas
GO

DISABLE TRIGGER tgr_OfertasModificadas ON Copiaofertas


sp_helptrigger Copiaofertas
-- Visualizar el trigger creado, borrarlo con  drop trigger if exists.