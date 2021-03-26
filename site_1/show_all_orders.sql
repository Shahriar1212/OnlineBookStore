SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

declare
    a users.UserName%type;
    b varchar2(50);
    d number;
    e number;
begin
    for R in (select * from allOrders) loop
        d := R.UserID;
        e := R.BookID;
      dbms_output.put_line(R.OrderID || ' --- ' || R.UserID || ' --- ' || R.bookID);
      select UserName into a from AllUsers where UserID = d union select BookName into b from AllBooks where bookID = e;
      dbms_output.put_line(a || ' --- ');
    end loop;
end;
/