SELECT Oferta_ID, Fec_publicacion, Fec_cierre, Descripcion
FROM Ofertas
WHERE Descripcion LIKE '%oficinista%'
GO
-- % indica que tiene contenido antes y después o sea que va en medio.

SELECT Demandante_dni, Nombre, Primer_apellido, Segundo_apellido
FROM Demandante
WHERE Demandante_dni NOT LIKE '7%'
GO
-- Mostrar todos los dni de los demandantes que no empiecen por 7.