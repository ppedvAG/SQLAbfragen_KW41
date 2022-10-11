--TOP Keyword - gibt die obersten X Zeilen aus

SELECT TOP 1 * FROM Customers


--TOP X Percent = obersten X Prozent
SELECT TOP 10 PERCENT  * FROM Orders
ORDER BY Freight DESC

--TOP X with ties = bei "Gleichstand" werden gleiche Werte zusätzlich angezeigt
SELECT TOP 10 with ties Freight FROM Orders
ORDER BY Freight DESC

--Die "untersten" X Ergebnisse --> Tabelle mit ORDER BY umdrehen
SELECT TOP 10 PERCENT  * FROM Orders
ORDER BY Freight 



--UNION -- "eingebautes" DISTINCT
--UNION ALL ohne DISTINCT
SELECT CustomerID as KundenID FROM Customers
UNION 
SELECT CustomerID FROM Customers

SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers
ORDER BY CustomerID

SELECT * FROM Orders
UNION 
SELECT * FROM Customers