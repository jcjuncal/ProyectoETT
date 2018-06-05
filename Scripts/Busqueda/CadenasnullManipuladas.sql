SELECT Nombre,
ISNULL (Email,'MAILVACIO') + ' ' + ISNULL (Direccion,'DIRVACIA') 
+ ' ' + ISNULL (Ciudad, 'CIUDADVACIA') AS 'Datos Empresa'
FROM Empresa
GO
-- ISNULL nos da lo que le digamos cuando aparece un null.


SELECT Nombre,
CONCAT (Email, '[1] ', Direccion,' [2] ', Ciudad, ' [3] ') 
AS 'Datos Empresa'
FROM Empresa
GO
-- Concat hace los mismo pero cambia la sintaxis como vemos.