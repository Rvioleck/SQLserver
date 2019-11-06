--定义一个视图用以查看所有员工的编号、姓名和出生日期
create view EmployeeID_NAME_BIR
as select EmployeeID '员工编号', Name '姓名',Birthday '出生日期'
from Employee
select * from EmployeeID_NAME_BIR

--定义一个满足 sex=‟true‟的员工的所有信息的视图
create view Employee_SEX1
as select *
from Employee
where Sex= 'true'
select * from Employee_SEX1

--定义一个视图用以查看部门号码为„2‟的所有员工的姓名、电话和邮件地址
create view Employee_Departments2
as select Name 姓名,PhoneNumber 电话号码,EmailAddress 电子邮件地址
from Employee
where DepartmentID = 2
select * from Employee_Departments2

--定义一个视图用以查看所有员工的姓名、部门名及工资
create view Employee_Salary
as select Name 姓名,DepartmentName 部门名,Income-Outcome 工资
from Employee,Salary,Departments
where Employee.EmployeeID = Salary.EmployeeID and Employee.DepartmentID = Departments.DepartmentID
select * from Employee_Salary

--定义一个比所有财务部的雇员工资都高的雇员的信息的视图
create view Salary_caiwu
as select Name 姓名,DepartmentName 部门名,Income-Outcome 工资
from Employee,Salary,Departments
where Employee.EmployeeID = Salary.EmployeeID and Employee.DepartmentID = Departments.DepartmentID
	and Income-Outcome > all(
	select income-outcome from Salary where EmployeeID in (
	select EmployeeID from Employee where DepartmentID in(
	select DepartmentID from Departments where DepartmentName ='财务部')))
select * from Salary_caiwu

--定义一个视图用以查看所有雇员的编号、姓名、年龄
create view Employee_age
as select EmployeeID 雇员编号,Name 姓名,year(GETDATE())-year(Birthday) 年龄
from Employee
select * from Employee_age

--分别在定义的视图上进行查询、插入、更新和删除操作，分情况（查询、更新）讨论哪些操作可以成功完成，哪些不能成功完成，并分析原因。 
update Employee_age set 年龄=年龄+1
insert into Employee_age values (1801,'方一舟',19)
drop view Employee_age
select * from Employee_age
