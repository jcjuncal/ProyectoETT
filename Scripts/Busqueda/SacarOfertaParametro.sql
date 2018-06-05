CREATE PROC OfertasAnual
@AÑO DATETIME
AS
BEGIN
	SELECT *
	FROM Ofertas
	WHERE DATEPART(yy,Fec_publicacion) = @AÑO
END
-- Creamos el procedimiento con una variable año para pasarselo.

EXEC OfertasAnual 2016
EXEC OfertasAnual 2017
EXEC OfertasAnual 2018
-- Llamamos al procedimiento con el año que queramos.