--向 authors 表中插入一行作者信息（具体值自定）
insert into authors(au_id,au_lname,au_fname,phone,address,city,state,zip,contract) values('123-45-6780','Fang','yizhou','18123','XAUFE','Xi an','XA',12312,1)
select *
from authors

--数量超过 100 的商店增加 10%的折扣 
update discounts set discount=1.1*discount Where highqty>100
select*
from discounts

--删除 1994.9.14 的订单
delete from sales where ord_date = '1994-09-14'
select*
from sales

--删除 1 中所建立的索引
exec sp_helpindex authors
drop index auidind on authors

--建立 CA 州作者所著书的视图（包括作者号、姓名、所在州、书名、价格、出版日期）
create view view_authCA
as
select authors.au_id 作者号,au_lname+au_fname 姓名,state 州,titles.title 书名,price 价格,pubdate 出版日期
from titles,authors,titleauthor
where titles.title_id = titleauthor.title_id and authors.au_id = titleauthor.au_id and state = 'CA'
go
select *
from view_authCA

--建立付款方式是现金（cash）的订单视图
create view view_salecash
as
select*
from sales
where payterms like 'Net%'
select *
from view_salecash

--建立 CA 州的所有商店的视图 
create view view_storeCA
as
select *
from stores
where state = 'CA'
select *
from view_storeCA

