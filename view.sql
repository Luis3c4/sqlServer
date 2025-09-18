--if exists(select * from sys.views )
-- difrentes forma de seleccionar views
select v.name,s.id, s.text from sys.syscomments s 
inner join sys.views v
on s.id = v.object_id

select * from sys.sql_modules 

if exists(SELECT * from INFORMATION_SCHEMA.VIEWS
WHERE TABLE_NAME = 'ViewByDepartment' AND TABLE_SCHEMA = 'dbo'
) drop view dbo.ViewByDepartment

insert into ViewByDepartment(Department,EmployeeNumber,DateOfTransaction, TotalAmount) 
values ('Customer Relations',132, '2015-07-07', 999.99) 

begin tran

update ViewByDepartment 
set EmployeeNumber = 142 
where EmployeeNumber = 139

SELECT * from ViewByDepartment order by EmployeeNumber 

ROLLBACK tran


create view ViewByDepartment with encryption as
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount from tblDepartment D
LEFT JOIN employee E
on D.Department = E.Department
left join tblTransaction T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 139
with check option -- hace que cumple la condicion a la hora de ejutar un update o select en la vista

SELECT * from ViewByDepartment order by EmployeeNumber 

select * from tblTransaction tt  where tt.Amount = 999.99