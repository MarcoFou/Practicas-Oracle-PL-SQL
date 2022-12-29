-- ACTUALIZAR EL REGISTRO DE SOLO UN CAMPO
update empleado set nombre = 'Marco Fouad' where id_empleado = 3; -- actualizar de la tabla "empleado" colocando: 'modificacion' solo en el registro where el campo id_empl = 3;

-- ACTUALIZAR EL REGISTRO DE VARIOS CAMPOS A LA VEZ
update empleado set nombre = 'Marco Fouad abboud', sueldo=9000 where id_empleado = 3; 

-- ACTUALIZAR EL REGISTRO DE TODO UN CAMPO A LA VEZ
update empleado set nombre = 'Marco Fouad abboud', sueldo=9000;