/*
	Erick Octavio Nolasco Machuca
	NoControl:17401029
	Practica: 20
	Fecha:18 de mayo de 2020
*/

/*1. DROPEA LA BD ALMACEN*/
Drop database ALMACEN;

/*2. RESTAURE EL(LOS) RESPALDO(S) MAS RECIENTES*/
RESTORE DATABASE ALMACEN
FROM DISK = 'C:\BD\unidad 4\Respaldos\RespComp10may.BAK'
WITH REPLACE,NORECOVERY

RESTORE FILELISTONLY
FROM DISK='C:\BD\unidad 4\Respaldos\RespDifALMDatos3.bak';

RESTORE DATABASE ALMACEN
FROM DISK ='C:\BD\unidad 4\Respaldos\RespDifALMDatos3.bak'
WITH
REPLACE,RECOVERY,
MOVE 'ALMACEN.MDF'
TO 'C:\BD\unidad 4\Bases\ALMACEN.MDF'
,
MOVE 'ALMACEN.LDF'
TO 'C:\BD\unidad 4\Bases\ALMACEN.LDF'
GO

/*3. PONGA EN COMENTARIOS SI PERDIO ALGO Y QUE . O EN
CASO DE NO HABER PERDIDO DIGA PORQUE.*/

/*Tiene las mismas tablas que como la deje y al parecer los datos estan correctos porque este respaldo
fue lo ultimo que hice y ya no se le hicieron cambios a la base de datos, sin embargo no se que suceda con log de transacciones
que tambien tiene un respaldo*/