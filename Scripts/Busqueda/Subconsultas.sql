SELECT Acceso_ID, Contraseña, Roles_Rol_ID, Log_Log_ID
FROM Acceso
WHERE Log_Log_ID IN (SELECT Log_ID FROM Log)
GO
-- Mostrando todos lo logs que se hicieron y que roles con sus contraseñas.


SELECT A.CNAE, A.Actividad, A.Salario
FROM Actividades A
WHERE A.Salario > (SELECT AVG(O.Salario) FROM Ofertas O WHERE O.Salario IS NOT NULL)
ORDER BY Salario
GO
-- Mostrando las empresas cuyo salario es mayor que la media de las ofertas.


SELECT A.CNAE, A.Actividad, A.Salario
FROM Actividades A
WHERE NOT A.Salario > (SELECT AVG(O.Salario) FROM Ofertas O WHERE O.Salario IS NOT NULL)
ORDER BY Salario
GO
-- Mostrando las empresas cuyo salario NO es mayor que la media de las ofertas.