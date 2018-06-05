DROP TRIGGER IF EXISTS tgr_Controlborrado

DROP TABLE IF EXISTS CopiaActividades

SELECT * INTO CopiaActividades FROM Actividades
GO

CREATE TRIGGER tgr_Controlborrado ON CopiaActividades FOR DELETE
AS
	IF (SELECT COUNT(*) FROM DELETED) > 1
	-- Con esto controlamos que no se pueda borrar más de un registro.
		BEGIN
			RAISERROR('No puedes borrar más de una actividad',13,2)
			ROLLBACK
			RETURN
			-- Es aconsejable ponerlo, tomar costumbre.
		END
	ELSE
		IF (SELECT COUNT(*) FROM DELETED) = 0
		-- Le decimos por si acaso se borre borrar 0 actividades porque lo haría si lo ponemos.
		BEGIN
			RAISERROR('Solo puedes borrar una actividad',13,3)
			ROLLBACK
			RETURN
		END
			ELSE
				PRINT 'Actividad borrada'
GO
-- Este trigger controla que borremos más de una actividad de la empresa, así que probamos.

DELETE FROM CopiaActividades WHERE CNAE = '1102'
GO
-- Una sin problema nos deja.

DELETE FROM CopiaActividades
GO
-- Pero si se pasa no podemos.

DELETE FROM CopiaActividades WHERE CNAE = '0967'
-- Borramos uno que no existe y último if que pilla.