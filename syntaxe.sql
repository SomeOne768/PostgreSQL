
DO $$
DECLARE 
    col1 decimal(9,4) := 1;
    col2 decimal(9,4) := 100;
    col3 char(55) := '';
BEGIN
    FOR i IN 1..10 LOOP
        IF col1%2 = 0 THEN
            col3 := col1 || ' est pair';
        ELSE 
            col3 := col1 || ' est impair';
        END IF;

        INSERT INTO temp (num_col1, num_col2, char_col)
        values (col1, col2, col3);

        col1 := col1 + 1 ;
        col2 := col2 + 100;
    END LOOP;
END;
$$;

SELECT * FROM Emp ORDER BY sal DESC LIMIT 5;

DO $$
DECLARE
    empl RECORD;
    col1 smallint;
    col2 smallint;
    col3 char(55);
BEGIN
    FOR empl IN SELECT * FROM Emp ORDER BY sal DESC LIMIT 5 LOOP
        col1 := empl.sal;
        col2 := empl.empno;
        col3 := empl.ename;
        INSERT INTO temp (num_col1, num_col2, char_col)
        VALUES (col1, col2, col3);
    END LOOP;
END;
$$;
    