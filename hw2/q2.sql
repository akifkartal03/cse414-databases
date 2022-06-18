Use HW2
Create Table Department (
	Depid int NOT NULL,
	DepName nvarchar (MAX),
	CONSTRAINT PK_Dep PRIMARY KEY CLUSTERED 
	(
		Depid
	)
)
Create Table Employee (
	name nvarchar (MAX),
	Age int NOT NULL,
	Address nvarchar (MAX),
	Depid int NULL,
	CONSTRAINT FK_employee FOREIGN KEY 
	(
		Depid
	) REFERENCES dbo.Department (
		Depid
	)
)



---------------------------------------------------
create trigger trg_deleteCascade
on Department
instead of delete
as
delete from Employee where Depid = (select Depid from deleted)
delete from Department where Depid = (select Depid from deleted)
---------------------------------------------------



delete from Department where Depid = 3

select * from Employee

select * from Department

