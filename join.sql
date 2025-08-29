create TABLE  tblTransaction (
	Amount smallmoney NOT NULL,
	DateOfTransaction smalldatetime NULL ,
	EmployeeNumber int not null
)

select * from tblTransaction tt 

select e.EmployeeNumber,e.EmployeeFirstName, e.EmployeeLastName, 
SUM(tt.Amount) as SumOfAmount
from employee e 
left join tblTransaction tt 
on e.EmployeeNumber = tt.EmployeeNumber
GROUP by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName