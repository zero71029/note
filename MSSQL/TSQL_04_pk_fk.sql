



-- Module 4.使用Keys條件約束(Constraints)來實作資料的完整性 
--       4-1:PRIMARY KEY 條件約束
--       4-2:FOREIGN KEY 條件約束
--       4-3:UNIQUE 條件約束



--- SQL Server 2017/2019
--      p 2-21 主鍵   - primary key
--      p 2-22 外來鍵 - foreign key
--      p 7-19 Memo   - primary key 和 UNIQUE


--- SQL Server 2016/2017
--      p2-22 主鍵   - primary key
--      p2-23 外來鍵 - foreign key
--      p7-15 Memo   - primary key 和 UNIQUE


-- 補充資料：建立主索引鍵
-- https://docs.microsoft.com/zh-tw/sql/relational-databases/tables/create-primary-keys?view=sql-server-ver15
-- 補充資料：建立外部索引鍵關聯性
-- https://docs.microsoft.com/zh-tw/sql/relational-databases/tables/create-foreign-key-relationships?view=sql-server-ver15
-- 補充資料：UNIQUE 條件約束 
-- https://docs.microsoft.com/zh-tw/sql/relational-databases/tables/unique-constraints-and-check-constraints?view=sql-server-ver15#Unique


-- 10. 定義 primary key  主索引鍵
--      透過介面設定 TeaShop 的主索引鍵
--		步驟：TeaShop 資料表 > 設計 > 選擇一個欄位 > (上方工具列) 設定主索引鍵


-- 20. 定義 foreign key 外部索引鍵
--      透過介面設定 TeaEmployee 資料表
--      TeaEmployee 資料表中，店鋪代號是外來鍵
--		步驟：TeaEmployee 資料表 > 設計 > (上方工具列) 關聯性


-- 30. 不允許出現重複值 UNIQUE
--      「假設」員工的手機不允許重複
--      步驟：TeaEmployee 資料表 >  設計 > 選擇一個欄位 > 
--                右鍵 > 索引/索引鍵 > (加入) > 
--                一般/型別  > (下拉) 唯一索引鍵 > 
--                一般/資料行> 選擇要設定的欄位 >
--                確認資料行 > 關閉
