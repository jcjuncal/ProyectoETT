DROP TABLE IF EXISTS ContratoETT_Empresa
GO
-- Comprobamos si existe.

CREATE TABLE ContratoETT_Empresa (
COD INT NOT NULL PRIMARY KEY IDENTITY(1,1),
CIF_NIF VARCHAR(15),
Nombre VARCHAR(30),
FOREIGN KEY (CIF_NIF) REFERENCES Empresas(CIF_NIF)
)
-- La creo con todos los datos.

INSERT INTO ContratoETT_Empresa (CIF_NIF, Nombre) 
VALUES 
('A42342345', 'C.ManageCenter'),
('A58934857', 'C.AdegarBeiramar'),
('A89374933', 'C.Abertal'),
('A97354094', 'C.AgoraMagna'),
('B34578973', 'C.JuanCanalejo'),
('B34759357', 'C.Electroshop')
-- Insertamos varios registros.
-- Seis empresas han firmado con la ETT un contrato el resto aun no.


INSERT INTO ContratoETT_Empresa (COD, CIF_NIF, Nombre) 
VALUES 
(9, 'B38423058', 'C.Humegal')
-- Intentamos insertar otro contrato dandole un identity nuestro y nos da error.
/* Msg 544, Level 16, State 1, Line 25 Cannot insert explicit 
value for identity column in table 'ContratoETT_Empresa' when IDENTITY_INSERT 
is set to OFF.*/

SET IDENTITY_INSERT ContratoETT_Empresa ON;
-- Para poder meter un identity tenemos que gestionar nosotros la tabla no el sistema.


INSERT INTO ContratoETT_Empresa (COD, CIF_NIF, Nombre) 
VALUES 
(9, 'B38423058', 'C.Humegal')
-- Y ahora que nosotros gestionamos los identity ya nos deja.

-- Overriding Identity
SET IDENTITY_INSERT ContratoETT_Empresa OFF;
-- Volvemos a darle al sistema el control para evitarnos problemas.


INSERT INTO ContratoETT_Empresa (COD, CIF_NIF, Nombre) 
VALUES 
(12, 'B65464645', 'C.AlquileresAtlántico')
-- Y tenemos el mismo error que antes obviamente.
/* Msg 544, Level 16, State 1, Line 47
Cannot insert explicit value for identity column in table 'ContratoETT_Empresa' 
when IDENTITY_INSERT is set to OFF.*/


SELECT SCOPE_IDENTITY();
-- Nos muestra el último identity que se metió es decir "9".


SET IDENTITY_INSERT ContratoETT_Empresa ON;
-- Volvemos a tomar el control.


INSERT INTO ContratoETT_Empresa (COD, CIF_NIF, Nombre) 
VALUES 
(4, 'B78453209', 'C.EmpresasWirtz')
-- Ahora tratamos de meter una empresa que no existe en la tabla empresas.
/* Msg 2627, Level 14, State 1, Line 64
Violation of PRIMARY KEY constraint 'PK__Contrato__C1FF6E91E27EBE94'. 
Cannot insert duplicate key in object 'dbo.ContratoETT_Empresa'. 
The duplicate key value is (4).*/

/* Este error es porque la FK no apunta a ninguna PK existente, 
o sea viola la integridad referencial al no existir esa empresa.*/


SET IDENTITY_INSERT ContratoETT_Empresa OFF;
-- Dejamos todo como estaba controlado por el sistema.