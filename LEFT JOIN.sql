--LEFT JOIN: Se enfoca en buscar coincidencias solo en la tabla de la izquierda,  si no existen coincidencias devuelve NULL

select c.nombre, c.domicilio, c.ciudad, p.nombre as Provincia -- seleccioname con sus respect, prefijos los sig campos.
from provincias p
left join clientes c -- enlazame la tabla provincias con la tabla clientes tomando a clientes como tabla de la izquierda
on c.codigoprovincia = p.codigo; -- como parámetro de enlace: estos dos campos son exactamente iguales en su configuracion





























select * from provincias;
select  * from clientes;