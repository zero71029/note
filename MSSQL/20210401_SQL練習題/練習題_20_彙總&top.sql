-- ** 請練習撰寫底下指令，大部分使用 Products 產品資料表；若有其他資料表會在題目補充說明 ** 

-- 210 確定打開的是 Northwind 資料庫 



-- 210 請列出單價最高的前三項產品。
select top 3 * from Products order by UnitPrice desc


-- 220 請列出產品的平均單價。
select  AVG(UnitPrice) from Products


-- 230 挑選類別編號(CategoryID)為 1, 4, 8 為範圍, 計算挑選範圍內產品的平均單價。
select CategoryID , AVG (UnitPrice) from  Products where CategoryID in (1,4,8) GROUP BY  CategoryID
select AVG (UnitPrice) from Products where CategoryID in (1,4,8)

-- 240 請列出各類產品的平均單價。
select AVG (UnitPrice)  from  Products  GROUP BY SupplierID


-- 250 請列出平均單價最高的前三類產品。
select top 3 SupplierID, AVG (UnitPrice)  from  Products  GROUP BY SupplierID order by  AVG (UnitPrice) desc


-- 260 找出 價格最高 的產品 (使用 TOP 關鍵字)
select * from Products
select top 1 * from Products order by UnitPrice desc

-- 270 找出 價格最低 的產品 (使用 TOP 關鍵字)
select top 1 * from Products order by UnitPrice asc


-- 275 使用 MIN() 關鍵字改寫，取得價格最低產品單價是多少？
select MIN(UnitPrice) from Products
select * from Products where UnitPrice = (select MIN(UnitPrice) from Products)

