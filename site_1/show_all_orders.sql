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
    for R in (select * from allOrders) loop
        dbms_output.put_line(R.orderID);
        u_id := R.userID;
        for s in (select * from allusers where userID = u_id) loop
          dbms_output.put('name is ' || s.UserName);
        end loop;
        
        
    end loop;

    exception
      when others then
        dbms_output.put_line('exception found');
end;
/