/* Erick Octavio Nolasco Machuca
	Fecha: 3 de mayo del 2020
	practica: 1
*/

-- CREAR RESPALDO COMPLETO EN LA CARPETA POR DEFAULT DEL DBMS
BACKUP DATABASE pubs
TO DISK = 'RESP_17401029.BAK'
GO
-- REALIZARA EL RESPALDO CON EL NOMBRE
-- RESP_17400544.BAK EN LA CARPETA
-- C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup

-- CREANDO UN RESPALDO COMPLETO DE PUBS EN LA CARPETA DE TRABAJO,
-- CON UN NOMBRE, UNA DESCRIPCION, CON FECHA DE EXPIRACION
BACKUP DATABASE pubs
TO DISK = 'C:\BD\unidad 4\Respaldos\RESPUBS1.BAK'
WITH
NAME = 'MI RESPALDO DE PUBS 1',
DESCRIPTION = 'RESPALDO COMPLETO 22-04-2020',
EXPIREDATE = '2020/05/01',
COMPRESSION;
-- COMPARA FISICAMENTE LOS DOS RESPALDOS
-- Y PON OBSERVACIONES POR MEDIO DE COMENTARIOS
-- EN EL QUERY

/*Resultados:
	El respaldo no comprimido pesa 10 veces mas que el respaldo comprimido, no se a que se deba o porque sea
	asi si solo le añadimos una linea, no se si afecte algo que este comprimida, pero pues pesa menos
*/