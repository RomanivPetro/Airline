CREATE DATABASE Airline;
-- ц€ частина коду виконуЇтьс€ одною транзакц≥Їю
-- кожна з частин м≥ж GO скомп≥люЇтьс€ ≥ виконаЇтьс€ незалежно
GO
-- ц€ частина коду виконаЇтьс€ ≥ншою транзакц≥Їю.
USE Airline; -- зробити Ѕƒ поточною

GO

CREATE TABLE tblCustomer
(
	Id INT NOT NULL IDENTITY(1,1),
	FirstName NVARCHAR(255) NOT NULL,
	Surname NVARCHAR(255) NOT NULL,
	Birthdate DATETIME NOT NULL,
	Country NVARCHAR(512) NOT NULL,
	Comment NVARCHAR(MAX) NULL
);
ALTER TABLE tblCustomer ADD CONSTRAINT PK_tblCustomer_Id PRIMARY KEY(Id);


CREATE TABLE tblFlight
(
	Id INT NOT NULL IDENTITY(1, 1),
	DepartureTime DATETIME NOT NULL,
	ArrivalTime DATETIME NOT NULL,
	Departure NVARCHAR(255) NOT NULL,
	Destination NVARCHAR(255) NOT NULL,
	Cost NUMERIC(18, 4) NOT NULL,
	SeatsCount INT NOT NULL
);
ALTER TABLE tblFlight ADD CONSTRAINT PK_tblFlight_Id PRIMARY KEY(Id);
ALTER TABLE tblFlight ADD CONSTRAINT CH_tblFlight_SeatsCount
CHECK (SeatsCount >=0 AND SeatsCount <= 1000);

CREATE TABLE tblReservation
(
	Id INT NOT NULL IDENTITY(1, 1),
	Seat VARCHAR(20) NOT NULL,
	FlightId INT NOT NULL,
	CustomerId INT NOT NULL,
	Cost NUMERIC (18,4) NOT NULL,
	[Status] INT NOT NULL,
	UNIQUE(Seat, FlightId)
);
ALTER TABLE tblReservation ADD CONSTRAINT PK_tblReservation_Id PRIMARY KEY(Id);
ALTER TABLE tblReservation ADD CONSTRAINT FK_tblReservation_FlightId Foreign KEY (FlightId) REFERENCES tblFlight(Id);
ALTER TABLE tblReservation ADD CONSTRAINT FK_tblReservation_CustomerId Foreign KEY(CustomerId) REFERENCES tblCustomer(Id);
ALTER TABLE tblReservation ADD CONSTRAINT CH_tblReservation_Status
CHECK ([Status] = 1 OR [Status] = 2);


