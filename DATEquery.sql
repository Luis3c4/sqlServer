SELECT 
DATENAME(MONTH,DateOfBirth) as MonthName, 
COUNT (*) as NumberEmployees,
COUNT(e.EmployeeMiddleName )as NumberOfMiddlenames,
COUNT(*)- COUNT(e.EmployeeMiddleName) as noMiddlename,
format(MIN(e.DateOfBirth),'D') as EarliesDateOfBirth ,
format(MAX(e.DateOfBirth),'D') as LatestDateOfBirth
from Employee e 
GROUP BY DATENAME(MONTH,DateOfBirth) , DATEPART(MONTH, e.DateOfBirth )
order by EarliesDateOfBirth