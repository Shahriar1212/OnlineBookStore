SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

ACCEPT x CHAR PROMPT 'book name = '
ACCEPT y CHAR PROMPT 'author name = '

declare
    a book.BookName%type;
    b book.author%type;

begin

		a := '&x';
        b := '&y';
        server_pack.search_book(a, b);



end;
/

-- DECLARE
--     a book.BookName%type;
--     b book.author%type;
-- begin
--     a := '&x';
--     b := '&y';

    

--     if a is not NULL then
--         a := a || '%';
--     end if;

--     if b is not NULL then
--         b := b || '%';
--     end if;

--     for R in (select * from AllBooks where LOWER(bookname) LIKE a union select * from AllBooks where LOWER(author) LIKE b) loop
--         DBMS_OUTPUT.PUT_LINE('======================================');
--         DBMS_OUTPUT.PUT_LINE('Book ID     : ' || R.bookID);
--         DBMS_OUTPUT.PUT_LINE('Book Name   : ' || R.bookname);
--         DBMS_OUTPUT.PUT_LINE('Author Name : ' || R.author);
--         DBMS_OUTPUT.PUT_LINE(chr(13));
--     end loop;
-- end;
-- /