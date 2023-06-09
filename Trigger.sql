CREATE OR REPLACE TRIGGER rows_trigger
BEFORE INSERT ON product
FOR EACH ROW
DECLARE
    r_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO r_count FROM product;
    IF r_count >= 105 THEN
        RAISE_APPLICATION_ERROR(-20001, 'The table has maximum rows');
        ELSE
        DBMS_OUTPUT.PUT_LINE('Current number of rows in table: ' || r_count);
    END IF;
END;
