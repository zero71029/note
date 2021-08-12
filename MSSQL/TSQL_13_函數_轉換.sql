 
 


-- Module 13.系統內建函數- 轉換函數介紹
--        13-1:CAST()、 CONVERT() 以及 PARSE() 
--        13-2:TRY_CAST()、TRY_CONVERT() 以及 TRY_PARSE() 
--        13-3:常見的轉換問題 

--- SQL Server 2017/2019
--      p 13-19 類型轉換運算子 


--- SQL Server 2016/2017 
--      p 13-19 類型轉換運算子




-- 補充資料：隱含的轉換對照
--https://docs.microsoft.com/zh-tw/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#implicit-conversions
-- 補充資料：時間日期格式對照
--https://docs.microsoft.com/zh-tw/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15#date-and-time-styles
-- 補充資料：PARSE (Transact-SQL)
--https://docs.microsoft.com/zh-tw/sql/t-sql/functions/parse-transact-sql?view=sql-server-ver15


-- 10. CAST()、 CONVERT() 以及 PARSE() 轉換的討論和比較
--     CAST    ( expression AS data_type [ ( length ) ] ) 
--     CONVERT ( data_type [ ( length ) ] , expression [ , style ] ) 
--     PARSE   ( string_value AS data_type [ USING culture ] )  


--		a. 數值的轉換比較
--		b. 日期的轉換比較
--		c. PARSE() 可以指定語系
select CAST('123' as int)
select CONVERT(int, '123')

select CAST(getdate() as varchar(100))        -- 03 30 2021 10:51AM
select CONVERT(varchar(100), GETDATE(), 112)  -- 20210330
select CONVERT(varchar(100), GETDATE(), 111)  -- 2021/03/30
-- 110年3月31日
select CONCAT((YEAR(getdate()) -1911), '年', MONTH(getdate()), '月',DAY(getdate()), '日' )


-- en-US   
select PARSE('19/12/31' as datetime using 'zh-TW')
select PARSE('12/31/19' as datetime using 'en-US')


-- 20. TRY_CAST()、TRY_CONVERT() 以及 TRY_PARSE() 
select CONVERT(int, '123')
select CONVERT(int, 'apple')
select CONVERT(int, null)

select SupplierID, PostalCode from Suppliers where TRY_CONVERT(int, PostalCode) is null
select SupplierID, CONVERT(int, PostalCode) from Suppliers
select SupplierID, TRY_CONVERT(int, PostalCode) from Suppliers


-- 30. CONVERT() 指定轉換的時間日期格式
Select CONVERT(varchar(100), GETDATE(), 0)  ; -- 12 31 2022 11:49AM
Select CONVERT(varchar(100), GETDATE(), 1)  ; -- 12/31/22
Select CONVERT(varchar(100), GETDATE(), 2)  ; -- 22.12.31
Select CONVERT(varchar(100), GETDATE(), 3)  ; -- 31/12/22
Select CONVERT(varchar(100), GETDATE(), 4)  ; -- 31.12.22
Select CONVERT(varchar(100), GETDATE(), 5)  ; -- 31-12-22
Select CONVERT(varchar(100), GETDATE(), 6)  ; -- 31 12 22
Select CONVERT(varchar(100), GETDATE(), 7)  ; -- 12 31, 22
Select CONVERT(varchar(100), GETDATE(), 8)  ; -- 11:49:11
Select CONVERT(varchar(100), GETDATE(), 9)  ; -- 12 31 2022 11:49:11:160AM
Select CONVERT(varchar(100), GETDATE(), 10) ; -- 12-31-22
Select CONVERT(varchar(100), GETDATE(), 11) ; -- 22/12/31
Select CONVERT(varchar(100), GETDATE(), 12) ; -- 221231
Select CONVERT(varchar(100), GETDATE(), 13) ; -- 31 12 2022 11:49:11:160
Select CONVERT(varchar(100), GETDATE(), 14) ; -- 11:49:11:160
Select CONVERT(varchar(100), GETDATE(), 20) ; -- 2022-12-31 11:49:11
Select CONVERT(varchar(100), GETDATE(), 21) ; -- 2022-12-31 11:49:11.160
Select CONVERT(varchar(100), GETDATE(), 22) ; -- 12/31/22 11:49:11 AM
Select CONVERT(varchar(100), GETDATE(), 23) ; -- 2022-12-31
Select CONVERT(varchar(100), GETDATE(), 24) ; -- 11:49:11
Select CONVERT(varchar(100), GETDATE(), 25) ; -- 2022-12-31 11:49:11.160
Select CONVERT(varchar(100), GETDATE(), 100); -- 12 31 2022 11:49AM
Select CONVERT(varchar(100), GETDATE(), 101); -- 12/31/2022
Select CONVERT(varchar(100), GETDATE(), 102); -- 2022.12.31
Select CONVERT(varchar(100), GETDATE(), 103); -- 31/12/2022
Select CONVERT(varchar(100), GETDATE(), 104); -- 31.12.2022
Select CONVERT(varchar(100), GETDATE(), 105); -- 31-12-2022
Select CONVERT(varchar(100), GETDATE(), 106); -- 31 12 2022
Select CONVERT(varchar(100), GETDATE(), 107); -- 12 31, 2022
Select CONVERT(varchar(100), GETDATE(), 108); -- 11:49:11
Select CONVERT(varchar(100), GETDATE(), 109); -- 12 31 2022 11:49:11:160AM
Select CONVERT(varchar(100), GETDATE(), 110); -- 12-31-2022
Select CONVERT(varchar(100), GETDATE(), 111); -- 2022/12/31
Select CONVERT(varchar(100), GETDATE(), 112); -- 20221231
Select CONVERT(varchar(100), GETDATE(), 113); -- 31 12 2022 11:49:11:160
Select CONVERT(varchar(100), GETDATE(), 114); -- 11:49:11:160
Select CONVERT(varchar(100), GETDATE(), 120); -- 2022-12-31 11:49:11
Select CONVERT(varchar(100), GETDATE(), 121); -- 2022-12-31 11:49:11.160
Select CONVERT(varchar(100), GETDATE(), 126); -- 2022-12-31T11:49:11.160
