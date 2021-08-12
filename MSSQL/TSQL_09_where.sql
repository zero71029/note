 
 


-- Module 9.基本資料的查詢與篩選
--        9-1:使用 WHERE 子句來篩選資料
--        9-3:使用 like 搭配萬用字元(Wildcard characters)來比對字串資料
--        9-2:T-SQL中運算子執行的優先序

--- SQL Server 2017/2019
--      p 8-11 where 子句
--      p 13-15 運算式與運算子 - 運算子的優先順序

--- SQL Server 2016/2017
--      p 8-11 where 子句
--      p 13-5 運算式與運算子 - 運算子的優先順序


-- 補充資料：運算子優先順序
--https://docs.microsoft.com/zh-tw/sql/t-sql/language-elements/operator-precedence-transact-sql?view=sql-server-ver15


-- 10. 請挑選國家(Country)來自日本(Japan)的供應商
--		討論有單引號和沒有單引號的差異

-- 錯誤: 無效的資料行名稱 'Japan'
select * from Suppliers where Country = Japan

-- OK!
select * from Suppliers where Country = 'Japan'

-- 找到三筆資料
select * from Suppliers where SupplierID = 1 or Country = 'Japan';

-- 這樣也OK! 但是資料型態要注意
select * from Suppliers where SupplierID = '1';


-- 15. 請挑選 ContactTitle = 'Sales Manager'
--     且國家來自 'France' 或者 'Germany'
--     有多個條件時，and 表示兩個條件都要成立，or 表示擇一成立
--     (小陷阱)

select SupplierID, ContactTitle,  Country
 from Suppliers 
where ContactTitle = 'Sales Manager'
  and ( Country = 'France' or Country = 'Germany' )

select SupplierID, ContactTitle,  Country
 from Suppliers 
where ContactTitle = 'Sales Manager'
  and Country in ('France', 'Germany')


-- 20. 練習使用 like 搜尋資料
--		只知道資料的部分內容時，可以透過 like 進行模糊比對
select Country from Suppliers where Country like 'U%'  -- 開頭
select Country from Suppliers where Country like '%N'  -- 結尾
select Country from Suppliers where Country like '%A%' -- 包含

select Country from Suppliers where Country like '[JU]%' 
select Country from Suppliers where Country like '[J-U]%' 

-- 25. 練習使用區間的範圍取得：供應商編號介於 3 到 7 之間的
--		between .. and 
select * from Suppliers 
where SupplierID between 3 and 7

select * from Suppliers 
where  SupplierID = 3 or SupplierID = 4 or SupplierID = 5 or SupplierID = 6 or SupplierID = 7


-- 29. 練習搜尋同一資料行中的多重值：供應商城市在大阪(Osaka)或東京(Tokyo)
--      in (...)
select SupplierID, City from Suppliers 
where City in ('Osaka', 'Tokyo')


-- 30. 試著挑選出 DataType_Varchar 資料表中
--      包含 凃 的資料
insert into DataType_Varchar(c, nc, v, nv) values ('堃','堃','堃','堃');

select * from Lab.dbo.DataType_Varchar where nc = N'凃';
