SELECT Nombre, Primer_apellido, Segundo_apellido, Fecha_nacimiento
FROM Demandante
ORDER BY Fecha_nacimiento
GO
/* Mostramos los Demandantes ordenados por fecha de nacimiento.
Por defecto nos lo ordena de forma ascendente*/

SELECT Demandante_dni, Nombre, Primer_apellido, Segundo_apellido
FROM Demandante
ORDER BY Demandante_dni DESC
GO
-- Ordenados por DNI de forma descendente en esta ocasión.

SELECT Demandante_dni, Nombre, Fecha_nacimiento 
FROM Demandante
WHERE Fecha_nacimiento BETWEEN '1968-01-01' AND '1978-12-30'
ORDER BY 'Fecha_nacimiento'
-- Ordeno los demandantes de 50 a 60 años por fecha de nacimiento.

SELECT *
FROM Demandante
ORDER BY 5
GO
-- Ordeno los demandantes por fecha de nacimiento (5º campo).


SELECT *
FROM Demandante
ORDER BY DATEPART(MONTH, Fecha_nacimiento)
GO
/* Ordeno los demandantes por fecha de nacimiento pero por mes
gracias a la función datepart que le dije que tome el month (mes)
podría hacer una de día y otra de año simultaneamente*/


SELECT DISTINCT * FROM Demandante
ORDER BY Demandante_dni
SELECT COUNT(*) AS Demandantes_Registrados
FROM Demandante 
GO
/* Muestro los demandantes ordenados por dni SIN REPETIDOS y luego
saco el número de registrados por la ETT*/