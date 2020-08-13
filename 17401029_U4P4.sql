/*
	Erick Octavio Nolasco Machuca
	Fecha: 3 de mayo del 2020
	Practica: 4

*/

/*1.CREA UNA BASE DE DATOS LLAMADA ALUMNOSABD
CON LAS TABLAS CARRERAS, ALUMNOS, HORARIO ACTUAL,
MATERIAS(CON PK Y FK)*/

Create Database ALUMNOSABD
on primary
(
	Name='ALUMNOSABD.MDF',
	Filename='C:\BD\unidad 4\Bases\ALUMNOSABD.MDF'
)
log on
(
	Name='ALUMNOSABD.LDF',
	Filename='C:\BD\unidad 4\Bases\ALUMNOSABD.LDF'
)
go
use AlumnosABD
GO

Create table ALUMNOS
(
	NoControl varchar(8) primary key,
	NombreCompleto varchar(100),
	IDcarrera varchar(5),
	Edad smallint,
	Semestre smallint
)
go
Create table Carreras
(
	IDcarrera varchar(5) primary key,
	Nombre varchar(80),
	Creditos smallint,
)
go
Create table Horario_Actual
(
	idHorario int primary key,
	Nombre varchar(30),

)
go

Create table Materia
(
	idMateria int primary key,
	Nombre varchar(40),
	IDCarrera varchar(5),
	Semestre smallint,
	Creditos smallint
)
/*
2.INSERTA LAS CARRERAS QUE EXISTEN EN EL TEC, DEBE
TENER LAS SIGLAS COMO PK Y ELNOMBRE COMPLETO
*/
Insert into Carreras values ('A','Arquitectura',240),
							('IBQ','Ingenieria Bioquimica',242),
							('IC','Ingenieria Civil',241),
							('IE','Ingenieria Electrica',240),
							('IGE','Ingenieria en Gestion Empresarial',238),
							('II','Ingenieria Industrial',238),
							('IM','Ingenieria en Mecatronica',241),
							('IQ','Ingenieria Quimica',241),
							('ISC','Ingenieria en Sistemas Computacionales',242),
							('ITICS','Ingenieria en Tecnologias de la Informacion',240),
							('LA','Licenciatura en Administracion',238)
							go
/*3.INSERT A LOS ALUMNOS DE LAS LISTAS (CON BULK INSERT)
QUE TE SUBIR A EL DRIVE (PREPARA LOS ARCHIVOS
ADECUADAMENTE COMO LO HICIMOS EL SEMESTRE
PASADO) PERO PON LES CARRERAS DIFERENTES, NO TODOS
SERAN DE SISTEMAS. (LO TIENES EN LA PRACTICA 20 DE LA
UNIDAD PASADA)*/
bulk insert ALUMNOS
FROM 'C:\BD\AlumnosBULK.txt'
WITH(
FIELDTERMINATOR=',',
ROWTERMINATOR='\n'
)
go
/*Llaves foraneas*/
ALTER TABLE ALUMNOS ADD FOREIGN KEY (IDcarrera) REFERENCES Carreras(IDcarrera)
go
ALTER TABLE Materia ADD FOREIGN KEY (IDcarrera) REFERENCES Carreras(IDcarrera)
go

/*
4. CREALE UN RESPALDO COMLETO COMPRIMIDO, CON
NOMBRE, DESCRIPCION Y UN AVANCE DEL 5%
*/
BACKUP DATABASE ALUMNOSABD
TO DISK = 'C:\BD\unidad 4\Respaldos\RESALUMNOSABD1.BAK'
WITH NOINIT,
NAME = 'MI RESPALDO DE ALUMNOSABD 1',
DESCRIPTION = 'RESPALDO COMPLETO 03-05-2020, Relacionadas con carreras y alumnos insertados',
STATS = 5,
COMPRESSION;
