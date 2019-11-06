create table Employee --创建Employee表
(
	EmployeeID char(6) primary key not null,
	Name char(10) not null,
	Birthday datetime not null,
	Sex bit not null,
	_Address char(20),
	Zip bit,
	PhoneNumber char(12),
	EmailAddress char(30),
	DepartmentID char(3) not null
)

create table Salary --创建Salary表
(
	EmployeeID char(6) not null,
	Income float not null,
	Outcome float not null
)

create table Departments --创建Departments表
(
	DepartmentID char(3) primary key not null,
	DepartmentName char(20) not null,
	Note text
)

alter table Salary  --建立表Salary与表Employee的联系
add constraint E_S
foreign key(EmployeeID)
references Employee(EmployeeID)

alter table Employee --建立表Employee与表Departments的联系
add constraint E_D
foreign key(DepartmentID)
references Departments(DepartmentID)
