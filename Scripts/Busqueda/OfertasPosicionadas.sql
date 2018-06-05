SELECT Contraseña, Roles_Rol_ID
FROM Acceso
GO
-- 113 Results

SELECT DISTINCT Contraseña, Roles_Rol_ID
FROM Acceso
GO
-- 2 Results

SELECT *
FROM Log
WHERE Resultado = 'false'
GO