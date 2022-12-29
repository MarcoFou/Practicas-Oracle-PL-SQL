-- FULL OUTER JOIN: Busca coincidencias de ambas tablas, si no existen coincidencias devuelve Null
select i.documento, i.matricula, de.nombre as deporte, de.profesor
from inscriptos i
full outer join deportes de
on de.codigo = i.codigodeporte;