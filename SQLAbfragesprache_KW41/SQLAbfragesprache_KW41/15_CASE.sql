--CASE Keyword = "Fallunterscheidungen"
--CASE prüft eine WHEN-Bedingung nach der anderen, bis eine "True/wahr" ist
SELECT ProductID,
CASE
	WHEN UnitsinStock >= 10 THEN 'Passt'
	WHEN UnitsinStock < 10 AND UnitsinStock >= 5 THEN 'Nachbestellen'
	WHEN UnitsinStock < 5 THEN 'Notfall!'
	ELSE 'Fehler'
END as Lagerbestand
FROM Products
ORDER BY Lagerbestand

--Aufgabe: ABC Analyse durchführen für den Umsatz aller Produkte
--Kategorie A = > 50.000, B zwischen 50.000 & 10.000, C < 10.000 (Umsatz = quantity*unitprice)


SELECT
ProductName
, SUM(det.UnitPrice*det.Quantity) AS Umsatz
, CASE
    WHEN SUM(det.UnitPrice*det.Quantity) > 50000 THEN 'A'
    WHEN SUM(det.UnitPrice*det.Quantity)  <= 50000 AND SUM(det.UnitPrice*det.Quantity) >= 10000 THEN 'B'
    WHEN SUM(det.UnitPrice*det.Quantity)  < 10000 THEN 'C'
    ELSE 'Logikfehler'
    END AS Kategorie
FROM [Order Details] det
JOIN Products p ON p.ProductID = det.ProductID
GROUP BY ProductName
ORDER BY Umsatz DESC


--Aufteilung unserer Employees in Altersgruppen; (Birthdate/Orderdate)
--Welche Gruppe hat wieviel Umsatz mit dem Verkauf von Alkoholika gemacht?
--Alkoholika = Category 1 ohne ProductID (1, 24, 43)
--Ü60, 51-60, 41-50, 30-40, U30
--Ergebnis: 1. 30-40; 2. 41-50; 3. 51-60; 4. Ü60;	U30 hat keine Werte

SELECT 
SUM(od.UnitPrice*od.Quantity) as Umsatz,
CASE
	WHEN datediff(year, BirthDate, OrderDate) > 60 THEN 'Ü60'
	WHEN datediff(year, BirthDate, OrderDate) BETWEEN 51 AND 60 THEN '51-60'
	WHEN datediff(year, BirthDate, OrderDate) BETWEEN 41 AND 50 THEN '41-50'
	WHEN datediff(year, BirthDate, OrderDate) BETWEEN 30 AND 40 THEN '30-40'
	ELSE 'U30'
END as Altersgruppen
FROM [Order Details] od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
JOIN Employees e ON e.EmployeeID = o.EmployeeID
WHERE CategoryID = 1 AND p.ProductID NOT IN (1, 24, 43)
GROUP BY
CASE
	WHEN datediff(year, BirthDate, OrderDate) > 60 THEN 'Ü60'
	WHEN datediff(year, BirthDate, OrderDate) BETWEEN 51 AND 60 THEN '51-60'
	WHEN datediff(year, BirthDate, OrderDate) BETWEEN 41 AND 50 THEN '41-50'
	WHEN datediff(year, BirthDate, OrderDate) BETWEEN 30 AND 40 THEN '30-40'
	ELSE 'U30'
END
ORDER BY Umsatz DESC

1. Welche Infos brauche ich? Welche Tabellen?
-> Join Syntax schreiben
2. Welche Spalten möchte ich ausgeben? Welche Berechnungen muss ich hierfür durchführen?
3. Was muss ich Gruppieren?
4. Welche Werte muss ich rausfiltern?
5. Altersgruppen definieren


SELECT Employees.EmployeeID, (year(Orders.OrderDate) - year(BirthDate)) AS AlterE,
CASE
    WHEN (year(Orders.OrderDate) - year(BirthDate)) > 60 THEN 'Ü60'
    WHEN (year(Orders.OrderDate) - year(BirthDate)) >= 51 AND <= 60 THEN '51-60'
    WHEN (year(Orders.OrderDate) - year(BirthDate)) >= 41 AND <= 50 THEN '41-50'
    WHEN (year(Orders.OrderDate) - year(BirthDate)) >= 30 AND <= 40 THEN '30-40'
    WHEN (year(Orders.OrderDate) - year(BirthDate)) <= 30 THEN 'U30'
    ELSE 'FEHLER!!!!!!!!!!'
END AS Altersgruppe
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
ORDER BY EmployeeI

SELECT Products.ProductID, 
SUM((Quantity*[Order Details].UnitPrice)-(Quantity*[Order Details].UnitPrice*Discount)) AS Gesamtumsatz,
CASE
    WHEN  (SUM((Quantity*[Order Details].UnitPrice)-(Quantity*[Order Details].UnitPrice*Discount))) >= 50000 THEN 'A'
	WHEN (SUM((Quantity*[Order Details].UnitPrice)-(Quantity*[Order Details].UnitPrice*Discount))) >= 50000 THEN 'A'
	WHEN (SUM((Quantity*[Order Details].UnitPrice)-(Quantity*[Order Details].UnitPrice*Discount))) >= 50000 THEN 'A'
    ELSE 'blaaaa'
END AS Kategorie
FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
GROUP BY Products.ProductID
ORDER BY Gesamtumsatz DESC


SELECT
   Altersgruppe
, CAST(SUM(Umsatz) AS decimal(10,2)) AS Gruppenumsatz
FROM 
(
    SELECT
    det.OrderID
    , ord.OrderDate
    , emp.BirthDate
--    , det.Quantity * det.UnitPrice * (1 - det.Discount) as Umsatz
    , det.Quantity * det.UnitPrice as Umsatz
    , DATEDIFF(year, emp.BirthDate, ord.OrderDate) as [Alter]
    , CASE
        WHEN DATEDIFF(year, emp.BirthDate, ord.OrderDate) > 60 THEN 'Ü60'
        WHEN DATEDIFF(year, emp.BirthDate, ord.OrderDate) <= 60 AND  DATEDIFF(year, emp.BirthDate, ord.OrderDate) > 50 THEN '51-60'
        WHEN DATEDIFF(year, emp.BirthDate, ord.OrderDate) <= 50 AND  DATEDIFF(year, emp.BirthDate, ord.OrderDate) > 40 THEN '41-50'
        WHEN DATEDIFF(year, emp.BirthDate, ord.OrderDate) <= 40 AND  DATEDIFF(year, emp.BirthDate, ord.OrderDate) >= 30 THEN '30-40'
        WHEN DATEDIFF(year, emp.BirthDate, ord.OrderDate) < 30 THEN 'U30'
        ELSE 'Fehler!'
        END AS Altersgruppe
    FROM [Order Details] det
    INNER JOIN Orders ord ON ord.OrderID = det.OrderID
    INNER JOIN Employees emp ON emp.EmployeeID = ord.EmployeeID
    INNER JOIN Products prod ON prod.ProductID = det.ProductID
    WHERE prod.CategoryID = 1 AND (prod.ProductID != 1 OR prod.ProductID != 24 OR prod.ProductID != 43)
) as temptable

GROUP BY Altersgruppe

