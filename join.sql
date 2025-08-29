create TABLE  tblTransaction (
	Amount smallmoney NOT NULL,
	DateOfTransaction smalldatetime NULL ,
	EmployeeNumber int not null
)

select tt. from tblTransaction tt 

select * from employee e 
join tblTransaction tt 
on e.EmployeeNumber = tt.EmployeeNumber