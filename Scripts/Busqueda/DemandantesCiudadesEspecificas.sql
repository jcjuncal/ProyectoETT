SELECT Nombre, Primer_apellido, Segundo_apellido, Ciudad
FROM Demandante
WHERE Ciudad IN ('A Coruña', 'Santiago', 'Lugo');
GO
-- Mostrar solo los demandantes de esas tres ciudades con IN.

SELECT Nombre, Primer_apellido, Segundo_apellido, Ciudad
FROM Demandante
WHERE Ciudad = 'A Coruña' OR Ciudad = 'Santiago' OR Ciudad = 'Lugo'
GO
-- Mostrar solo los demandantes de esas tres ciudades con IN.