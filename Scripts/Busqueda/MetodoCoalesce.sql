SELECT COALESCE (Email, Direccion, Ciudad)
FROM Empresa
GO
-- Se salta los null y devuelve solo el siguiente valor tras él.

SELECT Nombre, Email, Direccion, Ciudad
FROM Empresa
GO
-- Saco los datos y vemos nulls