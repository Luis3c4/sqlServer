alter table employee 
ALTER column EmployeeNumber INT NOT NULL

alter table employee 
add constraint PK_tblEmployee PRIMARY KEY (EmployeeNumber)

select * from employee2 e 

truncate TABLE employee2  

create table employee2 (
	EmployeeNumber int constraint PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1),
	EmployeeName nvarchar(20)
	)
	
set IDENTITY_INSERT employee2 off
	
insert into employee2(EmployeeNumber, EmployeeName)
values (31, 'Myname'),
(32, 'Myname')

set IDENTITY_INSERT employee2 on

select @@IDENTITY
SELECT SCOPE_IDENTITY()
SELECT IDENT_CURRENT('employee2')

