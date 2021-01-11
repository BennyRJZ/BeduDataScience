#Ejemplo2

/* Operaciones con operadores */

SELECT (1*2/10);

#Asociatividad, resolver a la izquierda.


#Promedio de una columna
SELECT AVG(precio)
FROM articulo;

#Contar columnas
SELECT COUNT('precio')
FROM articulo;

#Maximo de columna
SELECT max(precio)
from articulo;

#Minimo de columna
SELECT min(precio)
from articulo;

#Suma de columna
SELECT sum(precio)
from articulo;
