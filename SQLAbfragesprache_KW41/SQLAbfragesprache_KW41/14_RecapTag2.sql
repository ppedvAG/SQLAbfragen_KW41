--Aufgaben:
--1. Die durchschnittlichen Lieferkosten (Freight) jedes Speditionsunternehmens (Shipper)
--ShipperID(FS) = ShipVia(PS)
--Bonus: Sowohl über gesamte Firmenlaufzeit, als auch pro Geschäftsjahr (Union?)

SELECT s.CompanyName, AVG(Freight) as AvgFreight FROM Orders as o
JOIN Shippers as s ON o.ShipVia = s.ShipperID
GROUP BY s.CompanyName

--2. Wieviel Rabatt (Discount) (in Zahlen, nicht Prozent) haben wir insgesamt pro Produkt 
--gewährt über die bisherige Firmenlaufzeit?

SELECT ProductID, year(Orderdate) as Geschäftsjahr, 
CAST(SUM(quantity*unitprice*Discount) as decimal(10,2)) as Rabatt 
FROM [Order Details] as od
JOIN Orders as o ON od.OrderID = o.OrderID
GROUP BY ProductID, year(Orderdate)
ORDER BY ProductID 

--3. Geben Sie die SupplierID, den CompanyName, die Kontaktinformation und das Land 
--aller Supplier aus, die aus dem gleichen Land sind wie der Supplier Nr. 2.

SELECT SupplierID, CompanyName, ContactName, Country FROM Suppliers
WHERE Country = (SELECT Country FROM Suppliers WHERE SupplierID = 2)




SELECT od.ProductID, od.UnitPrice, od. Quantity, od.Discount, 
((od.Quantity*od.UnitPrice)*od.Discount) as RabattbetragProBestellung, 
year(o.OrderDate) as Bestelljahr
FROM [Order Details] as od
JOIN Orders o on o.OrderID = od.OrderID
GROUP BY ProductID
ORDER BY Bestelljahr


SELECT
Shippers.CompanyName,
CAST(AVG(Freight) AS DECIMAL(10,2)) AS FreightAverage,
NULL AS [Year]
FROM Shippers
INNER JOIN Orders ON Orders.ShipVia = Shippers.ShipperID
GROUP BY Orders.ShipVia, Shippers.CompanyName
UNION
SELECT
Shippers.CompanyName,
CAST(AVG(Freight) AS DECIMAL(10,2)) AS FreightAverage,
year(OrderDate) as 'Year'
FROM Shippers
INNER JOIN Orders ON Orders.ShipVia = Shippers.ShipperID
GROUP BY Orders.ShipVia, Shippers.CompanyName, year(OrderDate)
ORDER BY CompanyName, Year