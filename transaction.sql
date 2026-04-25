begin transaction
select * from  [dbo].[tblEmployee]
update  [dbo].[tblEmployee] set EmployeeNumber = 122 where EmployeeNumber = 123

waitfor delay '00:00:10'

rollback transaction

select * from  [dbo].[tblEmployee]
