-- NO ACTION (DEFAULT).
DROP PROC IF EXISTS CreaAcceso_Log	GO
	
CREATE PROC CreaAcceso_Log
AS
	BEGIN
		DROP TABLE IF EXISTS CopiaAcceso, CopiaLog

		SELECT Acceso_ID, Contraseña, Log_Log_ID INTO CopiaAcceso FROM Acceso

		SELECT * INTO CopiaLog FROM Log
		-- Creo una copia de ambas tablas.

		ALTER TABLE CopiaLog ADD CONSTRAINT PK_Logs PRIMARY KEY (Log_ID)
	END

EXEC CreaAcceso_Log

ALTER TABLE CopiaAcceso ADD CONSTRAINT FK_Accesos 
FOREIGN KEY (Log_Log_ID) REFERENCES CopiaLog (Log_ID)
-- Como al ser una copia no tienen FK ni PK se las creo.

DELETE FROM CopiaLog
WHERE Log_ID = '1'
/* Nos salta el error porque estamos violando la integridad referencial, 
Msg 547, Level 16, State 0, Line 25
The DELETE statement conflicted with the REFERENCE constraint 
"Acceso_Log_FK". The conflict occurred in database "ETTGALICIAFINAL", 
table "dbo.Acceso", column 'Log_Log_ID'.
The statement has been terminated.*/

ALTER TABLE CopiaAcceso 
	NOCHECK CONSTRAINT FK_Accesos
-- Para arreglarlo (aunque no se debe) desmarcamos (o podemos borrarla) la restricción.

DELETE FROM CopiaLog WHERE Log_ID = '1'
-- Y ya nos permite borrarlo.



-------------------------------------------------
-- ON CASCADE.

EXEC CreaAcceso_Log
GO

ALTER TABLE CopiaAcceso 
ADD CONSTRAINT FK_Accesos 
		FOREIGN KEY (Log_Log_ID) REFERENCES CopiaLog (Log_ID)
		ON DELETE CASCADE
		-- ON UPDATE CASCADE;
GO

DELETE FROM CopiaLog 
WHERE Log_ID = '1'
-- Ahora si borramos el primer logs veremos que desaparecen tambien en la otra tabla su FK.

SELECT * FROM CopiaAcceso


-------------------------------------------------
-- SET NULL.

EXEC CreaAcceso_Log
GO

ALTER TABLE CopiaAcceso ALTER COLUMN [Log_Log_ID] INT NULL
-- Primero arreglo un problema pequeño con los null para usar esta constraint.

ALTER TABLE CopiaAcceso 
ADD CONSTRAINT FK_Accesos 
		FOREIGN KEY (Log_Log_ID) REFERENCES CopiaLog (Log_ID)
		ON DELETE SET NULL;
GO
-- Con set null en lugar de borrar las FK las pone a null.


DELETE FROM CopiaLog 
WHERE Log_ID = '1'
-- Ahora si borramos el primer logs veremos que se pone a null tambien en la otra tabla su FK.

SELECT * FROM CopiaAcceso


-------------------------------------------------
-- SET DEFAULT.

EXEC CreaAcceso_Log
GO

ALTER TABLE CopiaAcceso ALTER COLUMN [Log_Log_ID] INT NULL

ALTER TABLE CopiaAcceso 
ADD CONSTRAINT FK_Accesos 
		FOREIGN KEY (Log_Log_ID) REFERENCES CopiaLog (Log_ID)
		ON DELETE SET DEFAULT;
GO

DELETE FROM CopiaLog 
WHERE Log_ID = '1'

SELECT * FROM CopiaAcceso
SELECT * FROM CopiaLog

INSERT INTO CopiaLog VALUES (1,'2018-01-01 08:02:54.000',1)

SELECT * FROM CopiaAcceso