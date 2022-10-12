--WHILE
DECLARE @Var1 int = 1, @Var2 int, @Var3 int

WHILE @Var1 < 5
	BEGIN
		SET @Var1 +=1
		SELECT @Var1
	END
SELECT 'Fertig'

SELECT * INTO BackupOrders
FROM Orders

--Aufgabe: Erhöhe die Lieferkosten (Freight) in 10% Schritten, 
--folgende Grenzwerte dürfen NICHT überschritten werden:
--1. MAX(Freight) nicht über 1500 2. AVG(Freight) nicht über 100
--Tipp: Die Schleife sollte 2 mal laufen; Variablen sind nicht nötig
WHILE AVG(Freight) < 100  MAX(Freight) < 1500
	BEGIN
		UPDATE BackupOrders
		SET Freight = neuer Wert
	END

BEGIN TRAN
SELECT * INTO BackupOrders
FROM Orders
 
    
WHILE	(SELECT MAX(Freight*1.1) FROM BackupOrders) <= 1500 
		AND (SELECT AVG(Freight*1.1) FROM BackupOrders) < 100
    BEGIN
        Update  BackupOrders
		SET Freight = Freight*1.1
END
UPDATE BackupOrders
SET Freight = Freight/1.1

SELECT AVG(freight), MAX(Freight) FROM BackupOrders


DECLARE @max decimal(8,2), @avg decimal(8,2)

WHILE (
    SELECT @max = MAX(Freight*1.1), @avg = AVG(Freight*1.1) FROM OrdersCopy;
    @max <= 1500 AND
    @avg <= 100
)


SELECT CustomerID, SUM(SummeRabattiert) as GesamtUmsatz INTO #t FROM Masterview
GROUP BY CustomerID
HAVING SUM(SummeRabattiert) > 5000
SELECT * FROM Customers 
WHERE CustomerID IN(SELECT CustomerID FROM #t)



SELECT CustomerID, SUM(SummeRabattiert) as GesamtUmsatz FROM Masterview
GROUP BY CustomerID
HAVING SUM(SummeRabattiert) > 5000














WHILE 
INSERT INTO SuperKunden
(SELECT * FROM Customers 
WHERE CustomerID IN(SELECT CustomerID FROM Masterview
GROUP BY CustomerID
HAVING SUM(SummeRabattiert) > 5000)
