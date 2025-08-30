
begin tran
update tblTransaction
set EmployeeNumber = 194
output inserted.EmployeeNumber, deleted.EmployeeNumber
where EmployeeNumber in (3,5,7,9)

rollback tran