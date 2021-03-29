CREATE OR REPLACE VIEW AllBooks AS
SELECT * FROM book@site1 
UNION 
SELECT * FROM book;


CREATE OR REPLACE VIEW AllUsers AS
SELECT * FROM users@site1 
UNION 
SELECT * FROM users;

CREATE OR REPLACE VIEW AllOrders AS
SELECT * FROM Orders@site1 
UNION 
SELECT * FROM Orders;


create or replace view show_all_orders as
select AllOrders.orderid, AllOrders.userid, AllBooks.BookID, AllUsers.username, AllUsers.Email, AllBooks.bookname, AllBooks.Author, AllBooks.Lang, AllBooks.price, TO_CHAR(AllOrders.OrderDate, 'YYYY-MM-DD HH24:MI:SS') as OrderTime from ((AllOrders left join AllUsers on AllOrders.userid = AllUsers.userid) left join AllBooks on AllOrders.bookid = AllBooks.bookid) order by AllOrders.orderid;


create or replace view show_user_stat_total_price as
select userid, USERNAME, sum(price) as TotalPrice from show_all_orders group by userid, username;

