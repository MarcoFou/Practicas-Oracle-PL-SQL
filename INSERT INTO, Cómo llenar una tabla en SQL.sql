--CREAR TABLA MEDIANTE EL SCYPT
create table empleado(
id_empleado int not null, -- declaracion del primer campo de tipo entero y not null para que sea obligatorio llenar con un dato, no se va a poder dejar vacía
nombre varchar2(20),      -- en el campo nombre, voy a ingresar caracteres variados hasta 20. y si se colocan menos de 20 caracteres el sistema lo acorta auto
direccion varchar2(50),   
id_documento varchar2(10),
sueldo number(6,2),
fecha_de_nacimiento date
);
-- MOSTRAR TABLA CREADA
select * from empleado;

describe empleado; -- ver arquitectura de la tabla

-- INSERTAR NUEVO REGISTRO
insert into empleado values(003,'Ana' , 'Avenida principal 350' , '2548845258', 4000.00, to_date('10/03/1998','dd/mm/yyyy'));

