/*ç
	Erick Octavio Nolasco Machuca
	NoControl: 17401029
	Fecha: 19 de mayo de 2020
	Practica: 24
*/

/*CREA UNA BD LLAMADA MIGRACION, PREPARA LOS ARCHIVOS
DE LISTA DE GRUPOS PARA MIGRARLOS EN UNA TABLA DE ALUMNOS. QUE
TENGA NO. CONTROL, NOMBRE COMPLETO, EDAD, CARRERA, FECHA DE
NACIMIENTO. UTLIZA LAS LISTAS QUE SE TE PASARON EN LA UNIDAD
ANTERIOR.*/

Create database Migracion
on
(
	name = 'Migracion.MDF',
	filename = 'C:\BD\unidad 4\Bases\Mirgacion.MDF'
)
log on
(
	name = 'Migracion.LDF',
	filename = 'C:\BD\unidad 4\Bases\Mirgacion.LDF'
)
go
use Migracion;

Create table Alumnos 
(
	NoControl varchar (8) primary key,
	Nombre varchar(80),
	Carrera varchar(5),
	Edad smallint,
	semestre smallint,
	Nacimiento date
)
go
BULK INSERT Alumnos
   FROM 'C:\BD\unidad 4\AlumnosBulk.txt'
   WITH
      (  
         FIELDTERMINATOR ='.'
         , ROWTERMINATOR ='\n'
      );
drop table carreras	  
Create table Carreras
(
	Carrera varchar(5) Primary key,
	Nombre varchar(60),
	Creditos int
)
go
BULK INSERT Carreras
   FROM 'C:\BD\unidad 4\CarrerasBulk.txt'
   WITH
      (  
         FIELDTERMINATOR ='.'
         , ROWTERMINATOR ='\n'
      );
