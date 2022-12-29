select ciudad, provincia, count(*) as Cantidad --mostrame el campo ciudad y el campo privincia, contar todos los registros que tenga la tabla Clientes,
from clientes group by ciudad, provincia -- agrupalos por ciudad y provincia
having count(*)>1; -- teniendo en cuenta la cantidad de registros que sean mayores que uno.

----------------------------------------------------------------------------------------------------------------------------------------------------------

select ciudad, count(*) as Cantidad from clientes -- mostrame la cantidad de registros que contengan la tabla clientes
where domicilio like '%San Martin%' -- en donde el domicilio sea exactamente igual a.. (ES CASE SENSITIVE)
group by ciudad having count(*) > 2 -- agrupalos por ciudad, toma la cantidad de registros mayores a 2
and ciudad <> 'Cordoba'; -- excluyendo del campo ciudad el registro "Cordoba" (ES CASE SENSITIVE)