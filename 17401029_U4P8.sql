/*
	Erick Octavio Nolasco Machuca
	Practica: 8
	Fecha: 10 de mayo de 2020
	NoControl:17401029
*/

use master;
ALTER DATABASE pubs SET RECOVERY FULL ;  

BACKUP LOG pubs
TO DISK ='C:\BD\unidad 4\Respaldos\RESPLOG.TRN'
WITH STATS= 10