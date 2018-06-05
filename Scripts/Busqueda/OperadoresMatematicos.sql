DROP TABLE IF EXISTS ComparacionSalarios 
GO

CREATE TABLE ComparacionSalarios (
	ID INT IDENTITY PRIMARY KEY,
	Empresa VARCHAR(25),
	Salario MONEY,
	Direccion VARCHAR(20))
GO

INSERT INTO ComparacionSalarios (Empresa, Salario, Direccion)
VALUES 
('Gestora Comprar de Lonja', 1870.00, 'Pontevedra'),
('Young Promotion', 1300.00, 'A Coruña'),
('Mercadona', 1312.00, 'Lugo'),
('Nunegal Consulting', 2500.00, 'A Coruña')
GO

SELECT Empresa, Salario + 300 FROM ComparacionSalarios
WHERE ID = 1
SELECT Empresa, Salario - 500 FROM ComparacionSalarios
WHERE ID = 2
SELECT Empresa, Salario * 2 FROM ComparacionSalarios
WHERE ID = 3
SELECT Empresa, Salario / 2 FROM ComparacionSalarios
WHERE ID = 4