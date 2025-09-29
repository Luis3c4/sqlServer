
CREATE TRIGGER TR_tblTrnasaction
    ON [dbo].[tblTransaction]
    after DELETE, INSERT, UPDATE
    AS
    BEGIN
    --IF UPDATE(DateOfTransaction) → detecta si esa columna se actualizó.

    --IF (COLUMNS_UPDATED() & 2 = 2)
        select * from inserted
        select * from deleted
    SET NOCOUNT ON
    END
    go

    begin tran 
    insert into tblTransaction(Amount,DateOfTransaction, EmployeeNumber)
    values (123,'2015-07-10',123)
    rollback tran
    go

create trigger tr_ViewByDepartment
on dbo.ViewByDepartment
instead of delete
as
BEGIN
    declare @EmployeeNumber as int
    declare @DateOfTransaction as smalldatetime
    declare @Amount as smallmoney
    select @EmployeeNumber= EmployeeNumber, @DateOfTransaction= DateOfTransaction, @Amount= TotalAmount 
    from deleted

    delete from tblTransaction
    where EmployeeNumber = @EmployeeNumber
    and DateOfTransaction = @DateOfTransaction
    and Amount = @Amount
END
begin tran
delete from ViewByDepartment
where TotalAmount = -2.77 and EmployeeNumber = 132
rollback tran

EXEC sp_configure 'nested triggers', 0; -- desactiva

EXEC sp_configure 'nested triggers', 1; -- activa