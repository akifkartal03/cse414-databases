Create Table Employee (
	empid int  NOT NULL,
	name nvarchar (MAX),
	payment money NULL ,
	CONSTRAINT PK_Employee PRIMARY KEY CLUSTERED 
	(
		empid
	)
)


create trigger trg_salary
on Employee
instead of insert
as
insert into Employee select empid, name, (payment + ((payment * 10) / 100)) from inserted
select name as Name, payment as OldSalary, (payment + ((payment * 10) / 100)) as NewSalary, ((payment * 10) / 100) as Increment from inserted



insert Employee values(1,'Akif',100)

insert Employee values(2,'Mehmet',100)

insert Employee values(3,'Ahmet',100)

insert Employee values(4,'Ali',500)


insert Employee values(6,'Yusuf',5000)

insert Employee values(5,'Yunus',1000)

use Egitim
insert Employee values(7,'Yunus',30)

select * from Employee