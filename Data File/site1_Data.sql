clear screen;

--delete existing table
DROP TABLE Book CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;

CREATE TABLE BOOK
(
    BookID number,
    BookName varchar(500),
    Author varchar(100),
    Lang varchar(50),
    Quantity number,
        PRIMARY KEY(BookID)
);

CREATE TABLE Users
(
    UserID number,
    UserName varchar(100),
    Email varchar(100),
    Password varchar(100),
        PRIMARY KEY(UserID)
);

CREATE TABLE Orders
(
    OrderID number,
    UserID number,
        PRIMARY KEY(OrderID)
);

INSERT INTO Book VALUES(1, 'Teach yourself c', 'Herbert Schildt', 'English', 14);
INSERT INTO Book VALUES(2, 'Teach yourself c++', 'Herbert Schildt', 'English', 10);
INSERT INTO Book VALUES(3, 'Java the complete ref', 'Herbert Schildt', 'English', 14);
INSERT INTO Book VALUES(4, 'Body Language', 'Allan and Pease', 'English', 14);
INSERT INTO Book VALUES(5, 'Harry Potter 1', 'J. K. Rowling', 'English', 23);
INSERT INTO Book VALUES(6, 'Harry Potter 2', 'J. K. Rowling', 'English', 9);
INSERT INTO Book VALUES(7, 'Harry Potter 3', 'J. K. Rowling', 'English', 55);
INSERT INTO Book VALUES(8, 'Harry Potter 4', 'J. K. Rowling', 'English', 42);
INSERT INTO Book VALUES(9, 'Harry Potter 5', 'J. K. Rowling', 'English', 20);
INSERT INTO Book VALUES(10, 'Subconscious Mind', 'DR. Jospeh Murphy', 'English', 14);
INSERT INTO Book VALUES(11, 'The Power of Habi', 'Charles Duhigg', 'English', 2);
INSERT INTO Book VALUES(12, 'Computer Networking', 'Kurose and Ross', 'English', 6);
INSERT INTO Book VALUES(13, 'Numerical Analysis', 'Shanker G.Rao', 'English', 8);
INSERT INTO Book VALUES(14, 'Nineteen Eighty-Four', 'George Orwell', 'English', 8);
INSERT INTO Book VALUES(15, 'Pride and Prejudice', 'Jane Austen', 'English', 8);
INSERT INTO Book VALUES(16, 'Middlemarch', 'George Eliot', 'English', 8);
INSERT INTO Book VALUES(17, 'Lord of the Flies', 'William Golding', 'English', 8);
INSERT INTO Book VALUES(18, 'Mrs Dalloway', 'Virginia Woolf', 'English', 8);
INSERT INTO Book VALUES(19, 'The Great Gatsby', 'F. Scott Fitzgerald', 'English', 8);
INSERT INTO Book VALUES(20, 'Animal Farm', 'George Orwell', 'English', 8);
INSERT INTO Book VALUES(21, 'Ulysses', 'James Joyce', 'English', 8);
INSERT INTO Book VALUES(22, 'Jane Eyre', 'Charlotte Brontë', 'English', 8);
INSERT INTO Book VALUES(23, 'To Kill a Mockingbird', 'Harper Lee', 'English', 8);
INSERT INTO Book VALUES(24, 'A Passage to India', 'E. M. Forster', 'English', 8);

INSERT INTO Users VALUES(1, 'admin', 'admin@gmail.com', 'admin');
INSERT INTO Users VALUES(2, 'shahriar', 'shahriar@gmai.com', '12345');
INSERT INTO Users VALUES(3, 'sakib', 'sakib@gmail.com', '12345');
INSERT INTO Users VALUES(4, 'Niloy', 'niloy@gmail.com', '12345');

commit;


