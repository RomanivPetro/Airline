USE Airline;
GO

CREATE PROC spCreateTicket
	@CustomerId INT,
	@FlightId INT,
	@Seat VARCHAr(20),
	@TicketId INT OUTPUT
AS

BEGIN
DECLARE @Cost  NUMERIC(18,4);


SELECT @Cost = Cost FROM tblFlight WHERE Id = @FlightId;

INSERT INTO tblReservation
	(CustomerId, FlightId, Seat, Cost, [Status])
	VALUES
	(@CustomerId, @FlightId, @Seat, @Cost, 1);

	SET @TicketId = SCOPE_IDENTITY();

END;


GO

CREATE proc spGetAvailableFlights
AS

BEGIN
	SELECT
	f.Id,
	f.DepartureTime,
	f.ArrivalTime,
	f.DepartureTime,
	f.Destination,
	f.Cost
	FROM tblFlight f
	WHERE DepartureTime > GETDATE();
END;
