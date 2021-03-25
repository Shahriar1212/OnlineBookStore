SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

ACCEPT x CHAR PROMPT 'User name = '
ACCEPT y CHAR PROMPT 'password = '
ACCEPT p CHAR PROMPT 'select bookid to order '


DECLARE
    u_name Users.UserName%TYPE;
    p_word Users.Password%TYPE;
    u_id Users.UserID%TYPE;
    -- flag number;
    book_id book.bookID%type;
    temp number;
    flag number;


begin
    flag := 0;
    book_id := &p;
    u_name := '&x';
    p_word := '&y';
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
      DBMS_OUTPUT.PUT_LINE('wrong cridential');
    else
      DBMS_OUTPUT.PUT_LINE('logged in as ' || u_name);
      temp := server_pack.order_book(book_id, u_id);
    end if;

    
    -- exception
    --       when no_data_found then
    --         dbms_output.put_line('no data found');

end;
/