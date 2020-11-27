/*
RETO 4.
¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
¿Cuál es el nombre del puesto de cada empleado?
*/

#REGISTRO - SELECT
#TABLA - FROM
#COLUMNA CON VARIOS RENGLONES - IN

#¿Cuál es el nombre de los empleados cuyo sueldo es mayor a $10,000?
#query1
SELECT id_puesto 
FROM puesto
WHERE salario>10000;

SELECT nombre, apellido_paterno
from empleado
WHERE id_puesto IN (SELECT id_puesto 
FROM puesto
WHERE salario>10000);

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
#Total de Ventas por empleado.
SELECT clave, id_empleado, count(*) total_ventas
FROM venta
GROUP BY clave, id_empleado;

SELECT id_empleado, min(total_ventas),max(total_ventas)
FROM (SELECT clave, id_empleado, count(*) total_ventas
FROM venta
GROUP BY clave, id_empleado) as sq
GROUP BY id_empleado;

#¿Cuál es el nombre del puesto de cada empleado?
SELECT nombre 
FROM puesto
WHERE id_puesto = e.id_puesto;