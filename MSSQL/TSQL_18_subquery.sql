



-- Module 18.子查詢(Subquery) 的運用
--       18-1:撰寫傳回單一純量值的子查詢
--       18-2:撰寫傳回多個值的子查詢
--       18-3:搭配 EXISTS 以及 NOT EXISTS 的子查詢



--- SQL Server 2017/2019



--- SQL Server 2016/2017 
--      p 9-2  子查詢
--      p 9-22 EXISTS 運算子


-- 10. 目前訂單編號 10847 中 有六個產品編號 1,19,37,45,60,71
--    a. 透過 in (..) 的方式，在產品資料表中取得產品資料
--	  b. 改以透過 子查詢 的方式，在產品資料表中取得產品資料



-- 20. 產品資料表中，所有產品的平均單價為何？



-- 21. 如何得知每一項產品與平均單價差異多少？ 




-- 30. 檢查是否所有訂單的產品編號都來自產品資料表中？
--     製作測試資料
Create Table Lab.dbo.LabProduct     ( ProductID int );
Create Table Lab.dbo.LabOrderDetail ( OrderID char(1),  ProductID int);

insert into  Lab.dbo.LabProduct (ProductID) values (1);
insert into  Lab.dbo.LabProduct (ProductID) values (2);
insert into  Lab.dbo.LabProduct (ProductID) values (3);

insert into  Lab.dbo.LabOrderDetail (OrderID, ProductID) values ('A', 1);
insert into  Lab.dbo.LabOrderDetail (OrderID, ProductID) values ('B', 98);
insert into  Lab.dbo.LabOrderDetail (OrderID, ProductID) values ('C', 99);

select * from Lab.dbo.LabProduct;
select * from Lab.dbo.LabOrderDetail;

--		小提示：join、subquery、exists
