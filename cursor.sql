--CURSOR EN TIEMPO DE EJECUCION
DECLARE
    promedio number;
BEGIN
    FOR fila in ( select * from notas order by nombre asc ) LOOP
        promedio := ( fila.nota1 + fila.nota2 + fila.nota3 + fila.nota4 ) /4;
        dbms_output.put_line( 'Nombre: ' || fila.nombre || ', promedio: ' || promedio );
    END LOOP;
END;

--CURSOR IMPLICITO
DECLARE
BEGIN
    update empleados set actualizado = sysdate where id >500;
    dbms_output.put_line( 'Afectados: ' ||    sql%rowcount );
    IF( sql%found ) THEN
        dbms_output.put_line ( 'Encontro registros' ) ;
    ELSE
        dbms_output.put_line ( 'No encontro registros' ) ;
    END IF;
    commit;
END;
--CURSOR EXPLICITO
DECLARE
   nombre nvarchar2(200);
   salario number;
   CURSOR c_empleado is
        select nombre, salario from empleados order by nombre asc;
BEGIN
    OPEN c_empleado;
    LOOP
        FETCH c_empleado into nombre, salario;
        EXIT WHEN c_empleado%notfound;
        dbms_output.put_line( nombre || ' ' || salario );
    END LOOP;
    CLOSE c_empleado;
END;



-- TABLE BASE RECORD
DECLARE
    reg_empleado empleados%rowtype;
BEGIN
    Select * into reg_empleado from empleados where id = 5;
    dbms_output.put_line(  reg_empleado.nombre );
    dbms_output.put_line(  reg_empleado.id );
    dbms_output.put_line(  reg_empleado.salario );
    dbms_output.put_line(  reg_empleado.actualizado );
END;



--RECOD
DECLARE
    type carro is record(
          marca nvarchar2(100),
          modelo nvarchar2(100),
          puertas number
    );

    mazda carro;
    toyota carro;

BEGIN

    mazda.marca := 'Mazda';
    mazda.modelo := 'Mazda 3';
    mazda.puertas := 4;

    toyota.marca := 'Toyota';
    toyota.modelo := 'Prado';
    toyota.puertas := 5;

    dbms_output.put_line( mazda.puertas );

END;

----------------------------------------
DECLARE

    type carro is record(
          marca nvarchar2(100),
          modelo nvarchar2(100),
          puertas number
    );

    mazda carro;
    toyota carro;

    -- Procedimiento de impresion
    PROCEDURE imprimir_carro( car carro ) is
    BEGIN
          dbms_output.put_line( car.marca );
          dbms_output.put_line( car.modelo );
          dbms_output.put_line( car.puertas );
    END;
    -- Fin Procedimiento de impresion

BEGIN

    mazda.marca := 'Mazda';
    mazda.modelo := 'Mazda 3';
    mazda.puertas := 4;

    toyota.marca := 'Toyota';
    toyota.modelo := 'Prado';
    toyota.puertas := 5;

    imprimir_carro( mazda );
    imprimir_carro( toyota );

END;




---TAREA
DECLARE
    empleado empleados%rowtype;
    CURSOR c_empleados is
          select * from empleados;
    --Procedimiento de impresion de empleado
    PROCEDURE imprimir_empleado( empleado  empleados%rowtype   ) is
        salarioDiario number;
    BEGIN

        salarioDiario := empleado.salario / 30;

        dbms_output.put_line( '===========================' );
        dbms_output.put_line( 'Nombre: ' || empleado.id );
        dbms_output.put_line( 'Salario Diario: ' || round(salarioDiario,2) );
        dbms_output.put_line( 'Dias trabajados: ' || empleado.diastrabajados );
        dbms_output.put_line( 'Salario a pagar: ' || round( salarioDiario * empleado.diastrabajados, 2  ) );
        dbms_output.put_line( '===========================' );
    END;
    -- Fin de procedimiento de impresion de empleado
BEGIN
    OPEN c_empleados;
    LOOP
        FETCH c_empleados into empleado;
        EXIT WHEN c_empleados%notfound;
        imprimir_empleado( empleado );
    END LOOP;
    CLOSE c_empleados;
END;














