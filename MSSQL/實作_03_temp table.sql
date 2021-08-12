


-- Module 3.暫存資料表(Temporary Table)與通用資料表運算式(Common Table Expressions, CTE)的使用
--        3-1: #  區域暫存資料表(Local Temporary Tables) 
--        3-2: ## 全域暫存資料表(Global Temporary Tables)
--        3-3:    使用通用資料表運算式(Common Table Expressions)


--- SQL Server 2017/2019
--      p 7-33 暫存資料表的建立         
--      p 9-29 CTE 一般資料表運算式     


--- SQL Server 2016/2017
--      p 7-35 暫存資料表的建立        
--      p 9-29 CTE 一般資料表運算式    




-- 10. 建立並測試 Local Temporary Tables：#LabCategories
--	透過 select into 語法
 -- 將 Northwind 資料庫中 的 Categories 資料表寫入到 Lab 資料庫
 select * into #LabCategories from Northwind.dbo.Categories
 select * from #LabCategories
 insert into   #LabCategories (CategoryName)  values ('Pizza')

-- 11. 建立完畢後，請測試寫入資料至#LabCategories，是否有錯誤訊息？
--     Ans: 如果有指定 CategoryID 會有錯誤訊息

-- 13. 請新增一個查詢視窗，是否還能查到 #LabCategories? 
--     Ans: 無法!


-- 20. 建立並測試 Global Temporary Tables：##LabShippers
-- 透過 Northwind 資料庫中 的 Shippers 資料表
 select * into ##LabShippers from Northwind.dbo.Shippers
 select * from ##LabShippers

-- 21. 請新增一個查詢視窗，是否還能查到 ##LabShippers? 



-- 30. 使用 CTE 進行遞迴查詢
--  一般資料表運算式 (Common Table Expressions)
--  簡單來說，就是建立一個暫存資料表給予該次查詢使用，改查詢使用後，將會自動釋放

--  with cte_table_name (欄位1, 欄位2..) as
--  (
--  	--查詢語法
--  ) 
--  select * from cte_table_name

-- 31. 測試透過 with 關鍵字 建立員工資料表

-- (cat) 如果欄位想要換一個名稱的話，可以自己安排
with apple (cat) as (
	select FirstName from Northwind.dbo.Employees
)
select * from apple


