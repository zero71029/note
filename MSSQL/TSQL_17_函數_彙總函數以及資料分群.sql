 
 


-- Module 17.資料的分群以及彙總函數的使用
--        17-1:使用 彙總函數(Aggregate Functions)
--        17-2:使用 GROUP BY 子句與 HAVING 子句
--        17-3:SELECT敘述的進階查詢–使用 TOP 以及 OFFSET-FETCH 來篩選資料


--- SQL Server 2017/2019
--      p 8-25  群組查詢 group by 字句
--      p 9-26  OFFSET 子句
--      p 8-8   TOP 子句 
--      p 8-21  聚合函數



--- SQL Server 2016/2017 
--      p 8-25  群組查詢 group by 字句
--      p 9-26  OFFSET 子句
--      p 8-8   TOP 子句 
--      p 8-21  聚合函數



-- 補充資料 彙總函式
--https://docs.microsoft.com/zh-tw/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-ver15

-- 補充資料 SELECT 陳述式的邏輯處理順序
--https://docs.microsoft.com/zh-tw/sql/t-sql/queries/select-transact-sql?view=sql-server-ver15#logical-processing-order-of-the-select-statement



-- 10. 統計供應商資料表中有幾個供應商？
--		練習 COUNT() 函式




-- 11. 透過供應商地區 (Region) 欄位
--     比較 distinct 和 count()
--     (小陷阱)問題：count() 是否有統計到 null ?




-- 20. 統計供應商來自那些國家 (Country)
--		透過 group by 語法 分組彙總




-- 21. 統計每個地區 (Region)有多少供應商
--		Null 是否會自己形成一個群組？



-- 22. 延續20，如何針對統計結果篩選，我想要找統計後數量大於1的國家？
--		透過 having 語法



-- 25. 延續20，統計後如何取得國家數量較多的第一名和第二名?
--		討論 top 數量 、top 數量 .. with ties




-- 30. having 是否可以使用欄位別名
--	   小複習：SELECT 陳述式的邏輯處理順序




-- 40. 關於平均值 Avg() 函式使用上的注意事項

