USE tienda;

/*
¿Cuál es el nombre de los empleados que realizaron cada venta?

*/

SELECT v.id_empleado, nombre, apellido_paterno, apellido_materno, clave 
FROM venta AS v
JOIN empleado AS e
ON e.id_empleado = v.id_empleado


/*
¿Cuál es el nombre de los artículos que se han vendido?

**/

SELECT v.clave, nombre
FROM venta AS v
JOIN articulo AS a
ON v.id_articulo = a.id_articulo
ORDER BY clave;

/*
¿Cuál es el total de cada venta?
*/

SELECT v.clave, ROUND (SUM(a.precio),2)
FROM venta AS v
JOIN articulo AS a
ON v.id_articulo = a.id_articulo
GROUP BY v.clave;