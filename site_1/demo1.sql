SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

-- ACCEPT x CHAR PROMPT 'enter your name: '



declare
a number;
b number;
begin
a:= :a;
b:= :b;
if a>b then
dbms_output.put_line('Large number is '||a);
else
dbms_output.put_line('Large number is '||b);
end if;
end;

-- @"E:\Study\Semester 4.1\lab\DDS\OnlineBookStore\site_1\demo2.sql";
