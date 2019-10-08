/*查询书名以 T 开头或者出版社号为 0877，而且价格大于 16 的书的信息*/
select *
from titles
where (title like 'T%' or pub_id = '0877') and price > 16;

/*按照类型的升序和价格的降序（在类型相同时）显示书的信息（书名、作者、出版社、类型、价格）*/
select titles.title '书名',au_lname+au_fname '作者姓名',pub_name '出版社名称', titles.type '类型',titles.price '价格'
from titles, publishers, authors, titleauthor
where titles.pub_id = publishers.pub_id and titles.title_id = titleauthor.title_id and titleauthor.au_id = authors.au_id
order by type,price desc;

/*查询销售量大于 30 的书名及销售数量 */
select title '书名',sum(qty) '销售数量'
from sales,titles
where qty>30 and titles.title_id = sales.title_id
group by title;

/*查询在 1990.1.1 到 2000.12.31 间，每本书的销售总额 */
select title '书名',sum(qty)*price '销售总额'
from sales, titles
where titles.title_id = sales.title_id and ord_date between '1990-1-1' and '2000-12-31'
group by title,price

/*查询所有作者的所在城市和州名，要求没有重复信息*/
select au_lname+au_fname '作者姓名',city '城市名', state '州名'
from authors 

/*计算多少种书已被订价 */
select count(title) '已定价书总数'
from sales,titles
where sales.title_id = titles.title_id and price!=0

/*查询每本书的书名、作者及它的售书总量*/
select title'书名',au_lname+au_fname '作者姓名',sum(qty) '售书总量'
from titles,sales,authors,titleauthor
where titles.title_id = sales.title_id and titles.title_id = titleauthor.title_id and titleauthor.au_id = authors.au_id
group by title,au_lname,au_fname

/*计算所有书的平均价格 */
select avg(price) 平均价格 --未算未定价书
from titles

/*查询价格最高的书的书名、作者及价格 */
select title 书名,au_lname+au_fname '作者姓名', max(price) 价格
from titles,authors,titleauthor
where titles.title_id = titleauthor.title_id and authors.au_id = titleauthor.au_id and price=(select max(price) from titles)
group by title,au_lname,au_fname

