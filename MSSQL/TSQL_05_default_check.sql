



-- Module 5.使用一般的條件約束(Constraints)來實作資料的完整性 
--       5-1: DEFAULT 條件約束
--       5-2: CHECK 條件約束
--       5-3: Table-level constraint vs. Column-level constraint


--- SQL Server 2017/2019
--      p 7-15 表格 default 預設值
--      p 7-5  unicode 說明
--      p 7-20 建立 check   條件約束
--      p 7-22 Table-level constraint vs. Column-level constraint


--- SQL Server 2016/2017
--      p 7-15 表格 default 預設值
--      p 7-6  unicode 說明
--      p 7-21 建立 check   條件約束
--      p 7-20 Table-level constraint vs. Column-level constraint


-- 補充資料：指定資料行的預設值
-- https://docs.microsoft.com/zh-tw/sql/relational-databases/tables/specify-default-values-for-columns?view=sql-server-2017

-- 補充資料：建立檢查條件約束
-- https://docs.microsoft.com/zh-tw/sql/relational-databases/tables/create-check-constraints?view=sql-server-ver15

-- 補充資料：資料表層級條件約束 table-constraint
-- https://docs.microsoft.com/zh-tw/sql/t-sql/statements/alter-table-table-constraint-transact-sql?view=sql-server-ver15

-- 補充資料：欄位層級條件約束 column-constraint
-- https://docs.microsoft.com/zh-tw/sql/t-sql/statements/alter-table-column-constraint-transact-sql?view=sql-server-ver15

-- 補充資料：Unicode 字串
-- https://docs.microsoft.com/zh-tw/sql/t-sql/data-types/constants-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15#unicode-strings


-- 10. 定義欄位的預設值
--     設定 店鋪代號 與 店鋪名稱 的預設值
--	   步驟：TeaShop 資料表 > 設計 > 選擇一個欄位 > (往下) > 預設值或繫結 > 設定預設值


-- 15. 透過語法撰寫預設值，請參考上方的補充資料：指定資料行的預設值
--		除了透過介面以外，也可以透過語法設定


-- 20. 資料寫入前的檢查
--	   設定 店鋪資本額 必須要大於 0
--     步驟：TeaShop 資料表 > 設計 > 選擇任一欄位 > 右鍵 > 檢查條件約束 > (加入) > 一般/運算式 > ShopCapital > 0


-- 25. 透過語法撰寫檢查，請參考上方的補充資料：建立檢查條件約束
--		除了透過介面以外，也可以透過語法設定




