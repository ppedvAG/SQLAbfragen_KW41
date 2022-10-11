--Stored Procedures / gespeicherte Prozeduren = "gespeicherte Abfrage"

--Procedure anlegen:
CREATE PROC spLand @Land varchar(20)
AS
SELECT * FROM Customers
WHERE Country = @Land

--Procedure ausführen:
EXEC spLand Spain

--Procedure ändern:
ALTER PROC spLand
AS
SELECT

--Procedure löschen:
DROP PROC spLand


--Default Wert definieren:
ALTER PROC spLand @Land varchar(20) = 'Germany', @Var2 Datentyp, @Var3 Datentyp usw...
AS
SELECT * FROM Customers
WHERE Country IN (@Land, @var2, @var3, @var4, @var5)

EXEC spLand France

--SPs funktionieren auch mit bspw INSERT, UPDATE usw.


--Aufgabe: Procedure erstellen, die mir den Gesamtumsatz eines Produkts (=ProductID)
--ausgibt + wenn gewünscht nur für EIN bestimmtes Geschäftsjahr

CREATE PROC spProduktUmsatz @ProductID int, @Jahr int = NULL
AS
SELECT ProductID, SUM(od.quantity*od.Unitprice) as GesamtSumme
FROM [Order Details] as od
JOIN Orders o ON od.OrderID = o.OrderID
WHERE ProductID = @ProductID AND 
year(o.OrderDate) IN (ISNULL(@Jahr, 
(SELECT DISTINCT year(o.OrderDate) FROM Orders)))
GROUP BY ProductID
--Lösung by Claudius - sehr elegant
EXEC spProduktUmsatz 1, 1997

















CREATE PROC spUmsatzProduktJahr
    @Produkt int,
	@Jahr int = NULL
AS
SELECT
  ProductID
, SUM( (det.UnitPrice*det.Quantity) - (det.UnitPrice*det.Quantity*det.Discount)) as Umsatz
FROM
[Order Details] AS det
INNER JOIN Orders AS ord ON det.OrderID = ord.OrderID
WHERE ProductID = @Produkt AND
year(ord.OrderDate) IN (ISNULL(@Jahr, 
(SELECT DISTINCT year(ord.OrderDate) FROM Orders)))
GROUP BY ProductID

EXEC spUmsatzProduktJahr 1

SELECT SUM( (det.UnitPrice*det.Quantity) - (det.UnitPrice*det.Quantity*det.Discount)) 
FROM [Order Details] AS det
INNER JOIN Orders AS ord ON det.OrderID = ord.OrderID
WHERE ProductID = 1 --AND YEAR(ord.OrderDate) = 1997


