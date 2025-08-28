create TABLE  tblTransaction (
	Amount smallmoney NOT NULL,
	DateOfTransaction smalldatetime NULL ,
	EmployeeNumber int not null
)

INSERT INTO tblTransaction VALUES
(-964.05, '20150526', 658), 
(-105.23, '20150914', 987)

select * from tblTransaction tt 

select * from employee e 
join tblTransaction tt 
on e.EmployeeNumber = tt.EmployeeNumber