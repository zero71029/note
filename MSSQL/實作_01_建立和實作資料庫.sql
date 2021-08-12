



-- Module 1.建立與實作資料庫
--        1-1:如何建立與刪除資料庫
--        1-2:如何卸離與附加資料庫
--        1-3:如何匯入與匯出資料


--- SQL Server 2017/2019
--      p  6-7 資料庫檔案與檔案群組 
--      p 6-11 建立使用者資料庫               
--      p 6-13 建立使用者資料庫(使用指令)     
--      p 6-26 刪除使用者資料庫               
--      p 6-27 資料庫的卸離與附加      
              


-- 補充資料：資料庫檔案與檔案群組
-- https://docs.microsoft.com/zh-tw/sql/relational-databases/databases/database-files-and-filegroups?redirectedfrom=MSDN&view=sql-server-ver15



-- 10. 如何卸離與附加資料庫
--		不同版本的資料庫會有怎麼樣的影響？


-- 11. 卸離資料庫
--		a. 選取資料庫 > 右鍵 > 工作 > 卸離資料庫 > 確定
--		b. 資料庫會從管理介面消失，是否真的不見？


-- 12. 附加資料庫
--		伺服器 > 資料庫 > 右鍵 > 附加 > 要附加的資料庫 > 加入 > 選擇檔案位置



-- 20. 建立資料庫
--		伺服器 > 資料庫 > 右鍵 > 新增資料庫
--			檔案種類詳細請參考上方的【補充資料：資料庫檔案與檔案群組】



-- 21. 刪除資料庫，在 SSMS 管理介面中的刪除，是哪一種刪除？
--		a. 不再管理
--		b. 實體刪除




-- 30. 匯出的 Script 語法
--		 要匯出的資料庫名稱上 > 右鍵 > 工作 > 產生指令碼
--				設定指令碼編寫選項 > 進階 > 要編寫指令碼的資料類型
--				設定指令碼編寫選項 > 進階 > 針對伺服器版本編寫指令碼
--				設定指令碼編寫選項 > 進階 > 編寫 Drop 和 Create 的指令碼


-- 31. 匯入資料
--		 要匯入的資料庫名稱上 > 右鍵 > 工作 > 匯入資料
--		 資料來源 > Microsoft Excel (課堂上操作以匯入台灣郵遞區號Excel為測試，故選擇Excel)
--		 目的地   > SQL Server Native Client 版次
--					選擇成功的話，預設的伺服器是本機
--		 將匯入的資料資料表名稱定義為 ZipCode


-- 40. 挑選匯入的郵遞區號，並且 order by 縣市名稱，觀察排序
select * from ZipCode order by 縣市名稱


-- 41. 查詢資料庫定序方法 DATABASEPROPERTYEX( 資料庫名稱, 'collation' )
select DATABASEPROPERTYEX('Lab','collation');


-- 42. 查詢目前資料庫可以使用的定序方式有哪些 fn_helpcollations()
select * from fn_helpcollations();


-- 43. 改用指定定序 ( Collate Chinese_Taiwan_Bopomofo_CI_AI )
select * from ZipCode order by 縣市名稱
select * from ZipCode order by 縣市名稱 Collate Chinese_Taiwan_Bopomofo_CI_AI
