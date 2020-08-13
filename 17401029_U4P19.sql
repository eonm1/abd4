/*
	Erick Octavio Nolasco Machuca
	Practica: 19
	NoControl: 17401029
	Fecha: 20 de mayo de 2020

*/

/*A) UNA PERSONA QUE REALIZA PRÉSTAMOS DE DINERO CON UN
INTERÉS DE ACUERDO AL PLAZO ELEGIDO, DESEA QUE LE
DISEÑES UNA BD PARA LLEVAR EL CONTROL DE LOS
PRÉSTAMOS QUE REALIZO, A QUIEN SE LOS DIO Y LOS
ABONOS QUE LE REALIZAN. DE ACUERDO AL SIGUIENTE
MODELO:*/

Create database Prestamo
on
(
	Name='Prestamo.MDF',
	Filename='C:\BD\unidad 4\Bases\Prestamo.MDF'
)
log on
(
	Name='Prestamo.LDF',
	Filename='C:\BD\unidad 4\Bases\Prestamo.LDF'
)
go
use Prestamo;

Create table Deudor (
	DeuID int primary key identity(1,1),
	DeuNombre varchar(100),
	DeuDomicilio varchar(100),
	DeuTelefono varchar(15),
	DeuLimcre money
)
go

Create table Prestamos
(
	PreId int primary key identity(1,1),
	DeuId int references Deudor(DeuID),
	PreFechaImporte datetime,
	PreImporte money,
	PreNoAbono smallint,
	PreAbonoX money,
	PreSaldo money,
	PreInteres smallint,
	PreFechaLi datetime,
	PreSexo char(1)
)
go


Create table Abono (
	PreId int not null references Prestamos(PreId),
	AboId int,
	AboFecha datetime,
	AboImporte MONEY,
	AboFormato char(1)
)
go

/*B) MIGRAR LOS DEUDORES POR MEDIO DE UN COMANDO BULK
INSERT DEL ARCHIVO (DEUDORES.TXT)*/
BULK INSERT Deudor
   FROM 'c:\BD\unidad 4\DEUDORES.txt'
   WITH
      (  
         FIELDTERMINATOR =','
         , ROWTERMINATOR ='\n'
      );
/*C) REALIZA UN RESPALDO COMPLETO DE LA BD CON AL MENOS 3
PARAMETROS.*/
backup database Prestamo
to disk = 'C:\BD\unidad 4\Respaldos\ResPrestamo1.BAK'
with
name = 'ResPrestamo1.BAK',
Description = 'Base de datos original sin datos',
Compression
go

/*D) MIGRA LOS PRESTAMOS CON EL COMANDO BCP DEL ARCHIVO
(PRESTAMOS.TXT)*/
--bcp PRESTAMO.dbo.PRESTAMOS in "C:\BD\unidad 4\Prestamo.txt" -T -c -t"," -r"\n"

/*E) REALIZA UN RESPALDO DIFERENCIAL CON AL MENOS 3
PARAMETROS.*/
backup database Prestamo
to disk = 'C:\BD\unidad 4\Respaldos\ResPrestamo2.BAK'
with
name = 'ResPrestamo2.BAK',
Description = 'Respaldo diferencial',
Compression
go

/*F) MIGRA LOS ABONOS POR MEDIO DE LA HERRAMIENTA
GRAFICA DEL ARCHIVO (ABONO.XLS)*/
--pos ya

/*G) REALIZA UN RESPALDO DIFERENCIAL*/
backup database Prestamo
to disk = 'C:\BD\unidad 4\Respaldos\ResPrestamo3.BAK'
with
name = 'ResPrestamo3.BAK',
Description = 'Respaldo diferencial',
Compression
go

/*H) INSERTA UN ABONO DE TODOS LOS PRESTAMOS QUE NO
ESTAN LIQUIDADOS DE 100 PESOS CON LA FECHA DE HOY POR
QUE ES UN REGALO POR EL DIA DE LA MUJER QUE LE VA DAR EL
DUEÑO DE LA EMPRESA.*/
insert into Abono (aboImporte,aboFecha) values (100,'20/05/2020')
/*I) REALIZA UN RESPALDO DIFERRENCIAL*/
backup database Prestamo
to disk = 'C:\BD\unidad 4\Respaldos\ResPrestamo4.BAK'
with
name = 'ResPrestamo4.BAK',
Description = 'Respaldo diferencial',
Compression
go

/*J) OOOH OOOOH!!! HUBO UN ERROR GARRAFATAL DEBERIAS DE
HABER HECHO LOS ABONOS A LOS PRESTAMOS QUE PERTENCEN
A MUJERES. ARREGLA LAS COSAS Y SOLO DALE EL BENEFICIO A
QUIEN LE CORRESPONDE.*/
