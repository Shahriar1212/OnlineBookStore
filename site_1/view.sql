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
select AllOrders.orderid, AllOrders.userid, AllUsers.username, AllBooks.bookname, AllBooks.price from ((AllOrders inner join AllUsers on AllOrders.userid = AllUsers.userid) inner join AllBooks on AllOrders.bookid = AllBooks.bookid);


