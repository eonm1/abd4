/*
	Erick Octavio Nolasco Machuca
	Practica: 14
	Fecha: 18 de mayo de 2020
*/

/*Pasos:
1. Restaurar el respaldo completo 1 con la opción de NORECOVERY*/
RESTORE DATABASE Northwind
FROM DISK = 'C:\BD\unidad 4\Respaldos\COMP1_NORTH.BAK'
WITH REPLACE,NORECOVERY
/*2. Restaurar el respaldo diferencial 3 con la opción RECOVERY*/
RESTORE DATABASE Northwind
FROM DISK = 'C:\BD\unidad 4\Respaldos\RespDifEmplo.bak'
WITH REPLACE,RECOVERY
/*3. Verificar el estatus.*/
SELECT NAME,STATE_DESC
FROM SYS.DATABASES
WHERE NAME ='Northwind'