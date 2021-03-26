SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

declare

begin
    dbms_output.put_line(chr(10) || chr(9) || 'Enter USERNAME, PASSWORD and BOOKID to order a book');
    dbms_output.put_line('================================================================');
end;
/

ACCEPT x CHAR PROMPT '[+] Enter User Name    = '
ACCEPT y CHAR PROMPT '[+] Enter Password     = '
ACCEPT p number PROMPT '[+] Enter BookID       = '


DECLARE
    u_name Users.UserName%TYPE;
    p_word Users.Password%TYPE;
    u_id Users.UserID%TYPE;
    -- flag number;
    book_id book.bookID%type;
    temp number;
    flag number;

    no_book_id_exception EXCEPTION;


begin
    flag := 0;
    
    u_name := '&x';
    p_word := '&y';
    book_id := &p;


    if book_id = 0 then 
      RAISE no_book_id_exception;
    end if;

    
    select UserID into u_id from AllUsers where UserName = u_name; 

    for R in (select * from AllUsers) loop
        if u_name = R.UserName then
          if p_word = R.Password then
            flag := 1;
            EXIT;
          end if;
        end if;
    end loop;

    if flag = 0 then
        DBMS_OUTPUT.PUT_LINE(chr(10) || chr(9) || 'Wrong Cridential');
        dbms_output.put_line('===================================' || chr(10));
    else
        DBMS_OUTPUT.PUT_LINE(chr(10) || chr(9) || 'Logged in as ' || u_name);
        dbms_output.put_line('===================================' || chr(10));
        temp := server_pack.order_book(book_id, u_id);
    end if;

    
    exception
          when no_data_found then
            dbms_output.put_line(chr(10) || chr(9) || 'no data found');
          when no_book_id_exception then
            dbms_output.put_line(chr(10) || chr(9) || '[!] Warning: You did not entered any book id');

end;
/