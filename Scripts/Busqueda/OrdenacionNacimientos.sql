SELECT *
FROM Demandante
WHERE Fecha_nacimiento LIKE '%19[67]0%'
GO
-- Demandantes nacidos en 1060 o 1970

SELECT *
FROM Demandante
WHERE Fecha_nacimiento NOT LIKE '%[23]0%'
GO
-- Demandantes nacidos en 1060 o 1970