SELECT TOP (7) WITH TIES Nombre, Primer_apellido, Segundo_apellido, Ciudad
FROM Demandante
ORDER BY Ciudad
GO
/* Le limitamos a 7 pero muestra 10, esto se debe a que el último demandante
es de Lugo y ha encadenado con todos los demandantes de Lugo que le siguen,
si pusiesemos 6 no nos encadenaría porque no hay nadie después del sexto
que sea  de la ciudad de A Coruña.*/