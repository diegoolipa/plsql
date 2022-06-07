
--CREAR UNA FUNCION
create or replace function david.prueba
return number

is
    total number:=0;
begin

    select count(*) into total from DUAL;

    return total;
end;
select prueba() from dual;

--CREAR FUNCION
create or replace function david.mayor_entre(x in number, y in number)
return number
is
begin
    if(x>y)then
        return x;
    else
        return y;
    end if;
end;

declare
    a number:=33;
    b number:=50;
begin
    --EJECUTAR FUNCION
    dbms_output.put_line( 'El mayor es: ' ||mayor_entre(a,b) );
end;

--definir funciones dentro de PLs
DECLARE
    salarioPromedio number := 0;
    --  Obtener promedio
    FUNCTION obtener_promedio
    return number
    is
        promedio number :=0;
    BEGIN
          select avg(DUMMY) into promedio from DUAL;
          return promedio;
    END;
BEGIN -- Funcion PL Principal

    salarioPromedio := obtener_promedio();
    dbms_output.put_line('El salario promedio es: ' || salarioPromedio );

END;


--PROCEDIMIENTOS
CREATE  OR REPLACE PROCEDURE DAVID.HOLA_MUNDO
AS
BEGIN
    dbms_output.put_line('HOLA MUENDO' );
end;

--ejecutar procedimiento
begin
    HOLA_MUNDO;
end;

--PROCEDIMIENTOS 02






