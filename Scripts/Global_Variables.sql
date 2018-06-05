-- Mostrar la versi�n de SQL que tenemos.
SELECT @@VERSION AS 'VERSION_SQL'
PRINT @@VERSION
/* Microsoft SQL Server 2016 (RTM-GDR) (KB4019088) - 13.0.1742.0 (X64)   
Jul  5 2017 23:41:17   Copyright (c) Microsoft Corporation  
Enterprise Edition (64-bit) on Windows 10 Enterprise 6.3 <X64> 
(Build 16299: ) (Hypervisor)*/ 

-- Ver la cantidad de inicios de sesi�n e intentos de inicios que hubo.
SELECT @@CONNECTIONS AS 'INICIOS_SESION'
PRINT @@CONNECTIONS
-- 25342 'logins'

-- Mostrar el m�ximo de conexiones simultaneas que podemos tener.
SELECT @@MAX_CONNECTIONS AS 'CONEXIONES M�XIMAS'
PRINT @@MAX_CONNECTIONS
-- 32767 'conections'

-- Ver la cantidad de paquetes le�dos por SQL Server desde que lo iniciamos.
SELECT @@PACK_RECEIVED AS 'PAQUETES_RECIBIDOS'
PRINT @@PACK_RECEIVED
-- 10881 'Packages'

-- Ver la cantidad de paquetes enviados por SQL Server desde que lo iniciamos.
SELECT @@PACK_SENT AS 'PAQUETES_ENVIADOS'
PRINT @@PACK_SENT
-- 14897 'Packages'

-- Ver la cantidad de paquetes que dieron error a SQL Server desde que lo iniciamos.
SELECT @@PACKET_ERRORS AS 'PAQUETES_ERRORES'
PRINT @@PACKET_ERRORS
-- 3 'Packages'

/* Ver la cantidad de tiempo (En ticks) que la CPU estuvo trabajando en el �ltimo
inicio de sesi�n. */
SELECT @@CPU_BUSY AS 'OCUPACI�N_CPU'
PRINT @@CPU_BUSY
-- 18716 'ticks'

/* Ver la cantidad de tiempo (En ticks) que SQL Server se encontr� inactivo durante 
el �ltimo inicio de sesi�n.*/
SELECT @@IDLE AS 'INACTIVIDAD_SQL'
PRINT @@IDLE
-- 314198 (Ticks)

/* Ver el tiempo (En ticks) que SQL Server estuvo realizando operaciones de entrada
y de salida. */
SELECT @@IO_BUSY AS 'TIEMPO_OPERACIONES'
PRINT @@IO_BUSY
-- 8668 (Ticks)

-- Mostrar si tuvimos un error en el �ltimo proceso, si devuelve 0 es que lo tuvo.
SELECT @@ERROR AS 'ULTIMA_EJECUCI�N'
PRINT @@ERROR
-- 0 'LA SELECT @@CPU BUSY' SE EJECUTO CORRECTAMENTE'

-- Mostrar la cantidad de columnas afectadas por el �ltimo comando utilizado.
SELECT @@ROWCOUNT AS 'COLUMNAS_AFECTADAS'
PRINT @@ROWCOUNT
-- 1 'Columna'

-- Nos devuelve en formato "Smallint" el lenguaje local que estamos usando.
SELECT @@LANGID AS 'ID_LENGUAJE_ACTUAL'
PRINT @@LANGID
-- 0 'Esto significa que est� en Ingl�s'.

-- Mostrar lo mismo que antes pero con el nombre del lenguaje.
SELECT @@LANGUAGE AS 'LENGUAJE_ACTUAL'
PRINT @@LANGUAGE
-- us_english

-- Muesta el �ltimo valor que metimos en un tipo identity.
SELECT @@IDENTITY AS 'VALOR_INCREMENTAL'
PRINT @@IDENTITY
-- NULL  


-- NO PONGO M�S EJEMPLOS PORQUE SON M�S DE 30...