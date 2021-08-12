
-- ** 請練習撰寫底下指令 **
-- ** 大部分使用 Products 產品資料表；若有其他資料表會在題目補充說明 ** 

-- 010 確定打開的是 Northwind 資料庫 



-- 110 挑選 所有 產品資料
select * from Products


-- 115 挑選 所有 產品資料，並用產品名稱排序
select * from Products order by ProductName


-- 120 挑選 指定欄位：ProductID, ProductName, UnitPrice
select ProductID, ProductName, UnitPrice from Products


-- 125 延續上題，請將欄位名稱改成以中文 產品編號, 產品名稱, 單價 顯示
select ProductID as 產品編號, ProductName as 產品名稱, UnitPrice as 單價 from Products


-- 130 挑選 庫存量低於再訂購量 的產品資料
select * from Products
select * from Products where UnitsInStock < ReorderLevel

-- 140 挑選 (庫存量+在途數)低於再訂購量 的產品資料
select * from Products where UnitsInStock+UnitsOnOrder < ReorderLevel

-- 150 挑選 產品名稱 包含 ku 的資料
select * from Products where ProductName like '%ku%'


-- 160 挑選 類別編號 (CategoryID) 為 1, 4, 8 的產品資料
--     並依照 類別編號 和 產品名稱 排序
select * from Products where CategoryID in (1,4,8) order by CategoryID ,  ProductName


-- 170 挑選 單價 介於 15 到 20 元之間(包含 15, 20)的產品資料
--     並且按照 單價 由大到小排序

select * from Products where UnitPrice BETWEEN 15 and 20 order by UnitPrice desc