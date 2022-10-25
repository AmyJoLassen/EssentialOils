--Requirements / Tasks--
--Must be a new SQL file
--Must include both single and multiline comments
--Each step must be explained in comments
--Must include SQL to create a database
--Must use master
--must delete database if exists
--must create database
--Must include SQL to switch to the new database
--Must create tables
--At least one with a foreign key
--Must insert data into the tables
--Must alter a table by adding a column
--Must alter a table by deleting a column
--Must delete a record from a table
--Must select results and sort by ascending order
--Include a comment that explains why you would want to sort this column by ascending
--Must select results and sort by descending order
--Include a comment that explains why you would want to sort this column by descending
--Must select the top 10 values from a table
--Must have a select statement using the IN keyword
--Must select a value within a certain range
--Include a comment that explains why you would want to select by this range
--Must include joins:
--inner join
--left join
--right join
--Must insert a record with a null value
--Must use aggregate functions
--SUM
--COUNT
--If possible one statement count all records, and one statement counting all values in a column that is nullable
--AVG
--if possible, one statement averaging a column that is not nullable and one averaging nullable values
--why would we care about these results? write a comment
--Must return a result set with a column that does not exist in the table with two values either added or concatenated
--Do not create a new column to do this
--write a comment explaining why we would want this information
--Must include a statement using GROUP BY
--Must include a select statement showing the full name of a person using firstName and lastName columns
--once with CONCAT() and once without


USE Master
Go

--New Database Created--
Create Database EssentialOils_Client;

USE EssentialOils_Client;
Go
--Created 4 new tables--
CREATE TABLE EssentialOils
(
Id					INT			NOT NULL	IDENTITY PRIMARY KEY,	
CommonName			VARCHAR(45)	NOT NULL,
BotanicalName		VARCHAR(45)	NOT NULL,
MainUse				VARCHAR(50) NOT NULL,
AdditionalUse		VARCHAR(50) NULL,
);

--Altered EssentialOils TABLE - removed MainUse and AdditionalUse--
--Created a NEW table - Uses that will included each oils use--


--Primary and Foreign Keys Used--
CREATE TABLE EOSizeCost
(
Id				INT			NOT NULL		IDENTITY PRIMARY KEY,
EOId			INT			NOT NULL		REFERENCES EssentialOils (Id),
Size			VARCHAR(10)	NOT NULL,
Cost			MONEY		NOT NULL,
);

CREATE TABLE ClientUse
(
Id			INT			NOT NULL		IDENTITY PRIMARY KEY,
OilUsed		INT			NOT NULL		REFERENCES EssentialOils (Id),
FirstName	VARCHAR(20)	NOT NULL,
LastName	VARCHAR(25)	NOT NULL,
);


--Eventualy CREATED a NEW TABLE "Clients" and set up columns differently
	--Some SELECT statements still do not work.
ALTER TABLE ClientUse
ADD PreferredOil VARCHAR(25) NULL;

CREATE TABLE OilUses
(
Id			INT				NOT NULL		IDENTITY PRIMARY KEY,
OilId		INT				NOT NULL		REFERENCES EssentialOils (Id),
Physical	VARCHAR(25)		NULL,
Emotional	VARCHAR(25)		NULL,
);

--Alter table and dropped column--
ALTER TABLE EssentialOils
DROP COLUMN MainUse, AdditionalUse;

SELECT * FROM EssentialOils

-- Insert values into tables--
INSERT INTO EssentialOils (CommonName, BotanicalName)
VALUES	('Angelica', 'Angelica archangelica'),
		('Anise', 'Pimpinella anisum'),
		('Basil', 'Ocimum basilicum'),
		('Bergamot', 'Citrus aurantium bergamia'),
		('Black Pepper', 'Piper nigrum'),
		('Black Spruce', 'Picea mariana'),
		('Blue Cypress', 'Callitris intratrpoica'),
		('Cedarwood', 'Cedrus atlantica'),
		('Citronella', 'Cymbopogon nardus'),
		('Clary Sage', 'Salvia sclarea'),
		('Clove', 'Syzygium aromaticum'),
		('Copiaba', 'Copaifera officinalis'),
		('Cypress', 'Cupressus sempervirens'),
		('Eucalyptus Citriodora','Eucalyptus Citriodora'),  
		('Eucalyptus Globulus','Eucalyptus Globulus'),
		('Eucalyptus Radiata', 'Eucalyptus Radiata'),
		('Eucalyptus Staigeriana','Eucalyptus Staigeriana'),
		('Frankincense', 'Boswella carterii'),
		('Ginger', 'Zingiber officinale'),
		('Goldenrod', 'Solidago canandensis'),
		('Grapefruit', 'Citrus paradisi'),
		('Helichrysum', 'Helichrysum italicum'),
		('Idaho Blue Spruce', 'Picea pungens'),
		('Jade Lemon', 'Citrus limon'),
		('Lavender', 'Lavandula angustifolia'),
		('Lemon', 'Citrus Limon'),
		('Lemongrass', 'Cymbopogon flexousus'),
		('Marjoram', 'Origanum majorana'),
		('Melissa', 'Melissa officinalis'),
		('Myrrh', 'Commiphora myrrha'),
		('Myrtle', 'Myrtus communis'),
		('Nutmeg', 'Myristica fragrans'),
		('Orange', 'Citrus sinensis'),
		('Oregano', 'Origanum vulgare'),
		('Peppermint', 'Mentha piperita')

SELECT * FROM EssentialOils

INSERT INTO OilUses (OilId, Emotional)
VALUES	(1, 'Consciousness Shifting'),
		(1, 'Relentless'),
		(3, 'Manipulation'),
		(5, 'Being in a Black Hole'),
		(8, 'Conceit'),
		(9, 'Wishy Washy'),
		(10, 'Intolerance'),
		(10, 'General'),
		(11, 'Lashing Out'),
		(12, 'Lies'),
		(12, 'Not Getting Enough'),
		(15, 'Bondage'),
		(16, 'Physical Stress'),
		(18, 'Dizziness'),
		(18, 'Feeling of Worhtlessness'),
		(18, 'F-YOU'),
		(19, 'Lack'),
		(20, 'Defenseless'),
		(21, 'Distress'),
		(22, 'Fear of Death/Living'),
		(22, 'Fear of Hearing the Truth'),
		(22, 'Integrity - Lack of'),
		(22, 'Irresponsibe'),
		(25, 'Abandonment'),
		(25, 'Criticism'),
		(25, 'Fear of Unfoldment'),
		(30, 'Difficulty'),
		(35, 'Rigidity'),
		(34, 'Toxicity'),
		(26, 'Being Left Behind'),
		(26, 'Entitlement'),
		(26, 'Fear of Detachment'),
		(26, 'Frustration'),
		(26, 'Sadness'),
		(26, 'Stuck'),
		(26, 'Suffocated'),
		(26, 'Regret-Remorse'),
		(26, 'Life Being Unreliable'),
		(27, 'Resentment'),
		(27, 'Should'),
		(28, 'Disconnected'),
		(28, 'Suspicious'),
		(28, 'Unfulfilled'),
		(30, 'Fear of Facing the World'),
		(30, 'Difficulty'),
		(31, 'Suppression of Life'),
		(32, 'Adrenal Exhaustion'),
		(33, 'Ridicule'),
		(34, 'Fear of Completion'),
		(35, 'Failure'),
		(34, 'Vunerable'),
		(35, 'Restriction')
	;

SELECT Emotional
FROM OilUses

--Had to creat a new table CLIENTS so the PK and FK were different. Previous table CLIENTUSE wasnt set up correct.??--
CREATE TABLE Clients
(
	Id				INT			NOT NULL	IDENTITY PRIMARY KEY,
	FName			VARCHAR(20)	NOT NULL,
	Lname			VARCHAR(20)	NOT NULL,
	PreferredOil	INT			NULL		REFERENCES EssentialOils (Id)
	);

INSERT INTO Clients (FName, LName)
VALUES	('Andrea', 'Adams');

--Tested to make sure the values entered appeared correctly in the new table created--
SELECT * FROM Clients

INSERT INTO Clients (FName, LName)
VALUES	('Jodi', 'Adkins'),
		('Cristen', 'Anders'),
		('Pat', 'Anderson'),
		('Laura', 'Baker'),
		('Rylin', 'Batac'),
		('Alisha', 'Batac'),
		('Emil', 'Batac'),
		('Claudia', 'Bauer'),
		('Chris', 'Beal'),
		('Brenda', 'Benscik'),
		('Pam', 'Blaich'),
		('Brad', 'Blaich'),
		('Brooke', 'Brabson'),
		('John', 'Bratta'),
		('Alyssa', 'Caldwell'),
		('Beth', 'Cesta'),
		('Gina', 'Chilton'),
		('John', 'Davis'),
		('Cindy', 'DeWitt'),
		('Cathy', 'DiBella'),
		('Amy', 'Lassen'),
		('Carol', 'Erickson'),
		('Carol', 'Fields'),
		('Ann', 'Frederick'),
		('Amanda', 'George'),
		('Diane', 'Gillespe'),
		('Amber', 'Good'),
		('Jennifer', 'Hammond'),
		('Eric', 'Hancock'),
		('Gary', 'Jamison'),
		('Scott', 'Johnson'),
		('Pat', 'Kirk'),
		('Michelle', 'Johnson'),
		('Leslie', 'Molen'),
		('Angie', 'Nutley'),
		('Scott', 'Reed'),
		('Randy', 'Short'),
		('Lisa', 'Schutte'),
		('Larry', 'Tipton'),
		('Robin', 'Trainer'),
		('Katrina', 'Zenny')
		;

INSERT INTO Clients (Id, PreferredOil) 
VALUES	(3, 'Peppermint'),
		(5, 'Cedarwood');
 --This is NOT WORKING (this error keeps coming up: Msg 544, Level 16, State 1, Line 257
--Cannot insert explicit value for identity column in table 'Clients' when IDENTITY_INSERT is set to OFF


INSERT INTO EOSizeCost (EOId, Size, Cost)
VALUES	(1, 5, 50.50)

	SELECT * FROM EOSizeCost
	SELECT * FROM EssentialOils

	INSERT INTO EOSizeCost (EOId, Size, Cost)
	VALUES	(1, 5, 50.50),
			(2, 5, 120.00),
			(3, 5, 12.50),
			(3, 15, 28.50),
			(4, 5, 14.75),
			(4, 15, 31.00),
			(5, 5, 21.50),
			(5, 15, 21.50),
			(6, 5, 27.50),
			(23, 5, 33.25),
			(7, 5, 33.50),
			(13, 15, 22.25),
			(8, 15, 13.00),
			(9, 15, 22.50),
			(10, 15, 54.75),
			(11, 5, 8.25),
			(11, 15, 17.75),
			(12, 5, 24.75),
			(12, 15, 49.75),
			(15, 15, 16.50),
			(16, 15, 21.25),
			(18, 5, 34.25),
			(18, 15, 84.75),
			(19, 5, 15.00),
			(20, 5, 27.75),
			(21, 5, 8.75),
			(21, 15, 19.50),
			(22, 5, 98.25),
			(24, 5, 12.50),
			(25, 5, 13.50),
			(25, 15, 27.25),
			(26, 5, 7.00),
			(26, 15, 13.00),
			(27, 5, 7.00),
			(27, 15, 13.00),
			(28, 5, 16.50),
			(28, 15, 40.25),
			(29, 5, 182.25),
			(30, 5, 75.00),
			(31, 15, 30.75),
			(32, 5, 14.75),
			(33, 5, 6.75),
			(33, 15, 12.50),
			(34, 5, 13.50),
			(34, 15, 32.25),
			(35, 5, 11.50),
			(35, 15, 24.75)

-- Shows all data from EO Size and Cost
SELECT * FROM EOSizeCost

-- Shows all ID# and cost accuratley, however the CommonName is ALL Angelica.  I can't figure out what ive done wrong--
SELECT EOId, CommonName, Cost
FROM EOSizeCost, EssentialOils

-- Sorts all Essentail Oils Common and Botanical in Descending order by Botanical Name--
SELECT CommonName, BotanicalName  
FROM EssentialOils	
ORDER BY BotanicalName DESC;

--Use ON--
SELECT *
FROM OilUses JOIN EssentialOils
ON OilUses.OilId = EssentialOils.CommonName;

-- Lists 2 column - Least cost and Most $$--
SELECT MIN(cost) AS LeastExpensive, MAX(cost) AS MostExpensive  
FROM EOSizeCost

-- This is a good example (sort) showing Oils that cost less than $20/bottle
SELECT EOId, Cost, Size AS SizeMl  
FROM EOSizeCost
WHERE Cost < 20
ORDER BY Cost DESC;

SELECT LName  -- Doesnt WORK!! UGh--
FROM Clients
WHERE LName = 'B';

--Count # Clients--
SELECT COUNT (*) AS #ofClients
FROM Clients;

--Total Cost of oils if all purchased--
SELECT SUM(Cost) AS TotalCostOil
FROM EOSizeCost;

SELECT * FROM OilUses;

/*Was attempting to INSERT new values into OilUses for the 'Physcial' column and it creates and error.
Creates ERROR - cannot insert explicit value for identity column in table 'oiluses' when IDENTITY-INSERT is set to off*/
INSERT INTO OilUses (Id, Physical) 
VALUES (1, 'Antispasmodic');

--Select statement with 2 columns showing FirstName and LastName--
--Sorted Ascending by last name--
SELECT Fname, LName
FROM Clients;

--Full Name of Client without CONCAT--
SELECT (Fname + '' + Lname) AS FullName
FROM Clients
WHERE LName = 'Lassen';

--Full Name of Client with CONCAT--
SELECT CONCAT(Fname,' ',Lname) AS FullName
FROM Clients
WHERE LName = 'Lassen';

--Select Top 10--
SELECT TOP 10 CommonName, BotanicalName
FROM EssentialOils
ORDER BY CommonName DESC;

--Inner Join--
SELECT *


--Left Join--
SELECT*


--Right Join--
SELECT *


--Null Values--
--Used to see when an oil only has emotional properties--
SELECT *
FROM OilUses
Where Physical IS NULL;

UPDATE OilUses
SET Physical = 'Antispasmodic'
WHERE Id = 1;

ALTER TABLE OilUses
ADD CommonName VARCHAR(25) NULL REFERENCES EssentialOils(Id);

SELECT *
FROM OilUses