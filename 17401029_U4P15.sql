/*
	Erick Octavio Nolasco Machuca
	Practica: 15
	NoControl: 17401029
	Fecha: 18 de mayo 2020

*/
use pubs;
/*A) UPSS DAÑASTE TU BD PUBS YA QUE ELIMINASTE UNA TABLA
Y NO ERA NECESARIO. RESTAURA EL RESPALDO O LOS
RESPALDOS NECESARIOS PARA PODER RECUPERAR TU BD
ANTES DE HABERLA DAÑADO.*/
drop table titleauthor;

RESTORE DATABASE pubs
FROM DISK = 'C:\BD\unidad 4\Respaldos\RESPUBS1.BAK'
WITH REPLACE,NORECOVERY

RESTORE DATABASE pubs
FROM DISK = 'C:\BD\unidad 4\Respaldos\RDIFPUBS2.BAK'
WITH REPLACE,RECOVERY
/*B) CREA UN RESPALDO COMPLETO NUEVAMENTE.*/
BACKUP DATABASE pubs
TO DISK = 'C:\BD\unidad 4\Respaldos\RCOMPUBS2.BAK'
WITH
DESCRIPTION = 'RESPALDO COMPLETO original pero con un autor',
COMPRESSION;

--C) DE LOS MOVIENTOS QUE HABIAS REALIZADO EN LA BD, QUE
--NO PUDISTE RECUPERAR?
/*Estan todos los cambios porque solo borre la tabla y restaure hasta el ultimo estado que tenia pero todo parece estar
donde deberia estar*/

--D) REALIZA LO QUE NO PUDISTE RECUPERAR Y REALIZA UN
--RESPALDO DIFERENCIAL
--Pero si se recupero todo :(

/*E) ELIGE TRES AUTORES E INSERTALE 2 PUBLICACIONES A CADA
UNO*/

insert into titleauthor values ('172-32-1176','BU1032',4,80),('172-32-1176','BU1111',4,80),
('213-46-8915','PS1372',4,80),('213-46-8915','BU1111',4,80),
('238-95-7766','BU1032',4,80),('238-95-7766','BU1111',4,80);

/*F) REALIZA UN RESPALDO DIFERENCIAL*/
BACKUP DATABASE pubs
TO DISK = 'C:\BD\unidad 4\Respaldos\RDIFPUBS3.BAK'
WITH
DIFfERENTIAL,
DESCRIPTION = 'RESPALDO Diferencial Insertamos 2 publicaciones a cada autor (3 autores)',
COMPRESSION;
use pubs;
/*G) INSERTA 5 AUTORES MEXICANOS*/
insert into authors (au_id,au_lname,au_fname,phone,[contract]) values ('123-45-6781','Octavio Paz','Octavio Paz','111-111-1111',0),
('123-45-6782','Juan Rulfo','Juan Rulfo','111-111-1111',0),('123-45-6783','Carlos Fuentes','Carlos Fuentes','111-111-1111',0),
('123-45-6784','Sor Juana','Sor Juana','111-111-1111',0),('123-45-6785','Mariano Azuela','Mariano Azuela','111-111-1111',0);

/*H) REALIZA UN RESPALDO DIFERENCIAL*/
BACKUP DATABASE pubs
TO DISK = 'C:\BD\unidad 4\Respaldos\RDIFPUBS4.BAK'
WITH
DIFfERENTIAL,
DESCRIPTION = 'RESPALDO Diferencial Insertamos 5 autores mexicanos',
COMPRESSION;

/*I) BORRAR LA BD (DROP DATABASE)*/
drop database pubs;

/*J) RECUPERA LA BD CON TODAS LAS ACTUALIZACIONES
REALIZADAS DE LOS REGISTROS.*/
RESTORE DATABASE pubs
FROM DISK = 'C:\BD\unidad 4\Respaldos\RCOMPUBS2.BAK'
WITH REPLACE,NORECOVERY

RESTORE DATABASE pubs
FROM DISK = 'C:\BD\unidad 4\Respaldos\RDIFPUBS4.BAK'
WITH REPLACE,RECOVERY