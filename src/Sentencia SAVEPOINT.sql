--COMMIT: Hace permanente cualquier cambio en la base de datos realizado durante la transaccion actual, también hace visible los cambios a otros usuarios
Commit; --Libera los registros y tablas bloqueadas y borra cualquier [SAVEPOINT] que hayamos hecho entre el ultimo [COMMIT o ROLLBACK]. Hasta que los cambios sean confirmados mediante la sentencia Commit vemos los cambios en las tablas que haya
        --modificado pero los demás usuarios no verán los cambios.
        
-- PUEDO Deshacer los cambios mediante la sentencia ROLLBACK
rollback; -- es el opuesto a la sentencia [COMMIT] desase todos los cambios hechos en la base de datos durante la última transaccion

-- LA SENTENCIA SAVEPOINT: Nombra y marca un punto en procesamiento de una transaccion y con la sentencia [ROLLBACK TO] pueden deshacerce parte de una transaccion en lugar de la transaccion completa
/* Todos los [SAVEPOINT] marcados luego del savepiont al que estamos haciendo el rollback seran borrados

En todas las modificaciones que se hacen en la DB existe un [SAVEPOINT] implicícito ejecutado antes, y si la modificacion falla, un [ROLLBACK] implícito al [SAVEPIONT] es realizado.*/
 
SAVEPOINT banda_sal1;

-----------------
--Bloque de codigo modificaciones 1
-----------------

SAVEPOINT banda_sal2;

-----------------
--Bloque de codigo modificaciones 2
-----------------

-- ENTONCES SI NECESITO DESHACER LAS MODIFICACIONES O LOS CREATE OR MODIFY DEL BLOQUE :

Rollback to banda_sal2;