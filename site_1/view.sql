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