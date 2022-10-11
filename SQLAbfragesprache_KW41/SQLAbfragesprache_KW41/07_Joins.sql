--JOINS

SELECT * FROM Orders
WHERE OrderID = 10255

SELECT * FROM Customers
WHERE CustomerID = 'RICSU'


SELECT customers.customerid, OrderID, Companyname, freight FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE customers.CustomerID = 'RICSU' 


SELECT * FROM Customers
JOIN ORders ON Customers.City = Orders.ShipCity

DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- Aliase für Tabellennamen
SELECT * FROM Customers cus
JOIN Orders ord ON cus.CustomerID = ord.CustomerID
WHERE Cus.CustomerID = 'RICSU'

SELECT * FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID

--INNER JOIN
SELECT * FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON p.ProductID = od.ProductID


--OUTER JOIN
--LEFT/RIGHT JOIN 
SELECT * 
FROM Customers c RIGHT JOIN orders o  ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL

--FULL OUTER JOIN
SELECT * FROM Customers c
FULL OUTER JOIN	orders o ON c.CustomerID = o.CustomerID

--CROSS JOIN
SELECT * FROM Customers c
CROSS JOIN Orders o


--Aufgaben:
•	Geben Sie alle Kunden (Firmenname) aus Brasilien und deren Frachtkosten aus.
•	Wählen Sie weitere nützliche Spalten, z.B. Bestellnummer und Kundennummer aus.
--
•	Angenommen, es gab Beschwerden bei den Bestellungen 10251, 10280, 10990 und 11000.
•	Welcher Angestellte hat diese Bestellungen bearbeitet?
•	Geben Sie Vor- und Nachname in einem Feld als FullName aus.
--
•	Suchen Sie alle Bestellungen, bei denen Bier verkauft wurde. 
Welcher Kunde? Wieviel? Welches Bier?
•	Der Produktname kann „Bier“ oder „Lager“ enthalten oder mit „Ale“ enden.
•	Ordnen Sie die Ausgabe nach Menge 
(absteigend: größte zuerst) und Kundenname (alphabetisch).

SELECT * FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON p.ProductID = od.ProductID

SELECT * FROM Orders
WHERE OrderID IN (10251, 10280, 10990)

SELECT CompanyName, c.CustomerID, Freight, OrderID, (e.FirstName + ' ' + e.LastName) AS FullName FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
WHERE OrderID IN (10251, 10280, 10990, 11000)

SELECT * FROM Products
WHERE Productname LIKE '%Bier%' OR Productname

SELECT CompanyName, ProductName, Quantity FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
JOIN Products p ON p.ProductID = od.ProductID
WHERE p.ProductName LIKE '%Ale' OR p.ProductName LIKE '%Bier%' OR p.ProductName LIKE '%Lager%'
ORDER BY Quantity DESC

SELECT ProductName, Orders.CustomerID, Quantity, Customers.CompanyName FROM Orders
INNER JOIN [Order Details] details ON Orders.OrderID = details.OrderID
INNER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Products ON Products.ProductID = details.ProductID
WHERE Products.ProductName LIKE '%Ale' OR Products.ProductName LIKE '%Bier%' OR Products.ProductName LIKE '%Lager%'
ORDER BY Quantity DESC, CompanyName