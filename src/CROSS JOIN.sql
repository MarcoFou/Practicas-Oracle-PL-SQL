-- CROSS JOIN: Es una consulta que muestra las combinaciones de todos los registros de las tablas que se involucran en una sentencia.
-- No se realiza una condicion de enlace. 
-- Lo que se genera es un producto cartesiano en el que el numero de filas del resultado es igual al numero de registros de la primera tabla multiplicada por el numero de registros de la 2da tabla.
-- muestra todas las combinaciones posibles, la utilidad está en filtrar con la clausula [WHERE]

select n.nombre, t.domicilio, t.descripcion
from guardias n
cross join tareas t;

-- asignacion de tareas, a las mujeres se les da la tarea de "vigilancia interior" y a los hombres "exterior"

select n.nombre, t.domicilio, t.descripcion
from guardias n
cross join tareas t
where (n.sexo = 'f' and t.descripcion = 'vigilancia interior')  -- filtrar: donde el campo "sexo" sea  = f y el campo descripcion sea = " vigilancia interior"
   or (n.sexo = 'm' and t.descripcion = 'vigilancia exterior'); -- filtrar: donde el campo "sexo" sea  = M y el campo descripcion sea = " vigilancia exterior"