/*查询所有作者的作者号、姓名信息*/
select au_id 作者号,au_lname+au_fname '作者姓名'  
from authors;

/* 查询所有作者的姓名、作者号信息，并在每个作者的作者号前面显示字符串“身份
证号：”，表明显示的信息是身份证信息 */
select '身份证号：',au_id 作者号,au_lname+au_fname '作者姓名'   
from authors;

/* 查询在 CA 州的作者姓名和城市*/
select au_id,city
from authors
where state='CA';

/*查询出版日期在 2000.1.1-2000.12.31 之间的书名和出版日期*/
select title,pubdate
from Titles
where pubdate between '2000-01-01' and '2000-12-31';

/*查询每个出版社出版的书*/
select pub_name 出版社名,title 书名
from Titles,Publishers
where Titles.pub_id = Publishers.pub_id;

/*查询某店销售某书的数量*/
select stor_name '商店名', title '书名', sum(qty) '售书数量'
from Sales,Titles,Stores
where Sales.stor_id=Stores.stor_id and Sales.title_id=Titles.title_id
group by title,stor_name;

/* 查询有销售记录的所有书信息（书号、书名、类型和价格等） */
select sales.title_id 书号,title 书名,type 类型,price 价格
from sales,titles
where sales.title_id = titles.title_id and qty!=0

/* 显示所有的书名*/
select distinct title '书名'
from titles

/*查询有销售记录的所有书信息（书号、书名、类型和价格等*/
select distinct sales.title_id '书号',title '书名',titles.type '类型',price '价格'
from Sales,Titles
where Sales.title_id = Titles.title_id;


/*查询所有出版商业（business）书籍的出版社的名称*/
select distinct pub_name '出版社名称'
from sales,titles,publishers
where sales.title_id = titles.title_id and titles.pub_id = publishers.pub_id and sales.qty!=0
