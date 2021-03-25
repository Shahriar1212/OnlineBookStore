SET SERVEROUTPUT ON;
SET VERIFY OFF;

create or replace package server_pack as

    procedure search_book(b_name in varchar, a_name in varchar);

    FUNCTION order_book(book_id in book.bookID%type, u_id in Users.UserID%TYPE)
    return number;



end server_pack;
/

create or replace package body server_pack as
    procedure search_book(b_name in varchar, a_name in varchar)
    is
        a book.BookName%type;
        b book.author%type;
        quantity book.quantity%type;
    begin
        
        if b_name is not NULL then
            a := b_name || '%';
        end if;

        if a_name is not NULL then
            b := a_name || '%';
        end if;

        for R in (select * from AllBooks where LOWER(bookname) LIKE a union select * from AllBooks where LOWER(author) LIKE b) loop
            DBMS_OUTPUT.PUT_LINE('======================================');
            DBMS_OUTPUT.PUT_LINE('Book ID     : ' || R.bookID);
            DBMS_OUTPUT.PUT_LINE('Book Name   : ' || R.bookname);
            DBMS_OUTPUT.PUT_LINE('Author Name : ' || R.author);
            DBMS_OUTPUT.PUT_LINE(chr(13));
        end loop;
    end;
    --------------------------------------------------------------

    FUNCTION order_book(book_id in book.bookID%type, u_id in Users.UserID%TYPE)
    return number
    is

    quantity number;
    new_quantity number;
    total_orders number;


    begin

        dbms_output.put_line('user id is : ' || u_id);
        select count(*) into total_orders from orders;
        total_orders := total_orders + 1;
        dbms_output.put_line('total orders : ' || total_orders);
        for R in (select * from AllBooks where BookID = book_id) loop
            DBMS_OUTPUT.PUT_LINE('Book ID     : ' || R.bookID);
            DBMS_OUTPUT.PUT_LINE('Book Name   : ' || R.bookname);
            DBMS_OUTPUT.PUT_LINE('Author Name : ' || R.author);
            dbms_output.put_line('language    : ' || R.lang);
            dbms_output.put_line('qutantity    : ' || R.quantity);
            quantity := R.quantity;
            new_quantity := quantity - 1;

            if R.lang = 'English' then
              update book set quantity = new_quantity where bookID = book_id;
                insert into orders values(total_orders, u_id);
            elsif R.lang = 'German' then
              update book@site1 set quantity = new_quantity where bookID = book_id;
                insert into orders@site1 values(total_orders, u_id);
            end if;
            
        end loop;

        for R in (select * from AllBooks where BookID = book_id) loop
            dbms_output.put_line('-------- After order --------');
            
            DBMS_OUTPUT.PUT_LINE('Book ID      : ' || R.bookID);
            DBMS_OUTPUT.PUT_LINE('Book Name    : ' || R.bookname);
            DBMS_OUTPUT.PUT_LINE('Author Name  : ' || R.author);
            dbms_output.put_line('language     : ' || R.lang);
            dbms_output.put_line('qutantity    : ' || R.quantity);
            
        end loop;

        return 0;


        exception
          when no_data_found then
            dbms_output.put_line('no data found');
    end; 


    
end server_pack;
/

