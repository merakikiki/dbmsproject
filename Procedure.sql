____________________________________________________________________________________________________________________________________________________________

CREATE OR REPLACE PROCEDURE with_group_by IS
  item_id order_line.productitemid%TYPE;
  quantity order_line.quantity%TYPE;
  totalprice order_line.price%TYPE;

  CURSOR retrieve IS
    SELECT productitemid, SUM(quantity) AS quantity, SUM(price) AS totalprice
    FROM order_line
    GROUP BY productitemid;

BEGIN
  OPEN retrieve;
  LOOP
    FETCH retrieve INTO item_id, quantity, totalprice;
    EXIT WHEN retrieve%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('ID: ' || item_id || ', Count: ' || quantity || ' - Total: ' || totalprice);

    IF quantity > 15 THEN
        DBMS_OUTPUT.PUT_LINE('The quantity has exceeded 15! Please, order again.');
    END IF;
  END LOOP;
  
  CLOSE retrieve;
END;

____________________________________________________________________________________________________________________________________________________________
