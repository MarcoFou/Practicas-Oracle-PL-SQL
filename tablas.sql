drop table guardias;
 drop table tareas;

 create table guardias(
  documento char(8),
  nombre varchar2(30),
  sexo char(1), /* 'f' o 'm' */
  domicilio varchar2(30),
  primary key (documento)
 );

 create table tareas(
  codigo number(2),
  domicilio varchar2(30),
  descripcion varchar2(30),
  horario char(2), /* 'AM' o 'PM'*/
  primary key (codigo)
 );

 insert into guardias values('22333444','Juan Perez','m','Colon 123');
 insert into guardias values('24333444','Alberto Torres','m','San Martin 567');
 insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235');
 insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988');
 insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111');

 insert into tareas values(1,'Colon 1111','vigilancia exterior','AM');
 insert into tareas values(2,'Urquiza 234','vigilancia exterior','PM');
 insert into tareas values(3,'Peru 345','vigilancia interior','AM');
 insert into tareas values(4,'Avellaneda 890','vigilancia interior','PM');