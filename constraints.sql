alter table tblTransaction add DateOfEntry datetime

alter table tblTransaction add constraint defDateOfEntry default GETDATE() for DateOfEntry

select *  from tblTransaction  where EmployeeNumber < 3;

insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry ) 
values (1,'2014-01-02',1,'2013-01-01')

alter table tblTransaction 
drop constraint defDateOfEntry

alter table tblTransaction 
drop column DateOfEntry

-- constraint check
select * from employee e

alter table tblTransaction 
add constraint ckAmount check (Amount >- 1000 and Amount < 1000)

alter table employee with nocheck
add constraint chMiddleName check 
(REPLACE(EmployeeMiddleName,'.', '')=EmployeeMiddleName or EmployeeMiddleName is null)

create table tblEmployee2
(EmployeeMiddleName varchar(50) null, constraint CK_EmployeeMiddleName CHECK(
REPLACE(EmployeeMiddleName,'.', '')=EmployeeMiddleName or EmployeeMiddleName is null))

drop table tblEmployee2 	