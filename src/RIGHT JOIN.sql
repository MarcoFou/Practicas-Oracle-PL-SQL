--RIGHT JOIN: busca coincidencias solo en la tabla de la derecha. si no existen coincidencias devuelve NULL

select c.nombre, c.domicilio, c.ciudad, p.nombre as "nombre de ciudad"
from provincias p
right join clientes c
on c.codigoprovincia = p.codigo
where p.codigo is not null; -- no me muestres valores nulos
