



-- Module 11.系統內建函數- 數學、日期與時間等函數介紹
--        11-1:數學函數  
--        11-2:日期與時間函數 
--        11-3:如何取得SQL Server主機上的日期和時間 


--- SQL Server 2017/2019


--- SQL Server 2016/2017 
--      p A-6 數學函式
--      p A-1 日期與時間函數




-- 補充資料：數學函數 (Transact-SQL)
-- https://docs.microsoft.com/zh-tw/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver15

-- 補充資料：取得 系統時間日期的範例
-- https://docs.microsoft.com/zh-tw/sql/t-sql/functions/getdate-transact-sql?view=sql-server-ver15#examples

-- 0329 補充資料：隱含及明確轉換
https://docs.microsoft.com/zh-tw/sql/t-sql/data-types/data-type-conversion-database-engine?view=sql-server-ver15#implicit-and-explicit-conversion


-- 10. 完整的數學函式庫，請參考上方的補充資料：數學函數 (Transact-SQL)
-- 11. ABS() 取絕對值
select ABS(-10)
-- 12. POWER(數值, N次方)
select POWER(9,3), 9*9*9
-- 13. RAND() 亂數 0~1 之間的數值
select RAND()




-- 20. 取得系統時間的範例，請參考補充資料：取得 系統時間日期的範例

-- 21. 請觀察下列兩兩比較，有何異同？
--		a. SYSDATETIME()、GETDATE()
--      b. GETDATE()、CURRENT_TIMESTAMP



-- 22. 透過 Year() 取得系統年
select getdate()
select YEAR(getdate())
-- 23. 透過 Month() 取得系統月份
select MONTH(getdate())
select DAY(getdate())

-- 30. 如何取得 
--     A. 北風資料庫中， 7 月份的訂單
--     B. 北風資料庫中， 1996年7月10 到 7月20 的訂單
select OrderID, OrderDate, MONTH(OrderDate) from Orders
where MONTH(OrderDate)  = 7

-- 9 筆
select OrderID, OrderDate from Orders
where YEAR(OrderDate) = 1996
  and MONTH(OrderDate)  = 7
  and DAY(OrderDate) between 10 and 20


-- 31. 直接用字串取去比較是否可行？ (O？)
select OrderID, OrderDate from Orders
where OrderDate between '1996/07/10' and '1996/07/20'

select OrderID, OrderDate from Orders
where OrderDate = '1996/07/10' 


-- 32. 請透過語法於 Lab 資料庫中建立一個資料表，並寫入今天日期
-- 33. 是否可以透過字串查詢的到今天的日期？
--     (小陷阱)
create table  Lab.dbo.Lab0329 ( d datetime )
insert into   Lab.dbo.Lab0329 (d) values (GETDATE());
select * from Lab.dbo.Lab0329
select * from Lab.dbo.Lab0329 where d = '2021/03/29'