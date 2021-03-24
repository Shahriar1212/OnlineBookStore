clear screen;

--delete existing table
DROP TABLE Book CASCADE CONSTRAINTS;

CREATE TABLE BOOK
(
    BookID number,
    BookName varchar(100),
    Author varchar(100),
    Lang varchar(50),
    Quantiti number,
        PRIMARY KEY(BookID)
);

CREATE TABLE User
(
    UserID number,
    UserName varchar(100),
    Email varchar(100),
        PRIMARY KEY(UserID)
);

CREATE TABLE Order
(
    OrderID number,
    UserID number,
        PRIMARY KEY(OrderID)
);

INSERT INTO BOOK VALUES(1, 'Teach yourself c', 'Herbert Schildt', 'English', 14);
INSERT INTO BOOK VALUES(2, 'Teach yourself c++', 'Herbert Schildt', 'English', 10);
INSERT INTO BOOK VALUES(3, 'Java the complete ref', 'Herbert Schildt', 'English', 14);
INSERT INTO BOOK VALUES(4, 'Body Language', 'Allan & Pease', 'English', 14);
INSERT INTO BOOK VALUES(5, 'Harry Potter 1', 'J. K. Rowling', 'English', 23);
INSERT INTO BOOK VALUES(6, 'Harry Potter 2', 'J. K. Rowling', 'English', 9);
INSERT INTO BOOK VALUES(7, 'Harry Potter 3', 'J. K. Rowling', 'English', 55);
INSERT INTO BOOK VALUES(8, 'Harry Potter 4', 'J. K. Rowling', 'English', 42);
INSERT INTO BOOK VALUES(9, 'Harry Potter 5', 'J. K. Rowling', 'English', 20);
INSERT INTO BOOK VALUES(10, 'Subconscious Mind', 'DR. Jospeh Murphy', 'English', 14);
INSERT INTO BOOK VALUES(11, 'The Power of Habi', 'Charles Duhigg', 'English', 2);
INSERT INTO BOOK VALUES(12, 'Computer Networking', 'Kurose and Ross', 'English', 6);
INSERT INTO BOOK VALUES(13, 'Numerical Analysis', 'Shanker G.Rao', 'English', 8);

INSERT INTO USER VALUES(1, 'shahriar', 'shahriar@gmai.com');
INSERT INTO USER VALUES(2, 'sakib', 'sakib@gmail.com');
INSERT INTO USER VALUES(3, 'Niloy', 'niloy@gmail.com');

commit;


