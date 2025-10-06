SELECT TOP (1000) [Amount]
      ,[DateOfTransaction]
      ,[EmployeeNumber]
  FROM [Udemi].[dbo].[tblTransaction]

 INSERT INTO tblTransaction VALUES
(101, '2025-10-01', 200.00),
(102, '2025-10-01', 150.00),
(103, '2025-10-02', 300.00);
CREATE TABLE tblTransactionNew (
    EmployeeNumber INT,
    DateOfTransaction DATE,
    Amount DECIMAL(10,2)
);
-- Tabla origen (tblTransactionNew)
INSERT INTO tblTransactionNew VALUES
(101, '2025-10-01', 100.00),  -- Mismo empleado y fecha (MATCHED)
(104, '2025-10-03', 500.00);  -- Nuevo registro (NOT MATCHED)

BEGIN TRAN
MERGE INTO tblTransaction AS T
USING tblTransactionNew AS S
ON T.EmployeeNumber = S.EmployeeNumber 
   AND T.DateOfTransaction = S.DateOfTransaction

WHEN MATCHED THEN
    UPDATE SET T.Amount = T.Amount + S.Amount

WHEN NOT MATCHED BY TARGET THEN
    INSERT (EmployeeNumber, DateOfTransaction, Amount)
    VALUES (S.EmployeeNumber, S.DateOfTransaction, S.Amount);
 select * from tblTransaction where EmployeeNumber > 100 and EmployeeNumber < 105
ROLLBACK TRAN;

SELECT DateOfTransaction, EmployeeNumber, COUNT(*) AS NumberOfRows
FROM tblTransactionNew 
GROUP BY DateOfTransaction, EmployeeNumber
HAVING COUNT(*) > 1

SELECT DateOfTransaction, EmployeeNumber, COUNT(*) AS NumberOfRows
FROM tblTransactionNew 
GROUP BY DateOfTransaction, EmployeeNumber
HAVING COUNT(*)>1

BEGIN TRAN
go
DISABLE TRIGGER TR_tblTransaction ON dbo.tblTransaction -- Desactiva temporalmente un trigger (por ejemplo, un trigger de auditoría o de validación) que podría afectar la ejecución del MERGE.
GO

MERGE INTO tblTransaction as T
USING (SELECT DateOfTransaction, EmployeeNumber, MIN(Amount) as Amount
      FROM tblTransactionNew
	  GROUP BY DateOfTransaction, EmployeeNumber) as S
ON T.EmployeeNumber = S.EmployeeNumber AND
	T.DateOfTransaction = S.DateOfTransaction
WHEN MATCHED THEN
    UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED THEN
	INSERT (Amount, DateOfTransaction, EmployeeNumber)
	VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber)
	OUTPUT deleted.*, inserted.*;
ROLLBACK TRAN
