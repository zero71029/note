 
 


-- Module 15.多表格聯結(Join) 的基本查詢語法
--        15-1:聯結(Join) 
--        15-2:內部聯結(Inner Joins)
--        15-3:使用資料表的別名(Table Aliases)


--- SQL Server 2017/2019
--      p 9-2  合併查詢


--- SQL Server 2016/2017 
--      p 9-2  合併查詢



-- 10. 觀察 Orders 和 Order Details 資料表，兩張資料表內各自存放了什麼資料？
select * from Orders
select * from [Order Details]

-- 11. 如果想要知道客戶有多少訂單，在哪一個資料表裡面？ Orders
-- 12. 如果想要知道一張明細的金額小計，在哪一個資料表裡面？ [Order Details]
--	問題：訂單總金額是否有被記錄下來？ (X)
-- 13. 如何找到有包含折扣的訂單？
--	簡單回顧先前所接觸的語法
select distinct Discount from [Order Details] where Discount != 0




-- 20. 訂單編號 10847 一共購買了幾個品項?
--	透過 [Order Details] 才有紀錄產品資料
select * from Orders o where OrderID = 10847
select * from [Order Details] where OrderID = 10847

-- 21. 如果今天我們要呈現一份訂單的資料，還需要哪些資料表輔助?
--		產品資訊 在哪一個資料表？
select * from [Order Details] where OrderID = 10847
select * from Products where ProductID in (1,19,37, 45, 60, 71)


-- 22. 透過 join 語法，把需要的資料表連接再一起
--	   需要的欄位：訂單編號、客戶編號、產品名稱、單價、數量、折扣 等
--     需要的資料表：?

select o.OrderID, o.CustomerID 
     , p.ProductName, od.UnitPrice, od.Quantity, od.Discount 
     , od.UnitPrice * od.Quantity * (1-od.Discount) as SubTotal
from Orders as o
join [Order Details] as od on o.OrderID = od.OrderID
join Products as p         on od.ProductID = p.ProductID
where o.OrderID = 10847

