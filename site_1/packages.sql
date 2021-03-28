SET SERVEROUTPUT ON;
SET VERIFY OFF;

create or replace package server_pack as

    procedure search_book(b_name in varchar, a_name in varchar);

    FUNCTION order_book(book_id in book.bookID%type, u_id in Users.UserID%TYPE)
    return number;



end server_pack;
/

----------------------------------------------------------------
create or replace package body server_pack as
    procedure search_book(b_name in varchar, a_name in varchar)
    is
        a book.BookName%type;
        b book.author%type;
        quantity book.quantity%type;
        total_book_found number;
    begin
        total_book_found := 0;
        if b_name is not NULL then
            a := lower(b_name) || '%';
        end if;

        if a_name is not NULL then
            b := lower(a_name) || '%';
        end if;

        for R in (select * from AllBooks where LOWER(bookname) LIKE a union select * from AllBooks where LOWER(author) LIKE b) loop
            DBMS_OUTPUT.PUT_LINE(chr(10) || '===============================================');
            DBMS_OUTPUT.PUT_LINE(chr(9) || 'Book ID     : ' || R.bookID);
            DBMS_OUTPUT.PUT_LINE(chr(9) || 'Book Name   : ' || R.bookname);
            DBMS_OUTPUT.PUT_LINE(chr(9) || 'Author Name : ' || R.author);
            DBMS_OUTPUT.PUT_LINE(chr(13));
            total_book_found := total_book_found + 1;
        end loop;

        if total_book_found = 0 then
            dbms_output.put_line(chr(10) || chr(9)||' No Book Found :-( ');
        else
            dbms_output.put_line(chr(9)||' Total ' || total_book_found || ' books found :-) ');
        end if;
    end;




    --------------------------------------------------------------------------------
    FUNCTION order_book(book_id in book.bookID%type, u_id in Users.UserID%TYPE)
    return number
    is

    quantity number;
    new_quantity number;
    total_orders number;

    is_ordered_successfully number;


    begin

        is_ordered_successfully := 0;
        -- dbms_output.put_line('user id is : ' || u_id);
        select count(*) into total_orders from allorders;
        total_orders := total_orders + 1;


        for R in (select * from AllBooks where BookID = book_id) loop
            dbms_output.put_line(chr(10) || chr(9) || '[+] Congratulation! You have successfully Ordered a book.');
            dbms_output.put_line(chr(10));

            dbms_output.put_line(chr(10) || chr(9) || 'Order Information');
            dbms_output.put_line(chr(9) || '.................');
            DBMS_OUTPUT.PUT_LINE(chr(9) || 'Order ID    : ' || total_orders);
            DBMS_OUTPUT.PUT_LINE(chr(9) || 'Book ID     : ' || R.bookID);
            DBMS_OUTPUT.PUT_LINE(chr(9) || 'Book Name   : ' || R.bookname);
            DBMS_OUTPUT.PUT_LINE(chr(9) || 'Author Name : ' || R.author);
            dbms_output.put_line(chr(9) || 'language    : ' || R.lang);
            dbms_output.put_line(chr(9) || 'Price       : ' || R.Price);
            quantity := R.quantity;
            new_quantity := quantity - 1;

            if R.lang = 'English' then
                if quantity = 1 then
                    delete from book where bookID = book_id;
                    insert into orders values(total_orders, u_id, book_id,sysdate);
                    is_ordered_successfully := 1;
                    commit;
                else
                    update book set quantity = new_quantity where bookID = book_id;
                    insert into orders values(total_orders, u_id, book_id,sysdate);
                    is_ordered_successfully := 1;
                    commit;
                end if;
                
            elsif R.lang = 'German' then
                if quantity = 1 then
                    delete from book@site2 where bookID = book_id;
                    insert into orders@site2 values(total_orders, u_id, book_id, sysdate);
                    is_ordered_successfully := 1;
                    commit;
                else
                    update book@site2 set quantity = new_quantity where bookID = book_id;
                    insert into orders@site2 values(total_orders, u_id, book_id, sysdate);
                    is_ordered_successfully := 1;
                    commit;
                end if;
            end if;
            
        end loop;

        -- for R in (select * from AllBooks where BookID = book_id) loop
        --     dbms_output.put_line('-------- After order --------');
            
        --     DBMS_OUTPUT.PUT_LINE('Book ID      : ' || R.bookID);
        --     DBMS_OUTPUT.PUT_LINE('Book Name    : ' || R.bookname);
        --     DBMS_OUTPUT.PUT_LINE('Author Name  : ' || R.author);
        --     dbms_output.put_line('language     : ' || R.lang);
        --     dbms_output.put_line('qutantity    : ' || R.quantity);
            
        -- end loop;

        return is_ordered_successfully;


        exception
          when no_data_found then
            dbms_output.put_line('no data found');
    end; 


    
end server_pack;
/
