SELECT 
MAX (Fec_publicacion) AS 'Último_registro',
MIN (Fec_publicacion) AS 'Primer_registro'
FROM Ofertas
GO
-- Queremos saber la primera y última fecha de un registro de ofertas.

SELECT AVG (Salario) AS Media_Sueldos
FROM ComparacionSalarios
GO
-- Sacamos la media de salarios de la tabla ComparaciónSalarios

SELECT SUM (Salario) AS Salario_Total, 
CONVERT(int,SUM(Salario)) AS Salario_Total_INT
FROM ComparacionSalarios
GO
-- Sacamos la suma de todos los salarios pero sin ceros decimales.