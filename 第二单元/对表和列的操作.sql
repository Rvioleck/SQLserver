EXEC sp_rename 'Salary.OutCome',
'OutCome','column'--修改表的列名

ALTER TABLE Salary
ADD bbb int null  --增加表的列

DROP TABLE Salary --删除整表

alter table Salary
alter column Income float not null --修改列的类型

alter table Salary
ADD constraint ID primary key(EmployeeID)

alter table Salary --添加外键
add constraint E_S
foreign key(EmployeeID)
references Employee(EmployeeID)

alter table Employee
add constraint E_D
foreign key(DepartmentID)
references Departments(DepartmentID)
