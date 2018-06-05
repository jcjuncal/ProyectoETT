SELECT Activa, Duracion, Tipo_contrato, Empresa
FROM Ofertas
WHERE Activa = 'true' AND (Duracion = 'Indefinido'
OR NOT Tipo_contrato = 'Jornada completa')
GO
-- Sacar las ofertas activas indefinidas o que no sean a tiempo completo.