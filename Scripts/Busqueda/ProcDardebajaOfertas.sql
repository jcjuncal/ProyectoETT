DROP PROC IF EXISTS GestionOfertas
GO

CREATE PROC GestionOfertas
@DAR_ALTA_BAJA CHAR,
@RANGO_OFERTAS1 INT,
@RANGO_OFERTAS2 INT
AS
	BEGIN

		DROP TABLE IF EXISTS OfertasCopia

		SELECT *
		INTO OfertasCopia
		FROM Ofertas
		/* Como voy a eliminar datos de una PK y no 
		quiero problemas creo una copia de Ofertas.*/

		DECLARE @OutputUpdateOfertas TABLE
			(
			 Oferta_ID INTEGER NOT NULL , 
			 Fec_publicacion DATETIME NOT NULL , 
			 Fec_cierre DATETIME NOT NULL , 
			 Descripcion VARCHAR (150) NOT NULL , 
			 Activa BIT NOT NULL , 
			 Duracion VARCHAR (20) , 
			 Tipo_contrato VARCHAR (20) , 
			 Salario INTEGER , 
			 Horas INTEGER , 
			 Candidato VARCHAR (25) , 
			 Empresa VARCHAR (25) , 
			 Ciudad VARCHAR (25) 
			)
	 
		UPDATE OfertasCopia
		SET Activa = @DAR_ALTA_BAJA
		OUTPUT inserted.Oferta_ID, inserted.Fec_publicacion, 
		inserted.Fec_cierre, inserted.Descripcion, 
		deleted.Activa, inserted.Duracion, inserted.Tipo_contrato,
		inserted.Salario, inserted.Horas, inserted.Candidato, 
		inserted.Empresa, inserted.Ciudad
		INTO @OutputUpdateOfertas
		WHERE Oferta_ID BETWEEN @RANGO_OFERTAS1 AND @RANGO_OFERTAS2
		/* Introducimos en las tablas inserted y 
		deleted los datos que actualizamos.*/

		SELECT * FROM @OutputUpdateOfertas
		SELECT * FROM OfertasCopia WHERE Oferta_ID 
		BETWEEN @RANGO_OFERTAS1 AND @RANGO_OFERTAS2
		-- Mostramos el resultado
END

EXEC GestionOfertas '1', '30', '40'

