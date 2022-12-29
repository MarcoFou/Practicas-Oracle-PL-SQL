/* Para eliminar registros de tablas en campos que tengan configuradas FK */

-- Tablas a usar 

 drop table clientes;
 drop table provincias;

 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2),
  primary key(codigo)
 );

 create table provincias(
  codigo number(2),
  nombre varchar2(20),
  primary key (codigo)
 );

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values(102,'Acosta Ana','Avellaneda 333','Posadas',3);
 
 -- CONFIGURO LA FK PARA LA TABLA PROVINCIAS campo codigoprovincias ENLAZANDOLA CON LA PK DE LA TABLA CLIENTES campo codigo
 
 alter table clientes
 add constraint fk_codigoprovincia
 foreign key (codigoprovincia)
 references provincias(codigo)
 ON DELETE SET NULL; -- le digo que si se borra un registro de la provincias automaticamente el campo fk se establezca como null.
 
 select * from provincias;
 
 delete from provincias where codigo = 3;
 
 select * from clientes;
 
 -----------------------------------------------------
 
 -- elimino la fk que cree anteriormente
 alter table clientes
 drop constraint fk_codigoprovincia;
 ------------------------------------------------------------
 
 
                                                                    -- ON DELETE CASCADE: 
 alter table clientes 
 add constraint fk_codigoprovincia 
 foreign key(codigoprovincia)
 references provincias(codigo)
 on delete cascade; -- esto hace que cuando se elimine un reg. automaticamente se elimina el registro enlazado en la llave que contiene la llave foranea, es decir en la tabla Clientes.
 
 select * from provincias;
 
 delete from provincias where codigo =2;
 
 -------------------------------------------------------------
 
 select constraint_name, table_name, constraint_type, delete_rule
 from user_constraints
 where table_name = 'CLIENTES';