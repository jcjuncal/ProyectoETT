DECLARE @OutputLogs TABLE
	(Log_ID INTEGER NOT NULL , 
     Fecha DATETIME NOT NULL , 
     Resultado BIT NOT NULL)
	 
INSERT
INTO Log(Log_ID, Fecha, Resultado)
OUTPUT inserted.Log_ID, inserted.Fecha, inserted.Resultado
INTO @OutputLogs
		(Log_ID, Fecha, Resultado)
VALUES 
(175, '2018-05-29 08:04:01.000', 1),
(176, '2018-05-30 08:20:04.000', 0),
(177, '2018-05-30 08:24:04.000', 1)
/* Creamos una tabla temporal, metemos dentro los datos que insertaremos a la tabla log
y luego hacemos una select para ver que los datos coinciden.*/

SELECT * FROM @OutputLogs

SELECT * FROM Log WHERE Log_ID BETWEEN 170 AND 176