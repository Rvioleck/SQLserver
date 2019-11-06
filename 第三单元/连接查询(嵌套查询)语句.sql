--查询每个雇员的情况及工资情况（工资=Income - Outcome）
select employee.EmployeeID 员工号,Name 姓名,Birthday 出生日期,
Sex 性别,_Address 地址,Zip 邮编,PhoneNumber 电话号码,
EmailAddress 邮箱,DepartmentID 部门号,Income-Outcome 工资
from employee,salary
where Employee.EmployeeID = Salary.EmployeeID

--查询财务部工资在 2200 元以上的雇员姓名及工资情况
select name 姓名,Income-Outcome 工资
from employee,salary,Departments
where Employee.EmployeeID = Salary.EmployeeID and
employee.DepartmentID= Departments.DepartmentID and
income-outcome>2200 and DepartmentName='财务部'

--查询研发部在 1966 年以前出生的雇员姓名及其工资详情 
select name 姓名,Income-Outcome 工资
from Employee,Salary,Departments
where Employee.EmployeeID = Salary.EmployeeID and 
Employee.DepartmentID= Departments.DepartmentID and
Birthday<1966 and DepartmentName = '研发部'

--查询人力资源部雇员的最高和最低工资
select max(income-outcome) 最高工资,min(income-outcome) 最低工资
from salary
where EmployeeID in	(select EmployeeID
					from Employee
					where DepartmentID in (select DepartmentID
											from Departments
											where DepartmentName = '人力资源部'))

--将各雇员的情况按工资由低到高排列
select name 姓名,income-outcome 工资
from Employee,Salary
where Employee.EmployeeID = Salary.EmployeeID
order by 工资

--求各部门的雇员数 
select DepartmentName 部门,count(Employee.DepartmentID) 雇员数
from Departments,Employee
where Departments.DepartmentID = Employee.DepartmentID
group by Employee.DepartmentID,Departments.DepartmentName

--找出所有在财务部和人力资源部工作的雇员的编号
select DepartmentName 部门,EmployeeID 雇员号
from Employee,Departments
where Departments.DepartmentID = Employee.DepartmentID
and( DepartmentName = '财务部' or DepartmentName = '人力资源部')

--统计人力资源部工资在 2500 以上雇员的人数
select count(income-outcome) 人力资源部工资在2500以上雇员人数
from salary,Departments,Employee
where Salary.EmployeeID = Employee.EmployeeID
	and Departments.DepartmentID = Employee.DepartmentID
	and DepartmentName = '人力资源部'
group by income-outcome
having income-outcome>2500

--求财务部雇员的总人数
select count(Employee.DepartmentID) 雇员数
from Departments,Employee
where Departments.DepartmentID = Employee.DepartmentID and DepartmentName = '财务部'
group by Employee.DepartmentID

--求财务部雇员的平均工资
select avg(income-outcome) 平均工资
from Departments,Employee,Salary
where Salary.EmployeeID = Employee.EmployeeID
	and Departments.DepartmentID = Employee.DepartmentID
	and DepartmentName = '财务部'

--查找比所有财务部的雇员工资都高的雇员的姓名
select name 姓名
from Departments,Employee,Salary
where Salary.EmployeeID = Employee.EmployeeID and Departments.DepartmentID = Employee.DepartmentID
	and income-outcome>all(select income-outcome
							from salary,Departments,Employee
							where Salary.EmployeeID = Employee.EmployeeID and Departments.DepartmentID = Employee.DepartmentID
							and DepartmentName = '财务部')

--查找财务部年龄不低于研发部所有雇员年龄的雇员的姓名
select name 姓名
from Departments,Employee,Salary
where Salary.EmployeeID = Employee.EmployeeID and Departments.DepartmentID = Employee.DepartmentID
	and DepartmentName = '财务部' and Birthday <any(select Birthday
													from salary,Departments,Employee
													where Salary.EmployeeID = Employee.EmployeeID
													and Departments.DepartmentID = Employee.DepartmentID
													and DepartmentName = '研发部')

--查找在财务部工作的雇员的情况 
select *
from Departments,Employee,Salary
where Salary.EmployeeID = Employee.EmployeeID
	and Departments.DepartmentID = Employee.DepartmentID
	and DepartmentName = '财务部'
