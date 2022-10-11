/* Aufgaben

1. Stellvertreterliste: Wer kann für wen einspringen? (Employees)
*/
SELECT
    emp.FirstName, emp.LastName,
    emp2.FirstName AS FirstNameErsatz,
    emp2.LastName AS LastNameErsatz,
    emp.City AS CityEmployee,
    emp2.City AS CityErsatz
FROM Employees emp
INNER JOIN Employees emp2 ON emp.City = emp2.City
WHERE emp.EmployeeID != emp2.EmployeeID
ORDER BY emp.City, emp.LastName

SELECT e1.FirstName, e1.LastName, e2.FirstName, e2.Lastname, e1.City FROM Employees e1
CROSS JOIN Employees e2
WHERE e1.City = e2.City AND e1.EmployeeID != e2.EmployeeID
ORDER BY e1.Firstname
*/
/*
2. "Vorgesetztenliste": Wer hat wen als Vorgesetzten? (Employees; ReportsTo)
*/
SELECT
     emp.FirstName + ' ' + emp.LastName as Angestellter
     , ISNULL(emp2.FirstName + ' ' + emp2.LastName, 'Himself') as Vorgesetzter
FROM Employees emp
LEFT JOIN Employees emp2
ON emp.ReportsTo = emp2.EmployeeID
/*
3. Welche Produkte hat Robert King im Jahr 1997 verkauft?
Employees - Orders - Order Details - Products */

SELECT DISTINCT
--e.Firstname + ' ' + e.LastName as Verkäufer,
p.ProductName
--o.OrderDate
FROM Employees e
JOIN Orders o ON o.EmployeeID = e.EmployeeID
JOIN [Order Details] od ON od.OrderID = o.OrderID
JOIN Products p ON p.ProductID = od.ProductID
WHERE e.LastName = 'King' AND e.FirstName = 'Robert' AND year(o.orderdate) = 1997

/*
4. Zu allen Lieferkosten (Freight in Orders Table): Netto, Brutto und MwSt. ausgeben.
   (Angenommen Freight ist als Netto hinterlegt)
*/
SELECT Freight as FrachtNetto, 
CAST(Freight*1.19 as decimal(10,2)) as FrachtBrutto, 
Freight*1.19 as MoneyBrutto,
CAST((Freight*1.19) - Freight as decimal(10,2)) as MwSt,
CAST(Freight*0.19 as decimal(10,2))as MwStAlt
FROM Orders


/*
JOIN Syntax:
SELECT * FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
*/

