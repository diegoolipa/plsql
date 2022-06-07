DECLARE
    x number := 10;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(x);
        x:=x+10;
        if(x>120)then
            exit ;
        end if;
    end loop;
end;

--WHILE
declare
    y number := 20;
begin
    while y<100 loop
        DBMS_OUTPUT.PUT_LINE(y);
        y:=y+20;
    end loop;
end;


DECLARE
  -- Definimos los arreglos
   type alumnosArray is varray(5) of nvarchar2(100);
   type notasArray is varray(5) of number;
   -- Utilizar los arreglos
   alumnos alumnosArray;
   notas notasArray;
BEGIN
    alumnos := alumnosArray('Fernando','Melissa','Andrea','Antonio','Clarissa');
    notas := notasArray( 90, 100,95,89,75 );
    dbms_output.put_line(   alumnos(1)  );
    dbms_output.put_line(   notas(1)  );
  notas(1) := 95;
  dbms_output.put_line(   notas(1)  );

END;

--FOR
DECLARE
BEGIN
    << ciclo_tabla_2 >>
    FOR i in 1..10 LOOP

        --dbms_output.put_line( i || ' * 2 = ' || ( i * 2 )    );  -- 1 * 2 = 2
      dbms_output.put( i );
      dbms_output.put( ' * 2 = ' );
      dbms_output.put_line( i * 2   );
    END LOOP ciclo_tabla_2;
END;

--TAREA 01
declare
    type notasArray is varray(4) of number;
    notas    notasArray   := notasArray(95, 60, 75, 85);
    promedio number := 0;
begin
    FOR i in 1..notas.COUNT Loop
        promedio:=promedio + notas(i);
    end loop;
        dbms_output.put_line('Promedio: '||promedio/4);
end;


declare
 numero number := 4;
 factorial number;
begin
    factorial:=numero;
    for i IN  1..numero LOOP
        numero:=numero - 1;
        if (numero>1) then
            factorial :=factorial*numero;
        end if;
    end loop;
    dbms_output.put_line( 'Factoral:'||factorial);
end;


declare
    numero number := 4; -- 4x3x2x1
    factorial number;
begin
    factorial := numero;
    << while_factorial >>
    WHILE numero > 1 LOOP
        numero := numero - 1;
        factorial := factorial * numero;
    END LOOP while_factorial;
    dbms_output.put_line( factorial );
end;

