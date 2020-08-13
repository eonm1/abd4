/*
	Erick Octavio Nolasco Machuca
	Practica: 11
	NoControl:17401029
	Fecha: 10 de mayo de 2020
*/

--A) CREA UN RESALDO COMPLETO
backup database SUPERHEROES
to disk = 'C:\BD\unidad 4\Respaldos\RespCompHeroes1.BAK'
with
Description = 'Base de datos original sin datos',
Compression
go

--B) INSERTA LOS LUGARES DE DEFENSA AL MENOS 10
insert into lugaresDefensa values ('NewYork','Ciudad','Ciudad grande que siempre destruyen'),
('Santadilla','Ciudad','Siempre llegan monstros gigantes'),
('Dimsdey','Ciudad','Hay magia pero no ocupa ser salvada'),
('Gotham','Ciudad','Es obscura y tiene murcielagos'),
('Ahuacatlan','Pueblo','Es pequeño pero es bonito'),
('Springfield','Ciudad','Hay mucha gente amarilla'),
('South Park','Condado','Mucha gente pequeña y grosera'),
('Smallville','villa','Ahi estaba el superman guapo'),
('Atlantis','Ciudad','Esta bajo el agua sumergida'),
('Metropolis','Ciudad','Creo que ahi pelio el Superman tambien')
go
--C) INSERTA LOS PODERES QUE VAYAS A NECESITAR
insert into poder values ('Super fuerza','No','Da un aumento muy alto a la fuerza que tiene el personaje'),
('Volar','No','Permite al personaje volar'),
('Super velocidad','No','Permite desplazarse a una velocidad elevada'),
('Lanzar telarañas','Si','Es posible lanzar telarañas por medio de un aparato llamado mano juaz')
go

--D) INSERTA SUPERHEROES AL MENOS 10
insert into heroes values ('Clart Kent','Super Man','01/03/1982',45,'Criptonita','DC',null,null),
('Steve Rogers','Capitan America','01/05/1950',70,'Que se quede sin escudo','Marvel',null,null),
('Bombon','Bombon','01/09/1998',10,'El profesor','Cartoon',null,null),
('Cosmo','Cosmo','01/08/2001',29,'Las reglas','Nikelodeon',null,null),
('Homero Simpson','EveryMan','01/01/1989',38,'La cerveza','Amarillo',null,null),
('Bruce Wayne','Batman','10/08/1989',40,'No tener traje','DC',null,null),
('Erick Nolasco','La leyenda','05/06/1999',20,'Ninguna papa siempre grande','MayamiClan',null,null),
('Eric Carman','Gordito','01/08/2006',12,'Es pequeño','Park',null,null),
('Poseidon','Poseidon','01/04/1840',52,'No poder hablar con los animales','DC',null,null),
('Barry Allen','Flash','01/05/1997',22,'Otro igual de rapido que el','DC',null,null)
go
--E) INSERTA UN ALIANZA QUE DIGA SIN ALIANZA
insert into alianza values ('Sin alianza');
--F) CREA UN RESPALDO DIFERENCIAL
BACKUP DATABASE SUPERHEROES
TO DISK = 'c:/bd/unidad 4/Respaldos/RespDifHeroes2.bak'
WITH
DIFFERENTIAL,
DESCRIPTION = 'Insertamos datos en poder,heroes y lugaresDefensa',
STATS = 5,
COMPRESSION
go
--G) INSERTA ALIANZAS
insert into alianza values ('Liga de la justicia'),('Vengadores'),('Chicas superpoderosas'),('Padrinos magicos'),('Inmortales'),
('Mapache y amigos')
go
--H) INSERTA VILLANOS AL MNEOS 10
insert into villano values
('Zoom','Zoom','01/01/1982',45,'Criptonita','DC',null),
('Loki','Loki','01/01/1972',45,'Quitar baston','Marvel',null),
('Mojojo','Mojojojo','01/09/1998',25,'Perder a su pandilla','Cartoon',null),
('Anti Cosmo','Anti Cosmo','01/01/2001',29,'Su arrogancia','Nikelodeon',null),
('Ned Flanders','Flanders','01/01/1989',42,'El pecado','Amarillo',null),
('Arthur Fleck','Joker','01/01/1989',50,'Es mortal','DC',null),
('Victor Machuca','Cibernetico','18/03/1988',32,'La sociedad','MayamiClan',null),
('Aqui nose','Toallin','01/08/2006',14,'Los porros','Park',null),
('Calamar','Kutulu','01/04/1840',60,'Las lanzas','DC',null),
('Eobard Thawne','Flash reverso','01/05/1997',22,'Que corran mas rapido','DC',null)
go
--I) CREA UN RESPALDO COMPLETO
BACKUP DATABASE SUPERHEROES
TO DISK = 'c:/bd/unidad 4/Respaldos/RespCompHeroes3.bak'
with
COMPRESSION
go
--J) INSERTA OTROS 5 SUPER HEROES
insert into heroes values
('Tony Stark','Iron Man','01/05/1997',45,'Es mortal sin su traje','Marvel',null,null),
('Bruce Baner','Hulk','01/05/1997',48,'El miedo','Marvel',null,null),
('Peter Parker','Spiderman','01/05/2002',18,'Necesita edificios','Marvel',null,null),
('Carol Danvers','Capitana Marvel','01/05/1960',32,'Sus recuerdos del pasado','Marvel',null,null),
('ClintBarton','Flash','01/05/1997',38,'Nomas lleva como 7 flechas el vato','Marvel',null,null)
go
--K) INSERTA EL DETALLE DE ENEMIGOS Y DE PODERES
insert into detPoderVillano values
(1,1),(1,2),(1,3),
(2,1),
(3,1),
(4,3),
(7,3),
(8,1),
(9,1),(9,2),
(10,3)
go
--L) REALIZA UN RESPALDO DIFERENCIAL
BACKUP DATABASE SUPERHEROES
TO DISK = 'c:/bd/unidad 4/Respaldos/RespDifHeroes4.bak'
WITH
DIFFERENTIAL,
DESCRIPTION = 'Insertamos mas heroes y el detalle de podervillano',
STATS = 5,
COMPRESSION
go
--M) BORRA LAS TABLAS DE DETALLES
Drop table detPoderHeroe;
drop Table detPoderVillano;
drop table detEnemigoHeroe;
--N) REALIZA UN RESPALDO DIFERENCIAL.
BACKUP DATABASE SUPERHEROES
TO DISK = 'c:/bd/unidad 4/Respaldos/RespDifHeroes5.bak'
WITH
DIFFERENTIAL,
DESCRIPTION = 'Borramos las tablas de detalles',
STATS = 5,
COMPRESSION
go