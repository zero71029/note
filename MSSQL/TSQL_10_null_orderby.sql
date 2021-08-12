 
 


-- Module 10.欄位為空值時的查詢以及將查詢的結果予以排序
--        10-1:Null Value (空值)的意義
--        10-2:使用 IS NULL 運算子 
--        10-3:使用 ORDER BY 子句將查詢結果排序


--- SQL Server 2017/2019
--      p 2-13 空值
--      p 9-28 NULL 空值的處理
--      p 8-31 order by 子句


--- SQL Server 2016/2017
--      p 2-13 空值
--      p 9-28 NULL 空值的處理
--      p 8-31 order by 子句


-- 補充資料：SELECT 陳述式的邏輯處理順序
--https://docs.microsoft.com/zh-tw/sql/t-sql/queries/select-transact-sql?view=sql-server-ver15#logical-processing-order-of-the-select-statement



-- 10. 挑選供應商資料中，傳真號碼為空值(NULL)的資料
select SupplierID, Fax from Suppliers where Fax is null
select SupplierID, Fax from Suppliers where Fax is not null

-- 15. 討論幾種不等於的寫法 != 、 <> 、 not
select SupplierID from Suppliers where SupplierID  = 1
select SupplierID from Suppliers where SupplierID != 1
select SupplierID from Suppliers where SupplierID <> 1
select SupplierID from Suppliers where not SupplierID  = 1

-- "如果可能可以"的話，請盡量正向表達
select SupplierID from Suppliers where SupplierID >= 20
select SupplierID from Suppliers where not SupplierID < 20

-- 20. 挑選供應商資料中 ， 傳真號碼不等於 '43844115' 的資料
--     (小陷阱)
select SupplierID, Fax from Suppliers 
where (Fax <> '43844115' or Fax is null)


-- 25. 如果排序的欄位挑選 Fax，出來的結果是什麼？
select SupplierID, Fax from Suppliers
order by Fax 


-- 30. 別名 是否可以在 order by 中使用？ (O)
--     別名 是否可以在   where  中使用？ (X)

--	!! 和 sql server 處理 select 指令的順序有關
--		請參考上方的超連結: 補充資料：SELECT 陳述式的邏輯處理順序
select SupplierID as apple
  from Suppliers
 where SupplierID = 1
order by SupplierID
