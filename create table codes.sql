create table Authors
(
	au_id varchar(12) primary key not null constraint id check(au_id like '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	au_lname varchar(40) not null,
	au_fname varchar(20) not null,
	phone char(20) not null,
	address varchar(40),
	city varchar(20),
	state char(2),
	zip char(5) check(zip like '[0-9][0-9][0-9][0-9][0-9]'),
	contract bit not null,
)

create table Stores
(
	stor_id char(4) primary key not null,
	stor_name varchar(40),
	stor_address varchar(40),
	city varchar(20),
	state char(2),
	zip char(5),
)

create table Discounts
(
	discounttype varchar(40) not null,
	stor_id char(4),
	lowqty smallint,
	hightqty smallint,
	discount float not null,
)
alter table Discounts
add constraint stor_id foreign key(stor_id) references stores(stor_id)

create table Jobs
(
	job_id smallint primary key not null,
	job_desc varchar(50) not null,
	min_lvl tinyint check(min_lvl >= 10),
	max_lvl tinyint check(max_lvl <= 250),
)

create table Employee
(
	emp_id varchar(10) primary key not null check(emp_id LIKE '[A-Z][A-Z][A-Z][1-9][0-9][0-9][0-9][0-9][FM]' or emp_id LIKE '[A-Z]-[A-Z][1-9][0-9][0-9][0-9][0-9][FM]'),
	fname varchar(20) not null,
	minit char(1),
	lname varchar(30) not null,
	job_id smallint not null default 1,
	job_lvl tinyint not null default 10,
	pub_id char(4) not null default '9952',
	hire_date datetime not null default getdate(),
)
alter table Employee
add constraint job_id foreign key(job_id) references jobs(job_id)


create table publishers
(
	pub_id char(4) primary key not null check(pub_id = '1756' OR (pub_id = '1622' OR (pub_id = '0877' OR (pub_id = '0736' OR (pub_id = '1389')))) OR (pub_id LIKE '99[0-9][0-0]')),
	pub_name varchar(40) ,
	city varchar(20),
	state char(2),
	country varchar(30),
)

create table pub_info
(
	pub_id char(4) primary key not null,
	Logo image,
	pr_info text,
)
alter table pub_info
add constraint p_pi foreign key(pub_id) references publishers(pub_id)

create table titles
(
	title_id varchar(10) primary key not null,
	title varchar(80) not null,
	type char(12) not null,
	pub_id char(4),
	price money,
	advance money,
	royalty int,
	ytd_sales int,
	notes varchar(200),
	pubdate datetime not null,
)
alter table titles
add constraint t_p foreign key(pub_id) references publishers(pub_id)

create table Roysched
(
	title_id varchar(10) not null,
	lorange int,
	hirange int,
	royalty int,
)
alter table roysched
add constraint r_t foreign key(title_id) references titles(title_id)

create table titleauthor
(
	au_id varchar(12) not null constraint idd check(au_id like '[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	title_id varchar(10) not null primary key(au_id,title_id),
	au_ord tinyint,
	royaltyper int,
)
alter table titleauthor
add constraint ta_t foreign key(title_id) references titles(title_id)
alter table titleauthor
add constraint ta_a foreign key(au_id) references authors(au_id)
