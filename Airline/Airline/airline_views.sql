USE Airline;
GO
CREATE VIEW vwTicket
AS
SELECT 
	r.Id, 
	r.CustomerId, 
	r.FlightId, 
	r.Seat, 
	c.FirstName, 
	c.Surname, 
	c.Birthdate, 
	f.ArrivalTime, 
	f.Cost
FROM tblCustomer c 
LEFT JOIN
tblReservation r ON c.Id = r.CustomerId
LEFT JOIN tblFlight f on r.FlightId = f.Id