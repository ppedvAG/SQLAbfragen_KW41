SELECT 
ROW_NUMBER() OVER(ORDER BY CustomerID) AS ID,
* INTO #t FROM Customers 
WHERE CustomerID IN(SELECT CustomerID FROM Masterview
GROUP BY CustomerID
HAVING SUM(SummeRabattiert) > 5000)
GO
DECLARE @Var1 int = 1, @VarID char(5), @VarName Varchar(30)
WHILE @Var1 <= 55
BEGIN
	SET @VarID = (SELECT CustomerID FROM #t WHERE ID = @Var1)
	SET @VarName = (SELECT CompanyName FROM #t WHERE ID = @Var1)
	INSERT INTO SuperKunden (CustomerID, CompanyName)
	VALUES(@VarID, @VarName)
	SET @Var1 +=1
END

SELECT * FROM SuperKunden