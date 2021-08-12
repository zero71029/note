



-- Module 4.產生流水號的方法
--        4-1:透過使用資料表中的識別欄位-IDENTITY 屬性 
--        4-2:如何取得識別欄位的值:@@IDENTITY vs. SCOPE_IDENTITY vs. IDENT_CURRENT 
--        4-3:透過順序物件(Sequences) 來產生序號 


--- SQL Server 2017/2019
--      p 14-22 建立和使用順序物件 Sequence



-- 補充資料：SCOPE_IDENTITY (Transact-SQL)
-- https://docs.microsoft.com/zh-tw/sql/t-sql/functions/scope-identity-transact-sql?view=sql-server-ver15



-- 10. 比較 @@IDENTITY vs. SCOPE_IDENTITY vs. IDENT_CURRENT

	-- 10-1. 開啟一個查詢視窗A：建立兩個 table，設定 identity 欄位，並且寫入資料
	create table Lab.dbo.T1 (id int identity, memo char(2));
	create table Lab.dbo.T2 (id int identity, memo char(2));
	GO
	insert into Lab.dbo.T1 values('A1'),('A2'),('A3'),('A4'),('A5');
	insert into Lab.dbo.T2 values('B1'),('B2');
	GO


	-- 10-2. 在同樣一個查詢視窗A：執行底下SQL並觀察結果
	--  測試結果：
		USE Lab 
		go
		SELECT @@IDENTITY AS '@@IDENTITY_INPROC'
			, SCOPE_IDENTITY() AS 'SCOPEIDENTITY_INPROC'
			, IDENT_CURRENT('T1') AS 'T1_IDENTCURRENT_INPROC'
			, IDENT_CURRENT('T2') AS 'T1_IDENTCURRENT_INPROC'

	-- 10-3. 新增一個查詢視窗B：執行底下SQL， procedure 後面就會介紹到
	--   這邊為了說明 @@IDENTITY 和 SCOPE_IDENTITY() 的差異，請同學先直接執行
		USE Lab 
		go
		drop proc usp_identities
		GO

		Create procedure usp_identities 
		AS
		BEGIN
			insert into Lab.dbo.T1 values ('A6');
			insert into Lab.dbo.T2 values ('B3');
			
			SELECT @@IDENTITY AS '@@IDENTITY_INPROC'
					, SCOPE_IDENTITY() AS 'SCOPEIDENTITY_INPROC'
					, IDENT_CURRENT('T1') AS 'T1_IDENTCURRENT_INPROC'
					, IDENT_CURRENT('T2') AS 'T1_IDENTCURRENT_INPROC'
		END

	-- 10-4. 新增一個查詢視窗C：複製貼上 10-2 的 SQL並觀察結果
	--  測試結果：
		USE Lab 
		go
		SELECT @@IDENTITY AS '@@IDENTITY_INPROC'
			, SCOPE_IDENTITY() AS 'SCOPEIDENTITY_INPROC'
			, IDENT_CURRENT('T1') AS 'T1_IDENTCURRENT_INPROC'
			, IDENT_CURRENT('T2') AS 'T1_IDENTCURRENT_INPROC'

		-- 10-5. 新增一個查詢視窗D：執行底下SQL (這是執行 procedure 的方式)
        --  測試結果：
			execute usp_identities

		-- 10-6. 在查詢視窗D：執行底下SQL
		--  測試結果：
			USE Lab 
			go
			SELECT @@IDENTITY AS '@@IDENTITY_INPROC'
				, SCOPE_IDENTITY() AS 'SCOPEIDENTITY_INPROC'
				, IDENT_CURRENT('T1') AS 'T1_IDENTCURRENT_INPROC'
				, IDENT_CURRENT('T2') AS 'T1_IDENTCURRENT_INPROC'


-- 20. Sequences
--		資料庫 > 可程式性 > 順序 > 右鍵 > 新增順序 > seq_Test
--		資料庫 > 可程式性 > 順序 > seq_Test > 右鍵 > 編寫順序的指令碼為 > Create


	-- 執行底下語法新增 table，測試 identity 和 sequences 取號與跳號情形
	create table Lab.dbo.T3
	(
		ID int identity(1,1) not null,
		SEQ int null, 
		Memo varchar(50) null,
		CreateDate datetime
	)


	-- 20-1. 測試結果：
	insert into Lab.dbo.T3 (ID) values(1);
	select * from Lab.dbo.T3;

	-- 20-2. 測試結果：
	insert into Lab.dbo.T3 (memo) values('測試ID是否有取號');
	select * from Lab.dbo.T3;

	-- 20-3. 測試結果：
	insert into Lab.dbo.T3 (CreateDate) values('abc');

	-- 20-4. 測試結果：
	insert into Lab.dbo.T3 (memo) values('測試ID是否取號');
	select * from Lab.dbo.T3;

	-- 20-5. 測試結果：
	insert into Lab.dbo.T3 (ID, SEQ) values(1, next value for seq_test);
	select * from Lab.dbo.T3;

	-- 20-6. 測試結果：
	insert into Lab.dbo.T3 (SEQ) values(next value for seq_test);
	select * from Lab.dbo.T3;

	-- 20-7. 測試結果：
	insert into Lab.dbo.T3 (SEQ,CreateDate) values(next value for seq_test,'abc');
	select * from Lab.dbo.T3;

	-- 20-8. 測試結果：
	insert into Lab.dbo.T3 (SEQ,memo) values(next value for seq_test,'測試SEQ是否取號');
	select * from Lab.dbo.T3;

	-- 20-9. 測試結果：
	select next value for seq_test

	-- 20-10. 測試結果：
	ALTER SEQUENCE SEQ_TEST RESTART WITH 1

	-- 20-11. 測試結果：
	SELECT current_value FROM sys.sequences WHERE name = 'SEQ_TEST' ;

	-- 20-12. 測試結果：
	insert into Lab.dbo.T3 (SEQ,memo) values(next value for seq_test,'測試重新開始');
	select * from Lab.dbo.T3;
