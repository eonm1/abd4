/*
	Erick Octavio Nolasco Machuca
	Practica:25
	Fecha:20/mayo/2020
	NoControl:17401029

*/



/*EXPORTA LA LISTA DE EMPLEADOS A UN ARCHIVO DE TEXTO.
		Ya

EXPORTA A UN ARCHIVO DE TEXTO SEPARADO POR COMAS, LOS EMPLEADOS
DE LA BD NORTHWIND CON CADA ORDEN QUE VENDIO, LA FECHA DE VENTA Y
NOMBRE DEL CLIENTE QUE SE LA COMPRO.
*/
select (E.FirstName + E.LastName) as 'Nombre',O.OrderID, O.OrderDate,C.ContactName from TESTER_NORTWIND.dbo.Employees E inner join TESTER_NORTWIND.dbo.Orders O on (E.EmployeeID= O.EmployeeID)inner join TESTER_NORTWIND.dbo.Customers C on (C.CustomerID = O.CustomerID)


/*

EXPORTA A UN ARCHIVO DE TEXTO EL TOTAL QUE COBRABOS POR CADA
ORDEN DE VENTA. RECUERDA QUE DEBES CALCULARLO CON DESCUENTO Y
TODO.*/
select O.OrderID,  sum((UnitPrice-Discount)*Quantity) as 'Total cobrado' from TESTER_NORTWIND.dbo.[Order Details] OD inner join TESTER_NORTWIND.dbo.Orders O on(O.OrderID=OD.OrderID)Group by O.OrderID