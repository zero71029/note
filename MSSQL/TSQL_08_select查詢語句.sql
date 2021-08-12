



-- Module 8.撰寫簡易的 SELECT 查詢語句
--       8-1:SELECT 查詢語句
--       8-2:使用欄位(Column) 的別名
--       8-3:使用 DISTINCT

--- SQL Server 2017/2019
--      p 8-1  select 查詢指令
--      p 8-10 from 子句


--- SQL Server 2016/2017
--      p 8-1  select 查詢指令
--      p 8-10 from 子句


-- 補充資料：SELECT
-- https://docs.microsoft.com/zh-tw/sql/t-sql/queries/select-transact-sql?view=sql-server-ver15
-- 補充資料：SQL Server 公用程式陳述式 - GO #Remarks
--https://docs.microsoft.com/zh-tw/sql/t-sql/language-elements/sql-server-utilities-statements-go?view=sql-server-ver15#remarks



-- 10. 練習：指定需要使用的資料庫 (use 資料庫名稱)
--use Lab


-- 20. 觀察 go 指令，請框選底下三行程式碼，觀察結果
	declare @x int = 100
	print @x
	go

-- 25. 觀察 go 指令，請框選底下四行程式碼，觀察結果
	declare @x int = 100
	print @x
	go

	print @x

-- 30. go 加上數值，表示指令送出前要執行幾次
--     請框選底下這段程式碼，觀察結果 (框選的區間有點大，請確認後再執行)
	-- use Lab
	-- go

	-- 創建資料表
	create table TestGO
	(
		mydatetime datetime
	)
	go
 
	-- 新增資料
	insert into TestGO values(SYSDATETIME())
	go 10

	-- 查詢資料表
	select * from TestGO
 
	-- 刪除資料表
	drop table TestGO


-- 40. 一份資料表完整的路徑是：伺服器名稱.資料庫名稱.結構描述.資料表名稱
	select * from Northwind.dbo.Employees;
	select * from AdventureWorks.Sales.SalesPerson;



-- 50. select 語法結構練習
select getdate(), SYSDATETIME()

--	0329 討論 2021-03-29 11:34:44.9877420 是否能寫入到 date 資料格式的欄位中?
--		Ans: OK!
--    create table apple ( d date )
--    insert into  apple (d) values (  SYSDATETIME() );
--    select * from apple;
--    drop table apple;


-- 55. 以供應商資料表(Suppliers)為例子，練習挑選聯絡資訊等欄位
select SupplierID, CompanyName from Northwind.dbo.Suppliers

-- 60. 欄位別名，觀察將兩個欄位合併後，查詢結果該欄位是否還有名稱？
--	   以合併供應商資料表的國家(Country)-城市(City)為例子
select CompanyName, Country, City 
  from Northwind.dbo.Suppliers

-- 透過 as 給資料行另外一個名稱
select CompanyName, Country + '-' + City as 'Area'
  from Northwind.dbo.Suppliers;


-- 沒有 as 也OK，但是一開始看有可能會看錯
select CompanyName, Country + '-' + City  'Area'
  from Northwind.dbo.Suppliers;



-- 70. distinct 取得不重複的資料
--		供應商來自那些國家？  29
select * from  Northwind.dbo.Suppliers
select Country from  Northwind.dbo.Suppliers
-- 這邊只會剩下 16 筆資料
select distinct Country from  Northwind.dbo.Suppliers
-- 這邊還是有 29 筆資料，因為真的沒有重複的。
select distinct Country, City from  Northwind.dbo.Suppliers

-- 80. order by 挑選指定的欄位進行排序
--		挑選供應商資料表的欄位進行排序的練習
--      公司名稱(CompanyName)、聯絡名稱(ContactName)、電話(Phone)
--		asc 遞增, desc 遞減
select ContactTitle, ContactName, CompanyName, Phone from Suppliers
order by ContactTitle, ContactName

-- 85. 指定資料表回傳的 開始資料列 以及 資料筆數 
--		以供應商資料表為例子，指定每次回傳5筆資料

select * from Suppliers;

select * from Suppliers 
order by SupplierID offset 10 ROWS
FETCH NEXT 5 ROWS ONLY

--      ORDER BY 資料列
--		OFFSET 數值 ROWS FETCH NEXT 筆數 ROWS ONLY


