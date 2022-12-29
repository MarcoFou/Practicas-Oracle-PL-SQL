/* El servidor de Oracle controla que se cumplan las restricciones de PK pero existe una modalidad para crear FK en campos que contengan registros 
que no cumplan con los requerimientos para ser PK.

VALIDATE Y NOVALIDATE: sirve para que el servidor de Oracle haga cumplir o no las restricciones de la FK. Esto se utiliza para evitar
tener que borrar las reglas y crearlas de nuevo.

*/
--inserto las tablas a utilizar

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
------------------------------- TABLAS A USAR
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
insert into clientes values(102,'Garcia Juan','Sucre 345','Cordoba',1);
insert into clientes values(103,'Lopez Susana','Caseros 998','Posadas',3);
insert into clientes values(104,'Marcelo Moreno','Peru 876','Viedma',4);
insert into clientes values(105,'Lopez Sergio','Avellaneda 333','La Plata',5);

---------------------------------------------------------------------------------------------------

--CONSULTA DE TABLA DE REGLAS DE USUARIO 
select constraint_name, status, validated
from user_constraints
where table_name = 'CLIENTES'; --recordar que los textos adentro de [''] son Case Sensitive
--------------------------------------------------------------------------------------------------
-- VOY A CREAR UNA FK QUE ENLACE EL CAMPO CODIGO PREOVINCIAS DESDE LA TABLA PROVINCIAS.

alter table clientes
add constraint fk_codigoprovincia
foreign key(codigoprovincia)
references provincias(codigo) novalidate; -- [novalidate] le dice al servidor de oracle que no valide las restricciones de la fk

insert into clientes values(110,'Garcia Omar','San Martin 100','La Pampa',6); -- no me deja xq no cumple las reglas de fk

-- PARA PODER HACER UN INSERT DE UN REG QUE VIOLE LA REGLA DE LA FK, EJECUTAR:

alter table clientes 
disable novalidate
constraint fk_codigoprovincia;

insert into clientes values(110,'Garcia Omar','San Martin 100','La Pampa',6); -- Ahora si me deja el insert.

--para volver a hablilitar las reglas:

alter table clientes 
enable novalidate
constraint fk_codigoprovincia;




