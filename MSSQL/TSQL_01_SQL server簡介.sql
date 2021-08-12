



--Module 1.關聯式資料庫的基本概念與 SQL Server 簡介
--       1-1:關聯模型與關聯運算子(operators)
--       1-2:SQL 指令的分類-DDL、DML、DCL
--       1-3:SQL Server 開發工具簡介



--- SQL Server 2017/2019
--      p 6-1   SQL 結構化查詢語言
--      p 1-2   資料庫系統的基礎
--      p 2-6   關聯式資料庫模型
--      p 2-15  關聯式代數
--      p 4-5   工具 (Tools)
--      p 4-17  SQL Server 管理工具的使用
--      p 6-5   SQL語言的指令種類



--- SQL Server 2016/2017
--      p 6-1   SQL 結構化查詢語言
--      p 1-2   資料庫系統的基礎
--      p 2-6   關聯式資料庫模型
--      p 2-15  關聯式代數
--      p 4-5   工具 (Tools)
--      p 4-15  SQL Server 管理工具的使用
--      p 6-5   SQL語言的指令種類



-- 補充資料：結構化查詢語言 (SQL) (Structured Query Language (SQL))
-- https://docs.microsoft.com/zh-tw/sql/odbc/reference/structured-query-language-sql?view=sql-server-ver15
-- 補充資料：DML, DDL, DCL, TCL
-- https://social.technet.microsoft.com/wiki/contents/articles/34477.sql-server-commands-dml-ddl-dcl-tcl.aspx
-- 補充資料：使用 SQL Server Management Studio (SSMS) 連線至 SQL Server 執行個體並進行查詢
-- https://docs.microsoft.com/zh-tw/sql/ssms/tutorials/connect-query-sql-server?view=sql-server-ver15



-- 環境設定：
-- . 工具 → 選項 → 環境 → 字型和色彩 → 字型
-- . 工具 → 選項 → 環境 → 字型和色彩 → 大小
-- . 工具 → 選項 → 文字編輯器 → Transact-SQL → 行號
-- . 檢視 → 物件總管



-- 匯入資料表
--   A. Northwind：底下指令可以開啟後直接執行
--      DB_File\Northwind & Pubs Script\instnwnd.sql


--   B. AdventureWorks：請依照底下步驟進行
--		1. 把全部的檔案放到 C:\Samples\AdventureWorks
--		2. 在資料夾內找到 instawdb.sql 然後打開
--		3. 點選 查詢 > SQLCMD 模式
