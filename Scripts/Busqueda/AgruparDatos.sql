SELECT Empresa
FROM Ofertas
GROUP BY Empresa
GO
/* Agrupamos las empresas por su nombre en las ofertas, pero ésto de por si
no nos aporta nada, porque tampoco le estamos pasando una función de 
agregación que haga algo a los datos que tenemos, para sacar un resultado 
con sentido lo haré en el siguiente.*/ 

SELECT Empresa, COUNT(*) AS Ofertas_Empresa
FROM Ofertas
GROUP BY Empresa
GO
/* Ahora que le hemos mandado una función de agregación (COUNT) y obtenemos
cuantas ofertas tiene cada empresa.*/

SELECT Roles_Rol_ID AS Accesos_ETT, COUNT(Log_Log_ID) AS Numero_Logeos
FROM Acceso
GROUP BY Roles_Rol_ID
GO
/* Mostrar cuantos logs tuvo un rol, obviamente el personal
de la ETT es el que tiene todos porque es el único que puede
iniciar sesion en esta plataforma...*/

SELECT Tipo_contrato, COUNT(Tipo_contrato) 
AS 'Administrativos con este contrato'
FROM Ofertas
WHERE Tipo_contrato IS NOT NULL AND Descripcion LIKE '%Admin%'
GROUP BY Tipo_contrato
GO
/*Mostrar las ofertas de administrativo según el tipo de contrato pero
omitiendo las que no tengan el contrato especificado.*/

SELECT Tipo_contrato, COUNT(Tipo_contrato) 
AS 'Administrativos con este contrato'
FROM Ofertas
WHERE Descripcion LIKE '%Admin%'
GROUP BY Tipo_contrato
HAVING Tipo_contrato IS NOT NULL
GO
/*Mostrar las ofertas de administrativo según el tipo de contrato pero
omitiendo las que no tengan el contrato especificado, usando filtro.*/