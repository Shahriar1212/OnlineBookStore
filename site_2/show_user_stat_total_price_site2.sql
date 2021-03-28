SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

declare

begin
    dbms_output.put_line(chr(10) || chr(9) || 'Admin Login Required');
        dbms_output.put_line(chr(10) || chr(9) || 'Fill Out All The Field');
    dbms_output.put_line('================================================================');
end;
/

ACCEPT x CHAR PROMPT '[+] Enter User Name   = '
ACCEPT y CHAR PROMPT '[+] Enter Password    = '

declare
    u_name Users.UserName%TYPE;
    p_word Users.Password%TYPE;

    empty_username_exception EXCEPTION;
    empty_password_exception EXCEPTION;

    flag number;
begin

    u_name      := '&x';
    p_word      := '&y';


    if u_name is NULL then
      RAISE empty_username_exception;
    end if;

    if p_word is NULL then
      RAISE empty_password_exception;
    end if;

    flag        := 0;

    for R in (select * from Users) loop
        if u_name = 'admin' then
          if p_word = 'admin' then
            flag := 1;
            EXIT;
          end if;
        end if;
    end loop;


    if flag = 0 then
        DBMS_OUTPUT.PUT_LINE(chr(10) || chr(9) || '[!] Warning: Wrong Credentials');
        dbms_output.put_line(chr(9) || '==============================');

    else
      dbms_output.put_line(chr(10) || chr(9) ||'UserID' || chr(9) ||'UserName' || chr(9) || 'Total Amount');
      dbms_output.put_line('-------------------------------------------------');
      for R in (select * from show_user_stat_total_price) loop
        if length(R.username) > 7 then
          dbms_output.put_line(chr(9) ||R.userid || chr(9) || R.username || chr(9) || R.TotalPrice);
        else
          dbms_output.put_line(chr(9) ||R.userid || chr(9) ||R.username || chr(9) || chr(9) || R.TotalPrice);
        end if;
      end loop;
    end if;


    

    exception
      when empty_username_exception then
        DBMS_OUTPUT.PUT_LINE(chr(10) || chr(9) || '[!] Warning: You did not entered your USERNAME');
      when empty_password_exception then
        dbms_output.put_line(chr(10) || chr(9) || '[!] Warning: You did not entered your PASSWORD');
    
      when others then
        dbms_output.put_line('exception found');
end;
/