SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

declare

begin
    dbms_output.put_line(chr(10) || chr(9) || 'Enter Username To Show Order History');
    dbms_output.put_line(chr(10) || chr(9) || 'Fill Out All The Field');
    dbms_output.put_line('================================================================');
end;
/

ACCEPT x CHAR PROMPT '[+] Enter User Name   = '

declare
    u_name Users.UserName%TYPE;

    empty_username_exception EXCEPTION;
    total_amount_spent number;

    flag number;
begin

    u_name      := '&x';


    if u_name is NULL then
      RAISE empty_username_exception;
    end if;

    flag        := 0;
    total_amount_spent := 0;

    for R in (select * from AllUsers) loop
        if u_name = R.username then
            flag := 1;
            EXIT;
        end if;
    end loop;


    if flag = 0 then
        DBMS_OUTPUT.PUT_LINE(chr(10) || chr(9) || '[!] Warning: User Not Found');
        dbms_output.put_line(chr(9) || '==============================');

    else
      dbms_output.put_line(chr(10) || chr(9) ||'UserID' || chr(9) || 'Order Time' || chr(9) || chr(9) ||'Price' || chr(9) || 'Book');
      dbms_output.put_line('---------------------------------------------------------------------------');
      for R in (select * from show_all_orders where username = u_name) loop
          dbms_output.put_line(chr(9) ||R.userid || chr(9) || R.OrderTime || chr(9) || R.Price || chr(9) || R.bookname);
          total_amount_spent := total_amount_spent + R.Price;
      end loop;

      dbms_output.put_line(chr(10) || chr(9) ||'You have spent ' || total_amount_spent || ' TAKA');
    end if;


    

    exception
      when empty_username_exception then
        DBMS_OUTPUT.PUT_LINE(chr(10) || chr(9) || '[!] Warning: You did not entered your USERNAME');
      when others then
        dbms_output.put_line('exception found');
end;
/