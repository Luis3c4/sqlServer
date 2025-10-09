if OBJECT_ID('NameEmployees','P') IS NOT NULL
DROP PROC NameEmployees
go
create proc NameEmployees(@EmployeeNumber int) as
begin
	if exists (Select * from employee where EmployeeNumber = @EmployeeNumber)
	begin
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from employee
		where EmployeeNumber = @EmployeeNumber
	end
end
go
NameEmployees 4
execute NameEmployees 223
exec NameEmployees 323
