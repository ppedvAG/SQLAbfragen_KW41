--Aufgabe: Alle Bestellungen deren Freight größer als die AVG Freight sind ausgeben

SELECT OrderID FROM Orders
WHERE Freight > AVG(Freight)

SELECT OrderID, AVG(Freight) FROM Orders
GROUP BY OrderID, Freight
HAVING Freight > AVG(Freight)

--Problem: Aggregat Funktionen nicht möglich im WHERE


--Lösung: Subquerie:

SELECT OrderID FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)

--Unterabfragen/Subqueries/nested Queries müssen selbstständig ausführbar sein
--Funktionieren im WHERE, im FROM, im SELECT

SELECT OrderID 
FROM
(
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
) Ersatzname 

--"Im FROM" muss der Subquerie ein Alias vergeben werden, keine Tabelle ohne Namen!


--In Kombination mit "IN" kann eine Subquerie im WHERE auch mehrere Werte ausgeben:
SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Employees)




