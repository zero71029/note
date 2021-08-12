



-- Module 12.系統內建函數- 字串函數介紹
--       12-1:LEN() 與 DATALENGTH() 
--       12-2:使用SUBSTRING()、LEFT()、RIGHT()傳回部份字元、文字的運算式
--       12-3:使用STR()將數值資料轉換成字元資料 


--- SQL Server 2017/2019




--- SQL Server 2016/2017 
--      p A-2 字串函數




-- 補充資料：字串函數 (Transact-SQL)
-- https://docs.microsoft.com/zh-tw/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver15



-- 10. 測試 LEN() 與 DATALENGTH() 
--     在實際執行前，請預測產生的資料為何？
select Len('abc'),        Len('a b c'),        Len('a b c ')
select DataLength('abc'), DataLength('a b c'), DataLength('a b c ')


-- 11. LEN() 與 DATALENGTH() 在計算中文和英文是否有所不同？
--     底下的SQL有寫入資料和更新資料，執行前請確認步驟

      select * from Lab.dbo.DataType_Varchar;

      insert into Lab.dbo.DataType_Varchar (c, nc, v, nv) 
	  values 
	  ('apple蘋果', 'apple蘋果', 'apple蘋果', 'apple蘋果');
	-- 7 7 7 7
    select Len(C), Len(NC), Len(V), Len(NV) from Lab.dbo.DataType_Varchar;

	-- 資料表 'Lab.dbo.DataType_Varchar'，資料行 'c' 中的字串或二進位資料將會截斷。截斷的值: 'apple蘋果 '。
    update Lab.dbo.DataType_Varchar set c  = c  + '123' where c  = 'apple蘋果';

	-- 資料表 'Lab.dbo.DataType_Varchar'，資料行 'nc' 中的字串或二進位資料將會截斷。截斷的值: 'apple蘋果   '。
    update Lab.dbo.DataType_Varchar set nc = nc + '123' where nc = 'apple蘋果';

	-- 資料表 'Lab.dbo.DataType_Varchar'，資料行 'v' 中的字串或二進位資料將會截斷。截斷的值: 'apple蘋果1'。
    update Lab.dbo.DataType_Varchar set v  = v  + '123' where v  = 'apple蘋果';

    -- (1 個資料列受到影響)
	update Lab.dbo.DataType_Varchar set nv = nv + '123' where nv = 'apple蘋果';

	 select * from Lab.dbo.DataType_Varchar where id = 5
    select DataLength(C), DataLength(NC), DataLength(V), DataLength(NV) 
	  from Lab.dbo.DataType_Varchar
	  where id = 5



-- 20. 假設員工資料表中 HomePhone 電話()中的號碼為區碼，該如何取得？
--		substring(資料|欄位, 起始位置, 長度)
--      charindex(想要搜尋的字元, 欄位)
select SUBSTRING('apple', 2, 3)
select CHARINDEX('e', 'apple')

select EmployeeID, HomePhone
    , SUBSTRING(HomePhone, 2, 3), SUBSTRING(HomePhone, 2, 2)
	, CHARINDEX(')', HomePhone)
	, CHARINDEX(')', HomePhone) -  2
	, SUBSTRING(HomePhone, 2, CHARINDEX(')', HomePhone) -  2)
from Northwind.dbo.Employees



-- 25. 同樣測試 HomePhone 欄位，透過 left() 從左邊擷取 5 ，會得到什麼結果？
--		left(欄位, 位數)、right(欄位, 位數)，從字串的左邊或者右邊開始擷取
select LEFT('APPLE', 2)
select RIGHT('APPLE', 2)
select REPLACE('APPLE','P','*')

-- 30. replace(字串, 想要尋找的文字, 要取代的文字) 可以取代掉指定的字元
--		請嘗試透過 left() 和 replace() 獲得和 步驟 20 一樣的結果

-- 從左邊取5個字，然後把 ( 取代成空白，然後 ) 取代成空白
select EmployeeID, HomePhone
    , LEFT(HomePhone, 5)
	, REPLACE(  LEFT(HomePhone, 5)                             , '('  , ''   )
	, REPLACE(  REPLACE(  LEFT(HomePhone, 5)  , '('  , ''   )  , ')'  , ''   )
from Northwind.dbo.Employees

		
-- 40. 【小練習】轉出資料時，為了保護資料的安全，
--		希望 LastName 不要全部提供，只顯示前三碼，後面有幾位改以 * 取代
--		請在 上方的 補充資料：字串函數 (Transact-SQL) 中搜尋，是否有函式可以幫我們達成？
select REPLICATE('*', 3)

select LastName 
     , LEFT(LastName,1), Right(LastName,1)
	 , REPLICATE('*', LEN(LastName) - 2)
	 , LEFT(LastName,1) + REPLICATE('*', LEN(LastName) - 2) + Right(LastName,1)
  from Northwind.dbo.Employees




-- 防雷頁



































































-- 40 題提示：REPLICATE()