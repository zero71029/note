-- 0326
--  select  欄位, ..  from  伺服器.資料庫.結構.資料表

--  alter table 資料表 add 欄位名稱 欄位的資料型態

--  create table 資料表(
--  	欄位一 欄位一的資料型態,
--  	欄位二 欄位二的資料型態,
--  )

--  insert into 資料表 
--  (資料表裡面的欄位, ...) 
--  values 
--  (你要給資料表的欄位的值, ...)


-- 0329

-- update 資料表 
--    set 資料表裡面的欄位 = 指定的值 , ... 
--  where 條件 

-- delete 資料表  where 條件 

-- delete 資料表
-- truncate table 資料表;
-- drop     table 資料表;


-- use 資料＂庫＂名稱


-- 關於給別名的時機
--	a. 當欄位重新組合以後
--  b. 函式 | 函數 | function
--  c. join 的時候 table 給別名
--  d. 計算以後




-- 0330

 -- 這兩個相同
 -- select * from a         join    b on a.aid = b.bid
 -- select * from a   inner join    b on a.aid = b.bid
 
 -- 靠左邊、靠右邊、一個都不能少
 -- select * from a   left join     b on a.aid = b.bid
 -- select * from a   right join    b on a.aid = b.bid
 -- select * from a   full  join    b on a.aid = b.bid
 
 -- 正式名稱: "笛卡兒乘積"
 -- select * from a   cross join    b 