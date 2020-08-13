/*
	Erick Octavio Nolasco Machuca
	Practica:28
	NoControl:17401029
	Fecha: 20/05/2020

*/

CREATE DATABASE RepublicaMex
ON PRIMARY(
	NAME = 'RepublicaMex.MDF',
	FILENAME = 'C:\BD\unidad 4\Bases\RepublicaMex.MDF'
)
LOG ON(
	NAME = 'RepublicaMex.LDF',
	FILENAME = 'C:\BD\unidad 4\Bases\RepublicaMex.LDF'
)
GO
use RepublicaMex
Create table Estados
(
  EstadosID int primary key,
  Nombre varchar(30)
)
go
Create table Municipios
(
	MunicipioID int primary key,
	Nombre varchar(30),
	Poblacion int
)
go
Create table Localidades
(
	LocalidadID int primary key,
	MunicipioID int references Municipios(MunicipioId),
	Nombre varchar(50),
	Poblacion int
)
go

/*1. CREA UN RESPLADO COMPLETO DE LA BD*/
backup database RepublicaMex
to disk = 'C:\BD\unidad 4\Respaldos\ResRepu1.BAK'
with
name = 'ResRepu1.BAK',
Description = 'Base de datos original sin datos respaldo completo',
Compression
go
/*2. GENERA UN ARCHIVO DE TEXTO EN DONDE CAPTURES O DESCARGUES
DE INTERNET LOS ESTADOS, PERO PREPARALO DE ACUERDO AL
ESQUEMA DE LA TABLA QUE CREASTE CON ESTADOS. IMPORTA LOS
REGISTROS CON BCP A LA BD*/

--bcp RepublicaMex.dbo.Estados in "C:\BD\unidad 4\Estados.txt" -c -t, -r\n -T

--3. CREA UN RESPALDO DIFERENCIAL
backup database RepublicaMex
to disk = 'C:\BD\unidad 4\Respaldos\ResRepu2.BAK'
with
differential,
name = 'ResRepu2.BAK',
Description = 'Respaldo diferencial que contiene los Estados',
Compression
go
/*4. BUSCA O DESCARGA LA LISTA DE MUNICIPIO DEL ESTADO DE NAYARIT,
GUARDALOS PREPARANDOLOS DE ACUERDO AL ESQUEMA DE LA TABLA
QUE CREASTE EN UN ARCHIVO DE EXCEL E IMPORTA LOS REGISTROS
CON EL WIZARD*/

--ya

/*5. CREA UN RESPALDO DIFERENCIAL*/
backup database RepublicaMex
to disk = 'C:\BD\unidad 4\Respaldos\ResRepu3.BAK'
with
differential,
name = 'ResRepu3.BAK',
Description = 'Respaldo diferencial que contiene los Municipios',
Compression
go

/*6. BUSCA O DESCARGA LA LISTA DE LOCALIDADES DEL ESTADO DE
NAYARIT, PREPARA UN ARCHIVO DE TEXTO E IMPORTALO CON EL
COMANDO SQL (BULK INSERT)*/
BULK INSERT Localidades
   FROM 'C:\BD\unidad 4\Localidades.txt'
   WITH
      (  
         FIELDTERMINATOR ='-t'
         , ROWTERMINATOR ='\n'
      );
/*7. CREA UN RESPALDO DIFERENCIAL*/
backup database RepublicaMex
to disk = 'C:\BD\unidad 4\Respaldos\ResRepu4.BAK'
with
differential,
name = 'ResRepu4.BAK',
Description = 'Respaldo diferencial que contiene los Municipios',
Compression
go

/*8. IMPORTA LA TABLA DE ALUMNOS QUE CREASTE EN LA BD MIGRACION
CON EL WIZARD*/
--ya

/*9. CREA UN RESPALDO DIFERENCIAL*/
backup database RepublicaMex
to disk = 'C:\BD\unidad 4\Respaldos\ResRepu5.BAK'
with
differential,
name = 'ResRepu5.BAK',
Description = 'Respaldo diferencial que contiene la tabla alumnos',
Compression
go

/*10.EXPORTA EN UN ARCHIVO DE EXCEL LAS LOCALIDADES DEL MUNICIPIO
DE TEPIC A UN ARCHIVO DE TEXTO SEPARADO LOS CAMPOS POR “|” CON
LOS SIGUIENTES DATOS:
NOMBRE DE LA LOCALIDAD, NOMBRE DEL MUNICIPIO A QUE PERTENECE
Y NOMBRE DEL ESTADO, ADICIONALE ALGUN OTRO DATO QUE TENGAS
EN LA TABLA LOCALIDADES.*/

--ya

/*11. A LA TABLA DE ALUMNOS AGREGALE UN CAMPO QUE HAGA DE FK PARA
INSERTARLE LA LOCALIDAD DEL CUAL ES PROCEDENTE EL ALUMNO*/
alter table Alumnos add LocalidadID int;
alter table Alumnos add Constraint FK_Alu_Loca foreign key (LocalidadID) references Localidades(LocalidadID)

/*12.ACTUALIZA LA TABLA ALUMNOS DE ACUERDO A CRITERIOS (TU
ESTABLECELOS) PARA QUE LOS ALUMNOS PERTENEZCAN A
DIFERENTES LOCALIDADES.*/
update Alumnos set LocalidadID=1 where Nombre like 'A%'
update Alumnos set LocalidadID=2 where Nombre like 'B%'
update Alumnos set LocalidadID=3 where Nombre like 'C%'
update Alumnos set LocalidadID=4 where Nombre like 'D%'

/*13.REALIZA UN RESPALDO DIFERENCIAL.*/
backup database RepublicaMex
to disk = 'C:\BD\unidad 4\Respaldos\ResRepu6.BAK'
with
differential,
name = 'ResRepu6.BAK',
Description = 'Respaldo diferencial que contiene la tabla alumnos con localidades modificadas',
Compression
go

/*14.EXPORTA LOS DATOS DE LOS ALUMNOS QUE PERTENEZCAN AL
SEMESTRE QUE TU PEREZTENZCAS EN UN ARCHIVO DE TEXTO CON EL
NOMBRE COMPLETO DEL ALUMNO, NO. DE CONTROL, NOMBRE DE LA
LOCALIDA DE QUE ES, MUNICIPIO Y ESTADO ORIGINARIO CON BCP.*/

-- Ya realizado

/*15.RECUPERA LA BASE DE DATOS ANTES DE MIGRARLE LAS LOCALIDADES
Y POR COMENTARIOS INDICA LO QUE PERDISTE.*/
/*No tengo ni las localidades ni la tabla de Alumnos ni cuando se lo cambie ni nada sobre Alumnos*/

/*16.RECUPERA LA BASE DE DATOS ANTES DE MIGRALE LA TABLA DE
ALUMNOS.*/
RESTORE DATABASE REPUBLICAMEX
FROM DISK = 'C:\BD\unidad 4\Respaldos\ResRepu1.BAK'
WITH 
   REPLACE,
   NORECOVERY,
   STATS = 10;

-- RESTAURANDO EL RESPALDO DIFERENCIAL 2
RESTORE DATABASE REPUBLICAMEX
FROM DISK = 'C:\BD\unidad 4\Respaldos\ResRepu5.BAK'
WITH 
   REPLACE,
   RECOVERY,
   STATS = 10;

/*17.RECUPERA LA BASE DE DATOS CON TODOS LOS DATOS QUE MIGRASTE
Y LAS ACTUALIZACIONES REALIZADAS.*/
RESTORE DATABASE REPUBLICAMEX
FROM DISK = 'C:\BD\unidad 4\Respaldos\ResRepu1.BAK'
WITH 
   REPLACE,
   NORECOVERY,
   STATS = 10;

-- RESTAURANDO EL RESPALDO DIFERENCIAL 2
RESTORE DATABASE REPUBLICAMEX
FROM DISK = 'C:\BD\unidad 4\Respaldos\ResRepu6.BAK'
WITH 
   REPLACE,
   RECOVERY,
   STATS = 10;

/*18.RECUPERA LOS ENCABEZADOS DE LOS RESPALDOS REALIZADOS*/
RESTORE HEADERONLY
FROM DISK= 'C:\BD\unidad 4\Respaldos\ResRepu1.BAK'
go
--
RESTORE HEADERONLY
FROM DISK= 'C:\BD\unidad 4\Respaldos\ResRepu2.BAK'
go
--
RESTORE HEADERONLY
FROM DISK= 'C:\BD\unidad 4\Respaldos\ResRepu3.BAK'
go
--
RESTORE HEADERONLY
FROM DISK= 'C:\BD\unidad 4\Respaldos\ResRepu4.BAK'
go
--
RESTORE HEADERONLY
FROM DISK= 'C:\BD\unidad 4\Respaldos\ResRepu5.BAK'
go
--
RESTORE HEADERONLY
FROM DISK= 'C:\BD\unidad 4\Respaldos\ResRepu6.BAK'
go

/*19.RECUPERA LA BD COMPLETA CON OTRO NOMBRE Y EN OTRA UBICACIÓN.*/
RESTORE DATABASE MexicanaRepublica
FROM DISK ='C:\BD\unidad 4\Respaldos\ResRepu1.BAK'
WITH MOVE 'RepublicaMex.MDF'
TO 'C:\BD\unidad 4\Respaldos\Disco3\RepublicaMex.MDF'
,
MOVE 'RepublicaMex.LDF'
TO 'C:\BD\unidad 4\Respaldos\Disco3\RepublicaMex.MDF'
,
replace,norecovery
go

RESTORE DATABASE MexicanaRepublica
FROM DISK ='C:\BD\unidad 4\Respaldos\ResRepu6.BAK'
WITH MOVE 'RepublicaMex.MDF'
TO 'C:\BD\unidad 4\Respaldos\Disco3\RepublicaMex.MDF'
,
MOVE 'RepublicaMex.LDF'
TO 'C:\BD\unidad 4\Respaldos\Disco3\RepublicaMex.MDF'
,
replace,recovery
go