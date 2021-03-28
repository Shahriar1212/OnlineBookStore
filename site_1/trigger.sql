set SERVEROUTPUT ON;

create or replace trigger insert_trigger
Before Insert
On Book
declare
begin
    dbms_output.put_line(chr(10) || chr(9) || '[+] Congratulation! You have successfully Inserted new book.');
end;
/

create or replace trigger update_trigger1
Before Update
On Book
declare
begin
    dbms_output.put_line(chr(10) || chr(9) || '[+] Your book will be delivered very soon');
end;
/

create or replace trigger delete_trigger1
Before Delete
On Book
declare
begin
    dbms_output.put_line(chr(10) || chr(9) || '[+] Your book will be delivered very soon');
    dbms_output.put_line(chr(10) || chr(9) || '[+] You Ordered the last copy of this book :-) ');

end;
/