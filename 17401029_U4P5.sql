/*
	Erick Octavio Nolasco Machuca
	Fecha: 3 de mayo del 2020
	Practica: 5
*/

--EN LA BASE DE  DATOS PUBS
Use pubs
go
--1. INSERTA 1000 REGISTROS EN LA BD, 
--ELIGE UNA TABLA QUE SE PUEDA REALIZAR 

CREATE TABLE PRACTICA5
( ID INTEGER IDENTITY(1,1) PRIMARY KEY,
  NOMBRE VARCHAR(20)
)
GO

INSERT INTO PRACTICA5
VALUES ('NOMBRE NUEVO')
GO 1000

SELECT * FROM PRACTICA5
--ESTA ACCI�N (PK AUTOINCREMENTAL)
--2.REALIZA UN RESPALDO DIFERENCIAL

BACKUP DATABASE PUBS
TO DISK = 'C:\BD\unidad 4\Respaldos\RDIFPUBS1.BAK'
WITH
   DIFFERENTIAL,
   NAME = 'RDIFPUBS',
   DESCRIPTION = 'AGREGAMOS UNA TABLA Y 1000 REG',
   COMPRESSION,
   STATS = 5;


--3. ELIMINA UNA TABLA
DROP TABLE PRACTICA5

--4. INSERTA UN AUTOR 
insert into authors values ('123-45-5789','Nolasco Machuca','Erick','311 743-6405','225 Hidalgo','Ahuacatlan','CA','94130',0)
--5.REALIZA UN SEGUNDO 
--  RESPALDO DIFERENCIAL SIN COMPRIMIRLO, 
--SOLO CON NAME, DESCRIPTION Y EXPIREDATE.

BACKUP DATABASE PUBS
TO DISK = 'C:\BD\unidad 4\Respaldos\RDIFPUBS2.BAK'
WITH
  DIFFERENTIAL,
  NAME = 'RDIFPUBS2.BAK',
  DESCRIPTION = 'SEGUNDO RES. SIN TABLA MAS 1 AUTOR',
  EXPIREDATE = '31/12/2020';