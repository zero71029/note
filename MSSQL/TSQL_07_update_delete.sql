



-- Module 7.DML指令的使用──如何做資料的修改與刪除
--       7-1:使用 UPDATE 修改資料 
--       7-2:使用 DELETE 刪除資料  
--       7-3:DELETE 指令與 TRUNCATE TABLE 指令的差別

--- SQL Server 2017/2019
--		p 10-9  更新紀錄 - update
--		p 10-13 刪除紀錄 - delete
--		p 10-16 truncate table 指令


--- SQL Server 2016/2017
--		p 10-9  更新紀錄 - update
--		p 10-13 刪除紀錄 - delete
--		p 10-16 truncate table 指令



-- 10. 執行底下語法，建立測試資料表
--		確認所選取的資料庫為 Lab 後，框選底下程式碼直接執行
create table Lab.dbo.CategoryAvgPrice
(
	CategoryID int IDENTITY(1,1) NOT NULL,
	AvgPrice money NULL,
	Memo varchar(50) NULL,
	UpdateDate datetime NULL
);

insert into CategoryAvgPrice (AvgPrice) values (37.9791);
insert into CategoryAvgPrice (AvgPrice) values (23.0625);
insert into CategoryAvgPrice (AvgPrice) values (25.16);
insert into CategoryAvgPrice (AvgPrice) values (28.73);
insert into CategoryAvgPrice (AvgPrice) values (20.25);
insert into CategoryAvgPrice (AvgPrice) values (54.0066);
insert into CategoryAvgPrice (AvgPrice) values (32.37);
insert into CategoryAvgPrice (AvgPrice) values (20.6825);

select * from CategoryAvgPrice;

-- 20. 更新異動日期欄位 UpdateDate 
--		執行後有多少資料被異動了？

-- update 資料表 set 資料表裡面的欄位 = 指定的值 
update CategoryAvgPrice 
   set UpdateDate = GETDATE();
select * from CategoryAvgPrice;

-- 21. 更新 類別編號 為1號的平均單價為 10 元
update CategoryAvgPrice set AvgPrice = 10 where CategoryID = 1;
select * from CategoryAvgPrice;


-- 25. 上課增加
update CategoryAvgPrice 
   set AvgPrice = 666, Memo = 'apple' 
 where CategoryID = 2;
select * from CategoryAvgPrice;


-- 29. delete 特定資料
delete CategoryAvgPrice where CategoryID = 2;
select * from CategoryAvgPrice;


-- 30. 執行 delete CategoryAvgPrice，然後再次重新新增資料
--		觀察流水號的變化
delete CategoryAvgPrice;
insert into CategoryAvgPrice (AvgPrice) values (777);
select * from CategoryAvgPrice;

-- 31. 執行 truncate table CategoryAvgPrice，然後再次重新新增資料
--		觀察流水號的變化
truncate table CategoryAvgPrice;
insert into CategoryAvgPrice (AvgPrice) values (888);
select * from CategoryAvgPrice;

-- 32. 執行 drop table CategoryAvgPrice，然後再次重新新增資料
--		觀察流水號的變化
drop table CategoryAvgPrice;
insert into CategoryAvgPrice (AvgPrice) values (999);
select * from CategoryAvgPrice;

