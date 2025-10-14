use Udemi
SELECT 
  A.EmployeeNumber, 
  A.AttendanceMonth, 
  A.NumberAttendance,
  FIRST_VALUE(NumberAttendance)
    OVER(PARTITION BY E.EmployeeNumber 
         ORDER BY A.AttendanceMonth) AS FirstMonth,
  LAST_VALUE(NumberAttendance)
    OVER(PARTITION BY E.EmployeeNumber 
         ORDER BY A.AttendanceMonth 
         ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastMonth
FROM employee AS E 
JOIN tblAttendance AS A
  ON E.EmployeeNumber = A.EmployeeNumber;
go

select A.EmployeeNumber, A.AttendanceMonth, 
A.NumberAttendance, 
lag(NumberAttendance, 1)  over(partition by E.EmployeeNumber 
                            order by A.AttendanceMonth) as MyLag,
lead(NumberAttendance, 1) over(partition by E.EmployeeNumber 
                            order by A.AttendanceMonth) as MyLead,
NumberAttendance - lag(NumberAttendance, 1)  over(partition by E.EmployeeNumber 
                            order by A.AttendanceMonth) as MyDiff
from employee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber

