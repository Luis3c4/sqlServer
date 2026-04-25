select * into [dbo].[tblEmployee2]
from [dbo].[tblEmployee]
where EmployeeNumber <> 131

alter table [dbo].[tblEmployee2] add constraint PK_tblEmployee2 primary key clustered (EmployeeNumber)

select * from [dbo].[tblEmployee2] where EmployeeNumber = 127

create clustered index idx_tblEmployee on [dbo].[tblEmployee]([EmployeeNumber])

select * from [dbo].[tblEmployee] where EmployeeNumber = 127
