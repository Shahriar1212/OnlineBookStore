SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- clear screen;

clear screen;
declare

begin
    dbms_output.put_line(chr(10) || chr(9) || 'Enter Book Name OR Author Name to search Books');
    dbms_output.put_line('================================================================');
end;
/

ACCEPT x CHAR PROMPT '[+] Enter Book Name  = '
ACCEPT y CHAR PROMPT '[+] Author Name      = '

declare

    a book.BookName%type;
    b book.author%type;

begin
    

    a := '&x';
    b := '&y';
    server_pack.search_book(a, b);



end;
/