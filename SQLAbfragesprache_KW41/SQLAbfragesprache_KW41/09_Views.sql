--"Master-Table", CompanyName, Bestellung, Freight, Welches Produkt, 
-- Summe der Bestellposition, welcher Employee hats verkauft usw.

--Erstellen von Views mit CREATE VIEW "Viewname" as + Abfrage
CREATE VIEW MasterView as
SELECT 
o.OrderID, o.Orderdate, 
c.CompanyName, c.CustomerID,
od.Quantity, od.Unitprice,
p.ProductName,
e.FirstName + ' ' + e.Lastname as Bearbeiter,
o.Freight,
od.Quantity*od.UnitPrice as SummePosition, od.Discount,
((od.Quantity*od.UnitPrice) - (od.Quantity*od.UnitPrice*Discount)) as SummeRabattiert
FROM Customers as c
JOIN Orders as o ON c.CustomerID = o.CustomerID
JOIN [Order Details] as od ON od.OrderID = o.Orderid
JOIN Products as p ON p.ProductID = od.ProductID
JOIN Employees as e ON e.EmployeeID = o.EmployeeID

--�ndern von Views mit ALTER VIEW "Viewname" as + Abfrage
ALTER VIEW MasterView as
SELECT 
o.OrderID, o.Orderdate, 
c.CompanyName, c.CustomerID,
od.Quantity, od.Unitprice,
p.ProductName,
e.FirstName + ' ' + e.Lastname as Bearbeiter,
o.Freight,
od.Quantity*od.UnitPrice as SummePosition, od.Discount,
((od.Quantity*od.UnitPrice) - (od.Quantity*od.UnitPrice*Discount)) as SummeRabattiert
FROM Customers as c
JOIN Orders as o ON c.CustomerID = o.CustomerID
JOIN [Order Details] as od ON od.OrderID = o.Orderid
JOIN Products as p ON p.ProductID = od.ProductID
JOIN Employees as e ON e.EmployeeID = o.EmployeeID

--L�schen von Views mit DROP VIEW "Viewname"
DROP VIEW MasterView 


--Views k�nnen wie Tables aufgerufen und referiert werden
--Hinter jeder View "steckt eine Abfrage", die jedesmal ausgef�hrt wird

SELECT * FROM MasterView