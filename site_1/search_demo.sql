SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

ACCEPT x CHAR PROMPT 'book name = '
ACCEPT y CHAR PROMPT 'author name = '


DECLARE
    a book.BookName%type;
    b book.author%type;
begin
    a := '&x';
    b := '&y';

    for R in (select * from book where LOWER(bookname) LIKE a ||'%') loop
    --   DBMS_OUTPUT.PUT_LINE(R.bookID || chr(9) ||R.BookName || CHR(9) || R.Author || chr(9) || R.Quantity);
        DBMS_OUTPUT.PUT_LINE('======================================');
        DBMS_OUTPUT.PUT_LINE('Book ID     : ' || R.bookID);
        DBMS_OUTPUT.PUT_LINE('Book Name   : ' || R.bookname);
        DBMS_OUTPUT.PUT_LINE('Author Name : ' || R.author);
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('');
    end loop;
end;
/