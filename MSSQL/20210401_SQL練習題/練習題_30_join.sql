-- ** 請練習撰寫底下指令，大部分使用 Products 產品資料表；若有其他資料表會在題目補充說明 ** 


-- 300 確定打開的是 Northwind 資料庫 


-- 310 列出 以下欄位 ProductID, ProductName, SupplierID
select ProductID, ProductName, SupplierID from Products


-- 315 延續上題
--     請帶出該產品的供應商名稱(CompanyName)、聯絡電話(Phone)、聯絡人(ContactName)
--     相同供應商的資料請列在一起
select CompanyName,Phone,ContactName from Suppliers

select ProductID, ProductName, p.SupplierID,CompanyName,Phone,ContactName 
from Products as p join Suppliers as s on p.SupplierID = s.SupplierID


-- 320 延續上題，請加入條件："庫存量低於再訂購量" 的產品資料
select * from Products

select ProductID, ProductName, p.SupplierID,CompanyName,Phone,ContactName 
from Products as p join Suppliers as s on p.SupplierID = s.SupplierID 
where UnitsInStock >ReorderLevel


-- 330 訂單的價格是否與產品的單價是否一致？
select * from Products
select * from Orders


-- 340. 那張訂單賺最多錢？
select * from Orders


-- 350. VINET的訂單中，有幾個業務經手 (顯示總數) (COUNT + 子查詢)
select * from Orders where CustomerID = 'VINET'


-- 360. VINET的訂單中，所有經手業務的名子 (JOIN)
select * from [Order Subtotals]


-- 370. VINET的訂單中，找出訂單編號為10274所購買的產品清單，請找出產品名稱、產品價格



-- 380. 依照貨運公司，哪一家貨運公司承接最多訂單金額 (加總訂單價格)

