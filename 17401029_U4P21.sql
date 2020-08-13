/*
	Erick Octavio Nolasco Machuca
	NoControl: 17401029
	Practica:21 
	Fecha: 18 de mayo de 2020
*/

/*USTED HACIENDO UNA REVISION EN LA BD DE SUPERHEROES
HA DETECTADO QUE ALGUIEN MAL INTENCIONADO HIZO LAS
INSERCIONES EN LAS TABLAS DE DETALLE ENEMIGO Y DETALLE
PODERES DE LOS HEROES (ES DECIR EL PASO K DE LA PRACTICA
11).

USTED COMO DBA DEBE CORREGIR EL ERROR.

INDIQUE LOS PASOS QUE DEBE REALIZAR EN COMENTARIOS
DEL QUERY. DESPUES REALICELO. PERO SABIENDO QUE LA BD
DEBE DE QUEDAR CON TODOS LOS MOVIMIENTOS EXCEPTO LO
QUE HIZO ESA PERSONA MAL INTENCIONADA.*/

--Pasos
--1. Restaurar el ultimo respaldo completo del que se tiene registro hasta antes de lo mal intensionado
--2. Restaurar el ultimo respaldo diferencial que se tenga hasta antes de suceder lo mal intensionado
--3. Si es posible realizar los cambios necesarios para dejarla igual (solo si es posible)

--1. y 2 porque es el mimso
RESTORE DATABASE SUPERHEROES
FROM DISK = 'C:\BD\unidad 4\Respaldos\RespCompHeroes3.bak'
WITH REPLACE,RECOVERY

--3...
insert into heroes values
('Tony Stark','Iron Man','01/05/1997',45,'Es mortal sin su traje','Marvel',null,null),
('Bruce Baner','Hulk','01/05/1997',48,'El miedo','Marvel',null,null),
('Peter Parker','Spiderman','01/05/2002',18,'Necesita edificios','Marvel',null,null),
('Carol Danvers','Capitana Marvel','01/05/1960',32,'Sus recuerdos del pasado','Marvel',null,null),
('ClintBarton','Flash','01/05/1997',38,'Nomas lleva como 7 flechas el vato','Marvel',null,null)
go

Drop table detPoderHeroe;
drop Table detPoderVillano;
drop table detEnemigoHeroe;