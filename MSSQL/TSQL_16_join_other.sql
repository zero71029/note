 
 


-- Module 16.多表格聯結(Join) 的變形查詢語法
--       16-1:外部聯結(Outer Joins) 
--       16-2:交叉聯結(Cross Joins)
--       16-3:自我聯結(Self-Joins)


--- SQL Server 2017/2019
--      p 9-4   外部合併查詢
--      p 9-14  交叉合併查詢
--      p 9-10  自身合併查詢


--- SQL Server 2016/2017 
--      p 9-4   外部合併查詢
--      p 9-14  交叉合併查詢
--      p 9-10  自身合併查詢


-- 外部連結 ==> outer joins ==> SQL 語法：left join / right join / full join
-- 交叉聯結 ==> cross joins ==> SQL 語法：cross join
-- 自我聯結 ==> self-joins  ==> SQL 語法：無，這是資料表自己join自己


	-- 0330 - 討論 join 關鍵字
		--use Lab
		--go

		create table a (aid int);
		create table b (bid int);

		insert into a (aid) values (1);
		insert into a (aid) values (2);
		insert into a (aid) values (3);
		insert into a (aid) values (4);
		insert into a (aid) values (5);

		insert into b (bid) values (4);
		insert into b (bid) values (5);
		insert into b (bid) values (6);
		insert into b (bid) values (7);
		insert into b (bid) values (8);

		select * from a;

		select * from a left join  b on a.aid = b.bid
		select * from a right join b on a.aid = b.bid
		select * from a       join b on a.aid = b.bid
		select * from a inner join b on a.aid = b.bid
		select * from a full  join b on a.aid = b.bid
		--
		select * from a cross join b 


-- 10. 我們想要找註冊以後卻從未下過訂單的客戶
--     進行行銷動作，該如何挑選對應資料？
--	   先用統計的方式進行資料確認，再進行比對動作
select distinct CustomerID from Orders
select CustomerID from Customers

-- 底下select 討論用，不能跑
-- select * from Orders   join   Customers ;

select distinct o.CustomerID as '訂單CustomerID'
              , c.CustomerID as '客戶CustomerID'
  from Orders as o 
right join  Customers as c on o.CustomerID = c.CustomerID
where o.CustomerID is null


-- 15. 老闆的指示：我想要知道那些客戶是「最有貢獻的」
--		小陷阱：收到這樣的需求，你會怎麼執行呢？
-- 統計 => 時間


-- 20. "假設" 北風資料庫中，產品資料表(Products) 和 產品類別資料表(Categories) 目前沒有關聯
--		如果每一個產品類別都包含所有於產品資料表的品項，該如何得到這樣的資料?
select ProductID, ProductName, Categories.CategoryID, CategoryName 
from Products cross join Categories


-- 30. 觀察 Employees 資料表可以知道，員工的主管也包含在其中；
--		請幫忙整理出員工以及員工的主管姓名
