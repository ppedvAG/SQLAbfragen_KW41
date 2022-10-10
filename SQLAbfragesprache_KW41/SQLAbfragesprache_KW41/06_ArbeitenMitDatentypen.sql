--Text/Stringmanipulation

'Otto ' WHERE Name = 'Otto' alternativ WHERE Name LIKE 'Otto%'

rtrim ltrim
--Entfernen "unnötige" Leerzeichen links bzw. rechts des Strings
SELECT rtrim('Otto     ')
SELECT rtrim(Companyname) FROM Customers
SELECT 'Otto'

' Otto'

--left & right
SELECT left(Companyname, 2) FROM Customers
SELECT right(Companyname, 5) FROM Customers

--stuff = Ersetzt Teil des Strings mit neuer Eingabe
SELECT stuff('DE4586286421232',1, 10, 'XXX') FROM Orders

--substring = "nimmt" einen angegeben Teil des Strings
SELECT substring('1234567890',1,3) 

--reverse = dreht String Reihenfolge um
SELECT reverse('12345')

--LEN = Gibt numerisch die Länge des Strings aus
SELECT LEN(Companyname) FROM Customers

--Abfrage die nur die letzten 4 Ziffern einer Nummer anzeigt, alles davor mit X
--Muss variabel funktionieren

SELECT Phone, SUBSTRING(Phone, LEN(Phone)-4, 4) as PhoneShort FROM Customers
SELECT stuff(Phone, (LEN(Phone)-3), 4, 'XXXX')  FROM Customers

SELECT stuff(Phone, 1, LEN(Phone)-4 , 'XXXXXX') FROM Customers


--Concat = fügt Strings zusammen
SELECT Firstname + ' ' + Lastname as GanzerName FROM Employees
SELECT concat(Firstname, ' ', Lastname) as GanzerName FROM Employees



--Datumsfunktionen
--Datum immer im Format 'YYYYMMDD'

--getdate() = aktuelle Systemzeit

SELECT getdate()

--datediff() = Differenz zwischen 2 Daten

SELECT datediff(day, getdate(), getdate())

--datepart() = 

SELECT datepart(quarter, '20210401')

--datename

SELECT datename(weekday, getdate())

year(), month(), day()

SELECT * FROM Orders
WHERE year(orderdate) = '1996'

--Aufgabe: Orders Tabelle: 
-- Lieferverzögerung in Tagen ausgeben 
-- (zwischen RequiredDate ShippedDate)

SELECT DATEDIFF(day, RequiredDate, ISNULL(ShippedDate, getdate())) as Delay, 
RequiredDate, ShippedDate FROM Orders 
WHERE DATEDIFF(day, RequiredDate, ShippedDate) > 0 OR ShippedDate IS NULL
ORDER BY Delay DESC
