--WHERE = Filterklausel

SELECT * FROM Customers
WHERE Country = 'Germany'

SELECT * FROM Orders
WHERE Freight > 100

SELECT * FROM Orders
WHERE Freight <= 100

SELECT * FROM Customers
WHERE Country != 'Germany'

-- Where funktioniert mit =, >, <, >=, <=, != (ungleich)

SELECT * FROM Customers
WHERE Region IS NULL

SELECT * FROM Customers
WHERE Region IS NOT NULL

--mit IS NULL oder IS NOT NULL kann nach Null Werten gefilter werden

--Mehrere Filter können mit AND oder OR kombiniert werden
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

SELECT * FROM Customers
WHERE Country = 'Germany' OR City = 'Paris'

SELECT * FROM Customers
WHERE (Country = 'France' OR Country = 'Germany') AND City = 'Paris'

--Merke: AND ist "stärker bindent" als OR; im Zweifel Klammer setzen

SELECT * FROM Customers
WHERE Country = 'Germany' OR Country = 'France' OR Country = 'Spain'

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'Spain') 

--WHERE 'Spaltenname' IN ('Wert1', 'Wert2') = Kurzform für mehrere ORs
--Funktioniert auch mit WHERE 'Spaltenname' NOT IN ('Wert1', 'Wert2') 


SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 200

SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 200

--BETWEEN = Zwischen 2 Werten, Randwerte impliziert (>= AND <=)
