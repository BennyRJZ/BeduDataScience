#RETO 4

/*

Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.

¿Cuántos registros hay por cada uno de los puestos?
¿Cuánto dinero se paga en total por puesto?
¿Cuál es el número total de ventas por vendedor?
¿Cuál es el número total de ventas por artículo?

*/

DESCRIBE puesto;

#¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(nombre) AS total
FROM puesto
GROUP BY nombre;

#¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) AS total
FROM puesto
GROUP BY nombre;

SHOW TABLES;
DESCRIBE venta;

#¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(id_venta) as TotalVentas
FROM venta
GROUP BY id_empleado;

#¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) as TotalVentas
FROM venta
GROUP BY id_articulo;
