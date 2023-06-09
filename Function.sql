Function which counts the number of records 


CREATE OR REPLACE FUNCTION count_records_function
RETURN NUMBER IS
  total NUMBER(5) := 0;
BEGIN
  SELECT COUNT(*) INTO total 
  FROM product;

  RETURN total;
END;
/




Calling function


DECLARE
  count_num NUMBER(5);
BEGIN
  count_num := count_records_function();
  DBMS_OUTPUT.PUT_LINE('The number of records in table is ' || count_num);
END;
