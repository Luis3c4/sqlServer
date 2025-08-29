select Department, newTable.numberOfDepartment  from (
	select e.Department, COUNT(*) as numberOfDepartment from employee e
	group by e.Department 
) as newTable

--derived table

SELECT DISTINCT e.Department, convert(varchar(20),N'') as DepartmentHead 
into tblDepartment
from employee e 

drop TABLE tblDepartment 

alter TABLE  tblDepartment 
alter column DepartmentHead varchar(30) null