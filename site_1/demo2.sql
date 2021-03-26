SET SERVEROUTPUT ON;
SET VERIFY OFF;

clear screen;

-- ACCEPT x CHAR PROMPT 'enter your age: '



DECLARE
    a varchar2(20);
begin
  
    dbms_output.put_line('enter your age');
    a := '&x';
    dbms_output.put_line('your age is ' || a);
    
end;
/
