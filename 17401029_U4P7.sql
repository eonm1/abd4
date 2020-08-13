/*
	Erick Octavio Nolasco Machuca
	NoControl: 17401029
	Fecha: 10 de mayo
	Practica: 7
*/

/*
A) AUMENTA UN 10% A LOS PRECIOS DE LOS PRODUCTOS
CUYA CATEGORIA EMPIECE CON UNA ‘C’.
*/
update Products set UnitPrice = UnitPrice * 1.1 where CategoryID in (Select CategoryID from Categories where CategoryName like 'C%')
go

/*B) REALIZA UN RESPALDO DIFERENCIAL*/
BACKUP DATABASE NORTHWIND
TO DISK = 'c:/bd/unidad 4/Respaldos/RespDifCategory10.bak'
WITH
DIFFERENTIAL,
NAME = 'RESPALDOD Products*1.1',
DESCRIPTION = 'Respaldo diferencial con los productos de la categoria C aumentados 10%',
STATS = 5,
COMPRESSION
go
/*C) INSERTA 1000 EMPLEADOS*/
insert into Employees (LastName,FirstName) values ('insertar1000','Erick')
go 1000
/*D) INSERTA DOS ORDENES DE COMPRA COMPLETAS ( ES
DECIR LA ORDEN Y SU DETALLE DE ORDEN CON AL MENOS
2 ARTICULOS VENDIDOS EN CADA UNA)*/
insert into Orders (CustomerID,EmployeeID) values ('WOLZA',10); --11078
insert into Orders (CustomerID,EmployeeID) values ('BONAP',11); --11079

insert into [Order Details] values (11078,1,100,1,0),(11078,2,50,2,0);
insert into [Order Details] values (11079,3,45,3,0),(11079,4,62,1,0);

/*E) REALIZA UN RESPALDO DIFERENCIA ELIGE PARAMENTROS
DISTINTOS AL ANTERIOR*/
BACKUP DATABASE NORTHWIND
TO DISK ='c:/bd/unidad 4/Respaldos/RespDifEmplo.bak'
WITH 
DIFFERENTIAL,
DESCRIPTION = 'Cadena de Descripcion',
EXPIREDATE = '30/12/2020',
STATS = 10,
COMPRESSION
GO
/*F) CREA UNA TABLA DE EMPLEADOS_HISTORICO*/
Create table EMPLEADOS_Historico
(
	[EmployeeID] int
      ,[LastName] nvarchar(20)
      ,[FirstName] nvarchar(10)
      ,[Title] nvarchar(30)
      ,[TitleOfCourtesy] nvarchar(25)
      ,[BirthDate] datetime
      ,[HireDate] datetime
      ,[Address] nvarchar(60)
      ,[City] nvarchar(15)
      ,[Region] nvarchar(15)
      ,[PostalCode] nvarchar(10)
      ,[Country] nvarchar(15)
      ,[HomePhone] nvarchar(24)
      ,[Extension] nvarchar(4)
      ,[Photo] image
      ,[Notes] ntext
      ,[ReportsTo] int
      ,[PhotoPath] nvarchar(255)

)
drop TABLE EMPLEADOS_Historico;
select * into EMPLEADOS_Historico from Employees where BirthDate < '01/01/2000'
go
/*H) REALIZA UN RESPALDO DIFERENCIAL UTILIZANDO OTRO
JUEGO DE PARAMETROS*/
BACKUP DATABASE NORTHWIND
TO DISK ='c:/bd/unidad 4/Respaldos/RespDifTabla.bak'
WITH 
DIFFERENTIAL,
DESCRIPTION = 'Creamos una tabla y le vaciamos los empleados con fecha menor a 2000',
EXPIREDATE = '30/12/2020',
STATS = 10,
COMPRESSION
GO
/*I) ACTUALIZA LAS FECHAS DE LAS ORDENES QUE QUEDEN
CON FECHAS DEL 2020,2019,2018*/
update Orders set OrderDate = dateadd(yy,22,OrderDate)
go
update Orders set RequiredDate = dateadd(yy,22,RequiredDate)
go
update Orders set ShippedDate = dateadd(yy,22,ShippedDate)
go
--J) REALIZA UN RESPALDO DE COMPLETO
BACKUP DATABASE NORTHWIND
TO DISK ='c:/bd/unidad 4/Respaldos/RespCompFechas.bak'
WITH 
DESCRIPTION = 'Actualizamos las fechas de las tabla Orders',
EXPIREDATE = '30/12/2020',
STATS = 10,
COMPRESSION
GO
/*K) INSERTA 20 NUEVOS PRODUCTOS*/
insert into Products (ProductName) values ('ProductoPrueba')
go 20
/*L) ACTUALIZA LAS EDADES DE LOS EMPLEADOS HAZLOS MAS
JOVENES QUE TENGAN ENTRE 20 Y 30 AÑOS*/
update Employees set BirthDate = dateadd(yy,40,BirthDate)
go
/*M) REALIZA UN RESPALDO DE SOLO COPIA*/
BACKUP DATABASE Northwind
TO DISK = 'c:/bd/unidad 4/Respaldos/RespCopyFechas.bak'
WITH COPY_ONLY,
COMPRESSION
go
/*N) REALIZA UN RESPALDO DIFERENCIAL*/
BACKUP DATABASE NORTHWIND
TO DISK ='c:/bd/unidad 4/Respaldos/RespDifFechas.bak'
WITH 
DIFFERENTIAL,
DESCRIPTION = 'Actualizacion de los cumpleaños de los empleados',
EXPIREDATE = '30/12/2020',
STATS = 10,
COMPRESSION
go