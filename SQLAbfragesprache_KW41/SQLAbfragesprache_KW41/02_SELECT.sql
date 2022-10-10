SELECT CompanyName, City, Country FROM Customers
-- bestimmte Spalten aufrufen mit "Spaltenname" und mit ',' trennen

SELECT City, CustomerID, Country, Address FROM Customers
-- Reihenfolge der Spalten beliebig wählbar

SELECT * FROM [Order Details]
-- hinterlegte Keywords in [] angeben --> alles in [] wird als Datenbankobjekt interpretiert

SELECT 100

SELECT 5+10

SELECT ((3*7)+11)/2, 3*5, 100 -- mathematische Operationen möglich

SELECT 'Hallo' -- Strings in '' angeben

SELECT 'Hallo' as Begrüßung -- Spalten umbennen mit "alias" bzw. as 'neuer Spaltenname'

SELECT CompanyName as Firmenname FROM Customers 

SELECT CompanyName as Firmenname, City as Stadt, Country as Land FROM Customers 

-- SELECT DISTINCT zeigt jedes Ergebnis nur einmal an
SELECT DISTINCT Country FROM Customers

SELECT DISTINCT Country, CompanyName FROM Customers

--Sortieren von Ergebnissen mit ORDER BY - steht IMMER am Ende der ABfrage
SELECT DISTINCT Country FROM Customers
ORDER BY Country DESC --desc = descending = absteigend

SELECT * FROM Customers
ORDER BY City, CompanyName DESC, Country


--NULL = Kein Wert eingetragen / das Fehlen eines Werts 
--Nicht verwechsel mit " " (Leerzeichen) oder 0


