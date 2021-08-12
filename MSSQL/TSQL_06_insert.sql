



-- Module 6.DML指令的使用──如何做資料的新增 
--        6-1:使用 INSERT 新增資料
--        6-2:預設的日期表達格式
--        6-3:識別欄位(IDENTITY) 的使用 

--- SQL Server 2017/2019
--		p 10-4 insert into 指令
--		p 10-8 select into 指令


--- SQL Server 2016/2017
--		p 10-4 insert into 指令
--		p 10-8 select into 指令


-- 補充資料：INSERT
-- https://docs.microsoft.com/zh-tw/sql/t-sql/statements/insert-transact-sql?view=sql-server-ver15

-- 補充資料：SET DATEFORMAT
-- https://docs.microsoft.com/zh-tw/sql/t-sql/data-types/date-transact-sql?view=sql-server-ver15


-- 10. 透過語法建立資料表
--		確認所選取的資料庫為 Lab 後，框選底下程式碼直接執行
create table ProductPrice(
	ProductID int identity (1,3) NOT NULL,
	Price money NULL
);
select * from ProductPrice;


-- 11. 透過語法新增資料，當資料欄位被定義為 identity，是否能再透過指令新增? X
--insert into 資料表 (欄位名稱) values (值)
--insert into ProductPrice (ProductID) values (1);

-- 12. 透過語法新增一筆價格為 100 的資料
insert  into   ProductPrice   (Price)   values   (100);

-- 13. 再新增一筆價格為 123 的資料後，該筆資料的流水號為多少？
insert   into   ProductPrice   (Price)   values   (456);



-- 20. 建立資料表與部分資料後，如何透過語法增加欄位？ 
--      例如增加 新增日期 CreateDate
--		alter table 資料表名稱 add 資料欄名稱 資料格式
alter table ProductPrice add CreateDate date


-- 21. 增加以後再重新撈資料庫的資料，剛剛那兩筆資料的 CreateDate 會有資料出現嗎? 


-- 22. 再追加一個有預設值的欄位，例如異動時間 UpdateDate
--		這樣一來，先前的資料會有資料出現嗎？
alter table ProductPrice add UpdateDate date default getdate()


-- 28. 新增時若欄位順序沒有一致，是否會引發錯誤訊息？
insert into ProductPrice (CreateDate, Price) values ( getdate(),999  )

-- 30. 透過語法新增一筆價格為 666 的資料，觀察這筆資料的流水號是多少
insert into ProductPrice (Price) values (130);  
select * from ProductPrice;

-- 31. 若 30 有執行成功，請預測底下資料新增後的流水號是什麼？
insert into ProductPrice (Price) values (130);  
select * from ProductPrice;

-- 32. 若 31 有執行成功，請預測底下資料新增後的流水號是什麼？
insert into ProductPrice (Price) values ('abc');
select * from ProductPrice;

-- 33. 如果 32 沒有執行成功，那底下資料新增後的流水號是什麼？
insert into ProductPrice (Price) values (160);   
select * from ProductPrice;



-- 50. insert 語法介紹完畢後，請練習寫入 TeaShop 和 TeaEmployee
--   * 觀察資料寫入時 PK、FK、default、check 等設定如何發揮影響


-- 錯誤，員工編號不可以有
insert into TeaEmployee (EmpID, EmpName, EmpPhone, EmpHome, ShopCode) values (1, '許雅婷','0911222333', '0412341234', 'TPE01')

-- "如果" TPE01 不存在 TeaShop 資料表中，則會出錯
insert into TeaEmployee (EmpName, EmpPhone, EmpHome, ShopCode) values ('許雅婷','0911222333', '0412341234', 'TPE01')

-- 新增一筆資料到飲料店  ==> 地址的預設值會出現!
insert into TeaShop (ShopCode) values ('TPE03');

-- "如果" TPE01 存在 TeaShop 資料表中，則會新增成功!
insert into TeaEmployee (EmpName, EmpPhone, EmpHome, ShopCode) values ('許雅婷','0911222333', '0412341234', 'TPE01')

-- 錯誤，因為設定手機不可以重複
insert into TeaEmployee (EmpName, EmpPhone, EmpHome, ShopCode) values ('張冠宇','0911222333', '0412341234', 'TPE01')

-- 成功，因為冠宇把手機改成888結尾
insert into TeaEmployee (EmpName, EmpPhone, EmpHome, ShopCode) values ('張冠宇','0911222888', '0412341234', 'TPE01')

-- 錯誤，因為有設定 ShopCapital 必須要大於0
insert into TeaShop (ShopCode, ShopCapital) values ('TPE02', -1);

-- 成功，地址會存天龍國，不會存苗栗國
insert into TeaShop (ShopCode, ShopAddress) values ('TPE03', '天龍國');


select * from TeaEmployee
select * from TeaShop





-- 60. 比較 char、nchar、varchar、nvarchar 的差異
--  a. 新增一個資料表 DataType_Varchar ，
--     欄位包含 char、nchar、varchar、nvarchar 四種類型的欄位
--     四個欄位長度各自設定為 10
create table DataType_Varchar(
   id int identity(1,1),
	c char(10),
   nc nchar(10),
	v varchar(10),
   nv nvarchar(10),
);


--	b. 新增一筆紀錄，4個欄位分別都輸入： '蘋果'
insert into DataType_Varchar(c, nc, v, nv) values ('蘋果','蘋果','蘋果','蘋果');
--	c. 新增一筆紀錄，4個欄位分別都輸入： '凃'
insert into DataType_Varchar(c, nc, v, nv) values ('凃','凃','凃','凃');
--	d. 新增一筆紀錄，4個欄位分別都輸入：N'凃'
insert into DataType_Varchar(c, nc, v, nv) values (N'凃',N'凃',N'凃',N'凃');
--  e. 挑選 DataType_Varchar 資料表
select * from DataType_Varchar



-- insert into 資料表 
-- (資料表裡面的欄位,...) 
-- values 
-- (你要給資料表的欄位的值,..)

