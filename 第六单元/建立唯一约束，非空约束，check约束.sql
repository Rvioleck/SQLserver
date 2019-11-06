
--建立课程的实体完整性和课程号 Cno 的参照完整性
alter table Course add constraint pk_Course primary key(Cno)
alter table Course add constraint fk_Course foreign key(Cpno) references Course(Cno)

--对 HRM 数据库，练习建立三个表的主外键约束、唯一约束、取空值约束、用户自定义的约束（参考 HRM 数据库表定义图中说明
--HRM的主外键约束
alter table Employee add constraint pk_Employee primary key(EmployeeID)
alter table Departments add constraint pk_Department primary key(DepartmentID)
alter table Salary add constraint pk_Employee primary key(EmployeeID)
alter table Salary add constraint fk_Employee_S foreign key(EmployeeID) references Employee(EmployeeID)

--HRM的唯一约束
alter table Employee add constraint uq_EmployeeName unique(Name)

--HRM的取空值约束
alter table Employee alter column EmployeeID char(6) not null
alter table Employee alter column Name char(10) not null
alter table Employee alter column Birthday datetime not null
alter table Employee alter column Sex bit not null

alter table Departments alter column DepartmentID char(3) not null
alter table Departments alter column DepartmentName char(20) not null
alter table Departments alter column Note text not null

alter table Salary alter column EmployeeID char(6) not null
alter table Salary alter column Income float not null
alter table Salary alter column Outcome float not null

--HRM的check约束
alter table Employee add constraint check_EmployeeID check(EmployeeID like '[0-9][0-9][0-9][0-9]')
alter table Employee add constraint check_sex check(Sex = 0 or Sex = 1)
alter table Employee add constraint check_zip check(zip like '[0-9][0-9][0-9][0-9][0-9][0-9]')
alter table Employee add constraint check_phoneNumber check(PhoneNumber like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
alter table Employee add constraint check_Department check(DepartmentID = 1 or DepartmentID = 2 or DepartmentID = 3)

alter table Departments add constraint check_DepartmentID check (DepartmentID in(1,2,3))

alter table salary add constraint check_Employee check(EmployeeID like '[0-9][0-9][0-9][0-9]')
alter table salary add constraint check_Outcome check(Outcome like '[0-9][0-9][0-9][0-9]')

--建立 salary 表的 Income 字段限定在 0-9999 之间
alter table salary add constraint check_Income check(Income between 0 and 9999)
