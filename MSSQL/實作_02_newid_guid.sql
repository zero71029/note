



-- Module 2.資料表(Tables) 的進階觀念、設計與實作
--        2-1:透過系統檢視表(system views) 查詢 Meta-Data
--        2-2:搭配 uniqueidentifier 資料類型然後藉由 NEWID()、NEWSEQUENTIALID()來產生 GUID 的值
--        2-3:關於 timestamp 與 rowversion 資料類型的使用方式 

--- SQL Server 2017/2019
--      P 4-28 檢視SQL Server資料庫物件  
--      p 7-8  其他資料類型   



-- 補充資料：引用MSND「timestamp 語法已淘汰。.. 請避免在新的開發工作中使用這項功能」
-- https://docs.microsoft.com/zh-tw/sql/t-sql/data-types/rowversion-transact-sql?view=sql-server-ver15
-- 補充資料：uniqueidentifier (Transact-SQL)
-- https://docs.microsoft.com/zh-tw/sql/t-sql/data-types/uniqueidentifier-transact-sql?view=sql-server-ver15
-- 補充資料：NEWID (Transact-SQL)
-- https://docs.microsoft.com/zh-tw/sql/t-sql/functions/newid-transact-sql?view=sql-server-ver15
-- 補充資料：NEWSEQUENTIALID (Transact-SQL)
-- https://docs.microsoft.com/zh-tw/sql/t-sql/functions/newsequentialid-transact-sql?view=sql-server-ver15




-- 10. 獲取系統資訊
--		伺服器 > 資料庫 > (任一資料庫) > 檢視 > 系統資料表
--			INFORMATION_SCHEMA 開頭的是 結構描述檢視表
--			sys 開頭的是 目錄檢視表

	select * from INFORMATION_SCHEMA.TABLES;  -- 資料表
	select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME like '%PostalCode%'; -- 資料表欄位

	select * from sys.database_files -- 資料庫的檔案在哪裡
	select name, type, type_desc from sys.objects order by type;  -- Table_Name  


-- 20. uniqueidentifier 資料類型 紀錄 全域唯一識別碼 (Globally Unique Identifier)
--		NEWID()
--		NEWSEQUENTIALID()  ==> MSDN 建議 「如果您有隱私權顧慮，請勿使用這個函數。」

select NEWID()
select NEWSEQUENTIALID()

		create table Lab.dbo.DataType_Uniqueidentifier
		(
			a uniqueidentifier,
			b uniqueidentifier default NEWSEQUENTIALID()
		);
		insert into Lab.dbo.DataType_Uniqueidentifier (a) values (newid());
		select * from Lab.dbo.DataType_Uniqueidentifier ;


-- 30. timestamp(SQL 2005) 與 rowversion(SQL 2008)
--	 (timestamp) 請測試下列語法，table 是否能夠順利被建立？

		create table Lab.dbo.Test_TS
		(
			id int,
			memo varchar(50),
			timestamp null
		)

-- 31. (rowversion) 請測試下列語法，table 是否能夠順利被建立？

		create table Lab.dbo.Test_RS
		(
			id int,
			memo varchar(50),
			apple rowversion null
		)


-- 32. 測試語法，觀察 timestamp 的欄位值變化
insert into Lab.dbo.Test_TS (id, memo)
values (1, '今天是陰天')

-- 32. 測試語法，觀察 rowversion 的欄位值變化
insert into Lab.dbo.Test_RS (id, memo)
values (11, '明天連假第一天')

-- 底下指令會死掉
insert into Lab.dbo.Test_RS (id, memo, apple)
values (12, '後天連假第二天', '777')


update Test_TS 
  set 庫存資料 = 庫存資料 - 客戶買走的數量
where 產品編號 = 1  and (庫存資料 - 客戶買走的數量) > 0

select * from Test_TS where 庫存資料 < 0

--

select * from Test_TS
