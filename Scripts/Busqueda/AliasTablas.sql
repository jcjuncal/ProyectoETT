SELECT E.CIF_NIF, E.Email, E.Telefono
FROM Empresa AS E
GO

SELECT D.Demandante_dni + ' => ' 
+ D.Segundo_apellido + ', ' + D.Segundo_apellido
AS 'DNI => APELLIDOS'
FROM Demandante D