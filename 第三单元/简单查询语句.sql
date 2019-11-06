--查询每个雇员的所有信息
select EmployeeID 员工号,Name 姓名,Birthday 出生日期,Sex 性别,_Address 地址,Zip 邮编,
PhoneNumber 电话号码,EmailAddress 邮箱,DepartmentID 部门号
from employee

--查询每个雇员的地址和电话 
select Name 姓名,_Address 地址,PhoneNumber 电话号码
from Employee

--查询 EmployeeID 为 1001 的雇员的地址和电话
select EmployeeID 员工号,_Address 地址,PhoneNumber 电话号码
from Employee
where EmployeeID = 1001

--查询女雇员地址和电话，并用 AS 子句将结果中各列的标题分别指定为“地址”和“电话”
select Name 姓名,_Address as 地址,PhoneNumber as 电话号码
from Employee
where Sex = 1

--计算每个雇员的实际收入
select Name 姓名,Income-Outcome 实际收入
from Employee,Salary
where Employee.EmployeeID = Salary.EmployeeID

--找出所有姓王的雇员的部门号
select Name 姓名,DepartmentID 部门号
from Employee
where Name like '王%'

--找出所有地址中含有“中山”的雇员的号码和部门号
select EmployeeID 雇员号,DepartmentID 部门号
from Employee
where _Address like '%中山%'
