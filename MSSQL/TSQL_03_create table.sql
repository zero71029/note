



-- Module 3.資料表(Tables)的基礎觀念、設計與實作 
--        3-1:資料表的基礎觀念(包含識別欄位(IDENTITY)、SPARSE、NULL 或 NOT NULL 等重要關鍵字的使用)
--        3-2:什麼是結構描述(Schemas)
--        3-3:如何建立、修改與刪除資料表



--- SQL Server 2017/2019
--      p 6-3   識別名稱的命名原則
--      p 6-4   資料庫物件的完整名稱
--      p 6-11  建立資料庫
--      p 7-15  建立資料表 (透過指令)
--      p 7-11  建立資料表 (透過介面操作)
--      P 7-17  疏鬆欄位的使用



--- SQL Server 2016/2017
--      p 6-3   識別名稱的命名原則
--      p 6-4   資料庫物件的完整名稱
--      p 6-11  建立資料庫
--      p 7-15  建立資料表 (透過指令)
--      p 7-11  建立資料表 (透過介面操作)
--      P 7-18  疏鬆欄位的使用


-- 補充資料：CREATE TABLE
-- https://docs.microsoft.com/zh-tw/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver15
-- 補充資料：Transact-SQL 語法慣例
-- https://docs.microsoft.com/zh-tw/sql/t-sql/language-elements/transact-sql-syntax-conventions-transact-sql?view=sql-server-ver15
-- 補充資料：使用疏鬆資料行
-- https://docs.microsoft.com/zh-tw/sql/relational-databases/tables/use-sparse-columns?view=sql-server-ver15


-- 10. 建立資料庫
--		a. 資料庫節點，右鍵新增資料庫
--		b. 輸入資料庫名稱 Lab


-- 20. 試著透過指令，建立飲料店資料表 TeaShop


-- 30. 試著透過介面，建立飲料店員工資料表 TeaEmployee
--		a. 在物件總管展開 Lab 資料庫的節點
--		b. 找到 「資料表」節點，點選滑鼠右鍵出現選單，在點選選單上的「資料表」
create table TeaEmployee(
	EmpID int,
	EmpName nvarchar(50),
	EmpPhone char(10),
	EmpHome varchar(15),
	ShopCode char(5)
)

-- 31. 透過介面，設定「識別規格」和「為疏鬆」
--      a. 選擇 員工編號 欄位 > 「識別規格」 > 觀察「允許null」取消勾選
--      b. 選擇 市內電話 欄位 > 「為疏鬆」   > 設定為 是


-- 32. 透過介面產生 create 指令碼
--     TeaEmployee > 右鍵 > 編寫資料表的指令碼為 > Create至 > 新增查詢編輯視窗 
--     觀察上一個步驟透過介面的設定，產生出來的指令是那些


--CREATE TABLE [dbo].[TeaEmployee](
--	[EmpID] [int] IDENTITY(1,1) NOT NULL,
--	[EmpName] [nvarchar](50) NULL,
--	[EmpPhone] [char](10) NULL,
--	[EmpHome] [varchar](15) SPARSE  NULL,
--	[ShopCode] [char](5) NULL
--) ON [PRIMARY]
--GO


-- 40. SQL Server 2008 起預設的設定，資料表新增以後不允許直接透過介面修改
--		工具 > 選項 > 設計師(designers) > 取消「防止儲存需要資料表重建的變更」
