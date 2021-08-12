



--Module 5.集合運算子的使用 - UNION(聯集)、UNION ALL、INTERSECT、EXCEPT
--       5-1:使用 UNION(聯集)、UNION ALL 運算子撰寫查詢 
--       5-2:使用 INTERSECT(交集) 運算子撰寫查詢 
--       5-3:使用 EXCEPT(差集) 運算子撰寫查詢 


--- SQL Server 2017/2019
--      p 9-16 運算集合查詢 - UNION、INTERSECT




-- 10. 測試 union & union all 語法
-- 10-1. 試試看，將 員工姓名和顧客姓名整理成一份資料表
-- 10-2. 試試看，將 員工編號和顧客編號整理成一份資料表

-- 目標: 老闆要送過年禮物，員工+顧客
select CompanyName, Address from Customers -- 91
union 
select FirstName, Address   from Employees   -- 9


select SupplierID from Suppliers -- 29
union all
select EmployeeID from Employees --  9




-- 20. 製作暫存資料表，稍後討論 intersect & except 使用

    CREATE TABLE #a (id INT)
    CREATE TABLE #b (id INT)

    INSERT INTO #a VALUES (1), (NULL), (2)
    INSERT INTO #b VALUES (1), (NULL), (3), (1)

	select * from #a;
	select * from #b

-- 21. intersect 交集，與 inner join 差異在哪裡？
select * from #a a inner join #b b on a.id = b.id;

select id from #a
intersect
select id from #b

-- 22. except    差集，與 outer join 差異在哪裡？

-- 連假後補: outer join

select id from #b
except
select id from #a
