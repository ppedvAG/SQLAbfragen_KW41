--LIKE Keyword = "ungenaue" Suche

SELECT * FROM Customers
WHERE CompanyName LIKE 'Schema'

--'%' = beliebiges Symbol, beliebig viele davon

SELECT * FROM Customers
WHERE CompanyName LIKE 'a%'

SELECT * FROM Customers
WHERE CompanyName LIKE '%a%'


--'_' = beliebiges Symbol, aber genau 1

SELECT * FROM Customers
WHERE CompanyName LIKE '_a%'

SELECT * FROM Orders
WHERE OrderID LIKE '_______6%'

--'[]' = alles in den eckigen Klammern ist zulässig

SELECT * FROM Customers
WHERE CompanyName LIKE '[abc]%'

SELECT * FROM Customers
WHERE PostalCode LIKE '[123][098]_[123]%'


--'[a-g]' = "Range" alphatisch oder numerisch
SELECT * FROM Customers
WHERE CompanyName LIKE '[a-g]%'

SELECT * FROM Customers
WHERE PostalCode LIKE '[1-5]%'

--'[^a-g]' = Nicht innerhalb der angegebenen Range

SELECT * FROM Customers
WHERE CompanyName LIKE '[^abc]%'

UPDATE Customers 
SET CompanyName = 'Alfreds % Futterkiste' WHERE CustomerID = 'ALFKI'

--%-Zeichen mit LIKE suchen:
SELECT * FROM Customers
WHERE CompanyName LIKE '%[%]%'

--'-Zeichen mit LIKE suchen:
SELECT * FROM Customers
WHERE CompanyName LIKE '___['']%'


LIKE 'M[eya][yi][ear]%'

