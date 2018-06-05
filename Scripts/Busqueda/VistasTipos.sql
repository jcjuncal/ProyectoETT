DROP TABLE IF EXISTS EmpresasCopia

SELECT E.Nombre, E.Ciudad INTO EmpresasCopia FROM Empresas E
-- Creamos una tabla clon con dos columnas de la tabla empresas.

DROP VIEW IF EXISTS vistaEmpresas1	GO

CREATE VIEW vistaEmpresas1 (Nombre, Ciudad)	AS
	SELECT Nombre, Ciudad
	FROM EmpresasCopia
GO
-- Creamos una vista de dicha tabla creada.

INSERT INTO EmpresasCopia VALUES ('Sacos Rojos', 'Pontevedra')	GO
-- Insertamos unos valores en la tabla.

SELECT * FROM EmpresasCopia	GO

CREATE VIEW vistaEmpresas2	AS
	SELECT *
	FROM EmpresasCopia
	WHERE Nombre LIKE '%A'
GO
-- Creamos una segunda vista de ella pero pasandole un filtro (Esta es la clave del error).

SELECT * FROM vistaEmpresas2

INSERT INTO vistaEmpresas2 VALUES ('Jardineria Suarez', 'Padron')	GO
-- insertamos un registro en la segunda vista.

DELETE vistaEmpresas2
WHERE Nombre = 'Jardineria Suarez'
GO
-- Y cuando tratamos de borrar dicho registro no da error pero afectó a 0 columnas.




DROP VIEW IF EXISTS vistaEmpresas2
GO

CREATE VIEW vistaEmpresas2
AS
	SELECT *
	FROM EmpresasCopia
	WHERE Nombre LIKE '%A'
	WITH CHECK OPTION
GO
-- Creamos la misma segunda vista pero con el check option.

SELECT * FROM vistaEmpresas2

INSERT INTO vistaEmpresas2
VALUES ('Jardineria Suarez', 'Padron')
GO
-- Pero esta vez no nos dije insertar nos da error un error por el check que marcamos.
/*Msg 550, Level 16, State 1, Line 64 The attempted insert or update failed 
because the target view either specifies WITH CHECK OPTION or spans a 
view that specifies WITH CHECK OPTION and one or more rows resulting 
from the operation did not qualify under the CHECK OPTION constraint.
The statement has been terminated*/



------------------------------------------------------------- WITH ENCRYPTION



DROP VIEW IF EXISTS vistaEmpresas2
GO

CREATE VIEW vistaEmpresas2
WITH ENCRYPTION
AS
	SELECT *
	FROM EmpresasCopia
	WHERE Nombre LIKE '%A' 	
GO
-- Creamos la misma segunda vista pero con encriptacíón.

sp_helptext vistaEmpresas2
-- Aqui tenemos el mensaje de encriptación.




------------------------------------------------------------- WITH SCHEMABINDING

DROP TABLE IF EXISTS DemandantesCopia
GO

SELECT D.Nombre, D.Ciudad INTO DemandantesCopia FROM Demandantes D

DROP VIEW IF EXISTS vistaDemandantes
GO

CREATE VIEW vistaDemandantes
AS
	SELECT Nombre, Ciudad
	FROM DemandantesCopia
GO
-- Con esto tenemos una tabla copia de demantantes y una vista de ella.


DROP TABLE DemandantesCopia
GO
-- Ahora borramos la tabla.


INSERT INTO vistaDemandantes VALUES ('Perico', 'Ponferrada')
-- Al tratar de insertar registros en la vista obviamente no nos deja como que la tabla no esta.
-- Eso es lo que evitaremos con el with SchemaBinding.
GO




-- Repetimos el proceso pero creamos la vista con with schemabinding.

DROP TABLE IF EXISTS DemandantesCopia
GO

SELECT D.Nombre, D.Ciudad INTO DemandantesCopia FROM Demandantes D

DROP VIEW IF EXISTS vistaDemandantes
GO

CREATE VIEW vistaDemandantes
WITH SCHEMABINDING
AS
	SELECT Nombre
	FROM dbo.DemandantesCopia
GO
-- Con esto lo que hacemos es enlazar la tabla con la vista.

DROP TABLE DemandantesCopia
GO
-- Por eso no nos deja borrarla.
