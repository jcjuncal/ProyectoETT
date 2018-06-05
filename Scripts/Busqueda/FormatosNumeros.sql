SELECT Fecha_nacimiento, CONVERT(nvarchar(20), Fecha_nacimiento)
AS Fecha_formato_distinto
FROM Demandante
GO
-- Mostrar la fecha de nacimiento con dos formatos distintos.

SELECT CAST (Telefono AS varchar(25))
FROM Empresa
GO
-- Mostrar el telefono como varchar.