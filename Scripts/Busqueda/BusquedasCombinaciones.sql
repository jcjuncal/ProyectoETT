SELECT A.Acceso_ID, A.Contraseña, L.Log_ID, L.Fecha, A.Roles_Rol_ID
FROM Acceso A
INNER JOIN Log L
ON A.Log_Log_ID = L.Log_ID
ORDER BY Fecha
GO
-- Mostrando los logs que se han realizado mostrando contraseña y rol que lo hizo.


SELECT D.Demandante_dni, D.Nombre, O.Oferta_ID ,O.Descripcion
FROM Demandantes D
LEFT OUTER JOIN Ofertas O
ON D.Nombre = O.Candidato
ORDER BY O.Oferta_ID
GO
-- Mostramos todos los candidatos y su inscripción en una oferta por la ETT.


SELECT E.CIF_NIF, E.Nombre, O.Oferta_ID, O.Descripcion, O.Empresa
FROM Empresas E
RIGHT OUTER JOIN Ofertas O
ON E.Nombre = O.Empresa
ORDER BY E.Nombre DESC
GO
-- Mostramos todos los candidatos y su inscripción en una oferta por la ETT.
-- Desde la última oferta nos pidieron ordenarlo.


SELECT D.Demandante_dni, D.Nombre, O.Oferta_ID ,O.Descripcion
FROM Demandantes D
LEFT OUTER JOIN Ofertas O
ON D.Nombre = O.Candidato
ORDER BY O.Oferta_ID
GO
-- Mostramos todos los candidatos y su inscripción en una oferta por la ETT.


SELECT D.Demandante_dni, D.Nombre, O.Oferta_ID ,O.Descripcion
FROM Demandantes D
FULL JOIN Ofertas O
ON D.Nombre = O.Candidato
ORDER BY O.Oferta_ID
GO
-- Vemos los candidatos asignados a ofertas y ofertas que no tienen a nadie asignado.


SELECT  A.Roles_Rol_ID, A.Contraseña, A.Acceso_ID, L.Log_ID, L.Fecha
FROM Acceso A CROSS JOIN Log L
ORDER BY A.Roles_Rol_ID
GO
-- Mostrando los logs de cada rol en las fechas que se hizo y ordenados por el rol.


SELECT D.Demandante_dni, D.Nombre, E.CIF_NIF, E.Nombre, O.Oferta_ID, O.Descripcion
FROM Demandantes D
INNER JOIN Empresas E
ON D.Ciudad = E.Ciudad
INNER JOIN Ofertas O
ON O.Ciudad = E.Ciudad
GO
-- Sacamos todos los demandantes, empresas y ofertas de la ciudad de A Coruña.