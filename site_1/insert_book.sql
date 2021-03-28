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
ACCEPT p CHAR PROMPT '[+] Enter Book Name   = '
ACCEPT q CHAR PROMPT '[+] Enter Author Nam  = '
ACCEPT r CHAR PROMPT '[+] Enter Language    = '
ACCEPT s number PROMPT '[+] Enter Price       = '
ACCEPT t number PROMPT '[+] Enter Quantity    = '


DECLARE
    u_name Users.UserName%TYPE;
    p_word Users.Password%TYPE;

    book_id book.BookID%type;
    book_name book.BookName%type;
    author_name book.Author%type;
    lang book.Lang%type;
    price book.price%type;
    quantity book.quantity%type;

    max_book_id book.BookID%type;
    new_book_id book.BookID%type;

    empty_username_exception EXCEPTION;
    empty_password_exception EXCEPTION;
    empty_book_name_exception EXCEPTION;
    empty_author_name_exception EXCEPTION;
    empty_language_exception EXCEPTION;
    empty_price_exception EXCEPTION;
    empty_quantity_exception EXCEPTION;


    flag number;
begin
    u_name      := '&x';
    p_word      := '&y';
    book_name   := '&p';
    author_name := '&q';
    lang        := '&r';
    price       := &s;
    quantity    := &t;




    if u_name is NULL then
      RAISE empty_username_exception;
    end if;

    if p_word is NULL then
      RAISE empty_password_exception;
    end if;

    if book_name is NULL then
      RAISE empty_book_name_exception;
    end if;

    if author_name is NULL then
      RAISE empty_author_name_exception;
    end if;

    if lang is NULL then
      RAISE empty_language_exception;
    end if;

    if price = 0 then
      RAISE empty_price_exception;
    end if;
    if quantity = 0 then
      RAISE empty_quantity_exception;
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
      DBMS_OUTPUT.PUT_LINE(chr(10) || chr(9) || 'Logged in as ' || u_name);
      dbms_output.put_line('===================================' || chr(10));
      select max(BookID) into max_book_id from AllBooks;
      new_book_id := max_book_id + 1;
      if lower(lang) = 'english' then
        INSERT INTO Book VALUES(new_book_id, book_name, author_name, initcap(lang), price, quantity);
        dbms_output.put_line(chr(10) || chr(9) || '[+] Congratulation! You have successfully Inserted new book.');
        dbms_output.put_line(chr(10));
      else
        INSERT INTO Book@site2 VALUES(new_book_id, book_name, author_name, initcap(lang), price, quantity);
        dbms_output.put_line(chr(10) || chr(9) || '[+] Congratulation! You have successfully Inserted new book.');
        dbms_output.put_line(chr(10));
      end if;
    end if;

    exception
        when no_data_found then
          dbms_output.put_line(chr(10) || chr(9) || '[!] Warning: Data Not Found');
        when empty_username_exception then
          DBMS_OUTPUT.PUT_LINE(chr(10) || chr(9) || '[!] Warning: You did not entered your USERNAME');
        when empty_password_exception then
          dbms_output.put_line(chr(10) || chr(9) || '[!] Warning: You did not entered your PASSWORD');
        when empty_book_name_exception then
          dbms_output.put_line(chr(10) || chr(9) || '[!] Warning: You did not entered BOOK NAME');
        when empty_author_name_exception then
          dbms_output.put_line(chr(10) || chr(9) || '[!] Warning: You did not entered AUTHOR NAME');
        when empty_language_exception then
          dbms_output.put_line(chr(10) || chr(9) || '[!] Warning: You did not entered BOOK LANGUAGE');
        when empty_price_exception then
          dbms_output.put_line(chr(10) || chr(9) || '[!] Warning: You did not entered BOOK PRICE');
        when empty_quantity_exception then
          dbms_output.put_line(chr(10) || chr(9) || '[!] Warning: You did not entered BOOK Quantity');
end;
/
