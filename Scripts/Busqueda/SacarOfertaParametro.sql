CREATE PROC OfertasAnual
@A�O DATETIME
AS
BEGIN
	SELECT *
	FROM Ofertas
	WHERE DATEPART(yy,Fec_publicacion) = @A�O
END
-- Creamos el procedimiento con una variable a�o para pasarselo.

EXEC OfertasAnual 2016
EXEC OfertasAnual 2017
EXEC OfertasAnual 2018
-- Llamamos al procedimiento con el a�o que queramos.