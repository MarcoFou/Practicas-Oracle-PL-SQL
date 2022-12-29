                                        -- LAS TABLAS SE INTERRELACIONAN A TRAVEZ DE LAS PRIMARY KEY Y LAS FOREING KEY
/* REGLAS:
        1) Las claves foraneos y las claves primarias deben ser del mismo tipo para poder enlazarse. Si modificamos una, debemos modificar la otra para
            que los valores se correspondan.
        2) Cuando alteramos una tabla, debemos tener cuidado con las llaves foranea. Si modificamos el tipo, la longitud o atributos de clave foranea,
            esta puede quedar inabilitada para hacer los enlaces.
            
/* EN RESUMEN: -- una Primary Key es una restriccion para un campo que identifica un registro unico e irrepetible y Una clave foranea es un campo 
(o varios) empleados para enlazar datos de dos tablas para establecer un "Join" con otra tabla en la cual ese misimo tipo de campo es la clave primaria.
*/

-- Definiendo una Primary Key:

Create table usuarios(
                      nombre varchar2(20) not null,
                      clave varchar2(10) not null,
                      primary key (nombre) 
                      );
/*
drop table usuarios;          
drop table clientes;
drop table provincias;
*/
------------------------------------------------------------------------------------------------------------------------

                                            /* EJEMPLO DE ENLACE LOGICO ENTRE TABLAS */
            
-- ESTE ENLACE SE REALIZA MEDIANTE UN [CONSTRAINT] ES DECIR UNA REGLA DE ENLACE ENTRE TABLAS POR PRIMARY KEY Y FOREIGN KEY

create table provincias(
                         codigo number(2) primary key not null, -- Defino el campo "codigo" como PK.
                         nombre varchar2(20)
                        );
                        
create table clientes ( 
                        codigo number (5),
                        nombre varchar2(30),
                        domicilio varchar2(30),
                        ciudad varchar2(20),
                        codigoprovincia number(2)
                      );

-- Procedo a crear una clave foranea para la tabla clientes para definir un enlace logico entre estas tablas

alter table clientes
add constraint fk_codigoprovincias -- Agrego esta restriccion donde:
foreign key (codigoprovincia)      -- Defino clave foranea al campo "codigo provincias" para enlazar con la tabla provincias
references provincias(codigo);      -- Referencio a la tabla provincias que contiene la llave primaria en el campo "codigo"
                      
-- INSERTS para rellenar las tablas

--INSERTS
 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values(102,'Acosta Ana','Avellaneda 333','Posadas',3);
 insert into clientes values(103,'Luisa Lopez','Juarez 555','La Plata',4);
 
 -- # RECORDAR QUE LOS CAMPOS USADOS PARA ENLAZAR LAS TABLAS SUS REGISTROS DEBEN SER EXACTAMENTE IGUALES EN DATOS Y ARQUITECTURA.
 -- # LOS REGISTROS DE FK Oracle los llama registros hijos o child.
 
 -- Por ejemplo ahora quiero borrar una de las dos tablas enlazadas
 
 select * from provincias;
 delete from provincias where codigo = 1; -- no me deja borrar xq las regla de la PK lo impide 
 
 -- PARA BORRAR UNA CLAVE FORANEA
 
 alter table clientes 
 drop constraint fk_codigoprovincias;
 
 drop table clientes;
                                                                    /* video 45. FOREIGN KEY AUTOREFERENCIADAS */
                                                                
create table clientes(
                        codigo    number (5),
                        nombre    varchar2(30),
                        domicilio varchar2(30),
                        ciudad    varchar2(20),
                        referenciadopor number(5),
                        primary key (codigo)
);

--INSERTS:
 insert into clientes values (50,'Juan Perez','Sucre 123','Cordoba',null);
 insert into clientes values(90,'Marta Juarez','Colon 345','Carlos Paz',null);
 insert into clientes values(110,'Fabian Torres','San Martin 987','Cordoba',50);
 insert into clientes values(125,'Susana Garcia','Colon 122','Carlos Paz',90);
 insert into clientes values(140,'Ana Herrero','Colon 890','Carlos Paz',9);

select * from clientes;

-- AHORA CREO UNA RESTRICCION, CREO UNA LLAVE FORANEA PARA AUTOREFERENCIARLA: enlazando la pk con el campo (referenciadopor)

alter table clientes
add constraint fk_referencia
foreign key(referenciadopor)
references clientes(codigo); -- no me deja crear la tabla xq nos e cumple la condicion de igualdad de arquitectura y datos entre los campos fk y pk

--MODIFICO EL CAMPO FK

update clientes set referenciadopor = 90 where referenciadopor = 9;

-- BORRO EL PRIMER REGISTRO DE LA TABLA

delete from clientes where codigo = 50; -- no me deja borrar xq se viola la restriccion de pk que tiene (codigo)
-- para eliminar un registro que tiene config un enlace debo tomar como parametro el campo fk
-- la restriccion de fk se aplica al campo completo no al registro por eso no me deja borrar el primer registro con valor NULL.

delete from clientes where referenciadopor = 50; -- para que si me deje eliminar el reg. debo elegir de parametro el campo fk xq fk no tiene restriccion de enlace.
                      