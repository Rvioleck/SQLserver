create table S
(
	SNO char(2) primary key not null,
	Sname varchar(20),
	Status char(4),
	city char(10)
)

create table P
(
	PNO char(2) primary key not null,
	PNAME varchar(20),
	COLOR char(4),
	WEIGHT int 
)

create table J
(
	JNO char(2) primary key not null,
	JNAME varchar(20),
	cCITY char(10) 
)

create table SPJ
(
	SNO char(2) not null,
	PNO char(2) not null,
	JNO char(2) not null primary key(SNO,PNO,JNO),
	QTY int 
)
alter table SPJ
add constraint SPJ_S foreign key(SNO) references S(SNO)
alter table SPJ
add constraint SPJ_P foreign key(PNO) references P(PNO)
alter table SPJ
add constraint SPJ_J foreign key(JNO) references J(JNO)

