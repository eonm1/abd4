/*
	Erick Octavio Nolasco Machuca
	NoControl: 17401029
	Fecha: 10 de mayo de 2020
	Practica 13
*/

/*A) RESTAURA EL HEADER DEL PRIMER BACKUP COMPLETO
NORTWIND QUE REALIZASTE.*/


RESTORE HEADERONLY
FROM DISK= 'C:\BD\unidad 4\Respaldos\COMP1_NORTH.BAK'

/*B) RESTAURA EL RESPALDO COMPLETO.*/
RESTORE DATABASE NORTHWIND
FROM DISK= 'C:\BD\unidad 4\Respaldos\COMP1_NORTH.BAK'
WITH REPLACE,RECOVERY

/*C) REVISA LA BD HACIENDO SELECT EN LAS DIFERENTES TABLAS
Y VERIFICANDO LA ESTRUCTURA DE LA BD, PON EN
COMENTARIOS COMO QUEDO LA BASE DE DATOS*/
use Northwind;

select * From Categories;
select * from Employees;
select * from CustomerCustomerDemo;
Select * from CustomerDemographics;
Select * From Customers;
Select * from EmployeeTerritories;
Select * FROM [Order Details];
Select * from Orders;
Select * from Products;
Select * frOM Region;
sELECT * from Shippers;
Select * from Suppliers;
Select * from Territories;

/*La base de datos quedó igual que la original lo mas notorio fue que hicimos una carga masiva de empleados que ya no estan
Todo está como la original */