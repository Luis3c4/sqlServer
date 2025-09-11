--if exists(select * from sys.views )

if exists(SELECT * from INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo'
) drop view dbo.ViewByDepartment


create view ViewByDepartment as
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount from tblDepartment D
LEFT JOIN employee E
on D.Department = E.Department
left join tblTransaction T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 139

SELECT * from ViewByDepartment