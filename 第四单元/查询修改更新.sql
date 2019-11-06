--在 S 表中插入元组“s6，华誉，40，广州” 
insert into S values ('s6','华誉',40,'广州')
select* from S

--在 J 表中插入元组“j8，传感器厂” 
insert into J(JNO,JNAME) values('j8','传感器厂')
select* from J

--对每一个供应商，求他为各种工程供应零件的总数量，并将此结果存入数据库
create table SP_qty
(
	Sname varchar(20) primary key not null,
	qty int
)
insert into SP_qty
select Sname,sum(qty)
from S,SPJ
where S.SNO = SPJ.SNO
group by Sname
select* from SP_qty

--将 P 表中 PNO 值为 p6 的元组的 color 属性值改为绿，weight 属性值改为 60
update P set color = '绿',weight = 60
where PNO = 'P6'
select * from P

--将 SPJ 表中前 4 个元组的 qty 属性值统一修改为 300
update SPJ set qty = 300
where SNO = 'S1'
select * from SPJ

--将 S 表中 city 属性名含有“京”或“津”的相应 status 属性值增加 100 
update S set status = status+100
where city like '%京%' or city like '%津%'
select * from S

 --将供应商 s2 为“一汽”工程项目所供应的零件数量修改为 2000 
 update SPJ set QTY = 2000
 where SNO = 'S2' and JNO = (select JNO
							from J
							where JNAME = '一汽')
select * from SPJ

--将全部红色零件的颜色修改为浅红色
update P set color = '浅红'
where COLOR = '红'
select * from P

--将由 s5 供给 j4 的零件 p6 改为由 s3 供应
update SPJ set SNO = 'S3'
where SNO = 'S5' and JNO = 'J4' and PNO = 'P6'
select * from SPJ

--在 SPJ 表中新增一名为 SDATE 的属性列，对该表中的每一元组在 SDATE 属性列上填上实验当时的日期和时间
alter table SPJ
add SDATE datetime
update SPJ set SDATE = GETDATE()
select * from SPJ

--删除所在城市为“广州”的供应商记录 
delete from S where city = '广州'
select * from S

--删除所有零件名称中第一个字为“螺”字的零件记录，并在供应情况表中删除相应的记录
delete from SPJ where PNO in (select PNO
							from P
							where PNAME like '螺%')
delete from P where PNAME like '螺%'
select * from SPJ

--删除 s3 和 s4 两供应商为“三建”工程供应“螺母”或“螺丝刀”零件的相应供应情况数据信息
delete from SPJ where (SNO ='S3' or SNO = 'S4')
					and JNO = (select JNO from J where JNAME = '三建') 
					and PNO = (select PNO from P where PNAME = '螺母' or PNAME = '螺丝刀')
select * from SPJ
