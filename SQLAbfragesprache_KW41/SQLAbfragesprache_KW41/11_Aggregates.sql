--Aggregatfunktionen

--SUM
SELECT SUM(Freight) as Summe FROM Orders

--AVG
SELECT AVG(freight) as Durchschnitt FROM Orders

--MAX/MIN
SELECT MAX(Freight) FROM Orders
SELECT MIN(Freight) FROM Orders

--COUNT
SELECT COUNT(Region) FROM Customers

SELECT Region FROM Customers
WHERE Region IS NOT NULL

SELECT AVG(Freight), CustomerID FROM Orders


--GROUP BY - Nach der WHERE Klausel

SELECT CustomerID, AVG(Freight) as DurchschnittLieferkosten FROM Orders
GROUP BY CustomerID
ORDER BY DurchschnittLieferkosten DESC

--Aufgabe: Wieviele Kunden pro Land? (Customers Table; Country)

SELECT Country, COUNT(Country) as Anzahl FROM Customers
GROUP BY Country
ORDER BY Anzahl DESC

--Aufgabe: Rechnungssumme von jeder Bestellung (830 Ergebnisse)

SELECT * FROM MasterView

SELECT OrderID, CAST(SUM(SummeRabattiert) as decimal(10,2))AS Kosten_Pro_Bestellung 
FROM MasterView
GROUP BY OrderID
ORDER BY Kosten_Pro_Bestellung DESC


--HAVING Keyword = Filterklausel für Gruppen
--Funktioniert genauso wie WHERE, aber eben auch mit Aggregaten

SELECT OrderID, CAST(SUM(SummeRabattiert) as decimal(10,2))AS Kosten_Pro_Bestellung 
FROM MasterView
GROUP BY OrderID
HAVING CAST(SUM(SummeRabattiert) as decimal(10,2)) > 10000
ORDER BY Kosten_Pro_Bestellung DESC

--Merke: "HAVING" NUR dann verwenden, wenn mit WHERE nicht möglich!


--Aufgabe: Alle Bestellungen mit Rechnungssumme von kunden aus Deutschland 
-- + nur die mit Summe > 1000
SELECT OrderID, Country, CAST(SUM(SummeRabattiert) as decimal(10,2))AS Kosten_Pro_Bestellung 
FROM MasterView
JOIN Customers c ON c.CustomerID = Masterview.CustomerID
WHERE Country = 'Germany'
GROUP BY OrderID, Country
HAVING CAST(SUM(SummeRabattiert) as decimal(10,2)) > 1000 

