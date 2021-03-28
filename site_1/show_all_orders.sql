SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

declare
    a users.UserName%type;
    u_name users.UserName%type;
    b varchar2(50);
    d number;
    e number;
    u_id number;
begin
    for R in (select * from show_all_orders) loop
          if length(R.username) > 7 then
            dbms_output.put_line(R.orderid || chr(9) || R.username || chr(9) || R.bookname);
          else
            dbms_output.put_line(R.orderid || chr(9) ||R.username || chr(9) || chr(9) || R.bookname);
          end if;
        end loop;

    exception
      when others then
        dbms_output.put_line('exception found');
end;
/