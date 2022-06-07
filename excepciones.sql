DECLARE

    nombre nvarchar2(100);

BEGIN

    select nombre into nombre from empleados where id = 20;

    dbms_output.put_line( nombre );


EXCEPTION

--    WHEN no_data_found THEN
--         dbms_output.put_line('No encontro empleado con ese codigo');
    WHEN others THEN
        dbms_output.put_line('Algo raro paso');
END;


---excepciones personalizadas
DECLARE
    ran number := round( dbms_random.value(1,3) );
    error_1 exception;
    error_2 exception;
    error_3 exception;
BEGIN
    CASE
        when ran = 1 then
            RAISE error_1;
        when ran = 2 then
            RAISE error_2;
        when ran =3 then
            RAISE error_3;
    END CASE;
    dbms_output.put_line('Yo nunca me ejecutare');
EXCEPTION
    WHEN error_1 THEN
        dbms_output.put_line('No manejamos el error 1');
    WHEN error_2 THEN
        dbms_output.put_line('No manejamos el error 2');
    WHEN error_3 THEN
        dbms_output.put_line('No manejamos el error 3');
END;