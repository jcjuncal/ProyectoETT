SELECT Nombre, Email 
AS Correos_Pendientes_Solicitar
FROM Empresa
WHERE Email IS NULL
GO
-- Encargar de llamar a las 5 empresas y pedir sus correos.