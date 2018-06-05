CREATE PROC Ofertas2016
AS
BEGIN
	SELECT *
	FROM Ofertas
	WHERE Fec_publicacion
	BETWEEN '2016-01-01' AND '2016-12-31'
END

--------------------------------------------------------------------------

CREATE PROC Ofertas2017
AS
BEGIN
	SELECT *
	FROM Ofertas
	WHERE Fec_publicacion
	BETWEEN '2017-01-01' AND '2017-12-31'
END

--------------------------------------------------------------------------

CREATE PROC Ofertas2018
AS
BEGIN
	SELECT *
	FROM Ofertas
	WHERE Fec_publicacion
	BETWEEN '2018-01-01' AND '2018-12-31'
END
-- Lo ejecuto uno a uno creando proceso por proceso.

EXEC Ofertas2016

EXEC Ofertas2017

EXEC Ofertas2018