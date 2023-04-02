
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

DO $$
DECLARE
    req RECORD;
BEGIN
    FOR req IN SELECT * FROM emp WHERE sal > 4000 AND empno != 7902 ORDER BY empno DESC LIMIT 1 LOOP
        INSERT INTO temp VALUES (NULL, req.sal, req.ename);
    END LOOP;
END;
$$;
    

CREATE OR REPLACE PROCEDURE createdept_az(num_dept smallint, dept_name TEXT, localisation TEXT) AS
$$
BEGIN
    
    IF num_dept NOT IN (SELECT deptno from dept) THEN
        INSERT INTO dept VALUES (num_dept, dept_name, localisation);
    ELSE
        RAISE EXCEPTION 'Deja dans la table %', SQLERRM;
    END IF;
END;
$$
LANGUAGE plpgsql;


DO $$
DECLARE
    jj RECORD;
BEGIN
    CREATE table SalIntervalle(
        job VARCHAR(20),
        sal_min integer,
        sal_max integer
    );

    FOR jj IN SELECT job, min(sal) as mi, max(sal) as ma FROM emp GROUP BY job LOOP
        INSERT INTO SalIntervalle VALUES ( jj.job, jj.mi, jj.ma);
    END LOOP;
END;
$$;


CREATE OR REPLACE FUNCTION salok_az(jobp TEXT, salaire integer) RETURNS integer AS
$$
DECLARE
    mini integer := (SELECT sal_min FROM SalIntervalle as S WHERE S.job = jobp);
    maxi integer := (SELECT sal_max FROM SalIntervalle as S WHERE S.job = jobp);
BEGIN
    IF salaire < mini  OR salaire > maxi THEN   
        RETURN 0;
    ELSE
        RETURN 1;
    END IF;
END;
$$
LANGUAGE plpgsql;
    