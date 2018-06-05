SELECT Nombre, Primer_apellido, Segundo_apellido, Ciudad
FROM Demandante
WHERE Ciudad IN ('A Coru�a', 'Santiago', 'Lugo');
GO
-- Mostrar solo los demandantes de esas tres ciudades con IN.

SELECT Nombre, Primer_apellido, Segundo_apellido, Ciudad
FROM Demandante
WHERE Ciudad = 'A Coru�a' OR Ciudad = 'Santiago' OR Ciudad = 'Lugo'
GO
-- Mostrar solo los demandantes de esas tres ciudades con IN.