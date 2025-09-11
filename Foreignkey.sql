BEGIN TRAN
ALTER TABLE tblTransaction alter column EmployeeNumber INT null

ALTER TABLE tblTransaction add constraint DF_tblTransaction DEFAULT 124 FOR EmployeeNumber

ALTER TABLE tblTransaction with nocheck --Esto sirve cuando ya tienes datos que no cumplen la integridad referencial y quieres crear la FK sin que falle.
add constraint FK_tblTransaction_EmployeeNumber FOREIGN KEY (EmployeeNumber)
References employee(EmployeeNumber)
ON UPDATE cascade 
on DELETE SET DEFAULT

	UPDATE employee Set EmployeeNumber = 9123 where EmployeeNumber = 123
	
ROLLBACK TRAN
