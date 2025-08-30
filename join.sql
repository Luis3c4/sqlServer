create TABLE  tblTransaction (
	Amount smallmoney NOT NULL,
	DateOfTransaction smalldatetime NULL ,
	EmployeeNumber int not null
)
go
select * from tblTransaction tt 

select e.EmployeeNumber,e.EmployeeFirstName, e.EmployeeLastName, 
SUM(tt.Amount) as SumOfAmount
from employee e 
left join tblTransaction tt 
on e.EmployeeNumber = tt.EmployeeNumber
GROUP by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName
go

select td.Department,td.DepartmentHead , sum(tt.Amount) as SumOfAmount
from tblDepartment td
left join employee e
on td.Department = e.Department
join tblTransaction tt
on tt.EmployeeNumber = tt.EmployeeNumber
group by td.Department, td.DepartmentHead
order by td.Department
go

insert into tblDepartment(Department, DepartmentHead) values ('Accounts', 'James')
go

-- join con delete y tabla heredada
begin transaction
select count(*) from tblTransaction
delete tblTransaction 
from tblTransaction tt
where tt.EmployeeNumber in (
	select newTable.TNumber from (
	select e.EmployeeNumber AS ENumber, 
	e.EmployeeFirstName,
	e.EmployeeLastName,
	t.EmployeeNumber as TNumber,
	sum(t.Amount) as TotalAmount
	from employee e
	right join tblTransaction t
	on e.EmployeeNumber = t.EmployeeNumber
	group by e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, t.EmployeeNumber
) as newTable
where newTable.ENumber is null
)
select count(*) from tblTransaction
rollback tran
select count(*) from tblTransaction

