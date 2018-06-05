SELECT *
FROM Ofertas
WHERE Duracion LIKE '[1-5]%MES%'
ORDER BY Duracion
GO
-- Mostrando que la oferta de trabajo dure de 1 a 5 meses.

SELECT *
FROM Empresa
WHERE Email LIKE '[a-d]%'
ORDER BY Email
GO
-- Empresas cuyo correo empieza por a, b, c o d.


SELECT *
FROM Empresa
WHERE Email LIKE '[^a-d]%'
ORDER BY Email
GO
-- Empresas cuyo correo NO empieza por a, b, c o d.