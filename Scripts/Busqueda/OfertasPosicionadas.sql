SELECT Contraseņa, Roles_Rol_ID
FROM Acceso
GO
-- 113 Results

SELECT DISTINCT Contraseņa, Roles_Rol_ID
FROM Acceso
GO
-- 2 Results

SELECT *
FROM Log
WHERE Resultado = 'false'
GO