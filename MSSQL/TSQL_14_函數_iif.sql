



-- Module 14.系統內建函數- 其餘函數以及CASE 運算式介紹
--        14-1:使用邏輯函數
--        14-2:空值(NULL) 處理函數:ISNULL() vs. COALESCE()
--        14-3:IIF()、CHOOSE()、CASE() 運算式 

--- SQL Server 2017/2019
--      p 13-31 IIF 和 CHOOS 


--- SQL Server 2016/2017 
--      p 13-31 IIF 和 CHOOS 






-- 10. 如果訂單數量大於 100，標示為請再次確認  ===> IIF() 函式
--  IIF(  判斷,  'true',   ''  )
select *
     , IIF( Quantity > 100, '大於100要小心!', '' )  
  from [Order Details]




-- 20. CHOOSE () ===> 在 SQL Server 中從數值清單傳回指定之索引的項目。
SELECT CHOOSE(4,'A','B','C')
SELECT CHOOSE ( 3, 'Manager', 'Director', 'Developer', 'Tester' ) AS Result;

SELECT JobTitle, HireDate
     , CHOOSE(MONTH(HireDate),'Winter','Winter', 'Spring','Spring','Spring','Summer','Summer',   
                              'Summer','Autumn','Autumn','Autumn','Winter') AS Quarter_Hired  
FROM AdventureWorks.HumanResources.Employee  
WHERE  YEAR(HireDate) > 2005  
ORDER BY YEAR(HireDate);



-- 30. CASE..WHEN..ELSE..END ===> 統計員工資料表的資料，分類出 70歲以上、60歲以上、60歲以下

select EmployeeID, BirthDate, YEAR(BirthDate), YEAR(getdate()), YEAR(getdate())-YEAR(BirthDate)
  from Employees

select EmployeeID, BirthDate, YEAR(getdate())-YEAR(BirthDate)
     , CASE
			WHEN YEAR(getdate())-YEAR(BirthDate) > 70 THEN '70歲以上'
			WHEN YEAR(getdate())-YEAR(BirthDate) > 60 THEN '60歲以上'
			ELSE '60歲以下'
	   END
  from Employees


-- 50. 製作一個 TABLE 比較 ISNULL()、COALESCE()、CASE()
--		確認所選取的資料庫為 Lab 後，框選底下程式碼直接執行
CREATE TABLE Lab.dbo.AddressBook(
	ID int identity(1,1) not null,
	MobilePhone varchar(10) null,
	HomePhone  varchar(10) null,
	OfficePhone varchar(10) null
)

insert into AddressBook (MobilePhone, HomePhone, OfficePhone) values ('M1','H1','O1');
insert into AddressBook (MobilePhone, HomePhone, OfficePhone) values ( null,'H2','O2');
insert into AddressBook (MobilePhone, HomePhone, OfficePhone) values ('M3',null,'O3');
insert into AddressBook (MobilePhone, HomePhone, OfficePhone) values ('M4','H4',null);
insert into AddressBook (MobilePhone, HomePhone, OfficePhone) values (null,null,'O5');
insert into AddressBook (MobilePhone, HomePhone, OfficePhone) values (null,null,null);

select * from AddressBook;


-- 假如電話簿中有手機、家裡電話、辦公室電話
-- 這三者欄位可能有些會是空白
-- 我們想要依照順序挑選，手機優先、家裡電話次之、辦公室電話最末
-- 請練習底下三種方法


-- 51. 用 CASE() 的方法撰寫
select id,
     case
		when MobilePhone is not null then MobilePhone
		when HomePhone   is not null then HomePhone
		when OfficePhone is not null then OfficePhone
	 end 
  from AddressBook



-- 52. 用 ISNULL() 的方法撰寫
select ISNULL('apple','bee');
select ISNULL(null,'bee');
select fax, ISNULL(fax, 'cat') from Northwind.dbo.Suppliers

select id, ISNULL(MobilePhone, ISNULL(HomePhone, OfficePhone) ) from AddressBook

--select *, ISNULL(HomePhone, OfficePhone ) from AddressBook

-- 53. 用 COALESCE() 的方法撰寫
select *, COALESCE(MobilePhone, HomePhone, OfficePhone) from AddressBook
