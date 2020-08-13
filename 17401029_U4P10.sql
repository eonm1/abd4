/*
	Erick Octavio Nolasco Machuca
	Fecha: 10 de mayo del 2020 
	Practica: 10
	NoControl: 17401029
*/

--CREA UN RESPALDO COMPLETO

backup database ALMACEN
to disk = 'C:\BD\unidad 4\Respaldos\RespComp10may.BAK'
with
Compression
go

/*REALIZA MOVIMIENTO EN AL MENOS 2 TABLAS Y EN 5
REGISTROS EN CADA UNA*/
insert into CAJEROS values ('1234567891','Erick','Nolasco Machuca','3117436405','Hidalgo #225 Ahuacatlan'),
						   ('1234567892','Erick','Nolasco Machuca','3117436405','Hidalgo #225 Ahuacatlan'),
						   ('1234567893','Erick','Nolasco Machuca','3117436405','Hidalgo #225 Ahuacatlan'),
						   ('1234567894','Erick','Nolasco Machuca','3117436405','Hidalgo #225 Ahuacatlan'),
						   ('1234567895','Erick','Nolasco Machuca','3117436405','Hidalgo #225 Ahuacatlan')
						   go

insert into VENTAS values ('01/01/2020','1234567891',20.5,100,0,16),
						  ('02/01/2020','1234567892',20.5,100,0,16),
						  ('03/01/2020','1234567893',20.5,100,0,16),
						  ('04/01/2020','1234567894',20.5,100,0,16),
						  ('05/01/2020','1234567895',20.5,100,0,16)
						  go
--REALIZA UN RESPALDO DIFERENCIAL ELIGE LOS
--PARAMETROS
BACKUP DATABASE ALMACEN
TO DISK = 'c:/bd/unidad 4/Respaldos/RespDifALMDatos.bak'
WITH
DIFFERENTIAL,
DESCRIPTION = 'Insertamos 5 datos en 2 tablas, CAJEROS Y VENTAS',
STATS = 5,
COMPRESSION
go

/*CREA UNA TABLA CON DOS CAMPOS Y CREALE RELACION
CON ALGUNA TABLA.*/
create Table Sueldos
(
	idSueldo int identity(1,1) primary key,
	Cantidad money,
	ID_CAJEROS varchar(10) references CAJEROS(ID_CAJEROS)
)
go

/*INSERTALE REGISTRO A LA TABLA QUE CREASTE.*/
insert into Sueldos values (1500,'1234567891'),(3000,'1234567892'),(1750,'1234567893') 
go

/*REALIZA UN RESPALDO DIFERENCIAL Y JUEGA CON LOS
DISTINTOS PARAMETROS PARA QUE PRACTIQUES*/
BACKUP DATABASE ALMACEN
TO DISK = 'c:/bd/unidad 4/Respaldos/RespDifALMDatos1.bak'
WITH
DIFFERENTIAL,
DESCRIPTION = 'Se creo una nueva tabla SUELDOS y se le insertaron 3 datos y una relacion con cajeros',
STATS = 5,
COMPRESSION
go

/*INSERTA MASIVAMENTE REGISTROS EN UNA TABLA QUE
TENGA UNA PK AUTOINCREMENTAL*/
insert into VENTAS values ('05/06/2020','1234567893',10,300,0,48)
go 500

/*REALIZA UN RESPALDO DE SOLO COPIA*/
BACKUP DATABASE ALMACEN
TO DISK = 'c:/bd/unidad 4/Respaldos/RespCopyALM1.bak'
WITH COPY_ONLY,
COMPRESSION
go

/*REALIZA UN RESPALDO DIFERENCIAL.*/
BACKUP DATABASE ALMACEN
TO DISK = 'c:/bd/unidad 4/Respaldos/RespDifALMDatos2.bak'
WITH
DIFFERENTIAL,
DESCRIPTION = 'Insersión masiva en tabla de ventas',
STATS = 5,
COMPRESSION
go

/*BORRA LA TABLA QUE CREASTE.*/
drop table Sueldos;
/*ACTUALIZA LOS REGISTROS MASIVOS QUE INSERTASTE*/
Update VENTAS set IMP_DESCUENTOS = 10 WHERE FECHA_VTA='05/06/2020'

/*REALIZA UN RESPALDO DIFERENCIAL*/
BACKUP DATABASE ALMACEN
TO DISK = 'c:/bd/unidad 4/Respaldos/RespDifALMDatos3.bak'
WITH
DIFFERENTIAL,
DESCRIPTION = 'Borrada la tabla Sueldos y actualizando la insersion masiva en ventas',
STATS = 5,
COMPRESSION
go

/*REALIZA UN RESPALDO DEL LOG DE TRANSACCIONES*/
BACKUP LOG ALMACEN
TO DISK ='C:\BD\unidad 4\Respaldos\RESPLOGALM1.TRN'
WITH STATS= 10