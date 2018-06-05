DROP TABLE IF EXISTS EmpresasCopia, OfertasCopia
GO

SELECT *
INTO EmpresasCopia
FROM Empresas
GO

SELECT *
INTO OfertasCopia
FROM Ofertas
GO


UPDATE OfertasCopia SET Ciudad = NULL
-- Todas las ciudades desaparecieron como dije.


MERGE INTO OfertasCopia O
-- Tabla "Target"
USING EmpresasCopia E
-- Tabla "Source"

ON (O.Empresa = E.Nombre)
-- Le decimos que cuando el nombre de las empresas coincida haga lo siguiente.

	WHEN MATCHED THEN
		UPDATE SET O.Ciudad = E.Ciudad
		-- Hacemos que lea las ciudades de la tabla Empresa y las pase a Ofertas.
		-- Cuando Marched (Coincidan) la actualiza es.

	WHEN NOT MATCHED BY SOURCE THEN
		DELETE;
	GO
	-- Cuando no coincidan en la tabla Source los valores se borran.


SELECT Empresa, Ciudad FROM OfertasCopia
		


--------------------------------------------------------------------------



DROP PROC IF EXISTS RecuperarEmailsEmpresas
GO

CREATE PROC RecuperarEmailsEmpresas
AS
	BEGIN

		DECLARE @MergeOutputProcesos TABLE (
			Accion NVARCHAR(10),
			DelEmpresa NVARCHAR(50),
			DelEmail NVARCHAR(50),
			InsEmpresa NVARCHAR(50),
			InsEmail NVARCHAR(50)
		)
		-- Creamos una tabla temporal para guardar los procesos del merge.

		DROP TABLE IF EXISTS EmpresasCopia, OfertasCopia
		-- Borramos las tablas si existían antes.

		SELECT Nombre, Ciudad
		INTO EmpresasCopia
		FROM Empresas
		
		SELECT Empresa, Ciudad
		INTO OfertasCopia
		FROM Ofertas		
		-- Creamos los clones de las tablas originales pero solo empresas y ciudades.


		ALTER TABLE EmpresasCopia ALTER COLUMN Nombre VARCHAR(30) NULL
		-- Un problema con los nulls de la copia de empresas que arreglo rápido.


		UPDATE OfertasCopia SET Ciudad = NULL
		-- Todas las ciudades desaparecieron como dije.
		

		MERGE INTO OfertasCopia O
		-- Tabla "Target"
		USING EmpresasCopia E
		-- Tabla "Source"

		ON (O.Empresa = E.Nombre)
		/*Le decimos que cuando el nombre de las 
		empresas coincida haga lo siguiente.*/

			WHEN MATCHED THEN
				UPDATE SET O.Ciudad = E.Ciudad
				/* Hacemos que lea las ciudades de la tabla Empresa 
				y las pase a Ofertas. Cuando Matched (Coincidan) 
				la actualiza significa.*/

			WHEN NOT MATCHED BY TARGET THEN
				INSERT (O.Empresa, O.Ciudad)
				VALUES (E.Nombre, E.Ciudad)
				/* Contemplo por si acaso que NOT MATCHED (no coincidan)
				la empresa de la tabla ofertas y la de la tabla Empresas 
				y si es así la inserto.*/

			WHEN NOT MATCHED BY SOURCE THEN
				DELETE
			-- Controlamos que los datos existan en ambas tablas.

			
		OUTPUT $ACTION, deleted.*, inserted.* 
		INTO @MergeOutputProcesos;
		
		SELECT * FROM @MergeOutputProcesos

	END

/*
NOTA: NO HE LOGRADO QUE FUNCIONE MANUEL... ME DA ESTE ERROR PERO REALMENTE ESTOY INTERESADO EN SABER PORQUE SI LO HICE
SIGUIENDO LOS PASOS DEL EJERCICIO DE FRUTAS Y PRODUCTOS, SI PUEDE DECIRMELO VIA MAIL TE LO AGRADECERÍA GRACIAS:
Msg 10739, Level 15, State 1, Procedure RecuperarEmailsEmpresas, Line 47 [Batch Start Line 3]
The insert column list used in the MERGE statement cannot contain multi-part identifiers. Use single part identifiers instead.
*/
