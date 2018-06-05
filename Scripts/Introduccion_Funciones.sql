USE MINIETT
GO

-- Mostrar la base de datos con la que estamos trabajando.
SELECT DB_NAME() AS 'DATABASE_ACTUAL';
PRINT DB_NAME();
GO
-- MINIETT

-- Ver el Id de la base de datos.
SELECT DB_ID();
PRINT DB_ID();
GO
-- 27

-- Mostrar el login con el que estoy conectado.
SELECT ORIGINAL_LOGIN();
PRINT ORIGINAL_LOGIN();
GO
-- DAWA10WIN10\dawa10

-- Mostrar el usuario de base de datos con el que estoy ahora mismo.
SELECT CURRENT_USER;
PRINT CURRENT_USER;
GO
-- dbo

-- Mostrar el usuario de sistema con el que estoy ahora mismo.
SELECT SYSTEM_USER;
PRINT SYSTEM_USER;
GO
-- DAWA10WIN10\dawa10

-- Mostrar el nombre del Host (PC).
SELECT HOST_NAME();
PRINT HOST_NAME();
GO
-- DAWA10WIN10

-- Ver la id del usuario con el que estoy.
SELECT USER_ID();
PRINT USER_ID();
GO
-- 1