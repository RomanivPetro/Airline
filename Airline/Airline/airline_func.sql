
USE Airline; -- зробити БД поточною

GO

alter function fnSelectLog(@a int)
returns @rtnTable table
as
begin	
	if @a = 1 
	--insert
	begin
		RETURN (SELECT * FROM tblLog WHERE OperationId is Null);
	end
	if @a = 2 
	--update
	begin
		RETURN (SELECT * FROM tblLog WHERE NewOperationId IS NOT NULL and OperationId Is NOT NULL);
	end
	if @a = 3 
	--Delete
	begin
		RETURN (SELECT * FROM tblLog WHERE NewOperationId is Null);
	end
return (Select * from tblLog);
end;
---
select  dbo.fnSelectLog(4);
--



