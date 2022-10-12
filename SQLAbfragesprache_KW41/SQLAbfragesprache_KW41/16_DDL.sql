--DDL = Data Definiton Language

--Backup anlegen bzw. Tabelle kopieren

SELECT * INTO BackupCustomers
FROM Customers

SELECT * FROM BackupCustomers


--Tabellen l�schen
DROP TABLE BackupCustomers

--"Safety Net" : BEGIN TRAN (Transaction) - Versetzt uns in den "Zustand" der Transaction
BEGIN TRAN
--COMMIT best�tigt Transaktion und schreibt die Daten in die DB �ber
COMMIT 
--ROLLBACK beendet Transaktion und macht alle �nderungen r�ckg�ngig
ROLLBACK
--Gibt an, ob wir uns in einer Transaktion befinden 1 = ja, 0 = nein
SELECT @@TRANCOUNT


--INSERT - Neuen Datensatz hinzuf�gen

INSERT INTO BackupCustomers (CustomerID, CompanyName, City, Country)
VALUES 
('EDEKA', 'Edekamarkt', 'M�nchen', 'Germany'),
('ABCDE', 'Test', 'Berlin', 'Germany')

SELECT * FROM BackupCustomers
WHERE CustomerID = 'EDEKA'

--Pflichtfelder (NICHT NULL) m�ssen bef�llt werden
INSERT INTO BackupCustomers (CompanyName, City, Country)
VALUES 
('TestFirma', 'M�nchen', 'Germany')

INSERT INTO Customers (CustomerID, CompanyName, City, Country)
VALUES 
('ALFKI', 'TestFirma', 'M�nchen', 'Germany')

--BULK INSERT


--UPDATE - Bereits vorhandene Datens�tze �ndern
BEGIN TRAN ROLLBACK

--WHERE NICHT VERGESSEN! Sonst ganze Tabelle
--Mit Where am besten nach Prim�rschl�ssel filtern, da unique
UPDATE BackupCustomers
SET ContactName = 'Peter M�ller'
WHERE CustomerID = 'EDEKA'

--L�schen von einzelnen Zellen mit Update SET = NULL
UPDATE BackupCustomers
SET ContactName = NULL, ContactTitle = 'Vertrieb'
WHERE CustomerID = 'EDEKA' 


--DELETE - l�scht kompletten Datensatz
--Bei DELETE unbedingt mit Transaction arbeiten
DELETE FROM BackupCustomers
WHERE CompanyName = 'Testfirma'


--CREATE TABLE - neue Tabelle erstellen

CREATE TABLE Prototypen
(
ProtoID int identity(1,1) NOT NULL,
ProtoName varchar(20) NOT NULL,
CategoryID int NOT NULL DEFAULT 9,
Beschreibung varchar(50) NULL
PRIMARY KEY (ProtoID)
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
)

SELECT * FROM Prototypen

--�ndern von Table Einstellungen

ALTER TABLE Prototypen
ADD ProtoID2 int identity(1,1) NOT NULL


PIVOT UNPIVOT