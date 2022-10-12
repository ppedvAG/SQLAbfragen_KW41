--DDL = Data Definiton Language

--Backup anlegen bzw. Tabelle kopieren

SELECT * INTO BackupCustomers
FROM Customers

SELECT * FROM BackupCustomers


--Tabellen löschen
DROP TABLE BackupCustomers

--"Safety Net" : BEGIN TRAN (Transaction) - Versetzt uns in den "Zustand" der Transaction
BEGIN TRAN
--COMMIT bestätigt Transaktion und schreibt die Daten in die DB über
COMMIT 
--ROLLBACK beendet Transaktion und macht alle Änderungen rückgängig
ROLLBACK
--Gibt an, ob wir uns in einer Transaktion befinden 1 = ja, 0 = nein
SELECT @@TRANCOUNT


--INSERT - Neuen Datensatz hinzufügen

INSERT INTO BackupCustomers (CustomerID, CompanyName, City, Country)
VALUES 
('EDEKA', 'Edekamarkt', 'München', 'Germany'),
('ABCDE', 'Test', 'Berlin', 'Germany')

SELECT * FROM BackupCustomers
WHERE CustomerID = 'EDEKA'

--Pflichtfelder (NICHT NULL) müssen befüllt werden
INSERT INTO BackupCustomers (CompanyName, City, Country)
VALUES 
('TestFirma', 'München', 'Germany')

INSERT INTO Customers (CustomerID, CompanyName, City, Country)
VALUES 
('ALFKI', 'TestFirma', 'München', 'Germany')

--BULK INSERT


--UPDATE - Bereits vorhandene Datensätze ändern
BEGIN TRAN ROLLBACK

--WHERE NICHT VERGESSEN! Sonst ganze Tabelle
--Mit Where am besten nach Primärschlüssel filtern, da unique
UPDATE BackupCustomers
SET ContactName = 'Peter Müller'
WHERE CustomerID = 'EDEKA'

--Löschen von einzelnen Zellen mit Update SET = NULL
UPDATE BackupCustomers
SET ContactName = NULL, ContactTitle = 'Vertrieb'
WHERE CustomerID = 'EDEKA' 


--DELETE - löscht kompletten Datensatz
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

--Ändern von Table Einstellungen

ALTER TABLE Prototypen
ADD ProtoID2 int identity(1,1) NOT NULL


PIVOT UNPIVOT