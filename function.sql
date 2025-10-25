CREATE FUNCTION AmountPlusOne(@Amount smallmoney)
returns smallmoney
begin
	return @Amount +1 
end
go

select DateOfTransaction, EmployeeNumber, Amount, dbo.AmountPlusOne(Amount) as AmountAndOne
from tblTransaction

if exists(SELECT * FROM sys.objects where name = 'NumberOfTransactions') 
	drop function NumberOfTransactions
go
CREATE FUNCTION NumberOfTransactions(@EmployeeNumber int)
RETURNS int
AS
BEGIN
	DECLARE @NumberOfTransactions INT
	SELECT @NumberOfTransactions = COUNT(*) FROM tblTransaction
	WHERE EmployeeNumber = @EmployeeNumber
	RETURN @NumberOfTransactions
END
go

CREATE FUNCTION TransactionList(@EmployeeNumber int)
returns table as return
(
	SELECT * FROM tblTransaction
	WHERE EmployeeNumber = @EmployeeNumber
)
go
SELECT * 
from dbo.TransactionList(130)

select *
from employee
where exists(select * from dbo.TransactionList(EmployeeNumber))

select distinct E.*
from employee as E
join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber

select *
from employee as E
where exists(Select EmployeeNumber from tblTransaction as T where E.EmployeeNumber = T.EmployeeNumber)
go
--multi-satatemnt table function
create function TransList (@EmployeeNumber int)
returns @TransList TABLE
( Amount smallmoney,
DateOfTransaction smalldatetime,
EmployeeNumber int 
)
as
BEGIN
	INSERT INTO @TransList(Amount, DateOfTransaction, EmployeeNumber)
	SELECT Amount, DateOfTransaction, EmployeeNumber from tblTransaction
	where EmployeeNumber = @EmployeeNumber
	return
END
go

SELECT * 
from dbo.TransList(123)
GO
--Apply
select *, (select count(*) from dbo.TransList(E.EmployeeNumber)) as NumTransactions
from employee as E

select *
from employee as E
outer apply TransList(E.EmployeeNumber) as T

select *
from employee as E
cross apply TransList(E.EmployeeNumber) as T

--123 left join TransList(123)
--124 left join TransList(124)

--outer apply all of tblEmployee, UDF 0+ rows
--cross apply UDF 1+ rows

--outer apply = LEFT JOIN
--cross apply = INNER JOIN

select *
from employee as E
where  (select count(*) from dbo.TransList(E.EmployeeNumber)) >3

