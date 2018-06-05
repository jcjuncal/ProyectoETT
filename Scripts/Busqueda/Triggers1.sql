DROP TRIGGER IF EXISTS ControlLogin
GO
-- Controlamos la existencia del trigger.

CREATE TRIGGER ControlLogin
ON ALL SERVER
FOR CREATE_LOGIN
AS
	PRINT 'No puedes crear un login'
	ROLLBACK TRAN
GO
-- Cuando se cree un usuario el trigger se dispara y el rollback anula la creación.


CREATE LOGIN Hugo WITH PASSWORD = 'ett.em1'




-------------------------------------------------------------------------------




DROP TRIGGER IF EXISTS PrevencionBorradosETT
GO

CREATE TRIGGER PrevencionBorradosETT
ON ALL SERVER
FOR DROP_LOGIN
AS
	PRINT 'No puedes borrar logins de la ETT'
	ROLLBACK TRAN
GO

DISABLE TRIGGER ControlLogin ON ALL SERVER
-- Deshacemos el trigger anterior para que no nos salte y creamos el login.

CREATE LOGIN Hugo WITH PASSWORD = 'ett.em1'

DROP LOGIN Hugo
GO

DISABLE TRIGGER PrevencionBorradosETT ON ALL SERVER
-- Deshacemos el trigger para que no tener problemas luego.