use Lab
go


-- Module 6.檢視表(Views) 的設計與實作
--        6-1:使用 CREATE VIEW 建立檢視表物件    
--        6-2:如何查詢某一檢視表原始定義的內容 
--        6-3:如何修改檢視表、刪除檢視表



--- SQL Server 2017/2019
--      p 11-3 檢視表的優缺點          
--      p 11-5 建立檢視表              
--      p 11-7 建立檢視表（使用指令）  





-- 10. 先將 Northwind 資料庫的 Employees 搬移至 Lab 資料庫中
--     設定資料表名稱為: LabEmployee
--     複習：select .. into .. 


-- 20. 新增 檢視表 v_EmployeeBoss 可帶出員工和對應的長官名字
--     複習：self join



-- 21. 查詢檢視表 v_EmployeeBoss




-- 30. 更新 LabEmployee 資料表的資料
--     並查看 檢視表 v_EmployeeBoss 是否有改變？


-- 31. 更新 檢視表 v_EmployeeBoss 同一筆資料，是否可以成功？




-- 40. 將訂單明細資料表寫入 Lab 資料庫中


-- 41. 新增 訂單的檢視表 v_OrderInfo ，依照訂單號碼加總總金額


-- 42. 讀取 v_OrderInfo 查看是否成功


-- 43. 試著更新 訂單編號為 10248 的總金額為 999，是否可以成功？
