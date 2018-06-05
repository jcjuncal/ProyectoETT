SELECT Nombre,
Email + ' ' + Direccion + ' ' + Ciudad AS 'Datos Empresa'
FROM Empresa
GO
-- Cadenas con un null contanedas las devuelve null completas.

SELECT Nombre, Email, Direccion, Ciudad
FROM Empresa
GO
-- Saco los datos y vemos nulls.