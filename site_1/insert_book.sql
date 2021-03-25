SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

ACCEPT x CHAR PROMPT 'User name = '
ACCEPT y CHAR PROMPT 'password = '


DECLARE
    u_name Users.UserName%TYPE;
    p_word Users.Password%TYPE;
    flag number;
begin
    u_name := '&x';
    p_word := '&y';
    flag := 0;

    for R in (select * from Users) loop
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
    end if;
end;
/
