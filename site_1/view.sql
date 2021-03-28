CREATE OR REPLACE VIEW AllBooks AS
SELECT * FROM book 
UNION 
SELECT * FROM book@site2;


CREATE OR REPLACE VIEW AllUsers AS
SELECT * FROM users 
UNION 
SELECT * FROM users@site2;

CREATE OR REPLACE VIEW AllOrders AS
SELECT * FROM Orders 
UNION 
SELECT * FROM Orders@site2;


create or replace view show_all_orders as
select AllOrders.orderid, AllOrders.userid, AllBooks.BookID, AllUsers.username, AllUsers.Email, AllBooks.bookname, AllBooks.Author, AllBooks.Lang, AllBooks.price, TO_CHAR(AllOrders.OrderDate, 'YYYY-MM-DD HH24:MI:SS') as OrderTime from ((AllOrders inner join AllUsers on AllOrders.userid = AllUsers.userid) inner join AllBooks on AllOrders.bookid = AllBooks.bookid) order by AllOrders.orderid;


create or replace view show_user_stat_total_price as
select userid, USERNAME, sum(price) as TotalPrice from show_all_orders group by userid, username;

