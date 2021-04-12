PRINT '';
PRINT '*** Dropping Database';
GO

IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'Project1_Diagram')
DROP DATABASE Project1_Diagram;
GO

PRINT '';
PRINT '*** Creating Database';
GO

Create database Project1_Diagram
Go

Use Project1_Diagram
Go



PRINT '';
PRINT '*** Creating Table DimLocation';
GO

Create table DimLocation
(
LocationID int primary key identity,
Continent varchar(10) not null,
Country varchar(50)
)
Go

PRINT '';
PRINT '*** Creating Table DimTime';
GO

Create table DimTime
(
TimeID int primary key identity,
Year int,
Quarter int,
Month int
)
Go

PRINT '';
PRINT '*** Creating Table DimPopulation';
GO

Create table DimPopulation
(
PopulationID int primary key identity,
PopulationAltID varchar(50)
)
Go

PRINT '';
PRINT '*** Creating Table DimLife_expectancy';
GO

Create table DimLife_expectancy
(
Life_expectancyID int primary key identity,
LifeAltID varchar(50)
)
Go

PRINT '';
PRINT '*** Creating Table FactCovir';
GO

Create Table FactCovir
(
FactId bigint primary key identity,
TimeID int not null,
LocationID int not null,
PopulationID int not null,
Life_expectancyID int not null,
Confirmed int not null,
Death int,
Recovery int
)
Go

PRINT '';
PRINT '*** Add relation between fact table foreign keys to Primary keys of Dimensions';
GO

AlTER TABLE FactCovir ADD CONSTRAINT 
FK_TimeID FOREIGN KEY (TimeID)REFERENCES DimTime(TimeID);
AlTER TABLE FactCovir ADD CONSTRAINT 
FK_LocationID FOREIGN KEY (LocationID)REFERENCES DimLocation(LocationID);
AlTER TABLE FactCovir ADD CONSTRAINT 
FK_PopulationID FOREIGN KEY (PopulationID)REFERENCES DimPopulation(PopulationID);
AlTER TABLE FactCovir ADD CONSTRAINT 
FK_Life_expectancyID FOREIGN KEY (Life_expectancyID)REFERENCES DimLife_expectancy(Life_expectancyID);
Go
